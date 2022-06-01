; ---------------------------------------------
;          boot.s —— 内核从这里开始
; GRUB 是一个来自 GNU 项目的多操作系统启动程序
; 需要要按照标准生成规范的 Multiboot 引导信息
; ---------------------------------------------

; Multiboot 魔数，由规范决定
MBOOT_HEADER_MAGIC  equ 0x1BADB002

; 0 号位表示所有的引导模块将按页（4KB）边界对其
MBOOT_PAGE_ALIGN    equ 1 << 0

; 1 号位通过 Multiboot 信息结构的 mem_* 域包括可用内存的信息
MBOOT_MEM_INFO      equ 1 << 1

; 定义我们使用的 Multiboot 的标记
MBOOT_HEADER_FLAGS  equ  MBOOT_PAGE_ALIGN | MBOOT_MEM_INFO

; 域 checksum 是一个 32 位的无符号值，当与其他的 magic 域（也就是magic和flags）
; 相加时，要求其结果必须是32位的无符号值 0，即（magic+flags+checksum = 0）
MBOOT_CHECKSUM      equ -(MBOOT_HEADER_MAGIC+MBOOT_HEADER_FLAGS)

; 符合规范的 Multiboot OS 映像需要这样一个 magic Multiboot 头
; Multiboot 头的分布必须如下表所示：
; ---------------------------------------------
; 偏移量    类型    域名      备注
;   0       u32    magic    必需
;   4       u32    flags    必需
;   8       u32   checksum  必需
; ---------------------------------------------

; ---------------------------------------------

[BITS 32]   ; 所有代码以 32-bit 的方式编译
section .text   ; 代码段开始

dd MBOOT_HEADER_MAGIC     ; GRUB 通过该魔数判断该映像是否支持
dd MBOOT_HEADER_FLAGS     ; GRUB 的一些加载时选项
dd MBOOT_CHECKSUM         ; 检测数值

[GLOBAL start]            ; 向外部声明内核代码入口，此处提供该声明给链接器
[GLOBAL glb_mboot_ptr]    ; 向外部声明 struct multiboot * 变量
[EXTERN kern_entry]       ; 声明内核 C 代码的入口函数

start:
  cli       ; 关闭中断
  mov esp, STACK_TOP        ;
  mov ebp, 0                ; 基址指针修改为 0
  and esp, 0FFFFFFF0H       ; 栈地址按照16字节对齐
  mov [glb_mboot_ptr], ebx  ; 将 ebx 中存储的指针存入全局变量
  call kern_entry           ; 调用内核入口函数

stop:
  hlt                       ; 停机指令，降低CPU功耗
  jmp stop

; ---------------------------------------------

section .bss     ; 未初始化的数据段从这里开始

; 伪指令resb被用在bss段中，从当前位置开始，
; 保留指定数量的字节，但不初始化它们
stack:
  resb 32768     ; 这里作为内核栈

glb_mboot_ptr:
  resb 4         ; 全局的 multiboot 结构体指针

STACK_TOP     equ     $-stack-1     ; 内核栈顶，$ 符指代是当前地址