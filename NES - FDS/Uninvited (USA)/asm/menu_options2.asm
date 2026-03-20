; for yes no at delete file
org $B831

yes_no_menu:
db $08,$04 
db $EC,$EC,$EC,$EC,$EC,$EC,$EC,$EC
db $80,$80,$80,$80,$80,$80,$80,$80 
db $EC,$EC,$EC,$EC,$EC,$EC,$EC,$EC
db $80,$80,$80,$80,$80,$80,$80,$80 
db $4D	; yes x position
db $8D	; no x position