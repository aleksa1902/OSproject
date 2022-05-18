//
// Created by os on 5/14/22.
//

#ifndef OSPROJECT_MEMORYALLOCATOR_HPP
#define OSPROJECT_MEMORYALLOCATOR_HPP

#include "../lib/mem.h"

struct MemoryBloc{
    size_t size;
    MemoryBloc* next;
};


class MemoryAllocator {
public:
    void memAlloc();
    void* mem_alloc (size_t);
    int mem_free (void*);
private:
    static MemoryBloc* freeMemBlocHead;
    static MemoryBloc* takenMemBlocHead;
};


#endif //OSPROJECT_MEMORYALLOCATOR_HPP
