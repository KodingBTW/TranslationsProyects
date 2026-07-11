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
	.word entry_buttons_tileset
	
org 0x08073294
	.word entry_player_name_title_tileset
	
org 0x0801EF60
	.word battle_hud_tileset
	
org 0x0801F55C
	.word battle_hud_02_tileset

org 0x08039B60
	.word command_box_move_01_tileset

org 0x08039B68
	.word command_box_move_02_tileset
	
org 0x08039B70
	.word command_box_talk_01_tileset
	.word command_box_talk_02_tileset
	.word command_box_battle_01_tileset
	.word command_box_battle_02_tileset
	.word command_box_subgame_01_tileset
	.word command_box_subgame_02_tileset
	.word command_box_training_01_tileset
	.word command_box_training_02_tileset
	.word command_box_toolbox_01_tileset
	.word command_box_toolbox_02_tileset
	.word command_box_hint_01_tileset
	.word command_box_hint_02_tileset

org 0x08054D68
	.word toolbox_status_tileset

org 0x08054CD8
	.word toolbox_status_02_tileset
	
org	0x08071898
	.word toolbox_title_tileset
	
org 0x08071C08
	.word toolbox_btn_bdaman_01_tileset
	
org 0x08071C10
	.word toolbox_btn_bdnote_01_tileset

org 0x08071C18
	.word toolbox_btn_save_01_tileset
	
org 0x083BD110
	.word toolbox_btn_bdaman_02_tileset
	
org 0x083BD118
	.word toolbox_btn_bdnote_02_tileset
	
org 0x083BD120
	.word toolbox_btn_save_02_tileset

;bdaman menu	
org 0x08073B10
	.word bdaman_status_tileset
	
; org	0x08073958
	; .word bdaman_status_tileset
	
org 0x08071E64
	.word bdaman_menu_btns_tileset
	
org 0x08072310
	.word bdaman_status_configuration_tileset
	
org 0x08073C60
	.word bdaman_status_configuration_tileset
	
org 0x083BD0A8
	.word bdaman_wheel_customize_tileset
	
org 0x083BD0C0
	.word bdaman_wheel_spa_tileset
	
org 0x083BD0F0
	.word bdaman_wheel_spa_tileset

org 0x083BD0CC
	.word bdaman_wheel_name_tileset
	
org 0x083BD0FC
	.word bdaman_wheel_name_tileset
	
org 0x083BD0B4
	.word bdaman_wheel_copy_tileset
	
org 0x083BD0E4
	.word bdaman_wheel_copy_tileset
	
org 0x08073248
	.word entry_bdaman_name_title_tileset
	
org 0x083BD018
	.word bdanote_btn_characters_tileset

org 0x083BD020
	.word bdanote_btn_bdaman_tileset

org 0x083BD028
	.word bdanote_btn_parts_tileset

org 0x083BD030
	.word bdanote_btn_special_attack_tileset

org 0x083BD038
	.word bdanote_btn_battle_records_tileset
	
org 0x08052978
	.word bdanote_parts_collection_02_tileset
	
org 0x08072AFC
	.word shop_btn_buy_01_tileset
	
org 0x08072B04
	.word shop_btn_sell_01_tileset
	
org 0x08072B0C
	.word shop_btn_code_01_tileset

org 0x083BD144
	.word shop_btn_buy_01_tileset
	.word shop_btn_buy_02_tileset
	.word shop_btn_sell_01_tileset
	.word shop_btn_sell_02_tileset
	.word shop_btn_code_01_tileset
	.word shop_btn_code_02_tileset
	
org	0x08073290
	.word entry_code_name_title_tileset
	
org 0x0807233C
	.word shop_parts_list_tileset

; org 0x08073C8C
	; .word shop_parts_list_tileset
	
org 0x0804D194
	.word summary_bg_box_tileset

org 0x0804D1D8
	.word summary_btn_view_tileset
	
org 0x083B83B4
	.word summary_game_dhb_tileset
	.word summary_game_bshoot_tileset
	.word summary_game_dhb_tileset
	.word summary_game_dhb_tileset
	.word summary_game_dhb_tileset
	.word summary_game_dhb_tileset
	.word summary_game_dhb_tileset
	.word summary_game_dhb_tileset
	.word summary_game_dhb_tileset
	.word summary_game_dhb_tileset
	.word summary_set_1_tileset
	.word summary_set_3_tileset
	.word summary_set_5_tileset
	.word summary_time_60_tileset
	.word summary_time_90_tileset
	.word summary_time_120_tileset

