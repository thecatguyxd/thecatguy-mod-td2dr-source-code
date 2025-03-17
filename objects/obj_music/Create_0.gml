slider_x_pos = 50;
slider_y_pos = 250;

slider_min = slider_x_pos + 4;
slider_max = slider_x_pos + 64;
dragging = false;

if (!variable_instance_exists(obj_custom, "music_volume")) {
    obj_custom.music_volume = 1;
}

slider_x = slider_min + (obj_custom.music_volume * (slider_max - slider_min));
