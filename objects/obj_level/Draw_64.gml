var player_exists = instance_exists(global.player);

switch(room)
{
	case room_notperfect:
	case room_act9:
	case room_youcantrun:
	case room_nastyparadise:
	case room_ravinemist:
	case room_volcanovalley:
	case room_greenhill:
	case room_angelisland:
	case room_fartzone:
	case room_weedzone:
		break;
		
	default:
		draw_sprite_ext(spr_screenoverlay, 0, 0, 0, 1, 1, 0, c_white, 0.7);
		break;
		
}

draw_sprite_ext(spr_hidegui, 0, 0, 0, 1, 1, 0, c_white, hideFade);
draw_sprite_ext(spr_attackgui, 0, 0, 0, 1, 1, 0, c_white, bloodFade);

if(bloodFade > 0)
	bloodFade -= 0.02;
	
if(player_exists && global.player.isHiding)
{
	if(hideFade < 1)
		hideFade += 0.02;
}
else
{
	if(hideFade > 0)
		hideFade -= 0.02;
}
if(global.showHud && titleCard > 4)
{	
	if(obj_netclient.udp_timeout < 60 * 3)
		draw_sprite(spr_badconnection, floor(current_time/200) % 6, 0, 0);
		
	/*
	draw_sprite(spr_clock, 0, 211, 0);
	clockAngle = lerp(clockAngle, (-45 * timeFrame), 0.2);
	draw_sprite_ext(spr_clockhand, 0, 212, 11.5, 1, 1, clockAngle, c_white, 1);
	*/
	
	if(!showSurvivors)
	{
		if(state == 1 && (current_time / 30) % 20 < 10) // Escape!!!
		{
			if(global.character == CHARACTER_EXE || (instance_exists(global.player) && global.player.revivalTimes >= 2))
				draw_sprite(spr_status, 1, 480/2, 15);
			else
				draw_sprite(spr_status, 0, 480/2, 15);
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

if(titleCard < 30)
{
	cardX = clamp(cardX, 0, 480);
	cardY = clamp(cardY, -270, 0);
	
	draw_sprite_ext(spr_titlecard2, obj_netclient.lvlId, 0, cardY, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_titlecard1, obj_netclient.lvlId, cardX, 0, 1, 1, 0, c_white, 1);
	
	titleCard += 0.12;
}

		//custom thing
		//hud
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
		    scr_text_spr(0, 0, "hud hidden", c_white, 0.1);
		}
	
		if(global.streamermode)
			{
			if(global.enablecheats == false)
				scr_text_spr(358, 264, "&streamer mode active");
			else
				scr_text_spr(358, 258, "&streamer mode active");
			}
			else
			{
				if(global.showHud)
				{
				if (player_exists && global.player != undefined)
				{
				var name = game_display_name;
				var ver = string(global.nickname);
				scr_text_spr(330, 6,"name: " + ver);
			
					var ignored_ips = ["localhost", "127.0.0.1", "", "0.0.0.0"];

					if (!array_contains(ignored_ips, obj_config.ip))
					{
						scr_text_spr(330, 12, $"server ip /{obj_config.ip}");
					}
					else
					{
					}
				}
			}
		}
		
	//cheats :swag:
	if (global.enablecheats)
	{
		if (global.playerControls && keyboard_check_pressed(global.KeyEm1))
			global.player.hp = 100
		
		if (global.playerControls && keyboard_check_pressed(global.KeyEm2))
			global.player.hurttime = 100000
		
		if (global.playerControls && keyboard_check_pressed(global.KeyEm3))
			global.player.hurttime = 0
				
		if (global.playerControls && keyboard_check_pressed(global.KeyIdle))
			global.player.attackTimer = 0

		scr_text_spr(403, 264, "cheats active", c_red);
	}
	
	if(global.showHud)
	{
		//bars idk
		if (player_exists && global.player != undefined)
		{
		scr_text_spr(1, 11, "----------------");
		scr_text_spr(1, 21, "----------------");
		}
	
	    //version
		scr_text_spr(100, 6, $"release v&{BUILD_VER}");
		
	    //ping
		var clr = #0fff39;
		if(obj_netclient.ping >= 80 && obj_netclient.ping < 160)
			clr = #ffc400;
		else if(obj_netclient.ping >= 160)
			clr = #ff0001;
        
		if(obj_netclient.ping <= 0)
			scr_text_spr(6, 60, $"№do we call orange color - orange,\ncuz oranges are orange,\nor we call oranges - orange,\ncuz oranges are orange?~{string_copy("......", 0, (current_time / 100) % 4)}");
		
		if(obj_config.showPing)
			scr_text_spr(100, 18, "ms");
		if(obj_config.showPing)
			scr_text_spr(115, 18, string(obj_netclient.ping), clr,);
			
			//*new* fps caped now at 100
			var display_fps = min(fps_real, 100);
			var clr = #ffc400;
			if(display_fps >= 50 && display_fps < 30)
			    clr = #ff0001;
			else if(display_fps >= 30)
			    clr = #0fff39;
			
			if(obj_config.showFps)
				scr_text_spr(100, 24, "fps");
			if(obj_config.showFps)
				scr_text_spr(120, 24, string(floor(display_fps)), clr);
		
			//other shit
			if (player_exists && global.player != undefined)
			{
			if (global.character == CHARACTER_EXE)
			{
			}
			else
			{
				// first on the list
				// hp
				var hpColor = c_white;
			
				switch(global.player.hp)
				{
					case 100:
						hpColor = c_white;
						break;
					case 80:
						hpColor = c_green;
						break;
					case 60:
						hpColor = c_yellow;
						break;
					case 40:
						hpColor = c_orange;
						break;
					case 20:
						if (floor(current_time / 500) % 2 == 0) 
					    {
					        hpColor = c_red;
					    }
					    else
					    {
					        hpColor = c_orange;
					    }
						break;
					case 0:
						hpColor = c_grey;
						break;
				}
				scr_text_spr(6, 6, "hp", hpColor);
		        scr_text_spr(44, 6, $"{global.player.hp / 20}");

			} //exe shit 1
	
			//invisibility
			if(global.player.hurttime > 1)
				scr_text_spr(72, 6, $"|{global.player.hurttime / 70}");
			else if	(global.player.hurttime > 200)
				scr_text_spr(72, 6, "");
			}
		
			//second on the list	
			//timer *old*
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
			if(state == 1 && floor(current_time / 150) % 2 == 0)
			{
			    var color = c_red;
			}
			else
			{
			    var color = c_white;
			}
			var displayTime = string(global.timeMinutes) + ":" + (global.timeSeconds < 10 ? "0" : "") + string(global.timeSeconds);
			scr_text_spr(6, 16, "time", color)
	        scr_text_spr(44, 16, $"{displayTime}");
	
		if (player_exists && global.player != undefined)
		{
		
			if (global.character == CHARACTER_EXE)
			{
			}
			else
			{
			//last on the list
			//rings
			var ringsColor = c_white;

			if (global.player.rings == 0) 
			{
			    if (floor(current_time / 150) % 2 == 0) 
			    {
			        ringsColor = c_red;
			    }
			    else
			    {
			        ringsColor = c_yellow;
			    }
			}
			else if (global.player.rings > 9) 
			{
			    ringsColor = c_green;
			}
			else if (global.player.rings > 0) 
			{
			    ringsColor = c_yellow;
			}
			scr_text_spr(6, 26, "rings", ringsColor);
		    scr_text_spr(44, 26, $"{global.player.rings}");
		
			//Red ring
			if(global.player.redRingTimer > 1)
		        scr_text_spr(72, 26, $"\\{global.player.redRingTimer / 70}");
		    else if(global.player.redRingTimer > 500)
		        scr_text_spr(72, 26, "");
		
			} //exe shit 2

			//player inputs *new*
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

				function draw_key_sprite(input_key, default_sprite, pressed_sprite, x, y)
				{
				    if (keyboard_check(input_key))
				    {
				        draw_sprite(pressed_sprite, 0, x, y);
				    }
				    else
				    {
				        draw_sprite(default_sprite, 0, x, y);
				    }
				}
				draw_key_sprite(global.KeyLeft, spr_left, spr_left_pressed, 3, 50);
				draw_key_sprite(global.KeyUp, spr_up, spr_up_pressed, 11, 45);
				draw_key_sprite(global.KeyDown, spr_down, spr_down_pressed, 11, 52);
				draw_key_sprite(global.KeyRight, spr_right, spr_right_pressed, 18, 50);
		
				draw_key_text(global.KeyA, 28, 50, "z");
				draw_key_text(global.KeyB, 36, 50, "x");
				draw_key_text(global.KeyC, 46, 50, "c");
			}
		}
	
			// clock
			{
			    var hour_display;
			    var suffix = "";

			    if (global.clockformat)
				{
			        hour_display = current_hour;
			    }
				else
				{
			        hour_display = current_hour % 12;
			        if (hour_display == 0) hour_display = 12;
			        suffix = (current_hour < 12) ? " am" : " pm";
			    }

			    scr_text_spr(100, 12, "" 
			        + string((hour_display < 10) ? "0" + string(hour_display) : string(hour_display)) + ":" 
			        + string((current_minute < 10) ? "0" + string(current_minute) : string(current_minute)) + ":" 
			        + string((current_second < 10) ? "0" + string(current_second) : string(current_second)) 
			        + suffix);
			}
		}

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
