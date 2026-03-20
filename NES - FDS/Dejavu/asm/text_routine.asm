                   --------sub start--------
                   $DF74:
DF74 [1DF74]  A9 65          LDA #$65
DF76 [1DF76]  20 C5 F3       JSR $F3C5
DF79 [1DF79]  20 B9 EB       JSR $EBB9
DF7C [1DF7C]  20 95 E1       JSR $E195
DF7F [1DF7F]  A9 00          LDA #$00
DF81 [1DF81]  85 3D          STA $3D
DF83 [1DF83]  8D B6 04       STA $04B6
                   $DF86:
DF86 [1DF86]  20 00 DF       JSR $DF00
DF89 [1DF89]  8D 1A 06       STA $061A
DF8C [1DF8C]  C9 1F          CMP #$1F
DF8E [1DF8E]  F0 2F          BEQ $DFBF
DF90 [1DF90]  C9 1E          CMP #$1E
DF92 [1DF92]  F0 2E          BEQ $DFC2
DF94 [1DF94]  C9 20          CMP #$20
DF96 [1DF96]  10 3E          BPL $DFD6
DF98 [1DF98]  C9 1B          CMP #$1B
DF9A [1DF9A]  F0 0E          BEQ $DFAA
DF9C [1DF9C]  C9 1C          CMP #$1C
DF9E [1DF9E]  F0 10          BEQ $DFB0 
DFA0 [1DFA0]  C9 1D          CMP #$1D
DFA2 [1DFA2]  F0 15          BEQ $DFB9
DFA4 [1DFA4]  20 FE E1       JSR $E1FE  ; leer diciconario
DFA7 [1DFA7]  4C 86 DF       JMP $DF86
DFAA [1DFAA]  20 BC E0       JSR $E0BC
DFAD [1DFAD]  4C 86 DF       JMP $DF86 


                   --------sub start--------
                   $DF00:
DF00 [1DF00]  AA             TAX
DF01 [1DF01]  48             PHA
DF02 [1DF02]  98             TYA
DF03 [1DF03]  48             PHA
DF04 [1DF04]  A9 00          LDA #$00
DF06 [1DF06]  AA             TAX
DF07 [1DF07]  85 3F          STA $3F
                   $DF09:
DF09 [1DF09]  20 4C DF       JSR $DF4C
DF0C [1DF0C]  A5 3F          LDA $3F
DF0E [1DF0E]  D0 04          BNE $DF14
DF10 [1DF10]  E8             INX
DF11 [1DF11]  4C 09 DF       JMP $DF09
                   $DF14:
DF14 [1DF14]  A9 00          LDA #$00
DF16 [1DF16]  85 3F          STA $3F
DF18 [1DF18]  20 4C DF       JSR $DF4C
DF1B [1DF1B]  20 4C DF       JSR $DF4C
DF1E [1DF1E]  20 4C DF       JSR $DF4C
DF21 [1DF21]  8A             TXA
DF22 [1DF22]  0A             ASL A
DF23 [1DF23]  0A             ASL A
DF24 [1DF24]  0A             ASL A
DF25 [1DF25]  05 3F          ORA $3F
DF27 [1DF27]  AA             TAX
DF28 [1DF28]  BD FC E4       LDA $E4FC,X
DF2B [1DF2B]  85 3F          STA $3F
DF2D [1DF2D]  68             PLA
DF2E [1DF2E]  A8             TAY
DF2F [1DF2F]  68             PLA
DF30 [1DF30]  AA             TAX
DF31 [1DF31]  A5 3F          LDA $3F
DF33 [1DF33]  60             RTS
                   ----------------

                   --------sub start--------
                   $DF4C:
DF4C [1DF4C]  A5 3D          LDA $3D
DF4E [1DF4E]  D0 13          BNE $DF63
DF50 [1DF50]  A0 00          LDY #$00
DF52 [1DF52]  B1 00          LDA ($00),Y ; read character
DF54 [1DF54]  85 3E          STA $3E
DF56 [1DF56]  A5 00          LDA $00
DF58 [1DF58]  18             CLC
DF59 [1DF59]  69 01          ADC #$01
DF5B [1DF5B]  85 00          STA $00
DF5D [1DF5D]  A5 01          LDA $01
DF5F [1DF5F]  69 00          ADC #$00
DF61 [1DF61]  85 01          STA $01
                   $DF63:
DF63 [1DF63]  06 3E          ASL $3E
DF65 [1DF65]  26 3F          ROL $3F
DF67 [1DF67]  E6 3D          INC $3D
DF69 [1DF69]  A5 3D          LDA $3D
DF6B [1DF6B]  C9 08          CMP #$08
DF6D [1DF6D]  D0 04          BNE $DF73
DF6F [1DF6F]  A9 00          LDA #$00
DF71 [1DF71]  85 3D          STA $3D
                   $DF73:
