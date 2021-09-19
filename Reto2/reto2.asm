section .data
    N dd 145
    mensaje1 db "El número en memoria es fuerte",10 
    lenMen1 equ $ - mensaje1
    mensaje2 db "El número en memoria no es fuerte",10   
    lenMen2 equ $ - mensaje2

section .bss
    respuesta resb 1


section .text
    global _start

_start: 
    mov eax,DWORD[N]
    mov r9,rax
    mov r10,0 ;fin divisiones
    mov r11,0 ;suma
    mov rbx,10
bucle1:
    cmp rax,r10
    je finBucle1
    cdq
    idiv rbx
    mov rcx,1
   numDividido:
    push rax
    mov rax,rcx
    mov r12,rdx
    factorial:
        cmp rcx,r12
        jg finFactorial
        mul rcx
        factoParcial:
        inc rcx
        jmp factorial


    finFactorial:
        add r11,rax
        pop rax
        jmp bucle1

finBucle1:
     cmp r11,r9
     je ES_FUERTE
     jmp NO_ES_FUERTE


NO_ES_FUERTE:
    mov BYTE[respuesta],70
    mov rax, 1
	mov rdi, 1
	mov rsi, mensaje2
	mov rdx, lenMen2
	syscall
    mov BYTE[respuesta+1],10
    mov rax, 1
	mov rdi, 1
	mov rsi, respuesta
	mov rdx, 2
	syscall

    jmp SYS_EXIT

ES_FUERTE:
    mov BYTE[respuesta],84
    mov rax, 1
	mov rdi, 1
	mov rsi, mensaje1
	mov rdx, lenMen1
	syscall
    mov BYTE[respuesta+1],10
    mov rax, 1
	mov rdi, 1
	mov rsi, respuesta
	mov rdx, 2
	syscall
    jmp SYS_EXIT



SYS_EXIT:
	mov rax, 60
	mov rdi, 0
	syscall
















