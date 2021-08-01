# x86  
  
The codes presented here are written in assembly language. Why? Because I love to know about the architecture of processors, about the working of the machine, etc. and the best way to tinker with the hardware and know more about it is to write assembly language code in it. Plus, writing code in assembly language gives, at least to me, a better grasp of what is happening under the hood. It also gave me a good experience in algorithm development.  
  
# How to assemble code if you are using GAS?  
as < filename >.s -o < filename>.o  
ld < filename >.o -o <filename>  
./< filename >  
  
# How to assemble code if you are using NASM?  
nasm -f elf64 < filename >.asm  
ld < filename >.o  
./a.out  

