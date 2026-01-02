org $B4B8DE
;-----------------------------------------------------	
; Move to $34F5F0.
;-----------------------------------------------------
	JMP check_stage_complete_begin
	
org $B4F5F0
;-----------------------------------------------------	
; Check if the stage is fully completed (100%).
; Add "¡" to the beginning.
;-----------------------------------------------------
check_stage_complete_begin:
	LDA $001C65					; Load stage completion flags
	AND #$001C					; Mask bits used for completion percentage
	EOR #$001C					; Compare with full completion
	BNE stage_name				; If result != 0, stage is not 100%		
	LDA #$003B					; Add character "¡"
	STA $7EFFE0,X				; Store before the stage name
	INX							; Move output index
	JMP stage_name
;---------------------------------------------------------
; copy_stage_name
; Copies the stage name characters from ROM to RAM,
; stopping at the terminating 00 byte.
;---------------------------------------------------------
copy_stage_name:
	STA $FFE0,X					; Store current character into buffer
	INX							; Move output index
	INY							; Move input index
stage_name:						
	LDA $A9DE,Y					; Load next character from stage-name table
	BIT #$00FF					; Test if character is zero (end of string)
	BNE copy_stage_name			; If not zero, continue copying
;-----------------------------------------------------	
; Check if the stage is fully completed (100%).
; Add "!" to the final.
;-----------------------------------------------------
check_stage_complete_final:
	LDA $001C65					; Load stage completion flags
	AND #$001C					; Mask bits used for completion percentage
	EOR #$001C					; Compare with full completion
	BNE return_to_routine		; If result != 0, stage is not 100%		
	LDA #$0021					; Add character "!"
	STA $7EFFE0,X				; Store after the stage name
	INX							; Move output index
return_to_routine:
	PLB							; Restore data bank												
	TDC							; Transfer Direct Page register to A (A = DP)
	STA $7EFFE0,X				; Store DP, add 00 to end
	RTS							; Return