/// @description Maps a number from one range to another
/// @param value
/// @param current_lower_bound
/// @param current_upper_bound
/// @param desired_lower_bound
/// @param desired_upper_bound

//I added this script to map the joystick X/Y axis to be between -1 and 1 regardless of the radius used

return (((argument0 - argument1) / (argument2 - argument1)) * (argument4 - argument3)) + argument3;