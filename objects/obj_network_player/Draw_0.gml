/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_text(x- (string_width(name) / 2),y -42,name)

var _healthPercent = hp /maxHP;
var _hpImage = _healthPercent  * (sprite_get_number(sp_player_health) - 1);
draw_sprite(sp_player_health,_hpImage,x,y-sprite_height)