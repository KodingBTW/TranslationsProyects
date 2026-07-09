set ROM="../Battle B-Daman - Fire Spirits! (USA).gba"

:: INTRO
REM ..\tools\bbd_lz_rle.py unpack -a 0x70C488 -o "intro/nintendo_license.bin" %ROM%

:: FONTS
REM ..\tools\bbd_nybbles.py decompress -r %ROM% -f "fonts/main_fonts.bin" -o "CF75C" -s "6A40"

:: TITLE SCREEN
REM ..\tools\bbd_lz_rle.py unpack -a 0x70E74C -o "title_screen/title_screen_logo.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x70F70B -o "title_screen/title_screen_license.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x70F341 -o "title_screen/title_screen_start.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x71009C -o "title_screen/main_screen_bdaworld.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x710A0C -o "title_screen/main_screen_system_settings.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x71115B -o "title_screen/settings_menu_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x7117D0 -o "title_screen/settings_menu_02.bin" %ROM%

:: ENTRY NAMES
REM ..\tools\bin_manager extract -r %ROM% -f "entry/entry_buttons_02.bin" -o "74B530" -s "200"
REM ..\tools\bbd_lz_rle.py unpack -a 0x76A034 -o "entry/entry_buttons.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x76ACDE -o "entry/entry_player_name_title.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x76A8B1 -o "entry/entry_bdaman_name_title.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x76B091 -o "entry/entry_code_name_title.bin" %ROM%

:: BATTLE
REM ..\tools\bbd_lz_rle.py unpack -a 0x4364A2 -o "battle/battle_hud.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x436970 -o "battle/battle_hud_02.bin" %ROM%

:: BATTLE SUMMARY
..\tools\bbd_lz_rle.py unpack -a 0x6D75FA -o "battle_summary/gamemode_bshoot.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x6D76F2 -o "battle_summary/gamemode_dhb.bin" %ROM%

:: COMMAND BOX
REM ..\tools\bbd_lz_rle.py unpack -a 0x5ED82A -o "command_box/command_box_move_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5ED96A -o "command_box/command_box_move_02.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5ED58B -o "command_box/command_box_talk_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5ED6BE -o "command_box/command_box_talk_02.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5ED2DE -o "command_box/command_box_battle_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5ED415 -o "command_box/command_box_battle_02.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5EDD86 -o "command_box/command_box_subgame_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5EDEDC -o "command_box/command_box_subgame_02.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5EE06A -o "command_box/command_box_training_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5EE1B9 -o "command_box/command_box_training_02.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5ED02D -o "command_box/command_box_toolbox_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5ED164 -o "command_box/command_box_toolbox_02.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5EDAEE -o "command_box/command_box_hint_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x5EDC1E -o "command_box/command_box_hint_02.bin" %ROM%

:: TOOLBOX
REM ..\tools\bbd_lz_rle.py unpack -a 0x76B43C -o "toolbox/toolbox_status.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x76B9EE -o "toolbox/toolbox_status_02.bin" %ROM%
REM ..\tools\bin_manager extract -r %ROM% -f "toolbox/toolbox_status_03.bin" -o "7442F0" -s "400"
REM ..\tools\bbd_lz_rle.py unpack -a 0x76C0E5 -o "toolbox/toolbox_title_toolbox.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77DD83 -o "toolbox/toolbox_btn_bdaman_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77DF63 -o "toolbox/toolbox_btn_bdanote_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77E15D -o "toolbox/toolbox_btn_save_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77E2D1 -o "toolbox/toolbox_btn_bdaman_02.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77E53B -o "toolbox/toolbox_btn_bdanote_02.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77E7CF -o "toolbox/toolbox_btn_save_02.bin" %ROM%

:: B-DAMAN (INSIDE TOOLBOX)
REM ..\tools\bin_manager extract -r %ROM% -f "bdaman/bdaman_customize_title.bin" -o "746050" -s "3F00"
REM ..\tools\bbd_lz_rle.py unpack -a 0x764298 -o "bdaman/bdaman_status.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x7650AA -o "bdaman/bdaman_status_configuration.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77B411 -o "bdaman/bdaman_menu_btns.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77AE23 -o "bdaman/bdaman_wheel_customize.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77AF18 -o "bdaman/bdaman_wheel_spa.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77B113 -o "bdaman/bdaman_wheel_name.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77B21D -o "bdaman/bdaman_wheel_copy.bin" %ROM%

:: B-DANOTE (INSIDE TOOLBOX)
REM ..\tools\bin_manager extract -r %ROM% -f "bdanote/bdanote_labbels.bin" -o "744890" -s "179C"
REM ..\tools\bin_manager extract -r %ROM% -f "bdanote/bdanote_parts_collection.bin" -o "74C190" -s "2940"
REM ..\tools\bbd_lz_rle.py unpack -a 0x76F34F -o "bdanote/bdanote_parts_collection_02.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x782E2E -o "bdanote/bdanote_btn_characters.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x78311E -o "bdanote/bdanote_btn_bdaman.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x78340A -o "bdanote/bdanote_btn_parts.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x7836BD -o "bdanote/bdanote_btn_special_attack.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x7839A8 -o "bdanote/bdanote_btn_battle_records.bin" %ROM%

:: B-DASHOP
REM ..\tools\bbd_lz_rle.py unpack -a 0x77B6E7 -o "shop/shop_btn_buy_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77BB1B -o "shop/shop_btn_sell_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77C354 -o "shop/shop_btn_code_01.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77C771 -o "shop/shop_btn_buy_02.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77CB94 -o "shop/shop_btn_sell_02.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x77D399 -o "shop/shop_btn_code_02.bin" %ROM%
REM ..\tools\bbd_lz_rle.py unpack -a 0x765506 -o "shop/shop_parts_list.bin" %ROM%


..\tools\bbd_lz_rle.py unpack -a 0x6D75FA -o "TEST.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x6D76F2 -o "TEST2.bin" %ROM%

pause