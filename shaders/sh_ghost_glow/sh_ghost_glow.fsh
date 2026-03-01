// --- GHOST GLOW SHADER (Fragment) ---
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float f_GlowAlpha; 

void main()
{
    vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    if (base_col.a == 0.0) {
        gl_FragColor = base_col;
        return;
    }

    vec3 spectral_color = vec3(0.1, 0.8, 1.0);
    
    vec3 final_rgb = mix(base_col.rgb, spectral_color, 0.6);
    
    float final_alpha = base_col.a * f_GlowAlpha;
    
    gl_FragColor = vec4(final_rgb, final_alpha);
}