::=====================================================
::The Simpsons - Bart vs. the World  Patch Builder
::=====================================================
@echo off
title The Simpsons - Bart vs. the World Spanish Patch Builder
color 0A
echo =====================================================
echo  The Simpsons - Bart vs. the World Spanish Patch Builder
echo =====================================================
echo.

:: -----------
:: FILE PATHS
:: -----------
set ROM_ORG="The Simpsons - Bart vs. the World (U).nes"
set ROM_ESP="The Simpsons - Bart vs. the World (ESP).nes"
set IPS_HACK="patch/The Simpsons - Bart vs. the World (U)_DTE.ips"
set IPS_PATCH="The Simpsons - Bart vs. the World (ESP).ips"
set BPS_PATCH="The Simpsons - Bart vs. the World (ESP).bps"

:: --------------------
:: CREATE WORKING COPY
:: --------------------
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
:: Apply Patch
:: -----------
tools\flips --apply %IPS_HACK% %ROM_ESP%
::=========
:: GFX
::=========
echo ================== GFX ============================
tools\bin_manager insert -r %ROM_ESP% -f "assets/main_fonts.bin" -o "40010" -s "400"
tools\bin_manager insert -r %ROM_ESP% -f "assets/pick_coffin.bin" -o "44010" -s "1000"
::tools\bin_manager insert -r %ROM_ESP% -f "assets/map_icons.bin" -o "5C010" -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f "assets/sliding_puzzle_1.bin" -o "5E010" -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f "assets/sliding_puzzle_2.bin" -o "5F010" -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f "assets/intro.bin" -o "57810" -s "800"

tools\tilemap_editor.py compress -f "assets/main_menu_tilemap.map" -c "build/main_menu_tilemap_c.map"
tools\bin_manager insert -r %ROM_ESP% -f "build/main_menu_tilemap_c.map" -o "3AE42" -s "157" --fill
tools\tilemap_editor.py compress -f "assets/pick_coffin_tilemap.map" -c "build/pick_coffin_tilemap_c.map"
tools\bin_manager insert -r %ROM_ESP% -f "build/pick_coffin_tilemap_c.map" -o "AF13" -s "209" --fill

echo [OK] All GFX inserted
echo.
::=========
:: Scripts
::=========
echo ================= SCRIPTS =========================
tools\string_format insert -m "1" -r %ROM_ESP% -f "script/main_script_esp.txt" -t "script/main_script_esp.tbl" -o "153DA" -s "2C36" --fill "FF" --asm "asm/main_script_offsets" -p "2b" --type "0" --base "93CA"
If errorlevel 1 pause
tools\string_format insert -m "1" -r %ROM_ESP% -f "script/intro_script_esp.txt" -t "script/intro_script_esp.tbl" -o "E5AA" -s "409" --fill "FF"
If errorlevel 1 pause
echo.
echo [OK] All text scripts inserted
echo.

::=========
:: ASM
::=========
echo ================== ASM ============================
echo.
::DTE
tools\asm6 asm/dte_table.asm build/dte_table.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/dte_table.bin" -o "15070" -q

tools\asm6 asm/main_script_pointers.asm build/main_script_pointers.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/main_script_pointers.bin" -o "15170" -q

tools\asm6 asm/card_game_hijack.asm build/card_game_hijack.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/card_game_hijack.bin" -o "21B29" -q

tools\asm6 asm/card_game_plural.asm build/card_game_plural.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/card_game_plural.bin" -o "237C0" -q

tools\asm6 asm/pause_hud.asm build/pause_hud.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/pause_hud.bin" -o "3F9B4" -q

tools\asm6 asm/lives_string_counter.asm build/lives_string_counter.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/lives_string_counter.bin" -o "23228" -q

tools\asm6 asm/answers_space_distribution.asm build/answers_space_distribution.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/answers_space_distribution.bin" -o "20C54" -q

tools\asm6 asm/intro_presents.asm build/intro_presents.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/intro_presents.bin" -o "FCDE" -q
echo.
::=============
:: Create Patch
::=============
echo ================= PATCH ===========================
@echo on
tools\flips --create --ips %ROM_ORG% %ROM_ESP% %IPS_PATCH%
tools\flips --create --bps-linear %ROM_ORG% %ROM_ESP% %BPS_PATCH%
@echo off
echo.
echo ====================================================
echo   BUILD COMPLETED SUCCESSFULLY
echo ====================================================
echo.
pause