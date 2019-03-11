all: evenodd.asm
	nasm -f elf64 -g -F dwarf -o evenodd.o evenodd.asm
	gcc -no-pie -fno-pie -m64 -o evenodd.out evenodd.o
clean:
	rm *.out *.o
