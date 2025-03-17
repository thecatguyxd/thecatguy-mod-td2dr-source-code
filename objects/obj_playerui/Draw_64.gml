if(instance_exists(global.player) && !global.player.isDead)
{			
	switch(global.character)
	{
		case CHARACTER_EXE: //exe
		{
			switch(global.exeCharacter)
			{
				case EXE_ORIGINAL:
				
					//custom thing
					//attack timer
					var prog = 1.0 - (min(global.player.attackTimer, 180) / 180.0);
					var text_color = prog == 1.0 ? c_white : c_red;

					if (prog != 1.0)
					{
					    scr_text_spr(50, 242, string_format(global.player.attackTimer / 70, 0, 2), text_color);
					}
					
					//invis timer
					var prog = 1.0 - (min(global.player.invisTimer, 0) / EXE_INVIS_RECHARGE);

					var text_color = prog == 1.0 ? c_white : c_red;
					
					if (global.player.invisTimer = 0)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(50, 256, string_format(global.player.invisTimer / 70, 0, 2), text_color, 0.5);
					    }
					if (global.player.invisTimer > -1200)
						{
						    var text_color = prog == 1.0 ? c_white : c_red;
						    scr_text_spr(50, 256, string_format(global.player.invisTimer / 70, 0, 2), text_color, 0.5);
						}
					
					//other
					var prog = 1.0 - (min(global.player.attackTimer, 180) / 180.0);
					draw_sprite_ext(spr_gui_exeattack, 0, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
					
					var prog = global.playerControls && global.player.isJumping;
					draw_sprite_ext(spr_gui_exefreejump, 0, 3, 218 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog ? c_white : c_red, prog ? 1 : 0.5);
					
					var prog = (min(global.player.invisTimer, 0) / EXE_INVIS_RECHARGE);
					draw_sprite_ext(spr_gui_exeinvisability, 0, prog * 4, 250 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
					break;
					
				case EXE_CHAOS:
				
					//custom thing
					//attack timer
					var prog = 1.0 - (min(global.player.attackTimer, 180) / 180.0);
					var text_color = prog == 1.0 ? c_white : c_red;

					if (prog != 1.0)
					{
					    scr_text_spr(60, 242, string_format(global.player.attackTimer / 70, 0, 2), text_color, 0.5);
					}
					
					//slime Timer
					if (global.player.stuckTimer <= 30 / 2)
					{
					    var prog = global.player.slimeTimer > 0 ? 0 : 1.0 - (min(global.player.attackTimer, 120) / 120.0);
					    draw_sprite_ext(spr_gui_chaosattack, !global.player.isGrounded, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);

					    if (global.player.slimeTimer = 0)			
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(50, 260, string_format(global.player.slimeTimer / 70, 0, 2), text_color, 0.5);
					    }
					}
					else
					{
					    var frame = 2;

					    if (global.player.isGrounded && global.player.stuckDir > 0)
						{
					        frame = 1;
					    }

					    if (global.player.isGrounded && global.player.stuckDir < 0)
						{
					        frame = 0;
					    }

					    var prog = 1;
					    draw_sprite_ext(spr_gui_chaoswalldash, frame, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
					}
					
					//slime Timer 2
					var prog = global.player.slimeTimer > 0 ? 1 : (min(global.player.slimeTimer, 0) / -CHAOS_INVIS_RECHARGE);

					//draw_sprite_ext(spr_gui_chaosslime, 0, prog * 4, 250 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);

					if (global.player.slimeTimer > -1200)
					{
					    var text_color = prog == 1.0 ? c_white : c_red;
					    scr_text_spr(50, 260, string_format(global.player.slimeTimer / 70, 0, 2), text_color, 0.5);
					}
					
					//other
					if(global.player.stuckTimer <= 30/2)
					{
						var prog = global.player.slimeTimer > 0 ? 0 : 1.0 - (min(global.player.attackTimer, 120) / 120.0);
						draw_sprite_ext(spr_gui_chaosattack, !global.player.isGrounded, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
					}
					else
					{
						var frame = 2;
						
						if(global.player.isGrounded && global.player.stuckDir > 0)
							frame = 1;
							
						if(global.player.isGrounded && global.player.stuckDir < 0)
							frame = 0;
						
						var prog = 1;
						draw_sprite_ext(spr_gui_chaoswalldash, frame, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
					}
					
					var prog = global.playerControls && global.player.isJumping;
					draw_sprite_ext(spr_gui_exefreejump, 0, 3, 218 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog && global.player.slimeTimer <= 0 ? c_white : c_red, global.player.slimeTimer <= 0 ? (prog ? 1 : 0.5) : 0);
					
					var prog = global.player.slimeTimer > 0 ? 1 : (min(global.player.slimeTimer, 0) / -CHAOS_INVIS_RECHARGE);
					draw_sprite_ext(spr_gui_chaosslime, 0, prog * 4, 250 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
					break;
					
				case EXE_EXETIOR:
				
					//custom thing
					//attack timer
					var prog = 1.0 - (min(global.player.attackTimer, 180) / 180.0);
					var text_color = prog == 1.0 ? c_white : c_red;

					if (prog != 1.0)
					{
					    scr_text_spr(55, 241, string_format(global.player.attackTimer / 70, 0, 2), text_color, 0.5);
					}
					
					//black ring timer
					var prog = 1.0 - (global.player.bringTimer / EXETIOR_BRING_RECHARGE);

					var text_color = prog == 1.0 ? c_white : c_red;

					if (prog != 1.0)
					{
					    scr_text_spr(50, 256, string_format(global.player.bringTimer / 70, 0, 2), text_color, 0.5);
					}
					
					//other
					var prog = 1.0 - (min(global.player.attackTimer, 180) / 180.0);
					draw_sprite_ext(spr_gui_exetiorattack, !global.player.isGrounded, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
					
					var prog = global.playerControls && global.player.isJumping;
					draw_sprite_ext(spr_gui_exefreejump, 0, 3, 218 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog ? c_white : c_red, prog ? 1 : 0.5);
					
					var prog = (1.0 - (global.player.bringTimer / EXETIOR_BRING_RECHARGE));
					draw_sprite_ext(spr_gui_exetiorring, 0, prog * 4, 250 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 && global.player.canSpawnRings ? c_white : c_red, prog);
					break;
					
				case EXE_EXELLER:
				
					//custom thing
					//attack timer
					var prog = 1.0 - (min(global.player.attackTimer, 180) / 180.0);
					var text_color = prog == 1.0 ? c_white : c_red;

					if (prog != 1.0)
					{
					    scr_text_spr(50, 241, string_format(global.player.attackTimer / 70, 0, 2), text_color, 0.5);
					}
					
					//exeller clone timer
					var prog = 1.0 - (global.player.cloneTimer / EXELLER_CLONE_RECHARGE);
					var spr = spr_gui_exellerclone;

					if ((keyboard_check(global.KeyDown) || keyboard_check(global.KeyUp)))
					{
					    if (global.player.cloneCount > 0)
						{
					        spr = spr_gui_exellerclone2;
					        prog = 1;
					    }
					}

					if (spr == spr_gui_exellerclone && global.player.cloneCount >= 2)
					{
					    prog = 0;
					}

					var text_color = prog == 1.0 ? c_white : c_red;

					draw_sprite_ext(spr, 0, prog * 4, 250 - (os_type == os_android ? 200 : 0), 1, 1, 0, text_color, prog);

					if (prog != 1.0 && global.player.cloneCount < 2)
					{
					    scr_text_spr(70, 256, string_format(global.player.cloneTimer / 70, 0, 2), text_color, 0.5);
					}

					
					//other
					var prog = 1.0 - (min(global.player.attackTimer, 180) / 180.0);
					draw_sprite_ext(spr_gui_exeattack, 0, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
					
					var prog = global.playerControls && global.player.isJumping;
					draw_sprite_ext(spr_gui_exefreejump, 0, 3, 218 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog ? c_white : c_red, prog ? 1 : 0.5);
					
					var prog = 1.0 - (global.player.cloneTimer / EXELLER_CLONE_RECHARGE);
					var spr = spr_gui_exellerclone;
					
					if((keyboard_check(global.KeyDown) || keyboard_check(global.KeyUp)))
					{
						if(global.player.cloneCount > 0)
						{
							spr = spr_gui_exellerclone2;
							prog = 1;
						}
					}
					
					if(spr == spr_gui_exellerclone && global.player.cloneCount >= 2)
						prog = 0;
					
					draw_sprite_ext(spr, 0, prog * 4, 250 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
					break;
			}
			
			break;
		}
		
		case CHARACTER_TAILS:
        {
			//custom thing
			//fly timer tails
			var prog = 1.0 - (min(global.player.flyTimer, 0) / -420.0);

					var text_color = prog == 1.0 ? c_white : c_red;
					
					if (global.player.flyTimer = 160)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(50, 256, string_format(global.player.flyTimer / 70, 0, 2), text_color, 0.5);
					    }
					if (global.player.flyTimer > -420)
						{
						    var text_color = prog == 1.0 ? c_white : c_red;
						    scr_text_spr(50, 241, string_format(global.player.flyTimer / 70, 0, 2), text_color, 0.5);
						}
			
			//attack timer
			var val = global.player.revivalTimes >= 2 ? ETAILS_ATTACK_RECHARGE : TAILS_ATTACK_RECHARGE;
			var prog = 1.0 - (global.player.attackTimer / val);

			var text_color = prog == 1.0 ? c_white : c_red;

			if (prog != 1.0)
			{
			    scr_text_spr(50, 256, string_format(global.player.attackTimer / 70, 0, 2), text_color, 0.5);
			}

			//other
            var prog = (min(global.player.flyTimer, 0) / -420.0);
            draw_sprite_ext(spr_gui_tailsfly, global.player.revivalTimes >= 2, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
            
            var val = global.player.revivalTimes >= 2 ? ETAILS_ATTACK_RECHARGE : TAILS_ATTACK_RECHARGE;
            var prog = 1.0 - (global.player.attackTimer / val);
            draw_sprite_ext(spr_gui_tailsattack, 0, prog * 12, 250 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
            break;
        }
		
		case CHARACTER_KNUX:
		{
			//custom thing
			//glide timer
			var prog = 1.0 - (min(global.player.glideTimer, KNUX_GLIDE_RECHARGE) / KNUX_GLIDE_RECHARGE);

					var text_color = prog == 1.0 ? c_white : c_red;
					
					if (global.player.glideTimer = 899)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(55, 244, string_format(global.player.glideTimer / 70, 0, 2), text_color, 0.5);
					    }
					if (global.player.glideTimer > 0)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(55, 244, string_format(global.player.glideTimer / 70, 0, 2), text_color, 0.5);
					    }
			
			//attack timer
			var val = global.player.revivalTimes >= 2 ? KNUX_EXEATTACK_RECHARGE : KNUX_ATTACK_RECHARGE;
			var prog = 1.0 - (global.player.attackTimer / val);

			var text_color = prog == 1.0 ? c_white : c_red;

			if (prog != 1.0)
			{
			    scr_text_spr(55, 260, string_format(global.player.attackTimer / 70, 0, 2), text_color, 0.5);
			}
			
			//other
			var prog = 1.0 - (min(global.player.glideTimer, KNUX_GLIDE_RECHARGE) / KNUX_GLIDE_RECHARGE);
			draw_sprite_ext(spr_gui_knuxglide, global.player.revivalTimes >= 2, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
			
			var val = global.player.revivalTimes >= 2 ? KNUX_EXEATTACK_RECHARGE : KNUX_ATTACK_RECHARGE;
			var prog = 1.0 - (min(global.player.attackTimer, val) / val);
			draw_sprite_ext(spr_gui_knuxattack, 0, prog * 10, 258 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);	
			break;
		}
		
		case CHARACTER_EGGMAN:
		{
			//custom thing
			//jetpack timer
			var prog = 1.0 - (max(global.player.djumpRecharge, 0) / EGGMAN_DJUMP_RECHARGE);

			var text_color = prog == 1.0 ? c_white : c_red;
					
			if (global.player.djumpRecharge > 600)
				{
					var text_color = prog == 1.0 ? c_white : c_red;
					scr_text_spr(50, 226, string_format(global.player.djumpRecharge / 70, 0, 2), text_color, 0.5);
				}
			if (global.player.djumpRecharge > 0)
				{
					var text_color = prog == 1.0 ? c_white : c_red;
					scr_text_spr(50, 226, string_format(global.player.djumpRecharge / 70, 0, 2), text_color, 0.5);
				}
			
			//shield timer
			var prog = 1.0 - (max(global.player.shieldRechrage, 0) / EGGMAN_SHIELD_RECHARGE);

			var text_color = prog == 1.0 ? c_white : c_red;
					
			if (global.player.shieldRechrage > 1200)
				{
					var text_color = prog == 1.0 ? c_white : c_red;
					scr_text_spr(50, 242, string_format(global.player.shieldRechrage / 70, 0, 2), text_color, 0.5);
				}
			if (global.player.shieldRechrage > 0)
				{
					var text_color = prog == 1.0 ? c_white : c_red;
					scr_text_spr(50, 242, string_format(global.player.shieldRechrage / 70, 0, 2), text_color, 0.5);
				}
			
			//tracker timer
			var prog = 1.0 - (max(global.player.trackerRecharge, 0) / EGGMAN_TRACKER_RECHARGE);

			var text_color = prog == 1.0 ? c_white : c_red;
					
			if (global.player.trackerRecharge > 1800)
				{
					var text_color = prog == 1.0 ? c_white : c_red;
					scr_text_spr(60, 256, string_format(global.player.trackerRecharge / 70, 0, 2), text_color, 0.5);
				}
			if (global.player.trackerRecharge > 0)
				{
					var text_color = prog == 1.0 ? c_white : c_red;
					scr_text_spr(60, 256, string_format(global.player.trackerRecharge / 70, 0, 2), text_color, 0.5);
				}
			
			var prog = 1.0 - (max(global.player.djumpRecharge, 0) / EGGMAN_DJUMP_RECHARGE);
			draw_sprite_ext(spr_gui_eggdjump, 0, prog * 10, 222 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
			
			var prog = 1.0 - (max(global.player.shieldRechrage, 0) / EGGMAN_SHIELD_RECHARGE);
			draw_sprite_ext(spr_gui_eggshield, 0, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);	
			
			var prog = 1.0 - (max(global.player.trackerRecharge, 0) / EGGMAN_TRACKER_RECHARGE);
			draw_sprite_ext(spr_gui_eggtrack, 0, prog * 10, 258 - (os_type == os_android ? 200 : 0), 1, 1, 0, (global.player.isColliding && prog == 1.0) ? c_white : c_red, prog);	
			break;
		}
		
		case CHARACTER_AMY:
		{
			var prog = 1.0 - (max(global.player.hjumpTimer, 0) / AMY_BIGJUMP_RECHARGE);

					var text_color = prog == 1.0 ? c_white : c_red;
					
					if (global.player.hjumpTimer > 540)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(55, 242, string_format(global.player.hjumpTimer / 70, 0, 2), text_color, 0.5);
					    }
					if (global.player.hjumpTimer > 0)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(55, 242, string_format(global.player.hjumpTimer / 70, 0, 2), text_color, 0.5);
					    }
			
			var val = global.player.revivalTimes >= 2 ? KNUX_EXEATTACK_RECHARGE : KNUX_ATTACK_RECHARGE;
			var prog = 1.0 - (max(global.player.attackTimer, 0) / val);

					var text_color = prog == 1.0 ? c_white : c_red;
					
					if (global.player.attackTimer > 1200)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(55, 260, string_format(global.player.attackTimer / 70, 0, 2), text_color, 0.5);
					    }
					if (global.player.attackTimer > 0)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(55, 260, string_format(global.player.attackTimer / 70, 0, 2), text_color, 0.5);
					    }
			
			var prog = 1.0 - (max(global.player.hjumpTimer, 0) / AMY_BIGJUMP_RECHARGE);
			draw_sprite_ext(spr_gui_amyhjump, 0, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
			
			var val = global.player.revivalTimes >= 2 ? KNUX_EXEATTACK_RECHARGE : KNUX_ATTACK_RECHARGE;
			var prog = 1.0 - (max(global.player.attackTimer, 0) / val);
			draw_sprite_ext(spr_gui_amyattack, 0, prog * 10, 258 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);	
			break;
		}
		
		case CHARACTER_CREAM:
		{
			
			var prog = 1.0 - (max(global.player.flyTimer, 0) / CREAM_FLY_RECHARGE);

					var text_color = prog == 1.0 ? c_white : c_red;
					
					if (global.player.flyTimer > 899)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(50, 228, string_format(global.player.flyTimer / 70, 0, 2), text_color, 0.5);
					    }
					if (global.player.flyTimer > 0)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(50, 228, string_format(global.player.flyTimer / 70, 0, 2), text_color, 0.5);
					    }
			
			var prog = 1.0 - (max(global.player.dashTimer, 0) / CREAM_DASH_RECHARGE);

					var text_color = prog == 1.0 ? c_white : c_red;
					
					if (global.player.dashTimer > 1800)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(50, 244, string_format(global.player.dashTimer / 70, 0, 2), text_color, 0.5);
					    }
					if (global.player.dashTimer > 0)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(50, 244, string_format(global.player.dashTimer / 70, 0, 2), text_color, 0.5);
					    }
			
			var prog = 1.0 - (max(global.player.ringsTimer, 0) / (global.player.revivalTimes >= 2 ? ECREAM_RINGS_RECHARGE : CREAM_DASH_RECHARGE));

					var text_color = prog == 1.0 ? c_white : c_red;
					
					if (global.player.ringsTimer > 2400)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(50, 260, string_format(global.player.ringsTimer / 70, 0, 2), text_color, 0.5);
					    }
					if (global.player.ringsTimer > 0)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(50, 260, string_format(global.player.ringsTimer / 70, 0, 2), text_color, 0.5);
					    }
			
			var prog = 1.0 - (max(global.player.flyTimer, 0) / CREAM_FLY_RECHARGE);
			draw_sprite_ext(spr_gui_creamfly, global.player.revivalTimes >= 2, prog * 10, 222 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
			
			var prog = 1.0 - (max(global.player.dashTimer, 0) / CREAM_DASH_RECHARGE);
			draw_sprite_ext(spr_gui_creamdash, 0, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
			
			var prog = 1.0 - (max(global.player.ringsTimer, 0) / (global.player.revivalTimes >= 2 ? ECREAM_RINGS_RECHARGE : CREAM_DASH_RECHARGE));
			draw_sprite_ext(spr_gui_creamrings, global.player.revivalTimes >= 2, prog * 10, 257 - (os_type == os_android ? 200 : 0), 1, 1, 0, (prog == 1.0 && !global.player.isColliding) ? c_white : c_red, prog);
			break;
		}
		
		case CHARACTER_SALLY:
		{
			
			var val = global.player.revivalTimes >= 2 ? SALLY_EATTACK_RECHARGE : SALLY_ATTACK_RECHARGE;
			var prog = 1.0 - (max(global.player.attackTimer, 0) / val);

					var text_color = prog == 1.0 ? c_white : c_red;
					
					if (global.player.attackTimer > 900)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(45, 242, string_format(global.player.attackTimer / 70, 0, 2), text_color, 0.5);
					    }
					if (global.player.attackTimer > 0)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(45, 242, string_format(global.player.attackTimer / 70, 0, 2), text_color, 0.5);
					    }
			
			var val = global.player.revivalTimes >= 2 ? SALLY_ESHIELD_RECHARGE : SALLY_SHIELD_RECHARGE;
			var prog = 1.0 - (max(global.player.shieldRechrage, 0) / val);

					var text_color = prog == 1.0 ? c_white : c_red;
					
					if (global.player.shieldRechrage > 1800)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(45, 260, string_format(global.player.shieldRechrage / 70, 0, 2), text_color, 0.5);
					    }
					if (global.player.shieldRechrage > 0)
						{
					        var text_color = prog == 1.0 ? c_white : c_red;
					        scr_text_spr(45, 260, string_format(global.player.shieldRechrage / 70, 0, 2), text_color, 0.5);
					    }
			
			var val = global.player.revivalTimes >= 2 ? SALLY_EATTACK_RECHARGE : SALLY_ATTACK_RECHARGE;
			var prog = 1.0 - (max(global.player.attackTimer, 0) / val);
			
			var b = c_red;
			if(prog == 1.0)
				b = c_white;
			
			if(global.player.isGrounded)
				b = c_red;
			
			draw_sprite_ext(spr_gui_sallyattack, global.player.revivalTimes >= 2, prog * 10, 240 - (os_type == os_android ? 200 : 0), 1, 1, 0, b, prog);
			
			var val = global.player.revivalTimes >= 2 ? SALLY_ESHIELD_RECHARGE : SALLY_SHIELD_RECHARGE;
			var prog = 1.0 - (max(global.player.shieldRechrage, 0) / val);
			draw_sprite_ext(spr_gui_sallyshield, global.player.revivalTimes >= 2, prog * 10, 258 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
			break;
		}
		
		case CHARACTER_SCARF:
		{
			
		    var val = global.player.revivalTimes >= 2 ? SCARF_EXEATTACK_RECHARGE : SCARF_ATTACK_RECHARGE;
			var prog = 1.0 - (min(global.player.attackTimer, val) / val);
		    var text_color = prog == 1.0 ? c_white : c_red;

		    if (prog != 1.0)
		    {
		        scr_text_spr(45, 243.5, string_format(global.player.attackTimer / 70, 0, 2), text_color, 0.5);
		    }
		    draw_sprite_ext(spr_gui_exeattack, 0, prog * 10, 242 - (os_type == os_android ? 200 : 0), 1, 1, 0, prog == 1.0 ? c_white : c_red, prog);
			
            val = (global.player.revivalTimes >= 2 ? 410 : 820)
            prog = 1 - (max(global.player.spinCooldown, 0)) / val
			if (global.player.spinCooldown > 0)
			{
				var text_color = prog == 1.0 ? c_white : c_red;
				scr_text_spr(60, 257.5, string_format(global.player.spinCooldown / 70, 0, 2), text_color, 0.5);
			}
			
            draw_sprite_ext(spr_gui_scarfspindash, global.player.revivalTimes >= 2, (prog * 10), 254, 1, 1, 0, (prog == 1 ? c_white : c_red), prog)
            break;
		}
	}
}