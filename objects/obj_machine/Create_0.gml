machine_type = "brewer"; 
machine_level = 1;
upgrade_cost = 20;
machine_state = 0; // 0 = empty, 1 = preparing, 2 = ready
current_recipe = -1;
image_speed = 0;
image_index = 0;
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
        
		        var _time_seconds = current_recipe.prep_time_seconds / machine_level;
		        alarm[0] = _time_seconds * 60;
        
		        // NOVO: Liga o fogão (Frame 1)
		        image_index = 1; 
        
		        show_debug_message("Preparing: " + current_recipe.name);
		    }
			else {
                show_debug_message("This machine cannot use " + _player.item_held);
            }
        }
		else {
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
            
            image_index = 0; 
            
            machine_state = 0;
            current_recipe = -1;
        } else {
            show_debug_message("Hands full!");
        }
    }
}

upgrade = function() {
    // Se a máquina não estiver a preparar nada, permite o upgrade
    if (machine_state == 0) {
        if (global.essence >= upgrade_cost) {
            
            // Subtrai o dinheiro e sobe o nível
            global.essence -= upgrade_cost;
            machine_level += 1;
            
            // Aumenta o custo para o próximo nível (Fica o dobro do preço)
            upgrade_cost = upgrade_cost * 2;
            
            show_debug_message("SUCCESS! Machine upgraded to Level " + string(machine_level));
            show_debug_message("Essence left: " + string(global.essence));
            
        } 
		else {
            show_debug_message("Not enough Essence! You need " + string(upgrade_cost));
        }
    }
	else {
        show_debug_message("Cannot upgrade while machine is running!");
    }
}