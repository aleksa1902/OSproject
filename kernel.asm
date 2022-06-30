
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	54813103          	ld	sp,1352(sp) # 80007548 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	049030ef          	jal	ra,80003864 <start>

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

00000000800010f8 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    800010f8:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    800010fc:	00b29a63          	bne	t0,a1,80001110 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001100:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001104:	fe029ae3          	bnez	t0,800010f8 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001108:	00000513          	li	a0,0
    jr ra                  # Return.
    8000110c:	00008067          	ret

0000000080001110 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001110:	00100513          	li	a0,1
    80001114:	00008067          	ret
	...

0000000080001120 <_ZN5Riscv14supervisorTrapEv>:
.align 4
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
_ZN5Riscv14supervisorTrapEv:
    # push all registers to stack
    addi sp, sp, -256
    80001120:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001124:	00013023          	sd	zero,0(sp)
    80001128:	00113423          	sd	ra,8(sp)
    8000112c:	00213823          	sd	sp,16(sp)
    80001130:	00313c23          	sd	gp,24(sp)
    80001134:	02413023          	sd	tp,32(sp)
    80001138:	02513423          	sd	t0,40(sp)
    8000113c:	02613823          	sd	t1,48(sp)
    80001140:	02713c23          	sd	t2,56(sp)
    80001144:	04813023          	sd	s0,64(sp)
    80001148:	04913423          	sd	s1,72(sp)
    8000114c:	04a13823          	sd	a0,80(sp)
    80001150:	04b13c23          	sd	a1,88(sp)
    80001154:	06c13023          	sd	a2,96(sp)
    80001158:	06d13423          	sd	a3,104(sp)
    8000115c:	06e13823          	sd	a4,112(sp)
    80001160:	06f13c23          	sd	a5,120(sp)
    80001164:	09013023          	sd	a6,128(sp)
    80001168:	09113423          	sd	a7,136(sp)
    8000116c:	09213823          	sd	s2,144(sp)
    80001170:	09313c23          	sd	s3,152(sp)
    80001174:	0b413023          	sd	s4,160(sp)
    80001178:	0b513423          	sd	s5,168(sp)
    8000117c:	0b613823          	sd	s6,176(sp)
    80001180:	0b713c23          	sd	s7,184(sp)
    80001184:	0d813023          	sd	s8,192(sp)
    80001188:	0d913423          	sd	s9,200(sp)
    8000118c:	0da13823          	sd	s10,208(sp)
    80001190:	0db13c23          	sd	s11,216(sp)
    80001194:	0fc13023          	sd	t3,224(sp)
    80001198:	0fd13423          	sd	t4,232(sp)
    8000119c:	0fe13823          	sd	t5,240(sp)
    800011a0:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleSupervisorTrapEv
    800011a4:	4f9010ef          	jal	ra,80002e9c <_ZN5Riscv20handleSupervisorTrapEv>

    sd a0, 10*8(sp)
    800011a8:	04a13823          	sd	a0,80(sp)

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011ac:	00013003          	ld	zero,0(sp)
    800011b0:	00813083          	ld	ra,8(sp)
    800011b4:	01013103          	ld	sp,16(sp)
    800011b8:	01813183          	ld	gp,24(sp)
    800011bc:	02013203          	ld	tp,32(sp)
    800011c0:	02813283          	ld	t0,40(sp)
    800011c4:	03013303          	ld	t1,48(sp)
    800011c8:	03813383          	ld	t2,56(sp)
    800011cc:	04013403          	ld	s0,64(sp)
    800011d0:	04813483          	ld	s1,72(sp)
    800011d4:	05013503          	ld	a0,80(sp)
    800011d8:	05813583          	ld	a1,88(sp)
    800011dc:	06013603          	ld	a2,96(sp)
    800011e0:	06813683          	ld	a3,104(sp)
    800011e4:	07013703          	ld	a4,112(sp)
    800011e8:	07813783          	ld	a5,120(sp)
    800011ec:	08013803          	ld	a6,128(sp)
    800011f0:	08813883          	ld	a7,136(sp)
    800011f4:	09013903          	ld	s2,144(sp)
    800011f8:	09813983          	ld	s3,152(sp)
    800011fc:	0a013a03          	ld	s4,160(sp)
    80001200:	0a813a83          	ld	s5,168(sp)
    80001204:	0b013b03          	ld	s6,176(sp)
    80001208:	0b813b83          	ld	s7,184(sp)
    8000120c:	0c013c03          	ld	s8,192(sp)
    80001210:	0c813c83          	ld	s9,200(sp)
    80001214:	0d013d03          	ld	s10,208(sp)
    80001218:	0d813d83          	ld	s11,216(sp)
    8000121c:	0e013e03          	ld	t3,224(sp)
    80001220:	0e813e83          	ld	t4,232(sp)
    80001224:	0f013f03          	ld	t5,240(sp)
    80001228:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    8000122c:	10010113          	addi	sp,sp,256

    sret
    80001230:	10200073          	sret
	...

0000000080001240 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001240:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001244:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001248:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000124c:	0085b103          	ld	sp,8(a1)

    ret
    80001250:	00008067          	ret

0000000080001254 <_Z9mem_allocm>:
//
// Created by os on 5/22/22.
//
#include "../h/syscall_c.hpp"

void* mem_alloc(size_t size){
    80001254:	ff010113          	addi	sp,sp,-16
    80001258:	00813423          	sd	s0,8(sp)
    8000125c:	01010413          	addi	s0,sp,16
    size_t arg = 60;
    size_t num = 1;

    __asm__ volatile("mv %0, a0" : "=r" (arg));
    80001260:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001264:	00100713          	li	a4,1
    80001268:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (arg));
    8000126c:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    80001270:	00000073          	ecall

    void* ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001274:	00050513          	mv	a0,a0

    return ret;

}
    80001278:	00813403          	ld	s0,8(sp)
    8000127c:	01010113          	addi	sp,sp,16
    80001280:	00008067          	ret

0000000080001284 <_Z8mem_freePv>:

int mem_free(void* addr){
    80001284:	ff010113          	addi	sp,sp,-16
    80001288:	00813423          	sd	s0,8(sp)
    8000128c:	01010413          	addi	s0,sp,16
    void* arg = 0;
    int num = 2;

    __asm__ volatile("mv %0, a0" : "=r" (arg));
    80001290:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001294:	00200713          	li	a4,2
    80001298:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (arg));
    8000129c:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    800012a0:	00000073          	ecall

    return 1;
}
    800012a4:	00100513          	li	a0,1
    800012a8:	00813403          	ld	s0,8(sp)
    800012ac:	01010113          	addi	sp,sp,16
    800012b0:	00008067          	ret

00000000800012b4 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg){
    800012b4:	ff010113          	addi	sp,sp,-16
    800012b8:	00813423          	sd	s0,8(sp)
    800012bc:	01010413          	addi	s0,sp,16
    thread_t* arg1 = 0;
    TCB::Body arg2 = 0;
    void* arg3 = 0;
    int num = 11;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    800012c0:	00050693          	mv	a3,a0
    __asm__ volatile("mv %0, a1" : "=r" (arg2));
    800012c4:	00058713          	mv	a4,a1
    __asm__ volatile("mv %0, a2" : "=r" (arg3));
    800012c8:	00060793          	mv	a5,a2
    __asm__ volatile("mv a0, %0" : : "r" (num));
    800012cc:	00b00613          	li	a2,11
    800012d0:	00060513          	mv	a0,a2
    __asm__ volatile("mv a1, %0" : : "r" (arg1));
    800012d4:	00068593          	mv	a1,a3
    __asm__ volatile("mv a2, %0" : : "r" (arg2));
    800012d8:	00070613          	mv	a2,a4
    __asm__ volatile("mv a3, %0" : : "r" (arg3));
    800012dc:	00078693          	mv	a3,a5

    __asm__ volatile("ecall");
    800012e0:	00000073          	ecall

    return 1;
}
    800012e4:	00100513          	li	a0,1
    800012e8:	00813403          	ld	s0,8(sp)
    800012ec:	01010113          	addi	sp,sp,16
    800012f0:	00008067          	ret

00000000800012f4 <_Z11thread_exitv>:

int thread_exit (){
    800012f4:	ff010113          	addi	sp,sp,-16
    800012f8:	00813423          	sd	s0,8(sp)
    800012fc:	01010413          	addi	s0,sp,16
    int num = 12;

    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001300:	00c00793          	li	a5,12
    80001304:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001308:	00000073          	ecall

    return 1;
}
    8000130c:	00100513          	li	a0,1
    80001310:	00813403          	ld	s0,8(sp)
    80001314:	01010113          	addi	sp,sp,16
    80001318:	00008067          	ret

000000008000131c <_Z15thread_dispatchv>:

void thread_dispatch (){
    8000131c:	ff010113          	addi	sp,sp,-16
    80001320:	00813423          	sd	s0,8(sp)
    80001324:	01010413          	addi	s0,sp,16
    int num = 13;

    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001328:	00d00793          	li	a5,13
    8000132c:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001330:	00000073          	ecall
}
    80001334:	00813403          	ld	s0,8(sp)
    80001338:	01010113          	addi	sp,sp,16
    8000133c:	00008067          	ret

0000000080001340 <_Z8sem_openPP9KernelSemj>:

int sem_open (sem_t* handle, unsigned init){
    80001340:	ff010113          	addi	sp,sp,-16
    80001344:	00813423          	sd	s0,8(sp)
    80001348:	01010413          	addi	s0,sp,16
    sem_t* arg1 = 0;
    unsigned arg2 = 0;
    int num = 21;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    8000134c:	00050713          	mv	a4,a0
    __asm__ volatile("mv %0, a1" : "=r" (arg2));
    80001350:	00058793          	mv	a5,a1
    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001354:	01500693          	li	a3,21
    80001358:	00068513          	mv	a0,a3
    __asm__ volatile("mv a1, %0" : : "r" (arg1));
    8000135c:	00070593          	mv	a1,a4
    __asm__ volatile("mv a2, %0" : : "r" (arg2));
    80001360:	00078613          	mv	a2,a5

    __asm__ volatile("ecall");
    80001364:	00000073          	ecall

    return 1;

}
    80001368:	00100513          	li	a0,1
    8000136c:	00813403          	ld	s0,8(sp)
    80001370:	01010113          	addi	sp,sp,16
    80001374:	00008067          	ret

0000000080001378 <_Z9sem_closeP9KernelSem>:

int sem_close (sem_t handle){
    80001378:	ff010113          	addi	sp,sp,-16
    8000137c:	00813423          	sd	s0,8(sp)
    80001380:	01010413          	addi	s0,sp,16
    sem_t arg1 = 0;
    int num = 22;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    80001384:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001388:	01600713          	li	a4,22
    8000138c:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (arg1));
    80001390:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    80001394:	00000073          	ecall

    return 1;
}
    80001398:	00100513          	li	a0,1
    8000139c:	00813403          	ld	s0,8(sp)
    800013a0:	01010113          	addi	sp,sp,16
    800013a4:	00008067          	ret

00000000800013a8 <_Z8sem_waitP9KernelSem>:

int sem_wait (sem_t id){
    800013a8:	ff010113          	addi	sp,sp,-16
    800013ac:	00813423          	sd	s0,8(sp)
    800013b0:	01010413          	addi	s0,sp,16
    sem_t arg1 = 0;
    int num = 23;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    800013b4:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    800013b8:	01700713          	li	a4,23
    800013bc:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (arg1));
    800013c0:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    800013c4:	00000073          	ecall

    return 1;
}
    800013c8:	00100513          	li	a0,1
    800013cc:	00813403          	ld	s0,8(sp)
    800013d0:	01010113          	addi	sp,sp,16
    800013d4:	00008067          	ret

00000000800013d8 <_Z10sem_signalP9KernelSem>:

int sem_signal (sem_t id){
    800013d8:	ff010113          	addi	sp,sp,-16
    800013dc:	00813423          	sd	s0,8(sp)
    800013e0:	01010413          	addi	s0,sp,16
    sem_t arg1 = 0;
    int num = 24;

    __asm__ volatile("mv %0, a0" : "=r" (arg1));
    800013e4:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    800013e8:	01800713          	li	a4,24
    800013ec:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (arg1));
    800013f0:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    800013f4:	00000073          	ecall

    return 1;
}
    800013f8:	00100513          	li	a0,1
    800013fc:	00813403          	ld	s0,8(sp)
    80001400:	01010113          	addi	sp,sp,16
    80001404:	00008067          	ret

0000000080001408 <_Z4getcv>:

char getc (){
    80001408:	ff010113          	addi	sp,sp,-16
    8000140c:	00813423          	sd	s0,8(sp)
    80001410:	01010413          	addi	s0,sp,16
    int num = 41;

    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001414:	02900793          	li	a5,41
    80001418:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    8000141c:	00000073          	ecall

    char ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001420:	00050513          	mv	a0,a0

    return ret;
}
    80001424:	0ff57513          	andi	a0,a0,255
    80001428:	00813403          	ld	s0,8(sp)
    8000142c:	01010113          	addi	sp,sp,16
    80001430:	00008067          	ret

0000000080001434 <_Z4putcc>:

void putc (char){
    80001434:	ff010113          	addi	sp,sp,-16
    80001438:	00813423          	sd	s0,8(sp)
    8000143c:	01010413          	addi	s0,sp,16
    char c;
    int num = 42;

    __asm__ volatile("mv %0, a0" : "=r" (c));
    80001440:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001444:	02a00713          	li	a4,42
    80001448:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (c));
    8000144c:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    80001450:	00000073          	ecall
    80001454:	00813403          	ld	s0,8(sp)
    80001458:	01010113          	addi	sp,sp,16
    8000145c:	00008067          	ret

0000000080001460 <_ZN9KernelSemC1Ei>:
//

#include "../h/KernelSem.hpp"
#include "../h/scheduler.hpp"

KernelSem::KernelSem(int init) {
    80001460:	ff010113          	addi	sp,sp,-16
    80001464:	00813423          	sd	s0,8(sp)
    80001468:	01010413          	addi	s0,sp,16
    8000146c:	00006797          	auipc	a5,0x6
    80001470:	fa478793          	addi	a5,a5,-92 # 80007410 <_ZTV9KernelSem+0x10>
    80001474:	00f53023          	sd	a5,0(a0)
        Elem(T *data, Elem *next) : data(data), next(next){}
    };

    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    80001478:	00053c23          	sd	zero,24(a0)
    8000147c:	02053023          	sd	zero,32(a0)
    this->value = init;
    80001480:	00b52823          	sw	a1,16(a0)
    this->mySemaphore = nullptr;
    80001484:	00053423          	sd	zero,8(a0)
}
    80001488:	00813403          	ld	s0,8(sp)
    8000148c:	01010113          	addi	sp,sp,16
    80001490:	00008067          	ret

0000000080001494 <_ZN9KernelSem9createSemEi>:

KernelSem *KernelSem::createSem(int init) {
    80001494:	fe010113          	addi	sp,sp,-32
    80001498:	00113c23          	sd	ra,24(sp)
    8000149c:	00813823          	sd	s0,16(sp)
    800014a0:	00913423          	sd	s1,8(sp)
    800014a4:	01213023          	sd	s2,0(sp)
    800014a8:	02010413          	addi	s0,sp,32
    800014ac:	00050913          	mv	s2,a0
    return new KernelSem(init);
    800014b0:	02800513          	li	a0,40
    800014b4:	00001097          	auipc	ra,0x1
    800014b8:	600080e7          	jalr	1536(ra) # 80002ab4 <_Znwm>
    800014bc:	00050493          	mv	s1,a0
    800014c0:	00090593          	mv	a1,s2
    800014c4:	00000097          	auipc	ra,0x0
    800014c8:	f9c080e7          	jalr	-100(ra) # 80001460 <_ZN9KernelSemC1Ei>
}
    800014cc:	00048513          	mv	a0,s1
    800014d0:	01813083          	ld	ra,24(sp)
    800014d4:	01013403          	ld	s0,16(sp)
    800014d8:	00813483          	ld	s1,8(sp)
    800014dc:	00013903          	ld	s2,0(sp)
    800014e0:	02010113          	addi	sp,sp,32
    800014e4:	00008067          	ret

00000000800014e8 <_ZNK9KernelSem3valEv>:

KernelSem::~KernelSem() {
    this->freeSem();
}

int KernelSem::val() const {
    800014e8:	ff010113          	addi	sp,sp,-16
    800014ec:	00813423          	sd	s0,8(sp)
    800014f0:	01010413          	addi	s0,sp,16
    return value;
}
    800014f4:	01052503          	lw	a0,16(a0)
    800014f8:	00813403          	ld	s0,8(sp)
    800014fc:	01010113          	addi	sp,sp,16
    80001500:	00008067          	ret

0000000080001504 <_ZN9KernelSem4waitEv>:

int KernelSem::wait() {
    value--;
    80001504:	01052783          	lw	a5,16(a0)
    80001508:	fff7879b          	addiw	a5,a5,-1
    8000150c:	00f52823          	sw	a5,16(a0)

    if(value < 0){
    80001510:	02079713          	slli	a4,a5,0x20
    80001514:	00074663          	bltz	a4,80001520 <_ZN9KernelSem4waitEv+0x1c>

        return 1;
    }

    return 1;
}
    80001518:	00100513          	li	a0,1
    8000151c:	00008067          	ret
int KernelSem::wait() {
    80001520:	fe010113          	addi	sp,sp,-32
    80001524:	00113c23          	sd	ra,24(sp)
    80001528:	00813823          	sd	s0,16(sp)
    8000152c:	00913423          	sd	s1,8(sp)
    80001530:	01213023          	sd	s2,0(sp)
    80001534:	02010413          	addi	s0,sp,32
    80001538:	00050493          	mv	s1,a0
        TCB::running->setBlocked();
    8000153c:	00006797          	auipc	a5,0x6
    80001540:	0147b783          	ld	a5,20(a5) # 80007550 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001544:	0007b903          	ld	s2,0(a5)
        static TCB *createThread(Body body);
        static void yield();
        static TCB *running;
        bool checkBody();
        bool isBlocked() const { return blocked; }
        void setBlocked() { blocked = true; }
    80001548:	00100793          	li	a5,1
    8000154c:	02f904a3          	sb	a5,41(s2)
        Elem *elem = new Elem(data, head);
        head = elem;
        if(!tail){ tail = head;}
    }
    void addLast(T *data){
        Elem *elem = new Elem(data, 0);
    80001550:	01000513          	li	a0,16
    80001554:	00001097          	auipc	ra,0x1
    80001558:	560080e7          	jalr	1376(ra) # 80002ab4 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    8000155c:	01253023          	sd	s2,0(a0)
    80001560:	00053423          	sd	zero,8(a0)
        if(tail){
    80001564:	0204b783          	ld	a5,32(s1)
    80001568:	02078863          	beqz	a5,80001598 <_ZN9KernelSem4waitEv+0x94>
            tail->next = elem;
    8000156c:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001570:	02a4b023          	sd	a0,32(s1)
        thread_dispatch();
    80001574:	00000097          	auipc	ra,0x0
    80001578:	da8080e7          	jalr	-600(ra) # 8000131c <_Z15thread_dispatchv>
}
    8000157c:	00100513          	li	a0,1
    80001580:	01813083          	ld	ra,24(sp)
    80001584:	01013403          	ld	s0,16(sp)
    80001588:	00813483          	ld	s1,8(sp)
    8000158c:	00013903          	ld	s2,0(sp)
    80001590:	02010113          	addi	sp,sp,32
    80001594:	00008067          	ret
        }else{
            head = tail = elem;
    80001598:	02a4b023          	sd	a0,32(s1)
    8000159c:	00a4bc23          	sd	a0,24(s1)
    800015a0:	fd5ff06f          	j	80001574 <_ZN9KernelSem4waitEv+0x70>

00000000800015a4 <_ZN9KernelSem6signalEv>:

int KernelSem::signal() {
    value++;
    800015a4:	01052783          	lw	a5,16(a0)
    800015a8:	0017879b          	addiw	a5,a5,1
    800015ac:	0007871b          	sext.w	a4,a5
    800015b0:	00f52823          	sw	a5,16(a0)

    if(value <= 0){
    800015b4:	00e05663          	blez	a4,800015c0 <_ZN9KernelSem6signalEv+0x1c>
            Scheduler::put(unblock);
            return 0;
        }
    }
    return 0;
}
    800015b8:	00000513          	li	a0,0
    800015bc:	00008067          	ret
        T *ret = elem->data;
        delete elem;
        return ret;
    }
    T *peekFirst(){
        if(!head){ return 0; }
    800015c0:	01853783          	ld	a5,24(a0)
    800015c4:	fe078ae3          	beqz	a5,800015b8 <_ZN9KernelSem6signalEv+0x14>
int KernelSem::signal() {
    800015c8:	fe010113          	addi	sp,sp,-32
    800015cc:	00113c23          	sd	ra,24(sp)
    800015d0:	00813823          	sd	s0,16(sp)
    800015d4:	00913423          	sd	s1,8(sp)
    800015d8:	02010413          	addi	s0,sp,32
        return head->data;
    800015dc:	0007b483          	ld	s1,0(a5)
        if(listWait.peekFirst()){
    800015e0:	00049e63          	bnez	s1,800015fc <_ZN9KernelSem6signalEv+0x58>
}
    800015e4:	00000513          	li	a0,0
    800015e8:	01813083          	ld	ra,24(sp)
    800015ec:	01013403          	ld	s0,16(sp)
    800015f0:	00813483          	ld	s1,8(sp)
    800015f4:	02010113          	addi	sp,sp,32
    800015f8:	00008067          	ret
        if(!head){ return 0; }
    800015fc:	00078e63          	beqz	a5,80001618 <_ZN9KernelSem6signalEv+0x74>
        head = head->next;
    80001600:	0087b703          	ld	a4,8(a5)
    80001604:	00e53c23          	sd	a4,24(a0)
        if(!head){ tail = 0; }
    80001608:	02070463          	beqz	a4,80001630 <_ZN9KernelSem6signalEv+0x8c>
        delete elem;
    8000160c:	00078513          	mv	a0,a5
    80001610:	00001097          	auipc	ra,0x1
    80001614:	4f4080e7          	jalr	1268(ra) # 80002b04 <_ZdlPv>
    80001618:	00100793          	li	a5,1
    8000161c:	02f484a3          	sb	a5,41(s1)
            Scheduler::put(unblock);
    80001620:	00048513          	mv	a0,s1
    80001624:	00002097          	auipc	ra,0x2
    80001628:	c04080e7          	jalr	-1020(ra) # 80003228 <_ZN9Scheduler3putEP3TCB>
            return 0;
    8000162c:	fb9ff06f          	j	800015e4 <_ZN9KernelSem6signalEv+0x40>
        if(!head){ tail = 0; }
    80001630:	02053023          	sd	zero,32(a0)
    80001634:	fd9ff06f          	j	8000160c <_ZN9KernelSem6signalEv+0x68>

0000000080001638 <_ZN9KernelSem7freeSemEv>:

void KernelSem::freeSem() {
    80001638:	fe010113          	addi	sp,sp,-32
    8000163c:	00113c23          	sd	ra,24(sp)
    80001640:	00813823          	sd	s0,16(sp)
    80001644:	00913423          	sd	s1,8(sp)
    80001648:	01213023          	sd	s2,0(sp)
    8000164c:	02010413          	addi	s0,sp,32
    80001650:	00050493          	mv	s1,a0
    80001654:	0200006f          	j	80001674 <_ZN9KernelSem7freeSemEv+0x3c>
    80001658:	0204b023          	sd	zero,32(s1)
        delete elem;
    8000165c:	00001097          	auipc	ra,0x1
    80001660:	4a8080e7          	jalr	1192(ra) # 80002b04 <_ZdlPv>
        void unblock() { blocked = false; }
    80001664:	020904a3          	sb	zero,41(s2)
    while(listWait.peekFirst()){
        thread_t unblock = listWait.peekFirst();
        listWait.removeFirst();
        unblock->unblock();
        Scheduler::put(unblock);
    80001668:	00090513          	mv	a0,s2
    8000166c:	00002097          	auipc	ra,0x2
    80001670:	bbc080e7          	jalr	-1092(ra) # 80003228 <_ZN9Scheduler3putEP3TCB>
        if(!head){ return 0; }
    80001674:	0184b783          	ld	a5,24(s1)
    80001678:	02078263          	beqz	a5,8000169c <_ZN9KernelSem7freeSemEv+0x64>
        return head->data;
    8000167c:	0007b903          	ld	s2,0(a5)
    while(listWait.peekFirst()){
    80001680:	00090e63          	beqz	s2,8000169c <_ZN9KernelSem7freeSemEv+0x64>
        if(!head){ return 0; }
    80001684:	00078513          	mv	a0,a5
    80001688:	fc078ee3          	beqz	a5,80001664 <_ZN9KernelSem7freeSemEv+0x2c>
        head = head->next;
    8000168c:	0087b783          	ld	a5,8(a5)
    80001690:	00f4bc23          	sd	a5,24(s1)
        if(!head){ tail = 0; }
    80001694:	fc0794e3          	bnez	a5,8000165c <_ZN9KernelSem7freeSemEv+0x24>
    80001698:	fc1ff06f          	j	80001658 <_ZN9KernelSem7freeSemEv+0x20>
    }

    value = 1; // diskutabilno
    8000169c:	00100793          	li	a5,1
    800016a0:	00f4a823          	sw	a5,16(s1)
}
    800016a4:	01813083          	ld	ra,24(sp)
    800016a8:	01013403          	ld	s0,16(sp)
    800016ac:	00813483          	ld	s1,8(sp)
    800016b0:	00013903          	ld	s2,0(sp)
    800016b4:	02010113          	addi	sp,sp,32
    800016b8:	00008067          	ret

00000000800016bc <_ZN9KernelSemD1Ev>:
KernelSem::~KernelSem() {
    800016bc:	ff010113          	addi	sp,sp,-16
    800016c0:	00113423          	sd	ra,8(sp)
    800016c4:	00813023          	sd	s0,0(sp)
    800016c8:	01010413          	addi	s0,sp,16
    800016cc:	00006797          	auipc	a5,0x6
    800016d0:	d4478793          	addi	a5,a5,-700 # 80007410 <_ZTV9KernelSem+0x10>
    800016d4:	00f53023          	sd	a5,0(a0)
    this->freeSem();
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	f60080e7          	jalr	-160(ra) # 80001638 <_ZN9KernelSem7freeSemEv>
}
    800016e0:	00813083          	ld	ra,8(sp)
    800016e4:	00013403          	ld	s0,0(sp)
    800016e8:	01010113          	addi	sp,sp,16
    800016ec:	00008067          	ret

00000000800016f0 <_ZN9KernelSemD0Ev>:
KernelSem::~KernelSem() {
    800016f0:	fe010113          	addi	sp,sp,-32
    800016f4:	00113c23          	sd	ra,24(sp)
    800016f8:	00813823          	sd	s0,16(sp)
    800016fc:	00913423          	sd	s1,8(sp)
    80001700:	02010413          	addi	s0,sp,32
    80001704:	00050493          	mv	s1,a0
}
    80001708:	00000097          	auipc	ra,0x0
    8000170c:	fb4080e7          	jalr	-76(ra) # 800016bc <_ZN9KernelSemD1Ev>
    80001710:	00048513          	mv	a0,s1
    80001714:	00001097          	auipc	ra,0x1
    80001718:	3f0080e7          	jalr	1008(ra) # 80002b04 <_ZdlPv>
    8000171c:	01813083          	ld	ra,24(sp)
    80001720:	01013403          	ld	s0,16(sp)
    80001724:	00813483          	ld	s1,8(sp)
    80001728:	02010113          	addi	sp,sp,32
    8000172c:	00008067          	ret

0000000080001730 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80001730:	fe010113          	addi	sp,sp,-32
    80001734:	00113c23          	sd	ra,24(sp)
    80001738:	00813823          	sd	s0,16(sp)
    8000173c:	00913423          	sd	s1,8(sp)
    80001740:	02010413          	addi	s0,sp,32
    80001744:	00050493          	mv	s1,a0
    LOCK();
    80001748:	00100613          	li	a2,1
    8000174c:	00000593          	li	a1,0
    80001750:	00006517          	auipc	a0,0x6
    80001754:	e6050513          	addi	a0,a0,-416 # 800075b0 <lockPrint>
    80001758:	00000097          	auipc	ra,0x0
    8000175c:	9a0080e7          	jalr	-1632(ra) # 800010f8 <copy_and_swap>
    80001760:	fe0514e3          	bnez	a0,80001748 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80001764:	0004c503          	lbu	a0,0(s1)
    80001768:	00050a63          	beqz	a0,8000177c <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    8000176c:	00000097          	auipc	ra,0x0
    80001770:	cc8080e7          	jalr	-824(ra) # 80001434 <_Z4putcc>
        string++;
    80001774:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001778:	fedff06f          	j	80001764 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    8000177c:	00000613          	li	a2,0
    80001780:	00100593          	li	a1,1
    80001784:	00006517          	auipc	a0,0x6
    80001788:	e2c50513          	addi	a0,a0,-468 # 800075b0 <lockPrint>
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	96c080e7          	jalr	-1684(ra) # 800010f8 <copy_and_swap>
    80001794:	fe0514e3          	bnez	a0,8000177c <_Z11printStringPKc+0x4c>
}
    80001798:	01813083          	ld	ra,24(sp)
    8000179c:	01013403          	ld	s0,16(sp)
    800017a0:	00813483          	ld	s1,8(sp)
    800017a4:	02010113          	addi	sp,sp,32
    800017a8:	00008067          	ret

00000000800017ac <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800017ac:	fd010113          	addi	sp,sp,-48
    800017b0:	02113423          	sd	ra,40(sp)
    800017b4:	02813023          	sd	s0,32(sp)
    800017b8:	00913c23          	sd	s1,24(sp)
    800017bc:	01213823          	sd	s2,16(sp)
    800017c0:	01313423          	sd	s3,8(sp)
    800017c4:	01413023          	sd	s4,0(sp)
    800017c8:	03010413          	addi	s0,sp,48
    800017cc:	00050993          	mv	s3,a0
    800017d0:	00058a13          	mv	s4,a1
    LOCK();
    800017d4:	00100613          	li	a2,1
    800017d8:	00000593          	li	a1,0
    800017dc:	00006517          	auipc	a0,0x6
    800017e0:	dd450513          	addi	a0,a0,-556 # 800075b0 <lockPrint>
    800017e4:	00000097          	auipc	ra,0x0
    800017e8:	914080e7          	jalr	-1772(ra) # 800010f8 <copy_and_swap>
    800017ec:	fe0514e3          	bnez	a0,800017d4 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800017f0:	00000913          	li	s2,0
    800017f4:	00090493          	mv	s1,s2
    800017f8:	0019091b          	addiw	s2,s2,1
    800017fc:	03495a63          	bge	s2,s4,80001830 <_Z9getStringPci+0x84>
        cc = getc();
    80001800:	00000097          	auipc	ra,0x0
    80001804:	c08080e7          	jalr	-1016(ra) # 80001408 <_Z4getcv>
        if(cc < 1)
    80001808:	02050463          	beqz	a0,80001830 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    8000180c:	009984b3          	add	s1,s3,s1
    80001810:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80001814:	00a00793          	li	a5,10
    80001818:	00f50a63          	beq	a0,a5,8000182c <_Z9getStringPci+0x80>
    8000181c:	00d00793          	li	a5,13
    80001820:	fcf51ae3          	bne	a0,a5,800017f4 <_Z9getStringPci+0x48>
        buf[i++] = c;
    80001824:	00090493          	mv	s1,s2
    80001828:	0080006f          	j	80001830 <_Z9getStringPci+0x84>
    8000182c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80001830:	009984b3          	add	s1,s3,s1
    80001834:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80001838:	00000613          	li	a2,0
    8000183c:	00100593          	li	a1,1
    80001840:	00006517          	auipc	a0,0x6
    80001844:	d7050513          	addi	a0,a0,-656 # 800075b0 <lockPrint>
    80001848:	00000097          	auipc	ra,0x0
    8000184c:	8b0080e7          	jalr	-1872(ra) # 800010f8 <copy_and_swap>
    80001850:	fe0514e3          	bnez	a0,80001838 <_Z9getStringPci+0x8c>
    return buf;
}
    80001854:	00098513          	mv	a0,s3
    80001858:	02813083          	ld	ra,40(sp)
    8000185c:	02013403          	ld	s0,32(sp)
    80001860:	01813483          	ld	s1,24(sp)
    80001864:	01013903          	ld	s2,16(sp)
    80001868:	00813983          	ld	s3,8(sp)
    8000186c:	00013a03          	ld	s4,0(sp)
    80001870:	03010113          	addi	sp,sp,48
    80001874:	00008067          	ret

0000000080001878 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80001878:	ff010113          	addi	sp,sp,-16
    8000187c:	00813423          	sd	s0,8(sp)
    80001880:	01010413          	addi	s0,sp,16
    80001884:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80001888:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    8000188c:	0006c603          	lbu	a2,0(a3)
    80001890:	fd06071b          	addiw	a4,a2,-48
    80001894:	0ff77713          	andi	a4,a4,255
    80001898:	00900793          	li	a5,9
    8000189c:	02e7e063          	bltu	a5,a4,800018bc <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800018a0:	0025179b          	slliw	a5,a0,0x2
    800018a4:	00a787bb          	addw	a5,a5,a0
    800018a8:	0017979b          	slliw	a5,a5,0x1
    800018ac:	00168693          	addi	a3,a3,1
    800018b0:	00c787bb          	addw	a5,a5,a2
    800018b4:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800018b8:	fd5ff06f          	j	8000188c <_Z11stringToIntPKc+0x14>
    return n;
}
    800018bc:	00813403          	ld	s0,8(sp)
    800018c0:	01010113          	addi	sp,sp,16
    800018c4:	00008067          	ret

00000000800018c8 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800018c8:	fc010113          	addi	sp,sp,-64
    800018cc:	02113c23          	sd	ra,56(sp)
    800018d0:	02813823          	sd	s0,48(sp)
    800018d4:	02913423          	sd	s1,40(sp)
    800018d8:	03213023          	sd	s2,32(sp)
    800018dc:	01313c23          	sd	s3,24(sp)
    800018e0:	04010413          	addi	s0,sp,64
    800018e4:	00050493          	mv	s1,a0
    800018e8:	00058913          	mv	s2,a1
    800018ec:	00060993          	mv	s3,a2
    LOCK();
    800018f0:	00100613          	li	a2,1
    800018f4:	00000593          	li	a1,0
    800018f8:	00006517          	auipc	a0,0x6
    800018fc:	cb850513          	addi	a0,a0,-840 # 800075b0 <lockPrint>
    80001900:	fffff097          	auipc	ra,0xfffff
    80001904:	7f8080e7          	jalr	2040(ra) # 800010f8 <copy_and_swap>
    80001908:	fe0514e3          	bnez	a0,800018f0 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000190c:	00098463          	beqz	s3,80001914 <_Z8printIntiii+0x4c>
    80001910:	0804c463          	bltz	s1,80001998 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80001914:	0004851b          	sext.w	a0,s1
    neg = 0;
    80001918:	00000593          	li	a1,0
    }

    i = 0;
    8000191c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80001920:	0009079b          	sext.w	a5,s2
    80001924:	0325773b          	remuw	a4,a0,s2
    80001928:	00048613          	mv	a2,s1
    8000192c:	0014849b          	addiw	s1,s1,1
    80001930:	02071693          	slli	a3,a4,0x20
    80001934:	0206d693          	srli	a3,a3,0x20
    80001938:	00006717          	auipc	a4,0x6
    8000193c:	af070713          	addi	a4,a4,-1296 # 80007428 <digits>
    80001940:	00d70733          	add	a4,a4,a3
    80001944:	00074683          	lbu	a3,0(a4)
    80001948:	fd040713          	addi	a4,s0,-48
    8000194c:	00c70733          	add	a4,a4,a2
    80001950:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80001954:	0005071b          	sext.w	a4,a0
    80001958:	0325553b          	divuw	a0,a0,s2
    8000195c:	fcf772e3          	bgeu	a4,a5,80001920 <_Z8printIntiii+0x58>
    if(neg)
    80001960:	00058c63          	beqz	a1,80001978 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80001964:	fd040793          	addi	a5,s0,-48
    80001968:	009784b3          	add	s1,a5,s1
    8000196c:	02d00793          	li	a5,45
    80001970:	fef48823          	sb	a5,-16(s1)
    80001974:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80001978:	fff4849b          	addiw	s1,s1,-1
    8000197c:	0204c463          	bltz	s1,800019a4 <_Z8printIntiii+0xdc>
        putc(buf[i]);
    80001980:	fd040793          	addi	a5,s0,-48
    80001984:	009787b3          	add	a5,a5,s1
    80001988:	ff07c503          	lbu	a0,-16(a5)
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	aa8080e7          	jalr	-1368(ra) # 80001434 <_Z4putcc>
    80001994:	fe5ff06f          	j	80001978 <_Z8printIntiii+0xb0>
        x = -xx;
    80001998:	4090053b          	negw	a0,s1
        neg = 1;
    8000199c:	00100593          	li	a1,1
        x = -xx;
    800019a0:	f7dff06f          	j	8000191c <_Z8printIntiii+0x54>

    UNLOCK();
    800019a4:	00000613          	li	a2,0
    800019a8:	00100593          	li	a1,1
    800019ac:	00006517          	auipc	a0,0x6
    800019b0:	c0450513          	addi	a0,a0,-1020 # 800075b0 <lockPrint>
    800019b4:	fffff097          	auipc	ra,0xfffff
    800019b8:	744080e7          	jalr	1860(ra) # 800010f8 <copy_and_swap>
    800019bc:	fe0514e3          	bnez	a0,800019a4 <_Z8printIntiii+0xdc>
    800019c0:	03813083          	ld	ra,56(sp)
    800019c4:	03013403          	ld	s0,48(sp)
    800019c8:	02813483          	ld	s1,40(sp)
    800019cc:	02013903          	ld	s2,32(sp)
    800019d0:	01813983          	ld	s3,24(sp)
    800019d4:	04010113          	addi	sp,sp,64
    800019d8:	00008067          	ret

