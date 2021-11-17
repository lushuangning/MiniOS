#include "console.h"
#include "common.h"

// 显存的起点 0xb8000
static uint16_t *video_memory = (uint16_t *)0xB8000;

// 屏幕光标的坐标
static uint8_t cursor_x = 0;
static uint8_t cursor_y = 0;

// cursor_x 和 cursor_y 只是光标逻辑上的位置
// 移动光标到指定位置
static void move_cursor(){
    // 屏幕宽是80
    uint16_t cursorLocation = cursor_y * 80 + cursor_x;

    // 用到两个内部寄存器的编号为 14 和 15，分别表示光标
    // 位置的高 8 位与低 8 位
    outb(0x3d4, 14);                        // 告诉VGA要设置光标的高8位
    outb(0x3d5, cursorLocation >> 8);       // 发送高8位
    outb(0x3d4, 15);                        // 告诉VGA要设置光标的低8位
    outb(0x3d5, cursorLocation);            // 发送低8位
}

// 将后24行的数据全部向上挪动一行，最后一行清空以实现屏幕滚动
static void scroll(){
    uint8_t attribute_byte = (0 << 4) | (15 & 0x0F);
    uint16_t blank = 0x20 | (attribute_byte << 8);
    // // 滚动前光标所在位置
    // uint16_t cursor_loc = cursor_y * 80 + cursor_x;
    // // 滚动后光标所在位置
    // uint16_t scro_cursor_loc = cursor_loc - 80;
    int i;
    // 显示区域是 80 * 25，行数是从0-24，因此大于24的时候就无法显示了
    if(cursor_y >= 25){
        for (i = 0;i < 24*80;++i){
            video_memory[i] = video_memory[i+80];
        }
        for (i = 24*80;i < 25*80;++i){
            video_memory[i] = blank;
        }
        // cursor_y--;
        // move_cursor();
        cursor_y = 24;
    }
}

// 清屏，用白底黑字的空格符覆盖整个屏幕的显示区域
void console_clear(){
    // 0<<4 是属性的后4位，15 & 0x0f 是前4位
    // 0000,1111->(KRGB,IRGB)，即背景是闪烁的黑，前景是亮白
    uint8_t attribute_byte = (0 << 4) | (15 & 0x0F);
    // 0x20 对应ascii码32，即空格。
    // 0000,1111,0010,0000
    // FIXME 这里为什么是属性字节在前，ascii码在后？？？小端字节序？？？     
    uint16_t blank = 0x20 | (attribute_byte << 8);          

    int i;
    for(i = 0;i < 80 * 25;++i){
        video_memory[i] = blank;    // video_memory 的类型是 uint16_t
    }
    cursor_x = 0;
    cursor_y = 0;
    move_cursor();
}

void console_putc_color(char c, real_color_t back, real_color_t fore){
    uint8_t back_color = (uint8_t)back;
    uint8_t fore_color = (uint8_t)fore;
    uint8_t attribute_byte = (back_color << 4) | (fore_color & 0x0F);
    uint16_t attribute = attribute_byte << 8;

    // 0x08 是退格键，0x09 是 tab 键
    // \r 是回车，\n 是换行
    if(c == 0x08 && cursor_x){
        cursor_x--;
    }else if(c == 0x09){
        // FIXME 这里不懂
        cursor_x = (cursor_x + 8) & ~(8-1);
    }else if(c == '\r'){
        cursor_x = 0;
    }else if(c == '\n'){
        cursor_x = 0;
        cursor_y++;
    }else if(c >= ' '){
        video_memory[cursor_y * 80 + cursor_x] = c | attribute;
        cursor_x++;
    }

    if(cursor_x >= 80){
        cursor_x = 0;
        cursor_y++;
    }

    scroll();

    move_cursor();
}

void console_write(char *cstr){
    while (*cstr){
        console_putc_color(*cstr++, rc_black, rc_white);
    }
}

void console_write_color(char *cstr, real_color_t back, real_color_t fore){
    while (*cstr){
        console_putc_color(*cstr++, back, fore);
    }
}