bits 32 ; assembling for the 32 bits architecture
;pb 12.2  (a*b+2)/(a+7-c)+d; a,c-byte; b-word; d-doubleword;
; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a db 4
    b dw 3
    c db 7
    d dd 1

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;a*b
        movzx eax, byte[a]
        movzx ebx, word[b]
        imul ebx
        
        ;a*b +2
        add eax, 2
        
        ;a+7
        movzx ecx, byte[a]
        add ecx, 7
        
        ;a+7-c
        sub cl, byte[c]
        
        ;(a*b+2)/(a+7-c)
        cdq
        idiv ecx
        
        ;(a*b+2)/(a+7-c)+d
        add eax, dword[d]
        
        
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
