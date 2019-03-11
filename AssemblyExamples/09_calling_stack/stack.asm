extern printf
extern scanf

global main

section .text


add4:
  mov rax, [rsp+8]
  add rax, [rsp+16]
  add rax, [rsp+24]
  add rax, [rsp+32]

gotArg:

  ret 32

main:

  ; experiments with calling stack data

beforeArgs:

  push qword 0x1          ; argument #1
  push qword 0x2          ; argument #2
  push qword 0x3          ; argument #3
  push qword 0x4          ; argument #4

beforeCall:

  call add4

afterCall:

  push rax                ; only to align the rsp register to 16 bytes
  mov rdi, resultFormat
  mov rsi, rax
  call printf
  pop rax                 ; clean up the stack

  ; exit

exitProgram:
  mov rax, 0
  ret                     ; return 0

section .data

  resultFormat:	db "The sum is %d.", 0xa, 0
