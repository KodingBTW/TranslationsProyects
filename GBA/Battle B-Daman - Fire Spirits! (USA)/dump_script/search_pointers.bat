set ROM="../Battle B-Daman - Fire Spirits! (USA).gba"

..\tools\pointers_scan.py -r %ROM% -f "../asm/script_shop_02_offsets.asm" -o "425134" -s "10000" -p "4b" --base "8000000" --type "2" --out "../asm/search_result.asm"

pause