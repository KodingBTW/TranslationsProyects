; This file modifies some enemy layout to avoid lag issues
; The layout rearranging is the same as Europe/Japan release
org $FE6032
;--------------------------------------
; Stage Pot Hole Panic Object List
; (Not include cameta pos, bananas pos)
; 2 bytes = Value, X, Y, Object ID
;--------------------------------------
	db $01,$00,$D0,$01,$20,$02,$D6,$06 ; Booty Bird (Letter "K")
	db $01,$00,$87,$01,$00,$03,$26,$01 ; Squawks Box
	db $09,$00,$F0,$01,$B0,$02,$60,$02 ; DK Barrel (In Air)
	db $01,$00,$50,$03,$50,$01,$F4,$00 ; Banana Bunch (Hidden)
	db $01,$00,$80,$03,$50,$01,$F4,$00 ; Banana Bunch (Hidden)
	db $04,$01,$50,$03,$80,$02,$74,$03 ; Off-Screen Sprite Marker (?)
	db $01,$01,$00,$04,$90,$02,$4A,$06 ; Kuchuka
	db $04,$02,$00,$05,$50,$02,$74,$03 ; Off-Screen Sprite Marker (?)
	db $01,$02,$E8,$05,$52,$02,$4E,$06 ; Kuchuka
	db $04,$03,$50,$07,$20,$02,$74,$03 ; Off-Screen Sprite Marker (?)
	db $04,$03,$60,$07,$B0,$02,$74,$03 ; Off-Screen Sprite Marker (?)
	db $01,$03,$60,$07,$49,$03,$2E,$07 ; Kopter (Left, Right)(Half Oval)
	db $01,$03,$60,$07,$10,$03,$C6,$00 ; Bear Coin
	db $01,$03,$60,$07,$49,$03,$30,$07 ; Kopter (Left, Right)(Half Oval)
	db $01,$00,$B8,$08,$60,$03,$0E,$01 ; Letter "O"
	db $01,$00,$B0,$08,$80,$04,$44,$03 ; Lurchin (Stationary)(Edible)
	db $01,$00,$80,$08,$B0,$04,$F4,$00 ; Banana Bunch (Hidden)
	db $01,$00,$80,$09,$A0,$03,$0A,$03 ; Green Koco (Stationary)
	db $01,$00,$80,$09,$B8,$03,$0A,$03 ; Green Koco (Stationary)
	db $01,$04,$A8,$09,$F0,$01,$32,$07 ; Kopter (Left, Right)(Half Oval)
	db $01,$04,$A8,$09,$F0,$01,$34,$07 ; Kopter (Left, Right)(Half Oval)
	db $01,$00,$38,$0A,$90,$03,$22,$01 ; Enguarde Box
	db $01,$00,$58,$0B,$20,$02,$C4,$06 ; Booty Bird (Left, Right)(Banana)
	db $01,$00,$C0,$09,$78,$02,$C2,$06 ; Booty Bird (Right)(Banana)
	db $01,$00,$30,$0A,$98,$02,$C2,$06 ; Booty Bird (Right)(Banana)
	db $01,$00,$E8,$09,$5C,$04,$44,$03 ; Lurchin (Stationary)(Edible)
	db $01,$00,$38,$0A,$90,$04,$DA,$06 ; Bounty Bass (Left, Right)(Banana Bunch)
	db $01,$00,$38,$0A,$BC,$04,$44,$03 ; Lurchin (Stationary)(Edible)
	db $01,$00,$88,$0A,$5C,$04,$44,$03 ; Lurchin (Stationary)(Edible)
	db $01,$00,$A0,$0B,$F0,$03,$DE,$06 ; Bounty Bass (Left, Right)(Banana)
	db $01,$00,$A0,$0B,$20,$04,$DE,$06 ; Bounty Bass (Left, Right)(Banana)
	db $01,$00,$C0,$0C,$60,$04,$E0,$06 ; Bounty Bass (Right, Left)(Banana)
	db $01,$00,$A0,$0D,$10,$04,$F4,$00 ; Banana Bunch (Hidden)
	db $01,$00,$B0,$0D,$40,$04,$DE,$06 ; Bounty Bass (Left, Right)(Banana)
	db $01,$00,$60,$0E,$50,$03,$F4,$00 ; Banana Bunch (Hidden)
	db $01,$00,$C0,$0E,$D4,$03,$28,$03 ; Lurchin (Down, Up)
	db $01,$00,$00,$0F,$2A,$04,$36,$03 ; Lurchin (Down, Up)
	db $01,$00,$40,$0F,$80,$04,$34,$03 ; Lurchin (Down, Up)
	db $01,$00,$80,$0F,$D4,$03,$28,$03 ; Lurchin (Down, Up)
	db $01,$00,$D0,$10,$9C,$04,$32,$03 ; Lurchin (Down, Up)
	db $01,$00,$20,$11,$9C,$04,$32,$03 ; Lurchin (Down, Up)
	db $01,$00,$D8,$11,$A0,$04,$E0,$06 ; Bounty Bass (Right, Left)(Banana)
	db $01,$00,$E0,$10,$A0,$03,$DE,$06 ; Bounty Bass (Left, Right)(Banana)
	db $01,$00,$48,$10,$00,$03,$F2,$00 ; Banana Bunch
	db $01,$00,$78,$10,$00,$03,$F2,$00 ; Banana Bunch
	db $01,$00,$C0,$12,$4C,$03,$20,$01 ; Ellie Box
	db $0B,$00,$BC,$12,$F8,$02,$72,$04 ; Halfway Barrel (Most Levels)
	db $0C,$00,$BC,$12,$F8,$02,$F2,$00 ; Banana Bunch
	db $04,$05,$E0,$12,$20,$03,$74,$03 ; Off-Screen Sprite Marker (?)
	db $01,$05,$C0,$13,$50,$02,$44,$06 ; Kuchuka
	db $04,$05,$60,$13,$20,$03,$74,$03 ; Off-Screen Sprite Marker (?)
	db $09,$00,$40,$14,$F8,$02,$60,$02 ; DK Barrel (In Air)
	db $01,$00,$08,$15,$28,$02,$C6,$00 ; Bear Coin
	db $01,$00,$08,$15,$EA,$02,$36,$07 ; Kopter (Right, Left)(Half Oval)
	db $01,$00,$88,$17,$48,$02,$60,$07 ; Kopter (Down, Up)
	db $04,$06,$E0,$18,$20,$02,$74,$03 ; Off-Screen Sprite Marker (?)
	db $01,$06,$60,$19,$30,$02,$50,$06 ; Kuchuka
	db $01,$00,$E0,$18,$D0,$02,$2A,$01 ; Bonus Barrel 1 (Warp)
	db $01,$00,$E0,$18,$50,$03,$34,$01 ; Bonus Barrel Exit 1 (Unwarp)
	db $01,$00,$E0,$18,$30,$04,$C8,$00 ; Bear Coin (Hidden)
	db $01,$00,$E0,$19,$10,$04,$F4,$00 ; Banana Bunch (Hidden)
	db $01,$00,$A0,$1A,$30,$04,$C8,$00 ; Bear Coin (Hidden)
	db $01,$00,$E0,$18,$00,$03,$10,$01 ; Letter "N"
	db $01,$00,$80,$1A,$C8,$02,$E0,$01 ; Blast Barrel (S)(Launches N)
	db $01,$00,$38,$1B,$10,$03,$60,$02 ; DK Barrel (In Air)
	db $01,$00,$C0,$1A,$70,$02,$24,$01 ; Squitter Box
	db $01,$07,$48,$1B,$6E,$02,$38,$07 ; Kopter (Right, Left)(Half Oval)
	db $01,$07,$C8,$1B,$70,$02,$38,$07 ; Kopter (Right, Left)(Half Oval)
