/// @description 
if mouse_check_button_pressed(mb_left) and !oStacker.grabbing
{
	if position_meeting(mouse_x, mouse_y, self)
	{
		var _veg = instance_create_layer(x, y, "Instances", object);
		
		with _veg
		{
			grabbed = true;
			oStacker.grabbed_id = _veg;
			oStacker.grabbing = true;
			diffX = mouse_x - other.x;
			diffY = mouse_y - other.y;
		}
	}
}