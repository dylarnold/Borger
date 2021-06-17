/// @description 
object = 0;
var _img;
switch foodID
{
	case FOOD.TOPBUN:  _img = 1;  object = oTopBun;  break;									  
	case FOOD.BOTBUN:  _img = 2;  object = oBotBun;  break;									  
	case FOOD.TOMATO:  _img = 3;  object = oTomato;  break;									  
	case FOOD.LETTUCE: _img = 4;  object = oLettuce; break;									  
	case FOOD.PATTY:   _img = 5;  object = oPatty;   break;
	default: _img = 0; break;	
}
image_index = _img;