#pragma once
#include "types.h"

// 全局段描述符类型
// 参考https://lushuangning.github.io/posts/f4b01dbb/中段描述符的图
typedef struct {
    uint16_t limit_low; // 段界限 0 ~15
    uint16_t base_low; // 段基地址 16 ~ 31
    uint8_t base_middle; // 段基地址 32 ~ 39
    uint8_t access; // 段存在位、描述符特权级，描述符类型、描述符子类别 40 ~ 47
    uint8_t granularity;    // 其他标志、段界限 48 ~ 55
    uint8_t base_high; // 段基地址 56 ~ 63
} __attribute__((packed)) gdt_entry_t;

// GDTR
typedef struct {
    uint16_t limit; // 全局段描述符限长 0 ~ 15
    uint32_t base;  // 全局段描述符表32位基地址 16 ~ 47
} __attribute__((packed)) gdt_ptr_t;

// 初始化全局描述符表
void init_gdt();

// GDT 加载到 GDTR 的函数汇编实现
extern void get_flush(uint32_t);