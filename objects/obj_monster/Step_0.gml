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

damage_function(obj_damage_enemy);
if hp < prev_hp
{
	send_monster_hp(name)
	prev_hp = hp;
}

if hp <= 0
{
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


