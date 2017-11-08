#!/bin/sh
gcc mul.c -o libmul.so -shared -m32 -fPIC
nasm -s lab1.s -o a.o -f elf32
ld -dynamic-linker /lib/i386-linux-gnu/ld-2.19.so -o lab1 -lc -L ./ -l mul a.o -m elf_i386
LD_LIBRARY_PATH=./ ./lab1
rm a.o
rm ./lab1
rm ./libmul.so
