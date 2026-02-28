life = 4;

enum boss_state 
{
	Dash,
	Hurt,
	Idle,
	Moving,
	Prepering,
	Recovering
}

state = boss_state.Idle;
state_timer = 0;
dash_speed = 12;

target_x = 0;
target_y = 0;
dir = 0;

array_espinhos1 = array_create(4);
array_espinhos2 = array_create(4);
array_espinhos3 = array_create(4);
array_espinhos4 = array_create(4);

array_elements1 = array_create(4);
array_elements2 = array_create(4);
array_elements3 = array_create(4);
array_elements4 = array_create(4);

array_espinhos1[0] = inst_8014681;
array_espinhos1[1] = inst_16AE3FF1;
array_espinhos1[2] = inst_1FBC6B1;
array_espinhos1[3] = inst_186E05C8;

array_espinhos2[0] = inst_757896F5;
array_espinhos2[1] = inst_37CD38B2;
array_espinhos2[2] = inst_337F54AB;
array_espinhos2[3] = inst_25609A2D;

array_espinhos3[0] = inst_4023E8EC;
array_espinhos3[1] = inst_2C32A707;
array_espinhos3[2] = inst_799E1D80;
array_espinhos3[3] = inst_3F6D0039;

array_espinhos4[0] = inst_72EE4E97;
array_espinhos4[1] = inst_3AE55E2C;
array_espinhos4[2] = inst_66115A4C;
array_espinhos4[3] = inst_36E0B3B6;

array_elements1[0] = inst_6F9E3B0D;
array_elements1[1] = inst_7DF81516;
array_elements1[2] = inst_6DD532CD;
array_elements1[3] = inst_3B9EF43D;

array_elements2[0] = inst_4525692B;
array_elements2[1] = inst_6BA63326;
array_elements2[2] = inst_133D985D;
array_elements2[3] = inst_37B44C9;

array_elements3[0] = inst_36E968BE;
array_elements3[1] = inst_6100611A;
array_elements3[2] = inst_745AE7D8;
array_elements3[3] = inst_39BC8C91;

array_elements4[0] = inst_242E6EF0;
array_elements4[1] = inst_61FE1D28;
array_elements4[2] = inst_5A3FB15C;
array_elements4[3] = inst_4355C450;

current_phase = -1;

array_espinhos = 
[
    array_espinhos1,
    array_espinhos2,
    array_espinhos3,
    array_espinhos4
];

array_elements = 
[
	array_elements1,
	array_elements2,
	array_elements3,
	array_elements4
]

set_phase(0);

function set_phase(_phase)
{
    _phase = clamp(_phase, 0, 3);
    if (_phase == current_phase) return;

    // desativa fase anterior (se existir)
    if (current_phase != -1)
    {
        var old_arr = array_espinhos[current_phase];
		var old_arr_el = array_elements[current_phase];
        for (var i = 0; i < array_length(old_arr); i++)
        {
            if (instance_exists(old_arr[i]))
            {
                old_arr[i].deactivate_spike();
				elements_set_active(old_arr_el[i], false);
            }
        }
    }

    // muda fase
    current_phase = _phase;

    // ativa nova fase
    var new_arr = array_espinhos[current_phase];
	var new_arr_el = array_elements[current_phase];
    for (var i = 0; i < array_length(new_arr); i++)
    {
        if (instance_exists(new_arr[i]))
        {
            new_arr[i].activate_spike();
			elements_set_active(new_arr_el[i], true);
        }
    }
}

function control_state()
{
	switch(state)
	{
		case boss_state.Idle:
			// parado 2–3 segundos
			if (state_timer >= irandom_range(120, 180))
            {
                change_state(boss_state.Moving);
            }
		break;
		
		case boss_state.Moving:
			// gira acompanhando o player
            if (instance_exists(obj_player))
            {
                dir = point_direction(x, y, obj_player.x, obj_player.y);
            }

            image_angle = dir;

            // após 3 segundos, trava o alvo
            if (state_timer >= 180)
            {
                target_x = obj_player.x;
                target_y = obj_player.y;

                change_state(boss_state.Prepering);
            }
		break;
		
		case boss_state.Prepering:
			// animação / telegraph
            image_angle = dir + 90;

            if (state_timer >= irandom_range(120, 180))
            {
                // calcula direção fixa do dash
                dir = point_direction(x, y, target_x, target_y);
                hspeed = lengthdir_x(dash_speed, dir);
                vspeed = lengthdir_y(dash_speed, dir);

                change_state(boss_state.Dash);
            }
		break;
		
		case boss_state.Dash:
			// movimento já está aplicado via hspeed/vspeed

            // se não colidir com nada em 1 segundo → reinicia loop
            if (state_timer >= 60)
            {
                hspeed = 0;
                vspeed = 0;
                change_state(boss_state.Idle);
            }
		break;
		
		case boss_state.Hurt:
			// stun curto
            hspeed = 0;
            vspeed = 0;

            if (state_timer >= 30)
            {
                change_state(boss_state.Recovering);
            }
		break;
		
		case boss_state.Recovering:
			if (state_timer >= 60)
            {
                change_state(boss_state.Idle);
            }
		break;
	}
}

function change_state(_new)
{
    state = _new;
    state_timer = 0;
}

function can_lock_target(_x, _y)
{
    // World1: sempre pode
    if (global.current_world == global.World1)
        return true;

    // World2: não pode travar em espinho ativo
    var s = instance_position(_x, _y, obj_spikes);
    if (s == noone) return true;

    return (s.state != spike_state.ACTIVE);
}