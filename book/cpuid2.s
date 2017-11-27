extern printf 
extern exit
section .data 
	output db "The processpr Vendor ID is '%s'.",0xa,`\x00`
section .bss
	buffer resb 12
section .text
	global _start

_start: 
	mov eax, 0 ;movl $0, %eax
	cpuid

	mov edi, buffer ; cpuid -> buffer
	mov [edi], ebx 
	mov [edi+4], edx
	mov [edi+8], ecx

;	mov ecx, 0xa
;	mov edi, output
;	mov [edi+43], ecx
	
	push buffer
	push output
	call printf

	add esp, 8 ; balance stack

	push 0
	call exit
