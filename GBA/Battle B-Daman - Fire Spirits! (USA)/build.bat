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

tools\rom_expander.py -r %ROM_ESP% -e 9

::=========
:: GFX
::=========
echo ================== GFX ============================
echo.
:: Compress GFX
tools\bbd_nybbles.py compress -f "assets/main_fonts.bin" -c "build/main_fonts_c.bin"
tools\bin_manager insert -r %ROM_ESP% -f "build/main_fonts_c.bin" -o "CF75C" -s "6A40"
tools\bin_manager insert -r %ROM_ESP% -f "assets/name_entry_buttons_02.bin" -o "74B530" -s "200"

REM tools\bbd_lz_rle.py pack -o "build/nintendo_license_c.bin"  "assets/nintendo_license.bin"
tools\bbd_lz_rle.py pack -o "build/title_screen_logo_c.bin"  "assets/title_screen_logo.bin"
tools\bbd_lz_rle.py pack -o "build/title_screen_license_c.bin"  "assets/title_screen_license.bin"
tools\bbd_lz_rle.py pack -o "build/title_screen_start_c.bin"  "assets/title_screen_start.bin"
tools\bbd_lz_rle.py pack -o "build/main_screen_bdaworld_c.bin"  "assets/main_screen_bdaworld.bin"
tools\bbd_lz_rle.py pack -o "build/main_screen_system_settings_c.bin"  "assets/main_screen_system_settings.bin"
tools\bbd_lz_rle.py pack -o "build/settings_menu_01_c.bin"  "assets/settings_menu_01.bin"
tools\bbd_lz_rle.py pack -o "build/settings_menu_02_c.bin"  "assets/settings_menu_02.bin"
tools\bbd_lz_rle.py pack -o "build/name_entry_buttons_c.bin"  "assets/name_entry_buttons.bin"
tools\bbd_lz_rle.py pack -o "build/name_entry_title_c.bin"  "assets/name_entry_title.bin"
tools\bbd_lz_rle.py pack -o "build/battle_hud_c.bin"  "assets/battle_hud.bin"
tools\bbd_lz_rle.py pack -o "build/battle_hud_02_c.bin"  "assets/battle_hud_02.bin"

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