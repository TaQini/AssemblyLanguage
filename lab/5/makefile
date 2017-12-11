strlenASM: a.o
	gcc -m32 -lc a.o -o strlenASM
a.o: strlen.s
	nasm -s strlen.s -o a.o -f elf32
strlenC: strlen.c
	gcc -m32 --static strlen.c -o strlenC
clean:
	rm a.o
	rm strlenASM
	rm strlenC
	rm peda*
	rm .gdb*
