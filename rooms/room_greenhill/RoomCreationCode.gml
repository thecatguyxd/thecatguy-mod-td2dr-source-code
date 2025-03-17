//Level setup code
var music_list = [mus_hill, mus_hill_2, mus_hill_3];
var random_music = music_list[irandom(array_length_1d(music_list) - 1)];

scr_play_music(random_music);

global.parallax = [
	[ layer_get_id("Background2"), 0.6, 1, 14 ],
	[ layer_get_id("Background3"), 0.7, 1, 14 ],
	[ layer_get_id("Background4"), 0.8, 1, 14 ],
	[ layer_get_id("Background5"), 0.5, 1, 0 ],
	[ layer_get_id("Background6"), 0.9, 1, 0 ],
] 

scr_level_splitl(spr_ghz_tiles2, "TilesFore2");
scr_level_splitl(spr_ghz_grass, "TilesFore");
scr_level_split(spr_ghz_tiles, 100);
