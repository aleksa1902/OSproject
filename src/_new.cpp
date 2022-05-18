//
// Created by os on 4/26/22.
//
#include "../lib/mem.h"

void *operator new(uint64 n) { return __mem_alloc(n); }
void *operator new[](uint64 n) { return __mem_alloc(n); }

void operator delete(void *p) noexcept { __mem_free(p); }
void operator delete[](void *p) noexcept { __mem_free(p); }
