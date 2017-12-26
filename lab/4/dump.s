global main
extern scanf, printf, write

section .text
dump:
	push ebp
	mov ebp, esp

	mov esi, dword [esp+0xc]  ; src
	mov edi, dword [esp+0x8]  ; buf
	mov edx, dword [esp+0x10] ; dst
cp:
	mov cl, byte [esi]
	mov byte [edi], cl
	add esi, 1
	add edi, 1
	cmp esi, edx
	jne cp

	leave
	ret

main:
	push ebp
	mov ebp, esp
	
	; printf("addr = %p: %s", srcData, srcData)
	push srcData
	push srcData
	push szfmt2
	call printf
	add esp, 4*3

	; scanf("%x",NumA)
	push NumA
	push szfmt
	call scanf

	; NumB
	mov dword [esp+0x4], NumB
	call scanf
	add esp, 4*2

	; dump(buf, src, dst)
	mov eax, [NumA]
	mov edx, [NumB]
	push edx
	push eax
	push dumpArea
	call dump
	add esp, 4*3

	; printf(fmt3, dumpArea)
    push dumpArea
    push szfmt3
    call printf
    add esp, 4*2

	; write(1, dumpArea, NumB-NumA)
	mov eax, [NumB]
	sub eax, [NumA]
	push eax
	push dumpArea
	push 0x1
	call write

	leave
	ret

section .data
	szfmt db "%x",0
	srcData db "1234567890abcdefghijklmnopqrstuvwxyz",0
	padding db "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",0
	szfmt2 db "addr = %p: %s",0xa,0
	szfmt3 db "[dumpdata]=[%p]: ",0xa,0
section .bss
	NumA resd 1
	NumB resd 1
	dumpArea resb 1024
