Dragon Warrior II (USA).nes
Traducido por koda 2025

---------------------------------------------------------------------------------------------
1. INSTRUCCIONES
---------------------------------------------------------------------------------------------

Este parche debe ser aplicado a la versión americana con cabecera:

Database match: Dragon Warrior II (USA)
Database: No-Intro: Nintendo Entertainment System (v. 20210216-231042)
File SHA-1: D77A4F66E7314F3E67C1AC647DE3B72DD681A9E3
File CRC32: FFB8C056
ROM SHA-1: 191A131E7E27E121D094CC412FED87C708147B2C
ROM CRC32: 8C5A784E

Utilicen "Lunar IPS" o "Floating IPS"
Pueden descargarlo de aquí:
https://www.romhacking.net/utilities/240/
https://www.romhacking.net/utilities/1040/

Se incluyen 2 parches, el principal "Dragon Warrior II (ESP).ips" y el secundario 
"Dragon Warrior II (ESP)_localización_americana.ips" que utiliza los nombres para las ciudades
de la primera localización de NES, junto con el nombre del Héroe denominado Erdrick, además
la pantalla de título se mantiene el nombre del juego como "Dragon Warrior parte 2", más 
detalle sobre las diferencias en el apartado de "Traducción".

Ambos parches son independientes y deben aplicarse a la ROM base.

Además se incluyen 2 parches que modifican la dificultad del juego, uno con la dificultad
americana, y otro con la japonesa, para las personas que son mas Hardcore.

NOTA: Ambos parches citados arriba ya incluyen por defecto la dificultad americana, si se ha
incluido es solo por si alguien decide arrepentirse.

---------------------------------------------------------------------------------------------
2. VERSIONES
---------------------------------------------------------------------------------------------

Versión 1.0 (17/09/2025):

- Traducido completamente al español.
- Editada pantalla de presentación y de inicio.
- Agregados caracteres espaciales del español.
- Menús expandidos.
- Función interna de refresco de pantalla expandida para que coincidan con los menús.
- Editadas tamaño máximo de cadenas para monstruos y conjuros.
- Bloque principal del script expandido.
- Editada rutinas de plurales para el correcto uso del español.
- Creadas rutinas que permiten identificar un enemigo o un grupo de enemigos, creando un
byte de control nuevo para ha/han
- Creada rutina de control que permite identificar el genero de los enemigos, creando un
byte de control nuevo un/una
- Arreglado un error en la función interna del byte "F2", para el conteo del oro.
- Agrega la función de detener el sonido de los diálogos de los personaje, trás cerrar un
diálogo con el caracter ’.
- Aleatoriedad completa para los nombres del príncipe de Cannock y la princesa de Moonbroke,
ya no se usa la letra inicial del jugador como semilla para elección de nombres.
- Eliminada la censura en el mapa del templo de Hargon y la iglesia de Cannock.
- Recuperado el "sprite" original del clérigo en la iglesia.
- Recuperados algunos diálogos censurados por la versión inglesa.
- Créditos finales expandidos y traducidos.

---------------------------------------------------------------------------------------------
3. ERRORES CONOCIDOS
---------------------------------------------------------------------------------------------

- Al vender un objeto el menú de comando se ve cortado hasta terminar la acción, esto
es por una limitación, y no se ha arreglado.
- Ninguno que yo sepa, informar al correo de contacto para su arreglo inmediato.

---------------------------------------------------------------------------------------------
4. SOBRE FUNCIONES AÑADIDAS
---------------------------------------------------------------------------------------------

El citado juego posee una compresión de textos de 5 bits. Aunque ya existía documentación al 
respecto y código que permitía su extracción, no se contaba con la parte más importante: la 
reinserción. Por ello se desarrolló una herramienta propia que permite automatizar el proceso 
completo: extracción, reinserción, búsqueda de diccionarios automáticos y formateo de 
punteros asociados. 

El espacio base de la ROM resultó ser muy limitado y, como se suponía desde el inicio, una
traducción al español requería un mayor trabajo de romhacking. Afortunadamente, al ser un
título bastante famoso, esta bien documentado por la comunidad y, gracias a las notas de
"disassembler", fue posible manipular parte del banco del script principal para moverlo a un
lugar más conveniente, eliminando así las limitaciones de espacio para la traducción.

En general, las modificaciones de espacio no se limitaron únicamente al script principal
sino que también abarcaron las listas de nombres de monstruos, conjuros y objetos, como
también para los créditos finales. Asimismo, de poco habría servido ampliar el espacio de
texto, si no se hubiera hecho lo propio con el espacio gráfico: por ello se expandieron los
menús, con el fin de evitar el uso de abreviaturas. Además de expandirse las limitaciones de
cadenas en los nombres de monstruos y conjuros.

