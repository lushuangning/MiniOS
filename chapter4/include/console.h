#ifndef INCLUDE_CONSOLE_H_
#define INCLUDE_CONSOLE_H_

#include "types.h"

typedef enum real_color {
  rc_black = 0,
  rc_blue = 1,
  rc_green = 2,
  rc_cyan = 3,
  rc_magenta = 5,
  rc_brown = 6,
  rc_light_gray = 7,
  rc_dark_gray = 8,
  rc_light_green = 9,
  rc_light_cyan = 11,
  rc_light_red = 12,
  rc_light_magenta = 13,
  rc_light_brown = 14,
  rc_white = 15
} real_color_t;

// 清屏操作
void console_clear();

// 屏幕输出一个带颜色的字符
void console_putc_color(char c, real_color_t back, real_color_t fore);

// 屏幕打印一个以 \0 结尾的字符串，默认黑底白字
void console_write(char *cstr);

// 屏幕打印一个以 \0 结尾的带颜色的字符串
void console_write_color(char *cstr, real_color_t back, real_color_t fore);

// 屏幕打印一个以 \0 结尾的带颜色的十六进制数
void console_write_hex(uint32_t n, real_color_t back, real_color_t fore);

// 屏幕打印一个以 \0 结尾的带颜色的二进制数
void console_write_dec(uint32_t n, real_color_t back, real_color_t fore);

#endif  // INCLUDE_CONSOLE_H_
