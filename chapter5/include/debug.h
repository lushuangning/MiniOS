#include "console.h"
#include "vargs.h"
//#include "elf.h"

#define assert(x, info) \
    do{                 \
      if(!(x)){         \
        panic(info);    \
      }                 \
    }while (0)

// 编译期间静态检测
#define static_assert(x)    \
      switch (x) {case 0: case (x): ;}

// 内核的打印函数，...的作用是，让编译器允许在调用printk函数的时候带任意多个实参
void printk(const char *format, ...);

// 内核的打印函数，带颜色
void printk_color(real_color back, real_color fore, const char *format, ...);
