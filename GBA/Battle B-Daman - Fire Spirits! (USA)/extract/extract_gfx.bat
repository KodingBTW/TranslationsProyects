set ROM="../Battle B-Daman - Fire Spirits! (USA).gba"

..\tools\bin_manager extract -r %ROM% -f "name_entry_buttons_02.bin" -o "74B530" -s "200"
..\tools\bbd_nybbles.py decompress -r %ROM% -f "main_fonts.bin" -o "CF75C" -s "6A40"
..\tools\bbd_lz_rle.py unpack -a 0x70C488 -o "nintendo_license.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x70E74C -o "title_screen_logo.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x70F70B -o "title_screen_license.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x70F341 -o "title_screen_start.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x71009C -o "main_screen_bdaworld.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x710A0C -o "main_screen_system_settings.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x71115B -o "settings_menu_01.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x7117D0 -o "settings_menu_02.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x76A034 -o "name_entry_buttons.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x76ACDE -o "name_entry_title.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x4364A2 -o "battle_hud.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x436970 -o "battle_hud_02.bin" %ROM%

..\tools\bbd_lz_rle.py unpack -a 0x436970 -o "TEST.bin" %ROM%

pause