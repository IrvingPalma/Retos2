
section .data
    N dd 2
    a dd 2
    mensaje1 db "Valor N fuera del rango [0-255]",10 
    lenMen1 equ $ - mensaje1
    mensaje2 db "Valor a fuera del rango [0-255]",10   
    lenMen2 equ $ - mensaje2
    mensaje3 db "Se guardó el resultado izquierdo en bss",10 
    lenMen3 equ $ - mensaje3
    mensaje4 db "Se guardó el resultado derecho en bss",10   
    lenMen4 equ $ - mensaje4

section .bss
    izquierda resd 1
    derecha resd 1

section .text
    global _start

_start:
    mov ebx,DWORD[N] 
    mov eax, DWORD[a]
    mov ecx,0
    mov edx,255

verificaRango:
    cmp ebx,edx
    jg FUERA_DE_RANGO_N
    cmp ebx,ecx
    jl FUERA_DE_RANGO_N

    cmp eax,edx
    jg FUERA_DE_RANGO_a
    cmp eax,ecx
    jl FUERA_DE_RANGO_a


terminoIzquierdo:
mov r11,0
bucle1:
    mov r10,rax
    mov r9,1
    inc ecx
comp1:
    cmp ecx,ebx
    jg finIzq 

    bucle2:
        cmp r9,rcx
        je salidaBucle2
        push rax
        mul r10
        mov r10,rax
        pop rax
        inc r9
        jmp bucle2

    salidaBucle2:
        add r11,r10
        jmp bucle1

finIzq:
    mov DWORD[izquierda],r11d
    push rax
    mov rax, 1
	mov rdi, 1
	mov rsi, mensaje3
	mov rdx, lenMen3
	syscall

terminoDerecho:
    pop rax
    inc rbx
    mov rcx,rax
    mov r11,1
    bucle3:
        cmp r11,rbx
        je finBucle1
        push rax
        mul rcx
        mov rcx,rax
        pop rax
        inc r11
        jmp bucle3

    finBucle1:
        xchg rax,rcx 
        mov rbx,1
        sub rax,rcx
        sub rcx,rbx
        cdq
        idiv rcx
finDer:
    mov DWORD[derecha],eax
    mov rax, 1
	mov rdi, 1
	mov rsi, mensaje4
	mov rdx, lenMen4
	syscall       
    jmp SYS_EXIT

FUERA_DE_RANGO_N:
    mov rax, 1
	mov rdi, 1
	mov rsi, mensaje1
	mov rdx, lenMen1
	syscall
    mov rax,0
    jmp SYS_EXIT
FUERA_DE_RANGO_a:
    mov rax, 1
	mov rdi, 1
	mov rsi, mensaje2
	mov rdx, lenMen2
	syscall
    mov rax,0
    jmp SYS_EXIT

SYS_EXIT:
	mov rax, 60
	mov rdi, 0
	syscall


























