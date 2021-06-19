/// @description 
randomize();
image_speed = 0;
timer = 60
startX = x;
startY = y;
slideSpeed = 3;
y += choose(0, 300);
x += choose(0, 300, -300);
ordering = false;
startSound = false;
busy = false;
num = 0;
talking = true;
//lines[0] = sndCanIGet;
//var _snd
//for (var i=0; i < ds_list_size(oJudge.list_goal); i++)
//{
//	var _str = oJudge.list_goal[| i];
//	oJudge.msgGoal += string_delete(_str, 1, 1) + ", ";
	
//	switch oJudge.list_goal[| i]
//	{
//		case "oBotBun":
//			_snd = sndBotBun;
//			break;
//		case "oLettuce":
//			_snd = sndLettuce;
//			break;
//		case "oPatty":
//			_snd = sndPatty;
//			break;
//		case "oTomato":
//			_snd = sndTomato;
//			break;
//		case "oTopBun":
//			_snd = sndTopBun;
//			break;
//	}
//	lines[i+1] = _snd;
//}
//lines[i+1] = sndBurgerPlease;




sprite_index = choose(sCustomer_1, sCustomer_2, sCustomer_3, sCustomer_4, sCustomer_5, sCustomer_6, sCustomer_7, sCustomer_8, sCustomer_9);

while sprite_index == global.previousCustomer or sprite_index == global.previousCustomer2
{
	sprite_index = choose(sCustomer_1, sCustomer_2, sCustomer_3, sCustomer_4, sCustomer_5, sCustomer_6, sCustomer_7, sCustomer_8, sCustomer_9);
}
global.previousCustomer2 = global.previousCustomer;
global.previousCustomer = sprite_index; 


switch sprite_index
{
	case sCustomer_1: soundPack = global.spOne;
		image_xscale = .75;
		image_yscale = .75; break;
	case sCustomer_2: soundPack = global.spTwo; break;
	case sCustomer_3: soundPack = global.spThree; break;
	case sCustomer_4: soundPack = global.spFour; break;
	case sCustomer_5: soundPack = global.spFive; break;
	case sCustomer_6: soundPack = global.spSix; break;
	case sCustomer_7: soundPack = global.spSeven;
		image_xscale = .75;
		image_yscale = .75; break;
	case sCustomer_8: soundPack = global.spEight; break;
	case sCustomer_9: soundPack = global.spNine; 
		image_xscale = .9;
		image_yscale = .9; break;	
	//default : soundPack = global.spOne
}