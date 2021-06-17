/// @description 
if point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)
{
	image_blend = c_ltgray;
}
else
{
	image_blend = c_white;
}
draw_self();