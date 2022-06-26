
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	a2013103          	ld	sp,-1504(sp) # 80005a20 <_GLOBAL_OFFSET_TABLE_+0x28>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	374020ef          	jal	ra,80002390 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <pushRegisters>:
.global pushRegisters
pushRegisters:
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    // https://sourceware.org/binutils/docs/as/Irp.html
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00313c23          	sd	gp,24(sp)
    80001008:	02413023          	sd	tp,32(sp)
    8000100c:	02513423          	sd	t0,40(sp)
    80001010:	02613823          	sd	t1,48(sp)
    80001014:	02713c23          	sd	t2,56(sp)
    80001018:	04813023          	sd	s0,64(sp)
    8000101c:	04913423          	sd	s1,72(sp)
    80001020:	04a13823          	sd	a0,80(sp)
    80001024:	04b13c23          	sd	a1,88(sp)
    80001028:	06c13023          	sd	a2,96(sp)
    8000102c:	06d13423          	sd	a3,104(sp)
    80001030:	06e13823          	sd	a4,112(sp)
    80001034:	06f13c23          	sd	a5,120(sp)
    80001038:	09013023          	sd	a6,128(sp)
    8000103c:	09113423          	sd	a7,136(sp)
    80001040:	09213823          	sd	s2,144(sp)
    80001044:	09313c23          	sd	s3,152(sp)
    80001048:	0b413023          	sd	s4,160(sp)
    8000104c:	0b513423          	sd	s5,168(sp)
    80001050:	0b613823          	sd	s6,176(sp)
    80001054:	0b713c23          	sd	s7,184(sp)
    80001058:	0d813023          	sd	s8,192(sp)
    8000105c:	0d913423          	sd	s9,200(sp)
    80001060:	0da13823          	sd	s10,208(sp)
    80001064:	0db13c23          	sd	s11,216(sp)
    80001068:	0fc13023          	sd	t3,224(sp)
    8000106c:	0fd13423          	sd	t4,232(sp)
    80001070:	0fe13823          	sd	t5,240(sp)
    80001074:	0ff13c23          	sd	t6,248(sp)
    ret
    80001078:	00008067          	ret

000000008000107c <popRegisters>:
.global popRegisters
popRegisters:
    // https://sourceware.org/binutils/docs/as/Irp.html
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    8000107c:	01813183          	ld	gp,24(sp)
    80001080:	02013203          	ld	tp,32(sp)
    80001084:	02813283          	ld	t0,40(sp)
    80001088:	03013303          	ld	t1,48(sp)
    8000108c:	03813383          	ld	t2,56(sp)
    80001090:	04013403          	ld	s0,64(sp)
    80001094:	04813483          	ld	s1,72(sp)
    80001098:	05013503          	ld	a0,80(sp)
    8000109c:	05813583          	ld	a1,88(sp)
    800010a0:	06013603          	ld	a2,96(sp)
    800010a4:	06813683          	ld	a3,104(sp)
    800010a8:	07013703          	ld	a4,112(sp)
    800010ac:	07813783          	ld	a5,120(sp)
    800010b0:	08013803          	ld	a6,128(sp)
    800010b4:	08813883          	ld	a7,136(sp)
    800010b8:	09013903          	ld	s2,144(sp)
    800010bc:	09813983          	ld	s3,152(sp)
    800010c0:	0a013a03          	ld	s4,160(sp)
    800010c4:	0a813a83          	ld	s5,168(sp)
    800010c8:	0b013b03          	ld	s6,176(sp)
    800010cc:	0b813b83          	ld	s7,184(sp)
    800010d0:	0c013c03          	ld	s8,192(sp)
    800010d4:	0c813c83          	ld	s9,200(sp)
    800010d8:	0d013d03          	ld	s10,208(sp)
    800010dc:	0d813d83          	ld	s11,216(sp)
    800010e0:	0e013e03          	ld	t3,224(sp)
    800010e4:	0e813e83          	ld	t4,232(sp)
    800010e8:	0f013f03          	ld	t5,240(sp)
    800010ec:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    800010f0:	10010113          	addi	sp,sp,256
    ret
    800010f4:	00008067          	ret
	...

0000000080001100 <_ZN5Riscv14supervisorTrapEv>:
.align 4
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
_ZN5Riscv14supervisorTrapEv:
    # push all registers to stack
    addi sp, sp, -256
    80001100:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001104:	00013023          	sd	zero,0(sp)
    80001108:	00113423          	sd	ra,8(sp)
    8000110c:	00213823          	sd	sp,16(sp)
    80001110:	00313c23          	sd	gp,24(sp)
    80001114:	02413023          	sd	tp,32(sp)
    80001118:	02513423          	sd	t0,40(sp)
    8000111c:	02613823          	sd	t1,48(sp)
    80001120:	02713c23          	sd	t2,56(sp)
    80001124:	04813023          	sd	s0,64(sp)
    80001128:	04913423          	sd	s1,72(sp)
    8000112c:	04a13823          	sd	a0,80(sp)
    80001130:	04b13c23          	sd	a1,88(sp)
    80001134:	06c13023          	sd	a2,96(sp)
    80001138:	06d13423          	sd	a3,104(sp)
    8000113c:	06e13823          	sd	a4,112(sp)
    80001140:	06f13c23          	sd	a5,120(sp)
    80001144:	09013023          	sd	a6,128(sp)
    80001148:	09113423          	sd	a7,136(sp)
    8000114c:	09213823          	sd	s2,144(sp)
    80001150:	09313c23          	sd	s3,152(sp)
    80001154:	0b413023          	sd	s4,160(sp)
    80001158:	0b513423          	sd	s5,168(sp)
    8000115c:	0b613823          	sd	s6,176(sp)
    80001160:	0b713c23          	sd	s7,184(sp)
    80001164:	0d813023          	sd	s8,192(sp)
    80001168:	0d913423          	sd	s9,200(sp)
    8000116c:	0da13823          	sd	s10,208(sp)
    80001170:	0db13c23          	sd	s11,216(sp)
    80001174:	0fc13023          	sd	t3,224(sp)
    80001178:	0fd13423          	sd	t4,232(sp)
    8000117c:	0fe13823          	sd	t5,240(sp)
    80001180:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleSupervisorTrapEv
    80001184:	361000ef          	jal	ra,80001ce4 <_ZN5Riscv20handleSupervisorTrapEv>

    sd a0, 10*8(sp)
    80001188:	04a13823          	sd	a0,80(sp)

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    8000118c:	00013003          	ld	zero,0(sp)
    80001190:	00813083          	ld	ra,8(sp)
    80001194:	01013103          	ld	sp,16(sp)
    80001198:	01813183          	ld	gp,24(sp)
    8000119c:	02013203          	ld	tp,32(sp)
    800011a0:	02813283          	ld	t0,40(sp)
    800011a4:	03013303          	ld	t1,48(sp)
    800011a8:	03813383          	ld	t2,56(sp)
    800011ac:	04013403          	ld	s0,64(sp)
    800011b0:	04813483          	ld	s1,72(sp)
    800011b4:	05013503          	ld	a0,80(sp)
    800011b8:	05813583          	ld	a1,88(sp)
    800011bc:	06013603          	ld	a2,96(sp)
    800011c0:	06813683          	ld	a3,104(sp)
    800011c4:	07013703          	ld	a4,112(sp)
    800011c8:	07813783          	ld	a5,120(sp)
    800011cc:	08013803          	ld	a6,128(sp)
    800011d0:	08813883          	ld	a7,136(sp)
    800011d4:	09013903          	ld	s2,144(sp)
    800011d8:	09813983          	ld	s3,152(sp)
    800011dc:	0a013a03          	ld	s4,160(sp)
    800011e0:	0a813a83          	ld	s5,168(sp)
    800011e4:	0b013b03          	ld	s6,176(sp)
    800011e8:	0b813b83          	ld	s7,184(sp)
    800011ec:	0c013c03          	ld	s8,192(sp)
    800011f0:	0c813c83          	ld	s9,200(sp)
    800011f4:	0d013d03          	ld	s10,208(sp)
    800011f8:	0d813d83          	ld	s11,216(sp)
    800011fc:	0e013e03          	ld	t3,224(sp)
    80001200:	0e813e83          	ld	t4,232(sp)
    80001204:	0f013f03          	ld	t5,240(sp)
    80001208:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    8000120c:	10010113          	addi	sp,sp,256

    sret
    80001210:	10200073          	sret
	...

0000000080001220 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001220:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001224:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001228:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000122c:	0085b103          	ld	sp,8(a1)

    ret
    80001230:	00008067          	ret

0000000080001234 <_Z9mem_allocm>:
// Created by os on 5/22/22.
//
#include "../h/syscall_c.hpp"
#include "../h/tcb.hpp"

void* mem_alloc(size_t size){
    80001234:	ff010113          	addi	sp,sp,-16
    80001238:	00813423          	sd	s0,8(sp)
    8000123c:	01010413          	addi	s0,sp,16
    size_t arg = 60;
    size_t num = 1;

    __asm__ volatile("mv %0, a0" : "=r" (arg));
    80001240:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001244:	00100713          	li	a4,1
    80001248:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (arg));
    8000124c:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    80001250:	00000073          	ecall

    void* ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001254:	00050513          	mv	a0,a0

    return ret;

}
    80001258:	00813403          	ld	s0,8(sp)
    8000125c:	01010113          	addi	sp,sp,16
    80001260:	00008067          	ret

0000000080001264 <_Z8mem_freePv>:

int mem_free(void* addr){
    80001264:	ff010113          	addi	sp,sp,-16
    80001268:	00813423          	sd	s0,8(sp)
    8000126c:	01010413          	addi	s0,sp,16
    void* arg = 0;
    int num = 2;

    __asm__ volatile("mv %0, a0" : "=r" (arg));
    80001270:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001274:	00200713          	li	a4,2
    80001278:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (arg));
    8000127c:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    80001280:	00000073          	ecall

    return 1;
}
    80001284:	00100513          	li	a0,1
    80001288:	00813403          	ld	s0,8(sp)
    8000128c:	01010113          	addi	sp,sp,16
    80001290:	00008067          	ret

0000000080001294 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg){
    80001294:	ff010113          	addi	sp,sp,-16
    80001298:	00813423          	sd	s0,8(sp)
    8000129c:	01010413          	addi	s0,sp,16
    thread_t* arg1 = 0;
    TCB::Body arg2 = 0;
    void* arg3 = 0;
    int num = 11;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    800012a0:	00050693          	mv	a3,a0
    __asm__ volatile("mv %0, a1" : "=r" (arg2));
    800012a4:	00058713          	mv	a4,a1
    __asm__ volatile("mv %0, a2" : "=r" (arg3));
    800012a8:	00060793          	mv	a5,a2
    __asm__ volatile("mv a0, %0" : : "r" (num));
    800012ac:	00b00613          	li	a2,11
    800012b0:	00060513          	mv	a0,a2
    __asm__ volatile("mv a1, %0" : : "r" (arg1));
    800012b4:	00068593          	mv	a1,a3
    __asm__ volatile("mv a2, %0" : : "r" (arg2));
    800012b8:	00070613          	mv	a2,a4
    __asm__ volatile("mv a3, %0" : : "r" (arg3));
    800012bc:	00078693          	mv	a3,a5

    __asm__ volatile("ecall");
    800012c0:	00000073          	ecall

    return 1;
}
    800012c4:	00100513          	li	a0,1
    800012c8:	00813403          	ld	s0,8(sp)
    800012cc:	01010113          	addi	sp,sp,16
    800012d0:	00008067          	ret

00000000800012d4 <_Z11thread_exitv>:

int thread_exit (){
    800012d4:	ff010113          	addi	sp,sp,-16
    800012d8:	00813423          	sd	s0,8(sp)
    800012dc:	01010413          	addi	s0,sp,16
    int num = 12;

    __asm__ volatile("mv a0, %0" : : "r" (num));
    800012e0:	00c00793          	li	a5,12
    800012e4:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800012e8:	00000073          	ecall

    return 1;
}
    800012ec:	00100513          	li	a0,1
    800012f0:	00813403          	ld	s0,8(sp)
    800012f4:	01010113          	addi	sp,sp,16
    800012f8:	00008067          	ret

00000000800012fc <_Z15thread_dispatchv>:

void thread_dispatch (){
    800012fc:	ff010113          	addi	sp,sp,-16
    80001300:	00813423          	sd	s0,8(sp)
    80001304:	01010413          	addi	s0,sp,16
    int num = 13;

    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001308:	00d00793          	li	a5,13
    8000130c:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001310:	00000073          	ecall
}
    80001314:	00813403          	ld	s0,8(sp)
    80001318:	01010113          	addi	sp,sp,16
    8000131c:	00008067          	ret

0000000080001320 <_Z8sem_openPP4_semj>:

int sem_open (sem_t* handle, unsigned init){
    80001320:	ff010113          	addi	sp,sp,-16
    80001324:	00813423          	sd	s0,8(sp)
    80001328:	01010413          	addi	s0,sp,16
    sem_t* arg1 = 0;
    unsigned arg2 = 0;
    int num = 21;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    8000132c:	00050713          	mv	a4,a0
    __asm__ volatile("mv %0, a1" : "=r" (arg2));
    80001330:	00058793          	mv	a5,a1
    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001334:	01500693          	li	a3,21
    80001338:	00068513          	mv	a0,a3
    __asm__ volatile("mv a1, %0" : : "r" (arg1));
    8000133c:	00070593          	mv	a1,a4
    __asm__ volatile("mv a2, %0" : : "r" (arg2));
    80001340:	00078613          	mv	a2,a5

    __asm__ volatile("ecall");
    80001344:	00000073          	ecall

    return 1;

}
    80001348:	00100513          	li	a0,1
    8000134c:	00813403          	ld	s0,8(sp)
    80001350:	01010113          	addi	sp,sp,16
    80001354:	00008067          	ret

0000000080001358 <_Z9sem_closeP4_sem>:

int sem_close (sem_t handle){
    80001358:	ff010113          	addi	sp,sp,-16
    8000135c:	00813423          	sd	s0,8(sp)
    80001360:	01010413          	addi	s0,sp,16
    sem_t arg1 = 0;
    int num = 22;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    80001364:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001368:	01600713          	li	a4,22
    8000136c:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (arg1));
    80001370:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    80001374:	00000073          	ecall

    return 1;
}
    80001378:	00100513          	li	a0,1
    8000137c:	00813403          	ld	s0,8(sp)
    80001380:	01010113          	addi	sp,sp,16
    80001384:	00008067          	ret

0000000080001388 <_Z8sem_waitP4_sem>:

int sem_wait (sem_t id){
    80001388:	ff010113          	addi	sp,sp,-16
    8000138c:	00813423          	sd	s0,8(sp)
    80001390:	01010413          	addi	s0,sp,16
    sem_t arg1 = 0;
    int num = 23;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    80001394:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001398:	01700713          	li	a4,23
    8000139c:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (arg1));
    800013a0:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    800013a4:	00000073          	ecall

    return 1;
}
    800013a8:	00100513          	li	a0,1
    800013ac:	00813403          	ld	s0,8(sp)
    800013b0:	01010113          	addi	sp,sp,16
    800013b4:	00008067          	ret

00000000800013b8 <_Z10sem_signalP4_sem>:

int sem_signal (sem_t id){
    800013b8:	ff010113          	addi	sp,sp,-16
    800013bc:	00813423          	sd	s0,8(sp)
    800013c0:	01010413          	addi	s0,sp,16
    sem_t arg1 = 0;
    int num = 24;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    800013c4:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    800013c8:	01800713          	li	a4,24
    800013cc:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (arg1));
    800013d0:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    800013d4:	00000073          	ecall

    return 1;
    800013d8:	00100513          	li	a0,1
    800013dc:	00813403          	ld	s0,8(sp)
    800013e0:	01010113          	addi	sp,sp,16
    800013e4:	00008067          	ret

00000000800013e8 <_Z11workerBodyAPv>:
#include "../h/print.hpp"
#include "../h/ccb.hpp"
#include "../h/tcb.hpp"


void workerBodyA(void *pVoid) {
    800013e8:	fe010113          	addi	sp,sp,-32
    800013ec:	00113c23          	sd	ra,24(sp)
    800013f0:	00813823          	sd	s0,16(sp)
    800013f4:	00913423          	sd	s1,8(sp)
    800013f8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800013fc:	00000493          	li	s1,0
    80001400:	0300006f          	j	80001430 <_Z11workerBodyAPv+0x48>
        printString("A: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    80001404:	00168693          	addi	a3,a3,1
    80001408:	000027b7          	lui	a5,0x2
    8000140c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001410:	00d7ee63          	bltu	a5,a3,8000142c <_Z11workerBodyAPv+0x44>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001414:	00000713          	li	a4,0
    80001418:	000077b7          	lui	a5,0x7
    8000141c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001420:	fee7e2e3          	bltu	a5,a4,80001404 <_Z11workerBodyAPv+0x1c>
    80001424:	00170713          	addi	a4,a4,1
    80001428:	ff1ff06f          	j	80001418 <_Z11workerBodyAPv+0x30>
    for (uint64 i = 0; i < 10; i++) {
    8000142c:	00148493          	addi	s1,s1,1
    80001430:	00900793          	li	a5,9
    80001434:	0297ec63          	bltu	a5,s1,8000146c <_Z11workerBodyAPv+0x84>
        printString("A: i="); printInteger(i); printString("\n");
    80001438:	00004517          	auipc	a0,0x4
    8000143c:	be850513          	addi	a0,a0,-1048 # 80005020 <CONSOLE_STATUS+0x10>
    80001440:	00001097          	auipc	ra,0x1
    80001444:	e50080e7          	jalr	-432(ra) # 80002290 <_Z11printStringPKc>
    80001448:	00048513          	mv	a0,s1
    8000144c:	00001097          	auipc	ra,0x1
    80001450:	eb4080e7          	jalr	-332(ra) # 80002300 <_Z12printIntegerm>
    80001454:	00004517          	auipc	a0,0x4
    80001458:	c9c50513          	addi	a0,a0,-868 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000145c:	00001097          	auipc	ra,0x1
    80001460:	e34080e7          	jalr	-460(ra) # 80002290 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001464:	00000693          	li	a3,0
    80001468:	fa1ff06f          	j	80001408 <_Z11workerBodyAPv+0x20>
            // TCB::yield();
        }
    }
}
    8000146c:	01813083          	ld	ra,24(sp)
    80001470:	01013403          	ld	s0,16(sp)
    80001474:	00813483          	ld	s1,8(sp)
    80001478:	02010113          	addi	sp,sp,32
    8000147c:	00008067          	ret

0000000080001480 <_Z11workerBodyBPv>:

void workerBodyB(void *pVoid) {
    80001480:	fe010113          	addi	sp,sp,-32
    80001484:	00113c23          	sd	ra,24(sp)
    80001488:	00813823          	sd	s0,16(sp)
    8000148c:	00913423          	sd	s1,8(sp)
    80001490:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001494:	00000493          	li	s1,0
    80001498:	0300006f          	j	800014c8 <_Z11workerBodyBPv+0x48>
        printString("B: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    8000149c:	00168693          	addi	a3,a3,1
    800014a0:	000027b7          	lui	a5,0x2
    800014a4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800014a8:	00d7ee63          	bltu	a5,a3,800014c4 <_Z11workerBodyBPv+0x44>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800014ac:	00000713          	li	a4,0
    800014b0:	000077b7          	lui	a5,0x7
    800014b4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800014b8:	fee7e2e3          	bltu	a5,a4,8000149c <_Z11workerBodyBPv+0x1c>
    800014bc:	00170713          	addi	a4,a4,1
    800014c0:	ff1ff06f          	j	800014b0 <_Z11workerBodyBPv+0x30>
    for (uint64 i = 0; i < 16; i++) {
    800014c4:	00148493          	addi	s1,s1,1
    800014c8:	00f00793          	li	a5,15
    800014cc:	0297ec63          	bltu	a5,s1,80001504 <_Z11workerBodyBPv+0x84>
        printString("B: i="); printInteger(i); printString("\n");
    800014d0:	00004517          	auipc	a0,0x4
    800014d4:	b5850513          	addi	a0,a0,-1192 # 80005028 <CONSOLE_STATUS+0x18>
    800014d8:	00001097          	auipc	ra,0x1
    800014dc:	db8080e7          	jalr	-584(ra) # 80002290 <_Z11printStringPKc>
    800014e0:	00048513          	mv	a0,s1
    800014e4:	00001097          	auipc	ra,0x1
    800014e8:	e1c080e7          	jalr	-484(ra) # 80002300 <_Z12printIntegerm>
    800014ec:	00004517          	auipc	a0,0x4
    800014f0:	c0450513          	addi	a0,a0,-1020 # 800050f0 <CONSOLE_STATUS+0xe0>
    800014f4:	00001097          	auipc	ra,0x1
    800014f8:	d9c080e7          	jalr	-612(ra) # 80002290 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800014fc:	00000693          	li	a3,0
    80001500:	fa1ff06f          	j	800014a0 <_Z11workerBodyBPv+0x20>
            // TCB::yield();
        }
    }
}
    80001504:	01813083          	ld	ra,24(sp)
    80001508:	01013403          	ld	s0,16(sp)
    8000150c:	00813483          	ld	s1,8(sp)
    80001510:	02010113          	addi	sp,sp,32
    80001514:	00008067          	ret

0000000080001518 <_Z9fibonaccim>:

uint64 fibonacci(uint64 n) {
    80001518:	fe010113          	addi	sp,sp,-32
    8000151c:	00113c23          	sd	ra,24(sp)
    80001520:	00813823          	sd	s0,16(sp)
    80001524:	00913423          	sd	s1,8(sp)
    80001528:	01213023          	sd	s2,0(sp)
    8000152c:	02010413          	addi	s0,sp,32
    80001530:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80001534:	00100793          	li	a5,1
    80001538:	02a7f863          	bgeu	a5,a0,80001568 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { TCB::yield(); }
    8000153c:	00a00793          	li	a5,10
    80001540:	02f577b3          	remu	a5,a0,a5
    80001544:	02078e63          	beqz	a5,80001580 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001548:	fff48513          	addi	a0,s1,-1
    8000154c:	00000097          	auipc	ra,0x0
    80001550:	fcc080e7          	jalr	-52(ra) # 80001518 <_Z9fibonaccim>
    80001554:	00050913          	mv	s2,a0
    80001558:	ffe48513          	addi	a0,s1,-2
    8000155c:	00000097          	auipc	ra,0x0
    80001560:	fbc080e7          	jalr	-68(ra) # 80001518 <_Z9fibonaccim>
    80001564:	00a90533          	add	a0,s2,a0
}
    80001568:	01813083          	ld	ra,24(sp)
    8000156c:	01013403          	ld	s0,16(sp)
    80001570:	00813483          	ld	s1,8(sp)
    80001574:	00013903          	ld	s2,0(sp)
    80001578:	02010113          	addi	sp,sp,32
    8000157c:	00008067          	ret
    if (n % 10 == 0) { TCB::yield(); }
    80001580:	00000097          	auipc	ra,0x0
    80001584:	508080e7          	jalr	1288(ra) # 80001a88 <_ZN3TCB5yieldEv>
    80001588:	fc1ff06f          	j	80001548 <_Z9fibonaccim+0x30>

000000008000158c <_Z11workerBodyCPv>:
void workerBodyC(void *pVoid) {
    8000158c:	fe010113          	addi	sp,sp,-32
    80001590:	00113c23          	sd	ra,24(sp)
    80001594:	00813823          	sd	s0,16(sp)
    80001598:	00913423          	sd	s1,8(sp)
    8000159c:	01213023          	sd	s2,0(sp)
    800015a0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800015a4:	00000493          	li	s1,0
    800015a8:	0380006f          	j	800015e0 <_Z11workerBodyCPv+0x54>
    for (; i < 3; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    800015ac:	00004517          	auipc	a0,0x4
    800015b0:	a8450513          	addi	a0,a0,-1404 # 80005030 <CONSOLE_STATUS+0x20>
    800015b4:	00001097          	auipc	ra,0x1
    800015b8:	cdc080e7          	jalr	-804(ra) # 80002290 <_Z11printStringPKc>
    800015bc:	00048513          	mv	a0,s1
    800015c0:	00001097          	auipc	ra,0x1
    800015c4:	d40080e7          	jalr	-704(ra) # 80002300 <_Z12printIntegerm>
    800015c8:	00004517          	auipc	a0,0x4
    800015cc:	b2850513          	addi	a0,a0,-1240 # 800050f0 <CONSOLE_STATUS+0xe0>
    800015d0:	00001097          	auipc	ra,0x1
    800015d4:	cc0080e7          	jalr	-832(ra) # 80002290 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800015d8:	0014849b          	addiw	s1,s1,1
    800015dc:	0ff4f493          	andi	s1,s1,255
    800015e0:	00200793          	li	a5,2
    800015e4:	fc97f4e3          	bgeu	a5,s1,800015ac <_Z11workerBodyCPv+0x20>
    }

    printString("C: yield\n");
    800015e8:	00004517          	auipc	a0,0x4
    800015ec:	a5050513          	addi	a0,a0,-1456 # 80005038 <CONSOLE_STATUS+0x28>
    800015f0:	00001097          	auipc	ra,0x1
    800015f4:	ca0080e7          	jalr	-864(ra) # 80002290 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800015f8:	00700313          	li	t1,7
    TCB::yield();
    800015fc:	00000097          	auipc	ra,0x0
    80001600:	48c080e7          	jalr	1164(ra) # 80001a88 <_ZN3TCB5yieldEv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001604:	00030913          	mv	s2,t1

    printString("C: t1="); printInteger(t1); printString("\n");
    80001608:	00004517          	auipc	a0,0x4
    8000160c:	a4050513          	addi	a0,a0,-1472 # 80005048 <CONSOLE_STATUS+0x38>
    80001610:	00001097          	auipc	ra,0x1
    80001614:	c80080e7          	jalr	-896(ra) # 80002290 <_Z11printStringPKc>
    80001618:	00090513          	mv	a0,s2
    8000161c:	00001097          	auipc	ra,0x1
    80001620:	ce4080e7          	jalr	-796(ra) # 80002300 <_Z12printIntegerm>
    80001624:	00004517          	auipc	a0,0x4
    80001628:	acc50513          	addi	a0,a0,-1332 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000162c:	00001097          	auipc	ra,0x1
    80001630:	c64080e7          	jalr	-924(ra) # 80002290 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001634:	00c00513          	li	a0,12
    80001638:	00000097          	auipc	ra,0x0
    8000163c:	ee0080e7          	jalr	-288(ra) # 80001518 <_Z9fibonaccim>
    80001640:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInteger(result); printString("\n");
    80001644:	00004517          	auipc	a0,0x4
    80001648:	a0c50513          	addi	a0,a0,-1524 # 80005050 <CONSOLE_STATUS+0x40>
    8000164c:	00001097          	auipc	ra,0x1
    80001650:	c44080e7          	jalr	-956(ra) # 80002290 <_Z11printStringPKc>
    80001654:	00090513          	mv	a0,s2
    80001658:	00001097          	auipc	ra,0x1
    8000165c:	ca8080e7          	jalr	-856(ra) # 80002300 <_Z12printIntegerm>
    80001660:	00004517          	auipc	a0,0x4
    80001664:	a9050513          	addi	a0,a0,-1392 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001668:	00001097          	auipc	ra,0x1
    8000166c:	c28080e7          	jalr	-984(ra) # 80002290 <_Z11printStringPKc>
    80001670:	0380006f          	j	800016a8 <_Z11workerBodyCPv+0x11c>

    for (; i < 6; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    80001674:	00004517          	auipc	a0,0x4
    80001678:	9bc50513          	addi	a0,a0,-1604 # 80005030 <CONSOLE_STATUS+0x20>
    8000167c:	00001097          	auipc	ra,0x1
    80001680:	c14080e7          	jalr	-1004(ra) # 80002290 <_Z11printStringPKc>
    80001684:	00048513          	mv	a0,s1
    80001688:	00001097          	auipc	ra,0x1
    8000168c:	c78080e7          	jalr	-904(ra) # 80002300 <_Z12printIntegerm>
    80001690:	00004517          	auipc	a0,0x4
    80001694:	a6050513          	addi	a0,a0,-1440 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001698:	00001097          	auipc	ra,0x1
    8000169c:	bf8080e7          	jalr	-1032(ra) # 80002290 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800016a0:	0014849b          	addiw	s1,s1,1
    800016a4:	0ff4f493          	andi	s1,s1,255
    800016a8:	00500793          	li	a5,5
    800016ac:	fc97f4e3          	bgeu	a5,s1,80001674 <_Z11workerBodyCPv+0xe8>
    }
//    TCB::yield();
}
    800016b0:	01813083          	ld	ra,24(sp)
    800016b4:	01013403          	ld	s0,16(sp)
    800016b8:	00813483          	ld	s1,8(sp)
    800016bc:	00013903          	ld	s2,0(sp)
    800016c0:	02010113          	addi	sp,sp,32
    800016c4:	00008067          	ret

