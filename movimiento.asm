.model small 
.stack 100h 
.data 

 posx dw 0
 posy dw 0
 actualx dw 0
 actualy dw 0
 reloj dw 0
 tempo db 0 
 
.code 
 mov ax,@data 
 mov ds,ax 
 
 mov ah,00h
 mov al,13h
 int 10h 

jmp Pordefecto 
 




 
  
 reseteo proc far  
 mov posx,00h
 mov posy,00h
 mov actualx,00h
 mov actualy,00h
 reseteo endp 
 
 
 reseteoarriba proc near 
 mov actualx,cx 
 mov actualy,199d
 jmp arriba  
reseteoarriba endp 


 reseteoabajo proc near
 mov actualx,cx 
 mov posy,00 
 jmp abajo  
reseteoabajo endp 
 
 reseteoderecha proc near
 mov actualx,00 
 mov actualy,dx  
 jmp derecha  
reseteoderecha endp 
 
reseteoizquierda proc near
 mov actualx,319d 
 mov actualy,dx  
 jmp izquierda  
reseteoizquierda endp 
  
     
Pordefecto proc near
                                    
 mov ah,0ch
 mov bh,00h
 mov al,0fh
 mov cx,posx 
 mov dx,posy 
 int 10h 
 cmp posx,320d 
 je cerrar
 mov dx,posx 
 mov actualx,dx
 jmp borrarrastro
 jne Pordefecto
 
 
 borrarrastro:
 mov ah,0ch
 mov bh,00h
 mov al,00h
 mov cx,actualx  
 mov dx,posy  
 int 10h
 add posx,01h
 jmp verificar   
Pordefecto endp  
 
 
  verificar proc near
     
   mov ah,01h
   int 16h
     
   jz Pordefecto
   jnz teclas    
   
   
   teclas:
   cmp ah,4dh
   je lmpbderecha 
   
   
   
   
   cmp ah,48h
   je lmpbarriba
    
   cmp ah,50h
   je limpiarbufferabajo
      
   cmp ah,4bh
   je lmpbizquierda
   verificar endp 
  

 abajo:
 
          
 mov ah,0ch
 mov bh,00h
 mov al,0fh
 mov cx,actualx  
 mov dx,posy 
 int 10h 
 cmp posy,200d 
 je reseteoabajo
 mov bx,posy 
 mov actualy,bx
 jmp borrarrastroarriba
 
 
 
 borrarrastroarriba:
 mov ah,0ch
 mov bh,00h
 mov al,00h
 mov cx,actualx  
 mov dx,actualy 
 int 10h
 add posy,01h
 jmp sigueabajo 
 
 
     
 sigueabajo:
  mov ah,01h 
  int 16h
  jz abajo  
  jnz teclas 

 
 limpiarbufferabajo:
   mov ah,00h
   int 16h
   jmp abajo 
     
  
    
 arriba: 
 mov ah,0ch
 mov bh,00h
 mov al,0fh
 mov cx,actualx  
 mov dx,actualy 
 int 10h 
 cmp actualy,0 
 je reseteoarriba  
 jmp borrarrastroabajo
  
 
borrarrastroabajo:
 mov ah,0ch
 mov bh,00h
 mov al,00h
 mov cx,actualx  
 mov dx,actualy 
 int 10h
 sub actualy,01h
 jmp siguearriba    
  
 siguearriba:
 mov ah,01h 
 int 16h
 jz arriba   
 jnz teclas 

lmpbarriba:
   mov ah,00h
   int 16h
   jmp arriba  
 
 
derecha: 
 mov ah,0ch
 mov bh,00h
 mov al,0fh
 mov cx,actualx  
 mov dx,actualy 
 int 10h 
 cmp actualx,320d 
 je reseteoderecha 
 jmp borrarrastroizquierda 
   
 
 
 borrarrastroizquierda:
 mov ah,0ch
 mov bh,00h
 mov al,00h
 mov cx,actualx  
 mov dx,actualy 
 int 10h
 add actualx,01h
 jmp siguederecha    
 
siguederecha:
 mov ah,01h 
 int 16h
 jz derecha   
 jnz teclas

lmpbderecha:
mov ah,00h
int 16h
jmp derecha  
 

 izquierda: 
 mov ah,0ch
 mov bh,00h
 mov al,0fh
 mov cx,actualx  
 mov dx,actualy 
 int 10h 
 cmp actualx,0 
 je reseteoizquierda 
 jmp borrarizquierda 
   
 
 
borrarizquierda:
 mov ah,0ch
 mov bh,00h
 mov al,00h
 mov cx,actualx  
 mov dx,actualy 
 int 10h
 sub actualx,01h
 jmp sigueizquierda     
 
sigueizquierda:
 mov ah,01h 
 int 16h
 jz izquierda   
 jnz teclas

lmpbizquierda:
mov ah,00h
int 16h
jmp izquierda 
 
 cerrar:
hlt 

.exit 