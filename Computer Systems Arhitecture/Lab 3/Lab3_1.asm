bits 32 ; assembling for the 32 bits architecture
;pb 17 : [(a+b)*3]/c-d, a, b, c- byte, d- word
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
        b db -10
        c db 3
        d dw -4

; our code starts here
segment code use32 class=code
    start:
        ; ...
        
        ; a+b
        mov al, [a]
        add al, byte[b]; ax = a+b
        
        ;(a+b)*3
        mov bl, 3
        imul bl;ax= 3*(a+b)
        
        ;[(a+b)*3]/c
        idiv byte[c];al = [(a+b)*3]/c
        
        ;[(a+b)*3]/c-d
        movsx ax, al
        sub ax, [d]
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
