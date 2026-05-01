set ROM="../Asterix (Europe) (En,Fr) (Rev 1).sms"

::ENGLISH
..\tools\asterix_texteditor.py extract -l "en" -r %ROM% -f "main_script_eng.txt" -t "asterix_compressed_script_eng.tbl"
..\tools\string_format extract -m "2" -r %ROM% -f "intro_1_eng.txt" -t "asterix_compressed_script_eng_2.tbl" -o "5D70B" -s "488" -l "58"
..\tools\string_format extract -m "2" -r %ROM% -f "intro_2_eng.txt" -t "asterix_compressed_script_eng_2.tbl" -o "5DB93" -s "488" -l "58"
..\tools\string_format extract -m "2" -r %ROM% -f "intro_3_eng.txt" -t "asterix_compressed_script_eng_2.tbl" -o "5E01B" -s "488" -l "58"
..\tools\string_format extract -m "0" -r %ROM% -f "bonus_eng.txt" -t "asterix_compressed_script_eng_1.tbl" -o "5D2E7" -s "2E"

::FRANCAIS
..\tools\asterix_texteditor.py extract -l "fr" -r %ROM% -f "main_script_fr.txt" -t "asterix_compressed_script_eng.tbl"
..\tools\string_format extract -m "2" -r %ROM% -f "intro_1_fr.txt" -t "asterix_compressed_script_eng_2.tbl" -o "5E4A3" -s "488" -l "58"
..\tools\string_format extract -m "2" -r %ROM% -f "intro_2_fr.txt" -t "asterix_compressed_script_eng_2.tbl" -o "5E92B" -s "488" -l "58"
..\tools\string_format extract -m "2" -r %ROM% -f "intro_3_fr.txt" -t "asterix_compressed_script_eng_2.tbl" -o "5ED83" -s "488" -l "58"
pause