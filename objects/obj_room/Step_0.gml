if (is_occupied) {
    guest_anim_frame += 0.1; 
    
    if (guest_anim_frame > 5 || guest_anim_frame < 0) {
        guest_anim_frame = 0;
    }
}