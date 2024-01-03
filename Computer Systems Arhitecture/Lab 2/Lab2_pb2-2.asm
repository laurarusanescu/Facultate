bits 32 ; assembling for the 32 bits architecture
; 2/(a+b*c-9)-d; a,b,c-byte; d-doubleword
; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a db 3
    b db 2
    c db 6
    d dd -20

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;a+b*c-9
        mov al, [b]
        mov bl, [c]
        mul bl; ax = b*c
        movzx bx, [a]
        add ax, bx
        sub ax, 9
        mov cx, ax        ;=ax
        
        ;2/(a+b*c-9)
        mov ax, 2
        mov dx, 0
        div cx
        
        ;2/(a+b*c-9)-d
        movzx eax, ax 
        sub eax, [d]
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
