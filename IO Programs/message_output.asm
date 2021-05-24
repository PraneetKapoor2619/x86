;21.05.2021
;
;A simple program in x86 to print out a hello world message on the screen
;nasm -f elf64 message_ouput.asm object.o
;ld object.o 
;./a.out

section .data
	str: db "1234", 0x0a, 0x0a
	str_len: equ $ - str
section .text

global _start

_start:
	mov eax, 0x04		;number for Linux write system call
	mov ebx, 0x01		;0x01 is file-descriptor for stdout: our standard output

	mov ecx, str		;starting address of our string
	mov edx, str_len 	;load string length
	int 0x80		;interrupt wakes the kernel to perform the system call

	mov eax, 0x01
	mov ebx, str_len
	int 0x80
