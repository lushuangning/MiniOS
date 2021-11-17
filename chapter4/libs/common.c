#include "common.h"

// 此处用到内联汇编，详情参考下面的博客
// https://www.cnblogs.com/taek/archive/2012/02/05/2338838.html
// asm volatile("instruction list" : Output : Input : Clobber/Modify);
inline void outb(uint16_t port, uint8_t value) {
  asm volatile ("outb %1, %0" : : "dN" (port), "a" (value));
}

inline uint8_t inb(uint16_t port) {
  uint8_t ret;
  asm volatile("inb %1, %0" : "=a" (ret) : "dN" (port));

  return ret;
}

inline uint16_t inw(uint16_t port) {
  uint16_t ret;
  asm volatile("inw %1, %0" : "=a" (ret) : "dN" (port));

  return ret;
}