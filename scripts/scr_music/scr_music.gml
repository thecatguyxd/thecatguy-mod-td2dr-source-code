function scr_play_music(bid)
{
    if (!instance_exists(obj_custom)) return;

    with (obj_custom)
	{
        if (!variable_instance_exists(self, "music_instance")) music_instance = -1;
        
        if (music_instance != -1)
		{
            scr_stop_music();
        }

        if (music_volume > 0)
		{
            music_instance = audio_play_sound(bid, 0, true);
            audio_sound_gain(music_instance, music_volume, 0);
        }
    }
}

function scr_stop_music()
{
    if (!instance_exists(obj_custom)) return;

    with (obj_custom)
	{
        if (!variable_instance_exists(self, "music_instance")) music_instance = -1;

        if (music_instance != -1)
		{
            audio_stop_sound(music_instance);
            music_instance = -1;
        }
    }
}
