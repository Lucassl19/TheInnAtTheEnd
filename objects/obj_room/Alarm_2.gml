if (room_state == 4) {
    
    room_state = 5; // Estado 5 = Retornou do julgamento e quer o último pedido
    image_blend = c_purple;
    
    // Sorteia o resultado do julgamento (50% de chance para cada)
    var _result = choose("good", "bad");
    
    // Salva o resultado temporariamente na variável do hóspede
    guest_data.judgment_result = _result;
    
    show_debug_message("FLASH! " + guest_data.name + " returned from Judgment!");
    
    if (_result == "good") {
        show_debug_message("Result: GOOD! Wants: " + guest_data.post_good_request);
    } else {
        show_debug_message("Result: BAD! Wants: " + guest_data.post_bad_request);
    }
}