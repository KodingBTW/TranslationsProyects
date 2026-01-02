; This file modifies balloon position in krevice kreepers
; The layout is the same as Europe/Japan release
org $FE534A
;--------------------------------------
; Stage Pot Hole Panic Object List
; (Not include cameta pos, bananas pos)
; 2 bytes = Value, X, Y, Object ID
;--------------------------------------
krevice_kreppers:
	db $04,$00,$50,$03,$39,$03,$4C,$00	; Crack in Ground (Krevice Kreepers)
	db $04,$00,$30,$02,$F9,$04,$4E,$00	; Crack in Ground (Krevice Kreepers)
	db $04,$00,$B0,$01,$79,$19,$50,$00	; Crack in Ground (Krevice Kreepers)
	db $01,$00,$40,$01,$E8,$1A,$F2,$00	; Banana Bunch
	db $01,$00,$60,$01,$D8,$1A,$F2,$00	; Banana Bunch
	db $01,$00,$80,$01,$E0,$1A,$F2,$00	; Banana Bunch
	db $01,$00,$64,$01,$88,$1B,$04,$02	; Arrow Barrel (Up)(Hidden)
	db $01,$00,$28,$02,$82,$1B,$76,$04	; Klasp (Right)(Short)(Custom)(Slow)
	db $01,$00,$A8,$02,$7A,$1B,$0C,$01	; Letter "K"
	db $01,$00,$98,$02,$02,$1B,$78,$04	; Klasp (Left)(Short)(Custom)(Slow)
	db $01,$00,$48,$03,$02,$1B,$7C,$04	; Klasp (Right)(Short)(Custom)(Slow)
	db $01,$00,$A0,$03,$F8,$1A,$C6,$00	; Bear Coin
	db $09,$00,$20,$03,$43,$1A,$60,$02	; DK Barrel (In Air)
	db $01,$00,$40,$02,$E0,$19,$F4,$00	; Banana Bunch (Hidden)
	db $01,$00,$48,$03,$C2,$19,$7C,$04	; Klasp (Right)(Short)(Custom)(Slow)
	db $04,$01,$60,$01,$C2,$18,$74,$03	; Off-Screen Sprite Marker (?)
	db $01,$01,$40,$02,$C2,$18,$7E,$04	; Klasp (Right)(Mid)(Custom)(Medium)
	db $04,$01,$20,$03,$C2,$18,$74,$03	; Off-Screen Sprite Marker (?)
	db $01,$00,$A0,$01,$57,$18,$A6,$01	; Blast Barrel (SE)(Launches NE)
	db $01,$00,$18,$02,$30,$18,$2A,$01	; Bonus Barrel 1 (Warp)
	db $01,$00,$30,$03,$E0,$17,$34,$01	; Bonus Barrel Exit 1 (Unwarp)
	db $01,$00,$50,$03,$F5,$17,$5C,$04	; Wooden Barrel (Gone After Use)
	db $01,$00,$C0,$03,$B5,$17,$8A,$03	; Sneek (Left, Right)(Safe)
	db $01,$00,$60,$02,$39,$17,$78,$03	; Sneek (Right)
	db $01,$00,$98,$02,$C2,$16,$7A,$04	; Klasp (Right)(Short)(Custom)(Medium)
	db $01,$00,$28,$02,$42,$16,$7C,$04	; Klasp (Right)(Short)(Custom)(Slow)
	db $01,$00,$60,$03,$F0,$15,$00,$01	; 1-up Balloon (Floating) ---> Moved New Position
	db $01,$00,$B8,$01,$82,$14,$84,$04	; Klasp (Left)(Short)(Custom)(Slow)
	db $01,$00,$B8,$01,$C2,$14,$82,$04	; Klasp (Left)(Short)(Custom)(Slow)
	db $01,$00,$B8,$01,$02,$15,$80,$04	; Klasp (Left)(Short)(Custom)(Slow)
	db $01,$02,$B0,$01,$02,$13,$86,$04	; Klasp (Right)(Long)(Custom)(Fast)
	db $04,$02,$80,$02,$C0,$12,$74,$03	; Off-Screen Sprite Marker (?)
	db $04,$02,$60,$03,$C0,$12,$74,$03	; Off-Screen Sprite Marker (?)
	db $01,$00,$98,$03,$A0,$12,$0E,$01	; Letter "O"
	db $01,$00,$60,$02,$B8,$10,$C8,$00	; Bear Coin (Hidden)
	db $04,$00,$70,$02,$B9,$11,$70,$00	; Steel Barrel (Replenishable)
	db $04,$00,$68,$01,$3B,$11,$A4,$05	; Koin (DK)
	db $01,$00,$50,$03,$42,$10,$90,$04	; Klasp (Middle)(Short)(Custom)(Medium)
	db $01,$00,$50,$03,$C2,$10,$92,$04	; Klasp (Middle)(Mid)(Custom)(Medium)
	db $0B,$00,$18,$03,$A0,$0F,$72,$04	; Halfway Barrel (Most Levels)
	db $0C,$00,$18,$03,$A0,$0F,$F2,$00	; Banana Bunch
	db $09,$00,$A8,$03,$58,$0F,$60,$02	; DK Barrel (In Air)
	db $01,$00,$B0,$03,$E0,$0E,$22,$02	; Arrow Barrel (Up)
	db $04,$03,$F0,$01,$20,$0E,$74,$03	; Off-Screen Sprite Marker (?)
	db $01,$03,$D0,$02,$42,$0E,$88,$04	; Klasp (Middle)(Long)(Custom)(Fast)
	db $04,$03,$B0,$03,$20,$0E,$74,$03	; Off-Screen Sprite Marker (?)
	db $01,$00,$48,$01,$02,$0D,$8E,$04	; Klasp (Right)(Short)(Custom)(Fast)
	db $01,$00,$48,$01,$42,$0D,$8C,$04	; Klasp (Right)(Short)(Custom)(Fast)
	db $01,$00,$48,$01,$82,$0D,$8A,$04	; Klasp (Right)(Short)(Custom)(Fast)
	db $01,$00,$81,$02,$25,$0C,$10,$01	; Letter "N"
	db $01,$00,$78,$03,$B9,$0B,$A6,$05	; Knocka
	db $01,$00,$B0,$03,$60,$0B,$2C,$01	; Bonus Barrel 2 (Warp)
	db $01,$00,$30,$01,$60,$0A,$36,$01	; Bonus Barrel Exit 2 (Unwarp)
	db $01,$00,$60,$01,$55,$0C,$08,$02	; Arrow Barrel (Up)
	db $01,$00,$48,$01,$02,$0B,$96,$04	; Klasp (Right)(Short)(Custom)(Fast)
	db $01,$00,$48,$01,$42,$0B,$98,$04	; Klasp (Left)(Short)(Custom)(Fast)
	db $01,$00,$B8,$01,$C2,$0B,$94,$04	; Klasp (Right)(Short)(Custom)(Fast)
	db $01,$00,$B2,$01,$28,$0A,$0A,$02	; Arrow Barrel (Up)
	db $01,$04,$30,$01,$02,$09,$A2,$04	; Klasp (Right)(Long)(Custom)(Fast)
	db $04,$04,$10,$02,$00,$09,$74,$03	; Off-Screen Sprite Marker (?)
	db $04,$04,$A0,$02,$00,$09,$74,$03	; Off-Screen Sprite Marker (?)
	db $01,$00,$19,$02,$18,$09,$98,$03	; Green Buzz (Stationary)
	db $01,$00,$A0,$02,$C2,$09,$9A,$04	; Klasp (Right)(Short)(Custom)(Slow)
	db $01,$00,$A0,$02,$42,$0A,$9C,$04	; Klasp (Middle)(Short)(Custom)(Slow)
	db $01,$00,$A0,$03,$C0,$0A,$9E,$01	; Blast Barrel (N)
	db $01,$00,$20,$03,$00,$08,$C8,$00	; Bear Coin (Hidden)
	db $08,$00,$E0,$02,$C0,$05,$60,$02	; DK Barrel (In Air)
	db $01,$00,$E0,$02,$42,$06,$A0,$04	; Klasp (Middle)(Mid)(Custom)(Fast)
	db $01,$00,$E0,$02,$C2,$06,$9E,$04	; Klasp (Middle)(Short)(Custom)(Fast)
	db $01,$00,$B0,$03,$60,$05,$24,$02	; Arrow Barrel (Up)(High, Fast)
	db $04,$05,$A0,$01,$20,$04,$74,$03	; Off-Screen Sprite Marker (?)
	db $01,$05,$80,$02,$42,$04,$A4,$04	; Klasp (Middle)(Long)(Custom)(Fastest)
	db $04,$05,$60,$03,$20,$04,$74,$03	; Off-Screen Sprite Marker (?)
	db $01,$00,$10,$02,$F0,$03,$98,$03	; Green Buzz (Stationary)
	db $01,$00,$C0,$02,$F0,$03,$98,$03	; Green Buzz (Stationary)
	db $01,$00,$E0,$01,$82,$02,$A6,$04	; Klasp (Middle)(Short)(Custom)(Fastest)
	db $01,$00,$E0,$01,$02,$03,$A8,$04	; Klasp (Middle)(Short)(Custom)(Fastest)
	db $01,$00,$48,$03,$42,$02,$AA,$04	; Klasp (Middle)(Short)(Custom)(Fastest)
	db $01,$00,$48,$03,$38,$02,$12,$01	; Letter "G"
	db $03,$00,$90,$03,$35,$03,$C2,$00	; Exit Flagpole
	db $00,$00							; END