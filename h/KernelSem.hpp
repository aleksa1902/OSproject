//
// Created by os on 6/26/22.
//

#ifndef OSPROJECT_KERNELSEM_HPP
#define OSPROJECT_KERNELSEM_HPP

#include "list.hpp"
#include "syscall_cpp.hpp"

class Semaphore;

class TCB;

class KernelSem{
public:
    KernelSem(int init);
    static KernelSem *createSem(int init);
    virtual ~KernelSem ();
    int wait ();
    int signal();
    int val () const;
    void freeSem();

private:
    friend class Semaphore;
    Semaphore* mySemaphore;
    int value;
    List<TCB> listWait;
};

#endif //OSPROJECT_KERNELSEM_HPP
