sprite_random_destive = random_range(6, 10);


image_index = sprite_random_destive;

function set_active(_active)
{
    if (_active)
    {
        // espinhos ativos → frames 0 a 2
        image_index = irandom_range(0, 2);
    }
    else
    {
        // espinhos desativados → frames 6 a 10
        image_index = irandom_range(6, 10);
    }
}