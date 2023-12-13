.model small 
.stack 
.data 

cadena db "hola bienvenidos a assembler",24h 

.code
mov ax,@data ;muevo segmeto de datos para reconocer variables 
mov ds,ax    ; mando a data segment lo que tiene cargado en ax 
mov si, 0    ; inicializo con 0 mi indice para manipular cadena 
mov cx,0     ; inicializo en 0 mi contador para trabajar con mi loop 


recorrer:   

mov al,cadena[si] ;posicion actual de si de la cadena se lo pasa a al 
inc si ;incremento si mas uno 
cmp al,24h
je pila ;digo aca que si mi posicion es igual al final de cadena que ya pase al proceso de pila 
push ax ;sino sigo metiendo datos a la pila 
inc cx  ; sino se incrementa mi contador para trabajar loops  
jne recorrer ; sino pues vuelve a repetirse el proceso de recorrer cadena 


pila:
  pop ax  ; ultimo en entrar primero en salir 
  mov ah,02 ; funcion para imprimir solamente un caracter 
  mov dl,al ; ahora le mando lo que saque en pila a  dl  
  int 21h   ; hago mi debida interrupcion 
loop pila    ; le digo que sea un loop y se repita la cantidad de caracteres que llego a obtener en la pila sin contar el final de cadena 
hlt         ; cuando termine de hacer el proceso pues se detiene el programa como un halt 

   
.exit    
