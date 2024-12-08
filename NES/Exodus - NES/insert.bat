echo "Exodus - Questions Inserter"
set romName="Exodus - Journey to the Promised Land (USA) (v4.0) (Unl).nes"
set textFile1="QuestionsText1.bin"
set textFile2="QuestionsText2.bin"
set tblFile="encoder.tbl"
set pointersStartAddress1=0x144F4
set pointersStartAddress2=0x146CA
set textStartAddress1=0x1007B
set textStartAddress2=0x17A80
set headerSize1=0x8010
set headerSize2=0x8010
set textSize1=0x4479
set textSize2=0x4D0
:loop
	pause
	HexString -e %textFile1% %textStartAddress1% %textSize1% %pointersStartAddress1% %headerSize1% %romName% %tblFile%
	HexString -e %textFile2% %textStartAddress2% %textSize2% %pointersStartAddress2% %headerSize2% %romName% %tblFile%
goto :loop

