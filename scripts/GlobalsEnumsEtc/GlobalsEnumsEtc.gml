/// @function               move_follow(_object, _speed);
/// @param  {index} _object The Object to follow
/// @param  {real}  _speed  The speed to follow at
///********************* EXAMPLE^*********

/*
To do: 
make speech bubble for order. 
make scrolling text for order. 
make mouth animation synched to syllables of words being said. ( make each variable in the soundpack structs its own struct containing the variables for the sound file, syllable length, etc.
make the font look good



*/
global.font = font_add("Arial", 20, false, false, 32, 128,);
draw_set_font(global.font);

global.orderReady = false;

// text related
global.txtSep = 25;
global.txtW = 250;

enum FOOD
{
	TOPBUN,
	BOTBUN,
	TOMATO,
	LETTUCE,
	PATTY
}


global.spOne = {
	opening : 
	{
		file : sndSpencer1CanIGetA,
		syls : 7,
	},
	closing : 
	{
		file : sndSpencer1BorgerPlease,
		syls : 3,
	},
	
	topBun : 
	{ 
		file : sndSpencer1TopBun,
		syls : 2,
	},
		
	botBun : 
	{
		file : sndSpencer1BotBun,
		syls : 3,
	},
	
	tomato : 
	{
		file : sndSpencer1Tomato,
		syls : 3,
	},
	
	patty : 
	{
		file : sndSpencer1Patty,
		syls : 2,
	},
	
	lettuce: 
	{
		file : sndSpencer1Lettuce,
		syls: 2,
	},
	
	positiveReaction :
	{
		file : sndSpencer1PositiveReaction,
		syls : 2,
	},
	
	negativeReaction :
	{
		file : sndSpencer1NegativeReaction,
		syls : 5,
	},
}
global.spTwo = {
	opening :
	{
		file : sndSanya2CanIGetA,
		syls : 4,
	},
	
	closing :
	{	
		file : sndSanya2BorgerPlease,
		syls : 3,
	},
			
	topBun : 
	{
		file : sndSanya2TopBun,
		syls : 2,
	},
	
	botBun :
	{
		file : sndSanya2BottomBun,
		syls : 3,
	},
	
	tomato :
	{
		file : sndSanya2Tomato,
		syls : 3,
	},

	patty :
	{
		file : sndSanya2Patty,
		syls : 2,
	},
	

	
	lettuce: 
	{
		file : sndSanya2Lettuce,
		syls : 2,
	},

	
	positiveReaction : 
	{
		file : sndSanya2OhYes,
		syls: 2,
	},

	
	negativeReaction : 
	{
		file : sndSanya2OhNo,
		syls : 2,
	},

}
global.spThree = {
	opening :
	{
		file : sndSanya3HiCanIGetA,
		syls : 5,
	},
	
	closing : 
	{
		file : sndSanya3BorgerPlease,
		syls : 3,
	},
	
	
	topBun : 
	{
		file : sndSanya3TopBun,
		syls : 2,
	},
	
	botBun :
	{
		file : sndSanya3BottomBun,
		syls : 3,
	},
	
	
	tomato : 
	{
		file : sndSanya3Tomato,
		syls : 3,
	},
	
	patty : 
	{
		file: sndSanya3Patty,
		syls : 2,
	},
	
	lettuce : 
	{
		file : sndSanya3Lettuce,
		syls : 2,
	},
	
	
	positiveReaction : 
	{
		file: sndSanya3HaThanks,
		syls: 2,
	},
	
	negativeReaction : 
	{ 
		file: sndSanya3Uhh,
		syls: 1,
	}
}
global.spFour = {
	opening :
	{
		file : sndCanIGet,
		syls : 3,
	},
	
	closing : 
	{
		file : sndBurgerPlease,
		syls : 2,
	},
	
	
	topBun : 
	{
		file : sndTopBun,
		syls : 2,
	},
	
	botBun :
	{
		file : sndBotBun,
		syls : 3,
	},
	
	
	tomato : 
	{
		file : sndTomato,
		syls : 3,
	},
	
	patty : 
	{
		file: sndPatty,
		syls : 2,
	},
	
	lettuce : 
	{
		file : sndLettuce,
		syls : 2,
	},
	
	
	positiveReaction : 
	{
		file: sndSanya3Thanks,
		syls: 1,
	},
	
	negativeReaction : 
	{ 
		file: sndSanya4Blah,
		syls: 1,
	}
}
global.spFive = {
	opening : 
	{
		file: sndSanya4GurgleGurgle,
		syls: 6,
	},
	
	closing : 
	{
		file : sndSanya4BorgerPlease,
		syls : 3,
	},
	
	
	topBun : 
	{
		file : sndSanya4TopBun,
		syls : 2,
	},
	
	botBun : 
	{
		file : sndSanya4BottomBun,
		syls : 3,
	},
	
	
	tomato : 
	{
		file : sndSanya4Tomato,
		syls : 3,
	},
	
	patty : 
	{
		file : sndSanya4Patty,
		syls : 2,
	},
	
	lettuce: 
	{
		file : sndSanya4Lettuce,
		syls : 2,
	},
	
	
	positiveReaction : 
	{
		file : sndSanya4ThankYou,
		syls : 2,
	},
	
	negativeReaction : 
	{
		file : sndSanya4Blah,
		syls : 1,
	}
}
global.spSix = {
	opening : 
	{
		file: sndMom1MayIHaveA,
		syls: 3,
	},
	closing:
	{
		file: sndMom1BorgerPlease,
		syls: 3,
	},
	topBun:
	{
		file: sndMom1TopBun1,
		syls: 2,
	},
	botBun:
	{
		file: sndMom1BotBun,
		syls: 3,
	},
	tomato:
	{
		file: sndMom1Tomato,
		syls: 3,
	},
	patty:
	{
		file: sndMom1Patty,
		syls: 2,
	},
	lettuce:
	{
		file: sndMom1Lettuce,
		syls: 2,
	},
	positiveReaction:
	{
		file: sndMom1Thanks,
		syls: 1,
	},
	negativeReaction:
	{
		file: sndMom1NegativeReaction,
		syls: 4,
	}
	
}
global.spSeven = {
	opening : 
	{
		file: sndAaronGruffOpening,
		syls: 6,
	},
	closing:
	{
		file: sndAaronGruffClosing,
		syls: 1,
	},
	topBun:
	{
		file: sndAaronGruffTopBun,
		syls: 2,
	},
	botBun:
	{
		file: sndAaronGruffBotBun,
		syls: 2,
	},
	tomato:
	{
		file: sndAaronGruffTomato,
		syls: 3,
	},
	patty:
	{
		file: sndAaronGruffPatty,
		syls: 2,
	},
	lettuce:
	{
		file: sndAaronGruffLettuce,
		syls: 2,
	},
	positiveReaction:
	{
		file: sndAaronGruffPositiveReaction1,
		syls: 6,
	},
	negativeReaction:
	{
		file: sndAaronGruffNegativeReaction1,
		syls: 7,
	}
	
}
global.spEight = {
	opening : 
	{
		file: sndAaronPoshOpening,
		syls: 9,
	},
	closing:
	{
		file: sndAaronPoshClosing,
		syls: 3,
	},
	topBun:
	{
		file: sndAaronPoshTopBun,
		syls: 2,
	},
	botBun:
	{
		file: sndAaronPoshBotBun,
		syls: 3,
	},
	tomato:
	{
		file: sndAaronPoshTomato,
		syls: 3,
	},
	patty:
	{
		file: sndAaronPoshPatty,
		syls: 2,
	},
	lettuce:
	{
		file: sndAaronPoshLettuce,
		syls: 2,
	},
	positiveReaction:
	{
		file: sndAaronPoshPositiveReaction,
		syls: 4,
	},
	negativeReaction:
	{
		file: sndAaronPoshNegativeReaction,
		syls: 8,
	}
	
}
// 7, 8, 9

global.previousCustomer = noone;
global.previousCustomer2 = noone;