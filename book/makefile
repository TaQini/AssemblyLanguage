cpuid: cpuid.o
	ld -s -o cpuid cpuid.o -m elf_i386
cpuid.o: cpuid.s
	nasm -f elf32 cpuid.s -o cpuid.o
cpuid2: cpuid2.o
	ld -dynamic-linker /lib/i386-linux-gnu/ld-2.19.so -o cpuid2 cpuid2.o -lc -m elf_i386
cpuid2.o: cpuid.s
	nasm -f elf32 cpuid2.s -o cpuid2.o
clean:
	rm *.o
	
