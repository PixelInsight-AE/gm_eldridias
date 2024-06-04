// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_packet(_packet){
	var _command = buffer_read(_packet,buffer_string);
	show_debug_message("Networking event: " + string(_command));
	switch(_command) {
		case "HELLO":
		server_time = buffer_read(_packet,buffer_string);
		show_debug_message("Welcome To the server @:" + server_time);
		room_goto(rm_menu);
		break;
		
		case "REGISTER":
			status = buffer_read(_packet,buffer_string)
			if (status == "TRUE") {
				show_message("Registration Succesfull")
			} else {
				show_message("Registration Failed.")
			}
		break;
		case "LOGIN":
			status = buffer_read(_packet,buffer_string)
			if (status == "TRUE") {		
				target_room = buffer_read(_packet, buffer_string);
				name = buffer_read(_packet, buffer_string);
				target_x = buffer_read(_packet, buffer_u16);
				target_y = buffer_read(_packet, buffer_u16);
			
				goto_room = asset_get_index(target_room)
				show_debug_message("username:" + name + "target room:" + target_room + "target X:" + string(target_x) +"target Y:" +  string(target_y))
				room_goto(goto_room);

			} else {
				
				show_message("Login Failed.")
			}
		break;
		
		case "POS":
		break;	
	}
}