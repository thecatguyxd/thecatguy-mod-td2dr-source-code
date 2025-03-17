var music_list = [ mus_lobby, mus_lobby2, mus_lobby3, mus_lobby4 ];
var random_music = music_list[irandom(array_length_1d(music_list) - 1)];
var rnd = irandom(1);

scr_play_music(random_music);

switch (rnd)
{
    case 0:
        layer_set_visible(layer_get_id("Background"), true);
        layer_set_visible(layer_get_id("Background_fartzone"), false);
    break;

    case 1:
        layer_set_visible(layer_get_id("Background"), false);
        layer_set_visible(layer_get_id("Background_fartzone"), true);
    break;
}

global.palleteFrom = [ #000000 ];
global.palleteTo = [ #000000 ];