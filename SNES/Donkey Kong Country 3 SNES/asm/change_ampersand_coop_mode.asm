;------------------------------------------
; Load stats symbol at select game screen
;------------------------------------------
; org $80A2BE
; load_menu_stats:
	; LDY #$000E
	; LDA [$84],Y
	; AND #$00FF
	; LDX $1C95
	; STX $36
	; LDX #$0003
	; LDY #$00A2
	; JSR $A64A
	; LDX #$C369
	; LDY #$00A8
	; JSR load_stats_symbols
	; RTS
	
; load_stats_symbols:
	; TYA
	; CLC
	; ADC $1C95
	; TAY

; load_ptr:
	; LDA $0000,X
	; AND #$007F
	; BEQ $80A429
	; SEC
	; SBC #$0020
	; ORA $38
	; STA [$42],Y
	; INY
	; INY
	; LDA $0000,X
	; INX
	; BIT #$0080
	; BEQ load_ptr
	; RTS
	
org $80C369
stats_characters:
	db $25,$A0			; "%" + END
	db $59,$A0			; "Y" + END
	
;-------------------------------------------
; Load ampersand beetween names in save
; game screen in coop mode at Wrinkly's Cave
;-------------------------------------------
org $80B054
load_ampersand_at_save:
	SEP #$20
	LDY $1CC8
	LDA $00,X
	BIT #$80
	BNE return
load_next:
	STA $1CB4,Y
	INY
	INX
	LDA $00,X
	BIT #$80
	BEQ load_next
return:
	AND #$7F
	STA $1CB4,Y
	INY
	STY $1CC8
	REP #$20
	RTS

org $80C649
ampersand:
	db $20,$59,$A0  	;  [SPACE] + "Y" + END


