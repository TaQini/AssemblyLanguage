gtk-firstwin: gtk-firstwin.o    
	g++ -o gtk-firstwin gtk-firstwin.o `pkg-config --cflags --libs gtk+-3.0`

gtk-firstwin.o: gtk-firstwin.asm
	nasm -g -f elf gtk-firstwin.asm 
clean:
	rm peda*
	rm .gdb*
	rm *.o
	rm gtk-firstwin
