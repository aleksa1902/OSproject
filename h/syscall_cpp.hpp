//
// Created by os on 5/22/22.
//

#ifndef OSPROJECT_SYSCALL_CPP_HPP
#define OSPROJECT_SYSCALL_CPP_HPP

#include "syscall_c.hpp"
#include "KernelSem.hpp"


class TCB;
typedef TCB* thread_t;

class KernelSem;
typedef KernelSem* sem_t;

class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();
    int start ();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
private:
    friend class TCB;
    thread_t myHandle;
};
class Semaphore {
public:
    Semaphore (unsigned init = 1);

    virtual ~Semaphore ();
    int wait ();
    int signal ();
private:
    friend class KernelSem;
    sem_t myHandle;
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
};
class Console {
public:
    static char getc ();
    static void putc (char);
};

#endif //OSPROJECT_SYSCALL_CPP_HPP
