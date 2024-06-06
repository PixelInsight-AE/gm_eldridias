/// @description Insert description here
// You can write your code in this editor
//networdk update player pos

var pos_packet = buffer_create(1, buffer_grow, 1);

buffer_write(pos_packet, buffer_string, "POS");
buffer_write(pos_packet, buffer_s32, target_x);
buffer_write(pos_packet, buffer_s32, target_y);
network_write(Network.socket,pos_packet);