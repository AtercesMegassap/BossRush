var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Normalização para evitar movimento mais rápido na diagonal
if (h != 0 || v != 0) {
    var len = point_distance(0, 0, h, v);
    h /= len;
    v /= len;
}

x += h * move_speed;
y += v * move_speed;