;22.05.2021
;
;This is a simple program to display multiple messages on a screen using write system call

section .data
	msg1: db "Hello. This a program", 0x0a
	msg2: db "This is the second line in our code", 0x0a

	len1: equ msg2 - msg1	;length of msg1 = msg2 - msg1
	len2: equ $ - msg2	;length of msg2 = msg_end - msg2

section .text
global _start

_start:

	mov ecx, msg1		;starting address of msg1
	mov edx, len1
	call _print		;call to print subroutine which sets up eax and ebx for system write call to stdout
	int 0x80		;system wake call

	mov ecx, msg2		;starting address of msg2
	mov edx, len2
	call _print
	int 0x80
	
	mov eax, 0x01		;system call for exit
	mov ebx, 0x00		;return 0
	int 0x80

_print:
	mov eax, 0x04		;system call for write
	mov ebx, 0x01		;file descriptor for stdout (standard output stream)
	ret
