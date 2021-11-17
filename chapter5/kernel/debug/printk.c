#include "console.h"
#include "string.h"
#include "vargs.h"

// flags(type) 的宏定义，flags 在 vsprintf() 函数中默认为 0
// 在进行位运算时很方便

#define ZEROPAD 1   // 填充0
#define SIGN    2   // 无符号/符号长整数
#define PLUS    4   // 显示加 
#define SPACE   8   // 如果是加，则置空格
#define LEFT    16  // 左调整
#define SPECIAL 32  // 0x
#define SMALL   64  // 使用小写字母

#define is_digit(c) ((c) >= '0' && (c) <= '9')

#define do_div(n, base) ({ \
      int __res;	   \
      __asm__("divl %4":"=a" (n), "=d" (__res): "0" (n), "1" (0), "r" (base)); \
      __res;})

static char buff[1024]; // 显示用临时缓冲区

static int vsprintf(char *buff, const char *format, va_list args);

void printk(const char * format, ...) {
  
  va_list args;
  int i;

  va_start(args, format);
  i = vsprintf(buff, format, args);
  va_end(args);

  buff[i] = '\0';

  console_write(buff);
}

void printk_color(real_color_t back, real_color_t fore, const char *format, ...) {
  va_list args;
  int i;

  va_start(args, format);
  i = vsprintf(buff, format, args);
  va_end(args);

  buff[i] = '\0';

  console_write_color(buff, back, fore);
}

// 该函数将字符数字串转换成整数。输入是数字串指针的指针，返回结果是数值
static int skip_atoi(const char **s) {
  int i = 0;

  while (is_digit(**s)){
    i = i * 10 + *((*s)++) - '0';
  }

  return i;
}

// 将整数转换为指定进制的字符串
// 输入：num-整数；base-进制；size-字符串长度；precision-数字长度（精度）；type-类型选项。
// 输出：数字转换成字符串后指向该字符串末端后面的指针

static char *number(char *str, int num, int base, int size, int precision,
                    int type) {
  char c, sign, tmp[36];
  const char *digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  int i;

  // 如果类型 type 指出用小写字母，则定义小写字母集
  // 如果类型指出左调整（靠左边界），则屏蔽类型中的填零标志。
  // 如果进制基数小于2或大于36，则退出处理。即本程序只能处理基础在 2-32 之间的数
  if (type & SMALL) {
    digits = "0123456789abcdefghijklmnopqrstuvwxyz";
  }

  if (type & LEFT) {
    type &= -ZEROPAD;
  }

  if (base < 2 || base > 36){
    return 0;
  }

  c = (type & ZEROPAD) ? '0' : ' ';

  if (type & SIGN && num < 0){
    sign = '-';
    num = -num;
  }else {
    sign = (type & PLUS) ? '+' : ((type & SPACE) ? ' ' : 0);
  }

  if (sign){
    size--;
  }

  if (type & SPECIAL) {
    if (base == 16){
      size -= 2;
    }else if (base == 0){
      size--;
    }
  }

  i = 0;
  if (num == 0){
    tmp[i++] = '0';
  }else{
    while (num != 0)
      tmp[i++] = digits[do_div(num, base)];
  }

  if (i > precision){
    precision = i;
  }

  size -= precision;

  if(!(type & (ZEROPAD+LEFT))){
    while (size-- > 0){
      *str++ = ' ';
    }
  }

  if (sign){
    *str++ = sign;
  }
  if (type & SPECIAL){
    if (base == 8){
      *str++ = '0';
    }else if (base == 16){
      // 拼凑成 '0X'
      *str++ = '0';
      *str++ = digits[33];
    }
  }

  if (!(type & LEFT)){
    while (size-- > 0)
      *str++ = c;
  }
  while (i < precision--)
    *str++ = '0';

  while (i-- > 0)
    *str++ = tmp[i];

  while (size-- > 0)
    *str++ = ' ';

  return str;
}

