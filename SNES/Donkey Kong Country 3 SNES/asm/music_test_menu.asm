; Spanish characters
!A = $24
!E = $25
!I = $26
!O = $3F
!U = $28
!N = $29

org $80C385
music_ptr_list:
    dw no_song					: db $00,$00 ; BLANK SPACE
    dw no_song					: db $00,$00 ; BLANK SPACE
    dw song_dixie_beat           : db $18,$00 ; DIXIE BEAT
    dw song_crazy_calipso        : db $22,$00 ; CRAZY CALYPSO
    dw song_cavern_caprice       : db $1E,$00 ; CAVERN CAPRICE
    dw song_water_world          : db $06,$00 ; WATER WORLD
    dw song_rockface_rumble      : db $21,$00 ; ROCKFACE RUMBLE
    dw song_jungle_jitter        : db $1D,$00 ; JUNGLE JITTER
    dw song_nuts_and_bolts       : db $08,$00 ; NUTS AND BOLTS
    dw song_mill_fever           : db $0E,$00 ; MILL FEVER
    dw song_enchanted_riverbank  : db $10,$00 ; ENCHANTED RIVERBANK
    dw song_frosty_frolics       : db $17,$00 ; FROSTY FROLICS
    dw song_stilt_village        : db $0F,$00 ; STILT VILLAGE
    dw song_tree_top_tumble      : db $0B,$00 ; TREE TOP TUMBLE
    dw song_pokey_pipes          : db $19,$00 ; POKEY PIPES
    dw song_cascade_capers       : db $0A,$00 ; CASCADE CAPERS
    dw song_boss_boogie          : db $0C,$00 ; BOSS BOOGGIE
    dw song_big_boss_blues       : db $1A,$00 ; BIG BOSS BLUES
    dw song_bonus_time           : db $01,$04 ; BONUS TIME!
    dw song_fanfare              : db $16,$01 ; FANFARE
    dw song_hangin_at_funkys     : db $15,$00 ; HANGIN' AT FUNKY'S
    dw song_wrinkly_save         : db $05,$02 ; WRINKLY SAVE CAVE
    dw song_get_git_a_go_go      : db $05,$00 ; GET GIT A-GO-GO
    dw song_wrinkly_64           : db $05,$01 ; WRINKLY 64
    dw song_swanky_sideshow      : db $09,$00 ; SWANKY'S SIDE SHOW
    dw song_cranky_showdown      : db $09,$01 ; CRANKY'S SHOWDOWN
    dw song_brother_bear         : db $04,$00 ; BROTHER BEAR
    dw song_northern_kremisphere : db $13,$00 ; NORTHERN KREMISPHERE
    dw song_submap_shuffle       : db $11,$00 ; SUBMAP SHUFFLE
    dw song_krematoa_koncert     : db $12,$00 ; KREMATOA KONCERT
    dw song_hot_pursuit          : db $07,$00 ; HOT PURSUIT
    dw song_crystal_chasm        : db $1B,$00 ; CRISTAL CHASM
    dw song_rocket_run           : db $1C,$00 ; ROCKET RUN
    dw song_baddies_on_parade    : db $20,$00 ; BADDIES ON PARADE
    dw song_game_over            : db $14,$01 ; GAME OVER
    dw song_jangle_bells         : db $0D,$00 ; JANGLE BELLS
    dw song_mama_bird            : db $23,$00 ; MAMA BIRD
    dw no_song : db $00,$00 ; BLANK SPACE
    dw no_song : db $00,$00 ; BLANK SPACE
	
no_song:
	db $A0

song_cavern_caprice:
    db "CUEVA CAPRICH",$CF

song_water_world:
    db "MUNDO SUBACU",!A,"TIC",$CF

song_rockface_rumble:
    db "RITMO ROCKER",$CF

song_jungle_jitter:
    db "RITMO DEL ",!A,"RBO",$CC

song_nuts_and_bolts:
    db "NUECES Y RAYO",$D3

song_mill_fever:
    db "FIEBRE EN EL MOLIN",$CF

song_enchanted_riverbank:
    db "R",!I,"O ENCANTAD",$CF

song_hot_pursuit:
    db "PERSECUCI",!O,$CE

song_rocket_run:
    db "CARRERA DE COHETE",$D3

song_frosty_frolics:
    db "FROLICS HELADO",$D3

song_stilt_village:
    db "ALDEA PILOT",$C5

song_tree_top_tumble:
    db "TEMBLOR SALVAJ",$C5

song_pokey_pipes:
    db "TUBER",!I,"AS BAILONA",$D3

song_cascade_capers:
    db "CATARAT",$C1

song_boss_boogie:
    db "BAILE DEL JEF",$C5

song_big_boss_blues:
    db "BLUES DEL L",!I,"DE",$D2

song_bonus_time:
    db "TIEMPO EXTR",$C1

song_wrinkly_save:
    db "CUEVA DE WRINKL",$D9

song_get_git_a_go_go:
    db "ZUMB",$C1

song_wrinkly_64:
    db "WRINKLY 6",$B4

song_fanfare:
    db "INTRODUCCI",!O,$CE

song_hangin_at_funkys:
    db "RITMO DE FUNK",$D9

song_brother_bear:
	db "HERMANOS OSO",$D3

song_swanky_sideshow:
    db "FERIA SWANK",$D9

song_cranky_showdown:
    db "CRANK",$D9

song_dixie_beat:
    db "RITMO DE DIXI",$C5

song_northern_kremisphere:
    db "KREMISFERIO NORT",$C5

song_submap_shuffle:
    db "SUBMAPA ALEATORI",$CF

song_krematoa_koncert:
    db "KREMATO",$C1

song_game_over:
    db "FIN DEL JUEG",$CF

song_crystal_chasm:
    db "ABISMO DE CRISTA",$CC

song_crazy_calipso:
    db "CALIPSO LOC",$CF

song_baddies_on_parade:
    db "DESFILE FINA",$CC

song_jangle_bells:
    db "CAMPANAS JUNGL",$C1

song_mama_bird:
    db "REINA PL",!A,"TAN",$CF