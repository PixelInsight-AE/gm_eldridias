/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
var _healthPercent = hp /maxHP;
var _hpImage = _healthPercent  * (sprite_get_number(sp_enemy_health) - 1);

draw_sprite(sp_enemy_health,_hpImage,x,y-sprite_height)