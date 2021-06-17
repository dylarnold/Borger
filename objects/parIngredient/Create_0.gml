/// @description Insert description here
// You can write your code in this editor
grabbed = false;
collisionproof = false;

diffX = 0;
diffY = 0;
snapRange = 60;

switch object_index
{
	case oBotBun:  ingredientID = "bottom bun"; break;
	case oLettuce: ingredientID = "lettuce";    break;
	case oPatty:   ingredientID = "patty"		break;
	case oTomato:  ingredientID = "tomato";     break;
	case oTopBun:  ingredientID = "top bun";    break;
	default:       ingredientID = "Default message: You forgot to give this object a string in the create event for parIngredient! Go fix it! :O :O"
}



// This is part of the step code, lol

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