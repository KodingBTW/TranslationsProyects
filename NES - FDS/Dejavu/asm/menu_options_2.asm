org $89D8

pointers:
    dw blank_space
	dw $8C41   ; 
	dw yes
	dw no
blank_space:
	db $01,$01,$FF									; [FF]
save:
	db $08,$01,$6B,$6C,$6E,$6F,$FF,$FF,$FF			; SAVE?
yes:
	db $02,$01,$7A,$8A,$FF						  	; Sí
no:	
	db $02,$01,$90,$A0								; NO