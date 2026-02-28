move_speed = 2;

spr_idle      = spr_player_parado
spr_walk_down = spr_player_frente;
spr_walk_up   = spr_player_costas;

life = 4;

sprite_index = spr_idle;

update_world();

function take_damage()
{
	life -= 1;
}