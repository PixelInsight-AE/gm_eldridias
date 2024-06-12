
if (!time_to_send) {
    send_monster_data -= 1;
    if (send_monster_data <= 0) {
        time_to_send = true;

		//room monster data
		
		var monster_count = instance_number(obj_monster);
		var walk_monster_count =instance_number(obj_monster_walking);
		
		show_debug_message("Monster count : " + string(monster_count + walk_monster_count))

			


        send_monster_data = 60 * 3;
        time_to_send = false;
    }
}
