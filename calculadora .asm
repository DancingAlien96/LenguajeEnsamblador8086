.model small
.stack 
.data

;se determina que solo podria ser de dos cifras ya que el procesador 8086 solo funciona hasta 16 bits 
mensaje1 db "ingresa primer numero"
cifra1  db 0 ; para ingresar el primer numero 
cifra2 db 0  ;


.code 
   
   
    mov ax,@data
    mov ds,ax 
    
    
    
    
    
    
end