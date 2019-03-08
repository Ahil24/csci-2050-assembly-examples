extern printf
extern scanf

global main

section .text

main:

  ; print the prompt

	mov	rdi, prompt       ; argument #1 (format string/message)
	mov	rax, 0
  call printf		        ; call printf

	; input the user's name

  sub rsp, 8                  ; 16b-align the stack
  	mov rdi, inputFormat  ; argument #1 (format string)
	mov rsi, name         ; argument #2 (address for resulting name)
	mov	rax, 0
	call scanf            ; call scanf

  ; print the greeting

	mov	rdi, outputFormat ; argument #1 (format string)
	mov rsi, name         ; argument #2 (name)
	mov	rax, 0
  call printf		        ; call printf

	; exit

	mov rax, 0
	ret                  ; return 0

section .data          ; data is for initialized data

  prompt:       db "What is your name? ", 0
	outputFormat:	db "Hello, %s!", 0xa, 0
	inputFormat:  db "%s", 0
	number:       dq 0

section .bss           ; bss is for uninitialized data
  name:         resb 50
