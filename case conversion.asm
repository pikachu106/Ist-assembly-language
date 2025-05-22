.MODEL SMALL
.STACK 100H
.DATA
  MSG DB 'ENTER A LETTER:','$'
  NUM1 DB ?
  MSG2 DB 'THE LOWER CASE IS:','$'
  MSG3 DB 'THE UPPER CASE IS :','$'
.CODE
MAIN PROC 
        MOV AX,@DATA
        MOV DS,AX
        MOV AH,09
        LEA DX,MSG
        INT 21H
       
        ;INPUT
      MOV AH,01
      INT 21H
      MOV NUM1,AL
    ;COMPARE   
    CMP NUM1,96
    JG TO_UPPER
    JL TO_LOWER
    
    
    TO_UPPER:  
    MOV AH,02
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
     MOV AH,09
     LEA DX,MSG3
     INT 21H
    SUB NUM1,32
    JMP OUTPUT 
    
  
   
    
    TO_LOWER:
    MOV AH,02
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
      MOV AH,09
      LEA DX,MSG2 
      INT 21H
    ADD NUM1,32
    
     
    
    
    OUTPUT:
    
    
     
    MOV DL,NUM1
    MOV AH,02  
    INT 21H
    
   MOV AH,4CH
   INT 21H 

   MAIN ENDP
END MAIN