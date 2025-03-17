// disclaimer на русском ебать

scr_text_spr_centered(100, "\\дисклеймер");
scr_text_spr_centered(110, "/мод~ все еще \\не доработан");
scr_text_spr_centered(118, "возможны \\ошибки~ и недоработки");
scr_text_spr_centered(126, "планируется `продолжать~ развивать /мод~ и @добавлять~ новый контент в будущем");

scr_text_spr_centered(142, "мод сделан \\the№cat`guy");
scr_text_spr_centered(150, "я не верю что я это говорю но добро пожаловать в /v1.0");

/*
// disclaimer на английском ебать
scr_text_spr_centered(100, "\\disclaimer");
scr_text_spr_centered(110, "the /mod~ is \\still unfinished");
scr_text_spr_centered(118, "there may be \\bugs~ and imperfections");
scr_text_spr_centered(126, "`development~ of the /mod~ is planned, and @new content~ will be added in the future");

scr_text_spr_centered(142, "mod made by \\the№cat`guy");
scr_text_spr_centered(150, "i can't believe im saying this, but welcome to /v1.0");
*/

if (global.showsprite)
{
    draw_sprite_ext(spr_black, 0, 0, 0, 1, 1, 0, c_white, global.fadealpha);
}