Otro punto clave fue la edición de la rutina de plurales en inglés, que si bien comparte
cierta regla como lo es agregar "s" al final de la palabra, las demás reglas son
incompatibles. Es por esto que el código ha sido editado mediante ASM a las reglas de
plurales del español.

El juego, al ser el primero de la saga en incluir batallas contra grupo de enemigos, posee
de base una rutina que indica la cantidad en pantalla. si bien es cierto cambiar los textos
no supone un gran desafío de "Romhacking", ocurre algo especial con el número uno, pues para
contar de debe hacer uso del artículo un/una. Para solucionar esto, se creó una rutina que
detecta el género del monstruo en pantalla.

Trás un poco de testeo se detecto un error para dos casos de monstruos con terminaciones
contrarias a lo que usualmente dictan las reglas, en este caso "Mano" y "Miasma", por lo
tanto, toco nuevamente agregar estas excepciones a la regla.

Otra funcionalidad que se agregó fue la anulación de la cuenta para los jefes, pues si bien
esto si está en la versión base, esto es extraño de aplicar para nombres propios, y lo hace
muy poco natural. Esto ocurre para los siguientes monstruos: Atlas, Pazuzu, Belial (Zarlox),
Hargon y Malroth (Shido).

---------------------------------------------------------------------------------------------
5. CENSURA
---------------------------------------------------------------------------------------------

Gracias al trabajo de Translation Quest se restauró la forma de cruz en el templo de Hargon,
y la cruz en la iglesia de Cannock (Sumatria), como el sprite original del clérigo. También
se recuperaron otros diálogos que habían sido censurados en la versión occidental.

---------------------------------------------------------------------------------------------
6. NOMBRES PRÍNCIPE Y PRINCESA
---------------------------------------------------------------------------------------------

El juego incluye una rutina que asigna al azar nombres al príncipe de Cannock (Sumaltría)
y a la princesa de Moonbrooke a partir de una lista predefinida. Sin embargo, este azar
estaba condicionado: la elección dependía de la primera letra del nombre del protagonista,
lo que provocaba que repitiendo el mismo nombre siempre se obtuvieran los mismos nombres para
los dos personajes.

Translation Quest modificó esta rutina para que la elección fuese totalmente aleatoria, lo
que da mayor rejugabilidad al título. Asimismo, el nombre de la princesa ahora aparece
durante la secuencia introductoria.

---------------------------------------------------------------------------------------------
7. SOBRE LA TRADUCCIÓN
---------------------------------------------------------------------------------------------

Para el grueso de la traducción se ha usado de base la versión sin censura de
Translation Quest, además se ha hecho uso de los nombres japoneses para las ciudades, objetos
y de la lista de nombres para el príncipe de Cannock y princesa de Moonbroke.

Además la traducción intenta estandarizar la terminología con las traducciones actuales,
es por esto que los nombres de objetos, hechizos, y monstruos podrían no coincidir 
con su contraparte literal japonesa. 

Sin embargo, se incluye un parche que permite utilizar los nombres originales de la
localización americana, en el siguiente cuadro se detallan las diferencias en los nombres:

+----------------------------+------------------------------------------+
|		Versión Base		 |             Versión Extra				|
|   Dragon Quest 2 (ESP).ips |           Dragon Quest 2 (ESP)_			|
|							 |		 localización_americana.ips 		|
+----------------------------+------------------------------------------+
|                        Ciudades                                       |
+----------------------------+------------------------------------------+
| Moonbrook                  | Moonbroke                                |
| Laurasia                   | Midenhall                                |
| Sumaltria                  | Cannock                                  |
| Liriza                     | Leftwyne                                 |
| Beranule                   | Beran                                    |
| Moonpeta                   | Hamlin                                   |
| Ladatorm                   | Tantegel                                 |
| Rupugana                   | Lianport                                 |
| Zahan                      | Zahan                                    |
| Perpoy                     | Wellgarth                                |
| Tepa                       | Tuhn                                     |
| Dercondal                  | Osterfair                                |
| Alefgrado                  | Alefgard                                 |
+----------------------------+------------------------------------------+
|                        NPCs                                           |
+----------------------------+------------------------------------------+
| Tashisun                   | Torval                                   |
| Laura                      | Gwaelin                                  |
| Loto                       | Erdrick                                  |
| Don Mohame                 | Don Mahone                               |
| Lagos                      | Roge Dedos Rápidos                       |
| Luke                       | Formeo                                   |
| Gina                       | Jena                                     |
+----------------------------+------------------------------------------+
|                        Objetos                                        |
+----------------------------+------------------------------------------+
| Espada de Loto			 | Espada de Erdrick						|
| Armadura de Loto			 | Armadura de Erdrick						|
| Casco de Loto				 | Casco de Erdrick							|
| Escudo de Loto			 | Escudo de Erdrick						|
| Emblema de Loto			 | Emblema de Erdrick						|
+----------------------------+------------------------------------------+

