/// @description 

//draw_rectangle(oPlate.bbox_left, oPlate.bbox_bottom, oPlate.bbox_right, -500, true)

if global.orderReady == true
{
	if showMessage
	{
		draw_set_color(c_black);
		draw_text_ext(5, 15, msg_start + msg + msg_end, global.txtSep, global.txtW);
		draw_set_color(c_white);
		draw_text_ext(6, 16, msg_start + msg + msg_end, global.txtSep, global.txtW);
		draw_set_color(c_black);
	}


	if showMessageGoal
	{
	
		draw_set_color(c_black);
		draw_text_ext(675, 15, msg_start_goal + msgGoal + msg_end_goal, global.txtSep, global.txtW);
			
		draw_set_color(c_white);
		draw_text_ext(677, 17, msg_start_goal + msgGoal + msg_end_goal, global.txtSep, global.txtW);
		
	}
	draw_set_color(c_white);
}
//// draw winResult to scren
//draw_set_color(c_black);
//draw_text_ext(137, 350, winResult, global.txtSep, global.txtW);
//draw_set_color(c_white);
//draw_text_ext(138, 351, winResult, global.txtSep, global.txtW);