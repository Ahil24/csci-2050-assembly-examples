all: fibonacci.asm
	nasm -f elf64 -g -F dwarf -o fibonacci.o fibonacci.asm
	gcc -no-pie -fno-pie -m64 -o fibonacci.out fibonacci.o
clean:
	rm *.out *.o
