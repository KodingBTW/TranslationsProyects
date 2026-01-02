::=====================================================
:: Donkey Kong Country 3 - SNES Spanish Patch Builder
::=====================================================
@echo off
title DKC3 Spanish Patch Builder
color 0A
echo =====================================================
echo   Donkey Kong Country 3 - SNES Spanish Patch Builder
echo =====================================================
echo.

:: -----------
:: FILE PATHS
:: -----------
set ROM_ESP="Donkey Kong Country 3 (ESP).sfc"
set ROM_ENG="Donkey Kong Country 3.sfc"
set IPS_PATCH="Donkey Kong Country 3 (ESP).ips"
set BPS_PATCH="Donkey Kong Country 3 (ESP).bps"

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
tools\asar build.asm %ROM_ESP%
if errorlevel 1 (
    echo [ERROR] ASM insertion failed
    pause
    exit
)
echo [OK] All ASM scripts inserted
echo.
::=========
:: GFX
::=========
echo ================== GFX ============================

::Uncompressed
tools\bin_manager insert -r %ROM_ESP% -f "assets/main_fonts8_8.bin" -o "0x3C14A0" -s "0x650"
tools\bin_manager insert -r %ROM_ESP% -f "assets/main_fonts16_8.bin" -o "0x3C0000" -s "0xF00"
tools\bin_manager insert -r %ROM_ESP% -f "assets/race_timer.bin" -o "0x3C3720" -s "0x1E0"
tools\bin_manager insert -r %ROM_ESP% -f "assets/choose_play_mode.bin" -o "0x4FA6" -s "0x260"
tools\bin_manager insert -r %ROM_ESP% -f "assets/intro_double_trouble.bin" -o "0xE951F" -s "0x640"
tools\bin_manager insert -r %ROM_ESP% -f "assets/intro_tm.bin" -o "0xE9B6B" -s "0x40"
tools\bin_manager insert -r %ROM_ESP% -f "assets/debbug_music_test.bin" -o "0xE9BD7" -s "0x480"

::Compressed
tools\comp 0 "build/main_menu_options_c.bin" "assets/main_menu_options.bin"
tools\bin_manager insert -r %ROM_ESP% -f "build/main_menu_options_c.bin" -o "0x13FE2A" -s "0x1FB6"

tools\comp 0 "build/nintendo_presents_c.bin" "assets/nintendo_presents.bin"
tools\bin_manager insert -r %ROM_ESP% -f "build/nintendo_presents_c.bin" -o "0x3316F0" -s "0x448"
echo.
echo [OK] All GFX inserted
echo.
::=========
:: Scripts
::=========
echo ================= SCRIPTS =========================
:: Main Script
:: dkc3_script_1 SWANKY KONG
:: dkc3_script_2 WRINKLY KONG
:: dkc3_script_3 FUNKY KONG
:: dkc3_script_4 CRANKY KONG
:: dkc3_script_5 MISC./RATING SYSTEM
:: dkc3_script_6 STAGE NAMES
:: dkc3_script_7 BAZAAR(OVERWORLD/BEGINNING)
:: dkc3_script_8 BLUNDER(OVERWORLD/WEST KREEMWOOD FOREST)
:: dkc3_script_9 BRAMBLE(OVERWORLD/EAST COTTON-TOP COVE)
:: dkc3_script_10 BARTER(OVERWORLD/SOUTH K3)
:: dkc3_script_11 BARNACLE(LAKE ORANGATANGA)
:: dkc3_script_12 BRASH(KREMWOOD FOREST)
:: dkc3_script_13 BLUE(COTTON-TOP COVE)
:: dkc3_script_14 BAZOOKA(MEKANOS)
:: dkc3_script_15 BLIZZARD(K3)
:: dkc3_script_16 BENNY/BJÖRN(RAZOR RIDGE)
:: dkc3_script_17 BAFFLE(KAOS KORE)
:: dkc3_script_18 BOOMER(KREMATOA)
:: dkc3_script_19 KAOS/K. ROOLENSTEIN/FINAL SECUENCE
:: dkc3_script_20 BANANA BIRD QUEEN
tools\dkc3_texteditor insert -l fr -r %ROM_ESP% -f "script/dkc3_script_es" -t "script/dkc3_es.tbl"
If errorlevel 1 pause
:: CREDITS ALBUM ENEMY NAMES (ALBUM PAGE COVERS IN MAIN SCRIPT 6)
tools\string_format insert -r %ROM_ESP% -f "script/dkc3_credits_album.txt" -t "script/dkc3_es.tbl" -o "C829" -s "21C" -l "540" -b "FF"
If errorlevel 1 pause
:: CREDITS STAFF
tools\string_format insert -r %ROM_ESP% -f "script/dkc3_credits_staff_es.txt" -t "script/dkc3_fonts_16_8_es.tbl" -o "32A601" -s "5DB" -l "1499" -b "FF"
If errorlevel 1 pause
:: LANGUAGES, SOUND (STEREO/MONO)
tools\string_format insert -r %ROM_ESP% -f "script/dkc3_language_settings.txt" -t "script/dkc3_es.tbl" -o "C349" -s "20" -l "32" -b "FF"
If errorlevel 1 pause
:: RECORD MESSAGE FOR BEATING BRASH RECORD AT RIVERSIDE RACE
tools\string_format insert -r %ROM_ESP% -f "script/dkc3_record_message_multi3.txt" -t "script/dkc3_fonts_16_8_es.tbl" -o "BEDB" -s "28" -l "40" -b "FF"
If errorlevel 1 pause
:: FUNKY RENTALS SHOP
tools\string_format insert -r %ROM_ESP% -f "script/dkc3_funkys_rentals_multi3.txt" -t "script/dkc3_fonts_16_8_es.tbl" -o "34F4A5" -s "8A" -l "138" -b "FF"
If errorlevel 1 pause
:: SWANKY SIDESHOW MINIGAMES
tools\string_format insert -r %ROM_ESP% -f "script/dkc3_swanky_minigames_multi3.txt" -t "script/dkc3_fonts_16_8_es.tbl" -o "34F52F" -s "C1" -l "193"
If errorlevel 1 pause
:: HIDDEN MENU MUSIC TEST DEBBUG (USE MUSIC CODE) INSERTED WITH ASM
::tools\string_format insert -r %ROM_ESP% -f "script/dkc3_music_test.txt" -t "script/dkc3_music_test.tbl" -o "C421" -s "1D6" -l "470" -b "FF"
::If errorlevel 1 pause
:: CHARACTERS ALLOWED IN ENTERBOX FOR FILENAME SAVE
tools\string_format insert -r %ROM_ESP% -f "script/dkc3_enter_box.txt" -t "script/dkc3_es.tbl" -o "C650" -s "28" -l "40" -b "FF"
If errorlevel 1 pause
:: BONUS GAMES MESSAGES FOR 'BONUS' COINS
tools\hexstring insertconfig "script/dkc3_bonus_games_multi3_config.json"
If errorlevel 1 pause
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