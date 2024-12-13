echo "Yu Yu Hakusho - Bakutou Ankoku Bujutsukai - Text Inserter"
:: Set rom patch
set romName="Yu Yu Hakusho - Bakutou Ankoku Bujutsukai (J).nes"
:: Set input File
set textFile1="Text1.bin"
set textFile2="Text2.bin"
set textFile3="Text3.bin"
set textFile4="Text4.bin"
:: Set encoder File
set tblFile="encoder.tbl"
:: Set pointers Address
set pointersStartAddress1=0x385DE
set pointersStartAddress2=0x386FA
set pointersStartAddress3=0x39636
set pointersStartAddress4=0x396E0
:: Set text Address
set textStartAddress1=0x387DE
set textStartAddress2=0x3B120
set textStartAddress3=0x39736
set textStartAddress4=0x3B910
:: Set header size
set headerSize=0x30010
:: Set text size
set textSize1=0xE09
set textSize2=0x7F0
set textSize3=0x359
set textSize4=0x5C0
:loop
	pause
	HexString -e -2b %textFile1% %textStartAddress1% %textSize1% %pointersStartAddress1% %headerSize% %romName% %tblFile%
	HexString -e -2b %textFile2% %textStartAddress2% %textSize2% %pointersStartAddress2% %headerSize% %romName% %tblFile%
	HexString -e -2b %textFile3% %textStartAddress3% %textSize3% %pointersStartAddress3% %headerSize% %romName% %tblFile%
	HexString -e -2b %textFile4% %textStartAddress4% %textSize4% %pointersStartAddress4% %headerSize% %romName% %tblFile%
goto :loop

