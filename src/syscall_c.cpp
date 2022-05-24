//
// Created by os on 5/22/22.
//
#include "../h/syscall_c.hpp"

void* mem_alloc(size_t size){
    size_t arg = 0;
    size_t num = 1;

    __asm__ volatile("mv %0, a0" : "=r" (arg));
    __asm__ volatile("mv a0, %0" : : "r" (num));
    __asm__ volatile("mv a1, %0" : : "r" (arg));

    __asm__ volatile("ecall");

    void* ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));

    return ret;

}

int mem_free(void* addr){
    void* arg = 0;
    int num = 2;

    __asm__ volatile("mv %0, a0" : "=r" (arg));
    __asm__ volatile("mv a0, %0" : : "r" (num));
    __asm__ volatile("mv a1, %0" : : "r" (arg));

    __asm__ volatile("ecall");

    return 1;
}