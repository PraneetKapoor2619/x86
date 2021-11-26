;1(a)program in 8086 assembly to add two 16 bit numbers without carry
    mov bx, 0500h           ;store the 0500h into bx       
    mov ax, [bx]            ;store the value stored at address bx to ax
    mov dx, [bx + 2]        ;store the value stored at address bx + 2 to dx
    sub ax, dx              ;subtract dx from ax and store the result in ax
    mov [bx + 4], ax        ;store the value of ax at address bx + 4
    hlt                     ;halt the execution