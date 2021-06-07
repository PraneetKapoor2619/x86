;1(b)program in 8086 assembly to subtract two 16 bit numbers with borrow
    mov bx, 0500h       ;store 0500h into bx
    mov ax, [bx]        ;store the value stored at address bx into ax
    mov dx, [bx + 2]    ;store the value at address bx + 2 into ax
    sbb ax, dx          ;subtract dx and carry flag from ax.
                        ;difference is stored in ax
    mov [bx + 4], ax    ;store value of ax at address bx + 4
    hlt                 ;halt execution