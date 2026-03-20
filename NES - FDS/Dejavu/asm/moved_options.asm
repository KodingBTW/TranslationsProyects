org $8C10
;warnpc $8CFF

file_str:
	db $22,$53,$54,$5B,$F4,$6C,$F1,$FF  			; A,R,C,H,I,V,O + [space]
number:
	db $0C,$0D,$12 									; 1,2,3
new:
	db $04,$01,$ED,$EE,$EF,$DE						; NUEVA
save:
	db $09,$01,$6E,$6B,$CE,$22,$53,$DE,$22,$53,$6F	; ¿GUARDAR?
continue:
	db $09,$01,$F0,$F1,$F2,$F3,$F4,$F2,$CE,$22,$53  ; CONTINUAR
end:
	db $03,$01,$EE,$F4,$F2							; FIN
	