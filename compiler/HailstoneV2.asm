IN R7 0    ; get input from switches (values 1 to 9)
MOVI R6 02 ; move 2 to R6 
MOVI R2 03 ; move 3 to R2
MOV R5 R7  ; copy R7 to R5
MOD R5 R6  ; Check if even
JZ 07      ; Jump to even section   
JZR R0 09  ; go to the odd section
DIV R7 R6  ; divide by 2
JZR R0 03  ; repeat
MOV R4 R7  ; copy value to edit
MUL R4 R2  ; multiply by 2
INC R4     ; add 1
MOV R7 R4  ; mov R4 final value to R7
JZR R0 03