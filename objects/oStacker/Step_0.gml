/// @description

/* Notes:
*FIXED* It would be smarter to have each ingredient include itself in its own array.
*FIXED* Related: When releasing a stack of ingredients, they should ALL snap to the nearest, in-range, non-array-member. 
*FIXED* PROBLEM CAUSED: The stacked items don't teleport back if the grabbed ingredient snaps

*FIXED* Problem: Sometimes Ingredients are snapping to themselves because they're the only elegible ingredient in the room (tele dodge doesn't help)

*FIXED* Ingredients aren't being cleared from other ingredients' arrays after moving away.

*FIXED* Sometimes, when snapping to bottom, a stack will snap one or more squares too downward.

*FIXED* I need to not be able to pick up a new block when I have a block in my hand already.

*BAND-AID FIXED* PROBLEM: Sometimes the appropriate place to snap to is already occupied. Make it take this into consideration when it snaps.

QUANDRY:Would it be better to have _near = instance_nearest() somehow exclude objects in the _id.array instead of teleporting _id and _id.array away and back again after the scan?

DONE 11/30/2020: update to work with array rather than grid. Change snapping point to partially overlap other ingredient.

Problem with ingredients snapping too high in the air when snapping to ingredients. (Problem with stack definition?)

*/

if mouse_check_button_pressed(mb_left)
{
//*******
	if !grabbing // if not already grabbing
	{
		grabbed_id = instance_position(mouse_x, mouse_y, parIngredient); // scan id of clicked-on ingredient
		if grabbed_id != noone
		{
			grabbing = true;
		}
	}
	else // if already grabbing
	{ 
		if grabbed_id != noone
		{
			grabbing = false;
		}
	}
//******
	with grabbed_id
	{
		// if ingredient wasn't already grabbed (newly picked up)
		if !grabbed
		{
			// have each ingredient on the array record ITS difference in position from the cursor
			for (var i = 0; i < array_length(array); i++)
			{
				with array[@ i]
				{
					diffX = mouse_x - x;
					diffY = mouse_y - y;
				}
			}	
		}
		
		grabbed = true;
		for (var z = 0; z < array_length(array); z++)
		{
			with array[z]
			{
				collisionproof = true;
			}
		}
	}
}


if mouse_check_button_released(mb_left)
{
	if grabbed_id != noone // if you DID click on an ingredient
	{
		with grabbed_id // with clicked-on ingredient
		{	
			//*** IT'S SNAPPING TIME ***
			
			grabbed = false;
			
			for (var z = 0; z < array_length(array); z++)
			{
				with array[z]
				{
					collisionproof = false;
				}
			}
			other.grabbing = false;	
				

			
			if !point_in_rectangle(mouse_x, mouse_y, 720, 314, room_width, 465) // NO STACKING ON THE GRILL!!!!!
			{
				// tele dodge with the stack
				for (var k = 0; k < array_length(array); k++)
				{
					with array[@ k]
					{
						x += 10000;
					}
				}
				
				var _near = instance_nearest(x-10000, y, parIngredient); // scan nearest ingredient to where you used to be
				recent_near = _near;
				
				// check if nearest ingredient is in range
				if point_distance((x + (sprite_width * 0.5) - 10000), (y + sprite_height * 0.5), (_near.x + (_near.sprite_width * 0.5)), (_near.y + (_near.sprite_height * 0.5))) <= snapRange
				{
					// if it is... snap to top**********
					var _X = x; // save position before snap
					var _Y = y;
					
					x = _near.x + (_near.sprite_width - sprite_width)/2; // center alligns to _near
					y = _near.array[@ array_length(_near.array)-1].y - offset;
							
					var _Xdiff = x - _X; // new position minus old position
					var _Ydiff = y - _Y;
					for (var p = 1; p < array_length(array); p++) // loop through each item in stack, except for 1st(itself)
					{
						with array[@ p]
						{
							x += _Xdiff;	// OMG i think this works
							y += _Ydiff;	
						}
					}
					
					// Snapping to bottom REMOVED
				
				}
				else // if nearest ingredient is NOT in range (teleport back)
				{	// tele return array 
					for (var l = 0; l < array_length(array); l++)
					{
						with array[@ l]
						{
							x -= 10000;
						}
					}		
				}
			}
			
			if position_meeting(mouse_x, mouse_y, oTrashCan)
			{
				audio_play_sound(sndTrash, 1, false);
				for (var l = 0; l < array_length(array); l++)
				{
					with array[@ l]
					{
						instance_destroy();
					}
				}	
			}
		}
	}
}
with parIngredient
{
	depth = y
}