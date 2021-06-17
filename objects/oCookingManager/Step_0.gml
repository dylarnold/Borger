// delete list entries
//for (var i = 0; i < ds_list_size(grillingPatties); i++)
//{
//	ds_list_delete(grillingPatties, i);
//}
while ds_list_size(grillingPatties) > 0
{
	ds_list_delete(grillingPatties, 0);
}
// populate list entries
var _num = collision_rectangle_list(720, 314, room_width, 465, oPatty, false, false, grillingPatties, true);

if ds_list_size(grillingPatties) > 0
{
	if !audio_is_playing(sndSizzle)
	{
		audio_play_sound(sndSizzle, 1, false);
	}
	
	
	for (var i = 0; i < ds_list_size(grillingPatties); i++)
	{
		with grillingPatties[|i]
		{
			if doneness < donenessBurnt
			{
				doneness += 1;
			}
			sizzlin = true;
		}
	}
}
else
{
	audio_stop_sound(sndSizzle);
}
