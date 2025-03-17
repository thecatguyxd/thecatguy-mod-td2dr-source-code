timer++;

if (timer > 100) {
    y2 = lerp(y2, y2_target, move_speed);
    alpha2 = min(alpha2 + 0.03, 1);
}

var second_sprite_done = (abs(y2 - y2_target) < 1);

if (second_sprite_done && wait_timer < 85)
{  
    wait_timer++; 
}

if (wait_timer >= 85)
{  
    y3 = lerp(y3, y3_target, move_speed);
    alpha3 = min(alpha3 + 0.03, 1);
}

if (alpha3 > 0.5)
{  
    y1 = lerp(y1, y1_target + 20, move_speed);
    y2 = lerp(y2, y2_target + 40, move_speed);
}
