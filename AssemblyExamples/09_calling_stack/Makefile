all: stack.asm
	nasm -f elf64 -g -F dwarf -o stack.o stack.asm
	gcc -no-pie -fno-pie -m64 -o stack.out stack.o
clean:
	rm *.out *.o
