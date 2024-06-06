//damage_function(obj_world_dmg);
get_damage_create(10)
//if (ds_exists(obj_world_dmg.damageList, ds_type_list)) {
//    damage_function(obj_world_dmg);
//} else {
//    show_debug_message("Error: obj_world_dmg.damageList does not exist.");
//}
damage_function(obj_world_dmg);

//death
if hp <= 0
{
	instance_destroy();
}