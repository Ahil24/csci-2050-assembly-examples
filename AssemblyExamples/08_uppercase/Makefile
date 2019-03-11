all: uppercase.asm
	nasm -f elf64 -g -F dwarf -o uppercase.o uppercase.asm
	gcc -no-pie -fno-pie -m64 -o uppercase.out uppercase.o
clean:
	rm *.out *.o
