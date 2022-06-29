
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	f7013103          	ld	sp,-144(sp) # 80005f70 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1e5020ef          	jal	ra,80002a00 <start>

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
    80001184:	1b0010ef          	jal	ra,80002334 <_ZN5Riscv20handleSupervisorTrapEv>

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
//
// Created by os on 5/22/22.
//
#include "../h/syscall_c.hpp"

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

0000000080001320 <_Z8sem_openPP9KernelSemj>:

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

0000000080001358 <_Z9sem_closeP9KernelSem>:

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

0000000080001388 <_Z8sem_waitP9KernelSem>:

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

00000000800013b8 <_Z10sem_signalP9KernelSem>:

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

00000000800013e8 <_Z9fibonaccim>:
bool finishedA = false;
bool finishedB = false;
bool finishedC = false;
bool finishedD = false;

uint64 fibonacci(uint64 n) {
    800013e8:	fe010113          	addi	sp,sp,-32
    800013ec:	00113c23          	sd	ra,24(sp)
    800013f0:	00813823          	sd	s0,16(sp)
    800013f4:	00913423          	sd	s1,8(sp)
    800013f8:	01213023          	sd	s2,0(sp)
    800013fc:	02010413          	addi	s0,sp,32
    80001400:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80001404:	00100793          	li	a5,1
    80001408:	02a7f863          	bgeu	a5,a0,80001438 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000140c:	00a00793          	li	a5,10
    80001410:	02f577b3          	remu	a5,a0,a5
    80001414:	02078e63          	beqz	a5,80001450 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001418:	fff48513          	addi	a0,s1,-1
    8000141c:	00000097          	auipc	ra,0x0
    80001420:	fcc080e7          	jalr	-52(ra) # 800013e8 <_Z9fibonaccim>
    80001424:	00050913          	mv	s2,a0
    80001428:	ffe48513          	addi	a0,s1,-2
    8000142c:	00000097          	auipc	ra,0x0
    80001430:	fbc080e7          	jalr	-68(ra) # 800013e8 <_Z9fibonaccim>
    80001434:	00a90533          	add	a0,s2,a0
}
    80001438:	01813083          	ld	ra,24(sp)
    8000143c:	01013403          	ld	s0,16(sp)
    80001440:	00813483          	ld	s1,8(sp)
    80001444:	00013903          	ld	s2,0(sp)
    80001448:	02010113          	addi	sp,sp,32
    8000144c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80001450:	00000097          	auipc	ra,0x0
    80001454:	eac080e7          	jalr	-340(ra) # 800012fc <_Z15thread_dispatchv>
    80001458:	fc1ff06f          	j	80001418 <_Z9fibonaccim+0x30>

000000008000145c <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    8000145c:	fe010113          	addi	sp,sp,-32
    80001460:	00113c23          	sd	ra,24(sp)
    80001464:	00813823          	sd	s0,16(sp)
    80001468:	00913423          	sd	s1,8(sp)
    8000146c:	01213023          	sd	s2,0(sp)
    80001470:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80001474:	00000913          	li	s2,0
    80001478:	0380006f          	j	800014b0 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000147c:	00000097          	auipc	ra,0x0
    80001480:	e80080e7          	jalr	-384(ra) # 800012fc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001484:	00148493          	addi	s1,s1,1
    80001488:	000027b7          	lui	a5,0x2
    8000148c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001490:	0097ee63          	bltu	a5,s1,800014ac <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001494:	00000713          	li	a4,0
    80001498:	000077b7          	lui	a5,0x7
    8000149c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800014a0:	fce7eee3          	bltu	a5,a4,8000147c <_ZN7WorkerA11workerBodyAEPv+0x20>
    800014a4:	00170713          	addi	a4,a4,1
    800014a8:	ff1ff06f          	j	80001498 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800014ac:	00190913          	addi	s2,s2,1
    800014b0:	00900793          	li	a5,9
    800014b4:	0327ec63          	bltu	a5,s2,800014ec <_ZN7WorkerA11workerBodyAEPv+0x90>
        printString("A: i="); printInteger(i); printString("\n");
    800014b8:	00004517          	auipc	a0,0x4
    800014bc:	b6850513          	addi	a0,a0,-1176 # 80005020 <CONSOLE_STATUS+0x10>
    800014c0:	00001097          	auipc	ra,0x1
    800014c4:	440080e7          	jalr	1088(ra) # 80002900 <_Z11printStringPKc>
    800014c8:	00090513          	mv	a0,s2
    800014cc:	00001097          	auipc	ra,0x1
    800014d0:	4a4080e7          	jalr	1188(ra) # 80002970 <_Z12printIntegerm>
    800014d4:	00004517          	auipc	a0,0x4
    800014d8:	c4c50513          	addi	a0,a0,-948 # 80005120 <CONSOLE_STATUS+0x110>
    800014dc:	00001097          	auipc	ra,0x1
    800014e0:	424080e7          	jalr	1060(ra) # 80002900 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800014e4:	00000493          	li	s1,0
    800014e8:	fa1ff06f          	j	80001488 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    800014ec:	00004517          	auipc	a0,0x4
    800014f0:	b3c50513          	addi	a0,a0,-1220 # 80005028 <CONSOLE_STATUS+0x18>
    800014f4:	00001097          	auipc	ra,0x1
    800014f8:	40c080e7          	jalr	1036(ra) # 80002900 <_Z11printStringPKc>
    finishedA = true;
    800014fc:	00100793          	li	a5,1
    80001500:	00005717          	auipc	a4,0x5
    80001504:	acf70823          	sb	a5,-1328(a4) # 80005fd0 <finishedA>
}
    80001508:	01813083          	ld	ra,24(sp)
    8000150c:	01013403          	ld	s0,16(sp)
    80001510:	00813483          	ld	s1,8(sp)
    80001514:	00013903          	ld	s2,0(sp)
    80001518:	02010113          	addi	sp,sp,32
    8000151c:	00008067          	ret

0000000080001520 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80001520:	fe010113          	addi	sp,sp,-32
    80001524:	00113c23          	sd	ra,24(sp)
    80001528:	00813823          	sd	s0,16(sp)
    8000152c:	00913423          	sd	s1,8(sp)
    80001530:	01213023          	sd	s2,0(sp)
    80001534:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001538:	00000913          	li	s2,0
    8000153c:	0380006f          	j	80001574 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80001540:	00000097          	auipc	ra,0x0
    80001544:	dbc080e7          	jalr	-580(ra) # 800012fc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001548:	00148493          	addi	s1,s1,1
    8000154c:	000027b7          	lui	a5,0x2
    80001550:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001554:	0097ee63          	bltu	a5,s1,80001570 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001558:	00000713          	li	a4,0
    8000155c:	000077b7          	lui	a5,0x7
    80001560:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001564:	fce7eee3          	bltu	a5,a4,80001540 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80001568:	00170713          	addi	a4,a4,1
    8000156c:	ff1ff06f          	j	8000155c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80001570:	00190913          	addi	s2,s2,1
    80001574:	00f00793          	li	a5,15
    80001578:	0327ec63          	bltu	a5,s2,800015b0 <_ZN7WorkerB11workerBodyBEPv+0x90>
        printString("B: i="); printInteger(i); printString("\n");
    8000157c:	00004517          	auipc	a0,0x4
    80001580:	abc50513          	addi	a0,a0,-1348 # 80005038 <CONSOLE_STATUS+0x28>
    80001584:	00001097          	auipc	ra,0x1
    80001588:	37c080e7          	jalr	892(ra) # 80002900 <_Z11printStringPKc>
    8000158c:	00090513          	mv	a0,s2
    80001590:	00001097          	auipc	ra,0x1
    80001594:	3e0080e7          	jalr	992(ra) # 80002970 <_Z12printIntegerm>
    80001598:	00004517          	auipc	a0,0x4
    8000159c:	b8850513          	addi	a0,a0,-1144 # 80005120 <CONSOLE_STATUS+0x110>
    800015a0:	00001097          	auipc	ra,0x1
    800015a4:	360080e7          	jalr	864(ra) # 80002900 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800015a8:	00000493          	li	s1,0
    800015ac:	fa1ff06f          	j	8000154c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800015b0:	00004517          	auipc	a0,0x4
    800015b4:	a9050513          	addi	a0,a0,-1392 # 80005040 <CONSOLE_STATUS+0x30>
    800015b8:	00001097          	auipc	ra,0x1
    800015bc:	348080e7          	jalr	840(ra) # 80002900 <_Z11printStringPKc>
    finishedB = true;
    800015c0:	00100793          	li	a5,1
    800015c4:	00005717          	auipc	a4,0x5
    800015c8:	a0f706a3          	sb	a5,-1523(a4) # 80005fd1 <finishedB>
    thread_dispatch();
    800015cc:	00000097          	auipc	ra,0x0
    800015d0:	d30080e7          	jalr	-720(ra) # 800012fc <_Z15thread_dispatchv>
}
    800015d4:	01813083          	ld	ra,24(sp)
    800015d8:	01013403          	ld	s0,16(sp)
    800015dc:	00813483          	ld	s1,8(sp)
    800015e0:	00013903          	ld	s2,0(sp)
    800015e4:	02010113          	addi	sp,sp,32
    800015e8:	00008067          	ret

00000000800015ec <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    800015ec:	fe010113          	addi	sp,sp,-32
    800015f0:	00113c23          	sd	ra,24(sp)
    800015f4:	00813823          	sd	s0,16(sp)
    800015f8:	00913423          	sd	s1,8(sp)
    800015fc:	01213023          	sd	s2,0(sp)
    80001600:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001604:	00000493          	li	s1,0
    80001608:	0380006f          	j	80001640 <_ZN7WorkerC11workerBodyCEPv+0x54>
    for (; i < 3; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    8000160c:	00004517          	auipc	a0,0x4
    80001610:	a4450513          	addi	a0,a0,-1468 # 80005050 <CONSOLE_STATUS+0x40>
    80001614:	00001097          	auipc	ra,0x1
    80001618:	2ec080e7          	jalr	748(ra) # 80002900 <_Z11printStringPKc>
    8000161c:	00048513          	mv	a0,s1
    80001620:	00001097          	auipc	ra,0x1
    80001624:	350080e7          	jalr	848(ra) # 80002970 <_Z12printIntegerm>
    80001628:	00004517          	auipc	a0,0x4
    8000162c:	af850513          	addi	a0,a0,-1288 # 80005120 <CONSOLE_STATUS+0x110>
    80001630:	00001097          	auipc	ra,0x1
    80001634:	2d0080e7          	jalr	720(ra) # 80002900 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80001638:	0014849b          	addiw	s1,s1,1
    8000163c:	0ff4f493          	andi	s1,s1,255
    80001640:	00200793          	li	a5,2
    80001644:	fc97f4e3          	bgeu	a5,s1,8000160c <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80001648:	00004517          	auipc	a0,0x4
    8000164c:	a1050513          	addi	a0,a0,-1520 # 80005058 <CONSOLE_STATUS+0x48>
    80001650:	00001097          	auipc	ra,0x1
    80001654:	2b0080e7          	jalr	688(ra) # 80002900 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80001658:	00700313          	li	t1,7
    thread_dispatch();
    8000165c:	00000097          	auipc	ra,0x0
    80001660:	ca0080e7          	jalr	-864(ra) # 800012fc <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001664:	00030913          	mv	s2,t1

    printString("C: t1="); printInteger(t1); printString("\n");
    80001668:	00004517          	auipc	a0,0x4
    8000166c:	a0050513          	addi	a0,a0,-1536 # 80005068 <CONSOLE_STATUS+0x58>
    80001670:	00001097          	auipc	ra,0x1
    80001674:	290080e7          	jalr	656(ra) # 80002900 <_Z11printStringPKc>
    80001678:	00090513          	mv	a0,s2
    8000167c:	00001097          	auipc	ra,0x1
    80001680:	2f4080e7          	jalr	756(ra) # 80002970 <_Z12printIntegerm>
    80001684:	00004517          	auipc	a0,0x4
    80001688:	a9c50513          	addi	a0,a0,-1380 # 80005120 <CONSOLE_STATUS+0x110>
    8000168c:	00001097          	auipc	ra,0x1
    80001690:	274080e7          	jalr	628(ra) # 80002900 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001694:	00c00513          	li	a0,12
    80001698:	00000097          	auipc	ra,0x0
    8000169c:	d50080e7          	jalr	-688(ra) # 800013e8 <_Z9fibonaccim>
    800016a0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInteger(result); printString("\n");
    800016a4:	00004517          	auipc	a0,0x4
    800016a8:	9cc50513          	addi	a0,a0,-1588 # 80005070 <CONSOLE_STATUS+0x60>
    800016ac:	00001097          	auipc	ra,0x1
    800016b0:	254080e7          	jalr	596(ra) # 80002900 <_Z11printStringPKc>
    800016b4:	00090513          	mv	a0,s2
    800016b8:	00001097          	auipc	ra,0x1
    800016bc:	2b8080e7          	jalr	696(ra) # 80002970 <_Z12printIntegerm>
    800016c0:	00004517          	auipc	a0,0x4
    800016c4:	a6050513          	addi	a0,a0,-1440 # 80005120 <CONSOLE_STATUS+0x110>
    800016c8:	00001097          	auipc	ra,0x1
    800016cc:	238080e7          	jalr	568(ra) # 80002900 <_Z11printStringPKc>
    800016d0:	0380006f          	j	80001708 <_ZN7WorkerC11workerBodyCEPv+0x11c>

    for (; i < 6; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    800016d4:	00004517          	auipc	a0,0x4
    800016d8:	97c50513          	addi	a0,a0,-1668 # 80005050 <CONSOLE_STATUS+0x40>
    800016dc:	00001097          	auipc	ra,0x1
    800016e0:	224080e7          	jalr	548(ra) # 80002900 <_Z11printStringPKc>
    800016e4:	00048513          	mv	a0,s1
    800016e8:	00001097          	auipc	ra,0x1
    800016ec:	288080e7          	jalr	648(ra) # 80002970 <_Z12printIntegerm>
    800016f0:	00004517          	auipc	a0,0x4
    800016f4:	a3050513          	addi	a0,a0,-1488 # 80005120 <CONSOLE_STATUS+0x110>
    800016f8:	00001097          	auipc	ra,0x1
    800016fc:	208080e7          	jalr	520(ra) # 80002900 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80001700:	0014849b          	addiw	s1,s1,1
    80001704:	0ff4f493          	andi	s1,s1,255
    80001708:	00500793          	li	a5,5
    8000170c:	fc97f4e3          	bgeu	a5,s1,800016d4 <_ZN7WorkerC11workerBodyCEPv+0xe8>
    }

    printString("A finished!\n");
    80001710:	00004517          	auipc	a0,0x4
    80001714:	91850513          	addi	a0,a0,-1768 # 80005028 <CONSOLE_STATUS+0x18>
    80001718:	00001097          	auipc	ra,0x1
    8000171c:	1e8080e7          	jalr	488(ra) # 80002900 <_Z11printStringPKc>
    finishedC = true;
    80001720:	00100793          	li	a5,1
    80001724:	00005717          	auipc	a4,0x5
    80001728:	8af70723          	sb	a5,-1874(a4) # 80005fd2 <finishedC>
    thread_dispatch();
    8000172c:	00000097          	auipc	ra,0x0
    80001730:	bd0080e7          	jalr	-1072(ra) # 800012fc <_Z15thread_dispatchv>
}
    80001734:	01813083          	ld	ra,24(sp)
    80001738:	01013403          	ld	s0,16(sp)
    8000173c:	00813483          	ld	s1,8(sp)
    80001740:	00013903          	ld	s2,0(sp)
    80001744:	02010113          	addi	sp,sp,32
    80001748:	00008067          	ret

000000008000174c <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    8000174c:	fe010113          	addi	sp,sp,-32
    80001750:	00113c23          	sd	ra,24(sp)
    80001754:	00813823          	sd	s0,16(sp)
    80001758:	00913423          	sd	s1,8(sp)
    8000175c:	01213023          	sd	s2,0(sp)
    80001760:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80001764:	00a00493          	li	s1,10
    80001768:	0380006f          	j	800017a0 <_ZN7WorkerD11workerBodyDEPv+0x54>
    for (; i < 13; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    8000176c:	00004517          	auipc	a0,0x4
    80001770:	91450513          	addi	a0,a0,-1772 # 80005080 <CONSOLE_STATUS+0x70>
    80001774:	00001097          	auipc	ra,0x1
    80001778:	18c080e7          	jalr	396(ra) # 80002900 <_Z11printStringPKc>
    8000177c:	00048513          	mv	a0,s1
    80001780:	00001097          	auipc	ra,0x1
    80001784:	1f0080e7          	jalr	496(ra) # 80002970 <_Z12printIntegerm>
    80001788:	00004517          	auipc	a0,0x4
    8000178c:	99850513          	addi	a0,a0,-1640 # 80005120 <CONSOLE_STATUS+0x110>
    80001790:	00001097          	auipc	ra,0x1
    80001794:	170080e7          	jalr	368(ra) # 80002900 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80001798:	0014849b          	addiw	s1,s1,1
    8000179c:	0ff4f493          	andi	s1,s1,255
    800017a0:	00c00793          	li	a5,12
    800017a4:	fc97f4e3          	bgeu	a5,s1,8000176c <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800017a8:	00004517          	auipc	a0,0x4
    800017ac:	8e050513          	addi	a0,a0,-1824 # 80005088 <CONSOLE_STATUS+0x78>
    800017b0:	00001097          	auipc	ra,0x1
    800017b4:	150080e7          	jalr	336(ra) # 80002900 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800017b8:	00500313          	li	t1,5
    thread_dispatch();
    800017bc:	00000097          	auipc	ra,0x0
    800017c0:	b40080e7          	jalr	-1216(ra) # 800012fc <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800017c4:	01000513          	li	a0,16
    800017c8:	00000097          	auipc	ra,0x0
    800017cc:	c20080e7          	jalr	-992(ra) # 800013e8 <_Z9fibonaccim>
    800017d0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInteger(result); printString("\n");
    800017d4:	00004517          	auipc	a0,0x4
    800017d8:	8c450513          	addi	a0,a0,-1852 # 80005098 <CONSOLE_STATUS+0x88>
    800017dc:	00001097          	auipc	ra,0x1
    800017e0:	124080e7          	jalr	292(ra) # 80002900 <_Z11printStringPKc>
    800017e4:	00090513          	mv	a0,s2
    800017e8:	00001097          	auipc	ra,0x1
    800017ec:	188080e7          	jalr	392(ra) # 80002970 <_Z12printIntegerm>
    800017f0:	00004517          	auipc	a0,0x4
    800017f4:	93050513          	addi	a0,a0,-1744 # 80005120 <CONSOLE_STATUS+0x110>
    800017f8:	00001097          	auipc	ra,0x1
    800017fc:	108080e7          	jalr	264(ra) # 80002900 <_Z11printStringPKc>
    80001800:	0380006f          	j	80001838 <_ZN7WorkerD11workerBodyDEPv+0xec>

    for (; i < 16; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    80001804:	00004517          	auipc	a0,0x4
    80001808:	87c50513          	addi	a0,a0,-1924 # 80005080 <CONSOLE_STATUS+0x70>
    8000180c:	00001097          	auipc	ra,0x1
    80001810:	0f4080e7          	jalr	244(ra) # 80002900 <_Z11printStringPKc>
    80001814:	00048513          	mv	a0,s1
    80001818:	00001097          	auipc	ra,0x1
    8000181c:	158080e7          	jalr	344(ra) # 80002970 <_Z12printIntegerm>
    80001820:	00004517          	auipc	a0,0x4
    80001824:	90050513          	addi	a0,a0,-1792 # 80005120 <CONSOLE_STATUS+0x110>
    80001828:	00001097          	auipc	ra,0x1
    8000182c:	0d8080e7          	jalr	216(ra) # 80002900 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80001830:	0014849b          	addiw	s1,s1,1
    80001834:	0ff4f493          	andi	s1,s1,255
    80001838:	00f00793          	li	a5,15
    8000183c:	fc97f4e3          	bgeu	a5,s1,80001804 <_ZN7WorkerD11workerBodyDEPv+0xb8>
    }

    printString("D finished!\n");
    80001840:	00004517          	auipc	a0,0x4
    80001844:	86850513          	addi	a0,a0,-1944 # 800050a8 <CONSOLE_STATUS+0x98>
    80001848:	00001097          	auipc	ra,0x1
    8000184c:	0b8080e7          	jalr	184(ra) # 80002900 <_Z11printStringPKc>
    finishedD = true;
    80001850:	00100793          	li	a5,1
    80001854:	00004717          	auipc	a4,0x4
    80001858:	76f70fa3          	sb	a5,1919(a4) # 80005fd3 <finishedD>
    thread_dispatch();
    8000185c:	00000097          	auipc	ra,0x0
    80001860:	aa0080e7          	jalr	-1376(ra) # 800012fc <_Z15thread_dispatchv>
}
    80001864:	01813083          	ld	ra,24(sp)
    80001868:	01013403          	ld	s0,16(sp)
    8000186c:	00813483          	ld	s1,8(sp)
    80001870:	00013903          	ld	s2,0(sp)
    80001874:	02010113          	addi	sp,sp,32
    80001878:	00008067          	ret

000000008000187c <main>:

int main() {
    8000187c:	fb010113          	addi	sp,sp,-80
    80001880:	04113423          	sd	ra,72(sp)
    80001884:	04813023          	sd	s0,64(sp)
    80001888:	02913c23          	sd	s1,56(sp)
    8000188c:	03213823          	sd	s2,48(sp)
    80001890:	05010413          	addi	s0,sp,80
    MemoryAllocator::memAlloc();
    80001894:	00001097          	auipc	ra,0x1
    80001898:	df0080e7          	jalr	-528(ra) # 80002684 <_ZN15MemoryAllocator8memAllocEv>
    Thread* threads[5];

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    8000189c:	00004797          	auipc	a5,0x4
    800018a0:	6c47b783          	ld	a5,1732(a5) # 80005f60 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    800018a4:	10579073          	csrw	stvec,a5

    TCB* run;
    thread_create(&run, nullptr, nullptr);
    800018a8:	00000613          	li	a2,0
    800018ac:	00000593          	li	a1,0
    800018b0:	fb040513          	addi	a0,s0,-80
    800018b4:	00000097          	auipc	ra,0x0
    800018b8:	9e0080e7          	jalr	-1568(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = run;
    800018bc:	00004797          	auipc	a5,0x4
    800018c0:	6bc7b783          	ld	a5,1724(a5) # 80005f78 <_GLOBAL_OFFSET_TABLE_+0x28>
    800018c4:	fb043703          	ld	a4,-80(s0)
    800018c8:	00e7b023          	sd	a4,0(a5)

    threads[0] = new WorkerA();
    800018cc:	01000513          	li	a0,16
    800018d0:	00000097          	auipc	ra,0x0
    800018d4:	724080e7          	jalr	1828(ra) # 80001ff4 <_Znwm>
    800018d8:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800018dc:	00001097          	auipc	ra,0x1
    800018e0:	8f4080e7          	jalr	-1804(ra) # 800021d0 <_ZN6ThreadC1Ev>
    800018e4:	00004797          	auipc	a5,0x4
    800018e8:	58c78793          	addi	a5,a5,1420 # 80005e70 <_ZTV7WorkerA+0x10>
    800018ec:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    800018f0:	fa943c23          	sd	s1,-72(s0)
    printString("ThreadA created\n");
    800018f4:	00003517          	auipc	a0,0x3
    800018f8:	7c450513          	addi	a0,a0,1988 # 800050b8 <CONSOLE_STATUS+0xa8>
    800018fc:	00001097          	auipc	ra,0x1
    80001900:	004080e7          	jalr	4(ra) # 80002900 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80001904:	01000513          	li	a0,16
    80001908:	00000097          	auipc	ra,0x0
    8000190c:	6ec080e7          	jalr	1772(ra) # 80001ff4 <_Znwm>
    80001910:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80001914:	00001097          	auipc	ra,0x1
    80001918:	8bc080e7          	jalr	-1860(ra) # 800021d0 <_ZN6ThreadC1Ev>
    8000191c:	00004797          	auipc	a5,0x4
    80001920:	57c78793          	addi	a5,a5,1404 # 80005e98 <_ZTV7WorkerB+0x10>
    80001924:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80001928:	fc943023          	sd	s1,-64(s0)
    printString("ThreadB created\n");
    8000192c:	00003517          	auipc	a0,0x3
    80001930:	7a450513          	addi	a0,a0,1956 # 800050d0 <CONSOLE_STATUS+0xc0>
    80001934:	00001097          	auipc	ra,0x1
    80001938:	fcc080e7          	jalr	-52(ra) # 80002900 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    8000193c:	01000513          	li	a0,16
    80001940:	00000097          	auipc	ra,0x0
    80001944:	6b4080e7          	jalr	1716(ra) # 80001ff4 <_Znwm>
    80001948:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    8000194c:	00001097          	auipc	ra,0x1
    80001950:	884080e7          	jalr	-1916(ra) # 800021d0 <_ZN6ThreadC1Ev>
    80001954:	00004797          	auipc	a5,0x4
    80001958:	56c78793          	addi	a5,a5,1388 # 80005ec0 <_ZTV7WorkerC+0x10>
    8000195c:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80001960:	fc943423          	sd	s1,-56(s0)
    printString("ThreadC created\n");
    80001964:	00003517          	auipc	a0,0x3
    80001968:	78450513          	addi	a0,a0,1924 # 800050e8 <CONSOLE_STATUS+0xd8>
    8000196c:	00001097          	auipc	ra,0x1
    80001970:	f94080e7          	jalr	-108(ra) # 80002900 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80001974:	01000513          	li	a0,16
    80001978:	00000097          	auipc	ra,0x0
    8000197c:	67c080e7          	jalr	1660(ra) # 80001ff4 <_Znwm>
    80001980:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80001984:	00001097          	auipc	ra,0x1
    80001988:	84c080e7          	jalr	-1972(ra) # 800021d0 <_ZN6ThreadC1Ev>
    8000198c:	00004797          	auipc	a5,0x4
    80001990:	55c78793          	addi	a5,a5,1372 # 80005ee8 <_ZTV7WorkerD+0x10>
    80001994:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80001998:	fc943823          	sd	s1,-48(s0)
    printString("ThreadD created\n");
    8000199c:	00003517          	auipc	a0,0x3
    800019a0:	76450513          	addi	a0,a0,1892 # 80005100 <CONSOLE_STATUS+0xf0>
    800019a4:	00001097          	auipc	ra,0x1
    800019a8:	f5c080e7          	jalr	-164(ra) # 80002900 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800019ac:	00000493          	li	s1,0
    800019b0:	00300793          	li	a5,3
    800019b4:	0297c263          	blt	a5,s1,800019d8 <main+0x15c>
        threads[i]->start();
    800019b8:	00349793          	slli	a5,s1,0x3
    800019bc:	fe040713          	addi	a4,s0,-32
    800019c0:	00f707b3          	add	a5,a4,a5
    800019c4:	fd87b503          	ld	a0,-40(a5)
    800019c8:	00000097          	auipc	ra,0x0
    800019cc:	78c080e7          	jalr	1932(ra) # 80002154 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800019d0:	0014849b          	addiw	s1,s1,1
    800019d4:	fddff06f          	j	800019b0 <main+0x134>
inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800019d8:	00200793          	li	a5,2
    800019dc:	1007a073          	csrs	sstatus,a5
}
    800019e0:	00c0006f          	j	800019ec <main+0x170>
    }

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800019e4:	00000097          	auipc	ra,0x0
    800019e8:	748080e7          	jalr	1864(ra) # 8000212c <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800019ec:	00004797          	auipc	a5,0x4
    800019f0:	5e47c783          	lbu	a5,1508(a5) # 80005fd0 <finishedA>
    800019f4:	fe0788e3          	beqz	a5,800019e4 <main+0x168>
    800019f8:	00004797          	auipc	a5,0x4
    800019fc:	5d97c783          	lbu	a5,1497(a5) # 80005fd1 <finishedB>
    80001a00:	fe0782e3          	beqz	a5,800019e4 <main+0x168>
    80001a04:	00004797          	auipc	a5,0x4
    80001a08:	5ce7c783          	lbu	a5,1486(a5) # 80005fd2 <finishedC>
    80001a0c:	fc078ce3          	beqz	a5,800019e4 <main+0x168>
    80001a10:	00004797          	auipc	a5,0x4
    80001a14:	5c37c783          	lbu	a5,1475(a5) # 80005fd3 <finishedD>
    80001a18:	fc0786e3          	beqz	a5,800019e4 <main+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80001a1c:	fb840493          	addi	s1,s0,-72
    80001a20:	0080006f          	j	80001a28 <main+0x1ac>
    80001a24:	00848493          	addi	s1,s1,8
    80001a28:	fe040793          	addi	a5,s0,-32
    80001a2c:	08f48663          	beq	s1,a5,80001ab8 <main+0x23c>
    80001a30:	0004b503          	ld	a0,0(s1)
    80001a34:	fe0508e3          	beqz	a0,80001a24 <main+0x1a8>
    80001a38:	00053783          	ld	a5,0(a0)
    80001a3c:	0087b783          	ld	a5,8(a5)
    80001a40:	000780e7          	jalr	a5
    80001a44:	fe1ff06f          	j	80001a24 <main+0x1a8>
    80001a48:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80001a4c:	00048513          	mv	a0,s1
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	5f4080e7          	jalr	1524(ra) # 80002044 <_ZdlPv>
    80001a58:	00090513          	mv	a0,s2
    80001a5c:	00005097          	auipc	ra,0x5
    80001a60:	67c080e7          	jalr	1660(ra) # 800070d8 <_Unwind_Resume>
    80001a64:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80001a68:	00048513          	mv	a0,s1
    80001a6c:	00000097          	auipc	ra,0x0
    80001a70:	5d8080e7          	jalr	1496(ra) # 80002044 <_ZdlPv>
    80001a74:	00090513          	mv	a0,s2
    80001a78:	00005097          	auipc	ra,0x5
    80001a7c:	660080e7          	jalr	1632(ra) # 800070d8 <_Unwind_Resume>
    80001a80:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80001a84:	00048513          	mv	a0,s1
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	5bc080e7          	jalr	1468(ra) # 80002044 <_ZdlPv>
    80001a90:	00090513          	mv	a0,s2
    80001a94:	00005097          	auipc	ra,0x5
    80001a98:	644080e7          	jalr	1604(ra) # 800070d8 <_Unwind_Resume>
    80001a9c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80001aa0:	00048513          	mv	a0,s1
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	5a0080e7          	jalr	1440(ra) # 80002044 <_ZdlPv>
    80001aac:	00090513          	mv	a0,s2
    80001ab0:	00005097          	auipc	ra,0x5
    80001ab4:	628080e7          	jalr	1576(ra) # 800070d8 <_Unwind_Resume>
    printString("Finished\n");
    80001ab8:	00003517          	auipc	a0,0x3
    80001abc:	66050513          	addi	a0,a0,1632 # 80005118 <CONSOLE_STATUS+0x108>
    80001ac0:	00001097          	auipc	ra,0x1
    80001ac4:	e40080e7          	jalr	-448(ra) # 80002900 <_Z11printStringPKc>
    return 0;
    80001ac8:	00000513          	li	a0,0
    80001acc:	04813083          	ld	ra,72(sp)
    80001ad0:	04013403          	ld	s0,64(sp)
    80001ad4:	03813483          	ld	s1,56(sp)
    80001ad8:	03013903          	ld	s2,48(sp)
    80001adc:	05010113          	addi	sp,sp,80
    80001ae0:	00008067          	ret

