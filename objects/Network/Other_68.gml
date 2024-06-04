/// @description Insert description here
// You can write your code in this editor
show_debug_message("Networking Event Triggerd.")

switch(async_load[? "type"]) {
	case network_type_data : 
		buffer_copy(async_load[? "buffer"],0 , async_load[? "size"],saved_buffer,buffer_tell(saved_buffer));
		buffer_seek(saved_buffer, buffer_seek_relative, async_load[? "size"] + 1); 
		
		while (true) {
			var _size = buffer_peek(saved_buffer, reading, buffer_u8);
			
			if (buffer_get_size(saved_buffer) >= reading + _size  ) {
				
				buffer_copy(saved_buffer,reading,_size,cut_buffer,0);
				buffer_seek(cut_buffer, 0, 1);
				handle_packet(cut_buffer);
				if (buffer_get_size(saved_buffer) != reading + _size) {
			
					reading += _size;
				}else { 
					buffer_resize(saved_buffer,1);
					reading = 0;
					break;
				}
			} 
			else {
				break;
			}
		} 
		break;
}
