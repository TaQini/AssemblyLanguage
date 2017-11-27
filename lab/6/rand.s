extern scanf
extern printf
extern exit
section .text
	global _start
section .data
	astr db '%d',0
	amax dd 0
	amin dd 0
rand:
	push ebp
	mov ebp, esp
	rdtsc
	xor edx, edx
	mov ebx, [ebp+0x8] ; amax
	mov ebx, [ebx]
	div ebx
	mov eax, edx
	mov ebx, [ebp+0xc] ; amin
	add eax, [ebx]
	leave
	ret
_start:
	push ebp
	mov ebp, esp
	; scanf("%d",&amin)
	push amin
	push astr
	call scanf
	; scanf("%d",&amax)
	mov dword [esp+0x4], amax
	call scanf
	; rnd = rand(amax,amin)
	push amin
	push amax
	call rand
	; printf("%d",rnd)
	push eax
	push astr
	call printf
	; exit(0)
	push 0
	call exit

