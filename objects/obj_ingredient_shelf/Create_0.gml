// The interaction logic
interact = function() {
    var _player = obj_player;
    
    // Check if player's hands are empty
    if (_player.item_held == "none") {
        
        // Give the ingredient to the player
        _player.item_held = provided_ingredient;
        show_debug_message("You picked up: " + provided_ingredient);
        
        // Dica visual rápida: você pode mudar a cor do player ou tocar um som aqui
        
    } else if (_player.item_held == provided_ingredient) {
        show_debug_message("You are already holding this!");
    } else {
        show_debug_message("Your hands are full with: " + string(_player.item_held));
    }
}