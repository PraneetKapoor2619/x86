;1(a)program in 8086 assembly to add two 16 bit numbers without carry
    mov bx, 0500h       ;move 0500h to bx
    mov ax, [bx]        ;store the value at address bx to ax 
    mov dx, [bx + 2]    ;store the value at address bx + 2 to dx
    add ax, dx          ;add ax and dx and store the sum in ax
    mov [bx + 4], ax    ;store the value of ax at address bx + 4
    hlt                 ;halt the execution