.model small 
.stack 100h 
.data

mensaje1 db "ingrese numero: ",24h 
temporal dw 0
unidad db 0
decena db 0 
numero dw 0
mensaje2 db "numero ingresado: ",24h
mensaje3 db "resultado : ",24h 

primernumero dw 0
segundonumero dw 0
resultado dw 0
.code


 
mov ax,@data 
mov ds,ax 


mov ah,09h 
mov dx,offset mensaje1
int 21h  


mov ah,01h
int 21h 
sub al,30h
mov decena,al 

mov ah,01h
int 21h
sub al,30h
mov unidad,al  

mov al,decena 
mov bl,10 
mul bl 
add al,unidad

mov numero,ax
mov primernumero,ax 

;este bloque es para el salto de linea  
mov ah, 0eh
mov al,10
int 10h
    
; este es para evitar la tabulacion y que el texto aparezca pegado al borde 
mov ah,0eh
mov al,13
int 10h 
    
mov ah,09h
mov dx,offset mensaje2
int 21h 
 
call cifras

;peticion del segundo numero

;este bloque es para el salto de linea  
mov ah, 0eh
mov al,10
int 10h
    
; este es para evitar la tabulacion y que el texto aparezca pegado al borde 
mov ah,0eh
mov al,13
int 10h 
  
mov ah,09h 
mov dx,offset mensaje1
int 21h  


mov ah,01h
int 21h 
sub al,30h
mov decena,al 

mov ah,01h
int 21h
sub al,30h
mov unidad,al  

mov al,decena 
mov bl,10 
mul bl 
add al,unidad

mov numero,ax
mov segundonumero,ax  

;este bloque es para el salto de linea  
mov ah, 0eh
mov al,10
int 10h
    
; este es para evitar la tabulacion y que el texto aparezca pegado al borde 
mov ah,0eh
mov al,13
int 10h 

mov ah,09h
mov dx,offset mensaje2
int 21h 
 
call cifras


call multiplicacion

;este bloque es para el salto de linea  
mov ah, 0eh
mov al,10
int 10h
    
; este es para evitar la tabulacion y que el texto aparezca pegado al borde 
mov ah,0eh
mov al,13
int 10h 

mov ah,09h
mov dx,offset mensaje3
int 21h 
 
call cifras
call finalizar 


 

cifras proc

mov ax,0
mov ax,numero         
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

ret 
cifras endp    



multiplicacion proc 
    mov ax, primernumero 
    mov bx, segundonumero 
    mul bx 
    mov numero,ax 
    ret 
multiplicacion endp 




finalizar proc 
    mov ah, 4Ch
    int 21h
    ret 
finalizar endp     
    
    

.exit 