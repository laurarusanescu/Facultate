bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions
;. A string of bytes A is given. Construct string B containing only values divisible with 5 from string A.
;If A = 16, 20, 5, 18 => B = 20, 5
; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a db 16, 20, 5, 18 ; b = 20, 5
    ls equ($-a)
    b resb ls

; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov esi, 0
        mov edi, 0
        mov ecx, ls
        repeta:
            mov al, [a+esi]
            mov ah, 0
            mov bx, 5
            mov dx, 0
            div bx
            cmp dx, 0
            JE ADAUGA
            JNE NEXT
                ADAUGA:
                    mov al, [a+esi]
                    mov [b+edi], al
                    add edi, 1
                NEXT:
                    add esi, 1
            loop repeta
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