00000000800019dc <_ZN9BufferCPPC1Ei>:
#include "../h/buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800019dc:	fd010113          	addi	sp,sp,-48
    800019e0:	02113423          	sd	ra,40(sp)
    800019e4:	02813023          	sd	s0,32(sp)
    800019e8:	00913c23          	sd	s1,24(sp)
    800019ec:	01213823          	sd	s2,16(sp)
    800019f0:	01313423          	sd	s3,8(sp)
    800019f4:	03010413          	addi	s0,sp,48
    800019f8:	00050493          	mv	s1,a0
    800019fc:	00058913          	mv	s2,a1
    80001a00:	0015879b          	addiw	a5,a1,1
    80001a04:	0007851b          	sext.w	a0,a5
    80001a08:	00f4a023          	sw	a5,0(s1)
    80001a0c:	0004a823          	sw	zero,16(s1)
    80001a10:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80001a14:	00251513          	slli	a0,a0,0x2
    80001a18:	00000097          	auipc	ra,0x0
    80001a1c:	83c080e7          	jalr	-1988(ra) # 80001254 <_Z9mem_allocm>
    80001a20:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80001a24:	01000513          	li	a0,16
    80001a28:	00001097          	auipc	ra,0x1
    80001a2c:	08c080e7          	jalr	140(ra) # 80002ab4 <_Znwm>
    80001a30:	00050993          	mv	s3,a0
    80001a34:	00000593          	li	a1,0
    80001a38:	00001097          	auipc	ra,0x1
    80001a3c:	390080e7          	jalr	912(ra) # 80002dc8 <_ZN9SemaphoreC1Ej>
    80001a40:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80001a44:	01000513          	li	a0,16
    80001a48:	00001097          	auipc	ra,0x1
    80001a4c:	06c080e7          	jalr	108(ra) # 80002ab4 <_Znwm>
    80001a50:	00050993          	mv	s3,a0
    80001a54:	00090593          	mv	a1,s2
    80001a58:	00001097          	auipc	ra,0x1
    80001a5c:	370080e7          	jalr	880(ra) # 80002dc8 <_ZN9SemaphoreC1Ej>
    80001a60:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80001a64:	01000513          	li	a0,16
    80001a68:	00001097          	auipc	ra,0x1
    80001a6c:	04c080e7          	jalr	76(ra) # 80002ab4 <_Znwm>
    80001a70:	00050913          	mv	s2,a0
    80001a74:	00100593          	li	a1,1
    80001a78:	00001097          	auipc	ra,0x1
    80001a7c:	350080e7          	jalr	848(ra) # 80002dc8 <_ZN9SemaphoreC1Ej>
    80001a80:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80001a84:	01000513          	li	a0,16
    80001a88:	00001097          	auipc	ra,0x1
    80001a8c:	02c080e7          	jalr	44(ra) # 80002ab4 <_Znwm>
    80001a90:	00050913          	mv	s2,a0
    80001a94:	00100593          	li	a1,1
    80001a98:	00001097          	auipc	ra,0x1
    80001a9c:	330080e7          	jalr	816(ra) # 80002dc8 <_ZN9SemaphoreC1Ej>
    80001aa0:	0324b823          	sd	s2,48(s1)
}
    80001aa4:	02813083          	ld	ra,40(sp)
    80001aa8:	02013403          	ld	s0,32(sp)
    80001aac:	01813483          	ld	s1,24(sp)
    80001ab0:	01013903          	ld	s2,16(sp)
    80001ab4:	00813983          	ld	s3,8(sp)
    80001ab8:	03010113          	addi	sp,sp,48
    80001abc:	00008067          	ret
    80001ac0:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80001ac4:	00098513          	mv	a0,s3
    80001ac8:	00001097          	auipc	ra,0x1
    80001acc:	03c080e7          	jalr	60(ra) # 80002b04 <_ZdlPv>
    80001ad0:	00048513          	mv	a0,s1
    80001ad4:	00007097          	auipc	ra,0x7
    80001ad8:	be4080e7          	jalr	-1052(ra) # 800086b8 <_Unwind_Resume>
    80001adc:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80001ae0:	00098513          	mv	a0,s3
    80001ae4:	00001097          	auipc	ra,0x1
    80001ae8:	020080e7          	jalr	32(ra) # 80002b04 <_ZdlPv>
    80001aec:	00048513          	mv	a0,s1
    80001af0:	00007097          	auipc	ra,0x7
    80001af4:	bc8080e7          	jalr	-1080(ra) # 800086b8 <_Unwind_Resume>
    80001af8:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80001afc:	00090513          	mv	a0,s2
    80001b00:	00001097          	auipc	ra,0x1
    80001b04:	004080e7          	jalr	4(ra) # 80002b04 <_ZdlPv>
    80001b08:	00048513          	mv	a0,s1
    80001b0c:	00007097          	auipc	ra,0x7
    80001b10:	bac080e7          	jalr	-1108(ra) # 800086b8 <_Unwind_Resume>
    80001b14:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80001b18:	00090513          	mv	a0,s2
    80001b1c:	00001097          	auipc	ra,0x1
    80001b20:	fe8080e7          	jalr	-24(ra) # 80002b04 <_ZdlPv>
    80001b24:	00048513          	mv	a0,s1
    80001b28:	00007097          	auipc	ra,0x7
    80001b2c:	b90080e7          	jalr	-1136(ra) # 800086b8 <_Unwind_Resume>

0000000080001b30 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80001b30:	fe010113          	addi	sp,sp,-32
    80001b34:	00113c23          	sd	ra,24(sp)
    80001b38:	00813823          	sd	s0,16(sp)
    80001b3c:	00913423          	sd	s1,8(sp)
    80001b40:	01213023          	sd	s2,0(sp)
    80001b44:	02010413          	addi	s0,sp,32
    80001b48:	00050493          	mv	s1,a0
    80001b4c:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80001b50:	01853503          	ld	a0,24(a0)
    80001b54:	00001097          	auipc	ra,0x1
    80001b58:	214080e7          	jalr	532(ra) # 80002d68 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80001b5c:	0304b503          	ld	a0,48(s1)
    80001b60:	00001097          	auipc	ra,0x1
    80001b64:	208080e7          	jalr	520(ra) # 80002d68 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80001b68:	0084b783          	ld	a5,8(s1)
    80001b6c:	0144a703          	lw	a4,20(s1)
    80001b70:	00271713          	slli	a4,a4,0x2
    80001b74:	00e787b3          	add	a5,a5,a4
    80001b78:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80001b7c:	0144a783          	lw	a5,20(s1)
    80001b80:	0017879b          	addiw	a5,a5,1
    80001b84:	0004a703          	lw	a4,0(s1)
    80001b88:	02e7e7bb          	remw	a5,a5,a4
    80001b8c:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80001b90:	0304b503          	ld	a0,48(s1)
    80001b94:	00001097          	auipc	ra,0x1
    80001b98:	204080e7          	jalr	516(ra) # 80002d98 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80001b9c:	0204b503          	ld	a0,32(s1)
    80001ba0:	00001097          	auipc	ra,0x1
    80001ba4:	1f8080e7          	jalr	504(ra) # 80002d98 <_ZN9Semaphore6signalEv>

}
    80001ba8:	01813083          	ld	ra,24(sp)
    80001bac:	01013403          	ld	s0,16(sp)
    80001bb0:	00813483          	ld	s1,8(sp)
    80001bb4:	00013903          	ld	s2,0(sp)
    80001bb8:	02010113          	addi	sp,sp,32
    80001bbc:	00008067          	ret

0000000080001bc0 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80001bc0:	fe010113          	addi	sp,sp,-32
    80001bc4:	00113c23          	sd	ra,24(sp)
    80001bc8:	00813823          	sd	s0,16(sp)
    80001bcc:	00913423          	sd	s1,8(sp)
    80001bd0:	01213023          	sd	s2,0(sp)
    80001bd4:	02010413          	addi	s0,sp,32
    80001bd8:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80001bdc:	02053503          	ld	a0,32(a0)
    80001be0:	00001097          	auipc	ra,0x1
    80001be4:	188080e7          	jalr	392(ra) # 80002d68 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80001be8:	0284b503          	ld	a0,40(s1)
    80001bec:	00001097          	auipc	ra,0x1
    80001bf0:	17c080e7          	jalr	380(ra) # 80002d68 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80001bf4:	0084b703          	ld	a4,8(s1)
    80001bf8:	0104a783          	lw	a5,16(s1)
    80001bfc:	00279693          	slli	a3,a5,0x2
    80001c00:	00d70733          	add	a4,a4,a3
    80001c04:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80001c08:	0017879b          	addiw	a5,a5,1
    80001c0c:	0004a703          	lw	a4,0(s1)
    80001c10:	02e7e7bb          	remw	a5,a5,a4
    80001c14:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80001c18:	0284b503          	ld	a0,40(s1)
    80001c1c:	00001097          	auipc	ra,0x1
    80001c20:	17c080e7          	jalr	380(ra) # 80002d98 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80001c24:	0184b503          	ld	a0,24(s1)
    80001c28:	00001097          	auipc	ra,0x1
    80001c2c:	170080e7          	jalr	368(ra) # 80002d98 <_ZN9Semaphore6signalEv>

    return ret;
}
    80001c30:	00090513          	mv	a0,s2
    80001c34:	01813083          	ld	ra,24(sp)
    80001c38:	01013403          	ld	s0,16(sp)
    80001c3c:	00813483          	ld	s1,8(sp)
    80001c40:	00013903          	ld	s2,0(sp)
    80001c44:	02010113          	addi	sp,sp,32
    80001c48:	00008067          	ret

0000000080001c4c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80001c4c:	fe010113          	addi	sp,sp,-32
    80001c50:	00113c23          	sd	ra,24(sp)
    80001c54:	00813823          	sd	s0,16(sp)
    80001c58:	00913423          	sd	s1,8(sp)
    80001c5c:	01213023          	sd	s2,0(sp)
    80001c60:	02010413          	addi	s0,sp,32
    80001c64:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80001c68:	02853503          	ld	a0,40(a0)
    80001c6c:	00001097          	auipc	ra,0x1
    80001c70:	0fc080e7          	jalr	252(ra) # 80002d68 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80001c74:	0304b503          	ld	a0,48(s1)
    80001c78:	00001097          	auipc	ra,0x1
    80001c7c:	0f0080e7          	jalr	240(ra) # 80002d68 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80001c80:	0144a783          	lw	a5,20(s1)
    80001c84:	0104a903          	lw	s2,16(s1)
    80001c88:	0327ce63          	blt	a5,s2,80001cc4 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80001c8c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80001c90:	0304b503          	ld	a0,48(s1)
    80001c94:	00001097          	auipc	ra,0x1
    80001c98:	104080e7          	jalr	260(ra) # 80002d98 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80001c9c:	0284b503          	ld	a0,40(s1)
    80001ca0:	00001097          	auipc	ra,0x1
    80001ca4:	0f8080e7          	jalr	248(ra) # 80002d98 <_ZN9Semaphore6signalEv>

    return ret;
}
    80001ca8:	00090513          	mv	a0,s2
    80001cac:	01813083          	ld	ra,24(sp)
    80001cb0:	01013403          	ld	s0,16(sp)
    80001cb4:	00813483          	ld	s1,8(sp)
    80001cb8:	00013903          	ld	s2,0(sp)
    80001cbc:	02010113          	addi	sp,sp,32
    80001cc0:	00008067          	ret
        ret = cap - head + tail;
    80001cc4:	0004a703          	lw	a4,0(s1)
    80001cc8:	4127093b          	subw	s2,a4,s2
    80001ccc:	00f9093b          	addw	s2,s2,a5
    80001cd0:	fc1ff06f          	j	80001c90 <_ZN9BufferCPP6getCntEv+0x44>

0000000080001cd4 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80001cd4:	fe010113          	addi	sp,sp,-32
    80001cd8:	00113c23          	sd	ra,24(sp)
    80001cdc:	00813823          	sd	s0,16(sp)
    80001ce0:	00913423          	sd	s1,8(sp)
    80001ce4:	02010413          	addi	s0,sp,32
    80001ce8:	00050493          	mv	s1,a0
    Console::putc('\n');
    80001cec:	00a00513          	li	a0,10
    80001cf0:	00001097          	auipc	ra,0x1
    80001cf4:	14c080e7          	jalr	332(ra) # 80002e3c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80001cf8:	00004517          	auipc	a0,0x4
    80001cfc:	32850513          	addi	a0,a0,808 # 80006020 <CONSOLE_STATUS+0x10>
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	a30080e7          	jalr	-1488(ra) # 80001730 <_Z11printStringPKc>
    while (getCnt()) {
    80001d08:	00048513          	mv	a0,s1
    80001d0c:	00000097          	auipc	ra,0x0
    80001d10:	f40080e7          	jalr	-192(ra) # 80001c4c <_ZN9BufferCPP6getCntEv>
    80001d14:	02050c63          	beqz	a0,80001d4c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80001d18:	0084b783          	ld	a5,8(s1)
    80001d1c:	0104a703          	lw	a4,16(s1)
    80001d20:	00271713          	slli	a4,a4,0x2
    80001d24:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80001d28:	0007c503          	lbu	a0,0(a5)
    80001d2c:	00001097          	auipc	ra,0x1
    80001d30:	110080e7          	jalr	272(ra) # 80002e3c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80001d34:	0104a783          	lw	a5,16(s1)
    80001d38:	0017879b          	addiw	a5,a5,1
    80001d3c:	0004a703          	lw	a4,0(s1)
    80001d40:	02e7e7bb          	remw	a5,a5,a4
    80001d44:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80001d48:	fc1ff06f          	j	80001d08 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80001d4c:	02100513          	li	a0,33
    80001d50:	00001097          	auipc	ra,0x1
    80001d54:	0ec080e7          	jalr	236(ra) # 80002e3c <_ZN7Console4putcEc>
    Console::putc('\n');
    80001d58:	00a00513          	li	a0,10
    80001d5c:	00001097          	auipc	ra,0x1
    80001d60:	0e0080e7          	jalr	224(ra) # 80002e3c <_ZN7Console4putcEc>
    mem_free(buffer);
    80001d64:	0084b503          	ld	a0,8(s1)
    80001d68:	fffff097          	auipc	ra,0xfffff
    80001d6c:	51c080e7          	jalr	1308(ra) # 80001284 <_Z8mem_freePv>
    delete itemAvailable;
    80001d70:	0204b503          	ld	a0,32(s1)
    80001d74:	00050863          	beqz	a0,80001d84 <_ZN9BufferCPPD1Ev+0xb0>
    80001d78:	00053783          	ld	a5,0(a0)
    80001d7c:	0087b783          	ld	a5,8(a5)
    80001d80:	000780e7          	jalr	a5
    delete spaceAvailable;
    80001d84:	0184b503          	ld	a0,24(s1)
    80001d88:	00050863          	beqz	a0,80001d98 <_ZN9BufferCPPD1Ev+0xc4>
    80001d8c:	00053783          	ld	a5,0(a0)
    80001d90:	0087b783          	ld	a5,8(a5)
    80001d94:	000780e7          	jalr	a5
    delete mutexTail;
    80001d98:	0304b503          	ld	a0,48(s1)
    80001d9c:	00050863          	beqz	a0,80001dac <_ZN9BufferCPPD1Ev+0xd8>
    80001da0:	00053783          	ld	a5,0(a0)
    80001da4:	0087b783          	ld	a5,8(a5)
    80001da8:	000780e7          	jalr	a5
    delete mutexHead;
    80001dac:	0284b503          	ld	a0,40(s1)
    80001db0:	00050863          	beqz	a0,80001dc0 <_ZN9BufferCPPD1Ev+0xec>
    80001db4:	00053783          	ld	a5,0(a0)
    80001db8:	0087b783          	ld	a5,8(a5)
    80001dbc:	000780e7          	jalr	a5
}
    80001dc0:	01813083          	ld	ra,24(sp)
    80001dc4:	01013403          	ld	s0,16(sp)
    80001dc8:	00813483          	ld	s1,8(sp)
    80001dcc:	02010113          	addi	sp,sp,32
    80001dd0:	00008067          	ret

0000000080001dd4 <_Z9fibonaccim>:
bool finishedA = false;
bool finishedB = false;
bool finishedC = false;
bool finishedD = false;

uint64 fibonacci(uint64 n) {
    80001dd4:	fe010113          	addi	sp,sp,-32
    80001dd8:	00113c23          	sd	ra,24(sp)
    80001ddc:	00813823          	sd	s0,16(sp)
    80001de0:	00913423          	sd	s1,8(sp)
    80001de4:	01213023          	sd	s2,0(sp)
    80001de8:	02010413          	addi	s0,sp,32
    80001dec:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80001df0:	00100793          	li	a5,1
    80001df4:	02a7f863          	bgeu	a5,a0,80001e24 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80001df8:	00a00793          	li	a5,10
    80001dfc:	02f577b3          	remu	a5,a0,a5
    80001e00:	02078e63          	beqz	a5,80001e3c <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001e04:	fff48513          	addi	a0,s1,-1
    80001e08:	00000097          	auipc	ra,0x0
    80001e0c:	fcc080e7          	jalr	-52(ra) # 80001dd4 <_Z9fibonaccim>
    80001e10:	00050913          	mv	s2,a0
    80001e14:	ffe48513          	addi	a0,s1,-2
    80001e18:	00000097          	auipc	ra,0x0
    80001e1c:	fbc080e7          	jalr	-68(ra) # 80001dd4 <_Z9fibonaccim>
    80001e20:	00a90533          	add	a0,s2,a0
}
    80001e24:	01813083          	ld	ra,24(sp)
    80001e28:	01013403          	ld	s0,16(sp)
    80001e2c:	00813483          	ld	s1,8(sp)
    80001e30:	00013903          	ld	s2,0(sp)
    80001e34:	02010113          	addi	sp,sp,32
    80001e38:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80001e3c:	fffff097          	auipc	ra,0xfffff
    80001e40:	4e0080e7          	jalr	1248(ra) # 8000131c <_Z15thread_dispatchv>
    80001e44:	fc1ff06f          	j	80001e04 <_Z9fibonaccim+0x30>

0000000080001e48 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80001e48:	fe010113          	addi	sp,sp,-32
    80001e4c:	00113c23          	sd	ra,24(sp)
    80001e50:	00813823          	sd	s0,16(sp)
    80001e54:	00913423          	sd	s1,8(sp)
    80001e58:	01213023          	sd	s2,0(sp)
    80001e5c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80001e60:	00000913          	li	s2,0
    80001e64:	0380006f          	j	80001e9c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80001e68:	fffff097          	auipc	ra,0xfffff
    80001e6c:	4b4080e7          	jalr	1204(ra) # 8000131c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001e70:	00148493          	addi	s1,s1,1
    80001e74:	000027b7          	lui	a5,0x2
    80001e78:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001e7c:	0097ee63          	bltu	a5,s1,80001e98 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001e80:	00000713          	li	a4,0
    80001e84:	000077b7          	lui	a5,0x7
    80001e88:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001e8c:	fce7eee3          	bltu	a5,a4,80001e68 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80001e90:	00170713          	addi	a4,a4,1
    80001e94:	ff1ff06f          	j	80001e84 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80001e98:	00190913          	addi	s2,s2,1
    80001e9c:	00900793          	li	a5,9
    80001ea0:	0527e063          	bltu	a5,s2,80001ee0 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80001ea4:	00004517          	auipc	a0,0x4
    80001ea8:	19450513          	addi	a0,a0,404 # 80006038 <CONSOLE_STATUS+0x28>
    80001eac:	00000097          	auipc	ra,0x0
    80001eb0:	884080e7          	jalr	-1916(ra) # 80001730 <_Z11printStringPKc>
    80001eb4:	00000613          	li	a2,0
    80001eb8:	00a00593          	li	a1,10
    80001ebc:	0009051b          	sext.w	a0,s2
    80001ec0:	00000097          	auipc	ra,0x0
    80001ec4:	a08080e7          	jalr	-1528(ra) # 800018c8 <_Z8printIntiii>
    80001ec8:	00004517          	auipc	a0,0x4
    80001ecc:	27050513          	addi	a0,a0,624 # 80006138 <CONSOLE_STATUS+0x128>
    80001ed0:	00000097          	auipc	ra,0x0
    80001ed4:	860080e7          	jalr	-1952(ra) # 80001730 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001ed8:	00000493          	li	s1,0
    80001edc:	f99ff06f          	j	80001e74 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80001ee0:	00004517          	auipc	a0,0x4
    80001ee4:	16050513          	addi	a0,a0,352 # 80006040 <CONSOLE_STATUS+0x30>
    80001ee8:	00000097          	auipc	ra,0x0
    80001eec:	848080e7          	jalr	-1976(ra) # 80001730 <_Z11printStringPKc>
    finishedA = true;
    80001ef0:	00100793          	li	a5,1
    80001ef4:	00005717          	auipc	a4,0x5
    80001ef8:	6cf70223          	sb	a5,1732(a4) # 800075b8 <finishedA>
}
    80001efc:	01813083          	ld	ra,24(sp)
    80001f00:	01013403          	ld	s0,16(sp)
    80001f04:	00813483          	ld	s1,8(sp)
    80001f08:	00013903          	ld	s2,0(sp)
    80001f0c:	02010113          	addi	sp,sp,32
    80001f10:	00008067          	ret

0000000080001f14 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80001f14:	fe010113          	addi	sp,sp,-32
    80001f18:	00113c23          	sd	ra,24(sp)
    80001f1c:	00813823          	sd	s0,16(sp)
    80001f20:	00913423          	sd	s1,8(sp)
    80001f24:	01213023          	sd	s2,0(sp)
    80001f28:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001f2c:	00000913          	li	s2,0
    80001f30:	0380006f          	j	80001f68 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80001f34:	fffff097          	auipc	ra,0xfffff
    80001f38:	3e8080e7          	jalr	1000(ra) # 8000131c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001f3c:	00148493          	addi	s1,s1,1
    80001f40:	000027b7          	lui	a5,0x2
    80001f44:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001f48:	0097ee63          	bltu	a5,s1,80001f64 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001f4c:	00000713          	li	a4,0
    80001f50:	000077b7          	lui	a5,0x7
    80001f54:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001f58:	fce7eee3          	bltu	a5,a4,80001f34 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80001f5c:	00170713          	addi	a4,a4,1
    80001f60:	ff1ff06f          	j	80001f50 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80001f64:	00190913          	addi	s2,s2,1
    80001f68:	00f00793          	li	a5,15
    80001f6c:	0527e063          	bltu	a5,s2,80001fac <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80001f70:	00004517          	auipc	a0,0x4
    80001f74:	0e050513          	addi	a0,a0,224 # 80006050 <CONSOLE_STATUS+0x40>
    80001f78:	fffff097          	auipc	ra,0xfffff
    80001f7c:	7b8080e7          	jalr	1976(ra) # 80001730 <_Z11printStringPKc>
    80001f80:	00000613          	li	a2,0
    80001f84:	00a00593          	li	a1,10
    80001f88:	0009051b          	sext.w	a0,s2
    80001f8c:	00000097          	auipc	ra,0x0
    80001f90:	93c080e7          	jalr	-1732(ra) # 800018c8 <_Z8printIntiii>
    80001f94:	00004517          	auipc	a0,0x4
    80001f98:	1a450513          	addi	a0,a0,420 # 80006138 <CONSOLE_STATUS+0x128>
    80001f9c:	fffff097          	auipc	ra,0xfffff
    80001fa0:	794080e7          	jalr	1940(ra) # 80001730 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001fa4:	00000493          	li	s1,0
    80001fa8:	f99ff06f          	j	80001f40 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80001fac:	00004517          	auipc	a0,0x4
    80001fb0:	0ac50513          	addi	a0,a0,172 # 80006058 <CONSOLE_STATUS+0x48>
    80001fb4:	fffff097          	auipc	ra,0xfffff
    80001fb8:	77c080e7          	jalr	1916(ra) # 80001730 <_Z11printStringPKc>
    finishedB = true;
    80001fbc:	00100793          	li	a5,1
    80001fc0:	00005717          	auipc	a4,0x5
    80001fc4:	5ef70ca3          	sb	a5,1529(a4) # 800075b9 <finishedB>
    thread_dispatch();
    80001fc8:	fffff097          	auipc	ra,0xfffff
    80001fcc:	354080e7          	jalr	852(ra) # 8000131c <_Z15thread_dispatchv>
}
    80001fd0:	01813083          	ld	ra,24(sp)
    80001fd4:	01013403          	ld	s0,16(sp)
    80001fd8:	00813483          	ld	s1,8(sp)
    80001fdc:	00013903          	ld	s2,0(sp)
    80001fe0:	02010113          	addi	sp,sp,32
    80001fe4:	00008067          	ret

0000000080001fe8 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80001fe8:	fe010113          	addi	sp,sp,-32
    80001fec:	00113c23          	sd	ra,24(sp)
    80001ff0:	00813823          	sd	s0,16(sp)
    80001ff4:	00913423          	sd	s1,8(sp)
    80001ff8:	01213023          	sd	s2,0(sp)
    80001ffc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80002000:	00000493          	li	s1,0
    80002004:	0400006f          	j	80002044 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002008:	00004517          	auipc	a0,0x4
    8000200c:	06050513          	addi	a0,a0,96 # 80006068 <CONSOLE_STATUS+0x58>
    80002010:	fffff097          	auipc	ra,0xfffff
    80002014:	720080e7          	jalr	1824(ra) # 80001730 <_Z11printStringPKc>
    80002018:	00000613          	li	a2,0
    8000201c:	00a00593          	li	a1,10
    80002020:	00048513          	mv	a0,s1
    80002024:	00000097          	auipc	ra,0x0
    80002028:	8a4080e7          	jalr	-1884(ra) # 800018c8 <_Z8printIntiii>
    8000202c:	00004517          	auipc	a0,0x4
    80002030:	10c50513          	addi	a0,a0,268 # 80006138 <CONSOLE_STATUS+0x128>
    80002034:	fffff097          	auipc	ra,0xfffff
    80002038:	6fc080e7          	jalr	1788(ra) # 80001730 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000203c:	0014849b          	addiw	s1,s1,1
    80002040:	0ff4f493          	andi	s1,s1,255
    80002044:	00200793          	li	a5,2
    80002048:	fc97f0e3          	bgeu	a5,s1,80002008 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    8000204c:	00004517          	auipc	a0,0x4
    80002050:	02450513          	addi	a0,a0,36 # 80006070 <CONSOLE_STATUS+0x60>
    80002054:	fffff097          	auipc	ra,0xfffff
    80002058:	6dc080e7          	jalr	1756(ra) # 80001730 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000205c:	00700313          	li	t1,7
    thread_dispatch();
    80002060:	fffff097          	auipc	ra,0xfffff
    80002064:	2bc080e7          	jalr	700(ra) # 8000131c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80002068:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    8000206c:	00004517          	auipc	a0,0x4
    80002070:	01450513          	addi	a0,a0,20 # 80006080 <CONSOLE_STATUS+0x70>
    80002074:	fffff097          	auipc	ra,0xfffff
    80002078:	6bc080e7          	jalr	1724(ra) # 80001730 <_Z11printStringPKc>
    8000207c:	00000613          	li	a2,0
    80002080:	00a00593          	li	a1,10
    80002084:	0009051b          	sext.w	a0,s2
    80002088:	00000097          	auipc	ra,0x0
    8000208c:	840080e7          	jalr	-1984(ra) # 800018c8 <_Z8printIntiii>
    80002090:	00004517          	auipc	a0,0x4
    80002094:	0a850513          	addi	a0,a0,168 # 80006138 <CONSOLE_STATUS+0x128>
    80002098:	fffff097          	auipc	ra,0xfffff
    8000209c:	698080e7          	jalr	1688(ra) # 80001730 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800020a0:	00c00513          	li	a0,12
    800020a4:	00000097          	auipc	ra,0x0
    800020a8:	d30080e7          	jalr	-720(ra) # 80001dd4 <_Z9fibonaccim>
    800020ac:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800020b0:	00004517          	auipc	a0,0x4
    800020b4:	fd850513          	addi	a0,a0,-40 # 80006088 <CONSOLE_STATUS+0x78>
    800020b8:	fffff097          	auipc	ra,0xfffff
    800020bc:	678080e7          	jalr	1656(ra) # 80001730 <_Z11printStringPKc>
    800020c0:	00000613          	li	a2,0
    800020c4:	00a00593          	li	a1,10
    800020c8:	0009051b          	sext.w	a0,s2
    800020cc:	fffff097          	auipc	ra,0xfffff
    800020d0:	7fc080e7          	jalr	2044(ra) # 800018c8 <_Z8printIntiii>
    800020d4:	00004517          	auipc	a0,0x4
    800020d8:	06450513          	addi	a0,a0,100 # 80006138 <CONSOLE_STATUS+0x128>
    800020dc:	fffff097          	auipc	ra,0xfffff
    800020e0:	654080e7          	jalr	1620(ra) # 80001730 <_Z11printStringPKc>
    800020e4:	0400006f          	j	80002124 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800020e8:	00004517          	auipc	a0,0x4
    800020ec:	f8050513          	addi	a0,a0,-128 # 80006068 <CONSOLE_STATUS+0x58>
    800020f0:	fffff097          	auipc	ra,0xfffff
    800020f4:	640080e7          	jalr	1600(ra) # 80001730 <_Z11printStringPKc>
    800020f8:	00000613          	li	a2,0
    800020fc:	00a00593          	li	a1,10
    80002100:	00048513          	mv	a0,s1
    80002104:	fffff097          	auipc	ra,0xfffff
    80002108:	7c4080e7          	jalr	1988(ra) # 800018c8 <_Z8printIntiii>
    8000210c:	00004517          	auipc	a0,0x4
    80002110:	02c50513          	addi	a0,a0,44 # 80006138 <CONSOLE_STATUS+0x128>
    80002114:	fffff097          	auipc	ra,0xfffff
    80002118:	61c080e7          	jalr	1564(ra) # 80001730 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000211c:	0014849b          	addiw	s1,s1,1
    80002120:	0ff4f493          	andi	s1,s1,255
    80002124:	00500793          	li	a5,5
    80002128:	fc97f0e3          	bgeu	a5,s1,800020e8 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    8000212c:	00004517          	auipc	a0,0x4
    80002130:	f1450513          	addi	a0,a0,-236 # 80006040 <CONSOLE_STATUS+0x30>
    80002134:	fffff097          	auipc	ra,0xfffff
    80002138:	5fc080e7          	jalr	1532(ra) # 80001730 <_Z11printStringPKc>
    finishedC = true;
    8000213c:	00100793          	li	a5,1
    80002140:	00005717          	auipc	a4,0x5
    80002144:	46f70d23          	sb	a5,1146(a4) # 800075ba <finishedC>
    thread_dispatch();
    80002148:	fffff097          	auipc	ra,0xfffff
    8000214c:	1d4080e7          	jalr	468(ra) # 8000131c <_Z15thread_dispatchv>
}
    80002150:	01813083          	ld	ra,24(sp)
    80002154:	01013403          	ld	s0,16(sp)
    80002158:	00813483          	ld	s1,8(sp)
    8000215c:	00013903          	ld	s2,0(sp)
    80002160:	02010113          	addi	sp,sp,32
    80002164:	00008067          	ret

0000000080002168 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80002168:	fe010113          	addi	sp,sp,-32
    8000216c:	00113c23          	sd	ra,24(sp)
    80002170:	00813823          	sd	s0,16(sp)
    80002174:	00913423          	sd	s1,8(sp)
    80002178:	01213023          	sd	s2,0(sp)
    8000217c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80002180:	00a00493          	li	s1,10
    80002184:	0400006f          	j	800021c4 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002188:	00004517          	auipc	a0,0x4
    8000218c:	f1050513          	addi	a0,a0,-240 # 80006098 <CONSOLE_STATUS+0x88>
    80002190:	fffff097          	auipc	ra,0xfffff
    80002194:	5a0080e7          	jalr	1440(ra) # 80001730 <_Z11printStringPKc>
    80002198:	00000613          	li	a2,0
    8000219c:	00a00593          	li	a1,10
    800021a0:	00048513          	mv	a0,s1
    800021a4:	fffff097          	auipc	ra,0xfffff
    800021a8:	724080e7          	jalr	1828(ra) # 800018c8 <_Z8printIntiii>
    800021ac:	00004517          	auipc	a0,0x4
    800021b0:	f8c50513          	addi	a0,a0,-116 # 80006138 <CONSOLE_STATUS+0x128>
    800021b4:	fffff097          	auipc	ra,0xfffff
    800021b8:	57c080e7          	jalr	1404(ra) # 80001730 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800021bc:	0014849b          	addiw	s1,s1,1
    800021c0:	0ff4f493          	andi	s1,s1,255
    800021c4:	00c00793          	li	a5,12
    800021c8:	fc97f0e3          	bgeu	a5,s1,80002188 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800021cc:	00004517          	auipc	a0,0x4
    800021d0:	ed450513          	addi	a0,a0,-300 # 800060a0 <CONSOLE_STATUS+0x90>
    800021d4:	fffff097          	auipc	ra,0xfffff
    800021d8:	55c080e7          	jalr	1372(ra) # 80001730 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800021dc:	00500313          	li	t1,5
    thread_dispatch();
    800021e0:	fffff097          	auipc	ra,0xfffff
    800021e4:	13c080e7          	jalr	316(ra) # 8000131c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800021e8:	01000513          	li	a0,16
    800021ec:	00000097          	auipc	ra,0x0
    800021f0:	be8080e7          	jalr	-1048(ra) # 80001dd4 <_Z9fibonaccim>
    800021f4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800021f8:	00004517          	auipc	a0,0x4
    800021fc:	eb850513          	addi	a0,a0,-328 # 800060b0 <CONSOLE_STATUS+0xa0>
    80002200:	fffff097          	auipc	ra,0xfffff
    80002204:	530080e7          	jalr	1328(ra) # 80001730 <_Z11printStringPKc>
    80002208:	00000613          	li	a2,0
    8000220c:	00a00593          	li	a1,10
    80002210:	0009051b          	sext.w	a0,s2
    80002214:	fffff097          	auipc	ra,0xfffff
    80002218:	6b4080e7          	jalr	1716(ra) # 800018c8 <_Z8printIntiii>
    8000221c:	00004517          	auipc	a0,0x4
    80002220:	f1c50513          	addi	a0,a0,-228 # 80006138 <CONSOLE_STATUS+0x128>
    80002224:	fffff097          	auipc	ra,0xfffff
    80002228:	50c080e7          	jalr	1292(ra) # 80001730 <_Z11printStringPKc>
    8000222c:	0400006f          	j	8000226c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002230:	00004517          	auipc	a0,0x4
    80002234:	e6850513          	addi	a0,a0,-408 # 80006098 <CONSOLE_STATUS+0x88>
    80002238:	fffff097          	auipc	ra,0xfffff
    8000223c:	4f8080e7          	jalr	1272(ra) # 80001730 <_Z11printStringPKc>
    80002240:	00000613          	li	a2,0
    80002244:	00a00593          	li	a1,10
    80002248:	00048513          	mv	a0,s1
    8000224c:	fffff097          	auipc	ra,0xfffff
    80002250:	67c080e7          	jalr	1660(ra) # 800018c8 <_Z8printIntiii>
    80002254:	00004517          	auipc	a0,0x4
    80002258:	ee450513          	addi	a0,a0,-284 # 80006138 <CONSOLE_STATUS+0x128>
    8000225c:	fffff097          	auipc	ra,0xfffff
    80002260:	4d4080e7          	jalr	1236(ra) # 80001730 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80002264:	0014849b          	addiw	s1,s1,1
    80002268:	0ff4f493          	andi	s1,s1,255
    8000226c:	00f00793          	li	a5,15
    80002270:	fc97f0e3          	bgeu	a5,s1,80002230 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80002274:	00004517          	auipc	a0,0x4
    80002278:	e4c50513          	addi	a0,a0,-436 # 800060c0 <CONSOLE_STATUS+0xb0>
    8000227c:	fffff097          	auipc	ra,0xfffff
    80002280:	4b4080e7          	jalr	1204(ra) # 80001730 <_Z11printStringPKc>
    finishedD = true;
    80002284:	00100793          	li	a5,1
    80002288:	00005717          	auipc	a4,0x5
    8000228c:	32f709a3          	sb	a5,819(a4) # 800075bb <finishedD>
    thread_dispatch();
    80002290:	fffff097          	auipc	ra,0xfffff
    80002294:	08c080e7          	jalr	140(ra) # 8000131c <_Z15thread_dispatchv>
}
    80002298:	01813083          	ld	ra,24(sp)
    8000229c:	01013403          	ld	s0,16(sp)
    800022a0:	00813483          	ld	s1,8(sp)
    800022a4:	00013903          	ld	s2,0(sp)
    800022a8:	02010113          	addi	sp,sp,32
    800022ac:	00008067          	ret

00000000800022b0 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800022b0:	fc010113          	addi	sp,sp,-64
    800022b4:	02113c23          	sd	ra,56(sp)
    800022b8:	02813823          	sd	s0,48(sp)
    800022bc:	02913423          	sd	s1,40(sp)
    800022c0:	03213023          	sd	s2,32(sp)
    800022c4:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800022c8:	01000513          	li	a0,16
    800022cc:	00000097          	auipc	ra,0x0
    800022d0:	7e8080e7          	jalr	2024(ra) # 80002ab4 <_Znwm>
    800022d4:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800022d8:	00001097          	auipc	ra,0x1
    800022dc:	a3c080e7          	jalr	-1476(ra) # 80002d14 <_ZN6ThreadC1Ev>
    800022e0:	00005797          	auipc	a5,0x5
    800022e4:	17078793          	addi	a5,a5,368 # 80007450 <_ZTV7WorkerA+0x10>
    800022e8:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    800022ec:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    800022f0:	00004517          	auipc	a0,0x4
    800022f4:	de050513          	addi	a0,a0,-544 # 800060d0 <CONSOLE_STATUS+0xc0>
    800022f8:	fffff097          	auipc	ra,0xfffff
    800022fc:	438080e7          	jalr	1080(ra) # 80001730 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80002300:	01000513          	li	a0,16
    80002304:	00000097          	auipc	ra,0x0
    80002308:	7b0080e7          	jalr	1968(ra) # 80002ab4 <_Znwm>
    8000230c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80002310:	00001097          	auipc	ra,0x1
    80002314:	a04080e7          	jalr	-1532(ra) # 80002d14 <_ZN6ThreadC1Ev>
    80002318:	00005797          	auipc	a5,0x5
    8000231c:	16078793          	addi	a5,a5,352 # 80007478 <_ZTV7WorkerB+0x10>
    80002320:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80002324:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80002328:	00004517          	auipc	a0,0x4
    8000232c:	dc050513          	addi	a0,a0,-576 # 800060e8 <CONSOLE_STATUS+0xd8>
    80002330:	fffff097          	auipc	ra,0xfffff
    80002334:	400080e7          	jalr	1024(ra) # 80001730 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80002338:	01000513          	li	a0,16
    8000233c:	00000097          	auipc	ra,0x0
    80002340:	778080e7          	jalr	1912(ra) # 80002ab4 <_Znwm>
    80002344:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80002348:	00001097          	auipc	ra,0x1
    8000234c:	9cc080e7          	jalr	-1588(ra) # 80002d14 <_ZN6ThreadC1Ev>
    80002350:	00005797          	auipc	a5,0x5
    80002354:	15078793          	addi	a5,a5,336 # 800074a0 <_ZTV7WorkerC+0x10>
    80002358:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    8000235c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80002360:	00004517          	auipc	a0,0x4
    80002364:	da050513          	addi	a0,a0,-608 # 80006100 <CONSOLE_STATUS+0xf0>
    80002368:	fffff097          	auipc	ra,0xfffff
    8000236c:	3c8080e7          	jalr	968(ra) # 80001730 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80002370:	01000513          	li	a0,16
    80002374:	00000097          	auipc	ra,0x0
    80002378:	740080e7          	jalr	1856(ra) # 80002ab4 <_Znwm>
    8000237c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80002380:	00001097          	auipc	ra,0x1
    80002384:	994080e7          	jalr	-1644(ra) # 80002d14 <_ZN6ThreadC1Ev>
    80002388:	00005797          	auipc	a5,0x5
    8000238c:	14078793          	addi	a5,a5,320 # 800074c8 <_ZTV7WorkerD+0x10>
    80002390:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80002394:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80002398:	00004517          	auipc	a0,0x4
    8000239c:	d8050513          	addi	a0,a0,-640 # 80006118 <CONSOLE_STATUS+0x108>
    800023a0:	fffff097          	auipc	ra,0xfffff
    800023a4:	390080e7          	jalr	912(ra) # 80001730 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800023a8:	00000493          	li	s1,0
    800023ac:	00300793          	li	a5,3
    800023b0:	0297c663          	blt	a5,s1,800023dc <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800023b4:	00349793          	slli	a5,s1,0x3
    800023b8:	fe040713          	addi	a4,s0,-32
    800023bc:	00f707b3          	add	a5,a4,a5
    800023c0:	fe07b503          	ld	a0,-32(a5)
    800023c4:	00001097          	auipc	ra,0x1
    800023c8:	8d4080e7          	jalr	-1836(ra) # 80002c98 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800023cc:	0014849b          	addiw	s1,s1,1
    800023d0:	fddff06f          	j	800023ac <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800023d4:	00001097          	auipc	ra,0x1
    800023d8:	89c080e7          	jalr	-1892(ra) # 80002c70 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800023dc:	00005797          	auipc	a5,0x5
    800023e0:	1dc7c783          	lbu	a5,476(a5) # 800075b8 <finishedA>
    800023e4:	fe0788e3          	beqz	a5,800023d4 <_Z20Threads_CPP_API_testv+0x124>
    800023e8:	00005797          	auipc	a5,0x5
    800023ec:	1d17c783          	lbu	a5,465(a5) # 800075b9 <finishedB>
    800023f0:	fe0782e3          	beqz	a5,800023d4 <_Z20Threads_CPP_API_testv+0x124>
    800023f4:	00005797          	auipc	a5,0x5
    800023f8:	1c67c783          	lbu	a5,454(a5) # 800075ba <finishedC>
    800023fc:	fc078ce3          	beqz	a5,800023d4 <_Z20Threads_CPP_API_testv+0x124>
    80002400:	00005797          	auipc	a5,0x5
    80002404:	1bb7c783          	lbu	a5,443(a5) # 800075bb <finishedD>
    80002408:	fc0786e3          	beqz	a5,800023d4 <_Z20Threads_CPP_API_testv+0x124>
    }

    for (auto thread: threads) { delete thread; }
    8000240c:	fc040493          	addi	s1,s0,-64
    80002410:	0080006f          	j	80002418 <_Z20Threads_CPP_API_testv+0x168>
    80002414:	00848493          	addi	s1,s1,8
    80002418:	fe040793          	addi	a5,s0,-32
    8000241c:	08f48663          	beq	s1,a5,800024a8 <_Z20Threads_CPP_API_testv+0x1f8>
    80002420:	0004b503          	ld	a0,0(s1)
    80002424:	fe0508e3          	beqz	a0,80002414 <_Z20Threads_CPP_API_testv+0x164>
    80002428:	00053783          	ld	a5,0(a0)
    8000242c:	0087b783          	ld	a5,8(a5)
    80002430:	000780e7          	jalr	a5
    80002434:	fe1ff06f          	j	80002414 <_Z20Threads_CPP_API_testv+0x164>
    80002438:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    8000243c:	00048513          	mv	a0,s1
    80002440:	00000097          	auipc	ra,0x0
    80002444:	6c4080e7          	jalr	1732(ra) # 80002b04 <_ZdlPv>
    80002448:	00090513          	mv	a0,s2
    8000244c:	00006097          	auipc	ra,0x6
    80002450:	26c080e7          	jalr	620(ra) # 800086b8 <_Unwind_Resume>
    80002454:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80002458:	00048513          	mv	a0,s1
    8000245c:	00000097          	auipc	ra,0x0
    80002460:	6a8080e7          	jalr	1704(ra) # 80002b04 <_ZdlPv>
    80002464:	00090513          	mv	a0,s2
    80002468:	00006097          	auipc	ra,0x6
    8000246c:	250080e7          	jalr	592(ra) # 800086b8 <_Unwind_Resume>
    80002470:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80002474:	00048513          	mv	a0,s1
    80002478:	00000097          	auipc	ra,0x0
    8000247c:	68c080e7          	jalr	1676(ra) # 80002b04 <_ZdlPv>
    80002480:	00090513          	mv	a0,s2
    80002484:	00006097          	auipc	ra,0x6
    80002488:	234080e7          	jalr	564(ra) # 800086b8 <_Unwind_Resume>
    8000248c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80002490:	00048513          	mv	a0,s1
    80002494:	00000097          	auipc	ra,0x0
    80002498:	670080e7          	jalr	1648(ra) # 80002b04 <_ZdlPv>
    8000249c:	00090513          	mv	a0,s2
    800024a0:	00006097          	auipc	ra,0x6
    800024a4:	218080e7          	jalr	536(ra) # 800086b8 <_Unwind_Resume>
}
    800024a8:	03813083          	ld	ra,56(sp)
    800024ac:	03013403          	ld	s0,48(sp)
    800024b0:	02813483          	ld	s1,40(sp)
    800024b4:	02013903          	ld	s2,32(sp)
    800024b8:	04010113          	addi	sp,sp,64
    800024bc:	00008067          	ret

