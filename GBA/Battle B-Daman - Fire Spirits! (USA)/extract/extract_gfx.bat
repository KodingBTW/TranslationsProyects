set ROM="../Battle B-Daman - Fire Spirits! (USA).gba"

..\tools\bbd_nybbles.py decompress -r %ROM% -f "main_fonts.bin" -o "CF75C" -s "6A40"
..\tools\bbd_lz_rle.py unpack -a 0x70C488 -o "nintendo_license.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x70E74C -o "title_screen_logo.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x70F341 -o "title_screen_start.bin" %ROM%
..\tools\bbd_lz_rle.py unpack -a 0x74B410 -o "TEST.bin" %ROM%

pause