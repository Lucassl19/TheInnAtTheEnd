var _key_right = keyboard_check(ord("D"));
var _key_left  = keyboard_check(ord("A"));
var _key_down  = keyboard_check(ord("S"));
var _key_up    = keyboard_check(ord("W"));

var _dir_x = _key_right - _key_left;
var _dir_y = _key_down - _key_up;

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

// INTERAÇÃO
var _key_interact = keyboard_check_pressed(ord("E"));

if (_key_interact) {
    // Calcula o ponto exato na frente do jogador
    var _target_x = x + (face_x * interact_distance);
    var _target_y = y + (face_y * interact_distance);
    
    // Procura por QUALQUER objeto que seja "filho" do obj_interactable naquele ponto
    var _target = collision_point(_target_x, _target_y, obj_interactable, false, true);
    
    // Se encontrou algo, aciona a função interna daquele objeto!
    if (_target != noone) {
        _target.interact(); 
    }
}