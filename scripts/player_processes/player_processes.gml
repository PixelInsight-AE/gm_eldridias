enum PLAYERSTATE {
	FREESTATE,
	ATTACKSTATE,
	DEATHSTATE
}

function player_update_gold(_gold){
	var _player_buff = buffer_create(1,buffer_grow,1);
	buffer_write(_player_buff,buffer_string,"PLAYER-UPDATE-GOLD")
	buffer_write(_player_buff,buffer_s32,_gold);
	network_write(Network.socket,_player_buff);
}

function custom_pos_packet (t_x,t_y,_aim_dir,_player_xspd,_player_yspd,_face) {
	var speed_sting  = string("xspd:"+string(_player_xspd)+","+"yspd:"+string(_player_yspd));
	var pos_packet = buffer_create(1, buffer_grow, 1);
	buffer_write(pos_packet, buffer_string, "POS");
	buffer_write(pos_packet, buffer_s32, t_x);
	buffer_write(pos_packet, buffer_s32, t_y);
	buffer_write(pos_packet, buffer_s32, _aim_dir);
	buffer_write(pos_packet, buffer_string,speed_sting);
	buffer_write(pos_packet, buffer_s32, _face);
	network_write(Network.socket,pos_packet);
}

function get_character(char){
	return variable_instance_get(global.CHARACTERS,char);
}

function add_item_inventory(_item) {
	if array_length(obj_player_inv.inv) < obj_player_inv.max_inv
	{
		array_push(obj_player_inv.inv,_item)
		instance_destroy();
	}
};

function player_death()
{
	xspd = 0;
	yspd = 0;
	if(sprite_index != sprite.deathSprite[face]){
		sprite_index = sprite.deathSprite[face];
		image_index = 0;
	}
	if animation_end() 
	{
		death_of_player();
	}
}

function player_attack() {
    xspd = 0;
    yspd = 0;
	if(sprite_index != sprite.attSprite[face])
	{
		sprite_index = sprite.attSprite[face]
		image_index = 0;
	}
	if((image_index >= 1) and (image_index <= 2) )
	{
		instance_create_depth(x,y,depth-1,sprite.att1HB[face]);	
	}
	
	if animation_end()
	{	
		state = PLAYERSTATE.FREESTATE;
	}

}

function animation_end() {
	if(image_index > image_number - 1)
	{return true;}else{return false;}
}


function player_move(){
var _horizKey = rightKey - leftKey;
var _vertKey = downKey - upKey;

centerY = y + centerYOffset;
aimDir = point_direction(x,centerY,mouse_x,mouse_y);
face = round(aimDir/90);


//getting the direction angle
moveDir = point_direction(0,0,_horizKey,_vertKey);


//set speed var and check distance
var _spd = 0;
var _inputLevel = point_distance(0,0,_horizKey,_vertKey);
// fine tune angular movement so its not faster
_inputLevel = clamp(_inputLevel,0,1);
_spd = moveSpd * _inputLevel;

//set the speed to move
xspd = lengthdir_x(_spd,moveDir);
yspd = lengthdir_y(_spd,moveDir);

if (rightKey or leftKey or upKey or downKey) {
	if instance_exists(obj_warp_screen)
	{
		exit;
	}else {	
		custom_pos_packet(x,y,round(aimDir),xspd,yspd,face)
	}
}


if place_meeting( x + xspd ,y, obj_wall_water){
xspd = 0;
}
if place_meeting( x ,y+yspd, obj_wall_water){
yspd = 0;
}

x+= xspd;
y+= yspd;
if face == 4 
{
	face = 0
}
if xspd != 0 or yspd != 0
{
	sprite_index = sprite.runSprite[face];
}else
{
	sprite_index = sprite.sprite[face];
}

}

function spell_exists_in_list(spell) {
    for (var i = 0; i < array_length(obj_player.spellList); i++) {
        if (obj_player.spellList[i] == spell) {
            return true;
        }
    }
    return false;
}
function add_spell_to_player(_spell) {
    // Check if the spell is already in the player's spell list
    if (array_find_index(global.playerSpellList, function(s) { return s == spell; }) == -1) {
        // If not, add the spell to the list
        array_push(global.playerSpellList, _spell);
        return true;  // Indicate that the spell was successfully added
    }
    return false;  // Indicate that the spell was already in the list
}

function send_room_data(){
	var _temp_buffer = buffer_create(1,buffer_grow,1);
buffer_write(_temp_buffer,buffer_string,"ROOM-DATA");
buffer_write(_temp_buffer,buffer_string, room_get_name(room));
buffer_write(_temp_buffer,buffer_s32, 1);
network_write(Network.socket, _temp_buffer);
}