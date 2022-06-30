//
// Created by os on 5/12/22.
//
#include "../h/riscv.hpp"
#include "../h/tcb.hpp"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/printing.hpp"

void Riscv::popSppSpie() {
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

void Riscv::handleSupervisorTrap() {
    uint64 scause = r_scause();

    // velicina gde cu da mu obavestim koji je poziv
    size_t argument0;
    __asm__ volatile("mv %0, a0" : "=r" (argument0));

    if(argument0 != 0 && scause == 0x0000000000000009UL){
        // prekopirano od mickovog koda sa laba jedino ovako hoce da radi
                uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();


        if(argument0 == 1){ // syscall za mem_alloc
            // potrebni argumenti za mem_alloc
            size_t argument_sizet;
            void* argument_ret_void;

            __asm__ volatile("mv %0, a1" : "=r" (argument_sizet));
            argument_ret_void = MemoryAllocator::mem_alloc(argument_sizet);
            __asm__ volatile("mv a0, %0" : : "r" (argument_ret_void));
        }else if(argument0 == 2){ // sistemski poziv za mem_free
            // potrebni argumenti za mem_free
            void* argument_void;

            __asm__ volatile("mv %0, a1" : "=r" (argument_void));
            MemoryAllocator::mem_free(argument_void);
        }else if(argument0 == 11){
            // create_thread
            thread_t* handler;
            TCB::Body sr = 0;
            void* arg = 0;

            __asm__ volatile("mv %0, a1" : "=r" (handler));
            __asm__ volatile("mv %0, a2" : "=r" (sr));
            __asm__ volatile("mv %0, a3" : "=r" (arg));

            *handler = TCB::createThread(sr);

        }else if(argument0 == 12){
            //thread exit nema nikakve argumente samo pozove funkciju ima povratnu vrednost
            TCB::exitTCB();

        }else if(argument0 == 13){
            // thread_dispatch i on ne prima nikakve argumente
            TCB::dispatch();
        }else if(argument0 == 21){
            // sem_open
            sem_t* arg1 = 0;
            unsigned arg2 = 0;

            __asm__ volatile("mv %0, a1" : "=r" (arg1));
            __asm__ volatile("mv %0, a2" : "=r" (arg2));

            *arg1 = KernelSem::createSem(arg2);

        }else if(argument0 == 22){
            // sem_close

            sem_t arg1;

            __asm__ volatile("mv %0, a1" : "=r" (arg1));

            arg1->freeSem();

        }else if(argument0 == 23){
            // sem_wait
            sem_t arg1;

            __asm__ volatile("mv %0, a1" : "=r" (arg1));

            arg1->wait();
        }else if(argument0 == 24){
            // sem_signal
            sem_t arg1;

            __asm__ volatile("mv %0, a1" : "=r" (arg1));

            arg1->signal();
        }else if(argument0 == 41){
            // getc
            char ret;
            ret = __getc();

            __asm__ volatile("mv a0, %0" : : "r" (ret));

        }else if(argument0 == 42){
            // putc
            char c;

            __asm__ volatile("mv %0, a1" : "=r" (c));

            __putc(c);
        }

        w_sstatus(sstatus); w_sepc(sepc);
    }
    else if (scause == 0x0000000000000009UL) {
        // interrupt: no; cause code: environment call from S-mode(9)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch();
        w_sstatus(sstatus); w_sepc(sepc);
    } else if (scause == 0x8000000000000001UL) {
        // interrupt: yes; cause code: supervisor software interrupt (CLINT; machine timer interrupt)
        TCB::timeSliceCounter++;
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
            uint64 sepc = r_sepc(); uint64 sstatus = r_sstatus();
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus); w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    } else if (scause == 0x8000000000000009UL) {
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else {
        // unexpected trap cause
        if (scause == 0x0000000000000002UL){
            printString("Error 2\n");
        }
        if (scause == 0x0000000000000005UL){
            printString("Error 5\n");
        }
        if (scause == 0x0000000000000007UL){
            printString("Error 7\n");
        }
        if (scause == 0x0000000000000008UL){
            printString("Error 8\n");
        }
        if (scause == 0x0000000000000009UL){
            printString("Error 9\n");
        }
    }
}
