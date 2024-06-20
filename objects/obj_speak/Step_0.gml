
var _dist_from_player = point_distance(x,y,obj_player.x,obj_player.y);
//if position_meeting(mouse_x,mouse_y,id)
if _dist_from_player < trigger_distance and keyboard_check_pressed(ord("E")) and !instance_exists(obj_textbox)
{
	create_text_box(text_id)
}