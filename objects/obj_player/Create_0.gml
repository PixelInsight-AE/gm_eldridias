get_damage_create(20,true);

cursor_sprite = sp_cursor;
window_set_cursor(cr_none);

name ="";
chat_message = "";
message_timer = 0;
//fireball = obj_fireball;
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

weaponOffset = -5;


face = 3;

sprite[0] = sp_player_walk_rt;
sprite[1] = sp_player_walk_rt;
sprite[2] = sp_player_walk_lt;
sprite[3] = sp_player_walk_lt;




