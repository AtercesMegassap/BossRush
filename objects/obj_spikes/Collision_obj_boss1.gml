if (state != spike_state.ACTIVE) exit;

if (state == spike_state.ACTIVE && !has_dealt_damage && global.world_current == global.world2)
{
	other.life -= 1;
	other.set_phase(other.current_phase + 1);
	other.change_state(other.boss_state.Hurt);
	has_dealt_damage = true;
}