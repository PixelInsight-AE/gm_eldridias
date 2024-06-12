
function custom_pos_packet (t_x,t_y) {
	var pos_packet = buffer_create(1, buffer_grow, 1);
	buffer_write(pos_packet, buffer_string, "POS");
	buffer_write(pos_packet, buffer_s32, t_x);
	buffer_write(pos_packet, buffer_s32, t_y);
	network_write(Network.socket,pos_packet);
}


function add_item_inventory(_item) {
	if array_length(obj_player_inv.inv) < obj_player_inv.max_inv
	{
		array_push(obj_player_inv.inv,_item)
		instance_destroy();
	}
};
