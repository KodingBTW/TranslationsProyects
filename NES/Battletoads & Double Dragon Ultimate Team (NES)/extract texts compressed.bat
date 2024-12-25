echo off
set romName="Battletoads & Double Dragon - The Ultimate Team.nes"
set treeLeftOffset=0x1B5BA
set encodedTextSize=0xA76
echo on
habsentmindedBtDD -d %romName% text1.bin
pause