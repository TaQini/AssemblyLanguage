extern exit
section .bss
	buf resb 12
section .text
	global _start
_start:
	mov eax, 8192
	xor edx, edx
	xor ecx, ecx
	mov ebx, 10
a10:
	div ebx
	push edx
	inc ecx
	xor edx, edx
	cmp eax, edx
	jnz a10
	mov edi, buf
a20:
	pop eax 
	add al, '0'
	mov [edi], al
	inc edi
	loop a20
	mov byte [edi], 0 

