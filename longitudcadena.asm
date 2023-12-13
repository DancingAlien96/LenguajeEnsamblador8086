.model small 
.stack 
.data 
 
 cadena db "a enqeqwqwq222shshshshshshshs5656565656",24h 
 cadena2 db "su cadena tiene un largo de:",24h
 contador db 0
 ca db "caracteres",24h

.code 

 mov ax,@data
 mov ds, ax 
 
 mov cx, 0
 mov ax,0
 mov si, 0
 
 contar:
    
    mov ah,cadena[si]
    inc si 
    inc contador 
    cmp ah,'$'  
    
    je imprimir:
    jne contar      
         
     imprimir:
         
         dec contador
         
         mov ah,09h
         mov dx, offset cadena2 
         int 21h
         
         mov al, contador
         mov ah,0
         aam ;ajuste en decena y unidad 
         add ax, 3030h ;ajustar parte alta y baja para representarlos en ascii
         mov bx,ax
         
         mov ah,02h
         mov dl,bh
         int 21h
         
         mov dl,bl
         int 21h
         
         mov ah,09
         mov dx,offset ca
         int 21h
         
         jmp cierre 
             
         
         
    cierre:
    
    mov ah, 4Ch
    int 21h   












.exit 