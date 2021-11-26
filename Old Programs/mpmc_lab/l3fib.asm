;Program to generate Fibonacci Series
    mov bx, 0500h           ;store 0500h into bx          
    mov cl, [bx]            ;store the value at address bx into cl
    sub cl, 02h             ;decrement cl by 2 as two terms are already there

check:
    cmp cl, 00h             ;compare cl with 00h
    ja generate             ;if cl > 00h, jump to generate
    je stop                 ;if cl = 00h, jump to stop
    
generate:
    inc bx                  ;increment bx
    mov al, [bx]            ;store the value at address bx into al
    mov dl, [bx + 1]        ;store the value at address bx + 1 into dl
    add al, dl              ;add al and dl; store the sum in al
    mov [bx + 2], al        ;store value of al at address bxx + 2
    dec cl                  ;decrement cl
    jmp check               ;jump to check
            
stop:
    hlt                     ;halt the execution