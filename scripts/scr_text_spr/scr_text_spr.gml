function scr_text_spr(xx, yy, str, color=c_white, alpha=1)
{
	var maxWidth = 0;
	
	var _x = xx;
	var _y = yy;
	
	var _col = color;
	
	for(var i = 0; i < string_length(str); i++)
	{
		var c = string_char_at(str, i + 1);
		var ind = ord(c) - 97;
		
		switch(c)
		{			
			case "\n":
				_x = xx;
				_y += 8;
				continue;
			
			case " ":
				_x += 5;
				continue;
				
			case "-":
				ind = 26;
				break;
			
			case ",":
				ind = 27;
				break;
				
			case "1":
				ind = 28;
				break;
				
			case "2":
				ind = 29;
				break;
				
			case "3":
				ind = 30;
				break;
				
			case "4":
				ind = 31;
				break;
				
			case "5":
				ind = 32;
				break;
				
			case "6":
				ind = 33;
				break;
				
			case "7":
				ind = 34;
				break;
				
			case "8":
				ind = 35;
				break;
				
			case "9":
				ind = 36;
				break;
				
			case "0":
				ind = 37;
				break;
				
			case ".":
				ind = 38;
				break;
				
			case "'":
				ind = 39;
				break;
				
			case ":":
				ind = 40;
				break;
				
			case "(":
				ind = 41;
				break;
				
			case ")":
				ind = 42;
				break;
				
			case "%":
				ind = 43;
				break;
			
			case "+":
				ind = 77;
				break;
				
			case "\\":
				_col = #ff0000;
				continue;
				break;
				
			case "@":
				_col = #00ff00;
				continue;
				break;
				
			case "&":
				_col = #7703fc;
				continue;
				break;
				
			case "/":
				_col = #0000FF;
				continue;
				break;
				
			case "|":
				_col = #323232;
				continue;
				break;
				
			case "`":
				_col = #ffff00;
				continue;
				break;
				
			case "№":
				_col = #ff6400;
				continue;
				break;
				
			case "~":
				_col = color;
				continue;
				break;
				
			default:
				ind = 44;
				break;
		}
		
		var _ord = ord(c);
		if(_ord >= ord("а") && _ord <= ord("я"))
			ind = 45 + (_ord - ord("а"));
			
		if(_ord >= ord("a") && _ord <= ord("z"))
			ind = ord(c) - 97;
		
		draw_sprite_ext(spr_letter1, ind, _x, _y, 1, 1, 0, color != c_white ? color : _col, alpha);
		_x += 6;
		
		switch(c)
		{
			case "w":
			case "m":
			case "x":
			case "n":
			case "м":
			case "д":
			case "и":
			case "й":
			case "ю":
			case "ь":
			case "л":
			case "ш":
			case "щ":
			case "ц":
			case "ж":
				_x += 2;
				break;
		}
		
		if(_x - xx >= maxWidth)
			maxWidth = _x - xx;
	}
	
	return maxWidth;
}

function scr_number_spr(xx, yy, str, color=c_white, alpha=1)
{
	var _x = xx;
	var _y = yy;
	
	var _col = color;
	
	for(var i = 0; i < string_length(str); i++)
	{
		var c = string_char_at(str, i + 1);
		var ind = ord(c) - ord("0");
		
		draw_sprite_ext(spr_number, ind, _x - ((string_length(str) - 1) * 2), _y, 1, 1, 0, _col, alpha);
		_x += 5;
	}
}

function scr_text_spr_centered(yy, str, color=c_white, alpha=1)
{
    var text_width = scr_text_spr(0, -1000, str, color, alpha);
    var centered_x = 240 - text_width / 2;

    scr_text_spr(centered_x, yy, str, color, alpha);
}
