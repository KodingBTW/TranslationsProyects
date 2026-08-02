set ROM_ORG="../The Simpsons - Bart vs. the World (U).nes"

..\tools\bin_manager extract -r %ROM_ORG% -f "main_fonts.bin" -o "40010" -s "400"
..\tools\bin_manager extract -r %ROM_ORG% -f "pick_coffin.bin" -o "44010" -s "1000"
..\tools\bin_manager extract -r %ROM_ORG% -f "map_icons.bin" -o "5C010" -s "1000"
..\tools\bin_manager extract -r %ROM_ORG% -f "sliding_puzzle_1.bin" -o "5E010" -s "1000"
..\tools\bin_manager extract -r %ROM_ORG% -f "sliding_puzzle_2.bin" -o "5F010" -s "1000"
..\tools\bin_manager extract -r %ROM_ORG% -f "intro.bin" -o "57810" -s "800"
..\tools\tilemap_editor.py decompress -r %ROM_ORG% -f "main_menu_tilemap.map" -o "3AE42" -s "157"
..\tools\tilemap_editor.py decompress -r %ROM_ORG% -f "pick_coffin_tilemap.map" -o "AF13" -s "209"
pause