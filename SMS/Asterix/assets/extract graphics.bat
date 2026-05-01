set ROM="../Asterix (Europe) (En,Fr) (Rev 1).sms"

REM..\tools\sms_rle.py decompress -r %ROM% -f "main_fonts_copia.bin" -o "30730" -s "197"
REM..\tools\sms_rle.py decompress -r %ROM% -f "gfx_round.bin" -o "308C7" -s "130"
REM..\tools\sms_rle.py decompress -r %ROM% -f "gfx_asterix.bin" -o "309F7" -s "234"
REM..\tools\sms_rle.py decompress -r %ROM% -f "gfx_hud.bin" -o "38000" -s "2B6"
REM..\tools\sms_rle.py decompress -r %ROM% -f "titlescreen_fonts.bin" -o "3302A" -s "305"
REM..\tools\sms_rle.py decompress -r %ROM% -f "bonus_screen.bin" -o "2B212" -s "B35"
REM..\tools\sms_rle.py decompress -r %ROM% -f "bonus_perfect.bin" -o "6F7A4" -s "503"
REM..\tools\sms_tilemap_lzss.py decompress -r %ROM% -f "bonus_screen.map" -o "2B0B7" -s "15B"
REM..\tools\sms_rle.py decompress -r %ROM% -f "the_end.bin" -o "5D361" -s "D0"
REM..\tools\bin_manager extract -r %ROM% -f "the_end.map" -o "5D36D" -s "54"

pause