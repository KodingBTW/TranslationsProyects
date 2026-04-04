org $D4CA

include "asm/screen_messages_offsets.asm"
include "asm/screen_messages_lengths.asm"
         
write_password_and_code:
	LDX #screen_messages_lengths_0019-1			; word "contraseña" character length
next_character
	LDA screen_messages_offsets_0019,X			; load
	STA $0370,X									; write in buffer inverted
	DEX											; x = x - 1
	BPL next_character							; next character
	LDA #$00									; 
	STA $0370+screen_messages_lengths_0019 		; write [space] beetween password and code
	LDX #$04									; level flag??
	LDA $D2                 					; load $03
	CMP $F601,X
	BCS write_code
	DEX
	CMP $F601,X
	BCS write_code
	DEX
	CMP $F601,X
	BCS write_code
	DEX
write_code:
	TXA
	ASL A
	ASL A
	TAX
; password has always 4 numbers
	LDA $D4AF,X
	STA $0370+screen_messages_lengths_0019+1	; write first digit
	LDA $D4B0,X 
	STA $0370+screen_messages_lengths_0019+2	; write second digit
	LDA $D4B1,X
	STA $0370+screen_messages_lengths_0019+3	; write thirth digit
	LDA $D4B2,X
	STA $0370+screen_messages_lengths_0019+4	; write fourth digit
	LDA #$2C
	JMP $C0C8
