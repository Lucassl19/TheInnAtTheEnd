soul_data = -1;
move_speed = 2;

var _total = array_length(global.souls_list);
if (_total > 0) {
    soul_data = global.souls_list[irandom(_total - 1)];
}