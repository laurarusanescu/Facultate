bits 32 ; assembling for the 32 bits architecture
;(10–a*a) + 2*(b-1) – d data types: a,b,c - byte, d - wor
; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a db 2
    b db 14
    c db 3
    d dw 12

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;10-a*a
        mov al, [a]
        mul byte[a];=ax
        mov bx, 10
        sub bx, ax;bx
        
        ; 2*(b-1)
        mov cl, [b]
        sub cl, 1
        mov al, 2
        mul cl; ax
        
        ;(10–a*a) + 2*(b-1) – d
        add ax, bx
        sub ax, [d]
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
