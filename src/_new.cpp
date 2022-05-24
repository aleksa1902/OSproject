//
// Created by os on 4/26/22.
//
#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"

void *operator new(uint64 n) { return MemoryAllocator::mem_alloc(n); }
void *operator new[](uint64 n) { return MemoryAllocator::mem_alloc(n); }

void operator delete(void *p) noexcept { MemoryAllocator::mem_free(p); }
void operator delete[](void *p) noexcept { MemoryAllocator::mem_free(p); }
