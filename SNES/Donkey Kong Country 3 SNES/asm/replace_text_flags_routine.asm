org $B4A0E7

;-----------------------------------------------------
; load_text_lines_counter
; Input:
;   X = text buffer index inside CPU $7E0000
; Function:
;   Reads the line counter from WRAM and stores it in $1A.
;-----------------------------------------------------
load_text_lines_counter:
	PHX							; Save X (text index)
	LDA $7E0000,X				; Load line counter from WRAM
	AND #$00FF					; Mask to low byte only
	STA $1A						; Store line counter into WRAM $1A
;-----------------------------------------------------
; read_text
; Reads characters one by one and checks for control codes:
;   00 = end-of-line marker
;   NN = option counter (to display "1.", "2.", etc.)
;   XX = active Kong name placeholder
;-----------------------------------------------------
read_text:
	INX							; Move to next character
	LDA $7E0000,X 				; Read character from text buffer
	BIT #$00FF					; Compare with line flag code
	BEQ substract_line_counter  ; Substract line counter
	CMP #$4E4E					; Compare with NN (answers counter)
	BEQ answers_counter			; Replace for number
	CMP #$5858					; Comparar with XX (flag player active character)
	BNE read_text				; Replace for Kong name
 ;-------------------------------------------------
 ; "XX" determine which name to use
 ;-------------------------------------------------
	LDY #$000A					; Preload #$0A in Y acumulator (Kongs name index)
	LDA $05AF					; Load Kongs alive flag 
	BIT #$4000					; Compare
	BNE block_plural			; Block plural for spanish translation
block_plural:
	LDA $05B5					; Load Kong alive name (00=Dixie, 01=Kiddy)
	BEQ active_character_dixie	; Write Dixie name
	LDY #$0000					; Load Kiddy index name
	BRA replace_character_name	; Write Kiddy name
active_character_dixie:
	LDY #$0005					; Load Dixie index name
;-----------------------------------------------------
; replace_character_name
; Replaces the 5-character placeholder “XXXXX”.
;-----------------------------------------------------
replace_character_name:
	LDA character_name,Y		; Load in A acumulator 2 characters
	STA $7E0000,X				; Replace in text
	LDA character_name+2,Y		; Load in A acumulator 
	STA $7E0002,X				; Replace in text
	LDA character_name+3,Y		; Load in A acumulator 2 characters
	STA $7E0003,X				; Replace in text
;----------------------------------------------------
; substract_line_counter
; Decreases the remaining line counter and returns
; when the block of lines has finished.
;-----------------------------------------------------
substract_line_counter:
	DEC $1A						; Substract 1 to line counter.
	BNE read_text				; if $1A != 0, continue reading next lines.
	PLX							; No more lines left.
	RTS							; Return
;-----------------------------------------------------
; answers_counter
; Replaces “NN” with an ASCII-formatted number:
;   "1.", "2.", "3.", ...
;-----------------------------------------------------
answers_counter:
	LDA $1C49					; Load current option index
	CLC							;
	ADC #$0031					; Convert to ASCII number
	XBA							;
	ORA #$002E					; Load character "."
	XBA							;
	STA $7E0000,X				; Write number
	BRA substract_line_counter
;-----------------------------------------------------
; character_name table
; Each entry is exactly 5 characters.
; Offsets:
;   00  = "Kiddy"
;   05  = "Dixie"
;   0A  = "Kongs"
;-----------------------------------------------------
character_name:
	db "Kiddy"
	db "Dixie"
	db "Kongs"	