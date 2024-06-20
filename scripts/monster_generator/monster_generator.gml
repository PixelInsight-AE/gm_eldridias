
global.MONSTER_ROOMS = {
	ml_rm_aragar: {
		possible_monsters: [obj_monster, obj_monster_ghoul],
		max_monsters: 5
	}
};
function monster_generator(_room){
	switch(_room) {
		case "rm_aragar":
			var _monster_list = generate_monster_list(_room);
			show_debug_message(_monster_list)
			break;
	}
}
function room_switch(_room){
	switch(_room) {
		case "rm_aragar":
		return global.MONSTER_ROOMS.ml_rm_aragar
		break;
	}
}

function generate_monster_list(_room) {
	show_debug_message("did run");
	var _monsterList = [];

	var _roomData = room_switch(_room);
	for (var i = 0; i < _roomData.max_monsters; i++) {
		var randomIndex = irandom(array_length(_roomData.possible_monsters) - 1);
		array_push(_monsterList, _roomData.possible_monsters[randomIndex]);
	}
	return _monsterList;
}

function irandom(max) {
	return floor(random(max + 1));
}


function get_room_data() {

}

