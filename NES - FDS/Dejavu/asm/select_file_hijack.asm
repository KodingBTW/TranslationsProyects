org $87EE

write_file:
	LDY #$00
next_character:
	LDA $8C30,Y				; Load (hijack)
	STA $0057,Y				; Write
	INY
	CPY #$08				; word File String length
	BNE next_character
	LDA $882F,X
	STA $5F					; Write fie number
	LDA #$09				; String lenght include space + number
	STA $55
	LDA #$01
	STA $56
	LDA #$55
	STA $1E
	LDA #$00
	STA $1F
	RTS