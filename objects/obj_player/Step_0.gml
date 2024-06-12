//declare input keys
#region
//movment
rightKey = global.rightKey;
leftKey =  global.leftKey;
upKey =  global.upKey;
downKey =  global.downKey;
castSpell = global.castSpell;
spellSwap = global.spellSwap;
//other controlls


//seting idle to no speed since theres no idle animation for player
//image_speed = 0;
if mana > maxMana { mana = maxMana; };
if hp > maxHP { hp = maxHP; };


//handle the spell swap
if (spellSwap) 
{
	var _spellList = global.playerSpellList;


	spellIdx++;

	if spellIdx >= array_length(_spellList) 
	{
		spellIdx = 0;
	}
	selectedSpell = _spellList[spellIdx];

}
image_speed = 0;
// if moving send data to server
if (rightKey or leftKey or upKey or downKey) {
	if instance_exists(obj_warp_screen)
	{
		exit;
	}else {	
		custom_pos_packet(x,y)
	}
	image_speed = 3;
	//also set image speed to default //theres a better way i know. 
}
//ensure the enemy can damage us
damage_function(obj_monster,true);

//check death
if hp <= 0
{
	//right now this function just closes the game.. do what ever extra stuff like menu select respawn...ect
	death_of_player();
	exit;
}

//throttles our speed at whitch we can shoot
if shootTimer > 0 {shootTimer--;}

//if we press the button and our timer isnt in cooldown

if(castSpell && shootTimer <= 0)
{	
	//reset timer
	shootTimer = selectedSpell.cooldown;
	
	// broadcast the spell to server
	for (var i = 0; i < selectedSpell.numProjectiles ; i++)
	{
		
		var _spell_dir = round(aimDir);
		
		
	
		//get obj string to send to server
		var spell_name = object_get_name(selectedSpell.object);
	
		var _spread = selectedSpell.spread;
		var _spreadDiv = _spread / max(selectedSpell.numProjectiles - 1,1);
		//creat packet to send
		var _spellBuffer = buffer_create(1,buffer_grow,1);
		var _new_aim_dir = round( aimDir - _spread/2 + _spreadDiv * i );
		//write the buffer
		_new_aim_dir = (_new_aim_dir + 360) mod 360;
		
		
		if _new_aim_dir > 45 and  _new_aim_dir < 90 {_new_aim_dir = 45;};
		if _new_aim_dir > 235  and _new_aim_dir < 270 {_new_aim_dir = 235;};
		if _new_aim_dir > 90  and _new_aim_dir < 135 {_new_aim_dir = 135;};
		if _new_aim_dir > 280  and _new_aim_dir < 315 {_new_aim_dir = 315;};
		
		buffer_write(_spellBuffer,buffer_string, "CAST-SPELL");
		buffer_write(_spellBuffer,buffer_string, spell_name);
		buffer_write(_spellBuffer,buffer_string, name);
		buffer_write(_spellBuffer,buffer_s32, _new_aim_dir);
		buffer_write(_spellBuffer,buffer_s32, x);
		buffer_write(_spellBuffer,buffer_s32, y);
		//send the buffer
		network_write(Network.socket,_spellBuffer);
		instance_create_depth(x,y,depth-100,selectedSpell.object);
	
	}
}

#endregion

//player movement
#region

//cool way in games to get what keys pressed. returns a number between 1 and 0 to calc angular movement
var _horizKey = rightKey - leftKey;
var _vertKey = downKey - upKey;


//getting the direction angle
moveDir = point_direction(0,0,_horizKey,_vertKey);


//set speed var and check distance
var _spd = 0;
var _inputLevel = point_distance(0,0,_horizKey,_vertKey);
// fine tune angular movement so its not faster
_inputLevel = clamp(_inputLevel,0,1);
_spd = moveSpd * _inputLevel;

//set the speed to move
xspd = lengthdir_x(_spd,moveDir);
yspd = lengthdir_y(_spd,moveDir);

//collision detection

if place_meeting( x + xspd ,y, obj_wall_water){
xspd = 0;
}
if place_meeting( x ,y+yspd, obj_wall_water){
yspd = 0;
}

//move the player
x+= xspd;
y+= yspd;


//sets player higher z-index
depth = -bbox_bottom;
#endregion


//player aim not using this since its part of a weapon. will tune this.
centerY = y + centerYOffset;


//getting aim direction to face the mouse at all times
aimDir = point_direction(x,centerY,mouse_x,mouse_y);


//sprite control setting what position the sprite index showing left right up down
#region
	
	face = round(aimDir/90);
	if face == 4 
	{
		face = 0
	}
	
	sprite_index = sprite[face];
	
#endregion