/// @description Insert description here
// You can write your code in this editor
if grabbed
{
	if mouse_check_button(mb_left)
	{
		// Move stack self included

		for (var j = 0; j < array_length(array); j++)
		{
			with array[j]
			{
				x = mouse_x - diffX;
				y = mouse_y - diffY;
			}
		}
	}
}
else // Not grabbed
{
	// Delete array
	array = -1;
	
	// Populate list
	// (idea) add items to the list, sorted by Y value, (upon snapping to an object...
	// remove items from the list of the thing you clicked on's bottom neighbor, upon selection?)
	
	// Determine how far above you the ingredients go (slow. 1 cycle per pixel)
	var _z = 0;
	while place_meeting(x + (.5 * sprite_width), y - _z, parIngredient)
	{	
		_z += 1;
	}
	
	// Collision rectangle list 
	var _tempList = ds_list_create();
	var _stackSize = collision_rectangle_list(x, y, x + sprite_width, y - _z, parIngredient, false, false, _tempList, false);
	
	// Transfer list to array
	array = [];
	// only want "collisionproof" things in array
	var h = 0;
	var c = 0;
	while c < ds_list_size(_tempList)
	{
		if _tempList[|c].collisionproof == false
		{
			array[h] = _tempList[|c];
			h++;
			c++;
		}
		else
		{
			c++;
		}
	}
	// Delete _tempList
	ds_list_destroy(_tempList);
	
	// Sort array by members' y position. array_sort, BABY!
	array_sort(array, function(_id1, _id2) {
		return _id2.y - _id1.y;
		});
}
