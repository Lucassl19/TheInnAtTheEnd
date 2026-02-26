is_occupied = false;
room_state = 0; // 0 = empty, 1 = pre-judgment, 2 = judgment, 3 = post-judgment

guest_data = -1; 
guest_sprite = -1;

// Timers
judgment_timer = 0;

guest_anim_frame = 0;

interact = function() {
    var _player = obj_player;
    
    if (is_occupied) {
        
        // ESTADO 1: Descansando (Ainda não pediu nada)
        if (room_state == 1) {
            show_debug_message(guest_data.name + " is resting. No requests yet.");
        }
        
        // ESTADO 2: Fez o pedido Pré-Julgamento
        else if (room_state == 2) {
            
            // Verifica se o jogador tem o item exato
            if (_player.item_held == guest_data.pre_request) {
                
                show_debug_message("SUCCESS! Delivered " + guest_data.pre_request + " to " + guest_data.name);
                
                // Limpa a mão do jogador
                _player.item_held = "none";
                
                // Vai para o Estado 3 (Aguardando o Sino)
                room_state = 3; 
                image_blend = c_fuchsia; // Fica azul para indicar que está satisfeito e aguardando
                
                // Inicia o timer para o chamado do Julgamento
                var _wait_time = irandom_range(3, 6);
                alarm[1] = _wait_time * 60;
                
            } else {
                show_debug_message(guest_data.name + " is waiting for: " + guest_data.pre_request);
            }
        }
        
        // ESTADO 3: Aguardando o Sino (Não faz nada se interagir)
        else if (room_state == 3) {
            show_debug_message(guest_data.name + " is satisfied and waiting for Judgment.");
        }  
		
		// ESTADO 5: Retornou do Julgamento e quer o último pedido
		else if (room_state == 5) {
            
            // Descobre qual é o pedido final baseado no resultado do julgamento
            var _required_item = "";
            if (guest_data.judgment_result == "good") {
                _required_item = guest_data.post_good_request;
            } else {
                _required_item = guest_data.post_bad_request;
            }
            
            // Verifica se o jogador está segurando o item certo
            if (_player.item_held == _required_item) {
                
                // Entrega feita! A alma parte para o além.
                show_debug_message("CHECK-OUT! " + guest_data.name + " has found peace.");
                
                // Limpa a mão do jogador
                _player.item_held = "none";
                
                // Recompensa o jogador com Essência (Dinheiro)
                global.essence += 10;
                show_debug_message("Earned 10 Essence! Total: " + string(global.essence));
                
                // O grande Reset: Prepara o quarto para o próximo hóspede
                is_occupied = false;
                room_state = 0;
                guest_data = -1;
                image_blend = c_white; // Volta à cor original de quarto vazio
                
            } else {
                // Feedback caso o jogador chegue com a mão vazia ou com a receita errada
                show_debug_message(guest_data.name + " needs " + _required_item + " to move on.");
            }
        }
    } else {
        show_debug_message("This room is empty.");
    }
}