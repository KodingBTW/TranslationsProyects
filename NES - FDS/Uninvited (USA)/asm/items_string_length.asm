org $DDF5
; base $1DDF5

read_item:
	LDY #$00			; reset counter
next:
	LDA ($87),Y			; read character
	STA $0622
	CMP #$FF			; compare is [END]
	BEQ return
	INY					; add 1 to counter
	LDA ($87),Y			; 
	STA $0623
	JSR $E08F
	CPY #$0A			; 10 item string max length
	BNE next
return:
	RTS					; return sub routine
