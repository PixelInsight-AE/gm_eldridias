function send_monster_hp(_id,_x,_y) {
	var _safty_net = 0;
	show_debug_message("sending monster hit" + string(_id))
	var _hit_buffer = buffer_create(1,buffer_grow,1);
	buffer_write(_hit_buffer, buffer_string,"MONSTER-HP");
	buffer_write(_hit_buffer,buffer_string,room_get_name(room));
	buffer_write(_hit_buffer,buffer_s32,_id);
	buffer_write(_hit_buffer,buffer_s32,_x);
	buffer_write(_hit_buffer,buffer_s32,_y);

	if (hp <= 0)
	{
		buffer_write(_hit_buffer, buffer_s32, 0);
	}else {
		buffer_write(_hit_buffer, buffer_s32, hp);
	}
	show_debug_message(name);
	show_debug_message(string(hp));
	network_write(Network.socket,_hit_buffer);
};

function send_monster_pos (_x, _y ) {
	var _monster_pos = buffer_create(1,buffer_grow,1);
	buffer_write(_monster_pos, buffer_string, "MONSTER-POS");
	buffer_write(_monster_pos, buffer_string, room_get_name(room));
	buffer_write(_monster_pos, buffer_s32, monster_id);
	buffer_write(_monster_pos, buffer_s32, _x);
	buffer_write(_monster_pos, buffer_s32, _y);
	network_write(Network.socket,_monster_pos);
}