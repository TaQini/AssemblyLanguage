extern puts 
extern exit

section .data
	msgi db "hello",0x0
	msgj db 0x9,"world",0x0

section .text
	global _start

_start:
	push 0 ; i
	push 0 ; j
	push 0 ; msg
loopi:
	mov dword [esp+0x8], 0 ; i=0 
	jmp cmpi
opi:
	mov dword [esp], msgi
	call puts 
	add dword [esp+0x8], 1; i++
loopj:
	mov dword [esp+0x4], 0 ; j=0
	jmp cmpj
opj:
	mov dword [esp], msgj
	call puts
	add dword [esp+0x4], 1 ; j++
cmpj:
	cmp dword [esp+0x4], 2 ; j<2 ?
	jl opj
cmpi:
	cmp dword [esp+0x8], 4 ; i<4 ?
	jl opi
done:
	call exit
