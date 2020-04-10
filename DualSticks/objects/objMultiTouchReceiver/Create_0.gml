//how many total Devices/Fingers are we checking for
global.FingerAmount = 5;

//initialize arrays
for (var i = 0; i < global.FingerAmount; i++)
{
	global.FingerDown[i] = false;
	global.FingerX[i] = 0;
	global.FingerY[i] = 0;
}
