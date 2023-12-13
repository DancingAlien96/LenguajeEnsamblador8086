.model small
.stack
.data
unidad db 0
decena db 0
centena db 0
.code

mov ax, @data
mov ds, ax

mov ax,99

aam 

 

mov unidad, al
mov al, 0
mov al, ah
mov ah, 0
aam
mov decena, al
mov centena, ah

add centena, 30h
add decena, 30h
add unidad, 30h

mov ah,02h
mov dl,centena 
int 21h 

mov dl,decena 
int 21h 

mov dl,unidad 
int 21h 





mov ah, 4Ch   ; Termina el programa
int 21h

.exit