00000000800024c0 <_Z8userMainv>:
//#include "../h/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../h/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../h/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    800024c0:	ff010113          	addi	sp,sp,-16
    800024c4:	00113423          	sd	ra,8(sp)
    800024c8:	00813023          	sd	s0,0(sp)
    800024cc:	01010413          	addi	s0,sp,16
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta
    800024d0:	00000097          	auipc	ra,0x0
    800024d4:	de0080e7          	jalr	-544(ra) # 800022b0 <_Z20Threads_CPP_API_testv>
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    800024d8:	00813083          	ld	ra,8(sp)
    800024dc:	00013403          	ld	s0,0(sp)
    800024e0:	01010113          	addi	sp,sp,16
    800024e4:	00008067          	ret

00000000800024e8 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800024e8:	ff010113          	addi	sp,sp,-16
    800024ec:	00113423          	sd	ra,8(sp)
    800024f0:	00813023          	sd	s0,0(sp)
    800024f4:	01010413          	addi	s0,sp,16
    800024f8:	00005797          	auipc	a5,0x5
    800024fc:	f5878793          	addi	a5,a5,-168 # 80007450 <_ZTV7WorkerA+0x10>
    80002500:	00f53023          	sd	a5,0(a0)
    80002504:	00000097          	auipc	ra,0x0
    80002508:	6d4080e7          	jalr	1748(ra) # 80002bd8 <_ZN6ThreadD1Ev>
    8000250c:	00813083          	ld	ra,8(sp)
    80002510:	00013403          	ld	s0,0(sp)
    80002514:	01010113          	addi	sp,sp,16
    80002518:	00008067          	ret

000000008000251c <_ZN7WorkerAD0Ev>:
    8000251c:	fe010113          	addi	sp,sp,-32
    80002520:	00113c23          	sd	ra,24(sp)
    80002524:	00813823          	sd	s0,16(sp)
    80002528:	00913423          	sd	s1,8(sp)
    8000252c:	02010413          	addi	s0,sp,32
    80002530:	00050493          	mv	s1,a0
    80002534:	00005797          	auipc	a5,0x5
    80002538:	f1c78793          	addi	a5,a5,-228 # 80007450 <_ZTV7WorkerA+0x10>
    8000253c:	00f53023          	sd	a5,0(a0)
    80002540:	00000097          	auipc	ra,0x0
    80002544:	698080e7          	jalr	1688(ra) # 80002bd8 <_ZN6ThreadD1Ev>
    80002548:	00048513          	mv	a0,s1
    8000254c:	00000097          	auipc	ra,0x0
    80002550:	5b8080e7          	jalr	1464(ra) # 80002b04 <_ZdlPv>
    80002554:	01813083          	ld	ra,24(sp)
    80002558:	01013403          	ld	s0,16(sp)
    8000255c:	00813483          	ld	s1,8(sp)
    80002560:	02010113          	addi	sp,sp,32
    80002564:	00008067          	ret

0000000080002568 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80002568:	ff010113          	addi	sp,sp,-16
    8000256c:	00113423          	sd	ra,8(sp)
    80002570:	00813023          	sd	s0,0(sp)
    80002574:	01010413          	addi	s0,sp,16
    80002578:	00005797          	auipc	a5,0x5
    8000257c:	f0078793          	addi	a5,a5,-256 # 80007478 <_ZTV7WorkerB+0x10>
    80002580:	00f53023          	sd	a5,0(a0)
    80002584:	00000097          	auipc	ra,0x0
    80002588:	654080e7          	jalr	1620(ra) # 80002bd8 <_ZN6ThreadD1Ev>
    8000258c:	00813083          	ld	ra,8(sp)
    80002590:	00013403          	ld	s0,0(sp)
    80002594:	01010113          	addi	sp,sp,16
    80002598:	00008067          	ret

000000008000259c <_ZN7WorkerBD0Ev>:
    8000259c:	fe010113          	addi	sp,sp,-32
    800025a0:	00113c23          	sd	ra,24(sp)
    800025a4:	00813823          	sd	s0,16(sp)
    800025a8:	00913423          	sd	s1,8(sp)
    800025ac:	02010413          	addi	s0,sp,32
    800025b0:	00050493          	mv	s1,a0
    800025b4:	00005797          	auipc	a5,0x5
    800025b8:	ec478793          	addi	a5,a5,-316 # 80007478 <_ZTV7WorkerB+0x10>
    800025bc:	00f53023          	sd	a5,0(a0)
    800025c0:	00000097          	auipc	ra,0x0
    800025c4:	618080e7          	jalr	1560(ra) # 80002bd8 <_ZN6ThreadD1Ev>
    800025c8:	00048513          	mv	a0,s1
    800025cc:	00000097          	auipc	ra,0x0
    800025d0:	538080e7          	jalr	1336(ra) # 80002b04 <_ZdlPv>
    800025d4:	01813083          	ld	ra,24(sp)
    800025d8:	01013403          	ld	s0,16(sp)
    800025dc:	00813483          	ld	s1,8(sp)
    800025e0:	02010113          	addi	sp,sp,32
    800025e4:	00008067          	ret

00000000800025e8 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800025e8:	ff010113          	addi	sp,sp,-16
    800025ec:	00113423          	sd	ra,8(sp)
    800025f0:	00813023          	sd	s0,0(sp)
    800025f4:	01010413          	addi	s0,sp,16
    800025f8:	00005797          	auipc	a5,0x5
    800025fc:	ea878793          	addi	a5,a5,-344 # 800074a0 <_ZTV7WorkerC+0x10>
    80002600:	00f53023          	sd	a5,0(a0)
    80002604:	00000097          	auipc	ra,0x0
    80002608:	5d4080e7          	jalr	1492(ra) # 80002bd8 <_ZN6ThreadD1Ev>
    8000260c:	00813083          	ld	ra,8(sp)
    80002610:	00013403          	ld	s0,0(sp)
    80002614:	01010113          	addi	sp,sp,16
    80002618:	00008067          	ret

000000008000261c <_ZN7WorkerCD0Ev>:
    8000261c:	fe010113          	addi	sp,sp,-32
    80002620:	00113c23          	sd	ra,24(sp)
    80002624:	00813823          	sd	s0,16(sp)
    80002628:	00913423          	sd	s1,8(sp)
    8000262c:	02010413          	addi	s0,sp,32
    80002630:	00050493          	mv	s1,a0
    80002634:	00005797          	auipc	a5,0x5
    80002638:	e6c78793          	addi	a5,a5,-404 # 800074a0 <_ZTV7WorkerC+0x10>
    8000263c:	00f53023          	sd	a5,0(a0)
    80002640:	00000097          	auipc	ra,0x0
    80002644:	598080e7          	jalr	1432(ra) # 80002bd8 <_ZN6ThreadD1Ev>
    80002648:	00048513          	mv	a0,s1
    8000264c:	00000097          	auipc	ra,0x0
    80002650:	4b8080e7          	jalr	1208(ra) # 80002b04 <_ZdlPv>
    80002654:	01813083          	ld	ra,24(sp)
    80002658:	01013403          	ld	s0,16(sp)
    8000265c:	00813483          	ld	s1,8(sp)
    80002660:	02010113          	addi	sp,sp,32
    80002664:	00008067          	ret

0000000080002668 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80002668:	ff010113          	addi	sp,sp,-16
    8000266c:	00113423          	sd	ra,8(sp)
    80002670:	00813023          	sd	s0,0(sp)
    80002674:	01010413          	addi	s0,sp,16
    80002678:	00005797          	auipc	a5,0x5
    8000267c:	e5078793          	addi	a5,a5,-432 # 800074c8 <_ZTV7WorkerD+0x10>
    80002680:	00f53023          	sd	a5,0(a0)
    80002684:	00000097          	auipc	ra,0x0
    80002688:	554080e7          	jalr	1364(ra) # 80002bd8 <_ZN6ThreadD1Ev>
    8000268c:	00813083          	ld	ra,8(sp)
    80002690:	00013403          	ld	s0,0(sp)
    80002694:	01010113          	addi	sp,sp,16
    80002698:	00008067          	ret

000000008000269c <_ZN7WorkerDD0Ev>:
    8000269c:	fe010113          	addi	sp,sp,-32
    800026a0:	00113c23          	sd	ra,24(sp)
    800026a4:	00813823          	sd	s0,16(sp)
    800026a8:	00913423          	sd	s1,8(sp)
    800026ac:	02010413          	addi	s0,sp,32
    800026b0:	00050493          	mv	s1,a0
    800026b4:	00005797          	auipc	a5,0x5
    800026b8:	e1478793          	addi	a5,a5,-492 # 800074c8 <_ZTV7WorkerD+0x10>
    800026bc:	00f53023          	sd	a5,0(a0)
    800026c0:	00000097          	auipc	ra,0x0
    800026c4:	518080e7          	jalr	1304(ra) # 80002bd8 <_ZN6ThreadD1Ev>
    800026c8:	00048513          	mv	a0,s1
    800026cc:	00000097          	auipc	ra,0x0
    800026d0:	438080e7          	jalr	1080(ra) # 80002b04 <_ZdlPv>
    800026d4:	01813083          	ld	ra,24(sp)
    800026d8:	01013403          	ld	s0,16(sp)
    800026dc:	00813483          	ld	s1,8(sp)
    800026e0:	02010113          	addi	sp,sp,32
    800026e4:	00008067          	ret

00000000800026e8 <_ZN7WorkerA3runEv>:
    void run() override {
    800026e8:	ff010113          	addi	sp,sp,-16
    800026ec:	00113423          	sd	ra,8(sp)
    800026f0:	00813023          	sd	s0,0(sp)
    800026f4:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800026f8:	00000593          	li	a1,0
    800026fc:	fffff097          	auipc	ra,0xfffff
    80002700:	74c080e7          	jalr	1868(ra) # 80001e48 <_ZN7WorkerA11workerBodyAEPv>
    }
    80002704:	00813083          	ld	ra,8(sp)
    80002708:	00013403          	ld	s0,0(sp)
    8000270c:	01010113          	addi	sp,sp,16
    80002710:	00008067          	ret

0000000080002714 <_ZN7WorkerB3runEv>:
    void run() override {
    80002714:	ff010113          	addi	sp,sp,-16
    80002718:	00113423          	sd	ra,8(sp)
    8000271c:	00813023          	sd	s0,0(sp)
    80002720:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80002724:	00000593          	li	a1,0
    80002728:	fffff097          	auipc	ra,0xfffff
    8000272c:	7ec080e7          	jalr	2028(ra) # 80001f14 <_ZN7WorkerB11workerBodyBEPv>
    }
    80002730:	00813083          	ld	ra,8(sp)
    80002734:	00013403          	ld	s0,0(sp)
    80002738:	01010113          	addi	sp,sp,16
    8000273c:	00008067          	ret

0000000080002740 <_ZN7WorkerC3runEv>:
    void run() override {
    80002740:	ff010113          	addi	sp,sp,-16
    80002744:	00113423          	sd	ra,8(sp)
    80002748:	00813023          	sd	s0,0(sp)
    8000274c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80002750:	00000593          	li	a1,0
    80002754:	00000097          	auipc	ra,0x0
    80002758:	894080e7          	jalr	-1900(ra) # 80001fe8 <_ZN7WorkerC11workerBodyCEPv>
    }
    8000275c:	00813083          	ld	ra,8(sp)
    80002760:	00013403          	ld	s0,0(sp)
    80002764:	01010113          	addi	sp,sp,16
    80002768:	00008067          	ret

000000008000276c <_ZN7WorkerD3runEv>:
    void run() override {
    8000276c:	ff010113          	addi	sp,sp,-16
    80002770:	00113423          	sd	ra,8(sp)
    80002774:	00813023          	sd	s0,0(sp)
    80002778:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    8000277c:	00000593          	li	a1,0
    80002780:	00000097          	auipc	ra,0x0
    80002784:	9e8080e7          	jalr	-1560(ra) # 80002168 <_ZN7WorkerD11workerBodyDEPv>
    }
    80002788:	00813083          	ld	ra,8(sp)
    8000278c:	00013403          	ld	s0,0(sp)
    80002790:	01010113          	addi	sp,sp,16
    80002794:	00008067          	ret

0000000080002798 <main>:
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/UserMain.hpp"


int main() {
    80002798:	fe010113          	addi	sp,sp,-32
    8000279c:	00113c23          	sd	ra,24(sp)
    800027a0:	00813823          	sd	s0,16(sp)
    800027a4:	02010413          	addi	s0,sp,32
    MemoryAllocator::memAlloc();
    800027a8:	00001097          	auipc	ra,0x1
    800027ac:	b20080e7          	jalr	-1248(ra) # 800032c8 <_ZN15MemoryAllocator8memAllocEv>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    800027b0:	00005797          	auipc	a5,0x5
    800027b4:	d887b783          	ld	a5,-632(a5) # 80007538 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    800027b8:	10579073          	csrw	stvec,a5

    // ovo mi treba jer ako ovo ne uradim imam gresku kad se desi prvi dispatch i onda
    // ne zna sta on da radi zato guram praznu nit da radi u pocetku
    TCB* run;
    thread_create(&run, nullptr, nullptr);
    800027bc:	00000613          	li	a2,0
    800027c0:	00000593          	li	a1,0
    800027c4:	fe840513          	addi	a0,s0,-24
    800027c8:	fffff097          	auipc	ra,0xfffff
    800027cc:	aec080e7          	jalr	-1300(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = run;
    800027d0:	00005797          	auipc	a5,0x5
    800027d4:	d807b783          	ld	a5,-640(a5) # 80007550 <_GLOBAL_OFFSET_TABLE_+0x28>
    800027d8:	fe843703          	ld	a4,-24(s0)
    800027dc:	00e7b023          	sd	a4,0(a5)

    // maskiranje timeslice-a - 15ta strana u projektu
    //__asm__ volatile ("csrc sie, %[mask]" : : [mask] "r"(2));
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    userMain();
    800027e0:	00000097          	auipc	ra,0x0
    800027e4:	ce0080e7          	jalr	-800(ra) # 800024c0 <_Z8userMainv>
inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800027e8:	00200793          	li	a5,2
    800027ec:	1007a073          	csrs	sstatus,a5

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    printString("Finished\n");
    800027f0:	00004517          	auipc	a0,0x4
    800027f4:	94050513          	addi	a0,a0,-1728 # 80006130 <CONSOLE_STATUS+0x120>
    800027f8:	fffff097          	auipc	ra,0xfffff
    800027fc:	f38080e7          	jalr	-200(ra) # 80001730 <_Z11printStringPKc>
    return 0;
    80002800:	00000513          	li	a0,0
    80002804:	01813083          	ld	ra,24(sp)
    80002808:	01013403          	ld	s0,16(sp)
    8000280c:	02010113          	addi	sp,sp,32
    80002810:	00008067          	ret

0000000080002814 <_ZN3TCB13threadWrapperEv>:
    running = Scheduler::get();
    Riscv::w_sstatus(sstatus);
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper() {
    80002814:	ff010113          	addi	sp,sp,-16
    80002818:	00113423          	sd	ra,8(sp)
    8000281c:	00813023          	sd	s0,0(sp)
    80002820:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie();
    80002824:	00000097          	auipc	ra,0x0
    80002828:	658080e7          	jalr	1624(ra) # 80002e7c <_ZN5Riscv10popSppSpieEv>
    if(running->myThread != nullptr){
    8000282c:	00005797          	auipc	a5,0x5
    80002830:	d947b783          	ld	a5,-620(a5) # 800075c0 <_ZN3TCB7runningE>
    80002834:	0307b503          	ld	a0,48(a5)
    80002838:	00050863          	beqz	a0,80002848 <_ZN3TCB13threadWrapperEv+0x34>
        running->myThread->run();
    8000283c:	00053783          	ld	a5,0(a0)
    80002840:	0107b783          	ld	a5,16(a5)
    80002844:	000780e7          	jalr	a5
    }
    thread_exit();
    80002848:	fffff097          	auipc	ra,0xfffff
    8000284c:	aac080e7          	jalr	-1364(ra) # 800012f4 <_Z11thread_exitv>
    /*running->body();
    running->setFinished(true);
    TCB::yield();*/

}
    80002850:	00813083          	ld	ra,8(sp)
    80002854:	00013403          	ld	s0,0(sp)
    80002858:	01010113          	addi	sp,sp,16
    8000285c:	00008067          	ret

0000000080002860 <_ZN3TCBC1EPFvvEm>:
TCB::TCB(Body body, uint64 timeSlice) : body(body),
    80002860:	fd010113          	addi	sp,sp,-48
    80002864:	02113423          	sd	ra,40(sp)
    80002868:	02813023          	sd	s0,32(sp)
    8000286c:	00913c23          	sd	s1,24(sp)
    80002870:	01213823          	sd	s2,16(sp)
    80002874:	01313423          	sd	s3,8(sp)
    80002878:	03010413          	addi	s0,sp,48
    8000287c:	00050493          	mv	s1,a0
    80002880:	00058913          	mv	s2,a1
    80002884:	00060993          	mv	s3,a2
finished(false), blocked(false) {
    80002888:	00b53023          	sd	a1,0(a0)
stack(new uint64[STACK_SIZE]),
    8000288c:	00002537          	lui	a0,0x2
    80002890:	00000097          	auipc	ra,0x0
    80002894:	24c080e7          	jalr	588(ra) # 80002adc <_Znam>
finished(false), blocked(false) {
    80002898:	00a4b423          	sd	a0,8(s1)
    8000289c:	00000797          	auipc	a5,0x0
    800028a0:	f7878793          	addi	a5,a5,-136 # 80002814 <_ZN3TCB13threadWrapperEv>
    800028a4:	00f4b823          	sd	a5,16(s1)
         (uint64) &stack[STACK_SIZE]}),
    800028a8:	000027b7          	lui	a5,0x2
    800028ac:	00f50533          	add	a0,a0,a5
finished(false), blocked(false) {
    800028b0:	00a4bc23          	sd	a0,24(s1)
    800028b4:	0334b023          	sd	s3,32(s1)
    800028b8:	02048423          	sb	zero,40(s1)
    800028bc:	020484a3          	sb	zero,41(s1)
    if (body != nullptr) { Scheduler::put(this); }
    800028c0:	00090863          	beqz	s2,800028d0 <_ZN3TCBC1EPFvvEm+0x70>
    800028c4:	00048513          	mv	a0,s1
    800028c8:	00001097          	auipc	ra,0x1
    800028cc:	960080e7          	jalr	-1696(ra) # 80003228 <_ZN9Scheduler3putEP3TCB>
    myThread = nullptr;
    800028d0:	0204b823          	sd	zero,48(s1)
}
    800028d4:	02813083          	ld	ra,40(sp)
    800028d8:	02013403          	ld	s0,32(sp)
    800028dc:	01813483          	ld	s1,24(sp)
    800028e0:	01013903          	ld	s2,16(sp)
    800028e4:	00813983          	ld	s3,8(sp)
    800028e8:	03010113          	addi	sp,sp,48
    800028ec:	00008067          	ret

00000000800028f0 <_ZN3TCB12createThreadEPFvvE>:
TCB *TCB::createThread(Body body) {
    800028f0:	fe010113          	addi	sp,sp,-32
    800028f4:	00113c23          	sd	ra,24(sp)
    800028f8:	00813823          	sd	s0,16(sp)
    800028fc:	00913423          	sd	s1,8(sp)
    80002900:	01213023          	sd	s2,0(sp)
    80002904:	02010413          	addi	s0,sp,32
    80002908:	00050913          	mv	s2,a0
    return new TCB(body, TIME_SLICE);
    8000290c:	03800513          	li	a0,56
    80002910:	00000097          	auipc	ra,0x0
    80002914:	1a4080e7          	jalr	420(ra) # 80002ab4 <_Znwm>
    80002918:	00050493          	mv	s1,a0
    8000291c:	00200613          	li	a2,2
    80002920:	00090593          	mv	a1,s2
    80002924:	00000097          	auipc	ra,0x0
    80002928:	f3c080e7          	jalr	-196(ra) # 80002860 <_ZN3TCBC1EPFvvEm>
    8000292c:	0200006f          	j	8000294c <_ZN3TCB12createThreadEPFvvE+0x5c>
    80002930:	00050913          	mv	s2,a0
    80002934:	00048513          	mv	a0,s1
    80002938:	00000097          	auipc	ra,0x0
    8000293c:	1cc080e7          	jalr	460(ra) # 80002b04 <_ZdlPv>
    80002940:	00090513          	mv	a0,s2
    80002944:	00006097          	auipc	ra,0x6
    80002948:	d74080e7          	jalr	-652(ra) # 800086b8 <_Unwind_Resume>
}
    8000294c:	00048513          	mv	a0,s1
    80002950:	01813083          	ld	ra,24(sp)
    80002954:	01013403          	ld	s0,16(sp)
    80002958:	00813483          	ld	s1,8(sp)
    8000295c:	00013903          	ld	s2,0(sp)
    80002960:	02010113          	addi	sp,sp,32
    80002964:	00008067          	ret

0000000080002968 <_ZN3TCB5yieldEv>:
void TCB::yield() { __asm__ volatile ("ecall"); }
    80002968:	ff010113          	addi	sp,sp,-16
    8000296c:	00813423          	sd	s0,8(sp)
    80002970:	01010413          	addi	s0,sp,16
    80002974:	00000073          	ecall
    80002978:	00813403          	ld	s0,8(sp)
    8000297c:	01010113          	addi	sp,sp,16
    80002980:	00008067          	ret

0000000080002984 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002984:	fd010113          	addi	sp,sp,-48
    80002988:	02113423          	sd	ra,40(sp)
    8000298c:	02813023          	sd	s0,32(sp)
    80002990:	00913c23          	sd	s1,24(sp)
    80002994:	01213823          	sd	s2,16(sp)
    80002998:	03010413          	addi	s0,sp,48
    TCB *old = running;
    8000299c:	00005497          	auipc	s1,0x5
    800029a0:	c244b483          	ld	s1,-988(s1) # 800075c0 <_ZN3TCB7runningE>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800029a4:	100027f3          	csrr	a5,sstatus
    800029a8:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800029ac:	fd843903          	ld	s2,-40(s0)
        bool isBlocked() const { return blocked; }
    800029b0:	0294c783          	lbu	a5,41(s1)
    if (!old->isBlocked() && !old->isFinished()) { Scheduler::put(old); }
    800029b4:	00079663          	bnez	a5,800029c0 <_ZN3TCB8dispatchEv+0x3c>
        bool isFinished() const { return finished; }
    800029b8:	0284c783          	lbu	a5,40(s1)
    800029bc:	04078063          	beqz	a5,800029fc <_ZN3TCB8dispatchEv+0x78>
    running = Scheduler::get();
    800029c0:	00001097          	auipc	ra,0x1
    800029c4:	800080e7          	jalr	-2048(ra) # 800031c0 <_ZN9Scheduler3getEv>
    800029c8:	00005797          	auipc	a5,0x5
    800029cc:	bea7bc23          	sd	a0,-1032(a5) # 800075c0 <_ZN3TCB7runningE>
}
inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800029d0:	10091073          	csrw	sstatus,s2
    TCB::contextSwitch(&old->context, &running->context);
    800029d4:	01050593          	addi	a1,a0,16 # 2010 <_entry-0x7fffdff0>
    800029d8:	01048513          	addi	a0,s1,16
    800029dc:	fffff097          	auipc	ra,0xfffff
    800029e0:	864080e7          	jalr	-1948(ra) # 80001240 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800029e4:	02813083          	ld	ra,40(sp)
    800029e8:	02013403          	ld	s0,32(sp)
    800029ec:	01813483          	ld	s1,24(sp)
    800029f0:	01013903          	ld	s2,16(sp)
    800029f4:	03010113          	addi	sp,sp,48
    800029f8:	00008067          	ret
    if (!old->isBlocked() && !old->isFinished()) { Scheduler::put(old); }
    800029fc:	00048513          	mv	a0,s1
    80002a00:	00001097          	auipc	ra,0x1
    80002a04:	828080e7          	jalr	-2008(ra) # 80003228 <_ZN9Scheduler3putEP3TCB>
    80002a08:	fb9ff06f          	j	800029c0 <_ZN3TCB8dispatchEv+0x3c>

0000000080002a0c <_ZN3TCB9checkBodyEv>:

bool TCB::checkBody() {
    80002a0c:	ff010113          	addi	sp,sp,-16
    80002a10:	00113423          	sd	ra,8(sp)
    80002a14:	00813023          	sd	s0,0(sp)
    80002a18:	01010413          	addi	s0,sp,16
    if(this->body != nullptr){
    80002a1c:	00053783          	ld	a5,0(a0)
    80002a20:	02078463          	beqz	a5,80002a48 <_ZN3TCB9checkBodyEv+0x3c>
        printString("Imam body.\n");
    80002a24:	00003517          	auipc	a0,0x3
    80002a28:	71c50513          	addi	a0,a0,1820 # 80006140 <CONSOLE_STATUS+0x130>
    80002a2c:	fffff097          	auipc	ra,0xfffff
    80002a30:	d04080e7          	jalr	-764(ra) # 80001730 <_Z11printStringPKc>
        return true;
    80002a34:	00100513          	li	a0,1
    }else{
        printString("Nemam body.\n");
        return false;
    }
}
    80002a38:	00813083          	ld	ra,8(sp)
    80002a3c:	00013403          	ld	s0,0(sp)
    80002a40:	01010113          	addi	sp,sp,16
    80002a44:	00008067          	ret
        printString("Nemam body.\n");
    80002a48:	00003517          	auipc	a0,0x3
    80002a4c:	70850513          	addi	a0,a0,1800 # 80006150 <CONSOLE_STATUS+0x140>
    80002a50:	fffff097          	auipc	ra,0xfffff
    80002a54:	ce0080e7          	jalr	-800(ra) # 80001730 <_Z11printStringPKc>
        return false;
    80002a58:	00000513          	li	a0,0
    80002a5c:	fddff06f          	j	80002a38 <_ZN3TCB9checkBodyEv+0x2c>

0000000080002a60 <_ZN3TCB7setBodyEPFvvE>:

void TCB::setBody(TCB::Body body) {
    80002a60:	ff010113          	addi	sp,sp,-16
    80002a64:	00813423          	sd	s0,8(sp)
    80002a68:	01010413          	addi	s0,sp,16
    this->body = body;
    80002a6c:	00b53023          	sd	a1,0(a0)
}
    80002a70:	00813403          	ld	s0,8(sp)
    80002a74:	01010113          	addi	sp,sp,16
    80002a78:	00008067          	ret

0000000080002a7c <_ZN3TCB7exitTCBEv>:

void TCB::exitTCB() {
    80002a7c:	ff010113          	addi	sp,sp,-16
    80002a80:	00113423          	sd	ra,8(sp)
    80002a84:	00813023          	sd	s0,0(sp)
    80002a88:	01010413          	addi	s0,sp,16
        void setFinished(bool value) { finished = value; }
    80002a8c:	00005797          	auipc	a5,0x5
    80002a90:	b347b783          	ld	a5,-1228(a5) # 800075c0 <_ZN3TCB7runningE>
    80002a94:	00100713          	li	a4,1
    80002a98:	02e78423          	sb	a4,40(a5)
    running->setFinished(true);
    //delete running;
    // msm da ne treba jer mi svakako radimo delete na kraju svakog testa
    thread_dispatch();
    80002a9c:	fffff097          	auipc	ra,0xfffff
    80002aa0:	880080e7          	jalr	-1920(ra) # 8000131c <_Z15thread_dispatchv>
}
    80002aa4:	00813083          	ld	ra,8(sp)
    80002aa8:	00013403          	ld	s0,0(sp)
    80002aac:	01010113          	addi	sp,sp,16
    80002ab0:	00008067          	ret

0000000080002ab4 <_Znwm>:
// Created by os on 5/12/22.
//
//#include "../lib/mem.h"
#include "../h/syscall_c.hpp"

void *operator new(uint64 n) { return mem_alloc(n); }
    80002ab4:	ff010113          	addi	sp,sp,-16
    80002ab8:	00113423          	sd	ra,8(sp)
    80002abc:	00813023          	sd	s0,0(sp)
    80002ac0:	01010413          	addi	s0,sp,16
    80002ac4:	ffffe097          	auipc	ra,0xffffe
    80002ac8:	790080e7          	jalr	1936(ra) # 80001254 <_Z9mem_allocm>
    80002acc:	00813083          	ld	ra,8(sp)
    80002ad0:	00013403          	ld	s0,0(sp)
    80002ad4:	01010113          	addi	sp,sp,16
    80002ad8:	00008067          	ret

0000000080002adc <_Znam>:
void *operator new[](uint64 n) { return mem_alloc(n); }
    80002adc:	ff010113          	addi	sp,sp,-16
    80002ae0:	00113423          	sd	ra,8(sp)
    80002ae4:	00813023          	sd	s0,0(sp)
    80002ae8:	01010413          	addi	s0,sp,16
    80002aec:	ffffe097          	auipc	ra,0xffffe
    80002af0:	768080e7          	jalr	1896(ra) # 80001254 <_Z9mem_allocm>
    80002af4:	00813083          	ld	ra,8(sp)
    80002af8:	00013403          	ld	s0,0(sp)
    80002afc:	01010113          	addi	sp,sp,16
    80002b00:	00008067          	ret

0000000080002b04 <_ZdlPv>:

void operator delete(void *p) noexcept { mem_free(p); }
    80002b04:	ff010113          	addi	sp,sp,-16
    80002b08:	00113423          	sd	ra,8(sp)
    80002b0c:	00813023          	sd	s0,0(sp)
    80002b10:	01010413          	addi	s0,sp,16
    80002b14:	ffffe097          	auipc	ra,0xffffe
    80002b18:	770080e7          	jalr	1904(ra) # 80001284 <_Z8mem_freePv>
    80002b1c:	00813083          	ld	ra,8(sp)
    80002b20:	00013403          	ld	s0,0(sp)
    80002b24:	01010113          	addi	sp,sp,16
    80002b28:	00008067          	ret

0000000080002b2c <_ZdaPv>:
void operator delete[](void *p) noexcept { mem_free(p); }
    80002b2c:	ff010113          	addi	sp,sp,-16
    80002b30:	00113423          	sd	ra,8(sp)
    80002b34:	00813023          	sd	s0,0(sp)
    80002b38:	01010413          	addi	s0,sp,16
    80002b3c:	ffffe097          	auipc	ra,0xffffe
    80002b40:	748080e7          	jalr	1864(ra) # 80001284 <_Z8mem_freePv>
    80002b44:	00813083          	ld	ra,8(sp)
    80002b48:	00013403          	ld	s0,0(sp)
    80002b4c:	01010113          	addi	sp,sp,16
    80002b50:	00008067          	ret

0000000080002b54 <_ZN9SemaphoreD1Ev>:
Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
    myHandle->mySemaphore = this;
}

Semaphore::~Semaphore() {
    80002b54:	00005797          	auipc	a5,0x5
    80002b58:	9c478793          	addi	a5,a5,-1596 # 80007518 <_ZTV9Semaphore+0x10>
    80002b5c:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    80002b60:	00853503          	ld	a0,8(a0)
    80002b64:	02050863          	beqz	a0,80002b94 <_ZN9SemaphoreD1Ev+0x40>
Semaphore::~Semaphore() {
    80002b68:	ff010113          	addi	sp,sp,-16
    80002b6c:	00113423          	sd	ra,8(sp)
    80002b70:	00813023          	sd	s0,0(sp)
    80002b74:	01010413          	addi	s0,sp,16
    delete myHandle;
    80002b78:	00053783          	ld	a5,0(a0)
    80002b7c:	0087b783          	ld	a5,8(a5)
    80002b80:	000780e7          	jalr	a5
}
    80002b84:	00813083          	ld	ra,8(sp)
    80002b88:	00013403          	ld	s0,0(sp)
    80002b8c:	01010113          	addi	sp,sp,16
    80002b90:	00008067          	ret
    80002b94:	00008067          	ret

0000000080002b98 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002b98:	fe010113          	addi	sp,sp,-32
    80002b9c:	00113c23          	sd	ra,24(sp)
    80002ba0:	00813823          	sd	s0,16(sp)
    80002ba4:	00913423          	sd	s1,8(sp)
    80002ba8:	02010413          	addi	s0,sp,32
    80002bac:	00050493          	mv	s1,a0
}
    80002bb0:	00000097          	auipc	ra,0x0
    80002bb4:	fa4080e7          	jalr	-92(ra) # 80002b54 <_ZN9SemaphoreD1Ev>
    80002bb8:	00048513          	mv	a0,s1
    80002bbc:	00000097          	auipc	ra,0x0
    80002bc0:	f48080e7          	jalr	-184(ra) # 80002b04 <_ZdlPv>
    80002bc4:	01813083          	ld	ra,24(sp)
    80002bc8:	01013403          	ld	s0,16(sp)
    80002bcc:	00813483          	ld	s1,8(sp)
    80002bd0:	02010113          	addi	sp,sp,32
    80002bd4:	00008067          	ret

0000000080002bd8 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002bd8:	fe010113          	addi	sp,sp,-32
    80002bdc:	00113c23          	sd	ra,24(sp)
    80002be0:	00813823          	sd	s0,16(sp)
    80002be4:	00913423          	sd	s1,8(sp)
    80002be8:	02010413          	addi	s0,sp,32
    80002bec:	00005797          	auipc	a5,0x5
    80002bf0:	90478793          	addi	a5,a5,-1788 # 800074f0 <_ZTV6Thread+0x10>
    80002bf4:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    80002bf8:	00853483          	ld	s1,8(a0)
    80002bfc:	02048063          	beqz	s1,80002c1c <_ZN6ThreadD1Ev+0x44>
        ~TCB() { delete[] stack; }
    80002c00:	0084b503          	ld	a0,8(s1)
    80002c04:	00050663          	beqz	a0,80002c10 <_ZN6ThreadD1Ev+0x38>
    80002c08:	00000097          	auipc	ra,0x0
    80002c0c:	f24080e7          	jalr	-220(ra) # 80002b2c <_ZdaPv>
    80002c10:	00048513          	mv	a0,s1
    80002c14:	00000097          	auipc	ra,0x0
    80002c18:	ef0080e7          	jalr	-272(ra) # 80002b04 <_ZdlPv>
}
    80002c1c:	01813083          	ld	ra,24(sp)
    80002c20:	01013403          	ld	s0,16(sp)
    80002c24:	00813483          	ld	s1,8(sp)
    80002c28:	02010113          	addi	sp,sp,32
    80002c2c:	00008067          	ret

0000000080002c30 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002c30:	fe010113          	addi	sp,sp,-32
    80002c34:	00113c23          	sd	ra,24(sp)
    80002c38:	00813823          	sd	s0,16(sp)
    80002c3c:	00913423          	sd	s1,8(sp)
    80002c40:	02010413          	addi	s0,sp,32
    80002c44:	00050493          	mv	s1,a0
}
    80002c48:	00000097          	auipc	ra,0x0
    80002c4c:	f90080e7          	jalr	-112(ra) # 80002bd8 <_ZN6ThreadD1Ev>
    80002c50:	00048513          	mv	a0,s1
    80002c54:	00000097          	auipc	ra,0x0
    80002c58:	eb0080e7          	jalr	-336(ra) # 80002b04 <_ZdlPv>
    80002c5c:	01813083          	ld	ra,24(sp)
    80002c60:	01013403          	ld	s0,16(sp)
    80002c64:	00813483          	ld	s1,8(sp)
    80002c68:	02010113          	addi	sp,sp,32
    80002c6c:	00008067          	ret

