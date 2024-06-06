// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damage_function(_damageOBJ,_iframes = false){
	
	if _iframes == true && iframeTimer > 0
	{
		iframeTimer--;
		
		if iframeTimer mod 4 == 0
		{
		
			if image_alpha == 1 
			{
				image_alpha = 0;
			} else {
				image_alpha = 1;
			}
		}		
		
		exit;
	}
	if _iframes
	{
		image_alpha = 1;
	}
	if place_meeting(x,y,_damageOBJ)
	{
		var _instList = ds_list_create();
	
		instance_place_list(x,y,_damageOBJ,_instList,false);
	
		var _listlen = ds_list_size(_instList);
		var _hitConfirm = false;
		for(var i = 0; i < _listlen;i++)
		{
		
			var _inst = ds_list_find_value(_instList,i);
		
			if _iframes == true || ds_list_find_index(damageList,_inst) == -1
			{
				if _iframes == false
				{
					ds_list_add(damageList,_inst);
				}
				hp -= _inst.dmg;	
				_hitConfirm = true;
				_inst.hitConfirm = true;	
			}
		}
		if _iframes == true && _hitConfirm
		{
			iframeTimer	= iframeNumber;
		}
	}


	if _iframes == false {
		if ds_exists(damageList, ds_type_list) {
            var _damageListSize = ds_list_size(damageList);

            for (var i = 0; i < _damageListSize; i++) {
                var _inst = ds_list_find_value(damageList, i);
                if !instance_exists(_inst) || !place_meeting(x, y, _inst) {
                    ds_list_delete(damageList, i);
                    i--;
                    _damageListSize--;
                }
            }
			//ds_list_destroy(_instList)

        } else {
            show_debug_message("Error: damageList does not exist or has been destroyed.");
        }
		//var _damageListSize = ds_list_size(damageList);

		//for (var i = 0; i < _damageListSize; i++)
		//{
		//	var _inst = ds_list_find_value(damageList, i);
		//	if !instance_exists(_inst) || !place_meeting(x,y,_inst)
		//	{
		//		ds_list_delete(damageList,i);
		//		i--;
		//		_damageListSize--;
		//	}
		//}
	}
}
	
	
function get_damage_create(_hp = 10, _iframes = false)
{
	hp = _hp;
	maxHP = _hp
	if _iframes == true
	{
		iframeTimer = 0;
		iframeNumber = 90;
	}
	if !_iframes
	{
		damageList = ds_list_create();
	}
}