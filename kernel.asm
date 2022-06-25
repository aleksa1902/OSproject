
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	9a013103          	ld	sp,-1632(sp) # 800059a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	2cc020ef          	jal	ra,800022e8 <start>

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
    80001184:	2b9000ef          	jal	ra,80001c3c <_ZN5Riscv20handleSupervisorTrapEv>

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
    80001444:	da8080e7          	jalr	-600(ra) # 800021e8 <_Z11printStringPKc>
    80001448:	00048513          	mv	a0,s1
    8000144c:	00001097          	auipc	ra,0x1
    80001450:	e0c080e7          	jalr	-500(ra) # 80002258 <_Z12printIntegerm>
    80001454:	00004517          	auipc	a0,0x4
    80001458:	c9c50513          	addi	a0,a0,-868 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000145c:	00001097          	auipc	ra,0x1
    80001460:	d8c080e7          	jalr	-628(ra) # 800021e8 <_Z11printStringPKc>
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
    800014dc:	d10080e7          	jalr	-752(ra) # 800021e8 <_Z11printStringPKc>
    800014e0:	00048513          	mv	a0,s1
    800014e4:	00001097          	auipc	ra,0x1
    800014e8:	d74080e7          	jalr	-652(ra) # 80002258 <_Z12printIntegerm>
    800014ec:	00004517          	auipc	a0,0x4
    800014f0:	c0450513          	addi	a0,a0,-1020 # 800050f0 <CONSOLE_STATUS+0xe0>
    800014f4:	00001097          	auipc	ra,0x1
    800014f8:	cf4080e7          	jalr	-780(ra) # 800021e8 <_Z11printStringPKc>
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
    800015b8:	c34080e7          	jalr	-972(ra) # 800021e8 <_Z11printStringPKc>
    800015bc:	00048513          	mv	a0,s1
    800015c0:	00001097          	auipc	ra,0x1
    800015c4:	c98080e7          	jalr	-872(ra) # 80002258 <_Z12printIntegerm>
    800015c8:	00004517          	auipc	a0,0x4
    800015cc:	b2850513          	addi	a0,a0,-1240 # 800050f0 <CONSOLE_STATUS+0xe0>
    800015d0:	00001097          	auipc	ra,0x1
    800015d4:	c18080e7          	jalr	-1000(ra) # 800021e8 <_Z11printStringPKc>
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
    800015f4:	bf8080e7          	jalr	-1032(ra) # 800021e8 <_Z11printStringPKc>
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
    80001614:	bd8080e7          	jalr	-1064(ra) # 800021e8 <_Z11printStringPKc>
    80001618:	00090513          	mv	a0,s2
    8000161c:	00001097          	auipc	ra,0x1
    80001620:	c3c080e7          	jalr	-964(ra) # 80002258 <_Z12printIntegerm>
    80001624:	00004517          	auipc	a0,0x4
    80001628:	acc50513          	addi	a0,a0,-1332 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000162c:	00001097          	auipc	ra,0x1
    80001630:	bbc080e7          	jalr	-1092(ra) # 800021e8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001634:	00c00513          	li	a0,12
    80001638:	00000097          	auipc	ra,0x0
    8000163c:	ee0080e7          	jalr	-288(ra) # 80001518 <_Z9fibonaccim>
    80001640:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInteger(result); printString("\n");
    80001644:	00004517          	auipc	a0,0x4
    80001648:	a0c50513          	addi	a0,a0,-1524 # 80005050 <CONSOLE_STATUS+0x40>
    8000164c:	00001097          	auipc	ra,0x1
    80001650:	b9c080e7          	jalr	-1124(ra) # 800021e8 <_Z11printStringPKc>
    80001654:	00090513          	mv	a0,s2
    80001658:	00001097          	auipc	ra,0x1
    8000165c:	c00080e7          	jalr	-1024(ra) # 80002258 <_Z12printIntegerm>
    80001660:	00004517          	auipc	a0,0x4
    80001664:	a9050513          	addi	a0,a0,-1392 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001668:	00001097          	auipc	ra,0x1
    8000166c:	b80080e7          	jalr	-1152(ra) # 800021e8 <_Z11printStringPKc>
    80001670:	0380006f          	j	800016a8 <_Z11workerBodyCPv+0x11c>

    for (; i < 6; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    80001674:	00004517          	auipc	a0,0x4
    80001678:	9bc50513          	addi	a0,a0,-1604 # 80005030 <CONSOLE_STATUS+0x20>
    8000167c:	00001097          	auipc	ra,0x1
    80001680:	b6c080e7          	jalr	-1172(ra) # 800021e8 <_Z11printStringPKc>
    80001684:	00048513          	mv	a0,s1
    80001688:	00001097          	auipc	ra,0x1
    8000168c:	bd0080e7          	jalr	-1072(ra) # 80002258 <_Z12printIntegerm>
    80001690:	00004517          	auipc	a0,0x4
    80001694:	a6050513          	addi	a0,a0,-1440 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001698:	00001097          	auipc	ra,0x1
    8000169c:	b50080e7          	jalr	-1200(ra) # 800021e8 <_Z11printStringPKc>
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
    800016f4:	af8080e7          	jalr	-1288(ra) # 800021e8 <_Z11printStringPKc>
    800016f8:	00048513          	mv	a0,s1
    800016fc:	00001097          	auipc	ra,0x1
    80001700:	b5c080e7          	jalr	-1188(ra) # 80002258 <_Z12printIntegerm>
    80001704:	00004517          	auipc	a0,0x4
    80001708:	9ec50513          	addi	a0,a0,-1556 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000170c:	00001097          	auipc	ra,0x1
    80001710:	adc080e7          	jalr	-1316(ra) # 800021e8 <_Z11printStringPKc>
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
    80001730:	abc080e7          	jalr	-1348(ra) # 800021e8 <_Z11printStringPKc>
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
    8000175c:	a90080e7          	jalr	-1392(ra) # 800021e8 <_Z11printStringPKc>
    80001760:	00090513          	mv	a0,s2
    80001764:	00001097          	auipc	ra,0x1
    80001768:	af4080e7          	jalr	-1292(ra) # 80002258 <_Z12printIntegerm>
    8000176c:	00004517          	auipc	a0,0x4
    80001770:	98450513          	addi	a0,a0,-1660 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001774:	00001097          	auipc	ra,0x1
    80001778:	a74080e7          	jalr	-1420(ra) # 800021e8 <_Z11printStringPKc>
    8000177c:	0380006f          	j	800017b4 <_Z11workerBodyDPv+0xec>

    for (; i < 16; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    80001780:	00004517          	auipc	a0,0x4
    80001784:	8e050513          	addi	a0,a0,-1824 # 80005060 <CONSOLE_STATUS+0x50>
    80001788:	00001097          	auipc	ra,0x1
    8000178c:	a60080e7          	jalr	-1440(ra) # 800021e8 <_Z11printStringPKc>
    80001790:	00048513          	mv	a0,s1
    80001794:	00001097          	auipc	ra,0x1
    80001798:	ac4080e7          	jalr	-1340(ra) # 80002258 <_Z12printIntegerm>
    8000179c:	00004517          	auipc	a0,0x4
    800017a0:	95450513          	addi	a0,a0,-1708 # 800050f0 <CONSOLE_STATUS+0xe0>
    800017a4:	00001097          	auipc	ra,0x1
    800017a8:	a44080e7          	jalr	-1468(ra) # 800021e8 <_Z11printStringPKc>
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
    800017ec:	00000097          	auipc	ra,0x0
    800017f0:	780080e7          	jalr	1920(ra) # 80001f6c <_ZN15MemoryAllocator8memAllocEv>
    TCB *threads[5];

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    800017f4:	00004797          	auipc	a5,0x4
    800017f8:	19c7b783          	ld	a5,412(a5) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x18>
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
    8000181c:	1987b783          	ld	a5,408(a5) # 800059b0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001820:	00e7b023          	sd	a4,0(a5)
    thread_create(&threads[1], workerBodyA, nullptr);
    80001824:	00000613          	li	a2,0
    80001828:	00004597          	auipc	a1,0x4
    8000182c:	1805b583          	ld	a1,384(a1) # 800059a8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001830:	fc040513          	addi	a0,s0,-64
    80001834:	00000097          	auipc	ra,0x0
    80001838:	a60080e7          	jalr	-1440(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    8000183c:	00004517          	auipc	a0,0x4
    80001840:	84c50513          	addi	a0,a0,-1972 # 80005088 <CONSOLE_STATUS+0x78>
    80001844:	00001097          	auipc	ra,0x1
    80001848:	9a4080e7          	jalr	-1628(ra) # 800021e8 <_Z11printStringPKc>
    thread_create(&threads[2], workerBodyB, nullptr);
    8000184c:	00000613          	li	a2,0
    80001850:	00004597          	auipc	a1,0x4
    80001854:	1705b583          	ld	a1,368(a1) # 800059c0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001858:	fc840513          	addi	a0,s0,-56
    8000185c:	00000097          	auipc	ra,0x0
    80001860:	a38080e7          	jalr	-1480(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80001864:	00004517          	auipc	a0,0x4
    80001868:	83c50513          	addi	a0,a0,-1988 # 800050a0 <CONSOLE_STATUS+0x90>
    8000186c:	00001097          	auipc	ra,0x1
    80001870:	97c080e7          	jalr	-1668(ra) # 800021e8 <_Z11printStringPKc>
    thread_create(&threads[3], workerBodyC, nullptr);
    80001874:	00000613          	li	a2,0
    80001878:	00004597          	auipc	a1,0x4
    8000187c:	1105b583          	ld	a1,272(a1) # 80005988 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001880:	fd040513          	addi	a0,s0,-48
    80001884:	00000097          	auipc	ra,0x0
    80001888:	a10080e7          	jalr	-1520(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000188c:	00004517          	auipc	a0,0x4
    80001890:	82c50513          	addi	a0,a0,-2004 # 800050b8 <CONSOLE_STATUS+0xa8>
    80001894:	00001097          	auipc	ra,0x1
    80001898:	954080e7          	jalr	-1708(ra) # 800021e8 <_Z11printStringPKc>
    thread_create(&threads[4], workerBodyD, nullptr);
    8000189c:	00000613          	li	a2,0
    800018a0:	00004597          	auipc	a1,0x4
    800018a4:	1285b583          	ld	a1,296(a1) # 800059c8 <_GLOBAL_OFFSET_TABLE_+0x50>
    800018a8:	fd840513          	addi	a0,s0,-40
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	9e8080e7          	jalr	-1560(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800018b4:	00004517          	auipc	a0,0x4
    800018b8:	81c50513          	addi	a0,a0,-2020 # 800050d0 <CONSOLE_STATUS+0xc0>
    800018bc:	00001097          	auipc	ra,0x1
    800018c0:	92c080e7          	jalr	-1748(ra) # 800021e8 <_Z11printStringPKc>
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
    80001918:	2b8080e7          	jalr	696(ra) # 80001bcc <_ZdlPv>
    8000191c:	00848493          	addi	s1,s1,8
    80001920:	fe040793          	addi	a5,s0,-32
    80001924:	02f48063          	beq	s1,a5,80001944 <main+0x170>
    80001928:	0004b903          	ld	s2,0(s1)
    8000192c:	fe0908e3          	beqz	s2,8000191c <main+0x148>
        ~TCB() { delete[] stack; }
    80001930:	00893503          	ld	a0,8(s2)
    80001934:	fc050ee3          	beqz	a0,80001910 <main+0x13c>
    80001938:	00000097          	auipc	ra,0x0
    8000193c:	2bc080e7          	jalr	700(ra) # 80001bf4 <_ZdaPv>
    80001940:	fd1ff06f          	j	80001910 <main+0x13c>
    printString("Finished\n");
    80001944:	00003517          	auipc	a0,0x3
    80001948:	7a450513          	addi	a0,a0,1956 # 800050e8 <CONSOLE_STATUS+0xd8>
    8000194c:	00001097          	auipc	ra,0x1
    80001950:	89c080e7          	jalr	-1892(ra) # 800021e8 <_Z11printStringPKc>
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
finished(false) { if (body != nullptr) { Scheduler::put(this); } }
    80001998:	00b53023          	sd	a1,0(a0)
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    8000199c:	06058263          	beqz	a1,80001a00 <_ZN3TCBC1EPFvvEm+0x90>
    800019a0:	00002537          	lui	a0,0x2
    800019a4:	00000097          	auipc	ra,0x0
    800019a8:	200080e7          	jalr	512(ra) # 80001ba4 <_Znam>
finished(false) { if (body != nullptr) { Scheduler::put(this); } }
    800019ac:	00a4b423          	sd	a0,8(s1)
    800019b0:	00000797          	auipc	a5,0x0
    800019b4:	0f478793          	addi	a5,a5,244 # 80001aa4 <_ZN3TCB13threadWrapperEv>
    800019b8:	00f4b823          	sd	a5,16(s1)
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
    800019bc:	04050663          	beqz	a0,80001a08 <_ZN3TCBC1EPFvvEm+0x98>
    800019c0:	000027b7          	lui	a5,0x2
    800019c4:	00f50533          	add	a0,a0,a5
finished(false) { if (body != nullptr) { Scheduler::put(this); } }
    800019c8:	00a4bc23          	sd	a0,24(s1)
    800019cc:	0334b023          	sd	s3,32(s1)
    800019d0:	02048423          	sb	zero,40(s1)
    800019d4:	00090863          	beqz	s2,800019e4 <_ZN3TCBC1EPFvvEm+0x74>
    800019d8:	00048513          	mv	a0,s1
    800019dc:	00000097          	auipc	ra,0x0
    800019e0:	4f0080e7          	jalr	1264(ra) # 80001ecc <_ZN9Scheduler3putEP3TCB>
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
    80001a34:	14c080e7          	jalr	332(ra) # 80001b7c <_Znwm>
    80001a38:	00050493          	mv	s1,a0
    80001a3c:	00200613          	li	a2,2
    80001a40:	00090593          	mv	a1,s2
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	f2c080e7          	jalr	-212(ra) # 80001970 <_ZN3TCBC1EPFvvEm>
    80001a4c:	0200006f          	j	80001a6c <_ZN3TCB12createThreadEPFvvE+0x5c>
    80001a50:	00050913          	mv	s2,a0
    80001a54:	00048513          	mv	a0,s1
    80001a58:	00000097          	auipc	ra,0x0
    80001a5c:	174080e7          	jalr	372(ra) # 80001bcc <_ZdlPv>
    80001a60:	00090513          	mv	a0,s2
    80001a64:	00005097          	auipc	ra,0x5
    80001a68:	0b4080e7          	jalr	180(ra) # 80006b18 <_Unwind_Resume>
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
    80001abc:	164080e7          	jalr	356(ra) # 80001c1c <_ZN5Riscv10popSppSpieEv>
    running->body();
    80001ac0:	00004497          	auipc	s1,0x4
    80001ac4:	f6048493          	addi	s1,s1,-160 # 80005a20 <_ZN3TCB7runningE>
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
    80001b18:	f0c4b483          	ld	s1,-244(s1) # 80005a20 <_ZN3TCB7runningE>
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
    80001b34:	334080e7          	jalr	820(ra) # 80001e64 <_ZN9Scheduler3getEv>
    80001b38:	00004797          	auipc	a5,0x4
    80001b3c:	eea7b423          	sd	a0,-280(a5) # 80005a20 <_ZN3TCB7runningE>
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
    80001b74:	35c080e7          	jalr	860(ra) # 80001ecc <_ZN9Scheduler3putEP3TCB>
    80001b78:	fb9ff06f          	j	80001b30 <_ZN3TCB8dispatchEv+0x34>

0000000080001b7c <_Znwm>:
//
#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"

void *operator new(uint64 n) { return mem_alloc(n); }
    80001b7c:	ff010113          	addi	sp,sp,-16
    80001b80:	00113423          	sd	ra,8(sp)
    80001b84:	00813023          	sd	s0,0(sp)
    80001b88:	01010413          	addi	s0,sp,16
    80001b8c:	fffff097          	auipc	ra,0xfffff
    80001b90:	6a8080e7          	jalr	1704(ra) # 80001234 <_Z9mem_allocm>
    80001b94:	00813083          	ld	ra,8(sp)
    80001b98:	00013403          	ld	s0,0(sp)
    80001b9c:	01010113          	addi	sp,sp,16
    80001ba0:	00008067          	ret

0000000080001ba4 <_Znam>:
void *operator new[](uint64 n) { return mem_alloc(n); }
    80001ba4:	ff010113          	addi	sp,sp,-16
    80001ba8:	00113423          	sd	ra,8(sp)
    80001bac:	00813023          	sd	s0,0(sp)
    80001bb0:	01010413          	addi	s0,sp,16
    80001bb4:	fffff097          	auipc	ra,0xfffff
    80001bb8:	680080e7          	jalr	1664(ra) # 80001234 <_Z9mem_allocm>
    80001bbc:	00813083          	ld	ra,8(sp)
    80001bc0:	00013403          	ld	s0,0(sp)
    80001bc4:	01010113          	addi	sp,sp,16
    80001bc8:	00008067          	ret

0000000080001bcc <_ZdlPv>:

void operator delete(void *p) noexcept { mem_free(p); }
    80001bcc:	ff010113          	addi	sp,sp,-16
    80001bd0:	00113423          	sd	ra,8(sp)
    80001bd4:	00813023          	sd	s0,0(sp)
    80001bd8:	01010413          	addi	s0,sp,16
    80001bdc:	fffff097          	auipc	ra,0xfffff
    80001be0:	688080e7          	jalr	1672(ra) # 80001264 <_Z8mem_freePv>
    80001be4:	00813083          	ld	ra,8(sp)
    80001be8:	00013403          	ld	s0,0(sp)
    80001bec:	01010113          	addi	sp,sp,16
    80001bf0:	00008067          	ret

0000000080001bf4 <_ZdaPv>:
void operator delete[](void *p) noexcept { mem_free(p); }
    80001bf4:	ff010113          	addi	sp,sp,-16
    80001bf8:	00113423          	sd	ra,8(sp)
    80001bfc:	00813023          	sd	s0,0(sp)
    80001c00:	01010413          	addi	s0,sp,16
    80001c04:	fffff097          	auipc	ra,0xfffff
    80001c08:	660080e7          	jalr	1632(ra) # 80001264 <_Z8mem_freePv>
    80001c0c:	00813083          	ld	ra,8(sp)
    80001c10:	00013403          	ld	s0,0(sp)
    80001c14:	01010113          	addi	sp,sp,16
    80001c18:	00008067          	ret

0000000080001c1c <_ZN5Riscv10popSppSpieEv>:
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"
#include "../h/print.hpp"

void Riscv::popSppSpie() {
    80001c1c:	ff010113          	addi	sp,sp,-16
    80001c20:	00813423          	sd	s0,8(sp)
    80001c24:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001c28:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001c2c:	10200073          	sret
}
    80001c30:	00813403          	ld	s0,8(sp)
    80001c34:	01010113          	addi	sp,sp,16
    80001c38:	00008067          	ret

0000000080001c3c <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80001c3c:	f9010113          	addi	sp,sp,-112
    80001c40:	06113423          	sd	ra,104(sp)
    80001c44:	06813023          	sd	s0,96(sp)
    80001c48:	04913c23          	sd	s1,88(sp)
    80001c4c:	05213823          	sd	s2,80(sp)
    80001c50:	05313423          	sd	s3,72(sp)
    80001c54:	07010413          	addi	s0,sp,112
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001c58:	142027f3          	csrr	a5,scause
    80001c5c:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80001c60:	f9843703          	ld	a4,-104(s0)
    uint64 scause = r_scause();

    // velicina gde cu da mu obavestim koji je poziv
    size_t argument0;
    __asm__ volatile("mv %0, a0" : "=r" (argument0));
    80001c64:	00050793          	mv	a5,a0

    if(argument0 != 0 && scause == 0x0000000000000009UL){
    80001c68:	00078663          	beqz	a5,80001c74 <_ZN5Riscv20handleSupervisorTrapEv+0x38>
    80001c6c:	00900693          	li	a3,9
    80001c70:	04d70863          	beq	a4,a3,80001cc0 <_ZN5Riscv20handleSupervisorTrapEv+0x84>
        }


        w_sstatus(sstatus); w_sepc(sepc);
    }
    else if (scause == 0x0000000000000009UL) {
    80001c74:	00900793          	li	a5,9
    80001c78:	0ef70263          	beq	a4,a5,80001d5c <_ZN5Riscv20handleSupervisorTrapEv+0x120>
        // interrupt: no; cause code: environment call from S-mode(9)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch();
        w_sstatus(sstatus); w_sepc(sepc);
    } else if (scause == 0x8000000000000001UL) {
    80001c7c:	fff00793          	li	a5,-1
    80001c80:	03f79793          	slli	a5,a5,0x3f
    80001c84:	00178793          	addi	a5,a5,1
    80001c88:	10f70863          	beq	a4,a5,80001d98 <_ZN5Riscv20handleSupervisorTrapEv+0x15c>
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus); w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    } else if (scause == 0x8000000000000009UL) {
    80001c8c:	fff00793          	li	a5,-1
    80001c90:	03f79793          	slli	a5,a5,0x3f
    80001c94:	00978793          	addi	a5,a5,9
    80001c98:	16f70663          	beq	a4,a5,80001e04 <_ZN5Riscv20handleSupervisorTrapEv+0x1c8>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else {
        // unexpected trap cause
        // definisati
        if (scause == 0x0000000000000005UL){
    80001c9c:	00500793          	li	a5,5
    80001ca0:	16f70863          	beq	a4,a5,80001e10 <_ZN5Riscv20handleSupervisorTrapEv+0x1d4>
            printString("Error 5\n");
        }

    }
}
    80001ca4:	06813083          	ld	ra,104(sp)
    80001ca8:	06013403          	ld	s0,96(sp)
    80001cac:	05813483          	ld	s1,88(sp)
    80001cb0:	05013903          	ld	s2,80(sp)
    80001cb4:	04813983          	ld	s3,72(sp)
    80001cb8:	07010113          	addi	sp,sp,112
    80001cbc:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001cc0:	14102773          	csrr	a4,sepc
    80001cc4:	fae43423          	sd	a4,-88(s0)
    return sepc;
    80001cc8:	fa843483          	ld	s1,-88(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80001ccc:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001cd0:	10002773          	csrr	a4,sstatus
    80001cd4:	fae43023          	sd	a4,-96(s0)
    return sstatus;
    80001cd8:	fa043903          	ld	s2,-96(s0)
        if(argument0 == 1){ // syscall za mem_alloc
    80001cdc:	00100713          	li	a4,1
    80001ce0:	02e78863          	beq	a5,a4,80001d10 <_ZN5Riscv20handleSupervisorTrapEv+0xd4>
        }else if(argument0 == 2){ // sistemski poziv za mem_free
    80001ce4:	00200713          	li	a4,2
    80001ce8:	02e78e63          	beq	a5,a4,80001d24 <_ZN5Riscv20handleSupervisorTrapEv+0xe8>
        }else if(argument0 == 11){
    80001cec:	00b00713          	li	a4,11
    80001cf0:	04e78263          	beq	a5,a4,80001d34 <_ZN5Riscv20handleSupervisorTrapEv+0xf8>
        }else if(argument0 == 12){
    80001cf4:	00c00713          	li	a4,12
    80001cf8:	00e78663          	beq	a5,a4,80001d04 <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
        }else if(argument0 == 13){
    80001cfc:	00d00713          	li	a4,13
    80001d00:	04e78863          	beq	a5,a4,80001d50 <_ZN5Riscv20handleSupervisorTrapEv+0x114>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001d04:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001d08:	14149073          	csrw	sepc,s1
}
    80001d0c:	f99ff06f          	j	80001ca4 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
            __asm__ volatile("mv %0, a1" : "=r" (argument_sizet));
    80001d10:	00058513          	mv	a0,a1
            argument_ret_void = MemoryAllocator::mem_alloc(argument_sizet);
    80001d14:	00000097          	auipc	ra,0x0
    80001d18:	2a8080e7          	jalr	680(ra) # 80001fbc <_ZN15MemoryAllocator9mem_allocEm>
            __asm__ volatile("mv a0, %0" : : "r" (argument_ret_void));
    80001d1c:	00050513          	mv	a0,a0
    80001d20:	fe5ff06f          	j	80001d04 <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
            __asm__ volatile("mv %0, a1" : "=r" (argument_void));
    80001d24:	00058513          	mv	a0,a1
            MemoryAllocator::mem_free(argument_void);
    80001d28:	00000097          	auipc	ra,0x0
    80001d2c:	3d4080e7          	jalr	980(ra) # 800020fc <_ZN15MemoryAllocator8mem_freeEPv>
    80001d30:	fd5ff06f          	j	80001d04 <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
            __asm__ volatile("mv %0, a1" : "=r" (handler));
    80001d34:	00058993          	mv	s3,a1
            __asm__ volatile("mv %0, a2" : "=r" (sr));
    80001d38:	00060513          	mv	a0,a2
            __asm__ volatile("mv %0, a3" : "=r" (arg));
    80001d3c:	00068793          	mv	a5,a3
            *handler = TCB::createThread(sr);
    80001d40:	00000097          	auipc	ra,0x0
    80001d44:	cd0080e7          	jalr	-816(ra) # 80001a10 <_ZN3TCB12createThreadEPFvvE>
    80001d48:	00a9b023          	sd	a0,0(s3)
    80001d4c:	fb9ff06f          	j	80001d04 <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
            TCB::dispatch();
    80001d50:	00000097          	auipc	ra,0x0
    80001d54:	dac080e7          	jalr	-596(ra) # 80001afc <_ZN3TCB8dispatchEv>
    80001d58:	fadff06f          	j	80001d04 <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001d5c:	141027f3          	csrr	a5,sepc
    80001d60:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001d64:	fb843483          	ld	s1,-72(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80001d68:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001d6c:	100027f3          	csrr	a5,sstatus
    80001d70:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001d74:	fb043903          	ld	s2,-80(s0)
        TCB::timeSliceCounter = 0;
    80001d78:	00004797          	auipc	a5,0x4
    80001d7c:	c207b783          	ld	a5,-992(a5) # 80005998 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001d80:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    80001d84:	00000097          	auipc	ra,0x0
    80001d88:	d78080e7          	jalr	-648(ra) # 80001afc <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001d8c:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001d90:	14149073          	csrw	sepc,s1
}
    80001d94:	f11ff06f          	j	80001ca4 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
        TCB::timeSliceCounter++;
    80001d98:	00004717          	auipc	a4,0x4
    80001d9c:	c0073703          	ld	a4,-1024(a4) # 80005998 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001da0:	00073783          	ld	a5,0(a4)
    80001da4:	00178793          	addi	a5,a5,1
    80001da8:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    80001dac:	00004717          	auipc	a4,0x4
    80001db0:	c0473703          	ld	a4,-1020(a4) # 800059b0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001db4:	00073703          	ld	a4,0(a4)
        uint64 getTimeSlice() const { return timeSlice; }
    80001db8:	02073703          	ld	a4,32(a4)
    80001dbc:	00e7f863          	bgeu	a5,a4,80001dcc <_ZN5Riscv20handleSupervisorTrapEv+0x190>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80001dc0:	00200793          	li	a5,2
    80001dc4:	1447b073          	csrc	sip,a5
}
    80001dc8:	eddff06f          	j	80001ca4 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001dcc:	141027f3          	csrr	a5,sepc
    80001dd0:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80001dd4:	fc843483          	ld	s1,-56(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001dd8:	100027f3          	csrr	a5,sstatus
    80001ddc:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80001de0:	fc043903          	ld	s2,-64(s0)
            TCB::timeSliceCounter = 0;
    80001de4:	00004797          	auipc	a5,0x4
    80001de8:	bb47b783          	ld	a5,-1100(a5) # 80005998 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001dec:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80001df0:	00000097          	auipc	ra,0x0
    80001df4:	d0c080e7          	jalr	-756(ra) # 80001afc <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001df8:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001dfc:	14149073          	csrw	sepc,s1
}
    80001e00:	fc1ff06f          	j	80001dc0 <_ZN5Riscv20handleSupervisorTrapEv+0x184>
        console_handler();
    80001e04:	00002097          	auipc	ra,0x2
    80001e08:	61c080e7          	jalr	1564(ra) # 80004420 <console_handler>
    80001e0c:	e99ff06f          	j	80001ca4 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
            printString("Error 5\n");
    80001e10:	00003517          	auipc	a0,0x3
    80001e14:	2e850513          	addi	a0,a0,744 # 800050f8 <CONSOLE_STATUS+0xe8>
    80001e18:	00000097          	auipc	ra,0x0
    80001e1c:	3d0080e7          	jalr	976(ra) # 800021e8 <_Z11printStringPKc>
}
    80001e20:	e85ff06f          	j	80001ca4 <_ZN5Riscv20handleSupervisorTrapEv+0x68>

0000000080001e24 <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyCoroutineQueue.addLast(tcb);
    80001e24:	ff010113          	addi	sp,sp,-16
    80001e28:	00813423          	sd	s0,8(sp)
    80001e2c:	01010413          	addi	s0,sp,16
    80001e30:	00100793          	li	a5,1
    80001e34:	00f50863          	beq	a0,a5,80001e44 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001e38:	00813403          	ld	s0,8(sp)
    80001e3c:	01010113          	addi	sp,sp,16
    80001e40:	00008067          	ret
    80001e44:	000107b7          	lui	a5,0x10
    80001e48:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001e4c:	fef596e3          	bne	a1,a5,80001e38 <_Z41__static_initialization_and_destruction_0ii+0x14>
        Elem(T *data, Elem *next) : data(data), next(next){}
    };

    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    80001e50:	00004797          	auipc	a5,0x4
    80001e54:	be078793          	addi	a5,a5,-1056 # 80005a30 <_ZN9Scheduler19readyCoroutineQueueE>
    80001e58:	0007b023          	sd	zero,0(a5)
    80001e5c:	0007b423          	sd	zero,8(a5)
    80001e60:	fd9ff06f          	j	80001e38 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001e64 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80001e64:	fe010113          	addi	sp,sp,-32
    80001e68:	00113c23          	sd	ra,24(sp)
    80001e6c:	00813823          	sd	s0,16(sp)
    80001e70:	00913423          	sd	s1,8(sp)
    80001e74:	02010413          	addi	s0,sp,32
        }else{
            head = tail = elem;
        }
    }
    T *removeFirst(){
        if(!head){ return 0; }
    80001e78:	00004517          	auipc	a0,0x4
    80001e7c:	bb853503          	ld	a0,-1096(a0) # 80005a30 <_ZN9Scheduler19readyCoroutineQueueE>
    80001e80:	04050263          	beqz	a0,80001ec4 <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80001e84:	00853783          	ld	a5,8(a0)
    80001e88:	00004717          	auipc	a4,0x4
    80001e8c:	baf73423          	sd	a5,-1112(a4) # 80005a30 <_ZN9Scheduler19readyCoroutineQueueE>
        if(!head){ tail = 0; }
    80001e90:	02078463          	beqz	a5,80001eb8 <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80001e94:	00053483          	ld	s1,0(a0)
        delete elem;
    80001e98:	00000097          	auipc	ra,0x0
    80001e9c:	d34080e7          	jalr	-716(ra) # 80001bcc <_ZdlPv>
}
    80001ea0:	00048513          	mv	a0,s1
    80001ea4:	01813083          	ld	ra,24(sp)
    80001ea8:	01013403          	ld	s0,16(sp)
    80001eac:	00813483          	ld	s1,8(sp)
    80001eb0:	02010113          	addi	sp,sp,32
    80001eb4:	00008067          	ret
        if(!head){ tail = 0; }
    80001eb8:	00004797          	auipc	a5,0x4
    80001ebc:	b807b023          	sd	zero,-1152(a5) # 80005a38 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001ec0:	fd5ff06f          	j	80001e94 <_ZN9Scheduler3getEv+0x30>
        if(!head){ return 0; }
    80001ec4:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    80001ec8:	fd9ff06f          	j	80001ea0 <_ZN9Scheduler3getEv+0x3c>

