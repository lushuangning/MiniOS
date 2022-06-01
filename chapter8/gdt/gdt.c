#include "gdt.h"
#include "string.h"

// 全局描述符表长度
#define GDT_LENGTH 5

// 全局描述符表定义
gdt_entry_t gdt_entries[GDT_LENGTH];

// GDTR
gdt_ptr_t gdt_ptr;

static void gdt_set_gate(int32_t num, uint32_t base, 
                        uint32_t limit, uint8_t access, uint8_t gran);


// 声明内核栈地址
extern uint32_t stack;

// 初始化全局描述符表
void init_gdt(){
    // 全局描述符表界限，从 0 开始，总长要 -1
    gdt_ptr.limit = sizeof(gdt_entry_t) * GDT_LENGTH - 1;
    gdt_ptr.base = (uint32_t)&gdt_entries;

    // 采用 intel 平坦模型
    gdt_set_gate(0, 0, 0, 0, 0); // 按照 Intel 文档要求，第一个描述符必须全0
    gdt_set_gate(1, 0, 0xFFFFFFFF, 0x9A, 0xCF);
    gdt_set_gate(2, 0, 0xFFFFFFFF, 0x92, 0xCF);
    gdt_set_gate(3, 0, 0xFFFFFFFF, 0xFA, 0xCF);
    gdt_set_gate(4, 0, 0xFFFFFFFF, 0xF2, 0xCF);
}

static void gdt_set_gate(int32_t num, uint32_t base, 
                        uint32_t limit, uint8_t access, uint8_t gran){

    gdt_entries[num].base_low = (base & 0xFFFF);
    gdt_entries[num].base_middle = (base >> 16) & 0xFF;
    gdt_entries[num].base_high = (base >> 24) & 0xFF;

    gdt_entries[num].limit_low = (limit & 0xFFFF);
    // gdt_entries[num].granularity = ((limit >> 16) & 0x0F) | (gran << 4);
    gdt_entries[num].granularity = ((limit >> 16) & 0x0F) | (gran & 0xF0);
    gdt_entries[num].access = access;
}