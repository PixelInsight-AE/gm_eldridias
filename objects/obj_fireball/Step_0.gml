//move the spells
xspd = lengthdir_x( spd,dir)
yspd = lengthdir_y( spd,dir)
x += xspd;
y += yspd;



if hitConfirm == true && enemyDestroy == true {destroy = true;};

if destroy == true 
{
	//vfx every time somethig destoys
	if place_meeting(x,y,obj_player or obj_network_player)
	{exit;}
	instance_destroy()
}

if place_meeting( x, y, obj_wall_invisible) 
{
	destroy = true;
}

if point_distance(xstart,ystart,x,y) > maxdist 
{
	destroy = true;
}