0000000080001ae4 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80001ae4:	ff010113          	addi	sp,sp,-16
    80001ae8:	00113423          	sd	ra,8(sp)
    80001aec:	00813023          	sd	s0,0(sp)
    80001af0:	01010413          	addi	s0,sp,16
    80001af4:	00004797          	auipc	a5,0x4
    80001af8:	37c78793          	addi	a5,a5,892 # 80005e70 <_ZTV7WorkerA+0x10>
    80001afc:	00f53023          	sd	a5,0(a0)
    80001b00:	00000097          	auipc	ra,0x0
    80001b04:	594080e7          	jalr	1428(ra) # 80002094 <_ZN6ThreadD1Ev>
    80001b08:	00813083          	ld	ra,8(sp)
    80001b0c:	00013403          	ld	s0,0(sp)
    80001b10:	01010113          	addi	sp,sp,16
    80001b14:	00008067          	ret

0000000080001b18 <_ZN7WorkerAD0Ev>:
    80001b18:	fe010113          	addi	sp,sp,-32
    80001b1c:	00113c23          	sd	ra,24(sp)
    80001b20:	00813823          	sd	s0,16(sp)
    80001b24:	00913423          	sd	s1,8(sp)
    80001b28:	02010413          	addi	s0,sp,32
    80001b2c:	00050493          	mv	s1,a0
    80001b30:	00004797          	auipc	a5,0x4
    80001b34:	34078793          	addi	a5,a5,832 # 80005e70 <_ZTV7WorkerA+0x10>
    80001b38:	00f53023          	sd	a5,0(a0)
    80001b3c:	00000097          	auipc	ra,0x0
    80001b40:	558080e7          	jalr	1368(ra) # 80002094 <_ZN6ThreadD1Ev>
    80001b44:	00048513          	mv	a0,s1
    80001b48:	00000097          	auipc	ra,0x0
    80001b4c:	4fc080e7          	jalr	1276(ra) # 80002044 <_ZdlPv>
    80001b50:	01813083          	ld	ra,24(sp)
    80001b54:	01013403          	ld	s0,16(sp)
    80001b58:	00813483          	ld	s1,8(sp)
    80001b5c:	02010113          	addi	sp,sp,32
    80001b60:	00008067          	ret

0000000080001b64 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80001b64:	ff010113          	addi	sp,sp,-16
    80001b68:	00113423          	sd	ra,8(sp)
    80001b6c:	00813023          	sd	s0,0(sp)
    80001b70:	01010413          	addi	s0,sp,16
    80001b74:	00004797          	auipc	a5,0x4
    80001b78:	32478793          	addi	a5,a5,804 # 80005e98 <_ZTV7WorkerB+0x10>
    80001b7c:	00f53023          	sd	a5,0(a0)
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	514080e7          	jalr	1300(ra) # 80002094 <_ZN6ThreadD1Ev>
    80001b88:	00813083          	ld	ra,8(sp)
    80001b8c:	00013403          	ld	s0,0(sp)
    80001b90:	01010113          	addi	sp,sp,16
    80001b94:	00008067          	ret

0000000080001b98 <_ZN7WorkerBD0Ev>:
    80001b98:	fe010113          	addi	sp,sp,-32
    80001b9c:	00113c23          	sd	ra,24(sp)
    80001ba0:	00813823          	sd	s0,16(sp)
    80001ba4:	00913423          	sd	s1,8(sp)
    80001ba8:	02010413          	addi	s0,sp,32
    80001bac:	00050493          	mv	s1,a0
    80001bb0:	00004797          	auipc	a5,0x4
    80001bb4:	2e878793          	addi	a5,a5,744 # 80005e98 <_ZTV7WorkerB+0x10>
    80001bb8:	00f53023          	sd	a5,0(a0)
    80001bbc:	00000097          	auipc	ra,0x0
    80001bc0:	4d8080e7          	jalr	1240(ra) # 80002094 <_ZN6ThreadD1Ev>
    80001bc4:	00048513          	mv	a0,s1
    80001bc8:	00000097          	auipc	ra,0x0
    80001bcc:	47c080e7          	jalr	1148(ra) # 80002044 <_ZdlPv>
    80001bd0:	01813083          	ld	ra,24(sp)
    80001bd4:	01013403          	ld	s0,16(sp)
    80001bd8:	00813483          	ld	s1,8(sp)
    80001bdc:	02010113          	addi	sp,sp,32
    80001be0:	00008067          	ret

0000000080001be4 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80001be4:	ff010113          	addi	sp,sp,-16
    80001be8:	00113423          	sd	ra,8(sp)
    80001bec:	00813023          	sd	s0,0(sp)
    80001bf0:	01010413          	addi	s0,sp,16
    80001bf4:	00004797          	auipc	a5,0x4
    80001bf8:	2cc78793          	addi	a5,a5,716 # 80005ec0 <_ZTV7WorkerC+0x10>
    80001bfc:	00f53023          	sd	a5,0(a0)
    80001c00:	00000097          	auipc	ra,0x0
    80001c04:	494080e7          	jalr	1172(ra) # 80002094 <_ZN6ThreadD1Ev>
    80001c08:	00813083          	ld	ra,8(sp)
    80001c0c:	00013403          	ld	s0,0(sp)
    80001c10:	01010113          	addi	sp,sp,16
    80001c14:	00008067          	ret

0000000080001c18 <_ZN7WorkerCD0Ev>:
    80001c18:	fe010113          	addi	sp,sp,-32
    80001c1c:	00113c23          	sd	ra,24(sp)
    80001c20:	00813823          	sd	s0,16(sp)
    80001c24:	00913423          	sd	s1,8(sp)
    80001c28:	02010413          	addi	s0,sp,32
    80001c2c:	00050493          	mv	s1,a0
    80001c30:	00004797          	auipc	a5,0x4
    80001c34:	29078793          	addi	a5,a5,656 # 80005ec0 <_ZTV7WorkerC+0x10>
    80001c38:	00f53023          	sd	a5,0(a0)
    80001c3c:	00000097          	auipc	ra,0x0
    80001c40:	458080e7          	jalr	1112(ra) # 80002094 <_ZN6ThreadD1Ev>
    80001c44:	00048513          	mv	a0,s1
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	3fc080e7          	jalr	1020(ra) # 80002044 <_ZdlPv>
    80001c50:	01813083          	ld	ra,24(sp)
    80001c54:	01013403          	ld	s0,16(sp)
    80001c58:	00813483          	ld	s1,8(sp)
    80001c5c:	02010113          	addi	sp,sp,32
    80001c60:	00008067          	ret

0000000080001c64 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80001c64:	ff010113          	addi	sp,sp,-16
    80001c68:	00113423          	sd	ra,8(sp)
    80001c6c:	00813023          	sd	s0,0(sp)
    80001c70:	01010413          	addi	s0,sp,16
    80001c74:	00004797          	auipc	a5,0x4
    80001c78:	27478793          	addi	a5,a5,628 # 80005ee8 <_ZTV7WorkerD+0x10>
    80001c7c:	00f53023          	sd	a5,0(a0)
    80001c80:	00000097          	auipc	ra,0x0
    80001c84:	414080e7          	jalr	1044(ra) # 80002094 <_ZN6ThreadD1Ev>
    80001c88:	00813083          	ld	ra,8(sp)
    80001c8c:	00013403          	ld	s0,0(sp)
    80001c90:	01010113          	addi	sp,sp,16
    80001c94:	00008067          	ret

0000000080001c98 <_ZN7WorkerDD0Ev>:
    80001c98:	fe010113          	addi	sp,sp,-32
    80001c9c:	00113c23          	sd	ra,24(sp)
    80001ca0:	00813823          	sd	s0,16(sp)
    80001ca4:	00913423          	sd	s1,8(sp)
    80001ca8:	02010413          	addi	s0,sp,32
    80001cac:	00050493          	mv	s1,a0
    80001cb0:	00004797          	auipc	a5,0x4
    80001cb4:	23878793          	addi	a5,a5,568 # 80005ee8 <_ZTV7WorkerD+0x10>
    80001cb8:	00f53023          	sd	a5,0(a0)
    80001cbc:	00000097          	auipc	ra,0x0
    80001cc0:	3d8080e7          	jalr	984(ra) # 80002094 <_ZN6ThreadD1Ev>
    80001cc4:	00048513          	mv	a0,s1
    80001cc8:	00000097          	auipc	ra,0x0
    80001ccc:	37c080e7          	jalr	892(ra) # 80002044 <_ZdlPv>
    80001cd0:	01813083          	ld	ra,24(sp)
    80001cd4:	01013403          	ld	s0,16(sp)
    80001cd8:	00813483          	ld	s1,8(sp)
    80001cdc:	02010113          	addi	sp,sp,32
    80001ce0:	00008067          	ret

0000000080001ce4 <_ZN7WorkerA3runEv>:
    void run() override {
    80001ce4:	ff010113          	addi	sp,sp,-16
    80001ce8:	00113423          	sd	ra,8(sp)
    80001cec:	00813023          	sd	s0,0(sp)
    80001cf0:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80001cf4:	00000593          	li	a1,0
    80001cf8:	fffff097          	auipc	ra,0xfffff
    80001cfc:	764080e7          	jalr	1892(ra) # 8000145c <_ZN7WorkerA11workerBodyAEPv>
    }
    80001d00:	00813083          	ld	ra,8(sp)
    80001d04:	00013403          	ld	s0,0(sp)
    80001d08:	01010113          	addi	sp,sp,16
    80001d0c:	00008067          	ret

0000000080001d10 <_ZN7WorkerB3runEv>:
    void run() override {
    80001d10:	ff010113          	addi	sp,sp,-16
    80001d14:	00113423          	sd	ra,8(sp)
    80001d18:	00813023          	sd	s0,0(sp)
    80001d1c:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80001d20:	00000593          	li	a1,0
    80001d24:	fffff097          	auipc	ra,0xfffff
    80001d28:	7fc080e7          	jalr	2044(ra) # 80001520 <_ZN7WorkerB11workerBodyBEPv>
    }
    80001d2c:	00813083          	ld	ra,8(sp)
    80001d30:	00013403          	ld	s0,0(sp)
    80001d34:	01010113          	addi	sp,sp,16
    80001d38:	00008067          	ret

0000000080001d3c <_ZN7WorkerC3runEv>:
    void run() override {
    80001d3c:	ff010113          	addi	sp,sp,-16
    80001d40:	00113423          	sd	ra,8(sp)
    80001d44:	00813023          	sd	s0,0(sp)
    80001d48:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80001d4c:	00000593          	li	a1,0
    80001d50:	00000097          	auipc	ra,0x0
    80001d54:	89c080e7          	jalr	-1892(ra) # 800015ec <_ZN7WorkerC11workerBodyCEPv>
    }
    80001d58:	00813083          	ld	ra,8(sp)
    80001d5c:	00013403          	ld	s0,0(sp)
    80001d60:	01010113          	addi	sp,sp,16
    80001d64:	00008067          	ret

0000000080001d68 <_ZN7WorkerD3runEv>:
    void run() override {
    80001d68:	ff010113          	addi	sp,sp,-16
    80001d6c:	00113423          	sd	ra,8(sp)
    80001d70:	00813023          	sd	s0,0(sp)
    80001d74:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80001d78:	00000593          	li	a1,0
    80001d7c:	00000097          	auipc	ra,0x0
    80001d80:	9d0080e7          	jalr	-1584(ra) # 8000174c <_ZN7WorkerD11workerBodyDEPv>
    }
    80001d84:	00813083          	ld	ra,8(sp)
    80001d88:	00013403          	ld	s0,0(sp)
    80001d8c:	01010113          	addi	sp,sp,16
    80001d90:	00008067          	ret

0000000080001d94 <_ZN3TCB13threadWrapperEv>:
    running = Scheduler::get();
    Riscv::w_sstatus(sstatus);
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper() {
    80001d94:	ff010113          	addi	sp,sp,-16
    80001d98:	00113423          	sd	ra,8(sp)
    80001d9c:	00813023          	sd	s0,0(sp)
    80001da0:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie();
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	570080e7          	jalr	1392(ra) # 80002314 <_ZN5Riscv10popSppSpieEv>
    if(running->myThread != nullptr){
    80001dac:	00004797          	auipc	a5,0x4
    80001db0:	22c7b783          	ld	a5,556(a5) # 80005fd8 <_ZN3TCB7runningE>
    80001db4:	0307b503          	ld	a0,48(a5)
    80001db8:	00050863          	beqz	a0,80001dc8 <_ZN3TCB13threadWrapperEv+0x34>
        running->myThread->run();
    80001dbc:	00053783          	ld	a5,0(a0)
    80001dc0:	0107b783          	ld	a5,16(a5)
    80001dc4:	000780e7          	jalr	a5
    }
    thread_exit();
    80001dc8:	fffff097          	auipc	ra,0xfffff
    80001dcc:	50c080e7          	jalr	1292(ra) # 800012d4 <_Z11thread_exitv>
    /*running->body();
    running->setFinished(true);
    TCB::yield();*/

}
    80001dd0:	00813083          	ld	ra,8(sp)
    80001dd4:	00013403          	ld	s0,0(sp)
    80001dd8:	01010113          	addi	sp,sp,16
    80001ddc:	00008067          	ret

0000000080001de0 <_ZN3TCBC1EPFvvEm>:
TCB::TCB(Body body, uint64 timeSlice) : body(body),
    80001de0:	fd010113          	addi	sp,sp,-48
    80001de4:	02113423          	sd	ra,40(sp)
    80001de8:	02813023          	sd	s0,32(sp)
    80001dec:	00913c23          	sd	s1,24(sp)
    80001df0:	01213823          	sd	s2,16(sp)
    80001df4:	01313423          	sd	s3,8(sp)
    80001df8:	03010413          	addi	s0,sp,48
    80001dfc:	00050493          	mv	s1,a0
    80001e00:	00058913          	mv	s2,a1
    80001e04:	00060993          	mv	s3,a2
finished(false), blocked(false) {
    80001e08:	00b53023          	sd	a1,0(a0)
stack(/*body != nullptr ?*/ new uint64[STACK_SIZE] /* : nullptr */),
    80001e0c:	00002537          	lui	a0,0x2
    80001e10:	00000097          	auipc	ra,0x0
    80001e14:	20c080e7          	jalr	524(ra) # 8000201c <_Znam>
finished(false), blocked(false) {
    80001e18:	00a4b423          	sd	a0,8(s1)
    80001e1c:	00000797          	auipc	a5,0x0
    80001e20:	f7878793          	addi	a5,a5,-136 # 80001d94 <_ZN3TCB13threadWrapperEv>
    80001e24:	00f4b823          	sd	a5,16(s1)
         /*stack != nullptr ? */(uint64) &stack[STACK_SIZE] /* : 0 */}),
    80001e28:	000027b7          	lui	a5,0x2
    80001e2c:	00f50533          	add	a0,a0,a5
finished(false), blocked(false) {
    80001e30:	00a4bc23          	sd	a0,24(s1)
    80001e34:	0334b023          	sd	s3,32(s1)
    80001e38:	02048423          	sb	zero,40(s1)
    80001e3c:	020484a3          	sb	zero,41(s1)
    if (body != nullptr) { Scheduler::put(this); }
    80001e40:	00090863          	beqz	s2,80001e50 <_ZN3TCBC1EPFvvEm+0x70>
    80001e44:	00048513          	mv	a0,s1
    80001e48:	00000097          	auipc	ra,0x0
    80001e4c:	79c080e7          	jalr	1948(ra) # 800025e4 <_ZN9Scheduler3putEP3TCB>
    myThread = nullptr;
    80001e50:	0204b823          	sd	zero,48(s1)
}
    80001e54:	02813083          	ld	ra,40(sp)
    80001e58:	02013403          	ld	s0,32(sp)
    80001e5c:	01813483          	ld	s1,24(sp)
    80001e60:	01013903          	ld	s2,16(sp)
    80001e64:	00813983          	ld	s3,8(sp)
    80001e68:	03010113          	addi	sp,sp,48
    80001e6c:	00008067          	ret

0000000080001e70 <_ZN3TCB12createThreadEPFvvE>:
TCB *TCB::createThread(Body body) {
    80001e70:	fe010113          	addi	sp,sp,-32
    80001e74:	00113c23          	sd	ra,24(sp)
    80001e78:	00813823          	sd	s0,16(sp)
    80001e7c:	00913423          	sd	s1,8(sp)
    80001e80:	01213023          	sd	s2,0(sp)
    80001e84:	02010413          	addi	s0,sp,32
    80001e88:	00050913          	mv	s2,a0
    return new TCB(body, TIME_SLICE);
    80001e8c:	03800513          	li	a0,56
    80001e90:	00000097          	auipc	ra,0x0
    80001e94:	164080e7          	jalr	356(ra) # 80001ff4 <_Znwm>
    80001e98:	00050493          	mv	s1,a0
    80001e9c:	00200613          	li	a2,2
    80001ea0:	00090593          	mv	a1,s2
    80001ea4:	00000097          	auipc	ra,0x0
    80001ea8:	f3c080e7          	jalr	-196(ra) # 80001de0 <_ZN3TCBC1EPFvvEm>
    80001eac:	0200006f          	j	80001ecc <_ZN3TCB12createThreadEPFvvE+0x5c>
    80001eb0:	00050913          	mv	s2,a0
    80001eb4:	00048513          	mv	a0,s1
    80001eb8:	00000097          	auipc	ra,0x0
    80001ebc:	18c080e7          	jalr	396(ra) # 80002044 <_ZdlPv>
    80001ec0:	00090513          	mv	a0,s2
    80001ec4:	00005097          	auipc	ra,0x5
    80001ec8:	214080e7          	jalr	532(ra) # 800070d8 <_Unwind_Resume>
}
    80001ecc:	00048513          	mv	a0,s1
    80001ed0:	01813083          	ld	ra,24(sp)
    80001ed4:	01013403          	ld	s0,16(sp)
    80001ed8:	00813483          	ld	s1,8(sp)
    80001edc:	00013903          	ld	s2,0(sp)
    80001ee0:	02010113          	addi	sp,sp,32
    80001ee4:	00008067          	ret

0000000080001ee8 <_ZN3TCB5yieldEv>:
void TCB::yield() { __asm__ volatile ("ecall"); }
    80001ee8:	ff010113          	addi	sp,sp,-16
    80001eec:	00813423          	sd	s0,8(sp)
    80001ef0:	01010413          	addi	s0,sp,16
    80001ef4:	00000073          	ecall
    80001ef8:	00813403          	ld	s0,8(sp)
    80001efc:	01010113          	addi	sp,sp,16
    80001f00:	00008067          	ret

0000000080001f04 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80001f04:	fd010113          	addi	sp,sp,-48
    80001f08:	02113423          	sd	ra,40(sp)
    80001f0c:	02813023          	sd	s0,32(sp)
    80001f10:	00913c23          	sd	s1,24(sp)
    80001f14:	01213823          	sd	s2,16(sp)
    80001f18:	03010413          	addi	s0,sp,48
    TCB *old = running;
    80001f1c:	00004497          	auipc	s1,0x4
    80001f20:	0bc4b483          	ld	s1,188(s1) # 80005fd8 <_ZN3TCB7runningE>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001f24:	100027f3          	csrr	a5,sstatus
    80001f28:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80001f2c:	fd843903          	ld	s2,-40(s0)
class Thread;

class TCB {
        public:
        ~TCB() { delete[] stack; }
        bool isFinished() const { return finished; }
    80001f30:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished()) { Scheduler::put(old); }
    80001f34:	04078063          	beqz	a5,80001f74 <_ZN3TCB8dispatchEv+0x70>
    running = Scheduler::get();
    80001f38:	00000097          	auipc	ra,0x0
    80001f3c:	644080e7          	jalr	1604(ra) # 8000257c <_ZN9Scheduler3getEv>
    80001f40:	00004797          	auipc	a5,0x4
    80001f44:	08a7bc23          	sd	a0,152(a5) # 80005fd8 <_ZN3TCB7runningE>
}
inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001f48:	10091073          	csrw	sstatus,s2
    TCB::contextSwitch(&old->context, &running->context);
    80001f4c:	01050593          	addi	a1,a0,16 # 2010 <_entry-0x7fffdff0>
    80001f50:	01048513          	addi	a0,s1,16
    80001f54:	fffff097          	auipc	ra,0xfffff
    80001f58:	2cc080e7          	jalr	716(ra) # 80001220 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001f5c:	02813083          	ld	ra,40(sp)
    80001f60:	02013403          	ld	s0,32(sp)
    80001f64:	01813483          	ld	s1,24(sp)
    80001f68:	01013903          	ld	s2,16(sp)
    80001f6c:	03010113          	addi	sp,sp,48
    80001f70:	00008067          	ret
    if (!old->isFinished()) { Scheduler::put(old); }
    80001f74:	00048513          	mv	a0,s1
    80001f78:	00000097          	auipc	ra,0x0
    80001f7c:	66c080e7          	jalr	1644(ra) # 800025e4 <_ZN9Scheduler3putEP3TCB>
    80001f80:	fb9ff06f          	j	80001f38 <_ZN3TCB8dispatchEv+0x34>

0000000080001f84 <_ZN3TCB9checkBodyEv>:

bool TCB::checkBody() {
    80001f84:	ff010113          	addi	sp,sp,-16
    80001f88:	00113423          	sd	ra,8(sp)
    80001f8c:	00813023          	sd	s0,0(sp)
    80001f90:	01010413          	addi	s0,sp,16
    if(this->body != nullptr){
    80001f94:	00053783          	ld	a5,0(a0)
    80001f98:	02078463          	beqz	a5,80001fc0 <_ZN3TCB9checkBodyEv+0x3c>
        printString("Imam body.\n");
    80001f9c:	00003517          	auipc	a0,0x3
    80001fa0:	18c50513          	addi	a0,a0,396 # 80005128 <CONSOLE_STATUS+0x118>
    80001fa4:	00001097          	auipc	ra,0x1
    80001fa8:	95c080e7          	jalr	-1700(ra) # 80002900 <_Z11printStringPKc>
        return true;
    80001fac:	00100513          	li	a0,1
    }else{
        printString("Nemam body.\n");
        return false;
    }
}
    80001fb0:	00813083          	ld	ra,8(sp)
    80001fb4:	00013403          	ld	s0,0(sp)
    80001fb8:	01010113          	addi	sp,sp,16
    80001fbc:	00008067          	ret
        printString("Nemam body.\n");
    80001fc0:	00003517          	auipc	a0,0x3
    80001fc4:	17850513          	addi	a0,a0,376 # 80005138 <CONSOLE_STATUS+0x128>
    80001fc8:	00001097          	auipc	ra,0x1
    80001fcc:	938080e7          	jalr	-1736(ra) # 80002900 <_Z11printStringPKc>
        return false;
    80001fd0:	00000513          	li	a0,0
    80001fd4:	fddff06f          	j	80001fb0 <_ZN3TCB9checkBodyEv+0x2c>

0000000080001fd8 <_ZN3TCB7setBodyEPFvvE>:

void TCB::setBody(TCB::Body body) {
    80001fd8:	ff010113          	addi	sp,sp,-16
    80001fdc:	00813423          	sd	s0,8(sp)
    80001fe0:	01010413          	addi	s0,sp,16
    this->body = body;
    80001fe4:	00b53023          	sd	a1,0(a0)
}
    80001fe8:	00813403          	ld	s0,8(sp)
    80001fec:	01010113          	addi	sp,sp,16
    80001ff0:	00008067          	ret

0000000080001ff4 <_Znwm>:
//
#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"

void *operator new(uint64 n) { return mem_alloc(n); }
    80001ff4:	ff010113          	addi	sp,sp,-16
    80001ff8:	00113423          	sd	ra,8(sp)
    80001ffc:	00813023          	sd	s0,0(sp)
    80002000:	01010413          	addi	s0,sp,16
    80002004:	fffff097          	auipc	ra,0xfffff
    80002008:	230080e7          	jalr	560(ra) # 80001234 <_Z9mem_allocm>
    8000200c:	00813083          	ld	ra,8(sp)
    80002010:	00013403          	ld	s0,0(sp)
    80002014:	01010113          	addi	sp,sp,16
    80002018:	00008067          	ret

000000008000201c <_Znam>:
void *operator new[](uint64 n) { return mem_alloc(n); }
    8000201c:	ff010113          	addi	sp,sp,-16
    80002020:	00113423          	sd	ra,8(sp)
    80002024:	00813023          	sd	s0,0(sp)
    80002028:	01010413          	addi	s0,sp,16
    8000202c:	fffff097          	auipc	ra,0xfffff
    80002030:	208080e7          	jalr	520(ra) # 80001234 <_Z9mem_allocm>
    80002034:	00813083          	ld	ra,8(sp)
    80002038:	00013403          	ld	s0,0(sp)
    8000203c:	01010113          	addi	sp,sp,16
    80002040:	00008067          	ret

0000000080002044 <_ZdlPv>:

void operator delete(void *p) noexcept { mem_free(p); }
    80002044:	ff010113          	addi	sp,sp,-16
    80002048:	00113423          	sd	ra,8(sp)
    8000204c:	00813023          	sd	s0,0(sp)
    80002050:	01010413          	addi	s0,sp,16
    80002054:	fffff097          	auipc	ra,0xfffff
    80002058:	210080e7          	jalr	528(ra) # 80001264 <_Z8mem_freePv>
    8000205c:	00813083          	ld	ra,8(sp)
    80002060:	00013403          	ld	s0,0(sp)
    80002064:	01010113          	addi	sp,sp,16
    80002068:	00008067          	ret

000000008000206c <_ZdaPv>:
void operator delete[](void *p) noexcept { mem_free(p); }
    8000206c:	ff010113          	addi	sp,sp,-16
    80002070:	00113423          	sd	ra,8(sp)
    80002074:	00813023          	sd	s0,0(sp)
    80002078:	01010413          	addi	s0,sp,16
    8000207c:	fffff097          	auipc	ra,0xfffff
    80002080:	1e8080e7          	jalr	488(ra) # 80001264 <_Z8mem_freePv>
    80002084:	00813083          	ld	ra,8(sp)
    80002088:	00013403          	ld	s0,0(sp)
    8000208c:	01010113          	addi	sp,sp,16
    80002090:	00008067          	ret

0000000080002094 <_ZN6ThreadD1Ev>:
Thread::Thread() {
    thread_create(&myHandle, nullptr, nullptr);
    myHandle->myThread = this;
}

Thread::~Thread() {
    80002094:	fe010113          	addi	sp,sp,-32
    80002098:	00113c23          	sd	ra,24(sp)
    8000209c:	00813823          	sd	s0,16(sp)
    800020a0:	00913423          	sd	s1,8(sp)
    800020a4:	02010413          	addi	s0,sp,32
    800020a8:	00004797          	auipc	a5,0x4
    800020ac:	e9078793          	addi	a5,a5,-368 # 80005f38 <_ZTV6Thread+0x10>
    800020b0:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    800020b4:	00853483          	ld	s1,8(a0)
    800020b8:	02048063          	beqz	s1,800020d8 <_ZN6ThreadD1Ev+0x44>
        ~TCB() { delete[] stack; }
    800020bc:	0084b503          	ld	a0,8(s1)
    800020c0:	00050663          	beqz	a0,800020cc <_ZN6ThreadD1Ev+0x38>
    800020c4:	00000097          	auipc	ra,0x0
    800020c8:	fa8080e7          	jalr	-88(ra) # 8000206c <_ZdaPv>
    800020cc:	00048513          	mv	a0,s1
    800020d0:	00000097          	auipc	ra,0x0
    800020d4:	f74080e7          	jalr	-140(ra) # 80002044 <_ZdlPv>
}
    800020d8:	01813083          	ld	ra,24(sp)
    800020dc:	01013403          	ld	s0,16(sp)
    800020e0:	00813483          	ld	s1,8(sp)
    800020e4:	02010113          	addi	sp,sp,32
    800020e8:	00008067          	ret

00000000800020ec <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800020ec:	fe010113          	addi	sp,sp,-32
    800020f0:	00113c23          	sd	ra,24(sp)
    800020f4:	00813823          	sd	s0,16(sp)
    800020f8:	00913423          	sd	s1,8(sp)
    800020fc:	02010413          	addi	s0,sp,32
    80002100:	00050493          	mv	s1,a0
}
    80002104:	00000097          	auipc	ra,0x0
    80002108:	f90080e7          	jalr	-112(ra) # 80002094 <_ZN6ThreadD1Ev>
    8000210c:	00048513          	mv	a0,s1
    80002110:	00000097          	auipc	ra,0x0
    80002114:	f34080e7          	jalr	-204(ra) # 80002044 <_ZdlPv>
    80002118:	01813083          	ld	ra,24(sp)
    8000211c:	01013403          	ld	s0,16(sp)
    80002120:	00813483          	ld	s1,8(sp)
    80002124:	02010113          	addi	sp,sp,32
    80002128:	00008067          	ret

000000008000212c <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    8000212c:	ff010113          	addi	sp,sp,-16
    80002130:	00113423          	sd	ra,8(sp)
    80002134:	00813023          	sd	s0,0(sp)
    80002138:	01010413          	addi	s0,sp,16
    thread_dispatch();
    8000213c:	fffff097          	auipc	ra,0xfffff
    80002140:	1c0080e7          	jalr	448(ra) # 800012fc <_Z15thread_dispatchv>
}
    80002144:	00813083          	ld	ra,8(sp)
    80002148:	00013403          	ld	s0,0(sp)
    8000214c:	01010113          	addi	sp,sp,16
    80002150:	00008067          	ret

