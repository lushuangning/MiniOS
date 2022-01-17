#pragma once

/* 此处用到了几个宏定义，它们是GNU C提供的一些扩展，用于可变形参。
关于可变形参，可参考我的博客
https://lushuangning.github.io/posts/487ea7e6/

此处给出这几个宏的简化版的定义

#define va_list char *

#define va_start(p, first)     (p = (va_list)&first + sizeof(first))
#define va_arg(p, next)        (*(next *)((p += sizeof(next)) - sizeof(next)))
#define va_end(p)              (p = (va_list)NULL)

*/

typedef __builtin_va_list va_list;
#define va_start(ap, last) (__builtin_va_start(ap, last))
#define va_arg(ap, type) (__builtin_va_arg(ap, type))
#define va_end(ap)