org 0x0807190C
	.word summary_player_bdaman_tileset
	
org 0x0804B09C
	.word loading_screen_time_tileset
	
org 0x0801F824
	.word battle_pause_tileset
	
org 0x0801B6A8
	.word battle_bfire_tileset
	
org 0x0801BEB8
	.word battle_win_tileset
	
org 0x0801C198
	.word battle_lose_tileset

org 0x0801B998
	.word battle_sets_tileset

org 0x0801B9A0
	.word battle_numbers_tileset

org 0x0801BFB4
	.word battle_timeout_tileset
	
org 0x080CD64C
	.word sshot_boost_magnum_tileset
	
org 0x083B8350
	.word battle_result_winner_tileset
	
org 0x083B8358
	.word battle_result_loser_tileset
	
org 0x08049940
	.word battle_result_status_tileset

;===============
; Tilesets Data
;===============
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
	
entry_player_name_title_tileset:
	.incbin "build/entry_player_name_title_c.bin"
	
entry_buttons_tileset:
	.incbin "build/entry_buttons_c.bin"
	
entry_bdaman_name_title_tileset:
	.incbin "build/entry_bdaman_name_title_c.bin"
	
entry_code_name_title_tileset:
	.incbin "build/entry_code_name_title_c.bin"
	
battle_hud_tileset:
	.incbin "build/battle_hud_c.bin"
	
battle_hud_02_tileset:
	.incbin "build/battle_hud_02_c.bin"
	
command_box_move_01_tileset:
 	.incbin "build/command_box_move_01_c.bin"
	
command_box_move_02_tileset:
 	.incbin "build/command_box_move_02_c.bin"
	
command_box_talk_01_tileset:
 	.incbin "build/command_box_talk_01_c.bin"
	
command_box_talk_02_tileset:
 	.incbin "build/command_box_talk_02_c.bin"
	
command_box_battle_01_tileset:
 	.incbin "build/command_box_battle_01_c.bin"
	
command_box_battle_02_tileset:
 	.incbin "build/command_box_battle_02_c.bin"
	
command_box_subgame_01_tileset:
 	.incbin "build/command_box_subgame_01_c.bin"
	
command_box_subgame_02_tileset:
 	.incbin "build/command_box_subgame_02_c.bin"
	
command_box_training_01_tileset:
 	.incbin "build/command_box_training_01_c.bin"
	
command_box_training_02_tileset:
 	.incbin "build/command_box_training_02_c.bin"
	
command_box_toolbox_01_tileset:
 	.incbin "build/command_box_toolbox_01_c.bin"
	
command_box_toolbox_02_tileset:
 	.incbin "build/command_box_toolbox_02_c.bin"
	
command_box_hint_01_tileset:
 	.incbin "build/command_box_hint_01_c.bin"
	
command_box_hint_02_tileset:
 	.incbin "build/command_box_hint_02_c.bin"
		
toolbox_status_tileset:
	.incbin "build/toolbox_status_c.bin"
	
toolbox_status_02_tileset:
	.incbin "build/toolbox_status_02_c.bin"
	
toolbox_title_tileset:	
	.incbin "build/toolbox_title_toolbox_c.bin"
	
toolbox_btn_bdaman_01_tileset:	
	.incbin "build/toolbox_btn_bdaman_01_c.bin"

toolbox_btn_bdnote_01_tileset:	
	.incbin "build/toolbox_btn_bdanote_01_c.bin"

toolbox_btn_save_01_tileset:	
	.incbin "build/toolbox_btn_save_01_c.bin"
	
toolbox_btn_bdaman_02_tileset:	
	.incbin "build/toolbox_btn_bdaman_02_c.bin"

toolbox_btn_bdnote_02_tileset:	
	.incbin "build/toolbox_btn_bdanote_02_c.bin"

toolbox_btn_save_02_tileset:	
	.incbin "build/toolbox_btn_save_02_c.bin"
	
