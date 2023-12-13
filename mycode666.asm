.model small 
.stack
.data
  
  variable1 db 15
  variable2 db 5

.code
     
     
     mov ax,@data 
     mov ds,ax 
     
     
     mov al, variable1 
     mov bl, variable2
     
     mov ah,0
     
     div bl
     
      
     
     


end 