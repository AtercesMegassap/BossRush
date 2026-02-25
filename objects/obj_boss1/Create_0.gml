life = 4;

// Arrays por ponto de vida / fase
array_espinhos1 = array_create(4);
array_espinhos2 = array_create(4);
array_espinhos3 = array_create(4);
array_espinhos4 = array_create(4);

// Exemplo de preenchimento MANUAL (ids reais da room)
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

current_phase = -1;

array_espinhos = [
    array_espinhos1,
    array_espinhos2,
    array_espinhos3,
    array_espinhos4
];

set_phase(0);

function set_phase(_phase)
{
    _phase = clamp(_phase, 0, 3);
    if (_phase == current_phase) return;

    // desativa fase anterior (se existir)
    if (current_phase != -1)
    {
        var old_arr = array_espinhos[current_phase];
        for (var i = 0; i < array_length(old_arr); i++)
        {
            if (instance_exists(old_arr[i]))
            {
                old_arr[i].deactivate_spike();
            }
        }
    }

    // muda fase
    current_phase = _phase;

    // ativa nova fase
    var new_arr = array_espinhos[current_phase];
    for (var i = 0; i < array_length(new_arr); i++)
    {
        if (instance_exists(new_arr[i]))
        {
            new_arr[i].activate_spike();
        }
    }
}