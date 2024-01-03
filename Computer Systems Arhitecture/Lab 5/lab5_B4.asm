bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions
                          
;A string of words S is given. Compute string D containing only high bytes multiple of 7 from string S.
;If S = 1735h, 0778h, 0E20h => D = 07h, 0Eh

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a dw 1735h, 0778h, 0E20h
    la equ($-a)/2
    d resw la

; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov ecx, la
        mov esi, 1
        mov ebp, 0
        ; bytes high
        ;1 word = 1 byte high|1 byte low
        ; in mem: 1 byte low   1 byte high
        ;          0               1
        ; adresele bytes high 1, 3, 5 ...
        repeta2:
            mov al, byte[a+esi]; in al este byte high din wordul 1
            mov ah, 0
            mov bx, 7
            mov dx, 0 ; dx:ax
            div bx ; dx:ax/bx = ax cat si dx rest
            cmp dx, 0
            JE ADAUGA
            JNE NEXT
                ADAUGA:
                    mov al, [a+esi]
                    mov [d+ebp], al
                    add ebp, 1
                NEXT:
                    add esi, 2
        loop repeta2
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
