//
// Created by os on 4/26/22.
//

#include "../h/tcb.hpp"
#include "../h/scheduler.hpp"
#include "../h/riscv.hpp"
#include "../h/print.hpp"


TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

TCB::TCB(Body body, uint64 timeSlice) : body(body),
stack(new uint64[STACK_SIZE]),
context({(uint64) &threadWrapper,
         (uint64) &stack[STACK_SIZE]}),
timeSlice(timeSlice),
finished(false), blocked(false) {
    if (body != nullptr) { Scheduler::put(this); }
    myThread = nullptr;
}

TCB *TCB::createThread(Body body) {
    return new TCB(body, TIME_SLICE);
}

void TCB::yield() { __asm__ volatile ("ecall"); }

void TCB::dispatch() {
    TCB *old = running;
    uint64 sstatus = Riscv::r_sstatus();
    if (!old->isBlocked() && !old->isFinished()) { Scheduler::put(old); }
    running = Scheduler::get();
    Riscv::w_sstatus(sstatus);
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper() {
    Riscv::popSppSpie();
    if(running->myThread != nullptr){
        running->myThread->run();
    }
    thread_exit();
    /*running->body();
    running->setFinished(true);
    TCB::yield();*/

}

bool TCB::checkBody() {
    if(this->body != nullptr){
        printString("Imam body.\n");
        return true;
    }else{
        printString("Nemam body.\n");
        return false;
    }
}

void TCB::setBody(TCB::Body body) {
    this->body = body;
}

void TCB::exitTCB() {
    running->setFinished(true);
    thread_dispatch();
}
