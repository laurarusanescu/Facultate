bits 32 ; assembling for the 32 bits architecture
;a+4+b-(5-d)
;a –word, b – byte, c - word, d – byt
; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a dw 15
    b db 4
    c dw 19
    d db 2

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;a+4
        mov ax, [a]
        add ax, 4
        
        ;a+4+b
        add ax, [b];=al
        
        ;(5-d)
        mov bl, [d]
        mov cl, 5
        sub cl, bl
        
        ;a+4+b-(5-d)
        sub al, cl
        
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
