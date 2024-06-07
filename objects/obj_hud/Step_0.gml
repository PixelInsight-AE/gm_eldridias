/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_player)
{
	playerHP = obj_player.hp
	playerMaxHp = obj_player.maxHP
}

/// @description Insert description here
// Step event
if inputActive 
	{
		global.rightKey = 0;
		global.leftKey = 0;
		global.upKey = 0;
		global.downKey = 0;
		global.castSpell = 0;
		global.spellSwap = 0 		
	}
	else
	{
		global.rightKey = keyboard_check(ord("D"));
		global.leftKey = keyboard_check(ord("A"));
		global.upKey = keyboard_check(ord("W"));
		global.downKey = keyboard_check(ord("S"));
		global.castSpell = mouse_check_button_pressed(mb_left);
		global.spellSwap = mouse_check_button_pressed(mb_right);


}
if (inputActive) {
	
	
	
    var key = keyboard_string;
    if (string_length(key) > 0) {
        if (string_length(inputString) < maxInputLength) {
            inputString += string_char_at(key, 1);
            keyboard_string = "";
        }
    }

    // Handle backspace
    if (keyboard_check_pressed(vk_backspace)) {
        if (string_length(inputString) > 0) {
            inputString = string_delete(inputString, string_length(inputString), 1);
        }
    }

    // Handle enter key
    if (keyboard_check_pressed(vk_enter)) {
        if (string_length(inputString) > 0) {
            if (array_length(global.chat) > maxMessages) {
                array_shift(global.chat);
            }
			
			//send data! here
			send_messages(inputString)
            inputString = "";
            inputActive = false; // Deactivate input after sending message
        }
    }
}
// Activate input on key press (you can use a different key if needed)
if (keyboard_check_pressed(vk_tab)) {
    inputActive = true;
}
