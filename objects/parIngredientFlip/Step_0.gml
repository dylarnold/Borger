/// @description 
if timer <= 0
{
	vSpeed += grav;

	x += hSpeed;
	y += vSpeed;
	image_angle += rotSpeed;
}
timer -= 1;

if timer <= -5.5*room_speed
{
	room_goto_next();
}
