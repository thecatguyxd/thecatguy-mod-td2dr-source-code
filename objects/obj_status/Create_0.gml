totalrounds = 0;
timeovers = 0;
gameleft = 0;

load = function(filename)

{
	var _buffer = buffer_load(filename);

	totalrounds = buffer_read(_buffer, buffer_u64);
	timeovers = buffer_read(_buffer, buffer_u32);
	gameleft = buffer_read(_buffer, buffer_u32);
	
	buffer_delete(_buffer);
}

save = function()
{
	try
	{
		if(file_exists($"{game_save_id}/4.bson"))
			file_rename($"{game_save_id}/4.bson", $"{game_save_id}/4.bson.bak");
	
		var _buffer = buffer_create(12, buffer_grow, 1);
	
		buffer_write(_buffer, buffer_u64, totalrounds);
		buffer_write(_buffer, buffer_u32, timeovers);
		buffer_write(_buffer, buffer_u32, gameleft);
		
		buffer_save(_buffer, $"{game_save_id}/4.bson");
		buffer_delete(_buffer);
	}
	catch(error)
	{
		show_message_async($"Failed to save file (4.bson) (report to dev):\n{error.longMessage}");
	}
}

if(!file_exists($"{game_save_id}/4.bson"))
{
	try
	{
		var _buffer = buffer_create(12, buffer_grow, 1);
	
		buffer_write(_buffer, buffer_u64, 0);
		buffer_write(_buffer, buffer_u32, 0);
		buffer_write(_buffer, buffer_u32, 0);
	
		//buffer_write(_buffer, buffer_u8, 0);
		
		buffer_save(_buffer, $"{game_save_id}/4.bson");
		buffer_delete(_buffer);
		
		load($"{game_save_id}/4.bson");
	}
	catch(error)
	{
		show_message_async($"Failed to save file (4.bson) (report to dev):\n{error.longMessage}");
	}
}
else
{
	try
	{
		load($"{game_save_id}/4.bson");
	}
	catch(error)
	{
		try
		{
			load($"{game_save_id}/4.bson");
		}
		catch(error)
		{
			show_message_async($"Save file (4.bson) appears to be corrupted (due to blackout or game's crash)\nThe game will now load a backup save.");
	
			try
			{
				if(file_exists($"{game_save_id}/4.bson.bak"))
				{
					load($"{game_save_id}/4.bson.bak");
					save();
				}
			}
			catch(error2)
			{
				show_message_async($"Backup file (4.bson.bak) seems to be corrupted too. Loading default configuration then!");
			}
		}
	}
}