;Program to compute the factorial of a number
    mov bx, 0500h          ;store 0500h in bx
    mov ax, 0001h          ;store 0001h in ax
    mov cx, [bx]           ;store the value at address bx into cx
    
check:
    cmp cx, 0000h          ;compare cx with 0000h
    ja multiply            ;if cx > 0000h, jump to multiply
    je stop                ;if cx = 0000h, jump to stop
                                                        
multiply:
    mul cx                 ;multilply ax and cx and store the product in ax
    dec cx                 ;decrement cx
    jmp check              ;jump to check

stop:
    mov [bx + 2], ax       ;store the value of ax at address bx + 2
    hlt                    ;halt the execution