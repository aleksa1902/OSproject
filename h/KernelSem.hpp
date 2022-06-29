//
// Created by os on 6/26/22.
//

#ifndef OSPROJECT_KERNELSEM_HPP
#define OSPROJECT_KERNELSEM_HPP

#include "list.hpp"
#include "syscall_c.hpp"

class KernelSem{
public:
    int value;
    //List<thread_t> listWait;

    //KernelSem(Semaphore* sem, int init=1){
    //    this->value = init;
    //    this->sem = sem;
        //this->listWait = new List<thread_t>();
    //}
    virtual ~KernelSem ();
    int wait ();
    int signal();
    int val () const;

private:
    friend class Semaphore;
    //Semaphore* sem;
};

#endif //OSPROJECT_KERNELSEM_HPP
