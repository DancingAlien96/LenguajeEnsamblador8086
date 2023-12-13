.model small
.stack
.data
 
 
   a db 255
   b db 10
   mensaje1 db "es mayor",24h
   mensaje2 db "es menor",24h
   mensaje3 db "es mayor o igual",24h
   mensaje4 db "es menor o igual",24h
   mensaje5 db "esto ya es mayor que 1byte",24h
.code

   mov ax,@data
   mov ds, ax
   
   
   
   mov al,a
   mov ah,b 
   
   
   ;cmp al,ah
   ;jae esmayoroigual  
   ;ja esmayor
   ;jb esmenor
   ;jbe esmenoroigual
   
  
   add al,ah  
   jc desbordamiento 
   
   
   
   esmayor:
   
     mov ah,09h
     mov dx,offset mensaje1
     int 21h 
     ret 
     
     
   esmenor:
      
       
     mov ah,09h
     mov dx,offset mensaje2
     int 21h 
     ret 


   esmayoroigual:
   
     mov ah,09h
     mov dx,offset mensaje3
     int 21h 
     ret 

   esmenoroigual:
   
     mov ah,09h
     mov dx,offset mensaje4
     int 21h 
     ret 


   desbordamiento:
      
     mov ah,09h
     mov dx,offset mensaje5
     int 21h 
     ret 
   
   
   
   
   
end