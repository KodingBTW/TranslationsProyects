set ROM="../Wurm.nes"

..\tools\wurm_texteditor extract -r %ROM% -f "main_script_eng.txt" -t "wurm_main_script_eng.tbl"
REM ..\tools\string_format extract -m "0" -r %ROM% -f "screen_messages_eng.txt" -t "wurm_screen_messages.tbl" -o "1C20A" -s "D2" --no-comments
..\tools\string_format extract -m "2" -r %ROM% -f "vzr_forms_eng.txt" -t "wurm_hud.tbl" -o "1CD23" -s "100" -l "32"
..\tools\string_format extract -m "0" -r %ROM% -f "hud_eng.txt" -t "wurm_hud.tbl" -o "1CB2B" -s "1B0"
..\tools\string_format extract -m "2" -r %ROM% -f "hud_battle_eng.txt" -t "wurm_hud.tbl" -o "06BF" -s "15" -l "7"
..\tools\string_format extract -m "0" -r %ROM% -f "hud_battle2_eng.txt" -t "wurm_hud.tbl" -o "1B364" -s "158"
..\tools\string_format extract -m "0" -r %ROM% -f "hud_battle3_eng.txt" -t "wurm_hud.tbl" -o "1B2C9" -s "23"
rem ..\tools\string_format extract -m "0" -r %ROM% -f "the_end_cutscene_eng.txt" -t "wurm_screen_messages.tbl" -o "1723B" -s "398" --no-comments

pause