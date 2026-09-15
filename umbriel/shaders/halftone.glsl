// halftone.glsl
vec4 animation(vec2 uv) {
    vec4 color = umbriel_sample(uv);

    float cellSize = 35.0;
    float p = umbriel_clamped_progress * (1.0 + cellSize * 0.015);

    vec2 center_offset = umbriel_direction > 0.0 ? vec2(0.5, 0.5) : vec2(0.0, 0.5);
    vec2 coords = (uv - center_offset) * umbriel_size / umbriel_size.x;
    coords *= cellSize;
    coords.x += ceil(coords.y) * 0.5;

    vec2 cell = floor(-coords);
    coords = fract(coords);
    float offset = cell.y;
    float d = distance(coords, vec2(0.5));

    float r = (umbriel_direction > 0.0 ? p : 1.0 - p) + offset / cellSize;
    if (r < 0.25) {
        r = 0.0;
    }
    d = smoothstep(r - 0.01, r + 0.01, d);

    return mix(color, vec4(0.0), d);
}
