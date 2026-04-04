@echo off

..\tools\bin_manager extract -r "..\Wurm_eng.nes" -f "title_fonts.bin" -o "3D010" -s "1000"
..\tools\bin_manager extract -r "..\Wurm_eng.nes" -f "main_fonts.bin" -o "3F010" -s "1000"

pause