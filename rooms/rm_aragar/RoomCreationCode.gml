max_monsters = 10;
var _mosnter_count = instance_number(monster_template);
var _temp_buffer = buffer_create(1,buffer_grow,1);
buffer_write(_temp_buffer,buffer_string,"ROOM-DATA");
buffer_write(_temp_buffer,buffer_string, room_get_name(room));
buffer_write(_temp_buffer,buffer_s32, 1);
network_write(Network.socket, _temp_buffer);

//


