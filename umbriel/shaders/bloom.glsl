// bloom.glsl
// upon Gohma's request.

vec4 animation(vec2 uv) {

    float visible = umbriel_direction > 0.0
        ? umbriel_clamped_progress : 1.0 - umbriel_clamped_progress;
    float p = smoothstep(0.0, 1.0, visible);

    float scale = mix(0.01, 1.0, p);
    vec2 scaled_uv = (uv - 0.5) / scale + 0.5;

    return umbriel_sample(scaled_uv);
}
