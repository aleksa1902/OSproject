//
// Created by os on 5/12/22.
//

#ifndef OSPROJECT_TCB_HPP
#define OSPROJECT_TCB_HPP

#include "../lib/hw.h"
#include "../h/syscall_cpp.hpp"

class Thread;

class TCB {
        public:
        ~TCB() { delete[] stack; }
        bool isFinished() const { return finished; }
        void setFinished(bool value) { finished = value; }
        uint64 getTimeSlice() const { return timeSlice; }
        using Body = void (*)();
        static TCB *createThread(Body body);
        static void yield();
        static TCB *running;
        bool checkBody();
        bool isBlocked() const { return blocked; }
        void setBlocked() { blocked = true; }
        void unblock() { blocked = false; }
        void setBody(Body body);
        static void exitTCB();
        private:
        TCB(Body body, uint64 timeSlice);
        struct Context { uint64 ra; uint64 sp; };
        Body body;
        uint64 *stack;
        Context context;
        uint64 timeSlice;
        bool finished;
        bool blocked;
        friend class Riscv;
        friend class Thread;
        Thread* myThread;

        static void threadWrapper();
        static void contextSwitch(Context *oldContext, Context *runningContext);
        static void dispatch();

        static uint64 timeSliceCounter;

        static uint64 constexpr STACK_SIZE = 1024;
        static uint64 constexpr TIME_SLICE = 2;
};


#endif //OSPROJECT_TCB_HPP
