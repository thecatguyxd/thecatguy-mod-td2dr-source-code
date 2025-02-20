if(state != 0)
	return;

if(!canUse || voteKick)
	return;
	
chatMode = !chatMode;

if(chatMode)
{
	keyboard_string = chatMsg;
	keyboard_virtual_show(kbv_type_default, kbv_returnkey_done, kbv_autocapitalize_none, true);
}
else
{
	keyboard_virtual_hide();
	
	if(chatMsg == "")
		return;
		
	chatMsg = string_lower(chatMsg);
	
	switch(chatMsg)
	{			
		case ".mute":
		case ".m":
			
			if(global.muteChat)
			{
				global.muteChat = false;
				lobby_add_message("/(client)", "@chat is now unmuted.~");
			}
			else
			{
				lobby_add_message("/(client)", "\\chat is now muted.~");
				global.muteChat = true;
			}	
			break;
			
			//cheats :swag:
			case ".cheats":
			if (global.nickname == "the@cat&fish/" || global.nickname == "fox")
		
				{
					global.enablecheats = !global.enablecheats;
					if (global.enablecheats)
						lobby_add_message("/(client)", "@cheats enabled");
					else
						lobby_add_message("/(client)", "\\cheats disabled");
				}
				break;
				
			//streamer mode
			case ".streamer mode":
			case ".sm":
		
				{
					global.streamermode = !global.streamermode;
					if (global.streamermode)
						lobby_add_message("/(client)", "&streamer mode enabled");
					else
						lobby_add_message("/(client)", "&streamer mode disabled");
				}
				break;
		
			//clock format
			case ".clock format":
			case ".cf":
		
				{
					global.clockformat = !global.clockformat;
					if (global.clockformat)
						lobby_add_message("/(client)", "~clock format now 24 hours");
					else
						lobby_add_message("/(client)", "~clock format now 12 hours");
				}
				break;
			
			//jump selection
			case ".change jump":
			case ".cj":
		
				{
					global.oldjump = !global.oldjump;
					if (global.oldjump)
						lobby_add_message("/(client)", "\\oldjump ~selected");
					else
						lobby_add_message("/(client)", "@newjump ~selected");
				}
				break;
			
			//anti camp
			case ".anti camp":
			case ".ac":
		
				{
					global.anticamping = !global.anticamping;
					if (global.anticamping)
						lobby_add_message("/(client)", "@anti camp ~enabled");
					else
						lobby_add_message("/(client)", "\\anti camp ~disabled");
				}
				break;
			
		default:
			var packet = cpacket_tcp(PacketType.CLIENT_CHAT_MESSAGE, true);
			buffer_write(packet, buffer_u16, obj_netclient.nid);
			buffer_write(packet, buffer_string, scr_chat_filter(chatMsg));
			send_server_tcp(packet);
			lobby_add_message(global.nickname, chatMsg);
			break;
	}
	
	chatMsg = "";
	keyboard_string = "";
}