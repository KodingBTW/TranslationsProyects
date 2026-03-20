org $88DC

draw_bullet:
	LDX $EE				; Load option index
	LDA y_position,X	; Y position
	STA $21
	LDA #$70            ; X position
	STA $20
	LDA #$FA
	STA $1E
	LDA #$88
	STA $1F
	LDA #$02
	STA $22
	JSR $FE5D
	RTS

y_position:
	db $98,$A8,$B8

