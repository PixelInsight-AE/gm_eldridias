get_damage_create(20,true);

cursor_sprite = sp_cursor;
window_set_cursor(cr_none);



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

sprite[0] = hr_mage_right;
sprite[1] = hr_mage_up;
sprite[2] = hr_mage_left;
sprite[3] = hr_mage_down;






