.model small 
.stack 
.data 

cadena db "hola bienvenidos a assembler",24h 

.code
mov ax,@data
mov ds,ax  
mov si, 0
mov cx,0


recorrer:   

mov al,cadena[si]
inc si
cmp al,24h
je pila
push ax
inc cx   
jne recorrer


pila:
  pop ax
  mov ah,02
  mov dl,al 
  int 21h
loop pila
hlt  

   
.exit    



  