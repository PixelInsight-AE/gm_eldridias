if (!time_to_send) {
    send_monster_data -= 1;
    if (send_monster_data <= 0) {
        time_to_send = true;
		//room monster data
		//var monster_count = instance_number(obj_monster);
		//var walk_monster_count = instance_number(obj_monster_walking);
		//var _total = monster_count + walk_monster_count;
		//show_debug_message("Monster count : " + string(monster_count + walk_monster_count))
		//var _room_data = buffer_create(1,buffer_grow,1);
		//buffer_write(_room_data, buffer_string,"ROOM-LOAD");
		//buffer_write(_room_data, buffer_string,room_get_name(room));
		//buffer_write(_room_data, buffer_s32,1);
		//network_write(Network.socket,_room_data);
        send_monster_data = 60 * 1.5;
        time_to_send = false;
    }
}
