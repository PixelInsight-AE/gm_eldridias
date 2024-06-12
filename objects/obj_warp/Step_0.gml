if place_meeting(x,y,obj_player) and !instance_exists(obj_warp_screen)
{
	
	//send network data were leaving rooms
	var _inst = instance_create_depth(x,y,-9000,obj_warp_screen)
	_inst.target_x = target_x;
	_inst.target_y = target_y;
	_inst.target_room = target_room;	
}	