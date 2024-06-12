global.Monster_List = {
	monster: obj_monster,
	walking_monster: obj_monster_walking
}


global.tmp_rm_aragar =  {
	max_monsters: 10,
	monsterList: [
	global.Monster_List.monster,
	global.Monster_List.monster,
	global.Monster_List.walking_monster
	]
}

show_debug_message(global.tmp_rm_aragar.max_monsters);