move_speed = 2;
soul_data = {}; 

var _pick_random = function(_array) {
    if (!is_array(_array) || array_length(_array) == 0) return "none";
    var _index = irandom(array_length(_array) - 1);
    return _array[_index];
};

var _pool = global.guest_pools;

var _body_type = choose("male", "female");
var _loadout_pool = -1;

if (_body_type == "male") {
    soul_data.name = _pick_random(_pool.names_male);
    _loadout_pool = _pool.male_loadout;
} else {
    soul_data.name = _pick_random(_pool.names_female);
    _loadout_pool = _pool.female_loadout;
}

soul_data.profession = _pick_random(_pool.professions);
soul_data.pre_request = _pick_random(_pool.pre_requests);
soul_data.post_good_request = _pick_random(_pool.post_good_requests);
soul_data.post_bad_request = _pick_random(_pool.post_bad_requests);
soul_data.arrival_dialogue = _pick_random(_pool.arrival_dialogues);

var _skin = _pick_random(_loadout_pool.layer_skin);
var _underwear = _pick_random(_loadout_pool.layer_underwear);
var _feet = _pick_random(_loadout_pool.layer_feet);
var _legs = _pick_random(_loadout_pool.layer_legs);
var _torso = _pick_random(_loadout_pool.layer_torso);
var _hair = _pick_random(_loadout_pool.layer_hair);

soul_data.loadout = [_skin, _underwear, _feet, _legs, _torso, _hair];

equipped_layers = [];
for (var i = 0; i < array_length(soul_data.loadout); i++) {
    var _sprite_name = soul_data.loadout[i];
    if (_sprite_name == "none" || _sprite_name == "") {
        equipped_layers[i] = -1;
    } else {
        equipped_layers[i] = asset_get_index(_sprite_name);
    }
}
soul_data.equipped_layers = equipped_layers;

anim_frame = 0;
facing_dir = 1;
idle_start = 0;
idle_end = 4;
walk_start = 5;
walk_end = 12;

show_debug_message("Spawned: " + soul_data.name + " (" + _body_type + ")");