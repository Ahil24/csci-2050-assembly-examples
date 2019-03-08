# CSCI-2050U Computer Architecture
Here you will find all of the assemly language examples covered in lectures. 

## Evironment Setup
All examples have been implemented on linux. Students are expected to use WSL if using Windows or if on Mac install the equivalent packages.

#### Update System
```bash
$ sudo apt update
$ sudo apt upgrade
```

#### Install Packages
```bash
$ sudo apt install build-essential nasm gdb
```
## Running Assembly Programs
Each example `.asm` program will have an associated Makefile.

#### Compiling
```bash
$ make
```

#### Executing
```bash
$ ./program_name
```

It's also good practice to clear out old exectuable and object files with `make clean` before compiling the program again. 
