#tell the assembler that we are using Intel syntax and not the default AT&T syntax
.intel_syntax noprefix

.section .data

.section .text

.globl _start

#program entry point
_start:
	#Linux kernel command number for exiting a program is 1 in eax register
	mov eax, 1
	
	#status number to be returned to the operating system
	mov ebx, 0x41
	
	#int 0x80h will wake up the system to run exit program command
	#in Intel syntax, use 0x80 else the assembler will throw a "junk h error"
	int 0x80
