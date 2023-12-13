.model small
.stack 

.data 

cadena1 db 10 dup(""),'$'




.code 


    mov ax,@data 
    mov ds,ax 
    
    
    
    
    mov si,0
    
    
    caracteres:
    mov ah, 01h  ; solicitar un numero al usario con el 01 pero en este caso sera la primera cifra o sea la decena   
    int 21h
    cmp al,13
    je ingresarcadena
    jne caracteres
    
    
    
    
    ingresarcadena:
       
        
    
    
    
    
     
    
    

 
 
 
 
 
.exit 