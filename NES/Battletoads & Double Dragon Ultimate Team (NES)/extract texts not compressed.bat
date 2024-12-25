echo ""
set romName="Battletoads & Double Dragon - The Ultimate Team.nes"
set outFile="text2.bin"
set tblFile="decoder.tbl"
set pointersStartAddress=0x37AC3
set tablePointersSize=0x3A
set headerSize=0x28010
set lineBreakers=0x80,0xA7,0xA3,0x9D,0x9F,0xA5,0x9B,0x99,0x93,0xFF
HexString.exe -d -2b %romName% %pointersStartAddress% %tablePointersSize% %headerSize% %lineBreakers% %outFile% %tblFile%
pause