Se dejará pendiente como tarea futura una revisión completa para toda la terminología, 
tras la salida del "Dragon Quest 1+2 HD-2D Remake".

---------------------------------------------------------------------------------------------
8. CONTACTO
---------------------------------------------------------------------------------------------

Traducción hecha por Rodrigo Muñoz, alias Koda. Visita https://traduccioneskoda.blogspot.com 
para más traducciones.

Para agradecimientos, sugerencias, errores e insultos enviar a traduccioneskoda@gmail.com

---------------------------------------------------------------------------------------------
9. CRÉDITOS
---------------------------------------------------------------------------------------------

- Al equipo completo de Translation Quest, por crear una traducción sin censura, junto con
todas la funciones nuevas que han incluido.
- A Alex_231 por las notas iniciales de descompresión del Dragon Warrior 2.
- A Osteoclave por el código de Github que ha servido de guía para la creación de una 
herramienta editora propia.
- A Noishe por recomendar hacer uso de la traducción delocalizada.
- A Wave por ayudar a hacer un repaso general al script.
- Y agradecimientos especiales a los usuarios abw y Joe73ffdq por las notas de disassembler
subidas a Romhacking.net y Datacrystal.

---------------------------------------------------------------------------------------------
10. LICENCIA
---------------------------------------------------------------------------------------------

Acuerdo de Licencia para la Distribución de Parches de la autoría de koda

Este acuerdo de licencia (el "Acuerdo") establece los términos y condiciones bajo los cuales
el parche de modificación de ROM ("Parche") puede ser distribuido y utilizado. El Parche
puede presentarse en diversos formatos, como IPS, BPS, xDelta, o cualquier otro formato
similar utilizado para modificar archivos de ROM. Al descargar, distribuir o utilizar el
Parche, el usuario acepta cumplir con los términos de este Acuerdo.

1. Propiedad del Parche 

El Parche es propiedad intelectual del creador del mismo (en adelante, "El Autor"). El Parche
está destinado a ser utilizado para modificar archivos de ROM de consolas retro, como NES,
SNES o cualquier otra plataforma similar, y se distribuye exclusivamente con fines no
comerciales.

2. Uso Personal y No Comercial

El Parche puede ser utilizado de manera gratuita, mientras se mantenga su uso estrictamente
no comercial. Se autoriza a los usuarios a descargar, aplicar y distribuir el Parche para su
propio uso personal, siempre que no haya intercambio de dinero, beneficios económicos, o
cualquier forma de lucro asociado. Se requiere mantener intactos todos los créditos y
atribuciones al Autor.

3. Restricciones de Uso Comercial

El uso comercial del Parche está estrictamente prohibido sin un acuerdo previo y explícito
por parte del Autor. Esto incluye, pero no se limita a, la venta, la distribución con fines
de lucro o el uso del Parche en proyectos comerciales sin la autorización expresa del Autor.
Si el Parche es utilizado de manera comercial sin dicho acuerdo, la licencia será revocada
inmediatamente.

4. Copias de Seguridad Legítimas

El Parche debe ser aplicado exclusivamente a copias de seguridad legítimas de las ROMs
originales que el usuario posea. El uso del Parche sobre ROMs obtenidas ilegalmente o que
infrinjan los derechos de autor está estrictamente prohibido. El Autor no se hace responsable
por la aplicación del Parche sobre copias ilegítimas o no autorizadas de las ROMs.

5. Distribución

El Parche puede ser distribuido de forma gratuita por cualquier medio o plataforma, siempre
y cuando no se modifique ni se altere el contenido del Parche de ninguna manera y se
mantengan los términos de uso no comercial.

6. No Responsabilidad

El Parche se proporciona "tal cual", sin ninguna garantía de ningún tipo, explícita o
implícita, incluyendo, pero no limitado a, garantías de comerciabilidad o idoneidad para un
propósito particular. El Autor no será responsable de ningún daño directo, indirecto,
incidental, especial, consecuente o punitivo derivado del uso o la imposibilidad de usar el
Parche.

7. Terminación

El Autor se reserva el derecho de terminar esta licencia en cualquier momento si se incumplen
los términos de este Acuerdo, especialmente en caso de uso comercial no autorizado. En caso
de terminación, el usuario debe cesar inmediatamente el uso y la distribución del Parche.

8. Aceptación del Acuerdo

Al descargar, distribuir o usar el Parche, el usuario acepta los términos y condiciones de
este Acuerdo de Licencia. Si el usuario no está de acuerdo con los términos de este Acuerdo,
no debe descargar, distribuir ni usar el Parche.