echo "Chip & Dale - Rescue Rangers - Text Extractor"
set romName="Chip 'n Dale Rescue Rangers (USA).nes"
set outFile="ChipText.bin"
set tblFile="decoderC.tbl"
set pointersStartAddress=0x9546
set tablePointersSize=0x28
set headerSize=0x10
set lineBreakers=0xFF
HexString.exe -d -2bs %romName% %pointersStartAddress% %tablePointersSize% %headerSize% %lineBreakers% %outFile% %tblFile%
pause