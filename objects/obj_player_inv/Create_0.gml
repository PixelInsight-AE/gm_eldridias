/// @description Insert description here
// You can write your code in this editor
global.item_list = 
{	
	small_hp_potion : new item_constructor("Small HP Potion", "Recovers a small amout of hp",sp_mage_wand,
	function(){
		obj_player.hp += 10;
		array_delete(inv,selected_item, 1);
	}
	),
	small_mana_potion: new item_constructor("Small Mana Potion","Recovers a small amount of Mana",sp_iceball_unl,function(){
		obj_player.mana +=10;
		array_delete(inv,selected_item, 1);

	})
}


inv = array_create(0);
max_inv = 5;
selected_item = 0;

sep = 16;
screen_border = 32;