//
// Created by os on 5/12/22.
//

#ifndef OSPROJECT_SCHEDULER_HPP
#define OSPROJECT_SCHEDULER_HPP

#include "list.hpp"

class TCB;

class Scheduler{
private:
    static List<TCB> readyCoroutineQueue;
public:
    static TCB *get();

    static void put(TCB *ccb);
};

#endif //OSPROJECT_SCHEDULER_HPP
