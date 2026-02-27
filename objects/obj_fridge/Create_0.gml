menu_open = false;
menu_index = 0;
image_speed = 0;
image_index = 0;

// Lista de todos os ingredientes que existem no jogo
ingredients_list = [
    "moon_flower", 
    "abyss_beans", 
    "eden_apple", 
    "fresh_water"
];

interact = function() {
    var _player = obj_player;
    
    if (!menu_open) {
        if (_player.item_held == "none") {
            menu_open = true;
            menu_index = 0;
            _player.can_move = false;
            
            image_index = 1;
        } else {
            show_debug_message("Suas mãos já estão cheias!");
        }
    }
}