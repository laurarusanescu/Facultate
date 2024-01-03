bits 32 ; assembling for the 32 bits architecture
;4+b-(5-d)+a
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
    c dw 15
    d db 8

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;4+b
        mov al, [b]
        add al, 4
        
        ;5-d
        mov bl, 5
        sub bl, [d]
        
        ;4+b-(5-d)
        sub al, bl
        
        ;4+b-(5-d)+a 
        add al, [a]
        
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
