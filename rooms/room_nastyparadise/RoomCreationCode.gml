//Level setup code
var music_list = [mus_nastyparadise, mus_nastyparadise_2];
var random_music = music_list[irandom(array_length_1d(music_list) - 1)];

scr_play_music(random_music);

global.parallax = [
	[ layer_get_id("Background"), 0.9, 1, 0 ],
	[ layer_get_id("Background2"), 0.8, 1, 37 ],
	[ layer_get_id("Background3"), 0.7, 1, 177 ],
];

scr_level_split(spr_nap_tails2, -10);
scr_level_split(spr_nap_tiles, 101);