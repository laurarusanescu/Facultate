bits 32 ; assembling for the 32 bits architecture
;(3+b-a)-5+c
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
    a dw 40
    b db 3
    c dw 10
    d db 5

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;3+b-a
        mov al, 3
        add al, [b]
        sub al, [a]
        
        ;(3+b-a)-5+c
        sub al, 5
        add al, [c]
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
