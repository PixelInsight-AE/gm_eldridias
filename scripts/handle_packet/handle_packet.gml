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
				global.chat = array_create(0);
				global.senders = ds_list_create();
				global.messages = ds_list_create();
				ds_list_add(global.senders,"SERVER:");
				ds_list_add(global.messages,"Welcome");
				array_push(global.chat,"Welcome To the Server");
				target_room = buffer_read(_packet, buffer_string);
				name = buffer_read(_packet, buffer_string);
				global.username = name;
				target_x = buffer_read(_packet, buffer_u16);
				target_y = buffer_read(_packet, buffer_u16);
			
				goto_room = asset_get_index(target_room)
				show_debug_message("username: " + name + "target room:" + target_room + "target X:" + string(target_x) +"target Y:" +  string(target_y))
				room_goto(goto_room);
				//creaate and spawn player instance
				
				with(instance_create_layer(target_x,target_y,"Instances",obj_player)){
					name  = other.name
				}
				
			} else {
				
				show_message("Login Failed.")
			}
		break;
		
		case "POS":
			username = buffer_read(_packet,buffer_string);
			target_x = buffer_read(_packet,buffer_u16);
			target_y = buffer_read(_packet,buffer_u16);
			found_player = -1;
			with(obj_network_player) {
				if(name == other.username)
				{
				other.found_player = id;
				break;
				}
			}
			if (found_player != -1) {
				with(found_player) {
				target_x = other.target_x;
				target_y = other.target_y;
				}
			}else {
				with(instance_create_layer(target_x,target_y,"Instances",obj_network_player)){
					name  = other.username;
				}
			}
		break;
		case "MESSAGE":
			username = buffer_read(_packet,buffer_string);
			playerMessage = buffer_read(_packet,buffer_string);
			msg = username + ":" + playerMessage
			show_debug_message(msg)
			ds_list_add(global.senders,username);
			ds_list_add(global.messages,msg);
			array_push(global.chat,msg);
		
			if (ds_list_size(global.senders) > 100 )
			{
				ds_list_delete(global.senders,100)
				ds_list_delete(global.messages,100)
			}
	
		break;
		//case "LEFTROOM": 
		//break;
		case "CAST-SPELL":
			object = buffer_read(_packet,buffer_string);
			username = buffer_read(_packet,buffer_string);
			spellDir = buffer_read(_packet,buffer_u16);
			target_x = buffer_read(_packet,buffer_u16);
			target_y = buffer_read(_packet,buffer_u16);
			var obj = asset_get_index(object);		
			var spell_instance = instance_create_depth(target_x,target_y,depth-100,obj);
			with(spell_instance)
			{
				dir = other.spellDir
			}
			
		break;
		
	}
}