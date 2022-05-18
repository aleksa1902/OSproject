//
// Created by os on 5/14/22.
//

#ifndef OSPROJECT_MEMORYALLOCATOR_HPP
#define OSPROJECT_MEMORYALLOCATOR_HPP

#include "../lib/mem.h"

struct MemoryBloc{
    void* addr;
    int size;
    MemoryBloc* next;
    MemoryBloc* prev;

};


class MemoryAllocator {
public:
    void memAlloc();
    void* mem_alloc (uint64);
    int mem_free (void*);
private:
    static MemoryBloc* freeMemBlocHead;
};


#endif //OSPROJECT_MEMORYALLOCATOR_HPP
