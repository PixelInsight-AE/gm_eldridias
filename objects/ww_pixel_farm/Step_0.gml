/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,obj_player) and !made_contact 
{		
		made_contact = true;	
		if made_contact
		{
			show_debug_message("we should port to farm")
			var test = buffer_create(1,buffer_grow,1);
			buffer_write(test,buffer_string,"WARP");
			buffer_write(test,buffer_string,"rm_pixel_path");
			buffer_write(test,buffer_s32,24);
			buffer_write(test,buffer_s32,24);
			network_write(Network.socket,test);
		}
}