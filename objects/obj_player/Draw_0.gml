/// @description Insert description here
// You can write your code in this editor
draw_self();
if message_timer > 0
{
	draw_text(x-(string_width(chat_message)/2),y-100,chat_message);
}
draw_text(x- (string_width(name) / 2),y -65,name)
//var _healthPercent = hp /maxHP;
//var _hpImage = _healthPercent  * (sprite_get_number(sp_player_health) - 1);
//draw_sprite(sp_player_health,_hpImage,x -(sprite_width / 2),y-90)

if is_trigger == true {
		draw_text(x-(string_width("Press 'E' To Interact")/2),y-100,"Press 'E' To Interact");
}