section .data
    num1 dd 5
    num2 dd 3
    msg db "Result is: "
    msgLen equ $ - msg
    newline db 0xa
    
section .bss
    result resd 1
    resultStr resb 8

section .text
    global _start

_start:
    mov eax, [num1]
    add eax, [num2]
    mov [result], eax

    ; Convert number to string
    mov eax, [result]
    mov ecx, resultStr
    call intToStr

    ; Print "Result is: "
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msgLen
    int 0x80

    ; Print result
    mov eax, 4
    mov ebx, 1
    mov ecx, resultStr
    mov edx, 8
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80


    ; Exit
    mov eax, 1
    mov ebx, 0
    int 0x80

; Convert integer to string
intToStr:
    add eax, '0'
    mov [ecx], eax
    ret