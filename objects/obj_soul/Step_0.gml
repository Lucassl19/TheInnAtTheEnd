var _my_index = -1;
var _queue = obj_reception_desk.waiting_queue;

for (var i = 0; i < array_length(_queue); i++) {
    if (_queue[i] == id) {
        _my_index = i;
        break;
    }
}

var _is_moving = false; 

// Lógica de Movimento da Fila
if (_my_index != -1) {
    var _target_x = obj_reception_desk.x;
    var _target_y = obj_reception_desk.y + 32 + (_my_index * obj_reception_desk.queue_spacing);
    
    // Se a alma ainda está longe do seu lugar na fila, ela deve andar
    if (point_distance(x, y, _target_x, _target_y) > move_speed) {
        var _dir = point_direction(x, y, _target_x, _target_y);
        x += lengthdir_x(move_speed, _dir);
        y += lengthdir_y(move_speed, _dir);
        
        _is_moving = true; // Avisa o sistema de animação que ela está andando!
        
        // isso aqui atualiza para onde elas estão olhando:
        var _move_x = lengthdir_x(move_speed, _dir);
        if (_move_x != 0) {
            facing_dir = sign(_move_x); 
        }
        
    } else {
        // Chegou no lugar exato, gruda na posição e para
        x = _target_x;
        y = _target_y;
        _is_moving = false; 
    }
}

// --- CONTROLE DOS FRAMES DE ANIMAÇÃO ---
if (_is_moving) {
    // ESTADO: ANDANDO
    anim_frame += 0.2;
    
    // Loop da caminhada
    if (anim_frame > walk_end + 1 || anim_frame < walk_start) {
        anim_frame = walk_start;
    }
} else {
    // ESTADO: PARADO (IDLE)
    anim_frame += 0.1;
    
    // Loop do parado
    if (anim_frame > idle_end + 1 || anim_frame < idle_start) {
        anim_frame = idle_start;
    }
}