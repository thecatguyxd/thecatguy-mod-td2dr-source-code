var mx = device_mouse_x(0);
var my = device_mouse_y(0);

if (mouse_check_button_pressed(mb_left) &&
    point_in_rectangle(mx, my, slider_min - 3, slider_y_pos, slider_max + 3, slider_y_pos + 6)) 
{
    dragging = true;
}

if (mouse_check_button_released(mb_left))
{
    dragging = false;
}

if (dragging)
{
    slider_x = clamp(mx, slider_min, slider_max);
    obj_custom.music_volume = (slider_x - slider_min) / (slider_max - slider_min);

    if (obj_custom.music_volume <= 0)
	{
        if (instance_exists(obj_custom) && obj_custom.music_instance != -1)
		{
            audio_stop_sound(obj_custom.music_instance);
            obj_custom.music_instance = -1;
        }
    }
	else
	{
        if (instance_exists(obj_custom) && obj_custom.music_instance != -1)
		{
            audio_sound_gain(obj_custom.music_instance, obj_custom.music_volume, 0);
        }
    }
}
