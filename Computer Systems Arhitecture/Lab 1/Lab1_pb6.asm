bits 32 ; assembling for the 32 bits architecture
;(6+d-b)-2+a
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
    c dw 32
    d db 7

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;6+d
        mov al, 6
        add al, [d];=al
        
        ;6+d-b
        sub al, [b]
        
        ;(6+d-b)-2
        sub al, 2
        
        ;(6+d-b)-2+a
        add al , [a]
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