bdaman_status_tileset:
	.incbin "build/bdaman_status_c.bin"
	
bdaman_menu_btns_tileset:
	.incbin "build/bdaman_menu_btns_c.bin"
	
bdaman_status_configuration_tileset:
	.incbin "build/bdaman_status_configuration_c.bin"
	
bdaman_wheel_customize_tileset:
	.incbin "build/bdaman_wheel_customize_c.bin"
	
bdaman_wheel_spa_tileset:
	.incbin "build/bdaman_wheel_spa_c.bin"
	
bdaman_wheel_name_tileset:
	.incbin "build/bdaman_wheel_name_c.bin"
	
bdaman_wheel_copy_tileset:
	.incbin "build/bdaman_wheel_copy_c.bin"
	
bdanote_btn_characters_tileset:
	.incbin "build/bdanote_btn_characters_c.bin"
	
bdanote_btn_bdaman_tileset:
	.incbin "build/bdanote_btn_bdaman_c.bin"
	
bdanote_btn_parts_tileset:
	.incbin "build/bdanote_btn_parts_c.bin"
	
bdanote_btn_special_attack_tileset:
	.incbin "build/bdanote_btn_special_attack_c.bin"
	
bdanote_btn_battle_records_tileset:
	.incbin "build/bdanote_btn_battle_records_c.bin"
	
bdanote_parts_collection_02_tileset:
	.incbin "build/bdanote_parts_collection_02_c.bin"
	
shop_btn_buy_01_tileset:
	.incbin "build/shop_btn_buy_01_c.bin"
	
shop_btn_buy_02_tileset:
	.incbin "build/shop_btn_buy_02_c.bin"
	
shop_btn_sell_01_tileset:
	.incbin "build/shop_btn_sell_01_c.bin"
	
shop_btn_sell_02_tileset:
	.incbin "build/shop_btn_sell_02_c.bin"
	
shop_btn_code_01_tileset:
	.incbin "build/shop_btn_code_01_c.bin"
	
shop_btn_code_02_tileset:
	.incbin "build/shop_btn_code_02_c.bin"
	
shop_parts_list_tileset:
	.incbin "build/shop_parts_list_c.bin"
	
summary_bg_box_tileset:
	.incbin "build/summary_bg_box_c.bin"
	
summary_btn_view_tileset:
	.incbin "build/summary_btn_view_c.bin"
	
summary_game_bshoot_tileset:
	.incbin "build/summary_game_bshoot_c.bin"
	
summary_game_dhb_tileset:
	.incbin "build/summary_game_dhb_c.bin"
	
summary_set_1_tileset:
	.incbin "build/summary_set_1_c.bin"
	
summary_set_3_tileset:
	.incbin "build/summary_set_3_c.bin"
	
summary_set_5_tileset:
	.incbin "build/summary_set_5_c.bin"
	
summary_time_60_tileset:
	.incbin "build/summary_time_60_c.bin"
	
summary_time_90_tileset:
	.incbin "build/summary_time_90_c.bin"
	
summary_time_120_tileset:
	.incbin "build/summary_time_120_c.bin"
	
summary_player_bdaman_tileset:
	.incbin "build/summary_player_bdaman_c.bin"

loading_screen_time_tileset:	
	.incbin "build/loading_screen_time_c.bin"

battle_pause_tileset:
	.incbin "build/battle_pause_c.bin"
	
battle_bfire_tileset:
	.incbin "build/battle_bfire_c.bin"
	
battle_win_tileset:
	.incbin "build/battle_win_c.bin"

battle_lose_tileset:
	.incbin "build/battle_lose_c.bin"

battle_sets_tileset:
	.incbin "build/battle_sets_c.bin"

battle_numbers_tileset:
	.incbin "build/battle_numbers_c.bin"

battle_timeout_tileset:
	.incbin "build/battle_timeout_c.bin"

battle_result_winner_tileset:
	.incbin	"build/battle_result_winner_c.bin"
	
battle_result_loser_tileset:
	.incbin	"build/battle_result_loser_c.bin"

battle_result_status_tileset:
	.incbin	"build/battle_result_status_c.bin"

sshot_boost_magnum_tileset:
	.incbin "build/sshot_boost_magnum_c.bin"


