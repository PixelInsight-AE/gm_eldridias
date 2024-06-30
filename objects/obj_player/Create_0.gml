get_damage_create(20,true);

cursor_sprite = sp_cursor;
window_set_cursor(cr_none);
sprite = global.CHARACTERS.warrior;
is_trigger = false;

name ="";
chat_message = "";
message_timer = 0;
trigger_message = "";

state = PLAYERSTATE.FREESTATE;

spellList = global.playerSpellList;
spellIdx = 0;
selectedSpell = spellList[spellIdx];
shootTimer = 0;
shootCooldown = 9;

moveDir = 0;
moveSpd = 2;
xspd = 0;
yspd = 0;

centerYOffset = 12;
centerY = y + centerYOffset;
aimDir = 0;

level = 1;
experiance = 0;
gold = 0;

weaponOffset = -5;

face = 3;


player_data = {
	hp: hp,
	x: x,
	y: y,
	gold: gold,
	mana: mana,
	experiance: experiance,
	sprite: sprite
}