static int vsprintf(char *buff, const char *format, va_list args) {
  int len;
  int i;
  char *str;  // 用于存放转换过程中的字符串
  char *s;
  int *ip;

  int flags;  // number() 函数的 type 参数

  int field_width;  // 输出字符串宽度
  int precision;  // min. 整数数字个数；max，字符串中字符个数

  int qualifier;  // 'h', 'l' 或 'L' 用于整数字段

  // 首先将字符指针指向 buf，然后扫描格式字符串，对各个格式转换指示进行相应的处理。
  for(str = buff; *format; ++format){
    // 格式转换指示字符串均以'%'开始，这里从 format 格式字符串中扫描 '%'；不是格式指示的一般字符均被依次存入 str。
    if(*format != '%'){
      *str++ = *format;
      continue;
    }

    // 取得格式指示字符串中的标志域，并将标志常量放入flags变量中
    flags = 0;
    repeat:
    ++format;	// this also skips first '%'
    switch (*format){
      case '-': flags |= LEFT;
        goto repeat;
      case '+': flags |= PLUS;
        goto repeat;
      case ' ': flags |= SPACE;
        goto repeat;
      case '#': flags |= SPECIAL;
        goto repeat;
      case '0': flags |= ZEROPAD;
        goto repeat;
    }
    
    field_width = -1;
    if (is_digit(*format)){
      field_width = skip_atoi(&format);
    }
    else if (*format == '*'){
      // 下一个参数指定宽度
      field_width = va_arg(args, int);
      if (field_width < 0){
        field_width = -field_width;
        flags |= LEFT;
      }
    }
    
    precision = -1;
    if (*format == '.'){
      ++format;
      if (is_digit(*format))
        precision = skip_atoi(&format);
    }else if (*format == '*'){
      // 下一个参数指定精度
      precision = va_arg(args, int);
    }

    if (precision < 0){
      precision = 0;
    }

    // 分析长度修饰符，并将其存入 qualifer 变量

    qualifier = -1;
    if (*format == 'h' || *format == 'l' || *format == 'L'){
      qualifier = *format;
      ++format;
    }

    // 分析转换格式指示符

    switch(*format){
    case 'c':
      if (!(flags & LEFT)){
        while (--field_width > 0)
    *str++ = ' ';
      }
      *str++ = (unsigned char) va_arg(args, int);
      while(--field_width > 0)
        *str++ = ' ';
      break;

    case 's':
      s = va_arg(args, char *);
      len = strlen(s);
      if (precision < 0)
        precision = len;
      else if (len > precision)
        len = precision;

      if (!(flags & LEFT))
        while (len < field_width--)
    *str++ = ' ';

      for (i = 0; i < len; ++i)
        *str++ = *s++;

      while (len < field_width--)
        *str++= ' ';
      break;

    case 'o':
      str = number(str, va_arg(args, unsigned long), 8, field_width, precision, flags);
      break;
    case 'p':
      if (field_width == -1) {
        field_width = 0;
        flags |= ZEROPAD;
      }
      str = number(str, (unsigned long) va_arg(args, void *), 16, field_width, precision, flags);
      break;
    case 'x':
      flags |= SMALL;
    case 'X':
      str = number(str, va_arg(args, unsigned long), 16, field_width, precision, flags);
      break;

    case 'd':
    case 'i':
      flags |= SIGN;
    case 'u':
      str = number(str, va_arg(args, unsigned long), 10, field_width, precision, flags);
      break;

    case 'b':
      str = number(str, va_arg(args, unsigned long), 2, field_width, precision, flags);
      break;
    case 'n':
      ip = va_arg(args, int *);
      *ip = (str - buff);
      break;

    default:
      if (*format != '%')
        *str++ = '%';
      if (*format) {
        *str++ = *format;
      } else {
        --format;
      }
      break;
    }
  } // end for

  *str = '\0';    // 最后在转换好的字符串结尾处添上结束符

  return (str - buff);   // 返回转换好的字符串长度值
}
