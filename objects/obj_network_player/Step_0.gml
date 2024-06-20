/// @description Insert description here
// You can write your code in this editor
//rightKey = global.rightKey;
//leftKey =  global.leftKey;
//upKey =  global.upKey;
//downKey =  global.downKey;
//castSpell = global.castSpell;
//spellSwap = global.spellSwap;

switch(state){
	case 1:
	break;
}

if (target_x > x) {x += 4}
if (target_x < x) {x -= 4} 
if (target_y > y) {y += 4} 
if (target_y < y) {y -= 4} 
message_timer -= 1;
if message_timer <= 0 {message_timer = 0};

damage_function(obj_monster,true);



//sprite control setting what position the sprite index showing left right up down
#region
	
if face == 4 
{
	face = 0
}
if xspd != 0 or yspd != 0
{
	sprite_index = runSprite[face];
}else
{
	sprite_index = sprite[face];
}

if hp <= 0
{
	instance_destroy();
}
xspd = 0
yspd = 0