org $BF80
;warnpc $BFFF

file_str:
	db $B7,$9D,$48,$53,$59,$BA,$4A,$80  			; A,R,C,H,I,V,O + [space]
number:
	db $38,$39,$3A 									; 1,2,3
new:
	db $04,$01,$F7,$F8,$F9,$CD						; NUEVA
save:
	db $09,$01,$CC,$A4,$B1,$B7,$9D,$9E,$B7,$9D,$BB	; ¿GUARDAR?
continue:
	db $09,$01,$48,$4A,$4B,$B0,$59,$4B,$B1,$B7,$9D  ; CONTINUAR
end:
	db $03,$01,$5A,$59,$4B							; FIN
	