// Default machine type (Change this in the Room Editor Variables!)
machine_type = "brewer"; 

// State variables
machine_state = 0; // 0 = empty, 1 = preparing, 2 = ready
current_recipe = -1;
interact = function() {
    var _player = obj_player;
    
    // STATE 0: VAZIA - Recebendo o ingrediente
    if (machine_state == 0) {
        
        if (_player.item_held != "none") {
            var _found_recipe = -1;
            
            for (var i = 0; i < array_length(global.recipes_list); i++) {
                var _recipe = global.recipes_list[i];
                
                if (_recipe.ingredient == _player.item_held && _recipe.machine == machine_type) {
                    _found_recipe = _recipe;
                    break;
                }
            }
            
            if (_found_recipe != -1) {
                machine_state = 1;
                current_recipe = _found_recipe;
                
                _player.item_held = "none";
                              
                alarm[0] = current_recipe.prep_time_seconds * 60;
                
                show_debug_message("Preparing: " + current_recipe.name);
                image_blend = c_yellow;
                
            } else {
                show_debug_message("This machine cannot use " + _player.item_held);
            }
        } else {
            show_debug_message("You need an ingredient to use this machine.");
        }
    }
    
    // STATE 1: PREPARANDO
    else if (machine_state == 1) {
        show_debug_message("Machine is busy: " + current_recipe.name);
    }
    
    // STATE 2: PRONTO PARA COLETAR
    else if (machine_state == 2) {
        if (_player.item_held == "none") {
            _player.item_held = current_recipe.id;
            show_debug_message("Collected: " + current_recipe.name);
            
            machine_state = 0;
            current_recipe = -1;
            image_blend = c_white;
        } else {
            show_debug_message("Your hands are full!");
        }
    }
}