#include "common.h"
#include "string.h"
#include "idt.h"
#include "debug.h"

// 中断描述符表
idt_entry_t idt_entries[256];

// IDTR
idt_ptr_t idt_ptr;

// 中断处理函数的指针数组
interrupt_handler_t interrupt_handlers[256];

// 设置中断描述符
static void idt_set_gate(uint8_t num, uint32_t base, uint16_t sel, uint8_t flags);

// 声明加载 IDTR 的函数
extern void idt_flush(uint32_t);

// 初始化中断描述符表
void init_idt(){
    bzero((uint8_t *)&interrupt_handlers, sizeof(interrupt_handler_t) * 256);

    idt_ptr.limit = sizeof(idt_entry_t) * 256 - 1;
    idt_ptr.base = (uint32_t)&idt_entries;

    bzero((uint8_t *)&idt_entries, sizeof(idt_entry_t) * 256);

    // 0-32：用于CPU的中断处理
    idt_set_gate(0, (uint32_t)isr0, 0X08, 0X8E);
    idt_set_gate(1, (uint32_t)isr1, 0X08, 0X8E);
    idt_set_gate(2, (uint32_t)isr2, 0X08, 0X8E);
    idt_set_gate(3, (uint32_t)isr3, 0X08, 0X8E);
    idt_set_gate(4, (uint32_t)isr4, 0X08, 0X8E);
    idt_set_gate(5, (uint32_t)isr5, 0X08, 0X8E);
    idt_set_gate(6, (uint32_t)isr6, 0X08, 0X8E);
    idt_set_gate(7, (uint32_t)isr7, 0X08, 0X8E);
    idt_set_gate(8, (uint32_t)isr8, 0X08, 0X8E);
    idt_set_gate(9, (uint32_t)isr9, 0X08, 0X8E);
    idt_set_gate(10, (uint32_t)isr10, 0X08, 0X8E);
    idt_set_gate(11, (uint32_t)isr11, 0X08, 0X8E);
    idt_set_gate(12, (uint32_t)isr12, 0X08, 0X8E);
    idt_set_gate(13, (uint32_t)isr13, 0X08, 0X8E);
    idt_set_gate(14, (uint32_t)isr14, 0X08, 0X8E);
    idt_set_gate(15, (uint32_t)isr15, 0X08, 0X8E);
    idt_set_gate(16, (uint32_t)isr16, 0X08, 0X8E);
    idt_set_gate(17, (uint32_t)isr17, 0X08, 0X8E);
    idt_set_gate(18, (uint32_t)isr18, 0X08, 0X8E);
    idt_set_gate(19, (uint32_t)isr19, 0X08, 0X8E);
    idt_set_gate(20, (uint32_t)isr20, 0X08, 0X8E);
    idt_set_gate(21, (uint32_t)isr21, 0X08, 0X8E);
    idt_set_gate(22, (uint32_t)isr22, 0X08, 0X8E);
    idt_set_gate(23, (uint32_t)isr23, 0X08, 0X8E);
    idt_set_gate(24, (uint32_t)isr24, 0X08, 0X8E);
    idt_set_gate(25, (uint32_t)isr25, 0X08, 0X8E);
    idt_set_gate(26, (uint32_t)isr26, 0X08, 0X8E);
    idt_set_gate(27, (uint32_t)isr27, 0X08, 0X8E);
    idt_set_gate(28, (uint32_t)isr28, 0X08, 0X8E);
    idt_set_gate(29, (uint32_t)isr29, 0X08, 0X8E);
    idt_set_gate(30, (uint32_t)isr30, 0X08, 0X8E);
    idt_set_gate(31, (uint32_t)isr31, 0X08, 0X8E);

    // 255 将来用于实现系统调用
    idt_set_gate(255, (uint32_t)isr255, 0X08, 0X8E);

    // 更新设置中断描述符表
    idt_flush((uint32_t)&idt_ptr);
}

// 设置中断描述符
static void idt_set_gate(uint8_t num, uint32_t base, uint16_t sel, uint8_t flags) {
    idt_entries[num].base_lo = base & 0XFFFF;
    idt_entries[num].base_hi = (base >> 16) & 0XFFFF;

    idt_entries[num].sel = sel;
    idt_entries[num].always0 = 0;

    // 先留下0x60这个魔数，以后实现用户态的时候，这个与运算可以设置中断门的特权级别为3
    idt_entries[num].flags = flags; // | 0x60
}

// 判断这个中断函数是否注册，如果注册了将执行该函数，否则打印中断号
void isr_handler(pt_regs *regs) {
    if (interrupt_handlers[regs->int_no]) {
        interrupt_handlers[regs->int_no](regs);
    } else {
        printk_color(rc_black, rc_blue, "Unhanled interrupt: %d\n", regs->int_no);
    }
}

// 注册一个中断处理函数
void register_interrupt_handler(uint8_t n, interrupt_handler_t h) {
    interrupt_handlers[n] = h;
}