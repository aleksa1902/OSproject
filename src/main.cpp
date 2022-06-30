//
// Created by os on 5/12/22.
//

#include "../h/printing.hpp"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/UserMain.hpp"


int main() {
    MemoryAllocator::memAlloc();

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

    // ovo mi treba jer ako ovo ne uradim imam gresku kad se desi prvi dispatch i onda
    // ne zna sta on da radi zato guram praznu nit da radi u pocetku
    TCB* run;
    thread_create(&run, nullptr, nullptr);
    TCB::running = run;

    // maskiranje timeslice-a - 15ta strana u projektu
    //__asm__ volatile ("csrc sie, %[mask]" : : [mask] "r"(2));
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    userMain();

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    printString("Finished\n");
    return 0;
}