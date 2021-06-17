/// @description 

// Inherit the parent event
event_inherited();
if doneness < donenessCooked
{
	if !sizzlin
	{
		image_index = 0; // FUCKING RAW
	}
	else
	{
		image_speed = .5
		if image_index < 3
		{
			image_index = 3
		}
	}
}
else if doneness < donenessBurnt
{
	image_index = 1; // FUCKING COOKED
}
else //( doneness >= donenessBurnt)
{
	image_index = 2; // FUCKING BURNT
	burnt = true;
}
sizzlin = false;


