//this is debug code that shows the position of all 5 fingers if they are down.
//Note that if you scroll outside the view, the first finger still shows inside
//GUI space, but the other 4 start getting values in room space.
//This bug is why multitouch works fine as long as you keep the view in the same
//screen, but as soon as you scroll around the extra touches still detect
//but in the wrong locations

var str = "";
draw_set_font(fntSmall);
for(var i = 0; i < global.FingerAmount; i++)
{
	str = string(i) + "|" + string(global.FingerDown[i]) + ": X " + string(global.FingerX[i])
		+ ": Y " + string(global.FingerY[i]);
	draw_text(20, 20 + (i * 30), str);
}