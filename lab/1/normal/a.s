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

loadc:
	mov edi, pc
	mov edi, [edi]

;mul by bit
loopi:
	mov eax, [ebp-0x10]	; la
	mov dword [ebp-0x18], eax ; i=la
	jmp cmpi

opi:
	nop ; some operation.... to be implement
	sub dword [ebp-0x18], 1 ; i--

loopj:
	mov eax, [ebp-0x14] ; lb
	mov dword [ebp-0x1c], eax; j=lb
	jmp cmpj

opj:
	sub dword [ebp-0x1c], 1 ; j--
	mov esi, [ebp-0x8]  ; pa
	mov eax, [ebp-0x18] ; i
	add eax, esi		
	movzx eax, byte [eax] ; pa[i]
	sub eax, 0x30		; pa[i]-'0'

    mov esi, [ebp-0xc]  ; pb
	mov ebx, [ebp-0x1c] ; j
	add ebx, esi
	movzx ebx, byte [ebx] ; pb[j]
	sub ebx, 0x30		; pb[j]-'0'
	mul ebx				; (pa[i]-'0')*(pb[j]-'0')

	mov ebx, [ebp-0x18] ; i
	mov ecx, [ebp-0x1c] ; j
	add ebx, ecx
	add ebx, 1
	shl ebx, 2
	add ebx, edi
	add [ebx], eax		; (int) pc[i+j+1] += (pa[i]-'0')*(pb[j]-'0')

cmpj:
	cmp dword [ebp-0x1c], 0 ; j > 0
	ja opj
cmpi:
	cmp dword [ebp-0x18], 0 ; i > 0
	ja opi

;carry
loopi2:
	mov eax, [ebp-0x10] ; la
	mov ebx, [ebp-0x14] ; lb
	add eax, ebx		; la+lb
	mov [ebp-0x18], eax	; i = la+lb
	jmp cmpi2
opi2:
	sub dword [ebp-0x18], 1
	mov ebx, [ebp-0x18] ; 
	mov eax, [edi+ebx*4]; 
	xor edx, edx
	mov ecx, 10
	div ecx
	mov [edi+ebx*4], edx	; pc[i] %= 10
	add [edi+ebx*4-4], eax	; pc[i-1] += pc[i]/10
	nop	

cmpi2:
	cmp dword [ebp-0x18], 0	
	ja opi2				; i > 0 ?

bigxbig_done:
	leave
	ret

print:
;;;;;;;;;;;;;
	mov eax, la
	mov eax, [eax]
	mov ebx, lb
	mov ebx, [ebx]
	add eax, ebx
	mov edi, eax ; edi=la+lb
loopp:
	mov ecx, 0
	jmp cmpp
cmpp:
	cmp ecx, edi
	jb opp
opp:
	mov eax, [edi]
	add eax, 0x30
	mov [edi], eax


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
wipec:
	pop eax
	sar eax, 2
	push eax
	xor eax, eax
	mov edx, pc
	mov edx, [edx]
loopc:
	jmp cmpc
opc:
	mov dword [edx+eax*4], 0
	add eax, 1
cmpc:
	cmp eax, dword [esp]
	jl opc

calc:
	call bigxbig

judge:
	cmp dword [edi], 0
	jnz print
	add edi, 4

	call print
done:
	;exit(0)
	push 0
	call exit

