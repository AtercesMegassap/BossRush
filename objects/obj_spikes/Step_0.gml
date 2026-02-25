switch (state) {

    case SpikeState.APPEARING:
        if (image_index <= 0) {
            image_index = 0;
            image_speed = 0;
            state = SpikeState.ACTIVE;
            active = true;
        }
    break;

    case SpikeState.DISAPPEARING:
        if (image_index >= 3) {
            image_index = 3;
            image_speed = 0;
            state = SpikeState.INACTIVE;
            active = false;
        }
    break;
}