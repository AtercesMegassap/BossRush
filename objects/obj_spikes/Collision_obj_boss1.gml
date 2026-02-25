if (state != SpikeState.ACTIVE) exit;

if (state == SpikeState.ACTIVE && !has_dealt_damage)
{
	other.life -= 1;
	other.set_phase(other.current_phase + 1);
	has_dealt_damage = true;
}