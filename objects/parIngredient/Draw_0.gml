image_blend = c_white;
//draw_set_circle_precision(360);

//if grabbed
//{
//	draw_circle(x + sprite_width*0.5, y + sprite_height*0.5, snapRange, true);
//}

//var i = 0;
//while i < ds_list_size(list)
//{
//draw_text(x+sprite_width, y + sprite_height*.5 - (sprite_height*i), string(list[|i]))
//i+=1
//}

//draw_set_color(c_aqua);
//draw_circle(x + sprite_width*0.5, y + sprite_height*0.5, 2, false)
//draw_set_color(c_white);

//if object_index == oBotBun
//{
//	draw_text(100, 100, string(array));
//}

if position_meeting(mouse_x, mouse_y, id)
{
	image_blend = c_ltgray;
}
else
{
	image_blend = c_white;
}



if grabbed 
{
	// tele dodge stack
	for (var k = 0; k < array_length(array); k++)
	{
		with array[@ k]
		{
			x += 10000;
		}
	}
	
	var _near = instance_nearest(x - 10000, y, parIngredient) // nearest ingredient (the one you're gonna snap to)
	if _near != noone
	{
		if point_distance((x + (sprite_width * 0.5) - 10000), (y + sprite_height * 0.5), (_near.x + (_near.sprite_width * 0.5)), (_near.y + (_near.sprite_height * 0.5))) <= snapRange
		{
				var _X = x; // save position before snap
				var _Y = y;
					
				var dispX = _near.x + (_near.sprite_width - sprite_width)/2; // center alligns to _near
				var dispY = _near.array[@ array_length(_near.array)-1].y - offset;
							
				var _Xdiff = dispX - _X; // new position minus old position
				var _Ydiff = dispY - _Y;
				
				draw_set_alpha(0.4);
				
				if !point_in_rectangle(_near.x + _near.sprite_width*0.5, _near.y + _near.sprite_height*0.5, 720, 314, room_width, 465) // Don't draw snap ghosts over instances on the grill
				{
					draw_sprite(sprite_index, image_index, dispX, dispY);
					for (var p = 1; p < array_length(array); p++) // loop through each item in stack, except for 1st(itself)
					{
						with array[@ p]
						{
							draw_sprite(sprite_index, image_index, x + _Xdiff, y + _Ydiff);
						
						}
					}
				}
				draw_set_alpha(1);
		}
	}
	// tele return stack
	for (var k = 0; k < array_length(array); k++)
	{
		with array[@ k]
		{
			x -= 10000;
		}
	}
	
}
draw_self();