extern scanf
extern printf
extern exit
global main

section .text
strlen_easy:
	push ebp
	mov ebp, esp
	xor eax, eax ; cnt
cmpi:
	mov ebx, dword [ebp+8]
	add ebx, eax
	mov dl, byte [ebx]
	cmp dl, 0
	je done
	add eax, 1
	jmp cmpi
done:
	leave
	ret

strlen:
	mov    eax,DWORD [esp+0x4]
	mov    edx,0x3
	and    edx,eax
	je     strlen.49
	jp     strlen.38
	cmp    BYTE [eax],dh
	je     strlen.182
	inc    eax
	cmp    BYTE [eax],dh
	je     strlen.182
	inc    eax
	xor    edx,0x2
	je     strlen.49
strlen.38:	
	cmp    BYTE [eax],dh
	je     strlen.182
	inc    eax
	xor    edx,edx
	strlen.49:	mov    ecx,DWORD [eax]
	add    eax,0x4
	sub    edx,ecx
	add    ecx,0xfefefeff
	dec    edx
	jae    strlen.153
	xor    edx,ecx
	and    edx,0x1010100
	jne    strlen.153
	mov    ecx,DWORD [eax]
	add    eax,0x4
	sub    edx,ecx
	add    ecx,0xfefefeff
	dec    edx
	jae    strlen.153
	xor    edx,ecx
	and    edx,0x1010100
	jne    strlen.153
	mov    ecx,DWORD [eax]
	add    eax,0x4
	sub    edx,ecx
	add    ecx,0xfefefeff
	dec    edx
	jae    strlen.153
	xor    edx,ecx
	and    edx,0x1010100
	jne    strlen.153
	mov    ecx,DWORD [eax]
	add    eax,0x4
	sub    edx,ecx
	add    ecx,0xfefefeff
	dec    edx
	jae    strlen.153
	xor    edx,ecx
	and    edx,0x1010100
	je     strlen.49
strlen.153:	
	sub    eax,0x4
	sub    ecx,0xfefefeff
	cmp    cl,0x0
	je     strlen.182
	inc    eax
	test   ch,ch
	je     strlen.182
	shr    ecx,0x10
	inc    eax
	cmp    cl,0x0
	je     strlen.182
	inc    eax
strlen.182:	
	sub    eax,DWORD [esp+0x4]
	ret 

main:
	push ebp
	mov ebp, esp
	
	push buff
	push fmts
	call scanf

	push buff
	call strlen

	push eax
	push fmtd
	call printf
	
	leave
	ret

section .data
	fmts db "%s",0
	fmtd db "%d",10,0
section .bss
	buff resb 1024

