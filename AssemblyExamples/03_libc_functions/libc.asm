extern printf
extern scanf

global main

section .text

main:

  ; print the prompt

	mov	rdi, prompt       ; argument #1 (format string/message)
	mov	rax, 0
  call printf		        ; call printf

	; input the number

  sub rsp, 8                  ; 16b-align the stack
  	mov rdi, inputFormat  ; argument #1 (format string)
	mov rsi, number       ; argument #2 (address for resulting number)
	mov	rax, 0
	call scanf            ; call scanf

  ; square the number

	mov rax, qword [number]
	mul rax               ; rax = rax * rax   (ignoring overflow into rdx)

  ; print the result

	mov	rdi, outputFormat ; argument #1 (format string)
	mov rsi, rax          ; argument #2 (number)
	mov	rax, 0
  call printf		        ; call printf

	; exit

	mov rax, 0
	ret                  ; return 0

section .data

  prompt:       db "Enter a number: ", 0
	outputFormat:	db "The result is %d.", 0xa, 0
	inputFormat:  db "%d", 0
	number:       dq 0
