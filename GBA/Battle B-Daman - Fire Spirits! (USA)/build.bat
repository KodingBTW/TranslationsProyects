::====================================================
:: Battle B-Daman - Fire Spirits! - GBA Patch Builder
::====================================================
@echo off
title Battle B-Daman - Fire Spirits! Spanish Patch Builder
color 0A
echo ===================================================
echo   Battle B-Daman - FS! Spanish - GBA Patch Builder
echo ===================================================
echo.

:: -----------
:: FILE PATHS
:: -----------

set ROM_ORG="Battle B-Daman - Fire Spirits! (USA).gba"
set ROM_ESP="Battle B-Daman - Fire Spirits! (ESP).gba"
set IPS_PATCH="Battle B-Daman - Fire Spirits! (ESP).ips"
set BPS_PATCH="Battle B-Daman - Fire Spirits! (ESP).bps"

:: -----------
:: COPY ROM
:: -----------
if not exist %ROM_ORG% (
    echo ERROR: File %ROM_ORG% not found.
    echo Window will close...
	pause
    exit
)

echo [OK] Base ROM found
echo.

echo Creating working ROM...
copy /Y %ROM_ORG% %ROM_ESP% >nul
echo [OK] ROM copied
echo.

:: -----------
:: Expand ROM
:: -----------

tools\kuru -r %ROM_ESP% -e 9

::=========
:: GFX
::=========
echo ================== GFX ============================
echo.

:: FONTS
tools\bbd_nybbles.py compress -f "assets/fonts/fonts_8_16.bin" -c "build/fonts_8_16_c.bin"
tools\bin_manager insert -r %ROM_ESP% -f "build/fonts_8_16_c.bin" -o "CF75C" -s "6A40"
tools\bin_manager insert -r %ROM_ESP% -f "assets/fonts/fonts_8_8.bin" -o "E475C" -s "B80"

:: INTRO
REM tools\bbd_lz_rle.py pack -o "build/nintendo_license_c.bin"  "assets/intro/nintendo_license.bin"

:: TITLE SCREEN
tools\bbd_lz_rle.py pack -o "build/title_screen_logo_c.bin"  "assets/title_screen/title_screen_logo.bin"
tools\bbd_lz_rle.py pack -o "build/title_screen_license_c.bin"  "assets/title_screen/title_screen_license.bin"
tools\bbd_lz_rle.py pack -o "build/title_screen_start_c.bin"  "assets/title_screen/title_screen_start.bin"
tools\bbd_lz_rle.py pack -o "build/main_screen_bdaworld_c.bin"  "assets/title_screen/main_screen_bdaworld.bin"
tools\bbd_lz_rle.py pack -o "build/main_screen_bdabattle_c.bin"  "assets/title_screen/main_screen_bdabattle.bin"
tools\bbd_lz_rle.py pack -o "build/main_screen_bconnect_c.bin"  "assets/title_screen/main_screen_bconnect.bin"
tools\bbd_lz_rle.py pack -o "build/main_screen_toolbox_c.bin"  "assets/title_screen/main_screen_toolbox.bin"
tools\bbd_lz_rle.py pack -o "build/main_screen_system_settings_c.bin"  "assets/title_screen/main_screen_system_settings.bin"
tools\bbd_lz_rle.py pack -o "build/main_screen_btraining_c.bin"  "assets/title_screen/main_screen_btraining.bin"
tools\bbd_lz_rle.py pack -o "build/settings_menu_01_c.bin"  "assets/title_screen/settings_menu_01.bin"
tools\bbd_lz_rle.py pack -o "build/settings_menu_02_c.bin"  "assets/title_screen/settings_menu_02.bin"

:: ENTRY NAMES
tools\bin_manager insert -r %ROM_ESP% -f "assets/entry/entry_buttons_02.bin" -o "74B530" -s "200"
tools\bbd_lz_rle.py pack -o "build/entry_buttons_c.bin"  "assets/entry/entry_buttons.bin"
tools\bbd_lz_rle.py pack -o "build/entry_player_name_title_c.bin"  "assets/entry/entry_player_name_title.bin"
tools\bbd_lz_rle.py pack -o "build/entry_bdaman_name_title_c.bin"  "assets/entry/entry_bdaman_name_title.bin"
tools\bbd_lz_rle.py pack -o "build/entry_code_name_title_c.bin"  "assets/entry/entry_code_name_title.bin"

