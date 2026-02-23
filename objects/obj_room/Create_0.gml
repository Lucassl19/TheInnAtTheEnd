is_occupied = false;
room_state = 0; // 0 = empty, 1 = pre-judgment, 2 = judgment, 3 = post-judgment

// Guest data (will hold the struct from your JSON later)
guest_data = -1; 
guest_sprite = -1;

// Timers
judgment_timer = 0;