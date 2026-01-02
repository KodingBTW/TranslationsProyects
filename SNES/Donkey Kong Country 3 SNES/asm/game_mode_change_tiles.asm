org $8098F2

game_mode_input:
	LDA #$4000
	BIT $1C35
	BNE exit
	LDA $04CE
	BIT #$0200
	BEQ dec_mode
	LDA $1C8F
	DEC
	BPL apply
	LDA #$0002
apply:
	JML hijack_change_string_mode_left
hijack_return_left:
	NOP
	NOP
	RTS
dec_mode:
	BIT #$0100
	BEQ confirm
	LDA $1C8F
	INC
	CMP #$0003
	BCC store
	LDA #$0000
store:
	JML hijack_change_string_mode_right
hijack_return_right:
	NOP
	NOP
	RTS
confirm:
	BIT #$9080
	BEQ exit
	LDX $70
	INC $38,X
	LDA #$0080
	TSB $1C35
	LDY #$0250
	JSL $BB85B5
	LDA $1C8F
	STA $04C4
exit:
	RTS

org $F779EB
hijack_change_string_mode_left:
	STA $1C8F		; Selected mode position
	CMP #$0001
	BEQ change_coop_string_left
	CMP #$0002
	BEQ change_contest_string_left
select_mode_left:	
	STA $1C3B		; Selected mode string
	JML hijack_return_left
change_coop_string_left:
	LDA #$0002
	JMP select_mode_left
change_contest_string_left:
	LDA #$0001
	JMP select_mode_left
	
hijack_change_string_mode_right:
	STA $1C8F		; Selected mode position
	CMP #$0001
	BEQ change_coop_string_right
	CMP #$0002
	BEQ change_contest_string_right
select_mode_right:	
	STA $1C3B		; Selected mode string
	JML hijack_return_right
change_coop_string_right:
	LDA #$0002
	JMP select_mode_right
change_contest_string_right:
	LDA #$0001
	JMP select_mode_right

	
org $C00649
sprite_pos_alone_mode:
	db $00,$04,$00,$00,$00,$60,$A0,$66,$A0,$65,$98,$6A,$A0
sprite_pos_coop_mode:
    db $00,$04,$04,$00,$00,$5D,$90,$65,$90,$64,$88,$6D,$90
sprite_pos_contest_mode:
    db $00,$05,$08,$00,$00,$5B,$80,$63,$80,$6A,$80,$6E,$80,$64,$78
sprite_pos_start_to_play:
    db $00,$06,$0D,$00,$00,$5F,$B5,$67,$B5,$6F,$B5,$5F,$AD,$67,$AD,$6F,$AD
	