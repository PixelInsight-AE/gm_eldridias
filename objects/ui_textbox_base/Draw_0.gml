/// @description Insert description here
// You can write your code in this editor
draw_self();

if(focused) {
	draw_rectangle(x,y,x+16 * image_xscale, y + 16 * image_yscale,2);
}

if(string_length(text) > 0 || focused) {
	draw_text(x,y,string(text));
} else {
	draw_text(x,y,string(placeholder));
}

