#PURPOSE: Simple program that exits and returns a status code back to the linux kernel

#INPUT
#	none

#OUTPUT
#	returns a status code. This can viewed by typing
#		echo$?
#	after running the program

#VARIABLES
#	%eax: holds the system call number
#	%ebx: holds the return status

.section .data

.section .text

.globl _start

_start: 
	mov $1, %eax 		#this is the linux kernel command number for exiting a program

	mov $41, %ebx		#this is the status number we will be returning to the OS. 
				#if we change this, we get different things upon echoing

	int $0x80		#this wakes up the system to run the exit command
