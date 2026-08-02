; [Pos Y][Tile][Palette][Pos X]
org $F9A4
LivesHud:
db $20,$B6,$01,$20 ; V
db $20,$A9,$01,$28 ; I
db $20,$A4,$01,$30 ; D
db $20,$A1,$01,$38 ; A
db $20,$B3,$01,$40 ; S

db $20,$00,$01,$50 
db $20,$00,$01,$58 

PauseHud:
db $80,$B0,$01,$60 ; P
db $80,$A1,$01,$70 ; A
db $80,$B5,$01,$80 ; U 
db $80,$B3,$01,$90 ; S 
db $80,$A1,$01,$A0 ; A
