.model small
.stack 100h
.data
mode db "hola ",24h
blank db "herber",24h
limite DW 04H
contador db 0
posicionx dw 10h
posiciony dw 00h
reloj dw 0

.code
    

main proc
    mov ax, @data       
    mov ds, ax          

    
        
        mov ah, 00H
        int 1ah 
        add dx,50d
        mov reloj, dx
        
        
        mov ah,09h 
        mov dx,offset mode 
        int 21h  
        
        
        mov ah, 00H
        int 1ah 
        add dx,50d
        mov reloj, dx
        
        mov dx,00h 
        
        mov ah,09h 
        mov dx,offset blank
        int 21h  
        
        
        
main endp    
    imprimir proc 
     imprimir endp 
    
    mov ah, 4Ch         
    int 21h             
end main
