bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    ;if a > (b-2) then e = (a+3)*2 – c else e = c/7
    ;a byte, b word, c word, d byte, e doubleword, f byte
    a db 4
    b dw 3
    c dw 7
    d db 2
    f db 2
    e dq 0
; our code starts here
segment code use32 class=code
    start:
        ; ...
        ; (b-2)
        mov ax, [b]
        sub ax, 2
        mov bx, ax
        movzx ax, [a]
        cmp ax, bx
        JG ramurathen
        JLE ramuraelse
        ramurathen:
        ;e = (a+3)*2 – c
        mov al, [a]
        add al, 3
        mov bl, 3
        mul bl; ax
        movzx eax, ax
        sub eax, [c]
        cdq;
        mov dword[e+0], eax
        mov dword[e+4], edx
        mov [e], eax
        jmp myendif
        ramuraelse:
        ;c/7
        mov eax, [c]
        mov ebx, 7
        div ebx; edx: eax
        cdq;
        mov dword[e+0], eax
        mov dword[e+4], edx
        myendif:
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
