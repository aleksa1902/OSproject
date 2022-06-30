//
// Created by os on 4/26/22.
//

#include "../h/printing.hpp"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/UserMain.hpp"


int main() {
    MemoryAllocator::memAlloc();

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

   userMain();

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    printString("Finished\n");
    return 0;
}