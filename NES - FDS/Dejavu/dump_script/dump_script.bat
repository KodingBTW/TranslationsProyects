set ROM_ENG="../Deja Vu (USA).nes"

..\tools\dejavu_texteditor.py extract -r %ROM_ENG% -f "main_script.txt" -t "main_script_eng.tbl"
..\tools\string_format extract -m "2" -r %ROM_ENG% -f "item_list_1.txt" -t "items_eng.tbl" -o "8D10" -s "1D8" -l "8"
..\tools\string_format extract -m "2" -r %ROM_ENG% -f "item_list_2.txt" -t "items_eng.tbl" -o "8F10" -s "90" -l "8"
..\tools\string_format extract -m "2" -r %ROM_ENG% -f "item_list_3.txt" -t "items_eng.tbl" -o "9010" -s "230" -l "8"
..\tools\string_format extract -m "2" -r %ROM_ENG% -f "item_list_4.txt" -t "items_eng.tbl" -o "9290" -s "C0" -l "8"
..\tools\string_format extract -m "2" -r %ROM_ENG% -f "item_list_5.txt" -t "items_eng.tbl" -o "9390" -s "B0" -l "8"
..\tools\string_format extract -m "2" -r %ROM_ENG% -f "item_list_6.txt" -t "items_eng.tbl" -o "9510" -s "320" -l "8"
..\tools\string_format extract -m "0" -r %ROM_ENG% -f "item_list_7.txt" -t "items_eng.tbl" -o "9890" -s "1F"
..\tools\string_format extract -m "2" -r %ROM_ENG% -f "item_list_8.txt" -t "items_eng.tbl" -o "98AF" -s "1F0" -l "8"
..\tools\string_format extract -m "1" -r %ROM_ENG% -f "main_script_end.txt" -t "script_end_eng.tbl" -o "1BC7C" -s "394" -b "FF"

pause