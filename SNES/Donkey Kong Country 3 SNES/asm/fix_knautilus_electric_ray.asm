org $B3A40D
; In the vanilla US version, the electric ray in Knautilus continues to move when the game is paused and will harm the player if unpaused at the right moment.
; This tweak, backported from the European version, fixes the bug.
KnautilusElectricRayFix:
	JMP .Main
	NOP
.EndHijack

org $B3F960
.StopRay
	JMP.w $B3A5C8
.Main
	LDA.w $7E05AF		; KongFlag
	BIT.w #$0040		; bit #$0040 = Game paused; bit #$4000 = Both Kongs are present
	BNE.w .StopRay
	LDA.l $7EA220
	JMP.w .EndHijack