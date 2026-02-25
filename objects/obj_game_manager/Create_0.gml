global.souls_list = [];
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