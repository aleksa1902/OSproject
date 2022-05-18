//
// Created by os on 5/14/22.
//

#include "../h/MemoryAllocator.hpp"

MemoryBloc* MemoryAllocator::freeMemBlocHead;

void MemoryAllocator::memAlloc(){
    freeMemBlocHead->addr = (void*)HEAP_END_ADDR;
}

void* MemoryAllocator::mem_alloc (uint64 size){
    return nullptr;
};

int MemoryAllocator::mem_free (void* mem){
    return 0;
};