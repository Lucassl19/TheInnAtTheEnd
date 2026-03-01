var _key_right = keyboard_check(ord("D"));
var _key_left  = keyboard_check(ord("A"));
var _key_down  = keyboard_check(ord("S"));
var _key_up    = keyboard_check(ord("W"));

var _dir_x = _key_right - _key_left;
var _dir_y = _key_down - _key_up;
depth = -y;
if (can_move) {
	x_speed = _dir_x * move_speed;
	y_speed = _dir_y * move_speed;

	//COLISÃO E MOVIMENTAÇÃO
	//Horizontal
	if (place_meeting(x + x_speed, y, obj_wall)) {
	    while (!place_meeting(x + sign(x_speed), y, obj_wall)) {
	        x += sign(x_speed);
	    }
	    x_speed = 0;
	}
	x += x_speed;
	//Vertical
	if (place_meeting(x, y + y_speed, obj_wall)) {
	    while (!place_meeting(x, y + sign(y_speed), obj_wall)) {
	        y += sign(y_speed);
	    }
	    y_speed = 0;
	}
	y += y_speed;

	//DIRAÇÃO
	if (_dir_x != 0 || _dir_y != 0) {
	    face_x = _dir_x;
	    face_y = _dir_y;
	}
}
// INTERAÇÃO
var _key_interact = keyboard_check_pressed(ord("E"));
if (_key_interact) {
	// Calcula o ponto exato na frente do jogador
	var _target_x = x + (face_x * interact_distance);
	var _target_y = y + (face_y * interact_distance);
    
	// Procura por QUALQUER objeto que seja "filho" do obj_interactable naquele ponto
	var _target = collision_circle(_target_x, _target_y, 12, obj_interactable, false, true);
    
	// Se encontrou algo, aciona a função interna daquele objeto!
	if (_target != noone) {
	    _target.interact(); 
	}
}

//UPGRADES
var _key_upgrade = keyboard_check_pressed(ord("F"));

if (_key_upgrade) {
	var _target_x = x + (face_x * interact_distance);
	var _target_y = y + (face_y * interact_distance);
    
	// Procura o objeto na frente
	var _target = collision_circle(_target_x, _target_y, 12, obj_interactable, false, true);
    
	if (_target != noone) {
	    // Verifica se esse objeto tem a função 'upgrade' antes de tentar chamá-la
	    if (variable_instance_exists(_target, "upgrade")) {
	        _target.upgrade(); 
	    } else {
	        show_debug_message("This object cannot be upgraded.");
	    }
	}
}

//ANIMAÇÃO
var _is_moving = (_dir_x != 0 || _dir_y != 0);

if (_dir_x != 0) {
	facing_dir = -(sign(_dir_x)); 
}

if (_is_moving) {
	// WALKING STATE
	anim_frame += 0.2; // Walk animation speed
    
	// Loop the walk animation
	if (anim_frame > walk_end + 1 || anim_frame < walk_start) {
	    anim_frame = walk_start;
	}
} else {
	// IDLE STATE
	anim_frame += 0.1;
    
	if (anim_frame > idle_end + 1 || anim_frame < idle_start) {
	    anim_frame = idle_start;
	}
}