:: BATTLE
tools\bbd_lz_rle.py pack -o "build/battle_hud_c.bin"  "assets/battle/battle_hud.bin"
tools\bbd_lz_rle.py pack -o "build/battle_hud_02_c.bin"  "assets/battle/battle_hud_02.bin"
tools\bbd_lz_rle.py pack -o "build/battle_pause_c.bin"  "assets/battle/battle_pause.bin"
tools\bbd_lz_rle.py pack -o "build/battle_bfire_c.bin"  "assets/battle/battle_bfire.bin"
tools\bbd_lz_rle.py pack -o "build/battle_win_c.bin"  "assets/battle/battle_win.bin"
tools\bbd_lz_rle.py pack -o "build/battle_lose_c.bin"  "assets/battle/battle_lose.bin"
tools\bbd_lz_rle.py pack -o "build/battle_sets_c.bin"  "assets/battle/battle_sets.bin"
tools\bbd_lz_rle.py pack -o "build/battle_numbers_c.bin"  "assets/battle/battle_numbers.bin"
tools\bbd_lz_rle.py pack -o "build/battle_timeout_c.bin"  "assets/battle/battle_timeout.bin"
tools\bbd_lz_rle.py pack -o "build/battle_result_winner_c.bin"  "assets/battle/battle_result_winner.bin"
tools\bbd_lz_rle.py pack -o "build/battle_result_loser_c.bin"  "assets/battle/battle_result_loser.bin"
tools\bbd_lz_rle.py pack -o "build/battle_result_status_c.bin"  "assets/battle/battle_result_status.bin"

:: SPECIAL SHOT
tools\bbd_lz_rle.py pack -o "build/sshot_boost_magnum_c.bin" "assets/sshot/sshot_boost_magnum.bin" %ROM%


:: BATTLE SUMMARY
tools\bbd_lz_rle.py pack -o "build/summary_bg_box_c.bin"  "assets/battle_summary/summary_bg_box.bin" %ROM%
tools\bbd_lz_rle.py pack -o "build/summary_game_dhb_c.bin"  "assets/battle_summary/summary_game_dhb.bin" %ROM%
tools\bbd_lz_rle.py pack -o "build/summary_game_bshoot_c.bin"  "assets/battle_summary/summary_game_bshoot.bin" %ROM%
tools\bbd_lz_rle.py pack -o "build/summary_set_1_c.bin"  "assets/battle_summary/summary_set_1.bin" %ROM%
tools\bbd_lz_rle.py pack -o "build/summary_set_3_c.bin"  "assets/battle_summary/summary_set_3.bin" %ROM%
tools\bbd_lz_rle.py pack -o "build/summary_set_5_c.bin"  "assets/battle_summary/summary_set_5.bin" %ROM%
tools\bbd_lz_rle.py pack -o "build/summary_time_60_c.bin"  "assets/battle_summary/summary_time_60.bin" %ROM%
tools\bbd_lz_rle.py pack -o "build/summary_time_90_c.bin"  "assets/battle_summary/summary_time_90.bin" %ROM%
tools\bbd_lz_rle.py pack -o "build/summary_time_120_c.bin"  "assets/battle_summary/summary_time_120.bin" %ROM%
tools\bbd_lz_rle.py pack -o "build/summary_btn_view_c.bin"  "assets/battle_summary/summary_btn_view.bin" %ROM%
tools\bbd_lz_rle.py pack -o "build/summary_player_bdaman_c.bin"  "assets/battle_summary/summary_player_bdaman.bin" %ROM%
tools\bbd_lz_rle.py pack -o "build/loading_screen_time_c.bin"  "assets/battle_summary/loading_screen_time.bin" %ROM%

:: COMMAND BOX
tools\bbd_lz_rle.py pack -o "build/command_box_move_01_c.bin"  "assets/command_box/command_box_move_01.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_move_02_c.bin"  "assets/command_box/command_box_move_02.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_talk_01_c.bin"  "assets/command_box/command_box_talk_01.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_talk_02_c.bin"  "assets/command_box/command_box_talk_02.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_battle_01_c.bin"  "assets/command_box/command_box_battle_01.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_battle_02_c.bin"  "assets/command_box/command_box_battle_02.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_subgame_01_c.bin"  "assets/command_box/command_box_subgame_01.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_subgame_02_c.bin"  "assets/command_box/command_box_subgame_02.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_training_01_c.bin"  "assets/command_box/command_box_training_01.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_training_02_c.bin"  "assets/command_box/command_box_training_02.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_toolbox_01_c.bin"  "assets/command_box/command_box_toolbox_01.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_toolbox_02_c.bin"  "assets/command_box/command_box_toolbox_02.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_hint_01_c.bin"  "assets/command_box/command_box_hint_01.bin"
tools\bbd_lz_rle.py pack -o "build/command_box_hint_02_c.bin"  "assets/command_box/command_box_hint_02.bin"

