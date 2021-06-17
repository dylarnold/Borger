/// @description Insert description here
// You can write your code in this editor
randomize();
list = ds_list_create();
winResult = "";
msg_start = "You made a\n";
msg = "";
msg_end = "borger!"
showMessage = false;

msg_start_goal = "Can I get a\n";
msgGoal = "";
msg_end_goal = "borger, please?";
showMessageGoal = true;
// Create randomized burger goal!
randomize();


var _num = irandom_range(3, 7);
orderGoal = [];
repeat(_num)
{
	var _choose = choose("bottom bun", "lettuce", "patty", "tomato", "top bun");
	array_push(orderGoal, _choose);
	msgGoal += _choose + ", ";
}

//oCustomer_1.lines[0] = sndCanIGet;
//var _snd
//for (var i=0; i < array_length(orderGoal); i++)
//{
//	var _str = orderGoal[i];
//	msgGoal += _str + ", ";

//}





