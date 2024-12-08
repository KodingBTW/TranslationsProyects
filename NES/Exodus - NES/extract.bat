echo "Exodus - Questions Extractor"
set romName="Exodus - Journey to the Promised Land (USA) (v4.0) (Unl).nes"
set outFile="QuestionsText.bin"
set tblFile="decoder.tbl"
set pointersStartAddress=0x144F4
set tablePointersSize=0x1F4
set headerSize=0x8010
set lineBreakers=0x04,0x05,0x06,0x07
HexString.exe -d %romName% %pointersStartAddress% %tablePointersSize% %headerSize% %lineBreakers% %outFile% %tblFile%
pause