if (room_state == 1) {
    room_state = 2; // Move para o estado de "Fez o pedido"
    image_blend = c_red;
    
    show_debug_message("DING! " + guest_data.name + " wants: " + guest_data.pre_request);
    
    // (Futuramente, aqui criar o balãozinho de pedido em cima do quarto)
}