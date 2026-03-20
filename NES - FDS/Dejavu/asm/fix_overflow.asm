org $DED0
;base $1DED0

add_money:
	LDA $051B		; Actual money
	CLC				; 
	ADC $B8			; Add money 
	CMP #$63		;
	BCC +			; if < 99
	LDA #$63		; if >=99
+:
	STA $051B		; Write new value
	LDA #$00		;
	STA $C0			; Reset
	RTS				; Return
-
