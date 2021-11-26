;25.05.2021
;
;A simple program to take two numbers as input from the user, add them and display the sum

section .data
	msg1: db "Enter the first number: "
	msg2: db "Enter the second number: "
	msg3: db "the sum is: "
	buff: times 128 db 0
	var1: dw 0
	

	len1: equ msg2 - msg1
	len2: equ msg3 - msg2
	len3: equ buff - msg3

section .text
global _start

_start:
	mov ecx, msg1
	mov edx, len1
	call _print
	call _stdin
	mov ecx, [buff]
	mov [var1], ecx

	mov ecx, msg2
	mov edx, len2
	call _print
	call _stdin
	mov ecx, [buff]
	add [var1], ecx
	
	mov ecx, msg3
	mov edx, len3
	call _print
	mov ecx, var1
	mov edx, 0x01
	call _print

	mov eax, 0x01
	mov ebx, [var1]
	int 0x80

_print:
	mov eax, 0x04
	mov ebx, 0x01
	int 0x80
	ret


_stdin: 
	mov eax, 0x03
	mov ebx, 0x00
	mov ecx, buff
	mov edx, 128
	int 0x80
	ret 
