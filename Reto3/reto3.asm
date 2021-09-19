section .data
    cadena1 db "anitalavalatina"
    lenCadena1 equ $ - cadena1
    mensaje1 db "La cadena en memoria es palíndomo",10  
    lenMen1 equ $ - mensaje1
    mensaje2 db "La cadena en memoria no es palíndomo",10   
    lenMen2 equ $ - mensaje2

section .bss
    respuesta resb 1
    cadena2 resb 30


section .text
    global _start

_start:
    mov rax,lenCadena1
    dec rax
    mov rbx,rax
    mov rcx,0

bucle1:
    cmp rcx,rbx
    jg finCopiado
    mov r10b,BYTE[cadena1+rax]
    mov BYTE[cadena2+rcx],r10b
    inc rcx
    dec rax
    jmp bucle1


 finCopiado:
    mov rax,lenCadena1
    mov rcx,0
    bucle2:
        cmp rcx,rax
        je ES_PALINDROMO
        mov bl,BYTE[cadena1+rcx] 
        mov dl,BYTE[cadena2+rcx] 
        inc rcx
        cmp rbx,rdx
        je bucle2
        jmp NO_ES_PALINDROMO


ES_PALINDROMO:
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

NO_ES_PALINDROMO:
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

SYS_EXIT:
	mov rax, 60
	mov rdi, 0
	syscall