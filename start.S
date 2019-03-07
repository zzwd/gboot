.global _start

_start :
	bl led_on
	bl led_off

main_loop :
	nop
	b main_loop

#define PACFG1		0x01C20804
#define PADAT		0x01C20810

led_on :
	ldr r0, = 0x17777777   /* 这里ldr 为伪指令 */
    ldr r1, = PACFG1
    str r0, [r1]          /* 寄存器间接寻址 将r0的值给r1所指地址的内存中,配置GPIO PA15为输出模式  */

    ldr r0, = (1<<15) 	  /* PA15, 在数据寄存器的第15位输出高电平 */
    ldr r1, = PADAT
    str r0, [r1]          /* 点亮 */
    bl delay
    mov pc, lr

led_off :
	ldr r0, = 0x17777777   /* 这里ldr 为伪指令 */
    ldr r1, = PACFG1
    str r0, [r1]          /* 寄存器间接寻址 将r0的值给r1所指地址的内存中,配置GPIO PA15为输出模式  */

    ldr r0, = (0<<15) 	  /* PA15, 在数据寄存器的第15位输出低电平 */
    ldr r1, = PADAT
    str r0, [r1]          /* 灭灯 */
    bl delay
    mov pc, lr

delay:
    ldr r2, =10000
    ldr r3, =0
delay_loop:
    sub r2, r2, #1    /* r2=r2-1  */
    cmp r2, r3        /* cmp 比较r2 r3 如果相等 Z 为1  */
    bne delay_loop    /* bne 为当Z为1时执行跳转  bne 为 b+后缀  */
    mov pc, lr        /* 函数调用返回  mov 为 寄存器间寻址  */    

