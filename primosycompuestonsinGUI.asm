.model small
.stack 100h
.data



numero db 7
primo db "este numero es primo",24h
compuesto db "este numero es compuesto",24h 


.code 
      
      mov ax,@data
      mov ds,ax 
      
verificacion:
    mov al, numero
    cmp al,0
    jg divisiblepor2 ;si es mayor que cero ese numero ingresado entonces si podes pasar a operar  
     
    
    divisiblepor2:
     mov ah,0
     mov bl,2
     cmp al,bl  
     je numeroprimo
     div bl
     
     cmp ah,00
     
     je numerocompuesto
     jne divisiblepor3
     
     divisiblepor3:
      
      mov ah,0
      mov al,numero
      mov bl,3
      cmp al,bl  
     je numeroprimo
     
      div bl 
      cmp ah,00
      je numerocompuesto 
      jne divisiblepor5  
    
     divisiblepor5:
      
      mov ah,0
      mov al,numero
      mov bl,5
      cmp al,bl
      je numeroprimo
     
      div bl 
      cmp ah,00
      je numerocompuesto 
      jne divisiblepor7
      
     divisiblepor7:
      
      mov ah,0
      mov al,numero
      mov bl,7
      cmp al,bl
      je numeroprimo
     
      div bl 
      cmp ah,00
      je numerocompuesto 
      jne numeroprimo   
    
     numerocompuesto:
     mov ah, 0eh
     mov al,10
     int 10h
     mov ah,0eh
     mov al,13
     int 10h 
     mov ah, 09h 
     mov dx, offset compuesto
     int 21h
     jmp cierre
        
     numeroprimo:
        mov ah, 0eh
        mov al,10
        int 10h
        mov ah,0eh
        mov al,13
        int 10h 
        mov ah,09h
        mov dx, offset primo 
        int 21h
        
           
        
    cierre:
    
    mov ah, 4Ch
    int 21h






.exit  