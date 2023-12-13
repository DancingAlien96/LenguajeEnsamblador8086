.model small 
.stack 100h
.data 

cadena1 db "hola",24h
cadena2 db "A",24h


.code 
  mov ax,@data
  mov ds,ax 
  mov si,0
  mov di,0
  
  recorrer:
     mov al,cadena1[si]
     cmp al,'$'
     je agregar
     inc si 
     jne recorrer
     
     agregar:
          mov bl,cadena2[di]
          mov cadena1[si],bl
          cmp bl,'$'
          je cierre
          inc si 
          inc di 
          jne agregar
          
          
           

cierre:
 mov ah,09h
 mov dx,offset cadena1
 int 21h 
 hlt  

.exit 