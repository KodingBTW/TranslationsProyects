echo "Yu Yu Hakusho - Bakutou Ankoku Bujutsukai - Text Extractor"
:: Set rom patch
set romName="Yu Yu Hakusho - Bakutou Ankoku Bujutsukai (J).nes"
:: Set decoder File
set tblFile="decoder.tbl"
:: Set output File
set outFile1="Text1.bin"
set outFile2="Text2.bin"
set outFile3="Text3.bin"
set outFile4="Text4.bin"
:: Set pointers Address
set pointersStartAddress1=0x385DE
set pointersStartAddress2=0x38706
set pointersStartAddress3=0x39636
set pointersStartAddress4=0x396EC
:: Set table pointers Size
set tablePointersSize1=0x128
set tablePointersSize2=0x54
set tablePointersSize3=0xB6
set tablePointersSize4=0x42
:: Set header size
set headerSize=0x30010
:: Set line breaker
set lineBreakers=0x2F,0x21,0xFF
::HexString.exe -d -2b %romName% %pointersStartAddress1% %tablePointersSize1% %headerSize% %lineBreakers% %outFile1% %tblFile%
::HexString.exe -d -2b %romName% %pointersStartAddress2% %tablePointersSize2% %headerSize% %lineBreakers% %outFile2% %tblFile%
::HexString.exe -d -2b %romName% %pointersStartAddress3% %tablePointersSize3% %headerSize% %lineBreakers% %outFile3% %tblFile%
::HexString.exe -d -2b %romName% %pointersStartAddress4% %tablePointersSize4% %headerSize% %lineBreakers% %outFile4% %tblFile%
pause