function reset_variables() {
	left = 0;
	right = 0;
	up = 0;
	down = 0;
	_h_move = 0;
	_v_move = 0;
	obj_player.image_speed = 0;
}


function get_input() {
	if mouse_check_button(mb_left) {
		
		var _fireball = instance_create_depth(x,y,depth-100,fireball);
		with (_fireball) {
			dir = other.aimDir;
		}
	}
	
	if keyboard_check(ord("W")){
		up = 1;
		obj_player.image_speed = 3;
		custom_pos_packet(x,y);

	};
	if keyboard_check(ord("A")) 
	{
		left = 1;
		obj_player.image_speed = 3;
		custom_pos_packet(x,y);


	}
	if keyboard_check(ord("S")) {
		down = 1;
		obj_player.image_speed = 3;
		custom_pos_packet(x,y);

	}
	if keyboard_check(ord("D")) {
		right = 1;
		obj_player.image_speed = 3;
		custom_pos_packet(x,y);

	}
}
function calc_movement(){
	 _h_move = right - left; 
	 _v_move =  down - up;
	aim_dir = point_direction(x,y,mouse_x,mouse_y);

	if _h_move != 0 or _v_move != 0 {
		var _dir = point_direction(0,0,_h_move,_v_move);
		
		_h_move = lengthdir_x(walk_speed, _dir);
		_v_move = lengthdir_y(walk_speed, _dir);
		if place_meeting(x,y,obj_wall_water) {
			x += 0;
			y += 0;
		}
		
		x += _h_move;
		y += _v_move;
	}
	
}
function custom_pos_packet (t_x,t_y) {
	var pos_packet = buffer_create(1, buffer_grow, 1);
	buffer_write(pos_packet, buffer_string, "POS");
	buffer_write(pos_packet, buffer_s32, t_x);
	buffer_write(pos_packet, buffer_s32, t_y);
	network_write(Network.socket,pos_packet);
}

function collision() {
	var _target_x = x;
	var _target_y = y;
	
	x = xprevious;
	y = yprevious;
	
	var _dist_x = abs(_target_x - x);
	var _dist_y = abs(_target_y - y);
	repeat(_dist_x) {
		if !place_meeting(x + sign(_target_x - x), y , obj_wall_water) x += sign(_target_x - x);
	}
	repeat(_dist_y) {
		if !place_meeting(x ,y + sign(_target_x - y) , obj_wall_water) y += sign(_target_y - y);
	}
}


function animation()  {
	if keyboard_check(ord("W")) sprite_index = hr_mage_up;
	if keyboard_check(ord("S")) sprite_index = hr_mage_down;
	if keyboard_check(ord("A")) sprite_index = hr_mage_left;
	if keyboard_check(ord("D")) sprite_index = hr_mage_right;
		
}

