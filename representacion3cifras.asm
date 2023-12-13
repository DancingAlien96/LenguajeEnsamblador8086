.model small 
.stack 
.data 
cadena db "ingrese numero",24h 
cadena2 db "numero ingresado",24h
unidad  db 0  
decena db 0
.code 
 
 mov ax,@data
 mov ds,ax 
 
  
 mov ah,09h 
 mov dx, offset cadena 
 int 21h
  
 mov ah,01h
 int 21h 
 sub al,30h
 
 
 
 mov decena,al   
 
 
 mov ah,01h
 int 21h 
 
 sub al,30h
 
 mov unidad,al
 
 mov al, decena 
 mov bl,10
 mul bl 
 add al,unidad 
 
 

 
 mov ah,0
 aam ;ajuste en decena y unidad 
 add ax, 3030h ;ajustar parte alta y baja para representarlos en ascii
 mov bx,ax
 mov ah,02h
 mov dl,bh
 int 21h
 mov dl,bl
 int 21h
         
mov ah, 0eh
    mov al,10
    int 10h
    
         
         
      
          
         
 
 
 
 
 
  
    
  
 
 
 
 
 
 
 
 
 
 



.exit 