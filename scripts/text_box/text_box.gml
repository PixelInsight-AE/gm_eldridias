

//this needs to find a better way but for now lets go with this
function global_text_switch(_id)
{
	switch(_id)
	{
		case "aragar_dungeon_sign":
		add_text_box("Its Dangerous To go alone....")
		add_text_box("Are you sure you want to enter?")
			add_text_options("Yea! Im Brave!","aragar_dungeon_sign_yes");
			add_text_options("Turn your back and flee like the coward you are.","aragar_dungeon_sign_no");
			break;
			case "aragar_dungeon_sign_yes":
				add_text_box("Are you Sure?");
				add_text_box("It is very dangerous?");
				add_text_options("I said i was brave...","aragar_dungeon_sign_confirm");
				add_text_options("Okay. I've changed my mind now.","aragar_dungeon_sign_no");
			break;
				case "aragar_dungeon_sign_confirm":
					//teleport into dungeon!
					add_text_box("okay....");
					with(instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_warp))
					{
						target_room = rm_pixel_path;
						target_x = 300;
						target_y = 300;
					}
				break
			case "aragar_dungeon_sign_no":
				add_text_box("RUN AWAY!")
			break;
		case "aragar_home_sign":
		add_text_box("Welcome To Aragar, WARNING!!! Stay away from the west side of the village.")
		add_text_box("Cemetary Closed after 6pm.")
		break;
		case "aragar_townhall_board":
		add_text_box("Find all the Latest jobs Here!")
		break;
		case "aragar_mayor":
		add_text_box("Welcome Adventure!")
		add_text_box("Please Make your self at home here in town. We have all the amenties and some *wink wink*")
		break;
	}
}

function add_text_options(_option,_link_id) 
{
	option[option_number] = _option;
	options_link_id[option_number] = _link_id;
	
	option_number++;
}

function create_text_box(_id){
	with (instance_create_depth(0,0,-999,obj_textbox))	{
		global_text_switch(_id)
	}
}

function add_text_box(_text){
	text[page_number] = _text;
	page_number++;
}
