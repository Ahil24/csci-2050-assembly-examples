all: 01a_hello.asm
	/usr/local/bin/nasm -f macho64 01a_hello.asm
	ld -macosx_version_min 10.7.0 -lSystem -o 01a_hello.out 01a_hello.o
clean: 
	rm *.out *.o
