if (menu_open) {
    var _up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
    var _down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
    var _confirm = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space);
    var _cancel = keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(vk_escape);
    
    var _list_size = array_length(ingredients_list);
    
    if (_up) {
        menu_index -= 1;
        if (menu_index < 0) menu_index = _list_size - 1;
    }
    
    if (_down) {
        menu_index += 1;
        if (menu_index >= _list_size) menu_index = 0; 
    }
    
    if (_confirm) {
        var _selected_item = ingredients_list[menu_index];
        obj_player.item_held = _selected_item;
        
        show_debug_message("Você pegou: " + _selected_item);
        
        menu_open = false;
        obj_player.can_move = true;
        image_index = 0;
    }
    
    if (_cancel) {
        menu_open = false;
        obj_player.can_move = true;
        image_index = 0;
    }
}