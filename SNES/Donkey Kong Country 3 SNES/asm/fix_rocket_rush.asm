; This file modifies a Hidden Bear Coin for "G" letter (Fixed at Europe/Japan Release).

org $FE7298

;--------------------------------------
; Stage Rocket Rush Object List
; (Not include cameta pos, bananas pos)
; 2 bytes = Value, X, Y, Object ID
;--------------------------------------
	db $09,$00,$9E,$01,$58,$09,$60,$02	; DK Barrel
	db $01,$00,$D2,$01,$D0,$09,$5E,$00	; Rocket (Rocket Rush)
	db $01,$00,$C0,$01,$E5,$09,$6C,$00	; Wooden Lift (Down, Left)
	db $01,$00,$70,$01,$18,$0B,$0C,$01	; Letter "K"
	db $01,$00,$B8,$01,$18,$0B,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$80,$01,$30,$0C,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$D0,$01,$2A,$0C,$F2,$00	; Banana Bunch
	db $01,$00,$90,$01,$60,$0D,$64,$00	; Fuel (Rocket Rush)
	db $01,$00,$B0,$01,$00,$0E,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$80,$01,$C0,$0E,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$B0,$01,$C0,$0E,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$28,$02,$E0,$0F,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$40,$01,$20,$11,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$A0,$01,$20,$11,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$50,$01,$00,$12,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$B0,$01,$80,$12,$66,$00	; Fuel (Rocket Rush)
	db $01,$00,$80,$01,$00,$13,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$60,$01,$10,$14,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$E0,$01,$10,$14,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$E0,$01,$98,$14,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$70,$02,$D0,$14,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$A8,$01,$60,$15,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$28,$02,$60,$15,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$A0,$01,$D0,$15,$5C,$00	; Red Buzz (Right, Left)(Rocket Rush)
	db $01,$00,$60,$01,$20,$17,$0E,$01	; Letter "O"
	db $01,$00,$C0,$01,$20,$16,$5C,$00	; Red Buzz (Right, Left)(Rocket Rush)
	db $01,$00,$A0,$01,$70,$16,$5C,$00	; Red Buzz (Right, Left)(Rocket Rush)
	db $01,$00,$C0,$01,$C0,$16,$5C,$00	; Red Buzz (Right, Left)(Rocket Rush)
	db $01,$00,$60,$01,$40,$16,$68,$00	; Fuel (Rocket Rush)
	db $01,$00,$A4,$01,$A0,$17,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$40,$01,$60,$18,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$88,$01,$60,$18,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$60,$01,$10,$19,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$D0,$01,$00,$19,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$D8,$01,$84,$19,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $01,$00,$30,$02,$C0,$19,$5A,$00	; Red Buzz (Stationary)(Rocket Rush)
	db $0B,$00,$60,$02,$18,$1A,$72,$04	; Halfway Barrel (Most Levels)
	db $0C,$00,$60,$02,$18,$1A,$F2,$00	; Banana Bunch
	db $01,$00,$60,$02,$48,$1A,$60,$00	; Halfway Barrel (Rocket Rush)
	db $01,$00,$08,$03,$FC,$1A,$6A,$00	; Fuel (Rocket Rush)
	db $01,$00,$08,$03,$34,$1B,$6A,$00	; Fuel (Rocket Rush)
	db $01,$00,$08,$03,$6C,$1B,$62,$00	; Rocket Barrel (Rocket Rush)
	db $01,$00,$A0,$03,$D0,$14,$10,$01	; Letter "N"
	db $01,$00,$C0,$02,$20,$11,$C8,$00	; Bear Coin (Hidden)
	db $01,$00,$B0,$02,$00,$0F,$F4,$00	; Banana Bunch (Hidden)
	db $01,$00,$30,$03,$00,$0F,$F4,$00	; Banana Bunch (Hidden)
	db $01,$00,$A0,$03,$70,$0C,$C8,$00	; Bear Coin (Hidden)
;--------------------------------
; Add Letter "G" Object ID: 0112
;--------------------------------
	db $01,$00,$10,$02,$D0,$03,$12,$01	; Letter "G"
	db $01,$00,$10,$02,$A0,$07,$C8,$00	; Bear Coin (Hidden)
	db $61,$00,$00,$02,$D4,$02,$6E,$00	; Wooden Lift (Stationary)(Rocket Rush)
	db $04,$00,$D0,$01,$61,$02,$A4,$05	; Koin (DK)
	db $03,$00,$30,$03,$94,$02,$C4,$00	; Exit Flagpole (Cog)
	db $04,$00,$F8,$02,$99,$02,$7E,$00	; Steel Barrel
	db $00,$00							; END
