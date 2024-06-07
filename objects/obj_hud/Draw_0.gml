/// @description Insert description here
// You can write your code in this editor
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _hpString = "HP:" + string(playerHP) + "/" + string(playerMaxHp)
var _border = 12;
var _hudX =_camX + _border;
var _hudY =_camY + _border;

//if instance_exists(obj_player)
//{
//	for(var i = 0; i < array_length(global.chat); i++)
//	{
//		if(array_length(global.chat) >= 0)
//		{
			
		
//			draw_text(_hudX,_hudY + (i+45),string(global.chat[i]));
//		}
//	}
//	draw_text(_camX,_camY,_hpString);
//	draw_set_color(c_gray);
//	draw_rectangle(_hudX, _hudY,chatBoxWidth,chatBoxHeight, true);
//	draw_set_color(chatTextColor);
//	draw_text(_hudX,_hudY+20, inputString + (inputActive ? "|" : ""));
	
//}


if instance_exists(obj_player) && variable_global_exists("chat") {
    // Draw chat messages
    for (var i = 0; i < ds_list_size(global.senders); i++) {
        draw_text(_hudX, _hudY + (i * 20), ds_list_find_value(global.senders,i)+" : "+ ds_list_find_value(global.messages,i));
    }
    for (var i = 0; i < array_length(global.chat); i++) {
        draw_text(_hudX, _hudY + (i * 20), global.chat[i]);
    }
	
    draw_text(_camX, _camY, _hpString);

    // Draw the input box background
    var inputBoxX = _hudX;
    var inputBoxY = _hudY + (ds_list_size(global.senders) * 20) + 10; // Position below the last chat message

    draw_set_color(c_gray);
    draw_rectangle(inputBoxX, inputBoxY, inputBoxX + chatBoxWidth, inputBoxY + 30, false);

    // Draw the input text
    draw_set_color(chatTextColor);
    draw_text(inputBoxX + 10, inputBoxY + 5, inputString + (inputActive ? "|" : ""));
}

