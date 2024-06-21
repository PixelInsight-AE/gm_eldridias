
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _hpString = "HP:" + string(playerHP) + "/" + string(playerMaxHp);
var _border = 12;
var _hudX = _camX + _border;
var _hudY = _camY + _border;

if instance_exists(obj_player) && variable_global_exists("senders") {
    // Define the maximum number of messages to display
    var maxMessages = 5;

    // Calculate the starting index to display only the last 'maxMessages' messages
    var startIdx = max(0, ds_list_size(global.senders) - maxMessages);
	
	
	// if(obj_player.is_trigger){
	// 	draw_text(x-(string_width("Press 'E' To Interact")/2),y-100,"Press 'E' To Interact");
	// }
	
	//--------------------------drawing main chat box -----------------------------------------------//
	//draw_rectangle_color(_hudX,_hudY+450,_hudX+500,_hudY+550,c_gray,c_gray,c_gray,c_gray,false);
	
	draw_sprite_ext(text_box_ui,0,_hudX,_hudY+450,15,3.75,0,c_white,.75)
	
	
	
    //----------------------------------------- Draw chat messages-----------------------------------------------------//
    //for (var i = startIdx; i < ds_list_size(global.senders); i++) {
	//	var maxString = 50;
    //    var displayIndex = i - startIdx;
	//	var message_text =  ds_list_find_value(global.senders, i) + " : " + ds_list_find_value(global.messages, i)
	//	//var truncated_message = string_delete(message_text,maxSting,)
    //    draw_text(_hudX, _hudY+450 + (displayIndex * 20),message_text);
	//	//draw_text_ext(_hudX,_hudY+450+(displayIndex*20),ds_list_find_value(global.senders, i) + " : " + ds_list_find_value(global.messages,i),12,chatBoxWidth);
    //}
	maxStringLength = 50;
	for (var i = startIdx; i < ds_list_size(global.senders); i++) {
    var displayIndex = i - startIdx;
    var message_text = ds_list_find_value(global.senders, i) + " : " + ds_list_find_value(global.messages, i);

    // Truncate the message if it exceeds the maximum length
    if (string_length(message_text) > maxStringLength) {
        message_text = string_copy(message_text, 1, maxStringLength) + "...";
    }

    // Draw the message
    draw_text(_hudX, _hudY + 450 + (displayIndex * 20), message_text);
	}
	

	
	
	//----------------------------player health and level draw --------------------------------------------//
	var _healthPercent = obj_player.hp /obj_player.maxHP;
	var _hpImage = _healthPercent  * (sprite_get_number(sp_player_health) - 1);
	draw_sprite(sp_player_health,_hpImage,_hudX,_hudY);
    draw_set_color(c_red);
	draw_text(_camX, _camY, obj_player.name + "  Lvl:  " + string(obj_player.level)+ " Gold: "+string(obj_player.gold));



    //-------------------------------------------- Draw the input box background-----------------------------------------//
    var inputBoxX = _hudX;
    var inputBoxY = _hudY+570;

    draw_set_color(c_gray);
	if(string_length(global.inputString) > 45){
	draw_sprite_ext(text_box_ui,0, inputBoxX,inputBoxY,15,1.5,0,c_white,.75);	
	}else{
	draw_sprite_ext(text_box_ui,0, inputBoxX,inputBoxY,15,1,0,c_white,.75);
	}


    // --------------------------------------------Draw the input text--------------------------------------///
    draw_set_color(chatTextColor);
    //draw_text(inputBoxX + 5, inputBoxY + 5, global.inputString + (inputActive ? "|" : "Press the tab key to start Typing"));
	draw_text_ext(inputBoxX+5,inputBoxY+5,global.inputString + (inputActive ? "|": "Press the tab key to start Typing"),15,chatBoxWidth);

	//----------draw spells and spell list ----- !! maybe dependent on class--------------------------////
	
	var number_of_spells = array_length(obj_player.spellList);
	
	draw_sprite_ext(text_box_ui,0,inputBoxX+500,inputBoxY,number_of_spells,1.5,0,c_white,.75);
	//draw spell sprites
	for(var i = 0; i<number_of_spells;i++){
		var spellX = inputBoxX + _border + 500 + i * 32;
		var spellY = inputBoxY + 24;
		
		if(obj_player.selectedSpell == global.playerSpellList[i])
		{
			draw_sprite_ext(global.playerSpellList[i].sprite,0,inputBoxX+_border+500+i*32,inputBoxY+24,1,1,0,c_white,1);

		}else{
			draw_sprite_ext(global.playerSpellList[i].sprite,0,inputBoxX+_border+500+i*32,inputBoxY+24,1,1,0,c_white,.5);
		}
	}
}

