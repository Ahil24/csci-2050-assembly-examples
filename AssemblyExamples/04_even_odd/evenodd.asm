extern printf
extern scanf

global main

section .text

main:

  ; print the prompt

	mov	rdi, prompt       ; argument #1 (format string/message)
	mov	rax, 0
  call printf		          ; call printf

	; input the number

 sub rsp, 8			;16b-align the stack
	mov rdi, inputFormat    ; argument #1 (format string)
	mov rsi, number         ; argument #2 (address for resulting number)
	mov	rax, 0
	call scanf              ; call scanf

  ; divide the number by 2

  mov rdx, 0              	; faster, but equivalent:  xor rdx, rdx
	mov rax, qword [number]
  mov rcx, 2
	idiv rcx                ; rax = rax / 2

  cmp rdx, 0
  jne oddNumber

  ; print the 'The number is even'

evenNumber:
  mov	rdi, evenMessage    	; argument #1 (format string)
  mov rsi, qword [number] 	; argument #2 (number)
	mov	rax, 0
  call printf		        ; call printf

  jmp exit

  ; print the 'The number is odd'

oddNumber:
	mov	rdi, oddMessage ; argument #1 (format string)
  mov rsi, qword [number] 	; argument #2 (number)
	mov	rax, 0
  call printf		        ; call printf

	; exit

exit:
	mov rax, 0
	ret                     ; return 0

section .data

  prompt:       db "Enter a number: ", 0
  evenMessage:	db "%d is an even number.", 0xa, 0
  oddMessage:	  db "%d is an odd number.", 0xa, 0
  inputFormat:  db "%d", 0
  number:       dq 0
