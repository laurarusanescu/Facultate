bits 32 ; assembling for the 32 bits architecture
;(a*2+b/2+e)/(c-d); a-word; b,c,d-byte; e-doublewor
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
    c db 2 
    d db 1
    e dd 16

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;a*2
        mov al, [a]
        mov bl, 2
        mul bl; ax
        mov cx, ax
        
        ;b/2
        mov ax, [b]
        mov bx, 2
        div bx; al
        
        ;a*2+b/2+e
        movzx ax, al
        add ax, cx
        movzx edx, ax
        add edx, [e]
        mov eax, 0
        
        ;(a*2+b/2+e)/(c-d)
        mov cl, [c]
        sub cl, [d]
        movzx ebx, cl
        idiv ebx 
        
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
