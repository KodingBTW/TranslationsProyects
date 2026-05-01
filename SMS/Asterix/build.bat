::============================================================
:: Asterix - SMS Patch Builder
::============================================================
@echo off
title Asterix - SMS Spanish/Catalan Patch Builder
color 0A
echo ========================================
echo   Asterix - SMS Patch Builder
echo ========================================
echo.
:: -----------
:: FILE PATHS
:: -----------
set ROM_ENG="Asterix (Europe) (En,Fr) (Rev 1).sms"
set ROM_ESP="Asterix (Esp,Cat).sms"
set IPS_PATCH="Asterix (Esp,Cat).ips"
set BPS_PATCH="Asterix (Esp,Cat).bps"

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
tools\sms_rle compress -f "assets/main_fonts.bin" -c "build/main_fonts_c.bin"
tools\bin_manager insert -r %ROM_ESP% -f "build/main_fonts_c.bin" -o "30730" -s "197" --fill "FF"

tools\sms_rle compress -f "assets/gfx_round.bin" -c "build/gfx_round_c.bin"
tools\bin_manager insert -r %ROM_ESP% -f "build/gfx_round_c.bin" -o "308C7" -s "130" --fill "FF"

tools\sms_rle compress -f "assets/gfx_hud.bin" -c "build/gfx_hud_c.bin"
tools\bin_manager insert -r %ROM_ESP% -f "build/gfx_hud_c.bin" -o "38000" -s "2B6" --fill "FF"

tools\sms_rle compress -f "assets/titlescreen_fonts.bin" -c "build/titlescreen_fonts_c.bin"
tools\bin_manager insert -r %ROM_ESP% -f "build/titlescreen_fonts_c.bin" -o "3302A" -s "2E5" --fill "FF"

tools\sms_rle compress -f "assets/bonus_screen.bin" -c "build/bonus_screen_c.bin"
tools\bin_manager insert -r %ROM_ESP% -f "build/bonus_screen_c.bin" -o "2B212" -s "B6E" --fill "FF"

tools\sms_tilemap_lzss compress -f "assets/bonus_screen.map" -c "build/bonus_screen_c.map"
tools\bin_manager insert -r %ROM_ESP% -f "build/bonus_screen_c.map" -o "2BD90" -s "16C"

tools\bin_manager insert -r %ROM_ESP% -f "assets/the_end.map" -o "5D319" -s "54"

::=========
:: Scripts
::=========
echo ================= SCRIPTS =========================
echo.
::ESPAÑOL
tools\asterix_texteditor insert -l "en" -r %ROM_ESP% -f "script/main_script_esp.txt" -t "script/asterix_compressed_script_esp.tbl" -a "asm/main_script_pointers_esp" --fill "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/intro_1_esp.txt" -t "script/asterix_compressed_script_esp_2.tbl" -o "5D70B" -s "488" -l "58"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/intro_2_esp.txt" -t "script/asterix_compressed_script_esp_2.tbl" -o "5DB93" -s "488" -l "58"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/intro_3_esp.txt" -t "script/asterix_compressed_script_esp_2.tbl" -o "5E01B" -s "488" -l "58"
tools\string_format insert -m "0" -r %ROM_ESP% -f "script/bonus_esp.txt" -t "script/asterix_compressed_script_esp_1.tbl" -o "5FF60" -s "A0"

::CATALÁN
tools\asterix_texteditor insert -l "fr" -r %ROM_ESP% -f "script/main_script_cat.txt" -t "script/asterix_compressed_script_esp.tbl" -a "asm/main_script_pointers_cat" --fill "FF"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/intro_1_cat.txt" -t "script/asterix_compressed_script_esp_2.tbl" -o "5E4A3" -s "488" -l "58"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/intro_2_cat.txt" -t "script/asterix_compressed_script_esp_2.tbl" -o "5E92B" -s "488" -l "58"
tools\string_format insert -m "2" -r %ROM_ESP% -f "script/intro_3_cat.txt" -t "script/asterix_compressed_script_esp_2.tbl" -o "5EDB3" -s "488" -l "58"

::=========
:: ASM
::=========
echo.
echo ================== ASM ============================
echo.
tools\asm6 asm/main_script_pointers_table_esp build/main_script_pointers_table_esp.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/main_script_pointers_table_esp.bin" -o "5F40F" -q

tools\asm6 asm/main_script_pointers_table_cat build/main_script_pointers_table_cat.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/main_script_pointers_table_cat.bin" -o "5F41F" -q

tools\asm6 asm/round_sprite.asm build/round_sprite.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/round_sprite.bin" -o "1F480" -q

tools\asm6 asm/tilemap_hud.asm build/tilemap_hud.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/tilemap_hud.bin" -o "382B6" -q

tools\asm6 asm/bonus_screen_hijack.asm build/bonus_screen_hijack.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/bonus_screen_hijack.bin" -o "79B2" -q

tools\asm6 asm/bonus_screen_strings.asm build/bonus_screen_strings.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/bonus_screen_strings.bin" -o "7B10" -q

tools\asm6 asm/bonus_perfect.asm build/bonus_perfect.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/bonus_perfect.bin" -o "6B30" -q

tools\asm6 asm/bonus_perfect_string.asm build/bonus_perfect_string.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/bonus_perfect_string.bin" -o "3BDA8" -q

tools\asm6 asm/cutscene_round_tilemap.asm build/cutscene_round_tilemap.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/cutscene_round_tilemap.bin" -o "30090" -q

tools\asm6 asm/main_screen_tilemap_pointers.asm build/main_screen_tilemap_pointers.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/main_screen_tilemap_pointers.bin" -o "1368" -q

tools\asm6 asm/main_screen_tilemap.asm build/main_screen_tilemap.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/main_screen_tilemap.bin" -o "3330D" -s "1D2" -q

tools\asm6 asm/game_over.asm build/game_over.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/game_over.bin" -o "56D7" -q

tools\asm6 asm/game_over_tilemap.asm build/game_over_tilemap.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/game_over_tilemap.bin" -o "3BDE0" -q

tools\asm6 asm/bonus_game_difficulty_tilemap.asm build/bonus_game_difficulty_tilemap.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/bonus_game_difficulty_tilemap.bin" -o "7439" -q

tools\asm6 asm/credits.asm build/credits.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/credits.bin" -o "5D2D9" -q

tools\asm6 asm/the_end_score.asm build/the_end_score.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/the_end_score.bin" -o "58A2" -q

tools\asm6 asm/copyright.asm build/copyright.bin
tools\bin_manager insert -r %ROM_ESP% -f "build/copyright.bin" -o "7FF50" -q

::=============
:: Create Patch
::=============
echo.
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

