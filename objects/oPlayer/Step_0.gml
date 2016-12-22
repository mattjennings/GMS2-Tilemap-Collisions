/// @description Do collision test

y += dy;
dy += grav;
if (dy > 10) dy = 10;

if (keyboard_check(vk_left)) {
	 x -= 2;
}

if (keyboard_check(vk_right)) {
	x += 2;
}

if (keyboard_check(vk_space)) {
	dy = -4;
}

var col = true;
while (col) {
	col = TestCollision(x,floor(y) + 7);
	if (col) {
		dy = 0;		
		y = floor(y-1);		
	}
}

// Mouse collision
col = TestCollision(mouse_x, mouse_y);
colour = c_white;

if (col) colour = c_red;