#macro SCARF_ATTACK BALANCING+1
#macro SCARF_AIR_ATTACK BALANCING+2
#macro SCARF_ZIPLINE BALANCING+3

if(!emotion)
	state = IDLE;

if(isDead)
{
	state = DEAD;
	return;
}

if(isAttacking)
{
	if(isGrounded)
		state = SCARF_ATTACK;
	else
		state = SCARF_AIR_ATTACK;
		
	return;
}

if(shockedTimer > 0)
{
	state = DEAD;
	return;
}

if(isHurt)
{
	state = HURT;
	return;
}

if(isZipline)
{
	if(isGrounded)
		isZipline = false;
	else
	{
		state = CREAM_ZIPLINE;
		return;
	}
}

if(isLookingUp)
{
	state = LOOKUP;
	return;
}

if(isLookingDown)
{
	state = LOOKDOWN;
	return;
}

if(isSpinning)
{
	state = SPIN;
	return;
}

if(abs(xspd) > 0 && isGrounded)
{
	if(abs(xspd) < 6)
		state = WALK;
	else
		state = RUN;
}

if(isOnEdge)
{
	state = BALANCING;
	return;
}

if (!isGrounded) //in air
{
	if(isJumping)
		state = JUMP;
	else
		state = FALL;
}

if isSpindashing
{
    state = 17
    return;
}