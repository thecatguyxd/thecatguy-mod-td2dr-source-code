var player_exists = instance_exists(global.player);

switch (room)
{
	case room_lobby:
	break;

	case room_hideandseek2:
	case room_angelisland:
	case room_fartzone:
	
	switch(global.character)
	{
		case CHARACTER_SCARF:
		break;
		
		default:
		// hp
		if (global.showHud)
		{
			if (player_exists && global.player != undefined)
			{
				if (global.character == CHARACTER_EXE)
				{
				}
				else
				{
					if (instance_exists(global.player) && !global.player.isDead)
					{
						var exeicons = (global.player.revivalTimes >= 2);
    
						var iconindex = -1;

						switch (global.character)
						{
							case CHARACTER_TAILS:   iconindex = 0; break;
							case CHARACTER_KNUX:    iconindex = 1; break;
							case CHARACTER_EGGMAN:  iconindex = 2; break;
							case CHARACTER_AMY:     iconindex = 3; break;
							case CHARACTER_CREAM:   iconindex = 4; break;
							case CHARACTER_SALLY:   iconindex = 5; break;
							default:                iconindex = -1;
						}

						if (iconindex != -1)
						{
							var spritedraw = exeicons ? spr_hud_icons_worlds_exe : spr_hud_icons_worlds;
							draw_sprite_ext(spritedraw, iconindex, 19.8, 44.5, 1, 1, 0, c_white, 1);
						}
    
						if (exeicons)
						{
							scr_numbers_hud_worlds(60.8, 53.5, "0");
						}
						else
						{
							scr_numbers_hud_worlds(60.8, 53.5, string(global.player.hp / 20));
						}
					}
				}
			}
		}
	}

	// другое мой хуй
	if (global.showHud)
	{
		if (player_exists && global.player != undefined)
		{
			if (global.player.hurttime > 1)
				scr_numbers_hud_worlds(120.8, 11.5, string_format(global.player.hurttime / 70, 0, 2), c_gray, 0.5);
			else if (global.player.hurttime > 200)
				scr_numbers_hud_worlds(0, 0, "");
			
			if (global.character == CHARACTER_EXE)
			{
			}
			else
			{
			if (global.player.redRingTimer > 1)
				scr_numbers_hud_worlds(120.4, 27.5, string_format(global.player.redRingTimer / 70, 0, 2), c_red, 0.5);						
			else if (global.player.redRingTimer > 500)
				scr_numbers_hud_worlds(0, 0, "");
			}
		}
	}

	// time
	if (global.showHud)
	{
		var displayTime = string(global.timeMinutes) + ":" + (global.timeSeconds < 10 ? "0" : "") + string(global.timeSeconds);
		if (!variable_global_exists("timeSeconds"))
		{
		global.timeSeconds = 0;
		global.timeMinutes = 0;
		}
		global.timeSeconds += 0 / room_speed;

		if (global.timeSeconds >= 60)
		{
			global.timeSeconds = 0;
			global.timeMinutes += 1;
		}
			
		if(state == 1 && floor(current_time / 240) % 2 == 0)
		{
		draw_sprite_ext(spr_time_hud_worlds, 1, 19.8, 11.5, 1, 1, 0, c_white, 1);
		}
		else
		{
		draw_sprite_ext(spr_time_hud_worlds, 0, 19.8, 11.5, 1, 1, 0, c_white, 1);
		}
		scr_numbers_hud_worlds(80.8, 11.5, string(displayTime));
	}

	// rings
	if(global.showHud)
	{
		if(player_exists && global.player != undefined)
		{
			if (global.character == CHARACTER_EXE)
			{
			}
			else
			{
				if (global.player.rings == 0) 
				{
					if (floor(current_time / 240) % 2 == 0) 
					{
					draw_sprite_ext(spr_rings_hud_worlds, 1, 20.4, 27.5, 1, 1, 0, c_white, 1);
					}
					else
					{
					draw_sprite_ext(spr_rings_hud_worlds, 0, 20.4, 27.5, 1, 1, 0, c_white, 1);
					}
				}
				if(global.player.rings > 0)
				{
				draw_sprite_ext(spr_rings_hud_worlds, 0, 20.4, 27.5, 1, 1, 0, c_white, 1);
				}
				scr_numbers_hud_worlds(90.4, 27.5, string(global.player.rings));
			}
		}
	}
	break;
	
	default:
	
	switch(global.character)
	{
		case CHARACTER_SCARF:
		break;
		
		default:
		
		// hp
		if (global.showHud)
		{
			if (player_exists && global.player != undefined)
			{
				if (global.character == CHARACTER_EXE)
				{
				}
				else
				{
					if (instance_exists(global.player) && !global.player.isDead)
					{	
						var exeicons = (global.player.revivalTimes >= 2);
    
						var iconindex = -1;

						switch (global.character)
						{
							case CHARACTER_TAILS:   iconindex = 0; break;
							case CHARACTER_KNUX:    iconindex = 1; break;
							case CHARACTER_EGGMAN:  iconindex = 2; break;
							case CHARACTER_AMY:     iconindex = 3; break;
							case CHARACTER_CREAM:   iconindex = 4; break;
							case CHARACTER_SALLY:   iconindex = 5; break;
							default:                iconindex = -1;
						}
    
						if (iconindex != -1)
						{
							var spritedraw = exeicons ? spr_hud_icons_exe : spr_hud_icons;
							draw_sprite_ext(spritedraw, iconindex, 19.8, 44.5, 1, 1, 0, c_white, 1);
						}
    
						if (exeicons)
						{
							scr_numbers_lives(60.8, 53.5, "0");
						}
						else
						{
							scr_numbers_lives(60.8, 53.5, string(global.player.hp / 20));
						}
					}
				}
			}
		}
	}

	// другое мой хуй
	if (global.showHud)
	{
		if (player_exists && global.player != undefined)
		{
			if (global.player.hurttime > 1)
				scr_numbers_hud(120.8, 11.5, string_format(global.player.hurttime / 70, 0, 2), c_gray, 0.5);
			else if (global.player.hurttime > 200)
				scr_numbers_hud(0, 0, "");
			        
			if (global.player.redRingTimer > 1)
				scr_numbers_hud(120.4, 27.5, string_format(global.player.redRingTimer / 70, 0, 2), c_red, 0.5);
			else if (global.player.redRingTimer > 500)
				scr_numbers_hud(0, 0, "");
		}
	}
	
	// time
	if (global.showHud)
	{
		var displayTime = string(global.timeMinutes) + ":" + (global.timeSeconds < 10 ? "0" : "") + string(global.timeSeconds);
		if (!variable_global_exists("timeSeconds"))
		{
		global.timeSeconds = 0;
		global.timeMinutes = 0;
		}
		global.timeSeconds += 0 / room_speed;

		if (global.timeSeconds >= 60)
		{
			global.timeSeconds = 0;
			global.timeMinutes += 1;
		}
			if(state == 1 && floor(current_time / 140) % 2 == 0)
			{
			draw_sprite_ext(spr_time_hud, 1, 19.8, 11.5, 1, 1, 0, c_white, 1);
			}
			else
			{
			draw_sprite_ext(spr_time_hud, 0, 19.8, 11.5, 1, 1, 0, c_white, 1);
			}
			scr_numbers_hud(80.8, 11.5, string(displayTime));
		}
		
	// rings
	if(global.showHud)
	{
		if(player_exists && global.player != undefined)
		{
			if (global.character == CHARACTER_EXE)
			{
			}
			else
			{
				if (global.player.rings == 0)
				{
					if (floor(current_time / 140) % 2 == 0) 
					{
					draw_sprite_ext(spr_rings_hud, 1, 20.4, 27.5, 1, 1, 0, c_white, 1);
					}
					else
					{
					draw_sprite_ext(spr_rings_hud, 0, 20.4, 27.5, 1, 1, 0, c_white, 1);
					}
				}
				else
				{
				draw_sprite_ext(spr_rings_hud, 0, 20.4, 27.5, 1, 1, 0, c_white, 1);
				}
				scr_numbers_hud(90.4, 27.5, string(global.player.rings));
			}
		}
		break;
	}
}

