echo "Goof Troop - Text Script Inserter"
set romName="Goof Troop (USA).sfc"
set textFile1="GoofScriptText1.bin"
set textFile2="GoofScriptText2.bin"
set tblFile="encoder.tbl"
set pointersStartAddress1=0x5E81D
set pointersStartAddress2=0x5E875
set textStartAddress1=0x5E881
set textStartAddress2=0x5E240
set headerSize=0x50000
set textSize1=0x111E
set textSize2=0x5C0
:loop
	pause
	HexString -e %textFile1% %textStartAddress1% %textSize1% %pointersStartAddress1% %headerSize% %romName% %tblFile%
	HexString -e %textFile2% %textStartAddress2% %textSize2% %pointersStartAddress2% %headerSize% %romName% %tblFile%
goto :loop

