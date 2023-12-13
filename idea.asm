.model small
.stack 100h
.data

cadena1 db "digite un numero: ",24h
cadena2 db "digite otro numero: ",24h
primo db "este numero es primo",24h
compuesto db "este numero es compuesto",24h
resultado db "numero ingresado: ", 24h
decena db 0
unidad db 0
numentero db 0
nombrecompleto db "Cristofer Mauricio Perez Flores",24h ; variable de cadena
apuntador db "ABCDEFGHIJKLMNOPQRSTUVWXYZ",24h
msg1 db "letras: ",24h 
msg2 db "encontradas",24h
finalizacion db "analisis terminado!",24h
acumulador db 0  

.code

mov ax,@data
mov ds,ax

mov ah, 0
mov al,00h ;modo video de 40x25 16 colores
int 10h

;este bloque sirve para darle color a la pantalla antes de eso inicie en el modo de video
mov ax, 0600h
mov bh, 10h
mov cx, 0000h
mov dh, 25 ;filas
mov dl,40 ;columnas
int 10h


inicio:
mov ah,09h
mov dx,offset cadena1
int 21h


mov ah, 01h  ; solicitar un numero al usario con el 01 pero en este caso sera la primera cifra o sea la decena
int 21h
sub al,30h
mov decena,al

mov ah, 01h  ; solicitar la segunda cifra o sea la unidad
int 21h
sub al,30h
mov unidad,al
;convertir el numero como una cantidad entera
mov al,decena
mov bl,10d
mul bl
add al,unidad
mov numentero,al

;este bloque es para el salto de linea
mov ah, 0eh
mov al,10
int 10h

; este es para evitar la tabulacion y que el texto aparezca pegado al borde
mov ah,0eh
mov al,13
int 10h

mov ah,09h
mov dx,offset cadena2
int 21h

mov ah, 02h
mov dl,decena
add dl, 30h
int 21h

mov ah,02h
mov dl,unidad
add dl,30h
int 21h
jmp verificacion

verificacion:
mov al, numentero
cmp al,0
jg divisiblepor2 ;si es mayor que cero ese numero ingresado entonces si podes pasar a operar


divisiblepor2:
mov ah,0
mov bl,2
cmp al,bl
je busqueda
div bl

cmp ah,00

je numerocompuesto
jne divisiblepor3

divisiblepor3:

mov ah,0
mov al,numentero
mov bl,3
cmp al,bl
je busqueda

div bl
cmp ah,00
je numerocompuesto
jne divisiblepor5

divisiblepor5:

mov ah,0
mov al,numentero
mov bl,5
cmp al,bl
je busqueda

div bl
cmp ah,00
je numerocompuesto
jne divisiblepor7

divisiblepor7:

mov ah,0
mov al,numentero
mov bl,7
cmp al,bl
je busqueda

div bl
cmp ah,00
je numerocompuesto
jne busqueda

numerocompuesto:
mov ah, 0eh
mov al,10
int 10h
mov ah,0eh
mov al,13
int 10h
mov ah, 09h
mov dx, offset compuesto
int 21h
jmp cerrar

numeroprimo:
mov ah, 0eh
mov al,10
int 10h
mov ah,0eh
mov al,13
int 10h
mov ah,09h
mov dx, offset primo
int 21h



mov si,0
mov di,0



busqueda:
     mov al, nombrecompleto[si]
     mov bl, apuntador[di]
     cmp al,bl
     je contador
     cmp al,'$'
     je punteros  
     inc si
     jne busqueda        

     contador:
     inc acumulador 
     inc si  
     jmp busqueda 

  puntero:
         ;este bloque es para el salto de linea  
        mov ah, 0eh
        mov al,10
        int 10h
    
    ; este es para evitar la tabulacion y que el texto aparezca pegado al borde 
       mov ah,0eh
       mov al,13
       int 10h 
    
         mov al,acumulador
         mov acumulador,0
         
         
         mov dx, 0
         mov ah,0
         aam ;ajuste en decena y unidad 
         add ax, 3030h ;ajustar parte alta y baja para representarlos en ascii
         mov bx,ax
         
         mov ah,02h
          mov dl,bh
         int 21h
         
         mov dl,bl
         int 21h 
         
         mov ah,09h 
         mov dx,offset msg1
         int 21h
         mov ah,02h
         mov dl, cadena2[di]
         int 21h
         
         inc di
         mov si,0
         
         
         cmp cadena2[di],'$'
         je cerrar
  
      
      



cerrar:
mov ah, 4Ch
int 21h


end