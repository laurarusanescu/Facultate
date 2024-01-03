bits 32 ; assembling for the 32 bits architecture
;(b-a)+3+d-c
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
    a dw 20
    b db 1
    c dw 21
    d db 5

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;(b-a)
        mov ax, [b]
        sub ax, [a]
        
        ;(b-a)+3
        mov bx, 3
        add ax, bx;=al
        
        ;(b-a) +3+d
        add al, [d]
        
        ;(b-a)+3+d-c
        sub al, [c]
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
