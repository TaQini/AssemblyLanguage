#!/bin/sh
nasm -f elf32 a.s -o a.o
ld -s -o a.out a.o -m elf_i386
# TaQini :D
