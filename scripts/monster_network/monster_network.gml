function send_monster_hit(_id,_x,_y,_hit,_username) {
	var _safty_net = 0;
	var _hit_buffer = buffer_create(1,buffer_grow,1);
	buffer_write(_hit_buffer, buffer_string,"MONSTER-HIT");
	buffer_write(_hit_buffer,buffer_string,room_get_name(room));
	buffer_write(_hit_buffer,buffer_string,_username);
	buffer_write(_hit_buffer,buffer_s32,_id);
	buffer_write(_hit_buffer,buffer_s32,_x);
	buffer_write(_hit_buffer,buffer_s32,_y);
	buffer_write(_hit_buffer, buffer_s32,_hit);
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

function send_monster_death(_id,_x,_y,_hitList){
	//var _obj_string = object_get_name(_id);
	var _monster_death = buffer_create(1,buffer_grow,1);
	buffer_write(_monster_death,buffer_string,"MONSTER-DEATH");
	buffer_write(_monster_death,buffer_string,room_get_name(room));
	buffer_write(_monster_death,buffer_string, _id);
	buffer_write(_monster_death,buffer_s32, _x);
	buffer_write(_monster_death,buffer_s32, _y);
	buffer_write(_monster_death,buffer_string,_hitList);
	network_write(Network.socket,_monster_death);
	
	
}