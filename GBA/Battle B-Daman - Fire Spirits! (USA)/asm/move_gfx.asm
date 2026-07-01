org 0x0804F388
	.word title_screen_logo_tileset
	
org 0x0804F3B8
	.word title_screen_license_tileset

org 0x0804F400
	.word title_screen_start_tileset
	
org 0x083B8528
	.word title_screen_bdaworld_tileset
	
org 0x083B853C
	.word title_screen_system_setting_tileset

org 0x083B86E0
	.word nintendo_license_tileset
	
org 0x0804E878
	.word settings_01_tileset
	
org 0x0804E890	
	.word settings_02_tileset
	
org	0x08064CA4
	.word name_entry_buttons_tileset
	
org 0x08073294
	.word name_entry_title_tileset

org 0x0801EF60
	.word battle_hud_tileset
	
org 0x0801F55C
	.word battle_hud_02_tileset

	
org 0x08870000
nintendo_license_tileset:
	.incbin "build/nintendo_license_c.bin"
	
title_screen_logo_tileset:
	.incbin "build/title_screen_logo_c.bin"
	
title_screen_license_tileset:
	.incbin "build/title_screen_license_c.bin"
	
title_screen_start_tileset:
	.incbin "build/title_screen_start_c.bin"

title_screen_bdaworld_tileset:
	.incbin "build/main_screen_bdaworld_c.bin"
	
title_screen_system_setting_tileset:
	.incbin "build/main_screen_system_settings_c.bin"
	
settings_01_tileset:
	.incbin "build/settings_menu_01_c.bin"
	
settings_02_tileset:
	.incbin "build/settings_menu_02_c.bin"
	
name_entry_title_tileset:
	.incbin "build/name_entry_title_c.bin"
	
name_entry_buttons_tileset:
	.incbin "build/name_entry_buttons_c.bin"
	
battle_hud_tileset:
	.incbin "build/battle_hud_c.bin"
	
battle_hud_02_tileset:
	.incbin "build/battle_hud_02_c.bin"