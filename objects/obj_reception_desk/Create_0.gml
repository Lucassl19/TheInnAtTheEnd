current_soul = -1;
waiting_queue = [];
queue_spacing = 40;

if (array_length(global.souls_list) > 0) {
    var _random_index = irandom(array_length(global.souls_list) - 1);
    current_soul = global.souls_list[_random_index];
}

interact = function() {
	show_debug_message("interagindo");
    if (array_length(waiting_queue) > 0) {
        
        var _first_soul = waiting_queue[0];
        var _empty_room = noone;
        
        with (obj_room) {
            if (!is_occupied) {
                _empty_room = id;
                break; 
            }
        }
             
        if (_empty_room != noone) {
            _empty_room.is_occupied = true;
            _empty_room.room_state = 1; 
            _empty_room.image_blend = c_orange; 
            _empty_room.guest_data = _first_soul.soul_data;                        
			
			var _random_seconds = irandom_range(2, 5);
			_empty_room.alarm[0] = _random_seconds * 60;
			
			show_debug_message("Check-in: " + _first_soul.soul_data.name);
            
            array_shift(waiting_queue);
            instance_destroy(_first_soul);
            
        } else {
            show_debug_message("All rooms are full!");
        }
    } else {
        show_debug_message("Nobody is waiting.");
    }
}