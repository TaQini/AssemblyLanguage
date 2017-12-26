dump: dump.o
	gcc -m32 -g -o dump dump.o -lc 
dump.o: dump.s
	nasm -g -f elf32 dump.s
clean:
	rm dump.o
	rm dump
	rm peda*
	rm .gdb*
