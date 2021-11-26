;This is my first program in x86

section .data
	str: db "Hello, world!", 0x0a
	str_len: equ $ - str
section .text

global _start

_start: 
	mov eax, 0x04
	mov ebx, 0x01

	mov ecx, str
	mov edx, str_len
	int 0x80 

	mov eax, 1
	mov ebx, 0
	int 0x80
