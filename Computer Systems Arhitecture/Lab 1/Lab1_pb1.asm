 bits 32 ; assembling for the 32 bits architecture
;a+b-7-(c+d)
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
    a dw 13
    b db 3
    c dw 14
    d db 2

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;c+d
        mov ax, [c]
        add ax, [d]
        
        ;-7-(c+d)
        mov bx, -7
        sub bx, ax
        
        ;b-7-(c+d)
        mov cx, [b]
        add cx, bx
        
        ;a+b-7-(c+d)
        mov dx, [a]
        add cx, dx
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
