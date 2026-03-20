set ROM_ORG="../Uninvited (U)_uncensored.nes"

..\tools\uninvited_texteditor.py extract -r %ROM_ORG% -f "main_script_eng.txt" -t "main_script_eng.tbl"
..\tools\string_format extract -m "2" -r %ROM_ORG% -f "item_list_1.txt" -t "items_eng.tbl" -o "F010" -s "160" -l "8"
..\tools\string_format extract -m "2" -r %ROM_ORG% -f "item_list_2.txt" -t "items_eng.tbl" -o "F190" -s "60" -l "8"
..\tools\string_format extract -m "2" -r %ROM_ORG% -f "item_list_3.txt" -t "items_eng.tbl" -o "F218" -s "B0" -l "8"
..\tools\string_format extract -m "2" -r %ROM_ORG% -f "item_list_4.txt" -t "items_eng.tbl" -o "F390" -s "40" -l "8"
..\tools\string_format extract -m "2" -r %ROM_ORG% -f "item_list_5.txt" -t "items_eng.tbl" -o "F410" -s "30" -l "8"
..\tools\string_format extract -m "2" -r %ROM_ORG% -f "spell_list.txt" -t "items_eng.tbl" -o "F490" -s "30" -l "8"
..\tools\string_format extract -m "2" -r %ROM_ORG% -f "item_list_6.txt" -t "items_eng.tbl" -o "F4C0" -s "2D8" -l "8"
pause