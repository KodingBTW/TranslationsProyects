echo "Goof Troop Text Extractor"
set romName="Goof Troop (USA).sfc"
set outFile1="GoofScriptText1.bin"
set outFile2="GoofScriptText2.bin"
set tblFile="encoder.tbl"
set pointersStartAddress1=0x5E81D
set pointersStartAddress2=0x5E875
set tablePointersSize1=0x58
set tablePointersSize2=0x0C
set headerSize=0x50000
set lineBreakers=0x00
HexString -d %romName% %pointersStartAddress1% %tablePointersSize1% %headerSize% %lineBreakers% %outFile1% %tblFile%
HexString -d %romName% %pointersStartAddress2% %tablePointersSize2% %headerSize% %lineBreakers% %outFile2% %tblFile%
pause