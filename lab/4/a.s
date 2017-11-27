; dump to file
section .bss
	buff resb 16
section .data
	dat db "AAAAAAAABBBBBBBB"
section .text
	global _start

_start:
	mov edi, buff
	mov esi, dat
	mov ecx, 4
	;mov ebx, 0xcccccccc
	rep movsb

