lab1-2: a.o libmul.so
	ld -dynamic-linker /lib/i386-linux-gnu/ld-2.19.so -o lab1-2 -lc -L ./ -l mul a.o -m elf_i386
a.o: lab1-2.s
	nasm -s lab1-2.s -o a.o -f elf32
libmul.so: mul.c
	gcc mul.c -o libmul.so -shared -m32 -fPIC
clean:
	rm ./a.o
	rm ./lab1-2
	rm ./libmul.so
	rm ./libmul.conf
config:
	pwd > ./libmul.conf
	# install shared library
	sudo mv ./libmul.conf /etc/ld.so.conf.d/
	sudo ldconfig
