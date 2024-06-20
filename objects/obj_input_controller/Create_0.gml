/// @description Insert description here
// You can write your code in this editor

global.rightKey = 0;
global.leftKey = 0;
global.upKey = 0;
global.downKey = 0;
global.castSpell = 0;
global.spellSwap = 0;
global.baseAttack = 0;


global.CHARACTERS = {
	warrior : {
		sprite : [WarriorRightIdle_64,WarriorUpIdle_64,WarriorLeftIdle_64,WarriorDownIdle_64],
		runSprite : [WarriorRightWalk_64,WarriorUpWalk_64,WarriorLeftWalk_64,WarriorDownWalk_64],
		attSprite : [WarriorRightAttack01_64,WarriorUpAttack01_64,WarriorLeftAttack01_64,WarriorDownAttack01_64],
		att1HB : [obj_warrior_right_att_1_hb,obj_warrior_up_att_1_hb,obj_warrior_left_att_1_hb,obj_warrior_down_att_1_hb],
		deathSprite : [WarriorRightDeath_64,WarriorUpDeath_64,WarriorLeftDeath_64,WarriorDownDeath_64]
	},
	sorceress:{
		sprite :[SorceressRightIdle,SorceressUpIdle,SorceressLeftIdle,SorceressDownIdle],
		runSprite : [SorceressRightRun,SorceressUpRun,SorceressLeftRun,SorceressDownRun],
		attSprite : [SorceressRightAttack01,SorceressUpAttack01,SorceressLeftAttack01,SorceressDownAttack01],
		deathSprite : [SorceressRightDeath,SorceressUpDeath,SorceressLefttDeath,SorceressUpDeath,],
		att1HB : [obj_warrior_right_att_1_hb,obj_warrior_up_att_1_hb,obj_warrior_left_att_1_hb,obj_warrior_down_att_1_hb],

	}
}