// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_packet(_packet){
	
	var _command = buffer_read(_packet,buffer_string);
	
	if (_command == "POS"){
		//
	}else {
	show_debug_message("Networking event: " + string(_command));
	}
	switch(_command) {
		case "HELLO":
			HELLO(_packet);
		break;
		case "ROOM-DATA":
			ROOMDATA(_packet);
		break;	
		case "LEAVE":
			LEAVE(_packet);
		break;
		case "REGISTER":
			REGISTER(_packet);
		break;
		case "LOGIN":
			LOGIN(_packet);
		break;
		case "MONSTER-DEATH":
			MONSTERDROP(_packet);
		break;
		case "MONSTER-POS":
			MONSTERPOS(_packet);
		break;
		case "POS":
			POS(_packet);
		break;
		case "MESSAGE":
			MESSAGE(_packet);
		break;
		case "EXP-GAINS":
			list = buffer_read(_packet,buffer_string)
			var _list = json_parse(list);
			show_debug_message(string(_list))
			with(obj_player)
			{
				if name == _list.user {
					experiance += _list.exp;
				}
			}
		break;
		
		case "CAST-SPELL":
			CASTSPELL(_packet);
		break;
		case "PLAYER-UPDATE-GOLD":
			player_name = buffer_read(_packet,buffer_string);
			amount = buffer_read(_packet,buffer_u16);
			with(obj_player){
				if name == other.player_name {
					gold = other.amount;
				}
			}
		break;
		
		
	}
}


function MONSTERDROP (_packet){
	_room = buffer_read(_packet,buffer_string);
	_mons_item = buffer_read(_packet,buffer_string);
	_x = buffer_read(_packet,buffer_u16);
	_y = buffer_read(_packet,buffer_u16);
	var drop = asset_get_index(_mons_item);
	instance_create_depth(_x,_y,-100,drop);
}


function MONSTERPOS (_packet){
	monster_data = buffer_read(_packet,buffer_string);
	var monster_pos = json_parse(monster_data);
	mst_id = monster_pos.id;
	var new_x = monster_pos.pos.x;
	var new_y = monster_pos.pos.y;
	if(instance_exists(monster_template))
	{
		with (monster_template){
			if other.mst_id == monster_id 
			{
				target_x = new_x;
				target_y = new_y;
			}
		}
	}
}


function ROOMDATA (_packet)
{
	room_data = buffer_read(_packet,buffer_string);
	var monster = json_parse(room_data);
	show_debug_message(string(monster))
	var monster_hp = monster.stats.hp;
	var monster_maxHP = monster.stats.maxHP;
	var monster_x = monster.pos.x;
	var monster_y = monster.pos.y;
	var monster_name = monster.name;
	monster_id = monster.id;
	var monster_obj_name = monster.object
	var monster_obj = asset_get_index(monster_obj_name);
	var monster_found = false;
		
	with(monster_obj)
	{	
		if other.monster_id == monster_id
		{
			show_debug_message("monster found:"+ string(monster_name))
			target_x = monster_x;
			target_y = monster_y;
			hp = monster_hp;
			monster_found = true;
		}
	}
	if(!monster_found)
	{	
		show_debug_message("Creating monster: " + string(monster_name) )
		var _new_monster = instance_create_layer(monster_x,monster_y,"Instances",monster_obj)
		_new_monster.name = monster_name;
		_new_monster.monster_id = monster_id;
		_new_monster.hp = monster_hp;
		_new_monster.maxHP = monster_maxHP
	}
	
}

function POS (_packet)
{
	username = buffer_read(_packet,buffer_string);
	target_x = buffer_read(_packet,buffer_u16);
	target_y = buffer_read(_packet,buffer_u16);
	aim_dir = buffer_read(_packet,buffer_u16);
	player_speed = buffer_read(_packet,buffer_string);
	
	var speed_arr = string_split(player_speed,",")
	var x_ar = string_split(speed_arr[0],":");
	var y_ar = string_split(speed_arr[1],":");
	_xspd = real(x_ar[1]);
	_yspd = real(y_ar[1]);
	//speed_data = json_decode(player_speed)
	face = buffer_read(_packet,buffer_u16);
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
			xspd = other._xspd;
			yspd = other._yspd;
			aimDir = other.aim_dir;
			face = other.face;
			
		}
	}else {
		with(instance_create_layer(target_x,target_y,"Instances",obj_network_player)){
			name  = other.username;
		}
	}
}

function LEAVE (_packet)
{
	user = buffer_read(_packet,buffer_string);
	with(obj_network_player){
		if(name == other.user){
			instance_destroy();
		}
	}
}

function HELLO (_packet)
{
	server_time = buffer_read(_packet,buffer_string);
	show_debug_message("Welcome To the server @:" + server_time);
	room_goto(rm_menu);
}

function REGISTER (_packet)
{
	status = buffer_read(_packet,buffer_string)
	if (status == "TRUE") {
		show_message("Registration Succesfull, You can Login Now!")
	} else {
		show_message("Registration Failed.")
	}
}

function LOGIN (_packet)
{
	status = buffer_read(_packet,buffer_string)
	if (status == "TRUE") {
		global.chat = array_create(0);
		global.monsterList = array_create(0)
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
		character = buffer_read(_packet,buffer_string);
		gold = buffer_read(_packet,buffer_u16);
		sprite = get_character(character);
		goto_room = asset_get_index(target_room)
		show_debug_message("username: " + name + "target room:" + target_room + "target X:" + string(target_x) +"target Y:" +  string(target_y))
		room_goto(goto_room);
		//creaate and spawn player instance
		with(instance_create_layer(target_x,target_y,"Instances",obj_player)){
			name  = other.name;
			sprite = other.sprite;
			gold = other.gold;
		}
	} else {
		show_message("Login Failed.")
	}
}

function MESSAGE (_packet)
{
	username = buffer_read(_packet,buffer_string);
	playerMessage = buffer_read(_packet,buffer_string);
	ds_list_add(global.senders,username);
	ds_list_add(global.messages,playerMessage);
	array_push(global.chat,playerMessage);
	if (instance_exists(obj_network_player)) {
        with (obj_network_player) {
            if (name == other.username) { // Use 'other' to refer to the calling instance
                chat_message = other.playerMessage;
				message_timer = 180;
            }
        }
    }
	if (ds_list_size(global.senders) > 100 )
	{
		ds_list_delete(global.senders,100)
		ds_list_delete(global.messages,100)
	}
}

function CASTSPELL(_packet)
{
	object = buffer_read(_packet,buffer_string);
	username = buffer_read(_packet,buffer_string);
	spellDir = buffer_read(_packet,buffer_u16);
	target_x = buffer_read(_packet,buffer_u16);
	target_y = buffer_read(_packet,buffer_u16);
	var obj = asset_get_index(object);		
	var spell_instance = instance_create_depth(target_x,target_y,depth-100,obj);
	with(spell_instance)
		{
			dir = other.spellDir;
			user = other.username;
		}
};