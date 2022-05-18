//
// Created by os on 5/17/22.
//

#ifndef OSPROJECT_THREAD_HPP
#define OSPROJECT_THREAD_HPP

class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();
    int start ();
    static void dispatch ();
    //static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
private:
    //thread_t myHandle;
};

#endif //OSPROJECT_THREAD_HPP
