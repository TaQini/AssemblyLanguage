lab1-1: a.o
	ld -dynamic-linker /lib/i386-linux-gnu/ld-2.19.so -o lab1-1 a.o -lc -m elf_i386
a.o: lab1-1.s
	nasm -f elf32 lab1-1.s -o a.o
clean:
	rm a.o
	rm lab1-1