0000000080002c70 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002c70:	ff010113          	addi	sp,sp,-16
    80002c74:	00113423          	sd	ra,8(sp)
    80002c78:	00813023          	sd	s0,0(sp)
    80002c7c:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002c80:	ffffe097          	auipc	ra,0xffffe
    80002c84:	69c080e7          	jalr	1692(ra) # 8000131c <_Z15thread_dispatchv>
}
    80002c88:	00813083          	ld	ra,8(sp)
    80002c8c:	00013403          	ld	s0,0(sp)
    80002c90:	01010113          	addi	sp,sp,16
    80002c94:	00008067          	ret

0000000080002c98 <_ZN6Thread5startEv>:
int Thread::start() {
    80002c98:	ff010113          	addi	sp,sp,-16
    80002c9c:	00113423          	sd	ra,8(sp)
    80002ca0:	00813023          	sd	s0,0(sp)
    80002ca4:	01010413          	addi	s0,sp,16
    Scheduler::put(myHandle);
    80002ca8:	00853503          	ld	a0,8(a0)
    80002cac:	00000097          	auipc	ra,0x0
    80002cb0:	57c080e7          	jalr	1404(ra) # 80003228 <_ZN9Scheduler3putEP3TCB>
}
    80002cb4:	00100513          	li	a0,1
    80002cb8:	00813083          	ld	ra,8(sp)
    80002cbc:	00013403          	ld	s0,0(sp)
    80002cc0:	01010113          	addi	sp,sp,16
    80002cc4:	00008067          	ret

0000000080002cc8 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80002cc8:	fe010113          	addi	sp,sp,-32
    80002ccc:	00113c23          	sd	ra,24(sp)
    80002cd0:	00813823          	sd	s0,16(sp)
    80002cd4:	00913423          	sd	s1,8(sp)
    80002cd8:	02010413          	addi	s0,sp,32
    80002cdc:	00050493          	mv	s1,a0
    80002ce0:	00005797          	auipc	a5,0x5
    80002ce4:	81078793          	addi	a5,a5,-2032 # 800074f0 <_ZTV6Thread+0x10>
    80002ce8:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    80002cec:	00850513          	addi	a0,a0,8
    80002cf0:	ffffe097          	auipc	ra,0xffffe
    80002cf4:	5c4080e7          	jalr	1476(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    myHandle->myThread = this;
    80002cf8:	0084b783          	ld	a5,8(s1)
    80002cfc:	0297b823          	sd	s1,48(a5)
}
    80002d00:	01813083          	ld	ra,24(sp)
    80002d04:	01013403          	ld	s0,16(sp)
    80002d08:	00813483          	ld	s1,8(sp)
    80002d0c:	02010113          	addi	sp,sp,32
    80002d10:	00008067          	ret

0000000080002d14 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002d14:	fe010113          	addi	sp,sp,-32
    80002d18:	00113c23          	sd	ra,24(sp)
    80002d1c:	00813823          	sd	s0,16(sp)
    80002d20:	00913423          	sd	s1,8(sp)
    80002d24:	02010413          	addi	s0,sp,32
    80002d28:	00050493          	mv	s1,a0
    80002d2c:	00004797          	auipc	a5,0x4
    80002d30:	7c478793          	addi	a5,a5,1988 # 800074f0 <_ZTV6Thread+0x10>
    80002d34:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, nullptr, nullptr);
    80002d38:	00000613          	li	a2,0
    80002d3c:	00000593          	li	a1,0
    80002d40:	00850513          	addi	a0,a0,8
    80002d44:	ffffe097          	auipc	ra,0xffffe
    80002d48:	570080e7          	jalr	1392(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    myHandle->myThread = this;
    80002d4c:	0084b783          	ld	a5,8(s1)
    80002d50:	0297b823          	sd	s1,48(a5)
}
    80002d54:	01813083          	ld	ra,24(sp)
    80002d58:	01013403          	ld	s0,16(sp)
    80002d5c:	00813483          	ld	s1,8(sp)
    80002d60:	02010113          	addi	sp,sp,32
    80002d64:	00008067          	ret

0000000080002d68 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002d68:	ff010113          	addi	sp,sp,-16
    80002d6c:	00113423          	sd	ra,8(sp)
    80002d70:	00813023          	sd	s0,0(sp)
    80002d74:	01010413          	addi	s0,sp,16
    sem_wait(myHandle);
    80002d78:	00853503          	ld	a0,8(a0)
    80002d7c:	ffffe097          	auipc	ra,0xffffe
    80002d80:	62c080e7          	jalr	1580(ra) # 800013a8 <_Z8sem_waitP9KernelSem>
}
    80002d84:	00000513          	li	a0,0
    80002d88:	00813083          	ld	ra,8(sp)
    80002d8c:	00013403          	ld	s0,0(sp)
    80002d90:	01010113          	addi	sp,sp,16
    80002d94:	00008067          	ret

0000000080002d98 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002d98:	ff010113          	addi	sp,sp,-16
    80002d9c:	00113423          	sd	ra,8(sp)
    80002da0:	00813023          	sd	s0,0(sp)
    80002da4:	01010413          	addi	s0,sp,16
    sem_signal(myHandle);
    80002da8:	00853503          	ld	a0,8(a0)
    80002dac:	ffffe097          	auipc	ra,0xffffe
    80002db0:	62c080e7          	jalr	1580(ra) # 800013d8 <_Z10sem_signalP9KernelSem>
}
    80002db4:	00000513          	li	a0,0
    80002db8:	00813083          	ld	ra,8(sp)
    80002dbc:	00013403          	ld	s0,0(sp)
    80002dc0:	01010113          	addi	sp,sp,16
    80002dc4:	00008067          	ret

0000000080002dc8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002dc8:	fe010113          	addi	sp,sp,-32
    80002dcc:	00113c23          	sd	ra,24(sp)
    80002dd0:	00813823          	sd	s0,16(sp)
    80002dd4:	00913423          	sd	s1,8(sp)
    80002dd8:	02010413          	addi	s0,sp,32
    80002ddc:	00050493          	mv	s1,a0
    80002de0:	00004797          	auipc	a5,0x4
    80002de4:	73878793          	addi	a5,a5,1848 # 80007518 <_ZTV9Semaphore+0x10>
    80002de8:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80002dec:	00850513          	addi	a0,a0,8
    80002df0:	ffffe097          	auipc	ra,0xffffe
    80002df4:	550080e7          	jalr	1360(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    myHandle->mySemaphore = this;
    80002df8:	0084b783          	ld	a5,8(s1)
    80002dfc:	0097b423          	sd	s1,8(a5)
}
    80002e00:	01813083          	ld	ra,24(sp)
    80002e04:	01013403          	ld	s0,16(sp)
    80002e08:	00813483          	ld	s1,8(sp)
    80002e0c:	02010113          	addi	sp,sp,32
    80002e10:	00008067          	ret

0000000080002e14 <_ZN7Console4getcEv>:

char Console::getc() {
    80002e14:	ff010113          	addi	sp,sp,-16
    80002e18:	00113423          	sd	ra,8(sp)
    80002e1c:	00813023          	sd	s0,0(sp)
    80002e20:	01010413          	addi	s0,sp,16
    char c = ::getc();
    80002e24:	ffffe097          	auipc	ra,0xffffe
    80002e28:	5e4080e7          	jalr	1508(ra) # 80001408 <_Z4getcv>
    return c;
}
    80002e2c:	00813083          	ld	ra,8(sp)
    80002e30:	00013403          	ld	s0,0(sp)
    80002e34:	01010113          	addi	sp,sp,16
    80002e38:	00008067          	ret

0000000080002e3c <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002e3c:	ff010113          	addi	sp,sp,-16
    80002e40:	00113423          	sd	ra,8(sp)
    80002e44:	00813023          	sd	s0,0(sp)
    80002e48:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002e4c:	ffffe097          	auipc	ra,0xffffe
    80002e50:	5e8080e7          	jalr	1512(ra) # 80001434 <_Z4putcc>
}
    80002e54:	00813083          	ld	ra,8(sp)
    80002e58:	00013403          	ld	s0,0(sp)
    80002e5c:	01010113          	addi	sp,sp,16
    80002e60:	00008067          	ret

0000000080002e64 <_ZN6Thread3runEv>:
    int start ();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
    80002e64:	ff010113          	addi	sp,sp,-16
    80002e68:	00813423          	sd	s0,8(sp)
    80002e6c:	01010413          	addi	s0,sp,16
    80002e70:	00813403          	ld	s0,8(sp)
    80002e74:	01010113          	addi	sp,sp,16
    80002e78:	00008067          	ret

0000000080002e7c <_ZN5Riscv10popSppSpieEv>:
#include "../h/tcb.hpp"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/printing.hpp"

void Riscv::popSppSpie() {
    80002e7c:	ff010113          	addi	sp,sp,-16
    80002e80:	00813423          	sd	s0,8(sp)
    80002e84:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002e88:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80002e8c:	10200073          	sret
}
    80002e90:	00813403          	ld	s0,8(sp)
    80002e94:	01010113          	addi	sp,sp,16
    80002e98:	00008067          	ret

0000000080002e9c <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002e9c:	f9010113          	addi	sp,sp,-112
    80002ea0:	06113423          	sd	ra,104(sp)
    80002ea4:	06813023          	sd	s0,96(sp)
    80002ea8:	04913c23          	sd	s1,88(sp)
    80002eac:	05213823          	sd	s2,80(sp)
    80002eb0:	05313423          	sd	s3,72(sp)
    80002eb4:	07010413          	addi	s0,sp,112
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002eb8:	142027f3          	csrr	a5,scause
    80002ebc:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80002ec0:	f9843483          	ld	s1,-104(s0)
    uint64 scause = r_scause();

    // velicina gde cu da mu obavestim koji je poziv
    size_t argument0;
    __asm__ volatile("mv %0, a0" : "=r" (argument0));
    80002ec4:	00050793          	mv	a5,a0

    if(argument0 != 0 && scause == 0x0000000000000009UL){
    80002ec8:	00078663          	beqz	a5,80002ed4 <_ZN5Riscv20handleSupervisorTrapEv+0x38>
    80002ecc:	00900713          	li	a4,9
    80002ed0:	06e48463          	beq	s1,a4,80002f38 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
            __putc(c);
        }

        w_sstatus(sstatus); w_sepc(sepc);
    }
    else if (scause == 0x0000000000000009UL) {
    80002ed4:	00900793          	li	a5,9
    80002ed8:	1af48263          	beq	s1,a5,8000307c <_ZN5Riscv20handleSupervisorTrapEv+0x1e0>
        // interrupt: no; cause code: environment call from S-mode(9)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch();
        w_sstatus(sstatus); w_sepc(sepc);
    } else if (scause == 0x8000000000000001UL) {
    80002edc:	fff00793          	li	a5,-1
    80002ee0:	03f79793          	slli	a5,a5,0x3f
    80002ee4:	00178793          	addi	a5,a5,1
    80002ee8:	1cf48863          	beq	s1,a5,800030b8 <_ZN5Riscv20handleSupervisorTrapEv+0x21c>
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus); w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    } else if (scause == 0x8000000000000009UL) {
    80002eec:	fff00793          	li	a5,-1
    80002ef0:	03f79793          	slli	a5,a5,0x3f
    80002ef4:	00978793          	addi	a5,a5,9
    80002ef8:	22f48663          	beq	s1,a5,80003124 <_ZN5Riscv20handleSupervisorTrapEv+0x288>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else {
        // unexpected trap cause
        if (scause == 0x0000000000000002UL){
    80002efc:	00200793          	li	a5,2
    80002f00:	22f48863          	beq	s1,a5,80003130 <_ZN5Riscv20handleSupervisorTrapEv+0x294>
            printString("Error 2\n");
        }

        if (scause == 0x0000000000000005UL){
    80002f04:	00500793          	li	a5,5
    80002f08:	22f48e63          	beq	s1,a5,80003144 <_ZN5Riscv20handleSupervisorTrapEv+0x2a8>
            printString("Error 5\n");
        }

        if (scause == 0x0000000000000007UL){
    80002f0c:	00700793          	li	a5,7
    80002f10:	24f48463          	beq	s1,a5,80003158 <_ZN5Riscv20handleSupervisorTrapEv+0x2bc>
            printString("Error 7\n");
        }

        if (scause == 0x0000000000000008UL){
    80002f14:	00800793          	li	a5,8
    80002f18:	24f48a63          	beq	s1,a5,8000316c <_ZN5Riscv20handleSupervisorTrapEv+0x2d0>
            printString("Error 8\n");
        }


    }
}
    80002f1c:	06813083          	ld	ra,104(sp)
    80002f20:	06013403          	ld	s0,96(sp)
    80002f24:	05813483          	ld	s1,88(sp)
    80002f28:	05013903          	ld	s2,80(sp)
    80002f2c:	04813983          	ld	s3,72(sp)
    80002f30:	07010113          	addi	sp,sp,112
    80002f34:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002f38:	14102773          	csrr	a4,sepc
    80002f3c:	fae43423          	sd	a4,-88(s0)
    return sepc;
    80002f40:	fa843483          	ld	s1,-88(s0)
                uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80002f44:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002f48:	10002773          	csrr	a4,sstatus
    80002f4c:	fae43023          	sd	a4,-96(s0)
    return sstatus;
    80002f50:	fa043903          	ld	s2,-96(s0)
        if(argument0 == 1){ // syscall za mem_alloc
    80002f54:	00100713          	li	a4,1
    80002f58:	06e78463          	beq	a5,a4,80002fc0 <_ZN5Riscv20handleSupervisorTrapEv+0x124>
        }else if(argument0 == 2){ // sistemski poziv za mem_free
    80002f5c:	00200713          	li	a4,2
    80002f60:	06e78e63          	beq	a5,a4,80002fdc <_ZN5Riscv20handleSupervisorTrapEv+0x140>
        }else if(argument0 == 11){
    80002f64:	00b00713          	li	a4,11
    80002f68:	08e78263          	beq	a5,a4,80002fec <_ZN5Riscv20handleSupervisorTrapEv+0x150>
        }else if(argument0 == 12){
    80002f6c:	00c00713          	li	a4,12
    80002f70:	08e78c63          	beq	a5,a4,80003008 <_ZN5Riscv20handleSupervisorTrapEv+0x16c>
        }else if(argument0 == 13){
    80002f74:	00d00713          	li	a4,13
    80002f78:	08e78e63          	beq	a5,a4,80003014 <_ZN5Riscv20handleSupervisorTrapEv+0x178>
        }else if(argument0 == 21){
    80002f7c:	01500713          	li	a4,21
    80002f80:	0ae78063          	beq	a5,a4,80003020 <_ZN5Riscv20handleSupervisorTrapEv+0x184>
        }else if(argument0 == 22){
    80002f84:	01600713          	li	a4,22
    80002f88:	0ae78a63          	beq	a5,a4,8000303c <_ZN5Riscv20handleSupervisorTrapEv+0x1a0>
        }else if(argument0 == 23){
    80002f8c:	01700713          	li	a4,23
    80002f90:	0ae78e63          	beq	a5,a4,8000304c <_ZN5Riscv20handleSupervisorTrapEv+0x1b0>
        }else if(argument0 == 24){
    80002f94:	01800713          	li	a4,24
    80002f98:	0ce78263          	beq	a5,a4,8000305c <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
        }else if(argument0 == 41){
    80002f9c:	02900713          	li	a4,41
    80002fa0:	0ce78663          	beq	a5,a4,8000306c <_ZN5Riscv20handleSupervisorTrapEv+0x1d0>
        }else if(argument0 == 42){
    80002fa4:	02a00713          	li	a4,42
    80002fa8:	02e79463          	bne	a5,a4,80002fd0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (c));
    80002fac:	00058513          	mv	a0,a1
            __putc(c);
    80002fb0:	0ff57513          	andi	a0,a0,255
    80002fb4:	00003097          	auipc	ra,0x3
    80002fb8:	978080e7          	jalr	-1672(ra) # 8000592c <__putc>
    80002fbc:	0140006f          	j	80002fd0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (argument_sizet));
    80002fc0:	00058513          	mv	a0,a1
            argument_ret_void = MemoryAllocator::mem_alloc(argument_sizet);
    80002fc4:	00000097          	auipc	ra,0x0
    80002fc8:	354080e7          	jalr	852(ra) # 80003318 <_ZN15MemoryAllocator9mem_allocEm>
            __asm__ volatile("mv a0, %0" : : "r" (argument_ret_void));
    80002fcc:	00050513          	mv	a0,a0
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002fd0:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002fd4:	14149073          	csrw	sepc,s1
}
    80002fd8:	f45ff06f          	j	80002f1c <_ZN5Riscv20handleSupervisorTrapEv+0x80>
            __asm__ volatile("mv %0, a1" : "=r" (argument_void));
    80002fdc:	00058513          	mv	a0,a1
            MemoryAllocator::mem_free(argument_void);
    80002fe0:	00000097          	auipc	ra,0x0
    80002fe4:	478080e7          	jalr	1144(ra) # 80003458 <_ZN15MemoryAllocator8mem_freeEPv>
    80002fe8:	fe9ff06f          	j	80002fd0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (handler));
    80002fec:	00058993          	mv	s3,a1
            __asm__ volatile("mv %0, a2" : "=r" (sr));
    80002ff0:	00060513          	mv	a0,a2
            __asm__ volatile("mv %0, a3" : "=r" (arg));
    80002ff4:	00068793          	mv	a5,a3
            *handler = TCB::createThread(sr);
    80002ff8:	00000097          	auipc	ra,0x0
    80002ffc:	8f8080e7          	jalr	-1800(ra) # 800028f0 <_ZN3TCB12createThreadEPFvvE>
    80003000:	00a9b023          	sd	a0,0(s3)
    80003004:	fcdff06f          	j	80002fd0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            TCB::exitTCB();
    80003008:	00000097          	auipc	ra,0x0
    8000300c:	a74080e7          	jalr	-1420(ra) # 80002a7c <_ZN3TCB7exitTCBEv>
    80003010:	fc1ff06f          	j	80002fd0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            TCB::dispatch();
    80003014:	00000097          	auipc	ra,0x0
    80003018:	970080e7          	jalr	-1680(ra) # 80002984 <_ZN3TCB8dispatchEv>
    8000301c:	fb5ff06f          	j	80002fd0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (arg1));
    80003020:	00058993          	mv	s3,a1
            __asm__ volatile("mv %0, a2" : "=r" (arg2));
    80003024:	00060513          	mv	a0,a2
            *arg1 = KernelSem::createSem(arg2);
    80003028:	0005051b          	sext.w	a0,a0
    8000302c:	ffffe097          	auipc	ra,0xffffe
    80003030:	468080e7          	jalr	1128(ra) # 80001494 <_ZN9KernelSem9createSemEi>
    80003034:	00a9b023          	sd	a0,0(s3)
    80003038:	f99ff06f          	j	80002fd0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (arg1));
    8000303c:	00058513          	mv	a0,a1
            arg1->freeSem();
    80003040:	ffffe097          	auipc	ra,0xffffe
    80003044:	5f8080e7          	jalr	1528(ra) # 80001638 <_ZN9KernelSem7freeSemEv>
    80003048:	f89ff06f          	j	80002fd0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (arg1));
    8000304c:	00058513          	mv	a0,a1
            arg1->wait();
    80003050:	ffffe097          	auipc	ra,0xffffe
    80003054:	4b4080e7          	jalr	1204(ra) # 80001504 <_ZN9KernelSem4waitEv>
    80003058:	f79ff06f          	j	80002fd0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (arg1));
    8000305c:	00058513          	mv	a0,a1
            arg1->signal();
    80003060:	ffffe097          	auipc	ra,0xffffe
    80003064:	544080e7          	jalr	1348(ra) # 800015a4 <_ZN9KernelSem6signalEv>
    80003068:	f69ff06f          	j	80002fd0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            ret = __getc();
    8000306c:	00003097          	auipc	ra,0x3
    80003070:	8fc080e7          	jalr	-1796(ra) # 80005968 <__getc>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80003074:	00050513          	mv	a0,a0
    80003078:	f59ff06f          	j	80002fd0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000307c:	141027f3          	csrr	a5,sepc
    80003080:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80003084:	fb843483          	ld	s1,-72(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80003088:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000308c:	100027f3          	csrr	a5,sstatus
    80003090:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80003094:	fb043903          	ld	s2,-80(s0)
        TCB::timeSliceCounter = 0;
    80003098:	00004797          	auipc	a5,0x4
    8000309c:	4a87b783          	ld	a5,1192(a5) # 80007540 <_GLOBAL_OFFSET_TABLE_+0x18>
    800030a0:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    800030a4:	00000097          	auipc	ra,0x0
    800030a8:	8e0080e7          	jalr	-1824(ra) # 80002984 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800030ac:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800030b0:	14149073          	csrw	sepc,s1
}
    800030b4:	e69ff06f          	j	80002f1c <_ZN5Riscv20handleSupervisorTrapEv+0x80>
        TCB::timeSliceCounter++;
    800030b8:	00004717          	auipc	a4,0x4
    800030bc:	48873703          	ld	a4,1160(a4) # 80007540 <_GLOBAL_OFFSET_TABLE_+0x18>
    800030c0:	00073783          	ld	a5,0(a4)
    800030c4:	00178793          	addi	a5,a5,1
    800030c8:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    800030cc:	00004717          	auipc	a4,0x4
    800030d0:	48473703          	ld	a4,1156(a4) # 80007550 <_GLOBAL_OFFSET_TABLE_+0x28>
    800030d4:	00073703          	ld	a4,0(a4)
        uint64 getTimeSlice() const { return timeSlice; }
    800030d8:	02073703          	ld	a4,32(a4)
    800030dc:	00e7f863          	bgeu	a5,a4,800030ec <_ZN5Riscv20handleSupervisorTrapEv+0x250>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800030e0:	00200793          	li	a5,2
    800030e4:	1447b073          	csrc	sip,a5
}
    800030e8:	e35ff06f          	j	80002f1c <_ZN5Riscv20handleSupervisorTrapEv+0x80>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800030ec:	141027f3          	csrr	a5,sepc
    800030f0:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    800030f4:	fc843483          	ld	s1,-56(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800030f8:	100027f3          	csrr	a5,sstatus
    800030fc:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80003100:	fc043903          	ld	s2,-64(s0)
            TCB::timeSliceCounter = 0;
    80003104:	00004797          	auipc	a5,0x4
    80003108:	43c7b783          	ld	a5,1084(a5) # 80007540 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000310c:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80003110:	00000097          	auipc	ra,0x0
    80003114:	874080e7          	jalr	-1932(ra) # 80002984 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80003118:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000311c:	14149073          	csrw	sepc,s1
}
    80003120:	fc1ff06f          	j	800030e0 <_ZN5Riscv20handleSupervisorTrapEv+0x244>
        console_handler();
    80003124:	00003097          	auipc	ra,0x3
    80003128:	87c080e7          	jalr	-1924(ra) # 800059a0 <console_handler>
    8000312c:	df1ff06f          	j	80002f1c <_ZN5Riscv20handleSupervisorTrapEv+0x80>
            printString("Error 2\n");
    80003130:	00003517          	auipc	a0,0x3
    80003134:	03050513          	addi	a0,a0,48 # 80006160 <CONSOLE_STATUS+0x150>
    80003138:	ffffe097          	auipc	ra,0xffffe
    8000313c:	5f8080e7          	jalr	1528(ra) # 80001730 <_Z11printStringPKc>
    80003140:	dc5ff06f          	j	80002f04 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
            printString("Error 5\n");
    80003144:	00003517          	auipc	a0,0x3
    80003148:	02c50513          	addi	a0,a0,44 # 80006170 <CONSOLE_STATUS+0x160>
    8000314c:	ffffe097          	auipc	ra,0xffffe
    80003150:	5e4080e7          	jalr	1508(ra) # 80001730 <_Z11printStringPKc>
    80003154:	db9ff06f          	j	80002f0c <_ZN5Riscv20handleSupervisorTrapEv+0x70>
            printString("Error 7\n");
    80003158:	00003517          	auipc	a0,0x3
    8000315c:	02850513          	addi	a0,a0,40 # 80006180 <CONSOLE_STATUS+0x170>
    80003160:	ffffe097          	auipc	ra,0xffffe
    80003164:	5d0080e7          	jalr	1488(ra) # 80001730 <_Z11printStringPKc>
    80003168:	dadff06f          	j	80002f14 <_ZN5Riscv20handleSupervisorTrapEv+0x78>
            printString("Error 8\n");
    8000316c:	00003517          	auipc	a0,0x3
    80003170:	02450513          	addi	a0,a0,36 # 80006190 <CONSOLE_STATUS+0x180>
    80003174:	ffffe097          	auipc	ra,0xffffe
    80003178:	5bc080e7          	jalr	1468(ra) # 80001730 <_Z11printStringPKc>
}
    8000317c:	da1ff06f          	j	80002f1c <_ZN5Riscv20handleSupervisorTrapEv+0x80>

0000000080003180 <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyCoroutineQueue.addLast(tcb);
    80003180:	ff010113          	addi	sp,sp,-16
    80003184:	00813423          	sd	s0,8(sp)
    80003188:	01010413          	addi	s0,sp,16
    8000318c:	00100793          	li	a5,1
    80003190:	00f50863          	beq	a0,a5,800031a0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80003194:	00813403          	ld	s0,8(sp)
    80003198:	01010113          	addi	sp,sp,16
    8000319c:	00008067          	ret
    800031a0:	000107b7          	lui	a5,0x10
    800031a4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800031a8:	fef596e3          	bne	a1,a5,80003194 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0) {}
    800031ac:	00004797          	auipc	a5,0x4
    800031b0:	42478793          	addi	a5,a5,1060 # 800075d0 <_ZN9Scheduler19readyCoroutineQueueE>
    800031b4:	0007b023          	sd	zero,0(a5)
    800031b8:	0007b423          	sd	zero,8(a5)
    800031bc:	fd9ff06f          	j	80003194 <_Z41__static_initialization_and_destruction_0ii+0x14>

00000000800031c0 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    800031c0:	fe010113          	addi	sp,sp,-32
    800031c4:	00113c23          	sd	ra,24(sp)
    800031c8:	00813823          	sd	s0,16(sp)
    800031cc:	00913423          	sd	s1,8(sp)
    800031d0:	02010413          	addi	s0,sp,32
        if(!head){ return 0; }
    800031d4:	00004517          	auipc	a0,0x4
    800031d8:	3fc53503          	ld	a0,1020(a0) # 800075d0 <_ZN9Scheduler19readyCoroutineQueueE>
    800031dc:	04050263          	beqz	a0,80003220 <_ZN9Scheduler3getEv+0x60>
        head = head->next;
    800031e0:	00853783          	ld	a5,8(a0)
    800031e4:	00004717          	auipc	a4,0x4
    800031e8:	3ef73623          	sd	a5,1004(a4) # 800075d0 <_ZN9Scheduler19readyCoroutineQueueE>
        if(!head){ tail = 0; }
    800031ec:	02078463          	beqz	a5,80003214 <_ZN9Scheduler3getEv+0x54>
        T *ret = elem->data;
    800031f0:	00053483          	ld	s1,0(a0)
        delete elem;
    800031f4:	00000097          	auipc	ra,0x0
    800031f8:	910080e7          	jalr	-1776(ra) # 80002b04 <_ZdlPv>
}
    800031fc:	00048513          	mv	a0,s1
    80003200:	01813083          	ld	ra,24(sp)
    80003204:	01013403          	ld	s0,16(sp)
    80003208:	00813483          	ld	s1,8(sp)
    8000320c:	02010113          	addi	sp,sp,32
    80003210:	00008067          	ret
        if(!head){ tail = 0; }
    80003214:	00004797          	auipc	a5,0x4
    80003218:	3c07b223          	sd	zero,964(a5) # 800075d8 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    8000321c:	fd5ff06f          	j	800031f0 <_ZN9Scheduler3getEv+0x30>
        if(!head){ return 0; }
    80003220:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    80003224:	fd9ff06f          	j	800031fc <_ZN9Scheduler3getEv+0x3c>

