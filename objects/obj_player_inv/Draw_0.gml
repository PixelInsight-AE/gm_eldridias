/// @description Insert description here
// You can write your code in this editor
//for (var i = 0; i < array_length(inv); i++)
//{
//	var _cam_x = camera_get_view_x(view_camera[0]);
//	var _cam_y = camera_get_view_y(view_camera[0]);
//	var _xx = _cam_x + screen_border;
//	var _yy = _cam_y + screen_border;
//	var _sep = sep;
//	var _col = c_white;
	
//	draw_sprite(inv[i].sprite,0,_xx,_yy+_sep*i);
//	if selected_item == i {_col = c_yellow;};
//	draw_set_color(_col);
//	draw_text(_xx+16,_yy+ sep*i,inv[i].name);
//	draw_set_color(c_white)
//}

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var screen_border = 12;
var _sep = 32; // Separation between inventory items
var invX = _cam_x + camera_get_view_width(view_camera[0]) - screen_border; // Right corner
var invY = _cam_y + screen_border;

for (var i = 0; i < array_length(inv); i++) {
    var _col = c_white;
    draw_sprite(inv[i].sprite, 0, invX - 175, invY + _sep * i); // Adjust -16 to position the sprite correctly
    if (selected_item == i) {
        _col = c_yellow;
    }
    draw_set_color(_col);
    draw_text(invX-160, invY + _sep * i, inv[i].name);
    draw_set_color(c_white);
	if selected_item == i
	{
		draw_text_ext(invX-160,invY+_sep *array_length(inv),"Press 'E' to use:  "+ +inv[i].description,12,150)	
	}
}