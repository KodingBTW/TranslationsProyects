org $B917

pointers:
	dw blank
	dw $BF91
	dw yes
	dw no
 blank:
	db $01,$01,$EC 
 save:
	db $05,$01,$B9,$B7,$BA,$9F,$BB ; ¿GUARDAR?
 yes:
	db $02,$01,$B9,$CF,$80 ; SÍ
 no:
	db $02,$01,$4B,$4A  ; NO
position:
	dw $222F	; blank STRING POS: high x, low y
	dw $224D	; save STRING POS: high x, low y
	dw $228E	; yes STRING POS: high x, low y
	dw $22CE	; no STRING POS: high x, low y