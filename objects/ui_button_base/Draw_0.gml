/// @description Insert description here
// You can write your code in this editor
if (hover) {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_red,0.7);
}
else {
	draw_self();
}
draw_set_color(c_black)
draw_text(x+80,y+15,string(text));