;	db $01,$00,$00,$1D,$60,$02,$12,$01 ; Letter "G"
	db $01,$00,$00,$1D,$90,$02,$00,$04 ; Red Buzz (Stationary)
	db $01,$00,$00,$1D,$EC,$02,$3A,$07 ; Kopter (Right, Left)(Half Oval
	db $01,$00,$60,$1E,$B8,$02,$CA,$06 ; Booty Bird (Banana Bunch) -> Booty Bird (Letter "G")
	db $01,$00,$10,$1E,$B8,$02,$36,$01 ; Bonus Barrel Exit 2 (Unwarp) -> Move Bonus Barrel 2 Unwarp to a new position
	db $01,$00,$D0,$1E,$90,$01,$2C,$01 ; Bonus Barrel 2 (Warp)
	db $01,$00,$E0,$1E,$28,$02,$BC,$03 ; Kuchuka  -> Green Buzz (Left, Right)
	db $04,$08,$60,$1E,$D0,$02,$74,$03 ; Off-Screen Sprite Marker (?)
	db $04,$08,$B0,$1E,$D0,$02,$74,$03 ; Off-Screen Sprite Marker (?)
	db $04,$09,$70,$1F,$80,$02,$74,$03 ; Off-Screen Sprite Marker (?)
	db $01,$09,$70,$1F,$12,$03,$9A,$02 ; No Squitter Sign (Banana Bunch)
	db $04,$00,$05,$20,$CF,$01,$70,$00 ; Steel Barrel (Replenishable)
	db $04,$00,$B0,$20,$51,$02,$A4,$05 ; Koin (DK)
	db $03,$00,$CC,$20,$4A,$03,$C2,$00 ; Exit Flagpole
	db $00,$00 						   ; END
	