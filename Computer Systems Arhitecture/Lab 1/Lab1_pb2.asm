bits 32 ; assembling for the 32 bits architecture
;pb2: (10-d-a+4) + c

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a db 1
    c dw 2
    d dd 4

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ;10-d
        mov ax, 10
        sub ax, [d] ; ax = 10-4
        
        ;10-d-a
        sub ax, [a] ; ax = 6-1
        
        ;10-d-a+4
        add ax, 4 ; ax = 5+4
        
        ;(10-d-a+4)+c
        add ax, [c] ; ax = 9+2
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
