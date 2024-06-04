/// @description Insert description here
// You can write your code in this editor
event_inherited();


var is_valid_request = validate_credentials(txt_username.text,txt_password.text);
if(is_valid_request != true) {
	show_message("Error, Please enter valid credentails. Password must be 8 char")
	return;
}
var register_packet = buffer_create(1, buffer_grow, 1);

buffer_write(register_packet, buffer_string, "Register")
buffer_write(register_packet, buffer_string, txt_username.text);
buffer_write(register_packet, buffer_string, txt_password.text);

network_write(Network.socket,register_packet);
