// Inherit the parent event
event_inherited();

// 2. Efeito visual de pulsação
if (machine_state == 1) {
    // current_time é um relógio do GameMaker que roda milissegundos sem parar.
    // Dividimos por 150 para controlar a velocidade (números maiores = mais lento).
    var _wave = sin(current_time / 150); 
    
    // Multiplicamos por 0.05 para alterar apenas 5% do tamanho original.
    // Usar '+' no X e '-' no Y cria o efeito clássico de "esmagar e esticar".
    image_xscale = 1 + (_wave * 0.05);
    image_yscale = 1 - (_wave * 0.05); 
    
} else {
    // Quando a máquina termina ou está parada, reseta o tamanho para o original (100%)
    image_xscale = 1;
    image_yscale = 1;
}

