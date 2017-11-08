# 32-bit ASM in 64-bit linux 

## Tools 
```
$ nasm -f elf32 a.s
```
```
$ ld -s -o a.out a.o -m elf_i386
```

## Learn IA-32 ASM

### 程序的組成
#### 常用段
 - .data
 - .bss
 - .text

##### 定義段
 > .section

##### 定義起始點
 > \_start
