#21.05.2021
#A simple program to print a message on the screen using Linux system call

.intel_syntax noprefix

.section data
	msg db "Hello, world", 0x0a
	len equ $ - msg
		
.section text

.globl _start

_start: 
	#system call for write
	mov eax, 0x04
	#first argument: file descriptor for stdout
	mov ebx, 0x01
	#second argument: the message itself
	mov ecx, msg
	#third argument: length of message
	mov edx, len
	int 0x80

	#exit system call
	mov eax, 1
	mov ebx, 0
	int 0x80
