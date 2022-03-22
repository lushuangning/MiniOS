#pragma once

#include "types.h"
#include "multiboot.h"

#define ELF32_ST_TYPE(i) ((i)&0xf)


// ELF 格式区段头
typedef struct {
  uint32_t name;
  uint32_t type;
  uint32_t flags;
  uint32_t addr;
  uint32_t offset;
  uint32_t size;
  uint32_t link;
  uint32_t info;
  uint32_t addralign;
  uint32_t entsize;
} __attribute__((packed)) elf_section_header_t;

// ELF 格式符号
typedef struct {
  uint32_t name;
  uint32_t value;
  uint32_t size;
  uint32_t info;
  uint32_t other;
  uint32_t shndx;
} __attribute__((packed)) elf_symbol_t;


// ELF 信息
typedef struct {
  elf_symbol_t *symtab;
  uint32_t      symtabsz;
  const char   *strtab;
  uint32_t      strtabsz;
} elf_t;

// 从 multiboot_t 结构获取 ELF 信息
elf_t elf_from_multiboot(multiboot_t *mb);

// 查看 ELF 的符号信息
const char *elf_lookup_symbol(uint32_t addr, elf_t *elf);
