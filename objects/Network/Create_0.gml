/// @description Insert description here
// You can write your code in this editor
// initialize the connection

saved_buffer = buffer_create(1,buffer_grow,1);
reading = 0;
cut_buffer = buffer_create(1,buffer_grow,1);

socket = network_create_socket(network_socket_tcp);
network_connect_raw(socket, "127.0.0.1",8080);


show_debug_message("Network connected to Node Server");
