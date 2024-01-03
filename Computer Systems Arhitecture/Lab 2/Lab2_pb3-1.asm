bits 32 ; assembling for the 32 bits architecture
;[-1+d-2*(b+1)]/a data types: a,b,c - byte, d - word
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
    b db 3
    c db 3
    d dw 5

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;2*(b+1)
        mov al, [b]
        add al, 1
        mov bl, 2
        mul bl; =ax
        
        ;-1+d-2*(b+1)
        mov cl, -1
        add cl, [d]
        movzx bx, cl
        sub bx, ax
        mov ax, bx
        
        ;[-1+d-2*(b+1)]/a
        mov ah, [a]
        div ah
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
