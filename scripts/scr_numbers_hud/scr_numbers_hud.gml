function scr_numbers_hud(xx, yy, str, color=c_white, alpha=1)
{
	var _x = xx;
	var _y = yy;
	
	var _col = color;
	
	for(var i = 0; i < string_length(str); i++)
	{
		var c = string_char_at(str, i + 1);
		var ind = ord(c) - ord("0");
		
		switch (c)
		{
			case ".":
			ind = 11
			break;
		}

		draw_sprite_ext(spr_numbers_hud, ind, _x - ((string_length(str) - 1) * 2), _y, 1, 1, 0, _col, alpha);
		_x += 8;
	}
}