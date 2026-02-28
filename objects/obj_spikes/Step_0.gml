switch (state) {

    case spike_state.APPEARING:
        if (image_index <= 0) {
            image_index = 0;
            image_speed = 0;
            state = spike_state.ACTIVE;
            active = true;
        }
    break;

    case spike_state.DISAPPEARING:
        if (image_index >= 3) {
            image_index = 3;
            image_speed = 0;
            state = spike_state.INACTIVE;
            active = false;
        }
    break;
}