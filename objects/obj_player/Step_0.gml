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


// INTERAÇÃO
var _key_interact = keyboard_check_pressed(ord("E"));

if (_key_interact) {
    // Encontra o quarto amarelo mais próximo do jogador
    var _nearest_room = instance_nearest(x, y, obj_room);
    
    if (_nearest_room != noone && distance_to_object(_nearest_room) < 15) {
        
        // Se o quarto estiver vazio, faz o check-in!
        if (_nearest_room.is_occupied == false) {
            _nearest_room.is_occupied = true;
            _nearest_room.image_blend = c_red; // Muda a cor do quadrado para vermelho para você ver que funcionou!
            
            show_debug_message("Check-in feito no quarto!");
        } else {
            show_debug_message("Este quarto já está ocupado.");
        }
    }
}