/// @description 
randomize();
image_speed = 0;

startX = x;
startY = y;
y2 = y + irandom_range(0, 300);
x2 = x + choose(300, -300);
x = x2;
y = y2;

readyForNextLine = false;
busy = false;
talking = true;

num = 0;

//for lerpin'
lerpx = 0;
lerpy = 0;
 
// Randomly choose which sprite to use
sprite_index = choose(sCustomer_1, sCustomer_2, sCustomer_3, sCustomer_4, 
sCustomer_5, sCustomer_6, sCustomer_7, sCustomer_8, sCustomer_9);


// END TESTING

// randomly choose again if you ended up as the previous 2 customers
while sprite_index == global.previousCustomer or sprite_index == global.previousCustomer2
{
	sprite_index = choose(sCustomer_1, sCustomer_2, sCustomer_3, sCustomer_4,
	sCustomer_5, sCustomer_6, sCustomer_7, sCustomer_8, sCustomer_9);
}
// track the previous 2 customers
global.previousCustomer2 = global.previousCustomer;
global.previousCustomer = sprite_index; 


// assign the appropriate soundpack based on sprite
switch sprite_index
{
	case sCustomer_1: soundPack = global.spOne;
		image_xscale = .75;
		image_yscale = .75; break;
	case sCustomer_2: soundPack = global.spTwo; break;
	case sCustomer_3: soundPack = global.spThree; break;
	case sCustomer_4: soundPack = global.spFour; break;
	case sCustomer_5: soundPack = global.spFive; break;
		y -= 50;
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
image_xscale = image_xscale * .85;
image_yscale = image_yscale * .85;
