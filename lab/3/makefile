a: a.o
	ld -o a a.o -m elf_i386 -dynamic-linker /lib/i386-linux-gnu/ld-2.19.so -lc
a.o: a.s
	nasm -s a.s -o a.o -f elf32
clean:
	rm a
	rm a.o
	rm peda*
	rm .gdb*
