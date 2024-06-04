// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function validate_credentials(_username,_password){
	if (string_length(_username) < 3 || string_length(_password) < 8) {
		return false;
	}
	return true;
}