0000000080001ecc <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80001ecc:	fe010113          	addi	sp,sp,-32
    80001ed0:	00113c23          	sd	ra,24(sp)
    80001ed4:	00813823          	sd	s0,16(sp)
    80001ed8:	00913423          	sd	s1,8(sp)
    80001edc:	02010413          	addi	s0,sp,32
    80001ee0:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80001ee4:	01000513          	li	a0,16
    80001ee8:	00000097          	auipc	ra,0x0
    80001eec:	c94080e7          	jalr	-876(ra) # 80001b7c <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    80001ef0:	00953023          	sd	s1,0(a0)
    80001ef4:	00053423          	sd	zero,8(a0)
        if(tail){
    80001ef8:	00004797          	auipc	a5,0x4
    80001efc:	b407b783          	ld	a5,-1216(a5) # 80005a38 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001f00:	02078263          	beqz	a5,80001f24 <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    80001f04:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001f08:	00004797          	auipc	a5,0x4
    80001f0c:	b2a7b823          	sd	a0,-1232(a5) # 80005a38 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001f10:	01813083          	ld	ra,24(sp)
    80001f14:	01013403          	ld	s0,16(sp)
    80001f18:	00813483          	ld	s1,8(sp)
    80001f1c:	02010113          	addi	sp,sp,32
    80001f20:	00008067          	ret
            head = tail = elem;
    80001f24:	00004797          	auipc	a5,0x4
    80001f28:	b0c78793          	addi	a5,a5,-1268 # 80005a30 <_ZN9Scheduler19readyCoroutineQueueE>
    80001f2c:	00a7b423          	sd	a0,8(a5)
    80001f30:	00a7b023          	sd	a0,0(a5)
    80001f34:	fddff06f          	j	80001f10 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080001f38 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80001f38:	ff010113          	addi	sp,sp,-16
    80001f3c:	00113423          	sd	ra,8(sp)
    80001f40:	00813023          	sd	s0,0(sp)
    80001f44:	01010413          	addi	s0,sp,16
    80001f48:	000105b7          	lui	a1,0x10
    80001f4c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001f50:	00100513          	li	a0,1
    80001f54:	00000097          	auipc	ra,0x0
    80001f58:	ed0080e7          	jalr	-304(ra) # 80001e24 <_Z41__static_initialization_and_destruction_0ii>
    80001f5c:	00813083          	ld	ra,8(sp)
    80001f60:	00013403          	ld	s0,0(sp)
    80001f64:	01010113          	addi	sp,sp,16
    80001f68:	00008067          	ret

0000000080001f6c <_ZN15MemoryAllocator8memAllocEv>:

MemoryBloc* MemoryAllocator::freeMemBlocHead;
MemoryBloc* MemoryAllocator::takenMemBlocHead;

// Inicijalizacija memorije
void MemoryAllocator::memAlloc(){
    80001f6c:	ff010113          	addi	sp,sp,-16
    80001f70:	00813423          	sd	s0,8(sp)
    80001f74:	01010413          	addi	s0,sp,16
    freeMemBlocHead = (MemoryBloc*)HEAP_START_ADDR;
    80001f78:	00004797          	auipc	a5,0x4
    80001f7c:	a087b783          	ld	a5,-1528(a5) # 80005980 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001f80:	0007b703          	ld	a4,0(a5)
    80001f84:	00004797          	auipc	a5,0x4
    80001f88:	abc78793          	addi	a5,a5,-1348 # 80005a40 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001f8c:	00e7b023          	sd	a4,0(a5)
    freeMemBlocHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    80001f90:	00004697          	auipc	a3,0x4
    80001f94:	a286b683          	ld	a3,-1496(a3) # 800059b8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001f98:	0006b683          	ld	a3,0(a3)
    80001f9c:	40e686b3          	sub	a3,a3,a4
    80001fa0:	00d73023          	sd	a3,0(a4)
    freeMemBlocHead->next = nullptr;
    80001fa4:	0007b703          	ld	a4,0(a5)
    80001fa8:	00073423          	sd	zero,8(a4)

    takenMemBlocHead = nullptr;
    80001fac:	0007b423          	sd	zero,8(a5)
}
    80001fb0:	00813403          	ld	s0,8(sp)
    80001fb4:	01010113          	addi	sp,sp,16
    80001fb8:	00008067          	ret

0000000080001fbc <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc (size_t size){
    80001fbc:	ff010113          	addi	sp,sp,-16
    80001fc0:	00813423          	sd	s0,8(sp)
    80001fc4:	01010413          	addi	s0,sp,16
    size_t newSize;

    // ako je velicina veca od MEM_BLOC_SIZE onda uzmi blokova koliko ti treba + sizeof(MemoryBloc)
    // u suprotnom samo MEM_BLOC_SIZE + sizeof(MemoryBloc)
    if(size > MEM_BLOCK_SIZE){
    80001fc8:	04000793          	li	a5,64
    80001fcc:	02a7fa63          	bgeu	a5,a0,80002000 <_ZN15MemoryAllocator9mem_allocEm+0x44>
        newSize = ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    80001fd0:	00655713          	srli	a4,a0,0x6
    80001fd4:	00170713          	addi	a4,a4,1
    80001fd8:	00671713          	slli	a4,a4,0x6
    80001fdc:	01070713          	addi	a4,a4,16
    }else{
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    }

    // trazim prvi slobodan blok u listi slobodnih blokova gde mogu da alociram
    MemoryBloc* curr = freeMemBlocHead;
    80001fe0:	00004617          	auipc	a2,0x4
    80001fe4:	a6063603          	ld	a2,-1440(a2) # 80005a40 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001fe8:	00060513          	mv	a0,a2

    while(newSize > curr->size && curr != nullptr){
    80001fec:	00053783          	ld	a5,0(a0)
    80001ff0:	00e7fc63          	bgeu	a5,a4,80002008 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
    80001ff4:	00050a63          	beqz	a0,80002008 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
        curr = curr->next;
    80001ff8:	00853503          	ld	a0,8(a0)
    while(newSize > curr->size && curr != nullptr){
    80001ffc:	ff1ff06f          	j	80001fec <_ZN15MemoryAllocator9mem_allocEm+0x30>
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    80002000:	05000713          	li	a4,80
    80002004:	fddff06f          	j	80001fe0 <_ZN15MemoryAllocator9mem_allocEm+0x24>
    }

    if(curr == nullptr){
    80002008:	00051863          	bnez	a0,80002018 <_ZN15MemoryAllocator9mem_allocEm+0x5c>
            prevTaken->next = newBloc;
        }
    }

    return (void*)((char*)newBloc + sizeof(MemoryBloc));
};
    8000200c:	00813403          	ld	s0,8(sp)
    80002010:	01010113          	addi	sp,sp,16
    80002014:	00008067          	ret
    if(curr == freeMemBlocHead){
    80002018:	00c50e63          	beq	a0,a2,80002034 <_ZN15MemoryAllocator9mem_allocEm+0x78>
    bool checkFree = false;
    8000201c:	00000593          	li	a1,0
    MemoryBloc* next = curr->next;
    80002020:	00853803          	ld	a6,8(a0)
    size_t currSize = curr->size - newSize;
    80002024:	40e786b3          	sub	a3,a5,a4
    if(currSize == 0){
    80002028:	06e79663          	bne	a5,a4,80002094 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
        MemoryBloc* currFree = freeMemBlocHead;
    8000202c:	00060793          	mv	a5,a2
    80002030:	0100006f          	j	80002040 <_ZN15MemoryAllocator9mem_allocEm+0x84>
        checkFree = true;
    80002034:	00100593          	li	a1,1
    80002038:	fe9ff06f          	j	80002020 <_ZN15MemoryAllocator9mem_allocEm+0x64>
            currFree = currFree->next;
    8000203c:	00068793          	mv	a5,a3
        while(currFree != nullptr && currFree->next != curr && checkFree != true){
    80002040:	00078863          	beqz	a5,80002050 <_ZN15MemoryAllocator9mem_allocEm+0x94>
    80002044:	0087b683          	ld	a3,8(a5)
    80002048:	00a68463          	beq	a3,a0,80002050 <_ZN15MemoryAllocator9mem_allocEm+0x94>
    8000204c:	fe0588e3          	beqz	a1,8000203c <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(currFree == freeMemBlocHead){
    80002050:	02c78a63          	beq	a5,a2,80002084 <_ZN15MemoryAllocator9mem_allocEm+0xc8>
            currFree->next = curr->next;
    80002054:	0107b423          	sd	a6,8(a5)
    newBloc->size = newSize;
    80002058:	00e53023          	sd	a4,0(a0)
    if(takenMemBlocHead == nullptr){
    8000205c:	00004697          	auipc	a3,0x4
    80002060:	9ec6b683          	ld	a3,-1556(a3) # 80005a48 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80002064:	06068263          	beqz	a3,800020c8 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
        MemoryBloc* nextTaken = takenMemBlocHead;
    80002068:	00068793          	mv	a5,a3
        MemoryBloc* prevTaken = nullptr;
    8000206c:	00000713          	li	a4,0
        while (newBloc > nextTaken && nextTaken != nullptr){
    80002070:	06a7f463          	bgeu	a5,a0,800020d8 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
    80002074:	06078263          	beqz	a5,800020d8 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
            prevTaken = nextTaken;
    80002078:	00078713          	mv	a4,a5
            nextTaken = nextTaken->next;
    8000207c:	0087b783          	ld	a5,8(a5)
        while (newBloc > nextTaken && nextTaken != nullptr){
    80002080:	ff1ff06f          	j	80002070 <_ZN15MemoryAllocator9mem_allocEm+0xb4>
            freeMemBlocHead = freeMemBlocHead->next;
    80002084:	00863783          	ld	a5,8(a2)
    80002088:	00004697          	auipc	a3,0x4
    8000208c:	9af6bc23          	sd	a5,-1608(a3) # 80005a40 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002090:	fc9ff06f          	j	80002058 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
    }else if(checkFree == true){
    80002094:	02058263          	beqz	a1,800020b8 <_ZN15MemoryAllocator9mem_allocEm+0xfc>
        freeMemBlocHead = (MemoryBloc*)((char*)freeMemBlocHead + newSize);
    80002098:	00e60633          	add	a2,a2,a4
    8000209c:	00004797          	auipc	a5,0x4
    800020a0:	9a478793          	addi	a5,a5,-1628 # 80005a40 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800020a4:	00c7b023          	sd	a2,0(a5)
        freeMemBlocHead->size = currSize;
    800020a8:	00d63023          	sd	a3,0(a2)
        freeMemBlocHead->next = next;
    800020ac:	0007b783          	ld	a5,0(a5)
    800020b0:	0107b423          	sd	a6,8(a5)
    800020b4:	fa5ff06f          	j	80002058 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        curr = (MemoryBloc*)((char*)curr + newSize);
    800020b8:	00e507b3          	add	a5,a0,a4
        curr->size = currSize;
    800020bc:	00d7b023          	sd	a3,0(a5)
        curr->next = next;
    800020c0:	0107b423          	sd	a6,8(a5)
    800020c4:	f95ff06f          	j	80002058 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        takenMemBlocHead = newBloc;
    800020c8:	00004797          	auipc	a5,0x4
    800020cc:	98a7b023          	sd	a0,-1664(a5) # 80005a48 <_ZN15MemoryAllocator16takenMemBlocHeadE>
        newBloc->next = nullptr;
    800020d0:	00053423          	sd	zero,8(a0)
    800020d4:	0100006f          	j	800020e4 <_ZN15MemoryAllocator9mem_allocEm+0x128>
        if(nextTaken == takenMemBlocHead){
    800020d8:	00f68a63          	beq	a3,a5,800020ec <_ZN15MemoryAllocator9mem_allocEm+0x130>
            newBloc->next = nextTaken;
    800020dc:	00f53423          	sd	a5,8(a0)
            prevTaken->next = newBloc;
    800020e0:	00a73423          	sd	a0,8(a4)
    return (void*)((char*)newBloc + sizeof(MemoryBloc));
    800020e4:	01050513          	addi	a0,a0,16
    800020e8:	f25ff06f          	j	8000200c <_ZN15MemoryAllocator9mem_allocEm+0x50>
            newBloc->next = takenMemBlocHead;
    800020ec:	00d53423          	sd	a3,8(a0)
            takenMemBlocHead = newBloc;
    800020f0:	00004797          	auipc	a5,0x4
    800020f4:	94a7bc23          	sd	a0,-1704(a5) # 80005a48 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    800020f8:	fedff06f          	j	800020e4 <_ZN15MemoryAllocator9mem_allocEm+0x128>

00000000800020fc <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free (void* mem){
    800020fc:	ff010113          	addi	sp,sp,-16
    80002100:	00813423          	sd	s0,8(sp)
    80002104:	01010413          	addi	s0,sp,16
    void* freeCurr = (void*)((char*)mem - sizeof(MemoryBloc));
    80002108:	ff050513          	addi	a0,a0,-16

    MemoryBloc* curr = takenMemBlocHead;
    8000210c:	00004697          	auipc	a3,0x4
    80002110:	93c6b683          	ld	a3,-1732(a3) # 80005a48 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80002114:	00068793          	mv	a5,a3
    MemoryBloc* prev = nullptr;
    80002118:	00000713          	li	a4,0

    while (curr != freeCurr){
    8000211c:	00a78863          	beq	a5,a0,8000212c <_ZN15MemoryAllocator8mem_freeEPv+0x30>
        prev = curr;
    80002120:	00078713          	mv	a4,a5
        curr = curr->next;
    80002124:	0087b783          	ld	a5,8(a5)
    while (curr != freeCurr){
    80002128:	ff5ff06f          	j	8000211c <_ZN15MemoryAllocator8mem_freeEPv+0x20>
    }
    // uraditi nepredvidjeno ponasanje ako hocu da dealociram nesto sto nisam alocirao
    if(curr == takenMemBlocHead){
    8000212c:	02d78863          	beq	a5,a3,8000215c <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        takenMemBlocHead = takenMemBlocHead->next;
    }else{
        prev->next = curr->next;
    80002130:	0087b683          	ld	a3,8(a5)
    80002134:	00d73423          	sd	a3,8(a4)
    }

    if(freeMemBlocHead == nullptr){
    80002138:	00004617          	auipc	a2,0x4
    8000213c:	90863603          	ld	a2,-1784(a2) # 80005a40 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002140:	02060663          	beqz	a2,8000216c <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        freeMemBlocHead = curr;
    }else{
        MemoryBloc* currFree = freeMemBlocHead;
    80002144:	00060713          	mv	a4,a2
        MemoryBloc* prevFree = nullptr;
    80002148:	00000693          	li	a3,0

        while(curr > currFree){
    8000214c:	02f77663          	bgeu	a4,a5,80002178 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
            prevFree = currFree;
    80002150:	00070693          	mv	a3,a4
            currFree = currFree->next;
    80002154:	00873703          	ld	a4,8(a4)
        while(curr > currFree){
    80002158:	ff5ff06f          	j	8000214c <_ZN15MemoryAllocator8mem_freeEPv+0x50>
        takenMemBlocHead = takenMemBlocHead->next;
    8000215c:	0086b703          	ld	a4,8(a3)
    80002160:	00004697          	auipc	a3,0x4
    80002164:	8ee6b423          	sd	a4,-1816(a3) # 80005a48 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80002168:	fd1ff06f          	j	80002138 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
        freeMemBlocHead = curr;
    8000216c:	00004717          	auipc	a4,0x4
    80002170:	8cf73a23          	sd	a5,-1836(a4) # 80005a40 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002174:	0100006f          	j	80002184 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
        }

        if(currFree == freeMemBlocHead){
    80002178:	00e60c63          	beq	a2,a4,80002190 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
            curr->next = freeMemBlocHead;
            freeMemBlocHead = curr;
        }else{
            curr->next = currFree;
    8000217c:	00e7b423          	sd	a4,8(a5)
            prevFree->next = curr;
    80002180:	00f6b423          	sd	a5,8(a3)
        }
    }

    MemoryBloc* currMemMerge = freeMemBlocHead;
    80002184:	00004797          	auipc	a5,0x4
    80002188:	8bc7b783          	ld	a5,-1860(a5) # 80005a40 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    8000218c:	0300006f          	j	800021bc <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
            curr->next = freeMemBlocHead;
    80002190:	00c7b423          	sd	a2,8(a5)
            freeMemBlocHead = curr;
    80002194:	00004717          	auipc	a4,0x4
    80002198:	8af73623          	sd	a5,-1876(a4) # 80005a40 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    8000219c:	fe9ff06f          	j	80002184 <_ZN15MemoryAllocator8mem_freeEPv+0x88>

    while(currMemMerge){
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
            currMemMerge->size += currMemMerge->next->size;
    800021a0:	00073603          	ld	a2,0(a4)
    800021a4:	00c686b3          	add	a3,a3,a2
    800021a8:	00d7b023          	sd	a3,0(a5)
            currMemMerge->next = currMemMerge->next->next;
    800021ac:	00873703          	ld	a4,8(a4)
    800021b0:	00e7b423          	sd	a4,8(a5)
    800021b4:	00078713          	mv	a4,a5
    800021b8:	00070793          	mv	a5,a4
    while(currMemMerge){
    800021bc:	00078e63          	beqz	a5,800021d8 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
    800021c0:	0087b703          	ld	a4,8(a5)
    800021c4:	fe070ae3          	beqz	a4,800021b8 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    800021c8:	0007b683          	ld	a3,0(a5)
    800021cc:	00d78633          	add	a2,a5,a3
    800021d0:	fec714e3          	bne	a4,a2,800021b8 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    800021d4:	fcdff06f          	j	800021a0 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            currMemMerge = currMemMerge->next;
        }
    }

    return 0;
    800021d8:	00000513          	li	a0,0
    800021dc:	00813403          	ld	s0,8(sp)
    800021e0:	01010113          	addi	sp,sp,16
    800021e4:	00008067          	ret

00000000800021e8 <_Z11printStringPKc>:
#include "../lib/console.h"
#include "../h/riscv.hpp"


void printString(char const *string)
{
    800021e8:	fd010113          	addi	sp,sp,-48
    800021ec:	02113423          	sd	ra,40(sp)
    800021f0:	02813023          	sd	s0,32(sp)
    800021f4:	00913c23          	sd	s1,24(sp)
    800021f8:	01213823          	sd	s2,16(sp)
    800021fc:	03010413          	addi	s0,sp,48
    80002200:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002204:	100027f3          	csrr	a5,sstatus
    80002208:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    8000220c:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002210:	00200793          	li	a5,2
    80002214:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    80002218:	0004c503          	lbu	a0,0(s1)
    8000221c:	00050a63          	beqz	a0,80002230 <_Z11printStringPKc+0x48>
    {
        __putc(*string);
    80002220:	00002097          	auipc	ra,0x2
    80002224:	18c080e7          	jalr	396(ra) # 800043ac <__putc>
        string++;
    80002228:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    8000222c:	fedff06f          	j	80002218 <_Z11printStringPKc+0x30>
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002230:	0009091b          	sext.w	s2,s2
    80002234:	00297913          	andi	s2,s2,2
    80002238:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    8000223c:	10092073          	csrs	sstatus,s2
}
    80002240:	02813083          	ld	ra,40(sp)
    80002244:	02013403          	ld	s0,32(sp)
    80002248:	01813483          	ld	s1,24(sp)
    8000224c:	01013903          	ld	s2,16(sp)
    80002250:	03010113          	addi	sp,sp,48
    80002254:	00008067          	ret

0000000080002258 <_Z12printIntegerm>:


void printInteger(uint64 integer){
    80002258:	fd010113          	addi	sp,sp,-48
    8000225c:	02113423          	sd	ra,40(sp)
    80002260:	02813023          	sd	s0,32(sp)
    80002264:	00913c23          	sd	s1,24(sp)
    80002268:	03010413          	addi	s0,sp,48
    neg = 0;
    if(integer < 0){
        neg = 1;
        x = -integer;
    }else{
        x = integer;
    8000226c:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80002270:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x%10];
    80002274:	00a00613          	li	a2,10
    80002278:	02c5773b          	remuw	a4,a0,a2
    8000227c:	02071693          	slli	a3,a4,0x20
    80002280:	0206d693          	srli	a3,a3,0x20
    80002284:	00003717          	auipc	a4,0x3
    80002288:	e8470713          	addi	a4,a4,-380 # 80005108 <_ZZ12printIntegermE6digits>
    8000228c:	00d70733          	add	a4,a4,a3
    80002290:	00074703          	lbu	a4,0(a4)
    80002294:	fe040693          	addi	a3,s0,-32
    80002298:	009687b3          	add	a5,a3,s1
    8000229c:	0014849b          	addiw	s1,s1,1
    800022a0:	fee78823          	sb	a4,-16(a5)
    }while((x /= 10) != 0);
    800022a4:	0005071b          	sext.w	a4,a0
    800022a8:	02c5553b          	divuw	a0,a0,a2
    800022ac:	00900793          	li	a5,9
    800022b0:	fce7e2e3          	bltu	a5,a4,80002274 <_Z12printIntegerm+0x1c>
    if(neg){
        buf[i++] = '-';
    }
    while(--i >= 0)
    800022b4:	fff4849b          	addiw	s1,s1,-1
    800022b8:	0004ce63          	bltz	s1,800022d4 <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    800022bc:	fe040793          	addi	a5,s0,-32
    800022c0:	009787b3          	add	a5,a5,s1
    800022c4:	ff07c503          	lbu	a0,-16(a5)
    800022c8:	00002097          	auipc	ra,0x2
    800022cc:	0e4080e7          	jalr	228(ra) # 800043ac <__putc>
    800022d0:	fe5ff06f          	j	800022b4 <_Z12printIntegerm+0x5c>
    800022d4:	02813083          	ld	ra,40(sp)
    800022d8:	02013403          	ld	s0,32(sp)
    800022dc:	01813483          	ld	s1,24(sp)
    800022e0:	03010113          	addi	sp,sp,48
    800022e4:	00008067          	ret

00000000800022e8 <start>:
    800022e8:	ff010113          	addi	sp,sp,-16
    800022ec:	00813423          	sd	s0,8(sp)
    800022f0:	01010413          	addi	s0,sp,16
    800022f4:	300027f3          	csrr	a5,mstatus
    800022f8:	ffffe737          	lui	a4,0xffffe
    800022fc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7b4f>
    80002300:	00e7f7b3          	and	a5,a5,a4
    80002304:	00001737          	lui	a4,0x1
    80002308:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000230c:	00e7e7b3          	or	a5,a5,a4
    80002310:	30079073          	csrw	mstatus,a5
    80002314:	00000797          	auipc	a5,0x0
    80002318:	16078793          	addi	a5,a5,352 # 80002474 <system_main>
    8000231c:	34179073          	csrw	mepc,a5
    80002320:	00000793          	li	a5,0
    80002324:	18079073          	csrw	satp,a5
    80002328:	000107b7          	lui	a5,0x10
    8000232c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002330:	30279073          	csrw	medeleg,a5
    80002334:	30379073          	csrw	mideleg,a5
    80002338:	104027f3          	csrr	a5,sie
    8000233c:	2227e793          	ori	a5,a5,546
    80002340:	10479073          	csrw	sie,a5
    80002344:	fff00793          	li	a5,-1
    80002348:	00a7d793          	srli	a5,a5,0xa
    8000234c:	3b079073          	csrw	pmpaddr0,a5
    80002350:	00f00793          	li	a5,15
    80002354:	3a079073          	csrw	pmpcfg0,a5
    80002358:	f14027f3          	csrr	a5,mhartid
    8000235c:	0200c737          	lui	a4,0x200c
    80002360:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002364:	0007869b          	sext.w	a3,a5
    80002368:	00269713          	slli	a4,a3,0x2
    8000236c:	000f4637          	lui	a2,0xf4
    80002370:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002374:	00d70733          	add	a4,a4,a3
    80002378:	0037979b          	slliw	a5,a5,0x3
    8000237c:	020046b7          	lui	a3,0x2004
    80002380:	00d787b3          	add	a5,a5,a3
    80002384:	00c585b3          	add	a1,a1,a2
    80002388:	00371693          	slli	a3,a4,0x3
    8000238c:	00003717          	auipc	a4,0x3
    80002390:	6c470713          	addi	a4,a4,1732 # 80005a50 <timer_scratch>
    80002394:	00b7b023          	sd	a1,0(a5)
    80002398:	00d70733          	add	a4,a4,a3
    8000239c:	00f73c23          	sd	a5,24(a4)
    800023a0:	02c73023          	sd	a2,32(a4)
    800023a4:	34071073          	csrw	mscratch,a4
    800023a8:	00000797          	auipc	a5,0x0
    800023ac:	6e878793          	addi	a5,a5,1768 # 80002a90 <timervec>
    800023b0:	30579073          	csrw	mtvec,a5
    800023b4:	300027f3          	csrr	a5,mstatus
    800023b8:	0087e793          	ori	a5,a5,8
    800023bc:	30079073          	csrw	mstatus,a5
    800023c0:	304027f3          	csrr	a5,mie
    800023c4:	0807e793          	ori	a5,a5,128
    800023c8:	30479073          	csrw	mie,a5
    800023cc:	f14027f3          	csrr	a5,mhartid
    800023d0:	0007879b          	sext.w	a5,a5
    800023d4:	00078213          	mv	tp,a5
    800023d8:	30200073          	mret
    800023dc:	00813403          	ld	s0,8(sp)
    800023e0:	01010113          	addi	sp,sp,16
    800023e4:	00008067          	ret

00000000800023e8 <timerinit>:
    800023e8:	ff010113          	addi	sp,sp,-16
    800023ec:	00813423          	sd	s0,8(sp)
    800023f0:	01010413          	addi	s0,sp,16
    800023f4:	f14027f3          	csrr	a5,mhartid
    800023f8:	0200c737          	lui	a4,0x200c
    800023fc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002400:	0007869b          	sext.w	a3,a5
    80002404:	00269713          	slli	a4,a3,0x2
    80002408:	000f4637          	lui	a2,0xf4
    8000240c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002410:	00d70733          	add	a4,a4,a3
    80002414:	0037979b          	slliw	a5,a5,0x3
    80002418:	020046b7          	lui	a3,0x2004
    8000241c:	00d787b3          	add	a5,a5,a3
    80002420:	00c585b3          	add	a1,a1,a2
    80002424:	00371693          	slli	a3,a4,0x3
    80002428:	00003717          	auipc	a4,0x3
    8000242c:	62870713          	addi	a4,a4,1576 # 80005a50 <timer_scratch>
    80002430:	00b7b023          	sd	a1,0(a5)
    80002434:	00d70733          	add	a4,a4,a3
    80002438:	00f73c23          	sd	a5,24(a4)
    8000243c:	02c73023          	sd	a2,32(a4)
    80002440:	34071073          	csrw	mscratch,a4
    80002444:	00000797          	auipc	a5,0x0
    80002448:	64c78793          	addi	a5,a5,1612 # 80002a90 <timervec>
    8000244c:	30579073          	csrw	mtvec,a5
    80002450:	300027f3          	csrr	a5,mstatus
    80002454:	0087e793          	ori	a5,a5,8
    80002458:	30079073          	csrw	mstatus,a5
    8000245c:	304027f3          	csrr	a5,mie
    80002460:	0807e793          	ori	a5,a5,128
    80002464:	30479073          	csrw	mie,a5
    80002468:	00813403          	ld	s0,8(sp)
    8000246c:	01010113          	addi	sp,sp,16
    80002470:	00008067          	ret

0000000080002474 <system_main>:
    80002474:	fe010113          	addi	sp,sp,-32
    80002478:	00813823          	sd	s0,16(sp)
    8000247c:	00913423          	sd	s1,8(sp)
    80002480:	00113c23          	sd	ra,24(sp)
    80002484:	02010413          	addi	s0,sp,32
    80002488:	00000097          	auipc	ra,0x0
    8000248c:	0c4080e7          	jalr	196(ra) # 8000254c <cpuid>
    80002490:	00003497          	auipc	s1,0x3
    80002494:	56048493          	addi	s1,s1,1376 # 800059f0 <started>
    80002498:	02050263          	beqz	a0,800024bc <system_main+0x48>
    8000249c:	0004a783          	lw	a5,0(s1)
    800024a0:	0007879b          	sext.w	a5,a5
    800024a4:	fe078ce3          	beqz	a5,8000249c <system_main+0x28>
    800024a8:	0ff0000f          	fence
    800024ac:	00003517          	auipc	a0,0x3
    800024b0:	c9c50513          	addi	a0,a0,-868 # 80005148 <_ZZ12printIntegermE6digits+0x40>
    800024b4:	00001097          	auipc	ra,0x1
    800024b8:	a78080e7          	jalr	-1416(ra) # 80002f2c <panic>
    800024bc:	00001097          	auipc	ra,0x1
    800024c0:	9cc080e7          	jalr	-1588(ra) # 80002e88 <consoleinit>
    800024c4:	00001097          	auipc	ra,0x1
    800024c8:	158080e7          	jalr	344(ra) # 8000361c <printfinit>
    800024cc:	00003517          	auipc	a0,0x3
    800024d0:	c2450513          	addi	a0,a0,-988 # 800050f0 <CONSOLE_STATUS+0xe0>
    800024d4:	00001097          	auipc	ra,0x1
    800024d8:	ab4080e7          	jalr	-1356(ra) # 80002f88 <__printf>
    800024dc:	00003517          	auipc	a0,0x3
    800024e0:	c3c50513          	addi	a0,a0,-964 # 80005118 <_ZZ12printIntegermE6digits+0x10>
    800024e4:	00001097          	auipc	ra,0x1
    800024e8:	aa4080e7          	jalr	-1372(ra) # 80002f88 <__printf>
    800024ec:	00003517          	auipc	a0,0x3
    800024f0:	c0450513          	addi	a0,a0,-1020 # 800050f0 <CONSOLE_STATUS+0xe0>
    800024f4:	00001097          	auipc	ra,0x1
    800024f8:	a94080e7          	jalr	-1388(ra) # 80002f88 <__printf>
    800024fc:	00001097          	auipc	ra,0x1
    80002500:	4ac080e7          	jalr	1196(ra) # 800039a8 <kinit>
    80002504:	00000097          	auipc	ra,0x0
    80002508:	148080e7          	jalr	328(ra) # 8000264c <trapinit>
    8000250c:	00000097          	auipc	ra,0x0
    80002510:	16c080e7          	jalr	364(ra) # 80002678 <trapinithart>
    80002514:	00000097          	auipc	ra,0x0
    80002518:	5bc080e7          	jalr	1468(ra) # 80002ad0 <plicinit>
    8000251c:	00000097          	auipc	ra,0x0
    80002520:	5dc080e7          	jalr	1500(ra) # 80002af8 <plicinithart>
    80002524:	00000097          	auipc	ra,0x0
    80002528:	078080e7          	jalr	120(ra) # 8000259c <userinit>
    8000252c:	0ff0000f          	fence
    80002530:	00100793          	li	a5,1
    80002534:	00003517          	auipc	a0,0x3
    80002538:	bfc50513          	addi	a0,a0,-1028 # 80005130 <_ZZ12printIntegermE6digits+0x28>
    8000253c:	00f4a023          	sw	a5,0(s1)
    80002540:	00001097          	auipc	ra,0x1
    80002544:	a48080e7          	jalr	-1464(ra) # 80002f88 <__printf>
    80002548:	0000006f          	j	80002548 <system_main+0xd4>

000000008000254c <cpuid>:
    8000254c:	ff010113          	addi	sp,sp,-16
    80002550:	00813423          	sd	s0,8(sp)
    80002554:	01010413          	addi	s0,sp,16
    80002558:	00020513          	mv	a0,tp
    8000255c:	00813403          	ld	s0,8(sp)
    80002560:	0005051b          	sext.w	a0,a0
    80002564:	01010113          	addi	sp,sp,16
    80002568:	00008067          	ret

000000008000256c <mycpu>:
    8000256c:	ff010113          	addi	sp,sp,-16
    80002570:	00813423          	sd	s0,8(sp)
    80002574:	01010413          	addi	s0,sp,16
    80002578:	00020793          	mv	a5,tp
    8000257c:	00813403          	ld	s0,8(sp)
    80002580:	0007879b          	sext.w	a5,a5
    80002584:	00779793          	slli	a5,a5,0x7
    80002588:	00004517          	auipc	a0,0x4
    8000258c:	4f850513          	addi	a0,a0,1272 # 80006a80 <cpus>
    80002590:	00f50533          	add	a0,a0,a5
    80002594:	01010113          	addi	sp,sp,16
    80002598:	00008067          	ret

000000008000259c <userinit>:
    8000259c:	ff010113          	addi	sp,sp,-16
    800025a0:	00813423          	sd	s0,8(sp)
    800025a4:	01010413          	addi	s0,sp,16
    800025a8:	00813403          	ld	s0,8(sp)
    800025ac:	01010113          	addi	sp,sp,16
    800025b0:	fffff317          	auipc	t1,0xfffff
    800025b4:	22430067          	jr	548(t1) # 800017d4 <main>

00000000800025b8 <either_copyout>:
    800025b8:	ff010113          	addi	sp,sp,-16
    800025bc:	00813023          	sd	s0,0(sp)
    800025c0:	00113423          	sd	ra,8(sp)
    800025c4:	01010413          	addi	s0,sp,16
    800025c8:	02051663          	bnez	a0,800025f4 <either_copyout+0x3c>
    800025cc:	00058513          	mv	a0,a1
    800025d0:	00060593          	mv	a1,a2
    800025d4:	0006861b          	sext.w	a2,a3
    800025d8:	00002097          	auipc	ra,0x2
    800025dc:	c5c080e7          	jalr	-932(ra) # 80004234 <__memmove>
    800025e0:	00813083          	ld	ra,8(sp)
    800025e4:	00013403          	ld	s0,0(sp)
    800025e8:	00000513          	li	a0,0
    800025ec:	01010113          	addi	sp,sp,16
    800025f0:	00008067          	ret
    800025f4:	00003517          	auipc	a0,0x3
    800025f8:	b7c50513          	addi	a0,a0,-1156 # 80005170 <_ZZ12printIntegermE6digits+0x68>
    800025fc:	00001097          	auipc	ra,0x1
    80002600:	930080e7          	jalr	-1744(ra) # 80002f2c <panic>

0000000080002604 <either_copyin>:
    80002604:	ff010113          	addi	sp,sp,-16
    80002608:	00813023          	sd	s0,0(sp)
    8000260c:	00113423          	sd	ra,8(sp)
    80002610:	01010413          	addi	s0,sp,16
    80002614:	02059463          	bnez	a1,8000263c <either_copyin+0x38>
    80002618:	00060593          	mv	a1,a2
    8000261c:	0006861b          	sext.w	a2,a3
    80002620:	00002097          	auipc	ra,0x2
    80002624:	c14080e7          	jalr	-1004(ra) # 80004234 <__memmove>
    80002628:	00813083          	ld	ra,8(sp)
    8000262c:	00013403          	ld	s0,0(sp)
    80002630:	00000513          	li	a0,0
    80002634:	01010113          	addi	sp,sp,16
    80002638:	00008067          	ret
    8000263c:	00003517          	auipc	a0,0x3
    80002640:	b5c50513          	addi	a0,a0,-1188 # 80005198 <_ZZ12printIntegermE6digits+0x90>
    80002644:	00001097          	auipc	ra,0x1
    80002648:	8e8080e7          	jalr	-1816(ra) # 80002f2c <panic>

000000008000264c <trapinit>:
    8000264c:	ff010113          	addi	sp,sp,-16
    80002650:	00813423          	sd	s0,8(sp)
    80002654:	01010413          	addi	s0,sp,16
    80002658:	00813403          	ld	s0,8(sp)
    8000265c:	00003597          	auipc	a1,0x3
    80002660:	b6458593          	addi	a1,a1,-1180 # 800051c0 <_ZZ12printIntegermE6digits+0xb8>
    80002664:	00004517          	auipc	a0,0x4
    80002668:	49c50513          	addi	a0,a0,1180 # 80006b00 <tickslock>
    8000266c:	01010113          	addi	sp,sp,16
    80002670:	00001317          	auipc	t1,0x1
    80002674:	5c830067          	jr	1480(t1) # 80003c38 <initlock>

0000000080002678 <trapinithart>:
    80002678:	ff010113          	addi	sp,sp,-16
    8000267c:	00813423          	sd	s0,8(sp)
    80002680:	01010413          	addi	s0,sp,16
    80002684:	00000797          	auipc	a5,0x0
    80002688:	2fc78793          	addi	a5,a5,764 # 80002980 <kernelvec>
    8000268c:	10579073          	csrw	stvec,a5
    80002690:	00813403          	ld	s0,8(sp)
    80002694:	01010113          	addi	sp,sp,16
    80002698:	00008067          	ret

000000008000269c <usertrap>:
    8000269c:	ff010113          	addi	sp,sp,-16
    800026a0:	00813423          	sd	s0,8(sp)
    800026a4:	01010413          	addi	s0,sp,16
    800026a8:	00813403          	ld	s0,8(sp)
    800026ac:	01010113          	addi	sp,sp,16
    800026b0:	00008067          	ret

00000000800026b4 <usertrapret>:
    800026b4:	ff010113          	addi	sp,sp,-16
    800026b8:	00813423          	sd	s0,8(sp)
    800026bc:	01010413          	addi	s0,sp,16
    800026c0:	00813403          	ld	s0,8(sp)
    800026c4:	01010113          	addi	sp,sp,16
    800026c8:	00008067          	ret

00000000800026cc <kerneltrap>:
    800026cc:	fe010113          	addi	sp,sp,-32
    800026d0:	00813823          	sd	s0,16(sp)
    800026d4:	00113c23          	sd	ra,24(sp)
    800026d8:	00913423          	sd	s1,8(sp)
    800026dc:	02010413          	addi	s0,sp,32
    800026e0:	142025f3          	csrr	a1,scause
    800026e4:	100027f3          	csrr	a5,sstatus
    800026e8:	0027f793          	andi	a5,a5,2
    800026ec:	10079c63          	bnez	a5,80002804 <kerneltrap+0x138>
    800026f0:	142027f3          	csrr	a5,scause
    800026f4:	0207ce63          	bltz	a5,80002730 <kerneltrap+0x64>
    800026f8:	00003517          	auipc	a0,0x3
    800026fc:	b1050513          	addi	a0,a0,-1264 # 80005208 <_ZZ12printIntegermE6digits+0x100>
    80002700:	00001097          	auipc	ra,0x1
    80002704:	888080e7          	jalr	-1912(ra) # 80002f88 <__printf>
    80002708:	141025f3          	csrr	a1,sepc
    8000270c:	14302673          	csrr	a2,stval
    80002710:	00003517          	auipc	a0,0x3
    80002714:	b0850513          	addi	a0,a0,-1272 # 80005218 <_ZZ12printIntegermE6digits+0x110>
    80002718:	00001097          	auipc	ra,0x1
    8000271c:	870080e7          	jalr	-1936(ra) # 80002f88 <__printf>
    80002720:	00003517          	auipc	a0,0x3
    80002724:	b1050513          	addi	a0,a0,-1264 # 80005230 <_ZZ12printIntegermE6digits+0x128>
    80002728:	00001097          	auipc	ra,0x1
    8000272c:	804080e7          	jalr	-2044(ra) # 80002f2c <panic>
    80002730:	0ff7f713          	andi	a4,a5,255
    80002734:	00900693          	li	a3,9
    80002738:	04d70063          	beq	a4,a3,80002778 <kerneltrap+0xac>
    8000273c:	fff00713          	li	a4,-1
    80002740:	03f71713          	slli	a4,a4,0x3f
    80002744:	00170713          	addi	a4,a4,1
    80002748:	fae798e3          	bne	a5,a4,800026f8 <kerneltrap+0x2c>
    8000274c:	00000097          	auipc	ra,0x0
    80002750:	e00080e7          	jalr	-512(ra) # 8000254c <cpuid>
    80002754:	06050663          	beqz	a0,800027c0 <kerneltrap+0xf4>
    80002758:	144027f3          	csrr	a5,sip
    8000275c:	ffd7f793          	andi	a5,a5,-3
    80002760:	14479073          	csrw	sip,a5
    80002764:	01813083          	ld	ra,24(sp)
    80002768:	01013403          	ld	s0,16(sp)
    8000276c:	00813483          	ld	s1,8(sp)
    80002770:	02010113          	addi	sp,sp,32
    80002774:	00008067          	ret
    80002778:	00000097          	auipc	ra,0x0
    8000277c:	3cc080e7          	jalr	972(ra) # 80002b44 <plic_claim>
    80002780:	00a00793          	li	a5,10
    80002784:	00050493          	mv	s1,a0
    80002788:	06f50863          	beq	a0,a5,800027f8 <kerneltrap+0x12c>
    8000278c:	fc050ce3          	beqz	a0,80002764 <kerneltrap+0x98>
    80002790:	00050593          	mv	a1,a0
    80002794:	00003517          	auipc	a0,0x3
    80002798:	a5450513          	addi	a0,a0,-1452 # 800051e8 <_ZZ12printIntegermE6digits+0xe0>
    8000279c:	00000097          	auipc	ra,0x0
    800027a0:	7ec080e7          	jalr	2028(ra) # 80002f88 <__printf>
    800027a4:	01013403          	ld	s0,16(sp)
    800027a8:	01813083          	ld	ra,24(sp)
    800027ac:	00048513          	mv	a0,s1
    800027b0:	00813483          	ld	s1,8(sp)
    800027b4:	02010113          	addi	sp,sp,32
    800027b8:	00000317          	auipc	t1,0x0
    800027bc:	3c430067          	jr	964(t1) # 80002b7c <plic_complete>
    800027c0:	00004517          	auipc	a0,0x4
    800027c4:	34050513          	addi	a0,a0,832 # 80006b00 <tickslock>
    800027c8:	00001097          	auipc	ra,0x1
    800027cc:	494080e7          	jalr	1172(ra) # 80003c5c <acquire>
    800027d0:	00003717          	auipc	a4,0x3
    800027d4:	22470713          	addi	a4,a4,548 # 800059f4 <ticks>
    800027d8:	00072783          	lw	a5,0(a4)
    800027dc:	00004517          	auipc	a0,0x4
    800027e0:	32450513          	addi	a0,a0,804 # 80006b00 <tickslock>
    800027e4:	0017879b          	addiw	a5,a5,1
    800027e8:	00f72023          	sw	a5,0(a4)
    800027ec:	00001097          	auipc	ra,0x1
    800027f0:	53c080e7          	jalr	1340(ra) # 80003d28 <release>
    800027f4:	f65ff06f          	j	80002758 <kerneltrap+0x8c>
    800027f8:	00001097          	auipc	ra,0x1
    800027fc:	098080e7          	jalr	152(ra) # 80003890 <uartintr>
    80002800:	fa5ff06f          	j	800027a4 <kerneltrap+0xd8>
    80002804:	00003517          	auipc	a0,0x3
    80002808:	9c450513          	addi	a0,a0,-1596 # 800051c8 <_ZZ12printIntegermE6digits+0xc0>
    8000280c:	00000097          	auipc	ra,0x0
    80002810:	720080e7          	jalr	1824(ra) # 80002f2c <panic>

0000000080002814 <clockintr>:
    80002814:	fe010113          	addi	sp,sp,-32
    80002818:	00813823          	sd	s0,16(sp)
    8000281c:	00913423          	sd	s1,8(sp)
    80002820:	00113c23          	sd	ra,24(sp)
    80002824:	02010413          	addi	s0,sp,32
    80002828:	00004497          	auipc	s1,0x4
    8000282c:	2d848493          	addi	s1,s1,728 # 80006b00 <tickslock>
    80002830:	00048513          	mv	a0,s1
    80002834:	00001097          	auipc	ra,0x1
    80002838:	428080e7          	jalr	1064(ra) # 80003c5c <acquire>
    8000283c:	00003717          	auipc	a4,0x3
    80002840:	1b870713          	addi	a4,a4,440 # 800059f4 <ticks>
    80002844:	00072783          	lw	a5,0(a4)
    80002848:	01013403          	ld	s0,16(sp)
    8000284c:	01813083          	ld	ra,24(sp)
    80002850:	00048513          	mv	a0,s1
    80002854:	0017879b          	addiw	a5,a5,1
    80002858:	00813483          	ld	s1,8(sp)
    8000285c:	00f72023          	sw	a5,0(a4)
    80002860:	02010113          	addi	sp,sp,32
    80002864:	00001317          	auipc	t1,0x1
    80002868:	4c430067          	jr	1220(t1) # 80003d28 <release>

000000008000286c <devintr>:
    8000286c:	142027f3          	csrr	a5,scause
    80002870:	00000513          	li	a0,0
    80002874:	0007c463          	bltz	a5,8000287c <devintr+0x10>
    80002878:	00008067          	ret
    8000287c:	fe010113          	addi	sp,sp,-32
    80002880:	00813823          	sd	s0,16(sp)
    80002884:	00113c23          	sd	ra,24(sp)
    80002888:	00913423          	sd	s1,8(sp)
    8000288c:	02010413          	addi	s0,sp,32
    80002890:	0ff7f713          	andi	a4,a5,255
    80002894:	00900693          	li	a3,9
    80002898:	04d70c63          	beq	a4,a3,800028f0 <devintr+0x84>
    8000289c:	fff00713          	li	a4,-1
    800028a0:	03f71713          	slli	a4,a4,0x3f
    800028a4:	00170713          	addi	a4,a4,1
    800028a8:	00e78c63          	beq	a5,a4,800028c0 <devintr+0x54>
    800028ac:	01813083          	ld	ra,24(sp)
    800028b0:	01013403          	ld	s0,16(sp)
    800028b4:	00813483          	ld	s1,8(sp)
    800028b8:	02010113          	addi	sp,sp,32
    800028bc:	00008067          	ret
    800028c0:	00000097          	auipc	ra,0x0
    800028c4:	c8c080e7          	jalr	-884(ra) # 8000254c <cpuid>
    800028c8:	06050663          	beqz	a0,80002934 <devintr+0xc8>
    800028cc:	144027f3          	csrr	a5,sip
    800028d0:	ffd7f793          	andi	a5,a5,-3
    800028d4:	14479073          	csrw	sip,a5
    800028d8:	01813083          	ld	ra,24(sp)
    800028dc:	01013403          	ld	s0,16(sp)
    800028e0:	00813483          	ld	s1,8(sp)
    800028e4:	00200513          	li	a0,2
    800028e8:	02010113          	addi	sp,sp,32
    800028ec:	00008067          	ret
    800028f0:	00000097          	auipc	ra,0x0
    800028f4:	254080e7          	jalr	596(ra) # 80002b44 <plic_claim>
    800028f8:	00a00793          	li	a5,10
    800028fc:	00050493          	mv	s1,a0
    80002900:	06f50663          	beq	a0,a5,8000296c <devintr+0x100>
    80002904:	00100513          	li	a0,1
    80002908:	fa0482e3          	beqz	s1,800028ac <devintr+0x40>
    8000290c:	00048593          	mv	a1,s1
    80002910:	00003517          	auipc	a0,0x3
    80002914:	8d850513          	addi	a0,a0,-1832 # 800051e8 <_ZZ12printIntegermE6digits+0xe0>
    80002918:	00000097          	auipc	ra,0x0
    8000291c:	670080e7          	jalr	1648(ra) # 80002f88 <__printf>
    80002920:	00048513          	mv	a0,s1
    80002924:	00000097          	auipc	ra,0x0
    80002928:	258080e7          	jalr	600(ra) # 80002b7c <plic_complete>
    8000292c:	00100513          	li	a0,1
    80002930:	f7dff06f          	j	800028ac <devintr+0x40>
    80002934:	00004517          	auipc	a0,0x4
    80002938:	1cc50513          	addi	a0,a0,460 # 80006b00 <tickslock>
    8000293c:	00001097          	auipc	ra,0x1
    80002940:	320080e7          	jalr	800(ra) # 80003c5c <acquire>
    80002944:	00003717          	auipc	a4,0x3
    80002948:	0b070713          	addi	a4,a4,176 # 800059f4 <ticks>
    8000294c:	00072783          	lw	a5,0(a4)
    80002950:	00004517          	auipc	a0,0x4
    80002954:	1b050513          	addi	a0,a0,432 # 80006b00 <tickslock>
    80002958:	0017879b          	addiw	a5,a5,1
    8000295c:	00f72023          	sw	a5,0(a4)
    80002960:	00001097          	auipc	ra,0x1
    80002964:	3c8080e7          	jalr	968(ra) # 80003d28 <release>
    80002968:	f65ff06f          	j	800028cc <devintr+0x60>
    8000296c:	00001097          	auipc	ra,0x1
    80002970:	f24080e7          	jalr	-220(ra) # 80003890 <uartintr>
    80002974:	fadff06f          	j	80002920 <devintr+0xb4>
	...

0000000080002980 <kernelvec>:
    80002980:	f0010113          	addi	sp,sp,-256
    80002984:	00113023          	sd	ra,0(sp)
    80002988:	00213423          	sd	sp,8(sp)
    8000298c:	00313823          	sd	gp,16(sp)
    80002990:	00413c23          	sd	tp,24(sp)
    80002994:	02513023          	sd	t0,32(sp)
    80002998:	02613423          	sd	t1,40(sp)
    8000299c:	02713823          	sd	t2,48(sp)
    800029a0:	02813c23          	sd	s0,56(sp)
    800029a4:	04913023          	sd	s1,64(sp)
    800029a8:	04a13423          	sd	a0,72(sp)
    800029ac:	04b13823          	sd	a1,80(sp)
    800029b0:	04c13c23          	sd	a2,88(sp)
    800029b4:	06d13023          	sd	a3,96(sp)
    800029b8:	06e13423          	sd	a4,104(sp)
    800029bc:	06f13823          	sd	a5,112(sp)
    800029c0:	07013c23          	sd	a6,120(sp)
    800029c4:	09113023          	sd	a7,128(sp)
    800029c8:	09213423          	sd	s2,136(sp)
    800029cc:	09313823          	sd	s3,144(sp)
    800029d0:	09413c23          	sd	s4,152(sp)
    800029d4:	0b513023          	sd	s5,160(sp)
    800029d8:	0b613423          	sd	s6,168(sp)
    800029dc:	0b713823          	sd	s7,176(sp)
    800029e0:	0b813c23          	sd	s8,184(sp)
    800029e4:	0d913023          	sd	s9,192(sp)
    800029e8:	0da13423          	sd	s10,200(sp)
    800029ec:	0db13823          	sd	s11,208(sp)
    800029f0:	0dc13c23          	sd	t3,216(sp)
    800029f4:	0fd13023          	sd	t4,224(sp)
    800029f8:	0fe13423          	sd	t5,232(sp)
    800029fc:	0ff13823          	sd	t6,240(sp)
    80002a00:	ccdff0ef          	jal	ra,800026cc <kerneltrap>
    80002a04:	00013083          	ld	ra,0(sp)
    80002a08:	00813103          	ld	sp,8(sp)
    80002a0c:	01013183          	ld	gp,16(sp)
    80002a10:	02013283          	ld	t0,32(sp)
    80002a14:	02813303          	ld	t1,40(sp)
    80002a18:	03013383          	ld	t2,48(sp)
    80002a1c:	03813403          	ld	s0,56(sp)
    80002a20:	04013483          	ld	s1,64(sp)
    80002a24:	04813503          	ld	a0,72(sp)
    80002a28:	05013583          	ld	a1,80(sp)
    80002a2c:	05813603          	ld	a2,88(sp)
    80002a30:	06013683          	ld	a3,96(sp)
    80002a34:	06813703          	ld	a4,104(sp)
    80002a38:	07013783          	ld	a5,112(sp)
    80002a3c:	07813803          	ld	a6,120(sp)
    80002a40:	08013883          	ld	a7,128(sp)
    80002a44:	08813903          	ld	s2,136(sp)
    80002a48:	09013983          	ld	s3,144(sp)
    80002a4c:	09813a03          	ld	s4,152(sp)
    80002a50:	0a013a83          	ld	s5,160(sp)
    80002a54:	0a813b03          	ld	s6,168(sp)
    80002a58:	0b013b83          	ld	s7,176(sp)
    80002a5c:	0b813c03          	ld	s8,184(sp)
    80002a60:	0c013c83          	ld	s9,192(sp)
    80002a64:	0c813d03          	ld	s10,200(sp)
    80002a68:	0d013d83          	ld	s11,208(sp)
    80002a6c:	0d813e03          	ld	t3,216(sp)
    80002a70:	0e013e83          	ld	t4,224(sp)
    80002a74:	0e813f03          	ld	t5,232(sp)
    80002a78:	0f013f83          	ld	t6,240(sp)
    80002a7c:	10010113          	addi	sp,sp,256
    80002a80:	10200073          	sret
    80002a84:	00000013          	nop
    80002a88:	00000013          	nop
    80002a8c:	00000013          	nop

0000000080002a90 <timervec>:
    80002a90:	34051573          	csrrw	a0,mscratch,a0
    80002a94:	00b53023          	sd	a1,0(a0)
    80002a98:	00c53423          	sd	a2,8(a0)
    80002a9c:	00d53823          	sd	a3,16(a0)
    80002aa0:	01853583          	ld	a1,24(a0)
    80002aa4:	02053603          	ld	a2,32(a0)
    80002aa8:	0005b683          	ld	a3,0(a1)
    80002aac:	00c686b3          	add	a3,a3,a2
    80002ab0:	00d5b023          	sd	a3,0(a1)
    80002ab4:	00200593          	li	a1,2
    80002ab8:	14459073          	csrw	sip,a1
    80002abc:	01053683          	ld	a3,16(a0)
    80002ac0:	00853603          	ld	a2,8(a0)
    80002ac4:	00053583          	ld	a1,0(a0)
    80002ac8:	34051573          	csrrw	a0,mscratch,a0
    80002acc:	30200073          	mret

0000000080002ad0 <plicinit>:
    80002ad0:	ff010113          	addi	sp,sp,-16
    80002ad4:	00813423          	sd	s0,8(sp)
    80002ad8:	01010413          	addi	s0,sp,16
    80002adc:	00813403          	ld	s0,8(sp)
    80002ae0:	0c0007b7          	lui	a5,0xc000
    80002ae4:	00100713          	li	a4,1
    80002ae8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80002aec:	00e7a223          	sw	a4,4(a5)
    80002af0:	01010113          	addi	sp,sp,16
    80002af4:	00008067          	ret

0000000080002af8 <plicinithart>:
    80002af8:	ff010113          	addi	sp,sp,-16
    80002afc:	00813023          	sd	s0,0(sp)
    80002b00:	00113423          	sd	ra,8(sp)
    80002b04:	01010413          	addi	s0,sp,16
    80002b08:	00000097          	auipc	ra,0x0
    80002b0c:	a44080e7          	jalr	-1468(ra) # 8000254c <cpuid>
    80002b10:	0085171b          	slliw	a4,a0,0x8
    80002b14:	0c0027b7          	lui	a5,0xc002
    80002b18:	00e787b3          	add	a5,a5,a4
    80002b1c:	40200713          	li	a4,1026
    80002b20:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002b24:	00813083          	ld	ra,8(sp)
    80002b28:	00013403          	ld	s0,0(sp)
    80002b2c:	00d5151b          	slliw	a0,a0,0xd
    80002b30:	0c2017b7          	lui	a5,0xc201
    80002b34:	00a78533          	add	a0,a5,a0
    80002b38:	00052023          	sw	zero,0(a0)
    80002b3c:	01010113          	addi	sp,sp,16
    80002b40:	00008067          	ret

0000000080002b44 <plic_claim>:
    80002b44:	ff010113          	addi	sp,sp,-16
    80002b48:	00813023          	sd	s0,0(sp)
    80002b4c:	00113423          	sd	ra,8(sp)
    80002b50:	01010413          	addi	s0,sp,16
    80002b54:	00000097          	auipc	ra,0x0
    80002b58:	9f8080e7          	jalr	-1544(ra) # 8000254c <cpuid>
    80002b5c:	00813083          	ld	ra,8(sp)
    80002b60:	00013403          	ld	s0,0(sp)
    80002b64:	00d5151b          	slliw	a0,a0,0xd
    80002b68:	0c2017b7          	lui	a5,0xc201
    80002b6c:	00a78533          	add	a0,a5,a0
    80002b70:	00452503          	lw	a0,4(a0)
    80002b74:	01010113          	addi	sp,sp,16
    80002b78:	00008067          	ret

0000000080002b7c <plic_complete>:
    80002b7c:	fe010113          	addi	sp,sp,-32
    80002b80:	00813823          	sd	s0,16(sp)
    80002b84:	00913423          	sd	s1,8(sp)
    80002b88:	00113c23          	sd	ra,24(sp)
    80002b8c:	02010413          	addi	s0,sp,32
    80002b90:	00050493          	mv	s1,a0
    80002b94:	00000097          	auipc	ra,0x0
    80002b98:	9b8080e7          	jalr	-1608(ra) # 8000254c <cpuid>
    80002b9c:	01813083          	ld	ra,24(sp)
    80002ba0:	01013403          	ld	s0,16(sp)
    80002ba4:	00d5179b          	slliw	a5,a0,0xd
    80002ba8:	0c201737          	lui	a4,0xc201
    80002bac:	00f707b3          	add	a5,a4,a5
    80002bb0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002bb4:	00813483          	ld	s1,8(sp)
    80002bb8:	02010113          	addi	sp,sp,32
    80002bbc:	00008067          	ret

0000000080002bc0 <consolewrite>:
    80002bc0:	fb010113          	addi	sp,sp,-80
    80002bc4:	04813023          	sd	s0,64(sp)
    80002bc8:	04113423          	sd	ra,72(sp)
    80002bcc:	02913c23          	sd	s1,56(sp)
    80002bd0:	03213823          	sd	s2,48(sp)
    80002bd4:	03313423          	sd	s3,40(sp)
    80002bd8:	03413023          	sd	s4,32(sp)
    80002bdc:	01513c23          	sd	s5,24(sp)
    80002be0:	05010413          	addi	s0,sp,80
    80002be4:	06c05c63          	blez	a2,80002c5c <consolewrite+0x9c>
    80002be8:	00060993          	mv	s3,a2
    80002bec:	00050a13          	mv	s4,a0
    80002bf0:	00058493          	mv	s1,a1
    80002bf4:	00000913          	li	s2,0
    80002bf8:	fff00a93          	li	s5,-1
    80002bfc:	01c0006f          	j	80002c18 <consolewrite+0x58>
    80002c00:	fbf44503          	lbu	a0,-65(s0)
    80002c04:	0019091b          	addiw	s2,s2,1
    80002c08:	00148493          	addi	s1,s1,1
    80002c0c:	00001097          	auipc	ra,0x1
    80002c10:	a9c080e7          	jalr	-1380(ra) # 800036a8 <uartputc>
    80002c14:	03298063          	beq	s3,s2,80002c34 <consolewrite+0x74>
    80002c18:	00048613          	mv	a2,s1
    80002c1c:	00100693          	li	a3,1
    80002c20:	000a0593          	mv	a1,s4
    80002c24:	fbf40513          	addi	a0,s0,-65
    80002c28:	00000097          	auipc	ra,0x0
    80002c2c:	9dc080e7          	jalr	-1572(ra) # 80002604 <either_copyin>
    80002c30:	fd5518e3          	bne	a0,s5,80002c00 <consolewrite+0x40>
    80002c34:	04813083          	ld	ra,72(sp)
    80002c38:	04013403          	ld	s0,64(sp)
    80002c3c:	03813483          	ld	s1,56(sp)
    80002c40:	02813983          	ld	s3,40(sp)
    80002c44:	02013a03          	ld	s4,32(sp)
    80002c48:	01813a83          	ld	s5,24(sp)
    80002c4c:	00090513          	mv	a0,s2
    80002c50:	03013903          	ld	s2,48(sp)
    80002c54:	05010113          	addi	sp,sp,80
    80002c58:	00008067          	ret
    80002c5c:	00000913          	li	s2,0
    80002c60:	fd5ff06f          	j	80002c34 <consolewrite+0x74>

0000000080002c64 <consoleread>:
    80002c64:	f9010113          	addi	sp,sp,-112
    80002c68:	06813023          	sd	s0,96(sp)
    80002c6c:	04913c23          	sd	s1,88(sp)
    80002c70:	05213823          	sd	s2,80(sp)
    80002c74:	05313423          	sd	s3,72(sp)
    80002c78:	05413023          	sd	s4,64(sp)
    80002c7c:	03513c23          	sd	s5,56(sp)
    80002c80:	03613823          	sd	s6,48(sp)
    80002c84:	03713423          	sd	s7,40(sp)
    80002c88:	03813023          	sd	s8,32(sp)
    80002c8c:	06113423          	sd	ra,104(sp)
    80002c90:	01913c23          	sd	s9,24(sp)
    80002c94:	07010413          	addi	s0,sp,112
    80002c98:	00060b93          	mv	s7,a2
    80002c9c:	00050913          	mv	s2,a0
    80002ca0:	00058c13          	mv	s8,a1
    80002ca4:	00060b1b          	sext.w	s6,a2
    80002ca8:	00004497          	auipc	s1,0x4
    80002cac:	e8048493          	addi	s1,s1,-384 # 80006b28 <cons>
    80002cb0:	00400993          	li	s3,4
    80002cb4:	fff00a13          	li	s4,-1
    80002cb8:	00a00a93          	li	s5,10
    80002cbc:	05705e63          	blez	s7,80002d18 <consoleread+0xb4>
    80002cc0:	09c4a703          	lw	a4,156(s1)
    80002cc4:	0984a783          	lw	a5,152(s1)
    80002cc8:	0007071b          	sext.w	a4,a4
    80002ccc:	08e78463          	beq	a5,a4,80002d54 <consoleread+0xf0>
    80002cd0:	07f7f713          	andi	a4,a5,127
    80002cd4:	00e48733          	add	a4,s1,a4
    80002cd8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002cdc:	0017869b          	addiw	a3,a5,1
    80002ce0:	08d4ac23          	sw	a3,152(s1)
    80002ce4:	00070c9b          	sext.w	s9,a4
    80002ce8:	0b370663          	beq	a4,s3,80002d94 <consoleread+0x130>
    80002cec:	00100693          	li	a3,1
    80002cf0:	f9f40613          	addi	a2,s0,-97
    80002cf4:	000c0593          	mv	a1,s8
    80002cf8:	00090513          	mv	a0,s2
    80002cfc:	f8e40fa3          	sb	a4,-97(s0)
    80002d00:	00000097          	auipc	ra,0x0
    80002d04:	8b8080e7          	jalr	-1864(ra) # 800025b8 <either_copyout>
    80002d08:	01450863          	beq	a0,s4,80002d18 <consoleread+0xb4>
    80002d0c:	001c0c13          	addi	s8,s8,1
    80002d10:	fffb8b9b          	addiw	s7,s7,-1
    80002d14:	fb5c94e3          	bne	s9,s5,80002cbc <consoleread+0x58>
    80002d18:	000b851b          	sext.w	a0,s7
    80002d1c:	06813083          	ld	ra,104(sp)
    80002d20:	06013403          	ld	s0,96(sp)
    80002d24:	05813483          	ld	s1,88(sp)
    80002d28:	05013903          	ld	s2,80(sp)
    80002d2c:	04813983          	ld	s3,72(sp)
    80002d30:	04013a03          	ld	s4,64(sp)
    80002d34:	03813a83          	ld	s5,56(sp)
    80002d38:	02813b83          	ld	s7,40(sp)
    80002d3c:	02013c03          	ld	s8,32(sp)
    80002d40:	01813c83          	ld	s9,24(sp)
    80002d44:	40ab053b          	subw	a0,s6,a0
    80002d48:	03013b03          	ld	s6,48(sp)
    80002d4c:	07010113          	addi	sp,sp,112
    80002d50:	00008067          	ret
    80002d54:	00001097          	auipc	ra,0x1
    80002d58:	1d8080e7          	jalr	472(ra) # 80003f2c <push_on>
    80002d5c:	0984a703          	lw	a4,152(s1)
    80002d60:	09c4a783          	lw	a5,156(s1)
    80002d64:	0007879b          	sext.w	a5,a5
    80002d68:	fef70ce3          	beq	a4,a5,80002d60 <consoleread+0xfc>
    80002d6c:	00001097          	auipc	ra,0x1
    80002d70:	234080e7          	jalr	564(ra) # 80003fa0 <pop_on>
    80002d74:	0984a783          	lw	a5,152(s1)
    80002d78:	07f7f713          	andi	a4,a5,127
    80002d7c:	00e48733          	add	a4,s1,a4
    80002d80:	01874703          	lbu	a4,24(a4)
    80002d84:	0017869b          	addiw	a3,a5,1
    80002d88:	08d4ac23          	sw	a3,152(s1)
    80002d8c:	00070c9b          	sext.w	s9,a4
    80002d90:	f5371ee3          	bne	a4,s3,80002cec <consoleread+0x88>
    80002d94:	000b851b          	sext.w	a0,s7
    80002d98:	f96bf2e3          	bgeu	s7,s6,80002d1c <consoleread+0xb8>
    80002d9c:	08f4ac23          	sw	a5,152(s1)
    80002da0:	f7dff06f          	j	80002d1c <consoleread+0xb8>

0000000080002da4 <consputc>:
    80002da4:	10000793          	li	a5,256
    80002da8:	00f50663          	beq	a0,a5,80002db4 <consputc+0x10>
    80002dac:	00001317          	auipc	t1,0x1
    80002db0:	9f430067          	jr	-1548(t1) # 800037a0 <uartputc_sync>
    80002db4:	ff010113          	addi	sp,sp,-16
    80002db8:	00113423          	sd	ra,8(sp)
    80002dbc:	00813023          	sd	s0,0(sp)
    80002dc0:	01010413          	addi	s0,sp,16
    80002dc4:	00800513          	li	a0,8
    80002dc8:	00001097          	auipc	ra,0x1
    80002dcc:	9d8080e7          	jalr	-1576(ra) # 800037a0 <uartputc_sync>
    80002dd0:	02000513          	li	a0,32
    80002dd4:	00001097          	auipc	ra,0x1
    80002dd8:	9cc080e7          	jalr	-1588(ra) # 800037a0 <uartputc_sync>
    80002ddc:	00013403          	ld	s0,0(sp)
    80002de0:	00813083          	ld	ra,8(sp)
    80002de4:	00800513          	li	a0,8
    80002de8:	01010113          	addi	sp,sp,16
    80002dec:	00001317          	auipc	t1,0x1
    80002df0:	9b430067          	jr	-1612(t1) # 800037a0 <uartputc_sync>

0000000080002df4 <consoleintr>:
    80002df4:	fe010113          	addi	sp,sp,-32
    80002df8:	00813823          	sd	s0,16(sp)
    80002dfc:	00913423          	sd	s1,8(sp)
    80002e00:	01213023          	sd	s2,0(sp)
    80002e04:	00113c23          	sd	ra,24(sp)
    80002e08:	02010413          	addi	s0,sp,32
    80002e0c:	00004917          	auipc	s2,0x4
    80002e10:	d1c90913          	addi	s2,s2,-740 # 80006b28 <cons>
    80002e14:	00050493          	mv	s1,a0
    80002e18:	00090513          	mv	a0,s2
    80002e1c:	00001097          	auipc	ra,0x1
    80002e20:	e40080e7          	jalr	-448(ra) # 80003c5c <acquire>
    80002e24:	02048c63          	beqz	s1,80002e5c <consoleintr+0x68>
    80002e28:	0a092783          	lw	a5,160(s2)
    80002e2c:	09892703          	lw	a4,152(s2)
    80002e30:	07f00693          	li	a3,127
    80002e34:	40e7873b          	subw	a4,a5,a4
    80002e38:	02e6e263          	bltu	a3,a4,80002e5c <consoleintr+0x68>
    80002e3c:	00d00713          	li	a4,13
    80002e40:	04e48063          	beq	s1,a4,80002e80 <consoleintr+0x8c>
    80002e44:	07f7f713          	andi	a4,a5,127
    80002e48:	00e90733          	add	a4,s2,a4
    80002e4c:	0017879b          	addiw	a5,a5,1
    80002e50:	0af92023          	sw	a5,160(s2)
    80002e54:	00970c23          	sb	s1,24(a4)
    80002e58:	08f92e23          	sw	a5,156(s2)
    80002e5c:	01013403          	ld	s0,16(sp)
    80002e60:	01813083          	ld	ra,24(sp)
    80002e64:	00813483          	ld	s1,8(sp)
    80002e68:	00013903          	ld	s2,0(sp)
    80002e6c:	00004517          	auipc	a0,0x4
    80002e70:	cbc50513          	addi	a0,a0,-836 # 80006b28 <cons>
    80002e74:	02010113          	addi	sp,sp,32
    80002e78:	00001317          	auipc	t1,0x1
    80002e7c:	eb030067          	jr	-336(t1) # 80003d28 <release>
    80002e80:	00a00493          	li	s1,10
    80002e84:	fc1ff06f          	j	80002e44 <consoleintr+0x50>

0000000080002e88 <consoleinit>:
    80002e88:	fe010113          	addi	sp,sp,-32
    80002e8c:	00113c23          	sd	ra,24(sp)
    80002e90:	00813823          	sd	s0,16(sp)
    80002e94:	00913423          	sd	s1,8(sp)
    80002e98:	02010413          	addi	s0,sp,32
    80002e9c:	00004497          	auipc	s1,0x4
    80002ea0:	c8c48493          	addi	s1,s1,-884 # 80006b28 <cons>
    80002ea4:	00048513          	mv	a0,s1
    80002ea8:	00002597          	auipc	a1,0x2
    80002eac:	39858593          	addi	a1,a1,920 # 80005240 <_ZZ12printIntegermE6digits+0x138>
    80002eb0:	00001097          	auipc	ra,0x1
    80002eb4:	d88080e7          	jalr	-632(ra) # 80003c38 <initlock>
    80002eb8:	00000097          	auipc	ra,0x0
    80002ebc:	7ac080e7          	jalr	1964(ra) # 80003664 <uartinit>
    80002ec0:	01813083          	ld	ra,24(sp)
    80002ec4:	01013403          	ld	s0,16(sp)
    80002ec8:	00000797          	auipc	a5,0x0
    80002ecc:	d9c78793          	addi	a5,a5,-612 # 80002c64 <consoleread>
    80002ed0:	0af4bc23          	sd	a5,184(s1)
    80002ed4:	00000797          	auipc	a5,0x0
    80002ed8:	cec78793          	addi	a5,a5,-788 # 80002bc0 <consolewrite>
    80002edc:	0cf4b023          	sd	a5,192(s1)
    80002ee0:	00813483          	ld	s1,8(sp)
    80002ee4:	02010113          	addi	sp,sp,32
    80002ee8:	00008067          	ret

0000000080002eec <console_read>:
    80002eec:	ff010113          	addi	sp,sp,-16
    80002ef0:	00813423          	sd	s0,8(sp)
    80002ef4:	01010413          	addi	s0,sp,16
    80002ef8:	00813403          	ld	s0,8(sp)
    80002efc:	00004317          	auipc	t1,0x4
    80002f00:	ce433303          	ld	t1,-796(t1) # 80006be0 <devsw+0x10>
    80002f04:	01010113          	addi	sp,sp,16
    80002f08:	00030067          	jr	t1

0000000080002f0c <console_write>:
    80002f0c:	ff010113          	addi	sp,sp,-16
    80002f10:	00813423          	sd	s0,8(sp)
    80002f14:	01010413          	addi	s0,sp,16
    80002f18:	00813403          	ld	s0,8(sp)
    80002f1c:	00004317          	auipc	t1,0x4
    80002f20:	ccc33303          	ld	t1,-820(t1) # 80006be8 <devsw+0x18>
    80002f24:	01010113          	addi	sp,sp,16
    80002f28:	00030067          	jr	t1

0000000080002f2c <panic>:
    80002f2c:	fe010113          	addi	sp,sp,-32
    80002f30:	00113c23          	sd	ra,24(sp)
    80002f34:	00813823          	sd	s0,16(sp)
    80002f38:	00913423          	sd	s1,8(sp)
    80002f3c:	02010413          	addi	s0,sp,32
    80002f40:	00050493          	mv	s1,a0
    80002f44:	00002517          	auipc	a0,0x2
    80002f48:	30450513          	addi	a0,a0,772 # 80005248 <_ZZ12printIntegermE6digits+0x140>
    80002f4c:	00004797          	auipc	a5,0x4
    80002f50:	d207ae23          	sw	zero,-708(a5) # 80006c88 <pr+0x18>
    80002f54:	00000097          	auipc	ra,0x0
    80002f58:	034080e7          	jalr	52(ra) # 80002f88 <__printf>
    80002f5c:	00048513          	mv	a0,s1
    80002f60:	00000097          	auipc	ra,0x0
    80002f64:	028080e7          	jalr	40(ra) # 80002f88 <__printf>
    80002f68:	00002517          	auipc	a0,0x2
    80002f6c:	18850513          	addi	a0,a0,392 # 800050f0 <CONSOLE_STATUS+0xe0>
    80002f70:	00000097          	auipc	ra,0x0
    80002f74:	018080e7          	jalr	24(ra) # 80002f88 <__printf>
    80002f78:	00100793          	li	a5,1
    80002f7c:	00003717          	auipc	a4,0x3
    80002f80:	a6f72e23          	sw	a5,-1412(a4) # 800059f8 <panicked>
    80002f84:	0000006f          	j	80002f84 <panic+0x58>

0000000080002f88 <__printf>:
    80002f88:	f3010113          	addi	sp,sp,-208
    80002f8c:	08813023          	sd	s0,128(sp)
    80002f90:	07313423          	sd	s3,104(sp)
    80002f94:	09010413          	addi	s0,sp,144
    80002f98:	05813023          	sd	s8,64(sp)
    80002f9c:	08113423          	sd	ra,136(sp)
    80002fa0:	06913c23          	sd	s1,120(sp)
    80002fa4:	07213823          	sd	s2,112(sp)
    80002fa8:	07413023          	sd	s4,96(sp)
    80002fac:	05513c23          	sd	s5,88(sp)
    80002fb0:	05613823          	sd	s6,80(sp)
    80002fb4:	05713423          	sd	s7,72(sp)
    80002fb8:	03913c23          	sd	s9,56(sp)
    80002fbc:	03a13823          	sd	s10,48(sp)
    80002fc0:	03b13423          	sd	s11,40(sp)
    80002fc4:	00004317          	auipc	t1,0x4
    80002fc8:	cac30313          	addi	t1,t1,-852 # 80006c70 <pr>
    80002fcc:	01832c03          	lw	s8,24(t1)
    80002fd0:	00b43423          	sd	a1,8(s0)
    80002fd4:	00c43823          	sd	a2,16(s0)
    80002fd8:	00d43c23          	sd	a3,24(s0)
    80002fdc:	02e43023          	sd	a4,32(s0)
    80002fe0:	02f43423          	sd	a5,40(s0)
    80002fe4:	03043823          	sd	a6,48(s0)
    80002fe8:	03143c23          	sd	a7,56(s0)
    80002fec:	00050993          	mv	s3,a0
    80002ff0:	4a0c1663          	bnez	s8,8000349c <__printf+0x514>
    80002ff4:	60098c63          	beqz	s3,8000360c <__printf+0x684>
    80002ff8:	0009c503          	lbu	a0,0(s3)
    80002ffc:	00840793          	addi	a5,s0,8
    80003000:	f6f43c23          	sd	a5,-136(s0)
    80003004:	00000493          	li	s1,0
    80003008:	22050063          	beqz	a0,80003228 <__printf+0x2a0>
    8000300c:	00002a37          	lui	s4,0x2
    80003010:	00018ab7          	lui	s5,0x18
    80003014:	000f4b37          	lui	s6,0xf4
    80003018:	00989bb7          	lui	s7,0x989
    8000301c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003020:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003024:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003028:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000302c:	00148c9b          	addiw	s9,s1,1
    80003030:	02500793          	li	a5,37
    80003034:	01998933          	add	s2,s3,s9
    80003038:	38f51263          	bne	a0,a5,800033bc <__printf+0x434>
    8000303c:	00094783          	lbu	a5,0(s2)
    80003040:	00078c9b          	sext.w	s9,a5
    80003044:	1e078263          	beqz	a5,80003228 <__printf+0x2a0>
    80003048:	0024849b          	addiw	s1,s1,2
    8000304c:	07000713          	li	a4,112
    80003050:	00998933          	add	s2,s3,s1
    80003054:	38e78a63          	beq	a5,a4,800033e8 <__printf+0x460>
    80003058:	20f76863          	bltu	a4,a5,80003268 <__printf+0x2e0>
    8000305c:	42a78863          	beq	a5,a0,8000348c <__printf+0x504>
    80003060:	06400713          	li	a4,100
    80003064:	40e79663          	bne	a5,a4,80003470 <__printf+0x4e8>
    80003068:	f7843783          	ld	a5,-136(s0)
    8000306c:	0007a603          	lw	a2,0(a5)
    80003070:	00878793          	addi	a5,a5,8
    80003074:	f6f43c23          	sd	a5,-136(s0)
    80003078:	42064a63          	bltz	a2,800034ac <__printf+0x524>
    8000307c:	00a00713          	li	a4,10
    80003080:	02e677bb          	remuw	a5,a2,a4
    80003084:	00002d97          	auipc	s11,0x2
    80003088:	1ecd8d93          	addi	s11,s11,492 # 80005270 <digits>
    8000308c:	00900593          	li	a1,9
    80003090:	0006051b          	sext.w	a0,a2
    80003094:	00000c93          	li	s9,0
    80003098:	02079793          	slli	a5,a5,0x20
    8000309c:	0207d793          	srli	a5,a5,0x20
    800030a0:	00fd87b3          	add	a5,s11,a5
    800030a4:	0007c783          	lbu	a5,0(a5)
    800030a8:	02e656bb          	divuw	a3,a2,a4
    800030ac:	f8f40023          	sb	a5,-128(s0)
    800030b0:	14c5d863          	bge	a1,a2,80003200 <__printf+0x278>
    800030b4:	06300593          	li	a1,99
    800030b8:	00100c93          	li	s9,1
    800030bc:	02e6f7bb          	remuw	a5,a3,a4
    800030c0:	02079793          	slli	a5,a5,0x20
    800030c4:	0207d793          	srli	a5,a5,0x20
    800030c8:	00fd87b3          	add	a5,s11,a5
    800030cc:	0007c783          	lbu	a5,0(a5)
    800030d0:	02e6d73b          	divuw	a4,a3,a4
    800030d4:	f8f400a3          	sb	a5,-127(s0)
    800030d8:	12a5f463          	bgeu	a1,a0,80003200 <__printf+0x278>
    800030dc:	00a00693          	li	a3,10
    800030e0:	00900593          	li	a1,9
    800030e4:	02d777bb          	remuw	a5,a4,a3
    800030e8:	02079793          	slli	a5,a5,0x20
    800030ec:	0207d793          	srli	a5,a5,0x20
    800030f0:	00fd87b3          	add	a5,s11,a5
    800030f4:	0007c503          	lbu	a0,0(a5)
    800030f8:	02d757bb          	divuw	a5,a4,a3
    800030fc:	f8a40123          	sb	a0,-126(s0)
    80003100:	48e5f263          	bgeu	a1,a4,80003584 <__printf+0x5fc>
    80003104:	06300513          	li	a0,99
    80003108:	02d7f5bb          	remuw	a1,a5,a3
    8000310c:	02059593          	slli	a1,a1,0x20
    80003110:	0205d593          	srli	a1,a1,0x20
    80003114:	00bd85b3          	add	a1,s11,a1
    80003118:	0005c583          	lbu	a1,0(a1)
    8000311c:	02d7d7bb          	divuw	a5,a5,a3
    80003120:	f8b401a3          	sb	a1,-125(s0)
    80003124:	48e57263          	bgeu	a0,a4,800035a8 <__printf+0x620>
    80003128:	3e700513          	li	a0,999
    8000312c:	02d7f5bb          	remuw	a1,a5,a3
    80003130:	02059593          	slli	a1,a1,0x20
    80003134:	0205d593          	srli	a1,a1,0x20
    80003138:	00bd85b3          	add	a1,s11,a1
    8000313c:	0005c583          	lbu	a1,0(a1)
    80003140:	02d7d7bb          	divuw	a5,a5,a3
    80003144:	f8b40223          	sb	a1,-124(s0)
    80003148:	46e57663          	bgeu	a0,a4,800035b4 <__printf+0x62c>
    8000314c:	02d7f5bb          	remuw	a1,a5,a3
    80003150:	02059593          	slli	a1,a1,0x20
    80003154:	0205d593          	srli	a1,a1,0x20
    80003158:	00bd85b3          	add	a1,s11,a1
    8000315c:	0005c583          	lbu	a1,0(a1)
    80003160:	02d7d7bb          	divuw	a5,a5,a3
    80003164:	f8b402a3          	sb	a1,-123(s0)
    80003168:	46ea7863          	bgeu	s4,a4,800035d8 <__printf+0x650>
    8000316c:	02d7f5bb          	remuw	a1,a5,a3
    80003170:	02059593          	slli	a1,a1,0x20
    80003174:	0205d593          	srli	a1,a1,0x20
    80003178:	00bd85b3          	add	a1,s11,a1
    8000317c:	0005c583          	lbu	a1,0(a1)
    80003180:	02d7d7bb          	divuw	a5,a5,a3
    80003184:	f8b40323          	sb	a1,-122(s0)
    80003188:	3eeaf863          	bgeu	s5,a4,80003578 <__printf+0x5f0>
    8000318c:	02d7f5bb          	remuw	a1,a5,a3
    80003190:	02059593          	slli	a1,a1,0x20
    80003194:	0205d593          	srli	a1,a1,0x20
    80003198:	00bd85b3          	add	a1,s11,a1
    8000319c:	0005c583          	lbu	a1,0(a1)
    800031a0:	02d7d7bb          	divuw	a5,a5,a3
    800031a4:	f8b403a3          	sb	a1,-121(s0)
    800031a8:	42eb7e63          	bgeu	s6,a4,800035e4 <__printf+0x65c>
    800031ac:	02d7f5bb          	remuw	a1,a5,a3
    800031b0:	02059593          	slli	a1,a1,0x20
    800031b4:	0205d593          	srli	a1,a1,0x20
    800031b8:	00bd85b3          	add	a1,s11,a1
    800031bc:	0005c583          	lbu	a1,0(a1)
    800031c0:	02d7d7bb          	divuw	a5,a5,a3
    800031c4:	f8b40423          	sb	a1,-120(s0)
    800031c8:	42ebfc63          	bgeu	s7,a4,80003600 <__printf+0x678>
    800031cc:	02079793          	slli	a5,a5,0x20
    800031d0:	0207d793          	srli	a5,a5,0x20
    800031d4:	00fd8db3          	add	s11,s11,a5
    800031d8:	000dc703          	lbu	a4,0(s11)
    800031dc:	00a00793          	li	a5,10
    800031e0:	00900c93          	li	s9,9
    800031e4:	f8e404a3          	sb	a4,-119(s0)
    800031e8:	00065c63          	bgez	a2,80003200 <__printf+0x278>
    800031ec:	f9040713          	addi	a4,s0,-112
    800031f0:	00f70733          	add	a4,a4,a5
    800031f4:	02d00693          	li	a3,45
    800031f8:	fed70823          	sb	a3,-16(a4)
    800031fc:	00078c93          	mv	s9,a5
    80003200:	f8040793          	addi	a5,s0,-128
    80003204:	01978cb3          	add	s9,a5,s9
    80003208:	f7f40d13          	addi	s10,s0,-129
    8000320c:	000cc503          	lbu	a0,0(s9)
    80003210:	fffc8c93          	addi	s9,s9,-1
    80003214:	00000097          	auipc	ra,0x0
    80003218:	b90080e7          	jalr	-1136(ra) # 80002da4 <consputc>
    8000321c:	ffac98e3          	bne	s9,s10,8000320c <__printf+0x284>
    80003220:	00094503          	lbu	a0,0(s2)
    80003224:	e00514e3          	bnez	a0,8000302c <__printf+0xa4>
    80003228:	1a0c1663          	bnez	s8,800033d4 <__printf+0x44c>
    8000322c:	08813083          	ld	ra,136(sp)
    80003230:	08013403          	ld	s0,128(sp)
    80003234:	07813483          	ld	s1,120(sp)
    80003238:	07013903          	ld	s2,112(sp)
    8000323c:	06813983          	ld	s3,104(sp)
    80003240:	06013a03          	ld	s4,96(sp)
    80003244:	05813a83          	ld	s5,88(sp)
    80003248:	05013b03          	ld	s6,80(sp)
    8000324c:	04813b83          	ld	s7,72(sp)
    80003250:	04013c03          	ld	s8,64(sp)
    80003254:	03813c83          	ld	s9,56(sp)
    80003258:	03013d03          	ld	s10,48(sp)
    8000325c:	02813d83          	ld	s11,40(sp)
    80003260:	0d010113          	addi	sp,sp,208
    80003264:	00008067          	ret
    80003268:	07300713          	li	a4,115
    8000326c:	1ce78a63          	beq	a5,a4,80003440 <__printf+0x4b8>
    80003270:	07800713          	li	a4,120
    80003274:	1ee79e63          	bne	a5,a4,80003470 <__printf+0x4e8>
    80003278:	f7843783          	ld	a5,-136(s0)
    8000327c:	0007a703          	lw	a4,0(a5)
    80003280:	00878793          	addi	a5,a5,8
    80003284:	f6f43c23          	sd	a5,-136(s0)
    80003288:	28074263          	bltz	a4,8000350c <__printf+0x584>
    8000328c:	00002d97          	auipc	s11,0x2
    80003290:	fe4d8d93          	addi	s11,s11,-28 # 80005270 <digits>
    80003294:	00f77793          	andi	a5,a4,15
    80003298:	00fd87b3          	add	a5,s11,a5
    8000329c:	0007c683          	lbu	a3,0(a5)
    800032a0:	00f00613          	li	a2,15
    800032a4:	0007079b          	sext.w	a5,a4
    800032a8:	f8d40023          	sb	a3,-128(s0)
    800032ac:	0047559b          	srliw	a1,a4,0x4
    800032b0:	0047569b          	srliw	a3,a4,0x4
    800032b4:	00000c93          	li	s9,0
    800032b8:	0ee65063          	bge	a2,a4,80003398 <__printf+0x410>
    800032bc:	00f6f693          	andi	a3,a3,15
    800032c0:	00dd86b3          	add	a3,s11,a3
    800032c4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800032c8:	0087d79b          	srliw	a5,a5,0x8
    800032cc:	00100c93          	li	s9,1
    800032d0:	f8d400a3          	sb	a3,-127(s0)
    800032d4:	0cb67263          	bgeu	a2,a1,80003398 <__printf+0x410>
    800032d8:	00f7f693          	andi	a3,a5,15
    800032dc:	00dd86b3          	add	a3,s11,a3
    800032e0:	0006c583          	lbu	a1,0(a3)
    800032e4:	00f00613          	li	a2,15
    800032e8:	0047d69b          	srliw	a3,a5,0x4
    800032ec:	f8b40123          	sb	a1,-126(s0)
    800032f0:	0047d593          	srli	a1,a5,0x4
    800032f4:	28f67e63          	bgeu	a2,a5,80003590 <__printf+0x608>
    800032f8:	00f6f693          	andi	a3,a3,15
    800032fc:	00dd86b3          	add	a3,s11,a3
    80003300:	0006c503          	lbu	a0,0(a3)
    80003304:	0087d813          	srli	a6,a5,0x8
    80003308:	0087d69b          	srliw	a3,a5,0x8
    8000330c:	f8a401a3          	sb	a0,-125(s0)
    80003310:	28b67663          	bgeu	a2,a1,8000359c <__printf+0x614>
    80003314:	00f6f693          	andi	a3,a3,15
    80003318:	00dd86b3          	add	a3,s11,a3
    8000331c:	0006c583          	lbu	a1,0(a3)
    80003320:	00c7d513          	srli	a0,a5,0xc
    80003324:	00c7d69b          	srliw	a3,a5,0xc
    80003328:	f8b40223          	sb	a1,-124(s0)
    8000332c:	29067a63          	bgeu	a2,a6,800035c0 <__printf+0x638>
    80003330:	00f6f693          	andi	a3,a3,15
    80003334:	00dd86b3          	add	a3,s11,a3
    80003338:	0006c583          	lbu	a1,0(a3)
    8000333c:	0107d813          	srli	a6,a5,0x10
    80003340:	0107d69b          	srliw	a3,a5,0x10
    80003344:	f8b402a3          	sb	a1,-123(s0)
    80003348:	28a67263          	bgeu	a2,a0,800035cc <__printf+0x644>
    8000334c:	00f6f693          	andi	a3,a3,15
    80003350:	00dd86b3          	add	a3,s11,a3
    80003354:	0006c683          	lbu	a3,0(a3)
    80003358:	0147d79b          	srliw	a5,a5,0x14
    8000335c:	f8d40323          	sb	a3,-122(s0)
    80003360:	21067663          	bgeu	a2,a6,8000356c <__printf+0x5e4>
    80003364:	02079793          	slli	a5,a5,0x20
    80003368:	0207d793          	srli	a5,a5,0x20
    8000336c:	00fd8db3          	add	s11,s11,a5
    80003370:	000dc683          	lbu	a3,0(s11)
    80003374:	00800793          	li	a5,8
    80003378:	00700c93          	li	s9,7
    8000337c:	f8d403a3          	sb	a3,-121(s0)
    80003380:	00075c63          	bgez	a4,80003398 <__printf+0x410>
    80003384:	f9040713          	addi	a4,s0,-112
    80003388:	00f70733          	add	a4,a4,a5
    8000338c:	02d00693          	li	a3,45
    80003390:	fed70823          	sb	a3,-16(a4)
    80003394:	00078c93          	mv	s9,a5
    80003398:	f8040793          	addi	a5,s0,-128
    8000339c:	01978cb3          	add	s9,a5,s9
    800033a0:	f7f40d13          	addi	s10,s0,-129
    800033a4:	000cc503          	lbu	a0,0(s9)
    800033a8:	fffc8c93          	addi	s9,s9,-1
    800033ac:	00000097          	auipc	ra,0x0
    800033b0:	9f8080e7          	jalr	-1544(ra) # 80002da4 <consputc>
    800033b4:	ff9d18e3          	bne	s10,s9,800033a4 <__printf+0x41c>
    800033b8:	0100006f          	j	800033c8 <__printf+0x440>
    800033bc:	00000097          	auipc	ra,0x0
    800033c0:	9e8080e7          	jalr	-1560(ra) # 80002da4 <consputc>
    800033c4:	000c8493          	mv	s1,s9
    800033c8:	00094503          	lbu	a0,0(s2)
    800033cc:	c60510e3          	bnez	a0,8000302c <__printf+0xa4>
    800033d0:	e40c0ee3          	beqz	s8,8000322c <__printf+0x2a4>
    800033d4:	00004517          	auipc	a0,0x4
    800033d8:	89c50513          	addi	a0,a0,-1892 # 80006c70 <pr>
    800033dc:	00001097          	auipc	ra,0x1
    800033e0:	94c080e7          	jalr	-1716(ra) # 80003d28 <release>
    800033e4:	e49ff06f          	j	8000322c <__printf+0x2a4>
    800033e8:	f7843783          	ld	a5,-136(s0)
    800033ec:	03000513          	li	a0,48
    800033f0:	01000d13          	li	s10,16
    800033f4:	00878713          	addi	a4,a5,8
    800033f8:	0007bc83          	ld	s9,0(a5)
    800033fc:	f6e43c23          	sd	a4,-136(s0)
    80003400:	00000097          	auipc	ra,0x0
    80003404:	9a4080e7          	jalr	-1628(ra) # 80002da4 <consputc>
    80003408:	07800513          	li	a0,120
    8000340c:	00000097          	auipc	ra,0x0
    80003410:	998080e7          	jalr	-1640(ra) # 80002da4 <consputc>
    80003414:	00002d97          	auipc	s11,0x2
    80003418:	e5cd8d93          	addi	s11,s11,-420 # 80005270 <digits>
    8000341c:	03ccd793          	srli	a5,s9,0x3c
    80003420:	00fd87b3          	add	a5,s11,a5
    80003424:	0007c503          	lbu	a0,0(a5)
    80003428:	fffd0d1b          	addiw	s10,s10,-1
    8000342c:	004c9c93          	slli	s9,s9,0x4
    80003430:	00000097          	auipc	ra,0x0
    80003434:	974080e7          	jalr	-1676(ra) # 80002da4 <consputc>
    80003438:	fe0d12e3          	bnez	s10,8000341c <__printf+0x494>
    8000343c:	f8dff06f          	j	800033c8 <__printf+0x440>
    80003440:	f7843783          	ld	a5,-136(s0)
    80003444:	0007bc83          	ld	s9,0(a5)
    80003448:	00878793          	addi	a5,a5,8
    8000344c:	f6f43c23          	sd	a5,-136(s0)
    80003450:	000c9a63          	bnez	s9,80003464 <__printf+0x4dc>
    80003454:	1080006f          	j	8000355c <__printf+0x5d4>
    80003458:	001c8c93          	addi	s9,s9,1
    8000345c:	00000097          	auipc	ra,0x0
    80003460:	948080e7          	jalr	-1720(ra) # 80002da4 <consputc>
    80003464:	000cc503          	lbu	a0,0(s9)
    80003468:	fe0518e3          	bnez	a0,80003458 <__printf+0x4d0>
    8000346c:	f5dff06f          	j	800033c8 <__printf+0x440>
    80003470:	02500513          	li	a0,37
    80003474:	00000097          	auipc	ra,0x0
    80003478:	930080e7          	jalr	-1744(ra) # 80002da4 <consputc>
    8000347c:	000c8513          	mv	a0,s9
    80003480:	00000097          	auipc	ra,0x0
    80003484:	924080e7          	jalr	-1756(ra) # 80002da4 <consputc>
    80003488:	f41ff06f          	j	800033c8 <__printf+0x440>
    8000348c:	02500513          	li	a0,37
    80003490:	00000097          	auipc	ra,0x0
    80003494:	914080e7          	jalr	-1772(ra) # 80002da4 <consputc>
    80003498:	f31ff06f          	j	800033c8 <__printf+0x440>
    8000349c:	00030513          	mv	a0,t1
    800034a0:	00000097          	auipc	ra,0x0
    800034a4:	7bc080e7          	jalr	1980(ra) # 80003c5c <acquire>
    800034a8:	b4dff06f          	j	80002ff4 <__printf+0x6c>
    800034ac:	40c0053b          	negw	a0,a2
    800034b0:	00a00713          	li	a4,10
    800034b4:	02e576bb          	remuw	a3,a0,a4
    800034b8:	00002d97          	auipc	s11,0x2
    800034bc:	db8d8d93          	addi	s11,s11,-584 # 80005270 <digits>
    800034c0:	ff700593          	li	a1,-9
    800034c4:	02069693          	slli	a3,a3,0x20
    800034c8:	0206d693          	srli	a3,a3,0x20
    800034cc:	00dd86b3          	add	a3,s11,a3
    800034d0:	0006c683          	lbu	a3,0(a3)
    800034d4:	02e557bb          	divuw	a5,a0,a4
    800034d8:	f8d40023          	sb	a3,-128(s0)
    800034dc:	10b65e63          	bge	a2,a1,800035f8 <__printf+0x670>
    800034e0:	06300593          	li	a1,99
    800034e4:	02e7f6bb          	remuw	a3,a5,a4
    800034e8:	02069693          	slli	a3,a3,0x20
    800034ec:	0206d693          	srli	a3,a3,0x20
    800034f0:	00dd86b3          	add	a3,s11,a3
    800034f4:	0006c683          	lbu	a3,0(a3)
    800034f8:	02e7d73b          	divuw	a4,a5,a4
    800034fc:	00200793          	li	a5,2
    80003500:	f8d400a3          	sb	a3,-127(s0)
    80003504:	bca5ece3          	bltu	a1,a0,800030dc <__printf+0x154>
    80003508:	ce5ff06f          	j	800031ec <__printf+0x264>
    8000350c:	40e007bb          	negw	a5,a4
    80003510:	00002d97          	auipc	s11,0x2
    80003514:	d60d8d93          	addi	s11,s11,-672 # 80005270 <digits>
    80003518:	00f7f693          	andi	a3,a5,15
    8000351c:	00dd86b3          	add	a3,s11,a3
    80003520:	0006c583          	lbu	a1,0(a3)
    80003524:	ff100613          	li	a2,-15
    80003528:	0047d69b          	srliw	a3,a5,0x4
    8000352c:	f8b40023          	sb	a1,-128(s0)
    80003530:	0047d59b          	srliw	a1,a5,0x4
    80003534:	0ac75e63          	bge	a4,a2,800035f0 <__printf+0x668>
    80003538:	00f6f693          	andi	a3,a3,15
    8000353c:	00dd86b3          	add	a3,s11,a3
    80003540:	0006c603          	lbu	a2,0(a3)
    80003544:	00f00693          	li	a3,15
    80003548:	0087d79b          	srliw	a5,a5,0x8
    8000354c:	f8c400a3          	sb	a2,-127(s0)
    80003550:	d8b6e4e3          	bltu	a3,a1,800032d8 <__printf+0x350>
    80003554:	00200793          	li	a5,2
    80003558:	e2dff06f          	j	80003384 <__printf+0x3fc>
    8000355c:	00002c97          	auipc	s9,0x2
    80003560:	cf4c8c93          	addi	s9,s9,-780 # 80005250 <_ZZ12printIntegermE6digits+0x148>
    80003564:	02800513          	li	a0,40
    80003568:	ef1ff06f          	j	80003458 <__printf+0x4d0>
    8000356c:	00700793          	li	a5,7
    80003570:	00600c93          	li	s9,6
    80003574:	e0dff06f          	j	80003380 <__printf+0x3f8>
    80003578:	00700793          	li	a5,7
    8000357c:	00600c93          	li	s9,6
    80003580:	c69ff06f          	j	800031e8 <__printf+0x260>
    80003584:	00300793          	li	a5,3
    80003588:	00200c93          	li	s9,2
    8000358c:	c5dff06f          	j	800031e8 <__printf+0x260>
    80003590:	00300793          	li	a5,3
    80003594:	00200c93          	li	s9,2
    80003598:	de9ff06f          	j	80003380 <__printf+0x3f8>
    8000359c:	00400793          	li	a5,4
    800035a0:	00300c93          	li	s9,3
    800035a4:	dddff06f          	j	80003380 <__printf+0x3f8>
    800035a8:	00400793          	li	a5,4
    800035ac:	00300c93          	li	s9,3
    800035b0:	c39ff06f          	j	800031e8 <__printf+0x260>
    800035b4:	00500793          	li	a5,5
    800035b8:	00400c93          	li	s9,4
    800035bc:	c2dff06f          	j	800031e8 <__printf+0x260>
    800035c0:	00500793          	li	a5,5
    800035c4:	00400c93          	li	s9,4
    800035c8:	db9ff06f          	j	80003380 <__printf+0x3f8>
    800035cc:	00600793          	li	a5,6
    800035d0:	00500c93          	li	s9,5
    800035d4:	dadff06f          	j	80003380 <__printf+0x3f8>
    800035d8:	00600793          	li	a5,6
    800035dc:	00500c93          	li	s9,5
    800035e0:	c09ff06f          	j	800031e8 <__printf+0x260>
    800035e4:	00800793          	li	a5,8
    800035e8:	00700c93          	li	s9,7
    800035ec:	bfdff06f          	j	800031e8 <__printf+0x260>
    800035f0:	00100793          	li	a5,1
    800035f4:	d91ff06f          	j	80003384 <__printf+0x3fc>
    800035f8:	00100793          	li	a5,1
    800035fc:	bf1ff06f          	j	800031ec <__printf+0x264>
    80003600:	00900793          	li	a5,9
    80003604:	00800c93          	li	s9,8
    80003608:	be1ff06f          	j	800031e8 <__printf+0x260>
    8000360c:	00002517          	auipc	a0,0x2
    80003610:	c4c50513          	addi	a0,a0,-948 # 80005258 <_ZZ12printIntegermE6digits+0x150>
    80003614:	00000097          	auipc	ra,0x0
    80003618:	918080e7          	jalr	-1768(ra) # 80002f2c <panic>

000000008000361c <printfinit>:
    8000361c:	fe010113          	addi	sp,sp,-32
    80003620:	00813823          	sd	s0,16(sp)
    80003624:	00913423          	sd	s1,8(sp)
    80003628:	00113c23          	sd	ra,24(sp)
    8000362c:	02010413          	addi	s0,sp,32
    80003630:	00003497          	auipc	s1,0x3
    80003634:	64048493          	addi	s1,s1,1600 # 80006c70 <pr>
    80003638:	00048513          	mv	a0,s1
    8000363c:	00002597          	auipc	a1,0x2
    80003640:	c2c58593          	addi	a1,a1,-980 # 80005268 <_ZZ12printIntegermE6digits+0x160>
    80003644:	00000097          	auipc	ra,0x0
    80003648:	5f4080e7          	jalr	1524(ra) # 80003c38 <initlock>
    8000364c:	01813083          	ld	ra,24(sp)
    80003650:	01013403          	ld	s0,16(sp)
    80003654:	0004ac23          	sw	zero,24(s1)
    80003658:	00813483          	ld	s1,8(sp)
    8000365c:	02010113          	addi	sp,sp,32
    80003660:	00008067          	ret

0000000080003664 <uartinit>:
    80003664:	ff010113          	addi	sp,sp,-16
    80003668:	00813423          	sd	s0,8(sp)
    8000366c:	01010413          	addi	s0,sp,16
    80003670:	100007b7          	lui	a5,0x10000
    80003674:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003678:	f8000713          	li	a4,-128
    8000367c:	00e781a3          	sb	a4,3(a5)
    80003680:	00300713          	li	a4,3
    80003684:	00e78023          	sb	a4,0(a5)
    80003688:	000780a3          	sb	zero,1(a5)
    8000368c:	00e781a3          	sb	a4,3(a5)
    80003690:	00700693          	li	a3,7
    80003694:	00d78123          	sb	a3,2(a5)
    80003698:	00e780a3          	sb	a4,1(a5)
    8000369c:	00813403          	ld	s0,8(sp)
    800036a0:	01010113          	addi	sp,sp,16
    800036a4:	00008067          	ret

00000000800036a8 <uartputc>:
    800036a8:	00002797          	auipc	a5,0x2
    800036ac:	3507a783          	lw	a5,848(a5) # 800059f8 <panicked>
    800036b0:	00078463          	beqz	a5,800036b8 <uartputc+0x10>
    800036b4:	0000006f          	j	800036b4 <uartputc+0xc>
    800036b8:	fd010113          	addi	sp,sp,-48
    800036bc:	02813023          	sd	s0,32(sp)
    800036c0:	00913c23          	sd	s1,24(sp)
    800036c4:	01213823          	sd	s2,16(sp)
    800036c8:	01313423          	sd	s3,8(sp)
    800036cc:	02113423          	sd	ra,40(sp)
    800036d0:	03010413          	addi	s0,sp,48
    800036d4:	00002917          	auipc	s2,0x2
    800036d8:	32c90913          	addi	s2,s2,812 # 80005a00 <uart_tx_r>
    800036dc:	00093783          	ld	a5,0(s2)
    800036e0:	00002497          	auipc	s1,0x2
    800036e4:	32848493          	addi	s1,s1,808 # 80005a08 <uart_tx_w>
    800036e8:	0004b703          	ld	a4,0(s1)
    800036ec:	02078693          	addi	a3,a5,32
    800036f0:	00050993          	mv	s3,a0
    800036f4:	02e69c63          	bne	a3,a4,8000372c <uartputc+0x84>
    800036f8:	00001097          	auipc	ra,0x1
    800036fc:	834080e7          	jalr	-1996(ra) # 80003f2c <push_on>
    80003700:	00093783          	ld	a5,0(s2)
    80003704:	0004b703          	ld	a4,0(s1)
    80003708:	02078793          	addi	a5,a5,32
    8000370c:	00e79463          	bne	a5,a4,80003714 <uartputc+0x6c>
    80003710:	0000006f          	j	80003710 <uartputc+0x68>
    80003714:	00001097          	auipc	ra,0x1
    80003718:	88c080e7          	jalr	-1908(ra) # 80003fa0 <pop_on>
    8000371c:	00093783          	ld	a5,0(s2)
    80003720:	0004b703          	ld	a4,0(s1)
    80003724:	02078693          	addi	a3,a5,32
    80003728:	fce688e3          	beq	a3,a4,800036f8 <uartputc+0x50>
    8000372c:	01f77693          	andi	a3,a4,31
    80003730:	00003597          	auipc	a1,0x3
    80003734:	56058593          	addi	a1,a1,1376 # 80006c90 <uart_tx_buf>
    80003738:	00d586b3          	add	a3,a1,a3
    8000373c:	00170713          	addi	a4,a4,1
    80003740:	01368023          	sb	s3,0(a3)
    80003744:	00e4b023          	sd	a4,0(s1)
    80003748:	10000637          	lui	a2,0x10000
    8000374c:	02f71063          	bne	a4,a5,8000376c <uartputc+0xc4>
    80003750:	0340006f          	j	80003784 <uartputc+0xdc>
    80003754:	00074703          	lbu	a4,0(a4)
    80003758:	00f93023          	sd	a5,0(s2)
    8000375c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003760:	00093783          	ld	a5,0(s2)
    80003764:	0004b703          	ld	a4,0(s1)
    80003768:	00f70e63          	beq	a4,a5,80003784 <uartputc+0xdc>
    8000376c:	00564683          	lbu	a3,5(a2)
    80003770:	01f7f713          	andi	a4,a5,31
    80003774:	00e58733          	add	a4,a1,a4
    80003778:	0206f693          	andi	a3,a3,32
    8000377c:	00178793          	addi	a5,a5,1
    80003780:	fc069ae3          	bnez	a3,80003754 <uartputc+0xac>
    80003784:	02813083          	ld	ra,40(sp)
    80003788:	02013403          	ld	s0,32(sp)
    8000378c:	01813483          	ld	s1,24(sp)
    80003790:	01013903          	ld	s2,16(sp)
    80003794:	00813983          	ld	s3,8(sp)
    80003798:	03010113          	addi	sp,sp,48
    8000379c:	00008067          	ret

00000000800037a0 <uartputc_sync>:
    800037a0:	ff010113          	addi	sp,sp,-16
    800037a4:	00813423          	sd	s0,8(sp)
    800037a8:	01010413          	addi	s0,sp,16
    800037ac:	00002717          	auipc	a4,0x2
    800037b0:	24c72703          	lw	a4,588(a4) # 800059f8 <panicked>
    800037b4:	02071663          	bnez	a4,800037e0 <uartputc_sync+0x40>
    800037b8:	00050793          	mv	a5,a0
    800037bc:	100006b7          	lui	a3,0x10000
    800037c0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800037c4:	02077713          	andi	a4,a4,32
    800037c8:	fe070ce3          	beqz	a4,800037c0 <uartputc_sync+0x20>
    800037cc:	0ff7f793          	andi	a5,a5,255
    800037d0:	00f68023          	sb	a5,0(a3)
    800037d4:	00813403          	ld	s0,8(sp)
    800037d8:	01010113          	addi	sp,sp,16
    800037dc:	00008067          	ret
    800037e0:	0000006f          	j	800037e0 <uartputc_sync+0x40>

00000000800037e4 <uartstart>:
    800037e4:	ff010113          	addi	sp,sp,-16
    800037e8:	00813423          	sd	s0,8(sp)
    800037ec:	01010413          	addi	s0,sp,16
    800037f0:	00002617          	auipc	a2,0x2
    800037f4:	21060613          	addi	a2,a2,528 # 80005a00 <uart_tx_r>
    800037f8:	00002517          	auipc	a0,0x2
    800037fc:	21050513          	addi	a0,a0,528 # 80005a08 <uart_tx_w>
    80003800:	00063783          	ld	a5,0(a2)
    80003804:	00053703          	ld	a4,0(a0)
    80003808:	04f70263          	beq	a4,a5,8000384c <uartstart+0x68>
    8000380c:	100005b7          	lui	a1,0x10000
    80003810:	00003817          	auipc	a6,0x3
    80003814:	48080813          	addi	a6,a6,1152 # 80006c90 <uart_tx_buf>
    80003818:	01c0006f          	j	80003834 <uartstart+0x50>
    8000381c:	0006c703          	lbu	a4,0(a3)
    80003820:	00f63023          	sd	a5,0(a2)
    80003824:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003828:	00063783          	ld	a5,0(a2)
    8000382c:	00053703          	ld	a4,0(a0)
    80003830:	00f70e63          	beq	a4,a5,8000384c <uartstart+0x68>
    80003834:	01f7f713          	andi	a4,a5,31
    80003838:	00e806b3          	add	a3,a6,a4
    8000383c:	0055c703          	lbu	a4,5(a1)
    80003840:	00178793          	addi	a5,a5,1
    80003844:	02077713          	andi	a4,a4,32
    80003848:	fc071ae3          	bnez	a4,8000381c <uartstart+0x38>
    8000384c:	00813403          	ld	s0,8(sp)
    80003850:	01010113          	addi	sp,sp,16
    80003854:	00008067          	ret

0000000080003858 <uartgetc>:
    80003858:	ff010113          	addi	sp,sp,-16
    8000385c:	00813423          	sd	s0,8(sp)
    80003860:	01010413          	addi	s0,sp,16
    80003864:	10000737          	lui	a4,0x10000
    80003868:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000386c:	0017f793          	andi	a5,a5,1
    80003870:	00078c63          	beqz	a5,80003888 <uartgetc+0x30>
    80003874:	00074503          	lbu	a0,0(a4)
    80003878:	0ff57513          	andi	a0,a0,255
    8000387c:	00813403          	ld	s0,8(sp)
    80003880:	01010113          	addi	sp,sp,16
    80003884:	00008067          	ret
    80003888:	fff00513          	li	a0,-1
    8000388c:	ff1ff06f          	j	8000387c <uartgetc+0x24>

0000000080003890 <uartintr>:
    80003890:	100007b7          	lui	a5,0x10000
    80003894:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003898:	0017f793          	andi	a5,a5,1
    8000389c:	0a078463          	beqz	a5,80003944 <uartintr+0xb4>
    800038a0:	fe010113          	addi	sp,sp,-32
    800038a4:	00813823          	sd	s0,16(sp)
    800038a8:	00913423          	sd	s1,8(sp)
    800038ac:	00113c23          	sd	ra,24(sp)
    800038b0:	02010413          	addi	s0,sp,32
    800038b4:	100004b7          	lui	s1,0x10000
    800038b8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800038bc:	0ff57513          	andi	a0,a0,255
    800038c0:	fffff097          	auipc	ra,0xfffff
    800038c4:	534080e7          	jalr	1332(ra) # 80002df4 <consoleintr>
    800038c8:	0054c783          	lbu	a5,5(s1)
    800038cc:	0017f793          	andi	a5,a5,1
    800038d0:	fe0794e3          	bnez	a5,800038b8 <uartintr+0x28>
    800038d4:	00002617          	auipc	a2,0x2
    800038d8:	12c60613          	addi	a2,a2,300 # 80005a00 <uart_tx_r>
    800038dc:	00002517          	auipc	a0,0x2
    800038e0:	12c50513          	addi	a0,a0,300 # 80005a08 <uart_tx_w>
    800038e4:	00063783          	ld	a5,0(a2)
    800038e8:	00053703          	ld	a4,0(a0)
    800038ec:	04f70263          	beq	a4,a5,80003930 <uartintr+0xa0>
    800038f0:	100005b7          	lui	a1,0x10000
    800038f4:	00003817          	auipc	a6,0x3
    800038f8:	39c80813          	addi	a6,a6,924 # 80006c90 <uart_tx_buf>
    800038fc:	01c0006f          	j	80003918 <uartintr+0x88>
    80003900:	0006c703          	lbu	a4,0(a3)
    80003904:	00f63023          	sd	a5,0(a2)
    80003908:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000390c:	00063783          	ld	a5,0(a2)
    80003910:	00053703          	ld	a4,0(a0)
    80003914:	00f70e63          	beq	a4,a5,80003930 <uartintr+0xa0>
    80003918:	01f7f713          	andi	a4,a5,31
    8000391c:	00e806b3          	add	a3,a6,a4
    80003920:	0055c703          	lbu	a4,5(a1)
    80003924:	00178793          	addi	a5,a5,1
    80003928:	02077713          	andi	a4,a4,32
    8000392c:	fc071ae3          	bnez	a4,80003900 <uartintr+0x70>
    80003930:	01813083          	ld	ra,24(sp)
    80003934:	01013403          	ld	s0,16(sp)
    80003938:	00813483          	ld	s1,8(sp)
    8000393c:	02010113          	addi	sp,sp,32
    80003940:	00008067          	ret
    80003944:	00002617          	auipc	a2,0x2
    80003948:	0bc60613          	addi	a2,a2,188 # 80005a00 <uart_tx_r>
    8000394c:	00002517          	auipc	a0,0x2
    80003950:	0bc50513          	addi	a0,a0,188 # 80005a08 <uart_tx_w>
    80003954:	00063783          	ld	a5,0(a2)
    80003958:	00053703          	ld	a4,0(a0)
    8000395c:	04f70263          	beq	a4,a5,800039a0 <uartintr+0x110>
    80003960:	100005b7          	lui	a1,0x10000
    80003964:	00003817          	auipc	a6,0x3
    80003968:	32c80813          	addi	a6,a6,812 # 80006c90 <uart_tx_buf>
    8000396c:	01c0006f          	j	80003988 <uartintr+0xf8>
    80003970:	0006c703          	lbu	a4,0(a3)
    80003974:	00f63023          	sd	a5,0(a2)
    80003978:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000397c:	00063783          	ld	a5,0(a2)
    80003980:	00053703          	ld	a4,0(a0)
    80003984:	02f70063          	beq	a4,a5,800039a4 <uartintr+0x114>
    80003988:	01f7f713          	andi	a4,a5,31
    8000398c:	00e806b3          	add	a3,a6,a4
    80003990:	0055c703          	lbu	a4,5(a1)
    80003994:	00178793          	addi	a5,a5,1
    80003998:	02077713          	andi	a4,a4,32
    8000399c:	fc071ae3          	bnez	a4,80003970 <uartintr+0xe0>
    800039a0:	00008067          	ret
    800039a4:	00008067          	ret

00000000800039a8 <kinit>:
    800039a8:	fc010113          	addi	sp,sp,-64
    800039ac:	02913423          	sd	s1,40(sp)
    800039b0:	fffff7b7          	lui	a5,0xfffff
    800039b4:	00004497          	auipc	s1,0x4
    800039b8:	2fb48493          	addi	s1,s1,763 # 80007caf <end+0xfff>
    800039bc:	02813823          	sd	s0,48(sp)
    800039c0:	01313c23          	sd	s3,24(sp)
    800039c4:	00f4f4b3          	and	s1,s1,a5
    800039c8:	02113c23          	sd	ra,56(sp)
    800039cc:	03213023          	sd	s2,32(sp)
    800039d0:	01413823          	sd	s4,16(sp)
    800039d4:	01513423          	sd	s5,8(sp)
    800039d8:	04010413          	addi	s0,sp,64
    800039dc:	000017b7          	lui	a5,0x1
    800039e0:	01100993          	li	s3,17
    800039e4:	00f487b3          	add	a5,s1,a5
    800039e8:	01b99993          	slli	s3,s3,0x1b
    800039ec:	06f9e063          	bltu	s3,a5,80003a4c <kinit+0xa4>
    800039f0:	00003a97          	auipc	s5,0x3
    800039f4:	2c0a8a93          	addi	s5,s5,704 # 80006cb0 <end>
    800039f8:	0754ec63          	bltu	s1,s5,80003a70 <kinit+0xc8>
    800039fc:	0734fa63          	bgeu	s1,s3,80003a70 <kinit+0xc8>
    80003a00:	00088a37          	lui	s4,0x88
    80003a04:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003a08:	00002917          	auipc	s2,0x2
    80003a0c:	00890913          	addi	s2,s2,8 # 80005a10 <kmem>
    80003a10:	00ca1a13          	slli	s4,s4,0xc
    80003a14:	0140006f          	j	80003a28 <kinit+0x80>
    80003a18:	000017b7          	lui	a5,0x1
    80003a1c:	00f484b3          	add	s1,s1,a5
    80003a20:	0554e863          	bltu	s1,s5,80003a70 <kinit+0xc8>
    80003a24:	0534f663          	bgeu	s1,s3,80003a70 <kinit+0xc8>
    80003a28:	00001637          	lui	a2,0x1
    80003a2c:	00100593          	li	a1,1
    80003a30:	00048513          	mv	a0,s1
    80003a34:	00000097          	auipc	ra,0x0
    80003a38:	5e4080e7          	jalr	1508(ra) # 80004018 <__memset>
    80003a3c:	00093783          	ld	a5,0(s2)
    80003a40:	00f4b023          	sd	a5,0(s1)
    80003a44:	00993023          	sd	s1,0(s2)
    80003a48:	fd4498e3          	bne	s1,s4,80003a18 <kinit+0x70>
    80003a4c:	03813083          	ld	ra,56(sp)
    80003a50:	03013403          	ld	s0,48(sp)
    80003a54:	02813483          	ld	s1,40(sp)
    80003a58:	02013903          	ld	s2,32(sp)
    80003a5c:	01813983          	ld	s3,24(sp)
    80003a60:	01013a03          	ld	s4,16(sp)
    80003a64:	00813a83          	ld	s5,8(sp)
    80003a68:	04010113          	addi	sp,sp,64
    80003a6c:	00008067          	ret
    80003a70:	00002517          	auipc	a0,0x2
    80003a74:	81850513          	addi	a0,a0,-2024 # 80005288 <digits+0x18>
    80003a78:	fffff097          	auipc	ra,0xfffff
    80003a7c:	4b4080e7          	jalr	1204(ra) # 80002f2c <panic>

0000000080003a80 <freerange>:
    80003a80:	fc010113          	addi	sp,sp,-64
    80003a84:	000017b7          	lui	a5,0x1
    80003a88:	02913423          	sd	s1,40(sp)
    80003a8c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003a90:	009504b3          	add	s1,a0,s1
    80003a94:	fffff537          	lui	a0,0xfffff
    80003a98:	02813823          	sd	s0,48(sp)
    80003a9c:	02113c23          	sd	ra,56(sp)
    80003aa0:	03213023          	sd	s2,32(sp)
    80003aa4:	01313c23          	sd	s3,24(sp)
    80003aa8:	01413823          	sd	s4,16(sp)
    80003aac:	01513423          	sd	s5,8(sp)
    80003ab0:	01613023          	sd	s6,0(sp)
    80003ab4:	04010413          	addi	s0,sp,64
    80003ab8:	00a4f4b3          	and	s1,s1,a0
    80003abc:	00f487b3          	add	a5,s1,a5
    80003ac0:	06f5e463          	bltu	a1,a5,80003b28 <freerange+0xa8>
    80003ac4:	00003a97          	auipc	s5,0x3
    80003ac8:	1eca8a93          	addi	s5,s5,492 # 80006cb0 <end>
    80003acc:	0954e263          	bltu	s1,s5,80003b50 <freerange+0xd0>
    80003ad0:	01100993          	li	s3,17
    80003ad4:	01b99993          	slli	s3,s3,0x1b
    80003ad8:	0734fc63          	bgeu	s1,s3,80003b50 <freerange+0xd0>
    80003adc:	00058a13          	mv	s4,a1
    80003ae0:	00002917          	auipc	s2,0x2
    80003ae4:	f3090913          	addi	s2,s2,-208 # 80005a10 <kmem>
    80003ae8:	00002b37          	lui	s6,0x2
    80003aec:	0140006f          	j	80003b00 <freerange+0x80>
    80003af0:	000017b7          	lui	a5,0x1
    80003af4:	00f484b3          	add	s1,s1,a5
    80003af8:	0554ec63          	bltu	s1,s5,80003b50 <freerange+0xd0>
    80003afc:	0534fa63          	bgeu	s1,s3,80003b50 <freerange+0xd0>
    80003b00:	00001637          	lui	a2,0x1
    80003b04:	00100593          	li	a1,1
    80003b08:	00048513          	mv	a0,s1
    80003b0c:	00000097          	auipc	ra,0x0
    80003b10:	50c080e7          	jalr	1292(ra) # 80004018 <__memset>
    80003b14:	00093703          	ld	a4,0(s2)
    80003b18:	016487b3          	add	a5,s1,s6
    80003b1c:	00e4b023          	sd	a4,0(s1)
    80003b20:	00993023          	sd	s1,0(s2)
    80003b24:	fcfa76e3          	bgeu	s4,a5,80003af0 <freerange+0x70>
    80003b28:	03813083          	ld	ra,56(sp)
    80003b2c:	03013403          	ld	s0,48(sp)
    80003b30:	02813483          	ld	s1,40(sp)
    80003b34:	02013903          	ld	s2,32(sp)
    80003b38:	01813983          	ld	s3,24(sp)
    80003b3c:	01013a03          	ld	s4,16(sp)
    80003b40:	00813a83          	ld	s5,8(sp)
    80003b44:	00013b03          	ld	s6,0(sp)
    80003b48:	04010113          	addi	sp,sp,64
    80003b4c:	00008067          	ret
    80003b50:	00001517          	auipc	a0,0x1
    80003b54:	73850513          	addi	a0,a0,1848 # 80005288 <digits+0x18>
    80003b58:	fffff097          	auipc	ra,0xfffff
    80003b5c:	3d4080e7          	jalr	980(ra) # 80002f2c <panic>

0000000080003b60 <kfree>:
    80003b60:	fe010113          	addi	sp,sp,-32
    80003b64:	00813823          	sd	s0,16(sp)
    80003b68:	00113c23          	sd	ra,24(sp)
    80003b6c:	00913423          	sd	s1,8(sp)
    80003b70:	02010413          	addi	s0,sp,32
    80003b74:	03451793          	slli	a5,a0,0x34
    80003b78:	04079c63          	bnez	a5,80003bd0 <kfree+0x70>
    80003b7c:	00003797          	auipc	a5,0x3
    80003b80:	13478793          	addi	a5,a5,308 # 80006cb0 <end>
    80003b84:	00050493          	mv	s1,a0
    80003b88:	04f56463          	bltu	a0,a5,80003bd0 <kfree+0x70>
    80003b8c:	01100793          	li	a5,17
    80003b90:	01b79793          	slli	a5,a5,0x1b
    80003b94:	02f57e63          	bgeu	a0,a5,80003bd0 <kfree+0x70>
    80003b98:	00001637          	lui	a2,0x1
    80003b9c:	00100593          	li	a1,1
    80003ba0:	00000097          	auipc	ra,0x0
    80003ba4:	478080e7          	jalr	1144(ra) # 80004018 <__memset>
    80003ba8:	00002797          	auipc	a5,0x2
    80003bac:	e6878793          	addi	a5,a5,-408 # 80005a10 <kmem>
    80003bb0:	0007b703          	ld	a4,0(a5)
    80003bb4:	01813083          	ld	ra,24(sp)
    80003bb8:	01013403          	ld	s0,16(sp)
    80003bbc:	00e4b023          	sd	a4,0(s1)
    80003bc0:	0097b023          	sd	s1,0(a5)
    80003bc4:	00813483          	ld	s1,8(sp)
    80003bc8:	02010113          	addi	sp,sp,32
    80003bcc:	00008067          	ret
    80003bd0:	00001517          	auipc	a0,0x1
    80003bd4:	6b850513          	addi	a0,a0,1720 # 80005288 <digits+0x18>
    80003bd8:	fffff097          	auipc	ra,0xfffff
    80003bdc:	354080e7          	jalr	852(ra) # 80002f2c <panic>

0000000080003be0 <kalloc>:
    80003be0:	fe010113          	addi	sp,sp,-32
    80003be4:	00813823          	sd	s0,16(sp)
    80003be8:	00913423          	sd	s1,8(sp)
    80003bec:	00113c23          	sd	ra,24(sp)
    80003bf0:	02010413          	addi	s0,sp,32
    80003bf4:	00002797          	auipc	a5,0x2
    80003bf8:	e1c78793          	addi	a5,a5,-484 # 80005a10 <kmem>
    80003bfc:	0007b483          	ld	s1,0(a5)
    80003c00:	02048063          	beqz	s1,80003c20 <kalloc+0x40>
    80003c04:	0004b703          	ld	a4,0(s1)
    80003c08:	00001637          	lui	a2,0x1
    80003c0c:	00500593          	li	a1,5
    80003c10:	00048513          	mv	a0,s1
    80003c14:	00e7b023          	sd	a4,0(a5)
    80003c18:	00000097          	auipc	ra,0x0
    80003c1c:	400080e7          	jalr	1024(ra) # 80004018 <__memset>
    80003c20:	01813083          	ld	ra,24(sp)
    80003c24:	01013403          	ld	s0,16(sp)
    80003c28:	00048513          	mv	a0,s1
    80003c2c:	00813483          	ld	s1,8(sp)
    80003c30:	02010113          	addi	sp,sp,32
    80003c34:	00008067          	ret

0000000080003c38 <initlock>:
    80003c38:	ff010113          	addi	sp,sp,-16
    80003c3c:	00813423          	sd	s0,8(sp)
    80003c40:	01010413          	addi	s0,sp,16
    80003c44:	00813403          	ld	s0,8(sp)
    80003c48:	00b53423          	sd	a1,8(a0)
    80003c4c:	00052023          	sw	zero,0(a0)
    80003c50:	00053823          	sd	zero,16(a0)
    80003c54:	01010113          	addi	sp,sp,16
    80003c58:	00008067          	ret

0000000080003c5c <acquire>:
    80003c5c:	fe010113          	addi	sp,sp,-32
    80003c60:	00813823          	sd	s0,16(sp)
    80003c64:	00913423          	sd	s1,8(sp)
    80003c68:	00113c23          	sd	ra,24(sp)
    80003c6c:	01213023          	sd	s2,0(sp)
    80003c70:	02010413          	addi	s0,sp,32
    80003c74:	00050493          	mv	s1,a0
    80003c78:	10002973          	csrr	s2,sstatus
    80003c7c:	100027f3          	csrr	a5,sstatus
    80003c80:	ffd7f793          	andi	a5,a5,-3
    80003c84:	10079073          	csrw	sstatus,a5
    80003c88:	fffff097          	auipc	ra,0xfffff
    80003c8c:	8e4080e7          	jalr	-1820(ra) # 8000256c <mycpu>
    80003c90:	07852783          	lw	a5,120(a0)
    80003c94:	06078e63          	beqz	a5,80003d10 <acquire+0xb4>
    80003c98:	fffff097          	auipc	ra,0xfffff
    80003c9c:	8d4080e7          	jalr	-1836(ra) # 8000256c <mycpu>
    80003ca0:	07852783          	lw	a5,120(a0)
    80003ca4:	0004a703          	lw	a4,0(s1)
    80003ca8:	0017879b          	addiw	a5,a5,1
    80003cac:	06f52c23          	sw	a5,120(a0)
    80003cb0:	04071063          	bnez	a4,80003cf0 <acquire+0x94>
    80003cb4:	00100713          	li	a4,1
    80003cb8:	00070793          	mv	a5,a4
    80003cbc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003cc0:	0007879b          	sext.w	a5,a5
    80003cc4:	fe079ae3          	bnez	a5,80003cb8 <acquire+0x5c>
    80003cc8:	0ff0000f          	fence
    80003ccc:	fffff097          	auipc	ra,0xfffff
    80003cd0:	8a0080e7          	jalr	-1888(ra) # 8000256c <mycpu>
    80003cd4:	01813083          	ld	ra,24(sp)
    80003cd8:	01013403          	ld	s0,16(sp)
    80003cdc:	00a4b823          	sd	a0,16(s1)
    80003ce0:	00013903          	ld	s2,0(sp)
    80003ce4:	00813483          	ld	s1,8(sp)
    80003ce8:	02010113          	addi	sp,sp,32
    80003cec:	00008067          	ret
    80003cf0:	0104b903          	ld	s2,16(s1)
    80003cf4:	fffff097          	auipc	ra,0xfffff
    80003cf8:	878080e7          	jalr	-1928(ra) # 8000256c <mycpu>
    80003cfc:	faa91ce3          	bne	s2,a0,80003cb4 <acquire+0x58>
    80003d00:	00001517          	auipc	a0,0x1
    80003d04:	59050513          	addi	a0,a0,1424 # 80005290 <digits+0x20>
    80003d08:	fffff097          	auipc	ra,0xfffff
    80003d0c:	224080e7          	jalr	548(ra) # 80002f2c <panic>
    80003d10:	00195913          	srli	s2,s2,0x1
    80003d14:	fffff097          	auipc	ra,0xfffff
    80003d18:	858080e7          	jalr	-1960(ra) # 8000256c <mycpu>
    80003d1c:	00197913          	andi	s2,s2,1
    80003d20:	07252e23          	sw	s2,124(a0)
    80003d24:	f75ff06f          	j	80003c98 <acquire+0x3c>

0000000080003d28 <release>:
    80003d28:	fe010113          	addi	sp,sp,-32
    80003d2c:	00813823          	sd	s0,16(sp)
    80003d30:	00113c23          	sd	ra,24(sp)
    80003d34:	00913423          	sd	s1,8(sp)
    80003d38:	01213023          	sd	s2,0(sp)
    80003d3c:	02010413          	addi	s0,sp,32
    80003d40:	00052783          	lw	a5,0(a0)
    80003d44:	00079a63          	bnez	a5,80003d58 <release+0x30>
    80003d48:	00001517          	auipc	a0,0x1
    80003d4c:	55050513          	addi	a0,a0,1360 # 80005298 <digits+0x28>
    80003d50:	fffff097          	auipc	ra,0xfffff
    80003d54:	1dc080e7          	jalr	476(ra) # 80002f2c <panic>
    80003d58:	01053903          	ld	s2,16(a0)
    80003d5c:	00050493          	mv	s1,a0
    80003d60:	fffff097          	auipc	ra,0xfffff
    80003d64:	80c080e7          	jalr	-2036(ra) # 8000256c <mycpu>
    80003d68:	fea910e3          	bne	s2,a0,80003d48 <release+0x20>
    80003d6c:	0004b823          	sd	zero,16(s1)
    80003d70:	0ff0000f          	fence
    80003d74:	0f50000f          	fence	iorw,ow
    80003d78:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003d7c:	ffffe097          	auipc	ra,0xffffe
    80003d80:	7f0080e7          	jalr	2032(ra) # 8000256c <mycpu>
    80003d84:	100027f3          	csrr	a5,sstatus
    80003d88:	0027f793          	andi	a5,a5,2
    80003d8c:	04079a63          	bnez	a5,80003de0 <release+0xb8>
    80003d90:	07852783          	lw	a5,120(a0)
    80003d94:	02f05e63          	blez	a5,80003dd0 <release+0xa8>
    80003d98:	fff7871b          	addiw	a4,a5,-1
    80003d9c:	06e52c23          	sw	a4,120(a0)
    80003da0:	00071c63          	bnez	a4,80003db8 <release+0x90>
    80003da4:	07c52783          	lw	a5,124(a0)
    80003da8:	00078863          	beqz	a5,80003db8 <release+0x90>
    80003dac:	100027f3          	csrr	a5,sstatus
    80003db0:	0027e793          	ori	a5,a5,2
    80003db4:	10079073          	csrw	sstatus,a5
    80003db8:	01813083          	ld	ra,24(sp)
    80003dbc:	01013403          	ld	s0,16(sp)
    80003dc0:	00813483          	ld	s1,8(sp)
    80003dc4:	00013903          	ld	s2,0(sp)
    80003dc8:	02010113          	addi	sp,sp,32
    80003dcc:	00008067          	ret
    80003dd0:	00001517          	auipc	a0,0x1
    80003dd4:	4e850513          	addi	a0,a0,1256 # 800052b8 <digits+0x48>
    80003dd8:	fffff097          	auipc	ra,0xfffff
    80003ddc:	154080e7          	jalr	340(ra) # 80002f2c <panic>
    80003de0:	00001517          	auipc	a0,0x1
    80003de4:	4c050513          	addi	a0,a0,1216 # 800052a0 <digits+0x30>
    80003de8:	fffff097          	auipc	ra,0xfffff
    80003dec:	144080e7          	jalr	324(ra) # 80002f2c <panic>

0000000080003df0 <holding>:
    80003df0:	00052783          	lw	a5,0(a0)
    80003df4:	00079663          	bnez	a5,80003e00 <holding+0x10>
    80003df8:	00000513          	li	a0,0
    80003dfc:	00008067          	ret
    80003e00:	fe010113          	addi	sp,sp,-32
    80003e04:	00813823          	sd	s0,16(sp)
    80003e08:	00913423          	sd	s1,8(sp)
    80003e0c:	00113c23          	sd	ra,24(sp)
    80003e10:	02010413          	addi	s0,sp,32
    80003e14:	01053483          	ld	s1,16(a0)
    80003e18:	ffffe097          	auipc	ra,0xffffe
    80003e1c:	754080e7          	jalr	1876(ra) # 8000256c <mycpu>
    80003e20:	01813083          	ld	ra,24(sp)
    80003e24:	01013403          	ld	s0,16(sp)
    80003e28:	40a48533          	sub	a0,s1,a0
    80003e2c:	00153513          	seqz	a0,a0
    80003e30:	00813483          	ld	s1,8(sp)
    80003e34:	02010113          	addi	sp,sp,32
    80003e38:	00008067          	ret

0000000080003e3c <push_off>:
    80003e3c:	fe010113          	addi	sp,sp,-32
    80003e40:	00813823          	sd	s0,16(sp)
    80003e44:	00113c23          	sd	ra,24(sp)
    80003e48:	00913423          	sd	s1,8(sp)
    80003e4c:	02010413          	addi	s0,sp,32
    80003e50:	100024f3          	csrr	s1,sstatus
    80003e54:	100027f3          	csrr	a5,sstatus
    80003e58:	ffd7f793          	andi	a5,a5,-3
    80003e5c:	10079073          	csrw	sstatus,a5
    80003e60:	ffffe097          	auipc	ra,0xffffe
    80003e64:	70c080e7          	jalr	1804(ra) # 8000256c <mycpu>
    80003e68:	07852783          	lw	a5,120(a0)
    80003e6c:	02078663          	beqz	a5,80003e98 <push_off+0x5c>
    80003e70:	ffffe097          	auipc	ra,0xffffe
    80003e74:	6fc080e7          	jalr	1788(ra) # 8000256c <mycpu>
    80003e78:	07852783          	lw	a5,120(a0)
    80003e7c:	01813083          	ld	ra,24(sp)
    80003e80:	01013403          	ld	s0,16(sp)
    80003e84:	0017879b          	addiw	a5,a5,1
    80003e88:	06f52c23          	sw	a5,120(a0)
    80003e8c:	00813483          	ld	s1,8(sp)
    80003e90:	02010113          	addi	sp,sp,32
    80003e94:	00008067          	ret
    80003e98:	0014d493          	srli	s1,s1,0x1
    80003e9c:	ffffe097          	auipc	ra,0xffffe
    80003ea0:	6d0080e7          	jalr	1744(ra) # 8000256c <mycpu>
    80003ea4:	0014f493          	andi	s1,s1,1
    80003ea8:	06952e23          	sw	s1,124(a0)
    80003eac:	fc5ff06f          	j	80003e70 <push_off+0x34>

0000000080003eb0 <pop_off>:
    80003eb0:	ff010113          	addi	sp,sp,-16
    80003eb4:	00813023          	sd	s0,0(sp)
    80003eb8:	00113423          	sd	ra,8(sp)
    80003ebc:	01010413          	addi	s0,sp,16
    80003ec0:	ffffe097          	auipc	ra,0xffffe
    80003ec4:	6ac080e7          	jalr	1708(ra) # 8000256c <mycpu>
    80003ec8:	100027f3          	csrr	a5,sstatus
    80003ecc:	0027f793          	andi	a5,a5,2
    80003ed0:	04079663          	bnez	a5,80003f1c <pop_off+0x6c>
    80003ed4:	07852783          	lw	a5,120(a0)
    80003ed8:	02f05a63          	blez	a5,80003f0c <pop_off+0x5c>
    80003edc:	fff7871b          	addiw	a4,a5,-1
    80003ee0:	06e52c23          	sw	a4,120(a0)
    80003ee4:	00071c63          	bnez	a4,80003efc <pop_off+0x4c>
    80003ee8:	07c52783          	lw	a5,124(a0)
    80003eec:	00078863          	beqz	a5,80003efc <pop_off+0x4c>
    80003ef0:	100027f3          	csrr	a5,sstatus
    80003ef4:	0027e793          	ori	a5,a5,2
    80003ef8:	10079073          	csrw	sstatus,a5
    80003efc:	00813083          	ld	ra,8(sp)
    80003f00:	00013403          	ld	s0,0(sp)
    80003f04:	01010113          	addi	sp,sp,16
    80003f08:	00008067          	ret
    80003f0c:	00001517          	auipc	a0,0x1
    80003f10:	3ac50513          	addi	a0,a0,940 # 800052b8 <digits+0x48>
    80003f14:	fffff097          	auipc	ra,0xfffff
    80003f18:	018080e7          	jalr	24(ra) # 80002f2c <panic>
    80003f1c:	00001517          	auipc	a0,0x1
    80003f20:	38450513          	addi	a0,a0,900 # 800052a0 <digits+0x30>
    80003f24:	fffff097          	auipc	ra,0xfffff
    80003f28:	008080e7          	jalr	8(ra) # 80002f2c <panic>

0000000080003f2c <push_on>:
    80003f2c:	fe010113          	addi	sp,sp,-32
    80003f30:	00813823          	sd	s0,16(sp)
    80003f34:	00113c23          	sd	ra,24(sp)
    80003f38:	00913423          	sd	s1,8(sp)
    80003f3c:	02010413          	addi	s0,sp,32
    80003f40:	100024f3          	csrr	s1,sstatus
    80003f44:	100027f3          	csrr	a5,sstatus
    80003f48:	0027e793          	ori	a5,a5,2
    80003f4c:	10079073          	csrw	sstatus,a5
    80003f50:	ffffe097          	auipc	ra,0xffffe
    80003f54:	61c080e7          	jalr	1564(ra) # 8000256c <mycpu>
    80003f58:	07852783          	lw	a5,120(a0)
    80003f5c:	02078663          	beqz	a5,80003f88 <push_on+0x5c>
    80003f60:	ffffe097          	auipc	ra,0xffffe
    80003f64:	60c080e7          	jalr	1548(ra) # 8000256c <mycpu>
    80003f68:	07852783          	lw	a5,120(a0)
    80003f6c:	01813083          	ld	ra,24(sp)
    80003f70:	01013403          	ld	s0,16(sp)
    80003f74:	0017879b          	addiw	a5,a5,1
    80003f78:	06f52c23          	sw	a5,120(a0)
    80003f7c:	00813483          	ld	s1,8(sp)
    80003f80:	02010113          	addi	sp,sp,32
    80003f84:	00008067          	ret
    80003f88:	0014d493          	srli	s1,s1,0x1
    80003f8c:	ffffe097          	auipc	ra,0xffffe
    80003f90:	5e0080e7          	jalr	1504(ra) # 8000256c <mycpu>
    80003f94:	0014f493          	andi	s1,s1,1
    80003f98:	06952e23          	sw	s1,124(a0)
    80003f9c:	fc5ff06f          	j	80003f60 <push_on+0x34>

0000000080003fa0 <pop_on>:
    80003fa0:	ff010113          	addi	sp,sp,-16
    80003fa4:	00813023          	sd	s0,0(sp)
    80003fa8:	00113423          	sd	ra,8(sp)
    80003fac:	01010413          	addi	s0,sp,16
    80003fb0:	ffffe097          	auipc	ra,0xffffe
    80003fb4:	5bc080e7          	jalr	1468(ra) # 8000256c <mycpu>
    80003fb8:	100027f3          	csrr	a5,sstatus
    80003fbc:	0027f793          	andi	a5,a5,2
    80003fc0:	04078463          	beqz	a5,80004008 <pop_on+0x68>
    80003fc4:	07852783          	lw	a5,120(a0)
    80003fc8:	02f05863          	blez	a5,80003ff8 <pop_on+0x58>
    80003fcc:	fff7879b          	addiw	a5,a5,-1
    80003fd0:	06f52c23          	sw	a5,120(a0)
    80003fd4:	07853783          	ld	a5,120(a0)
    80003fd8:	00079863          	bnez	a5,80003fe8 <pop_on+0x48>
    80003fdc:	100027f3          	csrr	a5,sstatus
    80003fe0:	ffd7f793          	andi	a5,a5,-3
    80003fe4:	10079073          	csrw	sstatus,a5
    80003fe8:	00813083          	ld	ra,8(sp)
    80003fec:	00013403          	ld	s0,0(sp)
    80003ff0:	01010113          	addi	sp,sp,16
    80003ff4:	00008067          	ret
    80003ff8:	00001517          	auipc	a0,0x1
    80003ffc:	2e850513          	addi	a0,a0,744 # 800052e0 <digits+0x70>
    80004000:	fffff097          	auipc	ra,0xfffff
    80004004:	f2c080e7          	jalr	-212(ra) # 80002f2c <panic>
    80004008:	00001517          	auipc	a0,0x1
    8000400c:	2b850513          	addi	a0,a0,696 # 800052c0 <digits+0x50>
    80004010:	fffff097          	auipc	ra,0xfffff
    80004014:	f1c080e7          	jalr	-228(ra) # 80002f2c <panic>

0000000080004018 <__memset>:
    80004018:	ff010113          	addi	sp,sp,-16
    8000401c:	00813423          	sd	s0,8(sp)
    80004020:	01010413          	addi	s0,sp,16
    80004024:	1a060e63          	beqz	a2,800041e0 <__memset+0x1c8>
    80004028:	40a007b3          	neg	a5,a0
    8000402c:	0077f793          	andi	a5,a5,7
    80004030:	00778693          	addi	a3,a5,7
    80004034:	00b00813          	li	a6,11
    80004038:	0ff5f593          	andi	a1,a1,255
    8000403c:	fff6071b          	addiw	a4,a2,-1
    80004040:	1b06e663          	bltu	a3,a6,800041ec <__memset+0x1d4>
    80004044:	1cd76463          	bltu	a4,a3,8000420c <__memset+0x1f4>
    80004048:	1a078e63          	beqz	a5,80004204 <__memset+0x1ec>
    8000404c:	00b50023          	sb	a1,0(a0)
    80004050:	00100713          	li	a4,1
    80004054:	1ae78463          	beq	a5,a4,800041fc <__memset+0x1e4>
    80004058:	00b500a3          	sb	a1,1(a0)
    8000405c:	00200713          	li	a4,2
    80004060:	1ae78a63          	beq	a5,a4,80004214 <__memset+0x1fc>
    80004064:	00b50123          	sb	a1,2(a0)
    80004068:	00300713          	li	a4,3
    8000406c:	18e78463          	beq	a5,a4,800041f4 <__memset+0x1dc>
    80004070:	00b501a3          	sb	a1,3(a0)
    80004074:	00400713          	li	a4,4
    80004078:	1ae78263          	beq	a5,a4,8000421c <__memset+0x204>
    8000407c:	00b50223          	sb	a1,4(a0)
    80004080:	00500713          	li	a4,5
    80004084:	1ae78063          	beq	a5,a4,80004224 <__memset+0x20c>
    80004088:	00b502a3          	sb	a1,5(a0)
    8000408c:	00700713          	li	a4,7
    80004090:	18e79e63          	bne	a5,a4,8000422c <__memset+0x214>
    80004094:	00b50323          	sb	a1,6(a0)
    80004098:	00700e93          	li	t4,7
    8000409c:	00859713          	slli	a4,a1,0x8
    800040a0:	00e5e733          	or	a4,a1,a4
    800040a4:	01059e13          	slli	t3,a1,0x10
    800040a8:	01c76e33          	or	t3,a4,t3
    800040ac:	01859313          	slli	t1,a1,0x18
    800040b0:	006e6333          	or	t1,t3,t1
    800040b4:	02059893          	slli	a7,a1,0x20
    800040b8:	40f60e3b          	subw	t3,a2,a5
    800040bc:	011368b3          	or	a7,t1,a7
    800040c0:	02859813          	slli	a6,a1,0x28
    800040c4:	0108e833          	or	a6,a7,a6
    800040c8:	03059693          	slli	a3,a1,0x30
    800040cc:	003e589b          	srliw	a7,t3,0x3
    800040d0:	00d866b3          	or	a3,a6,a3
    800040d4:	03859713          	slli	a4,a1,0x38
    800040d8:	00389813          	slli	a6,a7,0x3
    800040dc:	00f507b3          	add	a5,a0,a5
    800040e0:	00e6e733          	or	a4,a3,a4
    800040e4:	000e089b          	sext.w	a7,t3
    800040e8:	00f806b3          	add	a3,a6,a5
    800040ec:	00e7b023          	sd	a4,0(a5)
    800040f0:	00878793          	addi	a5,a5,8
    800040f4:	fed79ce3          	bne	a5,a3,800040ec <__memset+0xd4>
    800040f8:	ff8e7793          	andi	a5,t3,-8
    800040fc:	0007871b          	sext.w	a4,a5
    80004100:	01d787bb          	addw	a5,a5,t4
    80004104:	0ce88e63          	beq	a7,a4,800041e0 <__memset+0x1c8>
    80004108:	00f50733          	add	a4,a0,a5
    8000410c:	00b70023          	sb	a1,0(a4)
    80004110:	0017871b          	addiw	a4,a5,1
    80004114:	0cc77663          	bgeu	a4,a2,800041e0 <__memset+0x1c8>
    80004118:	00e50733          	add	a4,a0,a4
    8000411c:	00b70023          	sb	a1,0(a4)
    80004120:	0027871b          	addiw	a4,a5,2
    80004124:	0ac77e63          	bgeu	a4,a2,800041e0 <__memset+0x1c8>
    80004128:	00e50733          	add	a4,a0,a4
    8000412c:	00b70023          	sb	a1,0(a4)
    80004130:	0037871b          	addiw	a4,a5,3
    80004134:	0ac77663          	bgeu	a4,a2,800041e0 <__memset+0x1c8>
    80004138:	00e50733          	add	a4,a0,a4
    8000413c:	00b70023          	sb	a1,0(a4)
    80004140:	0047871b          	addiw	a4,a5,4
    80004144:	08c77e63          	bgeu	a4,a2,800041e0 <__memset+0x1c8>
    80004148:	00e50733          	add	a4,a0,a4
    8000414c:	00b70023          	sb	a1,0(a4)
    80004150:	0057871b          	addiw	a4,a5,5
    80004154:	08c77663          	bgeu	a4,a2,800041e0 <__memset+0x1c8>
    80004158:	00e50733          	add	a4,a0,a4
    8000415c:	00b70023          	sb	a1,0(a4)
    80004160:	0067871b          	addiw	a4,a5,6
    80004164:	06c77e63          	bgeu	a4,a2,800041e0 <__memset+0x1c8>
    80004168:	00e50733          	add	a4,a0,a4
    8000416c:	00b70023          	sb	a1,0(a4)
    80004170:	0077871b          	addiw	a4,a5,7
    80004174:	06c77663          	bgeu	a4,a2,800041e0 <__memset+0x1c8>
    80004178:	00e50733          	add	a4,a0,a4
    8000417c:	00b70023          	sb	a1,0(a4)
    80004180:	0087871b          	addiw	a4,a5,8
    80004184:	04c77e63          	bgeu	a4,a2,800041e0 <__memset+0x1c8>
    80004188:	00e50733          	add	a4,a0,a4
    8000418c:	00b70023          	sb	a1,0(a4)
    80004190:	0097871b          	addiw	a4,a5,9
    80004194:	04c77663          	bgeu	a4,a2,800041e0 <__memset+0x1c8>
    80004198:	00e50733          	add	a4,a0,a4
    8000419c:	00b70023          	sb	a1,0(a4)
    800041a0:	00a7871b          	addiw	a4,a5,10
    800041a4:	02c77e63          	bgeu	a4,a2,800041e0 <__memset+0x1c8>
    800041a8:	00e50733          	add	a4,a0,a4
    800041ac:	00b70023          	sb	a1,0(a4)
    800041b0:	00b7871b          	addiw	a4,a5,11
    800041b4:	02c77663          	bgeu	a4,a2,800041e0 <__memset+0x1c8>
    800041b8:	00e50733          	add	a4,a0,a4
    800041bc:	00b70023          	sb	a1,0(a4)
    800041c0:	00c7871b          	addiw	a4,a5,12
    800041c4:	00c77e63          	bgeu	a4,a2,800041e0 <__memset+0x1c8>
    800041c8:	00e50733          	add	a4,a0,a4
    800041cc:	00b70023          	sb	a1,0(a4)
    800041d0:	00d7879b          	addiw	a5,a5,13
    800041d4:	00c7f663          	bgeu	a5,a2,800041e0 <__memset+0x1c8>
    800041d8:	00f507b3          	add	a5,a0,a5
    800041dc:	00b78023          	sb	a1,0(a5)
    800041e0:	00813403          	ld	s0,8(sp)
    800041e4:	01010113          	addi	sp,sp,16
    800041e8:	00008067          	ret
    800041ec:	00b00693          	li	a3,11
    800041f0:	e55ff06f          	j	80004044 <__memset+0x2c>
    800041f4:	00300e93          	li	t4,3
    800041f8:	ea5ff06f          	j	8000409c <__memset+0x84>
    800041fc:	00100e93          	li	t4,1
    80004200:	e9dff06f          	j	8000409c <__memset+0x84>
    80004204:	00000e93          	li	t4,0
    80004208:	e95ff06f          	j	8000409c <__memset+0x84>
    8000420c:	00000793          	li	a5,0
    80004210:	ef9ff06f          	j	80004108 <__memset+0xf0>
    80004214:	00200e93          	li	t4,2
    80004218:	e85ff06f          	j	8000409c <__memset+0x84>
    8000421c:	00400e93          	li	t4,4
    80004220:	e7dff06f          	j	8000409c <__memset+0x84>
    80004224:	00500e93          	li	t4,5
    80004228:	e75ff06f          	j	8000409c <__memset+0x84>
    8000422c:	00600e93          	li	t4,6
    80004230:	e6dff06f          	j	8000409c <__memset+0x84>

0000000080004234 <__memmove>:
    80004234:	ff010113          	addi	sp,sp,-16
    80004238:	00813423          	sd	s0,8(sp)
    8000423c:	01010413          	addi	s0,sp,16
    80004240:	0e060863          	beqz	a2,80004330 <__memmove+0xfc>
    80004244:	fff6069b          	addiw	a3,a2,-1
    80004248:	0006881b          	sext.w	a6,a3
    8000424c:	0ea5e863          	bltu	a1,a0,8000433c <__memmove+0x108>
    80004250:	00758713          	addi	a4,a1,7
    80004254:	00a5e7b3          	or	a5,a1,a0
    80004258:	40a70733          	sub	a4,a4,a0
    8000425c:	0077f793          	andi	a5,a5,7
    80004260:	00f73713          	sltiu	a4,a4,15
    80004264:	00174713          	xori	a4,a4,1
    80004268:	0017b793          	seqz	a5,a5
    8000426c:	00e7f7b3          	and	a5,a5,a4
    80004270:	10078863          	beqz	a5,80004380 <__memmove+0x14c>
    80004274:	00900793          	li	a5,9
    80004278:	1107f463          	bgeu	a5,a6,80004380 <__memmove+0x14c>
    8000427c:	0036581b          	srliw	a6,a2,0x3
    80004280:	fff8081b          	addiw	a6,a6,-1
    80004284:	02081813          	slli	a6,a6,0x20
    80004288:	01d85893          	srli	a7,a6,0x1d
    8000428c:	00858813          	addi	a6,a1,8
    80004290:	00058793          	mv	a5,a1
    80004294:	00050713          	mv	a4,a0
    80004298:	01088833          	add	a6,a7,a6
    8000429c:	0007b883          	ld	a7,0(a5)
    800042a0:	00878793          	addi	a5,a5,8
    800042a4:	00870713          	addi	a4,a4,8
    800042a8:	ff173c23          	sd	a7,-8(a4)
    800042ac:	ff0798e3          	bne	a5,a6,8000429c <__memmove+0x68>
    800042b0:	ff867713          	andi	a4,a2,-8
    800042b4:	02071793          	slli	a5,a4,0x20
    800042b8:	0207d793          	srli	a5,a5,0x20
    800042bc:	00f585b3          	add	a1,a1,a5
    800042c0:	40e686bb          	subw	a3,a3,a4
    800042c4:	00f507b3          	add	a5,a0,a5
    800042c8:	06e60463          	beq	a2,a4,80004330 <__memmove+0xfc>
    800042cc:	0005c703          	lbu	a4,0(a1)
    800042d0:	00e78023          	sb	a4,0(a5)
    800042d4:	04068e63          	beqz	a3,80004330 <__memmove+0xfc>
    800042d8:	0015c603          	lbu	a2,1(a1)
    800042dc:	00100713          	li	a4,1
    800042e0:	00c780a3          	sb	a2,1(a5)
    800042e4:	04e68663          	beq	a3,a4,80004330 <__memmove+0xfc>
    800042e8:	0025c603          	lbu	a2,2(a1)
    800042ec:	00200713          	li	a4,2
    800042f0:	00c78123          	sb	a2,2(a5)
    800042f4:	02e68e63          	beq	a3,a4,80004330 <__memmove+0xfc>
    800042f8:	0035c603          	lbu	a2,3(a1)
    800042fc:	00300713          	li	a4,3
    80004300:	00c781a3          	sb	a2,3(a5)
    80004304:	02e68663          	beq	a3,a4,80004330 <__memmove+0xfc>
    80004308:	0045c603          	lbu	a2,4(a1)
    8000430c:	00400713          	li	a4,4
    80004310:	00c78223          	sb	a2,4(a5)
    80004314:	00e68e63          	beq	a3,a4,80004330 <__memmove+0xfc>
    80004318:	0055c603          	lbu	a2,5(a1)
    8000431c:	00500713          	li	a4,5
    80004320:	00c782a3          	sb	a2,5(a5)
    80004324:	00e68663          	beq	a3,a4,80004330 <__memmove+0xfc>
    80004328:	0065c703          	lbu	a4,6(a1)
    8000432c:	00e78323          	sb	a4,6(a5)
    80004330:	00813403          	ld	s0,8(sp)
    80004334:	01010113          	addi	sp,sp,16
    80004338:	00008067          	ret
    8000433c:	02061713          	slli	a4,a2,0x20
    80004340:	02075713          	srli	a4,a4,0x20
    80004344:	00e587b3          	add	a5,a1,a4
    80004348:	f0f574e3          	bgeu	a0,a5,80004250 <__memmove+0x1c>
    8000434c:	02069613          	slli	a2,a3,0x20
    80004350:	02065613          	srli	a2,a2,0x20
    80004354:	fff64613          	not	a2,a2
    80004358:	00e50733          	add	a4,a0,a4
    8000435c:	00c78633          	add	a2,a5,a2
    80004360:	fff7c683          	lbu	a3,-1(a5)
    80004364:	fff78793          	addi	a5,a5,-1
    80004368:	fff70713          	addi	a4,a4,-1
    8000436c:	00d70023          	sb	a3,0(a4)
    80004370:	fec798e3          	bne	a5,a2,80004360 <__memmove+0x12c>
    80004374:	00813403          	ld	s0,8(sp)
    80004378:	01010113          	addi	sp,sp,16
    8000437c:	00008067          	ret
    80004380:	02069713          	slli	a4,a3,0x20
    80004384:	02075713          	srli	a4,a4,0x20
    80004388:	00170713          	addi	a4,a4,1
    8000438c:	00e50733          	add	a4,a0,a4
    80004390:	00050793          	mv	a5,a0
    80004394:	0005c683          	lbu	a3,0(a1)
    80004398:	00178793          	addi	a5,a5,1
    8000439c:	00158593          	addi	a1,a1,1
    800043a0:	fed78fa3          	sb	a3,-1(a5)
    800043a4:	fee798e3          	bne	a5,a4,80004394 <__memmove+0x160>
    800043a8:	f89ff06f          	j	80004330 <__memmove+0xfc>

00000000800043ac <__putc>:
    800043ac:	fe010113          	addi	sp,sp,-32
    800043b0:	00813823          	sd	s0,16(sp)
    800043b4:	00113c23          	sd	ra,24(sp)
    800043b8:	02010413          	addi	s0,sp,32
    800043bc:	00050793          	mv	a5,a0
    800043c0:	fef40593          	addi	a1,s0,-17
    800043c4:	00100613          	li	a2,1
    800043c8:	00000513          	li	a0,0
    800043cc:	fef407a3          	sb	a5,-17(s0)
    800043d0:	fffff097          	auipc	ra,0xfffff
    800043d4:	b3c080e7          	jalr	-1220(ra) # 80002f0c <console_write>
    800043d8:	01813083          	ld	ra,24(sp)
    800043dc:	01013403          	ld	s0,16(sp)
    800043e0:	02010113          	addi	sp,sp,32
    800043e4:	00008067          	ret

00000000800043e8 <__getc>:
    800043e8:	fe010113          	addi	sp,sp,-32
    800043ec:	00813823          	sd	s0,16(sp)
    800043f0:	00113c23          	sd	ra,24(sp)
    800043f4:	02010413          	addi	s0,sp,32
    800043f8:	fe840593          	addi	a1,s0,-24
    800043fc:	00100613          	li	a2,1
    80004400:	00000513          	li	a0,0
    80004404:	fffff097          	auipc	ra,0xfffff
    80004408:	ae8080e7          	jalr	-1304(ra) # 80002eec <console_read>
    8000440c:	fe844503          	lbu	a0,-24(s0)
    80004410:	01813083          	ld	ra,24(sp)
    80004414:	01013403          	ld	s0,16(sp)
    80004418:	02010113          	addi	sp,sp,32
    8000441c:	00008067          	ret

0000000080004420 <console_handler>:
    80004420:	fe010113          	addi	sp,sp,-32
    80004424:	00813823          	sd	s0,16(sp)
    80004428:	00113c23          	sd	ra,24(sp)
    8000442c:	00913423          	sd	s1,8(sp)
    80004430:	02010413          	addi	s0,sp,32
    80004434:	14202773          	csrr	a4,scause
    80004438:	100027f3          	csrr	a5,sstatus
    8000443c:	0027f793          	andi	a5,a5,2
    80004440:	06079e63          	bnez	a5,800044bc <console_handler+0x9c>
    80004444:	00074c63          	bltz	a4,8000445c <console_handler+0x3c>
    80004448:	01813083          	ld	ra,24(sp)
    8000444c:	01013403          	ld	s0,16(sp)
    80004450:	00813483          	ld	s1,8(sp)
    80004454:	02010113          	addi	sp,sp,32
    80004458:	00008067          	ret
    8000445c:	0ff77713          	andi	a4,a4,255
    80004460:	00900793          	li	a5,9
    80004464:	fef712e3          	bne	a4,a5,80004448 <console_handler+0x28>
    80004468:	ffffe097          	auipc	ra,0xffffe
    8000446c:	6dc080e7          	jalr	1756(ra) # 80002b44 <plic_claim>
    80004470:	00a00793          	li	a5,10
    80004474:	00050493          	mv	s1,a0
    80004478:	02f50c63          	beq	a0,a5,800044b0 <console_handler+0x90>
    8000447c:	fc0506e3          	beqz	a0,80004448 <console_handler+0x28>
    80004480:	00050593          	mv	a1,a0
    80004484:	00001517          	auipc	a0,0x1
    80004488:	d6450513          	addi	a0,a0,-668 # 800051e8 <_ZZ12printIntegermE6digits+0xe0>
    8000448c:	fffff097          	auipc	ra,0xfffff
    80004490:	afc080e7          	jalr	-1284(ra) # 80002f88 <__printf>
    80004494:	01013403          	ld	s0,16(sp)
    80004498:	01813083          	ld	ra,24(sp)
    8000449c:	00048513          	mv	a0,s1
    800044a0:	00813483          	ld	s1,8(sp)
    800044a4:	02010113          	addi	sp,sp,32
    800044a8:	ffffe317          	auipc	t1,0xffffe
    800044ac:	6d430067          	jr	1748(t1) # 80002b7c <plic_complete>
    800044b0:	fffff097          	auipc	ra,0xfffff
    800044b4:	3e0080e7          	jalr	992(ra) # 80003890 <uartintr>
    800044b8:	fddff06f          	j	80004494 <console_handler+0x74>
    800044bc:	00001517          	auipc	a0,0x1
    800044c0:	e2c50513          	addi	a0,a0,-468 # 800052e8 <digits+0x78>
    800044c4:	fffff097          	auipc	ra,0xfffff
    800044c8:	a68080e7          	jalr	-1432(ra) # 80002f2c <panic>
	...
