bits 32 ; assembling for the 32 bits architecture
;((a+b-c)*2 + d-5)*d data types: a,b,c - byte, d - word
; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a db 4
    b db 2
    c db 5
    d dw 20

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;a+b-c
        mov al, [a]
        add al, [b]
        sub al, [c]
        
        ;(a+b-c)*2
        mov bl , 2
        mul bl; =al
        
        ;(a+b-c)*2 + d-5
        add al ,[d]
        sub al, 5
        
        ;((a+b-c)*2 + d-5)*d
        movzx ax, al
        movzx bx, [d]
        imul bx
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
