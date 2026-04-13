# Solano-post1-u4

Laboratorio 1 de la Unidad 4 de Arquitectura de Computadores: Primer programa en lenguaje ensamblador NASM para entorno DOS de 16 bits. Se implementan las tres secciones principales (.data, .bss, .text), las directivas de definicion de datos (DB, DW, DD, RESB, EQU), la inicializacion correcta del registro de segmento DS, y el uso de interrupciones DOS (INT 21h) para producir salida en pantalla mediante las funciones 09h y 02h.

Prerrequisitos
- NASM version 2.14 o superior (descargable desde https://www.nasm.us)
- ALINK enlazador para DOS (descargable desde https://alink.sourceforge.net)
- DOSBox 0.74 o superior para ejecutar el programa (descargable desde https://www.dosbox.com)
- Editor de texto plano (Notepad++, VS Code o similar)

Compilacion y ejecucion
- Paso 1: Ensamblar (desde CMD de windows)
  nasm -f obj programa.asm -o programa.obj
- Paso 2: Enlazar (desde CMD de Windows)
  alink programa.obj -oEXE -o programa.exe -entry main
- Paso 3 - Ejecutar (desde DOSBox)
  MOUNT C C:\(ruta)
  C:
  programa.exe

Salida esperada
=== Laboratorio NASM - Unidad 4 === 

----------------------------------------
Variable A (word): Z

: D N X b

Programa finalizado correctamente.

