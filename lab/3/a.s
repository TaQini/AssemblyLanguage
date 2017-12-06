	LENGTH equ 128
section .bss
	buf resb LENGTH
section .text
	global _start
	extern printf
	extern read
section .data
	a db -1.2
	fmt db "23333333"
input:
	push ebp
	mov ebp, esp
	push LENGTH
	push buf
	push 0
	call read
	leave
	ret

output:
	push ebp
	mov ebp, esp
	push buf
	push fmt
	call printf
	leave
	ret

calc:
	push ebp
	mov ebp, esp
	nop
	leave
	ret

_start:
	push ebp
	mov ebp, esp
	;call input
	;call calc
	;call output

	mov eax, a
	mov ebx, 3

	leave
	ret