DF73 [1DF73]  60             RTS
                   ----------------
				   
				                      --------sub start--------
                   $E1FE:
E1FE [1E1FE]  98             TYA
E1FF [1E1FF]  48             PHA
E200 [1E200]  8A             TXA
E201 [1E201]  48             PHA
E202 [1E202]  AC 1A 06       LDY $061A
E205 [1E205]  B9 13 E2       LDA $E213,Y   ;indice
E208 [1E208]  8D 20 06       STA $0620
E20B [1E20B]  20 53 E2       JSR $E253
E20E [1E20E]  68             PLA
E20F [1E20F]  AA             TAX
E210 [1E210]  68             PLA
E211 [1E211]  A8             TAY
E212 [1E212]  60             RTS
                   ----------------
				   
				                      --------sub start--------
                   $E253:
E253 [1E253]  A5 90          LDA $90
E255 [1E255]  D0 15          BNE $E26C
E257 [1E257]  20 41 EB       JSR $EB41
E25A [1E25A]  A5 F5          LDA $F5
E25C [1E25C]  29 80          AND #$80
E25E [1E25E]  F0 0C          BEQ $E26C
E260 [1E260]  A9 FF          LDA #$FF
E262 [1E262]  85 90          STA $90
E264 [1E264]  A9 65          LDA #$65
E266 [1E266]  20 C5 F3       JSR $F3C5
E269 [1E269]  20 B9 EB       JSR $EBB9

                   --------sub start--------
                   $EB41:
EB41 [1EB41]  98             TYA
EB42 [1EB42]  48             PHA
EB43 [1EB43]  8A             TXA
EB44 [1EB44]  48             PHA
EB45 [1EB45]  20 6E EB       JSR $EB6E
EB48 [1EB48]  A4 F5          LDY $F5
EB4A [1EB4A]  A5 F6          LDA $F6
EB4C [1EB4C]  48             PHA
EB4D [1EB4D]  20 6E EB       JSR $EB6E
EB50 [1EB50]  68             PLA
EB51 [1EB51]  C5 F6          CMP $F6
EB53 [1EB53]  D0 F3          BNE $EB48
EB55 [1EB55]  C4 F5          CPY $F5
EB57 [1EB57]  D0 EF          BNE $EB48
EB59 [1EB59]  A2 01          LDX #$01

                   --------sub start--------
                   $EBB9:
EBB9 [1EBB9]  20 E1 EB       JSR $EBE1
EBBC [1EBBC]  20 9C EB       JSR $EB9C

; FOR $1F

                   $DFBF:
DFBF [1DFBF]  20 BC E0       JSR $E0BC
DFC2 [1DFC2]  A9 00          LDA #$00
DFC4 [1DFC4]  85 92          STA $92
DFC6 [1DFC6]  CE 33 05       DEC $0533
DFC9 [1DFC9]  AD 33 05       LDA $0533
DFCC [1DFCC]  10 07          BPL $DFD5
DFCE [1DFCE]  A9 00          LDA #$00
DFD0 [1DFD0]  85 2B          STA $2B
DFD2 [1DFD2]  8D 33 05       STA $0533
DFD5 [1DFD5]  60             RTS
                   ----------------
				   
				                      --------sub start--------
                   $E0D8:
E0D8 [1E0D8]  AD B6 04       LDA $04B6
E0DB [1E0DB]  C9 03          CMP #$03
E0DD [1E0DD]  F0 09          BEQ $E0E8
E0DF [1E0DF]  AD B6 04       LDA $04B6
E0E2 [1E0E2]  18             CLC
E0E3 [1E0E3]  69 01          ADC #$01
E0E5 [1E0E5]  8D B6 04       STA $04B6
E0E8 [1E0E8]  20 F9 E2       JSR $E2F9
E0EB [1E0EB]  60             RTS
                   ----------------

                   --------sub start--------
                   $E2F9:
E2F9 [1E2F9]  EE 1D 06       INC $061D
E2FC [1E2FC]  AD 1D 06       LDA $061D
E2FF [1E2FF]  C9 04          CMP #$04
E301 [1E301]  D0 06          BNE $E309
E303 [1E303]  20 16 E3       JSR $E316
E306 [1E306]  CE 1D 06       DEC $061D
E309 [1E309]  A5 90          LDA $90
E30B [1E30B]  D0 03          BNE $E310
E30D [1E30D]  20 93 E4       JSR $E493
E310 [1E310]  A9 00          LDA #$00
E312 [1E312]  8D 1C 06       STA $061C
E315 [1E315]  60             RTS
                   ----------------



org $E213
dictionary:
db $B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$C0
db $C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$7E,$7E,$7E,$7E,$7E,$7E
db $A1,$A4,$A5,$CB,$D6,$D8,$D5,$8A,$8B,$D7,$CD,$CC,$D9,$DA,$7E,$7E
db $80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$7E,$7E,$7E,$7E,$7E,$7E