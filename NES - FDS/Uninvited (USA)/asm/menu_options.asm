org $B6DF
menu_options_pointers:
	dw continue
	dw exit
	dw new_game
continue:
	db $09,$02
	db $EC,$EC,$EC,$EC,$EC,$EC,$EC,$EC,$EC	; LINE
	db $48,$4A,$4B,$B0,$59,$4B,$B1,$B7,$9D 	; CONTINUAR
exit:
	db $06,$01 
	db $B6,$B7,$B4,$59,$9D,$80				; SALIR
new_game:
	db $08,$02
	db $EC,$EC,$EC,$EC,$EC,$EC,$EC,$EC		; LINE
	db $CE,$4A,$9D,$9D,$B7,$9D,$80,$80		; BORRAR
positions:
	dw $222D	; continue STRING POS: high x, low y
	dw $228D	; exit STRING POS: high x, low y
	dw $22AD	; new game STRING POS: high x, low y