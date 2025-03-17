//Level setup code
var music_list = [mus_hideandseek2, mus_hideandseek2_2];
var random_music = music_list[irandom(array_length_1d(music_list) - 1)];

scr_play_music(random_music);

global.parallax = [
	[ layer_get_id("Background"), 0.3, 1 ],
	[ layer_get_id("Background2"), 0.2, 1 ],
] 

scr_level_split(spr_hs2_tiles, 90);