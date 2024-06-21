/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,obj_player){
	//obj_player.gold += 100;
	
	//send server what to update gold, sever validates then sends back to updtate player
	
	player_update_gold(100);
	instance_destroy();
}