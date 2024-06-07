// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_messages(_msg){
var _tempBuff = buffer_create(1,buffer_grow,1);
buffer_write(_tempBuff,buffer_string,"MESSAGE")
buffer_write(_tempBuff,buffer_string,global.username)
buffer_write(_tempBuff,buffer_string,_msg)
network_write(Network.socket,_tempBuff);
}