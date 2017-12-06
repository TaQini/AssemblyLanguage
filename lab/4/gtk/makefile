gtk-firstwin: gtk-firstwin.o    
	g++ -m32 -o gtk-firstwin gtk-firstwin.o `pkg-config --cflags --libs gtk+-3.0`

gtk-firstwin.o: gtk-firstwin.asm
	nasm -g -f elf32 gtk-firstwin.asm 

clean:
	rm gtk-firstwin
	rm gtk-firstwin.o
