//
// Created by os on 5/14/22.
//

#include "../h/MemoryAllocator.hpp"

MemoryBloc* MemoryAllocator::freeMemBlocHead;
MemoryBloc* MemoryAllocator::takenMemBlocHead;

// Inicijalizacija memorije
void MemoryAllocator::memAlloc(){
    freeMemBlocHead = (MemoryBloc*)HEAP_START_ADDR;
    freeMemBlocHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    freeMemBlocHead->next = nullptr;

    takenMemBlocHead = nullptr;
}

void* MemoryAllocator::mem_alloc (size_t size){
    MemoryBloc* curr = freeMemBlocHead;

    // trazim prvi slobodan blok u listi slobodnih blokova gde mogu da alociram
    while(size > curr->size){
        curr = curr->next;
    }

    // novi alocirani blok
    MemoryBloc* newBloc;

    // ako je velicina veca od MEM_BLOC_SIZE onda uzmi blokova koliko ti treba + sizeof(MemoryBloc)
    // u suprotnom samo MEM_BLOC_SIZE + sizeof(MemoryBloc)
    if(size > MEM_BLOCK_SIZE){
        newBloc->size = ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    }else{
        newBloc->size = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    }

    // newBloc sada dobija adresu curr
    newBloc = curr;

    // ako ne postoji ni jedan zauzet blok, dodaj mu newBloc
    if(takenMemBlocHead == nullptr){
        takenMemBlocHead = newBloc;
        newBloc->next = nullptr;
    }else{
        // ukoliko postoje zauzeti blokovi onda nadji tacno mesto u listi gde ovo moze da stane
        MemoryBloc* nextTaken = takenMemBlocHead;
        MemoryBloc* prevTaken = nullptr;
        while (newBloc > nextTaken && nextTaken != nullptr){
            prevTaken = nextTaken;
            nextTaken = nextTaken->next;
        }

        if(nextTaken == takenMemBlocHead){
            newBloc->next = takenMemBlocHead;
            takenMemBlocHead = newBloc;
        }else{
            newBloc->next = nextTaken;
            prevTaken->next = newBloc;
        }
    }

    curr->size -= newBloc->size;

    if(curr->size == 0){
        MemoryBloc* currFree = freeMemBlocHead;
        while(currFree->next != curr){
            currFree = currFree->next;
        }

        if(currFree == freeMemBlocHead){
            freeMemBlocHead = freeMemBlocHead->next;
        }else {
            currFree->next = curr->next;
        }
    }else{
        curr += newBloc->size;
    }

    return (void*)(newBloc - sizeof(MemoryBloc));
};

int MemoryAllocator::mem_free (void* mem){
    void* freeCurr = (void*)(mem + sizeof(MemoryBloc));

    MemoryBloc* curr = takenMemBlocHead;
    MemoryBloc* prev = nullptr;

    while (curr == freeCurr){
        prev = curr;
        curr = curr->next;
    }

    if(curr == takenMemBlocHead){
        takenMemBlocHead = takenMemBlocHead->next;
    }else{
        prev->next = curr->next;
    }

    if(freeMemBlocHead == nullptr){
        freeMemBlocHead = curr;
    }else{
        MemoryBloc* currFree = freeMemBlocHead;
        MemoryBloc* prevFree = nullptr;

        while(curr > currFree){
            prevFree = currFree;
            currFree = currFree->next;
        }

        if(currFree == freeMemBlocHead){
            curr->next = freeMemBlocHead;
            freeMemBlocHead = curr;
        }else{
            curr->next = currFree;
            prevFree->next = curr;
        }
    }

    MemoryBloc* currMemMerge = freeMemBlocHead;

    while(currMemMerge){
        if(currMemMerge->next != nullptr && currMemMerge + currMemMerge->size == currMemMerge->next){
            currMemMerge->size += currMemMerge->next->size;
            currMemMerge->next = currMemMerge->next->next;
        }else{
            currMemMerge = currMemMerge->next;
        }
    }

    return 0;
};