00000000800016c8 <_Z11workerBodyDPv>:
void workerBodyD(void *pVoid) {
    800016c8:	fe010113          	addi	sp,sp,-32
    800016cc:	00113c23          	sd	ra,24(sp)
    800016d0:	00813823          	sd	s0,16(sp)
    800016d4:	00913423          	sd	s1,8(sp)
    800016d8:	01213023          	sd	s2,0(sp)
    800016dc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800016e0:	00a00493          	li	s1,10
    800016e4:	0380006f          	j	8000171c <_Z11workerBodyDPv+0x54>
    for (; i < 13; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    800016e8:	00004517          	auipc	a0,0x4
    800016ec:	97850513          	addi	a0,a0,-1672 # 80005060 <CONSOLE_STATUS+0x50>
    800016f0:	00001097          	auipc	ra,0x1
    800016f4:	ba0080e7          	jalr	-1120(ra) # 80002290 <_Z11printStringPKc>
    800016f8:	00048513          	mv	a0,s1
    800016fc:	00001097          	auipc	ra,0x1
    80001700:	c04080e7          	jalr	-1020(ra) # 80002300 <_Z12printIntegerm>
    80001704:	00004517          	auipc	a0,0x4
    80001708:	9ec50513          	addi	a0,a0,-1556 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000170c:	00001097          	auipc	ra,0x1
    80001710:	b84080e7          	jalr	-1148(ra) # 80002290 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80001714:	0014849b          	addiw	s1,s1,1
    80001718:	0ff4f493          	andi	s1,s1,255
    8000171c:	00c00793          	li	a5,12
    80001720:	fc97f4e3          	bgeu	a5,s1,800016e8 <_Z11workerBodyDPv+0x20>
    }

    printString("D: yield\n");
    80001724:	00004517          	auipc	a0,0x4
    80001728:	94450513          	addi	a0,a0,-1724 # 80005068 <CONSOLE_STATUS+0x58>
    8000172c:	00001097          	auipc	ra,0x1
    80001730:	b64080e7          	jalr	-1180(ra) # 80002290 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001734:	00500313          	li	t1,5
    TCB::yield();
    80001738:	00000097          	auipc	ra,0x0
    8000173c:	350080e7          	jalr	848(ra) # 80001a88 <_ZN3TCB5yieldEv>

    uint64 result = fibonacci(16);
    80001740:	01000513          	li	a0,16
    80001744:	00000097          	auipc	ra,0x0
    80001748:	dd4080e7          	jalr	-556(ra) # 80001518 <_Z9fibonaccim>
    8000174c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInteger(result); printString("\n");
    80001750:	00004517          	auipc	a0,0x4
    80001754:	92850513          	addi	a0,a0,-1752 # 80005078 <CONSOLE_STATUS+0x68>
    80001758:	00001097          	auipc	ra,0x1
    8000175c:	b38080e7          	jalr	-1224(ra) # 80002290 <_Z11printStringPKc>
    80001760:	00090513          	mv	a0,s2
    80001764:	00001097          	auipc	ra,0x1
    80001768:	b9c080e7          	jalr	-1124(ra) # 80002300 <_Z12printIntegerm>
    8000176c:	00004517          	auipc	a0,0x4
    80001770:	98450513          	addi	a0,a0,-1660 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001774:	00001097          	auipc	ra,0x1
    80001778:	b1c080e7          	jalr	-1252(ra) # 80002290 <_Z11printStringPKc>
    8000177c:	0380006f          	j	800017b4 <_Z11workerBodyDPv+0xec>

    for (; i < 16; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    80001780:	00004517          	auipc	a0,0x4
    80001784:	8e050513          	addi	a0,a0,-1824 # 80005060 <CONSOLE_STATUS+0x50>
    80001788:	00001097          	auipc	ra,0x1
    8000178c:	b08080e7          	jalr	-1272(ra) # 80002290 <_Z11printStringPKc>
    80001790:	00048513          	mv	a0,s1
    80001794:	00001097          	auipc	ra,0x1
    80001798:	b6c080e7          	jalr	-1172(ra) # 80002300 <_Z12printIntegerm>
    8000179c:	00004517          	auipc	a0,0x4
    800017a0:	95450513          	addi	a0,a0,-1708 # 800050f0 <CONSOLE_STATUS+0xe0>
    800017a4:	00001097          	auipc	ra,0x1
    800017a8:	aec080e7          	jalr	-1300(ra) # 80002290 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800017ac:	0014849b          	addiw	s1,s1,1
    800017b0:	0ff4f493          	andi	s1,s1,255
    800017b4:	00f00793          	li	a5,15
    800017b8:	fc97f4e3          	bgeu	a5,s1,80001780 <_Z11workerBodyDPv+0xb8>
    }
//    TCB::yield();
}
    800017bc:	01813083          	ld	ra,24(sp)
    800017c0:	01013403          	ld	s0,16(sp)
    800017c4:	00813483          	ld	s1,8(sp)
    800017c8:	00013903          	ld	s2,0(sp)
    800017cc:	02010113          	addi	sp,sp,32
    800017d0:	00008067          	ret

00000000800017d4 <main>:
#include "../h/tcb.hpp"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"

int main() {
    800017d4:	fb010113          	addi	sp,sp,-80
    800017d8:	04113423          	sd	ra,72(sp)
    800017dc:	04813023          	sd	s0,64(sp)
    800017e0:	02913c23          	sd	s1,56(sp)
    800017e4:	03213823          	sd	s2,48(sp)
    800017e8:	05010413          	addi	s0,sp,80
    MemoryAllocator::memAlloc();
    800017ec:	00001097          	auipc	ra,0x1
    800017f0:	828080e7          	jalr	-2008(ra) # 80002014 <_ZN15MemoryAllocator8memAllocEv>
    TCB *threads[5];

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    800017f4:	00004797          	auipc	a5,0x4
    800017f8:	21c7b783          	ld	a5,540(a5) # 80005a10 <_GLOBAL_OFFSET_TABLE_+0x18>
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    800017fc:	10579073          	csrw	stvec,a5

    thread_create(&threads[0], nullptr, nullptr);
    80001800:	00000613          	li	a2,0
    80001804:	00000593          	li	a1,0
    80001808:	fb840513          	addi	a0,s0,-72
    8000180c:	00000097          	auipc	ra,0x0
    80001810:	a88080e7          	jalr	-1400(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = threads[0];
    80001814:	fb843703          	ld	a4,-72(s0)
    80001818:	00004797          	auipc	a5,0x4
    8000181c:	2187b783          	ld	a5,536(a5) # 80005a30 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001820:	00e7b023          	sd	a4,0(a5)
    thread_create(&threads[1], workerBodyA, nullptr);
    80001824:	00000613          	li	a2,0
    80001828:	00004597          	auipc	a1,0x4
    8000182c:	2005b583          	ld	a1,512(a1) # 80005a28 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001830:	fc040513          	addi	a0,s0,-64
    80001834:	00000097          	auipc	ra,0x0
    80001838:	a60080e7          	jalr	-1440(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    8000183c:	00004517          	auipc	a0,0x4
    80001840:	84c50513          	addi	a0,a0,-1972 # 80005088 <CONSOLE_STATUS+0x78>
    80001844:	00001097          	auipc	ra,0x1
    80001848:	a4c080e7          	jalr	-1460(ra) # 80002290 <_Z11printStringPKc>
    thread_create(&threads[2], workerBodyB, nullptr);
    8000184c:	00000613          	li	a2,0
    80001850:	00004597          	auipc	a1,0x4
    80001854:	1f05b583          	ld	a1,496(a1) # 80005a40 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001858:	fc840513          	addi	a0,s0,-56
    8000185c:	00000097          	auipc	ra,0x0
    80001860:	a38080e7          	jalr	-1480(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80001864:	00004517          	auipc	a0,0x4
    80001868:	83c50513          	addi	a0,a0,-1988 # 800050a0 <CONSOLE_STATUS+0x90>
    8000186c:	00001097          	auipc	ra,0x1
    80001870:	a24080e7          	jalr	-1500(ra) # 80002290 <_Z11printStringPKc>
    thread_create(&threads[3], workerBodyC, nullptr);
    80001874:	00000613          	li	a2,0
    80001878:	00004597          	auipc	a1,0x4
    8000187c:	1905b583          	ld	a1,400(a1) # 80005a08 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001880:	fd040513          	addi	a0,s0,-48
    80001884:	00000097          	auipc	ra,0x0
    80001888:	a10080e7          	jalr	-1520(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000188c:	00004517          	auipc	a0,0x4
    80001890:	82c50513          	addi	a0,a0,-2004 # 800050b8 <CONSOLE_STATUS+0xa8>
    80001894:	00001097          	auipc	ra,0x1
    80001898:	9fc080e7          	jalr	-1540(ra) # 80002290 <_Z11printStringPKc>
    thread_create(&threads[4], workerBodyD, nullptr);
    8000189c:	00000613          	li	a2,0
    800018a0:	00004597          	auipc	a1,0x4
    800018a4:	1a85b583          	ld	a1,424(a1) # 80005a48 <_GLOBAL_OFFSET_TABLE_+0x50>
    800018a8:	fd840513          	addi	a0,s0,-40
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	9e8080e7          	jalr	-1560(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800018b4:	00004517          	auipc	a0,0x4
    800018b8:	81c50513          	addi	a0,a0,-2020 # 800050d0 <CONSOLE_STATUS+0xc0>
    800018bc:	00001097          	auipc	ra,0x1
    800018c0:	9d4080e7          	jalr	-1580(ra) # 80002290 <_Z11printStringPKc>
inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800018c4:	00200793          	li	a5,2
    800018c8:	1007a073          	csrs	sstatus,a5
}
    800018cc:	00c0006f          	j	800018d8 <main+0x104>

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
             threads[3]->isFinished() && threads[4]->isFinished())) {
        thread_dispatch();
    800018d0:	00000097          	auipc	ra,0x0
    800018d4:	a2c080e7          	jalr	-1492(ra) # 800012fc <_Z15thread_dispatchv>
    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
    800018d8:	fc043783          	ld	a5,-64(s0)
#include "../lib/hw.h"

class TCB {
        public:
        ~TCB() { delete[] stack; }
        bool isFinished() const { return finished; }
    800018dc:	0287c783          	lbu	a5,40(a5)
    800018e0:	fe0788e3          	beqz	a5,800018d0 <main+0xfc>
    800018e4:	fc843783          	ld	a5,-56(s0)
    800018e8:	0287c783          	lbu	a5,40(a5)
    800018ec:	fe0782e3          	beqz	a5,800018d0 <main+0xfc>
             threads[3]->isFinished() && threads[4]->isFinished())) {
    800018f0:	fd043783          	ld	a5,-48(s0)
    800018f4:	0287c783          	lbu	a5,40(a5)
    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
    800018f8:	fc078ce3          	beqz	a5,800018d0 <main+0xfc>
             threads[3]->isFinished() && threads[4]->isFinished())) {
    800018fc:	fd843783          	ld	a5,-40(s0)
    80001900:	0287c783          	lbu	a5,40(a5)
    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
    80001904:	fc0786e3          	beqz	a5,800018d0 <main+0xfc>
    80001908:	fb840493          	addi	s1,s0,-72
    8000190c:	0140006f          	j	80001920 <main+0x14c>
    }
    for (auto &thread: threads) { delete thread; }
    80001910:	00090513          	mv	a0,s2
    80001914:	00000097          	auipc	ra,0x0
    80001918:	2e4080e7          	jalr	740(ra) # 80001bf8 <_ZdlPv>
    8000191c:	00848493          	addi	s1,s1,8
    80001920:	fe040793          	addi	a5,s0,-32
    80001924:	02f48063          	beq	s1,a5,80001944 <main+0x170>
    80001928:	0004b903          	ld	s2,0(s1)
    8000192c:	fe0908e3          	beqz	s2,8000191c <main+0x148>
        ~TCB() { delete[] stack; }
    80001930:	00893503          	ld	a0,8(s2)
    80001934:	fc050ee3          	beqz	a0,80001910 <main+0x13c>
    80001938:	00000097          	auipc	ra,0x0
    8000193c:	2e8080e7          	jalr	744(ra) # 80001c20 <_ZdaPv>
    80001940:	fd1ff06f          	j	80001910 <main+0x13c>
    printString("Finished\n");
    80001944:	00003517          	auipc	a0,0x3
    80001948:	7a450513          	addi	a0,a0,1956 # 800050e8 <CONSOLE_STATUS+0xd8>
    8000194c:	00001097          	auipc	ra,0x1
    80001950:	944080e7          	jalr	-1724(ra) # 80002290 <_Z11printStringPKc>
    return 0;
    80001954:	00000513          	li	a0,0
    80001958:	04813083          	ld	ra,72(sp)
    8000195c:	04013403          	ld	s0,64(sp)
    80001960:	03813483          	ld	s1,56(sp)
    80001964:	03013903          	ld	s2,48(sp)
    80001968:	05010113          	addi	sp,sp,80
    8000196c:	00008067          	ret

0000000080001970 <_ZN3TCBC1EPFvvEm>:


TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

TCB::TCB(Body body, uint64 timeSlice) : body(body),
    80001970:	fd010113          	addi	sp,sp,-48
    80001974:	02113423          	sd	ra,40(sp)
    80001978:	02813023          	sd	s0,32(sp)
    8000197c:	00913c23          	sd	s1,24(sp)
    80001980:	01213823          	sd	s2,16(sp)
    80001984:	01313423          	sd	s3,8(sp)
    80001988:	03010413          	addi	s0,sp,48
    8000198c:	00050493          	mv	s1,a0
    80001990:	00058913          	mv	s2,a1
    80001994:	00060993          	mv	s3,a2
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
context({(uint64) &threadWrapper,
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
timeSlice(timeSlice),
finished(false) {
    80001998:	00b53023          	sd	a1,0(a0)
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    8000199c:	06058263          	beqz	a1,80001a00 <_ZN3TCBC1EPFvvEm+0x90>
    800019a0:	00002537          	lui	a0,0x2
    800019a4:	00000097          	auipc	ra,0x0
    800019a8:	22c080e7          	jalr	556(ra) # 80001bd0 <_Znam>
finished(false) {
    800019ac:	00a4b423          	sd	a0,8(s1)
    800019b0:	00000797          	auipc	a5,0x0
    800019b4:	0f478793          	addi	a5,a5,244 # 80001aa4 <_ZN3TCB13threadWrapperEv>
    800019b8:	00f4b823          	sd	a5,16(s1)
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
    800019bc:	04050663          	beqz	a0,80001a08 <_ZN3TCBC1EPFvvEm+0x98>
    800019c0:	000027b7          	lui	a5,0x2
    800019c4:	00f50533          	add	a0,a0,a5
finished(false) {
    800019c8:	00a4bc23          	sd	a0,24(s1)
    800019cc:	0334b023          	sd	s3,32(s1)
    800019d0:	02048423          	sb	zero,40(s1)
    if (body != nullptr) { Scheduler::put(this); }
    800019d4:	00090863          	beqz	s2,800019e4 <_ZN3TCBC1EPFvvEm+0x74>
    800019d8:	00048513          	mv	a0,s1
    800019dc:	00000097          	auipc	ra,0x0
    800019e0:	598080e7          	jalr	1432(ra) # 80001f74 <_ZN9Scheduler3putEP3TCB>
}
    800019e4:	02813083          	ld	ra,40(sp)
    800019e8:	02013403          	ld	s0,32(sp)
    800019ec:	01813483          	ld	s1,24(sp)
    800019f0:	01013903          	ld	s2,16(sp)
    800019f4:	00813983          	ld	s3,8(sp)
    800019f8:	03010113          	addi	sp,sp,48
    800019fc:	00008067          	ret
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    80001a00:	00000513          	li	a0,0
    80001a04:	fa9ff06f          	j	800019ac <_ZN3TCBC1EPFvvEm+0x3c>
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
    80001a08:	00000513          	li	a0,0
    80001a0c:	fbdff06f          	j	800019c8 <_ZN3TCBC1EPFvvEm+0x58>

0000000080001a10 <_ZN3TCB12createThreadEPFvvE>:

TCB *TCB::createThread(Body body) {
    80001a10:	fe010113          	addi	sp,sp,-32
    80001a14:	00113c23          	sd	ra,24(sp)
    80001a18:	00813823          	sd	s0,16(sp)
    80001a1c:	00913423          	sd	s1,8(sp)
    80001a20:	01213023          	sd	s2,0(sp)
    80001a24:	02010413          	addi	s0,sp,32
    80001a28:	00050913          	mv	s2,a0
    return new TCB(body, TIME_SLICE);
    80001a2c:	03000513          	li	a0,48
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	178080e7          	jalr	376(ra) # 80001ba8 <_Znwm>
    80001a38:	00050493          	mv	s1,a0
    80001a3c:	00200613          	li	a2,2
    80001a40:	00090593          	mv	a1,s2
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	f2c080e7          	jalr	-212(ra) # 80001970 <_ZN3TCBC1EPFvvEm>
    80001a4c:	0200006f          	j	80001a6c <_ZN3TCB12createThreadEPFvvE+0x5c>
    80001a50:	00050913          	mv	s2,a0
    80001a54:	00048513          	mv	a0,s1
    80001a58:	00000097          	auipc	ra,0x0
    80001a5c:	1a0080e7          	jalr	416(ra) # 80001bf8 <_ZdlPv>
    80001a60:	00090513          	mv	a0,s2
    80001a64:	00005097          	auipc	ra,0x5
    80001a68:	134080e7          	jalr	308(ra) # 80006b98 <_Unwind_Resume>
}
    80001a6c:	00048513          	mv	a0,s1
    80001a70:	01813083          	ld	ra,24(sp)
    80001a74:	01013403          	ld	s0,16(sp)
    80001a78:	00813483          	ld	s1,8(sp)
    80001a7c:	00013903          	ld	s2,0(sp)
    80001a80:	02010113          	addi	sp,sp,32
    80001a84:	00008067          	ret

0000000080001a88 <_ZN3TCB5yieldEv>:

void TCB::yield() { __asm__ volatile ("ecall"); }
    80001a88:	ff010113          	addi	sp,sp,-16
    80001a8c:	00813423          	sd	s0,8(sp)
    80001a90:	01010413          	addi	s0,sp,16
    80001a94:	00000073          	ecall
    80001a98:	00813403          	ld	s0,8(sp)
    80001a9c:	01010113          	addi	sp,sp,16
    80001aa0:	00008067          	ret

0000000080001aa4 <_ZN3TCB13threadWrapperEv>:
    running = Scheduler::get();
    Riscv::w_sstatus(sstatus);
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper() {
    80001aa4:	fe010113          	addi	sp,sp,-32
    80001aa8:	00113c23          	sd	ra,24(sp)
    80001aac:	00813823          	sd	s0,16(sp)
    80001ab0:	00913423          	sd	s1,8(sp)
    80001ab4:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    80001ab8:	00000097          	auipc	ra,0x0
    80001abc:	20c080e7          	jalr	524(ra) # 80001cc4 <_ZN5Riscv10popSppSpieEv>
    running->body();
    80001ac0:	00004497          	auipc	s1,0x4
    80001ac4:	fe048493          	addi	s1,s1,-32 # 80005aa0 <_ZN3TCB7runningE>
    80001ac8:	0004b783          	ld	a5,0(s1)
    80001acc:	0007b783          	ld	a5,0(a5) # 2000 <_entry-0x7fffe000>
    80001ad0:	000780e7          	jalr	a5
    running->setFinished(true);
    80001ad4:	0004b783          	ld	a5,0(s1)
        void setFinished(bool value) { finished = value; }
    80001ad8:	00100713          	li	a4,1
    80001adc:	02e78423          	sb	a4,40(a5)
    TCB::yield();
    80001ae0:	00000097          	auipc	ra,0x0
    80001ae4:	fa8080e7          	jalr	-88(ra) # 80001a88 <_ZN3TCB5yieldEv>
}
    80001ae8:	01813083          	ld	ra,24(sp)
    80001aec:	01013403          	ld	s0,16(sp)
    80001af0:	00813483          	ld	s1,8(sp)
    80001af4:	02010113          	addi	sp,sp,32
    80001af8:	00008067          	ret

0000000080001afc <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80001afc:	fd010113          	addi	sp,sp,-48
    80001b00:	02113423          	sd	ra,40(sp)
    80001b04:	02813023          	sd	s0,32(sp)
    80001b08:	00913c23          	sd	s1,24(sp)
    80001b0c:	01213823          	sd	s2,16(sp)
    80001b10:	03010413          	addi	s0,sp,48
    TCB *old = running;
    80001b14:	00004497          	auipc	s1,0x4
    80001b18:	f8c4b483          	ld	s1,-116(s1) # 80005aa0 <_ZN3TCB7runningE>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001b1c:	100027f3          	csrr	a5,sstatus
    80001b20:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80001b24:	fd843903          	ld	s2,-40(s0)
        bool isFinished() const { return finished; }
    80001b28:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished()) { Scheduler::put(old); }
    80001b2c:	04078063          	beqz	a5,80001b6c <_ZN3TCB8dispatchEv+0x70>
    running = Scheduler::get();
    80001b30:	00000097          	auipc	ra,0x0
    80001b34:	3dc080e7          	jalr	988(ra) # 80001f0c <_ZN9Scheduler3getEv>
    80001b38:	00004797          	auipc	a5,0x4
    80001b3c:	f6a7b423          	sd	a0,-152(a5) # 80005aa0 <_ZN3TCB7runningE>
}
inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001b40:	10091073          	csrw	sstatus,s2
    TCB::contextSwitch(&old->context, &running->context);
    80001b44:	01050593          	addi	a1,a0,16 # 2010 <_entry-0x7fffdff0>
    80001b48:	01048513          	addi	a0,s1,16
    80001b4c:	fffff097          	auipc	ra,0xfffff
    80001b50:	6d4080e7          	jalr	1748(ra) # 80001220 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001b54:	02813083          	ld	ra,40(sp)
    80001b58:	02013403          	ld	s0,32(sp)
    80001b5c:	01813483          	ld	s1,24(sp)
    80001b60:	01013903          	ld	s2,16(sp)
    80001b64:	03010113          	addi	sp,sp,48
    80001b68:	00008067          	ret
    if (!old->isFinished()) { Scheduler::put(old); }
    80001b6c:	00048513          	mv	a0,s1
    80001b70:	00000097          	auipc	ra,0x0
    80001b74:	404080e7          	jalr	1028(ra) # 80001f74 <_ZN9Scheduler3putEP3TCB>
    80001b78:	fb9ff06f          	j	80001b30 <_ZN3TCB8dispatchEv+0x34>

0000000080001b7c <_ZN3TCB9checkBodyEv>:

bool TCB::checkBody() {
    80001b7c:	ff010113          	addi	sp,sp,-16
    80001b80:	00813423          	sd	s0,8(sp)
    80001b84:	01010413          	addi	s0,sp,16
    if(this->body != nullptr){
    80001b88:	00053783          	ld	a5,0(a0)
    80001b8c:	00078a63          	beqz	a5,80001ba0 <_ZN3TCB9checkBodyEv+0x24>
        return true;
    80001b90:	00100513          	li	a0,1
    }else{
        return false;
    }
}
    80001b94:	00813403          	ld	s0,8(sp)
    80001b98:	01010113          	addi	sp,sp,16
    80001b9c:	00008067          	ret
        return false;
    80001ba0:	00000513          	li	a0,0
    80001ba4:	ff1ff06f          	j	80001b94 <_ZN3TCB9checkBodyEv+0x18>

0000000080001ba8 <_Znwm>:
//
#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"

void *operator new(uint64 n) { return mem_alloc(n); }
    80001ba8:	ff010113          	addi	sp,sp,-16
    80001bac:	00113423          	sd	ra,8(sp)
    80001bb0:	00813023          	sd	s0,0(sp)
    80001bb4:	01010413          	addi	s0,sp,16
    80001bb8:	fffff097          	auipc	ra,0xfffff
    80001bbc:	67c080e7          	jalr	1660(ra) # 80001234 <_Z9mem_allocm>
    80001bc0:	00813083          	ld	ra,8(sp)
    80001bc4:	00013403          	ld	s0,0(sp)
    80001bc8:	01010113          	addi	sp,sp,16
    80001bcc:	00008067          	ret

0000000080001bd0 <_Znam>:
void *operator new[](uint64 n) { return mem_alloc(n); }
    80001bd0:	ff010113          	addi	sp,sp,-16
    80001bd4:	00113423          	sd	ra,8(sp)
    80001bd8:	00813023          	sd	s0,0(sp)
    80001bdc:	01010413          	addi	s0,sp,16
    80001be0:	fffff097          	auipc	ra,0xfffff
    80001be4:	654080e7          	jalr	1620(ra) # 80001234 <_Z9mem_allocm>
    80001be8:	00813083          	ld	ra,8(sp)
    80001bec:	00013403          	ld	s0,0(sp)
    80001bf0:	01010113          	addi	sp,sp,16
    80001bf4:	00008067          	ret

0000000080001bf8 <_ZdlPv>:

void operator delete(void *p) noexcept { mem_free(p); }
    80001bf8:	ff010113          	addi	sp,sp,-16
    80001bfc:	00113423          	sd	ra,8(sp)
    80001c00:	00813023          	sd	s0,0(sp)
    80001c04:	01010413          	addi	s0,sp,16
    80001c08:	fffff097          	auipc	ra,0xfffff
    80001c0c:	65c080e7          	jalr	1628(ra) # 80001264 <_Z8mem_freePv>
    80001c10:	00813083          	ld	ra,8(sp)
    80001c14:	00013403          	ld	s0,0(sp)
    80001c18:	01010113          	addi	sp,sp,16
    80001c1c:	00008067          	ret

0000000080001c20 <_ZdaPv>:
void operator delete[](void *p) noexcept { mem_free(p); }
    80001c20:	ff010113          	addi	sp,sp,-16
    80001c24:	00113423          	sd	ra,8(sp)
    80001c28:	00813023          	sd	s0,0(sp)
    80001c2c:	01010413          	addi	s0,sp,16
    80001c30:	fffff097          	auipc	ra,0xfffff
    80001c34:	634080e7          	jalr	1588(ra) # 80001264 <_Z8mem_freePv>
    80001c38:	00813083          	ld	ra,8(sp)
    80001c3c:	00013403          	ld	s0,0(sp)
    80001c40:	01010113          	addi	sp,sp,16
    80001c44:	00008067          	ret

0000000080001c48 <_ZN6Thread8dispatchEv>:

#include "../h/syscall_cpp.hpp"
#include "../h/scheduler.hpp"


void Thread::dispatch() {
    80001c48:	ff010113          	addi	sp,sp,-16
    80001c4c:	00113423          	sd	ra,8(sp)
    80001c50:	00813023          	sd	s0,0(sp)
    80001c54:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001c58:	fffff097          	auipc	ra,0xfffff
    80001c5c:	6a4080e7          	jalr	1700(ra) # 800012fc <_Z15thread_dispatchv>
}
    80001c60:	00813083          	ld	ra,8(sp)
    80001c64:	00013403          	ld	s0,0(sp)
    80001c68:	01010113          	addi	sp,sp,16
    80001c6c:	00008067          	ret

0000000080001c70 <_ZN6Thread5startEv>:

int Thread::start() {
    80001c70:	fe010113          	addi	sp,sp,-32
    80001c74:	00113c23          	sd	ra,24(sp)
    80001c78:	00813823          	sd	s0,16(sp)
    80001c7c:	00913423          	sd	s1,8(sp)
    80001c80:	02010413          	addi	s0,sp,32
    80001c84:	00050493          	mv	s1,a0
    if (myHandle->checkBody()) {
    80001c88:	00853503          	ld	a0,8(a0)
    80001c8c:	00000097          	auipc	ra,0x0
    80001c90:	ef0080e7          	jalr	-272(ra) # 80001b7c <_ZN3TCB9checkBodyEv>
    80001c94:	00051e63          	bnez	a0,80001cb0 <_ZN6Thread5startEv+0x40>
        Scheduler::put(myHandle);
        return 1;
    }
    return 0;
    80001c98:	00000513          	li	a0,0
}
    80001c9c:	01813083          	ld	ra,24(sp)
    80001ca0:	01013403          	ld	s0,16(sp)
    80001ca4:	00813483          	ld	s1,8(sp)
    80001ca8:	02010113          	addi	sp,sp,32
    80001cac:	00008067          	ret
        Scheduler::put(myHandle);
    80001cb0:	0084b503          	ld	a0,8(s1)
    80001cb4:	00000097          	auipc	ra,0x0
    80001cb8:	2c0080e7          	jalr	704(ra) # 80001f74 <_ZN9Scheduler3putEP3TCB>
        return 1;
    80001cbc:	00100513          	li	a0,1
    80001cc0:	fddff06f          	j	80001c9c <_ZN6Thread5startEv+0x2c>

0000000080001cc4 <_ZN5Riscv10popSppSpieEv>:
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"
#include "../h/print.hpp"

void Riscv::popSppSpie() {
    80001cc4:	ff010113          	addi	sp,sp,-16
    80001cc8:	00813423          	sd	s0,8(sp)
    80001ccc:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001cd0:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001cd4:	10200073          	sret
}
    80001cd8:	00813403          	ld	s0,8(sp)
    80001cdc:	01010113          	addi	sp,sp,16
    80001ce0:	00008067          	ret

0000000080001ce4 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80001ce4:	f9010113          	addi	sp,sp,-112
    80001ce8:	06113423          	sd	ra,104(sp)
    80001cec:	06813023          	sd	s0,96(sp)
    80001cf0:	04913c23          	sd	s1,88(sp)
    80001cf4:	05213823          	sd	s2,80(sp)
    80001cf8:	05313423          	sd	s3,72(sp)
    80001cfc:	07010413          	addi	s0,sp,112
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001d00:	142027f3          	csrr	a5,scause
    80001d04:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80001d08:	f9843703          	ld	a4,-104(s0)
    uint64 scause = r_scause();

    // velicina gde cu da mu obavestim koji je poziv
    size_t argument0;
    __asm__ volatile("mv %0, a0" : "=r" (argument0));
    80001d0c:	00050793          	mv	a5,a0

    if(argument0 != 0 && scause == 0x0000000000000009UL){
    80001d10:	00078663          	beqz	a5,80001d1c <_ZN5Riscv20handleSupervisorTrapEv+0x38>
    80001d14:	00900693          	li	a3,9
    80001d18:	04d70863          	beq	a4,a3,80001d68 <_ZN5Riscv20handleSupervisorTrapEv+0x84>
        }


        w_sstatus(sstatus); w_sepc(sepc);
    }
    else if (scause == 0x0000000000000009UL) {
    80001d1c:	00900793          	li	a5,9
    80001d20:	0ef70263          	beq	a4,a5,80001e04 <_ZN5Riscv20handleSupervisorTrapEv+0x120>
        // interrupt: no; cause code: environment call from S-mode(9)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch();
        w_sstatus(sstatus); w_sepc(sepc);
    } else if (scause == 0x8000000000000001UL) {
    80001d24:	fff00793          	li	a5,-1
    80001d28:	03f79793          	slli	a5,a5,0x3f
    80001d2c:	00178793          	addi	a5,a5,1
    80001d30:	10f70863          	beq	a4,a5,80001e40 <_ZN5Riscv20handleSupervisorTrapEv+0x15c>
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus); w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    } else if (scause == 0x8000000000000009UL) {
    80001d34:	fff00793          	li	a5,-1
    80001d38:	03f79793          	slli	a5,a5,0x3f
    80001d3c:	00978793          	addi	a5,a5,9
    80001d40:	16f70663          	beq	a4,a5,80001eac <_ZN5Riscv20handleSupervisorTrapEv+0x1c8>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else {
        // unexpected trap cause
        // definisati
        if (scause == 0x0000000000000005UL){
    80001d44:	00500793          	li	a5,5
    80001d48:	16f70863          	beq	a4,a5,80001eb8 <_ZN5Riscv20handleSupervisorTrapEv+0x1d4>
            printString("Error 5\n");
        }

    }
}
    80001d4c:	06813083          	ld	ra,104(sp)
    80001d50:	06013403          	ld	s0,96(sp)
    80001d54:	05813483          	ld	s1,88(sp)
    80001d58:	05013903          	ld	s2,80(sp)
    80001d5c:	04813983          	ld	s3,72(sp)
    80001d60:	07010113          	addi	sp,sp,112
    80001d64:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001d68:	14102773          	csrr	a4,sepc
    80001d6c:	fae43423          	sd	a4,-88(s0)
    return sepc;
    80001d70:	fa843483          	ld	s1,-88(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80001d74:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001d78:	10002773          	csrr	a4,sstatus
    80001d7c:	fae43023          	sd	a4,-96(s0)
    return sstatus;
    80001d80:	fa043903          	ld	s2,-96(s0)
        if(argument0 == 1){ // syscall za mem_alloc
    80001d84:	00100713          	li	a4,1
    80001d88:	02e78863          	beq	a5,a4,80001db8 <_ZN5Riscv20handleSupervisorTrapEv+0xd4>
        }else if(argument0 == 2){ // sistemski poziv za mem_free
    80001d8c:	00200713          	li	a4,2
    80001d90:	02e78e63          	beq	a5,a4,80001dcc <_ZN5Riscv20handleSupervisorTrapEv+0xe8>
        }else if(argument0 == 11){
    80001d94:	00b00713          	li	a4,11
    80001d98:	04e78263          	beq	a5,a4,80001ddc <_ZN5Riscv20handleSupervisorTrapEv+0xf8>
        }else if(argument0 == 12){
    80001d9c:	00c00713          	li	a4,12
    80001da0:	00e78663          	beq	a5,a4,80001dac <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
        }else if(argument0 == 13){
    80001da4:	00d00713          	li	a4,13
    80001da8:	04e78863          	beq	a5,a4,80001df8 <_ZN5Riscv20handleSupervisorTrapEv+0x114>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001dac:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001db0:	14149073          	csrw	sepc,s1
}
    80001db4:	f99ff06f          	j	80001d4c <_ZN5Riscv20handleSupervisorTrapEv+0x68>
            __asm__ volatile("mv %0, a1" : "=r" (argument_sizet));
    80001db8:	00058513          	mv	a0,a1
            argument_ret_void = MemoryAllocator::mem_alloc(argument_sizet);
    80001dbc:	00000097          	auipc	ra,0x0
    80001dc0:	2a8080e7          	jalr	680(ra) # 80002064 <_ZN15MemoryAllocator9mem_allocEm>
            __asm__ volatile("mv a0, %0" : : "r" (argument_ret_void));
    80001dc4:	00050513          	mv	a0,a0
    80001dc8:	fe5ff06f          	j	80001dac <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
            __asm__ volatile("mv %0, a1" : "=r" (argument_void));
    80001dcc:	00058513          	mv	a0,a1
            MemoryAllocator::mem_free(argument_void);
    80001dd0:	00000097          	auipc	ra,0x0
    80001dd4:	3d4080e7          	jalr	980(ra) # 800021a4 <_ZN15MemoryAllocator8mem_freeEPv>
    80001dd8:	fd5ff06f          	j	80001dac <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
            __asm__ volatile("mv %0, a1" : "=r" (handler));
    80001ddc:	00058993          	mv	s3,a1
            __asm__ volatile("mv %0, a2" : "=r" (sr));
    80001de0:	00060513          	mv	a0,a2
            __asm__ volatile("mv %0, a3" : "=r" (arg));
    80001de4:	00068793          	mv	a5,a3
            *handler = TCB::createThread(sr);
    80001de8:	00000097          	auipc	ra,0x0
    80001dec:	c28080e7          	jalr	-984(ra) # 80001a10 <_ZN3TCB12createThreadEPFvvE>
    80001df0:	00a9b023          	sd	a0,0(s3)
    80001df4:	fb9ff06f          	j	80001dac <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
            TCB::dispatch();
    80001df8:	00000097          	auipc	ra,0x0
    80001dfc:	d04080e7          	jalr	-764(ra) # 80001afc <_ZN3TCB8dispatchEv>
    80001e00:	fadff06f          	j	80001dac <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001e04:	141027f3          	csrr	a5,sepc
    80001e08:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001e0c:	fb843483          	ld	s1,-72(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80001e10:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001e14:	100027f3          	csrr	a5,sstatus
    80001e18:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001e1c:	fb043903          	ld	s2,-80(s0)
        TCB::timeSliceCounter = 0;
    80001e20:	00004797          	auipc	a5,0x4
    80001e24:	bf87b783          	ld	a5,-1032(a5) # 80005a18 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001e28:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    80001e2c:	00000097          	auipc	ra,0x0
    80001e30:	cd0080e7          	jalr	-816(ra) # 80001afc <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001e34:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001e38:	14149073          	csrw	sepc,s1
}
    80001e3c:	f11ff06f          	j	80001d4c <_ZN5Riscv20handleSupervisorTrapEv+0x68>
        TCB::timeSliceCounter++;
    80001e40:	00004717          	auipc	a4,0x4
    80001e44:	bd873703          	ld	a4,-1064(a4) # 80005a18 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001e48:	00073783          	ld	a5,0(a4)
    80001e4c:	00178793          	addi	a5,a5,1
    80001e50:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    80001e54:	00004717          	auipc	a4,0x4
    80001e58:	bdc73703          	ld	a4,-1060(a4) # 80005a30 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001e5c:	00073703          	ld	a4,0(a4)
        uint64 getTimeSlice() const { return timeSlice; }
    80001e60:	02073703          	ld	a4,32(a4)
    80001e64:	00e7f863          	bgeu	a5,a4,80001e74 <_ZN5Riscv20handleSupervisorTrapEv+0x190>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80001e68:	00200793          	li	a5,2
    80001e6c:	1447b073          	csrc	sip,a5
}
    80001e70:	eddff06f          	j	80001d4c <_ZN5Riscv20handleSupervisorTrapEv+0x68>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001e74:	141027f3          	csrr	a5,sepc
    80001e78:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80001e7c:	fc843483          	ld	s1,-56(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001e80:	100027f3          	csrr	a5,sstatus
    80001e84:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80001e88:	fc043903          	ld	s2,-64(s0)
            TCB::timeSliceCounter = 0;
    80001e8c:	00004797          	auipc	a5,0x4
    80001e90:	b8c7b783          	ld	a5,-1140(a5) # 80005a18 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001e94:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80001e98:	00000097          	auipc	ra,0x0
    80001e9c:	c64080e7          	jalr	-924(ra) # 80001afc <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001ea0:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001ea4:	14149073          	csrw	sepc,s1
}
    80001ea8:	fc1ff06f          	j	80001e68 <_ZN5Riscv20handleSupervisorTrapEv+0x184>
        console_handler();
    80001eac:	00002097          	auipc	ra,0x2
    80001eb0:	614080e7          	jalr	1556(ra) # 800044c0 <console_handler>
    80001eb4:	e99ff06f          	j	80001d4c <_ZN5Riscv20handleSupervisorTrapEv+0x68>
            printString("Error 5\n");
    80001eb8:	00003517          	auipc	a0,0x3
    80001ebc:	24050513          	addi	a0,a0,576 # 800050f8 <CONSOLE_STATUS+0xe8>
    80001ec0:	00000097          	auipc	ra,0x0
    80001ec4:	3d0080e7          	jalr	976(ra) # 80002290 <_Z11printStringPKc>
}
    80001ec8:	e85ff06f          	j	80001d4c <_ZN5Riscv20handleSupervisorTrapEv+0x68>

0000000080001ecc <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyCoroutineQueue.addLast(tcb);
    80001ecc:	ff010113          	addi	sp,sp,-16
    80001ed0:	00813423          	sd	s0,8(sp)
    80001ed4:	01010413          	addi	s0,sp,16
    80001ed8:	00100793          	li	a5,1
    80001edc:	00f50863          	beq	a0,a5,80001eec <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001ee0:	00813403          	ld	s0,8(sp)
    80001ee4:	01010113          	addi	sp,sp,16
    80001ee8:	00008067          	ret
    80001eec:	000107b7          	lui	a5,0x10
    80001ef0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001ef4:	fef596e3          	bne	a1,a5,80001ee0 <_Z41__static_initialization_and_destruction_0ii+0x14>
        Elem(T *data, Elem *next) : data(data), next(next){}
    };

    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    80001ef8:	00004797          	auipc	a5,0x4
    80001efc:	bb878793          	addi	a5,a5,-1096 # 80005ab0 <_ZN9Scheduler19readyCoroutineQueueE>
    80001f00:	0007b023          	sd	zero,0(a5)
    80001f04:	0007b423          	sd	zero,8(a5)
    80001f08:	fd9ff06f          	j	80001ee0 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001f0c <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80001f0c:	fe010113          	addi	sp,sp,-32
    80001f10:	00113c23          	sd	ra,24(sp)
    80001f14:	00813823          	sd	s0,16(sp)
    80001f18:	00913423          	sd	s1,8(sp)
    80001f1c:	02010413          	addi	s0,sp,32
        }else{
            head = tail = elem;
        }
    }
    T *removeFirst(){
        if(!head){ return 0; }
    80001f20:	00004517          	auipc	a0,0x4
    80001f24:	b9053503          	ld	a0,-1136(a0) # 80005ab0 <_ZN9Scheduler19readyCoroutineQueueE>
    80001f28:	04050263          	beqz	a0,80001f6c <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80001f2c:	00853783          	ld	a5,8(a0)
    80001f30:	00004717          	auipc	a4,0x4
    80001f34:	b8f73023          	sd	a5,-1152(a4) # 80005ab0 <_ZN9Scheduler19readyCoroutineQueueE>
        if(!head){ tail = 0; }
    80001f38:	02078463          	beqz	a5,80001f60 <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80001f3c:	00053483          	ld	s1,0(a0)
        delete elem;
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	cb8080e7          	jalr	-840(ra) # 80001bf8 <_ZdlPv>
}
    80001f48:	00048513          	mv	a0,s1
    80001f4c:	01813083          	ld	ra,24(sp)
    80001f50:	01013403          	ld	s0,16(sp)
    80001f54:	00813483          	ld	s1,8(sp)
    80001f58:	02010113          	addi	sp,sp,32
    80001f5c:	00008067          	ret
        if(!head){ tail = 0; }
    80001f60:	00004797          	auipc	a5,0x4
    80001f64:	b407bc23          	sd	zero,-1192(a5) # 80005ab8 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001f68:	fd5ff06f          	j	80001f3c <_ZN9Scheduler3getEv+0x30>
        if(!head){ return 0; }
    80001f6c:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    80001f70:	fd9ff06f          	j	80001f48 <_ZN9Scheduler3getEv+0x3c>

