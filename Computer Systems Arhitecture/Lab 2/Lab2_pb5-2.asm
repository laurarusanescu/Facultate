bits 32 ; assembling for the 32 bits architecture
;(a+b/c-1)/(b+2); a-doubleword; b-byte; c-word
; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a dd 4
    b db 6
    c dw 3

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;a+b/c-1
        movzx ax, [b]
        mov bx, [c]
        div bx; al
        add al, [a]
        sub al, -1; al
        
        ;(a+b/c-1)/(b+2)
        movzx ax, al
        mov bl, [b]
        add bl, 2
        movzx bx, al
        idiv bx
        
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
