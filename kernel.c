// kernel.c — Bare-metal "Hello World" para ARM (Allwinner A13/R8)
//
// Este código escreve directamente na UART0 (endereço 0x01C28000)
// compatível com o hardware do Allwinner A13/R8.

#define UART0_BASE 0x01C28000
#define UART_THR   (*(volatile unsigned int*)(UART0_BASE + 0x00)) // Transmit Holding Reg
#define UART_LSR   (*(volatile unsigned int*)(UART0_BASE + 0x14)) // Line Status Reg

void uart_putc(char c) {
    // Espera até o UART poder enviar
    while (!(UART_LSR & (1 << 5)));
    UART_THR = c;
}

void uart_puts(const char *s) {
    while (*s) {
        if (*s == '\n') uart_putc('\r');
        uart_putc(*s++);
    }
}

void kmain(void) {
    uart_puts("Hello from bare-metal kernel on CHIP/A13!\n");

    // loop infinito para não sair
    while (1);
}
