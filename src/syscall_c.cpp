//
// Created by os on 5/22/22.
//
#include "../h/syscall_c.hpp"
#include "../h/tcb.hpp"

void* mem_alloc(size_t size){
    size_t arg = 60;
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

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg){
    thread_t* arg1 = 0;
    TCB::Body arg2 = 0;
    void* arg3 = 0;
    int num = 11;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    __asm__ volatile("mv %0, a1" : "=r" (arg2));
    __asm__ volatile("mv %0, a2" : "=r" (arg3));
    __asm__ volatile("mv a0, %0" : : "r" (num));
    __asm__ volatile("mv a1, %0" : : "r" (arg1));
    __asm__ volatile("mv a2, %0" : : "r" (arg2));
    __asm__ volatile("mv a3, %0" : : "r" (arg3));

    __asm__ volatile("ecall");

    return 1;
}

int thread_exit (){
    int num = 12;

    __asm__ volatile("mv a0, %0" : : "r" (num));

    __asm__ volatile("ecall");

    return 1;
}

void thread_dispatch (){
    int num = 13;

    __asm__ volatile("mv a0, %0" : : "r" (num));

    __asm__ volatile("ecall");
}

int sem_open (sem_t* handle, unsigned init){
    sem_t* arg1 = 0;
    unsigned arg2 = 0;
    int num = 21;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    __asm__ volatile("mv %0, a1" : "=r" (arg2));
    __asm__ volatile("mv a0, %0" : : "r" (num));
    __asm__ volatile("mv a1, %0" : : "r" (arg1));
    __asm__ volatile("mv a2, %0" : : "r" (arg2));

    __asm__ volatile("ecall");

    return 1;

}

int sem_close (sem_t handle){
    sem_t arg1 = 0;
    int num = 22;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    __asm__ volatile("mv a0, %0" : : "r" (num));
    __asm__ volatile("mv a1, %0" : : "r" (arg1));

    __asm__ volatile("ecall");

    return 1;
}

int sem_wait (sem_t id){
    sem_t arg1 = 0;
    int num = 23;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    __asm__ volatile("mv a0, %0" : : "r" (num));
    __asm__ volatile("mv a1, %0" : : "r" (arg1));

    __asm__ volatile("ecall");

    return 1;
}

int sem_signal (sem_t id){
    sem_t arg1 = 0;
    int num = 24;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    __asm__ volatile("mv a0, %0" : : "r" (num));
    __asm__ volatile("mv a1, %0" : : "r" (arg1));

    __asm__ volatile("ecall");

    return 1;
}