0000000080003228 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80003228:	fe010113          	addi	sp,sp,-32
    8000322c:	00113c23          	sd	ra,24(sp)
    80003230:	00813823          	sd	s0,16(sp)
    80003234:	00913423          	sd	s1,8(sp)
    80003238:	02010413          	addi	s0,sp,32
    8000323c:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80003240:	01000513          	li	a0,16
    80003244:	00000097          	auipc	ra,0x0
    80003248:	870080e7          	jalr	-1936(ra) # 80002ab4 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    8000324c:	00953023          	sd	s1,0(a0)
    80003250:	00053423          	sd	zero,8(a0)
        if(tail){
    80003254:	00004797          	auipc	a5,0x4
    80003258:	3847b783          	ld	a5,900(a5) # 800075d8 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    8000325c:	02078263          	beqz	a5,80003280 <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    80003260:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80003264:	00004797          	auipc	a5,0x4
    80003268:	36a7ba23          	sd	a0,884(a5) # 800075d8 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    8000326c:	01813083          	ld	ra,24(sp)
    80003270:	01013403          	ld	s0,16(sp)
    80003274:	00813483          	ld	s1,8(sp)
    80003278:	02010113          	addi	sp,sp,32
    8000327c:	00008067          	ret
            head = tail = elem;
    80003280:	00004797          	auipc	a5,0x4
    80003284:	35078793          	addi	a5,a5,848 # 800075d0 <_ZN9Scheduler19readyCoroutineQueueE>
    80003288:	00a7b423          	sd	a0,8(a5)
    8000328c:	00a7b023          	sd	a0,0(a5)
    80003290:	fddff06f          	j	8000326c <_ZN9Scheduler3putEP3TCB+0x44>

0000000080003294 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80003294:	ff010113          	addi	sp,sp,-16
    80003298:	00113423          	sd	ra,8(sp)
    8000329c:	00813023          	sd	s0,0(sp)
    800032a0:	01010413          	addi	s0,sp,16
    800032a4:	000105b7          	lui	a1,0x10
    800032a8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800032ac:	00100513          	li	a0,1
    800032b0:	00000097          	auipc	ra,0x0
    800032b4:	ed0080e7          	jalr	-304(ra) # 80003180 <_Z41__static_initialization_and_destruction_0ii>
    800032b8:	00813083          	ld	ra,8(sp)
    800032bc:	00013403          	ld	s0,0(sp)
    800032c0:	01010113          	addi	sp,sp,16
    800032c4:	00008067          	ret

00000000800032c8 <_ZN15MemoryAllocator8memAllocEv>:

MemoryBloc* MemoryAllocator::freeMemBlocHead;
MemoryBloc* MemoryAllocator::takenMemBlocHead;

// Inicijalizacija memorije
void MemoryAllocator::memAlloc(){
    800032c8:	ff010113          	addi	sp,sp,-16
    800032cc:	00813423          	sd	s0,8(sp)
    800032d0:	01010413          	addi	s0,sp,16
    freeMemBlocHead = (MemoryBloc*)HEAP_START_ADDR;
    800032d4:	00004797          	auipc	a5,0x4
    800032d8:	25c7b783          	ld	a5,604(a5) # 80007530 <_GLOBAL_OFFSET_TABLE_+0x8>
    800032dc:	0007b703          	ld	a4,0(a5)
    800032e0:	00004797          	auipc	a5,0x4
    800032e4:	30078793          	addi	a5,a5,768 # 800075e0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800032e8:	00e7b023          	sd	a4,0(a5)
    freeMemBlocHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    800032ec:	00004697          	auipc	a3,0x4
    800032f0:	26c6b683          	ld	a3,620(a3) # 80007558 <_GLOBAL_OFFSET_TABLE_+0x30>
    800032f4:	0006b683          	ld	a3,0(a3)
    800032f8:	40e686b3          	sub	a3,a3,a4
    800032fc:	00d73023          	sd	a3,0(a4)
    freeMemBlocHead->next = nullptr;
    80003300:	0007b703          	ld	a4,0(a5)
    80003304:	00073423          	sd	zero,8(a4)

    takenMemBlocHead = nullptr;
    80003308:	0007b423          	sd	zero,8(a5)
}
    8000330c:	00813403          	ld	s0,8(sp)
    80003310:	01010113          	addi	sp,sp,16
    80003314:	00008067          	ret

0000000080003318 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc (size_t size){
    80003318:	ff010113          	addi	sp,sp,-16
    8000331c:	00813423          	sd	s0,8(sp)
    80003320:	01010413          	addi	s0,sp,16
    size_t newSize;

    // ako je velicina veca od MEM_BLOC_SIZE onda uzmi blokova koliko ti treba + sizeof(MemoryBloc)
    // u suprotnom samo MEM_BLOC_SIZE + sizeof(MemoryBloc)
    if(size > MEM_BLOCK_SIZE){
    80003324:	04000793          	li	a5,64
    80003328:	02a7fa63          	bgeu	a5,a0,8000335c <_ZN15MemoryAllocator9mem_allocEm+0x44>
        newSize = ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    8000332c:	00655713          	srli	a4,a0,0x6
    80003330:	00170713          	addi	a4,a4,1
    80003334:	00671713          	slli	a4,a4,0x6
    80003338:	01070713          	addi	a4,a4,16
    }else{
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    }

    // trazim prvi slobodan blok u listi slobodnih blokova gde mogu da alociram
    MemoryBloc* curr = freeMemBlocHead;
    8000333c:	00004617          	auipc	a2,0x4
    80003340:	2a463603          	ld	a2,676(a2) # 800075e0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80003344:	00060513          	mv	a0,a2

    while(newSize > curr->size && curr != nullptr){
    80003348:	00053783          	ld	a5,0(a0)
    8000334c:	00e7fc63          	bgeu	a5,a4,80003364 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
    80003350:	00050a63          	beqz	a0,80003364 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
        curr = curr->next;
    80003354:	00853503          	ld	a0,8(a0)
    while(newSize > curr->size && curr != nullptr){
    80003358:	ff1ff06f          	j	80003348 <_ZN15MemoryAllocator9mem_allocEm+0x30>
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    8000335c:	05000713          	li	a4,80
    80003360:	fddff06f          	j	8000333c <_ZN15MemoryAllocator9mem_allocEm+0x24>
    }

    if(curr == nullptr){
    80003364:	00051863          	bnez	a0,80003374 <_ZN15MemoryAllocator9mem_allocEm+0x5c>
            prevTaken->next = newBloc;
        }
    }

    return (void*)((char*)newBloc + sizeof(MemoryBloc));
};
    80003368:	00813403          	ld	s0,8(sp)
    8000336c:	01010113          	addi	sp,sp,16
    80003370:	00008067          	ret
    if(curr == freeMemBlocHead){
    80003374:	00c50e63          	beq	a0,a2,80003390 <_ZN15MemoryAllocator9mem_allocEm+0x78>
    bool checkFree = false;
    80003378:	00000593          	li	a1,0
    MemoryBloc* next = curr->next;
    8000337c:	00853803          	ld	a6,8(a0)
    size_t currSize = curr->size - newSize;
    80003380:	40e786b3          	sub	a3,a5,a4
    if(currSize == 0){
    80003384:	06e79663          	bne	a5,a4,800033f0 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
        MemoryBloc* currFree = freeMemBlocHead;
    80003388:	00060793          	mv	a5,a2
    8000338c:	0100006f          	j	8000339c <_ZN15MemoryAllocator9mem_allocEm+0x84>
        checkFree = true;
    80003390:	00100593          	li	a1,1
    80003394:	fe9ff06f          	j	8000337c <_ZN15MemoryAllocator9mem_allocEm+0x64>
            currFree = currFree->next;
    80003398:	00068793          	mv	a5,a3
        while(currFree != nullptr && currFree->next != curr && checkFree != true){
    8000339c:	00078863          	beqz	a5,800033ac <_ZN15MemoryAllocator9mem_allocEm+0x94>
    800033a0:	0087b683          	ld	a3,8(a5)
    800033a4:	00a68463          	beq	a3,a0,800033ac <_ZN15MemoryAllocator9mem_allocEm+0x94>
    800033a8:	fe0588e3          	beqz	a1,80003398 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(currFree == freeMemBlocHead){
    800033ac:	02c78a63          	beq	a5,a2,800033e0 <_ZN15MemoryAllocator9mem_allocEm+0xc8>
            currFree->next = curr->next;
    800033b0:	0107b423          	sd	a6,8(a5)
    newBloc->size = newSize;
    800033b4:	00e53023          	sd	a4,0(a0)
    if(takenMemBlocHead == nullptr){
    800033b8:	00004697          	auipc	a3,0x4
    800033bc:	2306b683          	ld	a3,560(a3) # 800075e8 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    800033c0:	06068263          	beqz	a3,80003424 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
        MemoryBloc* nextTaken = takenMemBlocHead;
    800033c4:	00068793          	mv	a5,a3
        MemoryBloc* prevTaken = nullptr;
    800033c8:	00000713          	li	a4,0
        while (newBloc > nextTaken && nextTaken != nullptr){
    800033cc:	06a7f463          	bgeu	a5,a0,80003434 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
    800033d0:	06078263          	beqz	a5,80003434 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
            prevTaken = nextTaken;
    800033d4:	00078713          	mv	a4,a5
            nextTaken = nextTaken->next;
    800033d8:	0087b783          	ld	a5,8(a5)
        while (newBloc > nextTaken && nextTaken != nullptr){
    800033dc:	ff1ff06f          	j	800033cc <_ZN15MemoryAllocator9mem_allocEm+0xb4>
            freeMemBlocHead = freeMemBlocHead->next;
    800033e0:	00863783          	ld	a5,8(a2)
    800033e4:	00004697          	auipc	a3,0x4
    800033e8:	1ef6be23          	sd	a5,508(a3) # 800075e0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800033ec:	fc9ff06f          	j	800033b4 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
    }else if(checkFree == true){
    800033f0:	02058263          	beqz	a1,80003414 <_ZN15MemoryAllocator9mem_allocEm+0xfc>
        freeMemBlocHead = (MemoryBloc*)((char*)freeMemBlocHead + newSize);
    800033f4:	00e60633          	add	a2,a2,a4
    800033f8:	00004797          	auipc	a5,0x4
    800033fc:	1e878793          	addi	a5,a5,488 # 800075e0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80003400:	00c7b023          	sd	a2,0(a5)
        freeMemBlocHead->size = currSize;
    80003404:	00d63023          	sd	a3,0(a2)
        freeMemBlocHead->next = next;
    80003408:	0007b783          	ld	a5,0(a5)
    8000340c:	0107b423          	sd	a6,8(a5)
    80003410:	fa5ff06f          	j	800033b4 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        curr = (MemoryBloc*)((char*)curr + newSize);
    80003414:	00e507b3          	add	a5,a0,a4
        curr->size = currSize;
    80003418:	00d7b023          	sd	a3,0(a5)
        curr->next = next;
    8000341c:	0107b423          	sd	a6,8(a5)
    80003420:	f95ff06f          	j	800033b4 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        takenMemBlocHead = newBloc;
    80003424:	00004797          	auipc	a5,0x4
    80003428:	1ca7b223          	sd	a0,452(a5) # 800075e8 <_ZN15MemoryAllocator16takenMemBlocHeadE>
        newBloc->next = nullptr;
    8000342c:	00053423          	sd	zero,8(a0)
    80003430:	0100006f          	j	80003440 <_ZN15MemoryAllocator9mem_allocEm+0x128>
        if(nextTaken == takenMemBlocHead){
    80003434:	00f68a63          	beq	a3,a5,80003448 <_ZN15MemoryAllocator9mem_allocEm+0x130>
            newBloc->next = nextTaken;
    80003438:	00f53423          	sd	a5,8(a0)
            prevTaken->next = newBloc;
    8000343c:	00a73423          	sd	a0,8(a4)
    return (void*)((char*)newBloc + sizeof(MemoryBloc));
    80003440:	01050513          	addi	a0,a0,16
    80003444:	f25ff06f          	j	80003368 <_ZN15MemoryAllocator9mem_allocEm+0x50>
            newBloc->next = takenMemBlocHead;
    80003448:	00d53423          	sd	a3,8(a0)
            takenMemBlocHead = newBloc;
    8000344c:	00004797          	auipc	a5,0x4
    80003450:	18a7be23          	sd	a0,412(a5) # 800075e8 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80003454:	fedff06f          	j	80003440 <_ZN15MemoryAllocator9mem_allocEm+0x128>

0000000080003458 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free (void* mem){
    80003458:	ff010113          	addi	sp,sp,-16
    8000345c:	00813423          	sd	s0,8(sp)
    80003460:	01010413          	addi	s0,sp,16
    void* freeCurr = (void*)((char*)mem - sizeof(MemoryBloc));
    80003464:	ff050513          	addi	a0,a0,-16

    MemoryBloc* curr = takenMemBlocHead;
    80003468:	00004697          	auipc	a3,0x4
    8000346c:	1806b683          	ld	a3,384(a3) # 800075e8 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80003470:	00068793          	mv	a5,a3
    MemoryBloc* prev = nullptr;
    80003474:	00000713          	li	a4,0

    while (curr != freeCurr){
    80003478:	00a78863          	beq	a5,a0,80003488 <_ZN15MemoryAllocator8mem_freeEPv+0x30>
        prev = curr;
    8000347c:	00078713          	mv	a4,a5
        curr = curr->next;
    80003480:	0087b783          	ld	a5,8(a5)
    while (curr != freeCurr){
    80003484:	ff5ff06f          	j	80003478 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
    }
    // uraditi nepredvidjeno ponasanje ako hocu da dealociram nesto sto nisam alocirao
    if(curr == takenMemBlocHead){
    80003488:	02d78863          	beq	a5,a3,800034b8 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        takenMemBlocHead = takenMemBlocHead->next;
    }else{
        prev->next = curr->next;
    8000348c:	0087b683          	ld	a3,8(a5)
    80003490:	00d73423          	sd	a3,8(a4)
    }

    if(freeMemBlocHead == nullptr){
    80003494:	00004617          	auipc	a2,0x4
    80003498:	14c63603          	ld	a2,332(a2) # 800075e0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    8000349c:	02060663          	beqz	a2,800034c8 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        freeMemBlocHead = curr;
    }else{
        MemoryBloc* currFree = freeMemBlocHead;
    800034a0:	00060713          	mv	a4,a2
        MemoryBloc* prevFree = nullptr;
    800034a4:	00000693          	li	a3,0

        while(curr > currFree){
    800034a8:	02f77663          	bgeu	a4,a5,800034d4 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
            prevFree = currFree;
    800034ac:	00070693          	mv	a3,a4
            currFree = currFree->next;
    800034b0:	00873703          	ld	a4,8(a4)
        while(curr > currFree){
    800034b4:	ff5ff06f          	j	800034a8 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
        takenMemBlocHead = takenMemBlocHead->next;
    800034b8:	0086b703          	ld	a4,8(a3)
    800034bc:	00004697          	auipc	a3,0x4
    800034c0:	12e6b623          	sd	a4,300(a3) # 800075e8 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    800034c4:	fd1ff06f          	j	80003494 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
        freeMemBlocHead = curr;
    800034c8:	00004717          	auipc	a4,0x4
    800034cc:	10f73c23          	sd	a5,280(a4) # 800075e0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800034d0:	0100006f          	j	800034e0 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
        }

        if(currFree == freeMemBlocHead){
    800034d4:	00e60c63          	beq	a2,a4,800034ec <_ZN15MemoryAllocator8mem_freeEPv+0x94>
            curr->next = freeMemBlocHead;
            freeMemBlocHead = curr;
        }else{
            curr->next = currFree;
    800034d8:	00e7b423          	sd	a4,8(a5)
            prevFree->next = curr;
    800034dc:	00f6b423          	sd	a5,8(a3)
        }
    }

    MemoryBloc* currMemMerge = freeMemBlocHead;
    800034e0:	00004797          	auipc	a5,0x4
    800034e4:	1007b783          	ld	a5,256(a5) # 800075e0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800034e8:	0300006f          	j	80003518 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
            curr->next = freeMemBlocHead;
    800034ec:	00c7b423          	sd	a2,8(a5)
            freeMemBlocHead = curr;
    800034f0:	00004717          	auipc	a4,0x4
    800034f4:	0ef73823          	sd	a5,240(a4) # 800075e0 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800034f8:	fe9ff06f          	j	800034e0 <_ZN15MemoryAllocator8mem_freeEPv+0x88>

    while(currMemMerge){
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
            currMemMerge->size += currMemMerge->next->size;
    800034fc:	00073603          	ld	a2,0(a4)
    80003500:	00c686b3          	add	a3,a3,a2
    80003504:	00d7b023          	sd	a3,0(a5)
            currMemMerge->next = currMemMerge->next->next;
    80003508:	00873703          	ld	a4,8(a4)
    8000350c:	00e7b423          	sd	a4,8(a5)
    80003510:	00078713          	mv	a4,a5
    80003514:	00070793          	mv	a5,a4
    while(currMemMerge){
    80003518:	00078e63          	beqz	a5,80003534 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
    8000351c:	0087b703          	ld	a4,8(a5)
    80003520:	fe070ae3          	beqz	a4,80003514 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80003524:	0007b683          	ld	a3,0(a5)
    80003528:	00d78633          	add	a2,a5,a3
    8000352c:	fec714e3          	bne	a4,a2,80003514 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80003530:	fcdff06f          	j	800034fc <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            currMemMerge = currMemMerge->next;
        }
    }

    return 0;
    80003534:	00000513          	li	a0,0
    80003538:	00813403          	ld	s0,8(sp)
    8000353c:	01010113          	addi	sp,sp,16
    80003540:	00008067          	ret

0000000080003544 <_ZN6BufferC1Ei>:
#include "../h/buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003544:	fe010113          	addi	sp,sp,-32
    80003548:	00113c23          	sd	ra,24(sp)
    8000354c:	00813823          	sd	s0,16(sp)
    80003550:	00913423          	sd	s1,8(sp)
    80003554:	01213023          	sd	s2,0(sp)
    80003558:	02010413          	addi	s0,sp,32
    8000355c:	00050493          	mv	s1,a0
    80003560:	00058913          	mv	s2,a1
    80003564:	0015879b          	addiw	a5,a1,1
    80003568:	0007851b          	sext.w	a0,a5
    8000356c:	00f4a023          	sw	a5,0(s1)
    80003570:	0004a823          	sw	zero,16(s1)
    80003574:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003578:	00251513          	slli	a0,a0,0x2
    8000357c:	ffffe097          	auipc	ra,0xffffe
    80003580:	cd8080e7          	jalr	-808(ra) # 80001254 <_Z9mem_allocm>
    80003584:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80003588:	00000593          	li	a1,0
    8000358c:	02048513          	addi	a0,s1,32
    80003590:	ffffe097          	auipc	ra,0xffffe
    80003594:	db0080e7          	jalr	-592(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    sem_open(&spaceAvailable, _cap);
    80003598:	00090593          	mv	a1,s2
    8000359c:	01848513          	addi	a0,s1,24
    800035a0:	ffffe097          	auipc	ra,0xffffe
    800035a4:	da0080e7          	jalr	-608(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    sem_open(&mutexHead, 1);
    800035a8:	00100593          	li	a1,1
    800035ac:	02848513          	addi	a0,s1,40
    800035b0:	ffffe097          	auipc	ra,0xffffe
    800035b4:	d90080e7          	jalr	-624(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    sem_open(&mutexTail, 1);
    800035b8:	00100593          	li	a1,1
    800035bc:	03048513          	addi	a0,s1,48
    800035c0:	ffffe097          	auipc	ra,0xffffe
    800035c4:	d80080e7          	jalr	-640(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
}
    800035c8:	01813083          	ld	ra,24(sp)
    800035cc:	01013403          	ld	s0,16(sp)
    800035d0:	00813483          	ld	s1,8(sp)
    800035d4:	00013903          	ld	s2,0(sp)
    800035d8:	02010113          	addi	sp,sp,32
    800035dc:	00008067          	ret

00000000800035e0 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800035e0:	fe010113          	addi	sp,sp,-32
    800035e4:	00113c23          	sd	ra,24(sp)
    800035e8:	00813823          	sd	s0,16(sp)
    800035ec:	00913423          	sd	s1,8(sp)
    800035f0:	01213023          	sd	s2,0(sp)
    800035f4:	02010413          	addi	s0,sp,32
    800035f8:	00050493          	mv	s1,a0
    800035fc:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003600:	01853503          	ld	a0,24(a0)
    80003604:	ffffe097          	auipc	ra,0xffffe
    80003608:	da4080e7          	jalr	-604(ra) # 800013a8 <_Z8sem_waitP9KernelSem>

    sem_wait(mutexTail);
    8000360c:	0304b503          	ld	a0,48(s1)
    80003610:	ffffe097          	auipc	ra,0xffffe
    80003614:	d98080e7          	jalr	-616(ra) # 800013a8 <_Z8sem_waitP9KernelSem>
    buffer[tail] = val;
    80003618:	0084b783          	ld	a5,8(s1)
    8000361c:	0144a703          	lw	a4,20(s1)
    80003620:	00271713          	slli	a4,a4,0x2
    80003624:	00e787b3          	add	a5,a5,a4
    80003628:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000362c:	0144a783          	lw	a5,20(s1)
    80003630:	0017879b          	addiw	a5,a5,1
    80003634:	0004a703          	lw	a4,0(s1)
    80003638:	02e7e7bb          	remw	a5,a5,a4
    8000363c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003640:	0304b503          	ld	a0,48(s1)
    80003644:	ffffe097          	auipc	ra,0xffffe
    80003648:	d94080e7          	jalr	-620(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

    sem_signal(itemAvailable);
    8000364c:	0204b503          	ld	a0,32(s1)
    80003650:	ffffe097          	auipc	ra,0xffffe
    80003654:	d88080e7          	jalr	-632(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

}
    80003658:	01813083          	ld	ra,24(sp)
    8000365c:	01013403          	ld	s0,16(sp)
    80003660:	00813483          	ld	s1,8(sp)
    80003664:	00013903          	ld	s2,0(sp)
    80003668:	02010113          	addi	sp,sp,32
    8000366c:	00008067          	ret

0000000080003670 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80003670:	fe010113          	addi	sp,sp,-32
    80003674:	00113c23          	sd	ra,24(sp)
    80003678:	00813823          	sd	s0,16(sp)
    8000367c:	00913423          	sd	s1,8(sp)
    80003680:	01213023          	sd	s2,0(sp)
    80003684:	02010413          	addi	s0,sp,32
    80003688:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    8000368c:	02053503          	ld	a0,32(a0)
    80003690:	ffffe097          	auipc	ra,0xffffe
    80003694:	d18080e7          	jalr	-744(ra) # 800013a8 <_Z8sem_waitP9KernelSem>

    sem_wait(mutexHead);
    80003698:	0284b503          	ld	a0,40(s1)
    8000369c:	ffffe097          	auipc	ra,0xffffe
    800036a0:	d0c080e7          	jalr	-756(ra) # 800013a8 <_Z8sem_waitP9KernelSem>

    int ret = buffer[head];
    800036a4:	0084b703          	ld	a4,8(s1)
    800036a8:	0104a783          	lw	a5,16(s1)
    800036ac:	00279693          	slli	a3,a5,0x2
    800036b0:	00d70733          	add	a4,a4,a3
    800036b4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800036b8:	0017879b          	addiw	a5,a5,1
    800036bc:	0004a703          	lw	a4,0(s1)
    800036c0:	02e7e7bb          	remw	a5,a5,a4
    800036c4:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800036c8:	0284b503          	ld	a0,40(s1)
    800036cc:	ffffe097          	auipc	ra,0xffffe
    800036d0:	d0c080e7          	jalr	-756(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

    sem_signal(spaceAvailable);
    800036d4:	0184b503          	ld	a0,24(s1)
    800036d8:	ffffe097          	auipc	ra,0xffffe
    800036dc:	d00080e7          	jalr	-768(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

    return ret;
}
    800036e0:	00090513          	mv	a0,s2
    800036e4:	01813083          	ld	ra,24(sp)
    800036e8:	01013403          	ld	s0,16(sp)
    800036ec:	00813483          	ld	s1,8(sp)
    800036f0:	00013903          	ld	s2,0(sp)
    800036f4:	02010113          	addi	sp,sp,32
    800036f8:	00008067          	ret

00000000800036fc <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800036fc:	fe010113          	addi	sp,sp,-32
    80003700:	00113c23          	sd	ra,24(sp)
    80003704:	00813823          	sd	s0,16(sp)
    80003708:	00913423          	sd	s1,8(sp)
    8000370c:	01213023          	sd	s2,0(sp)
    80003710:	02010413          	addi	s0,sp,32
    80003714:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80003718:	02853503          	ld	a0,40(a0)
    8000371c:	ffffe097          	auipc	ra,0xffffe
    80003720:	c8c080e7          	jalr	-884(ra) # 800013a8 <_Z8sem_waitP9KernelSem>
    sem_wait(mutexTail);
    80003724:	0304b503          	ld	a0,48(s1)
    80003728:	ffffe097          	auipc	ra,0xffffe
    8000372c:	c80080e7          	jalr	-896(ra) # 800013a8 <_Z8sem_waitP9KernelSem>

    if (tail >= head) {
    80003730:	0144a783          	lw	a5,20(s1)
    80003734:	0104a903          	lw	s2,16(s1)
    80003738:	0327ce63          	blt	a5,s2,80003774 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    8000373c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80003740:	0304b503          	ld	a0,48(s1)
    80003744:	ffffe097          	auipc	ra,0xffffe
    80003748:	c94080e7          	jalr	-876(ra) # 800013d8 <_Z10sem_signalP9KernelSem>
    sem_signal(mutexHead);
    8000374c:	0284b503          	ld	a0,40(s1)
    80003750:	ffffe097          	auipc	ra,0xffffe
    80003754:	c88080e7          	jalr	-888(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

    return ret;
}
    80003758:	00090513          	mv	a0,s2
    8000375c:	01813083          	ld	ra,24(sp)
    80003760:	01013403          	ld	s0,16(sp)
    80003764:	00813483          	ld	s1,8(sp)
    80003768:	00013903          	ld	s2,0(sp)
    8000376c:	02010113          	addi	sp,sp,32
    80003770:	00008067          	ret
        ret = cap - head + tail;
    80003774:	0004a703          	lw	a4,0(s1)
    80003778:	4127093b          	subw	s2,a4,s2
    8000377c:	00f9093b          	addw	s2,s2,a5
    80003780:	fc1ff06f          	j	80003740 <_ZN6Buffer6getCntEv+0x44>

0000000080003784 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80003784:	fe010113          	addi	sp,sp,-32
    80003788:	00113c23          	sd	ra,24(sp)
    8000378c:	00813823          	sd	s0,16(sp)
    80003790:	00913423          	sd	s1,8(sp)
    80003794:	02010413          	addi	s0,sp,32
    80003798:	00050493          	mv	s1,a0
    putc('\n');
    8000379c:	00a00513          	li	a0,10
    800037a0:	ffffe097          	auipc	ra,0xffffe
    800037a4:	c94080e7          	jalr	-876(ra) # 80001434 <_Z4putcc>
    printString("Buffer deleted!\n");
    800037a8:	00003517          	auipc	a0,0x3
    800037ac:	87850513          	addi	a0,a0,-1928 # 80006020 <CONSOLE_STATUS+0x10>
    800037b0:	ffffe097          	auipc	ra,0xffffe
    800037b4:	f80080e7          	jalr	-128(ra) # 80001730 <_Z11printStringPKc>
    while (getCnt() > 0) {
    800037b8:	00048513          	mv	a0,s1
    800037bc:	00000097          	auipc	ra,0x0
    800037c0:	f40080e7          	jalr	-192(ra) # 800036fc <_ZN6Buffer6getCntEv>
    800037c4:	02a05c63          	blez	a0,800037fc <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800037c8:	0084b783          	ld	a5,8(s1)
    800037cc:	0104a703          	lw	a4,16(s1)
    800037d0:	00271713          	slli	a4,a4,0x2
    800037d4:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800037d8:	0007c503          	lbu	a0,0(a5)
    800037dc:	ffffe097          	auipc	ra,0xffffe
    800037e0:	c58080e7          	jalr	-936(ra) # 80001434 <_Z4putcc>
        head = (head + 1) % cap;
    800037e4:	0104a783          	lw	a5,16(s1)
    800037e8:	0017879b          	addiw	a5,a5,1
    800037ec:	0004a703          	lw	a4,0(s1)
    800037f0:	02e7e7bb          	remw	a5,a5,a4
    800037f4:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800037f8:	fc1ff06f          	j	800037b8 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800037fc:	02100513          	li	a0,33
    80003800:	ffffe097          	auipc	ra,0xffffe
    80003804:	c34080e7          	jalr	-972(ra) # 80001434 <_Z4putcc>
    putc('\n');
    80003808:	00a00513          	li	a0,10
    8000380c:	ffffe097          	auipc	ra,0xffffe
    80003810:	c28080e7          	jalr	-984(ra) # 80001434 <_Z4putcc>
    mem_free(buffer);
    80003814:	0084b503          	ld	a0,8(s1)
    80003818:	ffffe097          	auipc	ra,0xffffe
    8000381c:	a6c080e7          	jalr	-1428(ra) # 80001284 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80003820:	0204b503          	ld	a0,32(s1)
    80003824:	ffffe097          	auipc	ra,0xffffe
    80003828:	b54080e7          	jalr	-1196(ra) # 80001378 <_Z9sem_closeP9KernelSem>
    sem_close(spaceAvailable);
    8000382c:	0184b503          	ld	a0,24(s1)
    80003830:	ffffe097          	auipc	ra,0xffffe
    80003834:	b48080e7          	jalr	-1208(ra) # 80001378 <_Z9sem_closeP9KernelSem>
    sem_close(mutexTail);
    80003838:	0304b503          	ld	a0,48(s1)
    8000383c:	ffffe097          	auipc	ra,0xffffe
    80003840:	b3c080e7          	jalr	-1220(ra) # 80001378 <_Z9sem_closeP9KernelSem>
    sem_close(mutexHead);
    80003844:	0284b503          	ld	a0,40(s1)
    80003848:	ffffe097          	auipc	ra,0xffffe
    8000384c:	b30080e7          	jalr	-1232(ra) # 80001378 <_Z9sem_closeP9KernelSem>
}
    80003850:	01813083          	ld	ra,24(sp)
    80003854:	01013403          	ld	s0,16(sp)
    80003858:	00813483          	ld	s1,8(sp)
    8000385c:	02010113          	addi	sp,sp,32
    80003860:	00008067          	ret

0000000080003864 <start>:
    80003864:	ff010113          	addi	sp,sp,-16
    80003868:	00813423          	sd	s0,8(sp)
    8000386c:	01010413          	addi	s0,sp,16
    80003870:	300027f3          	csrr	a5,mstatus
    80003874:	ffffe737          	lui	a4,0xffffe
    80003878:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff5faf>
    8000387c:	00e7f7b3          	and	a5,a5,a4
    80003880:	00001737          	lui	a4,0x1
    80003884:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003888:	00e7e7b3          	or	a5,a5,a4
    8000388c:	30079073          	csrw	mstatus,a5
    80003890:	00000797          	auipc	a5,0x0
    80003894:	16078793          	addi	a5,a5,352 # 800039f0 <system_main>
    80003898:	34179073          	csrw	mepc,a5
    8000389c:	00000793          	li	a5,0
    800038a0:	18079073          	csrw	satp,a5
    800038a4:	000107b7          	lui	a5,0x10
    800038a8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800038ac:	30279073          	csrw	medeleg,a5
    800038b0:	30379073          	csrw	mideleg,a5
    800038b4:	104027f3          	csrr	a5,sie
    800038b8:	2227e793          	ori	a5,a5,546
    800038bc:	10479073          	csrw	sie,a5
    800038c0:	fff00793          	li	a5,-1
    800038c4:	00a7d793          	srli	a5,a5,0xa
    800038c8:	3b079073          	csrw	pmpaddr0,a5
    800038cc:	00f00793          	li	a5,15
    800038d0:	3a079073          	csrw	pmpcfg0,a5
    800038d4:	f14027f3          	csrr	a5,mhartid
    800038d8:	0200c737          	lui	a4,0x200c
    800038dc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800038e0:	0007869b          	sext.w	a3,a5
    800038e4:	00269713          	slli	a4,a3,0x2
    800038e8:	000f4637          	lui	a2,0xf4
    800038ec:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800038f0:	00d70733          	add	a4,a4,a3
    800038f4:	0037979b          	slliw	a5,a5,0x3
    800038f8:	020046b7          	lui	a3,0x2004
    800038fc:	00d787b3          	add	a5,a5,a3
    80003900:	00c585b3          	add	a1,a1,a2
    80003904:	00371693          	slli	a3,a4,0x3
    80003908:	00004717          	auipc	a4,0x4
    8000390c:	ce870713          	addi	a4,a4,-792 # 800075f0 <timer_scratch>
    80003910:	00b7b023          	sd	a1,0(a5)
    80003914:	00d70733          	add	a4,a4,a3
    80003918:	00f73c23          	sd	a5,24(a4)
    8000391c:	02c73023          	sd	a2,32(a4)
    80003920:	34071073          	csrw	mscratch,a4
    80003924:	00000797          	auipc	a5,0x0
    80003928:	6ec78793          	addi	a5,a5,1772 # 80004010 <timervec>
    8000392c:	30579073          	csrw	mtvec,a5
    80003930:	300027f3          	csrr	a5,mstatus
    80003934:	0087e793          	ori	a5,a5,8
    80003938:	30079073          	csrw	mstatus,a5
    8000393c:	304027f3          	csrr	a5,mie
    80003940:	0807e793          	ori	a5,a5,128
    80003944:	30479073          	csrw	mie,a5
    80003948:	f14027f3          	csrr	a5,mhartid
    8000394c:	0007879b          	sext.w	a5,a5
    80003950:	00078213          	mv	tp,a5
    80003954:	30200073          	mret
    80003958:	00813403          	ld	s0,8(sp)
    8000395c:	01010113          	addi	sp,sp,16
    80003960:	00008067          	ret

0000000080003964 <timerinit>:
    80003964:	ff010113          	addi	sp,sp,-16
    80003968:	00813423          	sd	s0,8(sp)
    8000396c:	01010413          	addi	s0,sp,16
    80003970:	f14027f3          	csrr	a5,mhartid
    80003974:	0200c737          	lui	a4,0x200c
    80003978:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000397c:	0007869b          	sext.w	a3,a5
    80003980:	00269713          	slli	a4,a3,0x2
    80003984:	000f4637          	lui	a2,0xf4
    80003988:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000398c:	00d70733          	add	a4,a4,a3
    80003990:	0037979b          	slliw	a5,a5,0x3
    80003994:	020046b7          	lui	a3,0x2004
    80003998:	00d787b3          	add	a5,a5,a3
    8000399c:	00c585b3          	add	a1,a1,a2
    800039a0:	00371693          	slli	a3,a4,0x3
    800039a4:	00004717          	auipc	a4,0x4
    800039a8:	c4c70713          	addi	a4,a4,-948 # 800075f0 <timer_scratch>
    800039ac:	00b7b023          	sd	a1,0(a5)
    800039b0:	00d70733          	add	a4,a4,a3
    800039b4:	00f73c23          	sd	a5,24(a4)
    800039b8:	02c73023          	sd	a2,32(a4)
    800039bc:	34071073          	csrw	mscratch,a4
    800039c0:	00000797          	auipc	a5,0x0
    800039c4:	65078793          	addi	a5,a5,1616 # 80004010 <timervec>
    800039c8:	30579073          	csrw	mtvec,a5
    800039cc:	300027f3          	csrr	a5,mstatus
    800039d0:	0087e793          	ori	a5,a5,8
    800039d4:	30079073          	csrw	mstatus,a5
    800039d8:	304027f3          	csrr	a5,mie
    800039dc:	0807e793          	ori	a5,a5,128
    800039e0:	30479073          	csrw	mie,a5
    800039e4:	00813403          	ld	s0,8(sp)
    800039e8:	01010113          	addi	sp,sp,16
    800039ec:	00008067          	ret

00000000800039f0 <system_main>:
    800039f0:	fe010113          	addi	sp,sp,-32
    800039f4:	00813823          	sd	s0,16(sp)
    800039f8:	00913423          	sd	s1,8(sp)
    800039fc:	00113c23          	sd	ra,24(sp)
    80003a00:	02010413          	addi	s0,sp,32
    80003a04:	00000097          	auipc	ra,0x0
    80003a08:	0c4080e7          	jalr	196(ra) # 80003ac8 <cpuid>
    80003a0c:	00004497          	auipc	s1,0x4
    80003a10:	b7448493          	addi	s1,s1,-1164 # 80007580 <started>
    80003a14:	02050263          	beqz	a0,80003a38 <system_main+0x48>
    80003a18:	0004a783          	lw	a5,0(s1)
    80003a1c:	0007879b          	sext.w	a5,a5
    80003a20:	fe078ce3          	beqz	a5,80003a18 <system_main+0x28>
    80003a24:	0ff0000f          	fence
    80003a28:	00002517          	auipc	a0,0x2
    80003a2c:	7a850513          	addi	a0,a0,1960 # 800061d0 <CONSOLE_STATUS+0x1c0>
    80003a30:	00001097          	auipc	ra,0x1
    80003a34:	a7c080e7          	jalr	-1412(ra) # 800044ac <panic>
    80003a38:	00001097          	auipc	ra,0x1
    80003a3c:	9d0080e7          	jalr	-1584(ra) # 80004408 <consoleinit>
    80003a40:	00001097          	auipc	ra,0x1
    80003a44:	15c080e7          	jalr	348(ra) # 80004b9c <printfinit>
    80003a48:	00002517          	auipc	a0,0x2
    80003a4c:	6f050513          	addi	a0,a0,1776 # 80006138 <CONSOLE_STATUS+0x128>
    80003a50:	00001097          	auipc	ra,0x1
    80003a54:	ab8080e7          	jalr	-1352(ra) # 80004508 <__printf>
    80003a58:	00002517          	auipc	a0,0x2
    80003a5c:	74850513          	addi	a0,a0,1864 # 800061a0 <CONSOLE_STATUS+0x190>
    80003a60:	00001097          	auipc	ra,0x1
    80003a64:	aa8080e7          	jalr	-1368(ra) # 80004508 <__printf>
    80003a68:	00002517          	auipc	a0,0x2
    80003a6c:	6d050513          	addi	a0,a0,1744 # 80006138 <CONSOLE_STATUS+0x128>
    80003a70:	00001097          	auipc	ra,0x1
    80003a74:	a98080e7          	jalr	-1384(ra) # 80004508 <__printf>
    80003a78:	00001097          	auipc	ra,0x1
    80003a7c:	4b0080e7          	jalr	1200(ra) # 80004f28 <kinit>
    80003a80:	00000097          	auipc	ra,0x0
    80003a84:	148080e7          	jalr	328(ra) # 80003bc8 <trapinit>
    80003a88:	00000097          	auipc	ra,0x0
    80003a8c:	16c080e7          	jalr	364(ra) # 80003bf4 <trapinithart>
    80003a90:	00000097          	auipc	ra,0x0
    80003a94:	5c0080e7          	jalr	1472(ra) # 80004050 <plicinit>
    80003a98:	00000097          	auipc	ra,0x0
    80003a9c:	5e0080e7          	jalr	1504(ra) # 80004078 <plicinithart>
    80003aa0:	00000097          	auipc	ra,0x0
    80003aa4:	078080e7          	jalr	120(ra) # 80003b18 <userinit>
    80003aa8:	0ff0000f          	fence
    80003aac:	00100793          	li	a5,1
    80003ab0:	00002517          	auipc	a0,0x2
    80003ab4:	70850513          	addi	a0,a0,1800 # 800061b8 <CONSOLE_STATUS+0x1a8>
    80003ab8:	00f4a023          	sw	a5,0(s1)
    80003abc:	00001097          	auipc	ra,0x1
    80003ac0:	a4c080e7          	jalr	-1460(ra) # 80004508 <__printf>
    80003ac4:	0000006f          	j	80003ac4 <system_main+0xd4>

0000000080003ac8 <cpuid>:
    80003ac8:	ff010113          	addi	sp,sp,-16
    80003acc:	00813423          	sd	s0,8(sp)
    80003ad0:	01010413          	addi	s0,sp,16
    80003ad4:	00020513          	mv	a0,tp
    80003ad8:	00813403          	ld	s0,8(sp)
    80003adc:	0005051b          	sext.w	a0,a0
    80003ae0:	01010113          	addi	sp,sp,16
    80003ae4:	00008067          	ret

0000000080003ae8 <mycpu>:
    80003ae8:	ff010113          	addi	sp,sp,-16
    80003aec:	00813423          	sd	s0,8(sp)
    80003af0:	01010413          	addi	s0,sp,16
    80003af4:	00020793          	mv	a5,tp
    80003af8:	00813403          	ld	s0,8(sp)
    80003afc:	0007879b          	sext.w	a5,a5
    80003b00:	00779793          	slli	a5,a5,0x7
    80003b04:	00005517          	auipc	a0,0x5
    80003b08:	b1c50513          	addi	a0,a0,-1252 # 80008620 <cpus>
    80003b0c:	00f50533          	add	a0,a0,a5
    80003b10:	01010113          	addi	sp,sp,16
    80003b14:	00008067          	ret

0000000080003b18 <userinit>:
    80003b18:	ff010113          	addi	sp,sp,-16
    80003b1c:	00813423          	sd	s0,8(sp)
    80003b20:	01010413          	addi	s0,sp,16
    80003b24:	00813403          	ld	s0,8(sp)
    80003b28:	01010113          	addi	sp,sp,16
    80003b2c:	fffff317          	auipc	t1,0xfffff
    80003b30:	c6c30067          	jr	-916(t1) # 80002798 <main>

0000000080003b34 <either_copyout>:
    80003b34:	ff010113          	addi	sp,sp,-16
    80003b38:	00813023          	sd	s0,0(sp)
    80003b3c:	00113423          	sd	ra,8(sp)
    80003b40:	01010413          	addi	s0,sp,16
    80003b44:	02051663          	bnez	a0,80003b70 <either_copyout+0x3c>
    80003b48:	00058513          	mv	a0,a1
    80003b4c:	00060593          	mv	a1,a2
    80003b50:	0006861b          	sext.w	a2,a3
    80003b54:	00002097          	auipc	ra,0x2
    80003b58:	c60080e7          	jalr	-928(ra) # 800057b4 <__memmove>
    80003b5c:	00813083          	ld	ra,8(sp)
    80003b60:	00013403          	ld	s0,0(sp)
    80003b64:	00000513          	li	a0,0
    80003b68:	01010113          	addi	sp,sp,16
    80003b6c:	00008067          	ret
    80003b70:	00002517          	auipc	a0,0x2
    80003b74:	68850513          	addi	a0,a0,1672 # 800061f8 <CONSOLE_STATUS+0x1e8>
    80003b78:	00001097          	auipc	ra,0x1
    80003b7c:	934080e7          	jalr	-1740(ra) # 800044ac <panic>

0000000080003b80 <either_copyin>:
    80003b80:	ff010113          	addi	sp,sp,-16
    80003b84:	00813023          	sd	s0,0(sp)
    80003b88:	00113423          	sd	ra,8(sp)
    80003b8c:	01010413          	addi	s0,sp,16
    80003b90:	02059463          	bnez	a1,80003bb8 <either_copyin+0x38>
    80003b94:	00060593          	mv	a1,a2
    80003b98:	0006861b          	sext.w	a2,a3
    80003b9c:	00002097          	auipc	ra,0x2
    80003ba0:	c18080e7          	jalr	-1000(ra) # 800057b4 <__memmove>
    80003ba4:	00813083          	ld	ra,8(sp)
    80003ba8:	00013403          	ld	s0,0(sp)
    80003bac:	00000513          	li	a0,0
    80003bb0:	01010113          	addi	sp,sp,16
    80003bb4:	00008067          	ret
    80003bb8:	00002517          	auipc	a0,0x2
    80003bbc:	66850513          	addi	a0,a0,1640 # 80006220 <CONSOLE_STATUS+0x210>
    80003bc0:	00001097          	auipc	ra,0x1
    80003bc4:	8ec080e7          	jalr	-1812(ra) # 800044ac <panic>

0000000080003bc8 <trapinit>:
    80003bc8:	ff010113          	addi	sp,sp,-16
    80003bcc:	00813423          	sd	s0,8(sp)
    80003bd0:	01010413          	addi	s0,sp,16
    80003bd4:	00813403          	ld	s0,8(sp)
    80003bd8:	00002597          	auipc	a1,0x2
    80003bdc:	67058593          	addi	a1,a1,1648 # 80006248 <CONSOLE_STATUS+0x238>
    80003be0:	00005517          	auipc	a0,0x5
    80003be4:	ac050513          	addi	a0,a0,-1344 # 800086a0 <tickslock>
    80003be8:	01010113          	addi	sp,sp,16
    80003bec:	00001317          	auipc	t1,0x1
    80003bf0:	5cc30067          	jr	1484(t1) # 800051b8 <initlock>

0000000080003bf4 <trapinithart>:
    80003bf4:	ff010113          	addi	sp,sp,-16
    80003bf8:	00813423          	sd	s0,8(sp)
    80003bfc:	01010413          	addi	s0,sp,16
    80003c00:	00000797          	auipc	a5,0x0
    80003c04:	30078793          	addi	a5,a5,768 # 80003f00 <kernelvec>
    80003c08:	10579073          	csrw	stvec,a5
    80003c0c:	00813403          	ld	s0,8(sp)
    80003c10:	01010113          	addi	sp,sp,16
    80003c14:	00008067          	ret

0000000080003c18 <usertrap>:
    80003c18:	ff010113          	addi	sp,sp,-16
    80003c1c:	00813423          	sd	s0,8(sp)
    80003c20:	01010413          	addi	s0,sp,16
    80003c24:	00813403          	ld	s0,8(sp)
    80003c28:	01010113          	addi	sp,sp,16
    80003c2c:	00008067          	ret

0000000080003c30 <usertrapret>:
    80003c30:	ff010113          	addi	sp,sp,-16
    80003c34:	00813423          	sd	s0,8(sp)
    80003c38:	01010413          	addi	s0,sp,16
    80003c3c:	00813403          	ld	s0,8(sp)
    80003c40:	01010113          	addi	sp,sp,16
    80003c44:	00008067          	ret

0000000080003c48 <kerneltrap>:
    80003c48:	fe010113          	addi	sp,sp,-32
    80003c4c:	00813823          	sd	s0,16(sp)
    80003c50:	00113c23          	sd	ra,24(sp)
    80003c54:	00913423          	sd	s1,8(sp)
    80003c58:	02010413          	addi	s0,sp,32
    80003c5c:	142025f3          	csrr	a1,scause
    80003c60:	100027f3          	csrr	a5,sstatus
    80003c64:	0027f793          	andi	a5,a5,2
    80003c68:	10079c63          	bnez	a5,80003d80 <kerneltrap+0x138>
    80003c6c:	142027f3          	csrr	a5,scause
    80003c70:	0207ce63          	bltz	a5,80003cac <kerneltrap+0x64>
    80003c74:	00002517          	auipc	a0,0x2
    80003c78:	61c50513          	addi	a0,a0,1564 # 80006290 <CONSOLE_STATUS+0x280>
    80003c7c:	00001097          	auipc	ra,0x1
    80003c80:	88c080e7          	jalr	-1908(ra) # 80004508 <__printf>
    80003c84:	141025f3          	csrr	a1,sepc
    80003c88:	14302673          	csrr	a2,stval
    80003c8c:	00002517          	auipc	a0,0x2
    80003c90:	61450513          	addi	a0,a0,1556 # 800062a0 <CONSOLE_STATUS+0x290>
    80003c94:	00001097          	auipc	ra,0x1
    80003c98:	874080e7          	jalr	-1932(ra) # 80004508 <__printf>
    80003c9c:	00002517          	auipc	a0,0x2
    80003ca0:	61c50513          	addi	a0,a0,1564 # 800062b8 <CONSOLE_STATUS+0x2a8>
    80003ca4:	00001097          	auipc	ra,0x1
    80003ca8:	808080e7          	jalr	-2040(ra) # 800044ac <panic>
    80003cac:	0ff7f713          	andi	a4,a5,255
    80003cb0:	00900693          	li	a3,9
    80003cb4:	04d70063          	beq	a4,a3,80003cf4 <kerneltrap+0xac>
    80003cb8:	fff00713          	li	a4,-1
    80003cbc:	03f71713          	slli	a4,a4,0x3f
    80003cc0:	00170713          	addi	a4,a4,1
    80003cc4:	fae798e3          	bne	a5,a4,80003c74 <kerneltrap+0x2c>
    80003cc8:	00000097          	auipc	ra,0x0
    80003ccc:	e00080e7          	jalr	-512(ra) # 80003ac8 <cpuid>
    80003cd0:	06050663          	beqz	a0,80003d3c <kerneltrap+0xf4>
    80003cd4:	144027f3          	csrr	a5,sip
    80003cd8:	ffd7f793          	andi	a5,a5,-3
    80003cdc:	14479073          	csrw	sip,a5
    80003ce0:	01813083          	ld	ra,24(sp)
    80003ce4:	01013403          	ld	s0,16(sp)
    80003ce8:	00813483          	ld	s1,8(sp)
    80003cec:	02010113          	addi	sp,sp,32
    80003cf0:	00008067          	ret
    80003cf4:	00000097          	auipc	ra,0x0
    80003cf8:	3d0080e7          	jalr	976(ra) # 800040c4 <plic_claim>
    80003cfc:	00a00793          	li	a5,10
    80003d00:	00050493          	mv	s1,a0
    80003d04:	06f50863          	beq	a0,a5,80003d74 <kerneltrap+0x12c>
    80003d08:	fc050ce3          	beqz	a0,80003ce0 <kerneltrap+0x98>
    80003d0c:	00050593          	mv	a1,a0
    80003d10:	00002517          	auipc	a0,0x2
    80003d14:	56050513          	addi	a0,a0,1376 # 80006270 <CONSOLE_STATUS+0x260>
    80003d18:	00000097          	auipc	ra,0x0
    80003d1c:	7f0080e7          	jalr	2032(ra) # 80004508 <__printf>
    80003d20:	01013403          	ld	s0,16(sp)
    80003d24:	01813083          	ld	ra,24(sp)
    80003d28:	00048513          	mv	a0,s1
    80003d2c:	00813483          	ld	s1,8(sp)
    80003d30:	02010113          	addi	sp,sp,32
    80003d34:	00000317          	auipc	t1,0x0
    80003d38:	3c830067          	jr	968(t1) # 800040fc <plic_complete>
    80003d3c:	00005517          	auipc	a0,0x5
    80003d40:	96450513          	addi	a0,a0,-1692 # 800086a0 <tickslock>
    80003d44:	00001097          	auipc	ra,0x1
    80003d48:	498080e7          	jalr	1176(ra) # 800051dc <acquire>
    80003d4c:	00004717          	auipc	a4,0x4
    80003d50:	83870713          	addi	a4,a4,-1992 # 80007584 <ticks>
    80003d54:	00072783          	lw	a5,0(a4)
    80003d58:	00005517          	auipc	a0,0x5
    80003d5c:	94850513          	addi	a0,a0,-1720 # 800086a0 <tickslock>
    80003d60:	0017879b          	addiw	a5,a5,1
    80003d64:	00f72023          	sw	a5,0(a4)
    80003d68:	00001097          	auipc	ra,0x1
    80003d6c:	540080e7          	jalr	1344(ra) # 800052a8 <release>
    80003d70:	f65ff06f          	j	80003cd4 <kerneltrap+0x8c>
    80003d74:	00001097          	auipc	ra,0x1
    80003d78:	09c080e7          	jalr	156(ra) # 80004e10 <uartintr>
    80003d7c:	fa5ff06f          	j	80003d20 <kerneltrap+0xd8>
    80003d80:	00002517          	auipc	a0,0x2
    80003d84:	4d050513          	addi	a0,a0,1232 # 80006250 <CONSOLE_STATUS+0x240>
    80003d88:	00000097          	auipc	ra,0x0
    80003d8c:	724080e7          	jalr	1828(ra) # 800044ac <panic>

0000000080003d90 <clockintr>:
    80003d90:	fe010113          	addi	sp,sp,-32
    80003d94:	00813823          	sd	s0,16(sp)
    80003d98:	00913423          	sd	s1,8(sp)
    80003d9c:	00113c23          	sd	ra,24(sp)
    80003da0:	02010413          	addi	s0,sp,32
    80003da4:	00005497          	auipc	s1,0x5
    80003da8:	8fc48493          	addi	s1,s1,-1796 # 800086a0 <tickslock>
    80003dac:	00048513          	mv	a0,s1
    80003db0:	00001097          	auipc	ra,0x1
    80003db4:	42c080e7          	jalr	1068(ra) # 800051dc <acquire>
    80003db8:	00003717          	auipc	a4,0x3
    80003dbc:	7cc70713          	addi	a4,a4,1996 # 80007584 <ticks>
    80003dc0:	00072783          	lw	a5,0(a4)
    80003dc4:	01013403          	ld	s0,16(sp)
    80003dc8:	01813083          	ld	ra,24(sp)
    80003dcc:	00048513          	mv	a0,s1
    80003dd0:	0017879b          	addiw	a5,a5,1
    80003dd4:	00813483          	ld	s1,8(sp)
    80003dd8:	00f72023          	sw	a5,0(a4)
    80003ddc:	02010113          	addi	sp,sp,32
    80003de0:	00001317          	auipc	t1,0x1
    80003de4:	4c830067          	jr	1224(t1) # 800052a8 <release>

0000000080003de8 <devintr>:
    80003de8:	142027f3          	csrr	a5,scause
    80003dec:	00000513          	li	a0,0
    80003df0:	0007c463          	bltz	a5,80003df8 <devintr+0x10>
    80003df4:	00008067          	ret
    80003df8:	fe010113          	addi	sp,sp,-32
    80003dfc:	00813823          	sd	s0,16(sp)
    80003e00:	00113c23          	sd	ra,24(sp)
    80003e04:	00913423          	sd	s1,8(sp)
    80003e08:	02010413          	addi	s0,sp,32
    80003e0c:	0ff7f713          	andi	a4,a5,255
    80003e10:	00900693          	li	a3,9
    80003e14:	04d70c63          	beq	a4,a3,80003e6c <devintr+0x84>
    80003e18:	fff00713          	li	a4,-1
    80003e1c:	03f71713          	slli	a4,a4,0x3f
    80003e20:	00170713          	addi	a4,a4,1
    80003e24:	00e78c63          	beq	a5,a4,80003e3c <devintr+0x54>
    80003e28:	01813083          	ld	ra,24(sp)
    80003e2c:	01013403          	ld	s0,16(sp)
    80003e30:	00813483          	ld	s1,8(sp)
    80003e34:	02010113          	addi	sp,sp,32
    80003e38:	00008067          	ret
    80003e3c:	00000097          	auipc	ra,0x0
    80003e40:	c8c080e7          	jalr	-884(ra) # 80003ac8 <cpuid>
    80003e44:	06050663          	beqz	a0,80003eb0 <devintr+0xc8>
    80003e48:	144027f3          	csrr	a5,sip
    80003e4c:	ffd7f793          	andi	a5,a5,-3
    80003e50:	14479073          	csrw	sip,a5
    80003e54:	01813083          	ld	ra,24(sp)
    80003e58:	01013403          	ld	s0,16(sp)
    80003e5c:	00813483          	ld	s1,8(sp)
    80003e60:	00200513          	li	a0,2
    80003e64:	02010113          	addi	sp,sp,32
    80003e68:	00008067          	ret
    80003e6c:	00000097          	auipc	ra,0x0
    80003e70:	258080e7          	jalr	600(ra) # 800040c4 <plic_claim>
    80003e74:	00a00793          	li	a5,10
    80003e78:	00050493          	mv	s1,a0
    80003e7c:	06f50663          	beq	a0,a5,80003ee8 <devintr+0x100>
    80003e80:	00100513          	li	a0,1
    80003e84:	fa0482e3          	beqz	s1,80003e28 <devintr+0x40>
    80003e88:	00048593          	mv	a1,s1
    80003e8c:	00002517          	auipc	a0,0x2
    80003e90:	3e450513          	addi	a0,a0,996 # 80006270 <CONSOLE_STATUS+0x260>
    80003e94:	00000097          	auipc	ra,0x0
    80003e98:	674080e7          	jalr	1652(ra) # 80004508 <__printf>
    80003e9c:	00048513          	mv	a0,s1
    80003ea0:	00000097          	auipc	ra,0x0
    80003ea4:	25c080e7          	jalr	604(ra) # 800040fc <plic_complete>
    80003ea8:	00100513          	li	a0,1
    80003eac:	f7dff06f          	j	80003e28 <devintr+0x40>
    80003eb0:	00004517          	auipc	a0,0x4
    80003eb4:	7f050513          	addi	a0,a0,2032 # 800086a0 <tickslock>
    80003eb8:	00001097          	auipc	ra,0x1
    80003ebc:	324080e7          	jalr	804(ra) # 800051dc <acquire>
    80003ec0:	00003717          	auipc	a4,0x3
    80003ec4:	6c470713          	addi	a4,a4,1732 # 80007584 <ticks>
    80003ec8:	00072783          	lw	a5,0(a4)
    80003ecc:	00004517          	auipc	a0,0x4
    80003ed0:	7d450513          	addi	a0,a0,2004 # 800086a0 <tickslock>
    80003ed4:	0017879b          	addiw	a5,a5,1
    80003ed8:	00f72023          	sw	a5,0(a4)
    80003edc:	00001097          	auipc	ra,0x1
    80003ee0:	3cc080e7          	jalr	972(ra) # 800052a8 <release>
    80003ee4:	f65ff06f          	j	80003e48 <devintr+0x60>
    80003ee8:	00001097          	auipc	ra,0x1
    80003eec:	f28080e7          	jalr	-216(ra) # 80004e10 <uartintr>
    80003ef0:	fadff06f          	j	80003e9c <devintr+0xb4>
	...

0000000080003f00 <kernelvec>:
    80003f00:	f0010113          	addi	sp,sp,-256
    80003f04:	00113023          	sd	ra,0(sp)
    80003f08:	00213423          	sd	sp,8(sp)
    80003f0c:	00313823          	sd	gp,16(sp)
    80003f10:	00413c23          	sd	tp,24(sp)
    80003f14:	02513023          	sd	t0,32(sp)
    80003f18:	02613423          	sd	t1,40(sp)
    80003f1c:	02713823          	sd	t2,48(sp)
    80003f20:	02813c23          	sd	s0,56(sp)
    80003f24:	04913023          	sd	s1,64(sp)
    80003f28:	04a13423          	sd	a0,72(sp)
    80003f2c:	04b13823          	sd	a1,80(sp)
    80003f30:	04c13c23          	sd	a2,88(sp)
    80003f34:	06d13023          	sd	a3,96(sp)
    80003f38:	06e13423          	sd	a4,104(sp)
    80003f3c:	06f13823          	sd	a5,112(sp)
    80003f40:	07013c23          	sd	a6,120(sp)
    80003f44:	09113023          	sd	a7,128(sp)
    80003f48:	09213423          	sd	s2,136(sp)
    80003f4c:	09313823          	sd	s3,144(sp)
    80003f50:	09413c23          	sd	s4,152(sp)
    80003f54:	0b513023          	sd	s5,160(sp)
    80003f58:	0b613423          	sd	s6,168(sp)
    80003f5c:	0b713823          	sd	s7,176(sp)
    80003f60:	0b813c23          	sd	s8,184(sp)
    80003f64:	0d913023          	sd	s9,192(sp)
    80003f68:	0da13423          	sd	s10,200(sp)
    80003f6c:	0db13823          	sd	s11,208(sp)
    80003f70:	0dc13c23          	sd	t3,216(sp)
    80003f74:	0fd13023          	sd	t4,224(sp)
    80003f78:	0fe13423          	sd	t5,232(sp)
    80003f7c:	0ff13823          	sd	t6,240(sp)
    80003f80:	cc9ff0ef          	jal	ra,80003c48 <kerneltrap>
    80003f84:	00013083          	ld	ra,0(sp)
    80003f88:	00813103          	ld	sp,8(sp)
    80003f8c:	01013183          	ld	gp,16(sp)
    80003f90:	02013283          	ld	t0,32(sp)
    80003f94:	02813303          	ld	t1,40(sp)
    80003f98:	03013383          	ld	t2,48(sp)
    80003f9c:	03813403          	ld	s0,56(sp)
    80003fa0:	04013483          	ld	s1,64(sp)
    80003fa4:	04813503          	ld	a0,72(sp)
    80003fa8:	05013583          	ld	a1,80(sp)
    80003fac:	05813603          	ld	a2,88(sp)
    80003fb0:	06013683          	ld	a3,96(sp)
    80003fb4:	06813703          	ld	a4,104(sp)
    80003fb8:	07013783          	ld	a5,112(sp)
    80003fbc:	07813803          	ld	a6,120(sp)
    80003fc0:	08013883          	ld	a7,128(sp)
    80003fc4:	08813903          	ld	s2,136(sp)
    80003fc8:	09013983          	ld	s3,144(sp)
    80003fcc:	09813a03          	ld	s4,152(sp)
    80003fd0:	0a013a83          	ld	s5,160(sp)
    80003fd4:	0a813b03          	ld	s6,168(sp)
    80003fd8:	0b013b83          	ld	s7,176(sp)
    80003fdc:	0b813c03          	ld	s8,184(sp)
    80003fe0:	0c013c83          	ld	s9,192(sp)
    80003fe4:	0c813d03          	ld	s10,200(sp)
    80003fe8:	0d013d83          	ld	s11,208(sp)
    80003fec:	0d813e03          	ld	t3,216(sp)
    80003ff0:	0e013e83          	ld	t4,224(sp)
    80003ff4:	0e813f03          	ld	t5,232(sp)
    80003ff8:	0f013f83          	ld	t6,240(sp)
    80003ffc:	10010113          	addi	sp,sp,256
    80004000:	10200073          	sret
    80004004:	00000013          	nop
    80004008:	00000013          	nop
    8000400c:	00000013          	nop

0000000080004010 <timervec>:
    80004010:	34051573          	csrrw	a0,mscratch,a0
    80004014:	00b53023          	sd	a1,0(a0)
    80004018:	00c53423          	sd	a2,8(a0)
    8000401c:	00d53823          	sd	a3,16(a0)
    80004020:	01853583          	ld	a1,24(a0)
    80004024:	02053603          	ld	a2,32(a0)
    80004028:	0005b683          	ld	a3,0(a1)
    8000402c:	00c686b3          	add	a3,a3,a2
    80004030:	00d5b023          	sd	a3,0(a1)
    80004034:	00200593          	li	a1,2
    80004038:	14459073          	csrw	sip,a1
    8000403c:	01053683          	ld	a3,16(a0)
    80004040:	00853603          	ld	a2,8(a0)
    80004044:	00053583          	ld	a1,0(a0)
    80004048:	34051573          	csrrw	a0,mscratch,a0
    8000404c:	30200073          	mret

0000000080004050 <plicinit>:
    80004050:	ff010113          	addi	sp,sp,-16
    80004054:	00813423          	sd	s0,8(sp)
    80004058:	01010413          	addi	s0,sp,16
    8000405c:	00813403          	ld	s0,8(sp)
    80004060:	0c0007b7          	lui	a5,0xc000
    80004064:	00100713          	li	a4,1
    80004068:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000406c:	00e7a223          	sw	a4,4(a5)
    80004070:	01010113          	addi	sp,sp,16
    80004074:	00008067          	ret

0000000080004078 <plicinithart>:
    80004078:	ff010113          	addi	sp,sp,-16
    8000407c:	00813023          	sd	s0,0(sp)
    80004080:	00113423          	sd	ra,8(sp)
    80004084:	01010413          	addi	s0,sp,16
    80004088:	00000097          	auipc	ra,0x0
    8000408c:	a40080e7          	jalr	-1472(ra) # 80003ac8 <cpuid>
    80004090:	0085171b          	slliw	a4,a0,0x8
    80004094:	0c0027b7          	lui	a5,0xc002
    80004098:	00e787b3          	add	a5,a5,a4
    8000409c:	40200713          	li	a4,1026
    800040a0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800040a4:	00813083          	ld	ra,8(sp)
    800040a8:	00013403          	ld	s0,0(sp)
    800040ac:	00d5151b          	slliw	a0,a0,0xd
    800040b0:	0c2017b7          	lui	a5,0xc201
    800040b4:	00a78533          	add	a0,a5,a0
    800040b8:	00052023          	sw	zero,0(a0)
    800040bc:	01010113          	addi	sp,sp,16
    800040c0:	00008067          	ret

00000000800040c4 <plic_claim>:
    800040c4:	ff010113          	addi	sp,sp,-16
    800040c8:	00813023          	sd	s0,0(sp)
    800040cc:	00113423          	sd	ra,8(sp)
    800040d0:	01010413          	addi	s0,sp,16
    800040d4:	00000097          	auipc	ra,0x0
    800040d8:	9f4080e7          	jalr	-1548(ra) # 80003ac8 <cpuid>
    800040dc:	00813083          	ld	ra,8(sp)
    800040e0:	00013403          	ld	s0,0(sp)
    800040e4:	00d5151b          	slliw	a0,a0,0xd
    800040e8:	0c2017b7          	lui	a5,0xc201
    800040ec:	00a78533          	add	a0,a5,a0
    800040f0:	00452503          	lw	a0,4(a0)
    800040f4:	01010113          	addi	sp,sp,16
    800040f8:	00008067          	ret

00000000800040fc <plic_complete>:
    800040fc:	fe010113          	addi	sp,sp,-32
    80004100:	00813823          	sd	s0,16(sp)
    80004104:	00913423          	sd	s1,8(sp)
    80004108:	00113c23          	sd	ra,24(sp)
    8000410c:	02010413          	addi	s0,sp,32
    80004110:	00050493          	mv	s1,a0
    80004114:	00000097          	auipc	ra,0x0
    80004118:	9b4080e7          	jalr	-1612(ra) # 80003ac8 <cpuid>
    8000411c:	01813083          	ld	ra,24(sp)
    80004120:	01013403          	ld	s0,16(sp)
    80004124:	00d5179b          	slliw	a5,a0,0xd
    80004128:	0c201737          	lui	a4,0xc201
    8000412c:	00f707b3          	add	a5,a4,a5
    80004130:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004134:	00813483          	ld	s1,8(sp)
    80004138:	02010113          	addi	sp,sp,32
    8000413c:	00008067          	ret

0000000080004140 <consolewrite>:
    80004140:	fb010113          	addi	sp,sp,-80
    80004144:	04813023          	sd	s0,64(sp)
    80004148:	04113423          	sd	ra,72(sp)
    8000414c:	02913c23          	sd	s1,56(sp)
    80004150:	03213823          	sd	s2,48(sp)
    80004154:	03313423          	sd	s3,40(sp)
    80004158:	03413023          	sd	s4,32(sp)
    8000415c:	01513c23          	sd	s5,24(sp)
    80004160:	05010413          	addi	s0,sp,80
    80004164:	06c05c63          	blez	a2,800041dc <consolewrite+0x9c>
    80004168:	00060993          	mv	s3,a2
    8000416c:	00050a13          	mv	s4,a0
    80004170:	00058493          	mv	s1,a1
    80004174:	00000913          	li	s2,0
    80004178:	fff00a93          	li	s5,-1
    8000417c:	01c0006f          	j	80004198 <consolewrite+0x58>
    80004180:	fbf44503          	lbu	a0,-65(s0)
    80004184:	0019091b          	addiw	s2,s2,1
    80004188:	00148493          	addi	s1,s1,1
    8000418c:	00001097          	auipc	ra,0x1
    80004190:	a9c080e7          	jalr	-1380(ra) # 80004c28 <uartputc>
    80004194:	03298063          	beq	s3,s2,800041b4 <consolewrite+0x74>
    80004198:	00048613          	mv	a2,s1
    8000419c:	00100693          	li	a3,1
    800041a0:	000a0593          	mv	a1,s4
    800041a4:	fbf40513          	addi	a0,s0,-65
    800041a8:	00000097          	auipc	ra,0x0
    800041ac:	9d8080e7          	jalr	-1576(ra) # 80003b80 <either_copyin>
    800041b0:	fd5518e3          	bne	a0,s5,80004180 <consolewrite+0x40>
    800041b4:	04813083          	ld	ra,72(sp)
    800041b8:	04013403          	ld	s0,64(sp)
    800041bc:	03813483          	ld	s1,56(sp)
    800041c0:	02813983          	ld	s3,40(sp)
    800041c4:	02013a03          	ld	s4,32(sp)
    800041c8:	01813a83          	ld	s5,24(sp)
    800041cc:	00090513          	mv	a0,s2
    800041d0:	03013903          	ld	s2,48(sp)
    800041d4:	05010113          	addi	sp,sp,80
    800041d8:	00008067          	ret
    800041dc:	00000913          	li	s2,0
    800041e0:	fd5ff06f          	j	800041b4 <consolewrite+0x74>

00000000800041e4 <consoleread>:
    800041e4:	f9010113          	addi	sp,sp,-112
    800041e8:	06813023          	sd	s0,96(sp)
    800041ec:	04913c23          	sd	s1,88(sp)
    800041f0:	05213823          	sd	s2,80(sp)
    800041f4:	05313423          	sd	s3,72(sp)
    800041f8:	05413023          	sd	s4,64(sp)
    800041fc:	03513c23          	sd	s5,56(sp)
    80004200:	03613823          	sd	s6,48(sp)
    80004204:	03713423          	sd	s7,40(sp)
    80004208:	03813023          	sd	s8,32(sp)
    8000420c:	06113423          	sd	ra,104(sp)
    80004210:	01913c23          	sd	s9,24(sp)
    80004214:	07010413          	addi	s0,sp,112
    80004218:	00060b93          	mv	s7,a2
    8000421c:	00050913          	mv	s2,a0
    80004220:	00058c13          	mv	s8,a1
    80004224:	00060b1b          	sext.w	s6,a2
    80004228:	00004497          	auipc	s1,0x4
    8000422c:	4a048493          	addi	s1,s1,1184 # 800086c8 <cons>
    80004230:	00400993          	li	s3,4
    80004234:	fff00a13          	li	s4,-1
    80004238:	00a00a93          	li	s5,10
    8000423c:	05705e63          	blez	s7,80004298 <consoleread+0xb4>
    80004240:	09c4a703          	lw	a4,156(s1)
    80004244:	0984a783          	lw	a5,152(s1)
    80004248:	0007071b          	sext.w	a4,a4
    8000424c:	08e78463          	beq	a5,a4,800042d4 <consoleread+0xf0>
    80004250:	07f7f713          	andi	a4,a5,127
    80004254:	00e48733          	add	a4,s1,a4
    80004258:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000425c:	0017869b          	addiw	a3,a5,1
    80004260:	08d4ac23          	sw	a3,152(s1)
    80004264:	00070c9b          	sext.w	s9,a4
    80004268:	0b370663          	beq	a4,s3,80004314 <consoleread+0x130>
    8000426c:	00100693          	li	a3,1
    80004270:	f9f40613          	addi	a2,s0,-97
    80004274:	000c0593          	mv	a1,s8
    80004278:	00090513          	mv	a0,s2
    8000427c:	f8e40fa3          	sb	a4,-97(s0)
    80004280:	00000097          	auipc	ra,0x0
    80004284:	8b4080e7          	jalr	-1868(ra) # 80003b34 <either_copyout>
    80004288:	01450863          	beq	a0,s4,80004298 <consoleread+0xb4>
    8000428c:	001c0c13          	addi	s8,s8,1
    80004290:	fffb8b9b          	addiw	s7,s7,-1
    80004294:	fb5c94e3          	bne	s9,s5,8000423c <consoleread+0x58>
    80004298:	000b851b          	sext.w	a0,s7
    8000429c:	06813083          	ld	ra,104(sp)
    800042a0:	06013403          	ld	s0,96(sp)
    800042a4:	05813483          	ld	s1,88(sp)
    800042a8:	05013903          	ld	s2,80(sp)
    800042ac:	04813983          	ld	s3,72(sp)
    800042b0:	04013a03          	ld	s4,64(sp)
    800042b4:	03813a83          	ld	s5,56(sp)
    800042b8:	02813b83          	ld	s7,40(sp)
    800042bc:	02013c03          	ld	s8,32(sp)
    800042c0:	01813c83          	ld	s9,24(sp)
    800042c4:	40ab053b          	subw	a0,s6,a0
    800042c8:	03013b03          	ld	s6,48(sp)
    800042cc:	07010113          	addi	sp,sp,112
    800042d0:	00008067          	ret
    800042d4:	00001097          	auipc	ra,0x1
    800042d8:	1d8080e7          	jalr	472(ra) # 800054ac <push_on>
    800042dc:	0984a703          	lw	a4,152(s1)
    800042e0:	09c4a783          	lw	a5,156(s1)
    800042e4:	0007879b          	sext.w	a5,a5
    800042e8:	fef70ce3          	beq	a4,a5,800042e0 <consoleread+0xfc>
    800042ec:	00001097          	auipc	ra,0x1
    800042f0:	234080e7          	jalr	564(ra) # 80005520 <pop_on>
    800042f4:	0984a783          	lw	a5,152(s1)
    800042f8:	07f7f713          	andi	a4,a5,127
    800042fc:	00e48733          	add	a4,s1,a4
    80004300:	01874703          	lbu	a4,24(a4)
    80004304:	0017869b          	addiw	a3,a5,1
    80004308:	08d4ac23          	sw	a3,152(s1)
    8000430c:	00070c9b          	sext.w	s9,a4
    80004310:	f5371ee3          	bne	a4,s3,8000426c <consoleread+0x88>
    80004314:	000b851b          	sext.w	a0,s7
    80004318:	f96bf2e3          	bgeu	s7,s6,8000429c <consoleread+0xb8>
    8000431c:	08f4ac23          	sw	a5,152(s1)
    80004320:	f7dff06f          	j	8000429c <consoleread+0xb8>

0000000080004324 <consputc>:
    80004324:	10000793          	li	a5,256
    80004328:	00f50663          	beq	a0,a5,80004334 <consputc+0x10>
    8000432c:	00001317          	auipc	t1,0x1
    80004330:	9f430067          	jr	-1548(t1) # 80004d20 <uartputc_sync>
    80004334:	ff010113          	addi	sp,sp,-16
    80004338:	00113423          	sd	ra,8(sp)
    8000433c:	00813023          	sd	s0,0(sp)
    80004340:	01010413          	addi	s0,sp,16
    80004344:	00800513          	li	a0,8
    80004348:	00001097          	auipc	ra,0x1
    8000434c:	9d8080e7          	jalr	-1576(ra) # 80004d20 <uartputc_sync>
    80004350:	02000513          	li	a0,32
    80004354:	00001097          	auipc	ra,0x1
    80004358:	9cc080e7          	jalr	-1588(ra) # 80004d20 <uartputc_sync>
    8000435c:	00013403          	ld	s0,0(sp)
    80004360:	00813083          	ld	ra,8(sp)
    80004364:	00800513          	li	a0,8
    80004368:	01010113          	addi	sp,sp,16
    8000436c:	00001317          	auipc	t1,0x1
    80004370:	9b430067          	jr	-1612(t1) # 80004d20 <uartputc_sync>

0000000080004374 <consoleintr>:
    80004374:	fe010113          	addi	sp,sp,-32
    80004378:	00813823          	sd	s0,16(sp)
    8000437c:	00913423          	sd	s1,8(sp)
    80004380:	01213023          	sd	s2,0(sp)
    80004384:	00113c23          	sd	ra,24(sp)
    80004388:	02010413          	addi	s0,sp,32
    8000438c:	00004917          	auipc	s2,0x4
    80004390:	33c90913          	addi	s2,s2,828 # 800086c8 <cons>
    80004394:	00050493          	mv	s1,a0
    80004398:	00090513          	mv	a0,s2
    8000439c:	00001097          	auipc	ra,0x1
    800043a0:	e40080e7          	jalr	-448(ra) # 800051dc <acquire>
    800043a4:	02048c63          	beqz	s1,800043dc <consoleintr+0x68>
    800043a8:	0a092783          	lw	a5,160(s2)
    800043ac:	09892703          	lw	a4,152(s2)
    800043b0:	07f00693          	li	a3,127
    800043b4:	40e7873b          	subw	a4,a5,a4
    800043b8:	02e6e263          	bltu	a3,a4,800043dc <consoleintr+0x68>
    800043bc:	00d00713          	li	a4,13
    800043c0:	04e48063          	beq	s1,a4,80004400 <consoleintr+0x8c>
    800043c4:	07f7f713          	andi	a4,a5,127
    800043c8:	00e90733          	add	a4,s2,a4
    800043cc:	0017879b          	addiw	a5,a5,1
    800043d0:	0af92023          	sw	a5,160(s2)
    800043d4:	00970c23          	sb	s1,24(a4)
    800043d8:	08f92e23          	sw	a5,156(s2)
    800043dc:	01013403          	ld	s0,16(sp)
    800043e0:	01813083          	ld	ra,24(sp)
    800043e4:	00813483          	ld	s1,8(sp)
    800043e8:	00013903          	ld	s2,0(sp)
    800043ec:	00004517          	auipc	a0,0x4
    800043f0:	2dc50513          	addi	a0,a0,732 # 800086c8 <cons>
    800043f4:	02010113          	addi	sp,sp,32
    800043f8:	00001317          	auipc	t1,0x1
    800043fc:	eb030067          	jr	-336(t1) # 800052a8 <release>
    80004400:	00a00493          	li	s1,10
    80004404:	fc1ff06f          	j	800043c4 <consoleintr+0x50>

0000000080004408 <consoleinit>:
    80004408:	fe010113          	addi	sp,sp,-32
    8000440c:	00113c23          	sd	ra,24(sp)
    80004410:	00813823          	sd	s0,16(sp)
    80004414:	00913423          	sd	s1,8(sp)
    80004418:	02010413          	addi	s0,sp,32
    8000441c:	00004497          	auipc	s1,0x4
    80004420:	2ac48493          	addi	s1,s1,684 # 800086c8 <cons>
    80004424:	00048513          	mv	a0,s1
    80004428:	00002597          	auipc	a1,0x2
    8000442c:	ea058593          	addi	a1,a1,-352 # 800062c8 <CONSOLE_STATUS+0x2b8>
    80004430:	00001097          	auipc	ra,0x1
    80004434:	d88080e7          	jalr	-632(ra) # 800051b8 <initlock>
    80004438:	00000097          	auipc	ra,0x0
    8000443c:	7ac080e7          	jalr	1964(ra) # 80004be4 <uartinit>
    80004440:	01813083          	ld	ra,24(sp)
    80004444:	01013403          	ld	s0,16(sp)
    80004448:	00000797          	auipc	a5,0x0
    8000444c:	d9c78793          	addi	a5,a5,-612 # 800041e4 <consoleread>
    80004450:	0af4bc23          	sd	a5,184(s1)
    80004454:	00000797          	auipc	a5,0x0
    80004458:	cec78793          	addi	a5,a5,-788 # 80004140 <consolewrite>
    8000445c:	0cf4b023          	sd	a5,192(s1)
    80004460:	00813483          	ld	s1,8(sp)
    80004464:	02010113          	addi	sp,sp,32
    80004468:	00008067          	ret

000000008000446c <console_read>:
    8000446c:	ff010113          	addi	sp,sp,-16
    80004470:	00813423          	sd	s0,8(sp)
    80004474:	01010413          	addi	s0,sp,16
    80004478:	00813403          	ld	s0,8(sp)
    8000447c:	00004317          	auipc	t1,0x4
    80004480:	30433303          	ld	t1,772(t1) # 80008780 <devsw+0x10>
    80004484:	01010113          	addi	sp,sp,16
    80004488:	00030067          	jr	t1

000000008000448c <console_write>:
    8000448c:	ff010113          	addi	sp,sp,-16
    80004490:	00813423          	sd	s0,8(sp)
    80004494:	01010413          	addi	s0,sp,16
    80004498:	00813403          	ld	s0,8(sp)
    8000449c:	00004317          	auipc	t1,0x4
    800044a0:	2ec33303          	ld	t1,748(t1) # 80008788 <devsw+0x18>
    800044a4:	01010113          	addi	sp,sp,16
    800044a8:	00030067          	jr	t1

00000000800044ac <panic>:
    800044ac:	fe010113          	addi	sp,sp,-32
    800044b0:	00113c23          	sd	ra,24(sp)
    800044b4:	00813823          	sd	s0,16(sp)
    800044b8:	00913423          	sd	s1,8(sp)
    800044bc:	02010413          	addi	s0,sp,32
    800044c0:	00050493          	mv	s1,a0
    800044c4:	00002517          	auipc	a0,0x2
    800044c8:	e0c50513          	addi	a0,a0,-500 # 800062d0 <CONSOLE_STATUS+0x2c0>
    800044cc:	00004797          	auipc	a5,0x4
    800044d0:	3407ae23          	sw	zero,860(a5) # 80008828 <pr+0x18>
    800044d4:	00000097          	auipc	ra,0x0
    800044d8:	034080e7          	jalr	52(ra) # 80004508 <__printf>
    800044dc:	00048513          	mv	a0,s1
    800044e0:	00000097          	auipc	ra,0x0
    800044e4:	028080e7          	jalr	40(ra) # 80004508 <__printf>
    800044e8:	00002517          	auipc	a0,0x2
    800044ec:	c5050513          	addi	a0,a0,-944 # 80006138 <CONSOLE_STATUS+0x128>
    800044f0:	00000097          	auipc	ra,0x0
    800044f4:	018080e7          	jalr	24(ra) # 80004508 <__printf>
    800044f8:	00100793          	li	a5,1
    800044fc:	00003717          	auipc	a4,0x3
    80004500:	08f72623          	sw	a5,140(a4) # 80007588 <panicked>
    80004504:	0000006f          	j	80004504 <panic+0x58>

0000000080004508 <__printf>:
    80004508:	f3010113          	addi	sp,sp,-208
    8000450c:	08813023          	sd	s0,128(sp)
    80004510:	07313423          	sd	s3,104(sp)
    80004514:	09010413          	addi	s0,sp,144
    80004518:	05813023          	sd	s8,64(sp)
    8000451c:	08113423          	sd	ra,136(sp)
    80004520:	06913c23          	sd	s1,120(sp)
    80004524:	07213823          	sd	s2,112(sp)
    80004528:	07413023          	sd	s4,96(sp)
    8000452c:	05513c23          	sd	s5,88(sp)
    80004530:	05613823          	sd	s6,80(sp)
    80004534:	05713423          	sd	s7,72(sp)
    80004538:	03913c23          	sd	s9,56(sp)
    8000453c:	03a13823          	sd	s10,48(sp)
    80004540:	03b13423          	sd	s11,40(sp)
    80004544:	00004317          	auipc	t1,0x4
    80004548:	2cc30313          	addi	t1,t1,716 # 80008810 <pr>
    8000454c:	01832c03          	lw	s8,24(t1)
    80004550:	00b43423          	sd	a1,8(s0)
    80004554:	00c43823          	sd	a2,16(s0)
    80004558:	00d43c23          	sd	a3,24(s0)
    8000455c:	02e43023          	sd	a4,32(s0)
    80004560:	02f43423          	sd	a5,40(s0)
    80004564:	03043823          	sd	a6,48(s0)
    80004568:	03143c23          	sd	a7,56(s0)
    8000456c:	00050993          	mv	s3,a0
    80004570:	4a0c1663          	bnez	s8,80004a1c <__printf+0x514>
    80004574:	60098c63          	beqz	s3,80004b8c <__printf+0x684>
    80004578:	0009c503          	lbu	a0,0(s3)
    8000457c:	00840793          	addi	a5,s0,8
    80004580:	f6f43c23          	sd	a5,-136(s0)
    80004584:	00000493          	li	s1,0
    80004588:	22050063          	beqz	a0,800047a8 <__printf+0x2a0>
    8000458c:	00002a37          	lui	s4,0x2
    80004590:	00018ab7          	lui	s5,0x18
    80004594:	000f4b37          	lui	s6,0xf4
    80004598:	00989bb7          	lui	s7,0x989
    8000459c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800045a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800045a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800045a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800045ac:	00148c9b          	addiw	s9,s1,1
    800045b0:	02500793          	li	a5,37
    800045b4:	01998933          	add	s2,s3,s9
    800045b8:	38f51263          	bne	a0,a5,8000493c <__printf+0x434>
    800045bc:	00094783          	lbu	a5,0(s2)
    800045c0:	00078c9b          	sext.w	s9,a5
    800045c4:	1e078263          	beqz	a5,800047a8 <__printf+0x2a0>
    800045c8:	0024849b          	addiw	s1,s1,2
    800045cc:	07000713          	li	a4,112
    800045d0:	00998933          	add	s2,s3,s1
    800045d4:	38e78a63          	beq	a5,a4,80004968 <__printf+0x460>
    800045d8:	20f76863          	bltu	a4,a5,800047e8 <__printf+0x2e0>
    800045dc:	42a78863          	beq	a5,a0,80004a0c <__printf+0x504>
    800045e0:	06400713          	li	a4,100
    800045e4:	40e79663          	bne	a5,a4,800049f0 <__printf+0x4e8>
    800045e8:	f7843783          	ld	a5,-136(s0)
    800045ec:	0007a603          	lw	a2,0(a5)
    800045f0:	00878793          	addi	a5,a5,8
    800045f4:	f6f43c23          	sd	a5,-136(s0)
    800045f8:	42064a63          	bltz	a2,80004a2c <__printf+0x524>
    800045fc:	00a00713          	li	a4,10
    80004600:	02e677bb          	remuw	a5,a2,a4
    80004604:	00002d97          	auipc	s11,0x2
    80004608:	cf4d8d93          	addi	s11,s11,-780 # 800062f8 <digits>
    8000460c:	00900593          	li	a1,9
    80004610:	0006051b          	sext.w	a0,a2
    80004614:	00000c93          	li	s9,0
    80004618:	02079793          	slli	a5,a5,0x20
    8000461c:	0207d793          	srli	a5,a5,0x20
    80004620:	00fd87b3          	add	a5,s11,a5
    80004624:	0007c783          	lbu	a5,0(a5)
    80004628:	02e656bb          	divuw	a3,a2,a4
    8000462c:	f8f40023          	sb	a5,-128(s0)
    80004630:	14c5d863          	bge	a1,a2,80004780 <__printf+0x278>
    80004634:	06300593          	li	a1,99
    80004638:	00100c93          	li	s9,1
    8000463c:	02e6f7bb          	remuw	a5,a3,a4
    80004640:	02079793          	slli	a5,a5,0x20
    80004644:	0207d793          	srli	a5,a5,0x20
    80004648:	00fd87b3          	add	a5,s11,a5
    8000464c:	0007c783          	lbu	a5,0(a5)
    80004650:	02e6d73b          	divuw	a4,a3,a4
    80004654:	f8f400a3          	sb	a5,-127(s0)
    80004658:	12a5f463          	bgeu	a1,a0,80004780 <__printf+0x278>
    8000465c:	00a00693          	li	a3,10
    80004660:	00900593          	li	a1,9
    80004664:	02d777bb          	remuw	a5,a4,a3
    80004668:	02079793          	slli	a5,a5,0x20
    8000466c:	0207d793          	srli	a5,a5,0x20
    80004670:	00fd87b3          	add	a5,s11,a5
    80004674:	0007c503          	lbu	a0,0(a5)
    80004678:	02d757bb          	divuw	a5,a4,a3
    8000467c:	f8a40123          	sb	a0,-126(s0)
    80004680:	48e5f263          	bgeu	a1,a4,80004b04 <__printf+0x5fc>
    80004684:	06300513          	li	a0,99
    80004688:	02d7f5bb          	remuw	a1,a5,a3
    8000468c:	02059593          	slli	a1,a1,0x20
    80004690:	0205d593          	srli	a1,a1,0x20
    80004694:	00bd85b3          	add	a1,s11,a1
    80004698:	0005c583          	lbu	a1,0(a1)
    8000469c:	02d7d7bb          	divuw	a5,a5,a3
    800046a0:	f8b401a3          	sb	a1,-125(s0)
    800046a4:	48e57263          	bgeu	a0,a4,80004b28 <__printf+0x620>
    800046a8:	3e700513          	li	a0,999
    800046ac:	02d7f5bb          	remuw	a1,a5,a3
    800046b0:	02059593          	slli	a1,a1,0x20
    800046b4:	0205d593          	srli	a1,a1,0x20
    800046b8:	00bd85b3          	add	a1,s11,a1
    800046bc:	0005c583          	lbu	a1,0(a1)
    800046c0:	02d7d7bb          	divuw	a5,a5,a3
    800046c4:	f8b40223          	sb	a1,-124(s0)
    800046c8:	46e57663          	bgeu	a0,a4,80004b34 <__printf+0x62c>
    800046cc:	02d7f5bb          	remuw	a1,a5,a3
    800046d0:	02059593          	slli	a1,a1,0x20
    800046d4:	0205d593          	srli	a1,a1,0x20
    800046d8:	00bd85b3          	add	a1,s11,a1
    800046dc:	0005c583          	lbu	a1,0(a1)
    800046e0:	02d7d7bb          	divuw	a5,a5,a3
    800046e4:	f8b402a3          	sb	a1,-123(s0)
    800046e8:	46ea7863          	bgeu	s4,a4,80004b58 <__printf+0x650>
    800046ec:	02d7f5bb          	remuw	a1,a5,a3
    800046f0:	02059593          	slli	a1,a1,0x20
    800046f4:	0205d593          	srli	a1,a1,0x20
    800046f8:	00bd85b3          	add	a1,s11,a1
    800046fc:	0005c583          	lbu	a1,0(a1)
    80004700:	02d7d7bb          	divuw	a5,a5,a3
    80004704:	f8b40323          	sb	a1,-122(s0)
    80004708:	3eeaf863          	bgeu	s5,a4,80004af8 <__printf+0x5f0>
    8000470c:	02d7f5bb          	remuw	a1,a5,a3
    80004710:	02059593          	slli	a1,a1,0x20
    80004714:	0205d593          	srli	a1,a1,0x20
    80004718:	00bd85b3          	add	a1,s11,a1
    8000471c:	0005c583          	lbu	a1,0(a1)
    80004720:	02d7d7bb          	divuw	a5,a5,a3
    80004724:	f8b403a3          	sb	a1,-121(s0)
    80004728:	42eb7e63          	bgeu	s6,a4,80004b64 <__printf+0x65c>
    8000472c:	02d7f5bb          	remuw	a1,a5,a3
    80004730:	02059593          	slli	a1,a1,0x20
    80004734:	0205d593          	srli	a1,a1,0x20
    80004738:	00bd85b3          	add	a1,s11,a1
    8000473c:	0005c583          	lbu	a1,0(a1)
    80004740:	02d7d7bb          	divuw	a5,a5,a3
    80004744:	f8b40423          	sb	a1,-120(s0)
    80004748:	42ebfc63          	bgeu	s7,a4,80004b80 <__printf+0x678>
    8000474c:	02079793          	slli	a5,a5,0x20
    80004750:	0207d793          	srli	a5,a5,0x20
    80004754:	00fd8db3          	add	s11,s11,a5
    80004758:	000dc703          	lbu	a4,0(s11)
    8000475c:	00a00793          	li	a5,10
    80004760:	00900c93          	li	s9,9
    80004764:	f8e404a3          	sb	a4,-119(s0)
    80004768:	00065c63          	bgez	a2,80004780 <__printf+0x278>
    8000476c:	f9040713          	addi	a4,s0,-112
    80004770:	00f70733          	add	a4,a4,a5
    80004774:	02d00693          	li	a3,45
    80004778:	fed70823          	sb	a3,-16(a4)
    8000477c:	00078c93          	mv	s9,a5
    80004780:	f8040793          	addi	a5,s0,-128
    80004784:	01978cb3          	add	s9,a5,s9
    80004788:	f7f40d13          	addi	s10,s0,-129
    8000478c:	000cc503          	lbu	a0,0(s9)
    80004790:	fffc8c93          	addi	s9,s9,-1
    80004794:	00000097          	auipc	ra,0x0
    80004798:	b90080e7          	jalr	-1136(ra) # 80004324 <consputc>
    8000479c:	ffac98e3          	bne	s9,s10,8000478c <__printf+0x284>
    800047a0:	00094503          	lbu	a0,0(s2)
    800047a4:	e00514e3          	bnez	a0,800045ac <__printf+0xa4>
    800047a8:	1a0c1663          	bnez	s8,80004954 <__printf+0x44c>
    800047ac:	08813083          	ld	ra,136(sp)
    800047b0:	08013403          	ld	s0,128(sp)
    800047b4:	07813483          	ld	s1,120(sp)
    800047b8:	07013903          	ld	s2,112(sp)
    800047bc:	06813983          	ld	s3,104(sp)
    800047c0:	06013a03          	ld	s4,96(sp)
    800047c4:	05813a83          	ld	s5,88(sp)
    800047c8:	05013b03          	ld	s6,80(sp)
    800047cc:	04813b83          	ld	s7,72(sp)
    800047d0:	04013c03          	ld	s8,64(sp)
    800047d4:	03813c83          	ld	s9,56(sp)
    800047d8:	03013d03          	ld	s10,48(sp)
    800047dc:	02813d83          	ld	s11,40(sp)
    800047e0:	0d010113          	addi	sp,sp,208
    800047e4:	00008067          	ret
    800047e8:	07300713          	li	a4,115
    800047ec:	1ce78a63          	beq	a5,a4,800049c0 <__printf+0x4b8>
    800047f0:	07800713          	li	a4,120
    800047f4:	1ee79e63          	bne	a5,a4,800049f0 <__printf+0x4e8>
    800047f8:	f7843783          	ld	a5,-136(s0)
    800047fc:	0007a703          	lw	a4,0(a5)
    80004800:	00878793          	addi	a5,a5,8
    80004804:	f6f43c23          	sd	a5,-136(s0)
    80004808:	28074263          	bltz	a4,80004a8c <__printf+0x584>
    8000480c:	00002d97          	auipc	s11,0x2
    80004810:	aecd8d93          	addi	s11,s11,-1300 # 800062f8 <digits>
    80004814:	00f77793          	andi	a5,a4,15
    80004818:	00fd87b3          	add	a5,s11,a5
    8000481c:	0007c683          	lbu	a3,0(a5)
    80004820:	00f00613          	li	a2,15
    80004824:	0007079b          	sext.w	a5,a4
    80004828:	f8d40023          	sb	a3,-128(s0)
    8000482c:	0047559b          	srliw	a1,a4,0x4
    80004830:	0047569b          	srliw	a3,a4,0x4
    80004834:	00000c93          	li	s9,0
    80004838:	0ee65063          	bge	a2,a4,80004918 <__printf+0x410>
    8000483c:	00f6f693          	andi	a3,a3,15
    80004840:	00dd86b3          	add	a3,s11,a3
    80004844:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004848:	0087d79b          	srliw	a5,a5,0x8
    8000484c:	00100c93          	li	s9,1
    80004850:	f8d400a3          	sb	a3,-127(s0)
    80004854:	0cb67263          	bgeu	a2,a1,80004918 <__printf+0x410>
    80004858:	00f7f693          	andi	a3,a5,15
    8000485c:	00dd86b3          	add	a3,s11,a3
    80004860:	0006c583          	lbu	a1,0(a3)
    80004864:	00f00613          	li	a2,15
    80004868:	0047d69b          	srliw	a3,a5,0x4
    8000486c:	f8b40123          	sb	a1,-126(s0)
    80004870:	0047d593          	srli	a1,a5,0x4
    80004874:	28f67e63          	bgeu	a2,a5,80004b10 <__printf+0x608>
    80004878:	00f6f693          	andi	a3,a3,15
    8000487c:	00dd86b3          	add	a3,s11,a3
    80004880:	0006c503          	lbu	a0,0(a3)
    80004884:	0087d813          	srli	a6,a5,0x8
    80004888:	0087d69b          	srliw	a3,a5,0x8
    8000488c:	f8a401a3          	sb	a0,-125(s0)
    80004890:	28b67663          	bgeu	a2,a1,80004b1c <__printf+0x614>
    80004894:	00f6f693          	andi	a3,a3,15
    80004898:	00dd86b3          	add	a3,s11,a3
    8000489c:	0006c583          	lbu	a1,0(a3)
    800048a0:	00c7d513          	srli	a0,a5,0xc
    800048a4:	00c7d69b          	srliw	a3,a5,0xc
    800048a8:	f8b40223          	sb	a1,-124(s0)
    800048ac:	29067a63          	bgeu	a2,a6,80004b40 <__printf+0x638>
    800048b0:	00f6f693          	andi	a3,a3,15
    800048b4:	00dd86b3          	add	a3,s11,a3
    800048b8:	0006c583          	lbu	a1,0(a3)
    800048bc:	0107d813          	srli	a6,a5,0x10
    800048c0:	0107d69b          	srliw	a3,a5,0x10
    800048c4:	f8b402a3          	sb	a1,-123(s0)
    800048c8:	28a67263          	bgeu	a2,a0,80004b4c <__printf+0x644>
    800048cc:	00f6f693          	andi	a3,a3,15
    800048d0:	00dd86b3          	add	a3,s11,a3
    800048d4:	0006c683          	lbu	a3,0(a3)
    800048d8:	0147d79b          	srliw	a5,a5,0x14
    800048dc:	f8d40323          	sb	a3,-122(s0)
    800048e0:	21067663          	bgeu	a2,a6,80004aec <__printf+0x5e4>
    800048e4:	02079793          	slli	a5,a5,0x20
    800048e8:	0207d793          	srli	a5,a5,0x20
    800048ec:	00fd8db3          	add	s11,s11,a5
    800048f0:	000dc683          	lbu	a3,0(s11)
    800048f4:	00800793          	li	a5,8
    800048f8:	00700c93          	li	s9,7
    800048fc:	f8d403a3          	sb	a3,-121(s0)
    80004900:	00075c63          	bgez	a4,80004918 <__printf+0x410>
    80004904:	f9040713          	addi	a4,s0,-112
    80004908:	00f70733          	add	a4,a4,a5
    8000490c:	02d00693          	li	a3,45
    80004910:	fed70823          	sb	a3,-16(a4)
    80004914:	00078c93          	mv	s9,a5
    80004918:	f8040793          	addi	a5,s0,-128
    8000491c:	01978cb3          	add	s9,a5,s9
    80004920:	f7f40d13          	addi	s10,s0,-129
    80004924:	000cc503          	lbu	a0,0(s9)
    80004928:	fffc8c93          	addi	s9,s9,-1
    8000492c:	00000097          	auipc	ra,0x0
    80004930:	9f8080e7          	jalr	-1544(ra) # 80004324 <consputc>
    80004934:	ff9d18e3          	bne	s10,s9,80004924 <__printf+0x41c>
    80004938:	0100006f          	j	80004948 <__printf+0x440>
    8000493c:	00000097          	auipc	ra,0x0
    80004940:	9e8080e7          	jalr	-1560(ra) # 80004324 <consputc>
    80004944:	000c8493          	mv	s1,s9
    80004948:	00094503          	lbu	a0,0(s2)
    8000494c:	c60510e3          	bnez	a0,800045ac <__printf+0xa4>
    80004950:	e40c0ee3          	beqz	s8,800047ac <__printf+0x2a4>
    80004954:	00004517          	auipc	a0,0x4
    80004958:	ebc50513          	addi	a0,a0,-324 # 80008810 <pr>
    8000495c:	00001097          	auipc	ra,0x1
    80004960:	94c080e7          	jalr	-1716(ra) # 800052a8 <release>
    80004964:	e49ff06f          	j	800047ac <__printf+0x2a4>
    80004968:	f7843783          	ld	a5,-136(s0)
    8000496c:	03000513          	li	a0,48
    80004970:	01000d13          	li	s10,16
    80004974:	00878713          	addi	a4,a5,8
    80004978:	0007bc83          	ld	s9,0(a5)
    8000497c:	f6e43c23          	sd	a4,-136(s0)
    80004980:	00000097          	auipc	ra,0x0
    80004984:	9a4080e7          	jalr	-1628(ra) # 80004324 <consputc>
    80004988:	07800513          	li	a0,120
    8000498c:	00000097          	auipc	ra,0x0
    80004990:	998080e7          	jalr	-1640(ra) # 80004324 <consputc>
    80004994:	00002d97          	auipc	s11,0x2
    80004998:	964d8d93          	addi	s11,s11,-1692 # 800062f8 <digits>
    8000499c:	03ccd793          	srli	a5,s9,0x3c
    800049a0:	00fd87b3          	add	a5,s11,a5
    800049a4:	0007c503          	lbu	a0,0(a5)
    800049a8:	fffd0d1b          	addiw	s10,s10,-1
    800049ac:	004c9c93          	slli	s9,s9,0x4
    800049b0:	00000097          	auipc	ra,0x0
    800049b4:	974080e7          	jalr	-1676(ra) # 80004324 <consputc>
    800049b8:	fe0d12e3          	bnez	s10,8000499c <__printf+0x494>
    800049bc:	f8dff06f          	j	80004948 <__printf+0x440>
    800049c0:	f7843783          	ld	a5,-136(s0)
    800049c4:	0007bc83          	ld	s9,0(a5)
    800049c8:	00878793          	addi	a5,a5,8
    800049cc:	f6f43c23          	sd	a5,-136(s0)
    800049d0:	000c9a63          	bnez	s9,800049e4 <__printf+0x4dc>
    800049d4:	1080006f          	j	80004adc <__printf+0x5d4>
    800049d8:	001c8c93          	addi	s9,s9,1
    800049dc:	00000097          	auipc	ra,0x0
    800049e0:	948080e7          	jalr	-1720(ra) # 80004324 <consputc>
    800049e4:	000cc503          	lbu	a0,0(s9)
    800049e8:	fe0518e3          	bnez	a0,800049d8 <__printf+0x4d0>
    800049ec:	f5dff06f          	j	80004948 <__printf+0x440>
    800049f0:	02500513          	li	a0,37
    800049f4:	00000097          	auipc	ra,0x0
    800049f8:	930080e7          	jalr	-1744(ra) # 80004324 <consputc>
    800049fc:	000c8513          	mv	a0,s9
    80004a00:	00000097          	auipc	ra,0x0
    80004a04:	924080e7          	jalr	-1756(ra) # 80004324 <consputc>
    80004a08:	f41ff06f          	j	80004948 <__printf+0x440>
    80004a0c:	02500513          	li	a0,37
    80004a10:	00000097          	auipc	ra,0x0
    80004a14:	914080e7          	jalr	-1772(ra) # 80004324 <consputc>
    80004a18:	f31ff06f          	j	80004948 <__printf+0x440>
    80004a1c:	00030513          	mv	a0,t1
    80004a20:	00000097          	auipc	ra,0x0
    80004a24:	7bc080e7          	jalr	1980(ra) # 800051dc <acquire>
    80004a28:	b4dff06f          	j	80004574 <__printf+0x6c>
    80004a2c:	40c0053b          	negw	a0,a2
    80004a30:	00a00713          	li	a4,10
    80004a34:	02e576bb          	remuw	a3,a0,a4
    80004a38:	00002d97          	auipc	s11,0x2
    80004a3c:	8c0d8d93          	addi	s11,s11,-1856 # 800062f8 <digits>
    80004a40:	ff700593          	li	a1,-9
    80004a44:	02069693          	slli	a3,a3,0x20
    80004a48:	0206d693          	srli	a3,a3,0x20
    80004a4c:	00dd86b3          	add	a3,s11,a3
    80004a50:	0006c683          	lbu	a3,0(a3)
    80004a54:	02e557bb          	divuw	a5,a0,a4
    80004a58:	f8d40023          	sb	a3,-128(s0)
    80004a5c:	10b65e63          	bge	a2,a1,80004b78 <__printf+0x670>
    80004a60:	06300593          	li	a1,99
    80004a64:	02e7f6bb          	remuw	a3,a5,a4
    80004a68:	02069693          	slli	a3,a3,0x20
    80004a6c:	0206d693          	srli	a3,a3,0x20
    80004a70:	00dd86b3          	add	a3,s11,a3
    80004a74:	0006c683          	lbu	a3,0(a3)
    80004a78:	02e7d73b          	divuw	a4,a5,a4
    80004a7c:	00200793          	li	a5,2
    80004a80:	f8d400a3          	sb	a3,-127(s0)
    80004a84:	bca5ece3          	bltu	a1,a0,8000465c <__printf+0x154>
    80004a88:	ce5ff06f          	j	8000476c <__printf+0x264>
    80004a8c:	40e007bb          	negw	a5,a4
    80004a90:	00002d97          	auipc	s11,0x2
    80004a94:	868d8d93          	addi	s11,s11,-1944 # 800062f8 <digits>
    80004a98:	00f7f693          	andi	a3,a5,15
    80004a9c:	00dd86b3          	add	a3,s11,a3
    80004aa0:	0006c583          	lbu	a1,0(a3)
    80004aa4:	ff100613          	li	a2,-15
    80004aa8:	0047d69b          	srliw	a3,a5,0x4
    80004aac:	f8b40023          	sb	a1,-128(s0)
    80004ab0:	0047d59b          	srliw	a1,a5,0x4
    80004ab4:	0ac75e63          	bge	a4,a2,80004b70 <__printf+0x668>
    80004ab8:	00f6f693          	andi	a3,a3,15
    80004abc:	00dd86b3          	add	a3,s11,a3
    80004ac0:	0006c603          	lbu	a2,0(a3)
    80004ac4:	00f00693          	li	a3,15
    80004ac8:	0087d79b          	srliw	a5,a5,0x8
    80004acc:	f8c400a3          	sb	a2,-127(s0)
    80004ad0:	d8b6e4e3          	bltu	a3,a1,80004858 <__printf+0x350>
    80004ad4:	00200793          	li	a5,2
    80004ad8:	e2dff06f          	j	80004904 <__printf+0x3fc>
    80004adc:	00001c97          	auipc	s9,0x1
    80004ae0:	7fcc8c93          	addi	s9,s9,2044 # 800062d8 <CONSOLE_STATUS+0x2c8>
    80004ae4:	02800513          	li	a0,40
    80004ae8:	ef1ff06f          	j	800049d8 <__printf+0x4d0>
    80004aec:	00700793          	li	a5,7
    80004af0:	00600c93          	li	s9,6
    80004af4:	e0dff06f          	j	80004900 <__printf+0x3f8>
    80004af8:	00700793          	li	a5,7
    80004afc:	00600c93          	li	s9,6
    80004b00:	c69ff06f          	j	80004768 <__printf+0x260>
    80004b04:	00300793          	li	a5,3
    80004b08:	00200c93          	li	s9,2
    80004b0c:	c5dff06f          	j	80004768 <__printf+0x260>
    80004b10:	00300793          	li	a5,3
    80004b14:	00200c93          	li	s9,2
    80004b18:	de9ff06f          	j	80004900 <__printf+0x3f8>
    80004b1c:	00400793          	li	a5,4
    80004b20:	00300c93          	li	s9,3
    80004b24:	dddff06f          	j	80004900 <__printf+0x3f8>
    80004b28:	00400793          	li	a5,4
    80004b2c:	00300c93          	li	s9,3
    80004b30:	c39ff06f          	j	80004768 <__printf+0x260>
    80004b34:	00500793          	li	a5,5
    80004b38:	00400c93          	li	s9,4
    80004b3c:	c2dff06f          	j	80004768 <__printf+0x260>
    80004b40:	00500793          	li	a5,5
    80004b44:	00400c93          	li	s9,4
    80004b48:	db9ff06f          	j	80004900 <__printf+0x3f8>
    80004b4c:	00600793          	li	a5,6
    80004b50:	00500c93          	li	s9,5
    80004b54:	dadff06f          	j	80004900 <__printf+0x3f8>
    80004b58:	00600793          	li	a5,6
    80004b5c:	00500c93          	li	s9,5
    80004b60:	c09ff06f          	j	80004768 <__printf+0x260>
    80004b64:	00800793          	li	a5,8
    80004b68:	00700c93          	li	s9,7
    80004b6c:	bfdff06f          	j	80004768 <__printf+0x260>
    80004b70:	00100793          	li	a5,1
    80004b74:	d91ff06f          	j	80004904 <__printf+0x3fc>
    80004b78:	00100793          	li	a5,1
    80004b7c:	bf1ff06f          	j	8000476c <__printf+0x264>
    80004b80:	00900793          	li	a5,9
    80004b84:	00800c93          	li	s9,8
    80004b88:	be1ff06f          	j	80004768 <__printf+0x260>
    80004b8c:	00001517          	auipc	a0,0x1
    80004b90:	75450513          	addi	a0,a0,1876 # 800062e0 <CONSOLE_STATUS+0x2d0>
    80004b94:	00000097          	auipc	ra,0x0
    80004b98:	918080e7          	jalr	-1768(ra) # 800044ac <panic>

0000000080004b9c <printfinit>:
    80004b9c:	fe010113          	addi	sp,sp,-32
    80004ba0:	00813823          	sd	s0,16(sp)
    80004ba4:	00913423          	sd	s1,8(sp)
    80004ba8:	00113c23          	sd	ra,24(sp)
    80004bac:	02010413          	addi	s0,sp,32
    80004bb0:	00004497          	auipc	s1,0x4
    80004bb4:	c6048493          	addi	s1,s1,-928 # 80008810 <pr>
    80004bb8:	00048513          	mv	a0,s1
    80004bbc:	00001597          	auipc	a1,0x1
    80004bc0:	73458593          	addi	a1,a1,1844 # 800062f0 <CONSOLE_STATUS+0x2e0>
    80004bc4:	00000097          	auipc	ra,0x0
    80004bc8:	5f4080e7          	jalr	1524(ra) # 800051b8 <initlock>
    80004bcc:	01813083          	ld	ra,24(sp)
    80004bd0:	01013403          	ld	s0,16(sp)
    80004bd4:	0004ac23          	sw	zero,24(s1)
    80004bd8:	00813483          	ld	s1,8(sp)
    80004bdc:	02010113          	addi	sp,sp,32
    80004be0:	00008067          	ret

0000000080004be4 <uartinit>:
    80004be4:	ff010113          	addi	sp,sp,-16
    80004be8:	00813423          	sd	s0,8(sp)
    80004bec:	01010413          	addi	s0,sp,16
    80004bf0:	100007b7          	lui	a5,0x10000
    80004bf4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004bf8:	f8000713          	li	a4,-128
    80004bfc:	00e781a3          	sb	a4,3(a5)
    80004c00:	00300713          	li	a4,3
    80004c04:	00e78023          	sb	a4,0(a5)
    80004c08:	000780a3          	sb	zero,1(a5)
    80004c0c:	00e781a3          	sb	a4,3(a5)
    80004c10:	00700693          	li	a3,7
    80004c14:	00d78123          	sb	a3,2(a5)
    80004c18:	00e780a3          	sb	a4,1(a5)
    80004c1c:	00813403          	ld	s0,8(sp)
    80004c20:	01010113          	addi	sp,sp,16
    80004c24:	00008067          	ret

0000000080004c28 <uartputc>:
    80004c28:	00003797          	auipc	a5,0x3
    80004c2c:	9607a783          	lw	a5,-1696(a5) # 80007588 <panicked>
    80004c30:	00078463          	beqz	a5,80004c38 <uartputc+0x10>
    80004c34:	0000006f          	j	80004c34 <uartputc+0xc>
    80004c38:	fd010113          	addi	sp,sp,-48
    80004c3c:	02813023          	sd	s0,32(sp)
    80004c40:	00913c23          	sd	s1,24(sp)
    80004c44:	01213823          	sd	s2,16(sp)
    80004c48:	01313423          	sd	s3,8(sp)
    80004c4c:	02113423          	sd	ra,40(sp)
    80004c50:	03010413          	addi	s0,sp,48
    80004c54:	00003917          	auipc	s2,0x3
    80004c58:	93c90913          	addi	s2,s2,-1732 # 80007590 <uart_tx_r>
    80004c5c:	00093783          	ld	a5,0(s2)
    80004c60:	00003497          	auipc	s1,0x3
    80004c64:	93848493          	addi	s1,s1,-1736 # 80007598 <uart_tx_w>
    80004c68:	0004b703          	ld	a4,0(s1)
    80004c6c:	02078693          	addi	a3,a5,32
    80004c70:	00050993          	mv	s3,a0
    80004c74:	02e69c63          	bne	a3,a4,80004cac <uartputc+0x84>
    80004c78:	00001097          	auipc	ra,0x1
    80004c7c:	834080e7          	jalr	-1996(ra) # 800054ac <push_on>
    80004c80:	00093783          	ld	a5,0(s2)
    80004c84:	0004b703          	ld	a4,0(s1)
    80004c88:	02078793          	addi	a5,a5,32
    80004c8c:	00e79463          	bne	a5,a4,80004c94 <uartputc+0x6c>
    80004c90:	0000006f          	j	80004c90 <uartputc+0x68>
    80004c94:	00001097          	auipc	ra,0x1
    80004c98:	88c080e7          	jalr	-1908(ra) # 80005520 <pop_on>
    80004c9c:	00093783          	ld	a5,0(s2)
    80004ca0:	0004b703          	ld	a4,0(s1)
    80004ca4:	02078693          	addi	a3,a5,32
    80004ca8:	fce688e3          	beq	a3,a4,80004c78 <uartputc+0x50>
    80004cac:	01f77693          	andi	a3,a4,31
    80004cb0:	00004597          	auipc	a1,0x4
    80004cb4:	b8058593          	addi	a1,a1,-1152 # 80008830 <uart_tx_buf>
    80004cb8:	00d586b3          	add	a3,a1,a3
    80004cbc:	00170713          	addi	a4,a4,1
    80004cc0:	01368023          	sb	s3,0(a3)
    80004cc4:	00e4b023          	sd	a4,0(s1)
    80004cc8:	10000637          	lui	a2,0x10000
    80004ccc:	02f71063          	bne	a4,a5,80004cec <uartputc+0xc4>
    80004cd0:	0340006f          	j	80004d04 <uartputc+0xdc>
    80004cd4:	00074703          	lbu	a4,0(a4)
    80004cd8:	00f93023          	sd	a5,0(s2)
    80004cdc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004ce0:	00093783          	ld	a5,0(s2)
    80004ce4:	0004b703          	ld	a4,0(s1)
    80004ce8:	00f70e63          	beq	a4,a5,80004d04 <uartputc+0xdc>
    80004cec:	00564683          	lbu	a3,5(a2)
    80004cf0:	01f7f713          	andi	a4,a5,31
    80004cf4:	00e58733          	add	a4,a1,a4
    80004cf8:	0206f693          	andi	a3,a3,32
    80004cfc:	00178793          	addi	a5,a5,1
    80004d00:	fc069ae3          	bnez	a3,80004cd4 <uartputc+0xac>
    80004d04:	02813083          	ld	ra,40(sp)
    80004d08:	02013403          	ld	s0,32(sp)
    80004d0c:	01813483          	ld	s1,24(sp)
    80004d10:	01013903          	ld	s2,16(sp)
    80004d14:	00813983          	ld	s3,8(sp)
    80004d18:	03010113          	addi	sp,sp,48
    80004d1c:	00008067          	ret

0000000080004d20 <uartputc_sync>:
    80004d20:	ff010113          	addi	sp,sp,-16
    80004d24:	00813423          	sd	s0,8(sp)
    80004d28:	01010413          	addi	s0,sp,16
    80004d2c:	00003717          	auipc	a4,0x3
    80004d30:	85c72703          	lw	a4,-1956(a4) # 80007588 <panicked>
    80004d34:	02071663          	bnez	a4,80004d60 <uartputc_sync+0x40>
    80004d38:	00050793          	mv	a5,a0
    80004d3c:	100006b7          	lui	a3,0x10000
    80004d40:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004d44:	02077713          	andi	a4,a4,32
    80004d48:	fe070ce3          	beqz	a4,80004d40 <uartputc_sync+0x20>
    80004d4c:	0ff7f793          	andi	a5,a5,255
    80004d50:	00f68023          	sb	a5,0(a3)
    80004d54:	00813403          	ld	s0,8(sp)
    80004d58:	01010113          	addi	sp,sp,16
    80004d5c:	00008067          	ret
    80004d60:	0000006f          	j	80004d60 <uartputc_sync+0x40>

0000000080004d64 <uartstart>:
    80004d64:	ff010113          	addi	sp,sp,-16
    80004d68:	00813423          	sd	s0,8(sp)
    80004d6c:	01010413          	addi	s0,sp,16
    80004d70:	00003617          	auipc	a2,0x3
    80004d74:	82060613          	addi	a2,a2,-2016 # 80007590 <uart_tx_r>
    80004d78:	00003517          	auipc	a0,0x3
    80004d7c:	82050513          	addi	a0,a0,-2016 # 80007598 <uart_tx_w>
    80004d80:	00063783          	ld	a5,0(a2)
    80004d84:	00053703          	ld	a4,0(a0)
    80004d88:	04f70263          	beq	a4,a5,80004dcc <uartstart+0x68>
    80004d8c:	100005b7          	lui	a1,0x10000
    80004d90:	00004817          	auipc	a6,0x4
    80004d94:	aa080813          	addi	a6,a6,-1376 # 80008830 <uart_tx_buf>
    80004d98:	01c0006f          	j	80004db4 <uartstart+0x50>
    80004d9c:	0006c703          	lbu	a4,0(a3)
    80004da0:	00f63023          	sd	a5,0(a2)
    80004da4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004da8:	00063783          	ld	a5,0(a2)
    80004dac:	00053703          	ld	a4,0(a0)
    80004db0:	00f70e63          	beq	a4,a5,80004dcc <uartstart+0x68>
    80004db4:	01f7f713          	andi	a4,a5,31
    80004db8:	00e806b3          	add	a3,a6,a4
    80004dbc:	0055c703          	lbu	a4,5(a1)
    80004dc0:	00178793          	addi	a5,a5,1
    80004dc4:	02077713          	andi	a4,a4,32
    80004dc8:	fc071ae3          	bnez	a4,80004d9c <uartstart+0x38>
    80004dcc:	00813403          	ld	s0,8(sp)
    80004dd0:	01010113          	addi	sp,sp,16
    80004dd4:	00008067          	ret

0000000080004dd8 <uartgetc>:
    80004dd8:	ff010113          	addi	sp,sp,-16
    80004ddc:	00813423          	sd	s0,8(sp)
    80004de0:	01010413          	addi	s0,sp,16
    80004de4:	10000737          	lui	a4,0x10000
    80004de8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80004dec:	0017f793          	andi	a5,a5,1
    80004df0:	00078c63          	beqz	a5,80004e08 <uartgetc+0x30>
    80004df4:	00074503          	lbu	a0,0(a4)
    80004df8:	0ff57513          	andi	a0,a0,255
    80004dfc:	00813403          	ld	s0,8(sp)
    80004e00:	01010113          	addi	sp,sp,16
    80004e04:	00008067          	ret
    80004e08:	fff00513          	li	a0,-1
    80004e0c:	ff1ff06f          	j	80004dfc <uartgetc+0x24>

0000000080004e10 <uartintr>:
    80004e10:	100007b7          	lui	a5,0x10000
    80004e14:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004e18:	0017f793          	andi	a5,a5,1
    80004e1c:	0a078463          	beqz	a5,80004ec4 <uartintr+0xb4>
    80004e20:	fe010113          	addi	sp,sp,-32
    80004e24:	00813823          	sd	s0,16(sp)
    80004e28:	00913423          	sd	s1,8(sp)
    80004e2c:	00113c23          	sd	ra,24(sp)
    80004e30:	02010413          	addi	s0,sp,32
    80004e34:	100004b7          	lui	s1,0x10000
    80004e38:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80004e3c:	0ff57513          	andi	a0,a0,255
    80004e40:	fffff097          	auipc	ra,0xfffff
    80004e44:	534080e7          	jalr	1332(ra) # 80004374 <consoleintr>
    80004e48:	0054c783          	lbu	a5,5(s1)
    80004e4c:	0017f793          	andi	a5,a5,1
    80004e50:	fe0794e3          	bnez	a5,80004e38 <uartintr+0x28>
    80004e54:	00002617          	auipc	a2,0x2
    80004e58:	73c60613          	addi	a2,a2,1852 # 80007590 <uart_tx_r>
    80004e5c:	00002517          	auipc	a0,0x2
    80004e60:	73c50513          	addi	a0,a0,1852 # 80007598 <uart_tx_w>
    80004e64:	00063783          	ld	a5,0(a2)
    80004e68:	00053703          	ld	a4,0(a0)
    80004e6c:	04f70263          	beq	a4,a5,80004eb0 <uartintr+0xa0>
    80004e70:	100005b7          	lui	a1,0x10000
    80004e74:	00004817          	auipc	a6,0x4
    80004e78:	9bc80813          	addi	a6,a6,-1604 # 80008830 <uart_tx_buf>
    80004e7c:	01c0006f          	j	80004e98 <uartintr+0x88>
    80004e80:	0006c703          	lbu	a4,0(a3)
    80004e84:	00f63023          	sd	a5,0(a2)
    80004e88:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004e8c:	00063783          	ld	a5,0(a2)
    80004e90:	00053703          	ld	a4,0(a0)
    80004e94:	00f70e63          	beq	a4,a5,80004eb0 <uartintr+0xa0>
    80004e98:	01f7f713          	andi	a4,a5,31
    80004e9c:	00e806b3          	add	a3,a6,a4
    80004ea0:	0055c703          	lbu	a4,5(a1)
    80004ea4:	00178793          	addi	a5,a5,1
    80004ea8:	02077713          	andi	a4,a4,32
    80004eac:	fc071ae3          	bnez	a4,80004e80 <uartintr+0x70>
    80004eb0:	01813083          	ld	ra,24(sp)
    80004eb4:	01013403          	ld	s0,16(sp)
    80004eb8:	00813483          	ld	s1,8(sp)
    80004ebc:	02010113          	addi	sp,sp,32
    80004ec0:	00008067          	ret
    80004ec4:	00002617          	auipc	a2,0x2
    80004ec8:	6cc60613          	addi	a2,a2,1740 # 80007590 <uart_tx_r>
    80004ecc:	00002517          	auipc	a0,0x2
    80004ed0:	6cc50513          	addi	a0,a0,1740 # 80007598 <uart_tx_w>
    80004ed4:	00063783          	ld	a5,0(a2)
    80004ed8:	00053703          	ld	a4,0(a0)
    80004edc:	04f70263          	beq	a4,a5,80004f20 <uartintr+0x110>
    80004ee0:	100005b7          	lui	a1,0x10000
    80004ee4:	00004817          	auipc	a6,0x4
    80004ee8:	94c80813          	addi	a6,a6,-1716 # 80008830 <uart_tx_buf>
    80004eec:	01c0006f          	j	80004f08 <uartintr+0xf8>
    80004ef0:	0006c703          	lbu	a4,0(a3)
    80004ef4:	00f63023          	sd	a5,0(a2)
    80004ef8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004efc:	00063783          	ld	a5,0(a2)
    80004f00:	00053703          	ld	a4,0(a0)
    80004f04:	02f70063          	beq	a4,a5,80004f24 <uartintr+0x114>
    80004f08:	01f7f713          	andi	a4,a5,31
    80004f0c:	00e806b3          	add	a3,a6,a4
    80004f10:	0055c703          	lbu	a4,5(a1)
    80004f14:	00178793          	addi	a5,a5,1
    80004f18:	02077713          	andi	a4,a4,32
    80004f1c:	fc071ae3          	bnez	a4,80004ef0 <uartintr+0xe0>
    80004f20:	00008067          	ret
    80004f24:	00008067          	ret

0000000080004f28 <kinit>:
    80004f28:	fc010113          	addi	sp,sp,-64
    80004f2c:	02913423          	sd	s1,40(sp)
    80004f30:	fffff7b7          	lui	a5,0xfffff
    80004f34:	00005497          	auipc	s1,0x5
    80004f38:	91b48493          	addi	s1,s1,-1765 # 8000984f <end+0xfff>
    80004f3c:	02813823          	sd	s0,48(sp)
    80004f40:	01313c23          	sd	s3,24(sp)
    80004f44:	00f4f4b3          	and	s1,s1,a5
    80004f48:	02113c23          	sd	ra,56(sp)
    80004f4c:	03213023          	sd	s2,32(sp)
    80004f50:	01413823          	sd	s4,16(sp)
    80004f54:	01513423          	sd	s5,8(sp)
    80004f58:	04010413          	addi	s0,sp,64
    80004f5c:	000017b7          	lui	a5,0x1
    80004f60:	01100993          	li	s3,17
    80004f64:	00f487b3          	add	a5,s1,a5
    80004f68:	01b99993          	slli	s3,s3,0x1b
    80004f6c:	06f9e063          	bltu	s3,a5,80004fcc <kinit+0xa4>
    80004f70:	00004a97          	auipc	s5,0x4
    80004f74:	8e0a8a93          	addi	s5,s5,-1824 # 80008850 <end>
    80004f78:	0754ec63          	bltu	s1,s5,80004ff0 <kinit+0xc8>
    80004f7c:	0734fa63          	bgeu	s1,s3,80004ff0 <kinit+0xc8>
    80004f80:	00088a37          	lui	s4,0x88
    80004f84:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004f88:	00002917          	auipc	s2,0x2
    80004f8c:	61890913          	addi	s2,s2,1560 # 800075a0 <kmem>
    80004f90:	00ca1a13          	slli	s4,s4,0xc
    80004f94:	0140006f          	j	80004fa8 <kinit+0x80>
    80004f98:	000017b7          	lui	a5,0x1
    80004f9c:	00f484b3          	add	s1,s1,a5
    80004fa0:	0554e863          	bltu	s1,s5,80004ff0 <kinit+0xc8>
    80004fa4:	0534f663          	bgeu	s1,s3,80004ff0 <kinit+0xc8>
    80004fa8:	00001637          	lui	a2,0x1
    80004fac:	00100593          	li	a1,1
    80004fb0:	00048513          	mv	a0,s1
    80004fb4:	00000097          	auipc	ra,0x0
    80004fb8:	5e4080e7          	jalr	1508(ra) # 80005598 <__memset>
    80004fbc:	00093783          	ld	a5,0(s2)
    80004fc0:	00f4b023          	sd	a5,0(s1)
    80004fc4:	00993023          	sd	s1,0(s2)
    80004fc8:	fd4498e3          	bne	s1,s4,80004f98 <kinit+0x70>
    80004fcc:	03813083          	ld	ra,56(sp)
    80004fd0:	03013403          	ld	s0,48(sp)
    80004fd4:	02813483          	ld	s1,40(sp)
    80004fd8:	02013903          	ld	s2,32(sp)
    80004fdc:	01813983          	ld	s3,24(sp)
    80004fe0:	01013a03          	ld	s4,16(sp)
    80004fe4:	00813a83          	ld	s5,8(sp)
    80004fe8:	04010113          	addi	sp,sp,64
    80004fec:	00008067          	ret
    80004ff0:	00001517          	auipc	a0,0x1
    80004ff4:	32050513          	addi	a0,a0,800 # 80006310 <digits+0x18>
    80004ff8:	fffff097          	auipc	ra,0xfffff
    80004ffc:	4b4080e7          	jalr	1204(ra) # 800044ac <panic>

0000000080005000 <freerange>:
    80005000:	fc010113          	addi	sp,sp,-64
    80005004:	000017b7          	lui	a5,0x1
    80005008:	02913423          	sd	s1,40(sp)
    8000500c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005010:	009504b3          	add	s1,a0,s1
    80005014:	fffff537          	lui	a0,0xfffff
    80005018:	02813823          	sd	s0,48(sp)
    8000501c:	02113c23          	sd	ra,56(sp)
    80005020:	03213023          	sd	s2,32(sp)
    80005024:	01313c23          	sd	s3,24(sp)
    80005028:	01413823          	sd	s4,16(sp)
    8000502c:	01513423          	sd	s5,8(sp)
    80005030:	01613023          	sd	s6,0(sp)
    80005034:	04010413          	addi	s0,sp,64
    80005038:	00a4f4b3          	and	s1,s1,a0
    8000503c:	00f487b3          	add	a5,s1,a5
    80005040:	06f5e463          	bltu	a1,a5,800050a8 <freerange+0xa8>
    80005044:	00004a97          	auipc	s5,0x4
    80005048:	80ca8a93          	addi	s5,s5,-2036 # 80008850 <end>
    8000504c:	0954e263          	bltu	s1,s5,800050d0 <freerange+0xd0>
    80005050:	01100993          	li	s3,17
    80005054:	01b99993          	slli	s3,s3,0x1b
    80005058:	0734fc63          	bgeu	s1,s3,800050d0 <freerange+0xd0>
    8000505c:	00058a13          	mv	s4,a1
    80005060:	00002917          	auipc	s2,0x2
    80005064:	54090913          	addi	s2,s2,1344 # 800075a0 <kmem>
    80005068:	00002b37          	lui	s6,0x2
    8000506c:	0140006f          	j	80005080 <freerange+0x80>
    80005070:	000017b7          	lui	a5,0x1
    80005074:	00f484b3          	add	s1,s1,a5
    80005078:	0554ec63          	bltu	s1,s5,800050d0 <freerange+0xd0>
    8000507c:	0534fa63          	bgeu	s1,s3,800050d0 <freerange+0xd0>
    80005080:	00001637          	lui	a2,0x1
    80005084:	00100593          	li	a1,1
    80005088:	00048513          	mv	a0,s1
    8000508c:	00000097          	auipc	ra,0x0
    80005090:	50c080e7          	jalr	1292(ra) # 80005598 <__memset>
    80005094:	00093703          	ld	a4,0(s2)
    80005098:	016487b3          	add	a5,s1,s6
    8000509c:	00e4b023          	sd	a4,0(s1)
    800050a0:	00993023          	sd	s1,0(s2)
    800050a4:	fcfa76e3          	bgeu	s4,a5,80005070 <freerange+0x70>
    800050a8:	03813083          	ld	ra,56(sp)
    800050ac:	03013403          	ld	s0,48(sp)
    800050b0:	02813483          	ld	s1,40(sp)
    800050b4:	02013903          	ld	s2,32(sp)
    800050b8:	01813983          	ld	s3,24(sp)
    800050bc:	01013a03          	ld	s4,16(sp)
    800050c0:	00813a83          	ld	s5,8(sp)
    800050c4:	00013b03          	ld	s6,0(sp)
    800050c8:	04010113          	addi	sp,sp,64
    800050cc:	00008067          	ret
    800050d0:	00001517          	auipc	a0,0x1
    800050d4:	24050513          	addi	a0,a0,576 # 80006310 <digits+0x18>
    800050d8:	fffff097          	auipc	ra,0xfffff
    800050dc:	3d4080e7          	jalr	980(ra) # 800044ac <panic>

00000000800050e0 <kfree>:
    800050e0:	fe010113          	addi	sp,sp,-32
    800050e4:	00813823          	sd	s0,16(sp)
    800050e8:	00113c23          	sd	ra,24(sp)
    800050ec:	00913423          	sd	s1,8(sp)
    800050f0:	02010413          	addi	s0,sp,32
    800050f4:	03451793          	slli	a5,a0,0x34
    800050f8:	04079c63          	bnez	a5,80005150 <kfree+0x70>
    800050fc:	00003797          	auipc	a5,0x3
    80005100:	75478793          	addi	a5,a5,1876 # 80008850 <end>
    80005104:	00050493          	mv	s1,a0
    80005108:	04f56463          	bltu	a0,a5,80005150 <kfree+0x70>
    8000510c:	01100793          	li	a5,17
    80005110:	01b79793          	slli	a5,a5,0x1b
    80005114:	02f57e63          	bgeu	a0,a5,80005150 <kfree+0x70>
    80005118:	00001637          	lui	a2,0x1
    8000511c:	00100593          	li	a1,1
    80005120:	00000097          	auipc	ra,0x0
    80005124:	478080e7          	jalr	1144(ra) # 80005598 <__memset>
    80005128:	00002797          	auipc	a5,0x2
    8000512c:	47878793          	addi	a5,a5,1144 # 800075a0 <kmem>
    80005130:	0007b703          	ld	a4,0(a5)
    80005134:	01813083          	ld	ra,24(sp)
    80005138:	01013403          	ld	s0,16(sp)
    8000513c:	00e4b023          	sd	a4,0(s1)
    80005140:	0097b023          	sd	s1,0(a5)
    80005144:	00813483          	ld	s1,8(sp)
    80005148:	02010113          	addi	sp,sp,32
    8000514c:	00008067          	ret
    80005150:	00001517          	auipc	a0,0x1
    80005154:	1c050513          	addi	a0,a0,448 # 80006310 <digits+0x18>
    80005158:	fffff097          	auipc	ra,0xfffff
    8000515c:	354080e7          	jalr	852(ra) # 800044ac <panic>

0000000080005160 <kalloc>:
    80005160:	fe010113          	addi	sp,sp,-32
    80005164:	00813823          	sd	s0,16(sp)
    80005168:	00913423          	sd	s1,8(sp)
    8000516c:	00113c23          	sd	ra,24(sp)
    80005170:	02010413          	addi	s0,sp,32
    80005174:	00002797          	auipc	a5,0x2
    80005178:	42c78793          	addi	a5,a5,1068 # 800075a0 <kmem>
    8000517c:	0007b483          	ld	s1,0(a5)
    80005180:	02048063          	beqz	s1,800051a0 <kalloc+0x40>
    80005184:	0004b703          	ld	a4,0(s1)
    80005188:	00001637          	lui	a2,0x1
    8000518c:	00500593          	li	a1,5
    80005190:	00048513          	mv	a0,s1
    80005194:	00e7b023          	sd	a4,0(a5)
    80005198:	00000097          	auipc	ra,0x0
    8000519c:	400080e7          	jalr	1024(ra) # 80005598 <__memset>
    800051a0:	01813083          	ld	ra,24(sp)
    800051a4:	01013403          	ld	s0,16(sp)
    800051a8:	00048513          	mv	a0,s1
    800051ac:	00813483          	ld	s1,8(sp)
    800051b0:	02010113          	addi	sp,sp,32
    800051b4:	00008067          	ret

00000000800051b8 <initlock>:
    800051b8:	ff010113          	addi	sp,sp,-16
    800051bc:	00813423          	sd	s0,8(sp)
    800051c0:	01010413          	addi	s0,sp,16
    800051c4:	00813403          	ld	s0,8(sp)
    800051c8:	00b53423          	sd	a1,8(a0)
    800051cc:	00052023          	sw	zero,0(a0)
    800051d0:	00053823          	sd	zero,16(a0)
    800051d4:	01010113          	addi	sp,sp,16
    800051d8:	00008067          	ret

00000000800051dc <acquire>:
    800051dc:	fe010113          	addi	sp,sp,-32
    800051e0:	00813823          	sd	s0,16(sp)
    800051e4:	00913423          	sd	s1,8(sp)
    800051e8:	00113c23          	sd	ra,24(sp)
    800051ec:	01213023          	sd	s2,0(sp)
    800051f0:	02010413          	addi	s0,sp,32
    800051f4:	00050493          	mv	s1,a0
    800051f8:	10002973          	csrr	s2,sstatus
    800051fc:	100027f3          	csrr	a5,sstatus
    80005200:	ffd7f793          	andi	a5,a5,-3
    80005204:	10079073          	csrw	sstatus,a5
    80005208:	fffff097          	auipc	ra,0xfffff
    8000520c:	8e0080e7          	jalr	-1824(ra) # 80003ae8 <mycpu>
    80005210:	07852783          	lw	a5,120(a0)
    80005214:	06078e63          	beqz	a5,80005290 <acquire+0xb4>
    80005218:	fffff097          	auipc	ra,0xfffff
    8000521c:	8d0080e7          	jalr	-1840(ra) # 80003ae8 <mycpu>
    80005220:	07852783          	lw	a5,120(a0)
    80005224:	0004a703          	lw	a4,0(s1)
    80005228:	0017879b          	addiw	a5,a5,1
    8000522c:	06f52c23          	sw	a5,120(a0)
    80005230:	04071063          	bnez	a4,80005270 <acquire+0x94>
    80005234:	00100713          	li	a4,1
    80005238:	00070793          	mv	a5,a4
    8000523c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005240:	0007879b          	sext.w	a5,a5
    80005244:	fe079ae3          	bnez	a5,80005238 <acquire+0x5c>
    80005248:	0ff0000f          	fence
    8000524c:	fffff097          	auipc	ra,0xfffff
    80005250:	89c080e7          	jalr	-1892(ra) # 80003ae8 <mycpu>
    80005254:	01813083          	ld	ra,24(sp)
    80005258:	01013403          	ld	s0,16(sp)
    8000525c:	00a4b823          	sd	a0,16(s1)
    80005260:	00013903          	ld	s2,0(sp)
    80005264:	00813483          	ld	s1,8(sp)
    80005268:	02010113          	addi	sp,sp,32
    8000526c:	00008067          	ret
    80005270:	0104b903          	ld	s2,16(s1)
    80005274:	fffff097          	auipc	ra,0xfffff
    80005278:	874080e7          	jalr	-1932(ra) # 80003ae8 <mycpu>
    8000527c:	faa91ce3          	bne	s2,a0,80005234 <acquire+0x58>
    80005280:	00001517          	auipc	a0,0x1
    80005284:	09850513          	addi	a0,a0,152 # 80006318 <digits+0x20>
    80005288:	fffff097          	auipc	ra,0xfffff
    8000528c:	224080e7          	jalr	548(ra) # 800044ac <panic>
    80005290:	00195913          	srli	s2,s2,0x1
    80005294:	fffff097          	auipc	ra,0xfffff
    80005298:	854080e7          	jalr	-1964(ra) # 80003ae8 <mycpu>
    8000529c:	00197913          	andi	s2,s2,1
    800052a0:	07252e23          	sw	s2,124(a0)
    800052a4:	f75ff06f          	j	80005218 <acquire+0x3c>

00000000800052a8 <release>:
    800052a8:	fe010113          	addi	sp,sp,-32
    800052ac:	00813823          	sd	s0,16(sp)
    800052b0:	00113c23          	sd	ra,24(sp)
    800052b4:	00913423          	sd	s1,8(sp)
    800052b8:	01213023          	sd	s2,0(sp)
    800052bc:	02010413          	addi	s0,sp,32
    800052c0:	00052783          	lw	a5,0(a0)
    800052c4:	00079a63          	bnez	a5,800052d8 <release+0x30>
    800052c8:	00001517          	auipc	a0,0x1
    800052cc:	05850513          	addi	a0,a0,88 # 80006320 <digits+0x28>
    800052d0:	fffff097          	auipc	ra,0xfffff
    800052d4:	1dc080e7          	jalr	476(ra) # 800044ac <panic>
    800052d8:	01053903          	ld	s2,16(a0)
    800052dc:	00050493          	mv	s1,a0
    800052e0:	fffff097          	auipc	ra,0xfffff
    800052e4:	808080e7          	jalr	-2040(ra) # 80003ae8 <mycpu>
    800052e8:	fea910e3          	bne	s2,a0,800052c8 <release+0x20>
    800052ec:	0004b823          	sd	zero,16(s1)
    800052f0:	0ff0000f          	fence
    800052f4:	0f50000f          	fence	iorw,ow
    800052f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800052fc:	ffffe097          	auipc	ra,0xffffe
    80005300:	7ec080e7          	jalr	2028(ra) # 80003ae8 <mycpu>
    80005304:	100027f3          	csrr	a5,sstatus
    80005308:	0027f793          	andi	a5,a5,2
    8000530c:	04079a63          	bnez	a5,80005360 <release+0xb8>
    80005310:	07852783          	lw	a5,120(a0)
    80005314:	02f05e63          	blez	a5,80005350 <release+0xa8>
    80005318:	fff7871b          	addiw	a4,a5,-1
    8000531c:	06e52c23          	sw	a4,120(a0)
    80005320:	00071c63          	bnez	a4,80005338 <release+0x90>
    80005324:	07c52783          	lw	a5,124(a0)
    80005328:	00078863          	beqz	a5,80005338 <release+0x90>
    8000532c:	100027f3          	csrr	a5,sstatus
    80005330:	0027e793          	ori	a5,a5,2
    80005334:	10079073          	csrw	sstatus,a5
    80005338:	01813083          	ld	ra,24(sp)
    8000533c:	01013403          	ld	s0,16(sp)
    80005340:	00813483          	ld	s1,8(sp)
    80005344:	00013903          	ld	s2,0(sp)
    80005348:	02010113          	addi	sp,sp,32
    8000534c:	00008067          	ret
    80005350:	00001517          	auipc	a0,0x1
    80005354:	ff050513          	addi	a0,a0,-16 # 80006340 <digits+0x48>
    80005358:	fffff097          	auipc	ra,0xfffff
    8000535c:	154080e7          	jalr	340(ra) # 800044ac <panic>
    80005360:	00001517          	auipc	a0,0x1
    80005364:	fc850513          	addi	a0,a0,-56 # 80006328 <digits+0x30>
    80005368:	fffff097          	auipc	ra,0xfffff
    8000536c:	144080e7          	jalr	324(ra) # 800044ac <panic>

0000000080005370 <holding>:
    80005370:	00052783          	lw	a5,0(a0)
    80005374:	00079663          	bnez	a5,80005380 <holding+0x10>
    80005378:	00000513          	li	a0,0
    8000537c:	00008067          	ret
    80005380:	fe010113          	addi	sp,sp,-32
    80005384:	00813823          	sd	s0,16(sp)
    80005388:	00913423          	sd	s1,8(sp)
    8000538c:	00113c23          	sd	ra,24(sp)
    80005390:	02010413          	addi	s0,sp,32
    80005394:	01053483          	ld	s1,16(a0)
    80005398:	ffffe097          	auipc	ra,0xffffe
    8000539c:	750080e7          	jalr	1872(ra) # 80003ae8 <mycpu>
    800053a0:	01813083          	ld	ra,24(sp)
    800053a4:	01013403          	ld	s0,16(sp)
    800053a8:	40a48533          	sub	a0,s1,a0
    800053ac:	00153513          	seqz	a0,a0
    800053b0:	00813483          	ld	s1,8(sp)
    800053b4:	02010113          	addi	sp,sp,32
    800053b8:	00008067          	ret

00000000800053bc <push_off>:
    800053bc:	fe010113          	addi	sp,sp,-32
    800053c0:	00813823          	sd	s0,16(sp)
    800053c4:	00113c23          	sd	ra,24(sp)
    800053c8:	00913423          	sd	s1,8(sp)
    800053cc:	02010413          	addi	s0,sp,32
    800053d0:	100024f3          	csrr	s1,sstatus
    800053d4:	100027f3          	csrr	a5,sstatus
    800053d8:	ffd7f793          	andi	a5,a5,-3
    800053dc:	10079073          	csrw	sstatus,a5
    800053e0:	ffffe097          	auipc	ra,0xffffe
    800053e4:	708080e7          	jalr	1800(ra) # 80003ae8 <mycpu>
    800053e8:	07852783          	lw	a5,120(a0)
    800053ec:	02078663          	beqz	a5,80005418 <push_off+0x5c>
    800053f0:	ffffe097          	auipc	ra,0xffffe
    800053f4:	6f8080e7          	jalr	1784(ra) # 80003ae8 <mycpu>
    800053f8:	07852783          	lw	a5,120(a0)
    800053fc:	01813083          	ld	ra,24(sp)
    80005400:	01013403          	ld	s0,16(sp)
    80005404:	0017879b          	addiw	a5,a5,1
    80005408:	06f52c23          	sw	a5,120(a0)
    8000540c:	00813483          	ld	s1,8(sp)
    80005410:	02010113          	addi	sp,sp,32
    80005414:	00008067          	ret
    80005418:	0014d493          	srli	s1,s1,0x1
    8000541c:	ffffe097          	auipc	ra,0xffffe
    80005420:	6cc080e7          	jalr	1740(ra) # 80003ae8 <mycpu>
    80005424:	0014f493          	andi	s1,s1,1
    80005428:	06952e23          	sw	s1,124(a0)
    8000542c:	fc5ff06f          	j	800053f0 <push_off+0x34>

0000000080005430 <pop_off>:
    80005430:	ff010113          	addi	sp,sp,-16
    80005434:	00813023          	sd	s0,0(sp)
    80005438:	00113423          	sd	ra,8(sp)
    8000543c:	01010413          	addi	s0,sp,16
    80005440:	ffffe097          	auipc	ra,0xffffe
    80005444:	6a8080e7          	jalr	1704(ra) # 80003ae8 <mycpu>
    80005448:	100027f3          	csrr	a5,sstatus
    8000544c:	0027f793          	andi	a5,a5,2
    80005450:	04079663          	bnez	a5,8000549c <pop_off+0x6c>
    80005454:	07852783          	lw	a5,120(a0)
    80005458:	02f05a63          	blez	a5,8000548c <pop_off+0x5c>
    8000545c:	fff7871b          	addiw	a4,a5,-1
    80005460:	06e52c23          	sw	a4,120(a0)
    80005464:	00071c63          	bnez	a4,8000547c <pop_off+0x4c>
    80005468:	07c52783          	lw	a5,124(a0)
    8000546c:	00078863          	beqz	a5,8000547c <pop_off+0x4c>
    80005470:	100027f3          	csrr	a5,sstatus
    80005474:	0027e793          	ori	a5,a5,2
    80005478:	10079073          	csrw	sstatus,a5
    8000547c:	00813083          	ld	ra,8(sp)
    80005480:	00013403          	ld	s0,0(sp)
    80005484:	01010113          	addi	sp,sp,16
    80005488:	00008067          	ret
    8000548c:	00001517          	auipc	a0,0x1
    80005490:	eb450513          	addi	a0,a0,-332 # 80006340 <digits+0x48>
    80005494:	fffff097          	auipc	ra,0xfffff
    80005498:	018080e7          	jalr	24(ra) # 800044ac <panic>
    8000549c:	00001517          	auipc	a0,0x1
    800054a0:	e8c50513          	addi	a0,a0,-372 # 80006328 <digits+0x30>
    800054a4:	fffff097          	auipc	ra,0xfffff
    800054a8:	008080e7          	jalr	8(ra) # 800044ac <panic>

00000000800054ac <push_on>:
    800054ac:	fe010113          	addi	sp,sp,-32
    800054b0:	00813823          	sd	s0,16(sp)
    800054b4:	00113c23          	sd	ra,24(sp)
    800054b8:	00913423          	sd	s1,8(sp)
    800054bc:	02010413          	addi	s0,sp,32
    800054c0:	100024f3          	csrr	s1,sstatus
    800054c4:	100027f3          	csrr	a5,sstatus
    800054c8:	0027e793          	ori	a5,a5,2
    800054cc:	10079073          	csrw	sstatus,a5
    800054d0:	ffffe097          	auipc	ra,0xffffe
    800054d4:	618080e7          	jalr	1560(ra) # 80003ae8 <mycpu>
    800054d8:	07852783          	lw	a5,120(a0)
    800054dc:	02078663          	beqz	a5,80005508 <push_on+0x5c>
    800054e0:	ffffe097          	auipc	ra,0xffffe
    800054e4:	608080e7          	jalr	1544(ra) # 80003ae8 <mycpu>
    800054e8:	07852783          	lw	a5,120(a0)
    800054ec:	01813083          	ld	ra,24(sp)
    800054f0:	01013403          	ld	s0,16(sp)
    800054f4:	0017879b          	addiw	a5,a5,1
    800054f8:	06f52c23          	sw	a5,120(a0)
    800054fc:	00813483          	ld	s1,8(sp)
    80005500:	02010113          	addi	sp,sp,32
    80005504:	00008067          	ret
    80005508:	0014d493          	srli	s1,s1,0x1
    8000550c:	ffffe097          	auipc	ra,0xffffe
    80005510:	5dc080e7          	jalr	1500(ra) # 80003ae8 <mycpu>
    80005514:	0014f493          	andi	s1,s1,1
    80005518:	06952e23          	sw	s1,124(a0)
    8000551c:	fc5ff06f          	j	800054e0 <push_on+0x34>

0000000080005520 <pop_on>:
    80005520:	ff010113          	addi	sp,sp,-16
    80005524:	00813023          	sd	s0,0(sp)
    80005528:	00113423          	sd	ra,8(sp)
    8000552c:	01010413          	addi	s0,sp,16
    80005530:	ffffe097          	auipc	ra,0xffffe
    80005534:	5b8080e7          	jalr	1464(ra) # 80003ae8 <mycpu>
    80005538:	100027f3          	csrr	a5,sstatus
    8000553c:	0027f793          	andi	a5,a5,2
    80005540:	04078463          	beqz	a5,80005588 <pop_on+0x68>
    80005544:	07852783          	lw	a5,120(a0)
    80005548:	02f05863          	blez	a5,80005578 <pop_on+0x58>
    8000554c:	fff7879b          	addiw	a5,a5,-1
    80005550:	06f52c23          	sw	a5,120(a0)
    80005554:	07853783          	ld	a5,120(a0)
    80005558:	00079863          	bnez	a5,80005568 <pop_on+0x48>
    8000555c:	100027f3          	csrr	a5,sstatus
    80005560:	ffd7f793          	andi	a5,a5,-3
    80005564:	10079073          	csrw	sstatus,a5
    80005568:	00813083          	ld	ra,8(sp)
    8000556c:	00013403          	ld	s0,0(sp)
    80005570:	01010113          	addi	sp,sp,16
    80005574:	00008067          	ret
    80005578:	00001517          	auipc	a0,0x1
    8000557c:	df050513          	addi	a0,a0,-528 # 80006368 <digits+0x70>
    80005580:	fffff097          	auipc	ra,0xfffff
    80005584:	f2c080e7          	jalr	-212(ra) # 800044ac <panic>
    80005588:	00001517          	auipc	a0,0x1
    8000558c:	dc050513          	addi	a0,a0,-576 # 80006348 <digits+0x50>
    80005590:	fffff097          	auipc	ra,0xfffff
    80005594:	f1c080e7          	jalr	-228(ra) # 800044ac <panic>

0000000080005598 <__memset>:
    80005598:	ff010113          	addi	sp,sp,-16
    8000559c:	00813423          	sd	s0,8(sp)
    800055a0:	01010413          	addi	s0,sp,16
    800055a4:	1a060e63          	beqz	a2,80005760 <__memset+0x1c8>
    800055a8:	40a007b3          	neg	a5,a0
    800055ac:	0077f793          	andi	a5,a5,7
    800055b0:	00778693          	addi	a3,a5,7
    800055b4:	00b00813          	li	a6,11
    800055b8:	0ff5f593          	andi	a1,a1,255
    800055bc:	fff6071b          	addiw	a4,a2,-1
    800055c0:	1b06e663          	bltu	a3,a6,8000576c <__memset+0x1d4>
    800055c4:	1cd76463          	bltu	a4,a3,8000578c <__memset+0x1f4>
    800055c8:	1a078e63          	beqz	a5,80005784 <__memset+0x1ec>
    800055cc:	00b50023          	sb	a1,0(a0)
    800055d0:	00100713          	li	a4,1
    800055d4:	1ae78463          	beq	a5,a4,8000577c <__memset+0x1e4>
    800055d8:	00b500a3          	sb	a1,1(a0)
    800055dc:	00200713          	li	a4,2
    800055e0:	1ae78a63          	beq	a5,a4,80005794 <__memset+0x1fc>
    800055e4:	00b50123          	sb	a1,2(a0)
    800055e8:	00300713          	li	a4,3
    800055ec:	18e78463          	beq	a5,a4,80005774 <__memset+0x1dc>
    800055f0:	00b501a3          	sb	a1,3(a0)
    800055f4:	00400713          	li	a4,4
    800055f8:	1ae78263          	beq	a5,a4,8000579c <__memset+0x204>
    800055fc:	00b50223          	sb	a1,4(a0)
    80005600:	00500713          	li	a4,5
    80005604:	1ae78063          	beq	a5,a4,800057a4 <__memset+0x20c>
    80005608:	00b502a3          	sb	a1,5(a0)
    8000560c:	00700713          	li	a4,7
    80005610:	18e79e63          	bne	a5,a4,800057ac <__memset+0x214>
    80005614:	00b50323          	sb	a1,6(a0)
    80005618:	00700e93          	li	t4,7
    8000561c:	00859713          	slli	a4,a1,0x8
    80005620:	00e5e733          	or	a4,a1,a4
    80005624:	01059e13          	slli	t3,a1,0x10
    80005628:	01c76e33          	or	t3,a4,t3
    8000562c:	01859313          	slli	t1,a1,0x18
    80005630:	006e6333          	or	t1,t3,t1
    80005634:	02059893          	slli	a7,a1,0x20
    80005638:	40f60e3b          	subw	t3,a2,a5
    8000563c:	011368b3          	or	a7,t1,a7
    80005640:	02859813          	slli	a6,a1,0x28
    80005644:	0108e833          	or	a6,a7,a6
    80005648:	03059693          	slli	a3,a1,0x30
    8000564c:	003e589b          	srliw	a7,t3,0x3
    80005650:	00d866b3          	or	a3,a6,a3
    80005654:	03859713          	slli	a4,a1,0x38
    80005658:	00389813          	slli	a6,a7,0x3
    8000565c:	00f507b3          	add	a5,a0,a5
    80005660:	00e6e733          	or	a4,a3,a4
    80005664:	000e089b          	sext.w	a7,t3
    80005668:	00f806b3          	add	a3,a6,a5
    8000566c:	00e7b023          	sd	a4,0(a5)
    80005670:	00878793          	addi	a5,a5,8
    80005674:	fed79ce3          	bne	a5,a3,8000566c <__memset+0xd4>
    80005678:	ff8e7793          	andi	a5,t3,-8
    8000567c:	0007871b          	sext.w	a4,a5
    80005680:	01d787bb          	addw	a5,a5,t4
    80005684:	0ce88e63          	beq	a7,a4,80005760 <__memset+0x1c8>
    80005688:	00f50733          	add	a4,a0,a5
    8000568c:	00b70023          	sb	a1,0(a4)
    80005690:	0017871b          	addiw	a4,a5,1
    80005694:	0cc77663          	bgeu	a4,a2,80005760 <__memset+0x1c8>
    80005698:	00e50733          	add	a4,a0,a4
    8000569c:	00b70023          	sb	a1,0(a4)
    800056a0:	0027871b          	addiw	a4,a5,2
    800056a4:	0ac77e63          	bgeu	a4,a2,80005760 <__memset+0x1c8>
    800056a8:	00e50733          	add	a4,a0,a4
    800056ac:	00b70023          	sb	a1,0(a4)
    800056b0:	0037871b          	addiw	a4,a5,3
    800056b4:	0ac77663          	bgeu	a4,a2,80005760 <__memset+0x1c8>
    800056b8:	00e50733          	add	a4,a0,a4
    800056bc:	00b70023          	sb	a1,0(a4)
    800056c0:	0047871b          	addiw	a4,a5,4
    800056c4:	08c77e63          	bgeu	a4,a2,80005760 <__memset+0x1c8>
    800056c8:	00e50733          	add	a4,a0,a4
    800056cc:	00b70023          	sb	a1,0(a4)
    800056d0:	0057871b          	addiw	a4,a5,5
    800056d4:	08c77663          	bgeu	a4,a2,80005760 <__memset+0x1c8>
    800056d8:	00e50733          	add	a4,a0,a4
    800056dc:	00b70023          	sb	a1,0(a4)
    800056e0:	0067871b          	addiw	a4,a5,6
    800056e4:	06c77e63          	bgeu	a4,a2,80005760 <__memset+0x1c8>
    800056e8:	00e50733          	add	a4,a0,a4
    800056ec:	00b70023          	sb	a1,0(a4)
    800056f0:	0077871b          	addiw	a4,a5,7
    800056f4:	06c77663          	bgeu	a4,a2,80005760 <__memset+0x1c8>
    800056f8:	00e50733          	add	a4,a0,a4
    800056fc:	00b70023          	sb	a1,0(a4)
    80005700:	0087871b          	addiw	a4,a5,8
    80005704:	04c77e63          	bgeu	a4,a2,80005760 <__memset+0x1c8>
    80005708:	00e50733          	add	a4,a0,a4
    8000570c:	00b70023          	sb	a1,0(a4)
    80005710:	0097871b          	addiw	a4,a5,9
    80005714:	04c77663          	bgeu	a4,a2,80005760 <__memset+0x1c8>
    80005718:	00e50733          	add	a4,a0,a4
    8000571c:	00b70023          	sb	a1,0(a4)
    80005720:	00a7871b          	addiw	a4,a5,10
    80005724:	02c77e63          	bgeu	a4,a2,80005760 <__memset+0x1c8>
    80005728:	00e50733          	add	a4,a0,a4
    8000572c:	00b70023          	sb	a1,0(a4)
    80005730:	00b7871b          	addiw	a4,a5,11
    80005734:	02c77663          	bgeu	a4,a2,80005760 <__memset+0x1c8>
    80005738:	00e50733          	add	a4,a0,a4
    8000573c:	00b70023          	sb	a1,0(a4)
    80005740:	00c7871b          	addiw	a4,a5,12
    80005744:	00c77e63          	bgeu	a4,a2,80005760 <__memset+0x1c8>
    80005748:	00e50733          	add	a4,a0,a4
    8000574c:	00b70023          	sb	a1,0(a4)
    80005750:	00d7879b          	addiw	a5,a5,13
    80005754:	00c7f663          	bgeu	a5,a2,80005760 <__memset+0x1c8>
    80005758:	00f507b3          	add	a5,a0,a5
    8000575c:	00b78023          	sb	a1,0(a5)
    80005760:	00813403          	ld	s0,8(sp)
    80005764:	01010113          	addi	sp,sp,16
    80005768:	00008067          	ret
    8000576c:	00b00693          	li	a3,11
    80005770:	e55ff06f          	j	800055c4 <__memset+0x2c>
    80005774:	00300e93          	li	t4,3
    80005778:	ea5ff06f          	j	8000561c <__memset+0x84>
    8000577c:	00100e93          	li	t4,1
    80005780:	e9dff06f          	j	8000561c <__memset+0x84>
    80005784:	00000e93          	li	t4,0
    80005788:	e95ff06f          	j	8000561c <__memset+0x84>
    8000578c:	00000793          	li	a5,0
    80005790:	ef9ff06f          	j	80005688 <__memset+0xf0>
    80005794:	00200e93          	li	t4,2
    80005798:	e85ff06f          	j	8000561c <__memset+0x84>
    8000579c:	00400e93          	li	t4,4
    800057a0:	e7dff06f          	j	8000561c <__memset+0x84>
    800057a4:	00500e93          	li	t4,5
    800057a8:	e75ff06f          	j	8000561c <__memset+0x84>
    800057ac:	00600e93          	li	t4,6
    800057b0:	e6dff06f          	j	8000561c <__memset+0x84>

00000000800057b4 <__memmove>:
    800057b4:	ff010113          	addi	sp,sp,-16
    800057b8:	00813423          	sd	s0,8(sp)
    800057bc:	01010413          	addi	s0,sp,16
    800057c0:	0e060863          	beqz	a2,800058b0 <__memmove+0xfc>
    800057c4:	fff6069b          	addiw	a3,a2,-1
    800057c8:	0006881b          	sext.w	a6,a3
    800057cc:	0ea5e863          	bltu	a1,a0,800058bc <__memmove+0x108>
    800057d0:	00758713          	addi	a4,a1,7
    800057d4:	00a5e7b3          	or	a5,a1,a0
    800057d8:	40a70733          	sub	a4,a4,a0
    800057dc:	0077f793          	andi	a5,a5,7
    800057e0:	00f73713          	sltiu	a4,a4,15
    800057e4:	00174713          	xori	a4,a4,1
    800057e8:	0017b793          	seqz	a5,a5
    800057ec:	00e7f7b3          	and	a5,a5,a4
    800057f0:	10078863          	beqz	a5,80005900 <__memmove+0x14c>
    800057f4:	00900793          	li	a5,9
    800057f8:	1107f463          	bgeu	a5,a6,80005900 <__memmove+0x14c>
    800057fc:	0036581b          	srliw	a6,a2,0x3
    80005800:	fff8081b          	addiw	a6,a6,-1
    80005804:	02081813          	slli	a6,a6,0x20
    80005808:	01d85893          	srli	a7,a6,0x1d
    8000580c:	00858813          	addi	a6,a1,8
    80005810:	00058793          	mv	a5,a1
    80005814:	00050713          	mv	a4,a0
    80005818:	01088833          	add	a6,a7,a6
    8000581c:	0007b883          	ld	a7,0(a5)
    80005820:	00878793          	addi	a5,a5,8
    80005824:	00870713          	addi	a4,a4,8
    80005828:	ff173c23          	sd	a7,-8(a4)
    8000582c:	ff0798e3          	bne	a5,a6,8000581c <__memmove+0x68>
    80005830:	ff867713          	andi	a4,a2,-8
    80005834:	02071793          	slli	a5,a4,0x20
    80005838:	0207d793          	srli	a5,a5,0x20
    8000583c:	00f585b3          	add	a1,a1,a5
    80005840:	40e686bb          	subw	a3,a3,a4
    80005844:	00f507b3          	add	a5,a0,a5
    80005848:	06e60463          	beq	a2,a4,800058b0 <__memmove+0xfc>
    8000584c:	0005c703          	lbu	a4,0(a1)
    80005850:	00e78023          	sb	a4,0(a5)
    80005854:	04068e63          	beqz	a3,800058b0 <__memmove+0xfc>
    80005858:	0015c603          	lbu	a2,1(a1)
    8000585c:	00100713          	li	a4,1
    80005860:	00c780a3          	sb	a2,1(a5)
    80005864:	04e68663          	beq	a3,a4,800058b0 <__memmove+0xfc>
    80005868:	0025c603          	lbu	a2,2(a1)
    8000586c:	00200713          	li	a4,2
    80005870:	00c78123          	sb	a2,2(a5)
    80005874:	02e68e63          	beq	a3,a4,800058b0 <__memmove+0xfc>
    80005878:	0035c603          	lbu	a2,3(a1)
    8000587c:	00300713          	li	a4,3
    80005880:	00c781a3          	sb	a2,3(a5)
    80005884:	02e68663          	beq	a3,a4,800058b0 <__memmove+0xfc>
    80005888:	0045c603          	lbu	a2,4(a1)
    8000588c:	00400713          	li	a4,4
    80005890:	00c78223          	sb	a2,4(a5)
    80005894:	00e68e63          	beq	a3,a4,800058b0 <__memmove+0xfc>
    80005898:	0055c603          	lbu	a2,5(a1)
    8000589c:	00500713          	li	a4,5
    800058a0:	00c782a3          	sb	a2,5(a5)
    800058a4:	00e68663          	beq	a3,a4,800058b0 <__memmove+0xfc>
    800058a8:	0065c703          	lbu	a4,6(a1)
    800058ac:	00e78323          	sb	a4,6(a5)
    800058b0:	00813403          	ld	s0,8(sp)
    800058b4:	01010113          	addi	sp,sp,16
    800058b8:	00008067          	ret
    800058bc:	02061713          	slli	a4,a2,0x20
    800058c0:	02075713          	srli	a4,a4,0x20
    800058c4:	00e587b3          	add	a5,a1,a4
    800058c8:	f0f574e3          	bgeu	a0,a5,800057d0 <__memmove+0x1c>
    800058cc:	02069613          	slli	a2,a3,0x20
    800058d0:	02065613          	srli	a2,a2,0x20
    800058d4:	fff64613          	not	a2,a2
    800058d8:	00e50733          	add	a4,a0,a4
    800058dc:	00c78633          	add	a2,a5,a2
    800058e0:	fff7c683          	lbu	a3,-1(a5)
    800058e4:	fff78793          	addi	a5,a5,-1
    800058e8:	fff70713          	addi	a4,a4,-1
    800058ec:	00d70023          	sb	a3,0(a4)
    800058f0:	fec798e3          	bne	a5,a2,800058e0 <__memmove+0x12c>
    800058f4:	00813403          	ld	s0,8(sp)
    800058f8:	01010113          	addi	sp,sp,16
    800058fc:	00008067          	ret
    80005900:	02069713          	slli	a4,a3,0x20
    80005904:	02075713          	srli	a4,a4,0x20
    80005908:	00170713          	addi	a4,a4,1
    8000590c:	00e50733          	add	a4,a0,a4
    80005910:	00050793          	mv	a5,a0
    80005914:	0005c683          	lbu	a3,0(a1)
    80005918:	00178793          	addi	a5,a5,1
    8000591c:	00158593          	addi	a1,a1,1
    80005920:	fed78fa3          	sb	a3,-1(a5)
    80005924:	fee798e3          	bne	a5,a4,80005914 <__memmove+0x160>
    80005928:	f89ff06f          	j	800058b0 <__memmove+0xfc>

000000008000592c <__putc>:
    8000592c:	fe010113          	addi	sp,sp,-32
    80005930:	00813823          	sd	s0,16(sp)
    80005934:	00113c23          	sd	ra,24(sp)
    80005938:	02010413          	addi	s0,sp,32
    8000593c:	00050793          	mv	a5,a0
    80005940:	fef40593          	addi	a1,s0,-17
    80005944:	00100613          	li	a2,1
    80005948:	00000513          	li	a0,0
    8000594c:	fef407a3          	sb	a5,-17(s0)
    80005950:	fffff097          	auipc	ra,0xfffff
    80005954:	b3c080e7          	jalr	-1220(ra) # 8000448c <console_write>
    80005958:	01813083          	ld	ra,24(sp)
    8000595c:	01013403          	ld	s0,16(sp)
    80005960:	02010113          	addi	sp,sp,32
    80005964:	00008067          	ret

0000000080005968 <__getc>:
    80005968:	fe010113          	addi	sp,sp,-32
    8000596c:	00813823          	sd	s0,16(sp)
    80005970:	00113c23          	sd	ra,24(sp)
    80005974:	02010413          	addi	s0,sp,32
    80005978:	fe840593          	addi	a1,s0,-24
    8000597c:	00100613          	li	a2,1
    80005980:	00000513          	li	a0,0
    80005984:	fffff097          	auipc	ra,0xfffff
    80005988:	ae8080e7          	jalr	-1304(ra) # 8000446c <console_read>
    8000598c:	fe844503          	lbu	a0,-24(s0)
    80005990:	01813083          	ld	ra,24(sp)
    80005994:	01013403          	ld	s0,16(sp)
    80005998:	02010113          	addi	sp,sp,32
    8000599c:	00008067          	ret

00000000800059a0 <console_handler>:
    800059a0:	fe010113          	addi	sp,sp,-32
    800059a4:	00813823          	sd	s0,16(sp)
    800059a8:	00113c23          	sd	ra,24(sp)
    800059ac:	00913423          	sd	s1,8(sp)
    800059b0:	02010413          	addi	s0,sp,32
    800059b4:	14202773          	csrr	a4,scause
    800059b8:	100027f3          	csrr	a5,sstatus
    800059bc:	0027f793          	andi	a5,a5,2
    800059c0:	06079e63          	bnez	a5,80005a3c <console_handler+0x9c>
    800059c4:	00074c63          	bltz	a4,800059dc <console_handler+0x3c>
    800059c8:	01813083          	ld	ra,24(sp)
    800059cc:	01013403          	ld	s0,16(sp)
    800059d0:	00813483          	ld	s1,8(sp)
    800059d4:	02010113          	addi	sp,sp,32
    800059d8:	00008067          	ret
    800059dc:	0ff77713          	andi	a4,a4,255
    800059e0:	00900793          	li	a5,9
    800059e4:	fef712e3          	bne	a4,a5,800059c8 <console_handler+0x28>
    800059e8:	ffffe097          	auipc	ra,0xffffe
    800059ec:	6dc080e7          	jalr	1756(ra) # 800040c4 <plic_claim>
    800059f0:	00a00793          	li	a5,10
    800059f4:	00050493          	mv	s1,a0
    800059f8:	02f50c63          	beq	a0,a5,80005a30 <console_handler+0x90>
    800059fc:	fc0506e3          	beqz	a0,800059c8 <console_handler+0x28>
    80005a00:	00050593          	mv	a1,a0
    80005a04:	00001517          	auipc	a0,0x1
    80005a08:	86c50513          	addi	a0,a0,-1940 # 80006270 <CONSOLE_STATUS+0x260>
    80005a0c:	fffff097          	auipc	ra,0xfffff
    80005a10:	afc080e7          	jalr	-1284(ra) # 80004508 <__printf>
    80005a14:	01013403          	ld	s0,16(sp)
    80005a18:	01813083          	ld	ra,24(sp)
    80005a1c:	00048513          	mv	a0,s1
    80005a20:	00813483          	ld	s1,8(sp)
    80005a24:	02010113          	addi	sp,sp,32
    80005a28:	ffffe317          	auipc	t1,0xffffe
    80005a2c:	6d430067          	jr	1748(t1) # 800040fc <plic_complete>
    80005a30:	fffff097          	auipc	ra,0xfffff
    80005a34:	3e0080e7          	jalr	992(ra) # 80004e10 <uartintr>
    80005a38:	fddff06f          	j	80005a14 <console_handler+0x74>
    80005a3c:	00001517          	auipc	a0,0x1
    80005a40:	93450513          	addi	a0,a0,-1740 # 80006370 <digits+0x78>
    80005a44:	fffff097          	auipc	ra,0xfffff
    80005a48:	a68080e7          	jalr	-1432(ra) # 800044ac <panic>
	...
