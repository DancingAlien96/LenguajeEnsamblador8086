.model small 
.stack 100h
.data 
.code 
 mov ax,@data
 mov ds,ax 
 
 mov dl,0
 
 mov bh, 2
 mov bl ,1
 
 jmp primercaso
 
 
 primercaso: 
   cmp dl,0 
   je suma 
   jne segundocaso 
   
  segundocaso:
     cmp dl,1 
     je resta
     jne error 
    
 
   suma:
     add bh,bl  
     hlt 
     
   resta:
     sub bh,bl  
      hlt 

  error:
    hlt  
   
   
   

.exit 