0000000080002154 <_ZN6Thread5startEv>:
int Thread::start() {
    80002154:	ff010113          	addi	sp,sp,-16
    80002158:	00113423          	sd	ra,8(sp)
    8000215c:	00813023          	sd	s0,0(sp)
    80002160:	01010413          	addi	s0,sp,16
    Scheduler::put(myHandle);
    80002164:	00853503          	ld	a0,8(a0)
    80002168:	00000097          	auipc	ra,0x0
    8000216c:	47c080e7          	jalr	1148(ra) # 800025e4 <_ZN9Scheduler3putEP3TCB>
}
    80002170:	00100513          	li	a0,1
    80002174:	00813083          	ld	ra,8(sp)
    80002178:	00013403          	ld	s0,0(sp)
    8000217c:	01010113          	addi	sp,sp,16
    80002180:	00008067          	ret

0000000080002184 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80002184:	fe010113          	addi	sp,sp,-32
    80002188:	00113c23          	sd	ra,24(sp)
    8000218c:	00813823          	sd	s0,16(sp)
    80002190:	00913423          	sd	s1,8(sp)
    80002194:	02010413          	addi	s0,sp,32
    80002198:	00050493          	mv	s1,a0
    8000219c:	00004797          	auipc	a5,0x4
    800021a0:	d9c78793          	addi	a5,a5,-612 # 80005f38 <_ZTV6Thread+0x10>
    800021a4:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    800021a8:	00850513          	addi	a0,a0,8
    800021ac:	fffff097          	auipc	ra,0xfffff
    800021b0:	0e8080e7          	jalr	232(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
    myHandle->myThread = this;
    800021b4:	0084b783          	ld	a5,8(s1)
    800021b8:	0297b823          	sd	s1,48(a5)
}
    800021bc:	01813083          	ld	ra,24(sp)
    800021c0:	01013403          	ld	s0,16(sp)
    800021c4:	00813483          	ld	s1,8(sp)
    800021c8:	02010113          	addi	sp,sp,32
    800021cc:	00008067          	ret

00000000800021d0 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800021d0:	fe010113          	addi	sp,sp,-32
    800021d4:	00113c23          	sd	ra,24(sp)
    800021d8:	00813823          	sd	s0,16(sp)
    800021dc:	00913423          	sd	s1,8(sp)
    800021e0:	02010413          	addi	s0,sp,32
    800021e4:	00050493          	mv	s1,a0
    800021e8:	00004797          	auipc	a5,0x4
    800021ec:	d5078793          	addi	a5,a5,-688 # 80005f38 <_ZTV6Thread+0x10>
    800021f0:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, nullptr, nullptr);
    800021f4:	00000613          	li	a2,0
    800021f8:	00000593          	li	a1,0
    800021fc:	00850513          	addi	a0,a0,8
    80002200:	fffff097          	auipc	ra,0xfffff
    80002204:	094080e7          	jalr	148(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
    myHandle->myThread = this;
    80002208:	0084b783          	ld	a5,8(s1)
    8000220c:	0297b823          	sd	s1,48(a5)
}
    80002210:	01813083          	ld	ra,24(sp)
    80002214:	01013403          	ld	s0,16(sp)
    80002218:	00813483          	ld	s1,8(sp)
    8000221c:	02010113          	addi	sp,sp,32
    80002220:	00008067          	ret

0000000080002224 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80002224:	ff010113          	addi	sp,sp,-16
    80002228:	00113423          	sd	ra,8(sp)
    8000222c:	00813023          	sd	s0,0(sp)
    80002230:	01010413          	addi	s0,sp,16
    sem_wait(myHandle);
    80002234:	00853503          	ld	a0,8(a0)
    80002238:	fffff097          	auipc	ra,0xfffff
    8000223c:	150080e7          	jalr	336(ra) # 80001388 <_Z8sem_waitP9KernelSem>
    return 0;
}
    80002240:	00000513          	li	a0,0
    80002244:	00813083          	ld	ra,8(sp)
    80002248:	00013403          	ld	s0,0(sp)
    8000224c:	01010113          	addi	sp,sp,16
    80002250:	00008067          	ret

0000000080002254 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80002254:	ff010113          	addi	sp,sp,-16
    80002258:	00113423          	sd	ra,8(sp)
    8000225c:	00813023          	sd	s0,0(sp)
    80002260:	01010413          	addi	s0,sp,16
    sem_signal(myHandle);
    80002264:	00853503          	ld	a0,8(a0)
    80002268:	fffff097          	auipc	ra,0xfffff
    8000226c:	150080e7          	jalr	336(ra) # 800013b8 <_Z10sem_signalP9KernelSem>
    return 0;
}
    80002270:	00000513          	li	a0,0
    80002274:	00813083          	ld	ra,8(sp)
    80002278:	00013403          	ld	s0,0(sp)
    8000227c:	01010113          	addi	sp,sp,16
    80002280:	00008067          	ret

0000000080002284 <_ZN9SemaphoreC1Ej>:

Semaphore::Semaphore(unsigned int init) {
    80002284:	ff010113          	addi	sp,sp,-16
    80002288:	00113423          	sd	ra,8(sp)
    8000228c:	00813023          	sd	s0,0(sp)
    80002290:	01010413          	addi	s0,sp,16
    80002294:	00004797          	auipc	a5,0x4
    80002298:	c8478793          	addi	a5,a5,-892 # 80005f18 <_ZTV9Semaphore+0x10>
    8000229c:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800022a0:	00850513          	addi	a0,a0,8
    800022a4:	fffff097          	auipc	ra,0xfffff
    800022a8:	07c080e7          	jalr	124(ra) # 80001320 <_Z8sem_openPP9KernelSemj>
}
    800022ac:	00813083          	ld	ra,8(sp)
    800022b0:	00013403          	ld	s0,0(sp)
    800022b4:	01010113          	addi	sp,sp,16
    800022b8:	00008067          	ret

00000000800022bc <_ZN6Thread3runEv>:
    int start ();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
    800022bc:	ff010113          	addi	sp,sp,-16
    800022c0:	00813423          	sd	s0,8(sp)
    800022c4:	01010413          	addi	s0,sp,16
    800022c8:	00813403          	ld	s0,8(sp)
    800022cc:	01010113          	addi	sp,sp,16
    800022d0:	00008067          	ret

00000000800022d4 <_ZN9SemaphoreD1Ev>:
};
class Semaphore {
public:
    Semaphore (unsigned init = 1);

    virtual ~Semaphore (){
    800022d4:	ff010113          	addi	sp,sp,-16
    800022d8:	00813423          	sd	s0,8(sp)
    800022dc:	01010413          	addi	s0,sp,16
        //delete myHandle;
    }
    800022e0:	00813403          	ld	s0,8(sp)
    800022e4:	01010113          	addi	sp,sp,16
    800022e8:	00008067          	ret

00000000800022ec <_ZN9SemaphoreD0Ev>:
    virtual ~Semaphore (){
    800022ec:	ff010113          	addi	sp,sp,-16
    800022f0:	00113423          	sd	ra,8(sp)
    800022f4:	00813023          	sd	s0,0(sp)
    800022f8:	01010413          	addi	s0,sp,16
    }
    800022fc:	00000097          	auipc	ra,0x0
    80002300:	d48080e7          	jalr	-696(ra) # 80002044 <_ZdlPv>
    80002304:	00813083          	ld	ra,8(sp)
    80002308:	00013403          	ld	s0,0(sp)
    8000230c:	01010113          	addi	sp,sp,16
    80002310:	00008067          	ret

0000000080002314 <_ZN5Riscv10popSppSpieEv>:
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"
#include "../h/print.hpp"

void Riscv::popSppSpie() {
    80002314:	ff010113          	addi	sp,sp,-16
    80002318:	00813423          	sd	s0,8(sp)
    8000231c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002320:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80002324:	10200073          	sret
}
    80002328:	00813403          	ld	s0,8(sp)
    8000232c:	01010113          	addi	sp,sp,16
    80002330:	00008067          	ret

0000000080002334 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002334:	f9010113          	addi	sp,sp,-112
    80002338:	06113423          	sd	ra,104(sp)
    8000233c:	06813023          	sd	s0,96(sp)
    80002340:	04913c23          	sd	s1,88(sp)
    80002344:	05213823          	sd	s2,80(sp)
    80002348:	05313423          	sd	s3,72(sp)
    8000234c:	07010413          	addi	s0,sp,112
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002350:	142027f3          	csrr	a5,scause
    80002354:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80002358:	f9843703          	ld	a4,-104(s0)
    uint64 scause = r_scause();

    // velicina gde cu da mu obavestim koji je poziv
    size_t argument0;
    __asm__ volatile("mv %0, a0" : "=r" (argument0));
    8000235c:	00050793          	mv	a5,a0

    if(argument0 != 0 && scause == 0x0000000000000009UL){
    80002360:	00078663          	beqz	a5,8000236c <_ZN5Riscv20handleSupervisorTrapEv+0x38>
    80002364:	00900693          	li	a3,9
    80002368:	04d70863          	beq	a4,a3,800023b8 <_ZN5Riscv20handleSupervisorTrapEv+0x84>
        }


        w_sstatus(sstatus); w_sepc(sepc);
    }
    else if (scause == 0x0000000000000009UL) {
    8000236c:	00900793          	li	a5,9
    80002370:	10f70263          	beq	a4,a5,80002474 <_ZN5Riscv20handleSupervisorTrapEv+0x140>
        // interrupt: no; cause code: environment call from S-mode(9)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch();
        w_sstatus(sstatus); w_sepc(sepc);
    } else if (scause == 0x8000000000000001UL) {
    80002374:	fff00793          	li	a5,-1
    80002378:	03f79793          	slli	a5,a5,0x3f
    8000237c:	00178793          	addi	a5,a5,1
    80002380:	12f70863          	beq	a4,a5,800024b0 <_ZN5Riscv20handleSupervisorTrapEv+0x17c>
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus); w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    } else if (scause == 0x8000000000000009UL) {
    80002384:	fff00793          	li	a5,-1
    80002388:	03f79793          	slli	a5,a5,0x3f
    8000238c:	00978793          	addi	a5,a5,9
    80002390:	18f70663          	beq	a4,a5,8000251c <_ZN5Riscv20handleSupervisorTrapEv+0x1e8>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else {
        // unexpected trap cause
        // definisati
        if (scause == 0x0000000000000005UL){
    80002394:	00500793          	li	a5,5
    80002398:	18f70863          	beq	a4,a5,80002528 <_ZN5Riscv20handleSupervisorTrapEv+0x1f4>
            printString("Error 5\n");
        }

    }
}
    8000239c:	06813083          	ld	ra,104(sp)
    800023a0:	06013403          	ld	s0,96(sp)
    800023a4:	05813483          	ld	s1,88(sp)
    800023a8:	05013903          	ld	s2,80(sp)
    800023ac:	04813983          	ld	s3,72(sp)
    800023b0:	07010113          	addi	sp,sp,112
    800023b4:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800023b8:	14102773          	csrr	a4,sepc
    800023bc:	fae43423          	sd	a4,-88(s0)
    return sepc;
    800023c0:	fa843483          	ld	s1,-88(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    800023c4:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800023c8:	10002773          	csrr	a4,sstatus
    800023cc:	fae43023          	sd	a4,-96(s0)
    return sstatus;
    800023d0:	fa043903          	ld	s2,-96(s0)
        if(argument0 == 1){ // syscall za mem_alloc
    800023d4:	00100713          	li	a4,1
    800023d8:	02e78863          	beq	a5,a4,80002408 <_ZN5Riscv20handleSupervisorTrapEv+0xd4>
        }else if(argument0 == 2){ // sistemski poziv za mem_free
    800023dc:	00200713          	li	a4,2
    800023e0:	02e78e63          	beq	a5,a4,8000241c <_ZN5Riscv20handleSupervisorTrapEv+0xe8>
        }else if(argument0 == 11){
    800023e4:	00b00713          	li	a4,11
    800023e8:	04e78263          	beq	a5,a4,8000242c <_ZN5Riscv20handleSupervisorTrapEv+0xf8>
        }else if(argument0 == 12){
    800023ec:	00c00713          	li	a4,12
    800023f0:	04e78c63          	beq	a5,a4,80002448 <_ZN5Riscv20handleSupervisorTrapEv+0x114>
        }else if(argument0 == 13){
    800023f4:	00d00713          	li	a4,13
    800023f8:	06e78863          	beq	a5,a4,80002468 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800023fc:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002400:	14149073          	csrw	sepc,s1
}
    80002404:	f99ff06f          	j	8000239c <_ZN5Riscv20handleSupervisorTrapEv+0x68>
            __asm__ volatile("mv %0, a1" : "=r" (argument_sizet));
    80002408:	00058513          	mv	a0,a1
            argument_ret_void = MemoryAllocator::mem_alloc(argument_sizet);
    8000240c:	00000097          	auipc	ra,0x0
    80002410:	2c8080e7          	jalr	712(ra) # 800026d4 <_ZN15MemoryAllocator9mem_allocEm>
            __asm__ volatile("mv a0, %0" : : "r" (argument_ret_void));
    80002414:	00050513          	mv	a0,a0
    80002418:	fe5ff06f          	j	800023fc <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
            __asm__ volatile("mv %0, a1" : "=r" (argument_void));
    8000241c:	00058513          	mv	a0,a1
            MemoryAllocator::mem_free(argument_void);
    80002420:	00000097          	auipc	ra,0x0
    80002424:	3f4080e7          	jalr	1012(ra) # 80002814 <_ZN15MemoryAllocator8mem_freeEPv>
    80002428:	fd5ff06f          	j	800023fc <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
            __asm__ volatile("mv %0, a1" : "=r" (handler));
    8000242c:	00058993          	mv	s3,a1
            __asm__ volatile("mv %0, a2" : "=r" (sr));
    80002430:	00060513          	mv	a0,a2
            __asm__ volatile("mv %0, a3" : "=r" (arg));
    80002434:	00068793          	mv	a5,a3
            *handler = TCB::createThread(sr);
    80002438:	00000097          	auipc	ra,0x0
    8000243c:	a38080e7          	jalr	-1480(ra) # 80001e70 <_ZN3TCB12createThreadEPFvvE>
    80002440:	00a9b023          	sd	a0,0(s3)
    80002444:	fb9ff06f          	j	800023fc <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
            TCB::running->setFinished(true);
    80002448:	00004797          	auipc	a5,0x4
    8000244c:	b307b783          	ld	a5,-1232(a5) # 80005f78 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002450:	0007b783          	ld	a5,0(a5)
        void setFinished(bool value) { finished = value; }
    80002454:	00100713          	li	a4,1
    80002458:	02e78423          	sb	a4,40(a5)
            thread_dispatch();
    8000245c:	fffff097          	auipc	ra,0xfffff
    80002460:	ea0080e7          	jalr	-352(ra) # 800012fc <_Z15thread_dispatchv>
    80002464:	f99ff06f          	j	800023fc <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
            TCB::dispatch();
    80002468:	00000097          	auipc	ra,0x0
    8000246c:	a9c080e7          	jalr	-1380(ra) # 80001f04 <_ZN3TCB8dispatchEv>
    80002470:	f8dff06f          	j	800023fc <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002474:	141027f3          	csrr	a5,sepc
    80002478:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    8000247c:	fb843483          	ld	s1,-72(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80002480:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002484:	100027f3          	csrr	a5,sstatus
    80002488:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    8000248c:	fb043903          	ld	s2,-80(s0)
        TCB::timeSliceCounter = 0;
    80002490:	00004797          	auipc	a5,0x4
    80002494:	ad87b783          	ld	a5,-1320(a5) # 80005f68 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002498:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    8000249c:	00000097          	auipc	ra,0x0
    800024a0:	a68080e7          	jalr	-1432(ra) # 80001f04 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800024a4:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800024a8:	14149073          	csrw	sepc,s1
}
    800024ac:	ef1ff06f          	j	8000239c <_ZN5Riscv20handleSupervisorTrapEv+0x68>
        TCB::timeSliceCounter++;
    800024b0:	00004717          	auipc	a4,0x4
    800024b4:	ab873703          	ld	a4,-1352(a4) # 80005f68 <_GLOBAL_OFFSET_TABLE_+0x18>
    800024b8:	00073783          	ld	a5,0(a4)
    800024bc:	00178793          	addi	a5,a5,1
    800024c0:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    800024c4:	00004717          	auipc	a4,0x4
    800024c8:	ab473703          	ld	a4,-1356(a4) # 80005f78 <_GLOBAL_OFFSET_TABLE_+0x28>
    800024cc:	00073703          	ld	a4,0(a4)
        uint64 getTimeSlice() const { return timeSlice; }
    800024d0:	02073703          	ld	a4,32(a4)
    800024d4:	00e7f863          	bgeu	a5,a4,800024e4 <_ZN5Riscv20handleSupervisorTrapEv+0x1b0>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800024d8:	00200793          	li	a5,2
    800024dc:	1447b073          	csrc	sip,a5
}
    800024e0:	ebdff06f          	j	8000239c <_ZN5Riscv20handleSupervisorTrapEv+0x68>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800024e4:	141027f3          	csrr	a5,sepc
    800024e8:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    800024ec:	fc843483          	ld	s1,-56(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800024f0:	100027f3          	csrr	a5,sstatus
    800024f4:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    800024f8:	fc043903          	ld	s2,-64(s0)
            TCB::timeSliceCounter = 0;
    800024fc:	00004797          	auipc	a5,0x4
    80002500:	a6c7b783          	ld	a5,-1428(a5) # 80005f68 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002504:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80002508:	00000097          	auipc	ra,0x0
    8000250c:	9fc080e7          	jalr	-1540(ra) # 80001f04 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002510:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002514:	14149073          	csrw	sepc,s1
}
    80002518:	fc1ff06f          	j	800024d8 <_ZN5Riscv20handleSupervisorTrapEv+0x1a4>
        console_handler();
    8000251c:	00002097          	auipc	ra,0x2
    80002520:	614080e7          	jalr	1556(ra) # 80004b30 <console_handler>
    80002524:	e79ff06f          	j	8000239c <_ZN5Riscv20handleSupervisorTrapEv+0x68>
            printString("Error 5\n");
    80002528:	00003517          	auipc	a0,0x3
    8000252c:	c2050513          	addi	a0,a0,-992 # 80005148 <CONSOLE_STATUS+0x138>
    80002530:	00000097          	auipc	ra,0x0
    80002534:	3d0080e7          	jalr	976(ra) # 80002900 <_Z11printStringPKc>
}
    80002538:	e65ff06f          	j	8000239c <_ZN5Riscv20handleSupervisorTrapEv+0x68>

000000008000253c <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyCoroutineQueue.addLast(tcb);
    8000253c:	ff010113          	addi	sp,sp,-16
    80002540:	00813423          	sd	s0,8(sp)
    80002544:	01010413          	addi	s0,sp,16
    80002548:	00100793          	li	a5,1
    8000254c:	00f50863          	beq	a0,a5,8000255c <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002550:	00813403          	ld	s0,8(sp)
    80002554:	01010113          	addi	sp,sp,16
    80002558:	00008067          	ret
    8000255c:	000107b7          	lui	a5,0x10
    80002560:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002564:	fef596e3          	bne	a1,a5,80002550 <_Z41__static_initialization_and_destruction_0ii+0x14>
        Elem(T *data, Elem *next) : data(data), next(next){}
    };

    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    80002568:	00004797          	auipc	a5,0x4
    8000256c:	a8078793          	addi	a5,a5,-1408 # 80005fe8 <_ZN9Scheduler19readyCoroutineQueueE>
    80002570:	0007b023          	sd	zero,0(a5)
    80002574:	0007b423          	sd	zero,8(a5)
    80002578:	fd9ff06f          	j	80002550 <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000257c <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    8000257c:	fe010113          	addi	sp,sp,-32
    80002580:	00113c23          	sd	ra,24(sp)
    80002584:	00813823          	sd	s0,16(sp)
    80002588:	00913423          	sd	s1,8(sp)
    8000258c:	02010413          	addi	s0,sp,32
        }else{
            head = tail = elem;
        }
    }
    T *removeFirst(){
        if(!head){ return 0; }
    80002590:	00004517          	auipc	a0,0x4
    80002594:	a5853503          	ld	a0,-1448(a0) # 80005fe8 <_ZN9Scheduler19readyCoroutineQueueE>
    80002598:	04050263          	beqz	a0,800025dc <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    8000259c:	00853783          	ld	a5,8(a0)
    800025a0:	00004717          	auipc	a4,0x4
    800025a4:	a4f73423          	sd	a5,-1464(a4) # 80005fe8 <_ZN9Scheduler19readyCoroutineQueueE>
        if(!head){ tail = 0; }
    800025a8:	02078463          	beqz	a5,800025d0 <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    800025ac:	00053483          	ld	s1,0(a0)
        delete elem;
    800025b0:	00000097          	auipc	ra,0x0
    800025b4:	a94080e7          	jalr	-1388(ra) # 80002044 <_ZdlPv>
}
    800025b8:	00048513          	mv	a0,s1
    800025bc:	01813083          	ld	ra,24(sp)
    800025c0:	01013403          	ld	s0,16(sp)
    800025c4:	00813483          	ld	s1,8(sp)
    800025c8:	02010113          	addi	sp,sp,32
    800025cc:	00008067          	ret
        if(!head){ tail = 0; }
    800025d0:	00004797          	auipc	a5,0x4
    800025d4:	a207b023          	sd	zero,-1504(a5) # 80005ff0 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    800025d8:	fd5ff06f          	j	800025ac <_ZN9Scheduler3getEv+0x30>
        if(!head){ return 0; }
    800025dc:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    800025e0:	fd9ff06f          	j	800025b8 <_ZN9Scheduler3getEv+0x3c>

