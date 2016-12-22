/// @description Build up tile table

global.Heights = [TILE_SIZE*TILE_MAX];

var surf = surface_create(TILE_SIZE*TILE_MAX, TILE_SIZE);	// enough to hold all tiles from tileset, smart to do a square if bigger tileset
var buff = buffer_create(TILE_SIZE*TILE_MAX*TILE_SIZE*4, buffer_fixed, 1);

surface_set_target(surf);
draw_clear_alpha(0,0);

//Draw all tiles
for (var i = 0; i < TILE_MAX; i++) {
	draw_tile(tTileset, i, 0, i*TILE_SIZE, 0)
}	
surface_reset_target();
buffer_get_surface(buff, surf, 0, 0, 0);


for (var xx = 0; xx < TILE_SIZE*TILE_MAX; xx++) {
	var count = 0;
	for (var yy = 0; yy < TILE_SIZE; yy++) {
		//														  *4 because ARGB
		var pixel = buffer_peek(buff, (xx+(yy*TILE_SIZE*TILE_MAX))*4,buffer_u32);
		if (pixel&0xff000000 != 0) break; // check if pixel is transparent (color is formatted as ARGB)
		count++;
	}	
	global.Heights[xx] = count;	
}

var s="";
for (var xx = 0; xx < 64; xx++) {
	s=s+","+string(global.Heights[xx]);
}

buffer_delete(buff);
surface_free(surf);


room_goto_next();