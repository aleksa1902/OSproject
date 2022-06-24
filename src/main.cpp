//
// Created by os on 4/26/22.
//


#include "../h/workers.hpp"
#include "../h/print.hpp"
#include "../h/tcb.hpp"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"

int main() {
    MemoryAllocator::memAlloc();
    TCB *threads[5];

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

    thread_create(&threads[0], nullptr, nullptr);
    TCB::running = threads[0];
    thread_create(&threads[1], workerBodyA, nullptr);
    printString("ThreadA created\n");
    thread_create(&threads[2], workerBodyB, nullptr);
    printString("ThreadB created\n");
    thread_create(&threads[3], workerBodyC, nullptr);
    printString("ThreadC created\n");
    thread_create(&threads[4], workerBodyD, nullptr);
    printString("ThreadD created\n");

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
             threads[3]->isFinished() && threads[4]->isFinished())) {
        TCB::yield();
    }
    for (auto &thread: threads) { delete thread; }
    printString("Finished\n");
    return 0;
}

