; --------------------------------------------------
; Instructions for testing compiler
; --------------------------------------------------

MOVI R1 0F    ; Move value 0F to register R1
ADD R2 R3     ; Add values in registers R2 and R3 and 
              ; store the result in R2
NEG R4        ; Two’s complement of register R4
JZR R5 11     ; Jump to address 21 if value in register R5 is 0
MOV R1 R2     ; Move value in register R2 to R1
MUL R3 R4     ; Multiply value in R3 with value in R4 and 
              ; store the result in R3
DIV R7 R3     ; Divide value in R7 by value in R3 and 
              ; store the result in R7. 
MOD R2 R1     ; Calculate mod of value in R2 with value in R1 
              ; and store the result in R2. 
IN R2 1       ; Take input from port 1 and 
              ; store the result in register R2.
CMP R2 R0     ; Compare value in R2 with value in R0
HALT          ; Halt execution.                                                                                                                 
JO 1F         ; Jump to address 1F if Overflow flag is set
JS 01         ; Jump to address 01 if Negative flag is set
JINT 0A       ; Jump to address 0A if Interrupt flag is set
INC R1        ; Increment value in register R1                                                                                                          
DEC R3        ; Decrement value in register R3       
