.model small 
.stack 
.data 
cadena1 db "hola bienvenidos a assembler",24h ; variable de cadena principal 
cadena2 db "aeiou",24h ; variable de la cadena que se quiere buscar letra por letra 
msg1 db "letras: ",24h  ; mensaje utilizado para mostrar en pantalla mas estetico 
msg2 db "encontradas",24h  ; mensaje tambien utilizado para mostrar en pantalla y tenga sentido 
finalizacion db "analisis terminado!",24h  ;mensaje de que todo ha salido bien en el programa 
acumulador db 0  

.code 

  mov ax,@data ; inicializo segmento de datos 
  mov ds,ax    ; mando data segmento lo que tengo de variables 
  
  mov si,0     ; inicializo indice para mi primera cadena 
  mov di,0     ; inicializo indice para mi segunda cadena 
   
  
  busqueda:
     mov al, cadena1[si] ; mando primer caracter de mi cadena principal a al 
     mov bl, cadena2[di]  ; mando mi primer caracter de mi segunda cadena 
     cmp al,bl   ; empieza a comparar el primer caracter de mi segunda cadena con todos los caracter de la cadena prinicipal 
     je contador ; si en el caso el caracter que tengo apuntado en la segunda cadena con la cadena principal son iguales pues se va a contador
     cmp al,'$'  ; si ya termine de comparar toda mi cadena principal 
     je puntero  ; entonces se va al proceso de puntero 
     inc si      ; si ninguna de ambas comparaciones me da true pues sigue el ciclo de busqueda para encontrar similitudes 
     jne busqueda        

  contador:
     inc acumulador ; este proceso tiene la tarea de contar cuantas letras son iguales  
     inc si    ; incremento mi indice de primera cadena o cadena principal 
     jmp busqueda  ; ahora ya que conte cuantas similitudes hay pues salto al proceso de busqueda de similitudes 

  puntero: 
        ; el proceso tiene como tarea mover el apuntar de la segunda cadena y tambien imprimir cuantas letras conto por cada una 
        
        ;este bloque es para el salto de linea  
        mov ah, 0eh
        mov al,10
        int 10h
    
       ; este es para evitar la tabulacion y que el texto aparezca pegado al borde 
       mov ah,0eh
       mov al,13
       int 10h 
    
         mov al,acumulador ; este proceso es cuando el acumulador ya conto cuantas letras hay de cada una 
         mov acumulador,0  ; lo reseteo por cada vuelta 
         
         
         mov dx, 0  ; ahora aca empiezo a hacer un ajuste especial por si acaso el numero excede de una cifra 
         mov ah,0  ; en este caso pueden haber un maximo de  99 caracteres unicamente
         aam ;ajuste en decena y unidad 
         add ax, 3030h ;ajustar parte alta y baja para representarlos en ascii
         mov bx,ax ; necesariamente los paso a  bx los numeros ya convertidos a ascii 
         
         mov ah,02h ; esta es la funcion para imprimir caracter por caracter 
          mov dl,bh ; decena 
         int 21h   ; interrupcion para pantalla 
         
         mov dl,bl ; reutilizo la funcion de impresion caracter por caracter 
         int 21h   ; interrupcio para mostrar unidades 
         
         mov ah,09h         ; mensaje extra para ser mas estetico 
         mov dx,offset msg1
         int 21h
         mov ah,02h
         mov dl, cadena2[di]
         int 21h
         
         inc di          ; incremento la posicion de mi segunda cadena para nuevamente analizar cadena 
         mov si,0        ; reseteo si 
         
         
         cmp cadena2[di],'$' ; digo entonces si mi segunda cadena ya termino pues me tiro a terminar procesos  
         je cerrar
          
         jne busqueda
   
   cerrar:
      
    ;este bloque es para el salto de linea  
    mov ah, 0eh
    mov al,10
    int 10h
    
    ; este es para evitar la tabulacion y que el texto aparezca pegado al borde 
    mov ah,0eh
    mov al,13
    int 10h 
     
    mov ah,09h
    mov dx, offset finalizacion  
    int 21h
    
    mov ah,4ch
    mov al,0
    int 20h
.exit