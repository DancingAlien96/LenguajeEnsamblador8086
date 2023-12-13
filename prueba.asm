DATOS SEGMENT
    TEXTO DB 'EJEMPLO DE USO DE CONSTANTES ','$'
 
DATOS ENDS
 
PILA SEGMENT STACK
    DB 64 DUP('PILA')
PILA ENDS
 
CODIGO SEGMENT
    ASSUME CS:CODIGO,DS:DATOS,SS:PILA
    INICIO: MOV AX,DATOS
            MOV DS,AX
            
            mov ah,09h
            MOV DX,OFFSET TEXTO
            iNT 21H
            
            
            
            
    END INICIO       
CODIGO ENDS
    