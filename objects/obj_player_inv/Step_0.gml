/// @description Insert description here
// You can write your code in this editor
//selected_item = -1;

//for (var i = 0; i < array_length(inv); i++)
//{
//	var _xx = screen_border;
//	var _yy = screen_border+ sep* i;
//	if mouse_x > _xx && mouse_x < _xx+8 && mouse_y > _yy && mouse_y < _yy+8
//	{
//		selected_item = i;
//	}
//}


selected_item = -1;
var screen_border = 12;
var _sep = 32; // Separation between inventory items
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var invX = _cam_x + camera_get_view_width(view_camera[0]) - screen_border; // Right corner
var invY = _cam_y + screen_border;

// Check for selected item
for (var i = 0; i < array_length(inv); i++) {
    var _xx = invX - 190; // Adjust to position correctly
    var _yy = invY + _sep * i;
    if (mouse_x > _xx && mouse_x < _xx + 32 && mouse_y > _yy && mouse_y < _yy + 32) { // Adjust 32 for the item size
        selected_item = i;
    }
	if selected_item != -1 
	{
		if keyboard_check_pressed(ord("E")) 
		{
			inv[selected_item].effect();
		}
	}
}


