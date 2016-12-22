/// @description Test the collision at a specific point
/// @param _x x pixel to check
/// @param _y y pixel to check

var _x = argument0;
var _y = argument1;

var t = tilemap_get_at_pixel(Tiles, _x, _y) & tile_index_mask;
var column = (_x&(TILE_SIZE-1)) + (t*TILE_SIZE);
var hh = global.Heights[column];

var yy = _y&(TILE_SIZE-1);

if (hh == 0) return true; // full tile
if (hh == 16) return false; // competely empty
if (yy >= hh) return true; // inside or on tile
return false; // no collision