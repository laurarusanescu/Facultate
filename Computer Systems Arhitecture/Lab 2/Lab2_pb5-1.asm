bits 32 ; assembling for the 32 bits architecture
;[d-2*(a-b)+b*c]/2 data types: a,b,c - byte, d - word
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
     b db 6
     c db 7
     d dw 12

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;d-2*(a-b)
        mov al, [a]
        sub al, [b]
        mov bl, 2
        mul bl
        movzx bx, al
        mov ax, [d]
        sub ax, bx
        mov cx, ax;cx
        
        ;d-2*(a-b)+b*c
        mov al, [b]
        mul byte[c];ax
        add ax, cx;al
        
        ;[d-2*(a-b)+b*c]/2
        movzx ax, al
        mov bx, 2
        idiv bx
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
