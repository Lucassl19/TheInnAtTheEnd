global.souls_list = [];
global.essence = 50;
global.guest_pools = {};
global.recipes_list = [];
spawn_rate = 180;
alarm[0] = spawn_rate;
max_in_queue = 4;
randomise();

show_debug_message("iniciando");



if (file_exists("pools.json")) {
    var _buffer = buffer_load("pools.json");
    var _json_string = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);
    
    global.guest_pools = json_parse(_json_string);
    show_debug_message("Procedural pools loaded successfully!");
} else {
    show_debug_message("ERROR: pools.json not found!");
}

if (file_exists("recipes.json")) {
    var _buffer_recipes = buffer_load("recipes.json");
    var _json_string_recipes = buffer_read(_buffer_recipes, buffer_string);
    buffer_delete(_buffer_recipes);
    
    global.recipes_list = json_parse(_json_string_recipes);
    show_debug_message("Recipes loaded! Total: " + string(array_length(global.recipes_list)));
} else {
    show_debug_message("ERROR: recipes.json not found!");
}