0000000080001f74 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80001f74:	fe010113          	addi	sp,sp,-32
    80001f78:	00113c23          	sd	ra,24(sp)
    80001f7c:	00813823          	sd	s0,16(sp)
    80001f80:	00913423          	sd	s1,8(sp)
    80001f84:	02010413          	addi	s0,sp,32
    80001f88:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80001f8c:	01000513          	li	a0,16
    80001f90:	00000097          	auipc	ra,0x0
    80001f94:	c18080e7          	jalr	-1000(ra) # 80001ba8 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    80001f98:	00953023          	sd	s1,0(a0)
    80001f9c:	00053423          	sd	zero,8(a0)
        if(tail){
    80001fa0:	00004797          	auipc	a5,0x4
    80001fa4:	b187b783          	ld	a5,-1256(a5) # 80005ab8 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001fa8:	02078263          	beqz	a5,80001fcc <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    80001fac:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001fb0:	00004797          	auipc	a5,0x4
    80001fb4:	b0a7b423          	sd	a0,-1272(a5) # 80005ab8 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001fb8:	01813083          	ld	ra,24(sp)
    80001fbc:	01013403          	ld	s0,16(sp)
    80001fc0:	00813483          	ld	s1,8(sp)
    80001fc4:	02010113          	addi	sp,sp,32
    80001fc8:	00008067          	ret
            head = tail = elem;
    80001fcc:	00004797          	auipc	a5,0x4
    80001fd0:	ae478793          	addi	a5,a5,-1308 # 80005ab0 <_ZN9Scheduler19readyCoroutineQueueE>
    80001fd4:	00a7b423          	sd	a0,8(a5)
    80001fd8:	00a7b023          	sd	a0,0(a5)
    80001fdc:	fddff06f          	j	80001fb8 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080001fe0 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80001fe0:	ff010113          	addi	sp,sp,-16
    80001fe4:	00113423          	sd	ra,8(sp)
    80001fe8:	00813023          	sd	s0,0(sp)
    80001fec:	01010413          	addi	s0,sp,16
    80001ff0:	000105b7          	lui	a1,0x10
    80001ff4:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001ff8:	00100513          	li	a0,1
    80001ffc:	00000097          	auipc	ra,0x0
    80002000:	ed0080e7          	jalr	-304(ra) # 80001ecc <_Z41__static_initialization_and_destruction_0ii>
    80002004:	00813083          	ld	ra,8(sp)
    80002008:	00013403          	ld	s0,0(sp)
    8000200c:	01010113          	addi	sp,sp,16
    80002010:	00008067          	ret

0000000080002014 <_ZN15MemoryAllocator8memAllocEv>:

MemoryBloc* MemoryAllocator::freeMemBlocHead;
MemoryBloc* MemoryAllocator::takenMemBlocHead;

// Inicijalizacija memorije
void MemoryAllocator::memAlloc(){
    80002014:	ff010113          	addi	sp,sp,-16
    80002018:	00813423          	sd	s0,8(sp)
    8000201c:	01010413          	addi	s0,sp,16
    freeMemBlocHead = (MemoryBloc*)HEAP_START_ADDR;
    80002020:	00004797          	auipc	a5,0x4
    80002024:	9e07b783          	ld	a5,-1568(a5) # 80005a00 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002028:	0007b703          	ld	a4,0(a5)
    8000202c:	00004797          	auipc	a5,0x4
    80002030:	a9478793          	addi	a5,a5,-1388 # 80005ac0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002034:	00e7b023          	sd	a4,0(a5)
    freeMemBlocHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    80002038:	00004697          	auipc	a3,0x4
    8000203c:	a006b683          	ld	a3,-1536(a3) # 80005a38 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002040:	0006b683          	ld	a3,0(a3)
    80002044:	40e686b3          	sub	a3,a3,a4
    80002048:	00d73023          	sd	a3,0(a4)
    freeMemBlocHead->next = nullptr;
    8000204c:	0007b703          	ld	a4,0(a5)
    80002050:	00073423          	sd	zero,8(a4)

    takenMemBlocHead = nullptr;
    80002054:	0007b423          	sd	zero,8(a5)
}
    80002058:	00813403          	ld	s0,8(sp)
    8000205c:	01010113          	addi	sp,sp,16
    80002060:	00008067          	ret

0000000080002064 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc (size_t size){
    80002064:	ff010113          	addi	sp,sp,-16
    80002068:	00813423          	sd	s0,8(sp)
    8000206c:	01010413          	addi	s0,sp,16
    size_t newSize;

    // ako je velicina veca od MEM_BLOC_SIZE onda uzmi blokova koliko ti treba + sizeof(MemoryBloc)
    // u suprotnom samo MEM_BLOC_SIZE + sizeof(MemoryBloc)
    if(size > MEM_BLOCK_SIZE){
    80002070:	04000793          	li	a5,64
    80002074:	02a7fa63          	bgeu	a5,a0,800020a8 <_ZN15MemoryAllocator9mem_allocEm+0x44>
        newSize = ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    80002078:	00655713          	srli	a4,a0,0x6
    8000207c:	00170713          	addi	a4,a4,1
    80002080:	00671713          	slli	a4,a4,0x6
    80002084:	01070713          	addi	a4,a4,16
    }else{
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    }

    // trazim prvi slobodan blok u listi slobodnih blokova gde mogu da alociram
    MemoryBloc* curr = freeMemBlocHead;
    80002088:	00004617          	auipc	a2,0x4
    8000208c:	a3863603          	ld	a2,-1480(a2) # 80005ac0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002090:	00060513          	mv	a0,a2

    while(newSize > curr->size && curr != nullptr){
    80002094:	00053783          	ld	a5,0(a0)
    80002098:	00e7fc63          	bgeu	a5,a4,800020b0 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
    8000209c:	00050a63          	beqz	a0,800020b0 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
        curr = curr->next;
    800020a0:	00853503          	ld	a0,8(a0)
    while(newSize > curr->size && curr != nullptr){
    800020a4:	ff1ff06f          	j	80002094 <_ZN15MemoryAllocator9mem_allocEm+0x30>
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    800020a8:	05000713          	li	a4,80
    800020ac:	fddff06f          	j	80002088 <_ZN15MemoryAllocator9mem_allocEm+0x24>
    }

    if(curr == nullptr){
    800020b0:	00051863          	bnez	a0,800020c0 <_ZN15MemoryAllocator9mem_allocEm+0x5c>
            prevTaken->next = newBloc;
        }
    }

    return (void*)((char*)newBloc + sizeof(MemoryBloc));
};
    800020b4:	00813403          	ld	s0,8(sp)
    800020b8:	01010113          	addi	sp,sp,16
    800020bc:	00008067          	ret
    if(curr == freeMemBlocHead){
    800020c0:	00c50e63          	beq	a0,a2,800020dc <_ZN15MemoryAllocator9mem_allocEm+0x78>
    bool checkFree = false;
    800020c4:	00000593          	li	a1,0
    MemoryBloc* next = curr->next;
    800020c8:	00853803          	ld	a6,8(a0)
    size_t currSize = curr->size - newSize;
    800020cc:	40e786b3          	sub	a3,a5,a4
    if(currSize == 0){
    800020d0:	06e79663          	bne	a5,a4,8000213c <_ZN15MemoryAllocator9mem_allocEm+0xd8>
        MemoryBloc* currFree = freeMemBlocHead;
    800020d4:	00060793          	mv	a5,a2
    800020d8:	0100006f          	j	800020e8 <_ZN15MemoryAllocator9mem_allocEm+0x84>
        checkFree = true;
    800020dc:	00100593          	li	a1,1
    800020e0:	fe9ff06f          	j	800020c8 <_ZN15MemoryAllocator9mem_allocEm+0x64>
            currFree = currFree->next;
    800020e4:	00068793          	mv	a5,a3
        while(currFree != nullptr && currFree->next != curr && checkFree != true){
    800020e8:	00078863          	beqz	a5,800020f8 <_ZN15MemoryAllocator9mem_allocEm+0x94>
    800020ec:	0087b683          	ld	a3,8(a5)
    800020f0:	00a68463          	beq	a3,a0,800020f8 <_ZN15MemoryAllocator9mem_allocEm+0x94>
    800020f4:	fe0588e3          	beqz	a1,800020e4 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(currFree == freeMemBlocHead){
    800020f8:	02c78a63          	beq	a5,a2,8000212c <_ZN15MemoryAllocator9mem_allocEm+0xc8>
            currFree->next = curr->next;
    800020fc:	0107b423          	sd	a6,8(a5)
    newBloc->size = newSize;
    80002100:	00e53023          	sd	a4,0(a0)
    if(takenMemBlocHead == nullptr){
    80002104:	00004697          	auipc	a3,0x4
    80002108:	9c46b683          	ld	a3,-1596(a3) # 80005ac8 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    8000210c:	06068263          	beqz	a3,80002170 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
        MemoryBloc* nextTaken = takenMemBlocHead;
    80002110:	00068793          	mv	a5,a3
        MemoryBloc* prevTaken = nullptr;
    80002114:	00000713          	li	a4,0
        while (newBloc > nextTaken && nextTaken != nullptr){
    80002118:	06a7f463          	bgeu	a5,a0,80002180 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
    8000211c:	06078263          	beqz	a5,80002180 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
            prevTaken = nextTaken;
    80002120:	00078713          	mv	a4,a5
            nextTaken = nextTaken->next;
    80002124:	0087b783          	ld	a5,8(a5)
        while (newBloc > nextTaken && nextTaken != nullptr){
    80002128:	ff1ff06f          	j	80002118 <_ZN15MemoryAllocator9mem_allocEm+0xb4>
            freeMemBlocHead = freeMemBlocHead->next;
    8000212c:	00863783          	ld	a5,8(a2)
    80002130:	00004697          	auipc	a3,0x4
    80002134:	98f6b823          	sd	a5,-1648(a3) # 80005ac0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002138:	fc9ff06f          	j	80002100 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
    }else if(checkFree == true){
    8000213c:	02058263          	beqz	a1,80002160 <_ZN15MemoryAllocator9mem_allocEm+0xfc>
        freeMemBlocHead = (MemoryBloc*)((char*)freeMemBlocHead + newSize);
    80002140:	00e60633          	add	a2,a2,a4
    80002144:	00004797          	auipc	a5,0x4
    80002148:	97c78793          	addi	a5,a5,-1668 # 80005ac0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    8000214c:	00c7b023          	sd	a2,0(a5)
        freeMemBlocHead->size = currSize;
    80002150:	00d63023          	sd	a3,0(a2)
        freeMemBlocHead->next = next;
    80002154:	0007b783          	ld	a5,0(a5)
    80002158:	0107b423          	sd	a6,8(a5)
    8000215c:	fa5ff06f          	j	80002100 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        curr = (MemoryBloc*)((char*)curr + newSize);
    80002160:	00e507b3          	add	a5,a0,a4
        curr->size = currSize;
    80002164:	00d7b023          	sd	a3,0(a5)
        curr->next = next;
    80002168:	0107b423          	sd	a6,8(a5)
    8000216c:	f95ff06f          	j	80002100 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        takenMemBlocHead = newBloc;
    80002170:	00004797          	auipc	a5,0x4
    80002174:	94a7bc23          	sd	a0,-1704(a5) # 80005ac8 <_ZN15MemoryAllocator16takenMemBlocHeadE>
        newBloc->next = nullptr;
    80002178:	00053423          	sd	zero,8(a0)
    8000217c:	0100006f          	j	8000218c <_ZN15MemoryAllocator9mem_allocEm+0x128>
        if(nextTaken == takenMemBlocHead){
    80002180:	00f68a63          	beq	a3,a5,80002194 <_ZN15MemoryAllocator9mem_allocEm+0x130>
            newBloc->next = nextTaken;
    80002184:	00f53423          	sd	a5,8(a0)
            prevTaken->next = newBloc;
    80002188:	00a73423          	sd	a0,8(a4)
    return (void*)((char*)newBloc + sizeof(MemoryBloc));
    8000218c:	01050513          	addi	a0,a0,16
    80002190:	f25ff06f          	j	800020b4 <_ZN15MemoryAllocator9mem_allocEm+0x50>
            newBloc->next = takenMemBlocHead;
    80002194:	00d53423          	sd	a3,8(a0)
            takenMemBlocHead = newBloc;
    80002198:	00004797          	auipc	a5,0x4
    8000219c:	92a7b823          	sd	a0,-1744(a5) # 80005ac8 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    800021a0:	fedff06f          	j	8000218c <_ZN15MemoryAllocator9mem_allocEm+0x128>

00000000800021a4 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free (void* mem){
    800021a4:	ff010113          	addi	sp,sp,-16
    800021a8:	00813423          	sd	s0,8(sp)
    800021ac:	01010413          	addi	s0,sp,16
    void* freeCurr = (void*)((char*)mem - sizeof(MemoryBloc));
    800021b0:	ff050513          	addi	a0,a0,-16

    MemoryBloc* curr = takenMemBlocHead;
    800021b4:	00004697          	auipc	a3,0x4
    800021b8:	9146b683          	ld	a3,-1772(a3) # 80005ac8 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    800021bc:	00068793          	mv	a5,a3
    MemoryBloc* prev = nullptr;
    800021c0:	00000713          	li	a4,0

    while (curr != freeCurr){
    800021c4:	00a78863          	beq	a5,a0,800021d4 <_ZN15MemoryAllocator8mem_freeEPv+0x30>
        prev = curr;
    800021c8:	00078713          	mv	a4,a5
        curr = curr->next;
    800021cc:	0087b783          	ld	a5,8(a5)
    while (curr != freeCurr){
    800021d0:	ff5ff06f          	j	800021c4 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
    }
    // uraditi nepredvidjeno ponasanje ako hocu da dealociram nesto sto nisam alocirao
    if(curr == takenMemBlocHead){
    800021d4:	02d78863          	beq	a5,a3,80002204 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        takenMemBlocHead = takenMemBlocHead->next;
    }else{
        prev->next = curr->next;
    800021d8:	0087b683          	ld	a3,8(a5)
    800021dc:	00d73423          	sd	a3,8(a4)
    }

    if(freeMemBlocHead == nullptr){
    800021e0:	00004617          	auipc	a2,0x4
    800021e4:	8e063603          	ld	a2,-1824(a2) # 80005ac0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800021e8:	02060663          	beqz	a2,80002214 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        freeMemBlocHead = curr;
    }else{
        MemoryBloc* currFree = freeMemBlocHead;
    800021ec:	00060713          	mv	a4,a2
        MemoryBloc* prevFree = nullptr;
    800021f0:	00000693          	li	a3,0

        while(curr > currFree){
    800021f4:	02f77663          	bgeu	a4,a5,80002220 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
            prevFree = currFree;
    800021f8:	00070693          	mv	a3,a4
            currFree = currFree->next;
    800021fc:	00873703          	ld	a4,8(a4)
        while(curr > currFree){
    80002200:	ff5ff06f          	j	800021f4 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
        takenMemBlocHead = takenMemBlocHead->next;
    80002204:	0086b703          	ld	a4,8(a3)
    80002208:	00004697          	auipc	a3,0x4
    8000220c:	8ce6b023          	sd	a4,-1856(a3) # 80005ac8 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80002210:	fd1ff06f          	j	800021e0 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
        freeMemBlocHead = curr;
    80002214:	00004717          	auipc	a4,0x4
    80002218:	8af73623          	sd	a5,-1876(a4) # 80005ac0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    8000221c:	0100006f          	j	8000222c <_ZN15MemoryAllocator8mem_freeEPv+0x88>
        }

        if(currFree == freeMemBlocHead){
    80002220:	00e60c63          	beq	a2,a4,80002238 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
            curr->next = freeMemBlocHead;
            freeMemBlocHead = curr;
        }else{
            curr->next = currFree;
    80002224:	00e7b423          	sd	a4,8(a5)
            prevFree->next = curr;
    80002228:	00f6b423          	sd	a5,8(a3)
        }
    }

    MemoryBloc* currMemMerge = freeMemBlocHead;
    8000222c:	00004797          	auipc	a5,0x4
    80002230:	8947b783          	ld	a5,-1900(a5) # 80005ac0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002234:	0300006f          	j	80002264 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
            curr->next = freeMemBlocHead;
    80002238:	00c7b423          	sd	a2,8(a5)
            freeMemBlocHead = curr;
    8000223c:	00004717          	auipc	a4,0x4
    80002240:	88f73223          	sd	a5,-1916(a4) # 80005ac0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002244:	fe9ff06f          	j	8000222c <_ZN15MemoryAllocator8mem_freeEPv+0x88>

    while(currMemMerge){
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
            currMemMerge->size += currMemMerge->next->size;
    80002248:	00073603          	ld	a2,0(a4)
    8000224c:	00c686b3          	add	a3,a3,a2
    80002250:	00d7b023          	sd	a3,0(a5)
            currMemMerge->next = currMemMerge->next->next;
    80002254:	00873703          	ld	a4,8(a4)
    80002258:	00e7b423          	sd	a4,8(a5)
    8000225c:	00078713          	mv	a4,a5
    80002260:	00070793          	mv	a5,a4
    while(currMemMerge){
    80002264:	00078e63          	beqz	a5,80002280 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
    80002268:	0087b703          	ld	a4,8(a5)
    8000226c:	fe070ae3          	beqz	a4,80002260 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80002270:	0007b683          	ld	a3,0(a5)
    80002274:	00d78633          	add	a2,a5,a3
    80002278:	fec714e3          	bne	a4,a2,80002260 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    8000227c:	fcdff06f          	j	80002248 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            currMemMerge = currMemMerge->next;
        }
    }

    return 0;
    80002280:	00000513          	li	a0,0
    80002284:	00813403          	ld	s0,8(sp)
    80002288:	01010113          	addi	sp,sp,16
    8000228c:	00008067          	ret

0000000080002290 <_Z11printStringPKc>:
#include "../lib/console.h"
#include "../h/riscv.hpp"


void printString(char const *string)
{
    80002290:	fd010113          	addi	sp,sp,-48
    80002294:	02113423          	sd	ra,40(sp)
    80002298:	02813023          	sd	s0,32(sp)
    8000229c:	00913c23          	sd	s1,24(sp)
    800022a0:	01213823          	sd	s2,16(sp)
    800022a4:	03010413          	addi	s0,sp,48
    800022a8:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800022ac:	100027f3          	csrr	a5,sstatus
    800022b0:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800022b4:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800022b8:	00200793          	li	a5,2
    800022bc:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    800022c0:	0004c503          	lbu	a0,0(s1)
    800022c4:	00050a63          	beqz	a0,800022d8 <_Z11printStringPKc+0x48>
    {
        __putc(*string);
    800022c8:	00002097          	auipc	ra,0x2
    800022cc:	184080e7          	jalr	388(ra) # 8000444c <__putc>
        string++;
    800022d0:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800022d4:	fedff06f          	j	800022c0 <_Z11printStringPKc+0x30>
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    800022d8:	0009091b          	sext.w	s2,s2
    800022dc:	00297913          	andi	s2,s2,2
    800022e0:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800022e4:	10092073          	csrs	sstatus,s2
}
    800022e8:	02813083          	ld	ra,40(sp)
    800022ec:	02013403          	ld	s0,32(sp)
    800022f0:	01813483          	ld	s1,24(sp)
    800022f4:	01013903          	ld	s2,16(sp)
    800022f8:	03010113          	addi	sp,sp,48
    800022fc:	00008067          	ret

0000000080002300 <_Z12printIntegerm>:


void printInteger(uint64 integer){
    80002300:	fd010113          	addi	sp,sp,-48
    80002304:	02113423          	sd	ra,40(sp)
    80002308:	02813023          	sd	s0,32(sp)
    8000230c:	00913c23          	sd	s1,24(sp)
    80002310:	03010413          	addi	s0,sp,48
    neg = 0;
    if(integer < 0){
        neg = 1;
        x = -integer;
    }else{
        x = integer;
    80002314:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80002318:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x%10];
    8000231c:	00a00613          	li	a2,10
    80002320:	02c5773b          	remuw	a4,a0,a2
    80002324:	02071693          	slli	a3,a4,0x20
    80002328:	0206d693          	srli	a3,a3,0x20
    8000232c:	00003717          	auipc	a4,0x3
    80002330:	ddc70713          	addi	a4,a4,-548 # 80005108 <_ZZ12printIntegermE6digits>
    80002334:	00d70733          	add	a4,a4,a3
    80002338:	00074703          	lbu	a4,0(a4)
    8000233c:	fe040693          	addi	a3,s0,-32
    80002340:	009687b3          	add	a5,a3,s1
    80002344:	0014849b          	addiw	s1,s1,1
    80002348:	fee78823          	sb	a4,-16(a5)
    }while((x /= 10) != 0);
    8000234c:	0005071b          	sext.w	a4,a0
    80002350:	02c5553b          	divuw	a0,a0,a2
    80002354:	00900793          	li	a5,9
    80002358:	fce7e2e3          	bltu	a5,a4,8000231c <_Z12printIntegerm+0x1c>
    if(neg){
        buf[i++] = '-';
    }
    while(--i >= 0)
    8000235c:	fff4849b          	addiw	s1,s1,-1
    80002360:	0004ce63          	bltz	s1,8000237c <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    80002364:	fe040793          	addi	a5,s0,-32
    80002368:	009787b3          	add	a5,a5,s1
    8000236c:	ff07c503          	lbu	a0,-16(a5)
    80002370:	00002097          	auipc	ra,0x2
    80002374:	0dc080e7          	jalr	220(ra) # 8000444c <__putc>
    80002378:	fe5ff06f          	j	8000235c <_Z12printIntegerm+0x5c>
    8000237c:	02813083          	ld	ra,40(sp)
    80002380:	02013403          	ld	s0,32(sp)
    80002384:	01813483          	ld	s1,24(sp)
    80002388:	03010113          	addi	sp,sp,48
    8000238c:	00008067          	ret

0000000080002390 <start>:
    80002390:	ff010113          	addi	sp,sp,-16
    80002394:	00813423          	sd	s0,8(sp)
    80002398:	01010413          	addi	s0,sp,16
    8000239c:	300027f3          	csrr	a5,mstatus
    800023a0:	ffffe737          	lui	a4,0xffffe
    800023a4:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7acf>
    800023a8:	00e7f7b3          	and	a5,a5,a4
    800023ac:	00001737          	lui	a4,0x1
    800023b0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800023b4:	00e7e7b3          	or	a5,a5,a4
    800023b8:	30079073          	csrw	mstatus,a5
    800023bc:	00000797          	auipc	a5,0x0
    800023c0:	16078793          	addi	a5,a5,352 # 8000251c <system_main>
    800023c4:	34179073          	csrw	mepc,a5
    800023c8:	00000793          	li	a5,0
    800023cc:	18079073          	csrw	satp,a5
    800023d0:	000107b7          	lui	a5,0x10
    800023d4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800023d8:	30279073          	csrw	medeleg,a5
    800023dc:	30379073          	csrw	mideleg,a5
    800023e0:	104027f3          	csrr	a5,sie
    800023e4:	2227e793          	ori	a5,a5,546
    800023e8:	10479073          	csrw	sie,a5
    800023ec:	fff00793          	li	a5,-1
    800023f0:	00a7d793          	srli	a5,a5,0xa
    800023f4:	3b079073          	csrw	pmpaddr0,a5
    800023f8:	00f00793          	li	a5,15
    800023fc:	3a079073          	csrw	pmpcfg0,a5
    80002400:	f14027f3          	csrr	a5,mhartid
    80002404:	0200c737          	lui	a4,0x200c
    80002408:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000240c:	0007869b          	sext.w	a3,a5
    80002410:	00269713          	slli	a4,a3,0x2
    80002414:	000f4637          	lui	a2,0xf4
    80002418:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000241c:	00d70733          	add	a4,a4,a3
    80002420:	0037979b          	slliw	a5,a5,0x3
    80002424:	020046b7          	lui	a3,0x2004
    80002428:	00d787b3          	add	a5,a5,a3
    8000242c:	00c585b3          	add	a1,a1,a2
    80002430:	00371693          	slli	a3,a4,0x3
    80002434:	00003717          	auipc	a4,0x3
    80002438:	69c70713          	addi	a4,a4,1692 # 80005ad0 <timer_scratch>
    8000243c:	00b7b023          	sd	a1,0(a5)
    80002440:	00d70733          	add	a4,a4,a3
    80002444:	00f73c23          	sd	a5,24(a4)
    80002448:	02c73023          	sd	a2,32(a4)
    8000244c:	34071073          	csrw	mscratch,a4
    80002450:	00000797          	auipc	a5,0x0
    80002454:	6e078793          	addi	a5,a5,1760 # 80002b30 <timervec>
    80002458:	30579073          	csrw	mtvec,a5
    8000245c:	300027f3          	csrr	a5,mstatus
    80002460:	0087e793          	ori	a5,a5,8
    80002464:	30079073          	csrw	mstatus,a5
    80002468:	304027f3          	csrr	a5,mie
    8000246c:	0807e793          	ori	a5,a5,128
    80002470:	30479073          	csrw	mie,a5
    80002474:	f14027f3          	csrr	a5,mhartid
    80002478:	0007879b          	sext.w	a5,a5
    8000247c:	00078213          	mv	tp,a5
    80002480:	30200073          	mret
    80002484:	00813403          	ld	s0,8(sp)
    80002488:	01010113          	addi	sp,sp,16
    8000248c:	00008067          	ret

0000000080002490 <timerinit>:
    80002490:	ff010113          	addi	sp,sp,-16
    80002494:	00813423          	sd	s0,8(sp)
    80002498:	01010413          	addi	s0,sp,16
    8000249c:	f14027f3          	csrr	a5,mhartid
    800024a0:	0200c737          	lui	a4,0x200c
    800024a4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800024a8:	0007869b          	sext.w	a3,a5
    800024ac:	00269713          	slli	a4,a3,0x2
    800024b0:	000f4637          	lui	a2,0xf4
    800024b4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800024b8:	00d70733          	add	a4,a4,a3
    800024bc:	0037979b          	slliw	a5,a5,0x3
    800024c0:	020046b7          	lui	a3,0x2004
    800024c4:	00d787b3          	add	a5,a5,a3
    800024c8:	00c585b3          	add	a1,a1,a2
    800024cc:	00371693          	slli	a3,a4,0x3
    800024d0:	00003717          	auipc	a4,0x3
    800024d4:	60070713          	addi	a4,a4,1536 # 80005ad0 <timer_scratch>
    800024d8:	00b7b023          	sd	a1,0(a5)
    800024dc:	00d70733          	add	a4,a4,a3
    800024e0:	00f73c23          	sd	a5,24(a4)
    800024e4:	02c73023          	sd	a2,32(a4)
    800024e8:	34071073          	csrw	mscratch,a4
    800024ec:	00000797          	auipc	a5,0x0
    800024f0:	64478793          	addi	a5,a5,1604 # 80002b30 <timervec>
    800024f4:	30579073          	csrw	mtvec,a5
    800024f8:	300027f3          	csrr	a5,mstatus
    800024fc:	0087e793          	ori	a5,a5,8
    80002500:	30079073          	csrw	mstatus,a5
    80002504:	304027f3          	csrr	a5,mie
    80002508:	0807e793          	ori	a5,a5,128
    8000250c:	30479073          	csrw	mie,a5
    80002510:	00813403          	ld	s0,8(sp)
    80002514:	01010113          	addi	sp,sp,16
    80002518:	00008067          	ret

000000008000251c <system_main>:
    8000251c:	fe010113          	addi	sp,sp,-32
    80002520:	00813823          	sd	s0,16(sp)
    80002524:	00913423          	sd	s1,8(sp)
    80002528:	00113c23          	sd	ra,24(sp)
    8000252c:	02010413          	addi	s0,sp,32
    80002530:	00000097          	auipc	ra,0x0
    80002534:	0c4080e7          	jalr	196(ra) # 800025f4 <cpuid>
    80002538:	00003497          	auipc	s1,0x3
    8000253c:	53848493          	addi	s1,s1,1336 # 80005a70 <started>
    80002540:	02050263          	beqz	a0,80002564 <system_main+0x48>
    80002544:	0004a783          	lw	a5,0(s1)
    80002548:	0007879b          	sext.w	a5,a5
    8000254c:	fe078ce3          	beqz	a5,80002544 <system_main+0x28>
    80002550:	0ff0000f          	fence
    80002554:	00003517          	auipc	a0,0x3
    80002558:	bf450513          	addi	a0,a0,-1036 # 80005148 <_ZZ12printIntegermE6digits+0x40>
    8000255c:	00001097          	auipc	ra,0x1
    80002560:	a70080e7          	jalr	-1424(ra) # 80002fcc <panic>
    80002564:	00001097          	auipc	ra,0x1
    80002568:	9c4080e7          	jalr	-1596(ra) # 80002f28 <consoleinit>
    8000256c:	00001097          	auipc	ra,0x1
    80002570:	150080e7          	jalr	336(ra) # 800036bc <printfinit>
    80002574:	00003517          	auipc	a0,0x3
    80002578:	b7c50513          	addi	a0,a0,-1156 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000257c:	00001097          	auipc	ra,0x1
    80002580:	aac080e7          	jalr	-1364(ra) # 80003028 <__printf>
    80002584:	00003517          	auipc	a0,0x3
    80002588:	b9450513          	addi	a0,a0,-1132 # 80005118 <_ZZ12printIntegermE6digits+0x10>
    8000258c:	00001097          	auipc	ra,0x1
    80002590:	a9c080e7          	jalr	-1380(ra) # 80003028 <__printf>
    80002594:	00003517          	auipc	a0,0x3
    80002598:	b5c50513          	addi	a0,a0,-1188 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000259c:	00001097          	auipc	ra,0x1
    800025a0:	a8c080e7          	jalr	-1396(ra) # 80003028 <__printf>
    800025a4:	00001097          	auipc	ra,0x1
    800025a8:	4a4080e7          	jalr	1188(ra) # 80003a48 <kinit>
    800025ac:	00000097          	auipc	ra,0x0
    800025b0:	148080e7          	jalr	328(ra) # 800026f4 <trapinit>
    800025b4:	00000097          	auipc	ra,0x0
    800025b8:	16c080e7          	jalr	364(ra) # 80002720 <trapinithart>
    800025bc:	00000097          	auipc	ra,0x0
    800025c0:	5b4080e7          	jalr	1460(ra) # 80002b70 <plicinit>
    800025c4:	00000097          	auipc	ra,0x0
    800025c8:	5d4080e7          	jalr	1492(ra) # 80002b98 <plicinithart>
    800025cc:	00000097          	auipc	ra,0x0
    800025d0:	078080e7          	jalr	120(ra) # 80002644 <userinit>
    800025d4:	0ff0000f          	fence
    800025d8:	00100793          	li	a5,1
    800025dc:	00003517          	auipc	a0,0x3
    800025e0:	b5450513          	addi	a0,a0,-1196 # 80005130 <_ZZ12printIntegermE6digits+0x28>
    800025e4:	00f4a023          	sw	a5,0(s1)
    800025e8:	00001097          	auipc	ra,0x1
    800025ec:	a40080e7          	jalr	-1472(ra) # 80003028 <__printf>
    800025f0:	0000006f          	j	800025f0 <system_main+0xd4>

00000000800025f4 <cpuid>:
    800025f4:	ff010113          	addi	sp,sp,-16
    800025f8:	00813423          	sd	s0,8(sp)
    800025fc:	01010413          	addi	s0,sp,16
    80002600:	00020513          	mv	a0,tp
    80002604:	00813403          	ld	s0,8(sp)
    80002608:	0005051b          	sext.w	a0,a0
    8000260c:	01010113          	addi	sp,sp,16
    80002610:	00008067          	ret

0000000080002614 <mycpu>:
    80002614:	ff010113          	addi	sp,sp,-16
    80002618:	00813423          	sd	s0,8(sp)
    8000261c:	01010413          	addi	s0,sp,16
    80002620:	00020793          	mv	a5,tp
    80002624:	00813403          	ld	s0,8(sp)
    80002628:	0007879b          	sext.w	a5,a5
    8000262c:	00779793          	slli	a5,a5,0x7
    80002630:	00004517          	auipc	a0,0x4
    80002634:	4d050513          	addi	a0,a0,1232 # 80006b00 <cpus>
    80002638:	00f50533          	add	a0,a0,a5
    8000263c:	01010113          	addi	sp,sp,16
    80002640:	00008067          	ret

0000000080002644 <userinit>:
    80002644:	ff010113          	addi	sp,sp,-16
    80002648:	00813423          	sd	s0,8(sp)
    8000264c:	01010413          	addi	s0,sp,16
    80002650:	00813403          	ld	s0,8(sp)
    80002654:	01010113          	addi	sp,sp,16
    80002658:	fffff317          	auipc	t1,0xfffff
    8000265c:	17c30067          	jr	380(t1) # 800017d4 <main>

0000000080002660 <either_copyout>:
    80002660:	ff010113          	addi	sp,sp,-16
    80002664:	00813023          	sd	s0,0(sp)
    80002668:	00113423          	sd	ra,8(sp)
    8000266c:	01010413          	addi	s0,sp,16
    80002670:	02051663          	bnez	a0,8000269c <either_copyout+0x3c>
    80002674:	00058513          	mv	a0,a1
    80002678:	00060593          	mv	a1,a2
    8000267c:	0006861b          	sext.w	a2,a3
    80002680:	00002097          	auipc	ra,0x2
    80002684:	c54080e7          	jalr	-940(ra) # 800042d4 <__memmove>
    80002688:	00813083          	ld	ra,8(sp)
    8000268c:	00013403          	ld	s0,0(sp)
    80002690:	00000513          	li	a0,0
    80002694:	01010113          	addi	sp,sp,16
    80002698:	00008067          	ret
    8000269c:	00003517          	auipc	a0,0x3
    800026a0:	ad450513          	addi	a0,a0,-1324 # 80005170 <_ZZ12printIntegermE6digits+0x68>
    800026a4:	00001097          	auipc	ra,0x1
    800026a8:	928080e7          	jalr	-1752(ra) # 80002fcc <panic>

00000000800026ac <either_copyin>:
    800026ac:	ff010113          	addi	sp,sp,-16
    800026b0:	00813023          	sd	s0,0(sp)
    800026b4:	00113423          	sd	ra,8(sp)
    800026b8:	01010413          	addi	s0,sp,16
    800026bc:	02059463          	bnez	a1,800026e4 <either_copyin+0x38>
    800026c0:	00060593          	mv	a1,a2
    800026c4:	0006861b          	sext.w	a2,a3
    800026c8:	00002097          	auipc	ra,0x2
    800026cc:	c0c080e7          	jalr	-1012(ra) # 800042d4 <__memmove>
    800026d0:	00813083          	ld	ra,8(sp)
    800026d4:	00013403          	ld	s0,0(sp)
    800026d8:	00000513          	li	a0,0
    800026dc:	01010113          	addi	sp,sp,16
    800026e0:	00008067          	ret
    800026e4:	00003517          	auipc	a0,0x3
    800026e8:	ab450513          	addi	a0,a0,-1356 # 80005198 <_ZZ12printIntegermE6digits+0x90>
    800026ec:	00001097          	auipc	ra,0x1
    800026f0:	8e0080e7          	jalr	-1824(ra) # 80002fcc <panic>

00000000800026f4 <trapinit>:
    800026f4:	ff010113          	addi	sp,sp,-16
    800026f8:	00813423          	sd	s0,8(sp)
    800026fc:	01010413          	addi	s0,sp,16
    80002700:	00813403          	ld	s0,8(sp)
    80002704:	00003597          	auipc	a1,0x3
    80002708:	abc58593          	addi	a1,a1,-1348 # 800051c0 <_ZZ12printIntegermE6digits+0xb8>
    8000270c:	00004517          	auipc	a0,0x4
    80002710:	47450513          	addi	a0,a0,1140 # 80006b80 <tickslock>
    80002714:	01010113          	addi	sp,sp,16
    80002718:	00001317          	auipc	t1,0x1
    8000271c:	5c030067          	jr	1472(t1) # 80003cd8 <initlock>

0000000080002720 <trapinithart>:
    80002720:	ff010113          	addi	sp,sp,-16
    80002724:	00813423          	sd	s0,8(sp)
    80002728:	01010413          	addi	s0,sp,16
    8000272c:	00000797          	auipc	a5,0x0
    80002730:	2f478793          	addi	a5,a5,756 # 80002a20 <kernelvec>
    80002734:	10579073          	csrw	stvec,a5
    80002738:	00813403          	ld	s0,8(sp)
    8000273c:	01010113          	addi	sp,sp,16
    80002740:	00008067          	ret

0000000080002744 <usertrap>:
    80002744:	ff010113          	addi	sp,sp,-16
    80002748:	00813423          	sd	s0,8(sp)
    8000274c:	01010413          	addi	s0,sp,16
    80002750:	00813403          	ld	s0,8(sp)
    80002754:	01010113          	addi	sp,sp,16
    80002758:	00008067          	ret

000000008000275c <usertrapret>:
    8000275c:	ff010113          	addi	sp,sp,-16
    80002760:	00813423          	sd	s0,8(sp)
    80002764:	01010413          	addi	s0,sp,16
    80002768:	00813403          	ld	s0,8(sp)
    8000276c:	01010113          	addi	sp,sp,16
    80002770:	00008067          	ret

0000000080002774 <kerneltrap>:
    80002774:	fe010113          	addi	sp,sp,-32
    80002778:	00813823          	sd	s0,16(sp)
    8000277c:	00113c23          	sd	ra,24(sp)
    80002780:	00913423          	sd	s1,8(sp)
    80002784:	02010413          	addi	s0,sp,32
    80002788:	142025f3          	csrr	a1,scause
    8000278c:	100027f3          	csrr	a5,sstatus
    80002790:	0027f793          	andi	a5,a5,2
    80002794:	10079c63          	bnez	a5,800028ac <kerneltrap+0x138>
    80002798:	142027f3          	csrr	a5,scause
    8000279c:	0207ce63          	bltz	a5,800027d8 <kerneltrap+0x64>
    800027a0:	00003517          	auipc	a0,0x3
    800027a4:	a6850513          	addi	a0,a0,-1432 # 80005208 <_ZZ12printIntegermE6digits+0x100>
    800027a8:	00001097          	auipc	ra,0x1
    800027ac:	880080e7          	jalr	-1920(ra) # 80003028 <__printf>
    800027b0:	141025f3          	csrr	a1,sepc
    800027b4:	14302673          	csrr	a2,stval
    800027b8:	00003517          	auipc	a0,0x3
    800027bc:	a6050513          	addi	a0,a0,-1440 # 80005218 <_ZZ12printIntegermE6digits+0x110>
    800027c0:	00001097          	auipc	ra,0x1
    800027c4:	868080e7          	jalr	-1944(ra) # 80003028 <__printf>
    800027c8:	00003517          	auipc	a0,0x3
    800027cc:	a6850513          	addi	a0,a0,-1432 # 80005230 <_ZZ12printIntegermE6digits+0x128>
    800027d0:	00000097          	auipc	ra,0x0
    800027d4:	7fc080e7          	jalr	2044(ra) # 80002fcc <panic>
    800027d8:	0ff7f713          	andi	a4,a5,255
    800027dc:	00900693          	li	a3,9
    800027e0:	04d70063          	beq	a4,a3,80002820 <kerneltrap+0xac>
    800027e4:	fff00713          	li	a4,-1
    800027e8:	03f71713          	slli	a4,a4,0x3f
    800027ec:	00170713          	addi	a4,a4,1
    800027f0:	fae798e3          	bne	a5,a4,800027a0 <kerneltrap+0x2c>
    800027f4:	00000097          	auipc	ra,0x0
    800027f8:	e00080e7          	jalr	-512(ra) # 800025f4 <cpuid>
    800027fc:	06050663          	beqz	a0,80002868 <kerneltrap+0xf4>
    80002800:	144027f3          	csrr	a5,sip
    80002804:	ffd7f793          	andi	a5,a5,-3
    80002808:	14479073          	csrw	sip,a5
    8000280c:	01813083          	ld	ra,24(sp)
    80002810:	01013403          	ld	s0,16(sp)
    80002814:	00813483          	ld	s1,8(sp)
    80002818:	02010113          	addi	sp,sp,32
    8000281c:	00008067          	ret
    80002820:	00000097          	auipc	ra,0x0
    80002824:	3c4080e7          	jalr	964(ra) # 80002be4 <plic_claim>
    80002828:	00a00793          	li	a5,10
    8000282c:	00050493          	mv	s1,a0
    80002830:	06f50863          	beq	a0,a5,800028a0 <kerneltrap+0x12c>
    80002834:	fc050ce3          	beqz	a0,8000280c <kerneltrap+0x98>
    80002838:	00050593          	mv	a1,a0
    8000283c:	00003517          	auipc	a0,0x3
    80002840:	9ac50513          	addi	a0,a0,-1620 # 800051e8 <_ZZ12printIntegermE6digits+0xe0>
    80002844:	00000097          	auipc	ra,0x0
    80002848:	7e4080e7          	jalr	2020(ra) # 80003028 <__printf>
    8000284c:	01013403          	ld	s0,16(sp)
    80002850:	01813083          	ld	ra,24(sp)
    80002854:	00048513          	mv	a0,s1
    80002858:	00813483          	ld	s1,8(sp)
    8000285c:	02010113          	addi	sp,sp,32
    80002860:	00000317          	auipc	t1,0x0
    80002864:	3bc30067          	jr	956(t1) # 80002c1c <plic_complete>
    80002868:	00004517          	auipc	a0,0x4
    8000286c:	31850513          	addi	a0,a0,792 # 80006b80 <tickslock>
    80002870:	00001097          	auipc	ra,0x1
    80002874:	48c080e7          	jalr	1164(ra) # 80003cfc <acquire>
    80002878:	00003717          	auipc	a4,0x3
    8000287c:	1fc70713          	addi	a4,a4,508 # 80005a74 <ticks>
    80002880:	00072783          	lw	a5,0(a4)
    80002884:	00004517          	auipc	a0,0x4
    80002888:	2fc50513          	addi	a0,a0,764 # 80006b80 <tickslock>
    8000288c:	0017879b          	addiw	a5,a5,1
    80002890:	00f72023          	sw	a5,0(a4)
    80002894:	00001097          	auipc	ra,0x1
    80002898:	534080e7          	jalr	1332(ra) # 80003dc8 <release>
    8000289c:	f65ff06f          	j	80002800 <kerneltrap+0x8c>
    800028a0:	00001097          	auipc	ra,0x1
    800028a4:	090080e7          	jalr	144(ra) # 80003930 <uartintr>
    800028a8:	fa5ff06f          	j	8000284c <kerneltrap+0xd8>
    800028ac:	00003517          	auipc	a0,0x3
    800028b0:	91c50513          	addi	a0,a0,-1764 # 800051c8 <_ZZ12printIntegermE6digits+0xc0>
    800028b4:	00000097          	auipc	ra,0x0
    800028b8:	718080e7          	jalr	1816(ra) # 80002fcc <panic>

00000000800028bc <clockintr>:
    800028bc:	fe010113          	addi	sp,sp,-32
    800028c0:	00813823          	sd	s0,16(sp)
    800028c4:	00913423          	sd	s1,8(sp)
    800028c8:	00113c23          	sd	ra,24(sp)
    800028cc:	02010413          	addi	s0,sp,32
    800028d0:	00004497          	auipc	s1,0x4
    800028d4:	2b048493          	addi	s1,s1,688 # 80006b80 <tickslock>
    800028d8:	00048513          	mv	a0,s1
    800028dc:	00001097          	auipc	ra,0x1
    800028e0:	420080e7          	jalr	1056(ra) # 80003cfc <acquire>
    800028e4:	00003717          	auipc	a4,0x3
    800028e8:	19070713          	addi	a4,a4,400 # 80005a74 <ticks>
    800028ec:	00072783          	lw	a5,0(a4)
    800028f0:	01013403          	ld	s0,16(sp)
    800028f4:	01813083          	ld	ra,24(sp)
    800028f8:	00048513          	mv	a0,s1
    800028fc:	0017879b          	addiw	a5,a5,1
    80002900:	00813483          	ld	s1,8(sp)
    80002904:	00f72023          	sw	a5,0(a4)
    80002908:	02010113          	addi	sp,sp,32
    8000290c:	00001317          	auipc	t1,0x1
    80002910:	4bc30067          	jr	1212(t1) # 80003dc8 <release>

0000000080002914 <devintr>:
    80002914:	142027f3          	csrr	a5,scause
    80002918:	00000513          	li	a0,0
    8000291c:	0007c463          	bltz	a5,80002924 <devintr+0x10>
    80002920:	00008067          	ret
    80002924:	fe010113          	addi	sp,sp,-32
    80002928:	00813823          	sd	s0,16(sp)
    8000292c:	00113c23          	sd	ra,24(sp)
    80002930:	00913423          	sd	s1,8(sp)
    80002934:	02010413          	addi	s0,sp,32
    80002938:	0ff7f713          	andi	a4,a5,255
    8000293c:	00900693          	li	a3,9
    80002940:	04d70c63          	beq	a4,a3,80002998 <devintr+0x84>
    80002944:	fff00713          	li	a4,-1
    80002948:	03f71713          	slli	a4,a4,0x3f
    8000294c:	00170713          	addi	a4,a4,1
    80002950:	00e78c63          	beq	a5,a4,80002968 <devintr+0x54>
    80002954:	01813083          	ld	ra,24(sp)
    80002958:	01013403          	ld	s0,16(sp)
    8000295c:	00813483          	ld	s1,8(sp)
    80002960:	02010113          	addi	sp,sp,32
    80002964:	00008067          	ret
    80002968:	00000097          	auipc	ra,0x0
    8000296c:	c8c080e7          	jalr	-884(ra) # 800025f4 <cpuid>
    80002970:	06050663          	beqz	a0,800029dc <devintr+0xc8>
    80002974:	144027f3          	csrr	a5,sip
    80002978:	ffd7f793          	andi	a5,a5,-3
    8000297c:	14479073          	csrw	sip,a5
    80002980:	01813083          	ld	ra,24(sp)
    80002984:	01013403          	ld	s0,16(sp)
    80002988:	00813483          	ld	s1,8(sp)
    8000298c:	00200513          	li	a0,2
    80002990:	02010113          	addi	sp,sp,32
    80002994:	00008067          	ret
    80002998:	00000097          	auipc	ra,0x0
    8000299c:	24c080e7          	jalr	588(ra) # 80002be4 <plic_claim>
    800029a0:	00a00793          	li	a5,10
    800029a4:	00050493          	mv	s1,a0
    800029a8:	06f50663          	beq	a0,a5,80002a14 <devintr+0x100>
    800029ac:	00100513          	li	a0,1
    800029b0:	fa0482e3          	beqz	s1,80002954 <devintr+0x40>
    800029b4:	00048593          	mv	a1,s1
    800029b8:	00003517          	auipc	a0,0x3
    800029bc:	83050513          	addi	a0,a0,-2000 # 800051e8 <_ZZ12printIntegermE6digits+0xe0>
    800029c0:	00000097          	auipc	ra,0x0
    800029c4:	668080e7          	jalr	1640(ra) # 80003028 <__printf>
    800029c8:	00048513          	mv	a0,s1
    800029cc:	00000097          	auipc	ra,0x0
    800029d0:	250080e7          	jalr	592(ra) # 80002c1c <plic_complete>
    800029d4:	00100513          	li	a0,1
    800029d8:	f7dff06f          	j	80002954 <devintr+0x40>
    800029dc:	00004517          	auipc	a0,0x4
    800029e0:	1a450513          	addi	a0,a0,420 # 80006b80 <tickslock>
    800029e4:	00001097          	auipc	ra,0x1
    800029e8:	318080e7          	jalr	792(ra) # 80003cfc <acquire>
    800029ec:	00003717          	auipc	a4,0x3
    800029f0:	08870713          	addi	a4,a4,136 # 80005a74 <ticks>
    800029f4:	00072783          	lw	a5,0(a4)
    800029f8:	00004517          	auipc	a0,0x4
    800029fc:	18850513          	addi	a0,a0,392 # 80006b80 <tickslock>
    80002a00:	0017879b          	addiw	a5,a5,1
    80002a04:	00f72023          	sw	a5,0(a4)
    80002a08:	00001097          	auipc	ra,0x1
    80002a0c:	3c0080e7          	jalr	960(ra) # 80003dc8 <release>
    80002a10:	f65ff06f          	j	80002974 <devintr+0x60>
    80002a14:	00001097          	auipc	ra,0x1
    80002a18:	f1c080e7          	jalr	-228(ra) # 80003930 <uartintr>
    80002a1c:	fadff06f          	j	800029c8 <devintr+0xb4>

0000000080002a20 <kernelvec>:
    80002a20:	f0010113          	addi	sp,sp,-256
    80002a24:	00113023          	sd	ra,0(sp)
    80002a28:	00213423          	sd	sp,8(sp)
    80002a2c:	00313823          	sd	gp,16(sp)
    80002a30:	00413c23          	sd	tp,24(sp)
    80002a34:	02513023          	sd	t0,32(sp)
    80002a38:	02613423          	sd	t1,40(sp)
    80002a3c:	02713823          	sd	t2,48(sp)
    80002a40:	02813c23          	sd	s0,56(sp)
    80002a44:	04913023          	sd	s1,64(sp)
    80002a48:	04a13423          	sd	a0,72(sp)
    80002a4c:	04b13823          	sd	a1,80(sp)
    80002a50:	04c13c23          	sd	a2,88(sp)
    80002a54:	06d13023          	sd	a3,96(sp)
    80002a58:	06e13423          	sd	a4,104(sp)
    80002a5c:	06f13823          	sd	a5,112(sp)
    80002a60:	07013c23          	sd	a6,120(sp)
    80002a64:	09113023          	sd	a7,128(sp)
    80002a68:	09213423          	sd	s2,136(sp)
    80002a6c:	09313823          	sd	s3,144(sp)
    80002a70:	09413c23          	sd	s4,152(sp)
    80002a74:	0b513023          	sd	s5,160(sp)
    80002a78:	0b613423          	sd	s6,168(sp)
    80002a7c:	0b713823          	sd	s7,176(sp)
    80002a80:	0b813c23          	sd	s8,184(sp)
    80002a84:	0d913023          	sd	s9,192(sp)
    80002a88:	0da13423          	sd	s10,200(sp)
    80002a8c:	0db13823          	sd	s11,208(sp)
    80002a90:	0dc13c23          	sd	t3,216(sp)
    80002a94:	0fd13023          	sd	t4,224(sp)
    80002a98:	0fe13423          	sd	t5,232(sp)
    80002a9c:	0ff13823          	sd	t6,240(sp)
    80002aa0:	cd5ff0ef          	jal	ra,80002774 <kerneltrap>
    80002aa4:	00013083          	ld	ra,0(sp)
    80002aa8:	00813103          	ld	sp,8(sp)
    80002aac:	01013183          	ld	gp,16(sp)
    80002ab0:	02013283          	ld	t0,32(sp)
    80002ab4:	02813303          	ld	t1,40(sp)
    80002ab8:	03013383          	ld	t2,48(sp)
    80002abc:	03813403          	ld	s0,56(sp)
    80002ac0:	04013483          	ld	s1,64(sp)
    80002ac4:	04813503          	ld	a0,72(sp)
    80002ac8:	05013583          	ld	a1,80(sp)
    80002acc:	05813603          	ld	a2,88(sp)
    80002ad0:	06013683          	ld	a3,96(sp)
    80002ad4:	06813703          	ld	a4,104(sp)
    80002ad8:	07013783          	ld	a5,112(sp)
    80002adc:	07813803          	ld	a6,120(sp)
    80002ae0:	08013883          	ld	a7,128(sp)
    80002ae4:	08813903          	ld	s2,136(sp)
    80002ae8:	09013983          	ld	s3,144(sp)
    80002aec:	09813a03          	ld	s4,152(sp)
    80002af0:	0a013a83          	ld	s5,160(sp)
    80002af4:	0a813b03          	ld	s6,168(sp)
    80002af8:	0b013b83          	ld	s7,176(sp)
    80002afc:	0b813c03          	ld	s8,184(sp)
    80002b00:	0c013c83          	ld	s9,192(sp)
    80002b04:	0c813d03          	ld	s10,200(sp)
    80002b08:	0d013d83          	ld	s11,208(sp)
    80002b0c:	0d813e03          	ld	t3,216(sp)
    80002b10:	0e013e83          	ld	t4,224(sp)
    80002b14:	0e813f03          	ld	t5,232(sp)
    80002b18:	0f013f83          	ld	t6,240(sp)
    80002b1c:	10010113          	addi	sp,sp,256
    80002b20:	10200073          	sret
    80002b24:	00000013          	nop
    80002b28:	00000013          	nop
    80002b2c:	00000013          	nop

0000000080002b30 <timervec>:
    80002b30:	34051573          	csrrw	a0,mscratch,a0
    80002b34:	00b53023          	sd	a1,0(a0)
    80002b38:	00c53423          	sd	a2,8(a0)
    80002b3c:	00d53823          	sd	a3,16(a0)
    80002b40:	01853583          	ld	a1,24(a0)
    80002b44:	02053603          	ld	a2,32(a0)
    80002b48:	0005b683          	ld	a3,0(a1)
    80002b4c:	00c686b3          	add	a3,a3,a2
    80002b50:	00d5b023          	sd	a3,0(a1)
    80002b54:	00200593          	li	a1,2
    80002b58:	14459073          	csrw	sip,a1
    80002b5c:	01053683          	ld	a3,16(a0)
    80002b60:	00853603          	ld	a2,8(a0)
    80002b64:	00053583          	ld	a1,0(a0)
    80002b68:	34051573          	csrrw	a0,mscratch,a0
    80002b6c:	30200073          	mret

0000000080002b70 <plicinit>:
    80002b70:	ff010113          	addi	sp,sp,-16
    80002b74:	00813423          	sd	s0,8(sp)
    80002b78:	01010413          	addi	s0,sp,16
    80002b7c:	00813403          	ld	s0,8(sp)
    80002b80:	0c0007b7          	lui	a5,0xc000
    80002b84:	00100713          	li	a4,1
    80002b88:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80002b8c:	00e7a223          	sw	a4,4(a5)
    80002b90:	01010113          	addi	sp,sp,16
    80002b94:	00008067          	ret

0000000080002b98 <plicinithart>:
    80002b98:	ff010113          	addi	sp,sp,-16
    80002b9c:	00813023          	sd	s0,0(sp)
    80002ba0:	00113423          	sd	ra,8(sp)
    80002ba4:	01010413          	addi	s0,sp,16
    80002ba8:	00000097          	auipc	ra,0x0
    80002bac:	a4c080e7          	jalr	-1460(ra) # 800025f4 <cpuid>
    80002bb0:	0085171b          	slliw	a4,a0,0x8
    80002bb4:	0c0027b7          	lui	a5,0xc002
    80002bb8:	00e787b3          	add	a5,a5,a4
    80002bbc:	40200713          	li	a4,1026
    80002bc0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002bc4:	00813083          	ld	ra,8(sp)
    80002bc8:	00013403          	ld	s0,0(sp)
    80002bcc:	00d5151b          	slliw	a0,a0,0xd
    80002bd0:	0c2017b7          	lui	a5,0xc201
    80002bd4:	00a78533          	add	a0,a5,a0
    80002bd8:	00052023          	sw	zero,0(a0)
    80002bdc:	01010113          	addi	sp,sp,16
    80002be0:	00008067          	ret

0000000080002be4 <plic_claim>:
    80002be4:	ff010113          	addi	sp,sp,-16
    80002be8:	00813023          	sd	s0,0(sp)
    80002bec:	00113423          	sd	ra,8(sp)
    80002bf0:	01010413          	addi	s0,sp,16
    80002bf4:	00000097          	auipc	ra,0x0
    80002bf8:	a00080e7          	jalr	-1536(ra) # 800025f4 <cpuid>
    80002bfc:	00813083          	ld	ra,8(sp)
    80002c00:	00013403          	ld	s0,0(sp)
    80002c04:	00d5151b          	slliw	a0,a0,0xd
    80002c08:	0c2017b7          	lui	a5,0xc201
    80002c0c:	00a78533          	add	a0,a5,a0
    80002c10:	00452503          	lw	a0,4(a0)
    80002c14:	01010113          	addi	sp,sp,16
    80002c18:	00008067          	ret

0000000080002c1c <plic_complete>:
    80002c1c:	fe010113          	addi	sp,sp,-32
    80002c20:	00813823          	sd	s0,16(sp)
    80002c24:	00913423          	sd	s1,8(sp)
    80002c28:	00113c23          	sd	ra,24(sp)
    80002c2c:	02010413          	addi	s0,sp,32
    80002c30:	00050493          	mv	s1,a0
    80002c34:	00000097          	auipc	ra,0x0
    80002c38:	9c0080e7          	jalr	-1600(ra) # 800025f4 <cpuid>
    80002c3c:	01813083          	ld	ra,24(sp)
    80002c40:	01013403          	ld	s0,16(sp)
    80002c44:	00d5179b          	slliw	a5,a0,0xd
    80002c48:	0c201737          	lui	a4,0xc201
    80002c4c:	00f707b3          	add	a5,a4,a5
    80002c50:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002c54:	00813483          	ld	s1,8(sp)
    80002c58:	02010113          	addi	sp,sp,32
    80002c5c:	00008067          	ret

0000000080002c60 <consolewrite>:
    80002c60:	fb010113          	addi	sp,sp,-80
    80002c64:	04813023          	sd	s0,64(sp)
    80002c68:	04113423          	sd	ra,72(sp)
    80002c6c:	02913c23          	sd	s1,56(sp)
    80002c70:	03213823          	sd	s2,48(sp)
    80002c74:	03313423          	sd	s3,40(sp)
    80002c78:	03413023          	sd	s4,32(sp)
    80002c7c:	01513c23          	sd	s5,24(sp)
    80002c80:	05010413          	addi	s0,sp,80
    80002c84:	06c05c63          	blez	a2,80002cfc <consolewrite+0x9c>
    80002c88:	00060993          	mv	s3,a2
    80002c8c:	00050a13          	mv	s4,a0
    80002c90:	00058493          	mv	s1,a1
    80002c94:	00000913          	li	s2,0
    80002c98:	fff00a93          	li	s5,-1
    80002c9c:	01c0006f          	j	80002cb8 <consolewrite+0x58>
    80002ca0:	fbf44503          	lbu	a0,-65(s0)
    80002ca4:	0019091b          	addiw	s2,s2,1
    80002ca8:	00148493          	addi	s1,s1,1
    80002cac:	00001097          	auipc	ra,0x1
    80002cb0:	a9c080e7          	jalr	-1380(ra) # 80003748 <uartputc>
    80002cb4:	03298063          	beq	s3,s2,80002cd4 <consolewrite+0x74>
    80002cb8:	00048613          	mv	a2,s1
    80002cbc:	00100693          	li	a3,1
    80002cc0:	000a0593          	mv	a1,s4
    80002cc4:	fbf40513          	addi	a0,s0,-65
    80002cc8:	00000097          	auipc	ra,0x0
    80002ccc:	9e4080e7          	jalr	-1564(ra) # 800026ac <either_copyin>
    80002cd0:	fd5518e3          	bne	a0,s5,80002ca0 <consolewrite+0x40>
    80002cd4:	04813083          	ld	ra,72(sp)
    80002cd8:	04013403          	ld	s0,64(sp)
    80002cdc:	03813483          	ld	s1,56(sp)
    80002ce0:	02813983          	ld	s3,40(sp)
    80002ce4:	02013a03          	ld	s4,32(sp)
    80002ce8:	01813a83          	ld	s5,24(sp)
    80002cec:	00090513          	mv	a0,s2
    80002cf0:	03013903          	ld	s2,48(sp)
    80002cf4:	05010113          	addi	sp,sp,80
    80002cf8:	00008067          	ret
    80002cfc:	00000913          	li	s2,0
    80002d00:	fd5ff06f          	j	80002cd4 <consolewrite+0x74>

0000000080002d04 <consoleread>:
    80002d04:	f9010113          	addi	sp,sp,-112
    80002d08:	06813023          	sd	s0,96(sp)
    80002d0c:	04913c23          	sd	s1,88(sp)
    80002d10:	05213823          	sd	s2,80(sp)
    80002d14:	05313423          	sd	s3,72(sp)
    80002d18:	05413023          	sd	s4,64(sp)
    80002d1c:	03513c23          	sd	s5,56(sp)
    80002d20:	03613823          	sd	s6,48(sp)
    80002d24:	03713423          	sd	s7,40(sp)
    80002d28:	03813023          	sd	s8,32(sp)
    80002d2c:	06113423          	sd	ra,104(sp)
    80002d30:	01913c23          	sd	s9,24(sp)
    80002d34:	07010413          	addi	s0,sp,112
    80002d38:	00060b93          	mv	s7,a2
    80002d3c:	00050913          	mv	s2,a0
    80002d40:	00058c13          	mv	s8,a1
    80002d44:	00060b1b          	sext.w	s6,a2
    80002d48:	00004497          	auipc	s1,0x4
    80002d4c:	e6048493          	addi	s1,s1,-416 # 80006ba8 <cons>
    80002d50:	00400993          	li	s3,4
    80002d54:	fff00a13          	li	s4,-1
    80002d58:	00a00a93          	li	s5,10
    80002d5c:	05705e63          	blez	s7,80002db8 <consoleread+0xb4>
    80002d60:	09c4a703          	lw	a4,156(s1)
    80002d64:	0984a783          	lw	a5,152(s1)
    80002d68:	0007071b          	sext.w	a4,a4
    80002d6c:	08e78463          	beq	a5,a4,80002df4 <consoleread+0xf0>
    80002d70:	07f7f713          	andi	a4,a5,127
    80002d74:	00e48733          	add	a4,s1,a4
    80002d78:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002d7c:	0017869b          	addiw	a3,a5,1
    80002d80:	08d4ac23          	sw	a3,152(s1)
    80002d84:	00070c9b          	sext.w	s9,a4
    80002d88:	0b370663          	beq	a4,s3,80002e34 <consoleread+0x130>
    80002d8c:	00100693          	li	a3,1
    80002d90:	f9f40613          	addi	a2,s0,-97
    80002d94:	000c0593          	mv	a1,s8
    80002d98:	00090513          	mv	a0,s2
    80002d9c:	f8e40fa3          	sb	a4,-97(s0)
    80002da0:	00000097          	auipc	ra,0x0
    80002da4:	8c0080e7          	jalr	-1856(ra) # 80002660 <either_copyout>
    80002da8:	01450863          	beq	a0,s4,80002db8 <consoleread+0xb4>
    80002dac:	001c0c13          	addi	s8,s8,1
    80002db0:	fffb8b9b          	addiw	s7,s7,-1
    80002db4:	fb5c94e3          	bne	s9,s5,80002d5c <consoleread+0x58>
    80002db8:	000b851b          	sext.w	a0,s7
    80002dbc:	06813083          	ld	ra,104(sp)
    80002dc0:	06013403          	ld	s0,96(sp)
    80002dc4:	05813483          	ld	s1,88(sp)
    80002dc8:	05013903          	ld	s2,80(sp)
    80002dcc:	04813983          	ld	s3,72(sp)
    80002dd0:	04013a03          	ld	s4,64(sp)
    80002dd4:	03813a83          	ld	s5,56(sp)
    80002dd8:	02813b83          	ld	s7,40(sp)
    80002ddc:	02013c03          	ld	s8,32(sp)
    80002de0:	01813c83          	ld	s9,24(sp)
    80002de4:	40ab053b          	subw	a0,s6,a0
    80002de8:	03013b03          	ld	s6,48(sp)
    80002dec:	07010113          	addi	sp,sp,112
    80002df0:	00008067          	ret
    80002df4:	00001097          	auipc	ra,0x1
    80002df8:	1d8080e7          	jalr	472(ra) # 80003fcc <push_on>
    80002dfc:	0984a703          	lw	a4,152(s1)
    80002e00:	09c4a783          	lw	a5,156(s1)
    80002e04:	0007879b          	sext.w	a5,a5
    80002e08:	fef70ce3          	beq	a4,a5,80002e00 <consoleread+0xfc>
    80002e0c:	00001097          	auipc	ra,0x1
    80002e10:	234080e7          	jalr	564(ra) # 80004040 <pop_on>
    80002e14:	0984a783          	lw	a5,152(s1)
    80002e18:	07f7f713          	andi	a4,a5,127
    80002e1c:	00e48733          	add	a4,s1,a4
    80002e20:	01874703          	lbu	a4,24(a4)
    80002e24:	0017869b          	addiw	a3,a5,1
    80002e28:	08d4ac23          	sw	a3,152(s1)
    80002e2c:	00070c9b          	sext.w	s9,a4
    80002e30:	f5371ee3          	bne	a4,s3,80002d8c <consoleread+0x88>
    80002e34:	000b851b          	sext.w	a0,s7
    80002e38:	f96bf2e3          	bgeu	s7,s6,80002dbc <consoleread+0xb8>
    80002e3c:	08f4ac23          	sw	a5,152(s1)
    80002e40:	f7dff06f          	j	80002dbc <consoleread+0xb8>

0000000080002e44 <consputc>:
    80002e44:	10000793          	li	a5,256
    80002e48:	00f50663          	beq	a0,a5,80002e54 <consputc+0x10>
    80002e4c:	00001317          	auipc	t1,0x1
    80002e50:	9f430067          	jr	-1548(t1) # 80003840 <uartputc_sync>
    80002e54:	ff010113          	addi	sp,sp,-16
    80002e58:	00113423          	sd	ra,8(sp)
    80002e5c:	00813023          	sd	s0,0(sp)
    80002e60:	01010413          	addi	s0,sp,16
    80002e64:	00800513          	li	a0,8
    80002e68:	00001097          	auipc	ra,0x1
    80002e6c:	9d8080e7          	jalr	-1576(ra) # 80003840 <uartputc_sync>
    80002e70:	02000513          	li	a0,32
    80002e74:	00001097          	auipc	ra,0x1
    80002e78:	9cc080e7          	jalr	-1588(ra) # 80003840 <uartputc_sync>
    80002e7c:	00013403          	ld	s0,0(sp)
    80002e80:	00813083          	ld	ra,8(sp)
    80002e84:	00800513          	li	a0,8
    80002e88:	01010113          	addi	sp,sp,16
    80002e8c:	00001317          	auipc	t1,0x1
    80002e90:	9b430067          	jr	-1612(t1) # 80003840 <uartputc_sync>

0000000080002e94 <consoleintr>:
    80002e94:	fe010113          	addi	sp,sp,-32
    80002e98:	00813823          	sd	s0,16(sp)
    80002e9c:	00913423          	sd	s1,8(sp)
    80002ea0:	01213023          	sd	s2,0(sp)
    80002ea4:	00113c23          	sd	ra,24(sp)
    80002ea8:	02010413          	addi	s0,sp,32
    80002eac:	00004917          	auipc	s2,0x4
    80002eb0:	cfc90913          	addi	s2,s2,-772 # 80006ba8 <cons>
    80002eb4:	00050493          	mv	s1,a0
    80002eb8:	00090513          	mv	a0,s2
    80002ebc:	00001097          	auipc	ra,0x1
    80002ec0:	e40080e7          	jalr	-448(ra) # 80003cfc <acquire>
    80002ec4:	02048c63          	beqz	s1,80002efc <consoleintr+0x68>
    80002ec8:	0a092783          	lw	a5,160(s2)
    80002ecc:	09892703          	lw	a4,152(s2)
    80002ed0:	07f00693          	li	a3,127
    80002ed4:	40e7873b          	subw	a4,a5,a4
    80002ed8:	02e6e263          	bltu	a3,a4,80002efc <consoleintr+0x68>
    80002edc:	00d00713          	li	a4,13
    80002ee0:	04e48063          	beq	s1,a4,80002f20 <consoleintr+0x8c>
    80002ee4:	07f7f713          	andi	a4,a5,127
    80002ee8:	00e90733          	add	a4,s2,a4
    80002eec:	0017879b          	addiw	a5,a5,1
    80002ef0:	0af92023          	sw	a5,160(s2)
    80002ef4:	00970c23          	sb	s1,24(a4)
    80002ef8:	08f92e23          	sw	a5,156(s2)
    80002efc:	01013403          	ld	s0,16(sp)
    80002f00:	01813083          	ld	ra,24(sp)
    80002f04:	00813483          	ld	s1,8(sp)
    80002f08:	00013903          	ld	s2,0(sp)
    80002f0c:	00004517          	auipc	a0,0x4
    80002f10:	c9c50513          	addi	a0,a0,-868 # 80006ba8 <cons>
    80002f14:	02010113          	addi	sp,sp,32
    80002f18:	00001317          	auipc	t1,0x1
    80002f1c:	eb030067          	jr	-336(t1) # 80003dc8 <release>
    80002f20:	00a00493          	li	s1,10
    80002f24:	fc1ff06f          	j	80002ee4 <consoleintr+0x50>

0000000080002f28 <consoleinit>:
    80002f28:	fe010113          	addi	sp,sp,-32
    80002f2c:	00113c23          	sd	ra,24(sp)
    80002f30:	00813823          	sd	s0,16(sp)
    80002f34:	00913423          	sd	s1,8(sp)
    80002f38:	02010413          	addi	s0,sp,32
    80002f3c:	00004497          	auipc	s1,0x4
    80002f40:	c6c48493          	addi	s1,s1,-916 # 80006ba8 <cons>
    80002f44:	00048513          	mv	a0,s1
    80002f48:	00002597          	auipc	a1,0x2
    80002f4c:	2f858593          	addi	a1,a1,760 # 80005240 <_ZZ12printIntegermE6digits+0x138>
    80002f50:	00001097          	auipc	ra,0x1
    80002f54:	d88080e7          	jalr	-632(ra) # 80003cd8 <initlock>
    80002f58:	00000097          	auipc	ra,0x0
    80002f5c:	7ac080e7          	jalr	1964(ra) # 80003704 <uartinit>
    80002f60:	01813083          	ld	ra,24(sp)
    80002f64:	01013403          	ld	s0,16(sp)
    80002f68:	00000797          	auipc	a5,0x0
    80002f6c:	d9c78793          	addi	a5,a5,-612 # 80002d04 <consoleread>
    80002f70:	0af4bc23          	sd	a5,184(s1)
    80002f74:	00000797          	auipc	a5,0x0
    80002f78:	cec78793          	addi	a5,a5,-788 # 80002c60 <consolewrite>
    80002f7c:	0cf4b023          	sd	a5,192(s1)
    80002f80:	00813483          	ld	s1,8(sp)
    80002f84:	02010113          	addi	sp,sp,32
    80002f88:	00008067          	ret

0000000080002f8c <console_read>:
    80002f8c:	ff010113          	addi	sp,sp,-16
    80002f90:	00813423          	sd	s0,8(sp)
    80002f94:	01010413          	addi	s0,sp,16
    80002f98:	00813403          	ld	s0,8(sp)
    80002f9c:	00004317          	auipc	t1,0x4
    80002fa0:	cc433303          	ld	t1,-828(t1) # 80006c60 <devsw+0x10>
    80002fa4:	01010113          	addi	sp,sp,16
    80002fa8:	00030067          	jr	t1

0000000080002fac <console_write>:
    80002fac:	ff010113          	addi	sp,sp,-16
    80002fb0:	00813423          	sd	s0,8(sp)
    80002fb4:	01010413          	addi	s0,sp,16
    80002fb8:	00813403          	ld	s0,8(sp)
    80002fbc:	00004317          	auipc	t1,0x4
    80002fc0:	cac33303          	ld	t1,-852(t1) # 80006c68 <devsw+0x18>
    80002fc4:	01010113          	addi	sp,sp,16
    80002fc8:	00030067          	jr	t1

0000000080002fcc <panic>:
    80002fcc:	fe010113          	addi	sp,sp,-32
    80002fd0:	00113c23          	sd	ra,24(sp)
    80002fd4:	00813823          	sd	s0,16(sp)
    80002fd8:	00913423          	sd	s1,8(sp)
    80002fdc:	02010413          	addi	s0,sp,32
    80002fe0:	00050493          	mv	s1,a0
    80002fe4:	00002517          	auipc	a0,0x2
    80002fe8:	26450513          	addi	a0,a0,612 # 80005248 <_ZZ12printIntegermE6digits+0x140>
    80002fec:	00004797          	auipc	a5,0x4
    80002ff0:	d007ae23          	sw	zero,-740(a5) # 80006d08 <pr+0x18>
    80002ff4:	00000097          	auipc	ra,0x0
    80002ff8:	034080e7          	jalr	52(ra) # 80003028 <__printf>
    80002ffc:	00048513          	mv	a0,s1
    80003000:	00000097          	auipc	ra,0x0
    80003004:	028080e7          	jalr	40(ra) # 80003028 <__printf>
    80003008:	00002517          	auipc	a0,0x2
    8000300c:	0e850513          	addi	a0,a0,232 # 800050f0 <CONSOLE_STATUS+0xe0>
    80003010:	00000097          	auipc	ra,0x0
    80003014:	018080e7          	jalr	24(ra) # 80003028 <__printf>
    80003018:	00100793          	li	a5,1
    8000301c:	00003717          	auipc	a4,0x3
    80003020:	a4f72e23          	sw	a5,-1444(a4) # 80005a78 <panicked>
    80003024:	0000006f          	j	80003024 <panic+0x58>

0000000080003028 <__printf>:
    80003028:	f3010113          	addi	sp,sp,-208
    8000302c:	08813023          	sd	s0,128(sp)
    80003030:	07313423          	sd	s3,104(sp)
    80003034:	09010413          	addi	s0,sp,144
    80003038:	05813023          	sd	s8,64(sp)
    8000303c:	08113423          	sd	ra,136(sp)
    80003040:	06913c23          	sd	s1,120(sp)
    80003044:	07213823          	sd	s2,112(sp)
    80003048:	07413023          	sd	s4,96(sp)
    8000304c:	05513c23          	sd	s5,88(sp)
    80003050:	05613823          	sd	s6,80(sp)
    80003054:	05713423          	sd	s7,72(sp)
    80003058:	03913c23          	sd	s9,56(sp)
    8000305c:	03a13823          	sd	s10,48(sp)
    80003060:	03b13423          	sd	s11,40(sp)
    80003064:	00004317          	auipc	t1,0x4
    80003068:	c8c30313          	addi	t1,t1,-884 # 80006cf0 <pr>
    8000306c:	01832c03          	lw	s8,24(t1)
    80003070:	00b43423          	sd	a1,8(s0)
    80003074:	00c43823          	sd	a2,16(s0)
    80003078:	00d43c23          	sd	a3,24(s0)
    8000307c:	02e43023          	sd	a4,32(s0)
    80003080:	02f43423          	sd	a5,40(s0)
    80003084:	03043823          	sd	a6,48(s0)
    80003088:	03143c23          	sd	a7,56(s0)
    8000308c:	00050993          	mv	s3,a0
    80003090:	4a0c1663          	bnez	s8,8000353c <__printf+0x514>
    80003094:	60098c63          	beqz	s3,800036ac <__printf+0x684>
    80003098:	0009c503          	lbu	a0,0(s3)
    8000309c:	00840793          	addi	a5,s0,8
    800030a0:	f6f43c23          	sd	a5,-136(s0)
    800030a4:	00000493          	li	s1,0
    800030a8:	22050063          	beqz	a0,800032c8 <__printf+0x2a0>
    800030ac:	00002a37          	lui	s4,0x2
    800030b0:	00018ab7          	lui	s5,0x18
    800030b4:	000f4b37          	lui	s6,0xf4
    800030b8:	00989bb7          	lui	s7,0x989
    800030bc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800030c0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800030c4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800030c8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800030cc:	00148c9b          	addiw	s9,s1,1
    800030d0:	02500793          	li	a5,37
    800030d4:	01998933          	add	s2,s3,s9
    800030d8:	38f51263          	bne	a0,a5,8000345c <__printf+0x434>
    800030dc:	00094783          	lbu	a5,0(s2)
    800030e0:	00078c9b          	sext.w	s9,a5
    800030e4:	1e078263          	beqz	a5,800032c8 <__printf+0x2a0>
    800030e8:	0024849b          	addiw	s1,s1,2
    800030ec:	07000713          	li	a4,112
    800030f0:	00998933          	add	s2,s3,s1
    800030f4:	38e78a63          	beq	a5,a4,80003488 <__printf+0x460>
    800030f8:	20f76863          	bltu	a4,a5,80003308 <__printf+0x2e0>
    800030fc:	42a78863          	beq	a5,a0,8000352c <__printf+0x504>
    80003100:	06400713          	li	a4,100
    80003104:	40e79663          	bne	a5,a4,80003510 <__printf+0x4e8>
    80003108:	f7843783          	ld	a5,-136(s0)
    8000310c:	0007a603          	lw	a2,0(a5)
    80003110:	00878793          	addi	a5,a5,8
    80003114:	f6f43c23          	sd	a5,-136(s0)
    80003118:	42064a63          	bltz	a2,8000354c <__printf+0x524>
    8000311c:	00a00713          	li	a4,10
    80003120:	02e677bb          	remuw	a5,a2,a4
    80003124:	00002d97          	auipc	s11,0x2
    80003128:	14cd8d93          	addi	s11,s11,332 # 80005270 <digits>
    8000312c:	00900593          	li	a1,9
    80003130:	0006051b          	sext.w	a0,a2
    80003134:	00000c93          	li	s9,0
    80003138:	02079793          	slli	a5,a5,0x20
    8000313c:	0207d793          	srli	a5,a5,0x20
    80003140:	00fd87b3          	add	a5,s11,a5
    80003144:	0007c783          	lbu	a5,0(a5)
    80003148:	02e656bb          	divuw	a3,a2,a4
    8000314c:	f8f40023          	sb	a5,-128(s0)
    80003150:	14c5d863          	bge	a1,a2,800032a0 <__printf+0x278>
    80003154:	06300593          	li	a1,99
    80003158:	00100c93          	li	s9,1
    8000315c:	02e6f7bb          	remuw	a5,a3,a4
    80003160:	02079793          	slli	a5,a5,0x20
    80003164:	0207d793          	srli	a5,a5,0x20
    80003168:	00fd87b3          	add	a5,s11,a5
    8000316c:	0007c783          	lbu	a5,0(a5)
    80003170:	02e6d73b          	divuw	a4,a3,a4
    80003174:	f8f400a3          	sb	a5,-127(s0)
    80003178:	12a5f463          	bgeu	a1,a0,800032a0 <__printf+0x278>
    8000317c:	00a00693          	li	a3,10
    80003180:	00900593          	li	a1,9
    80003184:	02d777bb          	remuw	a5,a4,a3
    80003188:	02079793          	slli	a5,a5,0x20
    8000318c:	0207d793          	srli	a5,a5,0x20
    80003190:	00fd87b3          	add	a5,s11,a5
    80003194:	0007c503          	lbu	a0,0(a5)
    80003198:	02d757bb          	divuw	a5,a4,a3
    8000319c:	f8a40123          	sb	a0,-126(s0)
    800031a0:	48e5f263          	bgeu	a1,a4,80003624 <__printf+0x5fc>
    800031a4:	06300513          	li	a0,99
    800031a8:	02d7f5bb          	remuw	a1,a5,a3
    800031ac:	02059593          	slli	a1,a1,0x20
    800031b0:	0205d593          	srli	a1,a1,0x20
    800031b4:	00bd85b3          	add	a1,s11,a1
    800031b8:	0005c583          	lbu	a1,0(a1)
    800031bc:	02d7d7bb          	divuw	a5,a5,a3
    800031c0:	f8b401a3          	sb	a1,-125(s0)
    800031c4:	48e57263          	bgeu	a0,a4,80003648 <__printf+0x620>
    800031c8:	3e700513          	li	a0,999
    800031cc:	02d7f5bb          	remuw	a1,a5,a3
    800031d0:	02059593          	slli	a1,a1,0x20
    800031d4:	0205d593          	srli	a1,a1,0x20
    800031d8:	00bd85b3          	add	a1,s11,a1
    800031dc:	0005c583          	lbu	a1,0(a1)
    800031e0:	02d7d7bb          	divuw	a5,a5,a3
    800031e4:	f8b40223          	sb	a1,-124(s0)
    800031e8:	46e57663          	bgeu	a0,a4,80003654 <__printf+0x62c>
    800031ec:	02d7f5bb          	remuw	a1,a5,a3
    800031f0:	02059593          	slli	a1,a1,0x20
    800031f4:	0205d593          	srli	a1,a1,0x20
    800031f8:	00bd85b3          	add	a1,s11,a1
    800031fc:	0005c583          	lbu	a1,0(a1)
    80003200:	02d7d7bb          	divuw	a5,a5,a3
    80003204:	f8b402a3          	sb	a1,-123(s0)
    80003208:	46ea7863          	bgeu	s4,a4,80003678 <__printf+0x650>
    8000320c:	02d7f5bb          	remuw	a1,a5,a3
    80003210:	02059593          	slli	a1,a1,0x20
    80003214:	0205d593          	srli	a1,a1,0x20
    80003218:	00bd85b3          	add	a1,s11,a1
    8000321c:	0005c583          	lbu	a1,0(a1)
    80003220:	02d7d7bb          	divuw	a5,a5,a3
    80003224:	f8b40323          	sb	a1,-122(s0)
    80003228:	3eeaf863          	bgeu	s5,a4,80003618 <__printf+0x5f0>
    8000322c:	02d7f5bb          	remuw	a1,a5,a3
    80003230:	02059593          	slli	a1,a1,0x20
    80003234:	0205d593          	srli	a1,a1,0x20
    80003238:	00bd85b3          	add	a1,s11,a1
    8000323c:	0005c583          	lbu	a1,0(a1)
    80003240:	02d7d7bb          	divuw	a5,a5,a3
    80003244:	f8b403a3          	sb	a1,-121(s0)
    80003248:	42eb7e63          	bgeu	s6,a4,80003684 <__printf+0x65c>
    8000324c:	02d7f5bb          	remuw	a1,a5,a3
    80003250:	02059593          	slli	a1,a1,0x20
    80003254:	0205d593          	srli	a1,a1,0x20
    80003258:	00bd85b3          	add	a1,s11,a1
    8000325c:	0005c583          	lbu	a1,0(a1)
    80003260:	02d7d7bb          	divuw	a5,a5,a3
    80003264:	f8b40423          	sb	a1,-120(s0)
    80003268:	42ebfc63          	bgeu	s7,a4,800036a0 <__printf+0x678>
    8000326c:	02079793          	slli	a5,a5,0x20
    80003270:	0207d793          	srli	a5,a5,0x20
    80003274:	00fd8db3          	add	s11,s11,a5
    80003278:	000dc703          	lbu	a4,0(s11)
    8000327c:	00a00793          	li	a5,10
    80003280:	00900c93          	li	s9,9
    80003284:	f8e404a3          	sb	a4,-119(s0)
    80003288:	00065c63          	bgez	a2,800032a0 <__printf+0x278>
    8000328c:	f9040713          	addi	a4,s0,-112
    80003290:	00f70733          	add	a4,a4,a5
    80003294:	02d00693          	li	a3,45
    80003298:	fed70823          	sb	a3,-16(a4)
    8000329c:	00078c93          	mv	s9,a5
    800032a0:	f8040793          	addi	a5,s0,-128
    800032a4:	01978cb3          	add	s9,a5,s9
    800032a8:	f7f40d13          	addi	s10,s0,-129
    800032ac:	000cc503          	lbu	a0,0(s9)
    800032b0:	fffc8c93          	addi	s9,s9,-1
    800032b4:	00000097          	auipc	ra,0x0
    800032b8:	b90080e7          	jalr	-1136(ra) # 80002e44 <consputc>
    800032bc:	ffac98e3          	bne	s9,s10,800032ac <__printf+0x284>
    800032c0:	00094503          	lbu	a0,0(s2)
    800032c4:	e00514e3          	bnez	a0,800030cc <__printf+0xa4>
    800032c8:	1a0c1663          	bnez	s8,80003474 <__printf+0x44c>
    800032cc:	08813083          	ld	ra,136(sp)
    800032d0:	08013403          	ld	s0,128(sp)
    800032d4:	07813483          	ld	s1,120(sp)
    800032d8:	07013903          	ld	s2,112(sp)
    800032dc:	06813983          	ld	s3,104(sp)
    800032e0:	06013a03          	ld	s4,96(sp)
    800032e4:	05813a83          	ld	s5,88(sp)
    800032e8:	05013b03          	ld	s6,80(sp)
    800032ec:	04813b83          	ld	s7,72(sp)
    800032f0:	04013c03          	ld	s8,64(sp)
    800032f4:	03813c83          	ld	s9,56(sp)
    800032f8:	03013d03          	ld	s10,48(sp)
    800032fc:	02813d83          	ld	s11,40(sp)
    80003300:	0d010113          	addi	sp,sp,208
    80003304:	00008067          	ret
    80003308:	07300713          	li	a4,115
    8000330c:	1ce78a63          	beq	a5,a4,800034e0 <__printf+0x4b8>
    80003310:	07800713          	li	a4,120
    80003314:	1ee79e63          	bne	a5,a4,80003510 <__printf+0x4e8>
    80003318:	f7843783          	ld	a5,-136(s0)
    8000331c:	0007a703          	lw	a4,0(a5)
    80003320:	00878793          	addi	a5,a5,8
    80003324:	f6f43c23          	sd	a5,-136(s0)
    80003328:	28074263          	bltz	a4,800035ac <__printf+0x584>
    8000332c:	00002d97          	auipc	s11,0x2
    80003330:	f44d8d93          	addi	s11,s11,-188 # 80005270 <digits>
    80003334:	00f77793          	andi	a5,a4,15
    80003338:	00fd87b3          	add	a5,s11,a5
    8000333c:	0007c683          	lbu	a3,0(a5)
    80003340:	00f00613          	li	a2,15
    80003344:	0007079b          	sext.w	a5,a4
    80003348:	f8d40023          	sb	a3,-128(s0)
    8000334c:	0047559b          	srliw	a1,a4,0x4
    80003350:	0047569b          	srliw	a3,a4,0x4
    80003354:	00000c93          	li	s9,0
    80003358:	0ee65063          	bge	a2,a4,80003438 <__printf+0x410>
    8000335c:	00f6f693          	andi	a3,a3,15
    80003360:	00dd86b3          	add	a3,s11,a3
    80003364:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003368:	0087d79b          	srliw	a5,a5,0x8
    8000336c:	00100c93          	li	s9,1
    80003370:	f8d400a3          	sb	a3,-127(s0)
    80003374:	0cb67263          	bgeu	a2,a1,80003438 <__printf+0x410>
    80003378:	00f7f693          	andi	a3,a5,15
    8000337c:	00dd86b3          	add	a3,s11,a3
    80003380:	0006c583          	lbu	a1,0(a3)
    80003384:	00f00613          	li	a2,15
    80003388:	0047d69b          	srliw	a3,a5,0x4
    8000338c:	f8b40123          	sb	a1,-126(s0)
    80003390:	0047d593          	srli	a1,a5,0x4
    80003394:	28f67e63          	bgeu	a2,a5,80003630 <__printf+0x608>
    80003398:	00f6f693          	andi	a3,a3,15
    8000339c:	00dd86b3          	add	a3,s11,a3
    800033a0:	0006c503          	lbu	a0,0(a3)
    800033a4:	0087d813          	srli	a6,a5,0x8
    800033a8:	0087d69b          	srliw	a3,a5,0x8
    800033ac:	f8a401a3          	sb	a0,-125(s0)
    800033b0:	28b67663          	bgeu	a2,a1,8000363c <__printf+0x614>
    800033b4:	00f6f693          	andi	a3,a3,15
    800033b8:	00dd86b3          	add	a3,s11,a3
    800033bc:	0006c583          	lbu	a1,0(a3)
    800033c0:	00c7d513          	srli	a0,a5,0xc
    800033c4:	00c7d69b          	srliw	a3,a5,0xc
    800033c8:	f8b40223          	sb	a1,-124(s0)
    800033cc:	29067a63          	bgeu	a2,a6,80003660 <__printf+0x638>
    800033d0:	00f6f693          	andi	a3,a3,15
    800033d4:	00dd86b3          	add	a3,s11,a3
    800033d8:	0006c583          	lbu	a1,0(a3)
    800033dc:	0107d813          	srli	a6,a5,0x10
    800033e0:	0107d69b          	srliw	a3,a5,0x10
    800033e4:	f8b402a3          	sb	a1,-123(s0)
    800033e8:	28a67263          	bgeu	a2,a0,8000366c <__printf+0x644>
    800033ec:	00f6f693          	andi	a3,a3,15
    800033f0:	00dd86b3          	add	a3,s11,a3
    800033f4:	0006c683          	lbu	a3,0(a3)
    800033f8:	0147d79b          	srliw	a5,a5,0x14
    800033fc:	f8d40323          	sb	a3,-122(s0)
    80003400:	21067663          	bgeu	a2,a6,8000360c <__printf+0x5e4>
    80003404:	02079793          	slli	a5,a5,0x20
    80003408:	0207d793          	srli	a5,a5,0x20
    8000340c:	00fd8db3          	add	s11,s11,a5
    80003410:	000dc683          	lbu	a3,0(s11)
    80003414:	00800793          	li	a5,8
    80003418:	00700c93          	li	s9,7
    8000341c:	f8d403a3          	sb	a3,-121(s0)
    80003420:	00075c63          	bgez	a4,80003438 <__printf+0x410>
    80003424:	f9040713          	addi	a4,s0,-112
    80003428:	00f70733          	add	a4,a4,a5
    8000342c:	02d00693          	li	a3,45
    80003430:	fed70823          	sb	a3,-16(a4)
    80003434:	00078c93          	mv	s9,a5
    80003438:	f8040793          	addi	a5,s0,-128
    8000343c:	01978cb3          	add	s9,a5,s9
    80003440:	f7f40d13          	addi	s10,s0,-129
    80003444:	000cc503          	lbu	a0,0(s9)
    80003448:	fffc8c93          	addi	s9,s9,-1
    8000344c:	00000097          	auipc	ra,0x0
    80003450:	9f8080e7          	jalr	-1544(ra) # 80002e44 <consputc>
    80003454:	ff9d18e3          	bne	s10,s9,80003444 <__printf+0x41c>
    80003458:	0100006f          	j	80003468 <__printf+0x440>
    8000345c:	00000097          	auipc	ra,0x0
    80003460:	9e8080e7          	jalr	-1560(ra) # 80002e44 <consputc>
    80003464:	000c8493          	mv	s1,s9
    80003468:	00094503          	lbu	a0,0(s2)
    8000346c:	c60510e3          	bnez	a0,800030cc <__printf+0xa4>
    80003470:	e40c0ee3          	beqz	s8,800032cc <__printf+0x2a4>
    80003474:	00004517          	auipc	a0,0x4
    80003478:	87c50513          	addi	a0,a0,-1924 # 80006cf0 <pr>
    8000347c:	00001097          	auipc	ra,0x1
    80003480:	94c080e7          	jalr	-1716(ra) # 80003dc8 <release>
    80003484:	e49ff06f          	j	800032cc <__printf+0x2a4>
    80003488:	f7843783          	ld	a5,-136(s0)
    8000348c:	03000513          	li	a0,48
    80003490:	01000d13          	li	s10,16
    80003494:	00878713          	addi	a4,a5,8
    80003498:	0007bc83          	ld	s9,0(a5)
    8000349c:	f6e43c23          	sd	a4,-136(s0)
    800034a0:	00000097          	auipc	ra,0x0
    800034a4:	9a4080e7          	jalr	-1628(ra) # 80002e44 <consputc>
    800034a8:	07800513          	li	a0,120
    800034ac:	00000097          	auipc	ra,0x0
    800034b0:	998080e7          	jalr	-1640(ra) # 80002e44 <consputc>
    800034b4:	00002d97          	auipc	s11,0x2
    800034b8:	dbcd8d93          	addi	s11,s11,-580 # 80005270 <digits>
    800034bc:	03ccd793          	srli	a5,s9,0x3c
    800034c0:	00fd87b3          	add	a5,s11,a5
    800034c4:	0007c503          	lbu	a0,0(a5)
    800034c8:	fffd0d1b          	addiw	s10,s10,-1
    800034cc:	004c9c93          	slli	s9,s9,0x4
    800034d0:	00000097          	auipc	ra,0x0
    800034d4:	974080e7          	jalr	-1676(ra) # 80002e44 <consputc>
    800034d8:	fe0d12e3          	bnez	s10,800034bc <__printf+0x494>
    800034dc:	f8dff06f          	j	80003468 <__printf+0x440>
    800034e0:	f7843783          	ld	a5,-136(s0)
    800034e4:	0007bc83          	ld	s9,0(a5)
    800034e8:	00878793          	addi	a5,a5,8
    800034ec:	f6f43c23          	sd	a5,-136(s0)
    800034f0:	000c9a63          	bnez	s9,80003504 <__printf+0x4dc>
    800034f4:	1080006f          	j	800035fc <__printf+0x5d4>
    800034f8:	001c8c93          	addi	s9,s9,1
    800034fc:	00000097          	auipc	ra,0x0
    80003500:	948080e7          	jalr	-1720(ra) # 80002e44 <consputc>
    80003504:	000cc503          	lbu	a0,0(s9)
    80003508:	fe0518e3          	bnez	a0,800034f8 <__printf+0x4d0>
    8000350c:	f5dff06f          	j	80003468 <__printf+0x440>
    80003510:	02500513          	li	a0,37
    80003514:	00000097          	auipc	ra,0x0
    80003518:	930080e7          	jalr	-1744(ra) # 80002e44 <consputc>
    8000351c:	000c8513          	mv	a0,s9
    80003520:	00000097          	auipc	ra,0x0
    80003524:	924080e7          	jalr	-1756(ra) # 80002e44 <consputc>
    80003528:	f41ff06f          	j	80003468 <__printf+0x440>
    8000352c:	02500513          	li	a0,37
    80003530:	00000097          	auipc	ra,0x0
    80003534:	914080e7          	jalr	-1772(ra) # 80002e44 <consputc>
    80003538:	f31ff06f          	j	80003468 <__printf+0x440>
    8000353c:	00030513          	mv	a0,t1
    80003540:	00000097          	auipc	ra,0x0
    80003544:	7bc080e7          	jalr	1980(ra) # 80003cfc <acquire>
    80003548:	b4dff06f          	j	80003094 <__printf+0x6c>
    8000354c:	40c0053b          	negw	a0,a2
    80003550:	00a00713          	li	a4,10
    80003554:	02e576bb          	remuw	a3,a0,a4
    80003558:	00002d97          	auipc	s11,0x2
    8000355c:	d18d8d93          	addi	s11,s11,-744 # 80005270 <digits>
    80003560:	ff700593          	li	a1,-9
    80003564:	02069693          	slli	a3,a3,0x20
    80003568:	0206d693          	srli	a3,a3,0x20
    8000356c:	00dd86b3          	add	a3,s11,a3
    80003570:	0006c683          	lbu	a3,0(a3)
    80003574:	02e557bb          	divuw	a5,a0,a4
    80003578:	f8d40023          	sb	a3,-128(s0)
    8000357c:	10b65e63          	bge	a2,a1,80003698 <__printf+0x670>
    80003580:	06300593          	li	a1,99
    80003584:	02e7f6bb          	remuw	a3,a5,a4
    80003588:	02069693          	slli	a3,a3,0x20
    8000358c:	0206d693          	srli	a3,a3,0x20
    80003590:	00dd86b3          	add	a3,s11,a3
    80003594:	0006c683          	lbu	a3,0(a3)
    80003598:	02e7d73b          	divuw	a4,a5,a4
    8000359c:	00200793          	li	a5,2
    800035a0:	f8d400a3          	sb	a3,-127(s0)
    800035a4:	bca5ece3          	bltu	a1,a0,8000317c <__printf+0x154>
    800035a8:	ce5ff06f          	j	8000328c <__printf+0x264>
    800035ac:	40e007bb          	negw	a5,a4
    800035b0:	00002d97          	auipc	s11,0x2
    800035b4:	cc0d8d93          	addi	s11,s11,-832 # 80005270 <digits>
    800035b8:	00f7f693          	andi	a3,a5,15
    800035bc:	00dd86b3          	add	a3,s11,a3
    800035c0:	0006c583          	lbu	a1,0(a3)
    800035c4:	ff100613          	li	a2,-15
    800035c8:	0047d69b          	srliw	a3,a5,0x4
    800035cc:	f8b40023          	sb	a1,-128(s0)
    800035d0:	0047d59b          	srliw	a1,a5,0x4
    800035d4:	0ac75e63          	bge	a4,a2,80003690 <__printf+0x668>
    800035d8:	00f6f693          	andi	a3,a3,15
    800035dc:	00dd86b3          	add	a3,s11,a3
    800035e0:	0006c603          	lbu	a2,0(a3)
    800035e4:	00f00693          	li	a3,15
    800035e8:	0087d79b          	srliw	a5,a5,0x8
    800035ec:	f8c400a3          	sb	a2,-127(s0)
    800035f0:	d8b6e4e3          	bltu	a3,a1,80003378 <__printf+0x350>
    800035f4:	00200793          	li	a5,2
    800035f8:	e2dff06f          	j	80003424 <__printf+0x3fc>
    800035fc:	00002c97          	auipc	s9,0x2
    80003600:	c54c8c93          	addi	s9,s9,-940 # 80005250 <_ZZ12printIntegermE6digits+0x148>
    80003604:	02800513          	li	a0,40
    80003608:	ef1ff06f          	j	800034f8 <__printf+0x4d0>
    8000360c:	00700793          	li	a5,7
    80003610:	00600c93          	li	s9,6
    80003614:	e0dff06f          	j	80003420 <__printf+0x3f8>
    80003618:	00700793          	li	a5,7
    8000361c:	00600c93          	li	s9,6
    80003620:	c69ff06f          	j	80003288 <__printf+0x260>
    80003624:	00300793          	li	a5,3
    80003628:	00200c93          	li	s9,2
    8000362c:	c5dff06f          	j	80003288 <__printf+0x260>
    80003630:	00300793          	li	a5,3
    80003634:	00200c93          	li	s9,2
    80003638:	de9ff06f          	j	80003420 <__printf+0x3f8>
    8000363c:	00400793          	li	a5,4
    80003640:	00300c93          	li	s9,3
    80003644:	dddff06f          	j	80003420 <__printf+0x3f8>
    80003648:	00400793          	li	a5,4
    8000364c:	00300c93          	li	s9,3
    80003650:	c39ff06f          	j	80003288 <__printf+0x260>
    80003654:	00500793          	li	a5,5
    80003658:	00400c93          	li	s9,4
    8000365c:	c2dff06f          	j	80003288 <__printf+0x260>
    80003660:	00500793          	li	a5,5
    80003664:	00400c93          	li	s9,4
    80003668:	db9ff06f          	j	80003420 <__printf+0x3f8>
    8000366c:	00600793          	li	a5,6
    80003670:	00500c93          	li	s9,5
    80003674:	dadff06f          	j	80003420 <__printf+0x3f8>
    80003678:	00600793          	li	a5,6
    8000367c:	00500c93          	li	s9,5
    80003680:	c09ff06f          	j	80003288 <__printf+0x260>
    80003684:	00800793          	li	a5,8
    80003688:	00700c93          	li	s9,7
    8000368c:	bfdff06f          	j	80003288 <__printf+0x260>
    80003690:	00100793          	li	a5,1
    80003694:	d91ff06f          	j	80003424 <__printf+0x3fc>
    80003698:	00100793          	li	a5,1
    8000369c:	bf1ff06f          	j	8000328c <__printf+0x264>
    800036a0:	00900793          	li	a5,9
    800036a4:	00800c93          	li	s9,8
    800036a8:	be1ff06f          	j	80003288 <__printf+0x260>
    800036ac:	00002517          	auipc	a0,0x2
    800036b0:	bac50513          	addi	a0,a0,-1108 # 80005258 <_ZZ12printIntegermE6digits+0x150>
    800036b4:	00000097          	auipc	ra,0x0
    800036b8:	918080e7          	jalr	-1768(ra) # 80002fcc <panic>

00000000800036bc <printfinit>:
    800036bc:	fe010113          	addi	sp,sp,-32
    800036c0:	00813823          	sd	s0,16(sp)
    800036c4:	00913423          	sd	s1,8(sp)
    800036c8:	00113c23          	sd	ra,24(sp)
    800036cc:	02010413          	addi	s0,sp,32
    800036d0:	00003497          	auipc	s1,0x3
    800036d4:	62048493          	addi	s1,s1,1568 # 80006cf0 <pr>
    800036d8:	00048513          	mv	a0,s1
    800036dc:	00002597          	auipc	a1,0x2
    800036e0:	b8c58593          	addi	a1,a1,-1140 # 80005268 <_ZZ12printIntegermE6digits+0x160>
    800036e4:	00000097          	auipc	ra,0x0
    800036e8:	5f4080e7          	jalr	1524(ra) # 80003cd8 <initlock>
    800036ec:	01813083          	ld	ra,24(sp)
    800036f0:	01013403          	ld	s0,16(sp)
    800036f4:	0004ac23          	sw	zero,24(s1)
    800036f8:	00813483          	ld	s1,8(sp)
    800036fc:	02010113          	addi	sp,sp,32
    80003700:	00008067          	ret

0000000080003704 <uartinit>:
    80003704:	ff010113          	addi	sp,sp,-16
    80003708:	00813423          	sd	s0,8(sp)
    8000370c:	01010413          	addi	s0,sp,16
    80003710:	100007b7          	lui	a5,0x10000
    80003714:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003718:	f8000713          	li	a4,-128
    8000371c:	00e781a3          	sb	a4,3(a5)
    80003720:	00300713          	li	a4,3
    80003724:	00e78023          	sb	a4,0(a5)
    80003728:	000780a3          	sb	zero,1(a5)
    8000372c:	00e781a3          	sb	a4,3(a5)
    80003730:	00700693          	li	a3,7
    80003734:	00d78123          	sb	a3,2(a5)
    80003738:	00e780a3          	sb	a4,1(a5)
    8000373c:	00813403          	ld	s0,8(sp)
    80003740:	01010113          	addi	sp,sp,16
    80003744:	00008067          	ret

0000000080003748 <uartputc>:
    80003748:	00002797          	auipc	a5,0x2
    8000374c:	3307a783          	lw	a5,816(a5) # 80005a78 <panicked>
    80003750:	00078463          	beqz	a5,80003758 <uartputc+0x10>
    80003754:	0000006f          	j	80003754 <uartputc+0xc>
    80003758:	fd010113          	addi	sp,sp,-48
    8000375c:	02813023          	sd	s0,32(sp)
    80003760:	00913c23          	sd	s1,24(sp)
    80003764:	01213823          	sd	s2,16(sp)
    80003768:	01313423          	sd	s3,8(sp)
    8000376c:	02113423          	sd	ra,40(sp)
    80003770:	03010413          	addi	s0,sp,48
    80003774:	00002917          	auipc	s2,0x2
    80003778:	30c90913          	addi	s2,s2,780 # 80005a80 <uart_tx_r>
    8000377c:	00093783          	ld	a5,0(s2)
    80003780:	00002497          	auipc	s1,0x2
    80003784:	30848493          	addi	s1,s1,776 # 80005a88 <uart_tx_w>
    80003788:	0004b703          	ld	a4,0(s1)
    8000378c:	02078693          	addi	a3,a5,32
    80003790:	00050993          	mv	s3,a0
    80003794:	02e69c63          	bne	a3,a4,800037cc <uartputc+0x84>
    80003798:	00001097          	auipc	ra,0x1
    8000379c:	834080e7          	jalr	-1996(ra) # 80003fcc <push_on>
    800037a0:	00093783          	ld	a5,0(s2)
    800037a4:	0004b703          	ld	a4,0(s1)
    800037a8:	02078793          	addi	a5,a5,32
    800037ac:	00e79463          	bne	a5,a4,800037b4 <uartputc+0x6c>
    800037b0:	0000006f          	j	800037b0 <uartputc+0x68>
    800037b4:	00001097          	auipc	ra,0x1
    800037b8:	88c080e7          	jalr	-1908(ra) # 80004040 <pop_on>
    800037bc:	00093783          	ld	a5,0(s2)
    800037c0:	0004b703          	ld	a4,0(s1)
    800037c4:	02078693          	addi	a3,a5,32
    800037c8:	fce688e3          	beq	a3,a4,80003798 <uartputc+0x50>
    800037cc:	01f77693          	andi	a3,a4,31
    800037d0:	00003597          	auipc	a1,0x3
    800037d4:	54058593          	addi	a1,a1,1344 # 80006d10 <uart_tx_buf>
    800037d8:	00d586b3          	add	a3,a1,a3
    800037dc:	00170713          	addi	a4,a4,1
    800037e0:	01368023          	sb	s3,0(a3)
    800037e4:	00e4b023          	sd	a4,0(s1)
    800037e8:	10000637          	lui	a2,0x10000
    800037ec:	02f71063          	bne	a4,a5,8000380c <uartputc+0xc4>
    800037f0:	0340006f          	j	80003824 <uartputc+0xdc>
    800037f4:	00074703          	lbu	a4,0(a4)
    800037f8:	00f93023          	sd	a5,0(s2)
    800037fc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003800:	00093783          	ld	a5,0(s2)
    80003804:	0004b703          	ld	a4,0(s1)
    80003808:	00f70e63          	beq	a4,a5,80003824 <uartputc+0xdc>
    8000380c:	00564683          	lbu	a3,5(a2)
    80003810:	01f7f713          	andi	a4,a5,31
    80003814:	00e58733          	add	a4,a1,a4
    80003818:	0206f693          	andi	a3,a3,32
    8000381c:	00178793          	addi	a5,a5,1
    80003820:	fc069ae3          	bnez	a3,800037f4 <uartputc+0xac>
    80003824:	02813083          	ld	ra,40(sp)
    80003828:	02013403          	ld	s0,32(sp)
    8000382c:	01813483          	ld	s1,24(sp)
    80003830:	01013903          	ld	s2,16(sp)
    80003834:	00813983          	ld	s3,8(sp)
    80003838:	03010113          	addi	sp,sp,48
    8000383c:	00008067          	ret

0000000080003840 <uartputc_sync>:
    80003840:	ff010113          	addi	sp,sp,-16
    80003844:	00813423          	sd	s0,8(sp)
    80003848:	01010413          	addi	s0,sp,16
    8000384c:	00002717          	auipc	a4,0x2
    80003850:	22c72703          	lw	a4,556(a4) # 80005a78 <panicked>
    80003854:	02071663          	bnez	a4,80003880 <uartputc_sync+0x40>
    80003858:	00050793          	mv	a5,a0
    8000385c:	100006b7          	lui	a3,0x10000
    80003860:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003864:	02077713          	andi	a4,a4,32
    80003868:	fe070ce3          	beqz	a4,80003860 <uartputc_sync+0x20>
    8000386c:	0ff7f793          	andi	a5,a5,255
    80003870:	00f68023          	sb	a5,0(a3)
    80003874:	00813403          	ld	s0,8(sp)
    80003878:	01010113          	addi	sp,sp,16
    8000387c:	00008067          	ret
    80003880:	0000006f          	j	80003880 <uartputc_sync+0x40>

0000000080003884 <uartstart>:
    80003884:	ff010113          	addi	sp,sp,-16
    80003888:	00813423          	sd	s0,8(sp)
    8000388c:	01010413          	addi	s0,sp,16
    80003890:	00002617          	auipc	a2,0x2
    80003894:	1f060613          	addi	a2,a2,496 # 80005a80 <uart_tx_r>
    80003898:	00002517          	auipc	a0,0x2
    8000389c:	1f050513          	addi	a0,a0,496 # 80005a88 <uart_tx_w>
    800038a0:	00063783          	ld	a5,0(a2)
    800038a4:	00053703          	ld	a4,0(a0)
    800038a8:	04f70263          	beq	a4,a5,800038ec <uartstart+0x68>
    800038ac:	100005b7          	lui	a1,0x10000
    800038b0:	00003817          	auipc	a6,0x3
    800038b4:	46080813          	addi	a6,a6,1120 # 80006d10 <uart_tx_buf>
    800038b8:	01c0006f          	j	800038d4 <uartstart+0x50>
    800038bc:	0006c703          	lbu	a4,0(a3)
    800038c0:	00f63023          	sd	a5,0(a2)
    800038c4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800038c8:	00063783          	ld	a5,0(a2)
    800038cc:	00053703          	ld	a4,0(a0)
    800038d0:	00f70e63          	beq	a4,a5,800038ec <uartstart+0x68>
    800038d4:	01f7f713          	andi	a4,a5,31
    800038d8:	00e806b3          	add	a3,a6,a4
    800038dc:	0055c703          	lbu	a4,5(a1)
    800038e0:	00178793          	addi	a5,a5,1
    800038e4:	02077713          	andi	a4,a4,32
    800038e8:	fc071ae3          	bnez	a4,800038bc <uartstart+0x38>
    800038ec:	00813403          	ld	s0,8(sp)
    800038f0:	01010113          	addi	sp,sp,16
    800038f4:	00008067          	ret

00000000800038f8 <uartgetc>:
    800038f8:	ff010113          	addi	sp,sp,-16
    800038fc:	00813423          	sd	s0,8(sp)
    80003900:	01010413          	addi	s0,sp,16
    80003904:	10000737          	lui	a4,0x10000
    80003908:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000390c:	0017f793          	andi	a5,a5,1
    80003910:	00078c63          	beqz	a5,80003928 <uartgetc+0x30>
    80003914:	00074503          	lbu	a0,0(a4)
    80003918:	0ff57513          	andi	a0,a0,255
    8000391c:	00813403          	ld	s0,8(sp)
    80003920:	01010113          	addi	sp,sp,16
    80003924:	00008067          	ret
    80003928:	fff00513          	li	a0,-1
    8000392c:	ff1ff06f          	j	8000391c <uartgetc+0x24>

0000000080003930 <uartintr>:
    80003930:	100007b7          	lui	a5,0x10000
    80003934:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003938:	0017f793          	andi	a5,a5,1
    8000393c:	0a078463          	beqz	a5,800039e4 <uartintr+0xb4>
    80003940:	fe010113          	addi	sp,sp,-32
    80003944:	00813823          	sd	s0,16(sp)
    80003948:	00913423          	sd	s1,8(sp)
    8000394c:	00113c23          	sd	ra,24(sp)
    80003950:	02010413          	addi	s0,sp,32
    80003954:	100004b7          	lui	s1,0x10000
    80003958:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000395c:	0ff57513          	andi	a0,a0,255
    80003960:	fffff097          	auipc	ra,0xfffff
    80003964:	534080e7          	jalr	1332(ra) # 80002e94 <consoleintr>
    80003968:	0054c783          	lbu	a5,5(s1)
    8000396c:	0017f793          	andi	a5,a5,1
    80003970:	fe0794e3          	bnez	a5,80003958 <uartintr+0x28>
    80003974:	00002617          	auipc	a2,0x2
    80003978:	10c60613          	addi	a2,a2,268 # 80005a80 <uart_tx_r>
    8000397c:	00002517          	auipc	a0,0x2
    80003980:	10c50513          	addi	a0,a0,268 # 80005a88 <uart_tx_w>
    80003984:	00063783          	ld	a5,0(a2)
    80003988:	00053703          	ld	a4,0(a0)
    8000398c:	04f70263          	beq	a4,a5,800039d0 <uartintr+0xa0>
    80003990:	100005b7          	lui	a1,0x10000
    80003994:	00003817          	auipc	a6,0x3
    80003998:	37c80813          	addi	a6,a6,892 # 80006d10 <uart_tx_buf>
    8000399c:	01c0006f          	j	800039b8 <uartintr+0x88>
    800039a0:	0006c703          	lbu	a4,0(a3)
    800039a4:	00f63023          	sd	a5,0(a2)
    800039a8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800039ac:	00063783          	ld	a5,0(a2)
    800039b0:	00053703          	ld	a4,0(a0)
    800039b4:	00f70e63          	beq	a4,a5,800039d0 <uartintr+0xa0>
    800039b8:	01f7f713          	andi	a4,a5,31
    800039bc:	00e806b3          	add	a3,a6,a4
    800039c0:	0055c703          	lbu	a4,5(a1)
    800039c4:	00178793          	addi	a5,a5,1
    800039c8:	02077713          	andi	a4,a4,32
    800039cc:	fc071ae3          	bnez	a4,800039a0 <uartintr+0x70>
    800039d0:	01813083          	ld	ra,24(sp)
    800039d4:	01013403          	ld	s0,16(sp)
    800039d8:	00813483          	ld	s1,8(sp)
    800039dc:	02010113          	addi	sp,sp,32
    800039e0:	00008067          	ret
    800039e4:	00002617          	auipc	a2,0x2
    800039e8:	09c60613          	addi	a2,a2,156 # 80005a80 <uart_tx_r>
    800039ec:	00002517          	auipc	a0,0x2
    800039f0:	09c50513          	addi	a0,a0,156 # 80005a88 <uart_tx_w>
    800039f4:	00063783          	ld	a5,0(a2)
    800039f8:	00053703          	ld	a4,0(a0)
    800039fc:	04f70263          	beq	a4,a5,80003a40 <uartintr+0x110>
    80003a00:	100005b7          	lui	a1,0x10000
    80003a04:	00003817          	auipc	a6,0x3
    80003a08:	30c80813          	addi	a6,a6,780 # 80006d10 <uart_tx_buf>
    80003a0c:	01c0006f          	j	80003a28 <uartintr+0xf8>
    80003a10:	0006c703          	lbu	a4,0(a3)
    80003a14:	00f63023          	sd	a5,0(a2)
    80003a18:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003a1c:	00063783          	ld	a5,0(a2)
    80003a20:	00053703          	ld	a4,0(a0)
    80003a24:	02f70063          	beq	a4,a5,80003a44 <uartintr+0x114>
    80003a28:	01f7f713          	andi	a4,a5,31
    80003a2c:	00e806b3          	add	a3,a6,a4
    80003a30:	0055c703          	lbu	a4,5(a1)
    80003a34:	00178793          	addi	a5,a5,1
    80003a38:	02077713          	andi	a4,a4,32
    80003a3c:	fc071ae3          	bnez	a4,80003a10 <uartintr+0xe0>
    80003a40:	00008067          	ret
    80003a44:	00008067          	ret

0000000080003a48 <kinit>:
    80003a48:	fc010113          	addi	sp,sp,-64
    80003a4c:	02913423          	sd	s1,40(sp)
    80003a50:	fffff7b7          	lui	a5,0xfffff
    80003a54:	00004497          	auipc	s1,0x4
    80003a58:	2db48493          	addi	s1,s1,731 # 80007d2f <end+0xfff>
    80003a5c:	02813823          	sd	s0,48(sp)
    80003a60:	01313c23          	sd	s3,24(sp)
    80003a64:	00f4f4b3          	and	s1,s1,a5
    80003a68:	02113c23          	sd	ra,56(sp)
    80003a6c:	03213023          	sd	s2,32(sp)
    80003a70:	01413823          	sd	s4,16(sp)
    80003a74:	01513423          	sd	s5,8(sp)
    80003a78:	04010413          	addi	s0,sp,64
    80003a7c:	000017b7          	lui	a5,0x1
    80003a80:	01100993          	li	s3,17
    80003a84:	00f487b3          	add	a5,s1,a5
    80003a88:	01b99993          	slli	s3,s3,0x1b
    80003a8c:	06f9e063          	bltu	s3,a5,80003aec <kinit+0xa4>
    80003a90:	00003a97          	auipc	s5,0x3
    80003a94:	2a0a8a93          	addi	s5,s5,672 # 80006d30 <end>
    80003a98:	0754ec63          	bltu	s1,s5,80003b10 <kinit+0xc8>
    80003a9c:	0734fa63          	bgeu	s1,s3,80003b10 <kinit+0xc8>
    80003aa0:	00088a37          	lui	s4,0x88
    80003aa4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003aa8:	00002917          	auipc	s2,0x2
    80003aac:	fe890913          	addi	s2,s2,-24 # 80005a90 <kmem>
    80003ab0:	00ca1a13          	slli	s4,s4,0xc
    80003ab4:	0140006f          	j	80003ac8 <kinit+0x80>
    80003ab8:	000017b7          	lui	a5,0x1
    80003abc:	00f484b3          	add	s1,s1,a5
    80003ac0:	0554e863          	bltu	s1,s5,80003b10 <kinit+0xc8>
    80003ac4:	0534f663          	bgeu	s1,s3,80003b10 <kinit+0xc8>
    80003ac8:	00001637          	lui	a2,0x1
    80003acc:	00100593          	li	a1,1
    80003ad0:	00048513          	mv	a0,s1
    80003ad4:	00000097          	auipc	ra,0x0
    80003ad8:	5e4080e7          	jalr	1508(ra) # 800040b8 <__memset>
    80003adc:	00093783          	ld	a5,0(s2)
    80003ae0:	00f4b023          	sd	a5,0(s1)
    80003ae4:	00993023          	sd	s1,0(s2)
    80003ae8:	fd4498e3          	bne	s1,s4,80003ab8 <kinit+0x70>
    80003aec:	03813083          	ld	ra,56(sp)
    80003af0:	03013403          	ld	s0,48(sp)
    80003af4:	02813483          	ld	s1,40(sp)
    80003af8:	02013903          	ld	s2,32(sp)
    80003afc:	01813983          	ld	s3,24(sp)
    80003b00:	01013a03          	ld	s4,16(sp)
    80003b04:	00813a83          	ld	s5,8(sp)
    80003b08:	04010113          	addi	sp,sp,64
    80003b0c:	00008067          	ret
    80003b10:	00001517          	auipc	a0,0x1
    80003b14:	77850513          	addi	a0,a0,1912 # 80005288 <digits+0x18>
    80003b18:	fffff097          	auipc	ra,0xfffff
    80003b1c:	4b4080e7          	jalr	1204(ra) # 80002fcc <panic>

0000000080003b20 <freerange>:
    80003b20:	fc010113          	addi	sp,sp,-64
    80003b24:	000017b7          	lui	a5,0x1
    80003b28:	02913423          	sd	s1,40(sp)
    80003b2c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003b30:	009504b3          	add	s1,a0,s1
    80003b34:	fffff537          	lui	a0,0xfffff
    80003b38:	02813823          	sd	s0,48(sp)
    80003b3c:	02113c23          	sd	ra,56(sp)
    80003b40:	03213023          	sd	s2,32(sp)
    80003b44:	01313c23          	sd	s3,24(sp)
    80003b48:	01413823          	sd	s4,16(sp)
    80003b4c:	01513423          	sd	s5,8(sp)
    80003b50:	01613023          	sd	s6,0(sp)
    80003b54:	04010413          	addi	s0,sp,64
    80003b58:	00a4f4b3          	and	s1,s1,a0
    80003b5c:	00f487b3          	add	a5,s1,a5
    80003b60:	06f5e463          	bltu	a1,a5,80003bc8 <freerange+0xa8>
    80003b64:	00003a97          	auipc	s5,0x3
    80003b68:	1cca8a93          	addi	s5,s5,460 # 80006d30 <end>
    80003b6c:	0954e263          	bltu	s1,s5,80003bf0 <freerange+0xd0>
    80003b70:	01100993          	li	s3,17
    80003b74:	01b99993          	slli	s3,s3,0x1b
    80003b78:	0734fc63          	bgeu	s1,s3,80003bf0 <freerange+0xd0>
    80003b7c:	00058a13          	mv	s4,a1
    80003b80:	00002917          	auipc	s2,0x2
    80003b84:	f1090913          	addi	s2,s2,-240 # 80005a90 <kmem>
    80003b88:	00002b37          	lui	s6,0x2
    80003b8c:	0140006f          	j	80003ba0 <freerange+0x80>
    80003b90:	000017b7          	lui	a5,0x1
    80003b94:	00f484b3          	add	s1,s1,a5
    80003b98:	0554ec63          	bltu	s1,s5,80003bf0 <freerange+0xd0>
    80003b9c:	0534fa63          	bgeu	s1,s3,80003bf0 <freerange+0xd0>
    80003ba0:	00001637          	lui	a2,0x1
    80003ba4:	00100593          	li	a1,1
    80003ba8:	00048513          	mv	a0,s1
    80003bac:	00000097          	auipc	ra,0x0
    80003bb0:	50c080e7          	jalr	1292(ra) # 800040b8 <__memset>
    80003bb4:	00093703          	ld	a4,0(s2)
    80003bb8:	016487b3          	add	a5,s1,s6
    80003bbc:	00e4b023          	sd	a4,0(s1)
    80003bc0:	00993023          	sd	s1,0(s2)
    80003bc4:	fcfa76e3          	bgeu	s4,a5,80003b90 <freerange+0x70>
    80003bc8:	03813083          	ld	ra,56(sp)
    80003bcc:	03013403          	ld	s0,48(sp)
    80003bd0:	02813483          	ld	s1,40(sp)
    80003bd4:	02013903          	ld	s2,32(sp)
    80003bd8:	01813983          	ld	s3,24(sp)
    80003bdc:	01013a03          	ld	s4,16(sp)
    80003be0:	00813a83          	ld	s5,8(sp)
    80003be4:	00013b03          	ld	s6,0(sp)
    80003be8:	04010113          	addi	sp,sp,64
    80003bec:	00008067          	ret
    80003bf0:	00001517          	auipc	a0,0x1
    80003bf4:	69850513          	addi	a0,a0,1688 # 80005288 <digits+0x18>
    80003bf8:	fffff097          	auipc	ra,0xfffff
    80003bfc:	3d4080e7          	jalr	980(ra) # 80002fcc <panic>

0000000080003c00 <kfree>:
    80003c00:	fe010113          	addi	sp,sp,-32
    80003c04:	00813823          	sd	s0,16(sp)
    80003c08:	00113c23          	sd	ra,24(sp)
    80003c0c:	00913423          	sd	s1,8(sp)
    80003c10:	02010413          	addi	s0,sp,32
    80003c14:	03451793          	slli	a5,a0,0x34
    80003c18:	04079c63          	bnez	a5,80003c70 <kfree+0x70>
    80003c1c:	00003797          	auipc	a5,0x3
    80003c20:	11478793          	addi	a5,a5,276 # 80006d30 <end>
    80003c24:	00050493          	mv	s1,a0
    80003c28:	04f56463          	bltu	a0,a5,80003c70 <kfree+0x70>
    80003c2c:	01100793          	li	a5,17
    80003c30:	01b79793          	slli	a5,a5,0x1b
    80003c34:	02f57e63          	bgeu	a0,a5,80003c70 <kfree+0x70>
    80003c38:	00001637          	lui	a2,0x1
    80003c3c:	00100593          	li	a1,1
    80003c40:	00000097          	auipc	ra,0x0
    80003c44:	478080e7          	jalr	1144(ra) # 800040b8 <__memset>
    80003c48:	00002797          	auipc	a5,0x2
    80003c4c:	e4878793          	addi	a5,a5,-440 # 80005a90 <kmem>
    80003c50:	0007b703          	ld	a4,0(a5)
    80003c54:	01813083          	ld	ra,24(sp)
    80003c58:	01013403          	ld	s0,16(sp)
    80003c5c:	00e4b023          	sd	a4,0(s1)
    80003c60:	0097b023          	sd	s1,0(a5)
    80003c64:	00813483          	ld	s1,8(sp)
    80003c68:	02010113          	addi	sp,sp,32
    80003c6c:	00008067          	ret
    80003c70:	00001517          	auipc	a0,0x1
    80003c74:	61850513          	addi	a0,a0,1560 # 80005288 <digits+0x18>
    80003c78:	fffff097          	auipc	ra,0xfffff
    80003c7c:	354080e7          	jalr	852(ra) # 80002fcc <panic>

0000000080003c80 <kalloc>:
    80003c80:	fe010113          	addi	sp,sp,-32
    80003c84:	00813823          	sd	s0,16(sp)
    80003c88:	00913423          	sd	s1,8(sp)
    80003c8c:	00113c23          	sd	ra,24(sp)
    80003c90:	02010413          	addi	s0,sp,32
    80003c94:	00002797          	auipc	a5,0x2
    80003c98:	dfc78793          	addi	a5,a5,-516 # 80005a90 <kmem>
    80003c9c:	0007b483          	ld	s1,0(a5)
    80003ca0:	02048063          	beqz	s1,80003cc0 <kalloc+0x40>
    80003ca4:	0004b703          	ld	a4,0(s1)
    80003ca8:	00001637          	lui	a2,0x1
    80003cac:	00500593          	li	a1,5
    80003cb0:	00048513          	mv	a0,s1
    80003cb4:	00e7b023          	sd	a4,0(a5)
    80003cb8:	00000097          	auipc	ra,0x0
    80003cbc:	400080e7          	jalr	1024(ra) # 800040b8 <__memset>
    80003cc0:	01813083          	ld	ra,24(sp)
    80003cc4:	01013403          	ld	s0,16(sp)
    80003cc8:	00048513          	mv	a0,s1
    80003ccc:	00813483          	ld	s1,8(sp)
    80003cd0:	02010113          	addi	sp,sp,32
    80003cd4:	00008067          	ret

0000000080003cd8 <initlock>:
    80003cd8:	ff010113          	addi	sp,sp,-16
    80003cdc:	00813423          	sd	s0,8(sp)
    80003ce0:	01010413          	addi	s0,sp,16
    80003ce4:	00813403          	ld	s0,8(sp)
    80003ce8:	00b53423          	sd	a1,8(a0)
    80003cec:	00052023          	sw	zero,0(a0)
    80003cf0:	00053823          	sd	zero,16(a0)
    80003cf4:	01010113          	addi	sp,sp,16
    80003cf8:	00008067          	ret

0000000080003cfc <acquire>:
    80003cfc:	fe010113          	addi	sp,sp,-32
    80003d00:	00813823          	sd	s0,16(sp)
    80003d04:	00913423          	sd	s1,8(sp)
    80003d08:	00113c23          	sd	ra,24(sp)
    80003d0c:	01213023          	sd	s2,0(sp)
    80003d10:	02010413          	addi	s0,sp,32
    80003d14:	00050493          	mv	s1,a0
    80003d18:	10002973          	csrr	s2,sstatus
    80003d1c:	100027f3          	csrr	a5,sstatus
    80003d20:	ffd7f793          	andi	a5,a5,-3
    80003d24:	10079073          	csrw	sstatus,a5
    80003d28:	fffff097          	auipc	ra,0xfffff
    80003d2c:	8ec080e7          	jalr	-1812(ra) # 80002614 <mycpu>
    80003d30:	07852783          	lw	a5,120(a0)
    80003d34:	06078e63          	beqz	a5,80003db0 <acquire+0xb4>
    80003d38:	fffff097          	auipc	ra,0xfffff
    80003d3c:	8dc080e7          	jalr	-1828(ra) # 80002614 <mycpu>
    80003d40:	07852783          	lw	a5,120(a0)
    80003d44:	0004a703          	lw	a4,0(s1)
    80003d48:	0017879b          	addiw	a5,a5,1
    80003d4c:	06f52c23          	sw	a5,120(a0)
    80003d50:	04071063          	bnez	a4,80003d90 <acquire+0x94>
    80003d54:	00100713          	li	a4,1
    80003d58:	00070793          	mv	a5,a4
    80003d5c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003d60:	0007879b          	sext.w	a5,a5
    80003d64:	fe079ae3          	bnez	a5,80003d58 <acquire+0x5c>
    80003d68:	0ff0000f          	fence
    80003d6c:	fffff097          	auipc	ra,0xfffff
    80003d70:	8a8080e7          	jalr	-1880(ra) # 80002614 <mycpu>
    80003d74:	01813083          	ld	ra,24(sp)
    80003d78:	01013403          	ld	s0,16(sp)
    80003d7c:	00a4b823          	sd	a0,16(s1)
    80003d80:	00013903          	ld	s2,0(sp)
    80003d84:	00813483          	ld	s1,8(sp)
    80003d88:	02010113          	addi	sp,sp,32
    80003d8c:	00008067          	ret
    80003d90:	0104b903          	ld	s2,16(s1)
    80003d94:	fffff097          	auipc	ra,0xfffff
    80003d98:	880080e7          	jalr	-1920(ra) # 80002614 <mycpu>
    80003d9c:	faa91ce3          	bne	s2,a0,80003d54 <acquire+0x58>
    80003da0:	00001517          	auipc	a0,0x1
    80003da4:	4f050513          	addi	a0,a0,1264 # 80005290 <digits+0x20>
    80003da8:	fffff097          	auipc	ra,0xfffff
    80003dac:	224080e7          	jalr	548(ra) # 80002fcc <panic>
    80003db0:	00195913          	srli	s2,s2,0x1
    80003db4:	fffff097          	auipc	ra,0xfffff
    80003db8:	860080e7          	jalr	-1952(ra) # 80002614 <mycpu>
    80003dbc:	00197913          	andi	s2,s2,1
    80003dc0:	07252e23          	sw	s2,124(a0)
    80003dc4:	f75ff06f          	j	80003d38 <acquire+0x3c>

0000000080003dc8 <release>:
    80003dc8:	fe010113          	addi	sp,sp,-32
    80003dcc:	00813823          	sd	s0,16(sp)
    80003dd0:	00113c23          	sd	ra,24(sp)
    80003dd4:	00913423          	sd	s1,8(sp)
    80003dd8:	01213023          	sd	s2,0(sp)
    80003ddc:	02010413          	addi	s0,sp,32
    80003de0:	00052783          	lw	a5,0(a0)
    80003de4:	00079a63          	bnez	a5,80003df8 <release+0x30>
    80003de8:	00001517          	auipc	a0,0x1
    80003dec:	4b050513          	addi	a0,a0,1200 # 80005298 <digits+0x28>
    80003df0:	fffff097          	auipc	ra,0xfffff
    80003df4:	1dc080e7          	jalr	476(ra) # 80002fcc <panic>
    80003df8:	01053903          	ld	s2,16(a0)
    80003dfc:	00050493          	mv	s1,a0
    80003e00:	fffff097          	auipc	ra,0xfffff
    80003e04:	814080e7          	jalr	-2028(ra) # 80002614 <mycpu>
    80003e08:	fea910e3          	bne	s2,a0,80003de8 <release+0x20>
    80003e0c:	0004b823          	sd	zero,16(s1)
    80003e10:	0ff0000f          	fence
    80003e14:	0f50000f          	fence	iorw,ow
    80003e18:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003e1c:	ffffe097          	auipc	ra,0xffffe
    80003e20:	7f8080e7          	jalr	2040(ra) # 80002614 <mycpu>
    80003e24:	100027f3          	csrr	a5,sstatus
    80003e28:	0027f793          	andi	a5,a5,2
    80003e2c:	04079a63          	bnez	a5,80003e80 <release+0xb8>
    80003e30:	07852783          	lw	a5,120(a0)
    80003e34:	02f05e63          	blez	a5,80003e70 <release+0xa8>
    80003e38:	fff7871b          	addiw	a4,a5,-1
    80003e3c:	06e52c23          	sw	a4,120(a0)
    80003e40:	00071c63          	bnez	a4,80003e58 <release+0x90>
    80003e44:	07c52783          	lw	a5,124(a0)
    80003e48:	00078863          	beqz	a5,80003e58 <release+0x90>
    80003e4c:	100027f3          	csrr	a5,sstatus
    80003e50:	0027e793          	ori	a5,a5,2
    80003e54:	10079073          	csrw	sstatus,a5
    80003e58:	01813083          	ld	ra,24(sp)
    80003e5c:	01013403          	ld	s0,16(sp)
    80003e60:	00813483          	ld	s1,8(sp)
    80003e64:	00013903          	ld	s2,0(sp)
    80003e68:	02010113          	addi	sp,sp,32
    80003e6c:	00008067          	ret
    80003e70:	00001517          	auipc	a0,0x1
    80003e74:	44850513          	addi	a0,a0,1096 # 800052b8 <digits+0x48>
    80003e78:	fffff097          	auipc	ra,0xfffff
    80003e7c:	154080e7          	jalr	340(ra) # 80002fcc <panic>
    80003e80:	00001517          	auipc	a0,0x1
    80003e84:	42050513          	addi	a0,a0,1056 # 800052a0 <digits+0x30>
    80003e88:	fffff097          	auipc	ra,0xfffff
    80003e8c:	144080e7          	jalr	324(ra) # 80002fcc <panic>

0000000080003e90 <holding>:
    80003e90:	00052783          	lw	a5,0(a0)
    80003e94:	00079663          	bnez	a5,80003ea0 <holding+0x10>
    80003e98:	00000513          	li	a0,0
    80003e9c:	00008067          	ret
    80003ea0:	fe010113          	addi	sp,sp,-32
    80003ea4:	00813823          	sd	s0,16(sp)
    80003ea8:	00913423          	sd	s1,8(sp)
    80003eac:	00113c23          	sd	ra,24(sp)
    80003eb0:	02010413          	addi	s0,sp,32
    80003eb4:	01053483          	ld	s1,16(a0)
    80003eb8:	ffffe097          	auipc	ra,0xffffe
    80003ebc:	75c080e7          	jalr	1884(ra) # 80002614 <mycpu>
    80003ec0:	01813083          	ld	ra,24(sp)
    80003ec4:	01013403          	ld	s0,16(sp)
    80003ec8:	40a48533          	sub	a0,s1,a0
    80003ecc:	00153513          	seqz	a0,a0
    80003ed0:	00813483          	ld	s1,8(sp)
    80003ed4:	02010113          	addi	sp,sp,32
    80003ed8:	00008067          	ret

0000000080003edc <push_off>:
    80003edc:	fe010113          	addi	sp,sp,-32
    80003ee0:	00813823          	sd	s0,16(sp)
    80003ee4:	00113c23          	sd	ra,24(sp)
    80003ee8:	00913423          	sd	s1,8(sp)
    80003eec:	02010413          	addi	s0,sp,32
    80003ef0:	100024f3          	csrr	s1,sstatus
    80003ef4:	100027f3          	csrr	a5,sstatus
    80003ef8:	ffd7f793          	andi	a5,a5,-3
    80003efc:	10079073          	csrw	sstatus,a5
    80003f00:	ffffe097          	auipc	ra,0xffffe
    80003f04:	714080e7          	jalr	1812(ra) # 80002614 <mycpu>
    80003f08:	07852783          	lw	a5,120(a0)
    80003f0c:	02078663          	beqz	a5,80003f38 <push_off+0x5c>
    80003f10:	ffffe097          	auipc	ra,0xffffe
    80003f14:	704080e7          	jalr	1796(ra) # 80002614 <mycpu>
    80003f18:	07852783          	lw	a5,120(a0)
    80003f1c:	01813083          	ld	ra,24(sp)
    80003f20:	01013403          	ld	s0,16(sp)
    80003f24:	0017879b          	addiw	a5,a5,1
    80003f28:	06f52c23          	sw	a5,120(a0)
    80003f2c:	00813483          	ld	s1,8(sp)
    80003f30:	02010113          	addi	sp,sp,32
    80003f34:	00008067          	ret
    80003f38:	0014d493          	srli	s1,s1,0x1
    80003f3c:	ffffe097          	auipc	ra,0xffffe
    80003f40:	6d8080e7          	jalr	1752(ra) # 80002614 <mycpu>
    80003f44:	0014f493          	andi	s1,s1,1
    80003f48:	06952e23          	sw	s1,124(a0)
    80003f4c:	fc5ff06f          	j	80003f10 <push_off+0x34>

0000000080003f50 <pop_off>:
    80003f50:	ff010113          	addi	sp,sp,-16
    80003f54:	00813023          	sd	s0,0(sp)
    80003f58:	00113423          	sd	ra,8(sp)
    80003f5c:	01010413          	addi	s0,sp,16
    80003f60:	ffffe097          	auipc	ra,0xffffe
    80003f64:	6b4080e7          	jalr	1716(ra) # 80002614 <mycpu>
    80003f68:	100027f3          	csrr	a5,sstatus
    80003f6c:	0027f793          	andi	a5,a5,2
    80003f70:	04079663          	bnez	a5,80003fbc <pop_off+0x6c>
    80003f74:	07852783          	lw	a5,120(a0)
    80003f78:	02f05a63          	blez	a5,80003fac <pop_off+0x5c>
    80003f7c:	fff7871b          	addiw	a4,a5,-1
    80003f80:	06e52c23          	sw	a4,120(a0)
    80003f84:	00071c63          	bnez	a4,80003f9c <pop_off+0x4c>
    80003f88:	07c52783          	lw	a5,124(a0)
    80003f8c:	00078863          	beqz	a5,80003f9c <pop_off+0x4c>
    80003f90:	100027f3          	csrr	a5,sstatus
    80003f94:	0027e793          	ori	a5,a5,2
    80003f98:	10079073          	csrw	sstatus,a5
    80003f9c:	00813083          	ld	ra,8(sp)
    80003fa0:	00013403          	ld	s0,0(sp)
    80003fa4:	01010113          	addi	sp,sp,16
    80003fa8:	00008067          	ret
    80003fac:	00001517          	auipc	a0,0x1
    80003fb0:	30c50513          	addi	a0,a0,780 # 800052b8 <digits+0x48>
    80003fb4:	fffff097          	auipc	ra,0xfffff
    80003fb8:	018080e7          	jalr	24(ra) # 80002fcc <panic>
    80003fbc:	00001517          	auipc	a0,0x1
    80003fc0:	2e450513          	addi	a0,a0,740 # 800052a0 <digits+0x30>
    80003fc4:	fffff097          	auipc	ra,0xfffff
    80003fc8:	008080e7          	jalr	8(ra) # 80002fcc <panic>

0000000080003fcc <push_on>:
    80003fcc:	fe010113          	addi	sp,sp,-32
    80003fd0:	00813823          	sd	s0,16(sp)
    80003fd4:	00113c23          	sd	ra,24(sp)
    80003fd8:	00913423          	sd	s1,8(sp)
    80003fdc:	02010413          	addi	s0,sp,32
    80003fe0:	100024f3          	csrr	s1,sstatus
    80003fe4:	100027f3          	csrr	a5,sstatus
    80003fe8:	0027e793          	ori	a5,a5,2
    80003fec:	10079073          	csrw	sstatus,a5
    80003ff0:	ffffe097          	auipc	ra,0xffffe
    80003ff4:	624080e7          	jalr	1572(ra) # 80002614 <mycpu>
    80003ff8:	07852783          	lw	a5,120(a0)
    80003ffc:	02078663          	beqz	a5,80004028 <push_on+0x5c>
    80004000:	ffffe097          	auipc	ra,0xffffe
    80004004:	614080e7          	jalr	1556(ra) # 80002614 <mycpu>
    80004008:	07852783          	lw	a5,120(a0)
    8000400c:	01813083          	ld	ra,24(sp)
    80004010:	01013403          	ld	s0,16(sp)
    80004014:	0017879b          	addiw	a5,a5,1
    80004018:	06f52c23          	sw	a5,120(a0)
    8000401c:	00813483          	ld	s1,8(sp)
    80004020:	02010113          	addi	sp,sp,32
    80004024:	00008067          	ret
    80004028:	0014d493          	srli	s1,s1,0x1
    8000402c:	ffffe097          	auipc	ra,0xffffe
    80004030:	5e8080e7          	jalr	1512(ra) # 80002614 <mycpu>
    80004034:	0014f493          	andi	s1,s1,1
    80004038:	06952e23          	sw	s1,124(a0)
    8000403c:	fc5ff06f          	j	80004000 <push_on+0x34>

0000000080004040 <pop_on>:
    80004040:	ff010113          	addi	sp,sp,-16
    80004044:	00813023          	sd	s0,0(sp)
    80004048:	00113423          	sd	ra,8(sp)
    8000404c:	01010413          	addi	s0,sp,16
    80004050:	ffffe097          	auipc	ra,0xffffe
    80004054:	5c4080e7          	jalr	1476(ra) # 80002614 <mycpu>
    80004058:	100027f3          	csrr	a5,sstatus
    8000405c:	0027f793          	andi	a5,a5,2
    80004060:	04078463          	beqz	a5,800040a8 <pop_on+0x68>
    80004064:	07852783          	lw	a5,120(a0)
    80004068:	02f05863          	blez	a5,80004098 <pop_on+0x58>
    8000406c:	fff7879b          	addiw	a5,a5,-1
    80004070:	06f52c23          	sw	a5,120(a0)
    80004074:	07853783          	ld	a5,120(a0)
    80004078:	00079863          	bnez	a5,80004088 <pop_on+0x48>
    8000407c:	100027f3          	csrr	a5,sstatus
    80004080:	ffd7f793          	andi	a5,a5,-3
    80004084:	10079073          	csrw	sstatus,a5
    80004088:	00813083          	ld	ra,8(sp)
    8000408c:	00013403          	ld	s0,0(sp)
    80004090:	01010113          	addi	sp,sp,16
    80004094:	00008067          	ret
    80004098:	00001517          	auipc	a0,0x1
    8000409c:	24850513          	addi	a0,a0,584 # 800052e0 <digits+0x70>
    800040a0:	fffff097          	auipc	ra,0xfffff
    800040a4:	f2c080e7          	jalr	-212(ra) # 80002fcc <panic>
    800040a8:	00001517          	auipc	a0,0x1
    800040ac:	21850513          	addi	a0,a0,536 # 800052c0 <digits+0x50>
    800040b0:	fffff097          	auipc	ra,0xfffff
    800040b4:	f1c080e7          	jalr	-228(ra) # 80002fcc <panic>

00000000800040b8 <__memset>:
    800040b8:	ff010113          	addi	sp,sp,-16
    800040bc:	00813423          	sd	s0,8(sp)
    800040c0:	01010413          	addi	s0,sp,16
    800040c4:	1a060e63          	beqz	a2,80004280 <__memset+0x1c8>
    800040c8:	40a007b3          	neg	a5,a0
    800040cc:	0077f793          	andi	a5,a5,7
    800040d0:	00778693          	addi	a3,a5,7
    800040d4:	00b00813          	li	a6,11
    800040d8:	0ff5f593          	andi	a1,a1,255
    800040dc:	fff6071b          	addiw	a4,a2,-1
    800040e0:	1b06e663          	bltu	a3,a6,8000428c <__memset+0x1d4>
    800040e4:	1cd76463          	bltu	a4,a3,800042ac <__memset+0x1f4>
    800040e8:	1a078e63          	beqz	a5,800042a4 <__memset+0x1ec>
    800040ec:	00b50023          	sb	a1,0(a0)
    800040f0:	00100713          	li	a4,1
    800040f4:	1ae78463          	beq	a5,a4,8000429c <__memset+0x1e4>
    800040f8:	00b500a3          	sb	a1,1(a0)
    800040fc:	00200713          	li	a4,2
    80004100:	1ae78a63          	beq	a5,a4,800042b4 <__memset+0x1fc>
    80004104:	00b50123          	sb	a1,2(a0)
    80004108:	00300713          	li	a4,3
    8000410c:	18e78463          	beq	a5,a4,80004294 <__memset+0x1dc>
    80004110:	00b501a3          	sb	a1,3(a0)
    80004114:	00400713          	li	a4,4
    80004118:	1ae78263          	beq	a5,a4,800042bc <__memset+0x204>
    8000411c:	00b50223          	sb	a1,4(a0)
    80004120:	00500713          	li	a4,5
    80004124:	1ae78063          	beq	a5,a4,800042c4 <__memset+0x20c>
    80004128:	00b502a3          	sb	a1,5(a0)
    8000412c:	00700713          	li	a4,7
    80004130:	18e79e63          	bne	a5,a4,800042cc <__memset+0x214>
    80004134:	00b50323          	sb	a1,6(a0)
    80004138:	00700e93          	li	t4,7
    8000413c:	00859713          	slli	a4,a1,0x8
    80004140:	00e5e733          	or	a4,a1,a4
    80004144:	01059e13          	slli	t3,a1,0x10
    80004148:	01c76e33          	or	t3,a4,t3
    8000414c:	01859313          	slli	t1,a1,0x18
    80004150:	006e6333          	or	t1,t3,t1
    80004154:	02059893          	slli	a7,a1,0x20
    80004158:	40f60e3b          	subw	t3,a2,a5
    8000415c:	011368b3          	or	a7,t1,a7
    80004160:	02859813          	slli	a6,a1,0x28
    80004164:	0108e833          	or	a6,a7,a6
    80004168:	03059693          	slli	a3,a1,0x30
    8000416c:	003e589b          	srliw	a7,t3,0x3
    80004170:	00d866b3          	or	a3,a6,a3
    80004174:	03859713          	slli	a4,a1,0x38
    80004178:	00389813          	slli	a6,a7,0x3
    8000417c:	00f507b3          	add	a5,a0,a5
    80004180:	00e6e733          	or	a4,a3,a4
    80004184:	000e089b          	sext.w	a7,t3
    80004188:	00f806b3          	add	a3,a6,a5
    8000418c:	00e7b023          	sd	a4,0(a5)
    80004190:	00878793          	addi	a5,a5,8
    80004194:	fed79ce3          	bne	a5,a3,8000418c <__memset+0xd4>
    80004198:	ff8e7793          	andi	a5,t3,-8
    8000419c:	0007871b          	sext.w	a4,a5
    800041a0:	01d787bb          	addw	a5,a5,t4
    800041a4:	0ce88e63          	beq	a7,a4,80004280 <__memset+0x1c8>
    800041a8:	00f50733          	add	a4,a0,a5
    800041ac:	00b70023          	sb	a1,0(a4)
    800041b0:	0017871b          	addiw	a4,a5,1
    800041b4:	0cc77663          	bgeu	a4,a2,80004280 <__memset+0x1c8>
    800041b8:	00e50733          	add	a4,a0,a4
    800041bc:	00b70023          	sb	a1,0(a4)
    800041c0:	0027871b          	addiw	a4,a5,2
    800041c4:	0ac77e63          	bgeu	a4,a2,80004280 <__memset+0x1c8>
    800041c8:	00e50733          	add	a4,a0,a4
    800041cc:	00b70023          	sb	a1,0(a4)
    800041d0:	0037871b          	addiw	a4,a5,3
    800041d4:	0ac77663          	bgeu	a4,a2,80004280 <__memset+0x1c8>
    800041d8:	00e50733          	add	a4,a0,a4
    800041dc:	00b70023          	sb	a1,0(a4)
    800041e0:	0047871b          	addiw	a4,a5,4
    800041e4:	08c77e63          	bgeu	a4,a2,80004280 <__memset+0x1c8>
    800041e8:	00e50733          	add	a4,a0,a4
    800041ec:	00b70023          	sb	a1,0(a4)
    800041f0:	0057871b          	addiw	a4,a5,5
    800041f4:	08c77663          	bgeu	a4,a2,80004280 <__memset+0x1c8>
    800041f8:	00e50733          	add	a4,a0,a4
    800041fc:	00b70023          	sb	a1,0(a4)
    80004200:	0067871b          	addiw	a4,a5,6
    80004204:	06c77e63          	bgeu	a4,a2,80004280 <__memset+0x1c8>
    80004208:	00e50733          	add	a4,a0,a4
    8000420c:	00b70023          	sb	a1,0(a4)
    80004210:	0077871b          	addiw	a4,a5,7
    80004214:	06c77663          	bgeu	a4,a2,80004280 <__memset+0x1c8>
    80004218:	00e50733          	add	a4,a0,a4
    8000421c:	00b70023          	sb	a1,0(a4)
    80004220:	0087871b          	addiw	a4,a5,8
    80004224:	04c77e63          	bgeu	a4,a2,80004280 <__memset+0x1c8>
    80004228:	00e50733          	add	a4,a0,a4
    8000422c:	00b70023          	sb	a1,0(a4)
    80004230:	0097871b          	addiw	a4,a5,9
    80004234:	04c77663          	bgeu	a4,a2,80004280 <__memset+0x1c8>
    80004238:	00e50733          	add	a4,a0,a4
    8000423c:	00b70023          	sb	a1,0(a4)
    80004240:	00a7871b          	addiw	a4,a5,10
    80004244:	02c77e63          	bgeu	a4,a2,80004280 <__memset+0x1c8>
    80004248:	00e50733          	add	a4,a0,a4
    8000424c:	00b70023          	sb	a1,0(a4)
    80004250:	00b7871b          	addiw	a4,a5,11
    80004254:	02c77663          	bgeu	a4,a2,80004280 <__memset+0x1c8>
    80004258:	00e50733          	add	a4,a0,a4
    8000425c:	00b70023          	sb	a1,0(a4)
    80004260:	00c7871b          	addiw	a4,a5,12
    80004264:	00c77e63          	bgeu	a4,a2,80004280 <__memset+0x1c8>
    80004268:	00e50733          	add	a4,a0,a4
    8000426c:	00b70023          	sb	a1,0(a4)
    80004270:	00d7879b          	addiw	a5,a5,13
    80004274:	00c7f663          	bgeu	a5,a2,80004280 <__memset+0x1c8>
    80004278:	00f507b3          	add	a5,a0,a5
    8000427c:	00b78023          	sb	a1,0(a5)
    80004280:	00813403          	ld	s0,8(sp)
    80004284:	01010113          	addi	sp,sp,16
    80004288:	00008067          	ret
    8000428c:	00b00693          	li	a3,11
    80004290:	e55ff06f          	j	800040e4 <__memset+0x2c>
    80004294:	00300e93          	li	t4,3
    80004298:	ea5ff06f          	j	8000413c <__memset+0x84>
    8000429c:	00100e93          	li	t4,1
    800042a0:	e9dff06f          	j	8000413c <__memset+0x84>
    800042a4:	00000e93          	li	t4,0
    800042a8:	e95ff06f          	j	8000413c <__memset+0x84>
    800042ac:	00000793          	li	a5,0
    800042b0:	ef9ff06f          	j	800041a8 <__memset+0xf0>
    800042b4:	00200e93          	li	t4,2
    800042b8:	e85ff06f          	j	8000413c <__memset+0x84>
    800042bc:	00400e93          	li	t4,4
    800042c0:	e7dff06f          	j	8000413c <__memset+0x84>
    800042c4:	00500e93          	li	t4,5
    800042c8:	e75ff06f          	j	8000413c <__memset+0x84>
    800042cc:	00600e93          	li	t4,6
    800042d0:	e6dff06f          	j	8000413c <__memset+0x84>

00000000800042d4 <__memmove>:
    800042d4:	ff010113          	addi	sp,sp,-16
    800042d8:	00813423          	sd	s0,8(sp)
    800042dc:	01010413          	addi	s0,sp,16
    800042e0:	0e060863          	beqz	a2,800043d0 <__memmove+0xfc>
    800042e4:	fff6069b          	addiw	a3,a2,-1
    800042e8:	0006881b          	sext.w	a6,a3
    800042ec:	0ea5e863          	bltu	a1,a0,800043dc <__memmove+0x108>
    800042f0:	00758713          	addi	a4,a1,7
    800042f4:	00a5e7b3          	or	a5,a1,a0
    800042f8:	40a70733          	sub	a4,a4,a0
    800042fc:	0077f793          	andi	a5,a5,7
    80004300:	00f73713          	sltiu	a4,a4,15
    80004304:	00174713          	xori	a4,a4,1
    80004308:	0017b793          	seqz	a5,a5
    8000430c:	00e7f7b3          	and	a5,a5,a4
    80004310:	10078863          	beqz	a5,80004420 <__memmove+0x14c>
    80004314:	00900793          	li	a5,9
    80004318:	1107f463          	bgeu	a5,a6,80004420 <__memmove+0x14c>
    8000431c:	0036581b          	srliw	a6,a2,0x3
    80004320:	fff8081b          	addiw	a6,a6,-1
    80004324:	02081813          	slli	a6,a6,0x20
    80004328:	01d85893          	srli	a7,a6,0x1d
    8000432c:	00858813          	addi	a6,a1,8
    80004330:	00058793          	mv	a5,a1
    80004334:	00050713          	mv	a4,a0
    80004338:	01088833          	add	a6,a7,a6
    8000433c:	0007b883          	ld	a7,0(a5)
    80004340:	00878793          	addi	a5,a5,8
    80004344:	00870713          	addi	a4,a4,8
    80004348:	ff173c23          	sd	a7,-8(a4)
    8000434c:	ff0798e3          	bne	a5,a6,8000433c <__memmove+0x68>
    80004350:	ff867713          	andi	a4,a2,-8
    80004354:	02071793          	slli	a5,a4,0x20
    80004358:	0207d793          	srli	a5,a5,0x20
    8000435c:	00f585b3          	add	a1,a1,a5
    80004360:	40e686bb          	subw	a3,a3,a4
    80004364:	00f507b3          	add	a5,a0,a5
    80004368:	06e60463          	beq	a2,a4,800043d0 <__memmove+0xfc>
    8000436c:	0005c703          	lbu	a4,0(a1)
    80004370:	00e78023          	sb	a4,0(a5)
    80004374:	04068e63          	beqz	a3,800043d0 <__memmove+0xfc>
    80004378:	0015c603          	lbu	a2,1(a1)
    8000437c:	00100713          	li	a4,1
    80004380:	00c780a3          	sb	a2,1(a5)
    80004384:	04e68663          	beq	a3,a4,800043d0 <__memmove+0xfc>
    80004388:	0025c603          	lbu	a2,2(a1)
    8000438c:	00200713          	li	a4,2
    80004390:	00c78123          	sb	a2,2(a5)
    80004394:	02e68e63          	beq	a3,a4,800043d0 <__memmove+0xfc>
    80004398:	0035c603          	lbu	a2,3(a1)
    8000439c:	00300713          	li	a4,3
    800043a0:	00c781a3          	sb	a2,3(a5)
    800043a4:	02e68663          	beq	a3,a4,800043d0 <__memmove+0xfc>
    800043a8:	0045c603          	lbu	a2,4(a1)
    800043ac:	00400713          	li	a4,4
    800043b0:	00c78223          	sb	a2,4(a5)
    800043b4:	00e68e63          	beq	a3,a4,800043d0 <__memmove+0xfc>
    800043b8:	0055c603          	lbu	a2,5(a1)
    800043bc:	00500713          	li	a4,5
    800043c0:	00c782a3          	sb	a2,5(a5)
    800043c4:	00e68663          	beq	a3,a4,800043d0 <__memmove+0xfc>
    800043c8:	0065c703          	lbu	a4,6(a1)
    800043cc:	00e78323          	sb	a4,6(a5)
    800043d0:	00813403          	ld	s0,8(sp)
    800043d4:	01010113          	addi	sp,sp,16
    800043d8:	00008067          	ret
    800043dc:	02061713          	slli	a4,a2,0x20
    800043e0:	02075713          	srli	a4,a4,0x20
    800043e4:	00e587b3          	add	a5,a1,a4
    800043e8:	f0f574e3          	bgeu	a0,a5,800042f0 <__memmove+0x1c>
    800043ec:	02069613          	slli	a2,a3,0x20
    800043f0:	02065613          	srli	a2,a2,0x20
    800043f4:	fff64613          	not	a2,a2
    800043f8:	00e50733          	add	a4,a0,a4
    800043fc:	00c78633          	add	a2,a5,a2
    80004400:	fff7c683          	lbu	a3,-1(a5)
    80004404:	fff78793          	addi	a5,a5,-1
    80004408:	fff70713          	addi	a4,a4,-1
    8000440c:	00d70023          	sb	a3,0(a4)
    80004410:	fec798e3          	bne	a5,a2,80004400 <__memmove+0x12c>
    80004414:	00813403          	ld	s0,8(sp)
    80004418:	01010113          	addi	sp,sp,16
    8000441c:	00008067          	ret
    80004420:	02069713          	slli	a4,a3,0x20
    80004424:	02075713          	srli	a4,a4,0x20
    80004428:	00170713          	addi	a4,a4,1
    8000442c:	00e50733          	add	a4,a0,a4
    80004430:	00050793          	mv	a5,a0
    80004434:	0005c683          	lbu	a3,0(a1)
    80004438:	00178793          	addi	a5,a5,1
    8000443c:	00158593          	addi	a1,a1,1
    80004440:	fed78fa3          	sb	a3,-1(a5)
    80004444:	fee798e3          	bne	a5,a4,80004434 <__memmove+0x160>
    80004448:	f89ff06f          	j	800043d0 <__memmove+0xfc>

000000008000444c <__putc>:
    8000444c:	fe010113          	addi	sp,sp,-32
    80004450:	00813823          	sd	s0,16(sp)
    80004454:	00113c23          	sd	ra,24(sp)
    80004458:	02010413          	addi	s0,sp,32
    8000445c:	00050793          	mv	a5,a0
    80004460:	fef40593          	addi	a1,s0,-17
    80004464:	00100613          	li	a2,1
    80004468:	00000513          	li	a0,0
    8000446c:	fef407a3          	sb	a5,-17(s0)
    80004470:	fffff097          	auipc	ra,0xfffff
    80004474:	b3c080e7          	jalr	-1220(ra) # 80002fac <console_write>
    80004478:	01813083          	ld	ra,24(sp)
    8000447c:	01013403          	ld	s0,16(sp)
    80004480:	02010113          	addi	sp,sp,32
    80004484:	00008067          	ret

0000000080004488 <__getc>:
    80004488:	fe010113          	addi	sp,sp,-32
    8000448c:	00813823          	sd	s0,16(sp)
    80004490:	00113c23          	sd	ra,24(sp)
    80004494:	02010413          	addi	s0,sp,32
    80004498:	fe840593          	addi	a1,s0,-24
    8000449c:	00100613          	li	a2,1
    800044a0:	00000513          	li	a0,0
    800044a4:	fffff097          	auipc	ra,0xfffff
    800044a8:	ae8080e7          	jalr	-1304(ra) # 80002f8c <console_read>
    800044ac:	fe844503          	lbu	a0,-24(s0)
    800044b0:	01813083          	ld	ra,24(sp)
    800044b4:	01013403          	ld	s0,16(sp)
    800044b8:	02010113          	addi	sp,sp,32
    800044bc:	00008067          	ret

00000000800044c0 <console_handler>:
    800044c0:	fe010113          	addi	sp,sp,-32
    800044c4:	00813823          	sd	s0,16(sp)
    800044c8:	00113c23          	sd	ra,24(sp)
    800044cc:	00913423          	sd	s1,8(sp)
    800044d0:	02010413          	addi	s0,sp,32
    800044d4:	14202773          	csrr	a4,scause
    800044d8:	100027f3          	csrr	a5,sstatus
    800044dc:	0027f793          	andi	a5,a5,2
    800044e0:	06079e63          	bnez	a5,8000455c <console_handler+0x9c>
    800044e4:	00074c63          	bltz	a4,800044fc <console_handler+0x3c>
    800044e8:	01813083          	ld	ra,24(sp)
    800044ec:	01013403          	ld	s0,16(sp)
    800044f0:	00813483          	ld	s1,8(sp)
    800044f4:	02010113          	addi	sp,sp,32
    800044f8:	00008067          	ret
    800044fc:	0ff77713          	andi	a4,a4,255
    80004500:	00900793          	li	a5,9
    80004504:	fef712e3          	bne	a4,a5,800044e8 <console_handler+0x28>
    80004508:	ffffe097          	auipc	ra,0xffffe
    8000450c:	6dc080e7          	jalr	1756(ra) # 80002be4 <plic_claim>
    80004510:	00a00793          	li	a5,10
    80004514:	00050493          	mv	s1,a0
    80004518:	02f50c63          	beq	a0,a5,80004550 <console_handler+0x90>
    8000451c:	fc0506e3          	beqz	a0,800044e8 <console_handler+0x28>
    80004520:	00050593          	mv	a1,a0
    80004524:	00001517          	auipc	a0,0x1
    80004528:	cc450513          	addi	a0,a0,-828 # 800051e8 <_ZZ12printIntegermE6digits+0xe0>
    8000452c:	fffff097          	auipc	ra,0xfffff
    80004530:	afc080e7          	jalr	-1284(ra) # 80003028 <__printf>
    80004534:	01013403          	ld	s0,16(sp)
    80004538:	01813083          	ld	ra,24(sp)
    8000453c:	00048513          	mv	a0,s1
    80004540:	00813483          	ld	s1,8(sp)
    80004544:	02010113          	addi	sp,sp,32
    80004548:	ffffe317          	auipc	t1,0xffffe
    8000454c:	6d430067          	jr	1748(t1) # 80002c1c <plic_complete>
    80004550:	fffff097          	auipc	ra,0xfffff
    80004554:	3e0080e7          	jalr	992(ra) # 80003930 <uartintr>
    80004558:	fddff06f          	j	80004534 <console_handler+0x74>
    8000455c:	00001517          	auipc	a0,0x1
    80004560:	d8c50513          	addi	a0,a0,-628 # 800052e8 <digits+0x78>
    80004564:	fffff097          	auipc	ra,0xfffff
    80004568:	a68080e7          	jalr	-1432(ra) # 80002fcc <panic>
	...
