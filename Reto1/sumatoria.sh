nasm -f elf64 -g sumatoria.asm -o sumatoria.o
ld sumatoria.o -o sumatoria
./sumatoria
gdb -x sumatoria.gdb