/// @description Insert description here
// You can write your code in this editor
if (target_x > x) {x += 4}
if (target_x < x) {x -= 4} 
if (target_y > y) {y += 4} 
if (target_y < y) {y -= 4} 
message_timer -= 1;
if message_timer <= 0 {message_timer = 0};

damage_function(obj_monster,true);


if hp <= 0
{
	instance_destroy();
}