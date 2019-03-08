all: debug.asm
	nasm -f elf64 -g -F dwarf -o debug.o debug.asm
	gcc -no-pie -fno-pie -m64 -o debug.out debug.o
clean:
	rm *.out *.o
