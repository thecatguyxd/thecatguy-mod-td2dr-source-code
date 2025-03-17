function scr_scarf_special()
{
	
    if (attackTimer > 0)
        attackTimer--;

    if (global.playerControls && keyboard_check_pressed(global.KeyB) && attackTimer <= 0 && !isSpindashing && !isSpinning)
    {
        if (keyboard_check(global.KeyLeft))
            image_xscale = -1;
        else if (keyboard_check(global.KeyRight))
            image_xscale = 1;

        image_index = 0;
        attackSpeed = xspd;
        attackTimer = revivalTimes >= 2 ? 120 : 240;
        isAttacking = true;
        isJumping = false;
        isSpinning = false;
        audio_play_sound(snd_dash, 0, false);
        net_sound_emit(snd_dash);
    }

    if (isAttacking)
    {
        if (yspd > 0)
            yspd = isGrounded ? 0 : 2.5;

        if (isGrounded && abs(xspd) > 0 && floor(x) mod 4 == 0)
            net_quick_effect(x - 8 * sign(image_xscale), y + 20, spr_dust);
    }

    if (spinCooldown > 0)
        spinCooldown--;

    if (global.playerControls && isGrounded && isLookingDown && keyboard_check_pressed(global.KeyA) && (!isSpindashing) && spinCooldown <= 0)
    {
        image_index = 0;
        isSpindashing = true;
        isLookingDown = false;
        isOnEdge = false;
        audio_stop_sound(snd_spin_dash);
        audio_play_sound(snd_spin_dash, 0, false);
        net_sound_emit(snd_spin_dash);
        spinCharging = 33;

        isAttacking = false;
    }

    if (spinCharging <= 20)
        spinCharging = 20;
    else if (spinCharging >= 100)
        spinCharging = 100;

    if (spinCharging >= 20 && spinCharging <= 100)
        spinCharging--;

    if (isGrounded)
    {
        if (isSpindashing)
        {
            isLookingDown = false;
            isLookingUp = false;

            if (global.playerControls && keyboard_check_pressed(global.KeyA))
            {
                spinCharging += 30;
                audio_stop_sound(snd_spin_dash);

                if (spinSoundCount < 20)
                {
                    spinSoundCount++;
                }

                var pitch = 1.0 + (spinSoundCount * 0.05);

                if (pitch > 2.0) pitch = 2.0;

                var sound_id = audio_play_sound(snd_spin_dash, 0, false);
                audio_sound_pitch(sound_id, pitch);
            }

            if (global.playerControls && keyboard_check_released(global.KeyDown))
            {
                justSpindashed = true;
                alarm[1] = 60;
                isSpindashing = false;
                isSpinning = true;
                spinSoundCount = 0;
                spinCooldown = (revivalTimes >= 2 ? 410 : 820);

                if (image_xscale >= 1)
                    gspd = 0.2 * spinCharging;
                else if (image_xscale <= -1)
                    gspd = 0.2 * (-spinCharging);

                spinCharging = 0;
                audio_play_sound(snd_spin_end, 0, false);
            }
        }
    }

    if (global.playerControls && keyboard_check_pressed(global.KeyDown))
    {
        isJumping = true;
    }
}