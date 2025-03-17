global.timeSeconds = 0;
global.timeMinutes = 0;
global.ringFrame = 0;
state = 0;
showSurvivors = false;
survivorTimer = 0;
timeFrame = 0;
clockAngle = 0;
bloodFade = 0;
hideFade = 0;

titleCard = 0;
cardX = 480;
cardY = -270;
depth = -1000;
instance_create_depth(0, 0, 0, obj_playerui);

drawPing = function(char, exeCharacter, ping, revival, name, index)
{	
	if(char == CHARACTER_EXE)
	{
		char += CHARACTER_SCARF;
		char += exeCharacter;
	}
	else char--;

	var base_x = 120;
	if (index % 2 == 1) base_x = 360;

	var y_pos = 44 + (index div 2) * 30;

	draw_sprite(spr_tab_entry, char, base_x, y_pos);

	if(char <= CHARACTER_SCARF)
	{
		if(revival >= 2)
			draw_sprite(spr_playerhealth_demon, char, base_x - 112, y_pos + 27);
		else if(revival >= 1)
			draw_sprite(spr_playerhealth_hit, char, base_x - 112, y_pos + 27);
	}

	var clr = #0fff39;
	if(ping <= 0)
	{
		ping = string_copy("...", 0, (current_time / 500) % 4);
		clr = #ff0001;
	}
	else
	{
		if(ping >= 80 && ping < 160)
			clr = #ffc400;
		else if(ping >= 160)
			clr = #ff0001;

		ping = $"{ping}ms";
	}

	scr_text_spr(base_x + -60, y_pos + 11, name, c_white);
	scr_text_spr(base_x + 70, y_pos + 11, ping, clr);
}