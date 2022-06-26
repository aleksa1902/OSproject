
//
// Created by os on 6/25/22.
//

#include "../h/syscall_cpp.hpp"
#include "../h/scheduler.hpp"


void Thread::dispatch() {
    thread_dispatch();
}

int Thread::start() {
    if (myHandle->checkBody()) {
        Scheduler::put(myHandle);
        return 1;
    }
    return 0;
}

