.model small
.stack 100h
.data

limite dw 08H
posicionx dw 00h
posiciony dw 00h
posicionx2 dw 00h
posiciony2 dw 00h
reloj dw 0
salto dw 09h  
contador dw 0

.code
    

programa proc
    mov ax, @data       
    mov ds, ax          

    mov ah,00h 
    mov al,13h
    int 10h    
    
     
    
    call mapa
    
    call trofeo 
    call inicio
    
    
programa endp     



verificacion proc near 
    
    ;mov ah,00h
    ;int 16h
    ;jmp teclas 
    
    
    
    ;derecha2:
    ;call derecha 
    ;jmp verificacion 
    
    ;abajo2:
    ;call abajo
    ;jmp verificacion 
    
    
    ;arriba2:
    ;call arriba
    ;jmp verificacion 
    
    ;izquierda2:
    ;call izquierda 
    ;jmp verificacion      
     
    ;teclas:   
    ;cmp ah,48h
    ;jz arriba2 
     
    ;cmp ah,4dh
    ;jz derecha2 
     
    ;cmp ah,50h
    ;jz abajo2
      
    ;cmp ah,4bh
    ;jz izquierda2

 
   call tramouno
   call tramodos
   call tramotres
   call tramocuatro
   call tramocinco
   call tramoseis  
   call tramosiete
   call tramo_ocho
   jmp decisionuno 
   
   decisionuno:
    mov ah,00h 
    int 16h 
    cmp ah,4dh
    jz tramoe1
    cmp ah,4bh 
    jz tramo9
    jnz decisionuno
    
    
    
    tramoe1:
    call tramoequis1
    jmp decisionuno 
  
    tramo9:
    call tramonueve
    jmp decision2
   
  decision2:
    mov ah,00h 
    int 16h 
    cmp ah,50h
    jz tramoe2
    cmp ah,4bh 
    jz tramo10
    jnz decision2
    
      
    tramoe2:
    call tramoequis2
    jmp decision2 
  
    tramo10:
    call tramodiez
    
    call tramo_once
    
   
    decision3:
    mov ah,00h 
    int 16h 
    cmp ah,50h
    jz tramoe3
    cmp ah,4dh 
    jz tramo12
    jnz decision3
    
      
    tramoe3:
    call tramoequis3
    jmp decision3 
  
    tramo12:
    call tramodoce 
    
    call tramotrece 
    call tramocatorce
    call tramoquince
    call tramodieciseis 
    
    
    decision4:
    mov ah,00h 
    int 16h 
    cmp ah,4dh
    jz tramoe4
    cmp ah,48h 
    jz tramo13
    jnz decision4
    
      
    tramoe4:
    call tramoequis4
    jmp decision4 
  
    tramo13:
    call tramodieciocho 
    
    call tramodiecinueve
    call tramoveinte 
    call tramoveintiuno 
    call tramoveintidos
    call tramoveintitres 
    
    decision5:
    mov ah,00h 
    int 16h 
    cmp ah,4dh
    jz tramoe5
    cmp ah,50h 
    jz tramo14
    jnz decision5
    
      
    tramoe5:
    call tramoequis5
    jmp decision5 
  
    tramo14:
    call tramoveinticuatro 
   
    
    call tramoveinticinco
    call reseteo  
    call inicio2
    call reg1
    call reg2
    call reg3
    call reg4
    call reg5
    call reg6
    call reg7
    call reg8 
 verificacion endp     
    
    
    tramouno proc near 
      tecla:
      mov ah,00h
      int 16h
      jmp t1
    
      
      verificart1:
      inc contador
      cmp contador,9d
      jz t2
      jnz derecha2
    
      derecha2:
      call trofeo
      call derecha
      jmp tecla  
    
     t1:
     cmp ah,4dh
     jz verificart1  
     jnz tecla   
     
     t2:
      call derecha
       
      ret  
     
     
      tramouno endp 
 
      tramodos proc near
      mov contador,00h  
      tecla2:
      mov ah,00h
      int 16h
      jmp tdos
    
       
    
      verificart2:
      inc contador
      cmp contador,3d
      jz t3
      jnz abajo2
    
      abajo2:
     
      call abajo
      jmp tecla2  
    
      tdos:
      cmp ah,50h
      jz verificart2
      jnz tecla2  
           
       t3:
       call abajo 
       ret 
      
      tramodos endp 
 
      tramotres proc near 
      
      
      mov contador,00h  
      tecla3:
      mov ah,00h
      int 16h
      jmp ttres 
    
       
    
      verificart3:
      inc contador
      cmp contador,8d
      jz t4
      jnz izquierda2
    
      izquierda2:
     
      call izquierda 
      jmp tecla3  
    
      ttres:
      cmp ah,4bh
      jz verificart3
      jnz tecla3  
           
      t4:
      call izquierda  
       ret 
      
      
      tramotres endp
     
     
      tramocuatro proc near
      
      mov contador,00h  
      tecla4:
      mov ah,00h
      int 16h
      jmp tcuatro 
    
       
    
      verificart4:
      inc contador
      cmp contador,3d
      jz t5
      jnz abajot4
    
      abajot4:
     
      call abajo 
      jmp tecla4  
    
      tcuatro:
      cmp ah,50h
      jz verificart4
      jnz tecla4  
           
      t5:
      call abajo   
      ret 
      
       
      
      tramocuatro endp
     
     
     
      tramocinco proc near 
      mov contador,00h  
      tecla5:
      mov ah,00h
      int 16h
      jmp tcinco  
    
       
    
      verificart5:
      inc contador
      cmp contador,11d
      jz t6
      jnz derechat5
    
      derechat5:
     
      call derecha 
      jmp tecla5  
    
      tcinco:
      cmp ah,4dh
      jz verificart5
      jnz tecla5  
           
      t6:
      call derecha   
      ret 
      
       
      tramocinco endp  
      
      
      
      tramoseis proc near 
      mov contador,00h  
      tecla6:
      mov ah,00h
      int 16h
      jmp tseis  
    
       
    
      verificart6:
      inc contador
      cmp contador,6d
      jz t7
      jnz arribat6
    
      arribat6:
     
      call arriba 
      jmp tecla6  
    
      tseis:
      cmp ah,48h
      jz verificart6
      jnz tecla6  
           
      t7:
      call arriba   
      ret 
      
      
      tramoseis endp 
      
       
      tramosiete proc near 
      mov contador,00h  
      tecla7:
      mov ah,00h
      int 16h
      jmp tsiete  
    
       
    
      verificart7:
      inc contador
      cmp contador,3d
      jz t8
      jnz derechat7
    
      derechat7:
     
      call derecha  
      jmp tecla7  
    
      tsiete:
      cmp ah,4dh
      jz verificart7
      jnz tecla7  
           
      t8:
      call derecha   
      ret 
      
    
    
      tramosiete endp 
    
    
      tramo_ocho proc near 
      mov contador,00h  
      tecla8:
      mov ah,00h
      int 16h
      jmp tocho  
    
       
    
      verificart8:
      inc contador
      cmp contador,8d
      jz decision1
      jnz abajot8
    
      abajot8:
     
      call abajo  
      jmp tecla8  
    
      tocho:
      cmp ah,50h
      jz verificart8
      jnz tecla8  
           
      decision1:
      call abajo   
      ret 
      
         
     tramo_ocho endp
   
     tramoequis1 proc near 
     mov contador,00h  
     tecla9:
      mov ah,00h
      int 16h
      jmp tex1  
    
       
    
      verificart9:
      inc contador
      cmp contador,12d
      jz  terminacion1 
      jnz derechaex1
    
      derechaex1:
     
      call derecha   
      jmp tecla9  
      
      terminacion1:
      call derecha
      mov contador,00h
      jmp tecla10 
      
      
      tex1:
      cmp ah,4dh
      jz verificart9
      jnz tecla9  
           
      
     tecla10:
      mov ah,00h
      int 16h
      jmp tex2  
    
       
    
      verificart10:
      inc contador
      cmp contador,12d
      jz  nuevocamino 
      jnz izquierdaex1
    
      izquierdaex1:
     
      call izquierda  
      jmp tecla10  
    
      tex2:
      cmp ah,4bh
      jz verificart10
      jnz tecla10  
      
            
      nuevocamino:
      call izquierda
      mov contador,00h  
      ret      
     
     tramoequis1 endp 
       
     tramonueve proc near 
      mov contador,00h  
      tecla11:
      mov ah,00h
      int 16h
      jmp tnueve  
    
       
    
      verificart11:
      inc contador
      cmp contador,3d
      jz decisiondos 
      jnz izquierdat9 
    
      izquierdat9:
     
      call izquierda   
      jmp tecla11  
    
      tnueve:
      cmp ah,4bh
      jz verificart11
      jnz tecla11  
           
      decisiondos:
      call izquierda
      mov contador,00h     
      ret 
      
     tramonueve endp 
    
        
    
    
    
     
    tramoequis2 proc near 
      mov contador,00h  
      tecla12:
      mov ah,00h
      int 16h
      jmp tex3  
    
       
    
      verificart12:
      inc contador
      cmp contador,2d
      jz  terminacion2 
      jnz abajoex2
    
      abajoex2:
     
      call abajo   
      jmp tecla12  
      
      terminacion2:
      call abajo
      mov contador,00h
      jmp tecla13 
      
      
      tex3:
      cmp ah,50h
      jz verificart12
      jnz tecla12  
           
      
      tecla13:
      mov ah,00h
      int 16h
      jmp tex4  
    
       
    
      verificart13:
      inc contador
      cmp contador,4d
      jz  terminacion3 
      jnz izquierdaex2
   
      izquierdaex2:
     
      call izquierda  
      jmp tecla13  
    
      tex4:
      cmp ah,4bh
      jz verificart13
      jnz tecla13  
      
      terminacion3:
      call izquierda 
      mov contador,00h
      jmp tecla14 
      
      
      tecla14:
      mov ah,00h
      int 16h
      jmp tex5  
    
       
    
      verificart14:
      inc contador
      cmp contador,4d
      jz  terminacion4 
      jnz derechaex2
   
      derechaex2:
     
      call derecha  
      jmp tecla14  
    
      tex5:
      cmp ah,4dh
      jz verificart14
      jnz tecla14  
      
      terminacion4:
      call derecha 
      mov contador,00h
      jmp tecla15 
      
      
      
      tecla15:
      mov ah,00h
      int 16h
      jmp tex6  
    
       
    
      verificart15:
      inc contador
      cmp contador,4d
      jz  nuevocamino2 
      jnz arribaex1
   
      arribaex1:
     
      call arriba  
      jmp tecla15  
    
      tex6:
      cmp ah,48h
      jz verificart15
      jnz tecla15  
      
      
      nuevocamino2:
      call arriba
      mov contador,00h  
      ret      
     tramoequis2 endp 
     
    
    tramodiez proc near 
      mov contador,00h  
      tecla16:
      mov ah,00h
      int 16h
      jmp tdiez  
    
       
    
      verificart16:
      inc contador
      cmp contador,9d
      jz t10
      jnz izquierdat10
    
      izquierdat10:
     
      call izquierda   
      jmp tecla16  
    
      tdiez:
      cmp ah,4bh
      jz verificart16
      jnz tecla16  
           
      t10:
      call izquierda   
      ret 
      
    tramodiez endp
   
     tramo_once proc near 
      mov contador,00h  
      tecla17:
      mov ah,00h
      int 16h
      jmp tonce  
    
       
    
      verificart17:
      inc contador
      cmp contador,3d
      jz t11
      jnz abajot11
    
      abajot11:
     
      call abajo   
      jmp tecla17  
    
      tonce:
      cmp ah,50h
      jz verificart17
      jnz tecla17  
           
      t11:
      call abajo   
      ret 
      tramo_once endp 
     
      
      
      tramoequis3 proc near 
      
      mov contador,00h  
      teclaekis3:
      mov ah,00h
      int 16h
      jmp tekis3  
       
      tekis3:
      cmp ah,50h
      jz verificaekis3
      jnz teclaekis3  
      
      verificaekis3:
      inc contador
      cmp contador,8d
      jz  termekis3 
      jnz abajoekis3
    
      abajoekis3:
      call abajo   
      jmp teclaekis3  
      
      termekis3:
      call abajo
      mov contador,00h
      jmp teclaekis4 
      
      ;primer bloque 
           
      
      teclaekis4:
      mov ah,00h
      int 16h
      jmp tekis4  
      
      tekis4:
      cmp ah,4dh
      jz verificaekis4
      jnz teclaekis4  
      
     
    
      verificaekis4:
      inc contador
      cmp contador,8d
      jz  terminaekis4 
      jnz derechaekis4
   
      derechaekis4:
     
      call derecha  
      jmp teclaekis4  
    
      
      terminaekis4:
      call derecha 
      mov contador,00h
      jmp teclaekis5 
      
      ;segundo bloque 
      teclaekis5:
      mov ah,00h
      int 16h
      jmp tekis5  
      
      tekis5:
      cmp ah,48h
      jz verificaekis5
      jnz teclaekis5  
      
     
    
      verificaekis5:
      inc contador
      cmp contador,3d
      jz  terminaekis5 
      jnz arribaekis5
   
      arribaekis5:
     
      call arriba  
      jmp teclaekis5  
    
      
      terminaekis5:
      call arriba 
      mov contador,00h
      jmp teclaekis6 
      
      ;tercer bloque 
      
      teclaekis6:
      mov ah,00h
      int 16h
      jmp tekis6  
      
      tekis6:
      cmp ah,4bh
      jz verificaekis6
      jnz teclaekis6  
      
     
    
      verificaekis6:
      inc contador
      cmp contador,5d
      jz  terminaekis6 
      jnz izquierdaekis6
   
      izquierdaekis6:
     
      call izquierda  
      jmp teclaekis6  
    
      
      terminaekis6:
      call izquierda 
      mov contador,00h
      jmp teclaekis7 
      
      ;cuarto bloque
      
      teclaekis7:
      mov ah,00h
      int 16h
      jmp tekis7  
      
      tekis7:
      cmp ah,4dh
      jz verificaekis7
      jnz teclaekis7  
      
     
    
      verificaekis7:
      inc contador
      cmp contador,5d
      jz  terminaekis7 
      jnz derechaekis7
   
      derechaekis7:
     
      call derecha  
      jmp teclaekis7  
    
      
      terminaekis7:
      call derecha  
      mov contador,00h
      jmp teclaekis8 
      
      ;quinto bloque 
      
      teclaekis8:
      mov ah,00h
      int 16h
      jmp tekis8  
      
      tekis8:
      cmp ah,50h
      jz verificaekis8
      jnz teclaekis8  
      
     
    
      verificaekis8:
      inc contador
      cmp contador,3d
      jz  terminaekis8 
      jnz abajoekis8
   
      abajoekis8:
     
      call abajo  
      jmp teclaekis8  
    
      
      terminaekis8:
      call abajo  
      mov contador,00h
      jmp teclaekis9 
      ;sexto bloque 
      
      teclaekis9:
      mov ah,00h
      int 16h
      jmp tekis9  
      
      tekis9:
      cmp ah,4bh
      jz verificaekis9
      jnz teclaekis9  
      
     
    
      verificaekis9:
      inc contador
      cmp contador,8d
      jz  terminaekis9 
      jnz izquierdaekis9
   
      izquierdaekis9:
     
      call izquierda  
      jmp teclaekis9  
    
      
      terminaekis9:
      call izquierda  
      mov contador,00h
      jmp teclaekis10 
      ;septimo bloque 
      
      
      teclaekis10:
      mov ah,00h
      int 16h
      jmp tekis10  
      
      tekis10:
      cmp ah,48h
      jz verificaekis10
      jnz teclaekis10  
      
     
    
      verificaekis10:
      inc contador
      cmp contador,8d
      jz  terminaekis10 
      jnz arribaekis10
   
      arribaekis10:
     
      call arriba  
      jmp teclaekis10  
    
      
      terminaekis10:
      call izquierda  
      mov contador,00h
      ret  
      
      ;octavo bloque 
      
      tramoequis3 endp 
      
      tramodoce proc near 
      mov contador,00h  
      tecla18:
      mov ah,00h
      int 16h
      jmp tdoce  
    
       
    
      verificart18:
      inc contador
      cmp contador,4d
      jz t18
      jnz derechat12
    
      derechat12:
     
      call derecha   
      jmp tecla18  
    
      tdoce:
      cmp ah,4dh
      jz verificart18
      jnz tecla18  
           
      t18:
      call derecha  
      ret
      
      
      tramodoce endp 
      
      tramotrece proc near 
      
      mov contador,00h  
      tecla19:
      mov ah,00h
      int 16h
      jmp tcatorce   
    
       
    
      verificart19:
      inc contador
      cmp contador,2d
      jz t19
      jnz abajot14
    
      abajot14:
     
      call abajo   
      jmp tecla19  
    
      tcatorce:
      cmp ah,50h
      jz verificart19
      jnz tecla19  
           
      t19:
      call abajo  
      ret
      
      
      
      tramotrece endp 
      
      tramocatorce proc near 
      
      mov contador,00h  
      tecla20:
      mov ah,00h
      int 16h
      jmp tquince    
    
       
    
      verificart20:
      inc contador
      cmp contador,7d
      jz t20
      jnz derecha15
    
      derecha15:
     
      call derecha    
      jmp tecla20  
    
      tquince:
      cmp ah,4dh
      jz verificart20
      jnz tecla20  
           
      t20:
      call derecha  
      ret
      
      
      tramocatorce endp 
      
      
      
      tramoquince proc near 
      mov contador,00h  
      tecla21:
      mov ah,00h
      int 16h
      jmp tdieciseis    
    
       
    
      verificart21:
      inc contador
      cmp contador,5d
      jz t21
      jnz abajo16
    
      abajo16:
     
      call abajo    
      jmp tecla21  
    
      tdieciseis:
      cmp ah,50h
      jz verificart21
      jnz tecla21  
           
      t21:
      call abajo  
      ret
      
      
      tramoquince endp 
      
      tramodieciseis proc near 
      mov contador,00h  
      tecla22:
      mov ah,00h
      int 16h
      jmp tdiecisiete    
    
       
    
      verificart22:
      inc contador
      cmp contador,2d
      jz t22
      jnz derecha17
    
      derecha17:
     
      call derecha    
      jmp tecla22  
    
      tdiecisiete:
      cmp ah,4dh
      jz verificart22
      jnz tecla22  
           
      t22:
      call derecha   
      ret
      
      tramodieciseis endp  
      
      tramoequis4 proc near 
      mov contador,00h
      teclaekis23:
      mov ah,00h
      int 16h
      jmp tekis23  
      
      tekis23:
      cmp ah,4dh
      jz verificaekis23
      jnz teclaekis23  
      
     
    
      verificaekis23:
      inc contador
      cmp contador,17d
      jz  terminaekis23 
      jnz derechaekis23
   
      derechaekis23:
     
      call derecha  
      jmp teclaekis23  
    
      
      terminaekis23:
      call derecha  
      mov contador,00h
      jmp teclaekis24 
      ;primer bloque 
      
      
      teclaekis24:
      mov ah,00h
      int 16h
      jmp tekis24  
      
      tekis24:
      cmp ah,4bh
      jz verificaekis24
      jnz teclaekis24  
      
     
    
      verificaekis24:
      inc contador
      cmp contador,17d
      jz  terminaekis24 
      jnz izquierdaekis24
   
      izquierdaekis24:
     
      call izquierda  
      jmp teclaekis24 
    
      
      terminaekis24:
      call izquierda  
      mov contador,00h
      ret  
      tramoequis4 endp 
      
      
      
      tramodieciocho proc near 
      
      
      mov contador,00h  
      tecla25:
      mov ah,00h
      int 16h
      jmp tdieciocho   
    
       
    
      verificart25:
      inc contador
      cmp contador,7d
      jz t25
      jnz arriba18
    
      arriba18:
     
      call arriba    
      jmp tecla25  
    
      tdieciocho:
      cmp ah,48h
      jz verificart25
      jnz tecla25  
           
      t25:
      call arriba   
      ret
      
      tramodieciocho endp 
      
      tramodiecinueve proc near 
      
      mov contador,00h  
      tecla26:
      mov ah,00h
      int 16h
      jmp tdiecinueve   
    
       
    
      verificart26:
      inc contador
      cmp contador,14d
      jz t26
      jnz derecha19
    
      derecha19:
     
      call derecha    
      jmp tecla26  
    
      tdiecinueve:
      cmp ah,4dh
      jz verificart26
      jnz tecla26  
           
      t26:
      call derecha    
      ret
      
      
      
      tramodiecinueve endp 
      
      
      tramoveinte proc near 
      mov contador,00h  
      tecla27:
      mov ah,00h
      int 16h
      jmp tveinte   
    
       
    
      verificart27:
      inc contador
      cmp contador,6d
      jz t27
      jnz arriba20
    
      arriba20:
     
      call arriba    
      jmp tecla27  
    
      tveinte:
      cmp ah,48h
      jz verificart27
      jnz tecla27  
           
      t27:
      call arriba    
      ret
      
      tramoveinte endp 
      
      tramoveintiuno proc near 
      
      mov contador,00h  
      tecla28:
      mov ah,00h
      int 16h
      jmp tveintiuno   
    
       
    
      verificart28:
      inc contador
      cmp contador,12d
      jz t28
      jnz izquierda21
    
      izquierda21:
     
      call izquierda    
      jmp tecla28  
    
      tveintiuno:
      cmp ah,4bh
      jz verificart28
      jnz tecla28  
           
      t28:
      call izquierda    
      ret
      
      
      tramoveintiuno endp 
      
      tramoveintidos proc near 
      mov contador,00h  
      tecla29:
      mov ah,00h
      int 16h
      jmp tveintidos   
    
       
    
      verificart29:
      inc contador
      cmp contador,5d
      jz t29
      jnz arriba22
    
      arriba22:
     
      call arriba    
      jmp tecla29  
    
      tveintidos:
      cmp ah,48h
      jz verificart29
      jnz tecla29  
           
      t29:
      call arriba    
      ret
      
      
      tramoveintidos endp 
      
      tramoveintitres proc near 
      mov contador,00h  
      tecla30:
      mov ah,00h
      int 16h
      jmp tveintitres   
    
       
    
      verificart30:
      inc contador
      cmp contador,2d
      jz t30
      jnz derecha23
    
      derecha23:
     
      call derecha    
      jmp tecla30  
    
      tveintitres:
      cmp ah,4dh
      jz verificart30
      jnz tecla30  
           
      t30:
      call derecha    
      ret
      
      
      tramoveintitres endp 
      
      
      
      
      
      tramoequis5 proc near 
      mov contador,00h
      teclaekis25:
      mov ah,00h
      int 16h
      jmp tekis25  
      
      tekis25:
      cmp ah,4dh
      jz verificaekis25
      jnz teclaekis25  
      
     
    
      verificaekis25:
      inc contador
      cmp contador,13d
      jz  terminaekis25 
      jnz derechaekis25
   
      derechaekis25:
     
      call derecha  
      jmp teclaekis25  
    
      
      terminaekis25:
      call derecha  
      mov contador,00h
      jmp teclaekis26 
      ;primer bloque 
      
      
      teclaekis26:
      mov ah,00h
      int 16h
      jmp tekis26  
      
      tekis26:
      cmp ah,4bh
      jz verificaekis26
      jnz teclaekis26  
      
     
    
      verificaekis26:
      inc contador
      cmp contador,13d
      jz  terminaekis26 
      jnz izquierdaekis26
   
      izquierdaekis26:
     
      call izquierda  
      jmp teclaekis26 
    
      
      terminaekis26:
      call izquierda  
      mov contador,00h
      ret  
      
      
      
      tramoequis5 endp 
      
      
      tramoveinticuatro proc near 
      mov contador,00h  
      tecla31:
      mov ah,00h
      int 16h
      jmp tveinticuatro   
    
       
    
      verificart31:
      inc contador
      cmp contador,3d
      jz t31
      jnz abajo24
    
      abajo24:
     
      call abajo    
      jmp tecla31  
    
      tveinticuatro:
      cmp ah,50h
      jz verificart31
      jnz tecla31  
           
      t31:
      call abajo    
      ret
      
      
      tramoveinticuatro endp
      
      
      tramoveinticinco proc near 
      
      mov contador,00h  
      tecla32:
      mov ah,00h
      int 16h
      jmp tveinticinco    
    
       
    
      verificart32:
      inc contador
      cmp contador,13d
      jz t32
      jnz derecha25
    
      derecha25:
     
      call derecha    
      jmp tecla32  
    
      tveinticinco:
      cmp ah,4dh
      jz verificart32
      jnz tecla32  
           
      t32:
      ;call reseteo  
      call derecha
      ret
      tramoveinticinco endp 
      
      
      ;aca ya empieza los pasos de regreso 
      
      reg1 proc near
      mov contador,00h  
      touch1:
      mov ah,00h
      int 16h
      jmp l1
    
      
      pasos1:
      inc contador
      cmp contador,13d
      jz l2
      jnz izquierdal1
    
      izquierdal1:
      
      call izquierdaregreso
      jmp touch1  
    
     l1:
     cmp ah,4bh
     jz pasos1  
     jnz touch1   
     
     l2:
     call izquierdaregreso
       
      ret  
     
      
      
      reg1 endp 
      
      reg2 proc near
      mov contador,00h  
      touch2:
      mov ah,00h
      int 16h
      jmp l3
    
      
      pasos2:
      inc contador
      cmp contador,3d
      jz l4
      jnz arribal2
    
      arribal2:
      
      call arribaregreso
      jmp touch2  
    
      l3:
      cmp ah,48h
     jz pasos2  
     jnz touch2   
     
     l4:
     call arribaregreso
       
      ret  
     
      
      reg2 endp 
      
      reg3 proc near 
      mov contador,00h  
      touch3:
      mov ah,00h
      int 16h
      jmp l5
    
      
      pasos3:
      inc contador
      cmp contador,2d
      jz l6
      jnz izquierdal3
    
      izquierdal3:
      
      call izquierdaregreso
      jmp touch3  
    
      l5:
      cmp ah,4bh
      jz pasos3  
      jnz touch3   
     
      l6:
      call izquierdaregreso
       
      ret  
     
      reg3 endp 
      
      reg4 proc near 
      mov contador,00h  
      touch4:
      mov ah,00h
      int 16h
      jmp l7
    
      
      pasos4:
      inc contador
      cmp contador,5d
      jz l8
      jnz abajol4
    
      abajol4:
      
      call abajoregreso
      jmp touch4  
    
      l7:
      cmp ah,50h
      jz pasos4  
      jnz touch4   
     
      l8:
      call abajoregreso
       
      ret  
     
      
      reg4 endp 
      
      reg5 proc near 
      mov contador,00h  
      touch5:
      mov ah,00h
      int 16h
      jmp l9
    
      
      pasos5:
      inc contador
      cmp contador,12d
      jz l10
      jnz derechal5
    
      derechal5:
      
      call derecharegreso
      jmp touch5  
    
      l9:
      cmp ah,4dh
      jz pasos5  
      jnz touch5   
     
      l10:
      call derecharegreso
       
      ret  
     
      reg5 endp 
      
      reg6 proc near 
      
      mov contador,00h  
      touch6:
      mov ah,00h
      int 16h
      jmp l11
    
      
      pasos6:
      inc contador
      cmp contador,6d
      jz l12
      jnz abajol6
    
      abajol6:
      
      call abajoregreso
      jmp touch6  
    
      l11:
      cmp ah,50h
      jz pasos6  
      jnz touch6   
     
      l12:
      call abajoregreso
       
      ret  
     
      reg6 endp 
      
      reg7 proc near 
      
      mov contador,00h  
      touch7:
      mov ah,00h
      int 16h
      jmp l13
    
      
      pasos7:
      inc contador
      cmp contador,14d
      jz l14
      jnz izquierdal7
    
      izquierdal7:
      
      call izquierdaregreso
      jmp touch7  
    
      l13:
      cmp ah,4bh
      jz pasos7  
      jnz touch7   
     
      l14:
      call izquierdaregreso
       
      ret  
     
      
      
      reg7 endp 
      
      reg8 proc near 
      mov contador,00h  
      touch8:
      mov ah,00h
      int 16h
      jmp l15
    
      
      pasos8:
      inc contador
      cmp contador,7d
      jz l16
      jnz abajol8
    
      abajol8:
      
      call abajoregreso
      jmp touch8  
    
      l15:
      cmp ah,50h
      jz pasos8  
      jnz touch8   
     
      l16:
      call abajoregreso
       
      ret  
     
      
      
      reg8 endp 
      
      reg9 proc near 
      
      mov contador,00h  
      touch9:
      mov ah,00h
      int 16h
      jmp l17
    
      
      pasos9:
      inc contador
      cmp contador,2d
      jz l18
      jnz izquierdal9
    
      izquierdal9:
      
      call izquierdaregreso
      jmp touch8  
    
      l17:
      cmp ah,4bh
      jz pasos8  
      jnz touch8   
     
      l18:
      call izquierdaregreso
       
      ret  
     
      reg9 endp 
      
      
      
      
      
      
      
      
      mapa proc near 
      mov ah,00h 
      mov al,13h
      int 10h    
      
      
      mov posicionx,00h
      mov posiciony,00h 
      mov cx,posicionx                  
      mov dx ,posiciony                
      
         
      contorno1:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,319d
            jng contorno1
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,08h 
            jng contorno1
            
            
            mov posicionx,92d
            mov posiciony,09h 
            mov cx,posicionx                  
            mov dx ,posiciony                
      
            jmp barra1
            
       barra1:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng barra1
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,45d 
            jng barra1
              
            
            
            mov posicionx,00h
            mov posiciony,19d 
            mov cx,posicionx                  
            mov dx ,posiciony                
      
            jmp contorno2
            
            
            
      contorno2:      
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,72d
            jng contorno2
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d 
            jng contorno2
              
            mov posicionx,00h
            mov posiciony,25d 
            mov cx,posicionx                  
            mov dx ,posiciony                
      
            jmp contorno3
            
         contorno3:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,08d
            jng contorno3
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,174d 
            jng contorno3
            
           
           
            mov posicionx,00h
            mov posiciony,192d 
            mov cx,posicionx                  
            mov dx ,posiciony                
      
            jmp contorno4
                
          contorno4:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,319d
            jng contorno4
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d 
            jng contorno4
             
            mov posicionx,311d
            mov posiciony,45d 
            mov cx,posicionx                  
            mov dx ,posiciony 

            jmp contorno5
       
       
            contorno5:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng contorno5
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,150d 
            jng contorno5
                            
            mov posicionx,311d
            mov posiciony,09h 
            mov cx,posicionx                  
            mov dx ,posiciony 

            jmp barra2
            
            barra2:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng barra2
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,19
             
            jng barra2
             
            mov posicionx,200d
            mov posiciony,20d 
            mov cx,posicionx                  
            mov dx ,posiciony 

            jmp barra3
            
            barra3:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,120d
            jng barra3
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d 
            jng barra3
             
            mov posicionx,175d
            mov posiciony,45d 
            mov cx,posicionx                  
            mov dx ,posiciony 

            jmp barra4
            
            barra4:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,140d
            jng barra4
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d 
            jng barra4
            
            mov posicionx,175d
            mov posiciony,20d 
            mov cx,posicionx                  
            mov dx ,posiciony 

            jmp barra5
            
            
            barra5:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng barra5
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,30d 
            jng barra5
            
            mov posicionx,30d
            mov posiciony,46d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra6
            
            barra6:
            
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,70d
            jng barra6
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d 
            jng barra6
            
            
            mov posicionx,08h
            mov posiciony,70d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra7
            
            
            barra7:
            
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,120d
            jng barra7
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d 
            jng barra7
            
            
            mov posicionx,120d
            mov posiciony,19d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra8
            
            barra8:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng barra8
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,50d 
            jng barra8
            
            
            mov posicionx,150d
            mov posiciony,09h 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra9
            
            barra9:
            
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng barra9
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,70d 
            jng barra9
            
            mov posicionx,158d
            mov posiciony,71d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra10
            
            barra10:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,105d
            jng barra10
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d 
            jng barra10
            
            mov posicionx,280d
            mov posiciony,48d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra11
            
            barra11:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng barra11
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,31d 
            jng barra11
            
            mov posicionx,255d
            mov posiciony,79d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra12
            
            
            barra12:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng barra12
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,14d 
            jng barra12
            
            mov posicionx,120d
            mov posiciony,93d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra13
            
            barra13:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,143d
            jng barra13
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d 
            jng barra13
            
            mov posicionx,25d
            mov posiciony,93d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra14
            
            barra14:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,77d
            jng barra14
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d
             
            jng barra14
            
            mov posicionx,55d
            mov posiciony,100d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra15
            
            barra15:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng barra15
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,14d
             
            jng barra15
            
            mov posicionx,55d
            mov posiciony,115d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra16
            
            
            barra16:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,64d
            jng barra16
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d
             
            jng barra16
            
            mov posicionx,120d
            mov posiciony,100d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra17
            
            barra17:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng barra17
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,78d
             
            jng barra17
            
            mov posicionx,25d
            mov posiciony,120d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra18
            
            barra18:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng barra18
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,55d
             
            jng barra18
            
            mov posicionx,33d
            mov posiciony,140d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra19
            
            barra19:
            
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,70d
            jng barra19
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d
             
            jng barra19
            
            mov posicionx,33d
            mov posiciony,167d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra20
            
            
            barra20:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,50d
            jng barra20
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d
             
            jng barra20
            
            mov posicionx,95d
            mov posiciony,148d 
            mov cx,posicionx                  
            mov dx ,posiciony                
      
            jmp barra21
            
            barra21:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng barra21
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,50d
             
            jng barra21
            
            mov posicionx,145d
            mov posiciony,115d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra22
            
            barra22:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,166d
            jng barra22
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d
             
            jng barra22
            
            mov posicionx,145d
            mov posiciony,122d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra23
            
            barra23:
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,8d
            jng barra23
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,56d
             
            jng barra23
            
            mov posicionx,145d
            mov posiciony,170d 
            mov cx,posicionx                  
            mov dx ,posiciony 
            
            jmp barra24
            
            barra24:
            
            mov ah,0ch                  
            mov al,09h                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,165d
            jng barra24
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,8d
             
            jng barra24
            
            
            
            ret 
      mapa endp 
     
      
      
      derecha proc near
      
      ;call reseteo 
       
      mov ah,00h 
      mov al,13h
      int 10h    
      call trofeo 
      mov ax,salto
      ;mov salto,00h  
      add posicionx,ax   
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
      
     derecharegreso proc near
      
      ;call reseteo 
       
      mov ah,00h 
      mov al,13h
      int 10h    
       
      mov ax,salto
      ;mov salto,00h  
      add posicionx,ax   
      mov cx,posicionx                  
      mov dx ,posiciony                
      
         
      ciclodos:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh ,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,limite
            jng ciclodos
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,limite
            jng ciclodos 
         
            ret 
            derecharegreso endp  
        
    
    
       
      izquierda proc near
      
      ;call reseteo 
      
      mov ah,00h 
      mov al,13h
      int 10h
      call trofeo     
      mov ax,salto
      ;mov salto,00h 
      sub posicionx,ax  
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
     
       izquierdaregreso proc near
      
      ;call reseteo 
      
      mov ah,00h 
      mov al,13h
      int 10h
           
      mov ax,salto
      ;mov salto,00h 
      sub posicionx,ax  
      mov cx,posicionx                  
      mov dx ,posiciony                
      
         
      ciclo44:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh ,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,limite
            jng ciclo44
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,limite
            jng ciclo44 
         
            ret 
       izquierdaregreso endp  
     
      abajo proc near
      ;call reseteo 
      
      mov ah,00h 
      mov al,13h
      int 10h
      call trofeo     
      mov ax,salto
      ;mov salto,00h 
      
      add posiciony,ax 
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
        
       abajoregreso proc near
      ;call reseteo 
      
      mov ah,00h 
      mov al,13h
      int 10h
           
      mov ax,salto
      ;mov salto,00h 
      
      add posiciony,ax 
      mov cx,posicionx                  
      mov dx ,posiciony                
      
         
      ciclotres:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh ,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,limite
            jng ciclotres
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,limite
            jng ciclotres 
         
            ret 
            abajoregreso endp  
     
       
       
       
      arriba proc near
      ;call reseteo 
      
      mov ah,00h 
      mov al,13h
      int 10h
      call trofeo     
      mov ax,salto
      ;mov salto,00h 
      
      sub  posiciony,ax 
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
     
       arribaregreso proc near
      ;call reseteo 
      
      mov ah,00h 
      mov al,13h
      int 10h
           
      mov ax,salto
      ;mov salto,00h 
      
      sub  posiciony,ax 
      mov cx,posicionx                  
      mov dx ,posiciony                
      
         
      ciclocinco:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh ,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,limite
            jng ciclocinco
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,limite
            jng ciclocinco
         
            ret 
            arribaregreso endp  
     
      
     
       inicio proc near 
      
         mov posicionx,00h
         mov posiciony,09h
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
    
     
     inicio2 proc near 
      
     mov posicionx,297d
     mov posiciony,36d
         mov cx,posicionx                  
         mov dx ,posiciony                
      
         
         ciclo22:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh ,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx
            cmp ax,limite
            jng ciclo22
            
            mov cx,posicionx                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony
            cmp ax,limite
            jng ciclo22 
          
         ret 
     
         inicio2 endp 
    
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     trofeo proc near 
      mov posicionx2,300d
      mov posiciony2,20h
      mov cx,posicionx2                  
      mov dx ,posiciony2                
      
         
      ciclo33:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh ,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx2
            cmp ax,limite
            jng ciclo33
            
            mov cx,posicionx2                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony2
            cmp ax,6d 
            jng ciclo33 
            
            mov posicionx2,298d
            mov posiciony2,21h 
            mov cx,posicionx2                  
            mov dx ,posiciony2 
            
            
            oizquierda:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx2
            
            cmp ax,2d
            jng oizquierda
            
            mov cx,posicionx2                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony2
            cmp ax,4d 
            jng oizquierda 
            
            
            mov posicionx2,308d
            mov posiciony2,21h 
            mov cx,posicionx2                  
            mov dx ,posiciony2 
            
            oderecha:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx2
            
            cmp ax,2d
            jng oderecha
            
            mov cx,posicionx2                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony2
            cmp ax,4d 
            jng oderecha  
            
            
            
            
            
            
            
            mov posicionx2,303d
            mov posiciony2,27h 
            mov cx,posicionx2                  
            mov dx ,posiciony2 
            
            
            
            base:
            mov ah,0ch                  
            mov al,0Eh                  
            mov bh,00h                     
            int 10h                      
            
            inc cx                       
            mov ax,cx                    
            sub ax,posicionx2
            cmp ax,2d
            jng base
            
            mov cx,posicionx2                 
            inc dx                       
            
            mov ax,dx                    
            sub ax,posiciony2
            cmp ax,5d 
            jng base
            
            
            
            
            
            
         ret 
     
     
     
     
     
     trofeo endp      
      
     
     
     
     
     
     
     
     
     
     
     
     
     
   
     reseteo proc near               
    
            
            MOV AH,00h                   
            MOV AL,13h                   
            INT 10h                       
        
            ;MOV AH,0Bh                   
            ;MOV BH,00h                   
            ;MOV BL,00h                   
            ;INT 10h                      
            
            RET
     reseteo endp 
     
     
     

     ;iran procedimientos dentro de el procedimiento principal que es programa 
     end programa ;este end tiene que ir si o si para determinar en fin del programa por muy raro que se lea 
 
