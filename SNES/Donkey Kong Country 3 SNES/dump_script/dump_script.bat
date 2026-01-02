set ROM_ENG="../Donkey Kong Country 3.sfc"

if not exist %ROM_ENG% (
    echo ERROR: File %ROM_ENG% not found.
    echo Window will close...
	pause
    exit
)

..\tools\dkc3_texteditor extract -l en -r %ROM_ENG% -f "dkc3_script" -t "dkc3_en.tbl"
If errorlevel 1 pause
..\tools\string_format extract -r %ROM_ENG% -f "dkc3_credits_album.txt" -t "dkc3_en.tbl" -o "C829" -s "21C" -l "540"
If errorlevel 1 pause
..\tools\string_format extract -r %ROM_ENG% -f "dkc3_credits_staff_en.txt" -t "dkc3_en.tbl" -o "32A126" -s "4DB" -l "1243"
If errorlevel 1 pause
..\tools\string_format extract -r %ROM_ENG% -f "dkc3_credits_staff_fr.txt" -t "dkc3_fr.tbl" -o "32A601" -s "4D1" -l "1233"
If errorlevel 1 pause
..\tools\string_format extract -r %ROM_ENG% -f "dkc3_credits_staff_de.txt" -t "dkc3_de.tbl" -o "32AAD2" -s "50C" -l "1292"
If errorlevel 1 pause
..\tools\string_format extract -r %ROM_ENG% -f "dkc3_language_settings.txt" -t "dkc3_en.tbl" -o "C349" -s "20" -l "32"
If errorlevel 1 pause
..\tools\string_format extract -r %ROM_ENG% -f "dkc3_record_message_multi3.txt" -t "dkc3_fonts_16_8.tbl" -o "BEDB" -s "28" -l "40"
If errorlevel 1 pause
..\tools\string_format extract -r %ROM_ENG% -f "dkc3_funkys_rentals_multi3.txt" -t "dkc3_fonts_16_8.tbl" -o "34F4A5" -s "8A" -l "138"
If errorlevel 1 pause
..\tools\string_format extract -r %ROM_ENG% -f "dkc3_swanky_minigames_multi3.txt" -t "dkc3_fonts_16_8.tbl" -o "34F52F" -s "108" -l "264"
If errorlevel 1 pause
..\tools\string_format extract -r %ROM_ENG% -f "dkc3_music_test.txt" -t "dkc3_en.tbl" -o "C421" -s "1D6" -l "470"
If errorlevel 1 pause
..\tools\string_format extract -r %ROM_ENG% -f "dkc3_enter_box.txt" -t "dkc3_en.tbl" -o "C650" -s "28" -l "40"
If errorlevel 1 pause
..\tools\hexstring extractconfig "dkc3_bonus_games_multi3_config.json"
If errorlevel 1 pause

pause