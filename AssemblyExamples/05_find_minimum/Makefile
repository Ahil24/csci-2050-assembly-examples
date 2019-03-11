all: find_min.asm
	nasm -f elf64 -g -F dwarf -o find_min.o find_min.asm
	gcc -no-pie -fno-pie -m64 -o find_min.out find_min.o
clean:
	rm *.out *.o
