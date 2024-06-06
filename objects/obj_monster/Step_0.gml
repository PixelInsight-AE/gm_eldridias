//folowing enemy code
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



xspd = lengthdir_x(spd,dir);
yspd = lengthdir_y(spd,dir);



if place_meeting(x+xspd,y, obj_wall_invisible) || place_meeting(x+xspd,y, obj_enemy_template)
{
	xspd = 0;
}

if place_meeting(x,y+yspd, obj_wall_invisible) ||  place_meeting(x,y+yspd, obj_wall_invisible)
{
	yspd = 0;
}

x += xspd;
y += yspd;
event_inherited();


