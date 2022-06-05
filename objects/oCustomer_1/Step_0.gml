

// slide into frame	
if x != startX
{
	x = lerp(x, startX, lerpx);
	lerpx += 1 / (room_speed*2);
}
	
if y != startY
{
	y = lerp(y, startY, lerpy);
	lerpy += 1 / (room_speed*2);
}
else if !busy // if oCustomer1 has returned to startY and is not saying audio lines
{
	if x == startX and y == startY
	{
		global.orderReady = true;
		busy = true; // saying audio lines
		readyForNextLine = true; // completed previous audio line, ready for next
		num = 0;
		lines = -1;
		// ***
		if oJudge.showMessage == false
		{
			lines[0] = soundPack.opening.file;
			var _snd
			for (var i = 0; i < array_length(oJudge.orderGoal); i++)
			{	
				switch oJudge.orderGoal[i]
				{
					case "bottom bun":
						_snd = soundPack.botBun.file;
						break;
					case "lettuce":
						_snd = soundPack.lettuce.file;
						break;
					case "patty":
						_snd = soundPack.patty.file;
						break;
					case "tomato":
						_snd = soundPack.tomato.file;
						break;
					case "top bun":
						_snd = soundPack.topBun.file;
						break;
					default: 
						_snd = sndYeah1;
				}
				lines[i+1] = _snd;
			}
			lines[i+1] = soundPack.closing.file;
		}
	}
}

if busy //ordering
{
	if readyForNextLine
	{
		if num < array_length(lines) // if not all lines have been said
		{
			talking = true;
			audioTimer = audio_sound_length(lines[num]) * room_speed;
			audio_play_sound(lines[num], 1, false);
			
			readyForNextLine = false;
		}
		else // num >= array_length(lines)
		{
			if position_meeting(mouse_x, mouse_y, oBell) and mouse_check_button_pressed(mb_left)
			{
				busy = false;
				//ordering = false;
			}
			talking = false;
		}
		num += 1;
	}
	if audioTimer > 0
	{
		audioTimer--;
		image_speed = 1;
	}
	else // trigger
	{
		readyForNextLine = true;	
		image_speed = 0;
		image_index = 0;
	}
}