00000000800025e4 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    800025e4:	fe010113          	addi	sp,sp,-32
    800025e8:	00113c23          	sd	ra,24(sp)
    800025ec:	00813823          	sd	s0,16(sp)
    800025f0:	00913423          	sd	s1,8(sp)
    800025f4:	02010413          	addi	s0,sp,32
    800025f8:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    800025fc:	01000513          	li	a0,16
    80002600:	00000097          	auipc	ra,0x0
    80002604:	9f4080e7          	jalr	-1548(ra) # 80001ff4 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    80002608:	00953023          	sd	s1,0(a0)
    8000260c:	00053423          	sd	zero,8(a0)
        if(tail){
    80002610:	00004797          	auipc	a5,0x4
    80002614:	9e07b783          	ld	a5,-1568(a5) # 80005ff0 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80002618:	02078263          	beqz	a5,8000263c <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    8000261c:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80002620:	00004797          	auipc	a5,0x4
    80002624:	9ca7b823          	sd	a0,-1584(a5) # 80005ff0 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80002628:	01813083          	ld	ra,24(sp)
    8000262c:	01013403          	ld	s0,16(sp)
    80002630:	00813483          	ld	s1,8(sp)
    80002634:	02010113          	addi	sp,sp,32
    80002638:	00008067          	ret
            head = tail = elem;
    8000263c:	00004797          	auipc	a5,0x4
    80002640:	9ac78793          	addi	a5,a5,-1620 # 80005fe8 <_ZN9Scheduler19readyCoroutineQueueE>
    80002644:	00a7b423          	sd	a0,8(a5)
    80002648:	00a7b023          	sd	a0,0(a5)
    8000264c:	fddff06f          	j	80002628 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080002650 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80002650:	ff010113          	addi	sp,sp,-16
    80002654:	00113423          	sd	ra,8(sp)
    80002658:	00813023          	sd	s0,0(sp)
    8000265c:	01010413          	addi	s0,sp,16
    80002660:	000105b7          	lui	a1,0x10
    80002664:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002668:	00100513          	li	a0,1
    8000266c:	00000097          	auipc	ra,0x0
    80002670:	ed0080e7          	jalr	-304(ra) # 8000253c <_Z41__static_initialization_and_destruction_0ii>
    80002674:	00813083          	ld	ra,8(sp)
    80002678:	00013403          	ld	s0,0(sp)
    8000267c:	01010113          	addi	sp,sp,16
    80002680:	00008067          	ret

0000000080002684 <_ZN15MemoryAllocator8memAllocEv>:

MemoryBloc* MemoryAllocator::freeMemBlocHead;
MemoryBloc* MemoryAllocator::takenMemBlocHead;

// Inicijalizacija memorije
void MemoryAllocator::memAlloc(){
    80002684:	ff010113          	addi	sp,sp,-16
    80002688:	00813423          	sd	s0,8(sp)
    8000268c:	01010413          	addi	s0,sp,16
    freeMemBlocHead = (MemoryBloc*)HEAP_START_ADDR;
    80002690:	00004797          	auipc	a5,0x4
    80002694:	8c87b783          	ld	a5,-1848(a5) # 80005f58 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002698:	0007b703          	ld	a4,0(a5)
    8000269c:	00004797          	auipc	a5,0x4
    800026a0:	95c78793          	addi	a5,a5,-1700 # 80005ff8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800026a4:	00e7b023          	sd	a4,0(a5)
    freeMemBlocHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    800026a8:	00004697          	auipc	a3,0x4
    800026ac:	8d86b683          	ld	a3,-1832(a3) # 80005f80 <_GLOBAL_OFFSET_TABLE_+0x30>
    800026b0:	0006b683          	ld	a3,0(a3)
    800026b4:	40e686b3          	sub	a3,a3,a4
    800026b8:	00d73023          	sd	a3,0(a4)
    freeMemBlocHead->next = nullptr;
    800026bc:	0007b703          	ld	a4,0(a5)
    800026c0:	00073423          	sd	zero,8(a4)

    takenMemBlocHead = nullptr;
    800026c4:	0007b423          	sd	zero,8(a5)
}
    800026c8:	00813403          	ld	s0,8(sp)
    800026cc:	01010113          	addi	sp,sp,16
    800026d0:	00008067          	ret

00000000800026d4 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc (size_t size){
    800026d4:	ff010113          	addi	sp,sp,-16
    800026d8:	00813423          	sd	s0,8(sp)
    800026dc:	01010413          	addi	s0,sp,16
    size_t newSize;

    // ako je velicina veca od MEM_BLOC_SIZE onda uzmi blokova koliko ti treba + sizeof(MemoryBloc)
    // u suprotnom samo MEM_BLOC_SIZE + sizeof(MemoryBloc)
    if(size > MEM_BLOCK_SIZE){
    800026e0:	04000793          	li	a5,64
    800026e4:	02a7fa63          	bgeu	a5,a0,80002718 <_ZN15MemoryAllocator9mem_allocEm+0x44>
        newSize = ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    800026e8:	00655713          	srli	a4,a0,0x6
    800026ec:	00170713          	addi	a4,a4,1
    800026f0:	00671713          	slli	a4,a4,0x6
    800026f4:	01070713          	addi	a4,a4,16
    }else{
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    }

    // trazim prvi slobodan blok u listi slobodnih blokova gde mogu da alociram
    MemoryBloc* curr = freeMemBlocHead;
    800026f8:	00004617          	auipc	a2,0x4
    800026fc:	90063603          	ld	a2,-1792(a2) # 80005ff8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002700:	00060513          	mv	a0,a2

    while(newSize > curr->size && curr != nullptr){
    80002704:	00053783          	ld	a5,0(a0)
    80002708:	00e7fc63          	bgeu	a5,a4,80002720 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
    8000270c:	00050a63          	beqz	a0,80002720 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
        curr = curr->next;
    80002710:	00853503          	ld	a0,8(a0)
    while(newSize > curr->size && curr != nullptr){
    80002714:	ff1ff06f          	j	80002704 <_ZN15MemoryAllocator9mem_allocEm+0x30>
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    80002718:	05000713          	li	a4,80
    8000271c:	fddff06f          	j	800026f8 <_ZN15MemoryAllocator9mem_allocEm+0x24>
    }

    if(curr == nullptr){
    80002720:	00051863          	bnez	a0,80002730 <_ZN15MemoryAllocator9mem_allocEm+0x5c>
            prevTaken->next = newBloc;
        }
    }

    return (void*)((char*)newBloc + sizeof(MemoryBloc));
};
    80002724:	00813403          	ld	s0,8(sp)
    80002728:	01010113          	addi	sp,sp,16
    8000272c:	00008067          	ret
    if(curr == freeMemBlocHead){
    80002730:	00c50e63          	beq	a0,a2,8000274c <_ZN15MemoryAllocator9mem_allocEm+0x78>
    bool checkFree = false;
    80002734:	00000593          	li	a1,0
    MemoryBloc* next = curr->next;
    80002738:	00853803          	ld	a6,8(a0)
    size_t currSize = curr->size - newSize;
    8000273c:	40e786b3          	sub	a3,a5,a4
    if(currSize == 0){
    80002740:	06e79663          	bne	a5,a4,800027ac <_ZN15MemoryAllocator9mem_allocEm+0xd8>
        MemoryBloc* currFree = freeMemBlocHead;
    80002744:	00060793          	mv	a5,a2
    80002748:	0100006f          	j	80002758 <_ZN15MemoryAllocator9mem_allocEm+0x84>
        checkFree = true;
    8000274c:	00100593          	li	a1,1
    80002750:	fe9ff06f          	j	80002738 <_ZN15MemoryAllocator9mem_allocEm+0x64>
            currFree = currFree->next;
    80002754:	00068793          	mv	a5,a3
        while(currFree != nullptr && currFree->next != curr && checkFree != true){
    80002758:	00078863          	beqz	a5,80002768 <_ZN15MemoryAllocator9mem_allocEm+0x94>
    8000275c:	0087b683          	ld	a3,8(a5)
    80002760:	00a68463          	beq	a3,a0,80002768 <_ZN15MemoryAllocator9mem_allocEm+0x94>
    80002764:	fe0588e3          	beqz	a1,80002754 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(currFree == freeMemBlocHead){
    80002768:	02c78a63          	beq	a5,a2,8000279c <_ZN15MemoryAllocator9mem_allocEm+0xc8>
            currFree->next = curr->next;
    8000276c:	0107b423          	sd	a6,8(a5)
    newBloc->size = newSize;
    80002770:	00e53023          	sd	a4,0(a0)
    if(takenMemBlocHead == nullptr){
    80002774:	00004697          	auipc	a3,0x4
    80002778:	88c6b683          	ld	a3,-1908(a3) # 80006000 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    8000277c:	06068263          	beqz	a3,800027e0 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
        MemoryBloc* nextTaken = takenMemBlocHead;
    80002780:	00068793          	mv	a5,a3
        MemoryBloc* prevTaken = nullptr;
    80002784:	00000713          	li	a4,0
        while (newBloc > nextTaken && nextTaken != nullptr){
    80002788:	06a7f463          	bgeu	a5,a0,800027f0 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
    8000278c:	06078263          	beqz	a5,800027f0 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
            prevTaken = nextTaken;
    80002790:	00078713          	mv	a4,a5
            nextTaken = nextTaken->next;
    80002794:	0087b783          	ld	a5,8(a5)
        while (newBloc > nextTaken && nextTaken != nullptr){
    80002798:	ff1ff06f          	j	80002788 <_ZN15MemoryAllocator9mem_allocEm+0xb4>
            freeMemBlocHead = freeMemBlocHead->next;
    8000279c:	00863783          	ld	a5,8(a2)
    800027a0:	00004697          	auipc	a3,0x4
    800027a4:	84f6bc23          	sd	a5,-1960(a3) # 80005ff8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800027a8:	fc9ff06f          	j	80002770 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
    }else if(checkFree == true){
    800027ac:	02058263          	beqz	a1,800027d0 <_ZN15MemoryAllocator9mem_allocEm+0xfc>
        freeMemBlocHead = (MemoryBloc*)((char*)freeMemBlocHead + newSize);
    800027b0:	00e60633          	add	a2,a2,a4
    800027b4:	00004797          	auipc	a5,0x4
    800027b8:	84478793          	addi	a5,a5,-1980 # 80005ff8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800027bc:	00c7b023          	sd	a2,0(a5)
        freeMemBlocHead->size = currSize;
    800027c0:	00d63023          	sd	a3,0(a2)
        freeMemBlocHead->next = next;
    800027c4:	0007b783          	ld	a5,0(a5)
    800027c8:	0107b423          	sd	a6,8(a5)
    800027cc:	fa5ff06f          	j	80002770 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        curr = (MemoryBloc*)((char*)curr + newSize);
    800027d0:	00e507b3          	add	a5,a0,a4
        curr->size = currSize;
    800027d4:	00d7b023          	sd	a3,0(a5)
        curr->next = next;
    800027d8:	0107b423          	sd	a6,8(a5)
    800027dc:	f95ff06f          	j	80002770 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        takenMemBlocHead = newBloc;
    800027e0:	00004797          	auipc	a5,0x4
    800027e4:	82a7b023          	sd	a0,-2016(a5) # 80006000 <_ZN15MemoryAllocator16takenMemBlocHeadE>
        newBloc->next = nullptr;
    800027e8:	00053423          	sd	zero,8(a0)
    800027ec:	0100006f          	j	800027fc <_ZN15MemoryAllocator9mem_allocEm+0x128>
        if(nextTaken == takenMemBlocHead){
    800027f0:	00f68a63          	beq	a3,a5,80002804 <_ZN15MemoryAllocator9mem_allocEm+0x130>
            newBloc->next = nextTaken;
    800027f4:	00f53423          	sd	a5,8(a0)
            prevTaken->next = newBloc;
    800027f8:	00a73423          	sd	a0,8(a4)
    return (void*)((char*)newBloc + sizeof(MemoryBloc));
    800027fc:	01050513          	addi	a0,a0,16
    80002800:	f25ff06f          	j	80002724 <_ZN15MemoryAllocator9mem_allocEm+0x50>
            newBloc->next = takenMemBlocHead;
    80002804:	00d53423          	sd	a3,8(a0)
            takenMemBlocHead = newBloc;
    80002808:	00003797          	auipc	a5,0x3
    8000280c:	7ea7bc23          	sd	a0,2040(a5) # 80006000 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80002810:	fedff06f          	j	800027fc <_ZN15MemoryAllocator9mem_allocEm+0x128>

0000000080002814 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free (void* mem){
    80002814:	ff010113          	addi	sp,sp,-16
    80002818:	00813423          	sd	s0,8(sp)
    8000281c:	01010413          	addi	s0,sp,16
    void* freeCurr = (void*)((char*)mem - sizeof(MemoryBloc));
    80002820:	ff050513          	addi	a0,a0,-16

    MemoryBloc* curr = takenMemBlocHead;
    80002824:	00003697          	auipc	a3,0x3
    80002828:	7dc6b683          	ld	a3,2012(a3) # 80006000 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    8000282c:	00068793          	mv	a5,a3
    MemoryBloc* prev = nullptr;
    80002830:	00000713          	li	a4,0

    while (curr != freeCurr){
    80002834:	00a78863          	beq	a5,a0,80002844 <_ZN15MemoryAllocator8mem_freeEPv+0x30>
        prev = curr;
    80002838:	00078713          	mv	a4,a5
        curr = curr->next;
    8000283c:	0087b783          	ld	a5,8(a5)
    while (curr != freeCurr){
    80002840:	ff5ff06f          	j	80002834 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
    }
    // uraditi nepredvidjeno ponasanje ako hocu da dealociram nesto sto nisam alocirao
    if(curr == takenMemBlocHead){
    80002844:	02d78863          	beq	a5,a3,80002874 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        takenMemBlocHead = takenMemBlocHead->next;
    }else{
        prev->next = curr->next;
    80002848:	0087b683          	ld	a3,8(a5)
    8000284c:	00d73423          	sd	a3,8(a4)
    }

    if(freeMemBlocHead == nullptr){
    80002850:	00003617          	auipc	a2,0x3
    80002854:	7a863603          	ld	a2,1960(a2) # 80005ff8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002858:	02060663          	beqz	a2,80002884 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        freeMemBlocHead = curr;
    }else{
        MemoryBloc* currFree = freeMemBlocHead;
    8000285c:	00060713          	mv	a4,a2
        MemoryBloc* prevFree = nullptr;
    80002860:	00000693          	li	a3,0

        while(curr > currFree){
    80002864:	02f77663          	bgeu	a4,a5,80002890 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
            prevFree = currFree;
    80002868:	00070693          	mv	a3,a4
            currFree = currFree->next;
    8000286c:	00873703          	ld	a4,8(a4)
        while(curr > currFree){
    80002870:	ff5ff06f          	j	80002864 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
        takenMemBlocHead = takenMemBlocHead->next;
    80002874:	0086b703          	ld	a4,8(a3)
    80002878:	00003697          	auipc	a3,0x3
    8000287c:	78e6b423          	sd	a4,1928(a3) # 80006000 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80002880:	fd1ff06f          	j	80002850 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
        freeMemBlocHead = curr;
    80002884:	00003717          	auipc	a4,0x3
    80002888:	76f73a23          	sd	a5,1908(a4) # 80005ff8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    8000288c:	0100006f          	j	8000289c <_ZN15MemoryAllocator8mem_freeEPv+0x88>
        }

        if(currFree == freeMemBlocHead){
    80002890:	00e60c63          	beq	a2,a4,800028a8 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
            curr->next = freeMemBlocHead;
            freeMemBlocHead = curr;
        }else{
            curr->next = currFree;
    80002894:	00e7b423          	sd	a4,8(a5)
            prevFree->next = curr;
    80002898:	00f6b423          	sd	a5,8(a3)
        }
    }

    MemoryBloc* currMemMerge = freeMemBlocHead;
    8000289c:	00003797          	auipc	a5,0x3
    800028a0:	75c7b783          	ld	a5,1884(a5) # 80005ff8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800028a4:	0300006f          	j	800028d4 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
            curr->next = freeMemBlocHead;
    800028a8:	00c7b423          	sd	a2,8(a5)
            freeMemBlocHead = curr;
    800028ac:	00003717          	auipc	a4,0x3
    800028b0:	74f73623          	sd	a5,1868(a4) # 80005ff8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800028b4:	fe9ff06f          	j	8000289c <_ZN15MemoryAllocator8mem_freeEPv+0x88>

    while(currMemMerge){
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
            currMemMerge->size += currMemMerge->next->size;
    800028b8:	00073603          	ld	a2,0(a4)
    800028bc:	00c686b3          	add	a3,a3,a2
    800028c0:	00d7b023          	sd	a3,0(a5)
            currMemMerge->next = currMemMerge->next->next;
    800028c4:	00873703          	ld	a4,8(a4)
    800028c8:	00e7b423          	sd	a4,8(a5)
    800028cc:	00078713          	mv	a4,a5
    800028d0:	00070793          	mv	a5,a4
    while(currMemMerge){
    800028d4:	00078e63          	beqz	a5,800028f0 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
    800028d8:	0087b703          	ld	a4,8(a5)
    800028dc:	fe070ae3          	beqz	a4,800028d0 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    800028e0:	0007b683          	ld	a3,0(a5)
    800028e4:	00d78633          	add	a2,a5,a3
    800028e8:	fec714e3          	bne	a4,a2,800028d0 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    800028ec:	fcdff06f          	j	800028b8 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            currMemMerge = currMemMerge->next;
        }
    }

    return 0;
    800028f0:	00000513          	li	a0,0
    800028f4:	00813403          	ld	s0,8(sp)
    800028f8:	01010113          	addi	sp,sp,16
    800028fc:	00008067          	ret

0000000080002900 <_Z11printStringPKc>:
#include "../lib/console.h"
#include "../h/riscv.hpp"


void printString(char const *string)
{
    80002900:	fd010113          	addi	sp,sp,-48
    80002904:	02113423          	sd	ra,40(sp)
    80002908:	02813023          	sd	s0,32(sp)
    8000290c:	00913c23          	sd	s1,24(sp)
    80002910:	01213823          	sd	s2,16(sp)
    80002914:	03010413          	addi	s0,sp,48
    80002918:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000291c:	100027f3          	csrr	a5,sstatus
    80002920:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80002924:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002928:	00200793          	li	a5,2
    8000292c:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    80002930:	0004c503          	lbu	a0,0(s1)
    80002934:	00050a63          	beqz	a0,80002948 <_Z11printStringPKc+0x48>
    {
        __putc(*string);
    80002938:	00002097          	auipc	ra,0x2
    8000293c:	184080e7          	jalr	388(ra) # 80004abc <__putc>
        string++;
    80002940:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002944:	fedff06f          	j	80002930 <_Z11printStringPKc+0x30>
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002948:	0009091b          	sext.w	s2,s2
    8000294c:	00297913          	andi	s2,s2,2
    80002950:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002954:	10092073          	csrs	sstatus,s2
}
    80002958:	02813083          	ld	ra,40(sp)
    8000295c:	02013403          	ld	s0,32(sp)
    80002960:	01813483          	ld	s1,24(sp)
    80002964:	01013903          	ld	s2,16(sp)
    80002968:	03010113          	addi	sp,sp,48
    8000296c:	00008067          	ret

0000000080002970 <_Z12printIntegerm>:


void printInteger(uint64 integer){
    80002970:	fd010113          	addi	sp,sp,-48
    80002974:	02113423          	sd	ra,40(sp)
    80002978:	02813023          	sd	s0,32(sp)
    8000297c:	00913c23          	sd	s1,24(sp)
    80002980:	03010413          	addi	s0,sp,48
    neg = 0;
    if(integer < 0){
        neg = 1;
        x = -integer;
    }else{
        x = integer;
    80002984:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80002988:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x%10];
    8000298c:	00a00613          	li	a2,10
    80002990:	02c5773b          	remuw	a4,a0,a2
    80002994:	02071693          	slli	a3,a4,0x20
    80002998:	0206d693          	srli	a3,a3,0x20
    8000299c:	00002717          	auipc	a4,0x2
    800029a0:	7bc70713          	addi	a4,a4,1980 # 80005158 <_ZZ12printIntegermE6digits>
    800029a4:	00d70733          	add	a4,a4,a3
    800029a8:	00074703          	lbu	a4,0(a4)
    800029ac:	fe040693          	addi	a3,s0,-32
    800029b0:	009687b3          	add	a5,a3,s1
    800029b4:	0014849b          	addiw	s1,s1,1
    800029b8:	fee78823          	sb	a4,-16(a5)
    }while((x /= 10) != 0);
    800029bc:	0005071b          	sext.w	a4,a0
    800029c0:	02c5553b          	divuw	a0,a0,a2
    800029c4:	00900793          	li	a5,9
    800029c8:	fce7e2e3          	bltu	a5,a4,8000298c <_Z12printIntegerm+0x1c>
    if(neg){
        buf[i++] = '-';
    }
    while(--i >= 0)
    800029cc:	fff4849b          	addiw	s1,s1,-1
    800029d0:	0004ce63          	bltz	s1,800029ec <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    800029d4:	fe040793          	addi	a5,s0,-32
    800029d8:	009787b3          	add	a5,a5,s1
    800029dc:	ff07c503          	lbu	a0,-16(a5)
    800029e0:	00002097          	auipc	ra,0x2
    800029e4:	0dc080e7          	jalr	220(ra) # 80004abc <__putc>
    800029e8:	fe5ff06f          	j	800029cc <_Z12printIntegerm+0x5c>
    800029ec:	02813083          	ld	ra,40(sp)
    800029f0:	02013403          	ld	s0,32(sp)
    800029f4:	01813483          	ld	s1,24(sp)
    800029f8:	03010113          	addi	sp,sp,48
    800029fc:	00008067          	ret

0000000080002a00 <start>:
    80002a00:	ff010113          	addi	sp,sp,-16
    80002a04:	00813423          	sd	s0,8(sp)
    80002a08:	01010413          	addi	s0,sp,16
    80002a0c:	300027f3          	csrr	a5,mstatus
    80002a10:	ffffe737          	lui	a4,0xffffe
    80002a14:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff758f>
    80002a18:	00e7f7b3          	and	a5,a5,a4
    80002a1c:	00001737          	lui	a4,0x1
    80002a20:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002a24:	00e7e7b3          	or	a5,a5,a4
    80002a28:	30079073          	csrw	mstatus,a5
    80002a2c:	00000797          	auipc	a5,0x0
    80002a30:	16078793          	addi	a5,a5,352 # 80002b8c <system_main>
    80002a34:	34179073          	csrw	mepc,a5
    80002a38:	00000793          	li	a5,0
    80002a3c:	18079073          	csrw	satp,a5
    80002a40:	000107b7          	lui	a5,0x10
    80002a44:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002a48:	30279073          	csrw	medeleg,a5
    80002a4c:	30379073          	csrw	mideleg,a5
    80002a50:	104027f3          	csrr	a5,sie
    80002a54:	2227e793          	ori	a5,a5,546
    80002a58:	10479073          	csrw	sie,a5
    80002a5c:	fff00793          	li	a5,-1
    80002a60:	00a7d793          	srli	a5,a5,0xa
    80002a64:	3b079073          	csrw	pmpaddr0,a5
    80002a68:	00f00793          	li	a5,15
    80002a6c:	3a079073          	csrw	pmpcfg0,a5
    80002a70:	f14027f3          	csrr	a5,mhartid
    80002a74:	0200c737          	lui	a4,0x200c
    80002a78:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002a7c:	0007869b          	sext.w	a3,a5
    80002a80:	00269713          	slli	a4,a3,0x2
    80002a84:	000f4637          	lui	a2,0xf4
    80002a88:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002a8c:	00d70733          	add	a4,a4,a3
    80002a90:	0037979b          	slliw	a5,a5,0x3
    80002a94:	020046b7          	lui	a3,0x2004
    80002a98:	00d787b3          	add	a5,a5,a3
    80002a9c:	00c585b3          	add	a1,a1,a2
    80002aa0:	00371693          	slli	a3,a4,0x3
    80002aa4:	00003717          	auipc	a4,0x3
    80002aa8:	56c70713          	addi	a4,a4,1388 # 80006010 <timer_scratch>
    80002aac:	00b7b023          	sd	a1,0(a5)
    80002ab0:	00d70733          	add	a4,a4,a3
    80002ab4:	00f73c23          	sd	a5,24(a4)
    80002ab8:	02c73023          	sd	a2,32(a4)
    80002abc:	34071073          	csrw	mscratch,a4
    80002ac0:	00000797          	auipc	a5,0x0
    80002ac4:	6e078793          	addi	a5,a5,1760 # 800031a0 <timervec>
    80002ac8:	30579073          	csrw	mtvec,a5
    80002acc:	300027f3          	csrr	a5,mstatus
    80002ad0:	0087e793          	ori	a5,a5,8
    80002ad4:	30079073          	csrw	mstatus,a5
    80002ad8:	304027f3          	csrr	a5,mie
    80002adc:	0807e793          	ori	a5,a5,128
    80002ae0:	30479073          	csrw	mie,a5
    80002ae4:	f14027f3          	csrr	a5,mhartid
    80002ae8:	0007879b          	sext.w	a5,a5
    80002aec:	00078213          	mv	tp,a5
    80002af0:	30200073          	mret
    80002af4:	00813403          	ld	s0,8(sp)
    80002af8:	01010113          	addi	sp,sp,16
    80002afc:	00008067          	ret

0000000080002b00 <timerinit>:
    80002b00:	ff010113          	addi	sp,sp,-16
    80002b04:	00813423          	sd	s0,8(sp)
    80002b08:	01010413          	addi	s0,sp,16
    80002b0c:	f14027f3          	csrr	a5,mhartid
    80002b10:	0200c737          	lui	a4,0x200c
    80002b14:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002b18:	0007869b          	sext.w	a3,a5
    80002b1c:	00269713          	slli	a4,a3,0x2
    80002b20:	000f4637          	lui	a2,0xf4
    80002b24:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002b28:	00d70733          	add	a4,a4,a3
    80002b2c:	0037979b          	slliw	a5,a5,0x3
    80002b30:	020046b7          	lui	a3,0x2004
    80002b34:	00d787b3          	add	a5,a5,a3
    80002b38:	00c585b3          	add	a1,a1,a2
    80002b3c:	00371693          	slli	a3,a4,0x3
    80002b40:	00003717          	auipc	a4,0x3
    80002b44:	4d070713          	addi	a4,a4,1232 # 80006010 <timer_scratch>
    80002b48:	00b7b023          	sd	a1,0(a5)
    80002b4c:	00d70733          	add	a4,a4,a3
    80002b50:	00f73c23          	sd	a5,24(a4)
    80002b54:	02c73023          	sd	a2,32(a4)
    80002b58:	34071073          	csrw	mscratch,a4
    80002b5c:	00000797          	auipc	a5,0x0
    80002b60:	64478793          	addi	a5,a5,1604 # 800031a0 <timervec>
    80002b64:	30579073          	csrw	mtvec,a5
    80002b68:	300027f3          	csrr	a5,mstatus
    80002b6c:	0087e793          	ori	a5,a5,8
    80002b70:	30079073          	csrw	mstatus,a5
    80002b74:	304027f3          	csrr	a5,mie
    80002b78:	0807e793          	ori	a5,a5,128
    80002b7c:	30479073          	csrw	mie,a5
    80002b80:	00813403          	ld	s0,8(sp)
    80002b84:	01010113          	addi	sp,sp,16
    80002b88:	00008067          	ret

0000000080002b8c <system_main>:
    80002b8c:	fe010113          	addi	sp,sp,-32
    80002b90:	00813823          	sd	s0,16(sp)
    80002b94:	00913423          	sd	s1,8(sp)
    80002b98:	00113c23          	sd	ra,24(sp)
    80002b9c:	02010413          	addi	s0,sp,32
    80002ba0:	00000097          	auipc	ra,0x0
    80002ba4:	0c4080e7          	jalr	196(ra) # 80002c64 <cpuid>
    80002ba8:	00003497          	auipc	s1,0x3
    80002bac:	3f848493          	addi	s1,s1,1016 # 80005fa0 <started>
    80002bb0:	02050263          	beqz	a0,80002bd4 <system_main+0x48>
    80002bb4:	0004a783          	lw	a5,0(s1)
    80002bb8:	0007879b          	sext.w	a5,a5
    80002bbc:	fe078ce3          	beqz	a5,80002bb4 <system_main+0x28>
    80002bc0:	0ff0000f          	fence
    80002bc4:	00002517          	auipc	a0,0x2
    80002bc8:	5d450513          	addi	a0,a0,1492 # 80005198 <_ZZ12printIntegermE6digits+0x40>
    80002bcc:	00001097          	auipc	ra,0x1
    80002bd0:	a70080e7          	jalr	-1424(ra) # 8000363c <panic>
    80002bd4:	00001097          	auipc	ra,0x1
    80002bd8:	9c4080e7          	jalr	-1596(ra) # 80003598 <consoleinit>
    80002bdc:	00001097          	auipc	ra,0x1
    80002be0:	150080e7          	jalr	336(ra) # 80003d2c <printfinit>
    80002be4:	00002517          	auipc	a0,0x2
    80002be8:	53c50513          	addi	a0,a0,1340 # 80005120 <CONSOLE_STATUS+0x110>
    80002bec:	00001097          	auipc	ra,0x1
    80002bf0:	aac080e7          	jalr	-1364(ra) # 80003698 <__printf>
    80002bf4:	00002517          	auipc	a0,0x2
    80002bf8:	57450513          	addi	a0,a0,1396 # 80005168 <_ZZ12printIntegermE6digits+0x10>
    80002bfc:	00001097          	auipc	ra,0x1
    80002c00:	a9c080e7          	jalr	-1380(ra) # 80003698 <__printf>
    80002c04:	00002517          	auipc	a0,0x2
    80002c08:	51c50513          	addi	a0,a0,1308 # 80005120 <CONSOLE_STATUS+0x110>
    80002c0c:	00001097          	auipc	ra,0x1
    80002c10:	a8c080e7          	jalr	-1396(ra) # 80003698 <__printf>
    80002c14:	00001097          	auipc	ra,0x1
    80002c18:	4a4080e7          	jalr	1188(ra) # 800040b8 <kinit>
    80002c1c:	00000097          	auipc	ra,0x0
    80002c20:	148080e7          	jalr	328(ra) # 80002d64 <trapinit>
    80002c24:	00000097          	auipc	ra,0x0
    80002c28:	16c080e7          	jalr	364(ra) # 80002d90 <trapinithart>
    80002c2c:	00000097          	auipc	ra,0x0
    80002c30:	5b4080e7          	jalr	1460(ra) # 800031e0 <plicinit>
    80002c34:	00000097          	auipc	ra,0x0
    80002c38:	5d4080e7          	jalr	1492(ra) # 80003208 <plicinithart>
    80002c3c:	00000097          	auipc	ra,0x0
    80002c40:	078080e7          	jalr	120(ra) # 80002cb4 <userinit>
    80002c44:	0ff0000f          	fence
    80002c48:	00100793          	li	a5,1
    80002c4c:	00002517          	auipc	a0,0x2
    80002c50:	53450513          	addi	a0,a0,1332 # 80005180 <_ZZ12printIntegermE6digits+0x28>
    80002c54:	00f4a023          	sw	a5,0(s1)
    80002c58:	00001097          	auipc	ra,0x1
    80002c5c:	a40080e7          	jalr	-1472(ra) # 80003698 <__printf>
    80002c60:	0000006f          	j	80002c60 <system_main+0xd4>

0000000080002c64 <cpuid>:
    80002c64:	ff010113          	addi	sp,sp,-16
    80002c68:	00813423          	sd	s0,8(sp)
    80002c6c:	01010413          	addi	s0,sp,16
    80002c70:	00020513          	mv	a0,tp
    80002c74:	00813403          	ld	s0,8(sp)
    80002c78:	0005051b          	sext.w	a0,a0
    80002c7c:	01010113          	addi	sp,sp,16
    80002c80:	00008067          	ret

0000000080002c84 <mycpu>:
    80002c84:	ff010113          	addi	sp,sp,-16
    80002c88:	00813423          	sd	s0,8(sp)
    80002c8c:	01010413          	addi	s0,sp,16
    80002c90:	00020793          	mv	a5,tp
    80002c94:	00813403          	ld	s0,8(sp)
    80002c98:	0007879b          	sext.w	a5,a5
    80002c9c:	00779793          	slli	a5,a5,0x7
    80002ca0:	00004517          	auipc	a0,0x4
    80002ca4:	3a050513          	addi	a0,a0,928 # 80007040 <cpus>
    80002ca8:	00f50533          	add	a0,a0,a5
    80002cac:	01010113          	addi	sp,sp,16
    80002cb0:	00008067          	ret

0000000080002cb4 <userinit>:
    80002cb4:	ff010113          	addi	sp,sp,-16
    80002cb8:	00813423          	sd	s0,8(sp)
    80002cbc:	01010413          	addi	s0,sp,16
    80002cc0:	00813403          	ld	s0,8(sp)
    80002cc4:	01010113          	addi	sp,sp,16
    80002cc8:	fffff317          	auipc	t1,0xfffff
    80002ccc:	bb430067          	jr	-1100(t1) # 8000187c <main>

0000000080002cd0 <either_copyout>:
    80002cd0:	ff010113          	addi	sp,sp,-16
    80002cd4:	00813023          	sd	s0,0(sp)
    80002cd8:	00113423          	sd	ra,8(sp)
    80002cdc:	01010413          	addi	s0,sp,16
    80002ce0:	02051663          	bnez	a0,80002d0c <either_copyout+0x3c>
    80002ce4:	00058513          	mv	a0,a1
    80002ce8:	00060593          	mv	a1,a2
    80002cec:	0006861b          	sext.w	a2,a3
    80002cf0:	00002097          	auipc	ra,0x2
    80002cf4:	c54080e7          	jalr	-940(ra) # 80004944 <__memmove>
    80002cf8:	00813083          	ld	ra,8(sp)
    80002cfc:	00013403          	ld	s0,0(sp)
    80002d00:	00000513          	li	a0,0
    80002d04:	01010113          	addi	sp,sp,16
    80002d08:	00008067          	ret
    80002d0c:	00002517          	auipc	a0,0x2
    80002d10:	4b450513          	addi	a0,a0,1204 # 800051c0 <_ZZ12printIntegermE6digits+0x68>
    80002d14:	00001097          	auipc	ra,0x1
    80002d18:	928080e7          	jalr	-1752(ra) # 8000363c <panic>

0000000080002d1c <either_copyin>:
    80002d1c:	ff010113          	addi	sp,sp,-16
    80002d20:	00813023          	sd	s0,0(sp)
    80002d24:	00113423          	sd	ra,8(sp)
    80002d28:	01010413          	addi	s0,sp,16
    80002d2c:	02059463          	bnez	a1,80002d54 <either_copyin+0x38>
    80002d30:	00060593          	mv	a1,a2
    80002d34:	0006861b          	sext.w	a2,a3
    80002d38:	00002097          	auipc	ra,0x2
    80002d3c:	c0c080e7          	jalr	-1012(ra) # 80004944 <__memmove>
    80002d40:	00813083          	ld	ra,8(sp)
    80002d44:	00013403          	ld	s0,0(sp)
    80002d48:	00000513          	li	a0,0
    80002d4c:	01010113          	addi	sp,sp,16
    80002d50:	00008067          	ret
    80002d54:	00002517          	auipc	a0,0x2
    80002d58:	49450513          	addi	a0,a0,1172 # 800051e8 <_ZZ12printIntegermE6digits+0x90>
    80002d5c:	00001097          	auipc	ra,0x1
    80002d60:	8e0080e7          	jalr	-1824(ra) # 8000363c <panic>

0000000080002d64 <trapinit>:
    80002d64:	ff010113          	addi	sp,sp,-16
    80002d68:	00813423          	sd	s0,8(sp)
    80002d6c:	01010413          	addi	s0,sp,16
    80002d70:	00813403          	ld	s0,8(sp)
    80002d74:	00002597          	auipc	a1,0x2
    80002d78:	49c58593          	addi	a1,a1,1180 # 80005210 <_ZZ12printIntegermE6digits+0xb8>
    80002d7c:	00004517          	auipc	a0,0x4
    80002d80:	34450513          	addi	a0,a0,836 # 800070c0 <tickslock>
    80002d84:	01010113          	addi	sp,sp,16
    80002d88:	00001317          	auipc	t1,0x1
    80002d8c:	5c030067          	jr	1472(t1) # 80004348 <initlock>

0000000080002d90 <trapinithart>:
    80002d90:	ff010113          	addi	sp,sp,-16
    80002d94:	00813423          	sd	s0,8(sp)
    80002d98:	01010413          	addi	s0,sp,16
    80002d9c:	00000797          	auipc	a5,0x0
    80002da0:	2f478793          	addi	a5,a5,756 # 80003090 <kernelvec>
    80002da4:	10579073          	csrw	stvec,a5
    80002da8:	00813403          	ld	s0,8(sp)
    80002dac:	01010113          	addi	sp,sp,16
    80002db0:	00008067          	ret

0000000080002db4 <usertrap>:
    80002db4:	ff010113          	addi	sp,sp,-16
    80002db8:	00813423          	sd	s0,8(sp)
    80002dbc:	01010413          	addi	s0,sp,16
    80002dc0:	00813403          	ld	s0,8(sp)
    80002dc4:	01010113          	addi	sp,sp,16
    80002dc8:	00008067          	ret

0000000080002dcc <usertrapret>:
    80002dcc:	ff010113          	addi	sp,sp,-16
    80002dd0:	00813423          	sd	s0,8(sp)
    80002dd4:	01010413          	addi	s0,sp,16
    80002dd8:	00813403          	ld	s0,8(sp)
    80002ddc:	01010113          	addi	sp,sp,16
    80002de0:	00008067          	ret

0000000080002de4 <kerneltrap>:
    80002de4:	fe010113          	addi	sp,sp,-32
    80002de8:	00813823          	sd	s0,16(sp)
    80002dec:	00113c23          	sd	ra,24(sp)
    80002df0:	00913423          	sd	s1,8(sp)
    80002df4:	02010413          	addi	s0,sp,32
    80002df8:	142025f3          	csrr	a1,scause
    80002dfc:	100027f3          	csrr	a5,sstatus
    80002e00:	0027f793          	andi	a5,a5,2
    80002e04:	10079c63          	bnez	a5,80002f1c <kerneltrap+0x138>
    80002e08:	142027f3          	csrr	a5,scause
    80002e0c:	0207ce63          	bltz	a5,80002e48 <kerneltrap+0x64>
    80002e10:	00002517          	auipc	a0,0x2
    80002e14:	44850513          	addi	a0,a0,1096 # 80005258 <_ZZ12printIntegermE6digits+0x100>
    80002e18:	00001097          	auipc	ra,0x1
    80002e1c:	880080e7          	jalr	-1920(ra) # 80003698 <__printf>
    80002e20:	141025f3          	csrr	a1,sepc
    80002e24:	14302673          	csrr	a2,stval
    80002e28:	00002517          	auipc	a0,0x2
    80002e2c:	44050513          	addi	a0,a0,1088 # 80005268 <_ZZ12printIntegermE6digits+0x110>
    80002e30:	00001097          	auipc	ra,0x1
    80002e34:	868080e7          	jalr	-1944(ra) # 80003698 <__printf>
    80002e38:	00002517          	auipc	a0,0x2
    80002e3c:	44850513          	addi	a0,a0,1096 # 80005280 <_ZZ12printIntegermE6digits+0x128>
    80002e40:	00000097          	auipc	ra,0x0
    80002e44:	7fc080e7          	jalr	2044(ra) # 8000363c <panic>
    80002e48:	0ff7f713          	andi	a4,a5,255
    80002e4c:	00900693          	li	a3,9
    80002e50:	04d70063          	beq	a4,a3,80002e90 <kerneltrap+0xac>
    80002e54:	fff00713          	li	a4,-1
    80002e58:	03f71713          	slli	a4,a4,0x3f
    80002e5c:	00170713          	addi	a4,a4,1
    80002e60:	fae798e3          	bne	a5,a4,80002e10 <kerneltrap+0x2c>
    80002e64:	00000097          	auipc	ra,0x0
    80002e68:	e00080e7          	jalr	-512(ra) # 80002c64 <cpuid>
    80002e6c:	06050663          	beqz	a0,80002ed8 <kerneltrap+0xf4>
    80002e70:	144027f3          	csrr	a5,sip
    80002e74:	ffd7f793          	andi	a5,a5,-3
    80002e78:	14479073          	csrw	sip,a5
    80002e7c:	01813083          	ld	ra,24(sp)
    80002e80:	01013403          	ld	s0,16(sp)
    80002e84:	00813483          	ld	s1,8(sp)
    80002e88:	02010113          	addi	sp,sp,32
    80002e8c:	00008067          	ret
    80002e90:	00000097          	auipc	ra,0x0
    80002e94:	3c4080e7          	jalr	964(ra) # 80003254 <plic_claim>
    80002e98:	00a00793          	li	a5,10
    80002e9c:	00050493          	mv	s1,a0
    80002ea0:	06f50863          	beq	a0,a5,80002f10 <kerneltrap+0x12c>
    80002ea4:	fc050ce3          	beqz	a0,80002e7c <kerneltrap+0x98>
    80002ea8:	00050593          	mv	a1,a0
    80002eac:	00002517          	auipc	a0,0x2
    80002eb0:	38c50513          	addi	a0,a0,908 # 80005238 <_ZZ12printIntegermE6digits+0xe0>
    80002eb4:	00000097          	auipc	ra,0x0
    80002eb8:	7e4080e7          	jalr	2020(ra) # 80003698 <__printf>
    80002ebc:	01013403          	ld	s0,16(sp)
    80002ec0:	01813083          	ld	ra,24(sp)
    80002ec4:	00048513          	mv	a0,s1
    80002ec8:	00813483          	ld	s1,8(sp)
    80002ecc:	02010113          	addi	sp,sp,32
    80002ed0:	00000317          	auipc	t1,0x0
    80002ed4:	3bc30067          	jr	956(t1) # 8000328c <plic_complete>
    80002ed8:	00004517          	auipc	a0,0x4
    80002edc:	1e850513          	addi	a0,a0,488 # 800070c0 <tickslock>
    80002ee0:	00001097          	auipc	ra,0x1
    80002ee4:	48c080e7          	jalr	1164(ra) # 8000436c <acquire>
    80002ee8:	00003717          	auipc	a4,0x3
    80002eec:	0bc70713          	addi	a4,a4,188 # 80005fa4 <ticks>
    80002ef0:	00072783          	lw	a5,0(a4)
    80002ef4:	00004517          	auipc	a0,0x4
    80002ef8:	1cc50513          	addi	a0,a0,460 # 800070c0 <tickslock>
    80002efc:	0017879b          	addiw	a5,a5,1
    80002f00:	00f72023          	sw	a5,0(a4)
    80002f04:	00001097          	auipc	ra,0x1
    80002f08:	534080e7          	jalr	1332(ra) # 80004438 <release>
    80002f0c:	f65ff06f          	j	80002e70 <kerneltrap+0x8c>
    80002f10:	00001097          	auipc	ra,0x1
    80002f14:	090080e7          	jalr	144(ra) # 80003fa0 <uartintr>
    80002f18:	fa5ff06f          	j	80002ebc <kerneltrap+0xd8>
    80002f1c:	00002517          	auipc	a0,0x2
    80002f20:	2fc50513          	addi	a0,a0,764 # 80005218 <_ZZ12printIntegermE6digits+0xc0>
    80002f24:	00000097          	auipc	ra,0x0
    80002f28:	718080e7          	jalr	1816(ra) # 8000363c <panic>

0000000080002f2c <clockintr>:
    80002f2c:	fe010113          	addi	sp,sp,-32
    80002f30:	00813823          	sd	s0,16(sp)
    80002f34:	00913423          	sd	s1,8(sp)
    80002f38:	00113c23          	sd	ra,24(sp)
    80002f3c:	02010413          	addi	s0,sp,32
    80002f40:	00004497          	auipc	s1,0x4
    80002f44:	18048493          	addi	s1,s1,384 # 800070c0 <tickslock>
    80002f48:	00048513          	mv	a0,s1
    80002f4c:	00001097          	auipc	ra,0x1
    80002f50:	420080e7          	jalr	1056(ra) # 8000436c <acquire>
    80002f54:	00003717          	auipc	a4,0x3
    80002f58:	05070713          	addi	a4,a4,80 # 80005fa4 <ticks>
    80002f5c:	00072783          	lw	a5,0(a4)
    80002f60:	01013403          	ld	s0,16(sp)
    80002f64:	01813083          	ld	ra,24(sp)
    80002f68:	00048513          	mv	a0,s1
    80002f6c:	0017879b          	addiw	a5,a5,1
    80002f70:	00813483          	ld	s1,8(sp)
    80002f74:	00f72023          	sw	a5,0(a4)
    80002f78:	02010113          	addi	sp,sp,32
    80002f7c:	00001317          	auipc	t1,0x1
    80002f80:	4bc30067          	jr	1212(t1) # 80004438 <release>

0000000080002f84 <devintr>:
    80002f84:	142027f3          	csrr	a5,scause
    80002f88:	00000513          	li	a0,0
    80002f8c:	0007c463          	bltz	a5,80002f94 <devintr+0x10>
    80002f90:	00008067          	ret
    80002f94:	fe010113          	addi	sp,sp,-32
    80002f98:	00813823          	sd	s0,16(sp)
    80002f9c:	00113c23          	sd	ra,24(sp)
    80002fa0:	00913423          	sd	s1,8(sp)
    80002fa4:	02010413          	addi	s0,sp,32
    80002fa8:	0ff7f713          	andi	a4,a5,255
    80002fac:	00900693          	li	a3,9
    80002fb0:	04d70c63          	beq	a4,a3,80003008 <devintr+0x84>
    80002fb4:	fff00713          	li	a4,-1
    80002fb8:	03f71713          	slli	a4,a4,0x3f
    80002fbc:	00170713          	addi	a4,a4,1
    80002fc0:	00e78c63          	beq	a5,a4,80002fd8 <devintr+0x54>
    80002fc4:	01813083          	ld	ra,24(sp)
    80002fc8:	01013403          	ld	s0,16(sp)
    80002fcc:	00813483          	ld	s1,8(sp)
    80002fd0:	02010113          	addi	sp,sp,32
    80002fd4:	00008067          	ret
    80002fd8:	00000097          	auipc	ra,0x0
    80002fdc:	c8c080e7          	jalr	-884(ra) # 80002c64 <cpuid>
    80002fe0:	06050663          	beqz	a0,8000304c <devintr+0xc8>
    80002fe4:	144027f3          	csrr	a5,sip
    80002fe8:	ffd7f793          	andi	a5,a5,-3
    80002fec:	14479073          	csrw	sip,a5
    80002ff0:	01813083          	ld	ra,24(sp)
    80002ff4:	01013403          	ld	s0,16(sp)
    80002ff8:	00813483          	ld	s1,8(sp)
    80002ffc:	00200513          	li	a0,2
    80003000:	02010113          	addi	sp,sp,32
    80003004:	00008067          	ret
    80003008:	00000097          	auipc	ra,0x0
    8000300c:	24c080e7          	jalr	588(ra) # 80003254 <plic_claim>
    80003010:	00a00793          	li	a5,10
    80003014:	00050493          	mv	s1,a0
    80003018:	06f50663          	beq	a0,a5,80003084 <devintr+0x100>
    8000301c:	00100513          	li	a0,1
    80003020:	fa0482e3          	beqz	s1,80002fc4 <devintr+0x40>
    80003024:	00048593          	mv	a1,s1
    80003028:	00002517          	auipc	a0,0x2
    8000302c:	21050513          	addi	a0,a0,528 # 80005238 <_ZZ12printIntegermE6digits+0xe0>
    80003030:	00000097          	auipc	ra,0x0
    80003034:	668080e7          	jalr	1640(ra) # 80003698 <__printf>
    80003038:	00048513          	mv	a0,s1
    8000303c:	00000097          	auipc	ra,0x0
    80003040:	250080e7          	jalr	592(ra) # 8000328c <plic_complete>
    80003044:	00100513          	li	a0,1
    80003048:	f7dff06f          	j	80002fc4 <devintr+0x40>
    8000304c:	00004517          	auipc	a0,0x4
    80003050:	07450513          	addi	a0,a0,116 # 800070c0 <tickslock>
    80003054:	00001097          	auipc	ra,0x1
    80003058:	318080e7          	jalr	792(ra) # 8000436c <acquire>
    8000305c:	00003717          	auipc	a4,0x3
    80003060:	f4870713          	addi	a4,a4,-184 # 80005fa4 <ticks>
    80003064:	00072783          	lw	a5,0(a4)
    80003068:	00004517          	auipc	a0,0x4
    8000306c:	05850513          	addi	a0,a0,88 # 800070c0 <tickslock>
    80003070:	0017879b          	addiw	a5,a5,1
    80003074:	00f72023          	sw	a5,0(a4)
    80003078:	00001097          	auipc	ra,0x1
    8000307c:	3c0080e7          	jalr	960(ra) # 80004438 <release>
    80003080:	f65ff06f          	j	80002fe4 <devintr+0x60>
    80003084:	00001097          	auipc	ra,0x1
    80003088:	f1c080e7          	jalr	-228(ra) # 80003fa0 <uartintr>
    8000308c:	fadff06f          	j	80003038 <devintr+0xb4>

0000000080003090 <kernelvec>:
    80003090:	f0010113          	addi	sp,sp,-256
    80003094:	00113023          	sd	ra,0(sp)
    80003098:	00213423          	sd	sp,8(sp)
    8000309c:	00313823          	sd	gp,16(sp)
    800030a0:	00413c23          	sd	tp,24(sp)
    800030a4:	02513023          	sd	t0,32(sp)
    800030a8:	02613423          	sd	t1,40(sp)
    800030ac:	02713823          	sd	t2,48(sp)
    800030b0:	02813c23          	sd	s0,56(sp)
    800030b4:	04913023          	sd	s1,64(sp)
    800030b8:	04a13423          	sd	a0,72(sp)
    800030bc:	04b13823          	sd	a1,80(sp)
    800030c0:	04c13c23          	sd	a2,88(sp)
    800030c4:	06d13023          	sd	a3,96(sp)
    800030c8:	06e13423          	sd	a4,104(sp)
    800030cc:	06f13823          	sd	a5,112(sp)
    800030d0:	07013c23          	sd	a6,120(sp)
    800030d4:	09113023          	sd	a7,128(sp)
    800030d8:	09213423          	sd	s2,136(sp)
    800030dc:	09313823          	sd	s3,144(sp)
    800030e0:	09413c23          	sd	s4,152(sp)
    800030e4:	0b513023          	sd	s5,160(sp)
    800030e8:	0b613423          	sd	s6,168(sp)
    800030ec:	0b713823          	sd	s7,176(sp)
    800030f0:	0b813c23          	sd	s8,184(sp)
    800030f4:	0d913023          	sd	s9,192(sp)
    800030f8:	0da13423          	sd	s10,200(sp)
    800030fc:	0db13823          	sd	s11,208(sp)
    80003100:	0dc13c23          	sd	t3,216(sp)
    80003104:	0fd13023          	sd	t4,224(sp)
    80003108:	0fe13423          	sd	t5,232(sp)
    8000310c:	0ff13823          	sd	t6,240(sp)
    80003110:	cd5ff0ef          	jal	ra,80002de4 <kerneltrap>
    80003114:	00013083          	ld	ra,0(sp)
    80003118:	00813103          	ld	sp,8(sp)
    8000311c:	01013183          	ld	gp,16(sp)
    80003120:	02013283          	ld	t0,32(sp)
    80003124:	02813303          	ld	t1,40(sp)
    80003128:	03013383          	ld	t2,48(sp)
    8000312c:	03813403          	ld	s0,56(sp)
    80003130:	04013483          	ld	s1,64(sp)
    80003134:	04813503          	ld	a0,72(sp)
    80003138:	05013583          	ld	a1,80(sp)
    8000313c:	05813603          	ld	a2,88(sp)
    80003140:	06013683          	ld	a3,96(sp)
    80003144:	06813703          	ld	a4,104(sp)
    80003148:	07013783          	ld	a5,112(sp)
    8000314c:	07813803          	ld	a6,120(sp)
    80003150:	08013883          	ld	a7,128(sp)
    80003154:	08813903          	ld	s2,136(sp)
    80003158:	09013983          	ld	s3,144(sp)
    8000315c:	09813a03          	ld	s4,152(sp)
    80003160:	0a013a83          	ld	s5,160(sp)
    80003164:	0a813b03          	ld	s6,168(sp)
    80003168:	0b013b83          	ld	s7,176(sp)
    8000316c:	0b813c03          	ld	s8,184(sp)
    80003170:	0c013c83          	ld	s9,192(sp)
    80003174:	0c813d03          	ld	s10,200(sp)
    80003178:	0d013d83          	ld	s11,208(sp)
    8000317c:	0d813e03          	ld	t3,216(sp)
    80003180:	0e013e83          	ld	t4,224(sp)
    80003184:	0e813f03          	ld	t5,232(sp)
    80003188:	0f013f83          	ld	t6,240(sp)
    8000318c:	10010113          	addi	sp,sp,256
    80003190:	10200073          	sret
    80003194:	00000013          	nop
    80003198:	00000013          	nop
    8000319c:	00000013          	nop

00000000800031a0 <timervec>:
    800031a0:	34051573          	csrrw	a0,mscratch,a0
    800031a4:	00b53023          	sd	a1,0(a0)
    800031a8:	00c53423          	sd	a2,8(a0)
    800031ac:	00d53823          	sd	a3,16(a0)
    800031b0:	01853583          	ld	a1,24(a0)
    800031b4:	02053603          	ld	a2,32(a0)
    800031b8:	0005b683          	ld	a3,0(a1)
    800031bc:	00c686b3          	add	a3,a3,a2
    800031c0:	00d5b023          	sd	a3,0(a1)
    800031c4:	00200593          	li	a1,2
    800031c8:	14459073          	csrw	sip,a1
    800031cc:	01053683          	ld	a3,16(a0)
    800031d0:	00853603          	ld	a2,8(a0)
    800031d4:	00053583          	ld	a1,0(a0)
    800031d8:	34051573          	csrrw	a0,mscratch,a0
    800031dc:	30200073          	mret

00000000800031e0 <plicinit>:
    800031e0:	ff010113          	addi	sp,sp,-16
    800031e4:	00813423          	sd	s0,8(sp)
    800031e8:	01010413          	addi	s0,sp,16
    800031ec:	00813403          	ld	s0,8(sp)
    800031f0:	0c0007b7          	lui	a5,0xc000
    800031f4:	00100713          	li	a4,1
    800031f8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800031fc:	00e7a223          	sw	a4,4(a5)
    80003200:	01010113          	addi	sp,sp,16
    80003204:	00008067          	ret

0000000080003208 <plicinithart>:
    80003208:	ff010113          	addi	sp,sp,-16
    8000320c:	00813023          	sd	s0,0(sp)
    80003210:	00113423          	sd	ra,8(sp)
    80003214:	01010413          	addi	s0,sp,16
    80003218:	00000097          	auipc	ra,0x0
    8000321c:	a4c080e7          	jalr	-1460(ra) # 80002c64 <cpuid>
    80003220:	0085171b          	slliw	a4,a0,0x8
    80003224:	0c0027b7          	lui	a5,0xc002
    80003228:	00e787b3          	add	a5,a5,a4
    8000322c:	40200713          	li	a4,1026
    80003230:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003234:	00813083          	ld	ra,8(sp)
    80003238:	00013403          	ld	s0,0(sp)
    8000323c:	00d5151b          	slliw	a0,a0,0xd
    80003240:	0c2017b7          	lui	a5,0xc201
    80003244:	00a78533          	add	a0,a5,a0
    80003248:	00052023          	sw	zero,0(a0)
    8000324c:	01010113          	addi	sp,sp,16
    80003250:	00008067          	ret

0000000080003254 <plic_claim>:
    80003254:	ff010113          	addi	sp,sp,-16
    80003258:	00813023          	sd	s0,0(sp)
    8000325c:	00113423          	sd	ra,8(sp)
    80003260:	01010413          	addi	s0,sp,16
    80003264:	00000097          	auipc	ra,0x0
    80003268:	a00080e7          	jalr	-1536(ra) # 80002c64 <cpuid>
    8000326c:	00813083          	ld	ra,8(sp)
    80003270:	00013403          	ld	s0,0(sp)
    80003274:	00d5151b          	slliw	a0,a0,0xd
    80003278:	0c2017b7          	lui	a5,0xc201
    8000327c:	00a78533          	add	a0,a5,a0
    80003280:	00452503          	lw	a0,4(a0)
    80003284:	01010113          	addi	sp,sp,16
    80003288:	00008067          	ret

000000008000328c <plic_complete>:
    8000328c:	fe010113          	addi	sp,sp,-32
    80003290:	00813823          	sd	s0,16(sp)
    80003294:	00913423          	sd	s1,8(sp)
    80003298:	00113c23          	sd	ra,24(sp)
    8000329c:	02010413          	addi	s0,sp,32
    800032a0:	00050493          	mv	s1,a0
    800032a4:	00000097          	auipc	ra,0x0
    800032a8:	9c0080e7          	jalr	-1600(ra) # 80002c64 <cpuid>
    800032ac:	01813083          	ld	ra,24(sp)
    800032b0:	01013403          	ld	s0,16(sp)
    800032b4:	00d5179b          	slliw	a5,a0,0xd
    800032b8:	0c201737          	lui	a4,0xc201
    800032bc:	00f707b3          	add	a5,a4,a5
    800032c0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800032c4:	00813483          	ld	s1,8(sp)
    800032c8:	02010113          	addi	sp,sp,32
    800032cc:	00008067          	ret

00000000800032d0 <consolewrite>:
    800032d0:	fb010113          	addi	sp,sp,-80
    800032d4:	04813023          	sd	s0,64(sp)
    800032d8:	04113423          	sd	ra,72(sp)
    800032dc:	02913c23          	sd	s1,56(sp)
    800032e0:	03213823          	sd	s2,48(sp)
    800032e4:	03313423          	sd	s3,40(sp)
    800032e8:	03413023          	sd	s4,32(sp)
    800032ec:	01513c23          	sd	s5,24(sp)
    800032f0:	05010413          	addi	s0,sp,80
    800032f4:	06c05c63          	blez	a2,8000336c <consolewrite+0x9c>
    800032f8:	00060993          	mv	s3,a2
    800032fc:	00050a13          	mv	s4,a0
    80003300:	00058493          	mv	s1,a1
    80003304:	00000913          	li	s2,0
    80003308:	fff00a93          	li	s5,-1
    8000330c:	01c0006f          	j	80003328 <consolewrite+0x58>
    80003310:	fbf44503          	lbu	a0,-65(s0)
    80003314:	0019091b          	addiw	s2,s2,1
    80003318:	00148493          	addi	s1,s1,1
    8000331c:	00001097          	auipc	ra,0x1
    80003320:	a9c080e7          	jalr	-1380(ra) # 80003db8 <uartputc>
    80003324:	03298063          	beq	s3,s2,80003344 <consolewrite+0x74>
    80003328:	00048613          	mv	a2,s1
    8000332c:	00100693          	li	a3,1
    80003330:	000a0593          	mv	a1,s4
    80003334:	fbf40513          	addi	a0,s0,-65
    80003338:	00000097          	auipc	ra,0x0
    8000333c:	9e4080e7          	jalr	-1564(ra) # 80002d1c <either_copyin>
    80003340:	fd5518e3          	bne	a0,s5,80003310 <consolewrite+0x40>
    80003344:	04813083          	ld	ra,72(sp)
    80003348:	04013403          	ld	s0,64(sp)
    8000334c:	03813483          	ld	s1,56(sp)
    80003350:	02813983          	ld	s3,40(sp)
    80003354:	02013a03          	ld	s4,32(sp)
    80003358:	01813a83          	ld	s5,24(sp)
    8000335c:	00090513          	mv	a0,s2
    80003360:	03013903          	ld	s2,48(sp)
    80003364:	05010113          	addi	sp,sp,80
    80003368:	00008067          	ret
    8000336c:	00000913          	li	s2,0
    80003370:	fd5ff06f          	j	80003344 <consolewrite+0x74>

0000000080003374 <consoleread>:
    80003374:	f9010113          	addi	sp,sp,-112
    80003378:	06813023          	sd	s0,96(sp)
    8000337c:	04913c23          	sd	s1,88(sp)
    80003380:	05213823          	sd	s2,80(sp)
    80003384:	05313423          	sd	s3,72(sp)
    80003388:	05413023          	sd	s4,64(sp)
    8000338c:	03513c23          	sd	s5,56(sp)
    80003390:	03613823          	sd	s6,48(sp)
    80003394:	03713423          	sd	s7,40(sp)
    80003398:	03813023          	sd	s8,32(sp)
    8000339c:	06113423          	sd	ra,104(sp)
    800033a0:	01913c23          	sd	s9,24(sp)
    800033a4:	07010413          	addi	s0,sp,112
    800033a8:	00060b93          	mv	s7,a2
    800033ac:	00050913          	mv	s2,a0
    800033b0:	00058c13          	mv	s8,a1
    800033b4:	00060b1b          	sext.w	s6,a2
    800033b8:	00004497          	auipc	s1,0x4
    800033bc:	d3048493          	addi	s1,s1,-720 # 800070e8 <cons>
    800033c0:	00400993          	li	s3,4
    800033c4:	fff00a13          	li	s4,-1
    800033c8:	00a00a93          	li	s5,10
    800033cc:	05705e63          	blez	s7,80003428 <consoleread+0xb4>
    800033d0:	09c4a703          	lw	a4,156(s1)
    800033d4:	0984a783          	lw	a5,152(s1)
    800033d8:	0007071b          	sext.w	a4,a4
    800033dc:	08e78463          	beq	a5,a4,80003464 <consoleread+0xf0>
    800033e0:	07f7f713          	andi	a4,a5,127
    800033e4:	00e48733          	add	a4,s1,a4
    800033e8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800033ec:	0017869b          	addiw	a3,a5,1
    800033f0:	08d4ac23          	sw	a3,152(s1)
    800033f4:	00070c9b          	sext.w	s9,a4
    800033f8:	0b370663          	beq	a4,s3,800034a4 <consoleread+0x130>
    800033fc:	00100693          	li	a3,1
    80003400:	f9f40613          	addi	a2,s0,-97
    80003404:	000c0593          	mv	a1,s8
    80003408:	00090513          	mv	a0,s2
    8000340c:	f8e40fa3          	sb	a4,-97(s0)
    80003410:	00000097          	auipc	ra,0x0
    80003414:	8c0080e7          	jalr	-1856(ra) # 80002cd0 <either_copyout>
    80003418:	01450863          	beq	a0,s4,80003428 <consoleread+0xb4>
    8000341c:	001c0c13          	addi	s8,s8,1
    80003420:	fffb8b9b          	addiw	s7,s7,-1
    80003424:	fb5c94e3          	bne	s9,s5,800033cc <consoleread+0x58>
    80003428:	000b851b          	sext.w	a0,s7
    8000342c:	06813083          	ld	ra,104(sp)
    80003430:	06013403          	ld	s0,96(sp)
    80003434:	05813483          	ld	s1,88(sp)
    80003438:	05013903          	ld	s2,80(sp)
    8000343c:	04813983          	ld	s3,72(sp)
    80003440:	04013a03          	ld	s4,64(sp)
    80003444:	03813a83          	ld	s5,56(sp)
    80003448:	02813b83          	ld	s7,40(sp)
    8000344c:	02013c03          	ld	s8,32(sp)
    80003450:	01813c83          	ld	s9,24(sp)
    80003454:	40ab053b          	subw	a0,s6,a0
    80003458:	03013b03          	ld	s6,48(sp)
    8000345c:	07010113          	addi	sp,sp,112
    80003460:	00008067          	ret
    80003464:	00001097          	auipc	ra,0x1
    80003468:	1d8080e7          	jalr	472(ra) # 8000463c <push_on>
    8000346c:	0984a703          	lw	a4,152(s1)
    80003470:	09c4a783          	lw	a5,156(s1)
    80003474:	0007879b          	sext.w	a5,a5
    80003478:	fef70ce3          	beq	a4,a5,80003470 <consoleread+0xfc>
    8000347c:	00001097          	auipc	ra,0x1
    80003480:	234080e7          	jalr	564(ra) # 800046b0 <pop_on>
    80003484:	0984a783          	lw	a5,152(s1)
    80003488:	07f7f713          	andi	a4,a5,127
    8000348c:	00e48733          	add	a4,s1,a4
    80003490:	01874703          	lbu	a4,24(a4)
    80003494:	0017869b          	addiw	a3,a5,1
    80003498:	08d4ac23          	sw	a3,152(s1)
    8000349c:	00070c9b          	sext.w	s9,a4
    800034a0:	f5371ee3          	bne	a4,s3,800033fc <consoleread+0x88>
    800034a4:	000b851b          	sext.w	a0,s7
    800034a8:	f96bf2e3          	bgeu	s7,s6,8000342c <consoleread+0xb8>
    800034ac:	08f4ac23          	sw	a5,152(s1)
    800034b0:	f7dff06f          	j	8000342c <consoleread+0xb8>

00000000800034b4 <consputc>:
    800034b4:	10000793          	li	a5,256
    800034b8:	00f50663          	beq	a0,a5,800034c4 <consputc+0x10>
    800034bc:	00001317          	auipc	t1,0x1
    800034c0:	9f430067          	jr	-1548(t1) # 80003eb0 <uartputc_sync>
    800034c4:	ff010113          	addi	sp,sp,-16
    800034c8:	00113423          	sd	ra,8(sp)
    800034cc:	00813023          	sd	s0,0(sp)
    800034d0:	01010413          	addi	s0,sp,16
    800034d4:	00800513          	li	a0,8
    800034d8:	00001097          	auipc	ra,0x1
    800034dc:	9d8080e7          	jalr	-1576(ra) # 80003eb0 <uartputc_sync>
    800034e0:	02000513          	li	a0,32
    800034e4:	00001097          	auipc	ra,0x1
    800034e8:	9cc080e7          	jalr	-1588(ra) # 80003eb0 <uartputc_sync>
    800034ec:	00013403          	ld	s0,0(sp)
    800034f0:	00813083          	ld	ra,8(sp)
    800034f4:	00800513          	li	a0,8
    800034f8:	01010113          	addi	sp,sp,16
    800034fc:	00001317          	auipc	t1,0x1
    80003500:	9b430067          	jr	-1612(t1) # 80003eb0 <uartputc_sync>

0000000080003504 <consoleintr>:
    80003504:	fe010113          	addi	sp,sp,-32
    80003508:	00813823          	sd	s0,16(sp)
    8000350c:	00913423          	sd	s1,8(sp)
    80003510:	01213023          	sd	s2,0(sp)
    80003514:	00113c23          	sd	ra,24(sp)
    80003518:	02010413          	addi	s0,sp,32
    8000351c:	00004917          	auipc	s2,0x4
    80003520:	bcc90913          	addi	s2,s2,-1076 # 800070e8 <cons>
    80003524:	00050493          	mv	s1,a0
    80003528:	00090513          	mv	a0,s2
    8000352c:	00001097          	auipc	ra,0x1
    80003530:	e40080e7          	jalr	-448(ra) # 8000436c <acquire>
    80003534:	02048c63          	beqz	s1,8000356c <consoleintr+0x68>
    80003538:	0a092783          	lw	a5,160(s2)
    8000353c:	09892703          	lw	a4,152(s2)
    80003540:	07f00693          	li	a3,127
    80003544:	40e7873b          	subw	a4,a5,a4
    80003548:	02e6e263          	bltu	a3,a4,8000356c <consoleintr+0x68>
    8000354c:	00d00713          	li	a4,13
    80003550:	04e48063          	beq	s1,a4,80003590 <consoleintr+0x8c>
    80003554:	07f7f713          	andi	a4,a5,127
    80003558:	00e90733          	add	a4,s2,a4
    8000355c:	0017879b          	addiw	a5,a5,1
    80003560:	0af92023          	sw	a5,160(s2)
    80003564:	00970c23          	sb	s1,24(a4)
    80003568:	08f92e23          	sw	a5,156(s2)
    8000356c:	01013403          	ld	s0,16(sp)
    80003570:	01813083          	ld	ra,24(sp)
    80003574:	00813483          	ld	s1,8(sp)
    80003578:	00013903          	ld	s2,0(sp)
    8000357c:	00004517          	auipc	a0,0x4
    80003580:	b6c50513          	addi	a0,a0,-1172 # 800070e8 <cons>
    80003584:	02010113          	addi	sp,sp,32
    80003588:	00001317          	auipc	t1,0x1
    8000358c:	eb030067          	jr	-336(t1) # 80004438 <release>
    80003590:	00a00493          	li	s1,10
    80003594:	fc1ff06f          	j	80003554 <consoleintr+0x50>

0000000080003598 <consoleinit>:
    80003598:	fe010113          	addi	sp,sp,-32
    8000359c:	00113c23          	sd	ra,24(sp)
    800035a0:	00813823          	sd	s0,16(sp)
    800035a4:	00913423          	sd	s1,8(sp)
    800035a8:	02010413          	addi	s0,sp,32
    800035ac:	00004497          	auipc	s1,0x4
    800035b0:	b3c48493          	addi	s1,s1,-1220 # 800070e8 <cons>
    800035b4:	00048513          	mv	a0,s1
    800035b8:	00002597          	auipc	a1,0x2
    800035bc:	cd858593          	addi	a1,a1,-808 # 80005290 <_ZZ12printIntegermE6digits+0x138>
    800035c0:	00001097          	auipc	ra,0x1
    800035c4:	d88080e7          	jalr	-632(ra) # 80004348 <initlock>
    800035c8:	00000097          	auipc	ra,0x0
    800035cc:	7ac080e7          	jalr	1964(ra) # 80003d74 <uartinit>
    800035d0:	01813083          	ld	ra,24(sp)
    800035d4:	01013403          	ld	s0,16(sp)
    800035d8:	00000797          	auipc	a5,0x0
    800035dc:	d9c78793          	addi	a5,a5,-612 # 80003374 <consoleread>
    800035e0:	0af4bc23          	sd	a5,184(s1)
    800035e4:	00000797          	auipc	a5,0x0
    800035e8:	cec78793          	addi	a5,a5,-788 # 800032d0 <consolewrite>
    800035ec:	0cf4b023          	sd	a5,192(s1)
    800035f0:	00813483          	ld	s1,8(sp)
    800035f4:	02010113          	addi	sp,sp,32
    800035f8:	00008067          	ret

00000000800035fc <console_read>:
    800035fc:	ff010113          	addi	sp,sp,-16
    80003600:	00813423          	sd	s0,8(sp)
    80003604:	01010413          	addi	s0,sp,16
    80003608:	00813403          	ld	s0,8(sp)
    8000360c:	00004317          	auipc	t1,0x4
    80003610:	b9433303          	ld	t1,-1132(t1) # 800071a0 <devsw+0x10>
    80003614:	01010113          	addi	sp,sp,16
    80003618:	00030067          	jr	t1

000000008000361c <console_write>:
    8000361c:	ff010113          	addi	sp,sp,-16
    80003620:	00813423          	sd	s0,8(sp)
    80003624:	01010413          	addi	s0,sp,16
    80003628:	00813403          	ld	s0,8(sp)
    8000362c:	00004317          	auipc	t1,0x4
    80003630:	b7c33303          	ld	t1,-1156(t1) # 800071a8 <devsw+0x18>
    80003634:	01010113          	addi	sp,sp,16
    80003638:	00030067          	jr	t1

000000008000363c <panic>:
    8000363c:	fe010113          	addi	sp,sp,-32
    80003640:	00113c23          	sd	ra,24(sp)
    80003644:	00813823          	sd	s0,16(sp)
    80003648:	00913423          	sd	s1,8(sp)
    8000364c:	02010413          	addi	s0,sp,32
    80003650:	00050493          	mv	s1,a0
    80003654:	00002517          	auipc	a0,0x2
    80003658:	c4450513          	addi	a0,a0,-956 # 80005298 <_ZZ12printIntegermE6digits+0x140>
    8000365c:	00004797          	auipc	a5,0x4
    80003660:	be07a623          	sw	zero,-1044(a5) # 80007248 <pr+0x18>
    80003664:	00000097          	auipc	ra,0x0
    80003668:	034080e7          	jalr	52(ra) # 80003698 <__printf>
    8000366c:	00048513          	mv	a0,s1
    80003670:	00000097          	auipc	ra,0x0
    80003674:	028080e7          	jalr	40(ra) # 80003698 <__printf>
    80003678:	00002517          	auipc	a0,0x2
    8000367c:	aa850513          	addi	a0,a0,-1368 # 80005120 <CONSOLE_STATUS+0x110>
    80003680:	00000097          	auipc	ra,0x0
    80003684:	018080e7          	jalr	24(ra) # 80003698 <__printf>
    80003688:	00100793          	li	a5,1
    8000368c:	00003717          	auipc	a4,0x3
    80003690:	90f72e23          	sw	a5,-1764(a4) # 80005fa8 <panicked>
    80003694:	0000006f          	j	80003694 <panic+0x58>

0000000080003698 <__printf>:
    80003698:	f3010113          	addi	sp,sp,-208
    8000369c:	08813023          	sd	s0,128(sp)
    800036a0:	07313423          	sd	s3,104(sp)
    800036a4:	09010413          	addi	s0,sp,144
    800036a8:	05813023          	sd	s8,64(sp)
    800036ac:	08113423          	sd	ra,136(sp)
    800036b0:	06913c23          	sd	s1,120(sp)
    800036b4:	07213823          	sd	s2,112(sp)
    800036b8:	07413023          	sd	s4,96(sp)
    800036bc:	05513c23          	sd	s5,88(sp)
    800036c0:	05613823          	sd	s6,80(sp)
    800036c4:	05713423          	sd	s7,72(sp)
    800036c8:	03913c23          	sd	s9,56(sp)
    800036cc:	03a13823          	sd	s10,48(sp)
    800036d0:	03b13423          	sd	s11,40(sp)
    800036d4:	00004317          	auipc	t1,0x4
    800036d8:	b5c30313          	addi	t1,t1,-1188 # 80007230 <pr>
    800036dc:	01832c03          	lw	s8,24(t1)
    800036e0:	00b43423          	sd	a1,8(s0)
    800036e4:	00c43823          	sd	a2,16(s0)
    800036e8:	00d43c23          	sd	a3,24(s0)
    800036ec:	02e43023          	sd	a4,32(s0)
    800036f0:	02f43423          	sd	a5,40(s0)
    800036f4:	03043823          	sd	a6,48(s0)
    800036f8:	03143c23          	sd	a7,56(s0)
    800036fc:	00050993          	mv	s3,a0
    80003700:	4a0c1663          	bnez	s8,80003bac <__printf+0x514>
    80003704:	60098c63          	beqz	s3,80003d1c <__printf+0x684>
    80003708:	0009c503          	lbu	a0,0(s3)
    8000370c:	00840793          	addi	a5,s0,8
    80003710:	f6f43c23          	sd	a5,-136(s0)
    80003714:	00000493          	li	s1,0
    80003718:	22050063          	beqz	a0,80003938 <__printf+0x2a0>
    8000371c:	00002a37          	lui	s4,0x2
    80003720:	00018ab7          	lui	s5,0x18
    80003724:	000f4b37          	lui	s6,0xf4
    80003728:	00989bb7          	lui	s7,0x989
    8000372c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003730:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003734:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003738:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000373c:	00148c9b          	addiw	s9,s1,1
    80003740:	02500793          	li	a5,37
    80003744:	01998933          	add	s2,s3,s9
    80003748:	38f51263          	bne	a0,a5,80003acc <__printf+0x434>
    8000374c:	00094783          	lbu	a5,0(s2)
    80003750:	00078c9b          	sext.w	s9,a5
    80003754:	1e078263          	beqz	a5,80003938 <__printf+0x2a0>
    80003758:	0024849b          	addiw	s1,s1,2
    8000375c:	07000713          	li	a4,112
    80003760:	00998933          	add	s2,s3,s1
    80003764:	38e78a63          	beq	a5,a4,80003af8 <__printf+0x460>
    80003768:	20f76863          	bltu	a4,a5,80003978 <__printf+0x2e0>
    8000376c:	42a78863          	beq	a5,a0,80003b9c <__printf+0x504>
    80003770:	06400713          	li	a4,100
    80003774:	40e79663          	bne	a5,a4,80003b80 <__printf+0x4e8>
    80003778:	f7843783          	ld	a5,-136(s0)
    8000377c:	0007a603          	lw	a2,0(a5)
    80003780:	00878793          	addi	a5,a5,8
    80003784:	f6f43c23          	sd	a5,-136(s0)
    80003788:	42064a63          	bltz	a2,80003bbc <__printf+0x524>
    8000378c:	00a00713          	li	a4,10
    80003790:	02e677bb          	remuw	a5,a2,a4
    80003794:	00002d97          	auipc	s11,0x2
    80003798:	b2cd8d93          	addi	s11,s11,-1236 # 800052c0 <digits>
    8000379c:	00900593          	li	a1,9
    800037a0:	0006051b          	sext.w	a0,a2
    800037a4:	00000c93          	li	s9,0
    800037a8:	02079793          	slli	a5,a5,0x20
    800037ac:	0207d793          	srli	a5,a5,0x20
    800037b0:	00fd87b3          	add	a5,s11,a5
    800037b4:	0007c783          	lbu	a5,0(a5)
    800037b8:	02e656bb          	divuw	a3,a2,a4
    800037bc:	f8f40023          	sb	a5,-128(s0)
    800037c0:	14c5d863          	bge	a1,a2,80003910 <__printf+0x278>
    800037c4:	06300593          	li	a1,99
    800037c8:	00100c93          	li	s9,1
    800037cc:	02e6f7bb          	remuw	a5,a3,a4
    800037d0:	02079793          	slli	a5,a5,0x20
    800037d4:	0207d793          	srli	a5,a5,0x20
    800037d8:	00fd87b3          	add	a5,s11,a5
    800037dc:	0007c783          	lbu	a5,0(a5)
    800037e0:	02e6d73b          	divuw	a4,a3,a4
    800037e4:	f8f400a3          	sb	a5,-127(s0)
    800037e8:	12a5f463          	bgeu	a1,a0,80003910 <__printf+0x278>
    800037ec:	00a00693          	li	a3,10
    800037f0:	00900593          	li	a1,9
    800037f4:	02d777bb          	remuw	a5,a4,a3
    800037f8:	02079793          	slli	a5,a5,0x20
    800037fc:	0207d793          	srli	a5,a5,0x20
    80003800:	00fd87b3          	add	a5,s11,a5
    80003804:	0007c503          	lbu	a0,0(a5)
    80003808:	02d757bb          	divuw	a5,a4,a3
    8000380c:	f8a40123          	sb	a0,-126(s0)
    80003810:	48e5f263          	bgeu	a1,a4,80003c94 <__printf+0x5fc>
    80003814:	06300513          	li	a0,99
    80003818:	02d7f5bb          	remuw	a1,a5,a3
    8000381c:	02059593          	slli	a1,a1,0x20
    80003820:	0205d593          	srli	a1,a1,0x20
    80003824:	00bd85b3          	add	a1,s11,a1
    80003828:	0005c583          	lbu	a1,0(a1)
    8000382c:	02d7d7bb          	divuw	a5,a5,a3
    80003830:	f8b401a3          	sb	a1,-125(s0)
    80003834:	48e57263          	bgeu	a0,a4,80003cb8 <__printf+0x620>
    80003838:	3e700513          	li	a0,999
    8000383c:	02d7f5bb          	remuw	a1,a5,a3
    80003840:	02059593          	slli	a1,a1,0x20
    80003844:	0205d593          	srli	a1,a1,0x20
    80003848:	00bd85b3          	add	a1,s11,a1
    8000384c:	0005c583          	lbu	a1,0(a1)
    80003850:	02d7d7bb          	divuw	a5,a5,a3
    80003854:	f8b40223          	sb	a1,-124(s0)
    80003858:	46e57663          	bgeu	a0,a4,80003cc4 <__printf+0x62c>
    8000385c:	02d7f5bb          	remuw	a1,a5,a3
    80003860:	02059593          	slli	a1,a1,0x20
    80003864:	0205d593          	srli	a1,a1,0x20
    80003868:	00bd85b3          	add	a1,s11,a1
    8000386c:	0005c583          	lbu	a1,0(a1)
    80003870:	02d7d7bb          	divuw	a5,a5,a3
    80003874:	f8b402a3          	sb	a1,-123(s0)
    80003878:	46ea7863          	bgeu	s4,a4,80003ce8 <__printf+0x650>
    8000387c:	02d7f5bb          	remuw	a1,a5,a3
    80003880:	02059593          	slli	a1,a1,0x20
    80003884:	0205d593          	srli	a1,a1,0x20
    80003888:	00bd85b3          	add	a1,s11,a1
    8000388c:	0005c583          	lbu	a1,0(a1)
    80003890:	02d7d7bb          	divuw	a5,a5,a3
    80003894:	f8b40323          	sb	a1,-122(s0)
    80003898:	3eeaf863          	bgeu	s5,a4,80003c88 <__printf+0x5f0>
    8000389c:	02d7f5bb          	remuw	a1,a5,a3
    800038a0:	02059593          	slli	a1,a1,0x20
    800038a4:	0205d593          	srli	a1,a1,0x20
    800038a8:	00bd85b3          	add	a1,s11,a1
    800038ac:	0005c583          	lbu	a1,0(a1)
    800038b0:	02d7d7bb          	divuw	a5,a5,a3
    800038b4:	f8b403a3          	sb	a1,-121(s0)
    800038b8:	42eb7e63          	bgeu	s6,a4,80003cf4 <__printf+0x65c>
    800038bc:	02d7f5bb          	remuw	a1,a5,a3
    800038c0:	02059593          	slli	a1,a1,0x20
    800038c4:	0205d593          	srli	a1,a1,0x20
    800038c8:	00bd85b3          	add	a1,s11,a1
    800038cc:	0005c583          	lbu	a1,0(a1)
    800038d0:	02d7d7bb          	divuw	a5,a5,a3
    800038d4:	f8b40423          	sb	a1,-120(s0)
    800038d8:	42ebfc63          	bgeu	s7,a4,80003d10 <__printf+0x678>
    800038dc:	02079793          	slli	a5,a5,0x20
    800038e0:	0207d793          	srli	a5,a5,0x20
    800038e4:	00fd8db3          	add	s11,s11,a5
    800038e8:	000dc703          	lbu	a4,0(s11)
    800038ec:	00a00793          	li	a5,10
    800038f0:	00900c93          	li	s9,9
    800038f4:	f8e404a3          	sb	a4,-119(s0)
    800038f8:	00065c63          	bgez	a2,80003910 <__printf+0x278>
    800038fc:	f9040713          	addi	a4,s0,-112
    80003900:	00f70733          	add	a4,a4,a5
    80003904:	02d00693          	li	a3,45
    80003908:	fed70823          	sb	a3,-16(a4)
    8000390c:	00078c93          	mv	s9,a5
    80003910:	f8040793          	addi	a5,s0,-128
    80003914:	01978cb3          	add	s9,a5,s9
    80003918:	f7f40d13          	addi	s10,s0,-129
    8000391c:	000cc503          	lbu	a0,0(s9)
    80003920:	fffc8c93          	addi	s9,s9,-1
    80003924:	00000097          	auipc	ra,0x0
    80003928:	b90080e7          	jalr	-1136(ra) # 800034b4 <consputc>
    8000392c:	ffac98e3          	bne	s9,s10,8000391c <__printf+0x284>
    80003930:	00094503          	lbu	a0,0(s2)
    80003934:	e00514e3          	bnez	a0,8000373c <__printf+0xa4>
    80003938:	1a0c1663          	bnez	s8,80003ae4 <__printf+0x44c>
    8000393c:	08813083          	ld	ra,136(sp)
    80003940:	08013403          	ld	s0,128(sp)
    80003944:	07813483          	ld	s1,120(sp)
    80003948:	07013903          	ld	s2,112(sp)
    8000394c:	06813983          	ld	s3,104(sp)
    80003950:	06013a03          	ld	s4,96(sp)
    80003954:	05813a83          	ld	s5,88(sp)
    80003958:	05013b03          	ld	s6,80(sp)
    8000395c:	04813b83          	ld	s7,72(sp)
    80003960:	04013c03          	ld	s8,64(sp)
    80003964:	03813c83          	ld	s9,56(sp)
    80003968:	03013d03          	ld	s10,48(sp)
    8000396c:	02813d83          	ld	s11,40(sp)
    80003970:	0d010113          	addi	sp,sp,208
    80003974:	00008067          	ret
    80003978:	07300713          	li	a4,115
    8000397c:	1ce78a63          	beq	a5,a4,80003b50 <__printf+0x4b8>
    80003980:	07800713          	li	a4,120
    80003984:	1ee79e63          	bne	a5,a4,80003b80 <__printf+0x4e8>
    80003988:	f7843783          	ld	a5,-136(s0)
    8000398c:	0007a703          	lw	a4,0(a5)
    80003990:	00878793          	addi	a5,a5,8
    80003994:	f6f43c23          	sd	a5,-136(s0)
    80003998:	28074263          	bltz	a4,80003c1c <__printf+0x584>
    8000399c:	00002d97          	auipc	s11,0x2
    800039a0:	924d8d93          	addi	s11,s11,-1756 # 800052c0 <digits>
    800039a4:	00f77793          	andi	a5,a4,15
    800039a8:	00fd87b3          	add	a5,s11,a5
    800039ac:	0007c683          	lbu	a3,0(a5)
    800039b0:	00f00613          	li	a2,15
    800039b4:	0007079b          	sext.w	a5,a4
    800039b8:	f8d40023          	sb	a3,-128(s0)
    800039bc:	0047559b          	srliw	a1,a4,0x4
    800039c0:	0047569b          	srliw	a3,a4,0x4
    800039c4:	00000c93          	li	s9,0
    800039c8:	0ee65063          	bge	a2,a4,80003aa8 <__printf+0x410>
    800039cc:	00f6f693          	andi	a3,a3,15
    800039d0:	00dd86b3          	add	a3,s11,a3
    800039d4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800039d8:	0087d79b          	srliw	a5,a5,0x8
    800039dc:	00100c93          	li	s9,1
    800039e0:	f8d400a3          	sb	a3,-127(s0)
    800039e4:	0cb67263          	bgeu	a2,a1,80003aa8 <__printf+0x410>
    800039e8:	00f7f693          	andi	a3,a5,15
    800039ec:	00dd86b3          	add	a3,s11,a3
    800039f0:	0006c583          	lbu	a1,0(a3)
    800039f4:	00f00613          	li	a2,15
    800039f8:	0047d69b          	srliw	a3,a5,0x4
    800039fc:	f8b40123          	sb	a1,-126(s0)
    80003a00:	0047d593          	srli	a1,a5,0x4
    80003a04:	28f67e63          	bgeu	a2,a5,80003ca0 <__printf+0x608>
    80003a08:	00f6f693          	andi	a3,a3,15
    80003a0c:	00dd86b3          	add	a3,s11,a3
    80003a10:	0006c503          	lbu	a0,0(a3)
    80003a14:	0087d813          	srli	a6,a5,0x8
    80003a18:	0087d69b          	srliw	a3,a5,0x8
    80003a1c:	f8a401a3          	sb	a0,-125(s0)
    80003a20:	28b67663          	bgeu	a2,a1,80003cac <__printf+0x614>
    80003a24:	00f6f693          	andi	a3,a3,15
    80003a28:	00dd86b3          	add	a3,s11,a3
    80003a2c:	0006c583          	lbu	a1,0(a3)
    80003a30:	00c7d513          	srli	a0,a5,0xc
    80003a34:	00c7d69b          	srliw	a3,a5,0xc
    80003a38:	f8b40223          	sb	a1,-124(s0)
    80003a3c:	29067a63          	bgeu	a2,a6,80003cd0 <__printf+0x638>
    80003a40:	00f6f693          	andi	a3,a3,15
    80003a44:	00dd86b3          	add	a3,s11,a3
    80003a48:	0006c583          	lbu	a1,0(a3)
    80003a4c:	0107d813          	srli	a6,a5,0x10
    80003a50:	0107d69b          	srliw	a3,a5,0x10
    80003a54:	f8b402a3          	sb	a1,-123(s0)
    80003a58:	28a67263          	bgeu	a2,a0,80003cdc <__printf+0x644>
    80003a5c:	00f6f693          	andi	a3,a3,15
    80003a60:	00dd86b3          	add	a3,s11,a3
    80003a64:	0006c683          	lbu	a3,0(a3)
    80003a68:	0147d79b          	srliw	a5,a5,0x14
    80003a6c:	f8d40323          	sb	a3,-122(s0)
    80003a70:	21067663          	bgeu	a2,a6,80003c7c <__printf+0x5e4>
    80003a74:	02079793          	slli	a5,a5,0x20
    80003a78:	0207d793          	srli	a5,a5,0x20
    80003a7c:	00fd8db3          	add	s11,s11,a5
    80003a80:	000dc683          	lbu	a3,0(s11)
    80003a84:	00800793          	li	a5,8
    80003a88:	00700c93          	li	s9,7
    80003a8c:	f8d403a3          	sb	a3,-121(s0)
    80003a90:	00075c63          	bgez	a4,80003aa8 <__printf+0x410>
    80003a94:	f9040713          	addi	a4,s0,-112
    80003a98:	00f70733          	add	a4,a4,a5
    80003a9c:	02d00693          	li	a3,45
    80003aa0:	fed70823          	sb	a3,-16(a4)
    80003aa4:	00078c93          	mv	s9,a5
    80003aa8:	f8040793          	addi	a5,s0,-128
    80003aac:	01978cb3          	add	s9,a5,s9
    80003ab0:	f7f40d13          	addi	s10,s0,-129
    80003ab4:	000cc503          	lbu	a0,0(s9)
    80003ab8:	fffc8c93          	addi	s9,s9,-1
    80003abc:	00000097          	auipc	ra,0x0
    80003ac0:	9f8080e7          	jalr	-1544(ra) # 800034b4 <consputc>
    80003ac4:	ff9d18e3          	bne	s10,s9,80003ab4 <__printf+0x41c>
    80003ac8:	0100006f          	j	80003ad8 <__printf+0x440>
    80003acc:	00000097          	auipc	ra,0x0
    80003ad0:	9e8080e7          	jalr	-1560(ra) # 800034b4 <consputc>
    80003ad4:	000c8493          	mv	s1,s9
    80003ad8:	00094503          	lbu	a0,0(s2)
    80003adc:	c60510e3          	bnez	a0,8000373c <__printf+0xa4>
    80003ae0:	e40c0ee3          	beqz	s8,8000393c <__printf+0x2a4>
    80003ae4:	00003517          	auipc	a0,0x3
    80003ae8:	74c50513          	addi	a0,a0,1868 # 80007230 <pr>
    80003aec:	00001097          	auipc	ra,0x1
    80003af0:	94c080e7          	jalr	-1716(ra) # 80004438 <release>
    80003af4:	e49ff06f          	j	8000393c <__printf+0x2a4>
    80003af8:	f7843783          	ld	a5,-136(s0)
    80003afc:	03000513          	li	a0,48
    80003b00:	01000d13          	li	s10,16
    80003b04:	00878713          	addi	a4,a5,8
    80003b08:	0007bc83          	ld	s9,0(a5)
    80003b0c:	f6e43c23          	sd	a4,-136(s0)
    80003b10:	00000097          	auipc	ra,0x0
    80003b14:	9a4080e7          	jalr	-1628(ra) # 800034b4 <consputc>
    80003b18:	07800513          	li	a0,120
    80003b1c:	00000097          	auipc	ra,0x0
    80003b20:	998080e7          	jalr	-1640(ra) # 800034b4 <consputc>
    80003b24:	00001d97          	auipc	s11,0x1
    80003b28:	79cd8d93          	addi	s11,s11,1948 # 800052c0 <digits>
    80003b2c:	03ccd793          	srli	a5,s9,0x3c
    80003b30:	00fd87b3          	add	a5,s11,a5
    80003b34:	0007c503          	lbu	a0,0(a5)
    80003b38:	fffd0d1b          	addiw	s10,s10,-1
    80003b3c:	004c9c93          	slli	s9,s9,0x4
    80003b40:	00000097          	auipc	ra,0x0
    80003b44:	974080e7          	jalr	-1676(ra) # 800034b4 <consputc>
    80003b48:	fe0d12e3          	bnez	s10,80003b2c <__printf+0x494>
    80003b4c:	f8dff06f          	j	80003ad8 <__printf+0x440>
    80003b50:	f7843783          	ld	a5,-136(s0)
    80003b54:	0007bc83          	ld	s9,0(a5)
    80003b58:	00878793          	addi	a5,a5,8
    80003b5c:	f6f43c23          	sd	a5,-136(s0)
    80003b60:	000c9a63          	bnez	s9,80003b74 <__printf+0x4dc>
    80003b64:	1080006f          	j	80003c6c <__printf+0x5d4>
    80003b68:	001c8c93          	addi	s9,s9,1
    80003b6c:	00000097          	auipc	ra,0x0
    80003b70:	948080e7          	jalr	-1720(ra) # 800034b4 <consputc>
    80003b74:	000cc503          	lbu	a0,0(s9)
    80003b78:	fe0518e3          	bnez	a0,80003b68 <__printf+0x4d0>
    80003b7c:	f5dff06f          	j	80003ad8 <__printf+0x440>
    80003b80:	02500513          	li	a0,37
    80003b84:	00000097          	auipc	ra,0x0
    80003b88:	930080e7          	jalr	-1744(ra) # 800034b4 <consputc>
    80003b8c:	000c8513          	mv	a0,s9
    80003b90:	00000097          	auipc	ra,0x0
    80003b94:	924080e7          	jalr	-1756(ra) # 800034b4 <consputc>
    80003b98:	f41ff06f          	j	80003ad8 <__printf+0x440>
    80003b9c:	02500513          	li	a0,37
    80003ba0:	00000097          	auipc	ra,0x0
    80003ba4:	914080e7          	jalr	-1772(ra) # 800034b4 <consputc>
    80003ba8:	f31ff06f          	j	80003ad8 <__printf+0x440>
    80003bac:	00030513          	mv	a0,t1
    80003bb0:	00000097          	auipc	ra,0x0
    80003bb4:	7bc080e7          	jalr	1980(ra) # 8000436c <acquire>
    80003bb8:	b4dff06f          	j	80003704 <__printf+0x6c>
    80003bbc:	40c0053b          	negw	a0,a2
    80003bc0:	00a00713          	li	a4,10
    80003bc4:	02e576bb          	remuw	a3,a0,a4
    80003bc8:	00001d97          	auipc	s11,0x1
    80003bcc:	6f8d8d93          	addi	s11,s11,1784 # 800052c0 <digits>
    80003bd0:	ff700593          	li	a1,-9
    80003bd4:	02069693          	slli	a3,a3,0x20
    80003bd8:	0206d693          	srli	a3,a3,0x20
    80003bdc:	00dd86b3          	add	a3,s11,a3
    80003be0:	0006c683          	lbu	a3,0(a3)
    80003be4:	02e557bb          	divuw	a5,a0,a4
    80003be8:	f8d40023          	sb	a3,-128(s0)
    80003bec:	10b65e63          	bge	a2,a1,80003d08 <__printf+0x670>
    80003bf0:	06300593          	li	a1,99
    80003bf4:	02e7f6bb          	remuw	a3,a5,a4
    80003bf8:	02069693          	slli	a3,a3,0x20
    80003bfc:	0206d693          	srli	a3,a3,0x20
    80003c00:	00dd86b3          	add	a3,s11,a3
    80003c04:	0006c683          	lbu	a3,0(a3)
    80003c08:	02e7d73b          	divuw	a4,a5,a4
    80003c0c:	00200793          	li	a5,2
    80003c10:	f8d400a3          	sb	a3,-127(s0)
    80003c14:	bca5ece3          	bltu	a1,a0,800037ec <__printf+0x154>
    80003c18:	ce5ff06f          	j	800038fc <__printf+0x264>
    80003c1c:	40e007bb          	negw	a5,a4
    80003c20:	00001d97          	auipc	s11,0x1
    80003c24:	6a0d8d93          	addi	s11,s11,1696 # 800052c0 <digits>
    80003c28:	00f7f693          	andi	a3,a5,15
    80003c2c:	00dd86b3          	add	a3,s11,a3
    80003c30:	0006c583          	lbu	a1,0(a3)
    80003c34:	ff100613          	li	a2,-15
    80003c38:	0047d69b          	srliw	a3,a5,0x4
    80003c3c:	f8b40023          	sb	a1,-128(s0)
    80003c40:	0047d59b          	srliw	a1,a5,0x4
    80003c44:	0ac75e63          	bge	a4,a2,80003d00 <__printf+0x668>
    80003c48:	00f6f693          	andi	a3,a3,15
    80003c4c:	00dd86b3          	add	a3,s11,a3
    80003c50:	0006c603          	lbu	a2,0(a3)
    80003c54:	00f00693          	li	a3,15
    80003c58:	0087d79b          	srliw	a5,a5,0x8
    80003c5c:	f8c400a3          	sb	a2,-127(s0)
    80003c60:	d8b6e4e3          	bltu	a3,a1,800039e8 <__printf+0x350>
    80003c64:	00200793          	li	a5,2
    80003c68:	e2dff06f          	j	80003a94 <__printf+0x3fc>
    80003c6c:	00001c97          	auipc	s9,0x1
    80003c70:	634c8c93          	addi	s9,s9,1588 # 800052a0 <_ZZ12printIntegermE6digits+0x148>
    80003c74:	02800513          	li	a0,40
    80003c78:	ef1ff06f          	j	80003b68 <__printf+0x4d0>
    80003c7c:	00700793          	li	a5,7
    80003c80:	00600c93          	li	s9,6
    80003c84:	e0dff06f          	j	80003a90 <__printf+0x3f8>
    80003c88:	00700793          	li	a5,7
    80003c8c:	00600c93          	li	s9,6
    80003c90:	c69ff06f          	j	800038f8 <__printf+0x260>
    80003c94:	00300793          	li	a5,3
    80003c98:	00200c93          	li	s9,2
    80003c9c:	c5dff06f          	j	800038f8 <__printf+0x260>
    80003ca0:	00300793          	li	a5,3
    80003ca4:	00200c93          	li	s9,2
    80003ca8:	de9ff06f          	j	80003a90 <__printf+0x3f8>
    80003cac:	00400793          	li	a5,4
    80003cb0:	00300c93          	li	s9,3
    80003cb4:	dddff06f          	j	80003a90 <__printf+0x3f8>
    80003cb8:	00400793          	li	a5,4
    80003cbc:	00300c93          	li	s9,3
    80003cc0:	c39ff06f          	j	800038f8 <__printf+0x260>
    80003cc4:	00500793          	li	a5,5
    80003cc8:	00400c93          	li	s9,4
    80003ccc:	c2dff06f          	j	800038f8 <__printf+0x260>
    80003cd0:	00500793          	li	a5,5
    80003cd4:	00400c93          	li	s9,4
    80003cd8:	db9ff06f          	j	80003a90 <__printf+0x3f8>
    80003cdc:	00600793          	li	a5,6
    80003ce0:	00500c93          	li	s9,5
    80003ce4:	dadff06f          	j	80003a90 <__printf+0x3f8>
    80003ce8:	00600793          	li	a5,6
    80003cec:	00500c93          	li	s9,5
    80003cf0:	c09ff06f          	j	800038f8 <__printf+0x260>
    80003cf4:	00800793          	li	a5,8
    80003cf8:	00700c93          	li	s9,7
    80003cfc:	bfdff06f          	j	800038f8 <__printf+0x260>
    80003d00:	00100793          	li	a5,1
    80003d04:	d91ff06f          	j	80003a94 <__printf+0x3fc>
    80003d08:	00100793          	li	a5,1
    80003d0c:	bf1ff06f          	j	800038fc <__printf+0x264>
    80003d10:	00900793          	li	a5,9
    80003d14:	00800c93          	li	s9,8
    80003d18:	be1ff06f          	j	800038f8 <__printf+0x260>
    80003d1c:	00001517          	auipc	a0,0x1
    80003d20:	58c50513          	addi	a0,a0,1420 # 800052a8 <_ZZ12printIntegermE6digits+0x150>
    80003d24:	00000097          	auipc	ra,0x0
    80003d28:	918080e7          	jalr	-1768(ra) # 8000363c <panic>

0000000080003d2c <printfinit>:
    80003d2c:	fe010113          	addi	sp,sp,-32
    80003d30:	00813823          	sd	s0,16(sp)
    80003d34:	00913423          	sd	s1,8(sp)
    80003d38:	00113c23          	sd	ra,24(sp)
    80003d3c:	02010413          	addi	s0,sp,32
    80003d40:	00003497          	auipc	s1,0x3
    80003d44:	4f048493          	addi	s1,s1,1264 # 80007230 <pr>
    80003d48:	00048513          	mv	a0,s1
    80003d4c:	00001597          	auipc	a1,0x1
    80003d50:	56c58593          	addi	a1,a1,1388 # 800052b8 <_ZZ12printIntegermE6digits+0x160>
    80003d54:	00000097          	auipc	ra,0x0
    80003d58:	5f4080e7          	jalr	1524(ra) # 80004348 <initlock>
    80003d5c:	01813083          	ld	ra,24(sp)
    80003d60:	01013403          	ld	s0,16(sp)
    80003d64:	0004ac23          	sw	zero,24(s1)
    80003d68:	00813483          	ld	s1,8(sp)
    80003d6c:	02010113          	addi	sp,sp,32
    80003d70:	00008067          	ret

0000000080003d74 <uartinit>:
    80003d74:	ff010113          	addi	sp,sp,-16
    80003d78:	00813423          	sd	s0,8(sp)
    80003d7c:	01010413          	addi	s0,sp,16
    80003d80:	100007b7          	lui	a5,0x10000
    80003d84:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003d88:	f8000713          	li	a4,-128
    80003d8c:	00e781a3          	sb	a4,3(a5)
    80003d90:	00300713          	li	a4,3
    80003d94:	00e78023          	sb	a4,0(a5)
    80003d98:	000780a3          	sb	zero,1(a5)
    80003d9c:	00e781a3          	sb	a4,3(a5)
    80003da0:	00700693          	li	a3,7
    80003da4:	00d78123          	sb	a3,2(a5)
    80003da8:	00e780a3          	sb	a4,1(a5)
    80003dac:	00813403          	ld	s0,8(sp)
    80003db0:	01010113          	addi	sp,sp,16
    80003db4:	00008067          	ret

0000000080003db8 <uartputc>:
    80003db8:	00002797          	auipc	a5,0x2
    80003dbc:	1f07a783          	lw	a5,496(a5) # 80005fa8 <panicked>
    80003dc0:	00078463          	beqz	a5,80003dc8 <uartputc+0x10>
    80003dc4:	0000006f          	j	80003dc4 <uartputc+0xc>
    80003dc8:	fd010113          	addi	sp,sp,-48
    80003dcc:	02813023          	sd	s0,32(sp)
    80003dd0:	00913c23          	sd	s1,24(sp)
    80003dd4:	01213823          	sd	s2,16(sp)
    80003dd8:	01313423          	sd	s3,8(sp)
    80003ddc:	02113423          	sd	ra,40(sp)
    80003de0:	03010413          	addi	s0,sp,48
    80003de4:	00002917          	auipc	s2,0x2
    80003de8:	1cc90913          	addi	s2,s2,460 # 80005fb0 <uart_tx_r>
    80003dec:	00093783          	ld	a5,0(s2)
    80003df0:	00002497          	auipc	s1,0x2
    80003df4:	1c848493          	addi	s1,s1,456 # 80005fb8 <uart_tx_w>
    80003df8:	0004b703          	ld	a4,0(s1)
    80003dfc:	02078693          	addi	a3,a5,32
    80003e00:	00050993          	mv	s3,a0
    80003e04:	02e69c63          	bne	a3,a4,80003e3c <uartputc+0x84>
    80003e08:	00001097          	auipc	ra,0x1
    80003e0c:	834080e7          	jalr	-1996(ra) # 8000463c <push_on>
    80003e10:	00093783          	ld	a5,0(s2)
    80003e14:	0004b703          	ld	a4,0(s1)
    80003e18:	02078793          	addi	a5,a5,32
    80003e1c:	00e79463          	bne	a5,a4,80003e24 <uartputc+0x6c>
    80003e20:	0000006f          	j	80003e20 <uartputc+0x68>
    80003e24:	00001097          	auipc	ra,0x1
    80003e28:	88c080e7          	jalr	-1908(ra) # 800046b0 <pop_on>
    80003e2c:	00093783          	ld	a5,0(s2)
    80003e30:	0004b703          	ld	a4,0(s1)
    80003e34:	02078693          	addi	a3,a5,32
    80003e38:	fce688e3          	beq	a3,a4,80003e08 <uartputc+0x50>
    80003e3c:	01f77693          	andi	a3,a4,31
    80003e40:	00003597          	auipc	a1,0x3
    80003e44:	41058593          	addi	a1,a1,1040 # 80007250 <uart_tx_buf>
    80003e48:	00d586b3          	add	a3,a1,a3
    80003e4c:	00170713          	addi	a4,a4,1
    80003e50:	01368023          	sb	s3,0(a3)
    80003e54:	00e4b023          	sd	a4,0(s1)
    80003e58:	10000637          	lui	a2,0x10000
    80003e5c:	02f71063          	bne	a4,a5,80003e7c <uartputc+0xc4>
    80003e60:	0340006f          	j	80003e94 <uartputc+0xdc>
    80003e64:	00074703          	lbu	a4,0(a4)
    80003e68:	00f93023          	sd	a5,0(s2)
    80003e6c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003e70:	00093783          	ld	a5,0(s2)
    80003e74:	0004b703          	ld	a4,0(s1)
    80003e78:	00f70e63          	beq	a4,a5,80003e94 <uartputc+0xdc>
    80003e7c:	00564683          	lbu	a3,5(a2)
    80003e80:	01f7f713          	andi	a4,a5,31
    80003e84:	00e58733          	add	a4,a1,a4
    80003e88:	0206f693          	andi	a3,a3,32
    80003e8c:	00178793          	addi	a5,a5,1
    80003e90:	fc069ae3          	bnez	a3,80003e64 <uartputc+0xac>
    80003e94:	02813083          	ld	ra,40(sp)
    80003e98:	02013403          	ld	s0,32(sp)
    80003e9c:	01813483          	ld	s1,24(sp)
    80003ea0:	01013903          	ld	s2,16(sp)
    80003ea4:	00813983          	ld	s3,8(sp)
    80003ea8:	03010113          	addi	sp,sp,48
    80003eac:	00008067          	ret

0000000080003eb0 <uartputc_sync>:
    80003eb0:	ff010113          	addi	sp,sp,-16
    80003eb4:	00813423          	sd	s0,8(sp)
    80003eb8:	01010413          	addi	s0,sp,16
    80003ebc:	00002717          	auipc	a4,0x2
    80003ec0:	0ec72703          	lw	a4,236(a4) # 80005fa8 <panicked>
    80003ec4:	02071663          	bnez	a4,80003ef0 <uartputc_sync+0x40>
    80003ec8:	00050793          	mv	a5,a0
    80003ecc:	100006b7          	lui	a3,0x10000
    80003ed0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003ed4:	02077713          	andi	a4,a4,32
    80003ed8:	fe070ce3          	beqz	a4,80003ed0 <uartputc_sync+0x20>
    80003edc:	0ff7f793          	andi	a5,a5,255
    80003ee0:	00f68023          	sb	a5,0(a3)
    80003ee4:	00813403          	ld	s0,8(sp)
    80003ee8:	01010113          	addi	sp,sp,16
    80003eec:	00008067          	ret
    80003ef0:	0000006f          	j	80003ef0 <uartputc_sync+0x40>

0000000080003ef4 <uartstart>:
    80003ef4:	ff010113          	addi	sp,sp,-16
    80003ef8:	00813423          	sd	s0,8(sp)
    80003efc:	01010413          	addi	s0,sp,16
    80003f00:	00002617          	auipc	a2,0x2
    80003f04:	0b060613          	addi	a2,a2,176 # 80005fb0 <uart_tx_r>
    80003f08:	00002517          	auipc	a0,0x2
    80003f0c:	0b050513          	addi	a0,a0,176 # 80005fb8 <uart_tx_w>
    80003f10:	00063783          	ld	a5,0(a2)
    80003f14:	00053703          	ld	a4,0(a0)
    80003f18:	04f70263          	beq	a4,a5,80003f5c <uartstart+0x68>
    80003f1c:	100005b7          	lui	a1,0x10000
    80003f20:	00003817          	auipc	a6,0x3
    80003f24:	33080813          	addi	a6,a6,816 # 80007250 <uart_tx_buf>
    80003f28:	01c0006f          	j	80003f44 <uartstart+0x50>
    80003f2c:	0006c703          	lbu	a4,0(a3)
    80003f30:	00f63023          	sd	a5,0(a2)
    80003f34:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003f38:	00063783          	ld	a5,0(a2)
    80003f3c:	00053703          	ld	a4,0(a0)
    80003f40:	00f70e63          	beq	a4,a5,80003f5c <uartstart+0x68>
    80003f44:	01f7f713          	andi	a4,a5,31
    80003f48:	00e806b3          	add	a3,a6,a4
    80003f4c:	0055c703          	lbu	a4,5(a1)
    80003f50:	00178793          	addi	a5,a5,1
    80003f54:	02077713          	andi	a4,a4,32
    80003f58:	fc071ae3          	bnez	a4,80003f2c <uartstart+0x38>
    80003f5c:	00813403          	ld	s0,8(sp)
    80003f60:	01010113          	addi	sp,sp,16
    80003f64:	00008067          	ret

0000000080003f68 <uartgetc>:
    80003f68:	ff010113          	addi	sp,sp,-16
    80003f6c:	00813423          	sd	s0,8(sp)
    80003f70:	01010413          	addi	s0,sp,16
    80003f74:	10000737          	lui	a4,0x10000
    80003f78:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80003f7c:	0017f793          	andi	a5,a5,1
    80003f80:	00078c63          	beqz	a5,80003f98 <uartgetc+0x30>
    80003f84:	00074503          	lbu	a0,0(a4)
    80003f88:	0ff57513          	andi	a0,a0,255
    80003f8c:	00813403          	ld	s0,8(sp)
    80003f90:	01010113          	addi	sp,sp,16
    80003f94:	00008067          	ret
    80003f98:	fff00513          	li	a0,-1
    80003f9c:	ff1ff06f          	j	80003f8c <uartgetc+0x24>

0000000080003fa0 <uartintr>:
    80003fa0:	100007b7          	lui	a5,0x10000
    80003fa4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003fa8:	0017f793          	andi	a5,a5,1
    80003fac:	0a078463          	beqz	a5,80004054 <uartintr+0xb4>
    80003fb0:	fe010113          	addi	sp,sp,-32
    80003fb4:	00813823          	sd	s0,16(sp)
    80003fb8:	00913423          	sd	s1,8(sp)
    80003fbc:	00113c23          	sd	ra,24(sp)
    80003fc0:	02010413          	addi	s0,sp,32
    80003fc4:	100004b7          	lui	s1,0x10000
    80003fc8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80003fcc:	0ff57513          	andi	a0,a0,255
    80003fd0:	fffff097          	auipc	ra,0xfffff
    80003fd4:	534080e7          	jalr	1332(ra) # 80003504 <consoleintr>
    80003fd8:	0054c783          	lbu	a5,5(s1)
    80003fdc:	0017f793          	andi	a5,a5,1
    80003fe0:	fe0794e3          	bnez	a5,80003fc8 <uartintr+0x28>
    80003fe4:	00002617          	auipc	a2,0x2
    80003fe8:	fcc60613          	addi	a2,a2,-52 # 80005fb0 <uart_tx_r>
    80003fec:	00002517          	auipc	a0,0x2
    80003ff0:	fcc50513          	addi	a0,a0,-52 # 80005fb8 <uart_tx_w>
    80003ff4:	00063783          	ld	a5,0(a2)
    80003ff8:	00053703          	ld	a4,0(a0)
    80003ffc:	04f70263          	beq	a4,a5,80004040 <uartintr+0xa0>
    80004000:	100005b7          	lui	a1,0x10000
    80004004:	00003817          	auipc	a6,0x3
    80004008:	24c80813          	addi	a6,a6,588 # 80007250 <uart_tx_buf>
    8000400c:	01c0006f          	j	80004028 <uartintr+0x88>
    80004010:	0006c703          	lbu	a4,0(a3)
    80004014:	00f63023          	sd	a5,0(a2)
    80004018:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000401c:	00063783          	ld	a5,0(a2)
    80004020:	00053703          	ld	a4,0(a0)
    80004024:	00f70e63          	beq	a4,a5,80004040 <uartintr+0xa0>
    80004028:	01f7f713          	andi	a4,a5,31
    8000402c:	00e806b3          	add	a3,a6,a4
    80004030:	0055c703          	lbu	a4,5(a1)
    80004034:	00178793          	addi	a5,a5,1
    80004038:	02077713          	andi	a4,a4,32
    8000403c:	fc071ae3          	bnez	a4,80004010 <uartintr+0x70>
    80004040:	01813083          	ld	ra,24(sp)
    80004044:	01013403          	ld	s0,16(sp)
    80004048:	00813483          	ld	s1,8(sp)
    8000404c:	02010113          	addi	sp,sp,32
    80004050:	00008067          	ret
    80004054:	00002617          	auipc	a2,0x2
    80004058:	f5c60613          	addi	a2,a2,-164 # 80005fb0 <uart_tx_r>
    8000405c:	00002517          	auipc	a0,0x2
    80004060:	f5c50513          	addi	a0,a0,-164 # 80005fb8 <uart_tx_w>
    80004064:	00063783          	ld	a5,0(a2)
    80004068:	00053703          	ld	a4,0(a0)
    8000406c:	04f70263          	beq	a4,a5,800040b0 <uartintr+0x110>
    80004070:	100005b7          	lui	a1,0x10000
    80004074:	00003817          	auipc	a6,0x3
    80004078:	1dc80813          	addi	a6,a6,476 # 80007250 <uart_tx_buf>
    8000407c:	01c0006f          	j	80004098 <uartintr+0xf8>
    80004080:	0006c703          	lbu	a4,0(a3)
    80004084:	00f63023          	sd	a5,0(a2)
    80004088:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000408c:	00063783          	ld	a5,0(a2)
    80004090:	00053703          	ld	a4,0(a0)
    80004094:	02f70063          	beq	a4,a5,800040b4 <uartintr+0x114>
    80004098:	01f7f713          	andi	a4,a5,31
    8000409c:	00e806b3          	add	a3,a6,a4
    800040a0:	0055c703          	lbu	a4,5(a1)
    800040a4:	00178793          	addi	a5,a5,1
    800040a8:	02077713          	andi	a4,a4,32
    800040ac:	fc071ae3          	bnez	a4,80004080 <uartintr+0xe0>
    800040b0:	00008067          	ret
    800040b4:	00008067          	ret

00000000800040b8 <kinit>:
    800040b8:	fc010113          	addi	sp,sp,-64
    800040bc:	02913423          	sd	s1,40(sp)
    800040c0:	fffff7b7          	lui	a5,0xfffff
    800040c4:	00004497          	auipc	s1,0x4
    800040c8:	1ab48493          	addi	s1,s1,427 # 8000826f <end+0xfff>
    800040cc:	02813823          	sd	s0,48(sp)
    800040d0:	01313c23          	sd	s3,24(sp)
    800040d4:	00f4f4b3          	and	s1,s1,a5
    800040d8:	02113c23          	sd	ra,56(sp)
    800040dc:	03213023          	sd	s2,32(sp)
    800040e0:	01413823          	sd	s4,16(sp)
    800040e4:	01513423          	sd	s5,8(sp)
    800040e8:	04010413          	addi	s0,sp,64
    800040ec:	000017b7          	lui	a5,0x1
    800040f0:	01100993          	li	s3,17
    800040f4:	00f487b3          	add	a5,s1,a5
    800040f8:	01b99993          	slli	s3,s3,0x1b
    800040fc:	06f9e063          	bltu	s3,a5,8000415c <kinit+0xa4>
    80004100:	00003a97          	auipc	s5,0x3
    80004104:	170a8a93          	addi	s5,s5,368 # 80007270 <end>
    80004108:	0754ec63          	bltu	s1,s5,80004180 <kinit+0xc8>
    8000410c:	0734fa63          	bgeu	s1,s3,80004180 <kinit+0xc8>
    80004110:	00088a37          	lui	s4,0x88
    80004114:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004118:	00002917          	auipc	s2,0x2
    8000411c:	ea890913          	addi	s2,s2,-344 # 80005fc0 <kmem>
    80004120:	00ca1a13          	slli	s4,s4,0xc
    80004124:	0140006f          	j	80004138 <kinit+0x80>
    80004128:	000017b7          	lui	a5,0x1
    8000412c:	00f484b3          	add	s1,s1,a5
    80004130:	0554e863          	bltu	s1,s5,80004180 <kinit+0xc8>
    80004134:	0534f663          	bgeu	s1,s3,80004180 <kinit+0xc8>
    80004138:	00001637          	lui	a2,0x1
    8000413c:	00100593          	li	a1,1
    80004140:	00048513          	mv	a0,s1
    80004144:	00000097          	auipc	ra,0x0
    80004148:	5e4080e7          	jalr	1508(ra) # 80004728 <__memset>
    8000414c:	00093783          	ld	a5,0(s2)
    80004150:	00f4b023          	sd	a5,0(s1)
    80004154:	00993023          	sd	s1,0(s2)
    80004158:	fd4498e3          	bne	s1,s4,80004128 <kinit+0x70>
    8000415c:	03813083          	ld	ra,56(sp)
    80004160:	03013403          	ld	s0,48(sp)
    80004164:	02813483          	ld	s1,40(sp)
    80004168:	02013903          	ld	s2,32(sp)
    8000416c:	01813983          	ld	s3,24(sp)
    80004170:	01013a03          	ld	s4,16(sp)
    80004174:	00813a83          	ld	s5,8(sp)
    80004178:	04010113          	addi	sp,sp,64
    8000417c:	00008067          	ret
    80004180:	00001517          	auipc	a0,0x1
    80004184:	15850513          	addi	a0,a0,344 # 800052d8 <digits+0x18>
    80004188:	fffff097          	auipc	ra,0xfffff
    8000418c:	4b4080e7          	jalr	1204(ra) # 8000363c <panic>

0000000080004190 <freerange>:
    80004190:	fc010113          	addi	sp,sp,-64
    80004194:	000017b7          	lui	a5,0x1
    80004198:	02913423          	sd	s1,40(sp)
    8000419c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800041a0:	009504b3          	add	s1,a0,s1
    800041a4:	fffff537          	lui	a0,0xfffff
    800041a8:	02813823          	sd	s0,48(sp)
    800041ac:	02113c23          	sd	ra,56(sp)
    800041b0:	03213023          	sd	s2,32(sp)
    800041b4:	01313c23          	sd	s3,24(sp)
    800041b8:	01413823          	sd	s4,16(sp)
    800041bc:	01513423          	sd	s5,8(sp)
    800041c0:	01613023          	sd	s6,0(sp)
    800041c4:	04010413          	addi	s0,sp,64
    800041c8:	00a4f4b3          	and	s1,s1,a0
    800041cc:	00f487b3          	add	a5,s1,a5
    800041d0:	06f5e463          	bltu	a1,a5,80004238 <freerange+0xa8>
    800041d4:	00003a97          	auipc	s5,0x3
    800041d8:	09ca8a93          	addi	s5,s5,156 # 80007270 <end>
    800041dc:	0954e263          	bltu	s1,s5,80004260 <freerange+0xd0>
    800041e0:	01100993          	li	s3,17
    800041e4:	01b99993          	slli	s3,s3,0x1b
    800041e8:	0734fc63          	bgeu	s1,s3,80004260 <freerange+0xd0>
    800041ec:	00058a13          	mv	s4,a1
    800041f0:	00002917          	auipc	s2,0x2
    800041f4:	dd090913          	addi	s2,s2,-560 # 80005fc0 <kmem>
    800041f8:	00002b37          	lui	s6,0x2
    800041fc:	0140006f          	j	80004210 <freerange+0x80>
    80004200:	000017b7          	lui	a5,0x1
    80004204:	00f484b3          	add	s1,s1,a5
    80004208:	0554ec63          	bltu	s1,s5,80004260 <freerange+0xd0>
    8000420c:	0534fa63          	bgeu	s1,s3,80004260 <freerange+0xd0>
    80004210:	00001637          	lui	a2,0x1
    80004214:	00100593          	li	a1,1
    80004218:	00048513          	mv	a0,s1
    8000421c:	00000097          	auipc	ra,0x0
    80004220:	50c080e7          	jalr	1292(ra) # 80004728 <__memset>
    80004224:	00093703          	ld	a4,0(s2)
    80004228:	016487b3          	add	a5,s1,s6
    8000422c:	00e4b023          	sd	a4,0(s1)
    80004230:	00993023          	sd	s1,0(s2)
    80004234:	fcfa76e3          	bgeu	s4,a5,80004200 <freerange+0x70>
    80004238:	03813083          	ld	ra,56(sp)
    8000423c:	03013403          	ld	s0,48(sp)
    80004240:	02813483          	ld	s1,40(sp)
    80004244:	02013903          	ld	s2,32(sp)
    80004248:	01813983          	ld	s3,24(sp)
    8000424c:	01013a03          	ld	s4,16(sp)
    80004250:	00813a83          	ld	s5,8(sp)
    80004254:	00013b03          	ld	s6,0(sp)
    80004258:	04010113          	addi	sp,sp,64
    8000425c:	00008067          	ret
    80004260:	00001517          	auipc	a0,0x1
    80004264:	07850513          	addi	a0,a0,120 # 800052d8 <digits+0x18>
    80004268:	fffff097          	auipc	ra,0xfffff
    8000426c:	3d4080e7          	jalr	980(ra) # 8000363c <panic>

0000000080004270 <kfree>:
    80004270:	fe010113          	addi	sp,sp,-32
    80004274:	00813823          	sd	s0,16(sp)
    80004278:	00113c23          	sd	ra,24(sp)
    8000427c:	00913423          	sd	s1,8(sp)
    80004280:	02010413          	addi	s0,sp,32
    80004284:	03451793          	slli	a5,a0,0x34
    80004288:	04079c63          	bnez	a5,800042e0 <kfree+0x70>
    8000428c:	00003797          	auipc	a5,0x3
    80004290:	fe478793          	addi	a5,a5,-28 # 80007270 <end>
    80004294:	00050493          	mv	s1,a0
    80004298:	04f56463          	bltu	a0,a5,800042e0 <kfree+0x70>
    8000429c:	01100793          	li	a5,17
    800042a0:	01b79793          	slli	a5,a5,0x1b
    800042a4:	02f57e63          	bgeu	a0,a5,800042e0 <kfree+0x70>
    800042a8:	00001637          	lui	a2,0x1
    800042ac:	00100593          	li	a1,1
    800042b0:	00000097          	auipc	ra,0x0
    800042b4:	478080e7          	jalr	1144(ra) # 80004728 <__memset>
    800042b8:	00002797          	auipc	a5,0x2
    800042bc:	d0878793          	addi	a5,a5,-760 # 80005fc0 <kmem>
    800042c0:	0007b703          	ld	a4,0(a5)
    800042c4:	01813083          	ld	ra,24(sp)
    800042c8:	01013403          	ld	s0,16(sp)
    800042cc:	00e4b023          	sd	a4,0(s1)
    800042d0:	0097b023          	sd	s1,0(a5)
    800042d4:	00813483          	ld	s1,8(sp)
    800042d8:	02010113          	addi	sp,sp,32
    800042dc:	00008067          	ret
    800042e0:	00001517          	auipc	a0,0x1
    800042e4:	ff850513          	addi	a0,a0,-8 # 800052d8 <digits+0x18>
    800042e8:	fffff097          	auipc	ra,0xfffff
    800042ec:	354080e7          	jalr	852(ra) # 8000363c <panic>

00000000800042f0 <kalloc>:
    800042f0:	fe010113          	addi	sp,sp,-32
    800042f4:	00813823          	sd	s0,16(sp)
    800042f8:	00913423          	sd	s1,8(sp)
    800042fc:	00113c23          	sd	ra,24(sp)
    80004300:	02010413          	addi	s0,sp,32
    80004304:	00002797          	auipc	a5,0x2
    80004308:	cbc78793          	addi	a5,a5,-836 # 80005fc0 <kmem>
    8000430c:	0007b483          	ld	s1,0(a5)
    80004310:	02048063          	beqz	s1,80004330 <kalloc+0x40>
    80004314:	0004b703          	ld	a4,0(s1)
    80004318:	00001637          	lui	a2,0x1
    8000431c:	00500593          	li	a1,5
    80004320:	00048513          	mv	a0,s1
    80004324:	00e7b023          	sd	a4,0(a5)
    80004328:	00000097          	auipc	ra,0x0
    8000432c:	400080e7          	jalr	1024(ra) # 80004728 <__memset>
    80004330:	01813083          	ld	ra,24(sp)
    80004334:	01013403          	ld	s0,16(sp)
    80004338:	00048513          	mv	a0,s1
    8000433c:	00813483          	ld	s1,8(sp)
    80004340:	02010113          	addi	sp,sp,32
    80004344:	00008067          	ret

0000000080004348 <initlock>:
    80004348:	ff010113          	addi	sp,sp,-16
    8000434c:	00813423          	sd	s0,8(sp)
    80004350:	01010413          	addi	s0,sp,16
    80004354:	00813403          	ld	s0,8(sp)
    80004358:	00b53423          	sd	a1,8(a0)
    8000435c:	00052023          	sw	zero,0(a0)
    80004360:	00053823          	sd	zero,16(a0)
    80004364:	01010113          	addi	sp,sp,16
    80004368:	00008067          	ret

000000008000436c <acquire>:
    8000436c:	fe010113          	addi	sp,sp,-32
    80004370:	00813823          	sd	s0,16(sp)
    80004374:	00913423          	sd	s1,8(sp)
    80004378:	00113c23          	sd	ra,24(sp)
    8000437c:	01213023          	sd	s2,0(sp)
    80004380:	02010413          	addi	s0,sp,32
    80004384:	00050493          	mv	s1,a0
    80004388:	10002973          	csrr	s2,sstatus
    8000438c:	100027f3          	csrr	a5,sstatus
    80004390:	ffd7f793          	andi	a5,a5,-3
    80004394:	10079073          	csrw	sstatus,a5
    80004398:	fffff097          	auipc	ra,0xfffff
    8000439c:	8ec080e7          	jalr	-1812(ra) # 80002c84 <mycpu>
    800043a0:	07852783          	lw	a5,120(a0)
    800043a4:	06078e63          	beqz	a5,80004420 <acquire+0xb4>
    800043a8:	fffff097          	auipc	ra,0xfffff
    800043ac:	8dc080e7          	jalr	-1828(ra) # 80002c84 <mycpu>
    800043b0:	07852783          	lw	a5,120(a0)
    800043b4:	0004a703          	lw	a4,0(s1)
    800043b8:	0017879b          	addiw	a5,a5,1
    800043bc:	06f52c23          	sw	a5,120(a0)
    800043c0:	04071063          	bnez	a4,80004400 <acquire+0x94>
    800043c4:	00100713          	li	a4,1
    800043c8:	00070793          	mv	a5,a4
    800043cc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800043d0:	0007879b          	sext.w	a5,a5
    800043d4:	fe079ae3          	bnez	a5,800043c8 <acquire+0x5c>
    800043d8:	0ff0000f          	fence
    800043dc:	fffff097          	auipc	ra,0xfffff
    800043e0:	8a8080e7          	jalr	-1880(ra) # 80002c84 <mycpu>
    800043e4:	01813083          	ld	ra,24(sp)
    800043e8:	01013403          	ld	s0,16(sp)
    800043ec:	00a4b823          	sd	a0,16(s1)
    800043f0:	00013903          	ld	s2,0(sp)
    800043f4:	00813483          	ld	s1,8(sp)
    800043f8:	02010113          	addi	sp,sp,32
    800043fc:	00008067          	ret
    80004400:	0104b903          	ld	s2,16(s1)
    80004404:	fffff097          	auipc	ra,0xfffff
    80004408:	880080e7          	jalr	-1920(ra) # 80002c84 <mycpu>
    8000440c:	faa91ce3          	bne	s2,a0,800043c4 <acquire+0x58>
    80004410:	00001517          	auipc	a0,0x1
    80004414:	ed050513          	addi	a0,a0,-304 # 800052e0 <digits+0x20>
    80004418:	fffff097          	auipc	ra,0xfffff
    8000441c:	224080e7          	jalr	548(ra) # 8000363c <panic>
    80004420:	00195913          	srli	s2,s2,0x1
    80004424:	fffff097          	auipc	ra,0xfffff
    80004428:	860080e7          	jalr	-1952(ra) # 80002c84 <mycpu>
    8000442c:	00197913          	andi	s2,s2,1
    80004430:	07252e23          	sw	s2,124(a0)
    80004434:	f75ff06f          	j	800043a8 <acquire+0x3c>

0000000080004438 <release>:
    80004438:	fe010113          	addi	sp,sp,-32
    8000443c:	00813823          	sd	s0,16(sp)
    80004440:	00113c23          	sd	ra,24(sp)
    80004444:	00913423          	sd	s1,8(sp)
    80004448:	01213023          	sd	s2,0(sp)
    8000444c:	02010413          	addi	s0,sp,32
    80004450:	00052783          	lw	a5,0(a0)
    80004454:	00079a63          	bnez	a5,80004468 <release+0x30>
    80004458:	00001517          	auipc	a0,0x1
    8000445c:	e9050513          	addi	a0,a0,-368 # 800052e8 <digits+0x28>
    80004460:	fffff097          	auipc	ra,0xfffff
    80004464:	1dc080e7          	jalr	476(ra) # 8000363c <panic>
    80004468:	01053903          	ld	s2,16(a0)
    8000446c:	00050493          	mv	s1,a0
    80004470:	fffff097          	auipc	ra,0xfffff
    80004474:	814080e7          	jalr	-2028(ra) # 80002c84 <mycpu>
    80004478:	fea910e3          	bne	s2,a0,80004458 <release+0x20>
    8000447c:	0004b823          	sd	zero,16(s1)
    80004480:	0ff0000f          	fence
    80004484:	0f50000f          	fence	iorw,ow
    80004488:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000448c:	ffffe097          	auipc	ra,0xffffe
    80004490:	7f8080e7          	jalr	2040(ra) # 80002c84 <mycpu>
    80004494:	100027f3          	csrr	a5,sstatus
    80004498:	0027f793          	andi	a5,a5,2
    8000449c:	04079a63          	bnez	a5,800044f0 <release+0xb8>
    800044a0:	07852783          	lw	a5,120(a0)
    800044a4:	02f05e63          	blez	a5,800044e0 <release+0xa8>
    800044a8:	fff7871b          	addiw	a4,a5,-1
    800044ac:	06e52c23          	sw	a4,120(a0)
    800044b0:	00071c63          	bnez	a4,800044c8 <release+0x90>
    800044b4:	07c52783          	lw	a5,124(a0)
    800044b8:	00078863          	beqz	a5,800044c8 <release+0x90>
    800044bc:	100027f3          	csrr	a5,sstatus
    800044c0:	0027e793          	ori	a5,a5,2
    800044c4:	10079073          	csrw	sstatus,a5
    800044c8:	01813083          	ld	ra,24(sp)
    800044cc:	01013403          	ld	s0,16(sp)
    800044d0:	00813483          	ld	s1,8(sp)
    800044d4:	00013903          	ld	s2,0(sp)
    800044d8:	02010113          	addi	sp,sp,32
    800044dc:	00008067          	ret
    800044e0:	00001517          	auipc	a0,0x1
    800044e4:	e2850513          	addi	a0,a0,-472 # 80005308 <digits+0x48>
    800044e8:	fffff097          	auipc	ra,0xfffff
    800044ec:	154080e7          	jalr	340(ra) # 8000363c <panic>
    800044f0:	00001517          	auipc	a0,0x1
    800044f4:	e0050513          	addi	a0,a0,-512 # 800052f0 <digits+0x30>
    800044f8:	fffff097          	auipc	ra,0xfffff
    800044fc:	144080e7          	jalr	324(ra) # 8000363c <panic>

0000000080004500 <holding>:
    80004500:	00052783          	lw	a5,0(a0)
    80004504:	00079663          	bnez	a5,80004510 <holding+0x10>
    80004508:	00000513          	li	a0,0
    8000450c:	00008067          	ret
    80004510:	fe010113          	addi	sp,sp,-32
    80004514:	00813823          	sd	s0,16(sp)
    80004518:	00913423          	sd	s1,8(sp)
    8000451c:	00113c23          	sd	ra,24(sp)
    80004520:	02010413          	addi	s0,sp,32
    80004524:	01053483          	ld	s1,16(a0)
    80004528:	ffffe097          	auipc	ra,0xffffe
    8000452c:	75c080e7          	jalr	1884(ra) # 80002c84 <mycpu>
    80004530:	01813083          	ld	ra,24(sp)
    80004534:	01013403          	ld	s0,16(sp)
    80004538:	40a48533          	sub	a0,s1,a0
    8000453c:	00153513          	seqz	a0,a0
    80004540:	00813483          	ld	s1,8(sp)
    80004544:	02010113          	addi	sp,sp,32
    80004548:	00008067          	ret

000000008000454c <push_off>:
    8000454c:	fe010113          	addi	sp,sp,-32
    80004550:	00813823          	sd	s0,16(sp)
    80004554:	00113c23          	sd	ra,24(sp)
    80004558:	00913423          	sd	s1,8(sp)
    8000455c:	02010413          	addi	s0,sp,32
    80004560:	100024f3          	csrr	s1,sstatus
    80004564:	100027f3          	csrr	a5,sstatus
    80004568:	ffd7f793          	andi	a5,a5,-3
    8000456c:	10079073          	csrw	sstatus,a5
    80004570:	ffffe097          	auipc	ra,0xffffe
    80004574:	714080e7          	jalr	1812(ra) # 80002c84 <mycpu>
    80004578:	07852783          	lw	a5,120(a0)
    8000457c:	02078663          	beqz	a5,800045a8 <push_off+0x5c>
    80004580:	ffffe097          	auipc	ra,0xffffe
    80004584:	704080e7          	jalr	1796(ra) # 80002c84 <mycpu>
    80004588:	07852783          	lw	a5,120(a0)
    8000458c:	01813083          	ld	ra,24(sp)
    80004590:	01013403          	ld	s0,16(sp)
    80004594:	0017879b          	addiw	a5,a5,1
    80004598:	06f52c23          	sw	a5,120(a0)
    8000459c:	00813483          	ld	s1,8(sp)
    800045a0:	02010113          	addi	sp,sp,32
    800045a4:	00008067          	ret
    800045a8:	0014d493          	srli	s1,s1,0x1
    800045ac:	ffffe097          	auipc	ra,0xffffe
    800045b0:	6d8080e7          	jalr	1752(ra) # 80002c84 <mycpu>
    800045b4:	0014f493          	andi	s1,s1,1
    800045b8:	06952e23          	sw	s1,124(a0)
    800045bc:	fc5ff06f          	j	80004580 <push_off+0x34>

00000000800045c0 <pop_off>:
    800045c0:	ff010113          	addi	sp,sp,-16
    800045c4:	00813023          	sd	s0,0(sp)
    800045c8:	00113423          	sd	ra,8(sp)
    800045cc:	01010413          	addi	s0,sp,16
    800045d0:	ffffe097          	auipc	ra,0xffffe
    800045d4:	6b4080e7          	jalr	1716(ra) # 80002c84 <mycpu>
    800045d8:	100027f3          	csrr	a5,sstatus
    800045dc:	0027f793          	andi	a5,a5,2
    800045e0:	04079663          	bnez	a5,8000462c <pop_off+0x6c>
    800045e4:	07852783          	lw	a5,120(a0)
    800045e8:	02f05a63          	blez	a5,8000461c <pop_off+0x5c>
    800045ec:	fff7871b          	addiw	a4,a5,-1
    800045f0:	06e52c23          	sw	a4,120(a0)
    800045f4:	00071c63          	bnez	a4,8000460c <pop_off+0x4c>
    800045f8:	07c52783          	lw	a5,124(a0)
    800045fc:	00078863          	beqz	a5,8000460c <pop_off+0x4c>
    80004600:	100027f3          	csrr	a5,sstatus
    80004604:	0027e793          	ori	a5,a5,2
    80004608:	10079073          	csrw	sstatus,a5
    8000460c:	00813083          	ld	ra,8(sp)
    80004610:	00013403          	ld	s0,0(sp)
    80004614:	01010113          	addi	sp,sp,16
    80004618:	00008067          	ret
    8000461c:	00001517          	auipc	a0,0x1
    80004620:	cec50513          	addi	a0,a0,-788 # 80005308 <digits+0x48>
    80004624:	fffff097          	auipc	ra,0xfffff
    80004628:	018080e7          	jalr	24(ra) # 8000363c <panic>
    8000462c:	00001517          	auipc	a0,0x1
    80004630:	cc450513          	addi	a0,a0,-828 # 800052f0 <digits+0x30>
    80004634:	fffff097          	auipc	ra,0xfffff
    80004638:	008080e7          	jalr	8(ra) # 8000363c <panic>

000000008000463c <push_on>:
    8000463c:	fe010113          	addi	sp,sp,-32
    80004640:	00813823          	sd	s0,16(sp)
    80004644:	00113c23          	sd	ra,24(sp)
    80004648:	00913423          	sd	s1,8(sp)
    8000464c:	02010413          	addi	s0,sp,32
    80004650:	100024f3          	csrr	s1,sstatus
    80004654:	100027f3          	csrr	a5,sstatus
    80004658:	0027e793          	ori	a5,a5,2
    8000465c:	10079073          	csrw	sstatus,a5
    80004660:	ffffe097          	auipc	ra,0xffffe
    80004664:	624080e7          	jalr	1572(ra) # 80002c84 <mycpu>
    80004668:	07852783          	lw	a5,120(a0)
    8000466c:	02078663          	beqz	a5,80004698 <push_on+0x5c>
    80004670:	ffffe097          	auipc	ra,0xffffe
    80004674:	614080e7          	jalr	1556(ra) # 80002c84 <mycpu>
    80004678:	07852783          	lw	a5,120(a0)
    8000467c:	01813083          	ld	ra,24(sp)
    80004680:	01013403          	ld	s0,16(sp)
    80004684:	0017879b          	addiw	a5,a5,1
    80004688:	06f52c23          	sw	a5,120(a0)
    8000468c:	00813483          	ld	s1,8(sp)
    80004690:	02010113          	addi	sp,sp,32
    80004694:	00008067          	ret
    80004698:	0014d493          	srli	s1,s1,0x1
    8000469c:	ffffe097          	auipc	ra,0xffffe
    800046a0:	5e8080e7          	jalr	1512(ra) # 80002c84 <mycpu>
    800046a4:	0014f493          	andi	s1,s1,1
    800046a8:	06952e23          	sw	s1,124(a0)
    800046ac:	fc5ff06f          	j	80004670 <push_on+0x34>

00000000800046b0 <pop_on>:
    800046b0:	ff010113          	addi	sp,sp,-16
    800046b4:	00813023          	sd	s0,0(sp)
    800046b8:	00113423          	sd	ra,8(sp)
    800046bc:	01010413          	addi	s0,sp,16
    800046c0:	ffffe097          	auipc	ra,0xffffe
    800046c4:	5c4080e7          	jalr	1476(ra) # 80002c84 <mycpu>
    800046c8:	100027f3          	csrr	a5,sstatus
    800046cc:	0027f793          	andi	a5,a5,2
    800046d0:	04078463          	beqz	a5,80004718 <pop_on+0x68>
    800046d4:	07852783          	lw	a5,120(a0)
    800046d8:	02f05863          	blez	a5,80004708 <pop_on+0x58>
    800046dc:	fff7879b          	addiw	a5,a5,-1
    800046e0:	06f52c23          	sw	a5,120(a0)
    800046e4:	07853783          	ld	a5,120(a0)
    800046e8:	00079863          	bnez	a5,800046f8 <pop_on+0x48>
    800046ec:	100027f3          	csrr	a5,sstatus
    800046f0:	ffd7f793          	andi	a5,a5,-3
    800046f4:	10079073          	csrw	sstatus,a5
    800046f8:	00813083          	ld	ra,8(sp)
    800046fc:	00013403          	ld	s0,0(sp)
    80004700:	01010113          	addi	sp,sp,16
    80004704:	00008067          	ret
    80004708:	00001517          	auipc	a0,0x1
    8000470c:	c2850513          	addi	a0,a0,-984 # 80005330 <digits+0x70>
    80004710:	fffff097          	auipc	ra,0xfffff
    80004714:	f2c080e7          	jalr	-212(ra) # 8000363c <panic>
    80004718:	00001517          	auipc	a0,0x1
    8000471c:	bf850513          	addi	a0,a0,-1032 # 80005310 <digits+0x50>
    80004720:	fffff097          	auipc	ra,0xfffff
    80004724:	f1c080e7          	jalr	-228(ra) # 8000363c <panic>

0000000080004728 <__memset>:
    80004728:	ff010113          	addi	sp,sp,-16
    8000472c:	00813423          	sd	s0,8(sp)
    80004730:	01010413          	addi	s0,sp,16
    80004734:	1a060e63          	beqz	a2,800048f0 <__memset+0x1c8>
    80004738:	40a007b3          	neg	a5,a0
    8000473c:	0077f793          	andi	a5,a5,7
    80004740:	00778693          	addi	a3,a5,7
    80004744:	00b00813          	li	a6,11
    80004748:	0ff5f593          	andi	a1,a1,255
    8000474c:	fff6071b          	addiw	a4,a2,-1
    80004750:	1b06e663          	bltu	a3,a6,800048fc <__memset+0x1d4>
    80004754:	1cd76463          	bltu	a4,a3,8000491c <__memset+0x1f4>
    80004758:	1a078e63          	beqz	a5,80004914 <__memset+0x1ec>
    8000475c:	00b50023          	sb	a1,0(a0)
    80004760:	00100713          	li	a4,1
    80004764:	1ae78463          	beq	a5,a4,8000490c <__memset+0x1e4>
    80004768:	00b500a3          	sb	a1,1(a0)
    8000476c:	00200713          	li	a4,2
    80004770:	1ae78a63          	beq	a5,a4,80004924 <__memset+0x1fc>
    80004774:	00b50123          	sb	a1,2(a0)
    80004778:	00300713          	li	a4,3
    8000477c:	18e78463          	beq	a5,a4,80004904 <__memset+0x1dc>
    80004780:	00b501a3          	sb	a1,3(a0)
    80004784:	00400713          	li	a4,4
    80004788:	1ae78263          	beq	a5,a4,8000492c <__memset+0x204>
    8000478c:	00b50223          	sb	a1,4(a0)
    80004790:	00500713          	li	a4,5
    80004794:	1ae78063          	beq	a5,a4,80004934 <__memset+0x20c>
    80004798:	00b502a3          	sb	a1,5(a0)
    8000479c:	00700713          	li	a4,7
    800047a0:	18e79e63          	bne	a5,a4,8000493c <__memset+0x214>
    800047a4:	00b50323          	sb	a1,6(a0)
    800047a8:	00700e93          	li	t4,7
    800047ac:	00859713          	slli	a4,a1,0x8
    800047b0:	00e5e733          	or	a4,a1,a4
    800047b4:	01059e13          	slli	t3,a1,0x10
    800047b8:	01c76e33          	or	t3,a4,t3
    800047bc:	01859313          	slli	t1,a1,0x18
    800047c0:	006e6333          	or	t1,t3,t1
    800047c4:	02059893          	slli	a7,a1,0x20
    800047c8:	40f60e3b          	subw	t3,a2,a5
    800047cc:	011368b3          	or	a7,t1,a7
    800047d0:	02859813          	slli	a6,a1,0x28
    800047d4:	0108e833          	or	a6,a7,a6
    800047d8:	03059693          	slli	a3,a1,0x30
    800047dc:	003e589b          	srliw	a7,t3,0x3
    800047e0:	00d866b3          	or	a3,a6,a3
    800047e4:	03859713          	slli	a4,a1,0x38
    800047e8:	00389813          	slli	a6,a7,0x3
    800047ec:	00f507b3          	add	a5,a0,a5
    800047f0:	00e6e733          	or	a4,a3,a4
    800047f4:	000e089b          	sext.w	a7,t3
    800047f8:	00f806b3          	add	a3,a6,a5
    800047fc:	00e7b023          	sd	a4,0(a5)
    80004800:	00878793          	addi	a5,a5,8
    80004804:	fed79ce3          	bne	a5,a3,800047fc <__memset+0xd4>
    80004808:	ff8e7793          	andi	a5,t3,-8
    8000480c:	0007871b          	sext.w	a4,a5
    80004810:	01d787bb          	addw	a5,a5,t4
    80004814:	0ce88e63          	beq	a7,a4,800048f0 <__memset+0x1c8>
    80004818:	00f50733          	add	a4,a0,a5
    8000481c:	00b70023          	sb	a1,0(a4)
    80004820:	0017871b          	addiw	a4,a5,1
    80004824:	0cc77663          	bgeu	a4,a2,800048f0 <__memset+0x1c8>
    80004828:	00e50733          	add	a4,a0,a4
    8000482c:	00b70023          	sb	a1,0(a4)
    80004830:	0027871b          	addiw	a4,a5,2
    80004834:	0ac77e63          	bgeu	a4,a2,800048f0 <__memset+0x1c8>
    80004838:	00e50733          	add	a4,a0,a4
    8000483c:	00b70023          	sb	a1,0(a4)
    80004840:	0037871b          	addiw	a4,a5,3
    80004844:	0ac77663          	bgeu	a4,a2,800048f0 <__memset+0x1c8>
    80004848:	00e50733          	add	a4,a0,a4
    8000484c:	00b70023          	sb	a1,0(a4)
    80004850:	0047871b          	addiw	a4,a5,4
    80004854:	08c77e63          	bgeu	a4,a2,800048f0 <__memset+0x1c8>
    80004858:	00e50733          	add	a4,a0,a4
    8000485c:	00b70023          	sb	a1,0(a4)
    80004860:	0057871b          	addiw	a4,a5,5
    80004864:	08c77663          	bgeu	a4,a2,800048f0 <__memset+0x1c8>
    80004868:	00e50733          	add	a4,a0,a4
    8000486c:	00b70023          	sb	a1,0(a4)
    80004870:	0067871b          	addiw	a4,a5,6
    80004874:	06c77e63          	bgeu	a4,a2,800048f0 <__memset+0x1c8>
    80004878:	00e50733          	add	a4,a0,a4
    8000487c:	00b70023          	sb	a1,0(a4)
    80004880:	0077871b          	addiw	a4,a5,7
    80004884:	06c77663          	bgeu	a4,a2,800048f0 <__memset+0x1c8>
    80004888:	00e50733          	add	a4,a0,a4
    8000488c:	00b70023          	sb	a1,0(a4)
    80004890:	0087871b          	addiw	a4,a5,8
    80004894:	04c77e63          	bgeu	a4,a2,800048f0 <__memset+0x1c8>
    80004898:	00e50733          	add	a4,a0,a4
    8000489c:	00b70023          	sb	a1,0(a4)
    800048a0:	0097871b          	addiw	a4,a5,9
    800048a4:	04c77663          	bgeu	a4,a2,800048f0 <__memset+0x1c8>
    800048a8:	00e50733          	add	a4,a0,a4
    800048ac:	00b70023          	sb	a1,0(a4)
    800048b0:	00a7871b          	addiw	a4,a5,10
    800048b4:	02c77e63          	bgeu	a4,a2,800048f0 <__memset+0x1c8>
    800048b8:	00e50733          	add	a4,a0,a4
    800048bc:	00b70023          	sb	a1,0(a4)
    800048c0:	00b7871b          	addiw	a4,a5,11
    800048c4:	02c77663          	bgeu	a4,a2,800048f0 <__memset+0x1c8>
    800048c8:	00e50733          	add	a4,a0,a4
    800048cc:	00b70023          	sb	a1,0(a4)
    800048d0:	00c7871b          	addiw	a4,a5,12
    800048d4:	00c77e63          	bgeu	a4,a2,800048f0 <__memset+0x1c8>
    800048d8:	00e50733          	add	a4,a0,a4
    800048dc:	00b70023          	sb	a1,0(a4)
    800048e0:	00d7879b          	addiw	a5,a5,13
    800048e4:	00c7f663          	bgeu	a5,a2,800048f0 <__memset+0x1c8>
    800048e8:	00f507b3          	add	a5,a0,a5
    800048ec:	00b78023          	sb	a1,0(a5)
    800048f0:	00813403          	ld	s0,8(sp)
    800048f4:	01010113          	addi	sp,sp,16
    800048f8:	00008067          	ret
    800048fc:	00b00693          	li	a3,11
    80004900:	e55ff06f          	j	80004754 <__memset+0x2c>
    80004904:	00300e93          	li	t4,3
    80004908:	ea5ff06f          	j	800047ac <__memset+0x84>
    8000490c:	00100e93          	li	t4,1
    80004910:	e9dff06f          	j	800047ac <__memset+0x84>
    80004914:	00000e93          	li	t4,0
    80004918:	e95ff06f          	j	800047ac <__memset+0x84>
    8000491c:	00000793          	li	a5,0
    80004920:	ef9ff06f          	j	80004818 <__memset+0xf0>
    80004924:	00200e93          	li	t4,2
    80004928:	e85ff06f          	j	800047ac <__memset+0x84>
    8000492c:	00400e93          	li	t4,4
    80004930:	e7dff06f          	j	800047ac <__memset+0x84>
    80004934:	00500e93          	li	t4,5
    80004938:	e75ff06f          	j	800047ac <__memset+0x84>
    8000493c:	00600e93          	li	t4,6
    80004940:	e6dff06f          	j	800047ac <__memset+0x84>

0000000080004944 <__memmove>:
    80004944:	ff010113          	addi	sp,sp,-16
    80004948:	00813423          	sd	s0,8(sp)
    8000494c:	01010413          	addi	s0,sp,16
    80004950:	0e060863          	beqz	a2,80004a40 <__memmove+0xfc>
    80004954:	fff6069b          	addiw	a3,a2,-1
    80004958:	0006881b          	sext.w	a6,a3
    8000495c:	0ea5e863          	bltu	a1,a0,80004a4c <__memmove+0x108>
    80004960:	00758713          	addi	a4,a1,7
    80004964:	00a5e7b3          	or	a5,a1,a0
    80004968:	40a70733          	sub	a4,a4,a0
    8000496c:	0077f793          	andi	a5,a5,7
    80004970:	00f73713          	sltiu	a4,a4,15
    80004974:	00174713          	xori	a4,a4,1
    80004978:	0017b793          	seqz	a5,a5
    8000497c:	00e7f7b3          	and	a5,a5,a4
    80004980:	10078863          	beqz	a5,80004a90 <__memmove+0x14c>
    80004984:	00900793          	li	a5,9
    80004988:	1107f463          	bgeu	a5,a6,80004a90 <__memmove+0x14c>
    8000498c:	0036581b          	srliw	a6,a2,0x3
    80004990:	fff8081b          	addiw	a6,a6,-1
    80004994:	02081813          	slli	a6,a6,0x20
    80004998:	01d85893          	srli	a7,a6,0x1d
    8000499c:	00858813          	addi	a6,a1,8
    800049a0:	00058793          	mv	a5,a1
    800049a4:	00050713          	mv	a4,a0
    800049a8:	01088833          	add	a6,a7,a6
    800049ac:	0007b883          	ld	a7,0(a5)
    800049b0:	00878793          	addi	a5,a5,8
    800049b4:	00870713          	addi	a4,a4,8
    800049b8:	ff173c23          	sd	a7,-8(a4)
    800049bc:	ff0798e3          	bne	a5,a6,800049ac <__memmove+0x68>
    800049c0:	ff867713          	andi	a4,a2,-8
    800049c4:	02071793          	slli	a5,a4,0x20
    800049c8:	0207d793          	srli	a5,a5,0x20
    800049cc:	00f585b3          	add	a1,a1,a5
    800049d0:	40e686bb          	subw	a3,a3,a4
    800049d4:	00f507b3          	add	a5,a0,a5
    800049d8:	06e60463          	beq	a2,a4,80004a40 <__memmove+0xfc>
    800049dc:	0005c703          	lbu	a4,0(a1)
    800049e0:	00e78023          	sb	a4,0(a5)
    800049e4:	04068e63          	beqz	a3,80004a40 <__memmove+0xfc>
    800049e8:	0015c603          	lbu	a2,1(a1)
    800049ec:	00100713          	li	a4,1
    800049f0:	00c780a3          	sb	a2,1(a5)
    800049f4:	04e68663          	beq	a3,a4,80004a40 <__memmove+0xfc>
    800049f8:	0025c603          	lbu	a2,2(a1)
    800049fc:	00200713          	li	a4,2
    80004a00:	00c78123          	sb	a2,2(a5)
    80004a04:	02e68e63          	beq	a3,a4,80004a40 <__memmove+0xfc>
    80004a08:	0035c603          	lbu	a2,3(a1)
    80004a0c:	00300713          	li	a4,3
    80004a10:	00c781a3          	sb	a2,3(a5)
    80004a14:	02e68663          	beq	a3,a4,80004a40 <__memmove+0xfc>
    80004a18:	0045c603          	lbu	a2,4(a1)
    80004a1c:	00400713          	li	a4,4
    80004a20:	00c78223          	sb	a2,4(a5)
    80004a24:	00e68e63          	beq	a3,a4,80004a40 <__memmove+0xfc>
    80004a28:	0055c603          	lbu	a2,5(a1)
    80004a2c:	00500713          	li	a4,5
    80004a30:	00c782a3          	sb	a2,5(a5)
    80004a34:	00e68663          	beq	a3,a4,80004a40 <__memmove+0xfc>
    80004a38:	0065c703          	lbu	a4,6(a1)
    80004a3c:	00e78323          	sb	a4,6(a5)
    80004a40:	00813403          	ld	s0,8(sp)
    80004a44:	01010113          	addi	sp,sp,16
    80004a48:	00008067          	ret
    80004a4c:	02061713          	slli	a4,a2,0x20
    80004a50:	02075713          	srli	a4,a4,0x20
    80004a54:	00e587b3          	add	a5,a1,a4
    80004a58:	f0f574e3          	bgeu	a0,a5,80004960 <__memmove+0x1c>
    80004a5c:	02069613          	slli	a2,a3,0x20
    80004a60:	02065613          	srli	a2,a2,0x20
    80004a64:	fff64613          	not	a2,a2
    80004a68:	00e50733          	add	a4,a0,a4
    80004a6c:	00c78633          	add	a2,a5,a2
    80004a70:	fff7c683          	lbu	a3,-1(a5)
    80004a74:	fff78793          	addi	a5,a5,-1
    80004a78:	fff70713          	addi	a4,a4,-1
    80004a7c:	00d70023          	sb	a3,0(a4)
    80004a80:	fec798e3          	bne	a5,a2,80004a70 <__memmove+0x12c>
    80004a84:	00813403          	ld	s0,8(sp)
    80004a88:	01010113          	addi	sp,sp,16
    80004a8c:	00008067          	ret
    80004a90:	02069713          	slli	a4,a3,0x20
    80004a94:	02075713          	srli	a4,a4,0x20
    80004a98:	00170713          	addi	a4,a4,1
    80004a9c:	00e50733          	add	a4,a0,a4
    80004aa0:	00050793          	mv	a5,a0
    80004aa4:	0005c683          	lbu	a3,0(a1)
    80004aa8:	00178793          	addi	a5,a5,1
    80004aac:	00158593          	addi	a1,a1,1
    80004ab0:	fed78fa3          	sb	a3,-1(a5)
    80004ab4:	fee798e3          	bne	a5,a4,80004aa4 <__memmove+0x160>
    80004ab8:	f89ff06f          	j	80004a40 <__memmove+0xfc>

0000000080004abc <__putc>:
    80004abc:	fe010113          	addi	sp,sp,-32
    80004ac0:	00813823          	sd	s0,16(sp)
    80004ac4:	00113c23          	sd	ra,24(sp)
    80004ac8:	02010413          	addi	s0,sp,32
    80004acc:	00050793          	mv	a5,a0
    80004ad0:	fef40593          	addi	a1,s0,-17
    80004ad4:	00100613          	li	a2,1
    80004ad8:	00000513          	li	a0,0
    80004adc:	fef407a3          	sb	a5,-17(s0)
    80004ae0:	fffff097          	auipc	ra,0xfffff
    80004ae4:	b3c080e7          	jalr	-1220(ra) # 8000361c <console_write>
    80004ae8:	01813083          	ld	ra,24(sp)
    80004aec:	01013403          	ld	s0,16(sp)
    80004af0:	02010113          	addi	sp,sp,32
    80004af4:	00008067          	ret

0000000080004af8 <__getc>:
    80004af8:	fe010113          	addi	sp,sp,-32
    80004afc:	00813823          	sd	s0,16(sp)
    80004b00:	00113c23          	sd	ra,24(sp)
    80004b04:	02010413          	addi	s0,sp,32
    80004b08:	fe840593          	addi	a1,s0,-24
    80004b0c:	00100613          	li	a2,1
    80004b10:	00000513          	li	a0,0
    80004b14:	fffff097          	auipc	ra,0xfffff
    80004b18:	ae8080e7          	jalr	-1304(ra) # 800035fc <console_read>
    80004b1c:	fe844503          	lbu	a0,-24(s0)
    80004b20:	01813083          	ld	ra,24(sp)
    80004b24:	01013403          	ld	s0,16(sp)
    80004b28:	02010113          	addi	sp,sp,32
    80004b2c:	00008067          	ret

0000000080004b30 <console_handler>:
    80004b30:	fe010113          	addi	sp,sp,-32
    80004b34:	00813823          	sd	s0,16(sp)
    80004b38:	00113c23          	sd	ra,24(sp)
    80004b3c:	00913423          	sd	s1,8(sp)
    80004b40:	02010413          	addi	s0,sp,32
    80004b44:	14202773          	csrr	a4,scause
    80004b48:	100027f3          	csrr	a5,sstatus
    80004b4c:	0027f793          	andi	a5,a5,2
    80004b50:	06079e63          	bnez	a5,80004bcc <console_handler+0x9c>
    80004b54:	00074c63          	bltz	a4,80004b6c <console_handler+0x3c>
    80004b58:	01813083          	ld	ra,24(sp)
    80004b5c:	01013403          	ld	s0,16(sp)
    80004b60:	00813483          	ld	s1,8(sp)
    80004b64:	02010113          	addi	sp,sp,32
    80004b68:	00008067          	ret
    80004b6c:	0ff77713          	andi	a4,a4,255
    80004b70:	00900793          	li	a5,9
    80004b74:	fef712e3          	bne	a4,a5,80004b58 <console_handler+0x28>
    80004b78:	ffffe097          	auipc	ra,0xffffe
    80004b7c:	6dc080e7          	jalr	1756(ra) # 80003254 <plic_claim>
    80004b80:	00a00793          	li	a5,10
    80004b84:	00050493          	mv	s1,a0
    80004b88:	02f50c63          	beq	a0,a5,80004bc0 <console_handler+0x90>
    80004b8c:	fc0506e3          	beqz	a0,80004b58 <console_handler+0x28>
    80004b90:	00050593          	mv	a1,a0
    80004b94:	00000517          	auipc	a0,0x0
    80004b98:	6a450513          	addi	a0,a0,1700 # 80005238 <_ZZ12printIntegermE6digits+0xe0>
    80004b9c:	fffff097          	auipc	ra,0xfffff
    80004ba0:	afc080e7          	jalr	-1284(ra) # 80003698 <__printf>
    80004ba4:	01013403          	ld	s0,16(sp)
    80004ba8:	01813083          	ld	ra,24(sp)
    80004bac:	00048513          	mv	a0,s1
    80004bb0:	00813483          	ld	s1,8(sp)
    80004bb4:	02010113          	addi	sp,sp,32
    80004bb8:	ffffe317          	auipc	t1,0xffffe
    80004bbc:	6d430067          	jr	1748(t1) # 8000328c <plic_complete>
    80004bc0:	fffff097          	auipc	ra,0xfffff
    80004bc4:	3e0080e7          	jalr	992(ra) # 80003fa0 <uartintr>
    80004bc8:	fddff06f          	j	80004ba4 <console_handler+0x74>
    80004bcc:	00000517          	auipc	a0,0x0
    80004bd0:	76c50513          	addi	a0,a0,1900 # 80005338 <digits+0x78>
    80004bd4:	fffff097          	auipc	ra,0xfffff
    80004bd8:	a68080e7          	jalr	-1432(ra) # 8000363c <panic>
	...
