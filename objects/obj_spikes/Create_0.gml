enum spike_state 
{
    INACTIVE,
    APPEARING,
    ACTIVE,
    DISAPPEARING
}

state = spike_state.INACTIVE;

image_speed = 0;
image_index = 3;

active = false;

has_dealt_damage = false;

function activate_spike() {
    if (state == spike_state.INACTIVE) {
        state = spike_state.APPEARING;
        image_speed = -0.2;
        image_index = 3;
        visible = true;
		has_dealt_damage = false;
    }
}

function deactivate_spike() {
    if (state == spike_state.ACTIVE) {
        state = spike_state.DISAPPEARING;
        image_speed = 0.2;
        image_index = 0;
    }
}