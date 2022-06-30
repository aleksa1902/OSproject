
//
// Created by os on 6/25/22.
//

#include "../h/syscall_cpp.hpp"
#include "../h/scheduler.hpp"


void Thread::dispatch() {
    thread_dispatch();
}

int Thread::start() {
    Scheduler::put(myHandle);
    return 1;

}

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle, body, arg);
    myHandle->myThread = this;
}

Thread::Thread() {
    thread_create(&myHandle, nullptr, nullptr);
    myHandle->myThread = this;
}

Thread::~Thread() {
    delete myHandle;
}

int Semaphore::wait() {
    sem_wait(myHandle);
    return 0;
}

int Semaphore::signal() {
    sem_signal(myHandle);
    return 0;
}

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
    myHandle->mySemaphore = this;
}

char Console::getc() {
    char c = ::getc();
    return c;
}

void Console::putc(char c) {
    ::putc(c);
}