:: TOOLBOX
REM tools\bbd_lz_rle.py pack -o "build/toolbox_status_c.bin"  "assets/toolbox/toolbox_status.bin"
REM tools\bbd_lz_rle.py pack -o "build/toolbox_status_02_c.bin"  "assets/toolbox/toolbox_status_02.bin"
tools\bin_manager insert -r %ROM_ESP% -f "assets/toolbox/toolbox_status_03.bin" -o "7442F0" -s "400"
tools\bbd_lz_rle.py pack -o "build/toolbox_title_toolbox_c.bin"  "assets/toolbox/toolbox_title_toolbox.bin"
tools\bbd_lz_rle.py pack -o "build/toolbox_btn_bdaman_01_c.bin"  "assets/toolbox/toolbox_btn_bdaman_01.bin"
tools\bbd_lz_rle.py pack -o "build/toolbox_btn_bdanote_01_c.bin"  "assets/toolbox/toolbox_btn_bdanote_01.bin"
tools\bbd_lz_rle.py pack -o "build/toolbox_btn_save_01_c.bin"  "assets/toolbox/toolbox_btn_save_01.bin"
tools\bbd_lz_rle.py pack -o "build/toolbox_btn_bdaman_02_c.bin"  "assets/toolbox/toolbox_btn_bdaman_02.bin"
tools\bbd_lz_rle.py pack -o "build/toolbox_btn_bdanote_02_c.bin"  "assets/toolbox/toolbox_btn_bdanote_02.bin"
tools\bbd_lz_rle.py pack -o "build/toolbox_btn_save_02_c.bin"  "assets/toolbox/toolbox_btn_save_02.bin"

:: B-DAMAN (INSIDE TOOLBOX)
tools\bin_manager insert -r %ROM_ESP% -f "assets/bdaman/bdaman_customize_title.bin" -o "746050" -s "3F00"
tools\bbd_lz_rle.py pack -o "build/bdaman_status_c.bin"  "assets/bdaman/bdaman_status.bin"
tools\bbd_lz_rle.py pack -o "build/bdaman_menu_btns_c.bin"  "assets/bdaman/bdaman_menu_btns.bin"
tools\bbd_lz_rle.py pack -o "build/bdaman_status_configuration_c.bin"  "assets/bdaman/bdaman_status_configuration.bin"
tools\bbd_lz_rle.py pack -o "build/bdaman_wheel_customize_c.bin"  "assets/bdaman/bdaman_wheel_customize.bin"
tools\bbd_lz_rle.py pack -o "build/bdaman_wheel_spa_c.bin"  "assets/bdaman/bdaman_wheel_spa.bin"
tools\bbd_lz_rle.py pack -o "build/bdaman_wheel_name_c.bin"  "assets/bdaman/bdaman_wheel_name.bin"
tools\bbd_lz_rle.py pack -o "build/bdaman_wheel_copy_c.bin"  "assets/bdaman/bdaman_wheel_copy.bin"

:: B-DANOTE (INSIDE TOOLBOX)
tools\bin_manager insert -r %ROM_ESP% -f "assets/bdanote/bdanote_labbels.bin" -o "744890" -s "179C"
tools\bin_manager insert -r %ROM_ESP% -f "assets/bdanote/bdanote_parts_collection.bin" -o "74C190" -s "2940"
tools\bbd_lz_rle.py pack -o "build/bdanote_parts_collection_02_c.bin"  "assets/bdanote/bdanote_parts_collection_02.bin"
tools\bbd_lz_rle.py pack -o "build/bdanote_btn_characters_c.bin"  "assets/bdanote/bdanote_btn_characters.bin"
tools\bbd_lz_rle.py pack -o "build/bdanote_btn_bdaman_c.bin"  "assets/bdanote/bdanote_btn_bdaman.bin"
tools\bbd_lz_rle.py pack -o "build/bdanote_btn_parts_c.bin"  "assets/bdanote/bdanote_btn_parts.bin"
tools\bbd_lz_rle.py pack -o "build/bdanote_btn_special_attack_c.bin"  "assets/bdanote/bdanote_btn_special_attack.bin"
tools\bbd_lz_rle.py pack -o "build/bdanote_btn_battle_records_c.bin"  "assets/bdanote/bdanote_btn_battle_records.bin"

:: B-DASHOP
tools\bbd_lz_rle.py pack -o "build/shop_btn_buy_01_c.bin"  "assets/shop/shop_btn_buy_01.bin"
tools\bbd_lz_rle.py pack -o "build/shop_btn_buy_02_c.bin"  "assets/shop/shop_btn_buy_02.bin"
tools\bbd_lz_rle.py pack -o "build/shop_btn_sell_01_c.bin"  "assets/shop/shop_btn_sell_01.bin"
tools\bbd_lz_rle.py pack -o "build/shop_btn_sell_02_c.bin"  "assets/shop/shop_btn_sell_02.bin"
tools\bbd_lz_rle.py pack -o "build/shop_btn_code_01_c.bin"  "assets/shop/shop_btn_code_01.bin"
tools\bbd_lz_rle.py pack -o "build/shop_btn_code_02_c.bin"  "assets/shop/shop_btn_code_02.bin"
tools\bbd_lz_rle.py pack -o "build/shop_parts_list_c.bin"  "assets/shop/shop_parts_list.bin"

