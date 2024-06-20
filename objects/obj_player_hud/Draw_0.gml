
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
	
	
	
	
	//--------------------------drawing main chat box -----------------------------------------------//
	draw_rectangle_color(_hudX,_hudY+500,_hudX+500,_hudY+600,c_gray,c_gray,c_gray,c_gray,false);
	
	
	
	
	
    //----------------------------------------- Draw chat messages-----------------------------------------------------//
    for (var i = startIdx; i < ds_list_size(global.senders); i++) {
        var displayIndex = i - startIdx;
        draw_text(_hudX, _hudY+500 + (displayIndex * 20), ds_list_find_value(global.senders, i) + " : " + ds_list_find_value(global.messages, i));
    }
	
	
	
	//----------------------------player health and level draw --------------------------------------------//
	var _healthPercent = obj_player.hp /obj_player.maxHP;
	var _hpImage = _healthPercent  * (sprite_get_number(sp_player_health) - 1);
	draw_sprite(sp_player_health,_hpImage,_hudX,_hudY);
    draw_set_color(c_black);
	draw_text(_camX, _camY, obj_player.name + "  Lvl:  " + string(obj_player.level));



    //-------------------------------------------- Draw the input box background-----------------------------------------//
    var inputBoxX = _hudX;
    var inputBoxY = _hudY+620;

    draw_set_color(c_gray);
    draw_rectangle(inputBoxX, inputBoxY, inputBoxX + chatBoxWidth, inputBoxY + 30, false);



    // --------------------------------------------Draw the input text--------------------------------------///
    draw_set_color(chatTextColor);
    draw_text(inputBoxX + 5, inputBoxY + 5, global.inputString + (inputActive ? "|" : "Press the tab key to start Typing"));
}
