    mov al, 36h             ;load accumulator with 36h
    out 66h, al             ;send 36h to port 66h: sets 8254 to use counter 0 in mode 3

start:
    mov al, 055h            ;load accumulator with 55h
    out 60h, al             ;send 55h to port 60h; 55h is the lower byte
    mov al, 0aah            ;load accumulator with 0AAh
    out 60h, al             ;send 0AAh to port 60h; this is the higher byte
    jmp start               ;jump to start
    
    hlt                     ;halt execution