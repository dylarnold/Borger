/// @description 

if timer > 0
{
	timer -= 0.5
}
else
{
	if y > startY
	{
		y -= slideSpeed;
	}
	if x > startX
	{
		x -= slideSpeed;
	}
	if x < startX
	{
		x += slideSpeed
	}
	
	
	else if !busy// BUSY MEANS You are in the process of saying audio lines
	{
		if x == startX and y == startY
		{
			global.orderReady = true;
			busy = true;
			ordering = true;
			startSound = true;	
			timer = 0;
			num = 0;
			lines = -1;
			// ***
			if oJudge.showMessage == false
			{
				lines[0] = soundPack.opening.file;
				var _snd
				for (var i=0; i < array_length(oJudge.orderGoal); i++)
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
				//***
			}
		}
	}
}
if ordering
{
	if startSound
	{
		if num < array_length(lines)
		{
			talking = true;
			audioTimer = audio_sound_length(lines[num]) * room_speed;
			audio_play_sound(lines[num], 1, false);
			
			startSound = false;
		}
		else // num >= array_length(lines)
		{
			if position_meeting(mouse_x, mouse_y, oBell) and mouse_check_button_pressed(mb_left)
			{
				busy = false;
				ordering = false;
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
		startSound = true;	
		image_speed = 0;
		image_index = 0;
	}
}
