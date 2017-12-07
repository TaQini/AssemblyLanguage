a: a.o
	ld -dynamic-linker /lib/i386-linux-gnu/ld-2.19.so -o a.out a.o -lc -m elf_i386
a.o: a.s
	nasm -o a.o -f elf32 -g a.s -f elf32
clean:
	rm *.o
	rm *.out
