/*
/// @description General movement
if(shockedTimer <= 0)
{
	scr_move_basic();
}
else
{
	dashing = 0;
	isBoosting = false;
	isLookingDown = false;
	isLookingUp = false;
	isAttacking = false;
	isJumping = false;
	gspd -= min(abs(gspd), acc) * sign(gspd); 
	xspd -= min(abs(xspd), acc) * sign(xspd); 
	shockedTimer--;
	hurttime = 60 * 2;
	ringsSpawn = 0;
}

scr_collision_basic();

if(reviveObj != noone)
{
	reviveObj.x = x;
	reviveObj.y = y - 40;
	reviveObj.master_id = obj_netclient.nid;
}

if(redRingTimer > 0)
{
	if(redRingTimer == 1)
	{
		audio_stop_sound(mus_mindfuck);
		instance_destroy(obj_redring_screen);
	}
	
	redRingTimer--;
}

if(hurttime > 0)
	hurttime--;
	
if(hurttime > 0)
	return;

if(hp <= 0 && revivalTimes < 2)
	return;

if(bounceTimer > 0)
	return;

var list = ds_list_create();
instance_place_list(x, y, obj_player_puppet, list, false);

for(var i = 0; i < ds_list_size(list); i++)
{
	var inst = list[| i];
	if(inst.isDemonized && inst.visible && (inst.state == JUMP || inst.state == SPIN) && !isAttacking)
	{
		if(inst.character == CHARACTER_EGGMAN || inst.character == CHARACTER_AMY || inst.character == CHARACTER_SALLY)
			continue;
			
		if(revivalTimes >= 2)
			continue;
			
		if(inst.character == CHARACTER_EXE && inst.exeCharacter == 1 && inst.slimeMode)
			continue;
			
		var dmg = (isJumping || isSpinning) ? 0 : 20;
		var dirX = -sign(inst.x - x) * 3;
		var dirY = dmg == 0 ? -sign(inst.y - y) * 4 : -4;
		
		scr_player_hurt(dmg, dirX, dirY, (isJumping || isSpinning) ? snd_buble : snd_hurt, spr_blood2, true);	
		
		if(hp <= 0 && inst.revivalTimes >= 2)
		{
			var pak = cpacket_tcp(PacketType.CLIENT_MERCOIN_BONUS, true);
			buffer_write(pak, buffer_u16, inst.master_id);
			buffer_write(pak, buffer_u8, 4);
			send_server_tcp(pak);
		}
		
		if(dmg > 0 && hurttime >= 0)
		{
			obj_level.bloodFade = 0.4;
			
			if(inst.character == CHARACTER_EXE)
				scr_exe_checkwin();
			
			var buffer = cpacket_tcp(PacketType.CLIENT_STATS_REPORT);
			buffer_write(buffer, buffer_u8, 2);
			buffer_write(buffer, buffer_u16, inst.master_id);
			buffer_write(buffer, buffer_u16, 20);
			buffer_write(buffer, buffer_u16, hp);
			send_server_tcp(buffer);
		}
		
		if(dmg <= 0 && bounceTimer <= -1)
			bounceTimer = 6;
	}
}
spinIndex += spinSpeed
if (spinIndex >= spinNumber)
    spinIndex -= spinNumber
ds_list_destroy(list);
*/

if (shockedTimer <= 0)
    scr_move_basic()
else
{
    spinCharging = 0
    isSpindashing = false
    justSpindashed = false
    isBoosting = false
    isLookingDown = false
    isLookingUp = false
    isAttacking = false
    isJumping = false
    gspd -= ((min(abs(gspd), acc)) * sign(gspd))
    xspd -= ((min(abs(xspd), acc)) * sign(xspd))
    shockedTimer--
    hurttime = 120
}
scr_collision_basic()
if (reviveObj != noone)
{
    reviveObj.x = x
    reviveObj.y = y - 40
    reviveObj.master_id = obj_netclient.nid
}
if (redRingTimer > 0)
{
    if (redRingTimer == 1)
    {
        audio_stop_sound(mus_mindfuck)
        instance_destroy(obj_redring_screen)
    }
    redRingTimer--
}
if (hurttime > 0)
    hurttime--
if (hurttime > 0)
    return;
if (hp <= 0 && revivalTimes < 2)
    return;
list = ds_list_create()
instance_place_list(x, y, obj_player_puppet, list, false)
for (i = 0; i < ds_list_size(list); i++)
{
    inst = ds_list_find_value(list, i)
    if (inst.isDemonized && inst.visible && (inst.state == 3 || inst.state == 12) && (!isAttacking))
    {
        if (inst.character == 3 || inst.character == 4 || inst.character == 6)
        {
        }
        else if (revivalTimes >= 2)
        {
        }
        else if (inst.character == 0 && inst.exeCharacter == 1 && inst.slimeMode)
        {
        }
        else
        {
            dmg = ((isJumping || isSpinning) ? 0 : 20)
            dirX = (-(sign(inst.x - x))) * 3
            dirY = (dmg == 0 ? ((-(sign(inst.y - y))) * 4) : -4)
            scr_player_hurt(dmg, dirX, dirY, ((isJumping || isSpinning) ? snd_buble : snd_hurt), spr_blood2, true)
            if (hp <= 0 && inst.revivalTimes >= 2)
            {
                pak = cpacket_tcp((88 << 0), true)
                buffer_write(pak, buffer_u16, inst.master_id)
                buffer_write(pak, buffer_u8, 4)
                send_server_tcp(pak)
            }
            if (dmg > 0 && hurttime >= 0)
            {
                if (inst.character == 0)
                    scr_exe_checkwin()
                buffer = cpacket_tcp((136 << 0))
                buffer_write(buffer, buffer_u8, 2)
                buffer_write(buffer, buffer_u16, inst.master_id)
                buffer_write(buffer, buffer_u16, 20)
                buffer_write(buffer, buffer_u16, hp)
                send_server_tcp(buffer)
                obj_level.bloodFade = 0.4
            }
            if (dmg <= 0 && bounceTimer <= -1)
                bounceTimer = 6
        }
    }
}
spinIndex += spinSpeed
if (spinIndex >= spinNumber)
    spinIndex -= spinNumber
ds_list_destroy(list)
