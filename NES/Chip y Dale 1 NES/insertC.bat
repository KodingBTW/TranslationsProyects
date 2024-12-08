echo "Chip 'n Dale Rescue Rangers (USA)nes"
set romName="Chip 'n Dale Rescue Rangers (USA) - UpperCase.nes"
set textFile="ChipText.bin"
set tblFile="encoderC.tbl"
set pointersStartAddress=0x9546
set textStartAddress=0x956E
set headerSize=0x10
set textSize=0x0832
:loop
	pause
	HexString -e -2bs %textFile% %textStartAddress% %textSize% %pointersStartAddress% %headerSize% %romName% %tblFile%
goto :loop

