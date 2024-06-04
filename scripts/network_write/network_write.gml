// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function network_write(_socket,_buffer){
	var packetSize = buffer_tell(_buffer)
	var buffPacket = buffer_create(1, buffer_grow, 1);
	
	buffer_write(buffPacket, buffer_u8, packetSize + 1);
	buffer_copy(_buffer,0,packetSize,buffPacket,1);
	buffer_seek(buffPacket, 0, packetSize + 1);
	
	network_send_raw(_socket, buffPacket, buffer_tell(buffPacket));

	buffer_delete(_buffer);
	buffer_delete(buffPacket);	
}



