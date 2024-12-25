echo ""
set romName="Battletoads & Double Dragon - The Ultimate Team.nes"
set textFile="text2.bin"
set tblFile="decoder.tbl"
set pointersStartAddress=0x37AC3
set textStartAddress=0x37AFD
set headerSize=0x28010
set textSize=121
:loop
	pause
	HexString -e -2b %textFile% %textStartAddress% %textSize% %pointersStartAddress% %headerSize% %romName% %tblFile%
goto :loop

