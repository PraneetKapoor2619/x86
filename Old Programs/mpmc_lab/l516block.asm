cld                     ;clear direction flag
mov si, 0300h           ;store the address of source in si
mov di, 0400h           ;store the address of destination in di
mov cx, 0004h           ;store the number of 16 bit blocks you want to transfer in cx
repnz                   ;repeat the next instruction till cx = 0
movsw                   ;move string word from source to destination
hlt                     ;halt the execution