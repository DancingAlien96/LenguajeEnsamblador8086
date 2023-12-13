.model small
.stack 100h
.data
mode db "hola ",24h
limite dw 04H
contador db 0
posicionx dw 10h
posiciony dw 00h
reloj dw 0

.code
    

programa proc
    mov ax, @data       
    mov ds, ax          

    mov ah,00h 
    mov al,13h
    int 10h    
    
    
    call inicio     
    
programa endp     



verificacion proc near 
    mov ah,00h
    int 16h
    jmp teclas 
    
    abajo2:
    call abajo
    jmp verificacion 
    
    
    arriba2:
    call arriba
    jmp verificacion 
    
    derecha2:
    call derecha
    jmp verificacion 

    izquierda2:
      call izquierda 
      jmp verificacion     
 
 
    
    teclas:
     cmp ah,4dh
     jz derecha2  
   
     cmp ah,48h
     jz arriba2 
    
     cmp ah,50h
     jz abajo2
      
     cmp ah,4bh
     jz izquierda2
   
 verificacion endp     
    
     
     
     derecha proc near
      
      call reseteo 
      
      mov ah,00h 
      mov al,13h
      int 10h    
     
      add posicionx,07h 
      mov cx,posicionx                  
      mov dx ,posiciony                
      
         
        ciclo2:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh ,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,limite
            jng ciclo2
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,limite
            jng ciclo2 
         
            ret 
       derecha endp  
         
      izquierda proc near
      
      call reseteo 
      
      mov ah,00h 
      mov al,13h
      int 10h    
     
      sub posicionx,07h 
      mov cx,posicionx                  
      mov dx ,posiciony                
      
         
        ciclo4:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh ,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,limite
            jng ciclo4
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,limite
            jng ciclo4 
         
            ret 
       izquierda endp  
     
      
      abajo proc near
      call reseteo 
      
      mov ah,00h 
      mov al,13h
      int 10h    
     
      add posiciony,07h 
      mov cx,posicionx                  
      mov dx ,posiciony                
      
         
        ciclo3:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh ,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,limite
            jng ciclo3
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,limite
            jng ciclo3 
         
            ret 
       abajo endp  
     
      arriba proc near
      call reseteo 
      
      mov ah,00h 
      mov al,13h
      int 10h    
     
      sub  posiciony,07h 
      mov cx,posicionx                  
      mov dx ,posiciony                
      
         
        ciclo5:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh ,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,limite
            jng ciclo5
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,limite
            jng ciclo5 
         
            ret 
       arriba endp  
     
      
      
     
      inicio proc
      
      mov cx,posicionx                  
      mov dx ,posiciony                
      
         
        ciclo:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh ,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,limite
            jng ciclo
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,limite
            jng ciclo 
          
         ret 
     
     inicio endp 
    
     
     
     reseteo proc near               
    
            
           MOV AH,00h                   
            MOV AL,13h                  
            INT 10h                       
        
            MOV AH,0Bh                   
            MOV BH,00h                   
            MOV BL,00h                   
            INT 10h                    
            
            RET  
     reseteo endp 
     
     
     

     ;iran procedimientos dentro de el procedimiento principal que es programa 
     end programa ;este end tiene que ir si o si para determinar en fin del programa por muy raro que se lea 
 
