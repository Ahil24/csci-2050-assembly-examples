all: libc.asm
	nasm -f elf64 -g -F dwarf -o libc.o libc.asm
	gcc -no-pie -fno-pie -m64 -o libc.out libc.o
clean:
	rm *.out *.o
