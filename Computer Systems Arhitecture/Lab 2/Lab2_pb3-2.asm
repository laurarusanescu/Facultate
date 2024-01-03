bits 32 ; assembling for the 32 bits architecture
;(8-a*b*100+c)/d; a,b,d-byte; c-doubleword
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
    b db 4
    c db 2
    d dd 2

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;a*b*100
        mov al , [a]
        mul byte[b]
        mov bx, 100
        mul bx
        
        ;8-a*b*100+c
        mov cx, 8
        sub cx, ax 
        add cx, [c]
        
        ;(8-a*b*100+c)/d
        movzx eax, cx
        mov ebx, [d]
        idiv ebx
        
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
