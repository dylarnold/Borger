/// @description Insert description here
// You can write your code in this editor

if position_meeting(mouse_x, mouse_y, oBell) and mouse_check_button_pressed(mb_left) // you clicked the bell
{
	if oCustomer_1.talking == false
	{
		if showMessage == false // (the text showing what burger you made is NOT showing already)
		{
			showMessage = true; // show the text
			showMessageGoal = false; // stop showing your goal!
			
			audio_play_sound(sndDing, 99, false);
			instance_create_layer(x, y, "Instances", oRecipeShower);
			
			if ds_exists(list, ds_type_list)
			{
				ds_list_destroy(list);
			}
			// make list
			list = ds_list_create();
			
			// add ingredients on the plate to the list
			collision_rectangle_list(oPlate.bbox_left, oPlate.bbox_bottom, oPlate.bbox_right, -8000, parIngredient, false, false, list, false);
		
			// convert list to an array for the purpose of sorting it
			var _size = ds_list_size(list);
			createdOrder = array_create(_size);
			for (var i = 0; i < _size; i++)
			{
				createdOrder[i] = list[|i];
			}
			
			// delete list
			if ds_exists(list, ds_type_list) {ds_list_destroy(list);}
			
			// define array sorting function (ascending y value) (index 0 has largest y value)
			var _ySort = function(_id1, _id2) {return _id2.y - _id1.y;};
			
			// sort array
			array_sort(createdOrder, _ySort);
			
			// generate msg string
			msg = "";
			for (var i = 0; i < array_length(createdOrder); i++)
			{
				var _id = createdOrder[i];
				if _id.ingredientID == "patty"
				{
					if _id.doneness < _id.donenessCooked or _id.doneness >= _id.donenessBurnt
					{
						_id.ingredientID = "shitty patty"
					}
				}
				msg += _id.ingredientID + ", ";
			}
			
			if msg == "" {msg = "nothing ";}
		
			// compare strings  
			if msg == msgGoal // it matched!
			{
				winResult = "Perfect!";
				audio_play_sound(oCustomer_1.soundPack.positiveReaction.file, 99, false);
			}
			else // it didn't match!
			{
				audio_play_sound(oCustomer_1.soundPack.negativeReaction.file, 1, false); 
				winResult = "Wrong Order!";
				
			}					
			// delete ingredients on plate
			for (var i = 0; i < array_length(createdOrder); i++)
			{
				with createdOrder[i]
				{
					instance_destroy();
				}
			}
			
		}
		else // if showmessage == true (the text showing what burger you made IS showing already)
		{
		
			instance_create_layer(x, y, "Instances", oJudge);
			instance_destroy();
			var xx = oCustomer_1.x;
			var yy = oCustomer_1.y;
			with oCustomer_1
			{
				instance_destroy();
			}
			instance_create_layer(xx, yy, "Customers", oCustomer_1);
		}
	}
}