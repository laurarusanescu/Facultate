bits 32 ; assembling for the 32 bits architecture
;(2+a-b)-c+d
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
    a dw 30
    b db 3
    c dw 28
    d db 6

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;2+a
        mov ax, [a]
        add ax, 2
        
        ;2+a-b
        mov bx, [b]
        sub ax, bx;=al
        
        ;(2+a-b)-c
        sub al, [c];=al
        
        ;(2+a-b)-c+d
        add al, [d]
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
