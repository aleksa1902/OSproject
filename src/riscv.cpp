//
// Created by os on 4/26/22.
//
#include "../h/riscv.hpp"
#include "../h/tcb.hpp"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"

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
        // prekopirano od mickovog koda
        uint64 sepc = r_sepc(); uint64 sstatus = r_sstatus();

        // syscall za mem_alloc, argument je 1
        if(argument0 == 1){
            // potrebni argumenti za mem_alloc
            size_t argument_sizet;
            void* argument_ret_void;

            __asm__ volatile("mv %0, a1" : "=r" (argument_sizet));
            argument_ret_void = MemoryAllocator::mem_alloc(argument_sizet);
            __asm__ volatile("mv a0, %0" : : "r" (argument_ret_void));
        }

        // syscall za mem_free, argument je 1
        if(argument0 == 2){
            // potrebni argumenti za mem_free
            void* argument_void;

            __asm__ volatile("mv %0, a1" : "=r" (argument_void));
            MemoryAllocator::mem_free(argument_void);
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
    }
}
