stack segment
    dw 128 dup(0) ; Define el segmento de pila
stack ends

data segment
    mode db "hola ", 24h
    limite DW 04H
    contador db 0
    posicionx dw 10h
    posiciony dw 00h
    reloj dw 0
data ends

code segment
main proc
    assume cs:code, ss:stack, ds:data
    PUSH DS                              
	SUB AX,AX                            
	PUSH AX                              
	MOV AX,DATA                          
	MOV DS,AX                            
	POP AX                               
	POP AX                               
    mov ah, 0
    mov al, 13h
    int 10h

tiempo:
    ; Coloca aquí el fragmento de código anterior
    mov ah, 00
    int 1ah

    cmp dx, reloj
    jbe tiempo

    add dx, 09h
    mov reloj, dx

    mov ax, 05h
    mov bx, 05h
    add posicionx, ax
    add posiciony, bx
    call dibujarpelota
    jmp tiempo

    ret
main endp

dibujarpelota PROC
    mov cx, posicionx
    mov dx, posiciony

ciclo:
    mov ah, 0ch
    mov al, 0Eh
    xor bh, bh ; Limpia bh antes de usarlo
    int 10h

    inc cx
    mov ax, cx
    sub ax, posicionx
    cmp ax, limite
    jng ciclo

    mov cx, posicionx
    inc dx

    mov ax, dx
    sub ax, posiciony
    cmp ax, limite
    jng ciclo

    RET
dibujarpelota ENDP

code ends
