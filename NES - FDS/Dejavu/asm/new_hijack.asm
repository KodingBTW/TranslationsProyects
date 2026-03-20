org $8811

hud_new:
	LSR $76
	BCS $8829
	LDA #$3B    ; low byte
	STA $1E
	LDA #$8C    ; hi byte
	STA $1F
	LDA #$22
	STA $1D
	LDA $8835,X
	STA $1C
	JSR $EEE5
	RTS
