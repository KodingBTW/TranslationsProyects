set ROM="../Donkey Kong Country 3.sfc"

if not exist %ROM% (
    echo ERROR: File %ROM% not found.
    echo Window will close...
	pause
    exit
)

:: Uncompressed
::..\tools\bin_manager extract -r %ROM% -f "main_fonts8_8.bin" -o "0x3C14A0" -s "0x650" 
::..\tools\bin_manager extract -r %ROM% -f "main_fonts16_8.bin" -o "0x3C0000" -s "0xF00"
::..\tools\bin_manager extract -r %ROM% -f "race_timer.bin" -o "0x3C3720" -s "0x1E0"
::..\tools\bin_manager extract -r %ROM% -f "choose_play_mode.bin" -o "0x4FA6" -s "0x260"
::..\tools\bin_manager extract -r %ROM% -f "intro_double_trouble.bin" -o "0xE951F" -s "0x640"
::..\tools\bin_manager extract -r %ROM% -f "intro_tm.bin" -o "0xE9B6B" -s "0x40"
::..\tools\bin_manager extract -r %ROM% -f "debbug_music_test.bin" -o "0xE9BD7" -s "0x480"
::..\tools\bin_manager extract -r %ROM% -f "the_end_letters.bin" -o "0x1F5FEE" -s "0x6A0"

:: Compressed
::..\tools\decomp 0 "main_menu_options.bin" %ROM% "0x13FE2A"
::..\tools\decomp 0 "nintendo_presents.bin" %ROM% "0x3316F0"
::..\tools\decomp 0 "game_over.bin" %ROM% "0x18E040"

pause