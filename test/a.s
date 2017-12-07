section .text
	global _start

_start:
	mov eax, 1
	mov ebx, 2
	mov ecx, 3
	mov edx, 4

	int 0x3
	int 0x3
	int 0x3
	int 0x3

	mov eax, 1
	mov ebx, 0 
	int 0x80

