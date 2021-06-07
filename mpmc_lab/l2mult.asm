;2: program to multiply two 8-bit numbers using repetitive addition
    mov bx, 0500h       ;store 0500h into bx
    mov ax, 00h         ;store 00h into al
    mov dl, [bx]        ;move the value at address bx to dl
    mov cl, [bx + 1]    ;move the value at address bx + 1 to cl

check:                  
    cmp cl, 00h         ;compare cl and 00h   
    ja add_multiplicand ;if cl > 00h, jump to add_multiplicand
    je store_result     ;if cl = 00h, jump to store_result

add_multiplicand:
    adc al, dl          ;add al to dl and store sum in al 
    jc inax             ;jump to inax if carry is set
c1:
    dec cl              ;decrement cl
    jmp check           ;jump to check               
    
inax:
    inc ah              ;increment ah
    jmp c1              ;jump back to label c1

store_result:
    mov [bx + 2], al    ;store the value of al at address bx + 2  
    mov [bx + 3], ah
    hlt                 ;halt the execution       