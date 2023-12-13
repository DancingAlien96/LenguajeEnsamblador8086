.model small 
.stack 100h 
.data 

array db 10 dup(0)


.code 
mov ax,@data 
mov ds,ax 


mov cx,0
mov si,0


ingresar:
mov array[si],5
 
cmp cx,10
je cerrar 
inc si
inc cx  
jne ingresar 


 cerrar:
   hlt 



.exit 