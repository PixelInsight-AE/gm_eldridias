function send_monster_hp(_name) {
	
	show_debug_message("sending monster hit" + string(_name))
	var _hit_buffer = buffer_create(1,buffer_grow,1);
	buffer_write(_hit_buffer, buffer_string,"MONSTER-HP");
	buffer_write(_hit_buffer,buffer_string,room_get_name(room));
	buffer_write(_hit_buffer,buffer_string,_name)
	buffer_write(_hit_buffer, buffer_s32, hp);
	show_debug_message(name);
	show_debug_message(string(hp));
	network_write(Network.socket,_hit_buffer);
};