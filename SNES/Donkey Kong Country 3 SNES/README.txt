Donkey Kong Country 3 - Dixie Kong's Double Trouble! (USA) (En,Fr)
Traducido por koda 2026

--------------------------------------------------------------------------------
1. INSTRUCCIONES
--------------------------------------------------------------------------------

Este parche debe ser aplicado a la versión americana sin cabecera.

La ROM es:

Database match: Donkey Kong Country 3 - Dixie Kong's Double Trouble! (USA) (En,Fr)
Database: No-Intro: Super Nintendo Entertainment System (v. 20210222-050638)
File/ROM SHA-1: D737E90D91DBA8620FD5C2985EB6FF2CDA7F23F9
File/ROM CRC32: 448EEC19

Utilicen "Lunar IPS" o "Floating IPS"
Pueden descargarlo de aquí:
https://www.romhacking.net/utilities/240/
https://www.romhacking.net/utilities/1040/

--------------------------------------------------------------------------------
2. VERSIONES
--------------------------------------------------------------------------------

Versión 1.0 (01/01/2026):
- Agregados los caracteres del idioma español.
- Traducidos todos los textos y nombres de los niveles.
- Traducido el menú secreto de prueba de sonido tras usar el código "MUSIC".
- Editados los gráficos del menú principal y de la presentación.
- Editada la rutina que agrega el carácter "!" al nombre de la etapa tras
  conseguir las dos monedas bonus; ahora se agrega "¡" al inicio.
- Editada la rutina de pluralización. El juego ahora siempre se refiere al
  jugador por el nombre del personaje activo (Dixie o Kiddy).
- Editado el menú principal. El idioma por defecto es el español y el cambio
  de idioma queda bloqueado.
- Reemplazado el ampersand "&" por la "Y" latina en el menú de selección de
  juego y en la pantalla de guardado de la cueva de Wrinkly en modo cooperativo.
- Corregido un error en el nivel "Rocket Rush", donde la letra "G" no existía.
- Corregido un error en el nivel "Pot Hole Panic", donde al final de la etapa
  había un problema de ralentización. Se cambiaron los enemigos para que
  coincidan con la versión Europea/Japonesa.
- Reubicado el globo rojo en el nivel "Krevice Kreepers", dejándolo en la misma
  posición que en la versión Europea/Japonesa.
- Corregido un problema de paleta de colores de Kiddy en la pantalla de bonus
  tras usar el código oculto "COLOR". Normalmente solo se cambiaba la paleta de
  Diddy; este error fue corregido oficialmente en la versión japonesa 1.1.
- Corregido un error en el nivel "Knautilus", si el jugador pausa el juego 
  en el momento de que un rayo es lanzado, este continuará moviéndose y golpeando
  inevitablemente al jugador.
  ´
Versión 1.1 (02/01/2026):
- Arreglado error que crashea el juego tras intentar guardar la partida en 
  cueva de Wrinkly tras ciertas condiciones.

--------------------------------------------------------------------------------
3. ERRORES CONOCIDOS
--------------------------------------------------------------------------------

Pregunta:
Estoy cargando una partida antigua desde la SRAM/batería del juego, pero el
texto sigue apareciendo en inglés.

Respuesta:
Sí, es normal. En la SRAM se guarda el idioma utilizado en la partida.

Solución:
1) Cargue la partida.
2) Abra la VRAM en el emulador.
3) Edite el offset $06D6 y cambie el valor de $00 a $01.
4) Para que el cambio sea permanente, vaya a la cueva de Wrinkly y guarde la
   partida nuevamente.

--------------------------------------------------------------------------------
4. ACERCA DE LA TRADUCCION
--------------------------------------------------------------------------------


Para esta traducción se creó una herramienta de autoría propia que permite
editar textos comprimidos. Para ello, también se modificaron los punteros
asociados a los textos.

Se utilizó parte del script original de Nintendo de la versión de Game Boy
Advance. Sin embargo, se puso especial énfasis en crear un español lo más
neutro posible, disfrutable tanto para jugadores de España como de
Latinoamérica. Entre los ajustes realizados se reemplazó el uso de "vosotros"
por "ustedes", además de adaptar frases muy localizadas al español de España.

En general, los nombres de niveles, NPC y objetos se mantienen prácticamente
iguales a los originales, lo que hace a esta traducción totalmente compatible
con la guía oficial de Nintendo.

Cambios destacados:
- El nivel "Duelo de Chorros" fue renombrado a "Duelo de Squirt", nombre
  original de la versión japonesa.
- El objeto "concha" fue renombrado a "almeja".

Además, se editó la rutina que identifica al personaje del jugador. De forma
original, si ambos personajes estaban vivos al hablar con un NPC, este se
refería al jugador como "Kongs". Esta lógica fue modificada y el uso de
"Kongs" fue bloqueado, ya que generaba conflictos al adaptar el guion. De esta
forma, los NPC siempre se dirigen al jugador por el nombre del personaje
activo y todo el guion se mantiene en singular.

