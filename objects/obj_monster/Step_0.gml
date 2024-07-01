

if(!variable_instance_exists(id,"prev_hp"))
{
	prev_hp = hp;
}
switch(state)
{
	//chase state
	case 0:
	if instance_exists(obj_player)
	{
	dir = point_direction(x,y,obj_player.x,obj_player.y);
	}
	spd = chaseSpeed;
	break;
	//shooting state
	case 1:
	if instance_exists(obj_player)
	{
	dir = point_direction(x,y,obj_player.x,obj_player.y);
	}
	spd = 0;
	
	
	break;
}

damage_function(obj_damage_enemy,false);
if hp < prev_hp
{
	prev_hp = hp;
}

if hp <= 0
{
	var _id = id
	var obj_name = object_get_name(object_index)
	
	var _x = round(x);
	var _y = round(y);
	var hit_map = json_encode(hitList);
	show_debug_message(string(hit_map))
	send_monster_death(obj_name,_x,_y,hit_map);
	instance_destroy();
}




xspd = lengthdir_x(spd,dir);
yspd = lengthdir_y(spd,dir);




if place_meeting(x+xspd,y, obj_wall_invisible) || place_meeting(x+xspd,y, obj_monster)
{
	xspd = 0;
}

if place_meeting(x,y+yspd, obj_wall_invisible) ||  place_meeting(x,y+yspd, obj_monster)
{
	yspd = 0;
}

x += xspd;
y += yspd;
event_inherited();

