/// @description Insert description here
// You can write your code in this editor
textbox_x = camera_get_view_x(view_camera[0]) + RESOLUTION_W/4;
textbox_y = camera_get_view_y(view_camera[0]) + RESOLUTION_H/2;
accept_key = keyboard_check_pressed(ord("E"));
if !setup 
{
	setup = true;
	//set font
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	for (var i = 0; i < page_number; i++){
		
		text_length[i] = string_length(text[i]);
		text_x_offset[i] = 48; 
	}
}


if draw_char < text_length[page]
{
	draw_char += text_speed;
	draw_char = clamp(draw_char,0,text_length[page])
}
if accept_key
{
	if draw_char == text_length[page] 
	{
		if page < page_number-1
		{
			page++;
			draw_char = 0;
		}
		else
		{
			//link to options
			if option_number > 0 
			{
				show_debug_message(string(options_link_id[option_pos]));
				create_text_box(options_link_id[option_pos]);
			}
			
			instance_destroy();
		}
		
	}
	else
	{
		draw_char = text_length[page];
	}
	
}


//-----------------------options-----------------------------//


if draw_char == text_length[page] and page == page_number - 1
{
	option_pos += keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos,0,option_number-1);
	
	
	var _op_space = 35;
	var _op_border = 14;
	for (var op = 0; op < option_number; op++){
		var _opt_w = string_width(option[op]) + _op_border*2;
		//drawing option box
		draw_sprite_ext(opt_sprite,0,textbox_x+text_x_offset[page],textbox_y - _op_space * option_number + _op_space*op,_opt_w/text_box_width,(_op_space-1)/text_box_height,0,c_white,1)
		
		//draw arrrow
		if option_pos == op
		{
			draw_sprite(text_box_selection,0,textbox_x,textbox_y - _op_space * option_number + _op_space*op)
		}
		
		
		//draw option text
		draw_text(textbox_x+text_x_offset[page],textbox_y - _op_space * option_number + _op_space*op+2,option[op]);
	}
}



//drawing textbox
text_box_width = sprite_get_width(txt_sprite);
text_box_height = sprite_get_height(txt_sprite);
draw_sprite_ext(txt_sprite,0,textbox_x,textbox_y, textbox_width/text_box_width,textbox_height/text_box_height,0,c_white,1);
draw_set_color(c_white)
draw_text(textbox_x+border,textbox_y+175,"Press 'E' To Continue.")
var _draw_text = string_copy(text[page],1,draw_char)
draw_text_ext(textbox_x + border, textbox_y + border,_draw_text,line_sep,line_width);