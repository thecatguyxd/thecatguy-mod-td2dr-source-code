if (!audio_is_playing(mus_disclaimer)) {
    global.music = mus_disclaimer;
    audio_play_sound(global.music, 1, true);
}

if ((device_mouse_check_button_pressed(0, mb_left) || keyboard_check_pressed(vk_enter)) && global.cooldowntime <= 0 && !global.transitionstarted) {
    global.transitionstarted = true;
    global.fadealpha = 0;
    global.cooldowntime = 3;
    global.showsprite = true;

    audio_sound_gain(global.music, 0, 500);

    if (!global.soundplayed) {
        audio_play_sound(snd_menu_press, 1, false);
        global.soundplayed = true;
    }
}

if (global.transitionstarted) {
    if (global.fadealpha < 1) {
        global.fadealpha += global.fadespeed;
        if (global.fadealpha > 1) {
            global.fadealpha = 1;
        }
    }

    if (global.fadealpha == 1) {
        audio_stop_sound(global.music);
        room_goto(room_logo);
    }
}
