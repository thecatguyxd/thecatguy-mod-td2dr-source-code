draw_sprite(spr_slider, 0, slider_x_pos, slider_y_pos);
slider_x = slider_min + (obj_custom.music_volume * (slider_max - slider_min));
draw_sprite(spr_slider_button, 0, slider_x - 3, slider_y_pos);

scr_text_spr(52, 242, "music");
