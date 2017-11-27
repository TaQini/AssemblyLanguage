a.out: a.o
	ld -dynamic-linker /lib/i386-linux-gnu/ld-2.19.so -o a.out a.o -lc -m elf_i386
a.o: a.s
	nasm -g -f elf32 a.s -o a.o
clean:
	rm a.out
	rm a.o
