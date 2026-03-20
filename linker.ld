ENTRY(_start)

SECTIONS {
    . = 0x40000000;   /* endereço de carga típico em Allwinner */

    .text : {
        *(.text*)
    }

    .rodata : {
        *(.rodata*)
    }

    .data : {
        *(.data*)
    }

    .bss : {
        *(.bss*)
        *(COMMON)
    }
}