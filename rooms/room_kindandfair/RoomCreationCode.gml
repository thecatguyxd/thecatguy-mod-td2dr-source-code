//Level setup code
var music_list = [mus_kindandfair, mus_kindandfair_2];
var random_music = music_list[irandom(array_length_1d(music_list) - 1)];

scr_play_music(random_music);

global.parallax = [
	[ layer_get_id("Background"), 1, 1, 0 ],
	[ layer_get_id("Background2"), 0.99, 1, 0 ],
	[ layer_get_id("Background3"), 0.8, 1, 0 ],
	[ layer_get_id("Background4"), 0.75, 1, 0 ],
	[ layer_get_id("Background5"), 0.7, 1, 0 ],
	[ layer_get_id("Background6"), 0.65, 1, 0 ],
];

scr_level_split(spr_kindnfair_tiles, 92);