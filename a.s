section .data 
	output db "The processpr Vendor ID is 'XXXXXXXXXXXX'."
section .text
	global _start

_start: 
	mov eax, 0 ;movl $0, %eax
	cpuid

	mov edi, output ;movl $output, %edi
	mov [edi+28], ebx ;movl %ebx, 21(%edi)
	mov [edi+32], edx ;movl %edx, 25(%edi)
	mov [edi+36], ecx ;movl %ecx, 29(%edi)

	; sys_write(1,output,42);
	mov ebx, 1 ;movl $1, %ebx
	mov ecx, output ;movl $output, %ecx
	mov edx, 42 ;movl $42, %edx

	mov eax, 4 ;movl $4, %eax
	int 0x80 ;int $0x80
	
	; sys_exir(0)
	mov ebx, 0 ;movl $0, %ebx
	mov eax, 1 ;movl $1, %eax
	int 0x80 ;int $0x80

