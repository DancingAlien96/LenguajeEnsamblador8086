.model small
.stack 100h
.data

.code
mov ax,@data
mov ds,ax

mov ax,65535
mov bx,10
mov cx,0

ciclo:
mov dx, 0  ;limpio dx siempre antes de dividir 
div bx     ;divido dentro de 10 
push dx    ;meto a la pila el residuo 
inc cx     ;incremento cuantas veces divido para saber cuantas cifras tuvo 
cmp ax, 0  ;digo si el cociente es igual a 0
je imprimir ;si es igual entonces termino de dividir y me voy a imprimir 
jne ciclo    ;si el cociente no es igual a 0 pues repito el ciclo 


imprimir:
   pop ax   ;saco de la pila y lo almaceno en ax por conveniencia 
   add al,30h   ; ahora lo convierto en ascii 
   mov ah,02h   ; llamo mi interrupcion de impresion de caracter 
   mov dl,al    ; le mando lo que tiene mi numero en ascii a dl para imprimir
   int 21h      ;imprimo en pantalla con esta interrupcion
loop imprimir   ;se va a repetir depende el numero de cifras que tenga cantidad
   


.exit 
