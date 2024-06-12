max_monsters = 10;
var _temp_buffer = buffer_create(1,buffer_grow,1);
buffer_write(_temp_buffer,buffer_string,"ROOM-LOAD");
buffer_write(_temp_buffer,buffer_string, room_get_name(room));
network_write(Network.socket, _temp_buffer);