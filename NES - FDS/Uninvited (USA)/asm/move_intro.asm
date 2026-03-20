org $B9CC

B9CC:
	JSR $BA08
	JSR $B9BF
	LDA #$FF
	JSR $EEB6
	LDA #$00
	JSR $F25F
	JSR $F2BB
	JSR $EBA5
	JSR $EBA5
	JSR $B420     ; change routine offset
	JSR $E91F
