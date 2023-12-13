.model small 
.stack 100h
.data
 
.code 
  mov ax,@data 
  mov ds,ax 
  
  
  mov cl, 21h
  mov dl, 0
  mov ch,0
  
  loopeando:
  
   inc dl
   
  loop loopeando

  hlt 



.exit 