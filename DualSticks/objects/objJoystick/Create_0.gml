//the main sprite for the object is the joystick itself
//I set a separate variable below for the spot where the finger touches

//set the max distance the joystick can receive input at
//best to make the sprite about twice this size
myRadius = 100;

//this variable controls if the joystick continues tracking a finger outside the range
//if true, it will track the finger until it gets picked back up once it had entered the range
//if false, it will stop tracking as soon as the finger is out of range
//if it does track it, the max range will still be only as far as the radius
RetainFinger = true;

//if -1, there is no finger retained, otherwise contains the finger we are still tracking
RetainedFingerNumber = -1;

//this is the sprite to use for the finger position
myFingerSprite = sprJoystickFinger

// x/y position of the joystick, this is in GUI space to match the fingers
// it doesn't matter where in the room the instance actually is
// it draws in GUI space based on this position
// it is expected that the object that creates the joystick will then set the position as well
myXPos = 0;
myYPos = 0;

//this is whether there is a finger down here
hasFinger = false;

//position of the finger(or last known)
fingerXPos = 0;
fingerYPos = 0;

//angle to the finger(good for moving or pointing in that direction)
angleToFinger = 0;

//X/Y values for the axes that function as if it was a joystick
//Min/Max of these will be -1 to +1 so it matches the gamepad GML functions
myXAxis = 0;
myYAxis = 0;

//distance to the finger from the center
distanceToFinger = 0;
