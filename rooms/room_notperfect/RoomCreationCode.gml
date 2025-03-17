//Level setup code
var music_list = [mus_notperfect, mus_notperfect_2];
var random_music = music_list[irandom(array_length_1d(music_list) - 1)];

scr_play_music(random_music);

scr_level_splitl(spr_notperfect2, "ShadowTiles");
scr_level_splitl(spr_notperfect, "Tiles");

scr_level_splitl(spr_notperfect2_p2, "ShadowTiles", true, 1368);
scr_level_splitl(spr_notperfect_p2, "Tiles", true, 1368);

with(obj_tile)
{
	if(depth == 90)
	{
		isVis = false;
		image_alpha = 0;
	}
}