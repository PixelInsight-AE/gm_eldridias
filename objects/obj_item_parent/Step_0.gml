/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,obj_player)
{
	add_item_inventory(item);
}

if (!isTimer) {
    timeLimit -= 1;
    if (timeLimit <= 0) {
        isTimer = true;
		if(instance_exists(id))
		{
			instance_destroy(id);
		}
    }
}