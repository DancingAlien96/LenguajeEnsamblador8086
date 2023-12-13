.model small 
.stack
.data
cadena1 db "hola mundo",'$'
cadena2 db "hn",'$'
errorca db "no se ha encontrado la subcadena: ",24h 
errorca2 db "en la cadena: ",24h 

proceso db "terminando verificacion...",24h
aceptacion db "subcadena encontrada",24h
                                        
.code

    mov ax,@data
    mov ds,ax  
    mov si,0
    mov cx,0
                              
    busqueda:
    mov al,cadena1[si]
    mov bl, cadena2[di]
    cmp al,bl
    je subcadena
    inc si 
    cmp al,'$'
    je  error
    inc cx  
    jne busqueda 
    
    
    
    
         subcadena:
         mov ah, 0eh
         mov al,10
         int 10h
    
         ; este es para evitar la tabulacion y que el texto aparezca pegado al borde 
         mov ah,0eh
         mov al,13
         int 10h
         
         mov ah,09h
         mov dx, offset proceso  
         int 21h 
            
         inc di 
         inc si
         mov al, cadena1[si]
         mov bl, cadena2[di]
         cmp al,bl 
         je subcadena
         cmp bl,'$'
         je encontrada  
         jne error
         
     encontrada:
        mov ah, 0eh
        mov al,10
        int 10h
    
        ; este es para evitar la tabulacion y que el texto aparezca pegado al borde 
        mov ah,0eh
        mov al,13
        int 10h 
        
         mov ah,09h 
         mov dx, offset aceptacion
         int 21h
         hlt     
          
     error: 
         mov ah, 0eh
         mov al,10
         int 10h
    
    ; este es para evitar la tabulacion y que el texto aparezca pegado al borde 
        mov ah,0eh
        mov al,13
        int 10h
         
         mov ah,09h
         mov dx, offset errorca
         int 21h       
         
         mov ah,09h
         mov dx, offset cadena2 
         int 21h 
         
         mov ah, 0eh
         mov al,10
         int 10h
    
    ; este es para evitar la tabulacion y que el texto aparezca pegado al borde 
        mov ah,0eh
        mov al,13
        int 10h
               
        mov ah,09h 
        mov dx,offset errorca2
        int 21h   
        
        mov ah,09h
        mov dx, offset cadena1
        int 21h  
         
.exit  