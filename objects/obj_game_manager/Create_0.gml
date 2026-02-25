global.souls_list = [];
global.essence = 50;
spawn_rate = 180;
alarm[0] = spawn_rate;
max_in_queue = 4;

show_debug_message("iniciando");
if (file_exists("souls.json")) {
    
    var _buffer = buffer_load("souls.json");
    
    var _json_string = buffer_read(_buffer, buffer_string);
    
    buffer_delete(_buffer);
    
    global.souls_list = json_parse(_json_string);
    
    show_debug_message("Souls loaded! Total: " + string(array_length(global.souls_list)));
    
} else {
    show_debug_message("ERROR: souls.json not found!");
}

global.recipes_list = [];

if (file_exists("recipes.json")) {
    var _buffer_recipes = buffer_load("recipes.json");
    var _json_string_recipes = buffer_read(_buffer_recipes, buffer_string);
    buffer_delete(_buffer_recipes);
    
    global.recipes_list = json_parse(_json_string_recipes);
    show_debug_message("Recipes loaded! Total: " + string(array_length(global.recipes_list)));
} else {
    show_debug_message("ERROR: recipes.json not found!");
}