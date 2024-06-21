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

//image_xscale = face;


if place_meeting(x+xspd,y, obj_wall_water) || place_meeting(x+xspd,y, obj_monster)
{
	xspd = 0;
}

if place_meeting(x,y+yspd, obj_wall_water) ||  place_meeting(x,y+yspd, obj_monster)
{
	yspd = 0;
}

target_x = x + xspd;
target_y = y + yspd;

x = lerp(prev_x,target_x,interp_factor);
y = lerp(prev_y,target_y,interp_factor);


prev_x = x;
prev_y = y;


face = round(dir/90);
if face == 4 
{
	face = 0
}
if xspd != 0 or yspd != 0
{
sprite_index = runSprite[face];
}
else
{
sprite_index = sprite[face];
}


if (!isTimer) {
    timeLimit -= 1;
    if (timeLimit <= 0) {
        isTimer = true;
		if(instance_exists(id)){
		send_monster_pos(x,y);}
        timeLimit = 15;
        isTimer = false;
    }
}




event_inherited();


