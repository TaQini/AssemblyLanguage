extern malloc
extern read
extern write
extern exit

section .text
	global _start
section .data
	pa dd 0
	la dd 0
	pb dd 0
	lb dd 0
	pc dd 0

bigxbig:
bigxbig_init:
	push ebp
	mov ebp, esp
    mov eax, pc		;ebp-0x4
    mov eax, [eax]
    push eax
    mov eax, pa		;ebp-0x8
    mov eax, [eax]
    push eax
    mov eax, pb		;ebp-0xc
    mov eax, [eax]
    push eax
    mov eax, la		;ebp-0x10
    mov eax, [eax]
    push eax
    mov eax, lb		;ebp-0x14
    mov eax, [eax]
    push eax
	push 0			;i = ebp-0x18
	push 0			;j = ebp-0x1c

loopi:
	mov dword [ebp-0x18], 0
	jmp cmpi

opi:
	nop ; some operation.... to be implement
	add dword [ebp-0x18], 1

loopj:
	mov dword [ebp-0x1c], 0
	jmp cmpj

opj:
	nop
    add dword [ebp-0x1c], 1

cmpj:
	mov eax, dword [ebp-0x14] ; lb
	cmp dword [ebp-0x1c], eax ; j < lb
	jl opj
cmpi:
	mov eax, dword [ebp-0x10] ; la
	cmp dword [ebp-0x10], eax ; i < la
	jl loopj

bigxbig_done:
	leave
	ret

_start:
malloca:
	;sa = malloc(128);
	push 128
	call malloc
	;ptr -> data.sa
	mov edx, pa
	mov [edx], eax
reada:
	;read(0,&sa,128);
	push 128
	push eax
	push 0
	call read
	;len -> data.la
    mov edx, la
	sub eax, 1
    mov [edx], eax
	; \n -> \0
	mov ebx, pa
	mov ebx, [ebx]
	add ebx, eax
	xor ecx, ecx
	mov [ebx], ecx
mallocb:
	;b = malloc(128)
    push 128
    call malloc
	;ptr -> data.pb
	mov edx, pb
	mov [edx], eax
readb:
	;read(0,&sb,128);
    push 128
    push eax
    push 0
    call read
    ;len -> data.lb
    mov edx, lb
    sub eax, 1
    mov [edx], eax
    ; \n -> \0
    mov ebx, pb
    mov ebx, [ebx]
    add ebx, eax
    xor ecx, ecx
    mov [ebx], ecx
mallocc:
	;c = malloc(4*(la+lb))
    mov eax, la
	mov eax, [eax]
	mov ebx, lb
	mov ebx, [ebx]
	add eax, ebx
	mov ebx, 4
	mul ebx
	push eax
    call malloc
    ;ptr -> data.pc
    mov edx, pc
    mov [edx], eax
calc:
	call bigxbig
done:
	;exit(0)
	push 0
	call exit

