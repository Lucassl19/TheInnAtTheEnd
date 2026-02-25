is_occupied = false;
room_state = 0; // 0 = empty, 1 = pre-judgment, 2 = judgment, 3 = post-judgment

guest_data = -1; 
guest_sprite = -1;

// Timers
judgment_timer = 0;

interact = function() {
    if (is_occupied) {
        show_debug_message("This is " + guest_data.name + "'s room.");
        show_debug_message("They want: " + guest_data.pre_request);
        // Futuramente, aqui entrará o código: "Se o jogador tem o item na mão, entregue!"
    } else {
        show_debug_message("This room is empty.");
    }
}