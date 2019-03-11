extern printf
extern scanf

global main

section .text

; Fibonacci sequence:  (0,0), (1,1), (2,1), (3,2), (4,3), (5,5), (6,8), (7,13), (8,21), ...

main:
  ; print the prompt

	mov	rdi, prompt         ; argument #1 (format string/message)
	mov	rax, 0
  call printf		          ; call printf

	; input n

  sub rsp, 8			; 16b-align stack
	mov rdi, inputFormat    ; argument #1 (format string)
	mov rsi, n              ; argument #2 (address for n)
	mov	rax, 0
	call scanf              ; call scanf

  ; calculate the nth fibonacci number

  mov rdx, 0              ; Fibonacci 0 = 0
  mov rcx, 1              ; Fibonacci 1 = 1
  mov rbx, 1              ; i = 1

fibLoop:                  ; do
  mov rsi, rcx            ;   remember previous Fibonacci
  add rcx, rdx            ;   calculate next Fibonacci
  mov rdx, rsi            ;   move previous Fibonacci to F(n-1)

  inc rbx                 ;   i++
  cmp rbx, qword [n]      ; while rbx != n
  jne fibLoop

  ; print the result

  mov	rdi, resultFormat   ; argument #1 (format string)
  mov rsi, qword [n]      ; argument #2 (n)
  mov rdx, rcx            ; argument #3 (the nth Fibonacci number)
	mov	rax, 0
  call printf		          ; call printf

	; exit

exit:
	mov rax, 0
	ret                     ; return 0

section .data

  prompt:       db "Enter a number: ", 0
  resultFormat:	db "Fibonacci #%d is %d.", 0xa, 0
	inputFormat:  db "%d", 0
	n:            dq 0
