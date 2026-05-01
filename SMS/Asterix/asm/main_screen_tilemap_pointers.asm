org $136C
;base $136C

;PRESS START BUTTON PROPERTIES
db $0C
dw $7B0C    ; position
db $03,$22	; quantity lines, individual length
dw $B30D    ; offset

;MENU OPTIONS PROPERTIES
db $0C
dw $79CC	; position
db $09,$28  ; quantity lines, individual length
dw $B373    ; offset