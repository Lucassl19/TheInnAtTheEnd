global.souls_list = [];

// Check if the file exists to prevent crashes
show_debug_message("iniciando");
if (file_exists("souls.json")) {
    
    // Load file into a buffer
    var _buffer = buffer_load("souls.json");
    
    // Read the buffer as a string
    var _json_string = buffer_read(_buffer, buffer_string);
    
    // Delete buffer to free memory
    buffer_delete(_buffer);
    
    // Parse the JSON string into GameMaker Structs/Arrays
    global.souls_list = json_parse(_json_string);
    
    show_debug_message("Souls loaded! Total: " + string(array_length(global.souls_list)));
    
} else {
    show_debug_message("ERROR: souls.json not found!");
}