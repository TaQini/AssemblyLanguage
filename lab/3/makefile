c: calc.c
	gcc -g calc.c -o c `pkg-config --cflags --libs gtk+-3.0`
asm: calc.o
	gcc -g -o asm calc.o -lc `pkg-config --cflags --libs gtk+-3.0`
calc.o: calc.s
	nasm -g -f elf calc.s
clean:
	rm c
	rm asm
	rm *.o
	rm peda*
	rm .gdb
