#A simple program to add two numbers in x86 asm
.intel_syntax noprefix

.section .data

.section .text

.globl _start

_start:
	mov bl, 0x05
	add bl, 0x05
	

	#exit system call
	mov eax, 0x01
	int 0x80
