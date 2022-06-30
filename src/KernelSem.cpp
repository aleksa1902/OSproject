//
// Created by os on 6/26/22.
//

#include "../h/KernelSem.hpp"
#include "../h/scheduler.hpp"

KernelSem::KernelSem(int init) {
    this->value = init;
    this->mySemaphore = nullptr;
    this->listWait = new List<thread_t>();
}

KernelSem *KernelSem::createSem(int init) {
    return new KernelSem(init);
}

KernelSem::~KernelSem() {
    this->value = 0;
}

int KernelSem::val() const {
    return value;
}

int KernelSem::wait() {
    value--;

    if(value < 0){
        TCB::running->setBlocked();
        listWait.addLast(&TCB::running);
        thread_dispatch();

        return 1;
    }

    return 1;
}

int KernelSem::signal() {
    value++;

    if(value <= 0){
        if(listWait.peekFirst()){
            thread_t *unblock = listWait.peekFirst();
            listWait.removeFirst();
            unblock.unblock();
            Scheduler::put(*unblock);
            return 0;
        }
    }
    return 0;
}

void KernelSem::freeSem() {
    while(listWait.peekFirst()){
        thread_t *unblock = listWait.peekFirst();
        listWait.removeFirst();
        unblock.unblock();
        Scheduler::put(*unblock);
    }

    value = 1; // diskutabilno
}
