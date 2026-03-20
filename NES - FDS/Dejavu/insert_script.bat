set ROM_ESP="Deja Vu (ESP).nes"

:loop
	tools\dejavu_texteditor insert -r %ROM_ESP% -f "script/main_script.txt" -t "script/main_script_esp.tbl" --asm "asm/main_script"
	if errorlevel 1 goto :skip1
	tools\asm6 asm/pointers_table_script_3.asm build/pointers_table_script_3.bin
	tools\bin_manager insert -r %ROM_ESP% -f "build/pointers_table_script_3.bin" -o "10010" -q
	:skip1
	tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_1.txt" -t "script/items_esp.tbl" -o "8D10" -s "1D8" -l "8" -b "FF"
	tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_2.txt" -t "script/items_esp.tbl" -o "8F10" -s "90" -l "8" -b "FF"
	tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_3.txt" -t "script/items_esp.tbl" -o "9010" -s "230" -l "8" -b "FF"
	tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_4.txt" -t "script/items_esp.tbl" -o "9290" -s "C0" -l "8" -b "FF"
	tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_5.txt" -t "script/items_esp.tbl" -o "9390" -s "B0" -l "8" -b "FF"
	tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_6.txt" -t "script/items_esp.tbl" -o "9510" -s "320" -l "8" -b "FF"
	tools\string_format insert -m "0" -r %ROM_ESP% -f "script/item_list_7.txt" -t "script/items_esp.tbl" -o "9890" -s "1F"
	tools\string_format insert -m "2" -r %ROM_ESP% -f "script/item_list_8.txt" -t "script/items_esp.tbl" -o "98AF" -s "1F0" -l "8" -b "FF"

	tools\string_format insert -m "1" -r %ROM_ESP% -f "script/main_script_end.txt" -t "script/script_end_esp.tbl" -o "1BC7C" -s "394" --asm "asm/end_script_offsets" -p 2b --base "BC6C" --type 0
	if errorlevel 1 goto :skip2
	tools\asm6 asm/end_script_pointers.asm build/end_script_pointers.bin
	tools\bin_manager insert -r %ROM_ESP% -f "build/end_script_pointers.bin" -o "1BC10" -q
	:skip2
	pause
	echo "Press any key to reinsert..."
	goto :loop