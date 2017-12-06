combo: combo.o
	ld -m elf_i386 -o combo combo.o -L/usr/lib -L /usr/lib/gtk-2.0 -I/lib/ld-linux.so.2 -lc -lgtk-2.0-0 -lgdk-2.0-0
	# `pkg-config --cflags --libs gtk+-2.0`
	# -lgtk2 -lgdk2
	#ld -dynamic-linker /lib/i386-linux-gnu/ld-2.19.so -o a.out a.o -lc -m elf_i386
combo.o: combo.s
	nasm -o combo.o -f elf32 -l combo.lst -g combo.s
clean:
	rm *.o
	rm *.out
