b: b.o
	ld -dynamic-linker /lib/i386-linux-gnu/ld-2.19.so -o b -lc b.o -m elf_i386
b.o: b.s
	nasm -s b.s -o b.o -f elf32
a: a.c
	gcc -m32 a.c -o a
clean:
	rm b.o
	rm a
	rm b
