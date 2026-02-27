// 1. Desenha a geladeira normalmente
draw_self();

// 2. Se o menu estiver aberto, desenha a UI
if (menu_open) {
    // Posição do menu (um pouco acima e à direita da geladeira)
    var _box_x = x + 24;
    var _box_y = y - 48;
    var _spacing = 16; // Espaço entre as linhas de texto
    var _padding = 8;
    var _list_size = array_length(ingredients_list);
    
    // Fundo da UI (Caixa preta com transparência)
    draw_set_alpha(0.8);
    draw_set_color(c_black);
    draw_rectangle(_box_x, _box_y, _box_x + 130, _box_y + (_list_size * _spacing) + (_padding * 2), false);
    draw_set_alpha(1.0);
    
    // Alinhamento do texto
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Desenha cada item da lista
    for (var i = 0; i < _list_size; i++) {
        var _text_y = _box_y + _padding + (i * _spacing);
        var _item_name = ingredients_list[i];
        
        // Se for o item selecionado, desenha amarelo e com a setinha
        if (i == menu_index) {
            draw_set_color(c_yellow);
            draw_text(_box_x + _padding, _text_y, "> " + _item_name);
        } else {
            // Se não, desenha branco normal
            draw_set_color(c_white);
            draw_text(_box_x + _padding + 12, _text_y, _item_name);
        }
    }
}