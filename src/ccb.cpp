/*
//
// Created by os on 4/26/22.
//

#include "../h/ccb.hpp"
#include "../h/scheduler.hpp"
#include "../h/riscv.hpp"

extern "C" void pushRegisters();
extern "C" void popRegisters();

CCB *CCB::running = nullptr;
CCB::CCB(Body body) : body(body),
                      stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
                      context({body != nullptr ? (uint64) body : 0,
                               stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0}),
                      finished(false)
{ if (body != nullptr) { Scheduler::put(this); } }

CCB *CCB::createCoroutine(Body body) { return new CCB(body); }

void CCB::yield() {
    pushRegisters();
    CCB::dispatch();
    popRegisters();
}

void CCB::dispatch() {
    CCB *old = running;
    if (!old->isFinished()) { Scheduler::put(old); }
    running = Scheduler::get();
    CCB::contextSwitch(&old->context, &running->context);
}
*/
