//
// Created by os on 5/12/22.
//
//#include "../lib/mem.h"
#include "../h/syscall_c.hpp"

void *operator new(uint64 n) { return mem_alloc(n); }
void *operator new[](uint64 n) { return mem_alloc(n); }

void operator delete(void *p) noexcept { mem_free(p); }
void operator delete[](void *p) noexcept { mem_free(p); }
