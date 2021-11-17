#ifndef INCLUDE_STRING_H
#define INCLUDE_STRING_H

#include "types.h"

// 从 src 的开始位置拷贝 n 个字节的数据到 dest
void memcpy(uint8_t *dest, const uint8_t *src, uint32_t len);

// 将指针变量 dest 所指向的前 len 个字节的内存单元用 val 替换
void memset(void *dest, uint8_t val, uint32_t len);

// 将指针变量 dest 所指向的前 len 个字符串置 0
void bzero(void *dest, uint32_t len);

// 比较两个字符串，如果全部字符相同，则认为相等
// 返回值 < 0，str1 < str2; 返回值 = 0，str1 = str2;
// 返回值 > 0，str1 > str2;
int strcmp(const char *str1, const char *str2);

// 把 src 所指向的字符串复制到 dest
char *strcpy(char *dest, const char *src);

// 把 src 所指向的字符串追加到 dest 所指向的字符串的结尾
// 返回 dest 字符串的起始地址
char *strcat(char *dest, const char *src);

// 返回字符串的长度
int strlen(const char *src);

#endif
