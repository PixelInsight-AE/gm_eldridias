// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SpellConstructor(_object,_sprite,_cooldown, _damage,_numProjectiles = 1,_spread=1) constructor 
{

	object = _object;
	sprite = _sprite;
	cooldown = _cooldown;
	damage =  _damage;
	spread = _spread;
	numProjectiles = _numProjectiles;
}



global.spells = {
	fireBall : new SpellConstructor(
		obj_fireball,
		sp_fireball,
		9,
		1,
		1,
		1
	),
	iceBall : new SpellConstructor(
		obj_iceball, 
		sp_iceball,
		6,
		1,
		3,
		90
		),
	lightning: new SpellConstructor(
		obj_spell_lightning,
		sp_spell_lightning,
		3,
		1,
		12,
		360
	),
}



global.playerInventory = array_create(0);
global.playerSpellList = array_create(0);


array_push(global.playerSpellList,global.spells.fireBall);
array_push(global.playerSpellList,global.spells.iceBall);
array_push(global.playerSpellList,global.spells.lightning);