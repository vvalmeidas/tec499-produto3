.data
.equ UART_ADDRESS, 0x2010


.text

.global _start
_start: 
movia r1, UART_ADDRESS
movi r2, 0x62
envia: 
stb r2, 0(r1)
br fim

fim: 
br fim
