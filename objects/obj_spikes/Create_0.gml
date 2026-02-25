enum SpikeState {
    INACTIVE,
    APPEARING,
    ACTIVE,
    DISAPPEARING
}

state = SpikeState.INACTIVE;

image_speed = 0;
image_index = 3;

active = false;

has_dealt_damage = false;

function activate_spike() {
    if (state == SpikeState.INACTIVE) {
        state = SpikeState.APPEARING;
        image_speed = -0.2;
        image_index = 3;
        visible = true;
		has_dealt_damage = false;
    }
}

function deactivate_spike() {
    if (state == SpikeState.ACTIVE) {
        state = SpikeState.DISAPPEARING;
        image_speed = 0.2;
        image_index = 0;
    }
}