--------------------------------------------------------------------------------
5. HERRAMIENTAS UTILIZADAS
--------------------------------------------------------------------------------
- Assembler Asar
  https://github.com/RPGHacker/asar

- HexString 1.4.1
  https://github.com/KodingBTW/hexstring

- DKC3 Text Editor
  https://github.com/KodingBTW/dkc3_texteditor

- dkcomp
  https://github.com/Kingizor/dkcomp

- DKC3 Level Editor por Kingizor

--------------------------------------------------------------------------------
6. CONTACTO
--------------------------------------------------------------------------------

Traducción realizada por:

Rodrigo Muñoz (koda)

Blog:
https://traduccioneskoda.blogspot.com

Correo de contacto:
traduccioneskoda@gmail.com

GitHub:
https://github.com/KodingBTW


--------------------------------------------------------------------------------
7. AGRADECIMIENTOS
--------------------------------------------------------------------------------

- Gdkchan:
  Uso de parte de su código fuente para la herramienta de compresión y
  descompresión de textos.

- Kingizor:
  Creador de la herramienta para extraer e insertar gráficos comprimidos de
  DKC3 y de su editor de niveles.

- Insectduel:
  Creador de un parche para depurar DKC3 con todo el inventario lleno.

- Blaziken257:
  Notas de ASM para el cambio de paleta de Kiddy tras usar el código "COLOR".

- Mattrizzle:
  Notas de ASM para corregir el bug del rayo en el Knautilus al pausar el juego.

--------------------------------------------------------------------------------
8. LICENCIA
--------------------------------------------------------------------------------

Acuerdo de Licencia para la Distribución de Parches de la autoría de koda

Este acuerdo de licencia (el "Acuerdo") establece los términos y condiciones
bajo los cuales el parche de modificación de ROM ("Parche") puede ser
distribuido y utilizado. El Parche puede presentarse en diversos formatos,
como IPS, BPS, xDelta, o cualquier otro formato similar utilizado para
modificar archivos de ROM. Al descargar, distribuir o utilizar el Parche, el
usuario acepta cumplir con los términos de este Acuerdo.

1. Propiedad del Parche

El Parche es propiedad intelectual del creador del mismo (en adelante, "El
Autor"). El Parche está destinado a ser utilizado para modificar archivos de
ROM de consolas retro, como NES, SNES o cualquier otra plataforma similar, y se
distribuye exclusivamente con fines no comerciales.

2. Uso Personal y No Comercial

El Parche puede ser utilizado de manera gratuita, mientras se mantenga su uso
estrictamente no comercial. Se autoriza a los usuarios a descargar, aplicar y
distribuir el Parche para su propio uso personal, siempre que no haya
intercambio de dinero, beneficios económicos, o cualquier forma de lucro
asociado. Se requiere mantener intactos todos los créditos y atribuciones al
Autor.

3. Restricciones de Uso Comercial

El uso comercial del Parche está estrictamente prohibido sin un acuerdo previo
y explícito por parte del Autor. Esto incluye, pero no se limita a, la venta,
la distribución con fines de lucro o el uso del Parche en proyectos
comerciales sin la autorización expresa del Autor. Si el Parche es utilizado
de manera comercial sin dicho acuerdo, la licencia será revocada
inmediatamente.

4. Copias de Seguridad Legítimas

El Parche debe ser aplicado exclusivamente a copias de seguridad legítimas de
las ROMs originales que el usuario posea. El uso del Parche sobre ROMs
obtenidas ilegalmente o que infrinjan los derechos de autor está estrictamente
prohibido. El Autor no se hace responsable por la aplicación del Parche sobre
copias ilegítimas o no autorizadas de las ROMs.

5. Distribución

El Parche puede ser distribuido de forma gratuita por cualquier medio o
plataforma, siempre y cuando no se modifique ni se altere el contenido del
Parche de ninguna manera y se mantengan los términos de uso no comercial.

6. No Responsabilidad

El Parche se proporciona "tal cual", sin ninguna garantía de ningún tipo,
explícita o implícita, incluyendo, pero no limitado a, garantías de
comerciabilidad o idoneidad para un propósito particular. El Autor no será
responsable de ningún daño directo, indirecto, incidental, especial,
consecuente o punitivo derivado del uso o la imposibilidad de usar el Parche.

7. Terminación

El Autor se reserva el derecho de terminar esta licencia en cualquier momento
si se incumplen los términos de este Acuerdo, especialmente en caso de uso
comercial no autorizado. En caso de terminación, el usuario debe cesar
inmediatamente el uso y la distribución del Parche.

8. Aceptación del Acuerdo

Al descargar, distribuir o usar el Parche, el usuario acepta los términos y
condiciones de este Acuerdo de Licencia. Si el usuario no está de acuerdo con
los términos de este Acuerdo, no debe descargar, distribuir ni usar el Parche.