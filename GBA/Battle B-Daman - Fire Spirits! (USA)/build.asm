; =============
;  Main ASM 
; =============

; Properties
.gba

.open "Battle B-Daman - Fire Spirits! (ESP).gba","temp.gba",0x8000000

; Free Space
;.defineregion 0x83C2640, 0x3D9C0, 0x00 ; Original no script moved
;.defineregion 0x83D2420, 0x2DBE0, 0x00

; --- Include ---
.include "asm/move_gfx.asm"									; Move compressed graphic to blank space

.include "asm/main_script_pointer_table.asm"  				; Main script pointer table
.include "asm/script_tutorial_pointer_table.asm"  			; Tutorial #1 pointer table
.include "asm/script_tutorial_02_pointer_table.asm"			; Tutorial #2 pointer table
.include "asm/script_players_towns_pointer_table.asm"		; Player name & towns pointer table
.include "asm/script_equip_pointer_table.asm"				; Equip pointer table
.include "asm/script_battle_pointer_table.asm"				; Battle stuff pointer table
.include "asm/script_battle_02_pointer_table.asm"			; Battle stuff #2 pointer table
.include "asm/script_battle_03_pointer_table.asm"			; Battle stuff #3 pointer table
.include "asm/script_items_description_pointer_table.asm"	; Items description pointer table
.include "asm/script_items_pointer_table.asm"				; Items pointer table
.include "asm/script_shop_pointer_table.asm"				; Shop pointer table
.include "asm/script_shop_02_pointer_table.asm"				; Shop #2 pointer table

.close