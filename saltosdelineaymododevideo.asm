.model small   
.stack
.data
   var1 db 15
   var2 db 15
   cadena db "a beza el gusta pito$"
   
.code
    
    mov ax,@data
    mov ds,ax
    
    mov bh, var1
    mov bl,var2
    
    cmp bh,bl 
    je funcion1
    jne funcion2 
    
    
    
    
    funcion1:
        
        mov al,1 
        mov ah, 01h
         
        int 21h
         
         
        mov var1,al
        
        mov ah,09h 
        mov dx, offset var1
        int 21h 
        
    
         
    funcion2:
    
        mov ah,1

end