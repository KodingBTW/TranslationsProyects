;org $7B10
;base $17B10

change_strings:
db $21,$60,$BF       ;LD HL, $BF60  offset
db $11,$54,$D0       ;LD DE, $D054	position
db $01,$18,$00       ;LD BC, $0018	counter
db $ED,$B0           ;LDIR			write
db $21,$78,$BF       ;LD HL, $BF78
db $11,$94,$D0       ;LD DE, $D094
db $01,$18,$00       ;LD BC, $0018
db $ED,$B0           ;LDIR
db $21,$90,$BF       ;LD HL, $BF90
db $11,$92,$D4       ;LD DE, $D492
db $01,$1C,$00       ;LD BC, $001C
db $ED,$B0			 ;LDIR
db $21,$AC,$BF       ;LD HL, $BFAC
db $11,$D2,$D4       ;LD DE, $D4D2
db $01,$1C,$00       ;LD BC, $001C
db $C9               ;RET			return

