// Venetian blinds for window movement had fun cooking this thing probably looks better on high refresh monitors.
// The window splits into horizontal strips that each slide slightly
// out of phase, like blinds catching a breeze, then settle flush.
// The overall shift direction follows the transition's direction.
vec4 animation(vec2 uv) {
    float p = umbriel_clamped_progress;
    float pulse = 10.0 * p * p * (1.0 - p) * (1.0 - p);
    float stripes = 10.0;
    float stripeIndex = floor(uv.y * stripes);
    float phase = stripeIndex / stripes;
    float dir = float(umbriel_direction);
    float shift = sin(phase * 6.28318 + p * 3.14159) * 0.02 * pulse * dir;
    return umbriel_sample(vec2(uv.x + shift, uv.y));
}
