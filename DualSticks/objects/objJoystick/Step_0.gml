//check all the fingers, if down, check distance and update the variables
//we will assume the player is only putting a single finger on each joystick
//   so once one is detected, we stop checking the rest
//note that multiple joysticks will still detect multiple fingers


//if retaining fingers that enter area, check only for that finger
//even if that finger is now out of range
if(RetainFinger)
{
	if(hasFinger)
	{
		var i = RetainedFingerNumber;
		//if the finger is still down
		if(global.FingerDown[i])
		{
			//now check the distance
			var distance = point_distance(global.FingerX[i], global.FingerY[i], myXPos, myYPos);
			//if distance is still inside the joystick
			
			//temporarily store the finger position in relation to the joystick center for calculations
			//this time we do this part ahead of the rest since we may need these numbers to calculate the clamping
			//in the below section we do this a little later in the code
			var fingerXPosDiff = global.FingerX[i] - myXPos;
			var fingerYPosDiff = global.FingerY[i] - myYPos;
			
			//get the angle from joystick center to the finger
			//note that I could have used the "real" positions of the joystick and finger had I chose
			angleToFinger = point_direction(0, 0, fingerXPosDiff, fingerYPosDiff);
			if (distance <= myRadius)
			{
				//store the real finger position
				fingerXPos = global.FingerX[i];
				fingerYPos = global.FingerY[i];
				distanceToFinger = distance;
			}
			else//we still track the finger, we just clamp the position to be as close as possible to the joystick
			{
				//a little vector math to put the finger at the same angle but within the joystick range
				fingerXPos = myXPos + lengthdir_x(myRadius, angleToFinger);
				fingerYPos = myYPos + lengthdir_y(myRadius, angleToFinger);
				
				//clamp the distance as well in case the objects use that to move faster/slower
				distanceToFinger = myRadius;
			}
			
			//the rest of this works the same as the other section below
			
			//temporarily store the finger position in relation to the joystick center for calculations
			var fingerXPosDiff = fingerXPos - myXPos;
			var fingerYPosDiff = fingerYPos - myYPos;
			
			//get the angle from joystick center to the finger
			//note that I could have used the "real" positions of the joystick and finger had I chose
			angleToFinger = point_direction(0, 0, fingerXPosDiff, fingerYPosDiff);
			
			//map the finger values to be between -1 and 1 and assign them to the variables
			myXAxis = Map(fingerXPosDiff, -myRadius, myRadius, -1, 1);
			//Y is flipped so since down is positive on screen but would be negative in axis space usually
			myYAxis = Map(fingerYPosDiff, -myRadius, myRadius, 1, -1);
			//and since we still have a finger we are tracking, we exit so we don't do the finger searching below
			exit;
		}
		//if the code made it here, the finger we were tracking is no longer touching at all
		//so we stop tracking it
		RetainedFingerNumber = -1;
	}
	//if the finger that we were tracking is no longer down, the code will continue below
	//and search for another finger within range
	
	//we don't have to put an else statement here because we simply exit the step event above
	//if we are still tracking the same finger
}

//start assuming there is no finger close by, the loop will then verify
hasFinger = false;

for(var i = 0; i < global.FingerAmount; i++)
{
	//if the finger is down in the first place
	if(global.FingerDown[i])
	{
		//now check the distance
		var distance = point_distance(global.FingerX[i], global.FingerY[i], myXPos, myYPos);
		if (distance <= myRadius)
		{
			//this finger is on the joystick(within the radius)
			hasFinger = true;
			
			//store the real finger position
			fingerXPos = global.FingerX[i];
			fingerYPos = global.FingerY[i];
			
			//temporarily store the finger position in relation to the joystick center for calculations
			var fingerXPosDiff = fingerXPos - myXPos;
			var fingerYPosDiff = fingerYPos - myYPos;
			
			//get the angle from joystick center to the finger
			//note that I could have used the "real" positions of the joystick and finger had I chose
			angleToFinger = point_direction(0, 0, fingerXPosDiff, fingerYPosDiff);
			
			//map the finger values to be between -1 and 1 and assign them to the variables
			myXAxis = Map(fingerXPosDiff, -myRadius, myRadius, -1, 1);
			//Y is flipped so since down is positive on screen but would be negative in axis space usually
			myYAxis = Map(fingerYPosDiff, -myRadius, myRadius, 1, -1);
			
			distanceToFinger = distance;
			//stop the for loop since we detected a close enough finger
			RetainedFingerNumber = i;
			exit;
		}
	}
}

//return the axis values to center if there is no longer any finger down for this joystick
//this only runs if the other code below fails since the code above does the "exit"
myXAxis = 0;
myYAxis = 0;