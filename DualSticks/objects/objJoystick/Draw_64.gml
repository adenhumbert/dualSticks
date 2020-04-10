//draw the joystick "container"
draw_sprite(sprite_index, 0, myXPos, myYPos);
draw_set_font(fntSmall);

//draw the joystick finger position, either in the middle, or in position
if(hasFinger)
	draw_sprite(myFingerSprite, 0, fingerXPos, fingerYPos);
else
	draw_sprite(myFingerSprite, 0, myXPos, myYPos);
	
//I draw the would be axes values as well below, in case you wanted to use those
//instead of 
draw_text(myXPos, myYPos + 150, "X: " + string(myXAxis));
draw_text(myXPos, myYPos + 200, "Y: " + string(myYAxis));
draw_text(myXPos, myYPos - 150, "F: " + string(RetainedFingerNumber));