// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function death_of_player(){
instance_create_depth(x,y,depth,obj_game_over);
instance_destroy(obj_player);
//game_end();
}