/// @description Insert description here
// You can write your code in this editor
if (hover) {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_grey,1.0);
}
else {
	draw_self();
}
draw_text(x,y,string(text));