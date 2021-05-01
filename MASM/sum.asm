.386
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\masm32rt.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32rt.lib

.DATA
	message db "Sum is : "
	jumpy db "this is a jump!!"
	value db 32
	pbuf dd value

.CODE
main:
	mov eax,200
	mov ebx, 600
	add eax,200
	add eax,400
	add eax, ebx
	mov pbuf, ustr$(eax)
	invoke StdOut,addr message
	invoke StdOut,pbuf 
	invoke ExitProcess, 0
	jmp short ompp
	
lol:
end main

ompp:
	invoke StdOut, addr jumpy
	invoke ExitProcess, 0
	jmp short lol
end ompp