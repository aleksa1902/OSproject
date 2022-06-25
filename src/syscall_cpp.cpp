//
// Created by os on 6/25/22.
//

#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"
#include "../h/scheduler.hpp"

Thread::Thread() {
    thread_create(&myHandle, nullptr, nullptr);
}

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle, body, arg);
}

Thread::~Thread() noexcept {
    delete myHandle;
}

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