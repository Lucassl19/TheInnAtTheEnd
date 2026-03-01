draw_self();

if (is_occupied && guest_data != -1) {
    
    var _final_frame = floor(guest_anim_frame);
    var _layers = guest_data.equipped_layers;
    
    var _draw_x = x;
    var _draw_y = y - 16; 
    
    // --- LIGA O EFEITO FANTASMA ---
    var _wave = sin(current_time / 400); 
    var _pulsing_alpha = 0.5 + (_wave * 0.2); 
    
    shader_set(sh_ghost_glow);
    var _uni_alpha = shader_get_uniform(sh_ghost_glow, "f_GlowAlpha");
    shader_set_uniform_f(_uni_alpha, _pulsing_alpha);
    
    for (var i = 0; i < array_length(_layers); i++) {
        var _spr = _layers[i];
        
        if (_spr != -1) {
            draw_sprite_ext(
                _spr, _final_frame, _draw_x, _draw_y, guest_facing_dir, 1, 0, c_white, 1
            );
        }
    }
    
    shader_reset();
    
    draw_set_alpha(0.1);
    draw_ellipse_color(_draw_x - 10, _draw_y - 4, _draw_x + 10, _draw_y + 4, c_black, c_black, false);
    draw_set_alpha(1.0);
}