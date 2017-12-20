c: calc.c
	gcc -g calc.c -o c `pkg-config --cflags --libs gtk+-3.0`
asm: calc.o
	g++ -o asm calc.o `pkg-config --cflags --libs gtk+-3.0`
calc.o: calc.s
	nasm -g -f elf calc.s
