/// @description Insert description here
// You can write your code in this editor

if (focused)
{
	if(keyboard_key == vk_backspace) 
	{
	text = string_copy(text, 0,string_length(text)- 1)}
	else if (keyboard_key == vk_tab){
	 focused = false;
	}
	else
	{
		text += keyboard_lastchar;
	}
}

