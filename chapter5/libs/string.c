#include "../include/string.h"
#include "../include/types.h"

// realized myself
//void memcpy(uint8_t *dest, const uint8_t *src, uint32_t len) {
//  for(uint32_t i = 0;i < len;++i){
//    dest[i] = src[i];
//  }
//}
//
// realized by the book
void memcpy(uint8_t *dest, const uint8_t *src, uint32_t len) {
  for(; len != 0; --len){
    *dest++ = *src++;
  }
}

void memset(void *dest, uint8_t val, uint32_t len) {
  uint8_t * dst = (uint8_t *)dest;
  for(; len != 0; --len){
    *dst++ = val;
  }
}

void bzero(void *dest, uint32_t len) {
  memset(dest, 0, len);
}

int strcmp(const char *str1, const char *str2) {
  for(;*str1 != '\0' && *str2 != '\0';str1++, str2++){
    if(*str1 != *str2){
      return *str1 - *str2;
    }
  }

  if(*str1 == '\0' && *str2 == '\0'){
    return 0;
  }else{
    return *str1 == '\0'?-*str2:*str1;
  }
  
}

char *strcpy(char *dest, const char *src) {
  char *dst = dest;
  for(;*src != '\0';){
    *dst++ = *src++;
  }

  return dest;
}

char *strcat(char *dest, const char *src) {
  char *dst = dest;
  
  while(*dst != '\0')
    dst++;

  for(;*src != '\0';){
    *dst++ = *src++;
  }

  return dest;
}

int strlen(const char *src) {
  int len = 0;
  while(*src++ != '\0')
    len++;

  return len;
}
