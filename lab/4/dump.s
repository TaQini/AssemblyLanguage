; dump to file
section .bss
	buff revb 0x48

section .text
	golbal _start

_start:
	lea edi, buff
	mov ecx, 0x12
	mov eax, 0xcccccccc
	rep stos dword ptr [edi]

