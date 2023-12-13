ORG 100h  ; Punto de entrada para programas DOS

MOV DX, 3F8h ; Configura DX para el puerto COM1
MOV AL, 0    ; Borra AL para almacenar los datos recibidos

; Configura el puerto COM1 para 8 bits de datos, 1 bit de parada y sin paridad
MOV DX, 3F8h ; Dirección del registro de control del puerto COM1
MOV AL, 80h  ; Habilita el divisor de baudios (DLAB=1)
OUT DX, AL   ; Envía la configuración al registro de control

; Espera a que haya datos disponibles en el puerto COM1
WAIT_FOR_DATA:
    MOV DX, 3F8h ; Dirección del registro de línea de estado del puerto COM1
    IN AL, DX    ; Lee el registro de línea de estado
    TEST AL, 01h ; Comprueba el bit 0 (Data Ready)
    JZ WAIT_FOR_DATA ; Espera si no hay datos disponibles

; Lee un byte de datos recibidos desde el puerto COM1
MOV DX, 3F8h ; Dirección del registro de datos del puerto COM1
IN AL, DX    ; Lee el byte de datos recibidos

; En este punto, AL contiene el byte de datos recibidos desde COM1

INT 20h    ; Termina el programa y sale de DOS

TIMES 510 - ($ - $$) DB 0  ; Rellena el sector de arranque con ceros
DW 0xAA55  ; Firma de arranque
