a.out: a.o
	ld -o a.out a.o -m elf_i386
a.o: a.s
	nasm -g -f elf32 -s a.s -o a.o
clean:
	rm *.o
	rm *.out
