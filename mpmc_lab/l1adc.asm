;1(a)program in 8086 assembly to add two 16 bit numbers without carry
    mov bx, 0500h       ;store 0500h into bx
    mov ax, [bx]        ;move the contents at address bx to ax
    mov dx, [bx + 2]    ;move the contents at address bx + 2 to dx
    adc ax, dx          ;add ax and dx with carry flag and store the sum in ax
    mov [bx + 4], ax    ;store the value of ax at address bx + 4
    hlt                 ;halt the execution