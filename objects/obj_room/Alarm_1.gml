if (room_state == 3) {
    
    room_state = 4; // Estado 4 = Em Julgamento
    image_blend = c_dkgray;
    
    // Opcional: Adicionar um áudio de sino de igreja/gongo aqui futuramente!
    show_debug_message("BONG! " + guest_data.name + " was called to Judgment.");
    
    // Inicia o timer de quanto tempo o julgamento vai demorar
    var _judgment_time = irandom_range(5, 10);
    alarm[2] = _judgment_time * 60;
}