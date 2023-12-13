.model small 
.stack

.data 

 cadena1 db "ab",'$'  
 cadena2 db "abc",'$'
 igualdad db "caracteres iguales",24h
 diferencia db "son cadenas distintas!",24h
 determinar db "son cadenas iguales",24h 

.code 

    mov ax,@data
    mov ds, ax 
    
    
    
    
   verificar:
    
     
    mov ah,0
    mov bh,0 
    
    mov ah,cadena1[si]
    mov bh, cadena2[si]
    
   
    cmp ah,bh
  
    je iguales
       
    jne diferentes
    
    


    iguales:
       
       mov ah, 0eh
       mov al,10
       int 10h
       mov ah,0eh
       mov al,13
       int 10h 
    
       mov ah,09h
       mov dx, offset igualdad
       int 21h
        
       cmp cadena1[si],'$'
       je determinacion
       inc si  
       jne verificar
       
       
       
    determinacion:
       mov ah, 0eh
       mov al,10
       int 10h
       mov ah,0eh
       mov al,13
       int 10h 
    
       mov ah,09h
       mov dx, offset determinar
       int 21h   
        
       
    diferentes:
       mov ah, 0eh
       mov al,10
       int 10h
       mov ah,0eh
       mov al,13
       int 10h 
    
       mov ah,09h
       mov dx, offset diferencia 
       int 21h
       hlt 

.exit