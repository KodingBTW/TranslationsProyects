; for menu continue, exit, newgame
org $B7DF

sprite_position:
	LDX $84
	LDA $B7EC,X
	STA $21
	LDA #$55
	STA $20
	BNE $B7C7
	BCC $B78E
	BCS $B799
