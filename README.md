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

##### .data 數據聲明
```
      db    0x55                ; just the byte 0x55 
      db    0x55,0x56,0x57      ; three bytes in succession 
      db    'a',0x55            ; character constants are OK 
      db    'hello',13,10,'$'   ; so are string constants 
      dw    0x1234              ; 0x34 0x12 
      dw    'a'                 ; 0x61 0x00 (it's just a number) 
      dw    'ab'                ; 0x61 0x62 (character constant) 
      dw    'abc'               ; 0x61 0x62 0x63 0x00 (string) 
      dd    0x12345678          ; 0x78 0x56 0x34 0x12 
      dd    1.234567e20         ; floating-point constant 
      dq    0x123456789abcdef0  ; eight byte constant 
      dq    1.234567e20         ; double-precision float 
      dt    1.234567e20         ; extended-precision float
```
> 注意：使用轉義符須用反引號 \`\` 包圍，如：
```
`\x0a` = \n
```


##### 定義起始點
 > \_start

##### 動態鏈接
```asm
extern printf ; 聲明外部的函數（符號）名
extern exit
```

```
$ ld -dynamic-linker /lib/i386-linux-gnu/ld-2.19.so -o cpuid -lc a.o -m elf_i386
```


