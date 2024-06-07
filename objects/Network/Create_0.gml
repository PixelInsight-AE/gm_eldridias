/// @description Insert description here
// You can write your code in this editor
// initialize the connection
//global.chat = array_create(1,"GAME SERVER UP MESSAGES HERE");
//global.senders = ds_list_create();
//global.messages = ds_list_create();

//ds_list_add(global.senders,"Server:");
//ds_list_add(global.messages,"Welcome To Eldridias");
saved_buffer = buffer_create(1,buffer_grow,1);
reading = 0;
cut_buffer = buffer_create(1,buffer_grow,1);

socket = network_create_socket(network_socket_tcp);
network_connect_raw(socket, "0.tcp.ngrok.io",16611);


show_debug_message("Network connected to Node Server");
