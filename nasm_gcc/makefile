a.out: a.o
	gcc -m32 a.o -o a.out
a.o: a.s
	nasm -g -s a.s -o a.o -f elf32
clean: 
	rm a.o
	rm a.out
	rm peda*
	rm .gdb*
