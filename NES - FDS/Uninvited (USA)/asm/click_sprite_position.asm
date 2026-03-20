; for select file
org $B7BC

sprite_position:
	LDX $E8			; Current menu option
	LDA $B7D7,X		; Position Y
	STA $21
	LDA #$55		; Position X
	STA $20
frags:
	LDA #$DA
	STA $1E
	LDA #$B7
	STA $1F
	LDA #$00
	STA $22
	JSR $C7B6
	RTS

