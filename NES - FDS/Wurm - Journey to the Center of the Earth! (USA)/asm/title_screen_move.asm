org $B08A

title_screen:
	LDA #$C0
	STA $51
	LDA #$02
	STA $52
	LDA #$20
	STA $2006       ; PpuAddr_2006
	LDA #$00
	STA $2006       ; PpuAddr_2006
	LDA #$00
	JSR $B0F0
	LDA #$01
	STA $52
	LDA #$00
	STA $51
	JSR $B0F0
	LDA #$D0		; low byte title screen tilemap offset
	STA $51
	LDA #$BD		; high byte title screen tilemap offset
	STA $52
	LDY #$00
