//we actually create and control the two joysticks in this ship object
//this way we can use the same object, create two instances, and then
//we access each one for movement and for shooting

//create the two joystick
//remember that the position of the objects doesn't matter since we are using our own positions within GUI space
moveJoystick = instance_create_depth(0, 0, 0, objJoystick);
shootJoystick = instance_create_depth(0, 0, 0, objJoystick);

//set the needed values for the sticks
//I'm setting the positions assuming the GUI space is 1024x768 pixels
//the ship will be able to move around a bigger room despite the GUI staying the same

//this lets you move the joystick closer or further from the edges
var joystickdistancefromedges = 150;
with(moveJoystick)
{
	//you could change the radius and sprite from the defaults here if you wanted to as well
	myXPos = joystickdistancefromedges;
	myYPos = 768-joystickdistancefromedges-100;
}

with(shootJoystick)
{
	myXPos = 1024-joystickdistancefromedges;
	myYPos = 768-joystickdistancefromedges-100;
}

//variable to limit shooting
canShoot = true;