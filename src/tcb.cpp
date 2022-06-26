//
// Created by os on 4/26/22.
//

#include "../h/tcb.hpp"
#include "../h/scheduler.hpp"
#include "../h/riscv.hpp"


TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

TCB::TCB(Body body, uint64 timeSlice) : body(body),
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
context({(uint64) &threadWrapper,
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
timeSlice(timeSlice),
finished(false) {
    if (body != nullptr) { Scheduler::put(this); }
}

TCB *TCB::createThread(Body body) {
    return new TCB(body, TIME_SLICE);
}

void TCB::yield() { __asm__ volatile ("ecall"); }

void TCB::dispatch() {
    TCB *old = running;
    uint64 sstatus = Riscv::r_sstatus();
    if (!old->isFinished()) { Scheduler::put(old); }
    running = Scheduler::get();
    Riscv::w_sstatus(sstatus);
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper() {
    Riscv::popSppSpie();
    running->body();
    running->setFinished(true);
    TCB::yield();
}

bool TCB::checkBody() {
    if(this->body != nullptr){
        return true;
    }else{
        return false;
    }
}
