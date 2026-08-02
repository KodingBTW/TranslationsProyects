org $B7B0
	LDA #$30
	CLC
	ADC $0592
	STA $0772
	LDA $0592
	CMP #$02
	BCC OneTurnLeft
	LDA #$53
	STA $0779
	STA $0783
	JMP SkipStringMovement
OneTurnLeft
	LDY #$0A
	LDX #$09
NextCharacter
	LDA $0772,X
	STA $0771,X
	INX
	DEY
	BNE NextCharacter
SkipStringMovement
	LDA #$00
	STA $0765
	JMP $94B8
