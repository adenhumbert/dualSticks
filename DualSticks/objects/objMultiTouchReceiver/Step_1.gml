//loop through all the devices/fingers and if they down, set to true
//also set the X/Y position
for (var i = 0; i < global.FingerAmount; i++)
{
	if(device_mouse_check_button(i, mb_left))//if the finger is down
	{
		global.FingerDown[i] = true;
		global.FingerX[i] = device_mouse_x_to_gui(i);
		global.FingerY[i] = device_mouse_y_to_gui(i);
	}
	else
	{
		global.FingerDown[i] = false;
		global.FingerX[i] = 0;
		global.FingerY[i] = 0;
	}
}
