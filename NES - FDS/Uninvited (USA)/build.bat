::=====================================================
:: Uninvited - NES Patch Builder
::=====================================================
@echo off
title Uninvited Spanish Patch Builder
color 0A
echo =====================================================
echo   Uninvited - NES Patch Builder
echo =====================================================
echo.

:: -----------
:: FILE PATHS
:: -----------
set ROM_ESP="Uninvited (ESP).nes"
set ROM_ENG="Uninvited (U) [!].nes"
set IPS_PATCH="Uninvited (ESP).ips"
set BPS_PATCH="Uninvited (ESP).bps"

:: --------------------
:: CREATE WORKING COPY
:: --------------------
if not exist %ROM_ENG% (
    echo ERROR: File %ROM_ENG% not found.
    echo Window will close...
	pause
    exit
)

echo [OK] Base ROM found
echo.

echo Creating working ROM...
copy /Y %ROM_ENG% %ROM_ESP% >nul
echo [OK] ROM copied
echo.
::=========
:: ASM
::=========
echo ================== ASM ============================
echo.
tools\asm6 asm/select_file_hijack.asm build/select_file_hijack.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/select_file_hijack.bin" -o "B663" -q

tools\asm6 asm/moved_options.asm build/moved_options.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/moved_options.bin" -o "BF90" -q

tools\asm6 asm/new_hijack.asm build/new_hijack.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/new_hijack.bin" -o "B686" -q

tools\asm6 asm/click_sprite_position.asm build/click_sprite_position.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/click_sprite_position.bin" -o "B7CC" -q

tools\asm6 asm/select_file_position.asm build/select_file_position.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/select_file_position.bin" -o "B6A8" -q

tools\asm6 asm/menu_options.asm build/menu_options.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/menu_options.bin" -o "B6EF" -q

tools\asm6 asm/menu_options2.asm build/menu_options2.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/menu_options2.bin" -o "B841" -q

tools\asm6 asm/menu_options3.asm build/menu_options3.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/menu_options3.bin" -o "B927" -q

tools\asm6 asm/click_sprite_position2.asm build/click_sprite_position2.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/click_sprite_position2.bin" -o "B7EF" -q

tools\asm6 asm/click_sprite_position3.asm build/click_sprite_position3.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/click_sprite_position3.bin" -o "B96D" -q

tools\asm6 asm/hud_tilemap.asm build/hud_tilemap.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/hud_tilemap.bin" -o "1A1CA" -q

REM tools\asm6 asm/items_string_length.asm build/items_string_length.bin
REM tools\bin_manager insert -r %ROM_ESP% -f "build/items_string_length.bin" -o "1DE05" -q


tools\asm6 asm/char_map.asm build/char_map.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/char_map.bin" -o "1DC47" -q

tools\asm6 asm/index_map.asm build/index_map.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/index_map.bin" -o "1E43F" -q

tools\asm6 asm/intro_tilemap.asm build/intro_tilemap.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/intro_tilemap.bin" -o "B430" -q

tools\asm6 asm/move_intro.asm build/move_intro.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/move_intro.bin" -o "B9DC" -q


tools\asm6 asm/skeleton_sprite_position.asm build/skeleton_sprite_position.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/skeleton_sprite_position.bin" -o "1BB33" -q
tools\bin_manager insert -r %ROM_ESP% -f "build/skeleton_sprite_position.bin" -o "1B538" -q
tools\bin_manager insert -r %ROM_ESP% -f "build/skeleton_sprite_position.bin" -o "1B53A" -q

tools\asm6 asm/skeleton_sprite.asm build/skeleton_sprite.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/skeleton_sprite.bin" -o "1937C" -q


tools\asm6 asm/the_end_sprite.asm build/the_end_sprite.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/the_end_sprite.bin" -o "6A81" -q

tools\asm6 asm/copyright.asm build/copyright.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/copyright.bin" -o "1FF10" -q

echo [OK] All ASM scripts inserted
echo.
::=========
:: GFX
::=========
echo ================== GFX ============================
echo.
tools\bin_manager insert -r %ROM_ESP% -f "assets/uncensored_carpet_penthagram.bin" -o "0x21810" -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f "assets/uncensored_wall_masks.bin" -o "0x27810" -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f "assets/uncensored_wall_cross.bin" -o "0x30810" -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f "assets/uncensored_zombie.bin" -o "0x37810" -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f "assets/uncensored_crosses_graveyard.bin" -o "0x3D810" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/uncensored_item_cross.bin" -o "0x3C810" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/uncensored_item_carpet.bin" -o "0x3A410" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/uncensored_item_book_cover.bin" -o "0x3E810" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/uncensored_skeleton.bin" -o "0x3B410" -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f "assets/uncensored_item_book_cover2.bin" -o "0x32810" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/restored_backyard_clouds.bin" -o "0x2D810" -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f "assets/main_fonts.bin" -o "0x20010" -s "800"

tools\bin_manager insert -r %ROM_ESP% -f "assets/the_end.bin" -o "0x39810" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/title_screen.bin" -o "0x3F010" -s "1000"

::COMPRESS
tools\kemco_tilemap compress -f "assets/push_start_tilemap.map" -c "build/push_start_tilemap_c.map"
tools\bin_manager insert -r %ROM_ESP% -f "build/push_start_tilemap_c.map" -o "BABE" -s "19D"

tools\kemco_tilemap compress -f "assets/game_over_tilemap.map" -c "build/game_over_tilemap_c.map"
tools\bin_manager insert -r %ROM_ESP% -f "build/game_over_tilemap_c.map" -o "BE00" -s "190" --fill "FF"
echo [OK] All GFX inserted
echo.
::=========
:: Scripts
::=========
echo ================= SCRIPTS =========================
echo.
tools\uninvited_texteditor insert -r %ROM_ESP% -f "script/main_script_esp.txt" -t "script/main_script_esp.tbl"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_1.txt" -t "script/items_esp.tbl" -o "F010" -s "160" -l "8" -b "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_2.txt" -t "script/items_esp.tbl" -o "F190" -s "60" -l "8" -b "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_3.txt" -t "script/items_esp.tbl" -o "F218" -s "B0" -l "8" -b "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_4.txt" -t "script/items_esp.tbl" -o "F390" -s "40" -l "8" -b "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_5.txt" -t "script/items_esp.tbl" -o "F410" -s "30" -l "8" -b "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/spell_list.txt" -t "script/items_esp.tbl" -o "F490" -s "30" -l "8" -b "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_6.txt" -t "script/items_esp.tbl" -o "F4C0" -s "2D8" -l "8" -b "FF"

echo [OK] All text scripts inserted
echo.

::=============
:: Create Patch
::=============
echo ================= PATCH ===========================
@echo on
tools\flips --create --ips %ROM_ENG% %ROM_ESP% %IPS_PATCH%
tools\flips --create --bps-linear %ROM_ENG% %ROM_ESP% %BPS_PATCH%
@echo off
echo.
echo ====================================================
echo   BUILD COMPLETED SUCCESSFULLY
echo ====================================================
echo.
pause