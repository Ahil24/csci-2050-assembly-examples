all: 01a_hello.asm
	nasm -f elf64 -g -F dwarf -o hello.o 01a_hello.asm
	gcc -nostdlib -m64 -o hello.out hello.o
clean: 
	rm hello.out hello.o
