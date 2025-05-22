.MODEL SMALL
.STACK 100H
.DATA
    VAL1 DB ?
    VAL2 DB ?
    MSG DB 10,13,'ENTER TWO NUMBERS:','$'
    MSG2 DB 10,13,'SMALLEST NUMBER IS:','$'
 
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
        MOV VAL1,AL
        INT 21H
        MOV VAL2,AL
             
     ;COMPARE 
     CMP VAL1,AL
     JL G1
     JGE G2
     
     
     
     G1:
     MOV BL,VAL1
     JMP PRINT
     G2:
     MOV BL,VAL2
     
   PRINT:
   MOV AH,09
   LEA DX,MSG2
   INT 21H
   MOV AH,02
   MOV DL,BL
  
   INT 21H 
      
    
   MOV AH,4CH
   INT 21H 

   MAIN ENDP
END MAIN