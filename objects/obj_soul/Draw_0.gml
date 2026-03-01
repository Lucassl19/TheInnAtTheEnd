var _wave = sin(current_time / 500);
var _pulsing_alpha = 0.5 + (_wave * 0.2);

shader_set(sh_ghost_glow);

    var _uni_alpha = shader_get_uniform(sh_ghost_glow, "f_GlowAlpha");
    shader_set_uniform_f(_uni_alpha, _pulsing_alpha);

    var _final_frame = floor(anim_frame);
    for (var i = 0; i < array_length(equipped_layers); i++) {
        var _spr = equipped_layers[i];
        if (_spr != -1) {
            draw_sprite_ext(_spr, _final_frame, x, y, facing_dir, 1, 0, c_white, 1);
        }
    }

shader_reset();


// (Almas ainda projetam sombra no Limbo!)
draw_set_alpha(0.1);
draw_ellipse_color(x - 10, y - 4, x + 10, y + 4, c_black, c_black, false);
draw_set_alpha(1.0);