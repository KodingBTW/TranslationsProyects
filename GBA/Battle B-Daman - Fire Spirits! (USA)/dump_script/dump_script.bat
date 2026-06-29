set ROM="../Battle B-Daman - Fire Spirits! (USA).gba"

..\tools\string_format extract -m "1" -r %ROM% -f "script_debug_menu.txt" -t "main_script_eng.tbl" -o "3BD918" -s "3D4" -b "00"

..\tools\string_format extract -m "1" -r %ROM% -f "script_tutorial_02.txt" -t "main_script_eng.tbl" -o "3BDD50" -s "11B" -b "00"
..\tools\string_format extract -m "1" -r %ROM% -f "script_tutorial.txt" -t "main_script_eng.tbl" -o "3BDE6B" -s "1D56" -b "01"
..\tools\string_format extract -m "1" -r %ROM% -f "script_players_towns.txt" -t "main_script_eng.tbl" -o "3BFBC4" -s "3FC" -b "00"

..\tools\string_format extract -m "1" -r %ROM% -f "main_script.txt" -t "main_script_eng.tbl" -o "3C2140" -s "350F9" -b "00"

..\tools\string_format extract -m "1" -r %ROM% -f "script_equip.txt" -t "main_script_eng.tbl" -o "3FBCB1" -s "33E" -b "00"
..\tools\string_format extract -m "1" -r %ROM% -f "script_battle.txt" -t "main_script_eng.tbl" -o "3FC257" -s "623" -b "00"
..\tools\string_format extract -m "1" -r %ROM% -f "script_battle_02.txt" -t "main_script_eng.tbl" -o "3FCE68" -s "4BF7" -b "00"
..\tools\string_format extract -m "1" -r %ROM% -f "script_battle_03.txt" -t "main_script_eng.tbl" -o "403B9C" -s "1118" -b "00"

..\tools\string_format extract -m "1" -r %ROM% -f "script_items_description.txt" -t "main_script_eng.tbl" -o "405320" -s "9F5A" -b "00"

..\tools\string_format extract -m "1" -r %ROM% -f "script_items.txt" -t "main_script_eng.tbl" -o "4118CE" -s "2167" -b "00"
..\tools\string_format extract -m "1" -r %ROM% -f "script_shop.txt" -t "main_script_eng.tbl" -o "41E198" -s "11E8" -b "00"
..\tools\string_format extract -m "1" -r %ROM% -f "script_shop_02.txt" -t "main_script_eng.tbl" -o "42059C" -s "4B98" -b "00"
pause