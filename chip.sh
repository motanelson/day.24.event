
printf "\033c\033[40;37m\n"
arm-none-eabi-as entry.S -o entry.o -c
arm-none-eabi-gcc -elf32 -c kernel.c -o kernel.o -nostdlib -ffreestanding
arm-none-eabi-ld entry.o kernel.o -T linker.ld -o kernel.elf
arm-none-eabi-objcopy -O binary kernel.elf kernel.bin
qemu-system-arm -M cubieboard -m 1024 -kernel kernel.elf -nographic
  