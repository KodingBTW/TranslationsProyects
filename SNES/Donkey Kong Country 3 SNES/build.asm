; =============================================
;  Main ASM Patch
; =============================================

; --- Mapper --- 
hirom

; --- Include ---
incsrc "asm/fill_free_space.asm"				; Fill free space with $FF
incsrc "asm/funky_rentals_ptr.asm"				; Update pointers for funky rentals shop.
incsrc "asm/stage_complete_checker.asm"			; Stage complete checker display routine.
incsrc "asm/replace_text_flags_routine.asm"		; Remove plural "Kongs" when NPC talk to you.
incsrc "asm/main_menu_languages_routine.asm"	; Change default language for Spanish (old francais).
incsrc "asm/change_ampersand_coop_mode.asm"		; Change "&" for "Y" at coop mode save file.
incsrc "asm/music_test_menu.asm"				; Translate hidden music test menu.
incsrc "asm/game_mode_change_tiles.asm"			; Change game mode string sprites
incsrc "asm/fix_rocket_rush.asm"				; Fix bug at Rocket Rush stage missed "G" letter.
incsrc "asm/fix_pot_hole_panic.asm"				; Fix Pot Hole Panic lag issues at the end of the stage.
incsrc "asm/fix_krevice_kreepers.asm"			; Fix Krevice Kreppers hard balloon in new position.
incsrc "asm/fix_kiddy_palette_color.asm"		; Fix Kiddy wrong color palette in bonus screen when COLOR cheat is enabled.
incsrc "asm/fix_knautilus_electric_ray.asm"		; Fix knautilus electric ray moving at pause.

