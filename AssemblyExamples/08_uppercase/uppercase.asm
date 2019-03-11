extern printf
extern scanf

global main

section .text

uppercase:
  ; put the important characters into registers (for efficiency)
  mov al, [a]
  mov ah, [z]
  mov bl, [capA]

nextChar:
  mov bh, 0 ; debugging
  mov dl, [rdi]

  ; check for the null terminator
  cmp byte [rdi], 0
  je endOfString
  mov bh, 1

  ; check if it is before 'a' in the ASCII table
  cmp [rdi], al
  jb skipThisChar
  mov bh, 2

  ; check if it is after 'z' in the ASCII table
  cmp [rdi], ah
  ja skipThisChar
  mov bh, 3

  ; the character is a lowercase letter, so convert it
checkpoint:
  sub [rdi], al
  add [rdi], bl

skipThisChar:
  inc rdi
  jmp nextChar

endOfString:
  ret

main:
  ; print the prompt
	mov	rdi, prompt         ; argument #1 (format string/message)
	mov	rax, 0
  call printf		          ; call printf

  ; input string
  sub rsp, 8			; 16-align the stack
  	mov rdi, inputFormat	; argument #1 (format string)
	mov rsi, string       	; argument #2 (address for resulting string)
	mov	rax, 0
	call scanf            	; call scanf

  ;call fgets

  ; convert to uppercase
  mov rdi, string      ; argument #1 (string)
  call uppercase

  ; print the result
	mov	rdi, outputFormat ; argument #1 (format string)
	mov rsi, string       ; argument #2 (name)
	mov	rax, 0
  call printf		        ; call printf

	; exit
	mov rax, 0
	ret                     ; return 0

section .data

  prompt:       dd "Enter a string: ", 0
	inputFormat:  db "%s", 0
  outputFormat: dd "The resulting string is: %s", 0xa, 0
  a:            dd 'a'
  capA:         dd 'A'
  z:            dd 'z'

section .bss
  string:         resb 100
