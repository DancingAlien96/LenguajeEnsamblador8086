.model smsall 
.stack 
.data 

cadena db "hola",24h


.code
   mov ax,@data 
   mov ds, ax 
   
recorrercadena:
     mov al, cadena[si]
     
     cmp al, 'a'
     je codificarA   
     cmp al, 'e'
     je codificarE
     cmp al, 'i'
     je codificarI
     cmp al, 'o'
     je codificarO
     cmp al,'u'
     je codificarU
     inc si
     cmp al, '$'
     je cerrar   
     jne recorrercadena

    codificarA:
        mov cadena[si],4 
        inc si 
        jmp recorrercadena 
      
    codificarE:
        mov cadena[si],3 
        inc si 
        jmp recorrercadena 
       
    codificarI:
        mov cadena[si],1 
        inc si 
        jmp recorrercadena 
    
    codificarO:
        mov cadena[si],0 
        inc si 
        jmp recorrercadena 
    
    codificarU:
        mov cadena[si],6 
        inc si 
        jmp recorrercadena 
   
   
  cerrar:
   mov ah,09h
   mov dx,offset cadena 
   int 21h
   
   
    
.exit  