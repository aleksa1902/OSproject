/*
//
// Created by os on 4/26/22.
//

#ifndef PROJECT_BASE_V1_0_CCB_HPP
#define PROJECT_BASE_V1_0_CCB_HPP

#include "../lib/hw.h"

class CCB {
public:
    ~CCB() { delete[] stack; }
    bool isFinished() const { return finished; }
    void setFinished(bool value) { finished = value; }
    using Body = void (*)();
    static CCB *createCoroutine(Body body);
    static void yield();
    static CCB *running;

private:
    explicit CCB(Body body);

    struct Context { uint64 ra; uint64 sp;};
    Body body; uint64 *stack; Context context; bool finished;

    static void contextSwitch(Context *oldContext, Context *runningContext);
    static void dispatch();

    static uint64 constexpr STACK_SIZE = 1024;
};



#endif //PROJECT_BASE_V1_0_CCB_HPP
*/
