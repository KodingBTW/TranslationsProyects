set romName="Battletoads & Double Dragon - The Ultimate Team.nes"
set treeLeftOffset=0x1B5BA
set encodedTextSize=0xA76
:loop
	habsentmindedBtDD -e text1.bin compressedtext1.bin
	insertBin compressedtext1.bin %romName% -o %treeLeftOffset% -s %encodedTextSize%
	echo "Inserted"
goto :loop
