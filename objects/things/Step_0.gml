if (!time_to_send) {
    send_monster_data -= 1;
    if (send_monster_data <= 0) {
        time_to_send = true;
		show_debug_message(string(instance_number(obj_item_parent)))
        send_monster_data = 60 * 15;
        time_to_send = false;
    }
}