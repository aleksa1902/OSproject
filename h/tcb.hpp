//
// Created by os on 4/26/22.
//

#ifndef PROJECT_BASE_V1_0_TCB_HPP
#define PROJECT_BASE_V1_0_TCB_HPP

#include "../lib/hw.h"

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
        private:
        TCB(Body body, uint64 timeSlice);

        struct Context { uint64 ra; uint64 sp; };
        Body body; uint64 *stack; Context context; uint64 timeSlice; bool finished;

        friend class Riscv;

        static void threadWrapper();
        static void contextSwitch(Context *oldContext, Context *runningContext);
        static void dispatch();

        static uint64 timeSliceCounter;

        static uint64 constexpr STACK_SIZE = 1024;
        static uint64 constexpr TIME_SLICE = 2;
};


#endif //PROJECT_BASE_V1_0_TCB_HPP
