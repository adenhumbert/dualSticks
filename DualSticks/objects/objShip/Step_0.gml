//--------------------------------------------------

//if movement joystick is active, set movement based on the angle and distance
if(moveJoystick.hasFinger)
{
	motion_set(moveJoystick.angleToFinger, moveJoystick.distanceToFinger / 10);
}
else
{
	hspeed = 0;
	vspeed = 0;
}

//keep ship inside the level
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

//turning-------------------------------------------------------

//if shooting joystick is active, turn ship in that direction
if(shootJoystick.hasFinger)
{
	image_angle = shootJoystick.angleToFinger;
}

//shooting----------------------------------------
//normally you could put this together with the turning stuff, but I like it separate
//just so its really easy to understand and modify

//if shooting joystick is active, shoot if possible, if not...not
if(shootJoystick.hasFinger)
{
	if(canShoot)
	{
		canShoot = false;
		alarm[0] = 10;
		var bulletX = x + lengthdir_x(64, shootJoystick.angleToFinger);
		var bulletY = y + lengthdir_y(64, shootJoystick.angleToFinger);
		var bullet = instance_create_depth(bulletX, bulletY, 0, objBullet);
		bullet.direction = shootJoystick.angleToFinger;
		bullet.speed = 10;
	}
}

