all: greeting.asm
	nasm -f elf64 -g -F dwarf -o greeting.o greeting.asm
	gcc -no-pie -fno-pie -m64 -o greeting.out greeting.o
clean:
	rm greeting.out greeting.o
