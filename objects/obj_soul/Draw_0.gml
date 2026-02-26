// Pega o frame exato da animação (arredondando para baixo)
var _final_frame = floor(anim_frame);

// Opcional: Desenha uma sombrinha simples debaixo do personagem 
// (ajuda muito a dar a sensação de profundidade no Top-Down!)
draw_set_alpha(0.3);
draw_ellipse_color(x - 10, y - 4, x + 10, y + 4, c_black, c_black, false);
draw_set_alpha(1.0);

for (var i = 0; i < array_length(equipped_layers); i++) {
    
    var _current_sprite = equipped_layers[i];
    
    if (_current_sprite != -1) {
        
        draw_sprite_ext(
            _current_sprite, 
            _final_frame, 
            x, 
            y, 
            facing_dir, 
            1,          
            0,         
            c_white,  
            1        
        );
    }
}