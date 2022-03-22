#include "console.h"
#include "debug.h"
#include "gdt.h"

int kern_entry() {
    init_debug();

    init_gdt();

    console_clear();

    printk_color(rc_black, rc_green, "Dear Shuang, welcome to OS world.\n");

    return 0;
}
