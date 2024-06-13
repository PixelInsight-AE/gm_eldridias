/// @description Insert description here
// You can write your code in this editor

//draw_self();
//draw_text(x- (string_width(name) / 2),y -42,name)

//var _healthPercent = hp /maxHP;
//var _hpImage = _healthPercent  * (sprite_get_number(sp_player_health) - 1);
//draw_sprite(sp_player_health,_hpImage,x,y-sprite_height)


draw_self();
if message_timer > 0
{
	show_debug_message("should be drawing")
	draw_text(x-(string_width(chat_message)/2),y-80,chat_message);
}
draw_text(x- (string_width(name) / 2),y -42,name)
var _healthPercent = hp /maxHP;
var _hpImage = _healthPercent  * (sprite_get_number(sp_player_health) - 1);
draw_sprite(sp_player_health,_hpImage,x,y-sprite_height)
