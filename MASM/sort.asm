    .486                                    ; create 32 bit code
    .model flat, stdcall                    ; 32 bit memory model
    option casemap :none                    ; case sensitive
 
    include \masm32\include\windows.inc     ; always first
    include \masm32\macros\macros.asm       ; MASM support macros

  ; -----------------------------------------------------------------
  ; include files that have MASM format prototypes for function calls
  ; -----------------------------------------------------------------
    include \masm32\include\masm32.inc
    include \masm32\include\gdi32.inc
    include \masm32\include\user32.inc
    include \masm32\include\kernel32.inc

  ; ------------------------------------------------
  ; Library files that have definitions for function
  ; exports and tested reliable prebuilt code.
  ; ------------------------------------------------
    includelib \masm32\lib\masm32.lib
    includelib \masm32\lib\gdi32.lib
    includelib \masm32\lib\user32.lib
    includelib \masm32\lib\kernel32.lib

    .data
    ; --------------------------
    ; initialise 10 DWORD values
    ; --------------------------
      itm0  dd 45678902h
      itm1  dd 78076788h
      itm2  dd 9008123ah
      itm3  dd 345678abh
      itm4  dd 12345678h
      itm5  dd 54337641h
      itm6  dd 0a2b1c3d4h
      itm7  dd 28346532h
      itm8  dd 12345677h
      itm9  dd 718293a4h
    ; ---------------------------------
    ; put their addresses into an array
    ; ---------------------------------
      array dd itm0,itm1,itm2,itm3,itm4
            dd itm5,itm6,itm7,itm8,itm9

    .code                       ; Tell MASM where the code starts

start: 
	call main
	
	exit

main proc
	LOCAL cnt :DWORD				;a local loop counter
	LOCAL var :DWORD				;a variable to store the smallest number encountered at an iteration stage
	
	push eax
	push ebx
	push esi
	push edi
	
	mov cnt, 10					;set the counter to 10
	
	mov edi, array				;store the base address of the array in edi register
	xor esi, esi					;esi register will be used as index. Here set to zero.
	
	mov eax, [edi]
	mov var, eax
	label1:
		mov ebx, [edi + esi*4]
		
		cmp ebx, var
		jnc label11
		mov var, ebx
		
		label11:
		add esi, 1				;increment index by 1
		sub cnt, 1				;subtract 1 from cnt
		jnz label1				;if the result is not zero, jump to label1:
		
	print chr$(13, 10, 0)
	print chr$("Value in EAX register: ")
	mov eax, var
	print uhex$(eax)
	print chr$(13, 10, 0)
	print chr$("Value at location 200h: ")
	print uhex$(var)
	print chr$(13, 10, 0)
	mov eax, var
	mov DS:[200h], eax
	mov ebx, [200h]
main endp

end start