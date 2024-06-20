if place_meeting(x,y,obj_player) and !instance_exists(obj_warp_screen) and keyboard_check_pressed(ord("E"))
{
	var _rn  = room_get_name(target_room);

	//send network data were leaving rooms
	var _inst = instance_create_depth(x,y,-9000,obj_warp_screen)
	_inst.target_x = target_x;
	_inst.target_y = target_y;
	_inst.target_room = target_room;	
	var test = buffer_create(1,buffer_grow,1);
	buffer_write(test,buffer_string,"WARP");
	buffer_write(test,buffer_string,_rn);
	buffer_write(test,buffer_s32,24);
	buffer_write(test,buffer_s32,24);
	network_write(Network.socket,test);
}	