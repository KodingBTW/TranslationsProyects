::=====================================================
:: Wurm - NES Patch Builder
::=====================================================
@echo off
title Wurm - NES Spanish Patch Builder
color 0A
echo =====================================================
echo   Wurm - NES Patch Builder
echo =====================================================
echo.

:: -----------
:: FILE PATHS
:: -----------
set ROM_ESP="Wurm (ESP).nes"
set ROM_ENG="Wurm.nes"
set IPS_PATCH="Wurm (ESP).ips"
set BPS_PATCH="Wurm (ESP).bps"

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
:: GFX
::=========
echo ================== GFX ============================
echo.
tools\bin_manager insert -r %ROM_ESP% -f assets\title_fonts.bin -o 3D010 -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f assets\main_fonts.bin -o 3F010 -s "1000"
tools\bin_manager insert -r %ROM_ESP% -f build\title_screen_tilemap_c.map -o 17DE0 -s "215"
::=========
:: Scripts
::=========
echo ================= SCRIPTS =========================
:: Main Script 1 y 2
tools\wurm_texteditor insert -r %ROM_ESP% -f "script/main_script_esp.txt" -t "script/wurm_main_script_esp.tbl" -a "asm/main_script_offsets" --fill
tools\asm6 asm/main_script_pointers1.asm build/main_script_pointers1.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/main_script_pointers1.bin" -o "1DF4" -q

tools\asm6 asm/main_script_pointers2.asm build/main_script_pointers2.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/main_script_pointers2.bin" -o "1AF77" -q

:: Screen Messages
tools\string_format insert -m "0" -r %ROM_ESP% -f "script/screen_messages_esp.txt" -t "script/wurm_screen_messages.tbl" -o "1C20A" -s "D2" --asm "asm/screen_messages_offsets" -p "2b" --type "0" --base "C1FA"
tools\string_format insert -m "0" -r %ROM_ESP% -f "script/screen_messages_esp.txt" -t "script/wurm_screen_messages.tbl" -o "1C20A" -s "D2" --asm "asm/screen_messages_lengths" -p "1bi" --type "0" --base "00"
tools\asm6 asm/screen_messages_pointer_table.asm build/screen_messages_pointer_table.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/screen_messages_pointer_table.bin" -o "1C129" -q
tools\asm6 asm/screen_messages_length_table.asm build/screen_messages_length_table.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/screen_messages_length_table.bin" -o "1C1C9" -q

tools\string_format insert -m "2" -r %ROM_ESP% -f "script/vzr_forms_esp.txt" -t "script/wurm_hud.tbl" -o "1CD23" -s "100" -l "32" -b "00"
tools\string_format insert -m "0" -r %ROM_ESP% -f "script/hud_esp.txt" -t "script/wurm_hud.tbl" -o "1CB2B" -s "1B0"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/hud_battle_esp.txt" -t "script/wurm_hud.tbl" -o "06BF" -s "15" -l "7" -b "00"
tools\string_format insert -m "0" -r %ROM_ESP% -f "script/hud_battle2_esp.txt" -t "script/wurm_hud.tbl" -o "1B364" -s "158"
tools\string_format insert -m "0" -r %ROM_ESP% -f "script/hud_battle3_esp.txt" -t "script/wurm_hud.tbl" -o "1B2C9" -s "23"

tools\string_format insert -m "0" -r %ROM_ESP% -f "script/the_end_cutscene_esp.txt" -t "script/wurm_screen_messages.tbl" -o "1723B" -s "5AB" --asm "asm/the_end_cutscene_offsets" -p "2b" --type "0" --base "B22B" --fill "00"
tools\string_format insert -m "0" -r %ROM_ESP% -f "script/the_end_cutscene_esp.txt" -t "script/wurm_screen_messages.tbl" -o "1723B" -s "5AB" --asm "asm/the_end_cutscene_lengths" -p "1bi" --type "0" --base "00" --fill "00"
tools\asm6 asm/the_end_cutscenes_pointer_table.asm build/the_end_cutscenes_pointer_table.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/the_end_cutscenes_pointer_table.bin" -o "1710C" -q
tools\asm6 asm/the_end_cutscenes_length_table.asm build/the_end_cutscenes_length_table.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/the_end_cutscenes_length_table.bin" -o "1719E" -q
::=========
:: ASM
::=========
echo.
echo ================== ASM ============================
echo.
tools\asm6 asm/game_over_password.asm build/game_over_password.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/game_over_password.bin" -o "1D4DA" -q

tools\asm6 asm/vrz_forms_sprites_blink.asm build/vrz_forms_sprites_blink.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/vrz_forms_sprites_blink.bin" -o "7A66" -q

tools\asm6 asm/title_screen_move.asm build/title_screen_move.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/title_screen_move.bin" -o "1709A" -q

tools\asm6 asm/screen_messages_position.asm build/screen_messages_position.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/screen_messages_position.bin" -o "1C1AF" -q

tools\asm6 asm/copyright.asm build/copyright.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/copyright.bin" -o "1FF80" -q

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

