bits 32 ; assembling for the 32 bits architecture
;pb12.1 a*[b+c+d/b]+d
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
    b db 5
    c db 7
    d dw 10
    

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;d/b
        ;d->ax
        mov ax, word[d]
        div byte[b];al=d/b(cat)
        
        ;b+c
        mov bl, [b]
        add bl, [c]
        
        ;b+c+d/b
        add al, bl
        
        ;a*(b+c+d/b)
        ;a*al
        mul byte[a];al*a->ax
        
        ;c byte->word
        movzx bx, byte[c]
        
        ;a*(b+c+d/b)+c
        add ax, bx
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
