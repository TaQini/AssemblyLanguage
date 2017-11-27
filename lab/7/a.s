section .data
	f1 dd 0
	f2 dd 0
	err db "File open failed.",0
	ok db "一样",0
	SIZE equ 128
section .bss
	buf1 resb SIZE
	buf2 resb SIZE
section .text
	global _start
_start:
	push ebp
	mov ebp, esp
	mov eax, [ebp+12] ; file1
	mov ebx, [ebp+16] ; file2
	mov ecx, f1
	mov [ecx], eax
	mov edx, f2
	mov [edx], ebx
	
	; open(arg1,O_RDONLY,0644)
	mov eax, 0x5
	mov ebx, dword [ebp+12]
	mov ecx, 00
	mov edx, 0644
	int 0x80
	test eax, eax
	js failed
	push eax ; fd of filea

	; open(arg2,O_RDONLY,0644)
	mov eax, 0x5
	mov ebx, dword [ebp+16]
    mov ecx, 00
    mov edx, 0644
	int 0x80
	test eax, eax
	js failed
	push eax ; fd of fileb

	; read(fd,buf1,128)
	mov eax, 0x3
	mov ebx, dword [esp+4]
	mov ecx, buf1
	mov edx, 128
	int 0x80
	test eax, eax
	js failed

	; read(fd,buf2,128)
	mov eax, 0x3
	mov ebx, dword [esp]
	mov ecx, buf2
	mov edx, 128
	int 0x80
	test eax, eax
	js failed

	call compare
	call exit

failed:
	mov eax, 4 
	mov ebx, 1
	mov ecx, err
	mov edx, 18
	int 0x80
	call exit

exit:
	mov eax, 1
	mov ebx, 0
	int 0x80	

compare:
	push ebp
	mov ebp, esp
	sub esp, 8
	mov dword [ebp+4],  0 ; line

	nop
	mov esi, buf1
	mov edi, buf2

loopi:
	mov dword [ebp+8], 0 ; i
	jmp cmpi
opi:
	nop
	mov eax, esi ; filea
	mov ebx, edi ; fileb
	add eax, ecx
	mov al, byte [eax]
	add ebx, ecx
	mov bl, byte [ebx]
	cmp al, bl
	jne diffent
cmpl:
	cmp al, 0xa ; \n
	je opl
	jmp donel
opl:
	add dword [ebp+4], 1 ; line++
donel:
	add dword [ebp+8], 1 ; i++
cmpi:
	mov ecx, dword [ebp+8]
	;mov eax, ecx
	;add eax, esi
	;cmp [eax], 0
	;je donei
	;mov eax, ecx
	;add eax, edi
	;cmp [eax], 0 
	;je donei
	cmp ecx, SIZE
	jb opi
different:
	mov eax, dword [ebp+4] ; eax <- line
	add eax, 1
	leave
	ret
donei:
	leave
	ret

