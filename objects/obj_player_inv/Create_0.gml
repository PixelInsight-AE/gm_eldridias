/// @description Insert description here
// You can write your code in this editor

//name,description,sprite,function
global.item_list = 
{	
	small_hp_potion : new item_constructor("Small HP Potion", "Recovers a small amout of hp",SmallHealthPotion,
	function(){
		obj_player.hp += 10;
		array_delete(inv,selected_item, 1);
	},obj_small_potion_health
	),
	small_mana_potion: new item_constructor("Small Mana Potion","Recovers a small amount of Mana",SmallManaPotion,function(){
		obj_player.mana +=10;
		array_delete(inv,selected_item, 1);

	},obj_small_potion_mana),
	small_pile_of_coins: new item_constructor("Pile Of Gold","Its a small pile of gold worth a good amount",PileOfCoins,function(){
		//handle this in the object it self
		return;
	},obj_pile_of_coins)
}


inv = array_create(0);
max_inv = 5;
selected_item = 0;

sep = 16;
screen_border = 32;