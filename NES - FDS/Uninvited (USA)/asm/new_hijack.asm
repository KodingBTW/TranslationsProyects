org $B676

hud_new:
	LSR $76
	BCS $B68F
	LDA #$8B    ; low byte
	STA $1E
	LDA #$BF    ; hi byte
	STA $1F
	LDA $B69E,X  ; pos x index
	STA $1D
	LDA $B6A1,X  ; pos y index
	STA $1C
	JSR $EF36
	RTS
