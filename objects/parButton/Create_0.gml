/// @description Button Parent

interact = function() {
	if (active)
	{
		if (activeSound != noone) audio_play_sound(activeSound, 1, false);
		activate_button();
	}	
	else
	{
		if (inactiveSound != noone) audio_play_sound(inactiveSound, 1, false);
	}
}

activate_button = function() {
	show_debug_message("Default button message");
}