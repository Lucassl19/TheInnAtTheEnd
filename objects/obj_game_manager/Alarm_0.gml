alarm[0] = spawn_rate;

if (instance_exists(obj_reception_desk)) {
    // Only spawn if the line isn't full
    if (array_length(obj_reception_desk.waiting_queue) < max_in_queue) {
        
        // Define where they appear (e.g., at the bottom of the screen)
        var _spawn_x = obj_reception_desk.x;
        var _spawn_y = obj_reception_desk.y + 250; 
        
        // Create the soul and push its ID to the end of the queue array
        var _new_soul = instance_create_layer(_spawn_x, _spawn_y, "Instances", obj_soul);
        array_push(obj_reception_desk.waiting_queue, _new_soul);
        
    }
}