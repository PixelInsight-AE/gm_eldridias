
if instance_exists(obj_textbox)
{
rightKey = 0;
leftKey = 0;
upKey = 0;
downKey = 0;
castSpell = 0;
spellSwap = 0;
baseAttack = 0;
}
else
{
rightKey = global.rightKey;
leftKey =  global.leftKey;
upKey =  global.upKey;
downKey =  global.downKey;
castSpell = global.castSpell;
spellSwap = global.spellSwap;
baseAttack = global.baseAttack;
}
message_timer -= 1;

if message_timer <= 0 {message_timer = 0};
if mana > maxMana { mana = maxMana; };
if hp > maxHP { hp = maxHP; };
if shootTimer > 0 {shootTimer--;}
switch(state) 
{
	case PLAYERSTATE.FREESTATE:
	player_move();
	break;
	case PLAYERSTATE.ATTACKSTATE:
	player_attack();
	break;
	case PLAYERSTATE.DEATHSTATE:
	player_death();
	break;
	
}


with (obj_trigger) {

	if(instance_exists(obj_player)){	
		var _dist_to_player = point_distance(x,y,obj_player.x,obj_player.y);
		if(_dist_to_player < 50)
		{
			other.is_trigger = true;
			break;
		}else {other.is_trigger = false}
	}
}

if(baseAttack){
	state = 1;
}
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
		
		_x_offset = 0;
		_y_offset = -20;
		
		//restirct spell cast range
		
		
		//get offset of spell cast
		if ((aimDir >= 0 && aimDir <= 90) || (aimDir >= 270 && aimDir <= 360)) {
			_x_offset = 20;
		} else {
			_x_offset = -20
		}
		buffer_write(_spellBuffer,buffer_string, "CAST-SPELL");
		buffer_write(_spellBuffer,buffer_string, spell_name);
		buffer_write(_spellBuffer,buffer_string, name);
		buffer_write(_spellBuffer,buffer_s32, _new_aim_dir);
		buffer_write(_spellBuffer,buffer_s32, x + _x_offset);
		buffer_write(_spellBuffer,buffer_s32, y + _y_offset);
		//send the buffer
		network_write(Network.socket,_spellBuffer);
		
	
	}
}



damage_function(obj_monster,true);
if hp <= 0 { state = PLAYERSTATE.DEATHSTATE; exit; }




