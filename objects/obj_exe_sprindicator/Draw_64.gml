if(!visible)
	return;

if(!instance_exists(global.player))
	return;
	
draw_sprite_ext(spr_indicator3, 0, ceil(x-obj_camera.x), ceil(y-obj_camera.y), 1, 1, image_angle, c_white, image_alpha);