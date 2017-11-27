extern exit
section .data
	sum dd 0
section .text
	global _start
_start:
	nop
	call sub1
	nop
	call exit
sub1:
	pusha
	nop
	nop
	popa
	ret

