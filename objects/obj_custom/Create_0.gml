randomize();

_buffer = {
    debugtools: false,
    streamermode: false,
    clockformat: false,
    oldjump: false,
    anticamping: true,
	music_volume: 1.0,
};

debugtools = _buffer.debugtools;
streamermode = _buffer.streamermode;
clockformat = _buffer.clockformat;
oldjump = _buffer.oldjump;
anticamping = _buffer.anticamping;
music_volume = _buffer.music_volume;

load = function(filename)
{
    var _bfr = buffer_load(filename);
    var _tmp = buffer_create(buffer_get_size(_bfr), buffer_fixed, 1);
    
    for(var i = 0; i < buffer_get_size(_bfr); i++)
        buffer_write(_tmp, buffer_u8, (buffer_read(_bfr, buffer_u8) ^ 69));
    
    buffer_seek(_tmp, buffer_seek_start, 0);
    var _json = buffer_read(_tmp, buffer_string);
    _buffer = json_parse(_json);
    buffer_delete(_bfr);
    buffer_delete(_tmp);
    
    debugtools = _buffer.debugtools;
    streamermode = _buffer.streamermode;
    clockformat = _buffer.clockformat;
    oldjump = _buffer.oldjump;
    anticamping = _buffer.anticamping;
    
    if (is_real(_buffer.music_volume)) {
        music_volume = clamp(_buffer.music_volume, 0, 1);
    } else {
        music_volume = 1.0;
    }
}

save = function()
{
    _buffer.debugtools = debugtools;
    _buffer.streamermode = streamermode;
    _buffer.clockformat = clockformat;
    _buffer.oldjump = oldjump;
    _buffer.anticamping = anticamping;
	_buffer.music_volume = music_volume;
    
    try
    {
        if(file_exists($"{game_save_id}/4.bin"))
            file_rename($"{game_save_id}/4.bin", $"{game_save_id}/4.bin.bak");
        
        var _json = json_stringify(_buffer, true);
        var _bfrIn = buffer_create(0, buffer_grow, 1);
        
        buffer_write(_bfrIn, buffer_string, _json);
        buffer_seek(_bfrIn, buffer_seek_start, 0);
        
        var _bfrOut = buffer_create(buffer_get_size(_bfrIn), buffer_fixed, 1);
        for(var i = 0; i < buffer_get_size(_bfrIn); i++)
            buffer_write(_bfrOut, buffer_u8, buffer_read(_bfrIn, buffer_u8) ^ 69);
        
        buffer_save(_bfrOut, $"{game_save_id}/4.bin");
        buffer_delete(_bfrIn);
        buffer_delete(_bfrOut);
    }
    catch(error)
    {
        show_message_async("Failed to save file (4.bin) (report to dev):\n" + error.longMessage);
    }
}

if(!file_exists($"{game_save_id}/4.bin"))
{
    save();
}
else
{
    try
    {
        load($"{game_save_id}/4.bin");
    }
    catch(error)
    {
        show_message_async("Save file (4.bin) appears to be corrupted. Loading backup.");
    
        try
        {
            if(file_exists($"{game_save_id}/4.bin.bak"))
            {
                load($"{game_save_id}/4.bin.bak");
                save();
            }
        }
        catch(error2)
        {
            show_message_async("Backup file (4.bin.bak) is also corrupted. Loading defaults.");
        }
    }
}
