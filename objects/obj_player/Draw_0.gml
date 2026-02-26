var _final_frame = floor(anim_frame);

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