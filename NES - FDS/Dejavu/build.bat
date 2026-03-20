::=====================================================
:: Deja Vu - NES Patch Builder
::=====================================================
@echo off
title Deja Vu Spanish Patch Builder
color 0A
echo =====================================================
echo   Deja Vu - NES Patch Builder
echo =====================================================
echo.

:: -----------
:: FILE PATHS
:: -----------
set ROM_ESP="Deja Vu (ESP).nes"
set ROM_ENG="Deja Vu (USA).nes"
set IPS_PATCH="Deja Vu (ESP).ips"
set BPS_PATCH="Deja Vu (ESP).bps"

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
tools\asm6 asm/expand_dictionary.asm build/expand_dictionary.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/expand_dictionary.bin" -o "1E50C" -q

tools\asm6 asm/char_map.asm build/char_map.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/char_map.bin" -o "1E223" -q

tools\asm6 asm/change_hud.asm build/change_hud.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/change_hud.bin" -o "19DFF" -q

tools\asm6 asm/coins_symbol.asm build/coins_symbol.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/coins_symbol.bin" -o "1BC30" -q

tools\asm6 asm/fix_overflow_hijack.asm build/fix_overflow_hijack.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/fix_overflow_hijack.bin" -o "1D62A" -q

tools\asm6 asm/fix_overflow.asm build/fix_overflow.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/fix_overflow.bin" -o "1DEE0" -q

tools\asm6 asm/select_file_hijack.asm build/select_file_hijack.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/select_file_hijack.bin" -o "87FE" -q

tools\asm6 asm/moved_options.asm build/moved_options.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/moved_options.bin" -o "8C40" -q

tools\asm6 asm/select_file_position.asm build/select_file_position.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/select_file_position.bin" -o "8842" -q

tools\asm6 asm/new_hijack.asm build/new_hijack.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/new_hijack.bin" -o "8821" -q

tools\asm6 asm/bullet_sprite_position.asm build/bullet_sprite_position.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/bullet_sprite_position.bin" -o "88EC" -q

tools\asm6 asm/menu_options.asm build/menu_options.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/menu_options.bin" -o "8883" -q

tools\asm6 asm/menu_options_2.asm build/menu_options_2.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/menu_options_2.bin" -o "89E8" -q

tools\asm6 asm/game_over_options.asm build/game_over_options.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/game_over_options.bin" -o "8A2E" -q

tools\asm6 asm/the_end_tilemap.asm build/the_end_tilemap.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/the_end_tilemap.bin" -o "1B3BC" -q

tools\asm6 asm/certificate_tilemap.asm build/certificate_tilemap.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/certificate_tilemap.bin" -o "79CC" -q

tools\asm6 asm/copyright.asm build/copyright.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/copyright.bin" -o "1DE10" -q

echo.
echo [OK] All ASM scripts inserted
echo.
::=========
:: GFX
::=========
echo ================== GFX ============================
::Decompress
tools\bin_manager insert -r %ROM_ESP% -f "assets/death_guy_tileset.bin" -o "28810" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/death_alligator_tileset.bin" -o "43810" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/main_screen_tileset.bin" -o "59010" -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f "assets/main_screen2_tileset.bin" -o "5D010" -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f "assets/lady_room_tileset.bin" -o "22070" -s "800"

tools\bin_manager insert -r %ROM_ESP% -f "assets/game_over_tileset.bin" -o "46010" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/game_over_tilemap.map" -o "7B74" -s "D4"
tools\bin_manager insert -r %ROM_ESP% -f "assets/game_over_palette.bin" -o "18C7A" -s "20"

REM tools\bin_manager insert -r %ROM_ESP% -f "assets/casino_tileset.bin" -o "25810" -s "800"
REM tools\bin_manager insert -r %ROM_ESP% -f "assets/casino_tilemap.map" -o "155C" -s "D4"
REM tools\bin_manager insert -r %ROM_ESP% -f "assets/casino_palette.bin" -o "1846A" -s "20"

tools\bin_manager insert -r %ROM_ESP% -f "assets/main_fonts_tileset.bin" -o "20010" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/presentation_screen_tileset.bin" -o "5A010" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/title_screen_tileset.bin" -o "58010" -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f "assets/the_end_screen_tileset.bin" -o "5C010" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/main_fonts_2_tileset.bin" -o "5C810" -s "800"
tools\bin_manager insert -r %ROM_ESP% -f "assets/certificate_tileset.bin" -o "45010" -s "800"

::Compress
tools\kemco_tilemap compress -f "assets/presentation_screen_tilemap.map" -c "build/presentation_screen_tilemap_c.map"
tools\bin_manager insert -r %ROM_ESP% -f "build/presentation_screen_tilemap_c.map" -o "1B1EA" -s "94"

tools\kemco_tilemap compress -f "assets/main_screen_tilemap.map" -c "build/main_screen_tilemap_c.map"
tools\bin_manager insert -r %ROM_ESP% -f "build/main_screen_tilemap_c.map" -o "8A9B" -s "195"
echo [OK] All GFX inserted
echo.
::=========
:: Scripts
::=========
echo ================= SCRIPTS =========================
tools\dejavu_texteditor insert -r %ROM_ESP% -f "script/main_script.txt" -t "script/main_script_esp.tbl" --asm "asm/main_script"
if errorlevel 1 goto :skip1
tools\asm6 asm/pointers_table_script_3.asm build/pointers_table_script_3.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/pointers_table_script_3.bin" -o "10010" -q
:skip1
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_1.txt" -t "script/items_esp.tbl" -o "8D10" -s "1D8" -l "8" -b "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_2.txt" -t "script/items_esp.tbl" -o "8F10" -s "90" -l "8" -b "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_3.txt" -t "script/items_esp.tbl" -o "9010" -s "230" -l "8" -b "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_4.txt" -t "script/items_esp.tbl" -o "9290" -s "C0" -l "8" -b "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_5.txt" -t "script/items_esp.tbl" -o "9390" -s "B0" -l "8" -b "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_6.txt" -t "script/items_esp.tbl" -o "9510" -s "320" -l "8" -b "FF"
tools\string_format insert -m "0" -r %ROM_ESP% -f "script/item_list_7.txt" -t "script/items_esp.tbl" -o "9890" -s "1F"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_8.txt" -t "script/items_esp.tbl" -o "98AF" -s "1F0" -l "8" -b "FF"

tools\string_format insert -m "1" -r %ROM_ESP% -f "script/main_script_end.txt" -t "script/script_end_esp.tbl" -o "1BC7C" -s "394" --asm "asm/end_script_offsets" -p 2b --base "BC6C" --type 0
if errorlevel 1 goto :skip2
tools\asm6 asm/end_script_pointers.asm build/end_script_pointers.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/end_script_pointers.bin" -o "1BC10" -q
:skip2
echo.
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