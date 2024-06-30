/// @description Insert description here
// You can write your code in this editor
global.rightKey = keyboard_check(ord("D"));
global.leftKey = keyboard_check(ord("A"));
global.upKey = keyboard_check(ord("W"));
global.downKey = keyboard_check(ord("S"));
global.castSpell = mouse_check_button_pressed(mb_left);
global.spellSwap = mouse_check_button_pressed(mb_right);
global.baseAttack = keyboard_check_pressed(vk_space);
global.fullScreen = keyboard_check_pressed(vk_f11);
global.menu = keyboard_check_pressed(ord("M"));

if global.fullScreen {
	window_set_fullscreen(!window_get_fullscreen())
}