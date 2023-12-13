.model small 
.stack 
.data 
cadena1 db "hola bienvenidos a assembler",24h ; variable de cadena
cadena2 db "aeiou",24h
msg1 db "letras: ",24h 
msg2 db "encontradas",24h
finalizacion db "analisis terminado!",24h
acumulador db 0  

.code 

  mov ax,@data
  mov ds,ax 
  
  mov si,0
  mov di,0
   
  
  busqueda:
     mov al, cadena1[si]
     mov bl, cadena2[di]
     cmp al,bl
     je contador 
     cmp al,'$'
     je puntero
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
          
         jne busqueda
   
   cerrar:
      
    ;este bloque es para el salto de linea  
    mov ah, 0eh
    mov al,10
    int 10h
    
    ; este es para evitar la tabulacion y que el texto aparezca pegado al borde 
    mov ah,0eh
    mov al,13
    int 10h 
     
    mov ah,09h
    mov dx, offset finalizacion  
    int 21h
    
    mov ah,4ch
    mov al,0
    int 20h
.exit 