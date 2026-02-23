var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));


if (h != 0 || v != 0) {

    // Normalização
    var len = point_distance(0, 0, h, v);
    h /= len;
    v /= len;

    // Movimento
    x += h * move_speed;
    y += v * move_speed;

    // Controle de animação
    if (v < 0) {
        // Andando para cima (costas)
        sprite_index = spr_walk_up;
    }
    else {
        // Andando para baixo OU para os lados
        sprite_index = spr_walk_down;
    }
	
	if (h < 0) {
    image_xscale = -1; // esquerda
	}
	else if (h > 0) {
	    image_xscale = 1;  // direita (sprite original)
	}

} else {
    // Parado (sempre de frente)
    sprite_index = spr_idle;
    image_index  = 0;
};