// Liquid open/close, v2: fractal noise surface + per-window variation
// (seeded from umbriel_size, since that's the only input that differs
// between windows) + small droplets breaking off near the waterline.
// Still fully deterministic given the same window size and progress —
// there is no true per-event randomness available to shaders.

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
}

float fbm(vec2 p) {
    float sum = 0.0;
    float amp = 0.5;
    for (int i = 0; i < 4; i++) {
        sum += noise(p) * amp;
        p *= 2.0;
        amp *= 0.5;
    }
    return sum;
}

vec4 animation(vec2 uv) {
    float amount = umbriel_direction > 0.0 ? umbriel_clamped_progress : 1.0 - umbriel_clamped_progress;

    // Seed per-window: hash the window's size so different windows get
    // a different-looking (but each internally consistent) surface.
    float seed = hash(umbriel_size) * 20.0;

    float surface = mix(1.15, -0.2, amount);

    // Layered noise instead of pure sine — reads as irregular/organic
    // rather than a repeating wave.
    float n = fbm(vec2(uv.x * 6.0 + seed, amount * 4.0)) - 0.5;
    float surfaceLine = surface + n * 0.06;

    float distToSurface = uv.y - surfaceLine;
    float nearSurface = exp(-10.0 * abs(distToSurface));
    float swayNoise = fbm(vec2(uv.x * 10.0 + seed, uv.y * 6.0 + amount * 6.0)) - 0.5;
    float sway = swayNoise * 0.035 * nearSurface;

    vec2 distortedUV = vec2(uv.x + sway, uv.y);
    vec4 color = umbriel_sample(distortedUV);

    float mask = smoothstep(surfaceLine - 0.012, surfaceLine + 0.012, uv.y);

    // Droplets: small blobs just above the surface line, only visible
    // mid-transition (fade out at the very start/end so endpoints stay
    // clean), positioned by the same size-seeded hash so they differ
    // per window but stay stable per frame.
    float dropletBand = smoothstep(0.0, 0.08, distToSurface) * smoothstep(0.18, 0.08, distToSurface);
    float dropletMask = step(0.93, hash(floor(vec2(uv.x * 24.0, amount * 10.0)) + seed));
    float dropletVisibility = smoothstep(0.0, 0.15, amount) * smoothstep(1.0, 0.85, amount);
    mask = max(mask, dropletBand * dropletMask * dropletVisibility);

    color.a *= mask;
    color.rgb *= mask;

    return color;
}
