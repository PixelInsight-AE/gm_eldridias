// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function custom_quit() {
	var buffer = buffer_create(1,buffer_grow,1);
	buffer_write(buffer,buffer_string,"QUIT");
	network_write(Network.socket,buffer);
	game_end();
}