; programa.asm — Laboratorio Post1 Unidad 4 
; Proposito: demostrar directivas de seccion, datos y constantes en NASM

; == Constantes (EQU, no reservan memoria) ==
CR          EQU 0Dh         ; Carriage Return
LF          EQU 0Ah         ; Line Feed
TERMINADOR  EQU 24h         ; "$" terminador de cadena para DOS
ITERACIONES EQU 5           ; numero de repeticiones del bucle

; == Datos inicializados ==
section .data
    bienvenida  db "=== Laboratorio NASM - Unidad 4 ===", CR, LF, TERMINADOR
    separador   db "----------------------------------------", CR, LF, TERMINADOR
    etiqueta_a  db "Variable A (word): ", TERMINADOR
    etiqueta_b  db "Variable B (dword): ", TERMINADOR
    fin_msg     db "Programa finalizado correctamente.", CR, LF, TERMINADOR

    ; Tipos de datos demostrados
    var_byte    db 42                   ; 1 byte con valor 42
    var_word    dw 1234h                ; 2 bytes con valor 0x1234
    var_dword   dd 0DEADBEEFh           ; 4 bytes
    tabla_bytes db 10, 20, 30, 40, 50  ; 5 bytes consecutivos

; == Datos no inicializados ==
section .bss
    buffer      resb 80     ; 80 bytes para entrada
    resultado   resw 1      ; 1 word para almacenar calculo

; == Codigo ejecutable ==
section .text
    global main

main:
    ; Inicializar DS apuntando al segmento de datos
    mov ax, seg bienvenida  ; obtener segmento donde estan los datos
    mov ds, ax              ; DS apunta a la seccion de datos

    ; Imprimir mensaje de bienvenida
    mov ah, 09h
    mov dx, bienvenida
    int 21h

    ; Imprimir separador
    mov ah, 09h
    mov dx, separador
    int 21h

    ; Imprimir etiqueta_a
    mov ah, 09h
    mov dx, etiqueta_a
    int 21h

    ; Imprimir var_byte como caracter ASCII
    mov al, [var_byte]      ; AL = 42
    add al, 30h             ; 42 + 48 = 90 = 'Z'
    mov ah, 02h
    mov dl, al
    int 21h

    ; Nueva linea
    mov ah, 02h
    mov dl, CR
    int 21h
    mov ah, 02h
    mov dl, LF
    int 21h

    ; Recorrer tabla de bytes
    mov si, tabla_bytes
    mov cx, ITERACIONES

.imprimir_tabla:
    mov al, [si]
    add al, 30h
    mov ah, 02h
    mov dl, al
    int 21h

    mov ah, 02h
    mov dl, 20h             ; espacio
    int 21h

    inc si
    loop .imprimir_tabla

    ; Nueva linea
    mov ah, 02h
    mov dl, CR
    int 21h
    mov ah, 02h
    mov dl, LF
    int 21h

    ; Mensaje final
    mov ah, 09h
    mov dx, fin_msg
    int 21h

    ; Terminar programa
    mov ax, 4C00h
    int 21h
