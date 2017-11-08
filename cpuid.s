.section .data
output: 
	.ascii "The processpr ID is 'XXXXXXXXXXXX' \n"

.section .text
.globl _start

_start: 
	movl $0, %eax
	cpuid ; cpuid -> eax

	; fill cpuid into output
	movl $output, %edi
	movl %ebx, 21(%edi)
	movl %edx, 25(%edi)
	movl %ecx, 29(%edi)
	
	; sys_write
	movl $4, %eax
	movl $1, %ebx ;stdout
	movl $output, %ecx
	movl $42, %edx
	int $0x80
	
	; sys_exit
	movl $1, %eax
	movl $0, %ebx
	int $0x80