//draw_sprite_ext(spr_hp_hud, subimage 0, x 30, y 10, xscale 1.2, yscale 1.2, rotation 0, color 0, alpha 1);
switch (room)
{
	case room_lobby:
	break;
	
	default:
	if(global.showHud && titleCard > 4)
	{	
		if(obj_netclient.udp_timeout < 60 * 3)
			draw_sprite(spr_badconnection, floor(current_time/200) % 6, 0, 0);
	
		if (player_exists && global.player != undefined)
		{
			if(!showSurvivors)
			{
				if(state == 1 && (current_time / 30) % 20 < 10) // Escape!!!
				{
					if(global.character == CHARACTER_EXE || (instance_exists(global.player) && global.player.revivalTimes >= 2))
						draw_sprite(spr_status, 1, 480/2, 10);
					else
						draw_sprite(spr_status, 0, 480/2, 10);
				}
			}
		}
	
		// Icons
		var pos = 480/2 - (ds_map_size(obj_netclient.players) * 28) / 2;
		//self icon
		if(obj_netclient.exeId != obj_netclient.nid)
		{		
			var sprIndex = (global.character-CHARACTER_TAILS) * 7;
			if (player_exists)
			{
				if(global.player.revivalTimes < 2)
				{
					sprIndex += round((1.0 - (global.player.hp / 100.0)) * 5);
				
					if(global.player.hp <= 0)
					{
						if(global.player.revivalTimes == 0)
							sprIndex = (global.character-CHARACTER_TAILS) * 7 + 5;
						else
							sprIndex = (global.character-CHARACTER_TAILS) * 7 + 6;
					}
					draw_sprite(global.player.redRingTimer > 0 ? spr_playerhealth_redring : spr_playerhealth, sprIndex, pos, 268);
					if(global.player.revivalTimes >= 1 && global.player.hp > 0)
						draw_sprite(spr_playerhealth_hit, global.character - 1, pos, 268);
				
					if(global.player.isDead)
					{
						if(global.player.revivalTimes == 0 && global.player.deadTimer < 31)
							scr_number_spr(pos + 12, 264, string(global.player.deadTimer), global.player.deadColor);
					}
					else if(global.player.shards > 0)
						scr_number_spr(pos + 12, 264, string(global.player.shards), #27ff23);		
				}
				else
					draw_sprite(spr_playerhealth_demon, global.character-CHARACTER_TAILS, pos, 268);
			}
			else
				draw_sprite(spr_playerescaped, (global.character-CHARACTER_TAILS), pos, 268);
		
			pos += 28;
		}
	
		var i = 0;
		for(var k = ds_map_find_first(obj_netclient.players); !is_undefined(k); k = ds_map_find_next(obj_netclient.players, k))
		{
			if(!ds_map_exists(obj_netclient.players, k))
				continue;
		
			if(k == obj_netclient.exeId)
				continue;
		
			var player = obj_netclient.players[? k];
			var inst = noone;
		
			var redRing = false;
			if(instance_exists(obj_player_puppet))
			{
				with(obj_player_puppet)
				{
					if(master_id != k)
						continue;
					
					inst = self;
					redRing = hasRedRing;
					break;
				}
			}
		
			if(inst != noone)
			{
				if(!inst.isDemonized || inst.character == CHARACTER_EXE)
				{
					var sprIndex = (inst.character-CHARACTER_TAILS) * 7;
					sprIndex += round((1.0 - (inst.hp / 100.0)) * 5);
				
					if(inst.hp <= 0)
					{
						if(inst.revivalTimes == 0)
							sprIndex = (inst.character-CHARACTER_TAILS) * 7 + 5;
						else
							sprIndex = (inst.character-CHARACTER_TAILS) * 7 + 6;
					}
				
					draw_sprite(redRing ? spr_playerhealth_redring : spr_playerhealth, sprIndex, pos + i * 28, 268);
					if(inst.revivalTimes >= 1 && inst.hp > 0)
						draw_sprite(spr_playerhealth_hit, inst.character - 1, pos + i * 28, 268);
				
					if(inst.revivalTimes == 0 && inst.deadTimer < 31)
						scr_number_spr(pos + i * 28 + 12, 264, string(inst.deadTimer), inst.deadColor);
					else if(player_exists && global.character != CHARACTER_EXE && global.player.revivalTimes < 2 && !global.player.isDead && inst.shards > 0)
						scr_number_spr(pos + i * 28 + 12, 264, string(inst.shards), #27ff23);
				}
				else
				{
					draw_sprite(spr_playerhealth_demon, inst.character-CHARACTER_TAILS, pos + i * 28, 268);
				}
			}
			else 
				draw_sprite(spr_playerescaped, (player.character-CHARACTER_TAILS), pos + i * 28, 268);
			
			i++;
		}
	}

	if(titleCard < 8)
	{
		if(cardX > 0)
			cardX -= 12;
		
		if(cardY < 0)
			cardY += 12;
	}

	if(titleCard < 18)
		draw_sprite_ext(spr_black, 0, 0, 0, 1, 1, 0, c_white, 1.0 - ((clamp(titleCard, 8, 16) - 8) / 8.0));

	if(titleCard > 18)
	{
		if(cardX < 480)
			cardX += 12;
		
		if(cardY > -270)
			cardY -= 12;
	}

	// ну шо погнали пацаны
	if (titleCard < 30) 
	{
		var t = titleCard / 30; 
		t = 1 - sqr(1 - t);

		cardY = lerp(-270, 0, t);
		cardX = lerp(480, 0, t);
	}
	else if (titleCard < 150) 
	{
		cardY = 0;
		cardX = 0;
	}
	else if (titleCard < 180)
	{
		var t = (titleCard - 150) / 30; 
		t = sqr(t);

		cardY = lerp(0, -270, t);
		cardX = lerp(0, -480, t);
	}
	else
	{
		cardY = -270;
		cardX = -480;
	}

	draw_sprite_ext(spr_titlecard2, obj_netclient.lvlId, 0, cardY, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_titlecard1, obj_netclient.lvlId, cardX, 0, 1, 1, 0, c_white, 1);

	titleCard += 1;

	// hud
	if (!variable_global_exists("textVisible"))
	{
		global.textVisible = false;
	}

	if (keyboard_check_pressed(global.KeyHide))
	{
		global.textVisible = !global.textVisible;
	}

	if (global.textVisible)
	{
		scr_text_spr(2, 2, "hud hidden", c_white, 0.1);
	}

	var text_x = 330;
	var text_y = 2

	if (global.showHud)
	{
		if (player_exists && global.player != undefined)
		{
			var name = game_display_name;
			var ver = string(global.nickname);
			scr_text_spr(text_x, text_y, "name: " + ver);
			text_y += 6;
		}
	}

	if (obj_custom.streamermode)
	{
		scr_text_spr(text_x, text_y, "&streamer mode");
		text_y += 6;
	}
	/*
	else
	{
		if (global.showHud)
		{
			if (player_exists && global.player != undefined)
			{
				var ignored_ips = ["localhost", "127.0.0.1", "", "0.0.0.0"];
				if (!array_contains(ignored_ips, obj_config.ip))
    
				{
				scr_text_spr(text_x, text_y, $"server ip: /{obj_config.ip}");
				text_y += 6;
				}
			}
		}
	}
	*/
	if (obj_custom.debugtools)
	{
		scr_text_spr(0, 0, "");
	
		if (global.playerControls && keyboard_check_pressed(global.KeyEm1))
			global.player.hp = 100

		if (global.playerControls && keyboard_check_pressed(global.KeyEm2))
			global.player.rings = 10
	
		if (global.playerControls && keyboard_check_pressed(vk_lshift))
		    global.player.revivalTimes = 2;
		
		if (global.playerControls && keyboard_check_pressed(vk_lalt))
		    global.player.revivalTimes = 1;

		if (global.playerControls && keyboard_check_pressed(global.KeyIdle))
			switch(global.character)
			{
				case CHARACTER_EXE:
				{
					switch(global.exeCharacter)
					{
						case EXE_ORIGINAL:
						global.player.attackTimer = 0
						global.player.invisTimer = -1200
						break;
						case EXE_CHAOS:
						global.player.attackTimer = 0
						global.player.slimeTimer = -1200
						break;
						case EXE_EXETIOR:
						global.player.attackTimer = 0
						global.player.bringTimer = 0
						break;
						case EXE_EXELLER:
						global.player.attackTimer = 0
						global.player.cloneTimer = 0
						break;
					}
				break;
				}
				case CHARACTER_TAILS:
				global.player.flyTimer = -420
				global.player.attackTimer = 0
				break;
			
				case CHARACTER_KNUX:
				global.player.glideTimer = 0
				global.player.attackTimer = 0
				break;
			
				case CHARACTER_EGGMAN:
				global.player.djumpRecharge = 0
				global.player.shieldRechrage = 0
				global.player.trackerRecharge = 0
				break;
			
				case CHARACTER_AMY:
				global.player.hjumpTimer = 0
				global.player.attackTimer = 0
				break;
			
				case CHARACTER_CREAM:
				global.player.flyTimer = 0
				global.player.dashTimer = 0
				global.player.ringsTimer = 0
				break;
			
				case CHARACTER_SALLY:
				global.player.attackTimer = 0
				global.player.shieldRechrage = 0
				break;
				
				case CHARACTER_SCARF:
				global.player.attackTimer = 0
				global.player.spinCooldown = 0
				break;
			}

		scr_text_spr(text_x, text_y, "debug mode", c_dkgray);
		text_y += 6;
	}

	if(global.showHud)
	{
		var clr = #ffffff;	

		// smth
		if(obj_netclient.ping <= 0)
			scr_text_spr(2, 2, $"connecting{string_copy("...", 0, (current_time / 500) % 4)}", c_red);	
		else if(obj_netclient.ping > 0)
		{
		var hour_display;
		var suffix = "";

		// clock
		if (obj_custom.clockformat)
		{
			hour_display = current_hour;
		}
		else
		{
			hour_display = current_hour % 12;
			if (hour_display == 0) hour_display = 12;
			suffix = (current_hour < 12) ? " am" : " pm";
		}

		scr_text_spr(2, 2, "" 
			+ string((hour_display < 10) ? "0" + string(hour_display) : string(hour_display)) + ":" 
			+ string((current_minute < 10) ? "0" + string(current_minute) : string(current_minute)) + ":" 
			+ string((current_second < 10) ? "0" + string(current_second) : string(current_second)) 
			+ suffix);

			switch(obj_custom.clockformat)
			{
				case true:
					// fps
					if(obj_config.showFps)
					{
					var display_fps = min(fps_real, 165);
						clr = #ffc400;
					if(display_fps >= 50 && display_fps < 30)
						clr = #ff0001;
					else if(display_fps >= 30)
						clr = #0fff39;
						scr_text_spr(54, 2, "fps");
						scr_text_spr(73, 2, string(floor(display_fps)), clr);
					}
	
					// ping
					if(obj_config.showPing)
					{
						clr = #0fff39;
					if(obj_netclient.ping >= 80 && obj_netclient.ping < 160)
						clr = #ffc400;
					else if(obj_netclient.ping >= 160)
						clr = #ff0001;
						scr_text_spr(93, 2, "ms");
						scr_text_spr(108, 2, string(obj_netclient.ping), clr,);
					}
				break;
		
				case false:
					// fps
					if(obj_config.showFps)
					{
					var display_fps = min(fps_real, 165);
						clr = #ffc400;
					if(display_fps >= 50 && display_fps < 30)
						clr = #ff0001;
					else if(display_fps >= 30)
						clr = #0fff39;
						scr_text_spr(72, 2, "fps");
						scr_text_spr(91, 2, string(floor(display_fps)), clr);
					}
	
					// ping
					if(obj_config.showPing)
					{
						clr = #0fff39;
					if(obj_netclient.ping >= 80 && obj_netclient.ping < 160)
						clr = #ffc400;
					else if(obj_netclient.ping >= 160)
						clr = #ff0001;
						scr_text_spr(111, 2, "ms");
						scr_text_spr(126, 2, string(obj_netclient.ping), clr,);
					}
				break;
			}
		}
	}
}

// удалить потом
scr_text_spr_centered(2, "||dev build", , 0.5)

// player inputs
if (player_exists && global.player != undefined)
{
	function draw_key_text(input_key, x, y, text)
	{
		if (keyboard_check(input_key))
		{
			scr_text_spr(x, y, text, c_green);
		}
		else
		{
			scr_text_spr(x, y, text, c_white);
		}
	}

	function draw_key_sprite(input_key, default_sprite, x, y)
	{
		if (keyboard_check(input_key))
		{
			draw_sprite(default_sprite, 1, x, y);
		}
		else
		{
			draw_sprite(default_sprite,0, x, y);
		}
	}
	if(global.showHud)
	{
		draw_key_sprite(global.KeyLeft, spr_left, 426, 263);
		draw_key_sprite(global.KeyUp, spr_up, 434, 258);
		draw_key_sprite(global.KeyDown, spr_down, 434, 265);
		draw_key_sprite(global.KeyRight, spr_right, 441, 263);
		
		draw_key_text(global.KeyA, 452, 263, "z");
		draw_key_text(global.KeyB, 460, 263, "x");
		draw_key_text(global.KeyC, 470, 263, "c");
	}
}
	
switch (room)
{
	case room_lobby:
	break;
	
	default:
	//tab
	if(keyboard_check(global.KeyPList))
	{
		draw_sprite(spr_tab, 0, 0, 0);
		drawPing(global.character, global.exeCharacter, obj_netclient.ping, !instance_exists(global.player) ? 0 : global.player.revivalTimes, global.nickname, 0);

		var index = 1;
		for (var k = ds_map_find_first(obj_netclient.players); !is_undefined(k); k = ds_map_find_next(obj_netclient.players, k)) 
		{

			var plr = obj_netclient.players[? k];
			var ping = obj_netclient.pings[? k];
			var inst = noone;

			if(instance_exists(obj_player_puppet))
			{
				with(obj_player_puppet)
				{
					if(master_id != plr.nid)
					continue;
	
					inst = self;
				}
			}
			drawPing(plr.character, plr.exeCharacter, ping, inst == noone ? 0 : inst.revivalTimes, plr.nickname, index);
			index++;
		}
	}
}