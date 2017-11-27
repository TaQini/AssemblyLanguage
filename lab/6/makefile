rand: rand.o
	ld -dynamic-linker /lib/i386-linux-gnu/ld-2.19.so -o rand rand.o -lc -m elf_i386
rand.o: rand.s
	nasm -g -f elf32 -s rand.s -o rand.o
clean:
	rm rand.o
