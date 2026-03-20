.section ".text.boot"
 

.globl _start
 
_start:
	mov sp, #0x8000
 
	
	ldr r3, =kmain
	blx r3
	
halt:
	b halt

