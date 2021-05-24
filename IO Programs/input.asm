;24.05.2021
;
;In this program I will try to input a number and then display it on screen
;
;PROCEDURE
;system read : 0x03 -> no. for read system call
;0x00 -> file descriptor for stdin (standard input), which I am assuming is my keyboard

section .data
	msg1: db "Enter a number: "
	msg2: db "The number that you entered is: "
	buff: times 128 db 0 		;allocate 128 bytes with default value 0

	len1: equ msg2 - msg1
	len2: equ buff - msg2

section .text
global _start

_start:
	mov ecx, msg1			;store the starting address of data string msg1 in ecx.
					;This is actually analogous to the arrays in C. In C, the name of the array is a pointer
					;to the address where the first element is stored. Same is the case here.
					;This shows that C is just a beautified version of assembly language.

	mov edx, len1			;store the length of data string msg1 in edx
	call _print			;call print, which prints the string using write system call in Linux

	call _stdin			;call stdin, which sets eax, ebx, ecx, edx so as to take input from stdin (standard input
					;which is our keyboard in this case, and store it in a buffer of size 128 bytes.

	mov ecx, msg2			;print msg2
	mov edx, len2
	call _print

	mov ecx, buff			;print the buffer
	mov edx, 128
	call _print

	mov ecx, 0x0a			;print '\n". Its ASCII is 0x0a
	mov edx, 0x01
	call _print

	mov eax, 0x01			;exit system call
	mov ebx, 0x00			;return 0
	int 0x80			;wake up the Kernel to perform the system call

_print:
	mov eax, 0x04			;write system call
	mov ebx, 0x01			;store ebx with file descriptor for stdout (standard output): 0x01
	
	int 0x80			;wake up the Kernel to perform the system call
	ret				;return back to the calling address

_stdin:
	mov eax, 0x03			;read system call
	mov ebx, 0x00			;store ebx with file descriptor for stdin (standard input): 0x00
	
	mov ecx, buff			;store the starting address of buffer in ecx. The string entered from stdin will be
					;stored in buff.
	mov edx, 128			;store the size of buff in edx. In this case, buff can store 128 bytes
	
	int 0x80			;wake up the Kernel to perform the system call
	ret				;return back to the calling address
