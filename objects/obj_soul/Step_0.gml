var _my_index = -1;
var _queue = obj_reception_desk.waiting_queue;

for (var i = 0; i < array_length(_queue); i++) {
    if (_queue[i] == id) {
        _my_index = i;
        break;
    }
}

if (_my_index != -1) {
    var _target_x = obj_reception_desk.x;
    var _target_y = obj_reception_desk.y + 32 + (_my_index * obj_reception_desk.queue_spacing);
    
    if (point_distance(x, y, _target_x, _target_y) > move_speed) {
        var _dir = point_direction(x, y, _target_x, _target_y);
        x += lengthdir_x(move_speed, _dir);
        y += lengthdir_y(move_speed, _dir);
    } else {
        x = _target_x;
        y = _target_y;
    }
}