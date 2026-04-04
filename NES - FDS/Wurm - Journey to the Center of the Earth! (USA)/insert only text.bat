set ROM_ESP="Wurm (ESP).nes"
set ROM_ENG="Wurm.nes"
set IPS_PATCH="Wurm (ESP).ips"
set BPS_PATCH="Wurm (ESP).bps"
:loop
	tools\wurm_texteditor.py insert -r %ROM_ESP% -f "script/main_script_esp.txt" -t "script/wurm_main_script_esp.tbl" -a "asm/main_script_offsets" --fill
	tools\asm6 asm/main_script_pointers1.asm build/main_script_pointers1.bin
	tools\bin_manager insert -r %ROM_ESP% -f "build/main_script_pointers1.bin" -o "1DF4" -q
	tools\asm6 asm/main_script_pointers2.asm build/main_script_pointers2.bin
	tools\bin_manager insert -r %ROM_ESP% -f "build/main_script_pointers2.bin" -o "1AF77" -q
	pause
	goto :loop