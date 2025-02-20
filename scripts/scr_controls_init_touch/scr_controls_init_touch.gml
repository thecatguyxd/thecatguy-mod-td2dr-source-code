function scr_controls_init_touch()
{
	kbdTimer = 0;
	dpadX = 68;
	dpadY = 162+25;
	
	bAX = 378;
	bAY = 196+25;
	bAScale = 1;
	bAOpacity = 0.5;
	
	bBX = 416;
	bBY = 146+25;
	bBScale = 1;
	bBOpacity = 0.5;
	
	bCX = 452;
	bCY = 196+25;
	bCScale = 1;
	bCOpacity = 0.5;
	
	bDX = 450+14;
	bDY = 34+14;
	bDScale = 1;
	bDOpacity = 0.5;
	
	bEX = 450+14;
	bEY = 66+14;
	bEScale = 1;
	bEOpacity = 0.5;
	
	bFX = 450+14;
	bFY = 98+14;
	bFScale = 1;
	bFOpacity = 0.5;
	
	bGX = 14;
	bGY = 14;
	bGScale = 1;
	bGOpacity = 0.5;
	
	bWX = 14;
	bWY = 14;
	bWScale = 1;
	bWOpacity = 0.5;
	
	jTouchId = -1;
	jDir = 0;
	jScale = 1;
	jOpacity = 0.5;
	
	jUse = false;	
	bUse = true;
	
	ATouchId = -1;
	BTouchId = -1;
	CTouchId = -1;
	
	DTouchId = -1;
	ETouchId = -1;
	FTouchId = -1;
	GTouchId = -1;
	WTouchId = -1;
	
	APressed = function(state)
	{
		switch(room)
		{
			case room_menu:
				
				if(state)
					keyboard_key_press(vk_enter);
				else
					keyboard_key_release(vk_enter);
				break;
				
			default:
				if(state)	
					keyboard_key_press(global.KeyA);
				else
					keyboard_key_release(global.KeyA);
				break;
		}
	};
	
	
	BPressed = function(state)
	{
		switch(room)
		{
			case room_menu:
				if(state)
					keyboard_key_press(global.KeyUp);
				else
					keyboard_key_release(global.KeyUp);
				break;
				
			case room_lobby:
				if(obj_lobby.state == 0)
				{
					if(state)
						keyboard_key_press(global.KeyB);
					else
						keyboard_key_release(global.KeyB);
				}
				else
				{
					if(state)
						keyboard_key_press(global.KeyLeft);
					else
						keyboard_key_release(global.KeyLeft);
				}
				break;
				
			default:
				if(state)
					keyboard_key_press(global.KeyB);
				else
					keyboard_key_release(global.KeyB);
				
				if(state)
					keyboard_key_press(global.KeyV);
				else
					keyboard_key_release(global.KeyV);
				break;
		}
	};
	
	
	CPressed = function(state)
	{
		switch(room)
		{
			case room_menu:
				if(state)
					keyboard_key_press(global.KeyDown);
				else
					keyboard_key_release(global.KeyDown);
				break;
				
			case room_lobby:
				if(obj_lobby.state == 0)
				{
					if(!state)
						break;
					
					with(obj_lobby)
					{
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
					}
				}
				else
				{
					if(state)
						keyboard_key_press(global.KeyRight);
					else
						keyboard_key_release(global.KeyRight);
				}
				break;
				
			case room_waiting:
				with(obj_menu_waiting)
				{
					if(!state)
						break;
						
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
				}
				break;
				
			default:
				if(state)
					keyboard_key_press(global.KeyC);
				else
					keyboard_key_release(global.KeyC);
				break;
		}
	};
	
	DPressed = function(state)
	{
		if(state)
			keyboard_key_press(global.KeyEm1);
		else
			keyboard_key_release(global.KeyEm1);
	}
	
	EPressed = function(state)
	{
		if(state)
			keyboard_key_press(global.KeyEm2);
		else
			keyboard_key_release(global.KeyEm2);
	}
	
	FPressed = function(state)
	{
		if(state)
			keyboard_key_press(global.KeyEm3);
		else
			keyboard_key_release(global.KeyEm3);
	}
	
	WPressed = function(state)
	{
		if(state)
			keyboard_key_press(global.KeyIdle);
		else
			keyboard_key_release(global.KeyIdle);
	}
	
	gToggle = false;
	GPressed = function(state)
	{
		gToggle = !gToggle;
		
		if(gToggle)
			keyboard_key_press(global.KeyPList);
		else
			keyboard_key_release(global.KeyPList);
	}
}