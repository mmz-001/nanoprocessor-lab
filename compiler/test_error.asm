; --------------------------------------------------
; Testing Errors
; --------------------------------------------------

J0 3 2      ; J0 is not a valid instruction. Did you mean JO
JZR R2 2F   ; 2F is not a valid address. Program ROM is 5-bit
CMP R1 R8   ; R8 is not a valid register