:: MULTIPLAYER (B-DABATTLE)


echo.
::=========
:: Scripts
::=========
echo ================= SCRIPTS =========================
echo.
tools\string_format insert -m "1" -r %ROM_ESP% -f "script/main_script.txt" -t "script/main_script_esp.tbl" -o "800000" -s 40000 -b "00" --fill "00" --asm "asm/main_script_offsets" --p 4b --base "8800000" --type 2

tools\string_format insert -m "1" -r %ROM_ESP% -f "script/script_tutorial.txt" -t "script/main_script_esp.tbl" -o "840000" -s "2140" --fill "00" --asm "asm/script_tutorial_offsets" --p 4b --base "8840000" --type 2

tools\string_format insert -m "1" -r %ROM_ESP% -f "script/script_tutorial_02.txt" -t "script/main_script_esp.tbl" -o "842140" -s "180" --fill "00" --asm "asm/script_tutorial_02_offsets" --p 4b --base "8842140" --type 2

tools\string_format insert -m "1" -r %ROM_ESP% -f "script/script_players_towns.txt" -t "script/main_script_esp.tbl" -o "8422C0" -s "500" --fill "00" --asm "asm/script_players_towns_offsets" --p 4b --base "88422C0" --type 2

tools\string_format insert -m "1" -r %ROM_ESP% -f "script/script_equip.txt" -t "script/main_script_esp.tbl" -o "8427C0" -s "450" --fill "00" --asm "asm/script_equip_offsets" --p 4b --base "88427C0" --type 2

tools\string_format insert -m "1" -r %ROM_ESP% -f "script/script_battle.txt" -t "script/main_script_esp.tbl" -o "842C10" -s "800" --fill "00" --asm "asm/script_battle_offsets" --p 4b --base "8842C10" --type 2

tools\string_format insert -m "1" -r %ROM_ESP% -f "script/script_battle_02.txt" -t "script/main_script_esp.tbl" -o "843410" -s "5210" --fill "00" --asm "asm/script_battle_02_offsets" --p 4b --base "8843410" --type 2

tools\string_format insert -m "1" -r %ROM_ESP% -f "script/script_battle_03.txt" -t "script/main_script_esp.tbl" -o "848620" -s "1500" --fill "00" --asm "asm/script_battle_03_offsets" --p 4b --base "8848620" --type 2

tools\string_format insert -m "1" -r %ROM_ESP% -f "script/script_items_description.txt" -t "script/main_script_esp.tbl" -o "849B20" -s "A800" --fill "00" --asm "asm/script_items_description_offsets" --p 4b --base "8849B20" --type 2

tools\string_format insert -m "1" -r %ROM_ESP% -f "script/script_items.txt" -t "script/main_script_esp.tbl" -o "854320" -s "2710" --fill "00" --asm "asm/script_items_offsets" --p 4b --base "8854320" --type 2

tools\string_format insert -m "1" -r %ROM_ESP% -f "script/script_shop.txt" -t "script/main_script_esp.tbl" -o "856A30" -s "1770" --fill "00" --asm "asm/script_shop_offsets" --p 4b --base "8856A30" --type 2

tools\string_format insert -m "1" -r %ROM_ESP% -f "script/script_shop_02.txt" -t "script/main_script_esp.tbl" -o "8581A0" -s "5000" --fill "00" --asm "asm/script_shop_02_offsets" --p 4b --base "88581A0" --type 2

echo.
::=========
:: ASM
::=========
echo ================== ASM ============================
echo.
tools\armips build.asm
if errorlevel 1 (
    echo [ERROR] ASM insertion failed
    pause
	exit
)
echo [OK] All ASM scripts inserted

copy /Y "temp.gba" %ROM_ESP% >nul
del /F /Q "temp.gba" >nul

echo.
::==============
:: Create Patch
::==============

echo ================= PATCH ===========================
@echo on
tools\flips --create --ips %ROM_ORG% %ROM_ESP% %IPS_PATCH%
tools\flips --create --bps-linear %ROM_ORG% %ROM_ESP% %BPS_PATCH%
@echo off
echo.
echo =================================
echo   BUILD COMPLETED SUCCESSFULLY
echo =================================
echo.
pause