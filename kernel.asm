
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	46013103          	ld	sp,1120(sp) # 80007460 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	748030ef          	jal	ra,80003764 <start>

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
    800011a4:	3f9010ef          	jal	ra,80002d9c <_ZN5Riscv20handleSupervisorTrapEv>

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
    80001470:	ee478793          	addi	a5,a5,-284 # 80007350 <_ZTV9KernelSem+0x10>
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
    800014b8:	500080e7          	jalr	1280(ra) # 800029b4 <_Znwm>
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
    80001540:	f2c7b783          	ld	a5,-212(a5) # 80007468 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80001558:	460080e7          	jalr	1120(ra) # 800029b4 <_Znwm>
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
        return head->data;
    800015c8:	0007b703          	ld	a4,0(a5)
        if(listWait.peekFirst()){
    800015cc:	fe0706e3          	beqz	a4,800015b8 <_ZN9KernelSem6signalEv+0x14>
int KernelSem::signal() {
    800015d0:	fe010113          	addi	sp,sp,-32
    800015d4:	00113c23          	sd	ra,24(sp)
    800015d8:	00813823          	sd	s0,16(sp)
    800015dc:	00913423          	sd	s1,8(sp)
    800015e0:	02010413          	addi	s0,sp,32
        head = head->next;
    800015e4:	0087b703          	ld	a4,8(a5)
    800015e8:	00e53c23          	sd	a4,24(a0)
        if(!head){ tail = 0; }
    800015ec:	02070e63          	beqz	a4,80001628 <_ZN9KernelSem6signalEv+0x84>
        T *ret = elem->data;
    800015f0:	0007b483          	ld	s1,0(a5)
        delete elem;
    800015f4:	00078513          	mv	a0,a5
    800015f8:	00001097          	auipc	ra,0x1
    800015fc:	40c080e7          	jalr	1036(ra) # 80002a04 <_ZdlPv>
        void unblock() { blocked = false; }
    80001600:	020484a3          	sb	zero,41(s1)
            Scheduler::put(unblock);
    80001604:	00048513          	mv	a0,s1
    80001608:	00002097          	auipc	ra,0x2
    8000160c:	b20080e7          	jalr	-1248(ra) # 80003128 <_ZN9Scheduler3putEP3TCB>
}
    80001610:	00000513          	li	a0,0
    80001614:	01813083          	ld	ra,24(sp)
    80001618:	01013403          	ld	s0,16(sp)
    8000161c:	00813483          	ld	s1,8(sp)
    80001620:	02010113          	addi	sp,sp,32
    80001624:	00008067          	ret
        if(!head){ tail = 0; }
    80001628:	02053023          	sd	zero,32(a0)
    8000162c:	fc5ff06f          	j	800015f0 <_ZN9KernelSem6signalEv+0x4c>

0000000080001630 <_ZN9KernelSem7freeSemEv>:

void KernelSem::freeSem() {
    80001630:	fe010113          	addi	sp,sp,-32
    80001634:	00113c23          	sd	ra,24(sp)
    80001638:	00813823          	sd	s0,16(sp)
    8000163c:	00913423          	sd	s1,8(sp)
    80001640:	01213023          	sd	s2,0(sp)
    80001644:	02010413          	addi	s0,sp,32
    80001648:	00050493          	mv	s1,a0
    8000164c:	0240006f          	j	80001670 <_ZN9KernelSem7freeSemEv+0x40>
    80001650:	0204b023          	sd	zero,32(s1)
        T *ret = elem->data;
    80001654:	00053903          	ld	s2,0(a0)
        delete elem;
    80001658:	00001097          	auipc	ra,0x1
    8000165c:	3ac080e7          	jalr	940(ra) # 80002a04 <_ZdlPv>
    80001660:	020904a3          	sb	zero,41(s2)
    while(listWait.peekFirst()){
        thread_t unblock = listWait.removeFirst();
        unblock->unblock();
        Scheduler::put(unblock);
    80001664:	00090513          	mv	a0,s2
    80001668:	00002097          	auipc	ra,0x2
    8000166c:	ac0080e7          	jalr	-1344(ra) # 80003128 <_ZN9Scheduler3putEP3TCB>
        if(!head){ return 0; }
    80001670:	0184b503          	ld	a0,24(s1)
    80001674:	00050e63          	beqz	a0,80001690 <_ZN9KernelSem7freeSemEv+0x60>
        return head->data;
    80001678:	00053783          	ld	a5,0(a0)
    while(listWait.peekFirst()){
    8000167c:	00078a63          	beqz	a5,80001690 <_ZN9KernelSem7freeSemEv+0x60>
        head = head->next;
    80001680:	00853783          	ld	a5,8(a0)
    80001684:	00f4bc23          	sd	a5,24(s1)
        if(!head){ tail = 0; }
    80001688:	fc0796e3          	bnez	a5,80001654 <_ZN9KernelSem7freeSemEv+0x24>
    8000168c:	fc5ff06f          	j	80001650 <_ZN9KernelSem7freeSemEv+0x20>
    }

    value = 1; // diskutabilno
    80001690:	00100793          	li	a5,1
    80001694:	00f4a823          	sw	a5,16(s1)
}
    80001698:	01813083          	ld	ra,24(sp)
    8000169c:	01013403          	ld	s0,16(sp)
    800016a0:	00813483          	ld	s1,8(sp)
    800016a4:	00013903          	ld	s2,0(sp)
    800016a8:	02010113          	addi	sp,sp,32
    800016ac:	00008067          	ret

00000000800016b0 <_ZN9KernelSemD1Ev>:
KernelSem::~KernelSem() {
    800016b0:	ff010113          	addi	sp,sp,-16
    800016b4:	00113423          	sd	ra,8(sp)
    800016b8:	00813023          	sd	s0,0(sp)
    800016bc:	01010413          	addi	s0,sp,16
    800016c0:	00006797          	auipc	a5,0x6
    800016c4:	c9078793          	addi	a5,a5,-880 # 80007350 <_ZTV9KernelSem+0x10>
    800016c8:	00f53023          	sd	a5,0(a0)
    this->freeSem();
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	f64080e7          	jalr	-156(ra) # 80001630 <_ZN9KernelSem7freeSemEv>
}
    800016d4:	00813083          	ld	ra,8(sp)
    800016d8:	00013403          	ld	s0,0(sp)
    800016dc:	01010113          	addi	sp,sp,16
    800016e0:	00008067          	ret

00000000800016e4 <_ZN9KernelSemD0Ev>:
KernelSem::~KernelSem() {
    800016e4:	fe010113          	addi	sp,sp,-32
    800016e8:	00113c23          	sd	ra,24(sp)
    800016ec:	00813823          	sd	s0,16(sp)
    800016f0:	00913423          	sd	s1,8(sp)
    800016f4:	02010413          	addi	s0,sp,32
    800016f8:	00050493          	mv	s1,a0
}
    800016fc:	00000097          	auipc	ra,0x0
    80001700:	fb4080e7          	jalr	-76(ra) # 800016b0 <_ZN9KernelSemD1Ev>
    80001704:	00048513          	mv	a0,s1
    80001708:	00001097          	auipc	ra,0x1
    8000170c:	2fc080e7          	jalr	764(ra) # 80002a04 <_ZdlPv>
    80001710:	01813083          	ld	ra,24(sp)
    80001714:	01013403          	ld	s0,16(sp)
    80001718:	00813483          	ld	s1,8(sp)
    8000171c:	02010113          	addi	sp,sp,32
    80001720:	00008067          	ret

0000000080001724 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80001724:	fe010113          	addi	sp,sp,-32
    80001728:	00113c23          	sd	ra,24(sp)
    8000172c:	00813823          	sd	s0,16(sp)
    80001730:	00913423          	sd	s1,8(sp)
    80001734:	02010413          	addi	s0,sp,32
    80001738:	00050493          	mv	s1,a0
    LOCK();
    8000173c:	00100613          	li	a2,1
    80001740:	00000593          	li	a1,0
    80001744:	00006517          	auipc	a0,0x6
    80001748:	d7c50513          	addi	a0,a0,-644 # 800074c0 <lockPrint>
    8000174c:	00000097          	auipc	ra,0x0
    80001750:	9ac080e7          	jalr	-1620(ra) # 800010f8 <copy_and_swap>
    80001754:	fe0514e3          	bnez	a0,8000173c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80001758:	0004c503          	lbu	a0,0(s1)
    8000175c:	00050a63          	beqz	a0,80001770 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80001760:	00000097          	auipc	ra,0x0
    80001764:	cd4080e7          	jalr	-812(ra) # 80001434 <_Z4putcc>
        string++;
    80001768:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    8000176c:	fedff06f          	j	80001758 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80001770:	00000613          	li	a2,0
    80001774:	00100593          	li	a1,1
    80001778:	00006517          	auipc	a0,0x6
    8000177c:	d4850513          	addi	a0,a0,-696 # 800074c0 <lockPrint>
    80001780:	00000097          	auipc	ra,0x0
    80001784:	978080e7          	jalr	-1672(ra) # 800010f8 <copy_and_swap>
    80001788:	fe0514e3          	bnez	a0,80001770 <_Z11printStringPKc+0x4c>
}
    8000178c:	01813083          	ld	ra,24(sp)
    80001790:	01013403          	ld	s0,16(sp)
    80001794:	00813483          	ld	s1,8(sp)
    80001798:	02010113          	addi	sp,sp,32
    8000179c:	00008067          	ret

00000000800017a0 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800017a0:	fd010113          	addi	sp,sp,-48
    800017a4:	02113423          	sd	ra,40(sp)
    800017a8:	02813023          	sd	s0,32(sp)
    800017ac:	00913c23          	sd	s1,24(sp)
    800017b0:	01213823          	sd	s2,16(sp)
    800017b4:	01313423          	sd	s3,8(sp)
    800017b8:	01413023          	sd	s4,0(sp)
    800017bc:	03010413          	addi	s0,sp,48
    800017c0:	00050993          	mv	s3,a0
    800017c4:	00058a13          	mv	s4,a1
    LOCK();
    800017c8:	00100613          	li	a2,1
    800017cc:	00000593          	li	a1,0
    800017d0:	00006517          	auipc	a0,0x6
    800017d4:	cf050513          	addi	a0,a0,-784 # 800074c0 <lockPrint>
    800017d8:	00000097          	auipc	ra,0x0
    800017dc:	920080e7          	jalr	-1760(ra) # 800010f8 <copy_and_swap>
    800017e0:	fe0514e3          	bnez	a0,800017c8 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800017e4:	00000913          	li	s2,0
    800017e8:	00090493          	mv	s1,s2
    800017ec:	0019091b          	addiw	s2,s2,1
    800017f0:	03495a63          	bge	s2,s4,80001824 <_Z9getStringPci+0x84>
        cc = getc();
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	c14080e7          	jalr	-1004(ra) # 80001408 <_Z4getcv>
        if(cc < 1)
    800017fc:	02050463          	beqz	a0,80001824 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80001800:	009984b3          	add	s1,s3,s1
    80001804:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80001808:	00a00793          	li	a5,10
    8000180c:	00f50a63          	beq	a0,a5,80001820 <_Z9getStringPci+0x80>
    80001810:	00d00793          	li	a5,13
    80001814:	fcf51ae3          	bne	a0,a5,800017e8 <_Z9getStringPci+0x48>
        buf[i++] = c;
    80001818:	00090493          	mv	s1,s2
    8000181c:	0080006f          	j	80001824 <_Z9getStringPci+0x84>
    80001820:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80001824:	009984b3          	add	s1,s3,s1
    80001828:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000182c:	00000613          	li	a2,0
    80001830:	00100593          	li	a1,1
    80001834:	00006517          	auipc	a0,0x6
    80001838:	c8c50513          	addi	a0,a0,-884 # 800074c0 <lockPrint>
    8000183c:	00000097          	auipc	ra,0x0
    80001840:	8bc080e7          	jalr	-1860(ra) # 800010f8 <copy_and_swap>
    80001844:	fe0514e3          	bnez	a0,8000182c <_Z9getStringPci+0x8c>
    return buf;
}
    80001848:	00098513          	mv	a0,s3
    8000184c:	02813083          	ld	ra,40(sp)
    80001850:	02013403          	ld	s0,32(sp)
    80001854:	01813483          	ld	s1,24(sp)
    80001858:	01013903          	ld	s2,16(sp)
    8000185c:	00813983          	ld	s3,8(sp)
    80001860:	00013a03          	ld	s4,0(sp)
    80001864:	03010113          	addi	sp,sp,48
    80001868:	00008067          	ret

000000008000186c <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    8000186c:	ff010113          	addi	sp,sp,-16
    80001870:	00813423          	sd	s0,8(sp)
    80001874:	01010413          	addi	s0,sp,16
    80001878:	00050693          	mv	a3,a0
    int n;

    n = 0;
    8000187c:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80001880:	0006c603          	lbu	a2,0(a3)
    80001884:	fd06071b          	addiw	a4,a2,-48
    80001888:	0ff77713          	andi	a4,a4,255
    8000188c:	00900793          	li	a5,9
    80001890:	02e7e063          	bltu	a5,a4,800018b0 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80001894:	0025179b          	slliw	a5,a0,0x2
    80001898:	00a787bb          	addw	a5,a5,a0
    8000189c:	0017979b          	slliw	a5,a5,0x1
    800018a0:	00168693          	addi	a3,a3,1
    800018a4:	00c787bb          	addw	a5,a5,a2
    800018a8:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800018ac:	fd5ff06f          	j	80001880 <_Z11stringToIntPKc+0x14>
    return n;
}
    800018b0:	00813403          	ld	s0,8(sp)
    800018b4:	01010113          	addi	sp,sp,16
    800018b8:	00008067          	ret

00000000800018bc <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800018bc:	fc010113          	addi	sp,sp,-64
    800018c0:	02113c23          	sd	ra,56(sp)
    800018c4:	02813823          	sd	s0,48(sp)
    800018c8:	02913423          	sd	s1,40(sp)
    800018cc:	03213023          	sd	s2,32(sp)
    800018d0:	01313c23          	sd	s3,24(sp)
    800018d4:	04010413          	addi	s0,sp,64
    800018d8:	00050493          	mv	s1,a0
    800018dc:	00058913          	mv	s2,a1
    800018e0:	00060993          	mv	s3,a2
    LOCK();
    800018e4:	00100613          	li	a2,1
    800018e8:	00000593          	li	a1,0
    800018ec:	00006517          	auipc	a0,0x6
    800018f0:	bd450513          	addi	a0,a0,-1068 # 800074c0 <lockPrint>
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	804080e7          	jalr	-2044(ra) # 800010f8 <copy_and_swap>
    800018fc:	fe0514e3          	bnez	a0,800018e4 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80001900:	00098463          	beqz	s3,80001908 <_Z8printIntiii+0x4c>
    80001904:	0804c463          	bltz	s1,8000198c <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80001908:	0004851b          	sext.w	a0,s1
    neg = 0;
    8000190c:	00000593          	li	a1,0
    }

    i = 0;
    80001910:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80001914:	0009079b          	sext.w	a5,s2
    80001918:	0325773b          	remuw	a4,a0,s2
    8000191c:	00048613          	mv	a2,s1
    80001920:	0014849b          	addiw	s1,s1,1
    80001924:	02071693          	slli	a3,a4,0x20
    80001928:	0206d693          	srli	a3,a3,0x20
    8000192c:	00006717          	auipc	a4,0x6
    80001930:	a3c70713          	addi	a4,a4,-1476 # 80007368 <digits>
    80001934:	00d70733          	add	a4,a4,a3
    80001938:	00074683          	lbu	a3,0(a4)
    8000193c:	fd040713          	addi	a4,s0,-48
    80001940:	00c70733          	add	a4,a4,a2
    80001944:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80001948:	0005071b          	sext.w	a4,a0
    8000194c:	0325553b          	divuw	a0,a0,s2
    80001950:	fcf772e3          	bgeu	a4,a5,80001914 <_Z8printIntiii+0x58>
    if(neg)
    80001954:	00058c63          	beqz	a1,8000196c <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80001958:	fd040793          	addi	a5,s0,-48
    8000195c:	009784b3          	add	s1,a5,s1
    80001960:	02d00793          	li	a5,45
    80001964:	fef48823          	sb	a5,-16(s1)
    80001968:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    8000196c:	fff4849b          	addiw	s1,s1,-1
    80001970:	0204c463          	bltz	s1,80001998 <_Z8printIntiii+0xdc>
        putc(buf[i]);
    80001974:	fd040793          	addi	a5,s0,-48
    80001978:	009787b3          	add	a5,a5,s1
    8000197c:	ff07c503          	lbu	a0,-16(a5)
    80001980:	00000097          	auipc	ra,0x0
    80001984:	ab4080e7          	jalr	-1356(ra) # 80001434 <_Z4putcc>
    80001988:	fe5ff06f          	j	8000196c <_Z8printIntiii+0xb0>
        x = -xx;
    8000198c:	4090053b          	negw	a0,s1
        neg = 1;
    80001990:	00100593          	li	a1,1
        x = -xx;
    80001994:	f7dff06f          	j	80001910 <_Z8printIntiii+0x54>

    UNLOCK();
    80001998:	00000613          	li	a2,0
    8000199c:	00100593          	li	a1,1
    800019a0:	00006517          	auipc	a0,0x6
    800019a4:	b2050513          	addi	a0,a0,-1248 # 800074c0 <lockPrint>
    800019a8:	fffff097          	auipc	ra,0xfffff
    800019ac:	750080e7          	jalr	1872(ra) # 800010f8 <copy_and_swap>
    800019b0:	fe0514e3          	bnez	a0,80001998 <_Z8printIntiii+0xdc>
    800019b4:	03813083          	ld	ra,56(sp)
    800019b8:	03013403          	ld	s0,48(sp)
    800019bc:	02813483          	ld	s1,40(sp)
    800019c0:	02013903          	ld	s2,32(sp)
    800019c4:	01813983          	ld	s3,24(sp)
    800019c8:	04010113          	addi	sp,sp,64
    800019cc:	00008067          	ret

00000000800019d0 <_ZN9BufferCPPC1Ei>:
#include "../h/buffer_CPP_API.hpp"
#include "../h/printing.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800019d0:	fd010113          	addi	sp,sp,-48
    800019d4:	02113423          	sd	ra,40(sp)
    800019d8:	02813023          	sd	s0,32(sp)
    800019dc:	00913c23          	sd	s1,24(sp)
    800019e0:	01213823          	sd	s2,16(sp)
    800019e4:	01313423          	sd	s3,8(sp)
    800019e8:	03010413          	addi	s0,sp,48
    800019ec:	00050493          	mv	s1,a0
    800019f0:	00058913          	mv	s2,a1
    800019f4:	0015879b          	addiw	a5,a1,1
    800019f8:	0007851b          	sext.w	a0,a5
    800019fc:	00f4a023          	sw	a5,0(s1)
    80001a00:	0004a823          	sw	zero,16(s1)
    80001a04:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80001a08:	00251513          	slli	a0,a0,0x2
    80001a0c:	00000097          	auipc	ra,0x0
    80001a10:	848080e7          	jalr	-1976(ra) # 80001254 <_Z9mem_allocm>
    80001a14:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80001a18:	01000513          	li	a0,16
    80001a1c:	00001097          	auipc	ra,0x1
    80001a20:	f98080e7          	jalr	-104(ra) # 800029b4 <_Znwm>
    80001a24:	00050993          	mv	s3,a0
    80001a28:	00000593          	li	a1,0
    80001a2c:	00001097          	auipc	ra,0x1
    80001a30:	29c080e7          	jalr	668(ra) # 80002cc8 <_ZN9SemaphoreC1Ej>
    80001a34:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80001a38:	01000513          	li	a0,16
    80001a3c:	00001097          	auipc	ra,0x1
    80001a40:	f78080e7          	jalr	-136(ra) # 800029b4 <_Znwm>
    80001a44:	00050993          	mv	s3,a0
    80001a48:	00090593          	mv	a1,s2
    80001a4c:	00001097          	auipc	ra,0x1
    80001a50:	27c080e7          	jalr	636(ra) # 80002cc8 <_ZN9SemaphoreC1Ej>
    80001a54:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80001a58:	01000513          	li	a0,16
    80001a5c:	00001097          	auipc	ra,0x1
    80001a60:	f58080e7          	jalr	-168(ra) # 800029b4 <_Znwm>
    80001a64:	00050913          	mv	s2,a0
    80001a68:	00100593          	li	a1,1
    80001a6c:	00001097          	auipc	ra,0x1
    80001a70:	25c080e7          	jalr	604(ra) # 80002cc8 <_ZN9SemaphoreC1Ej>
    80001a74:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80001a78:	01000513          	li	a0,16
    80001a7c:	00001097          	auipc	ra,0x1
    80001a80:	f38080e7          	jalr	-200(ra) # 800029b4 <_Znwm>
    80001a84:	00050913          	mv	s2,a0
    80001a88:	00100593          	li	a1,1
    80001a8c:	00001097          	auipc	ra,0x1
    80001a90:	23c080e7          	jalr	572(ra) # 80002cc8 <_ZN9SemaphoreC1Ej>
    80001a94:	0324b823          	sd	s2,48(s1)
}
    80001a98:	02813083          	ld	ra,40(sp)
    80001a9c:	02013403          	ld	s0,32(sp)
    80001aa0:	01813483          	ld	s1,24(sp)
    80001aa4:	01013903          	ld	s2,16(sp)
    80001aa8:	00813983          	ld	s3,8(sp)
    80001aac:	03010113          	addi	sp,sp,48
    80001ab0:	00008067          	ret
    80001ab4:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80001ab8:	00098513          	mv	a0,s3
    80001abc:	00001097          	auipc	ra,0x1
    80001ac0:	f48080e7          	jalr	-184(ra) # 80002a04 <_ZdlPv>
    80001ac4:	00048513          	mv	a0,s1
    80001ac8:	00007097          	auipc	ra,0x7
    80001acc:	b10080e7          	jalr	-1264(ra) # 800085d8 <_Unwind_Resume>
    80001ad0:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80001ad4:	00098513          	mv	a0,s3
    80001ad8:	00001097          	auipc	ra,0x1
    80001adc:	f2c080e7          	jalr	-212(ra) # 80002a04 <_ZdlPv>
    80001ae0:	00048513          	mv	a0,s1
    80001ae4:	00007097          	auipc	ra,0x7
    80001ae8:	af4080e7          	jalr	-1292(ra) # 800085d8 <_Unwind_Resume>
    80001aec:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80001af0:	00090513          	mv	a0,s2
    80001af4:	00001097          	auipc	ra,0x1
    80001af8:	f10080e7          	jalr	-240(ra) # 80002a04 <_ZdlPv>
    80001afc:	00048513          	mv	a0,s1
    80001b00:	00007097          	auipc	ra,0x7
    80001b04:	ad8080e7          	jalr	-1320(ra) # 800085d8 <_Unwind_Resume>
    80001b08:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80001b0c:	00090513          	mv	a0,s2
    80001b10:	00001097          	auipc	ra,0x1
    80001b14:	ef4080e7          	jalr	-268(ra) # 80002a04 <_ZdlPv>
    80001b18:	00048513          	mv	a0,s1
    80001b1c:	00007097          	auipc	ra,0x7
    80001b20:	abc080e7          	jalr	-1348(ra) # 800085d8 <_Unwind_Resume>

0000000080001b24 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80001b24:	fe010113          	addi	sp,sp,-32
    80001b28:	00113c23          	sd	ra,24(sp)
    80001b2c:	00813823          	sd	s0,16(sp)
    80001b30:	00913423          	sd	s1,8(sp)
    80001b34:	01213023          	sd	s2,0(sp)
    80001b38:	02010413          	addi	s0,sp,32
    80001b3c:	00050493          	mv	s1,a0
    80001b40:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80001b44:	01853503          	ld	a0,24(a0)
    80001b48:	00001097          	auipc	ra,0x1
    80001b4c:	120080e7          	jalr	288(ra) # 80002c68 <_ZN9Semaphore4waitEv>
    //printString("space");
    mutexTail->wait();
    80001b50:	0304b503          	ld	a0,48(s1)
    80001b54:	00001097          	auipc	ra,0x1
    80001b58:	114080e7          	jalr	276(ra) # 80002c68 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80001b5c:	0084b783          	ld	a5,8(s1)
    80001b60:	0144a703          	lw	a4,20(s1)
    80001b64:	00271713          	slli	a4,a4,0x2
    80001b68:	00e787b3          	add	a5,a5,a4
    80001b6c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80001b70:	0144a783          	lw	a5,20(s1)
    80001b74:	0017879b          	addiw	a5,a5,1
    80001b78:	0004a703          	lw	a4,0(s1)
    80001b7c:	02e7e7bb          	remw	a5,a5,a4
    80001b80:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80001b84:	0304b503          	ld	a0,48(s1)
    80001b88:	00001097          	auipc	ra,0x1
    80001b8c:	110080e7          	jalr	272(ra) # 80002c98 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80001b90:	0204b503          	ld	a0,32(s1)
    80001b94:	00001097          	auipc	ra,0x1
    80001b98:	104080e7          	jalr	260(ra) # 80002c98 <_ZN9Semaphore6signalEv>

}
    80001b9c:	01813083          	ld	ra,24(sp)
    80001ba0:	01013403          	ld	s0,16(sp)
    80001ba4:	00813483          	ld	s1,8(sp)
    80001ba8:	00013903          	ld	s2,0(sp)
    80001bac:	02010113          	addi	sp,sp,32
    80001bb0:	00008067          	ret

0000000080001bb4 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80001bb4:	fe010113          	addi	sp,sp,-32
    80001bb8:	00113c23          	sd	ra,24(sp)
    80001bbc:	00813823          	sd	s0,16(sp)
    80001bc0:	00913423          	sd	s1,8(sp)
    80001bc4:	01213023          	sd	s2,0(sp)
    80001bc8:	02010413          	addi	s0,sp,32
    80001bcc:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80001bd0:	02053503          	ld	a0,32(a0)
    80001bd4:	00001097          	auipc	ra,0x1
    80001bd8:	094080e7          	jalr	148(ra) # 80002c68 <_ZN9Semaphore4waitEv>
    //printString("itemAvail.wait\n");
    mutexHead->wait();
    80001bdc:	0284b503          	ld	a0,40(s1)
    80001be0:	00001097          	auipc	ra,0x1
    80001be4:	088080e7          	jalr	136(ra) # 80002c68 <_ZN9Semaphore4waitEv>
    //printString("mutex.wait\n");
    int ret = buffer[head];
    80001be8:	0084b703          	ld	a4,8(s1)
    80001bec:	0104a783          	lw	a5,16(s1)
    80001bf0:	00279693          	slli	a3,a5,0x2
    80001bf4:	00d70733          	add	a4,a4,a3
    80001bf8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80001bfc:	0017879b          	addiw	a5,a5,1
    80001c00:	0004a703          	lw	a4,0(s1)
    80001c04:	02e7e7bb          	remw	a5,a5,a4
    80001c08:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80001c0c:	0284b503          	ld	a0,40(s1)
    80001c10:	00001097          	auipc	ra,0x1
    80001c14:	088080e7          	jalr	136(ra) # 80002c98 <_ZN9Semaphore6signalEv>
    //printString("mutex.signal\n");
    spaceAvailable->signal();
    80001c18:	0184b503          	ld	a0,24(s1)
    80001c1c:	00001097          	auipc	ra,0x1
    80001c20:	07c080e7          	jalr	124(ra) # 80002c98 <_ZN9Semaphore6signalEv>
    //printString("spaceAvail.signal");
    return ret;
}
    80001c24:	00090513          	mv	a0,s2
    80001c28:	01813083          	ld	ra,24(sp)
    80001c2c:	01013403          	ld	s0,16(sp)
    80001c30:	00813483          	ld	s1,8(sp)
    80001c34:	00013903          	ld	s2,0(sp)
    80001c38:	02010113          	addi	sp,sp,32
    80001c3c:	00008067          	ret

0000000080001c40 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80001c40:	fe010113          	addi	sp,sp,-32
    80001c44:	00113c23          	sd	ra,24(sp)
    80001c48:	00813823          	sd	s0,16(sp)
    80001c4c:	00913423          	sd	s1,8(sp)
    80001c50:	01213023          	sd	s2,0(sp)
    80001c54:	02010413          	addi	s0,sp,32
    80001c58:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80001c5c:	02853503          	ld	a0,40(a0)
    80001c60:	00001097          	auipc	ra,0x1
    80001c64:	008080e7          	jalr	8(ra) # 80002c68 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80001c68:	0304b503          	ld	a0,48(s1)
    80001c6c:	00001097          	auipc	ra,0x1
    80001c70:	ffc080e7          	jalr	-4(ra) # 80002c68 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80001c74:	0144a783          	lw	a5,20(s1)
    80001c78:	0104a903          	lw	s2,16(s1)
    80001c7c:	0327ce63          	blt	a5,s2,80001cb8 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80001c80:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80001c84:	0304b503          	ld	a0,48(s1)
    80001c88:	00001097          	auipc	ra,0x1
    80001c8c:	010080e7          	jalr	16(ra) # 80002c98 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80001c90:	0284b503          	ld	a0,40(s1)
    80001c94:	00001097          	auipc	ra,0x1
    80001c98:	004080e7          	jalr	4(ra) # 80002c98 <_ZN9Semaphore6signalEv>

    return ret;
}
    80001c9c:	00090513          	mv	a0,s2
    80001ca0:	01813083          	ld	ra,24(sp)
    80001ca4:	01013403          	ld	s0,16(sp)
    80001ca8:	00813483          	ld	s1,8(sp)
    80001cac:	00013903          	ld	s2,0(sp)
    80001cb0:	02010113          	addi	sp,sp,32
    80001cb4:	00008067          	ret
        ret = cap - head + tail;
    80001cb8:	0004a703          	lw	a4,0(s1)
    80001cbc:	4127093b          	subw	s2,a4,s2
    80001cc0:	00f9093b          	addw	s2,s2,a5
    80001cc4:	fc1ff06f          	j	80001c84 <_ZN9BufferCPP6getCntEv+0x44>

0000000080001cc8 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80001cc8:	fe010113          	addi	sp,sp,-32
    80001ccc:	00113c23          	sd	ra,24(sp)
    80001cd0:	00813823          	sd	s0,16(sp)
    80001cd4:	00913423          	sd	s1,8(sp)
    80001cd8:	02010413          	addi	s0,sp,32
    80001cdc:	00050493          	mv	s1,a0
    Console::putc('\n');
    80001ce0:	00a00513          	li	a0,10
    80001ce4:	00001097          	auipc	ra,0x1
    80001ce8:	058080e7          	jalr	88(ra) # 80002d3c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80001cec:	00004517          	auipc	a0,0x4
    80001cf0:	33450513          	addi	a0,a0,820 # 80006020 <CONSOLE_STATUS+0x10>
    80001cf4:	00000097          	auipc	ra,0x0
    80001cf8:	a30080e7          	jalr	-1488(ra) # 80001724 <_Z11printStringPKc>
    while (getCnt()) {
    80001cfc:	00048513          	mv	a0,s1
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	f40080e7          	jalr	-192(ra) # 80001c40 <_ZN9BufferCPP6getCntEv>
    80001d08:	02050c63          	beqz	a0,80001d40 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80001d0c:	0084b783          	ld	a5,8(s1)
    80001d10:	0104a703          	lw	a4,16(s1)
    80001d14:	00271713          	slli	a4,a4,0x2
    80001d18:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80001d1c:	0007c503          	lbu	a0,0(a5)
    80001d20:	00001097          	auipc	ra,0x1
    80001d24:	01c080e7          	jalr	28(ra) # 80002d3c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80001d28:	0104a783          	lw	a5,16(s1)
    80001d2c:	0017879b          	addiw	a5,a5,1
    80001d30:	0004a703          	lw	a4,0(s1)
    80001d34:	02e7e7bb          	remw	a5,a5,a4
    80001d38:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80001d3c:	fc1ff06f          	j	80001cfc <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80001d40:	02100513          	li	a0,33
    80001d44:	00001097          	auipc	ra,0x1
    80001d48:	ff8080e7          	jalr	-8(ra) # 80002d3c <_ZN7Console4putcEc>
    Console::putc('\n');
    80001d4c:	00a00513          	li	a0,10
    80001d50:	00001097          	auipc	ra,0x1
    80001d54:	fec080e7          	jalr	-20(ra) # 80002d3c <_ZN7Console4putcEc>
    mem_free(buffer);
    80001d58:	0084b503          	ld	a0,8(s1)
    80001d5c:	fffff097          	auipc	ra,0xfffff
    80001d60:	528080e7          	jalr	1320(ra) # 80001284 <_Z8mem_freePv>
    delete itemAvailable;
    80001d64:	0204b503          	ld	a0,32(s1)
    80001d68:	00050863          	beqz	a0,80001d78 <_ZN9BufferCPPD1Ev+0xb0>
    80001d6c:	00053783          	ld	a5,0(a0)
    80001d70:	0087b783          	ld	a5,8(a5)
    80001d74:	000780e7          	jalr	a5
    delete spaceAvailable;
    80001d78:	0184b503          	ld	a0,24(s1)
    80001d7c:	00050863          	beqz	a0,80001d8c <_ZN9BufferCPPD1Ev+0xc4>
    80001d80:	00053783          	ld	a5,0(a0)
    80001d84:	0087b783          	ld	a5,8(a5)
    80001d88:	000780e7          	jalr	a5
    delete mutexTail;
    80001d8c:	0304b503          	ld	a0,48(s1)
    80001d90:	00050863          	beqz	a0,80001da0 <_ZN9BufferCPPD1Ev+0xd8>
    80001d94:	00053783          	ld	a5,0(a0)
    80001d98:	0087b783          	ld	a5,8(a5)
    80001d9c:	000780e7          	jalr	a5
    delete mutexHead;
    80001da0:	0284b503          	ld	a0,40(s1)
    80001da4:	00050863          	beqz	a0,80001db4 <_ZN9BufferCPPD1Ev+0xec>
    80001da8:	00053783          	ld	a5,0(a0)
    80001dac:	0087b783          	ld	a5,8(a5)
    80001db0:	000780e7          	jalr	a5
}
    80001db4:	01813083          	ld	ra,24(sp)
    80001db8:	01013403          	ld	s0,16(sp)
    80001dbc:	00813483          	ld	s1,8(sp)
    80001dc0:	02010113          	addi	sp,sp,32
    80001dc4:	00008067          	ret

0000000080001dc8 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80001dc8:	fd010113          	addi	sp,sp,-48
    80001dcc:	02113423          	sd	ra,40(sp)
    80001dd0:	02813023          	sd	s0,32(sp)
    80001dd4:	00913c23          	sd	s1,24(sp)
    80001dd8:	01213823          	sd	s2,16(sp)
    80001ddc:	01313423          	sd	s3,8(sp)
    80001de0:	03010413          	addi	s0,sp,48
    80001de4:	00050993          	mv	s3,a0
    80001de8:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80001dec:	00000913          	li	s2,0
    80001df0:	00c0006f          	j	80001dfc <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80001df4:	00001097          	auipc	ra,0x1
    80001df8:	d7c080e7          	jalr	-644(ra) # 80002b70 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80001dfc:	fffff097          	auipc	ra,0xfffff
    80001e00:	60c080e7          	jalr	1548(ra) # 80001408 <_Z4getcv>
    80001e04:	0005059b          	sext.w	a1,a0
    80001e08:	01b00793          	li	a5,27
    80001e0c:	02f58a63          	beq	a1,a5,80001e40 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80001e10:	0084b503          	ld	a0,8(s1)
    80001e14:	00000097          	auipc	ra,0x0
    80001e18:	d10080e7          	jalr	-752(ra) # 80001b24 <_ZN9BufferCPP3putEi>
        i++;
    80001e1c:	0019071b          	addiw	a4,s2,1
    80001e20:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80001e24:	0004a683          	lw	a3,0(s1)
    80001e28:	0026979b          	slliw	a5,a3,0x2
    80001e2c:	00d787bb          	addw	a5,a5,a3
    80001e30:	0017979b          	slliw	a5,a5,0x1
    80001e34:	02f767bb          	remw	a5,a4,a5
    80001e38:	fc0792e3          	bnez	a5,80001dfc <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80001e3c:	fb9ff06f          	j	80001df4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80001e40:	00100793          	li	a5,1
    80001e44:	00005717          	auipc	a4,0x5
    80001e48:	68f72223          	sw	a5,1668(a4) # 800074c8 <threadEnd>
    td->buffer->put('!');
    80001e4c:	0109b783          	ld	a5,16(s3)
    80001e50:	02100593          	li	a1,33
    80001e54:	0087b503          	ld	a0,8(a5)
    80001e58:	00000097          	auipc	ra,0x0
    80001e5c:	ccc080e7          	jalr	-820(ra) # 80001b24 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80001e60:	0104b503          	ld	a0,16(s1)
    80001e64:	00001097          	auipc	ra,0x1
    80001e68:	e34080e7          	jalr	-460(ra) # 80002c98 <_ZN9Semaphore6signalEv>
}
    80001e6c:	02813083          	ld	ra,40(sp)
    80001e70:	02013403          	ld	s0,32(sp)
    80001e74:	01813483          	ld	s1,24(sp)
    80001e78:	01013903          	ld	s2,16(sp)
    80001e7c:	00813983          	ld	s3,8(sp)
    80001e80:	03010113          	addi	sp,sp,48
    80001e84:	00008067          	ret

0000000080001e88 <_ZN8Producer8producerEPv>:
    void run() override {
        producer(td);
    }
};

void Producer::producer(void *arg) {
    80001e88:	fe010113          	addi	sp,sp,-32
    80001e8c:	00113c23          	sd	ra,24(sp)
    80001e90:	00813823          	sd	s0,16(sp)
    80001e94:	00913423          	sd	s1,8(sp)
    80001e98:	01213023          	sd	s2,0(sp)
    80001e9c:	02010413          	addi	s0,sp,32
    80001ea0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80001ea4:	00000913          	li	s2,0
    80001ea8:	00c0006f          	j	80001eb4 <_ZN8Producer8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80001eac:	00001097          	auipc	ra,0x1
    80001eb0:	cc4080e7          	jalr	-828(ra) # 80002b70 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80001eb4:	00005797          	auipc	a5,0x5
    80001eb8:	6147a783          	lw	a5,1556(a5) # 800074c8 <threadEnd>
    80001ebc:	02079e63          	bnez	a5,80001ef8 <_ZN8Producer8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80001ec0:	0004a583          	lw	a1,0(s1)
    80001ec4:	0305859b          	addiw	a1,a1,48
    80001ec8:	0084b503          	ld	a0,8(s1)
    80001ecc:	00000097          	auipc	ra,0x0
    80001ed0:	c58080e7          	jalr	-936(ra) # 80001b24 <_ZN9BufferCPP3putEi>
        i++;
    80001ed4:	0019071b          	addiw	a4,s2,1
    80001ed8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80001edc:	0004a683          	lw	a3,0(s1)
    80001ee0:	0026979b          	slliw	a5,a3,0x2
    80001ee4:	00d787bb          	addw	a5,a5,a3
    80001ee8:	0017979b          	slliw	a5,a5,0x1
    80001eec:	02f767bb          	remw	a5,a4,a5
    80001ef0:	fc0792e3          	bnez	a5,80001eb4 <_ZN8Producer8producerEPv+0x2c>
    80001ef4:	fb9ff06f          	j	80001eac <_ZN8Producer8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80001ef8:	0104b503          	ld	a0,16(s1)
    80001efc:	00001097          	auipc	ra,0x1
    80001f00:	d9c080e7          	jalr	-612(ra) # 80002c98 <_ZN9Semaphore6signalEv>
}
    80001f04:	01813083          	ld	ra,24(sp)
    80001f08:	01013403          	ld	s0,16(sp)
    80001f0c:	00813483          	ld	s1,8(sp)
    80001f10:	00013903          	ld	s2,0(sp)
    80001f14:	02010113          	addi	sp,sp,32
    80001f18:	00008067          	ret

0000000080001f1c <_ZN8Consumer8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void Consumer::consumer(void *arg) {
    80001f1c:	fd010113          	addi	sp,sp,-48
    80001f20:	02113423          	sd	ra,40(sp)
    80001f24:	02813023          	sd	s0,32(sp)
    80001f28:	00913c23          	sd	s1,24(sp)
    80001f2c:	01213823          	sd	s2,16(sp)
    80001f30:	01313423          	sd	s3,8(sp)
    80001f34:	01413023          	sd	s4,0(sp)
    80001f38:	03010413          	addi	s0,sp,48
    80001f3c:	00050993          	mv	s3,a0
    80001f40:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80001f44:	00000a13          	li	s4,0
    80001f48:	01c0006f          	j	80001f64 <_ZN8Consumer8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80001f4c:	00001097          	auipc	ra,0x1
    80001f50:	c24080e7          	jalr	-988(ra) # 80002b70 <_ZN6Thread8dispatchEv>
    80001f54:	0500006f          	j	80001fa4 <_ZN8Consumer8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80001f58:	00a00513          	li	a0,10
    80001f5c:	fffff097          	auipc	ra,0xfffff
    80001f60:	4d8080e7          	jalr	1240(ra) # 80001434 <_Z4putcc>
    while (!threadEnd) {
    80001f64:	00005797          	auipc	a5,0x5
    80001f68:	5647a783          	lw	a5,1380(a5) # 800074c8 <threadEnd>
    80001f6c:	06079263          	bnez	a5,80001fd0 <_ZN8Consumer8consumerEPv+0xb4>
        int key = data->buffer->get();
    80001f70:	00893503          	ld	a0,8(s2)
    80001f74:	00000097          	auipc	ra,0x0
    80001f78:	c40080e7          	jalr	-960(ra) # 80001bb4 <_ZN9BufferCPP3getEv>
        i++;
    80001f7c:	001a049b          	addiw	s1,s4,1
    80001f80:	00048a1b          	sext.w	s4,s1
        putc(key);
    80001f84:	0ff57513          	andi	a0,a0,255
    80001f88:	fffff097          	auipc	ra,0xfffff
    80001f8c:	4ac080e7          	jalr	1196(ra) # 80001434 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80001f90:	00092703          	lw	a4,0(s2)
    80001f94:	0027179b          	slliw	a5,a4,0x2
    80001f98:	00e787bb          	addw	a5,a5,a4
    80001f9c:	02f4e7bb          	remw	a5,s1,a5
    80001fa0:	fa0786e3          	beqz	a5,80001f4c <_ZN8Consumer8consumerEPv+0x30>
        if (i % 80 == 0) {
    80001fa4:	05000793          	li	a5,80
    80001fa8:	02f4e4bb          	remw	s1,s1,a5
    80001fac:	fa049ce3          	bnez	s1,80001f64 <_ZN8Consumer8consumerEPv+0x48>
    80001fb0:	fa9ff06f          	j	80001f58 <_ZN8Consumer8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80001fb4:	0109b783          	ld	a5,16(s3)
    80001fb8:	0087b503          	ld	a0,8(a5)
    80001fbc:	00000097          	auipc	ra,0x0
    80001fc0:	bf8080e7          	jalr	-1032(ra) # 80001bb4 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80001fc4:	0ff57513          	andi	a0,a0,255
    80001fc8:	00001097          	auipc	ra,0x1
    80001fcc:	d74080e7          	jalr	-652(ra) # 80002d3c <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80001fd0:	0109b783          	ld	a5,16(s3)
    80001fd4:	0087b503          	ld	a0,8(a5)
    80001fd8:	00000097          	auipc	ra,0x0
    80001fdc:	c68080e7          	jalr	-920(ra) # 80001c40 <_ZN9BufferCPP6getCntEv>
    80001fe0:	fca04ae3          	bgtz	a0,80001fb4 <_ZN8Consumer8consumerEPv+0x98>
    }

    data->wait->signal();
    80001fe4:	01093503          	ld	a0,16(s2)
    80001fe8:	00001097          	auipc	ra,0x1
    80001fec:	cb0080e7          	jalr	-848(ra) # 80002c98 <_ZN9Semaphore6signalEv>
}
    80001ff0:	02813083          	ld	ra,40(sp)
    80001ff4:	02013403          	ld	s0,32(sp)
    80001ff8:	01813483          	ld	s1,24(sp)
    80001ffc:	01013903          	ld	s2,16(sp)
    80002000:	00813983          	ld	s3,8(sp)
    80002004:	00013a03          	ld	s4,0(sp)
    80002008:	03010113          	addi	sp,sp,48
    8000200c:	00008067          	ret

0000000080002010 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80002010:	f8010113          	addi	sp,sp,-128
    80002014:	06113c23          	sd	ra,120(sp)
    80002018:	06813823          	sd	s0,112(sp)
    8000201c:	06913423          	sd	s1,104(sp)
    80002020:	07213023          	sd	s2,96(sp)
    80002024:	05313c23          	sd	s3,88(sp)
    80002028:	05413823          	sd	s4,80(sp)
    8000202c:	05513423          	sd	s5,72(sp)
    80002030:	05613023          	sd	s6,64(sp)
    80002034:	03713c23          	sd	s7,56(sp)
    80002038:	03813823          	sd	s8,48(sp)
    8000203c:	03913423          	sd	s9,40(sp)
    80002040:	08010413          	addi	s0,sp,128

    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    80002044:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80002048:	00004517          	auipc	a0,0x4
    8000204c:	ff050513          	addi	a0,a0,-16 # 80006038 <CONSOLE_STATUS+0x28>
    80002050:	fffff097          	auipc	ra,0xfffff
    80002054:	6d4080e7          	jalr	1748(ra) # 80001724 <_Z11printStringPKc>
    getString(input, 30);
    80002058:	01e00593          	li	a1,30
    8000205c:	f8040493          	addi	s1,s0,-128
    80002060:	00048513          	mv	a0,s1
    80002064:	fffff097          	auipc	ra,0xfffff
    80002068:	73c080e7          	jalr	1852(ra) # 800017a0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000206c:	00048513          	mv	a0,s1
    80002070:	fffff097          	auipc	ra,0xfffff
    80002074:	7fc080e7          	jalr	2044(ra) # 8000186c <_Z11stringToIntPKc>
    80002078:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000207c:	00004517          	auipc	a0,0x4
    80002080:	fdc50513          	addi	a0,a0,-36 # 80006058 <CONSOLE_STATUS+0x48>
    80002084:	fffff097          	auipc	ra,0xfffff
    80002088:	6a0080e7          	jalr	1696(ra) # 80001724 <_Z11printStringPKc>
    getString(input, 30);
    8000208c:	01e00593          	li	a1,30
    80002090:	00048513          	mv	a0,s1
    80002094:	fffff097          	auipc	ra,0xfffff
    80002098:	70c080e7          	jalr	1804(ra) # 800017a0 <_Z9getStringPci>
    n = stringToInt(input);
    8000209c:	00048513          	mv	a0,s1
    800020a0:	fffff097          	auipc	ra,0xfffff
    800020a4:	7cc080e7          	jalr	1996(ra) # 8000186c <_Z11stringToIntPKc>
    800020a8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800020ac:	00004517          	auipc	a0,0x4
    800020b0:	fcc50513          	addi	a0,a0,-52 # 80006078 <CONSOLE_STATUS+0x68>
    800020b4:	fffff097          	auipc	ra,0xfffff
    800020b8:	670080e7          	jalr	1648(ra) # 80001724 <_Z11printStringPKc>
    800020bc:	00000613          	li	a2,0
    800020c0:	00a00593          	li	a1,10
    800020c4:	00090513          	mv	a0,s2
    800020c8:	fffff097          	auipc	ra,0xfffff
    800020cc:	7f4080e7          	jalr	2036(ra) # 800018bc <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800020d0:	00004517          	auipc	a0,0x4
    800020d4:	fc050513          	addi	a0,a0,-64 # 80006090 <CONSOLE_STATUS+0x80>
    800020d8:	fffff097          	auipc	ra,0xfffff
    800020dc:	64c080e7          	jalr	1612(ra) # 80001724 <_Z11printStringPKc>
    800020e0:	00000613          	li	a2,0
    800020e4:	00a00593          	li	a1,10
    800020e8:	00048513          	mv	a0,s1
    800020ec:	fffff097          	auipc	ra,0xfffff
    800020f0:	7d0080e7          	jalr	2000(ra) # 800018bc <_Z8printIntiii>
    printString(".\n");
    800020f4:	00004517          	auipc	a0,0x4
    800020f8:	fb450513          	addi	a0,a0,-76 # 800060a8 <CONSOLE_STATUS+0x98>
    800020fc:	fffff097          	auipc	ra,0xfffff
    80002100:	628080e7          	jalr	1576(ra) # 80001724 <_Z11printStringPKc>
    if(threadNum > n) {
    80002104:	0324c463          	blt	s1,s2,8000212c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80002108:	03205c63          	blez	s2,80002140 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000210c:	03800513          	li	a0,56
    80002110:	00001097          	auipc	ra,0x1
    80002114:	8a4080e7          	jalr	-1884(ra) # 800029b4 <_Znwm>
    80002118:	00050a93          	mv	s5,a0
    8000211c:	00048593          	mv	a1,s1
    80002120:	00000097          	auipc	ra,0x0
    80002124:	8b0080e7          	jalr	-1872(ra) # 800019d0 <_ZN9BufferCPPC1Ei>
    80002128:	0300006f          	j	80002158 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti veci od velicine bafera!\n");
    8000212c:	00004517          	auipc	a0,0x4
    80002130:	f8450513          	addi	a0,a0,-124 # 800060b0 <CONSOLE_STATUS+0xa0>
    80002134:	fffff097          	auipc	ra,0xfffff
    80002138:	5f0080e7          	jalr	1520(ra) # 80001724 <_Z11printStringPKc>
        return;
    8000213c:	0140006f          	j	80002150 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002140:	00004517          	auipc	a0,0x4
    80002144:	fa850513          	addi	a0,a0,-88 # 800060e8 <CONSOLE_STATUS+0xd8>
    80002148:	fffff097          	auipc	ra,0xfffff
    8000214c:	5dc080e7          	jalr	1500(ra) # 80001724 <_Z11printStringPKc>
        return;
    80002150:	000b8113          	mv	sp,s7
    80002154:	2400006f          	j	80002394 <_Z29producerConsumer_CPP_Sync_APIv+0x384>
    waitForAll = new Semaphore(0);
    80002158:	01000513          	li	a0,16
    8000215c:	00001097          	auipc	ra,0x1
    80002160:	858080e7          	jalr	-1960(ra) # 800029b4 <_Znwm>
    80002164:	00050493          	mv	s1,a0
    80002168:	00000593          	li	a1,0
    8000216c:	00001097          	auipc	ra,0x1
    80002170:	b5c080e7          	jalr	-1188(ra) # 80002cc8 <_ZN9SemaphoreC1Ej>
    80002174:	00005717          	auipc	a4,0x5
    80002178:	35470713          	addi	a4,a4,852 # 800074c8 <threadEnd>
    8000217c:	00973423          	sd	s1,8(a4)
    Thread* threads[threadNum];
    80002180:	00391793          	slli	a5,s2,0x3
    80002184:	00f78793          	addi	a5,a5,15
    80002188:	ff07f793          	andi	a5,a5,-16
    8000218c:	40f10133          	sub	sp,sp,a5
    80002190:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80002194:	0019069b          	addiw	a3,s2,1
    80002198:	00169793          	slli	a5,a3,0x1
    8000219c:	00d787b3          	add	a5,a5,a3
    800021a0:	00379793          	slli	a5,a5,0x3
    800021a4:	00f78793          	addi	a5,a5,15
    800021a8:	ff07f793          	andi	a5,a5,-16
    800021ac:	40f10133          	sub	sp,sp,a5
    800021b0:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800021b4:	00191493          	slli	s1,s2,0x1
    800021b8:	012487b3          	add	a5,s1,s2
    800021bc:	00379793          	slli	a5,a5,0x3
    800021c0:	00fa07b3          	add	a5,s4,a5
    800021c4:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800021c8:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    800021cc:	00873703          	ld	a4,8(a4)
    800021d0:	00e7b823          	sd	a4,16(a5)
    consumerThread = new Consumer(data+threadNum);
    800021d4:	01800513          	li	a0,24
    800021d8:	00000097          	auipc	ra,0x0
    800021dc:	7dc080e7          	jalr	2012(ra) # 800029b4 <_Znwm>
    800021e0:	00050b13          	mv	s6,a0
    800021e4:	012484b3          	add	s1,s1,s2
    800021e8:	00349493          	slli	s1,s1,0x3
    800021ec:	009a04b3          	add	s1,s4,s1
    Consumer(thread_data* _td):Thread(), td(_td) {}
    800021f0:	00001097          	auipc	ra,0x1
    800021f4:	a24080e7          	jalr	-1500(ra) # 80002c14 <_ZN6ThreadC1Ev>
    800021f8:	00005797          	auipc	a5,0x5
    800021fc:	1e878793          	addi	a5,a5,488 # 800073e0 <_ZTV8Consumer+0x10>
    80002200:	00fb3023          	sd	a5,0(s6)
    80002204:	009b3823          	sd	s1,16(s6)
    consumerThread->start();
    80002208:	000b0513          	mv	a0,s6
    8000220c:	00001097          	auipc	ra,0x1
    80002210:	98c080e7          	jalr	-1652(ra) # 80002b98 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80002214:	00000493          	li	s1,0
    80002218:	0380006f          	j	80002250 <_Z29producerConsumer_CPP_Sync_APIv+0x240>
    Producer(thread_data* _td):Thread(), td(_td) {}
    8000221c:	00005797          	auipc	a5,0x5
    80002220:	19c78793          	addi	a5,a5,412 # 800073b8 <_ZTV8Producer+0x10>
    80002224:	00fcb023          	sd	a5,0(s9)
    80002228:	018cb823          	sd	s8,16(s9)
            threads[i] = new Producer(data+i);
    8000222c:	00349793          	slli	a5,s1,0x3
    80002230:	00f987b3          	add	a5,s3,a5
    80002234:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80002238:	00349793          	slli	a5,s1,0x3
    8000223c:	00f987b3          	add	a5,s3,a5
    80002240:	0007b503          	ld	a0,0(a5)
    80002244:	00001097          	auipc	ra,0x1
    80002248:	954080e7          	jalr	-1708(ra) # 80002b98 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000224c:	0014849b          	addiw	s1,s1,1
    80002250:	0b24d063          	bge	s1,s2,800022f0 <_Z29producerConsumer_CPP_Sync_APIv+0x2e0>
        data[i].id = i;
    80002254:	00149793          	slli	a5,s1,0x1
    80002258:	009787b3          	add	a5,a5,s1
    8000225c:	00379793          	slli	a5,a5,0x3
    80002260:	00fa07b3          	add	a5,s4,a5
    80002264:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80002268:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    8000226c:	00005717          	auipc	a4,0x5
    80002270:	26473703          	ld	a4,612(a4) # 800074d0 <waitForAll>
    80002274:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80002278:	02905863          	blez	s1,800022a8 <_Z29producerConsumer_CPP_Sync_APIv+0x298>
            threads[i] = new Producer(data+i);
    8000227c:	01800513          	li	a0,24
    80002280:	00000097          	auipc	ra,0x0
    80002284:	734080e7          	jalr	1844(ra) # 800029b4 <_Znwm>
    80002288:	00050c93          	mv	s9,a0
    8000228c:	00149c13          	slli	s8,s1,0x1
    80002290:	009c0c33          	add	s8,s8,s1
    80002294:	003c1c13          	slli	s8,s8,0x3
    80002298:	018a0c33          	add	s8,s4,s8
    Producer(thread_data* _td):Thread(), td(_td) {}
    8000229c:	00001097          	auipc	ra,0x1
    800022a0:	978080e7          	jalr	-1672(ra) # 80002c14 <_ZN6ThreadC1Ev>
    800022a4:	f79ff06f          	j	8000221c <_Z29producerConsumer_CPP_Sync_APIv+0x20c>
            threads[i] = new ProducerKeyboard(data+i);
    800022a8:	01800513          	li	a0,24
    800022ac:	00000097          	auipc	ra,0x0
    800022b0:	708080e7          	jalr	1800(ra) # 800029b4 <_Znwm>
    800022b4:	00050c93          	mv	s9,a0
    800022b8:	00149c13          	slli	s8,s1,0x1
    800022bc:	009c0c33          	add	s8,s8,s1
    800022c0:	003c1c13          	slli	s8,s8,0x3
    800022c4:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800022c8:	00001097          	auipc	ra,0x1
    800022cc:	94c080e7          	jalr	-1716(ra) # 80002c14 <_ZN6ThreadC1Ev>
    800022d0:	00005797          	auipc	a5,0x5
    800022d4:	0c078793          	addi	a5,a5,192 # 80007390 <_ZTV16ProducerKeyboard+0x10>
    800022d8:	00fcb023          	sd	a5,0(s9)
    800022dc:	018cb823          	sd	s8,16(s9)
            threads[i] = new ProducerKeyboard(data+i);
    800022e0:	00349793          	slli	a5,s1,0x3
    800022e4:	00f987b3          	add	a5,s3,a5
    800022e8:	0197b023          	sd	s9,0(a5)
    800022ec:	f4dff06f          	j	80002238 <_Z29producerConsumer_CPP_Sync_APIv+0x228>
    Thread::dispatch();
    800022f0:	00001097          	auipc	ra,0x1
    800022f4:	880080e7          	jalr	-1920(ra) # 80002b70 <_ZN6Thread8dispatchEv>
    // do ovde
    800022f8:	00000493          	li	s1,0
    800022fc:	00994e63          	blt	s2,s1,80002318 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    for (int i = 0; i <= threadNum; i++) {
    80002300:	00005517          	auipc	a0,0x5
    80002304:	1d053503          	ld	a0,464(a0) # 800074d0 <waitForAll>
    80002308:	00001097          	auipc	ra,0x1
    8000230c:	960080e7          	jalr	-1696(ra) # 80002c68 <_ZN9Semaphore4waitEv>
    // do ovde
    80002310:	0014849b          	addiw	s1,s1,1
    80002314:	fe9ff06f          	j	800022fc <_Z29producerConsumer_CPP_Sync_APIv+0x2ec>

    80002318:	00000493          	li	s1,0
    8000231c:	0080006f          	j	80002324 <_Z29producerConsumer_CPP_Sync_APIv+0x314>
    80002320:	0014849b          	addiw	s1,s1,1
    80002324:	0324d263          	bge	s1,s2,80002348 <_Z29producerConsumer_CPP_Sync_APIv+0x338>
    for (int i = 0; i < threadNum; i++) {
    80002328:	00349793          	slli	a5,s1,0x3
    8000232c:	00f987b3          	add	a5,s3,a5
    80002330:	0007b503          	ld	a0,0(a5)
    80002334:	fe0506e3          	beqz	a0,80002320 <_Z29producerConsumer_CPP_Sync_APIv+0x310>
    80002338:	00053783          	ld	a5,0(a0)
    8000233c:	0087b783          	ld	a5,8(a5)
    80002340:	000780e7          	jalr	a5
    80002344:	fddff06f          	j	80002320 <_Z29producerConsumer_CPP_Sync_APIv+0x310>
    }
    80002348:	000b0a63          	beqz	s6,8000235c <_Z29producerConsumer_CPP_Sync_APIv+0x34c>
    8000234c:	000b3783          	ld	a5,0(s6)
    80002350:	0087b783          	ld	a5,8(a5)
    80002354:	000b0513          	mv	a0,s6
    80002358:	000780e7          	jalr	a5
    delete consumerThread;
    8000235c:	00005517          	auipc	a0,0x5
    80002360:	17453503          	ld	a0,372(a0) # 800074d0 <waitForAll>
    80002364:	00050863          	beqz	a0,80002374 <_Z29producerConsumer_CPP_Sync_APIv+0x364>
    80002368:	00053783          	ld	a5,0(a0)
    8000236c:	0087b783          	ld	a5,8(a5)
    80002370:	000780e7          	jalr	a5
    delete waitForAll;
    80002374:	000a8e63          	beqz	s5,80002390 <_Z29producerConsumer_CPP_Sync_APIv+0x380>
    80002378:	000a8513          	mv	a0,s5
    8000237c:	00000097          	auipc	ra,0x0
    80002380:	94c080e7          	jalr	-1716(ra) # 80001cc8 <_ZN9BufferCPPD1Ev>
    80002384:	000a8513          	mv	a0,s5
    80002388:	00000097          	auipc	ra,0x0
    8000238c:	67c080e7          	jalr	1660(ra) # 80002a04 <_ZdlPv>
    80002390:	000b8113          	mv	sp,s7
    delete buffer;

    80002394:	f8040113          	addi	sp,s0,-128
    80002398:	07813083          	ld	ra,120(sp)
    8000239c:	07013403          	ld	s0,112(sp)
    800023a0:	06813483          	ld	s1,104(sp)
    800023a4:	06013903          	ld	s2,96(sp)
    800023a8:	05813983          	ld	s3,88(sp)
    800023ac:	05013a03          	ld	s4,80(sp)
    800023b0:	04813a83          	ld	s5,72(sp)
    800023b4:	04013b03          	ld	s6,64(sp)
    800023b8:	03813b83          	ld	s7,56(sp)
    800023bc:	03013c03          	ld	s8,48(sp)
    800023c0:	02813c83          	ld	s9,40(sp)
    800023c4:	08010113          	addi	sp,sp,128
    800023c8:	00008067          	ret
    800023cc:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800023d0:	000a8513          	mv	a0,s5
    800023d4:	00000097          	auipc	ra,0x0
    800023d8:	630080e7          	jalr	1584(ra) # 80002a04 <_ZdlPv>
    800023dc:	00048513          	mv	a0,s1
    800023e0:	00006097          	auipc	ra,0x6
    800023e4:	1f8080e7          	jalr	504(ra) # 800085d8 <_Unwind_Resume>
    800023e8:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    800023ec:	00048513          	mv	a0,s1
    800023f0:	00000097          	auipc	ra,0x0
    800023f4:	614080e7          	jalr	1556(ra) # 80002a04 <_ZdlPv>
    800023f8:	00090513          	mv	a0,s2
    800023fc:	00006097          	auipc	ra,0x6
    80002400:	1dc080e7          	jalr	476(ra) # 800085d8 <_Unwind_Resume>
    80002404:	00050493          	mv	s1,a0
    consumerThread = new Consumer(data+threadNum);
    80002408:	000b0513          	mv	a0,s6
    8000240c:	00000097          	auipc	ra,0x0
    80002410:	5f8080e7          	jalr	1528(ra) # 80002a04 <_ZdlPv>
    80002414:	00048513          	mv	a0,s1
    80002418:	00006097          	auipc	ra,0x6
    8000241c:	1c0080e7          	jalr	448(ra) # 800085d8 <_Unwind_Resume>
    80002420:	00050493          	mv	s1,a0
            threads[i] = new Producer(data+i);
    80002424:	000c8513          	mv	a0,s9
    80002428:	00000097          	auipc	ra,0x0
    8000242c:	5dc080e7          	jalr	1500(ra) # 80002a04 <_ZdlPv>
    80002430:	00048513          	mv	a0,s1
    80002434:	00006097          	auipc	ra,0x6
    80002438:	1a4080e7          	jalr	420(ra) # 800085d8 <_Unwind_Resume>
    8000243c:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80002440:	000c8513          	mv	a0,s9
    80002444:	00000097          	auipc	ra,0x0
    80002448:	5c0080e7          	jalr	1472(ra) # 80002a04 <_ZdlPv>
    8000244c:	00048513          	mv	a0,s1
    80002450:	00006097          	auipc	ra,0x6
    80002454:	188080e7          	jalr	392(ra) # 800085d8 <_Unwind_Resume>

0000000080002458 <_Z8userMainv>:
#include "../h/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../h/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../h/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    80002458:	ff010113          	addi	sp,sp,-16
    8000245c:	00113423          	sd	ra,8(sp)
    80002460:	00813023          	sd	s0,0(sp)
    80002464:	01010413          	addi	s0,sp,16
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    //Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

    //producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta
    80002468:	00000097          	auipc	ra,0x0
    8000246c:	ba8080e7          	jalr	-1112(ra) # 80002010 <_Z29producerConsumer_CPP_Sync_APIv>

    //testSleeping(); // thread_sleep test C API
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    80002470:	00813083          	ld	ra,8(sp)
    80002474:	00013403          	ld	s0,0(sp)
    80002478:	01010113          	addi	sp,sp,16
    8000247c:	00008067          	ret

0000000080002480 <_ZN8ConsumerD1Ev>:
class Consumer:public Thread {
    80002480:	ff010113          	addi	sp,sp,-16
    80002484:	00113423          	sd	ra,8(sp)
    80002488:	00813023          	sd	s0,0(sp)
    8000248c:	01010413          	addi	s0,sp,16
    80002490:	00005797          	auipc	a5,0x5
    80002494:	f5078793          	addi	a5,a5,-176 # 800073e0 <_ZTV8Consumer+0x10>
    80002498:	00f53023          	sd	a5,0(a0)
    8000249c:	00000097          	auipc	ra,0x0
    800024a0:	63c080e7          	jalr	1596(ra) # 80002ad8 <_ZN6ThreadD1Ev>
    800024a4:	00813083          	ld	ra,8(sp)
    800024a8:	00013403          	ld	s0,0(sp)
    800024ac:	01010113          	addi	sp,sp,16
    800024b0:	00008067          	ret

00000000800024b4 <_ZN8ConsumerD0Ev>:
    800024b4:	fe010113          	addi	sp,sp,-32
    800024b8:	00113c23          	sd	ra,24(sp)
    800024bc:	00813823          	sd	s0,16(sp)
    800024c0:	00913423          	sd	s1,8(sp)
    800024c4:	02010413          	addi	s0,sp,32
    800024c8:	00050493          	mv	s1,a0
    800024cc:	00005797          	auipc	a5,0x5
    800024d0:	f1478793          	addi	a5,a5,-236 # 800073e0 <_ZTV8Consumer+0x10>
    800024d4:	00f53023          	sd	a5,0(a0)
    800024d8:	00000097          	auipc	ra,0x0
    800024dc:	600080e7          	jalr	1536(ra) # 80002ad8 <_ZN6ThreadD1Ev>
    800024e0:	00048513          	mv	a0,s1
    800024e4:	00000097          	auipc	ra,0x0
    800024e8:	520080e7          	jalr	1312(ra) # 80002a04 <_ZdlPv>
    800024ec:	01813083          	ld	ra,24(sp)
    800024f0:	01013403          	ld	s0,16(sp)
    800024f4:	00813483          	ld	s1,8(sp)
    800024f8:	02010113          	addi	sp,sp,32
    800024fc:	00008067          	ret

0000000080002500 <_ZN8ProducerD1Ev>:
class Producer:public Thread {
    80002500:	ff010113          	addi	sp,sp,-16
    80002504:	00113423          	sd	ra,8(sp)
    80002508:	00813023          	sd	s0,0(sp)
    8000250c:	01010413          	addi	s0,sp,16
    80002510:	00005797          	auipc	a5,0x5
    80002514:	ea878793          	addi	a5,a5,-344 # 800073b8 <_ZTV8Producer+0x10>
    80002518:	00f53023          	sd	a5,0(a0)
    8000251c:	00000097          	auipc	ra,0x0
    80002520:	5bc080e7          	jalr	1468(ra) # 80002ad8 <_ZN6ThreadD1Ev>
    80002524:	00813083          	ld	ra,8(sp)
    80002528:	00013403          	ld	s0,0(sp)
    8000252c:	01010113          	addi	sp,sp,16
    80002530:	00008067          	ret

0000000080002534 <_ZN8ProducerD0Ev>:
    80002534:	fe010113          	addi	sp,sp,-32
    80002538:	00113c23          	sd	ra,24(sp)
    8000253c:	00813823          	sd	s0,16(sp)
    80002540:	00913423          	sd	s1,8(sp)
    80002544:	02010413          	addi	s0,sp,32
    80002548:	00050493          	mv	s1,a0
    8000254c:	00005797          	auipc	a5,0x5
    80002550:	e6c78793          	addi	a5,a5,-404 # 800073b8 <_ZTV8Producer+0x10>
    80002554:	00f53023          	sd	a5,0(a0)
    80002558:	00000097          	auipc	ra,0x0
    8000255c:	580080e7          	jalr	1408(ra) # 80002ad8 <_ZN6ThreadD1Ev>
    80002560:	00048513          	mv	a0,s1
    80002564:	00000097          	auipc	ra,0x0
    80002568:	4a0080e7          	jalr	1184(ra) # 80002a04 <_ZdlPv>
    8000256c:	01813083          	ld	ra,24(sp)
    80002570:	01013403          	ld	s0,16(sp)
    80002574:	00813483          	ld	s1,8(sp)
    80002578:	02010113          	addi	sp,sp,32
    8000257c:	00008067          	ret

0000000080002580 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80002580:	ff010113          	addi	sp,sp,-16
    80002584:	00113423          	sd	ra,8(sp)
    80002588:	00813023          	sd	s0,0(sp)
    8000258c:	01010413          	addi	s0,sp,16
    80002590:	00005797          	auipc	a5,0x5
    80002594:	e0078793          	addi	a5,a5,-512 # 80007390 <_ZTV16ProducerKeyboard+0x10>
    80002598:	00f53023          	sd	a5,0(a0)
    8000259c:	00000097          	auipc	ra,0x0
    800025a0:	53c080e7          	jalr	1340(ra) # 80002ad8 <_ZN6ThreadD1Ev>
    800025a4:	00813083          	ld	ra,8(sp)
    800025a8:	00013403          	ld	s0,0(sp)
    800025ac:	01010113          	addi	sp,sp,16
    800025b0:	00008067          	ret

00000000800025b4 <_ZN16ProducerKeyboardD0Ev>:
    800025b4:	fe010113          	addi	sp,sp,-32
    800025b8:	00113c23          	sd	ra,24(sp)
    800025bc:	00813823          	sd	s0,16(sp)
    800025c0:	00913423          	sd	s1,8(sp)
    800025c4:	02010413          	addi	s0,sp,32
    800025c8:	00050493          	mv	s1,a0
    800025cc:	00005797          	auipc	a5,0x5
    800025d0:	dc478793          	addi	a5,a5,-572 # 80007390 <_ZTV16ProducerKeyboard+0x10>
    800025d4:	00f53023          	sd	a5,0(a0)
    800025d8:	00000097          	auipc	ra,0x0
    800025dc:	500080e7          	jalr	1280(ra) # 80002ad8 <_ZN6ThreadD1Ev>
    800025e0:	00048513          	mv	a0,s1
    800025e4:	00000097          	auipc	ra,0x0
    800025e8:	420080e7          	jalr	1056(ra) # 80002a04 <_ZdlPv>
    800025ec:	01813083          	ld	ra,24(sp)
    800025f0:	01013403          	ld	s0,16(sp)
    800025f4:	00813483          	ld	s1,8(sp)
    800025f8:	02010113          	addi	sp,sp,32
    800025fc:	00008067          	ret

0000000080002600 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80002600:	ff010113          	addi	sp,sp,-16
    80002604:	00113423          	sd	ra,8(sp)
    80002608:	00813023          	sd	s0,0(sp)
    8000260c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80002610:	01053583          	ld	a1,16(a0)
    80002614:	fffff097          	auipc	ra,0xfffff
    80002618:	7b4080e7          	jalr	1972(ra) # 80001dc8 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    8000261c:	00813083          	ld	ra,8(sp)
    80002620:	00013403          	ld	s0,0(sp)
    80002624:	01010113          	addi	sp,sp,16
    80002628:	00008067          	ret

000000008000262c <_ZN8Producer3runEv>:
    void run() override {
    8000262c:	ff010113          	addi	sp,sp,-16
    80002630:	00113423          	sd	ra,8(sp)
    80002634:	00813023          	sd	s0,0(sp)
    80002638:	01010413          	addi	s0,sp,16
        producer(td);
    8000263c:	01053583          	ld	a1,16(a0)
    80002640:	00000097          	auipc	ra,0x0
    80002644:	848080e7          	jalr	-1976(ra) # 80001e88 <_ZN8Producer8producerEPv>
    }
    80002648:	00813083          	ld	ra,8(sp)
    8000264c:	00013403          	ld	s0,0(sp)
    80002650:	01010113          	addi	sp,sp,16
    80002654:	00008067          	ret

0000000080002658 <_ZN8Consumer3runEv>:
    void run() override {
    80002658:	ff010113          	addi	sp,sp,-16
    8000265c:	00113423          	sd	ra,8(sp)
    80002660:	00813023          	sd	s0,0(sp)
    80002664:	01010413          	addi	s0,sp,16
        consumer(td);
    80002668:	01053583          	ld	a1,16(a0)
    8000266c:	00000097          	auipc	ra,0x0
    80002670:	8b0080e7          	jalr	-1872(ra) # 80001f1c <_ZN8Consumer8consumerEPv>
    }
    80002674:	00813083          	ld	ra,8(sp)
    80002678:	00013403          	ld	s0,0(sp)
    8000267c:	01010113          	addi	sp,sp,16
    80002680:	00008067          	ret

0000000080002684 <main>:
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/UserMain.hpp"


int main() {
    80002684:	fd010113          	addi	sp,sp,-48
    80002688:	02113423          	sd	ra,40(sp)
    8000268c:	02813023          	sd	s0,32(sp)
    80002690:	00913c23          	sd	s1,24(sp)
    80002694:	03010413          	addi	s0,sp,48
    MemoryAllocator::memAlloc();
    80002698:	00001097          	auipc	ra,0x1
    8000269c:	b30080e7          	jalr	-1232(ra) # 800031c8 <_ZN15MemoryAllocator8memAllocEv>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    800026a0:	00005797          	auipc	a5,0x5
    800026a4:	db07b783          	ld	a5,-592(a5) # 80007450 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    800026a8:	10579073          	csrw	stvec,a5

    // ovo mi treba jer ako ovo ne uradim imam gresku kad se desi prvi dispatch i onda
    // ne zna sta on da radi zato guram praznu nit da radi u pocetku
    TCB* run;
    thread_create(&run, nullptr, nullptr);
    800026ac:	00000613          	li	a2,0
    800026b0:	00000593          	li	a1,0
    800026b4:	fd840513          	addi	a0,s0,-40
    800026b8:	fffff097          	auipc	ra,0xfffff
    800026bc:	bfc080e7          	jalr	-1028(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = run;
    800026c0:	00005797          	auipc	a5,0x5
    800026c4:	da87b783          	ld	a5,-600(a5) # 80007468 <_GLOBAL_OFFSET_TABLE_+0x28>
    800026c8:	fd843703          	ld	a4,-40(s0)
    800026cc:	00e7b023          	sd	a4,0(a5)

    // maskiranje timeslice-a - 15ta strana u projektu
    __asm__ volatile ("csrc sie, %[mask]" : : [mask] "r"(2));
    800026d0:	00200793          	li	a5,2
    800026d4:	1047b073          	csrc	sie,a5
inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800026d8:	00200493          	li	s1,2
    800026dc:	1004a073          	csrs	sstatus,s1
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    userMain();
    800026e0:	00000097          	auipc	ra,0x0
    800026e4:	d78080e7          	jalr	-648(ra) # 80002458 <_Z8userMainv>
    800026e8:	1004a073          	csrs	sstatus,s1

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    printString("Finished\n");
    800026ec:	00004517          	auipc	a0,0x4
    800026f0:	a2c50513          	addi	a0,a0,-1492 # 80006118 <CONSOLE_STATUS+0x108>
    800026f4:	fffff097          	auipc	ra,0xfffff
    800026f8:	030080e7          	jalr	48(ra) # 80001724 <_Z11printStringPKc>
    return 0;
    800026fc:	00000513          	li	a0,0
    80002700:	02813083          	ld	ra,40(sp)
    80002704:	02013403          	ld	s0,32(sp)
    80002708:	01813483          	ld	s1,24(sp)
    8000270c:	03010113          	addi	sp,sp,48
    80002710:	00008067          	ret

0000000080002714 <_ZN3TCB13threadWrapperEv>:
    running = Scheduler::get();
    Riscv::w_sstatus(sstatus);
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper() {
    80002714:	ff010113          	addi	sp,sp,-16
    80002718:	00113423          	sd	ra,8(sp)
    8000271c:	00813023          	sd	s0,0(sp)
    80002720:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie();
    80002724:	00000097          	auipc	ra,0x0
    80002728:	658080e7          	jalr	1624(ra) # 80002d7c <_ZN5Riscv10popSppSpieEv>
    if(running->myThread != nullptr){
    8000272c:	00005797          	auipc	a5,0x5
    80002730:	dac7b783          	ld	a5,-596(a5) # 800074d8 <_ZN3TCB7runningE>
    80002734:	0307b503          	ld	a0,48(a5)
    80002738:	00050863          	beqz	a0,80002748 <_ZN3TCB13threadWrapperEv+0x34>
        running->myThread->run();
    8000273c:	00053783          	ld	a5,0(a0)
    80002740:	0107b783          	ld	a5,16(a5)
    80002744:	000780e7          	jalr	a5
    }
    thread_exit();
    80002748:	fffff097          	auipc	ra,0xfffff
    8000274c:	bac080e7          	jalr	-1108(ra) # 800012f4 <_Z11thread_exitv>
}
    80002750:	00813083          	ld	ra,8(sp)
    80002754:	00013403          	ld	s0,0(sp)
    80002758:	01010113          	addi	sp,sp,16
    8000275c:	00008067          	ret

0000000080002760 <_ZN3TCBC1EPFvvEm>:
TCB::TCB(Body body, uint64 timeSlice) : body(body),
    80002760:	fd010113          	addi	sp,sp,-48
    80002764:	02113423          	sd	ra,40(sp)
    80002768:	02813023          	sd	s0,32(sp)
    8000276c:	00913c23          	sd	s1,24(sp)
    80002770:	01213823          	sd	s2,16(sp)
    80002774:	01313423          	sd	s3,8(sp)
    80002778:	03010413          	addi	s0,sp,48
    8000277c:	00050493          	mv	s1,a0
    80002780:	00058913          	mv	s2,a1
    80002784:	00060993          	mv	s3,a2
finished(false), blocked(false) {
    80002788:	00b53023          	sd	a1,0(a0)
stack(new uint64[STACK_SIZE]),
    8000278c:	00002537          	lui	a0,0x2
    80002790:	00000097          	auipc	ra,0x0
    80002794:	24c080e7          	jalr	588(ra) # 800029dc <_Znam>
finished(false), blocked(false) {
    80002798:	00a4b423          	sd	a0,8(s1)
    8000279c:	00000797          	auipc	a5,0x0
    800027a0:	f7878793          	addi	a5,a5,-136 # 80002714 <_ZN3TCB13threadWrapperEv>
    800027a4:	00f4b823          	sd	a5,16(s1)
         (uint64) &stack[STACK_SIZE]}),
    800027a8:	000027b7          	lui	a5,0x2
    800027ac:	00f50533          	add	a0,a0,a5
finished(false), blocked(false) {
    800027b0:	00a4bc23          	sd	a0,24(s1)
    800027b4:	0334b023          	sd	s3,32(s1)
    800027b8:	02048423          	sb	zero,40(s1)
    800027bc:	020484a3          	sb	zero,41(s1)
    if (body != nullptr) { Scheduler::put(this); }
    800027c0:	00090863          	beqz	s2,800027d0 <_ZN3TCBC1EPFvvEm+0x70>
    800027c4:	00048513          	mv	a0,s1
    800027c8:	00001097          	auipc	ra,0x1
    800027cc:	960080e7          	jalr	-1696(ra) # 80003128 <_ZN9Scheduler3putEP3TCB>
    myThread = nullptr;
    800027d0:	0204b823          	sd	zero,48(s1)
}
    800027d4:	02813083          	ld	ra,40(sp)
    800027d8:	02013403          	ld	s0,32(sp)
    800027dc:	01813483          	ld	s1,24(sp)
    800027e0:	01013903          	ld	s2,16(sp)
    800027e4:	00813983          	ld	s3,8(sp)
    800027e8:	03010113          	addi	sp,sp,48
    800027ec:	00008067          	ret

00000000800027f0 <_ZN3TCB12createThreadEPFvvE>:
TCB *TCB::createThread(Body body) {
    800027f0:	fe010113          	addi	sp,sp,-32
    800027f4:	00113c23          	sd	ra,24(sp)
    800027f8:	00813823          	sd	s0,16(sp)
    800027fc:	00913423          	sd	s1,8(sp)
    80002800:	01213023          	sd	s2,0(sp)
    80002804:	02010413          	addi	s0,sp,32
    80002808:	00050913          	mv	s2,a0
    return new TCB(body, TIME_SLICE);
    8000280c:	03800513          	li	a0,56
    80002810:	00000097          	auipc	ra,0x0
    80002814:	1a4080e7          	jalr	420(ra) # 800029b4 <_Znwm>
    80002818:	00050493          	mv	s1,a0
    8000281c:	00200613          	li	a2,2
    80002820:	00090593          	mv	a1,s2
    80002824:	00000097          	auipc	ra,0x0
    80002828:	f3c080e7          	jalr	-196(ra) # 80002760 <_ZN3TCBC1EPFvvEm>
    8000282c:	0200006f          	j	8000284c <_ZN3TCB12createThreadEPFvvE+0x5c>
    80002830:	00050913          	mv	s2,a0
    80002834:	00048513          	mv	a0,s1
    80002838:	00000097          	auipc	ra,0x0
    8000283c:	1cc080e7          	jalr	460(ra) # 80002a04 <_ZdlPv>
    80002840:	00090513          	mv	a0,s2
    80002844:	00006097          	auipc	ra,0x6
    80002848:	d94080e7          	jalr	-620(ra) # 800085d8 <_Unwind_Resume>
}
    8000284c:	00048513          	mv	a0,s1
    80002850:	01813083          	ld	ra,24(sp)
    80002854:	01013403          	ld	s0,16(sp)
    80002858:	00813483          	ld	s1,8(sp)
    8000285c:	00013903          	ld	s2,0(sp)
    80002860:	02010113          	addi	sp,sp,32
    80002864:	00008067          	ret

0000000080002868 <_ZN3TCB5yieldEv>:
void TCB::yield() { __asm__ volatile ("ecall"); }
    80002868:	ff010113          	addi	sp,sp,-16
    8000286c:	00813423          	sd	s0,8(sp)
    80002870:	01010413          	addi	s0,sp,16
    80002874:	00000073          	ecall
    80002878:	00813403          	ld	s0,8(sp)
    8000287c:	01010113          	addi	sp,sp,16
    80002880:	00008067          	ret

0000000080002884 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002884:	fd010113          	addi	sp,sp,-48
    80002888:	02113423          	sd	ra,40(sp)
    8000288c:	02813023          	sd	s0,32(sp)
    80002890:	00913c23          	sd	s1,24(sp)
    80002894:	01213823          	sd	s2,16(sp)
    80002898:	03010413          	addi	s0,sp,48
    TCB *old = running;
    8000289c:	00005497          	auipc	s1,0x5
    800028a0:	c3c4b483          	ld	s1,-964(s1) # 800074d8 <_ZN3TCB7runningE>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800028a4:	100027f3          	csrr	a5,sstatus
    800028a8:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800028ac:	fd843903          	ld	s2,-40(s0)
        bool isBlocked() const { return blocked; }
    800028b0:	0294c783          	lbu	a5,41(s1)
    if (!old->isBlocked() && !old->isFinished()) { Scheduler::put(old); }
    800028b4:	00079663          	bnez	a5,800028c0 <_ZN3TCB8dispatchEv+0x3c>
        bool isFinished() const { return finished; }
    800028b8:	0284c783          	lbu	a5,40(s1)
    800028bc:	04078063          	beqz	a5,800028fc <_ZN3TCB8dispatchEv+0x78>
    running = Scheduler::get();
    800028c0:	00001097          	auipc	ra,0x1
    800028c4:	800080e7          	jalr	-2048(ra) # 800030c0 <_ZN9Scheduler3getEv>
    800028c8:	00005797          	auipc	a5,0x5
    800028cc:	c0a7b823          	sd	a0,-1008(a5) # 800074d8 <_ZN3TCB7runningE>
}
inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800028d0:	10091073          	csrw	sstatus,s2
    TCB::contextSwitch(&old->context, &running->context);
    800028d4:	01050593          	addi	a1,a0,16 # 2010 <_entry-0x7fffdff0>
    800028d8:	01048513          	addi	a0,s1,16
    800028dc:	fffff097          	auipc	ra,0xfffff
    800028e0:	964080e7          	jalr	-1692(ra) # 80001240 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800028e4:	02813083          	ld	ra,40(sp)
    800028e8:	02013403          	ld	s0,32(sp)
    800028ec:	01813483          	ld	s1,24(sp)
    800028f0:	01013903          	ld	s2,16(sp)
    800028f4:	03010113          	addi	sp,sp,48
    800028f8:	00008067          	ret
    if (!old->isBlocked() && !old->isFinished()) { Scheduler::put(old); }
    800028fc:	00048513          	mv	a0,s1
    80002900:	00001097          	auipc	ra,0x1
    80002904:	828080e7          	jalr	-2008(ra) # 80003128 <_ZN9Scheduler3putEP3TCB>
    80002908:	fb9ff06f          	j	800028c0 <_ZN3TCB8dispatchEv+0x3c>

000000008000290c <_ZN3TCB9checkBodyEv>:

bool TCB::checkBody() {
    8000290c:	ff010113          	addi	sp,sp,-16
    80002910:	00113423          	sd	ra,8(sp)
    80002914:	00813023          	sd	s0,0(sp)
    80002918:	01010413          	addi	s0,sp,16
    if(this->body != nullptr){
    8000291c:	00053783          	ld	a5,0(a0)
    80002920:	02078463          	beqz	a5,80002948 <_ZN3TCB9checkBodyEv+0x3c>
        printString("Imam body.\n");
    80002924:	00004517          	auipc	a0,0x4
    80002928:	80450513          	addi	a0,a0,-2044 # 80006128 <CONSOLE_STATUS+0x118>
    8000292c:	fffff097          	auipc	ra,0xfffff
    80002930:	df8080e7          	jalr	-520(ra) # 80001724 <_Z11printStringPKc>
        return true;
    80002934:	00100513          	li	a0,1
    }else{
        printString("Nemam body.\n");
        return false;
    }
}
    80002938:	00813083          	ld	ra,8(sp)
    8000293c:	00013403          	ld	s0,0(sp)
    80002940:	01010113          	addi	sp,sp,16
    80002944:	00008067          	ret
        printString("Nemam body.\n");
    80002948:	00003517          	auipc	a0,0x3
    8000294c:	7f050513          	addi	a0,a0,2032 # 80006138 <CONSOLE_STATUS+0x128>
    80002950:	fffff097          	auipc	ra,0xfffff
    80002954:	dd4080e7          	jalr	-556(ra) # 80001724 <_Z11printStringPKc>
        return false;
    80002958:	00000513          	li	a0,0
    8000295c:	fddff06f          	j	80002938 <_ZN3TCB9checkBodyEv+0x2c>

0000000080002960 <_ZN3TCB7setBodyEPFvvE>:

void TCB::setBody(TCB::Body body) {
    80002960:	ff010113          	addi	sp,sp,-16
    80002964:	00813423          	sd	s0,8(sp)
    80002968:	01010413          	addi	s0,sp,16
    this->body = body;
    8000296c:	00b53023          	sd	a1,0(a0)
}
    80002970:	00813403          	ld	s0,8(sp)
    80002974:	01010113          	addi	sp,sp,16
    80002978:	00008067          	ret

000000008000297c <_ZN3TCB7exitTCBEv>:

void TCB::exitTCB() {
    8000297c:	ff010113          	addi	sp,sp,-16
    80002980:	00113423          	sd	ra,8(sp)
    80002984:	00813023          	sd	s0,0(sp)
    80002988:	01010413          	addi	s0,sp,16
        void setFinished(bool value) { finished = value; }
    8000298c:	00005797          	auipc	a5,0x5
    80002990:	b4c7b783          	ld	a5,-1204(a5) # 800074d8 <_ZN3TCB7runningE>
    80002994:	00100713          	li	a4,1
    80002998:	02e78423          	sb	a4,40(a5)
    running->setFinished(true);
    //delete running;
    // msm da ne treba jer mi svakako radimo delete na kraju svakog testa
    thread_dispatch();
    8000299c:	fffff097          	auipc	ra,0xfffff
    800029a0:	980080e7          	jalr	-1664(ra) # 8000131c <_Z15thread_dispatchv>
}
    800029a4:	00813083          	ld	ra,8(sp)
    800029a8:	00013403          	ld	s0,0(sp)
    800029ac:	01010113          	addi	sp,sp,16
    800029b0:	00008067          	ret

00000000800029b4 <_Znwm>:
// Created by os on 5/12/22.
//
//#include "../lib/mem.h"
#include "../h/syscall_c.hpp"

void *operator new(uint64 n) { return mem_alloc(n); }
    800029b4:	ff010113          	addi	sp,sp,-16
    800029b8:	00113423          	sd	ra,8(sp)
    800029bc:	00813023          	sd	s0,0(sp)
    800029c0:	01010413          	addi	s0,sp,16
    800029c4:	fffff097          	auipc	ra,0xfffff
    800029c8:	890080e7          	jalr	-1904(ra) # 80001254 <_Z9mem_allocm>
    800029cc:	00813083          	ld	ra,8(sp)
    800029d0:	00013403          	ld	s0,0(sp)
    800029d4:	01010113          	addi	sp,sp,16
    800029d8:	00008067          	ret

00000000800029dc <_Znam>:
void *operator new[](uint64 n) { return mem_alloc(n); }
    800029dc:	ff010113          	addi	sp,sp,-16
    800029e0:	00113423          	sd	ra,8(sp)
    800029e4:	00813023          	sd	s0,0(sp)
    800029e8:	01010413          	addi	s0,sp,16
    800029ec:	fffff097          	auipc	ra,0xfffff
    800029f0:	868080e7          	jalr	-1944(ra) # 80001254 <_Z9mem_allocm>
    800029f4:	00813083          	ld	ra,8(sp)
    800029f8:	00013403          	ld	s0,0(sp)
    800029fc:	01010113          	addi	sp,sp,16
    80002a00:	00008067          	ret

0000000080002a04 <_ZdlPv>:

void operator delete(void *p) noexcept { mem_free(p); }
    80002a04:	ff010113          	addi	sp,sp,-16
    80002a08:	00113423          	sd	ra,8(sp)
    80002a0c:	00813023          	sd	s0,0(sp)
    80002a10:	01010413          	addi	s0,sp,16
    80002a14:	fffff097          	auipc	ra,0xfffff
    80002a18:	870080e7          	jalr	-1936(ra) # 80001284 <_Z8mem_freePv>
    80002a1c:	00813083          	ld	ra,8(sp)
    80002a20:	00013403          	ld	s0,0(sp)
    80002a24:	01010113          	addi	sp,sp,16
    80002a28:	00008067          	ret

0000000080002a2c <_ZdaPv>:
void operator delete[](void *p) noexcept { mem_free(p); }
    80002a2c:	ff010113          	addi	sp,sp,-16
    80002a30:	00113423          	sd	ra,8(sp)
    80002a34:	00813023          	sd	s0,0(sp)
    80002a38:	01010413          	addi	s0,sp,16
    80002a3c:	fffff097          	auipc	ra,0xfffff
    80002a40:	848080e7          	jalr	-1976(ra) # 80001284 <_Z8mem_freePv>
    80002a44:	00813083          	ld	ra,8(sp)
    80002a48:	00013403          	ld	s0,0(sp)
    80002a4c:	01010113          	addi	sp,sp,16
    80002a50:	00008067          	ret

0000000080002a54 <_ZN9SemaphoreD1Ev>:
Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
    myHandle->mySemaphore = this;
}

Semaphore::~Semaphore() {
    80002a54:	00005797          	auipc	a5,0x5
    80002a58:	9dc78793          	addi	a5,a5,-1572 # 80007430 <_ZTV9Semaphore+0x10>
    80002a5c:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    80002a60:	00853503          	ld	a0,8(a0)
    80002a64:	02050863          	beqz	a0,80002a94 <_ZN9SemaphoreD1Ev+0x40>
Semaphore::~Semaphore() {
    80002a68:	ff010113          	addi	sp,sp,-16
    80002a6c:	00113423          	sd	ra,8(sp)
    80002a70:	00813023          	sd	s0,0(sp)
    80002a74:	01010413          	addi	s0,sp,16
    delete myHandle;
    80002a78:	00053783          	ld	a5,0(a0)
    80002a7c:	0087b783          	ld	a5,8(a5)
    80002a80:	000780e7          	jalr	a5
}
    80002a84:	00813083          	ld	ra,8(sp)
    80002a88:	00013403          	ld	s0,0(sp)
    80002a8c:	01010113          	addi	sp,sp,16
    80002a90:	00008067          	ret
    80002a94:	00008067          	ret

0000000080002a98 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002a98:	fe010113          	addi	sp,sp,-32
    80002a9c:	00113c23          	sd	ra,24(sp)
    80002aa0:	00813823          	sd	s0,16(sp)
    80002aa4:	00913423          	sd	s1,8(sp)
    80002aa8:	02010413          	addi	s0,sp,32
    80002aac:	00050493          	mv	s1,a0
}
    80002ab0:	00000097          	auipc	ra,0x0
    80002ab4:	fa4080e7          	jalr	-92(ra) # 80002a54 <_ZN9SemaphoreD1Ev>
    80002ab8:	00048513          	mv	a0,s1
    80002abc:	00000097          	auipc	ra,0x0
    80002ac0:	f48080e7          	jalr	-184(ra) # 80002a04 <_ZdlPv>
    80002ac4:	01813083          	ld	ra,24(sp)
    80002ac8:	01013403          	ld	s0,16(sp)
    80002acc:	00813483          	ld	s1,8(sp)
    80002ad0:	02010113          	addi	sp,sp,32
    80002ad4:	00008067          	ret

0000000080002ad8 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002ad8:	fe010113          	addi	sp,sp,-32
    80002adc:	00113c23          	sd	ra,24(sp)
    80002ae0:	00813823          	sd	s0,16(sp)
    80002ae4:	00913423          	sd	s1,8(sp)
    80002ae8:	02010413          	addi	s0,sp,32
    80002aec:	00005797          	auipc	a5,0x5
    80002af0:	91c78793          	addi	a5,a5,-1764 # 80007408 <_ZTV6Thread+0x10>
    80002af4:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    80002af8:	00853483          	ld	s1,8(a0)
    80002afc:	02048063          	beqz	s1,80002b1c <_ZN6ThreadD1Ev+0x44>
        ~TCB() { delete[] stack; }
    80002b00:	0084b503          	ld	a0,8(s1)
    80002b04:	00050663          	beqz	a0,80002b10 <_ZN6ThreadD1Ev+0x38>
    80002b08:	00000097          	auipc	ra,0x0
    80002b0c:	f24080e7          	jalr	-220(ra) # 80002a2c <_ZdaPv>
    80002b10:	00048513          	mv	a0,s1
    80002b14:	00000097          	auipc	ra,0x0
    80002b18:	ef0080e7          	jalr	-272(ra) # 80002a04 <_ZdlPv>
}
    80002b1c:	01813083          	ld	ra,24(sp)
    80002b20:	01013403          	ld	s0,16(sp)
    80002b24:	00813483          	ld	s1,8(sp)
    80002b28:	02010113          	addi	sp,sp,32
    80002b2c:	00008067          	ret

0000000080002b30 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002b30:	fe010113          	addi	sp,sp,-32
    80002b34:	00113c23          	sd	ra,24(sp)
    80002b38:	00813823          	sd	s0,16(sp)
    80002b3c:	00913423          	sd	s1,8(sp)
    80002b40:	02010413          	addi	s0,sp,32
    80002b44:	00050493          	mv	s1,a0
}
    80002b48:	00000097          	auipc	ra,0x0
    80002b4c:	f90080e7          	jalr	-112(ra) # 80002ad8 <_ZN6ThreadD1Ev>
    80002b50:	00048513          	mv	a0,s1
    80002b54:	00000097          	auipc	ra,0x0
    80002b58:	eb0080e7          	jalr	-336(ra) # 80002a04 <_ZdlPv>
    80002b5c:	01813083          	ld	ra,24(sp)
    80002b60:	01013403          	ld	s0,16(sp)
    80002b64:	00813483          	ld	s1,8(sp)
    80002b68:	02010113          	addi	sp,sp,32
    80002b6c:	00008067          	ret

0000000080002b70 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002b70:	ff010113          	addi	sp,sp,-16
    80002b74:	00113423          	sd	ra,8(sp)
    80002b78:	00813023          	sd	s0,0(sp)
    80002b7c:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002b80:	ffffe097          	auipc	ra,0xffffe
    80002b84:	79c080e7          	jalr	1948(ra) # 8000131c <_Z15thread_dispatchv>
}
    80002b88:	00813083          	ld	ra,8(sp)
    80002b8c:	00013403          	ld	s0,0(sp)
    80002b90:	01010113          	addi	sp,sp,16
    80002b94:	00008067          	ret

0000000080002b98 <_ZN6Thread5startEv>:
int Thread::start() {
    80002b98:	ff010113          	addi	sp,sp,-16
    80002b9c:	00113423          	sd	ra,8(sp)
    80002ba0:	00813023          	sd	s0,0(sp)
    80002ba4:	01010413          	addi	s0,sp,16
    Scheduler::put(myHandle);
    80002ba8:	00853503          	ld	a0,8(a0)
    80002bac:	00000097          	auipc	ra,0x0
    80002bb0:	57c080e7          	jalr	1404(ra) # 80003128 <_ZN9Scheduler3putEP3TCB>
}
    80002bb4:	00100513          	li	a0,1
    80002bb8:	00813083          	ld	ra,8(sp)
    80002bbc:	00013403          	ld	s0,0(sp)
    80002bc0:	01010113          	addi	sp,sp,16
    80002bc4:	00008067          	ret

0000000080002bc8 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80002bc8:	fe010113          	addi	sp,sp,-32
    80002bcc:	00113c23          	sd	ra,24(sp)
    80002bd0:	00813823          	sd	s0,16(sp)
    80002bd4:	00913423          	sd	s1,8(sp)
    80002bd8:	02010413          	addi	s0,sp,32
    80002bdc:	00050493          	mv	s1,a0
    80002be0:	00005797          	auipc	a5,0x5
    80002be4:	82878793          	addi	a5,a5,-2008 # 80007408 <_ZTV6Thread+0x10>
    80002be8:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    80002bec:	00850513          	addi	a0,a0,8
    80002bf0:	ffffe097          	auipc	ra,0xffffe
    80002bf4:	6c4080e7          	jalr	1732(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    myHandle->myThread = this;
    80002bf8:	0084b783          	ld	a5,8(s1)
    80002bfc:	0297b823          	sd	s1,48(a5)
}
    80002c00:	01813083          	ld	ra,24(sp)
    80002c04:	01013403          	ld	s0,16(sp)
    80002c08:	00813483          	ld	s1,8(sp)
    80002c0c:	02010113          	addi	sp,sp,32
    80002c10:	00008067          	ret

0000000080002c14 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002c14:	fe010113          	addi	sp,sp,-32
    80002c18:	00113c23          	sd	ra,24(sp)
    80002c1c:	00813823          	sd	s0,16(sp)
    80002c20:	00913423          	sd	s1,8(sp)
    80002c24:	02010413          	addi	s0,sp,32
    80002c28:	00050493          	mv	s1,a0
    80002c2c:	00004797          	auipc	a5,0x4
    80002c30:	7dc78793          	addi	a5,a5,2012 # 80007408 <_ZTV6Thread+0x10>
    80002c34:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, nullptr, nullptr);
    80002c38:	00000613          	li	a2,0
    80002c3c:	00000593          	li	a1,0
    80002c40:	00850513          	addi	a0,a0,8
    80002c44:	ffffe097          	auipc	ra,0xffffe
    80002c48:	670080e7          	jalr	1648(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    myHandle->myThread = this;
    80002c4c:	0084b783          	ld	a5,8(s1)
    80002c50:	0297b823          	sd	s1,48(a5)
}
    80002c54:	01813083          	ld	ra,24(sp)
    80002c58:	01013403          	ld	s0,16(sp)
    80002c5c:	00813483          	ld	s1,8(sp)
    80002c60:	02010113          	addi	sp,sp,32
    80002c64:	00008067          	ret

0000000080002c68 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002c68:	ff010113          	addi	sp,sp,-16
    80002c6c:	00113423          	sd	ra,8(sp)
    80002c70:	00813023          	sd	s0,0(sp)
    80002c74:	01010413          	addi	s0,sp,16
    sem_wait(myHandle);
    80002c78:	00853503          	ld	a0,8(a0)
    80002c7c:	ffffe097          	auipc	ra,0xffffe
    80002c80:	72c080e7          	jalr	1836(ra) # 800013a8 <_Z8sem_waitP9KernelSem>
}
    80002c84:	00000513          	li	a0,0
    80002c88:	00813083          	ld	ra,8(sp)
    80002c8c:	00013403          	ld	s0,0(sp)
    80002c90:	01010113          	addi	sp,sp,16
    80002c94:	00008067          	ret

0000000080002c98 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002c98:	ff010113          	addi	sp,sp,-16
    80002c9c:	00113423          	sd	ra,8(sp)
    80002ca0:	00813023          	sd	s0,0(sp)
    80002ca4:	01010413          	addi	s0,sp,16
    sem_signal(myHandle);
    80002ca8:	00853503          	ld	a0,8(a0)
    80002cac:	ffffe097          	auipc	ra,0xffffe
    80002cb0:	72c080e7          	jalr	1836(ra) # 800013d8 <_Z10sem_signalP9KernelSem>
}
    80002cb4:	00000513          	li	a0,0
    80002cb8:	00813083          	ld	ra,8(sp)
    80002cbc:	00013403          	ld	s0,0(sp)
    80002cc0:	01010113          	addi	sp,sp,16
    80002cc4:	00008067          	ret

0000000080002cc8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002cc8:	fe010113          	addi	sp,sp,-32
    80002ccc:	00113c23          	sd	ra,24(sp)
    80002cd0:	00813823          	sd	s0,16(sp)
    80002cd4:	00913423          	sd	s1,8(sp)
    80002cd8:	02010413          	addi	s0,sp,32
    80002cdc:	00050493          	mv	s1,a0
    80002ce0:	00004797          	auipc	a5,0x4
    80002ce4:	75078793          	addi	a5,a5,1872 # 80007430 <_ZTV9Semaphore+0x10>
    80002ce8:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80002cec:	00850513          	addi	a0,a0,8
    80002cf0:	ffffe097          	auipc	ra,0xffffe
    80002cf4:	650080e7          	jalr	1616(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    myHandle->mySemaphore = this;
    80002cf8:	0084b783          	ld	a5,8(s1)
    80002cfc:	0097b423          	sd	s1,8(a5)
}
    80002d00:	01813083          	ld	ra,24(sp)
    80002d04:	01013403          	ld	s0,16(sp)
    80002d08:	00813483          	ld	s1,8(sp)
    80002d0c:	02010113          	addi	sp,sp,32
    80002d10:	00008067          	ret

0000000080002d14 <_ZN7Console4getcEv>:

char Console::getc() {
    80002d14:	ff010113          	addi	sp,sp,-16
    80002d18:	00113423          	sd	ra,8(sp)
    80002d1c:	00813023          	sd	s0,0(sp)
    80002d20:	01010413          	addi	s0,sp,16
    char c = ::getc();
    80002d24:	ffffe097          	auipc	ra,0xffffe
    80002d28:	6e4080e7          	jalr	1764(ra) # 80001408 <_Z4getcv>
    return c;
}
    80002d2c:	00813083          	ld	ra,8(sp)
    80002d30:	00013403          	ld	s0,0(sp)
    80002d34:	01010113          	addi	sp,sp,16
    80002d38:	00008067          	ret

0000000080002d3c <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002d3c:	ff010113          	addi	sp,sp,-16
    80002d40:	00113423          	sd	ra,8(sp)
    80002d44:	00813023          	sd	s0,0(sp)
    80002d48:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002d4c:	ffffe097          	auipc	ra,0xffffe
    80002d50:	6e8080e7          	jalr	1768(ra) # 80001434 <_Z4putcc>
}
    80002d54:	00813083          	ld	ra,8(sp)
    80002d58:	00013403          	ld	s0,0(sp)
    80002d5c:	01010113          	addi	sp,sp,16
    80002d60:	00008067          	ret

0000000080002d64 <_ZN6Thread3runEv>:
    int start ();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
    80002d64:	ff010113          	addi	sp,sp,-16
    80002d68:	00813423          	sd	s0,8(sp)
    80002d6c:	01010413          	addi	s0,sp,16
    80002d70:	00813403          	ld	s0,8(sp)
    80002d74:	01010113          	addi	sp,sp,16
    80002d78:	00008067          	ret

0000000080002d7c <_ZN5Riscv10popSppSpieEv>:
#include "../h/tcb.hpp"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/printing.hpp"

void Riscv::popSppSpie() {
    80002d7c:	ff010113          	addi	sp,sp,-16
    80002d80:	00813423          	sd	s0,8(sp)
    80002d84:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002d88:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80002d8c:	10200073          	sret
}
    80002d90:	00813403          	ld	s0,8(sp)
    80002d94:	01010113          	addi	sp,sp,16
    80002d98:	00008067          	ret

0000000080002d9c <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002d9c:	f9010113          	addi	sp,sp,-112
    80002da0:	06113423          	sd	ra,104(sp)
    80002da4:	06813023          	sd	s0,96(sp)
    80002da8:	04913c23          	sd	s1,88(sp)
    80002dac:	05213823          	sd	s2,80(sp)
    80002db0:	05313423          	sd	s3,72(sp)
    80002db4:	07010413          	addi	s0,sp,112
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002db8:	142027f3          	csrr	a5,scause
    80002dbc:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80002dc0:	f9843483          	ld	s1,-104(s0)
    uint64 scause = r_scause();

    // velicina gde cu da mu obavestim koji je poziv
    size_t argument0;
    __asm__ volatile("mv %0, a0" : "=r" (argument0));
    80002dc4:	00050793          	mv	a5,a0

    if(argument0 != 0 && scause == 0x0000000000000009UL){
    80002dc8:	00078663          	beqz	a5,80002dd4 <_ZN5Riscv20handleSupervisorTrapEv+0x38>
    80002dcc:	00900713          	li	a4,9
    80002dd0:	06e48463          	beq	s1,a4,80002e38 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
            __putc(c);
        }

        w_sstatus(sstatus); w_sepc(sepc);
    }
    else if (scause == 0x0000000000000009UL) {
    80002dd4:	00900793          	li	a5,9
    80002dd8:	1af48263          	beq	s1,a5,80002f7c <_ZN5Riscv20handleSupervisorTrapEv+0x1e0>
        // interrupt: no; cause code: environment call from S-mode(9)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch();
        w_sstatus(sstatus); w_sepc(sepc);
    } else if (scause == 0x8000000000000001UL) {
    80002ddc:	fff00793          	li	a5,-1
    80002de0:	03f79793          	slli	a5,a5,0x3f
    80002de4:	00178793          	addi	a5,a5,1
    80002de8:	1cf48863          	beq	s1,a5,80002fb8 <_ZN5Riscv20handleSupervisorTrapEv+0x21c>
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus); w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    } else if (scause == 0x8000000000000009UL) {
    80002dec:	fff00793          	li	a5,-1
    80002df0:	03f79793          	slli	a5,a5,0x3f
    80002df4:	00978793          	addi	a5,a5,9
    80002df8:	22f48663          	beq	s1,a5,80003024 <_ZN5Riscv20handleSupervisorTrapEv+0x288>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else {
        // unexpected trap cause
        if (scause == 0x0000000000000002UL){
    80002dfc:	00200793          	li	a5,2
    80002e00:	22f48863          	beq	s1,a5,80003030 <_ZN5Riscv20handleSupervisorTrapEv+0x294>
            printString("Error 2\n");
        }
        if (scause == 0x0000000000000005UL){
    80002e04:	00500793          	li	a5,5
    80002e08:	22f48e63          	beq	s1,a5,80003044 <_ZN5Riscv20handleSupervisorTrapEv+0x2a8>
            printString("Error 5\n");
        }
        if (scause == 0x0000000000000007UL){
    80002e0c:	00700793          	li	a5,7
    80002e10:	24f48463          	beq	s1,a5,80003058 <_ZN5Riscv20handleSupervisorTrapEv+0x2bc>
            printString("Error 7\n");
        }
        if (scause == 0x0000000000000008UL){
    80002e14:	00800793          	li	a5,8
    80002e18:	24f48a63          	beq	s1,a5,8000306c <_ZN5Riscv20handleSupervisorTrapEv+0x2d0>
        }
        if (scause == 0x0000000000000009UL){
            printString("Error 9\n");
        }
    }
}
    80002e1c:	06813083          	ld	ra,104(sp)
    80002e20:	06013403          	ld	s0,96(sp)
    80002e24:	05813483          	ld	s1,88(sp)
    80002e28:	05013903          	ld	s2,80(sp)
    80002e2c:	04813983          	ld	s3,72(sp)
    80002e30:	07010113          	addi	sp,sp,112
    80002e34:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002e38:	14102773          	csrr	a4,sepc
    80002e3c:	fae43423          	sd	a4,-88(s0)
    return sepc;
    80002e40:	fa843483          	ld	s1,-88(s0)
                uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80002e44:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002e48:	10002773          	csrr	a4,sstatus
    80002e4c:	fae43023          	sd	a4,-96(s0)
    return sstatus;
    80002e50:	fa043903          	ld	s2,-96(s0)
        if(argument0 == 1){ // syscall za mem_alloc
    80002e54:	00100713          	li	a4,1
    80002e58:	06e78463          	beq	a5,a4,80002ec0 <_ZN5Riscv20handleSupervisorTrapEv+0x124>
        }else if(argument0 == 2){ // sistemski poziv za mem_free
    80002e5c:	00200713          	li	a4,2
    80002e60:	06e78e63          	beq	a5,a4,80002edc <_ZN5Riscv20handleSupervisorTrapEv+0x140>
        }else if(argument0 == 11){
    80002e64:	00b00713          	li	a4,11
    80002e68:	08e78263          	beq	a5,a4,80002eec <_ZN5Riscv20handleSupervisorTrapEv+0x150>
        }else if(argument0 == 12){
    80002e6c:	00c00713          	li	a4,12
    80002e70:	08e78c63          	beq	a5,a4,80002f08 <_ZN5Riscv20handleSupervisorTrapEv+0x16c>
        }else if(argument0 == 13){
    80002e74:	00d00713          	li	a4,13
    80002e78:	08e78e63          	beq	a5,a4,80002f14 <_ZN5Riscv20handleSupervisorTrapEv+0x178>
        }else if(argument0 == 21){
    80002e7c:	01500713          	li	a4,21
    80002e80:	0ae78063          	beq	a5,a4,80002f20 <_ZN5Riscv20handleSupervisorTrapEv+0x184>
        }else if(argument0 == 22){
    80002e84:	01600713          	li	a4,22
    80002e88:	0ae78a63          	beq	a5,a4,80002f3c <_ZN5Riscv20handleSupervisorTrapEv+0x1a0>
        }else if(argument0 == 23){
    80002e8c:	01700713          	li	a4,23
    80002e90:	0ae78e63          	beq	a5,a4,80002f4c <_ZN5Riscv20handleSupervisorTrapEv+0x1b0>
        }else if(argument0 == 24){
    80002e94:	01800713          	li	a4,24
    80002e98:	0ce78263          	beq	a5,a4,80002f5c <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
        }else if(argument0 == 41){
    80002e9c:	02900713          	li	a4,41
    80002ea0:	0ce78663          	beq	a5,a4,80002f6c <_ZN5Riscv20handleSupervisorTrapEv+0x1d0>
        }else if(argument0 == 42){
    80002ea4:	02a00713          	li	a4,42
    80002ea8:	02e79463          	bne	a5,a4,80002ed0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (c));
    80002eac:	00058513          	mv	a0,a1
            __putc(c);
    80002eb0:	0ff57513          	andi	a0,a0,255
    80002eb4:	00003097          	auipc	ra,0x3
    80002eb8:	978080e7          	jalr	-1672(ra) # 8000582c <__putc>
    80002ebc:	0140006f          	j	80002ed0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (argument_sizet));
    80002ec0:	00058513          	mv	a0,a1
            argument_ret_void = MemoryAllocator::mem_alloc(argument_sizet);
    80002ec4:	00000097          	auipc	ra,0x0
    80002ec8:	354080e7          	jalr	852(ra) # 80003218 <_ZN15MemoryAllocator9mem_allocEm>
            __asm__ volatile("mv a0, %0" : : "r" (argument_ret_void));
    80002ecc:	00050513          	mv	a0,a0
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002ed0:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002ed4:	14149073          	csrw	sepc,s1
}
    80002ed8:	f45ff06f          	j	80002e1c <_ZN5Riscv20handleSupervisorTrapEv+0x80>
            __asm__ volatile("mv %0, a1" : "=r" (argument_void));
    80002edc:	00058513          	mv	a0,a1
            MemoryAllocator::mem_free(argument_void);
    80002ee0:	00000097          	auipc	ra,0x0
    80002ee4:	478080e7          	jalr	1144(ra) # 80003358 <_ZN15MemoryAllocator8mem_freeEPv>
    80002ee8:	fe9ff06f          	j	80002ed0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (handler));
    80002eec:	00058993          	mv	s3,a1
            __asm__ volatile("mv %0, a2" : "=r" (sr));
    80002ef0:	00060513          	mv	a0,a2
            __asm__ volatile("mv %0, a3" : "=r" (arg));
    80002ef4:	00068793          	mv	a5,a3
            *handler = TCB::createThread(sr);
    80002ef8:	00000097          	auipc	ra,0x0
    80002efc:	8f8080e7          	jalr	-1800(ra) # 800027f0 <_ZN3TCB12createThreadEPFvvE>
    80002f00:	00a9b023          	sd	a0,0(s3)
    80002f04:	fcdff06f          	j	80002ed0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            TCB::exitTCB();
    80002f08:	00000097          	auipc	ra,0x0
    80002f0c:	a74080e7          	jalr	-1420(ra) # 8000297c <_ZN3TCB7exitTCBEv>
    80002f10:	fc1ff06f          	j	80002ed0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            TCB::dispatch();
    80002f14:	00000097          	auipc	ra,0x0
    80002f18:	970080e7          	jalr	-1680(ra) # 80002884 <_ZN3TCB8dispatchEv>
    80002f1c:	fb5ff06f          	j	80002ed0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (arg1));
    80002f20:	00058993          	mv	s3,a1
            __asm__ volatile("mv %0, a2" : "=r" (arg2));
    80002f24:	00060513          	mv	a0,a2
            *arg1 = KernelSem::createSem(arg2);
    80002f28:	0005051b          	sext.w	a0,a0
    80002f2c:	ffffe097          	auipc	ra,0xffffe
    80002f30:	568080e7          	jalr	1384(ra) # 80001494 <_ZN9KernelSem9createSemEi>
    80002f34:	00a9b023          	sd	a0,0(s3)
    80002f38:	f99ff06f          	j	80002ed0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (arg1));
    80002f3c:	00058513          	mv	a0,a1
            arg1->freeSem();
    80002f40:	ffffe097          	auipc	ra,0xffffe
    80002f44:	6f0080e7          	jalr	1776(ra) # 80001630 <_ZN9KernelSem7freeSemEv>
    80002f48:	f89ff06f          	j	80002ed0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (arg1));
    80002f4c:	00058513          	mv	a0,a1
            arg1->wait();
    80002f50:	ffffe097          	auipc	ra,0xffffe
    80002f54:	5b4080e7          	jalr	1460(ra) # 80001504 <_ZN9KernelSem4waitEv>
    80002f58:	f79ff06f          	j	80002ed0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            __asm__ volatile("mv %0, a1" : "=r" (arg1));
    80002f5c:	00058513          	mv	a0,a1
            arg1->signal();
    80002f60:	ffffe097          	auipc	ra,0xffffe
    80002f64:	644080e7          	jalr	1604(ra) # 800015a4 <_ZN9KernelSem6signalEv>
    80002f68:	f69ff06f          	j	80002ed0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            ret = __getc();
    80002f6c:	00003097          	auipc	ra,0x3
    80002f70:	8fc080e7          	jalr	-1796(ra) # 80005868 <__getc>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002f74:	00050513          	mv	a0,a0
    80002f78:	f59ff06f          	j	80002ed0 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002f7c:	141027f3          	csrr	a5,sepc
    80002f80:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80002f84:	fb843483          	ld	s1,-72(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80002f88:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002f8c:	100027f3          	csrr	a5,sstatus
    80002f90:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80002f94:	fb043903          	ld	s2,-80(s0)
        TCB::timeSliceCounter = 0;
    80002f98:	00004797          	auipc	a5,0x4
    80002f9c:	4c07b783          	ld	a5,1216(a5) # 80007458 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002fa0:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    80002fa4:	00000097          	auipc	ra,0x0
    80002fa8:	8e0080e7          	jalr	-1824(ra) # 80002884 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002fac:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002fb0:	14149073          	csrw	sepc,s1
}
    80002fb4:	e69ff06f          	j	80002e1c <_ZN5Riscv20handleSupervisorTrapEv+0x80>
        TCB::timeSliceCounter++;
    80002fb8:	00004717          	auipc	a4,0x4
    80002fbc:	4a073703          	ld	a4,1184(a4) # 80007458 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002fc0:	00073783          	ld	a5,0(a4)
    80002fc4:	00178793          	addi	a5,a5,1
    80002fc8:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    80002fcc:	00004717          	auipc	a4,0x4
    80002fd0:	49c73703          	ld	a4,1180(a4) # 80007468 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002fd4:	00073703          	ld	a4,0(a4)
        uint64 getTimeSlice() const { return timeSlice; }
    80002fd8:	02073703          	ld	a4,32(a4)
    80002fdc:	00e7f863          	bgeu	a5,a4,80002fec <_ZN5Riscv20handleSupervisorTrapEv+0x250>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002fe0:	00200793          	li	a5,2
    80002fe4:	1447b073          	csrc	sip,a5
}
    80002fe8:	e35ff06f          	j	80002e1c <_ZN5Riscv20handleSupervisorTrapEv+0x80>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002fec:	141027f3          	csrr	a5,sepc
    80002ff0:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002ff4:	fc843483          	ld	s1,-56(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002ff8:	100027f3          	csrr	a5,sstatus
    80002ffc:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80003000:	fc043903          	ld	s2,-64(s0)
            TCB::timeSliceCounter = 0;
    80003004:	00004797          	auipc	a5,0x4
    80003008:	4547b783          	ld	a5,1108(a5) # 80007458 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000300c:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80003010:	00000097          	auipc	ra,0x0
    80003014:	874080e7          	jalr	-1932(ra) # 80002884 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80003018:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000301c:	14149073          	csrw	sepc,s1
}
    80003020:	fc1ff06f          	j	80002fe0 <_ZN5Riscv20handleSupervisorTrapEv+0x244>
        console_handler();
    80003024:	00003097          	auipc	ra,0x3
    80003028:	87c080e7          	jalr	-1924(ra) # 800058a0 <console_handler>
    8000302c:	df1ff06f          	j	80002e1c <_ZN5Riscv20handleSupervisorTrapEv+0x80>
            printString("Error 2\n");
    80003030:	00003517          	auipc	a0,0x3
    80003034:	11850513          	addi	a0,a0,280 # 80006148 <CONSOLE_STATUS+0x138>
    80003038:	ffffe097          	auipc	ra,0xffffe
    8000303c:	6ec080e7          	jalr	1772(ra) # 80001724 <_Z11printStringPKc>
    80003040:	dc5ff06f          	j	80002e04 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
            printString("Error 5\n");
    80003044:	00003517          	auipc	a0,0x3
    80003048:	11450513          	addi	a0,a0,276 # 80006158 <CONSOLE_STATUS+0x148>
    8000304c:	ffffe097          	auipc	ra,0xffffe
    80003050:	6d8080e7          	jalr	1752(ra) # 80001724 <_Z11printStringPKc>
    80003054:	db9ff06f          	j	80002e0c <_ZN5Riscv20handleSupervisorTrapEv+0x70>
            printString("Error 7\n");
    80003058:	00003517          	auipc	a0,0x3
    8000305c:	11050513          	addi	a0,a0,272 # 80006168 <CONSOLE_STATUS+0x158>
    80003060:	ffffe097          	auipc	ra,0xffffe
    80003064:	6c4080e7          	jalr	1732(ra) # 80001724 <_Z11printStringPKc>
    80003068:	dadff06f          	j	80002e14 <_ZN5Riscv20handleSupervisorTrapEv+0x78>
            printString("Error 8\n");
    8000306c:	00003517          	auipc	a0,0x3
    80003070:	10c50513          	addi	a0,a0,268 # 80006178 <CONSOLE_STATUS+0x168>
    80003074:	ffffe097          	auipc	ra,0xffffe
    80003078:	6b0080e7          	jalr	1712(ra) # 80001724 <_Z11printStringPKc>
}
    8000307c:	da1ff06f          	j	80002e1c <_ZN5Riscv20handleSupervisorTrapEv+0x80>

0000000080003080 <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyCoroutineQueue.addLast(tcb);
    80003080:	ff010113          	addi	sp,sp,-16
    80003084:	00813423          	sd	s0,8(sp)
    80003088:	01010413          	addi	s0,sp,16
    8000308c:	00100793          	li	a5,1
    80003090:	00f50863          	beq	a0,a5,800030a0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80003094:	00813403          	ld	s0,8(sp)
    80003098:	01010113          	addi	sp,sp,16
    8000309c:	00008067          	ret
    800030a0:	000107b7          	lui	a5,0x10
    800030a4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800030a8:	fef596e3          	bne	a1,a5,80003094 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0) {}
    800030ac:	00004797          	auipc	a5,0x4
    800030b0:	43c78793          	addi	a5,a5,1084 # 800074e8 <_ZN9Scheduler19readyCoroutineQueueE>
    800030b4:	0007b023          	sd	zero,0(a5)
    800030b8:	0007b423          	sd	zero,8(a5)
    800030bc:	fd9ff06f          	j	80003094 <_Z41__static_initialization_and_destruction_0ii+0x14>

00000000800030c0 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    800030c0:	fe010113          	addi	sp,sp,-32
    800030c4:	00113c23          	sd	ra,24(sp)
    800030c8:	00813823          	sd	s0,16(sp)
    800030cc:	00913423          	sd	s1,8(sp)
    800030d0:	02010413          	addi	s0,sp,32
        if(!head){ return 0; }
    800030d4:	00004517          	auipc	a0,0x4
    800030d8:	41453503          	ld	a0,1044(a0) # 800074e8 <_ZN9Scheduler19readyCoroutineQueueE>
    800030dc:	04050263          	beqz	a0,80003120 <_ZN9Scheduler3getEv+0x60>
        head = head->next;
    800030e0:	00853783          	ld	a5,8(a0)
    800030e4:	00004717          	auipc	a4,0x4
    800030e8:	40f73223          	sd	a5,1028(a4) # 800074e8 <_ZN9Scheduler19readyCoroutineQueueE>
        if(!head){ tail = 0; }
    800030ec:	02078463          	beqz	a5,80003114 <_ZN9Scheduler3getEv+0x54>
        T *ret = elem->data;
    800030f0:	00053483          	ld	s1,0(a0)
        delete elem;
    800030f4:	00000097          	auipc	ra,0x0
    800030f8:	910080e7          	jalr	-1776(ra) # 80002a04 <_ZdlPv>
}
    800030fc:	00048513          	mv	a0,s1
    80003100:	01813083          	ld	ra,24(sp)
    80003104:	01013403          	ld	s0,16(sp)
    80003108:	00813483          	ld	s1,8(sp)
    8000310c:	02010113          	addi	sp,sp,32
    80003110:	00008067          	ret
        if(!head){ tail = 0; }
    80003114:	00004797          	auipc	a5,0x4
    80003118:	3c07be23          	sd	zero,988(a5) # 800074f0 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    8000311c:	fd5ff06f          	j	800030f0 <_ZN9Scheduler3getEv+0x30>
        if(!head){ return 0; }
    80003120:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    80003124:	fd9ff06f          	j	800030fc <_ZN9Scheduler3getEv+0x3c>

0000000080003128 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80003128:	fe010113          	addi	sp,sp,-32
    8000312c:	00113c23          	sd	ra,24(sp)
    80003130:	00813823          	sd	s0,16(sp)
    80003134:	00913423          	sd	s1,8(sp)
    80003138:	02010413          	addi	s0,sp,32
    8000313c:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80003140:	01000513          	li	a0,16
    80003144:	00000097          	auipc	ra,0x0
    80003148:	870080e7          	jalr	-1936(ra) # 800029b4 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    8000314c:	00953023          	sd	s1,0(a0)
    80003150:	00053423          	sd	zero,8(a0)
        if(tail){
    80003154:	00004797          	auipc	a5,0x4
    80003158:	39c7b783          	ld	a5,924(a5) # 800074f0 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    8000315c:	02078263          	beqz	a5,80003180 <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    80003160:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80003164:	00004797          	auipc	a5,0x4
    80003168:	38a7b623          	sd	a0,908(a5) # 800074f0 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    8000316c:	01813083          	ld	ra,24(sp)
    80003170:	01013403          	ld	s0,16(sp)
    80003174:	00813483          	ld	s1,8(sp)
    80003178:	02010113          	addi	sp,sp,32
    8000317c:	00008067          	ret
            head = tail = elem;
    80003180:	00004797          	auipc	a5,0x4
    80003184:	36878793          	addi	a5,a5,872 # 800074e8 <_ZN9Scheduler19readyCoroutineQueueE>
    80003188:	00a7b423          	sd	a0,8(a5)
    8000318c:	00a7b023          	sd	a0,0(a5)
    80003190:	fddff06f          	j	8000316c <_ZN9Scheduler3putEP3TCB+0x44>

0000000080003194 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80003194:	ff010113          	addi	sp,sp,-16
    80003198:	00113423          	sd	ra,8(sp)
    8000319c:	00813023          	sd	s0,0(sp)
    800031a0:	01010413          	addi	s0,sp,16
    800031a4:	000105b7          	lui	a1,0x10
    800031a8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800031ac:	00100513          	li	a0,1
    800031b0:	00000097          	auipc	ra,0x0
    800031b4:	ed0080e7          	jalr	-304(ra) # 80003080 <_Z41__static_initialization_and_destruction_0ii>
    800031b8:	00813083          	ld	ra,8(sp)
    800031bc:	00013403          	ld	s0,0(sp)
    800031c0:	01010113          	addi	sp,sp,16
    800031c4:	00008067          	ret

00000000800031c8 <_ZN15MemoryAllocator8memAllocEv>:

MemoryBloc* MemoryAllocator::freeMemBlocHead;
MemoryBloc* MemoryAllocator::takenMemBlocHead;

// Inicijalizacija memorije
void MemoryAllocator::memAlloc(){
    800031c8:	ff010113          	addi	sp,sp,-16
    800031cc:	00813423          	sd	s0,8(sp)
    800031d0:	01010413          	addi	s0,sp,16
    freeMemBlocHead = (MemoryBloc*)HEAP_START_ADDR;
    800031d4:	00004797          	auipc	a5,0x4
    800031d8:	2747b783          	ld	a5,628(a5) # 80007448 <_GLOBAL_OFFSET_TABLE_+0x8>
    800031dc:	0007b703          	ld	a4,0(a5)
    800031e0:	00004797          	auipc	a5,0x4
    800031e4:	31878793          	addi	a5,a5,792 # 800074f8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800031e8:	00e7b023          	sd	a4,0(a5)
    freeMemBlocHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    800031ec:	00004697          	auipc	a3,0x4
    800031f0:	2846b683          	ld	a3,644(a3) # 80007470 <_GLOBAL_OFFSET_TABLE_+0x30>
    800031f4:	0006b683          	ld	a3,0(a3)
    800031f8:	40e686b3          	sub	a3,a3,a4
    800031fc:	00d73023          	sd	a3,0(a4)
    freeMemBlocHead->next = nullptr;
    80003200:	0007b703          	ld	a4,0(a5)
    80003204:	00073423          	sd	zero,8(a4)

    takenMemBlocHead = nullptr;
    80003208:	0007b423          	sd	zero,8(a5)
}
    8000320c:	00813403          	ld	s0,8(sp)
    80003210:	01010113          	addi	sp,sp,16
    80003214:	00008067          	ret

0000000080003218 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc (size_t size){
    80003218:	ff010113          	addi	sp,sp,-16
    8000321c:	00813423          	sd	s0,8(sp)
    80003220:	01010413          	addi	s0,sp,16
    size_t newSize;

    // ako je velicina veca od MEM_BLOC_SIZE onda uzmi blokova koliko ti treba + sizeof(MemoryBloc)
    // u suprotnom samo MEM_BLOC_SIZE + sizeof(MemoryBloc)
    if(size > MEM_BLOCK_SIZE){
    80003224:	04000793          	li	a5,64
    80003228:	02a7fa63          	bgeu	a5,a0,8000325c <_ZN15MemoryAllocator9mem_allocEm+0x44>
        newSize = ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    8000322c:	00655713          	srli	a4,a0,0x6
    80003230:	00170713          	addi	a4,a4,1
    80003234:	00671713          	slli	a4,a4,0x6
    80003238:	01070713          	addi	a4,a4,16
    }else{
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    }

    // trazim prvi slobodan blok u listi slobodnih blokova gde mogu da alociram
    MemoryBloc* curr = freeMemBlocHead;
    8000323c:	00004617          	auipc	a2,0x4
    80003240:	2bc63603          	ld	a2,700(a2) # 800074f8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80003244:	00060513          	mv	a0,a2

    while(newSize > curr->size && curr != nullptr){
    80003248:	00053783          	ld	a5,0(a0)
    8000324c:	00e7fc63          	bgeu	a5,a4,80003264 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
    80003250:	00050a63          	beqz	a0,80003264 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
        curr = curr->next;
    80003254:	00853503          	ld	a0,8(a0)
    while(newSize > curr->size && curr != nullptr){
    80003258:	ff1ff06f          	j	80003248 <_ZN15MemoryAllocator9mem_allocEm+0x30>
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    8000325c:	05000713          	li	a4,80
    80003260:	fddff06f          	j	8000323c <_ZN15MemoryAllocator9mem_allocEm+0x24>
    }

    if(curr == nullptr){
    80003264:	00051863          	bnez	a0,80003274 <_ZN15MemoryAllocator9mem_allocEm+0x5c>
            prevTaken->next = newBloc;
        }
    }

    return (void*)((char*)newBloc + sizeof(MemoryBloc));
};
    80003268:	00813403          	ld	s0,8(sp)
    8000326c:	01010113          	addi	sp,sp,16
    80003270:	00008067          	ret
    if(curr == freeMemBlocHead){
    80003274:	00c50e63          	beq	a0,a2,80003290 <_ZN15MemoryAllocator9mem_allocEm+0x78>
    bool checkFree = false;
    80003278:	00000593          	li	a1,0
    MemoryBloc* next = curr->next;
    8000327c:	00853803          	ld	a6,8(a0)
    size_t currSize = curr->size - newSize;
    80003280:	40e786b3          	sub	a3,a5,a4
    if(currSize == 0){
    80003284:	06e79663          	bne	a5,a4,800032f0 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
        MemoryBloc* currFree = freeMemBlocHead;
    80003288:	00060793          	mv	a5,a2
    8000328c:	0100006f          	j	8000329c <_ZN15MemoryAllocator9mem_allocEm+0x84>
        checkFree = true;
    80003290:	00100593          	li	a1,1
    80003294:	fe9ff06f          	j	8000327c <_ZN15MemoryAllocator9mem_allocEm+0x64>
            currFree = currFree->next;
    80003298:	00068793          	mv	a5,a3
        while(currFree != nullptr && currFree->next != curr && checkFree != true){
    8000329c:	00078863          	beqz	a5,800032ac <_ZN15MemoryAllocator9mem_allocEm+0x94>
    800032a0:	0087b683          	ld	a3,8(a5)
    800032a4:	00a68463          	beq	a3,a0,800032ac <_ZN15MemoryAllocator9mem_allocEm+0x94>
    800032a8:	fe0588e3          	beqz	a1,80003298 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(currFree == freeMemBlocHead){
    800032ac:	02c78a63          	beq	a5,a2,800032e0 <_ZN15MemoryAllocator9mem_allocEm+0xc8>
            currFree->next = curr->next;
    800032b0:	0107b423          	sd	a6,8(a5)
    newBloc->size = newSize;
    800032b4:	00e53023          	sd	a4,0(a0)
    if(takenMemBlocHead == nullptr){
    800032b8:	00004697          	auipc	a3,0x4
    800032bc:	2486b683          	ld	a3,584(a3) # 80007500 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    800032c0:	06068263          	beqz	a3,80003324 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
        MemoryBloc* nextTaken = takenMemBlocHead;
    800032c4:	00068793          	mv	a5,a3
        MemoryBloc* prevTaken = nullptr;
    800032c8:	00000713          	li	a4,0
        while (newBloc > nextTaken && nextTaken != nullptr){
    800032cc:	06a7f463          	bgeu	a5,a0,80003334 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
    800032d0:	06078263          	beqz	a5,80003334 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
            prevTaken = nextTaken;
    800032d4:	00078713          	mv	a4,a5
            nextTaken = nextTaken->next;
    800032d8:	0087b783          	ld	a5,8(a5)
        while (newBloc > nextTaken && nextTaken != nullptr){
    800032dc:	ff1ff06f          	j	800032cc <_ZN15MemoryAllocator9mem_allocEm+0xb4>
            freeMemBlocHead = freeMemBlocHead->next;
    800032e0:	00863783          	ld	a5,8(a2)
    800032e4:	00004697          	auipc	a3,0x4
    800032e8:	20f6ba23          	sd	a5,532(a3) # 800074f8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800032ec:	fc9ff06f          	j	800032b4 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
    }else if(checkFree == true){
    800032f0:	02058263          	beqz	a1,80003314 <_ZN15MemoryAllocator9mem_allocEm+0xfc>
        freeMemBlocHead = (MemoryBloc*)((char*)freeMemBlocHead + newSize);
    800032f4:	00e60633          	add	a2,a2,a4
    800032f8:	00004797          	auipc	a5,0x4
    800032fc:	20078793          	addi	a5,a5,512 # 800074f8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80003300:	00c7b023          	sd	a2,0(a5)
        freeMemBlocHead->size = currSize;
    80003304:	00d63023          	sd	a3,0(a2)
        freeMemBlocHead->next = next;
    80003308:	0007b783          	ld	a5,0(a5)
    8000330c:	0107b423          	sd	a6,8(a5)
    80003310:	fa5ff06f          	j	800032b4 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        curr = (MemoryBloc*)((char*)curr + newSize);
    80003314:	00e507b3          	add	a5,a0,a4
        curr->size = currSize;
    80003318:	00d7b023          	sd	a3,0(a5)
        curr->next = next;
    8000331c:	0107b423          	sd	a6,8(a5)
    80003320:	f95ff06f          	j	800032b4 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        takenMemBlocHead = newBloc;
    80003324:	00004797          	auipc	a5,0x4
    80003328:	1ca7be23          	sd	a0,476(a5) # 80007500 <_ZN15MemoryAllocator16takenMemBlocHeadE>
        newBloc->next = nullptr;
    8000332c:	00053423          	sd	zero,8(a0)
    80003330:	0100006f          	j	80003340 <_ZN15MemoryAllocator9mem_allocEm+0x128>
        if(nextTaken == takenMemBlocHead){
    80003334:	00f68a63          	beq	a3,a5,80003348 <_ZN15MemoryAllocator9mem_allocEm+0x130>
            newBloc->next = nextTaken;
    80003338:	00f53423          	sd	a5,8(a0)
            prevTaken->next = newBloc;
    8000333c:	00a73423          	sd	a0,8(a4)
    return (void*)((char*)newBloc + sizeof(MemoryBloc));
    80003340:	01050513          	addi	a0,a0,16
    80003344:	f25ff06f          	j	80003268 <_ZN15MemoryAllocator9mem_allocEm+0x50>
            newBloc->next = takenMemBlocHead;
    80003348:	00d53423          	sd	a3,8(a0)
            takenMemBlocHead = newBloc;
    8000334c:	00004797          	auipc	a5,0x4
    80003350:	1aa7ba23          	sd	a0,436(a5) # 80007500 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80003354:	fedff06f          	j	80003340 <_ZN15MemoryAllocator9mem_allocEm+0x128>

0000000080003358 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free (void* mem){
    80003358:	ff010113          	addi	sp,sp,-16
    8000335c:	00813423          	sd	s0,8(sp)
    80003360:	01010413          	addi	s0,sp,16
    void* freeCurr = (void*)((char*)mem - sizeof(MemoryBloc));
    80003364:	ff050513          	addi	a0,a0,-16

    MemoryBloc* curr = takenMemBlocHead;
    80003368:	00004697          	auipc	a3,0x4
    8000336c:	1986b683          	ld	a3,408(a3) # 80007500 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80003370:	00068793          	mv	a5,a3
    MemoryBloc* prev = nullptr;
    80003374:	00000713          	li	a4,0

    while (curr != freeCurr){
    80003378:	00a78863          	beq	a5,a0,80003388 <_ZN15MemoryAllocator8mem_freeEPv+0x30>
        prev = curr;
    8000337c:	00078713          	mv	a4,a5
        curr = curr->next;
    80003380:	0087b783          	ld	a5,8(a5)
    while (curr != freeCurr){
    80003384:	ff5ff06f          	j	80003378 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
    }
    // uraditi nepredvidjeno ponasanje ako hocu da dealociram nesto sto nisam alocirao
    if(curr == takenMemBlocHead){
    80003388:	02d78863          	beq	a5,a3,800033b8 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        takenMemBlocHead = takenMemBlocHead->next;
    }else{
        prev->next = curr->next;
    8000338c:	0087b683          	ld	a3,8(a5)
    80003390:	00d73423          	sd	a3,8(a4)
    }

    if(freeMemBlocHead == nullptr){
    80003394:	00004617          	auipc	a2,0x4
    80003398:	16463603          	ld	a2,356(a2) # 800074f8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    8000339c:	02060663          	beqz	a2,800033c8 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        freeMemBlocHead = curr;
    }else{
        MemoryBloc* currFree = freeMemBlocHead;
    800033a0:	00060713          	mv	a4,a2
        MemoryBloc* prevFree = nullptr;
    800033a4:	00000693          	li	a3,0

        while(curr > currFree){
    800033a8:	02f77663          	bgeu	a4,a5,800033d4 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
            prevFree = currFree;
    800033ac:	00070693          	mv	a3,a4
            currFree = currFree->next;
    800033b0:	00873703          	ld	a4,8(a4)
        while(curr > currFree){
    800033b4:	ff5ff06f          	j	800033a8 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
        takenMemBlocHead = takenMemBlocHead->next;
    800033b8:	0086b703          	ld	a4,8(a3)
    800033bc:	00004697          	auipc	a3,0x4
    800033c0:	14e6b223          	sd	a4,324(a3) # 80007500 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    800033c4:	fd1ff06f          	j	80003394 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
        freeMemBlocHead = curr;
    800033c8:	00004717          	auipc	a4,0x4
    800033cc:	12f73823          	sd	a5,304(a4) # 800074f8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800033d0:	0100006f          	j	800033e0 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
        }

        if(currFree == freeMemBlocHead){
    800033d4:	00e60c63          	beq	a2,a4,800033ec <_ZN15MemoryAllocator8mem_freeEPv+0x94>
            curr->next = freeMemBlocHead;
            freeMemBlocHead = curr;
        }else{
            curr->next = currFree;
    800033d8:	00e7b423          	sd	a4,8(a5)
            prevFree->next = curr;
    800033dc:	00f6b423          	sd	a5,8(a3)
        }
    }

    MemoryBloc* currMemMerge = freeMemBlocHead;
    800033e0:	00004797          	auipc	a5,0x4
    800033e4:	1187b783          	ld	a5,280(a5) # 800074f8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800033e8:	0300006f          	j	80003418 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
            curr->next = freeMemBlocHead;
    800033ec:	00c7b423          	sd	a2,8(a5)
            freeMemBlocHead = curr;
    800033f0:	00004717          	auipc	a4,0x4
    800033f4:	10f73423          	sd	a5,264(a4) # 800074f8 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    800033f8:	fe9ff06f          	j	800033e0 <_ZN15MemoryAllocator8mem_freeEPv+0x88>

    while(currMemMerge){
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
            currMemMerge->size += currMemMerge->next->size;
    800033fc:	00073603          	ld	a2,0(a4)
    80003400:	00c686b3          	add	a3,a3,a2
    80003404:	00d7b023          	sd	a3,0(a5)
            currMemMerge->next = currMemMerge->next->next;
    80003408:	00873703          	ld	a4,8(a4)
    8000340c:	00e7b423          	sd	a4,8(a5)
    80003410:	00078713          	mv	a4,a5
    80003414:	00070793          	mv	a5,a4
    while(currMemMerge){
    80003418:	00078e63          	beqz	a5,80003434 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
    8000341c:	0087b703          	ld	a4,8(a5)
    80003420:	fe070ae3          	beqz	a4,80003414 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80003424:	0007b683          	ld	a3,0(a5)
    80003428:	00d78633          	add	a2,a5,a3
    8000342c:	fec714e3          	bne	a4,a2,80003414 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80003430:	fcdff06f          	j	800033fc <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            currMemMerge = currMemMerge->next;
        }
    }

    return 0;
    80003434:	00000513          	li	a0,0
    80003438:	00813403          	ld	s0,8(sp)
    8000343c:	01010113          	addi	sp,sp,16
    80003440:	00008067          	ret

0000000080003444 <_ZN6BufferC1Ei>:
#include "../h/buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003444:	fe010113          	addi	sp,sp,-32
    80003448:	00113c23          	sd	ra,24(sp)
    8000344c:	00813823          	sd	s0,16(sp)
    80003450:	00913423          	sd	s1,8(sp)
    80003454:	01213023          	sd	s2,0(sp)
    80003458:	02010413          	addi	s0,sp,32
    8000345c:	00050493          	mv	s1,a0
    80003460:	00058913          	mv	s2,a1
    80003464:	0015879b          	addiw	a5,a1,1
    80003468:	0007851b          	sext.w	a0,a5
    8000346c:	00f4a023          	sw	a5,0(s1)
    80003470:	0004a823          	sw	zero,16(s1)
    80003474:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003478:	00251513          	slli	a0,a0,0x2
    8000347c:	ffffe097          	auipc	ra,0xffffe
    80003480:	dd8080e7          	jalr	-552(ra) # 80001254 <_Z9mem_allocm>
    80003484:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80003488:	00000593          	li	a1,0
    8000348c:	02048513          	addi	a0,s1,32
    80003490:	ffffe097          	auipc	ra,0xffffe
    80003494:	eb0080e7          	jalr	-336(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    sem_open(&spaceAvailable, _cap);
    80003498:	00090593          	mv	a1,s2
    8000349c:	01848513          	addi	a0,s1,24
    800034a0:	ffffe097          	auipc	ra,0xffffe
    800034a4:	ea0080e7          	jalr	-352(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    sem_open(&mutexHead, 1);
    800034a8:	00100593          	li	a1,1
    800034ac:	02848513          	addi	a0,s1,40
    800034b0:	ffffe097          	auipc	ra,0xffffe
    800034b4:	e90080e7          	jalr	-368(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    sem_open(&mutexTail, 1);
    800034b8:	00100593          	li	a1,1
    800034bc:	03048513          	addi	a0,s1,48
    800034c0:	ffffe097          	auipc	ra,0xffffe
    800034c4:	e80080e7          	jalr	-384(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
}
    800034c8:	01813083          	ld	ra,24(sp)
    800034cc:	01013403          	ld	s0,16(sp)
    800034d0:	00813483          	ld	s1,8(sp)
    800034d4:	00013903          	ld	s2,0(sp)
    800034d8:	02010113          	addi	sp,sp,32
    800034dc:	00008067          	ret

00000000800034e0 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800034e0:	fe010113          	addi	sp,sp,-32
    800034e4:	00113c23          	sd	ra,24(sp)
    800034e8:	00813823          	sd	s0,16(sp)
    800034ec:	00913423          	sd	s1,8(sp)
    800034f0:	01213023          	sd	s2,0(sp)
    800034f4:	02010413          	addi	s0,sp,32
    800034f8:	00050493          	mv	s1,a0
    800034fc:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003500:	01853503          	ld	a0,24(a0)
    80003504:	ffffe097          	auipc	ra,0xffffe
    80003508:	ea4080e7          	jalr	-348(ra) # 800013a8 <_Z8sem_waitP9KernelSem>

    sem_wait(mutexTail);
    8000350c:	0304b503          	ld	a0,48(s1)
    80003510:	ffffe097          	auipc	ra,0xffffe
    80003514:	e98080e7          	jalr	-360(ra) # 800013a8 <_Z8sem_waitP9KernelSem>
    buffer[tail] = val;
    80003518:	0084b783          	ld	a5,8(s1)
    8000351c:	0144a703          	lw	a4,20(s1)
    80003520:	00271713          	slli	a4,a4,0x2
    80003524:	00e787b3          	add	a5,a5,a4
    80003528:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000352c:	0144a783          	lw	a5,20(s1)
    80003530:	0017879b          	addiw	a5,a5,1
    80003534:	0004a703          	lw	a4,0(s1)
    80003538:	02e7e7bb          	remw	a5,a5,a4
    8000353c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003540:	0304b503          	ld	a0,48(s1)
    80003544:	ffffe097          	auipc	ra,0xffffe
    80003548:	e94080e7          	jalr	-364(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

    sem_signal(itemAvailable);
    8000354c:	0204b503          	ld	a0,32(s1)
    80003550:	ffffe097          	auipc	ra,0xffffe
    80003554:	e88080e7          	jalr	-376(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

}
    80003558:	01813083          	ld	ra,24(sp)
    8000355c:	01013403          	ld	s0,16(sp)
    80003560:	00813483          	ld	s1,8(sp)
    80003564:	00013903          	ld	s2,0(sp)
    80003568:	02010113          	addi	sp,sp,32
    8000356c:	00008067          	ret

0000000080003570 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80003570:	fe010113          	addi	sp,sp,-32
    80003574:	00113c23          	sd	ra,24(sp)
    80003578:	00813823          	sd	s0,16(sp)
    8000357c:	00913423          	sd	s1,8(sp)
    80003580:	01213023          	sd	s2,0(sp)
    80003584:	02010413          	addi	s0,sp,32
    80003588:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    8000358c:	02053503          	ld	a0,32(a0)
    80003590:	ffffe097          	auipc	ra,0xffffe
    80003594:	e18080e7          	jalr	-488(ra) # 800013a8 <_Z8sem_waitP9KernelSem>

    sem_wait(mutexHead);
    80003598:	0284b503          	ld	a0,40(s1)
    8000359c:	ffffe097          	auipc	ra,0xffffe
    800035a0:	e0c080e7          	jalr	-500(ra) # 800013a8 <_Z8sem_waitP9KernelSem>

    int ret = buffer[head];
    800035a4:	0084b703          	ld	a4,8(s1)
    800035a8:	0104a783          	lw	a5,16(s1)
    800035ac:	00279693          	slli	a3,a5,0x2
    800035b0:	00d70733          	add	a4,a4,a3
    800035b4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800035b8:	0017879b          	addiw	a5,a5,1
    800035bc:	0004a703          	lw	a4,0(s1)
    800035c0:	02e7e7bb          	remw	a5,a5,a4
    800035c4:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800035c8:	0284b503          	ld	a0,40(s1)
    800035cc:	ffffe097          	auipc	ra,0xffffe
    800035d0:	e0c080e7          	jalr	-500(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

    sem_signal(spaceAvailable);
    800035d4:	0184b503          	ld	a0,24(s1)
    800035d8:	ffffe097          	auipc	ra,0xffffe
    800035dc:	e00080e7          	jalr	-512(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

    return ret;
}
    800035e0:	00090513          	mv	a0,s2
    800035e4:	01813083          	ld	ra,24(sp)
    800035e8:	01013403          	ld	s0,16(sp)
    800035ec:	00813483          	ld	s1,8(sp)
    800035f0:	00013903          	ld	s2,0(sp)
    800035f4:	02010113          	addi	sp,sp,32
    800035f8:	00008067          	ret

00000000800035fc <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800035fc:	fe010113          	addi	sp,sp,-32
    80003600:	00113c23          	sd	ra,24(sp)
    80003604:	00813823          	sd	s0,16(sp)
    80003608:	00913423          	sd	s1,8(sp)
    8000360c:	01213023          	sd	s2,0(sp)
    80003610:	02010413          	addi	s0,sp,32
    80003614:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80003618:	02853503          	ld	a0,40(a0)
    8000361c:	ffffe097          	auipc	ra,0xffffe
    80003620:	d8c080e7          	jalr	-628(ra) # 800013a8 <_Z8sem_waitP9KernelSem>
    sem_wait(mutexTail);
    80003624:	0304b503          	ld	a0,48(s1)
    80003628:	ffffe097          	auipc	ra,0xffffe
    8000362c:	d80080e7          	jalr	-640(ra) # 800013a8 <_Z8sem_waitP9KernelSem>

    if (tail >= head) {
    80003630:	0144a783          	lw	a5,20(s1)
    80003634:	0104a903          	lw	s2,16(s1)
    80003638:	0327ce63          	blt	a5,s2,80003674 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    8000363c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80003640:	0304b503          	ld	a0,48(s1)
    80003644:	ffffe097          	auipc	ra,0xffffe
    80003648:	d94080e7          	jalr	-620(ra) # 800013d8 <_Z10sem_signalP9KernelSem>
    sem_signal(mutexHead);
    8000364c:	0284b503          	ld	a0,40(s1)
    80003650:	ffffe097          	auipc	ra,0xffffe
    80003654:	d88080e7          	jalr	-632(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

    return ret;
}
    80003658:	00090513          	mv	a0,s2
    8000365c:	01813083          	ld	ra,24(sp)
    80003660:	01013403          	ld	s0,16(sp)
    80003664:	00813483          	ld	s1,8(sp)
    80003668:	00013903          	ld	s2,0(sp)
    8000366c:	02010113          	addi	sp,sp,32
    80003670:	00008067          	ret
        ret = cap - head + tail;
    80003674:	0004a703          	lw	a4,0(s1)
    80003678:	4127093b          	subw	s2,a4,s2
    8000367c:	00f9093b          	addw	s2,s2,a5
    80003680:	fc1ff06f          	j	80003640 <_ZN6Buffer6getCntEv+0x44>

0000000080003684 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80003684:	fe010113          	addi	sp,sp,-32
    80003688:	00113c23          	sd	ra,24(sp)
    8000368c:	00813823          	sd	s0,16(sp)
    80003690:	00913423          	sd	s1,8(sp)
    80003694:	02010413          	addi	s0,sp,32
    80003698:	00050493          	mv	s1,a0
    putc('\n');
    8000369c:	00a00513          	li	a0,10
    800036a0:	ffffe097          	auipc	ra,0xffffe
    800036a4:	d94080e7          	jalr	-620(ra) # 80001434 <_Z4putcc>
    printString("Buffer deleted!\n");
    800036a8:	00003517          	auipc	a0,0x3
    800036ac:	97850513          	addi	a0,a0,-1672 # 80006020 <CONSOLE_STATUS+0x10>
    800036b0:	ffffe097          	auipc	ra,0xffffe
    800036b4:	074080e7          	jalr	116(ra) # 80001724 <_Z11printStringPKc>
    while (getCnt() > 0) {
    800036b8:	00048513          	mv	a0,s1
    800036bc:	00000097          	auipc	ra,0x0
    800036c0:	f40080e7          	jalr	-192(ra) # 800035fc <_ZN6Buffer6getCntEv>
    800036c4:	02a05c63          	blez	a0,800036fc <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800036c8:	0084b783          	ld	a5,8(s1)
    800036cc:	0104a703          	lw	a4,16(s1)
    800036d0:	00271713          	slli	a4,a4,0x2
    800036d4:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800036d8:	0007c503          	lbu	a0,0(a5)
    800036dc:	ffffe097          	auipc	ra,0xffffe
    800036e0:	d58080e7          	jalr	-680(ra) # 80001434 <_Z4putcc>
        head = (head + 1) % cap;
    800036e4:	0104a783          	lw	a5,16(s1)
    800036e8:	0017879b          	addiw	a5,a5,1
    800036ec:	0004a703          	lw	a4,0(s1)
    800036f0:	02e7e7bb          	remw	a5,a5,a4
    800036f4:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800036f8:	fc1ff06f          	j	800036b8 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800036fc:	02100513          	li	a0,33
    80003700:	ffffe097          	auipc	ra,0xffffe
    80003704:	d34080e7          	jalr	-716(ra) # 80001434 <_Z4putcc>
    putc('\n');
    80003708:	00a00513          	li	a0,10
    8000370c:	ffffe097          	auipc	ra,0xffffe
    80003710:	d28080e7          	jalr	-728(ra) # 80001434 <_Z4putcc>
    mem_free(buffer);
    80003714:	0084b503          	ld	a0,8(s1)
    80003718:	ffffe097          	auipc	ra,0xffffe
    8000371c:	b6c080e7          	jalr	-1172(ra) # 80001284 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80003720:	0204b503          	ld	a0,32(s1)
    80003724:	ffffe097          	auipc	ra,0xffffe
    80003728:	c54080e7          	jalr	-940(ra) # 80001378 <_Z9sem_closeP9KernelSem>
    sem_close(spaceAvailable);
    8000372c:	0184b503          	ld	a0,24(s1)
    80003730:	ffffe097          	auipc	ra,0xffffe
    80003734:	c48080e7          	jalr	-952(ra) # 80001378 <_Z9sem_closeP9KernelSem>
    sem_close(mutexTail);
    80003738:	0304b503          	ld	a0,48(s1)
    8000373c:	ffffe097          	auipc	ra,0xffffe
    80003740:	c3c080e7          	jalr	-964(ra) # 80001378 <_Z9sem_closeP9KernelSem>
    sem_close(mutexHead);
    80003744:	0284b503          	ld	a0,40(s1)
    80003748:	ffffe097          	auipc	ra,0xffffe
    8000374c:	c30080e7          	jalr	-976(ra) # 80001378 <_Z9sem_closeP9KernelSem>
}
    80003750:	01813083          	ld	ra,24(sp)
    80003754:	01013403          	ld	s0,16(sp)
    80003758:	00813483          	ld	s1,8(sp)
    8000375c:	02010113          	addi	sp,sp,32
    80003760:	00008067          	ret

0000000080003764 <start>:
    80003764:	ff010113          	addi	sp,sp,-16
    80003768:	00813423          	sd	s0,8(sp)
    8000376c:	01010413          	addi	s0,sp,16
    80003770:	300027f3          	csrr	a5,mstatus
    80003774:	ffffe737          	lui	a4,0xffffe
    80003778:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff608f>
    8000377c:	00e7f7b3          	and	a5,a5,a4
    80003780:	00001737          	lui	a4,0x1
    80003784:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003788:	00e7e7b3          	or	a5,a5,a4
    8000378c:	30079073          	csrw	mstatus,a5
    80003790:	00000797          	auipc	a5,0x0
    80003794:	16078793          	addi	a5,a5,352 # 800038f0 <system_main>
    80003798:	34179073          	csrw	mepc,a5
    8000379c:	00000793          	li	a5,0
    800037a0:	18079073          	csrw	satp,a5
    800037a4:	000107b7          	lui	a5,0x10
    800037a8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800037ac:	30279073          	csrw	medeleg,a5
    800037b0:	30379073          	csrw	mideleg,a5
    800037b4:	104027f3          	csrr	a5,sie
    800037b8:	2227e793          	ori	a5,a5,546
    800037bc:	10479073          	csrw	sie,a5
    800037c0:	fff00793          	li	a5,-1
    800037c4:	00a7d793          	srli	a5,a5,0xa
    800037c8:	3b079073          	csrw	pmpaddr0,a5
    800037cc:	00f00793          	li	a5,15
    800037d0:	3a079073          	csrw	pmpcfg0,a5
    800037d4:	f14027f3          	csrr	a5,mhartid
    800037d8:	0200c737          	lui	a4,0x200c
    800037dc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800037e0:	0007869b          	sext.w	a3,a5
    800037e4:	00269713          	slli	a4,a3,0x2
    800037e8:	000f4637          	lui	a2,0xf4
    800037ec:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800037f0:	00d70733          	add	a4,a4,a3
    800037f4:	0037979b          	slliw	a5,a5,0x3
    800037f8:	020046b7          	lui	a3,0x2004
    800037fc:	00d787b3          	add	a5,a5,a3
    80003800:	00c585b3          	add	a1,a1,a2
    80003804:	00371693          	slli	a3,a4,0x3
    80003808:	00004717          	auipc	a4,0x4
    8000380c:	d0870713          	addi	a4,a4,-760 # 80007510 <timer_scratch>
    80003810:	00b7b023          	sd	a1,0(a5)
    80003814:	00d70733          	add	a4,a4,a3
    80003818:	00f73c23          	sd	a5,24(a4)
    8000381c:	02c73023          	sd	a2,32(a4)
    80003820:	34071073          	csrw	mscratch,a4
    80003824:	00000797          	auipc	a5,0x0
    80003828:	6ec78793          	addi	a5,a5,1772 # 80003f10 <timervec>
    8000382c:	30579073          	csrw	mtvec,a5
    80003830:	300027f3          	csrr	a5,mstatus
    80003834:	0087e793          	ori	a5,a5,8
    80003838:	30079073          	csrw	mstatus,a5
    8000383c:	304027f3          	csrr	a5,mie
    80003840:	0807e793          	ori	a5,a5,128
    80003844:	30479073          	csrw	mie,a5
    80003848:	f14027f3          	csrr	a5,mhartid
    8000384c:	0007879b          	sext.w	a5,a5
    80003850:	00078213          	mv	tp,a5
    80003854:	30200073          	mret
    80003858:	00813403          	ld	s0,8(sp)
    8000385c:	01010113          	addi	sp,sp,16
    80003860:	00008067          	ret

0000000080003864 <timerinit>:
    80003864:	ff010113          	addi	sp,sp,-16
    80003868:	00813423          	sd	s0,8(sp)
    8000386c:	01010413          	addi	s0,sp,16
    80003870:	f14027f3          	csrr	a5,mhartid
    80003874:	0200c737          	lui	a4,0x200c
    80003878:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000387c:	0007869b          	sext.w	a3,a5
    80003880:	00269713          	slli	a4,a3,0x2
    80003884:	000f4637          	lui	a2,0xf4
    80003888:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000388c:	00d70733          	add	a4,a4,a3
    80003890:	0037979b          	slliw	a5,a5,0x3
    80003894:	020046b7          	lui	a3,0x2004
    80003898:	00d787b3          	add	a5,a5,a3
    8000389c:	00c585b3          	add	a1,a1,a2
    800038a0:	00371693          	slli	a3,a4,0x3
    800038a4:	00004717          	auipc	a4,0x4
    800038a8:	c6c70713          	addi	a4,a4,-916 # 80007510 <timer_scratch>
    800038ac:	00b7b023          	sd	a1,0(a5)
    800038b0:	00d70733          	add	a4,a4,a3
    800038b4:	00f73c23          	sd	a5,24(a4)
    800038b8:	02c73023          	sd	a2,32(a4)
    800038bc:	34071073          	csrw	mscratch,a4
    800038c0:	00000797          	auipc	a5,0x0
    800038c4:	65078793          	addi	a5,a5,1616 # 80003f10 <timervec>
    800038c8:	30579073          	csrw	mtvec,a5
    800038cc:	300027f3          	csrr	a5,mstatus
    800038d0:	0087e793          	ori	a5,a5,8
    800038d4:	30079073          	csrw	mstatus,a5
    800038d8:	304027f3          	csrr	a5,mie
    800038dc:	0807e793          	ori	a5,a5,128
    800038e0:	30479073          	csrw	mie,a5
    800038e4:	00813403          	ld	s0,8(sp)
    800038e8:	01010113          	addi	sp,sp,16
    800038ec:	00008067          	ret

00000000800038f0 <system_main>:
    800038f0:	fe010113          	addi	sp,sp,-32
    800038f4:	00813823          	sd	s0,16(sp)
    800038f8:	00913423          	sd	s1,8(sp)
    800038fc:	00113c23          	sd	ra,24(sp)
    80003900:	02010413          	addi	s0,sp,32
    80003904:	00000097          	auipc	ra,0x0
    80003908:	0c4080e7          	jalr	196(ra) # 800039c8 <cpuid>
    8000390c:	00004497          	auipc	s1,0x4
    80003910:	b8448493          	addi	s1,s1,-1148 # 80007490 <started>
    80003914:	02050263          	beqz	a0,80003938 <system_main+0x48>
    80003918:	0004a783          	lw	a5,0(s1)
    8000391c:	0007879b          	sext.w	a5,a5
    80003920:	fe078ce3          	beqz	a5,80003918 <system_main+0x28>
    80003924:	0ff0000f          	fence
    80003928:	00003517          	auipc	a0,0x3
    8000392c:	89050513          	addi	a0,a0,-1904 # 800061b8 <CONSOLE_STATUS+0x1a8>
    80003930:	00001097          	auipc	ra,0x1
    80003934:	a7c080e7          	jalr	-1412(ra) # 800043ac <panic>
    80003938:	00001097          	auipc	ra,0x1
    8000393c:	9d0080e7          	jalr	-1584(ra) # 80004308 <consoleinit>
    80003940:	00001097          	auipc	ra,0x1
    80003944:	15c080e7          	jalr	348(ra) # 80004a9c <printfinit>
    80003948:	00002517          	auipc	a0,0x2
    8000394c:	72850513          	addi	a0,a0,1832 # 80006070 <CONSOLE_STATUS+0x60>
    80003950:	00001097          	auipc	ra,0x1
    80003954:	ab8080e7          	jalr	-1352(ra) # 80004408 <__printf>
    80003958:	00003517          	auipc	a0,0x3
    8000395c:	83050513          	addi	a0,a0,-2000 # 80006188 <CONSOLE_STATUS+0x178>
    80003960:	00001097          	auipc	ra,0x1
    80003964:	aa8080e7          	jalr	-1368(ra) # 80004408 <__printf>
    80003968:	00002517          	auipc	a0,0x2
    8000396c:	70850513          	addi	a0,a0,1800 # 80006070 <CONSOLE_STATUS+0x60>
    80003970:	00001097          	auipc	ra,0x1
    80003974:	a98080e7          	jalr	-1384(ra) # 80004408 <__printf>
    80003978:	00001097          	auipc	ra,0x1
    8000397c:	4b0080e7          	jalr	1200(ra) # 80004e28 <kinit>
    80003980:	00000097          	auipc	ra,0x0
    80003984:	148080e7          	jalr	328(ra) # 80003ac8 <trapinit>
    80003988:	00000097          	auipc	ra,0x0
    8000398c:	16c080e7          	jalr	364(ra) # 80003af4 <trapinithart>
    80003990:	00000097          	auipc	ra,0x0
    80003994:	5c0080e7          	jalr	1472(ra) # 80003f50 <plicinit>
    80003998:	00000097          	auipc	ra,0x0
    8000399c:	5e0080e7          	jalr	1504(ra) # 80003f78 <plicinithart>
    800039a0:	00000097          	auipc	ra,0x0
    800039a4:	078080e7          	jalr	120(ra) # 80003a18 <userinit>
    800039a8:	0ff0000f          	fence
    800039ac:	00100793          	li	a5,1
    800039b0:	00002517          	auipc	a0,0x2
    800039b4:	7f050513          	addi	a0,a0,2032 # 800061a0 <CONSOLE_STATUS+0x190>
    800039b8:	00f4a023          	sw	a5,0(s1)
    800039bc:	00001097          	auipc	ra,0x1
    800039c0:	a4c080e7          	jalr	-1460(ra) # 80004408 <__printf>
    800039c4:	0000006f          	j	800039c4 <system_main+0xd4>

00000000800039c8 <cpuid>:
    800039c8:	ff010113          	addi	sp,sp,-16
    800039cc:	00813423          	sd	s0,8(sp)
    800039d0:	01010413          	addi	s0,sp,16
    800039d4:	00020513          	mv	a0,tp
    800039d8:	00813403          	ld	s0,8(sp)
    800039dc:	0005051b          	sext.w	a0,a0
    800039e0:	01010113          	addi	sp,sp,16
    800039e4:	00008067          	ret

00000000800039e8 <mycpu>:
    800039e8:	ff010113          	addi	sp,sp,-16
    800039ec:	00813423          	sd	s0,8(sp)
    800039f0:	01010413          	addi	s0,sp,16
    800039f4:	00020793          	mv	a5,tp
    800039f8:	00813403          	ld	s0,8(sp)
    800039fc:	0007879b          	sext.w	a5,a5
    80003a00:	00779793          	slli	a5,a5,0x7
    80003a04:	00005517          	auipc	a0,0x5
    80003a08:	b3c50513          	addi	a0,a0,-1220 # 80008540 <cpus>
    80003a0c:	00f50533          	add	a0,a0,a5
    80003a10:	01010113          	addi	sp,sp,16
    80003a14:	00008067          	ret

0000000080003a18 <userinit>:
    80003a18:	ff010113          	addi	sp,sp,-16
    80003a1c:	00813423          	sd	s0,8(sp)
    80003a20:	01010413          	addi	s0,sp,16
    80003a24:	00813403          	ld	s0,8(sp)
    80003a28:	01010113          	addi	sp,sp,16
    80003a2c:	fffff317          	auipc	t1,0xfffff
    80003a30:	c5830067          	jr	-936(t1) # 80002684 <main>

0000000080003a34 <either_copyout>:
    80003a34:	ff010113          	addi	sp,sp,-16
    80003a38:	00813023          	sd	s0,0(sp)
    80003a3c:	00113423          	sd	ra,8(sp)
    80003a40:	01010413          	addi	s0,sp,16
    80003a44:	02051663          	bnez	a0,80003a70 <either_copyout+0x3c>
    80003a48:	00058513          	mv	a0,a1
    80003a4c:	00060593          	mv	a1,a2
    80003a50:	0006861b          	sext.w	a2,a3
    80003a54:	00002097          	auipc	ra,0x2
    80003a58:	c60080e7          	jalr	-928(ra) # 800056b4 <__memmove>
    80003a5c:	00813083          	ld	ra,8(sp)
    80003a60:	00013403          	ld	s0,0(sp)
    80003a64:	00000513          	li	a0,0
    80003a68:	01010113          	addi	sp,sp,16
    80003a6c:	00008067          	ret
    80003a70:	00002517          	auipc	a0,0x2
    80003a74:	77050513          	addi	a0,a0,1904 # 800061e0 <CONSOLE_STATUS+0x1d0>
    80003a78:	00001097          	auipc	ra,0x1
    80003a7c:	934080e7          	jalr	-1740(ra) # 800043ac <panic>

0000000080003a80 <either_copyin>:
    80003a80:	ff010113          	addi	sp,sp,-16
    80003a84:	00813023          	sd	s0,0(sp)
    80003a88:	00113423          	sd	ra,8(sp)
    80003a8c:	01010413          	addi	s0,sp,16
    80003a90:	02059463          	bnez	a1,80003ab8 <either_copyin+0x38>
    80003a94:	00060593          	mv	a1,a2
    80003a98:	0006861b          	sext.w	a2,a3
    80003a9c:	00002097          	auipc	ra,0x2
    80003aa0:	c18080e7          	jalr	-1000(ra) # 800056b4 <__memmove>
    80003aa4:	00813083          	ld	ra,8(sp)
    80003aa8:	00013403          	ld	s0,0(sp)
    80003aac:	00000513          	li	a0,0
    80003ab0:	01010113          	addi	sp,sp,16
    80003ab4:	00008067          	ret
    80003ab8:	00002517          	auipc	a0,0x2
    80003abc:	75050513          	addi	a0,a0,1872 # 80006208 <CONSOLE_STATUS+0x1f8>
    80003ac0:	00001097          	auipc	ra,0x1
    80003ac4:	8ec080e7          	jalr	-1812(ra) # 800043ac <panic>

0000000080003ac8 <trapinit>:
    80003ac8:	ff010113          	addi	sp,sp,-16
    80003acc:	00813423          	sd	s0,8(sp)
    80003ad0:	01010413          	addi	s0,sp,16
    80003ad4:	00813403          	ld	s0,8(sp)
    80003ad8:	00002597          	auipc	a1,0x2
    80003adc:	75858593          	addi	a1,a1,1880 # 80006230 <CONSOLE_STATUS+0x220>
    80003ae0:	00005517          	auipc	a0,0x5
    80003ae4:	ae050513          	addi	a0,a0,-1312 # 800085c0 <tickslock>
    80003ae8:	01010113          	addi	sp,sp,16
    80003aec:	00001317          	auipc	t1,0x1
    80003af0:	5cc30067          	jr	1484(t1) # 800050b8 <initlock>

0000000080003af4 <trapinithart>:
    80003af4:	ff010113          	addi	sp,sp,-16
    80003af8:	00813423          	sd	s0,8(sp)
    80003afc:	01010413          	addi	s0,sp,16
    80003b00:	00000797          	auipc	a5,0x0
    80003b04:	30078793          	addi	a5,a5,768 # 80003e00 <kernelvec>
    80003b08:	10579073          	csrw	stvec,a5
    80003b0c:	00813403          	ld	s0,8(sp)
    80003b10:	01010113          	addi	sp,sp,16
    80003b14:	00008067          	ret

0000000080003b18 <usertrap>:
    80003b18:	ff010113          	addi	sp,sp,-16
    80003b1c:	00813423          	sd	s0,8(sp)
    80003b20:	01010413          	addi	s0,sp,16
    80003b24:	00813403          	ld	s0,8(sp)
    80003b28:	01010113          	addi	sp,sp,16
    80003b2c:	00008067          	ret

0000000080003b30 <usertrapret>:
    80003b30:	ff010113          	addi	sp,sp,-16
    80003b34:	00813423          	sd	s0,8(sp)
    80003b38:	01010413          	addi	s0,sp,16
    80003b3c:	00813403          	ld	s0,8(sp)
    80003b40:	01010113          	addi	sp,sp,16
    80003b44:	00008067          	ret

0000000080003b48 <kerneltrap>:
    80003b48:	fe010113          	addi	sp,sp,-32
    80003b4c:	00813823          	sd	s0,16(sp)
    80003b50:	00113c23          	sd	ra,24(sp)
    80003b54:	00913423          	sd	s1,8(sp)
    80003b58:	02010413          	addi	s0,sp,32
    80003b5c:	142025f3          	csrr	a1,scause
    80003b60:	100027f3          	csrr	a5,sstatus
    80003b64:	0027f793          	andi	a5,a5,2
    80003b68:	10079c63          	bnez	a5,80003c80 <kerneltrap+0x138>
    80003b6c:	142027f3          	csrr	a5,scause
    80003b70:	0207ce63          	bltz	a5,80003bac <kerneltrap+0x64>
    80003b74:	00002517          	auipc	a0,0x2
    80003b78:	70450513          	addi	a0,a0,1796 # 80006278 <CONSOLE_STATUS+0x268>
    80003b7c:	00001097          	auipc	ra,0x1
    80003b80:	88c080e7          	jalr	-1908(ra) # 80004408 <__printf>
    80003b84:	141025f3          	csrr	a1,sepc
    80003b88:	14302673          	csrr	a2,stval
    80003b8c:	00002517          	auipc	a0,0x2
    80003b90:	6fc50513          	addi	a0,a0,1788 # 80006288 <CONSOLE_STATUS+0x278>
    80003b94:	00001097          	auipc	ra,0x1
    80003b98:	874080e7          	jalr	-1932(ra) # 80004408 <__printf>
    80003b9c:	00002517          	auipc	a0,0x2
    80003ba0:	70450513          	addi	a0,a0,1796 # 800062a0 <CONSOLE_STATUS+0x290>
    80003ba4:	00001097          	auipc	ra,0x1
    80003ba8:	808080e7          	jalr	-2040(ra) # 800043ac <panic>
    80003bac:	0ff7f713          	andi	a4,a5,255
    80003bb0:	00900693          	li	a3,9
    80003bb4:	04d70063          	beq	a4,a3,80003bf4 <kerneltrap+0xac>
    80003bb8:	fff00713          	li	a4,-1
    80003bbc:	03f71713          	slli	a4,a4,0x3f
    80003bc0:	00170713          	addi	a4,a4,1
    80003bc4:	fae798e3          	bne	a5,a4,80003b74 <kerneltrap+0x2c>
    80003bc8:	00000097          	auipc	ra,0x0
    80003bcc:	e00080e7          	jalr	-512(ra) # 800039c8 <cpuid>
    80003bd0:	06050663          	beqz	a0,80003c3c <kerneltrap+0xf4>
    80003bd4:	144027f3          	csrr	a5,sip
    80003bd8:	ffd7f793          	andi	a5,a5,-3
    80003bdc:	14479073          	csrw	sip,a5
    80003be0:	01813083          	ld	ra,24(sp)
    80003be4:	01013403          	ld	s0,16(sp)
    80003be8:	00813483          	ld	s1,8(sp)
    80003bec:	02010113          	addi	sp,sp,32
    80003bf0:	00008067          	ret
    80003bf4:	00000097          	auipc	ra,0x0
    80003bf8:	3d0080e7          	jalr	976(ra) # 80003fc4 <plic_claim>
    80003bfc:	00a00793          	li	a5,10
    80003c00:	00050493          	mv	s1,a0
    80003c04:	06f50863          	beq	a0,a5,80003c74 <kerneltrap+0x12c>
    80003c08:	fc050ce3          	beqz	a0,80003be0 <kerneltrap+0x98>
    80003c0c:	00050593          	mv	a1,a0
    80003c10:	00002517          	auipc	a0,0x2
    80003c14:	64850513          	addi	a0,a0,1608 # 80006258 <CONSOLE_STATUS+0x248>
    80003c18:	00000097          	auipc	ra,0x0
    80003c1c:	7f0080e7          	jalr	2032(ra) # 80004408 <__printf>
    80003c20:	01013403          	ld	s0,16(sp)
    80003c24:	01813083          	ld	ra,24(sp)
    80003c28:	00048513          	mv	a0,s1
    80003c2c:	00813483          	ld	s1,8(sp)
    80003c30:	02010113          	addi	sp,sp,32
    80003c34:	00000317          	auipc	t1,0x0
    80003c38:	3c830067          	jr	968(t1) # 80003ffc <plic_complete>
    80003c3c:	00005517          	auipc	a0,0x5
    80003c40:	98450513          	addi	a0,a0,-1660 # 800085c0 <tickslock>
    80003c44:	00001097          	auipc	ra,0x1
    80003c48:	498080e7          	jalr	1176(ra) # 800050dc <acquire>
    80003c4c:	00004717          	auipc	a4,0x4
    80003c50:	84870713          	addi	a4,a4,-1976 # 80007494 <ticks>
    80003c54:	00072783          	lw	a5,0(a4)
    80003c58:	00005517          	auipc	a0,0x5
    80003c5c:	96850513          	addi	a0,a0,-1688 # 800085c0 <tickslock>
    80003c60:	0017879b          	addiw	a5,a5,1
    80003c64:	00f72023          	sw	a5,0(a4)
    80003c68:	00001097          	auipc	ra,0x1
    80003c6c:	540080e7          	jalr	1344(ra) # 800051a8 <release>
    80003c70:	f65ff06f          	j	80003bd4 <kerneltrap+0x8c>
    80003c74:	00001097          	auipc	ra,0x1
    80003c78:	09c080e7          	jalr	156(ra) # 80004d10 <uartintr>
    80003c7c:	fa5ff06f          	j	80003c20 <kerneltrap+0xd8>
    80003c80:	00002517          	auipc	a0,0x2
    80003c84:	5b850513          	addi	a0,a0,1464 # 80006238 <CONSOLE_STATUS+0x228>
    80003c88:	00000097          	auipc	ra,0x0
    80003c8c:	724080e7          	jalr	1828(ra) # 800043ac <panic>

0000000080003c90 <clockintr>:
    80003c90:	fe010113          	addi	sp,sp,-32
    80003c94:	00813823          	sd	s0,16(sp)
    80003c98:	00913423          	sd	s1,8(sp)
    80003c9c:	00113c23          	sd	ra,24(sp)
    80003ca0:	02010413          	addi	s0,sp,32
    80003ca4:	00005497          	auipc	s1,0x5
    80003ca8:	91c48493          	addi	s1,s1,-1764 # 800085c0 <tickslock>
    80003cac:	00048513          	mv	a0,s1
    80003cb0:	00001097          	auipc	ra,0x1
    80003cb4:	42c080e7          	jalr	1068(ra) # 800050dc <acquire>
    80003cb8:	00003717          	auipc	a4,0x3
    80003cbc:	7dc70713          	addi	a4,a4,2012 # 80007494 <ticks>
    80003cc0:	00072783          	lw	a5,0(a4)
    80003cc4:	01013403          	ld	s0,16(sp)
    80003cc8:	01813083          	ld	ra,24(sp)
    80003ccc:	00048513          	mv	a0,s1
    80003cd0:	0017879b          	addiw	a5,a5,1
    80003cd4:	00813483          	ld	s1,8(sp)
    80003cd8:	00f72023          	sw	a5,0(a4)
    80003cdc:	02010113          	addi	sp,sp,32
    80003ce0:	00001317          	auipc	t1,0x1
    80003ce4:	4c830067          	jr	1224(t1) # 800051a8 <release>

0000000080003ce8 <devintr>:
    80003ce8:	142027f3          	csrr	a5,scause
    80003cec:	00000513          	li	a0,0
    80003cf0:	0007c463          	bltz	a5,80003cf8 <devintr+0x10>
    80003cf4:	00008067          	ret
    80003cf8:	fe010113          	addi	sp,sp,-32
    80003cfc:	00813823          	sd	s0,16(sp)
    80003d00:	00113c23          	sd	ra,24(sp)
    80003d04:	00913423          	sd	s1,8(sp)
    80003d08:	02010413          	addi	s0,sp,32
    80003d0c:	0ff7f713          	andi	a4,a5,255
    80003d10:	00900693          	li	a3,9
    80003d14:	04d70c63          	beq	a4,a3,80003d6c <devintr+0x84>
    80003d18:	fff00713          	li	a4,-1
    80003d1c:	03f71713          	slli	a4,a4,0x3f
    80003d20:	00170713          	addi	a4,a4,1
    80003d24:	00e78c63          	beq	a5,a4,80003d3c <devintr+0x54>
    80003d28:	01813083          	ld	ra,24(sp)
    80003d2c:	01013403          	ld	s0,16(sp)
    80003d30:	00813483          	ld	s1,8(sp)
    80003d34:	02010113          	addi	sp,sp,32
    80003d38:	00008067          	ret
    80003d3c:	00000097          	auipc	ra,0x0
    80003d40:	c8c080e7          	jalr	-884(ra) # 800039c8 <cpuid>
    80003d44:	06050663          	beqz	a0,80003db0 <devintr+0xc8>
    80003d48:	144027f3          	csrr	a5,sip
    80003d4c:	ffd7f793          	andi	a5,a5,-3
    80003d50:	14479073          	csrw	sip,a5
    80003d54:	01813083          	ld	ra,24(sp)
    80003d58:	01013403          	ld	s0,16(sp)
    80003d5c:	00813483          	ld	s1,8(sp)
    80003d60:	00200513          	li	a0,2
    80003d64:	02010113          	addi	sp,sp,32
    80003d68:	00008067          	ret
    80003d6c:	00000097          	auipc	ra,0x0
    80003d70:	258080e7          	jalr	600(ra) # 80003fc4 <plic_claim>
    80003d74:	00a00793          	li	a5,10
    80003d78:	00050493          	mv	s1,a0
    80003d7c:	06f50663          	beq	a0,a5,80003de8 <devintr+0x100>
    80003d80:	00100513          	li	a0,1
    80003d84:	fa0482e3          	beqz	s1,80003d28 <devintr+0x40>
    80003d88:	00048593          	mv	a1,s1
    80003d8c:	00002517          	auipc	a0,0x2
    80003d90:	4cc50513          	addi	a0,a0,1228 # 80006258 <CONSOLE_STATUS+0x248>
    80003d94:	00000097          	auipc	ra,0x0
    80003d98:	674080e7          	jalr	1652(ra) # 80004408 <__printf>
    80003d9c:	00048513          	mv	a0,s1
    80003da0:	00000097          	auipc	ra,0x0
    80003da4:	25c080e7          	jalr	604(ra) # 80003ffc <plic_complete>
    80003da8:	00100513          	li	a0,1
    80003dac:	f7dff06f          	j	80003d28 <devintr+0x40>
    80003db0:	00005517          	auipc	a0,0x5
    80003db4:	81050513          	addi	a0,a0,-2032 # 800085c0 <tickslock>
    80003db8:	00001097          	auipc	ra,0x1
    80003dbc:	324080e7          	jalr	804(ra) # 800050dc <acquire>
    80003dc0:	00003717          	auipc	a4,0x3
    80003dc4:	6d470713          	addi	a4,a4,1748 # 80007494 <ticks>
    80003dc8:	00072783          	lw	a5,0(a4)
    80003dcc:	00004517          	auipc	a0,0x4
    80003dd0:	7f450513          	addi	a0,a0,2036 # 800085c0 <tickslock>
    80003dd4:	0017879b          	addiw	a5,a5,1
    80003dd8:	00f72023          	sw	a5,0(a4)
    80003ddc:	00001097          	auipc	ra,0x1
    80003de0:	3cc080e7          	jalr	972(ra) # 800051a8 <release>
    80003de4:	f65ff06f          	j	80003d48 <devintr+0x60>
    80003de8:	00001097          	auipc	ra,0x1
    80003dec:	f28080e7          	jalr	-216(ra) # 80004d10 <uartintr>
    80003df0:	fadff06f          	j	80003d9c <devintr+0xb4>
	...

0000000080003e00 <kernelvec>:
    80003e00:	f0010113          	addi	sp,sp,-256
    80003e04:	00113023          	sd	ra,0(sp)
    80003e08:	00213423          	sd	sp,8(sp)
    80003e0c:	00313823          	sd	gp,16(sp)
    80003e10:	00413c23          	sd	tp,24(sp)
    80003e14:	02513023          	sd	t0,32(sp)
    80003e18:	02613423          	sd	t1,40(sp)
    80003e1c:	02713823          	sd	t2,48(sp)
    80003e20:	02813c23          	sd	s0,56(sp)
    80003e24:	04913023          	sd	s1,64(sp)
    80003e28:	04a13423          	sd	a0,72(sp)
    80003e2c:	04b13823          	sd	a1,80(sp)
    80003e30:	04c13c23          	sd	a2,88(sp)
    80003e34:	06d13023          	sd	a3,96(sp)
    80003e38:	06e13423          	sd	a4,104(sp)
    80003e3c:	06f13823          	sd	a5,112(sp)
    80003e40:	07013c23          	sd	a6,120(sp)
    80003e44:	09113023          	sd	a7,128(sp)
    80003e48:	09213423          	sd	s2,136(sp)
    80003e4c:	09313823          	sd	s3,144(sp)
    80003e50:	09413c23          	sd	s4,152(sp)
    80003e54:	0b513023          	sd	s5,160(sp)
    80003e58:	0b613423          	sd	s6,168(sp)
    80003e5c:	0b713823          	sd	s7,176(sp)
    80003e60:	0b813c23          	sd	s8,184(sp)
    80003e64:	0d913023          	sd	s9,192(sp)
    80003e68:	0da13423          	sd	s10,200(sp)
    80003e6c:	0db13823          	sd	s11,208(sp)
    80003e70:	0dc13c23          	sd	t3,216(sp)
    80003e74:	0fd13023          	sd	t4,224(sp)
    80003e78:	0fe13423          	sd	t5,232(sp)
    80003e7c:	0ff13823          	sd	t6,240(sp)
    80003e80:	cc9ff0ef          	jal	ra,80003b48 <kerneltrap>
    80003e84:	00013083          	ld	ra,0(sp)
    80003e88:	00813103          	ld	sp,8(sp)
    80003e8c:	01013183          	ld	gp,16(sp)
    80003e90:	02013283          	ld	t0,32(sp)
    80003e94:	02813303          	ld	t1,40(sp)
    80003e98:	03013383          	ld	t2,48(sp)
    80003e9c:	03813403          	ld	s0,56(sp)
    80003ea0:	04013483          	ld	s1,64(sp)
    80003ea4:	04813503          	ld	a0,72(sp)
    80003ea8:	05013583          	ld	a1,80(sp)
    80003eac:	05813603          	ld	a2,88(sp)
    80003eb0:	06013683          	ld	a3,96(sp)
    80003eb4:	06813703          	ld	a4,104(sp)
    80003eb8:	07013783          	ld	a5,112(sp)
    80003ebc:	07813803          	ld	a6,120(sp)
    80003ec0:	08013883          	ld	a7,128(sp)
    80003ec4:	08813903          	ld	s2,136(sp)
    80003ec8:	09013983          	ld	s3,144(sp)
    80003ecc:	09813a03          	ld	s4,152(sp)
    80003ed0:	0a013a83          	ld	s5,160(sp)
    80003ed4:	0a813b03          	ld	s6,168(sp)
    80003ed8:	0b013b83          	ld	s7,176(sp)
    80003edc:	0b813c03          	ld	s8,184(sp)
    80003ee0:	0c013c83          	ld	s9,192(sp)
    80003ee4:	0c813d03          	ld	s10,200(sp)
    80003ee8:	0d013d83          	ld	s11,208(sp)
    80003eec:	0d813e03          	ld	t3,216(sp)
    80003ef0:	0e013e83          	ld	t4,224(sp)
    80003ef4:	0e813f03          	ld	t5,232(sp)
    80003ef8:	0f013f83          	ld	t6,240(sp)
    80003efc:	10010113          	addi	sp,sp,256
    80003f00:	10200073          	sret
    80003f04:	00000013          	nop
    80003f08:	00000013          	nop
    80003f0c:	00000013          	nop

0000000080003f10 <timervec>:
    80003f10:	34051573          	csrrw	a0,mscratch,a0
    80003f14:	00b53023          	sd	a1,0(a0)
    80003f18:	00c53423          	sd	a2,8(a0)
    80003f1c:	00d53823          	sd	a3,16(a0)
    80003f20:	01853583          	ld	a1,24(a0)
    80003f24:	02053603          	ld	a2,32(a0)
    80003f28:	0005b683          	ld	a3,0(a1)
    80003f2c:	00c686b3          	add	a3,a3,a2
    80003f30:	00d5b023          	sd	a3,0(a1)
    80003f34:	00200593          	li	a1,2
    80003f38:	14459073          	csrw	sip,a1
    80003f3c:	01053683          	ld	a3,16(a0)
    80003f40:	00853603          	ld	a2,8(a0)
    80003f44:	00053583          	ld	a1,0(a0)
    80003f48:	34051573          	csrrw	a0,mscratch,a0
    80003f4c:	30200073          	mret

0000000080003f50 <plicinit>:
    80003f50:	ff010113          	addi	sp,sp,-16
    80003f54:	00813423          	sd	s0,8(sp)
    80003f58:	01010413          	addi	s0,sp,16
    80003f5c:	00813403          	ld	s0,8(sp)
    80003f60:	0c0007b7          	lui	a5,0xc000
    80003f64:	00100713          	li	a4,1
    80003f68:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80003f6c:	00e7a223          	sw	a4,4(a5)
    80003f70:	01010113          	addi	sp,sp,16
    80003f74:	00008067          	ret

0000000080003f78 <plicinithart>:
    80003f78:	ff010113          	addi	sp,sp,-16
    80003f7c:	00813023          	sd	s0,0(sp)
    80003f80:	00113423          	sd	ra,8(sp)
    80003f84:	01010413          	addi	s0,sp,16
    80003f88:	00000097          	auipc	ra,0x0
    80003f8c:	a40080e7          	jalr	-1472(ra) # 800039c8 <cpuid>
    80003f90:	0085171b          	slliw	a4,a0,0x8
    80003f94:	0c0027b7          	lui	a5,0xc002
    80003f98:	00e787b3          	add	a5,a5,a4
    80003f9c:	40200713          	li	a4,1026
    80003fa0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003fa4:	00813083          	ld	ra,8(sp)
    80003fa8:	00013403          	ld	s0,0(sp)
    80003fac:	00d5151b          	slliw	a0,a0,0xd
    80003fb0:	0c2017b7          	lui	a5,0xc201
    80003fb4:	00a78533          	add	a0,a5,a0
    80003fb8:	00052023          	sw	zero,0(a0)
    80003fbc:	01010113          	addi	sp,sp,16
    80003fc0:	00008067          	ret

0000000080003fc4 <plic_claim>:
    80003fc4:	ff010113          	addi	sp,sp,-16
    80003fc8:	00813023          	sd	s0,0(sp)
    80003fcc:	00113423          	sd	ra,8(sp)
    80003fd0:	01010413          	addi	s0,sp,16
    80003fd4:	00000097          	auipc	ra,0x0
    80003fd8:	9f4080e7          	jalr	-1548(ra) # 800039c8 <cpuid>
    80003fdc:	00813083          	ld	ra,8(sp)
    80003fe0:	00013403          	ld	s0,0(sp)
    80003fe4:	00d5151b          	slliw	a0,a0,0xd
    80003fe8:	0c2017b7          	lui	a5,0xc201
    80003fec:	00a78533          	add	a0,a5,a0
    80003ff0:	00452503          	lw	a0,4(a0)
    80003ff4:	01010113          	addi	sp,sp,16
    80003ff8:	00008067          	ret

0000000080003ffc <plic_complete>:
    80003ffc:	fe010113          	addi	sp,sp,-32
    80004000:	00813823          	sd	s0,16(sp)
    80004004:	00913423          	sd	s1,8(sp)
    80004008:	00113c23          	sd	ra,24(sp)
    8000400c:	02010413          	addi	s0,sp,32
    80004010:	00050493          	mv	s1,a0
    80004014:	00000097          	auipc	ra,0x0
    80004018:	9b4080e7          	jalr	-1612(ra) # 800039c8 <cpuid>
    8000401c:	01813083          	ld	ra,24(sp)
    80004020:	01013403          	ld	s0,16(sp)
    80004024:	00d5179b          	slliw	a5,a0,0xd
    80004028:	0c201737          	lui	a4,0xc201
    8000402c:	00f707b3          	add	a5,a4,a5
    80004030:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004034:	00813483          	ld	s1,8(sp)
    80004038:	02010113          	addi	sp,sp,32
    8000403c:	00008067          	ret

0000000080004040 <consolewrite>:
    80004040:	fb010113          	addi	sp,sp,-80
    80004044:	04813023          	sd	s0,64(sp)
    80004048:	04113423          	sd	ra,72(sp)
    8000404c:	02913c23          	sd	s1,56(sp)
    80004050:	03213823          	sd	s2,48(sp)
    80004054:	03313423          	sd	s3,40(sp)
    80004058:	03413023          	sd	s4,32(sp)
    8000405c:	01513c23          	sd	s5,24(sp)
    80004060:	05010413          	addi	s0,sp,80
    80004064:	06c05c63          	blez	a2,800040dc <consolewrite+0x9c>
    80004068:	00060993          	mv	s3,a2
    8000406c:	00050a13          	mv	s4,a0
    80004070:	00058493          	mv	s1,a1
    80004074:	00000913          	li	s2,0
    80004078:	fff00a93          	li	s5,-1
    8000407c:	01c0006f          	j	80004098 <consolewrite+0x58>
    80004080:	fbf44503          	lbu	a0,-65(s0)
    80004084:	0019091b          	addiw	s2,s2,1
    80004088:	00148493          	addi	s1,s1,1
    8000408c:	00001097          	auipc	ra,0x1
    80004090:	a9c080e7          	jalr	-1380(ra) # 80004b28 <uartputc>
    80004094:	03298063          	beq	s3,s2,800040b4 <consolewrite+0x74>
    80004098:	00048613          	mv	a2,s1
    8000409c:	00100693          	li	a3,1
    800040a0:	000a0593          	mv	a1,s4
    800040a4:	fbf40513          	addi	a0,s0,-65
    800040a8:	00000097          	auipc	ra,0x0
    800040ac:	9d8080e7          	jalr	-1576(ra) # 80003a80 <either_copyin>
    800040b0:	fd5518e3          	bne	a0,s5,80004080 <consolewrite+0x40>
    800040b4:	04813083          	ld	ra,72(sp)
    800040b8:	04013403          	ld	s0,64(sp)
    800040bc:	03813483          	ld	s1,56(sp)
    800040c0:	02813983          	ld	s3,40(sp)
    800040c4:	02013a03          	ld	s4,32(sp)
    800040c8:	01813a83          	ld	s5,24(sp)
    800040cc:	00090513          	mv	a0,s2
    800040d0:	03013903          	ld	s2,48(sp)
    800040d4:	05010113          	addi	sp,sp,80
    800040d8:	00008067          	ret
    800040dc:	00000913          	li	s2,0
    800040e0:	fd5ff06f          	j	800040b4 <consolewrite+0x74>

00000000800040e4 <consoleread>:
    800040e4:	f9010113          	addi	sp,sp,-112
    800040e8:	06813023          	sd	s0,96(sp)
    800040ec:	04913c23          	sd	s1,88(sp)
    800040f0:	05213823          	sd	s2,80(sp)
    800040f4:	05313423          	sd	s3,72(sp)
    800040f8:	05413023          	sd	s4,64(sp)
    800040fc:	03513c23          	sd	s5,56(sp)
    80004100:	03613823          	sd	s6,48(sp)
    80004104:	03713423          	sd	s7,40(sp)
    80004108:	03813023          	sd	s8,32(sp)
    8000410c:	06113423          	sd	ra,104(sp)
    80004110:	01913c23          	sd	s9,24(sp)
    80004114:	07010413          	addi	s0,sp,112
    80004118:	00060b93          	mv	s7,a2
    8000411c:	00050913          	mv	s2,a0
    80004120:	00058c13          	mv	s8,a1
    80004124:	00060b1b          	sext.w	s6,a2
    80004128:	00004497          	auipc	s1,0x4
    8000412c:	4c048493          	addi	s1,s1,1216 # 800085e8 <cons>
    80004130:	00400993          	li	s3,4
    80004134:	fff00a13          	li	s4,-1
    80004138:	00a00a93          	li	s5,10
    8000413c:	05705e63          	blez	s7,80004198 <consoleread+0xb4>
    80004140:	09c4a703          	lw	a4,156(s1)
    80004144:	0984a783          	lw	a5,152(s1)
    80004148:	0007071b          	sext.w	a4,a4
    8000414c:	08e78463          	beq	a5,a4,800041d4 <consoleread+0xf0>
    80004150:	07f7f713          	andi	a4,a5,127
    80004154:	00e48733          	add	a4,s1,a4
    80004158:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000415c:	0017869b          	addiw	a3,a5,1
    80004160:	08d4ac23          	sw	a3,152(s1)
    80004164:	00070c9b          	sext.w	s9,a4
    80004168:	0b370663          	beq	a4,s3,80004214 <consoleread+0x130>
    8000416c:	00100693          	li	a3,1
    80004170:	f9f40613          	addi	a2,s0,-97
    80004174:	000c0593          	mv	a1,s8
    80004178:	00090513          	mv	a0,s2
    8000417c:	f8e40fa3          	sb	a4,-97(s0)
    80004180:	00000097          	auipc	ra,0x0
    80004184:	8b4080e7          	jalr	-1868(ra) # 80003a34 <either_copyout>
    80004188:	01450863          	beq	a0,s4,80004198 <consoleread+0xb4>
    8000418c:	001c0c13          	addi	s8,s8,1
    80004190:	fffb8b9b          	addiw	s7,s7,-1
    80004194:	fb5c94e3          	bne	s9,s5,8000413c <consoleread+0x58>
    80004198:	000b851b          	sext.w	a0,s7
    8000419c:	06813083          	ld	ra,104(sp)
    800041a0:	06013403          	ld	s0,96(sp)
    800041a4:	05813483          	ld	s1,88(sp)
    800041a8:	05013903          	ld	s2,80(sp)
    800041ac:	04813983          	ld	s3,72(sp)
    800041b0:	04013a03          	ld	s4,64(sp)
    800041b4:	03813a83          	ld	s5,56(sp)
    800041b8:	02813b83          	ld	s7,40(sp)
    800041bc:	02013c03          	ld	s8,32(sp)
    800041c0:	01813c83          	ld	s9,24(sp)
    800041c4:	40ab053b          	subw	a0,s6,a0
    800041c8:	03013b03          	ld	s6,48(sp)
    800041cc:	07010113          	addi	sp,sp,112
    800041d0:	00008067          	ret
    800041d4:	00001097          	auipc	ra,0x1
    800041d8:	1d8080e7          	jalr	472(ra) # 800053ac <push_on>
    800041dc:	0984a703          	lw	a4,152(s1)
    800041e0:	09c4a783          	lw	a5,156(s1)
    800041e4:	0007879b          	sext.w	a5,a5
    800041e8:	fef70ce3          	beq	a4,a5,800041e0 <consoleread+0xfc>
    800041ec:	00001097          	auipc	ra,0x1
    800041f0:	234080e7          	jalr	564(ra) # 80005420 <pop_on>
    800041f4:	0984a783          	lw	a5,152(s1)
    800041f8:	07f7f713          	andi	a4,a5,127
    800041fc:	00e48733          	add	a4,s1,a4
    80004200:	01874703          	lbu	a4,24(a4)
    80004204:	0017869b          	addiw	a3,a5,1
    80004208:	08d4ac23          	sw	a3,152(s1)
    8000420c:	00070c9b          	sext.w	s9,a4
    80004210:	f5371ee3          	bne	a4,s3,8000416c <consoleread+0x88>
    80004214:	000b851b          	sext.w	a0,s7
    80004218:	f96bf2e3          	bgeu	s7,s6,8000419c <consoleread+0xb8>
    8000421c:	08f4ac23          	sw	a5,152(s1)
    80004220:	f7dff06f          	j	8000419c <consoleread+0xb8>

0000000080004224 <consputc>:
    80004224:	10000793          	li	a5,256
    80004228:	00f50663          	beq	a0,a5,80004234 <consputc+0x10>
    8000422c:	00001317          	auipc	t1,0x1
    80004230:	9f430067          	jr	-1548(t1) # 80004c20 <uartputc_sync>
    80004234:	ff010113          	addi	sp,sp,-16
    80004238:	00113423          	sd	ra,8(sp)
    8000423c:	00813023          	sd	s0,0(sp)
    80004240:	01010413          	addi	s0,sp,16
    80004244:	00800513          	li	a0,8
    80004248:	00001097          	auipc	ra,0x1
    8000424c:	9d8080e7          	jalr	-1576(ra) # 80004c20 <uartputc_sync>
    80004250:	02000513          	li	a0,32
    80004254:	00001097          	auipc	ra,0x1
    80004258:	9cc080e7          	jalr	-1588(ra) # 80004c20 <uartputc_sync>
    8000425c:	00013403          	ld	s0,0(sp)
    80004260:	00813083          	ld	ra,8(sp)
    80004264:	00800513          	li	a0,8
    80004268:	01010113          	addi	sp,sp,16
    8000426c:	00001317          	auipc	t1,0x1
    80004270:	9b430067          	jr	-1612(t1) # 80004c20 <uartputc_sync>

0000000080004274 <consoleintr>:
    80004274:	fe010113          	addi	sp,sp,-32
    80004278:	00813823          	sd	s0,16(sp)
    8000427c:	00913423          	sd	s1,8(sp)
    80004280:	01213023          	sd	s2,0(sp)
    80004284:	00113c23          	sd	ra,24(sp)
    80004288:	02010413          	addi	s0,sp,32
    8000428c:	00004917          	auipc	s2,0x4
    80004290:	35c90913          	addi	s2,s2,860 # 800085e8 <cons>
    80004294:	00050493          	mv	s1,a0
    80004298:	00090513          	mv	a0,s2
    8000429c:	00001097          	auipc	ra,0x1
    800042a0:	e40080e7          	jalr	-448(ra) # 800050dc <acquire>
    800042a4:	02048c63          	beqz	s1,800042dc <consoleintr+0x68>
    800042a8:	0a092783          	lw	a5,160(s2)
    800042ac:	09892703          	lw	a4,152(s2)
    800042b0:	07f00693          	li	a3,127
    800042b4:	40e7873b          	subw	a4,a5,a4
    800042b8:	02e6e263          	bltu	a3,a4,800042dc <consoleintr+0x68>
    800042bc:	00d00713          	li	a4,13
    800042c0:	04e48063          	beq	s1,a4,80004300 <consoleintr+0x8c>
    800042c4:	07f7f713          	andi	a4,a5,127
    800042c8:	00e90733          	add	a4,s2,a4
    800042cc:	0017879b          	addiw	a5,a5,1
    800042d0:	0af92023          	sw	a5,160(s2)
    800042d4:	00970c23          	sb	s1,24(a4)
    800042d8:	08f92e23          	sw	a5,156(s2)
    800042dc:	01013403          	ld	s0,16(sp)
    800042e0:	01813083          	ld	ra,24(sp)
    800042e4:	00813483          	ld	s1,8(sp)
    800042e8:	00013903          	ld	s2,0(sp)
    800042ec:	00004517          	auipc	a0,0x4
    800042f0:	2fc50513          	addi	a0,a0,764 # 800085e8 <cons>
    800042f4:	02010113          	addi	sp,sp,32
    800042f8:	00001317          	auipc	t1,0x1
    800042fc:	eb030067          	jr	-336(t1) # 800051a8 <release>
    80004300:	00a00493          	li	s1,10
    80004304:	fc1ff06f          	j	800042c4 <consoleintr+0x50>

0000000080004308 <consoleinit>:
    80004308:	fe010113          	addi	sp,sp,-32
    8000430c:	00113c23          	sd	ra,24(sp)
    80004310:	00813823          	sd	s0,16(sp)
    80004314:	00913423          	sd	s1,8(sp)
    80004318:	02010413          	addi	s0,sp,32
    8000431c:	00004497          	auipc	s1,0x4
    80004320:	2cc48493          	addi	s1,s1,716 # 800085e8 <cons>
    80004324:	00048513          	mv	a0,s1
    80004328:	00002597          	auipc	a1,0x2
    8000432c:	f8858593          	addi	a1,a1,-120 # 800062b0 <CONSOLE_STATUS+0x2a0>
    80004330:	00001097          	auipc	ra,0x1
    80004334:	d88080e7          	jalr	-632(ra) # 800050b8 <initlock>
    80004338:	00000097          	auipc	ra,0x0
    8000433c:	7ac080e7          	jalr	1964(ra) # 80004ae4 <uartinit>
    80004340:	01813083          	ld	ra,24(sp)
    80004344:	01013403          	ld	s0,16(sp)
    80004348:	00000797          	auipc	a5,0x0
    8000434c:	d9c78793          	addi	a5,a5,-612 # 800040e4 <consoleread>
    80004350:	0af4bc23          	sd	a5,184(s1)
    80004354:	00000797          	auipc	a5,0x0
    80004358:	cec78793          	addi	a5,a5,-788 # 80004040 <consolewrite>
    8000435c:	0cf4b023          	sd	a5,192(s1)
    80004360:	00813483          	ld	s1,8(sp)
    80004364:	02010113          	addi	sp,sp,32
    80004368:	00008067          	ret

000000008000436c <console_read>:
    8000436c:	ff010113          	addi	sp,sp,-16
    80004370:	00813423          	sd	s0,8(sp)
    80004374:	01010413          	addi	s0,sp,16
    80004378:	00813403          	ld	s0,8(sp)
    8000437c:	00004317          	auipc	t1,0x4
    80004380:	32433303          	ld	t1,804(t1) # 800086a0 <devsw+0x10>
    80004384:	01010113          	addi	sp,sp,16
    80004388:	00030067          	jr	t1

000000008000438c <console_write>:
    8000438c:	ff010113          	addi	sp,sp,-16
    80004390:	00813423          	sd	s0,8(sp)
    80004394:	01010413          	addi	s0,sp,16
    80004398:	00813403          	ld	s0,8(sp)
    8000439c:	00004317          	auipc	t1,0x4
    800043a0:	30c33303          	ld	t1,780(t1) # 800086a8 <devsw+0x18>
    800043a4:	01010113          	addi	sp,sp,16
    800043a8:	00030067          	jr	t1

00000000800043ac <panic>:
    800043ac:	fe010113          	addi	sp,sp,-32
    800043b0:	00113c23          	sd	ra,24(sp)
    800043b4:	00813823          	sd	s0,16(sp)
    800043b8:	00913423          	sd	s1,8(sp)
    800043bc:	02010413          	addi	s0,sp,32
    800043c0:	00050493          	mv	s1,a0
    800043c4:	00002517          	auipc	a0,0x2
    800043c8:	ef450513          	addi	a0,a0,-268 # 800062b8 <CONSOLE_STATUS+0x2a8>
    800043cc:	00004797          	auipc	a5,0x4
    800043d0:	3607ae23          	sw	zero,892(a5) # 80008748 <pr+0x18>
    800043d4:	00000097          	auipc	ra,0x0
    800043d8:	034080e7          	jalr	52(ra) # 80004408 <__printf>
    800043dc:	00048513          	mv	a0,s1
    800043e0:	00000097          	auipc	ra,0x0
    800043e4:	028080e7          	jalr	40(ra) # 80004408 <__printf>
    800043e8:	00002517          	auipc	a0,0x2
    800043ec:	c8850513          	addi	a0,a0,-888 # 80006070 <CONSOLE_STATUS+0x60>
    800043f0:	00000097          	auipc	ra,0x0
    800043f4:	018080e7          	jalr	24(ra) # 80004408 <__printf>
    800043f8:	00100793          	li	a5,1
    800043fc:	00003717          	auipc	a4,0x3
    80004400:	08f72e23          	sw	a5,156(a4) # 80007498 <panicked>
    80004404:	0000006f          	j	80004404 <panic+0x58>

0000000080004408 <__printf>:
    80004408:	f3010113          	addi	sp,sp,-208
    8000440c:	08813023          	sd	s0,128(sp)
    80004410:	07313423          	sd	s3,104(sp)
    80004414:	09010413          	addi	s0,sp,144
    80004418:	05813023          	sd	s8,64(sp)
    8000441c:	08113423          	sd	ra,136(sp)
    80004420:	06913c23          	sd	s1,120(sp)
    80004424:	07213823          	sd	s2,112(sp)
    80004428:	07413023          	sd	s4,96(sp)
    8000442c:	05513c23          	sd	s5,88(sp)
    80004430:	05613823          	sd	s6,80(sp)
    80004434:	05713423          	sd	s7,72(sp)
    80004438:	03913c23          	sd	s9,56(sp)
    8000443c:	03a13823          	sd	s10,48(sp)
    80004440:	03b13423          	sd	s11,40(sp)
    80004444:	00004317          	auipc	t1,0x4
    80004448:	2ec30313          	addi	t1,t1,748 # 80008730 <pr>
    8000444c:	01832c03          	lw	s8,24(t1)
    80004450:	00b43423          	sd	a1,8(s0)
    80004454:	00c43823          	sd	a2,16(s0)
    80004458:	00d43c23          	sd	a3,24(s0)
    8000445c:	02e43023          	sd	a4,32(s0)
    80004460:	02f43423          	sd	a5,40(s0)
    80004464:	03043823          	sd	a6,48(s0)
    80004468:	03143c23          	sd	a7,56(s0)
    8000446c:	00050993          	mv	s3,a0
    80004470:	4a0c1663          	bnez	s8,8000491c <__printf+0x514>
    80004474:	60098c63          	beqz	s3,80004a8c <__printf+0x684>
    80004478:	0009c503          	lbu	a0,0(s3)
    8000447c:	00840793          	addi	a5,s0,8
    80004480:	f6f43c23          	sd	a5,-136(s0)
    80004484:	00000493          	li	s1,0
    80004488:	22050063          	beqz	a0,800046a8 <__printf+0x2a0>
    8000448c:	00002a37          	lui	s4,0x2
    80004490:	00018ab7          	lui	s5,0x18
    80004494:	000f4b37          	lui	s6,0xf4
    80004498:	00989bb7          	lui	s7,0x989
    8000449c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800044a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800044a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800044a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800044ac:	00148c9b          	addiw	s9,s1,1
    800044b0:	02500793          	li	a5,37
    800044b4:	01998933          	add	s2,s3,s9
    800044b8:	38f51263          	bne	a0,a5,8000483c <__printf+0x434>
    800044bc:	00094783          	lbu	a5,0(s2)
    800044c0:	00078c9b          	sext.w	s9,a5
    800044c4:	1e078263          	beqz	a5,800046a8 <__printf+0x2a0>
    800044c8:	0024849b          	addiw	s1,s1,2
    800044cc:	07000713          	li	a4,112
    800044d0:	00998933          	add	s2,s3,s1
    800044d4:	38e78a63          	beq	a5,a4,80004868 <__printf+0x460>
    800044d8:	20f76863          	bltu	a4,a5,800046e8 <__printf+0x2e0>
    800044dc:	42a78863          	beq	a5,a0,8000490c <__printf+0x504>
    800044e0:	06400713          	li	a4,100
    800044e4:	40e79663          	bne	a5,a4,800048f0 <__printf+0x4e8>
    800044e8:	f7843783          	ld	a5,-136(s0)
    800044ec:	0007a603          	lw	a2,0(a5)
    800044f0:	00878793          	addi	a5,a5,8
    800044f4:	f6f43c23          	sd	a5,-136(s0)
    800044f8:	42064a63          	bltz	a2,8000492c <__printf+0x524>
    800044fc:	00a00713          	li	a4,10
    80004500:	02e677bb          	remuw	a5,a2,a4
    80004504:	00002d97          	auipc	s11,0x2
    80004508:	ddcd8d93          	addi	s11,s11,-548 # 800062e0 <digits>
    8000450c:	00900593          	li	a1,9
    80004510:	0006051b          	sext.w	a0,a2
    80004514:	00000c93          	li	s9,0
    80004518:	02079793          	slli	a5,a5,0x20
    8000451c:	0207d793          	srli	a5,a5,0x20
    80004520:	00fd87b3          	add	a5,s11,a5
    80004524:	0007c783          	lbu	a5,0(a5)
    80004528:	02e656bb          	divuw	a3,a2,a4
    8000452c:	f8f40023          	sb	a5,-128(s0)
    80004530:	14c5d863          	bge	a1,a2,80004680 <__printf+0x278>
    80004534:	06300593          	li	a1,99
    80004538:	00100c93          	li	s9,1
    8000453c:	02e6f7bb          	remuw	a5,a3,a4
    80004540:	02079793          	slli	a5,a5,0x20
    80004544:	0207d793          	srli	a5,a5,0x20
    80004548:	00fd87b3          	add	a5,s11,a5
    8000454c:	0007c783          	lbu	a5,0(a5)
    80004550:	02e6d73b          	divuw	a4,a3,a4
    80004554:	f8f400a3          	sb	a5,-127(s0)
    80004558:	12a5f463          	bgeu	a1,a0,80004680 <__printf+0x278>
    8000455c:	00a00693          	li	a3,10
    80004560:	00900593          	li	a1,9
    80004564:	02d777bb          	remuw	a5,a4,a3
    80004568:	02079793          	slli	a5,a5,0x20
    8000456c:	0207d793          	srli	a5,a5,0x20
    80004570:	00fd87b3          	add	a5,s11,a5
    80004574:	0007c503          	lbu	a0,0(a5)
    80004578:	02d757bb          	divuw	a5,a4,a3
    8000457c:	f8a40123          	sb	a0,-126(s0)
    80004580:	48e5f263          	bgeu	a1,a4,80004a04 <__printf+0x5fc>
    80004584:	06300513          	li	a0,99
    80004588:	02d7f5bb          	remuw	a1,a5,a3
    8000458c:	02059593          	slli	a1,a1,0x20
    80004590:	0205d593          	srli	a1,a1,0x20
    80004594:	00bd85b3          	add	a1,s11,a1
    80004598:	0005c583          	lbu	a1,0(a1)
    8000459c:	02d7d7bb          	divuw	a5,a5,a3
    800045a0:	f8b401a3          	sb	a1,-125(s0)
    800045a4:	48e57263          	bgeu	a0,a4,80004a28 <__printf+0x620>
    800045a8:	3e700513          	li	a0,999
    800045ac:	02d7f5bb          	remuw	a1,a5,a3
    800045b0:	02059593          	slli	a1,a1,0x20
    800045b4:	0205d593          	srli	a1,a1,0x20
    800045b8:	00bd85b3          	add	a1,s11,a1
    800045bc:	0005c583          	lbu	a1,0(a1)
    800045c0:	02d7d7bb          	divuw	a5,a5,a3
    800045c4:	f8b40223          	sb	a1,-124(s0)
    800045c8:	46e57663          	bgeu	a0,a4,80004a34 <__printf+0x62c>
    800045cc:	02d7f5bb          	remuw	a1,a5,a3
    800045d0:	02059593          	slli	a1,a1,0x20
    800045d4:	0205d593          	srli	a1,a1,0x20
    800045d8:	00bd85b3          	add	a1,s11,a1
    800045dc:	0005c583          	lbu	a1,0(a1)
    800045e0:	02d7d7bb          	divuw	a5,a5,a3
    800045e4:	f8b402a3          	sb	a1,-123(s0)
    800045e8:	46ea7863          	bgeu	s4,a4,80004a58 <__printf+0x650>
    800045ec:	02d7f5bb          	remuw	a1,a5,a3
    800045f0:	02059593          	slli	a1,a1,0x20
    800045f4:	0205d593          	srli	a1,a1,0x20
    800045f8:	00bd85b3          	add	a1,s11,a1
    800045fc:	0005c583          	lbu	a1,0(a1)
    80004600:	02d7d7bb          	divuw	a5,a5,a3
    80004604:	f8b40323          	sb	a1,-122(s0)
    80004608:	3eeaf863          	bgeu	s5,a4,800049f8 <__printf+0x5f0>
    8000460c:	02d7f5bb          	remuw	a1,a5,a3
    80004610:	02059593          	slli	a1,a1,0x20
    80004614:	0205d593          	srli	a1,a1,0x20
    80004618:	00bd85b3          	add	a1,s11,a1
    8000461c:	0005c583          	lbu	a1,0(a1)
    80004620:	02d7d7bb          	divuw	a5,a5,a3
    80004624:	f8b403a3          	sb	a1,-121(s0)
    80004628:	42eb7e63          	bgeu	s6,a4,80004a64 <__printf+0x65c>
    8000462c:	02d7f5bb          	remuw	a1,a5,a3
    80004630:	02059593          	slli	a1,a1,0x20
    80004634:	0205d593          	srli	a1,a1,0x20
    80004638:	00bd85b3          	add	a1,s11,a1
    8000463c:	0005c583          	lbu	a1,0(a1)
    80004640:	02d7d7bb          	divuw	a5,a5,a3
    80004644:	f8b40423          	sb	a1,-120(s0)
    80004648:	42ebfc63          	bgeu	s7,a4,80004a80 <__printf+0x678>
    8000464c:	02079793          	slli	a5,a5,0x20
    80004650:	0207d793          	srli	a5,a5,0x20
    80004654:	00fd8db3          	add	s11,s11,a5
    80004658:	000dc703          	lbu	a4,0(s11)
    8000465c:	00a00793          	li	a5,10
    80004660:	00900c93          	li	s9,9
    80004664:	f8e404a3          	sb	a4,-119(s0)
    80004668:	00065c63          	bgez	a2,80004680 <__printf+0x278>
    8000466c:	f9040713          	addi	a4,s0,-112
    80004670:	00f70733          	add	a4,a4,a5
    80004674:	02d00693          	li	a3,45
    80004678:	fed70823          	sb	a3,-16(a4)
    8000467c:	00078c93          	mv	s9,a5
    80004680:	f8040793          	addi	a5,s0,-128
    80004684:	01978cb3          	add	s9,a5,s9
    80004688:	f7f40d13          	addi	s10,s0,-129
    8000468c:	000cc503          	lbu	a0,0(s9)
    80004690:	fffc8c93          	addi	s9,s9,-1
    80004694:	00000097          	auipc	ra,0x0
    80004698:	b90080e7          	jalr	-1136(ra) # 80004224 <consputc>
    8000469c:	ffac98e3          	bne	s9,s10,8000468c <__printf+0x284>
    800046a0:	00094503          	lbu	a0,0(s2)
    800046a4:	e00514e3          	bnez	a0,800044ac <__printf+0xa4>
    800046a8:	1a0c1663          	bnez	s8,80004854 <__printf+0x44c>
    800046ac:	08813083          	ld	ra,136(sp)
    800046b0:	08013403          	ld	s0,128(sp)
    800046b4:	07813483          	ld	s1,120(sp)
    800046b8:	07013903          	ld	s2,112(sp)
    800046bc:	06813983          	ld	s3,104(sp)
    800046c0:	06013a03          	ld	s4,96(sp)
    800046c4:	05813a83          	ld	s5,88(sp)
    800046c8:	05013b03          	ld	s6,80(sp)
    800046cc:	04813b83          	ld	s7,72(sp)
    800046d0:	04013c03          	ld	s8,64(sp)
    800046d4:	03813c83          	ld	s9,56(sp)
    800046d8:	03013d03          	ld	s10,48(sp)
    800046dc:	02813d83          	ld	s11,40(sp)
    800046e0:	0d010113          	addi	sp,sp,208
    800046e4:	00008067          	ret
    800046e8:	07300713          	li	a4,115
    800046ec:	1ce78a63          	beq	a5,a4,800048c0 <__printf+0x4b8>
    800046f0:	07800713          	li	a4,120
    800046f4:	1ee79e63          	bne	a5,a4,800048f0 <__printf+0x4e8>
    800046f8:	f7843783          	ld	a5,-136(s0)
    800046fc:	0007a703          	lw	a4,0(a5)
    80004700:	00878793          	addi	a5,a5,8
    80004704:	f6f43c23          	sd	a5,-136(s0)
    80004708:	28074263          	bltz	a4,8000498c <__printf+0x584>
    8000470c:	00002d97          	auipc	s11,0x2
    80004710:	bd4d8d93          	addi	s11,s11,-1068 # 800062e0 <digits>
    80004714:	00f77793          	andi	a5,a4,15
    80004718:	00fd87b3          	add	a5,s11,a5
    8000471c:	0007c683          	lbu	a3,0(a5)
    80004720:	00f00613          	li	a2,15
    80004724:	0007079b          	sext.w	a5,a4
    80004728:	f8d40023          	sb	a3,-128(s0)
    8000472c:	0047559b          	srliw	a1,a4,0x4
    80004730:	0047569b          	srliw	a3,a4,0x4
    80004734:	00000c93          	li	s9,0
    80004738:	0ee65063          	bge	a2,a4,80004818 <__printf+0x410>
    8000473c:	00f6f693          	andi	a3,a3,15
    80004740:	00dd86b3          	add	a3,s11,a3
    80004744:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004748:	0087d79b          	srliw	a5,a5,0x8
    8000474c:	00100c93          	li	s9,1
    80004750:	f8d400a3          	sb	a3,-127(s0)
    80004754:	0cb67263          	bgeu	a2,a1,80004818 <__printf+0x410>
    80004758:	00f7f693          	andi	a3,a5,15
    8000475c:	00dd86b3          	add	a3,s11,a3
    80004760:	0006c583          	lbu	a1,0(a3)
    80004764:	00f00613          	li	a2,15
    80004768:	0047d69b          	srliw	a3,a5,0x4
    8000476c:	f8b40123          	sb	a1,-126(s0)
    80004770:	0047d593          	srli	a1,a5,0x4
    80004774:	28f67e63          	bgeu	a2,a5,80004a10 <__printf+0x608>
    80004778:	00f6f693          	andi	a3,a3,15
    8000477c:	00dd86b3          	add	a3,s11,a3
    80004780:	0006c503          	lbu	a0,0(a3)
    80004784:	0087d813          	srli	a6,a5,0x8
    80004788:	0087d69b          	srliw	a3,a5,0x8
    8000478c:	f8a401a3          	sb	a0,-125(s0)
    80004790:	28b67663          	bgeu	a2,a1,80004a1c <__printf+0x614>
    80004794:	00f6f693          	andi	a3,a3,15
    80004798:	00dd86b3          	add	a3,s11,a3
    8000479c:	0006c583          	lbu	a1,0(a3)
    800047a0:	00c7d513          	srli	a0,a5,0xc
    800047a4:	00c7d69b          	srliw	a3,a5,0xc
    800047a8:	f8b40223          	sb	a1,-124(s0)
    800047ac:	29067a63          	bgeu	a2,a6,80004a40 <__printf+0x638>
    800047b0:	00f6f693          	andi	a3,a3,15
    800047b4:	00dd86b3          	add	a3,s11,a3
    800047b8:	0006c583          	lbu	a1,0(a3)
    800047bc:	0107d813          	srli	a6,a5,0x10
    800047c0:	0107d69b          	srliw	a3,a5,0x10
    800047c4:	f8b402a3          	sb	a1,-123(s0)
    800047c8:	28a67263          	bgeu	a2,a0,80004a4c <__printf+0x644>
    800047cc:	00f6f693          	andi	a3,a3,15
    800047d0:	00dd86b3          	add	a3,s11,a3
    800047d4:	0006c683          	lbu	a3,0(a3)
    800047d8:	0147d79b          	srliw	a5,a5,0x14
    800047dc:	f8d40323          	sb	a3,-122(s0)
    800047e0:	21067663          	bgeu	a2,a6,800049ec <__printf+0x5e4>
    800047e4:	02079793          	slli	a5,a5,0x20
    800047e8:	0207d793          	srli	a5,a5,0x20
    800047ec:	00fd8db3          	add	s11,s11,a5
    800047f0:	000dc683          	lbu	a3,0(s11)
    800047f4:	00800793          	li	a5,8
    800047f8:	00700c93          	li	s9,7
    800047fc:	f8d403a3          	sb	a3,-121(s0)
    80004800:	00075c63          	bgez	a4,80004818 <__printf+0x410>
    80004804:	f9040713          	addi	a4,s0,-112
    80004808:	00f70733          	add	a4,a4,a5
    8000480c:	02d00693          	li	a3,45
    80004810:	fed70823          	sb	a3,-16(a4)
    80004814:	00078c93          	mv	s9,a5
    80004818:	f8040793          	addi	a5,s0,-128
    8000481c:	01978cb3          	add	s9,a5,s9
    80004820:	f7f40d13          	addi	s10,s0,-129
    80004824:	000cc503          	lbu	a0,0(s9)
    80004828:	fffc8c93          	addi	s9,s9,-1
    8000482c:	00000097          	auipc	ra,0x0
    80004830:	9f8080e7          	jalr	-1544(ra) # 80004224 <consputc>
    80004834:	ff9d18e3          	bne	s10,s9,80004824 <__printf+0x41c>
    80004838:	0100006f          	j	80004848 <__printf+0x440>
    8000483c:	00000097          	auipc	ra,0x0
    80004840:	9e8080e7          	jalr	-1560(ra) # 80004224 <consputc>
    80004844:	000c8493          	mv	s1,s9
    80004848:	00094503          	lbu	a0,0(s2)
    8000484c:	c60510e3          	bnez	a0,800044ac <__printf+0xa4>
    80004850:	e40c0ee3          	beqz	s8,800046ac <__printf+0x2a4>
    80004854:	00004517          	auipc	a0,0x4
    80004858:	edc50513          	addi	a0,a0,-292 # 80008730 <pr>
    8000485c:	00001097          	auipc	ra,0x1
    80004860:	94c080e7          	jalr	-1716(ra) # 800051a8 <release>
    80004864:	e49ff06f          	j	800046ac <__printf+0x2a4>
    80004868:	f7843783          	ld	a5,-136(s0)
    8000486c:	03000513          	li	a0,48
    80004870:	01000d13          	li	s10,16
    80004874:	00878713          	addi	a4,a5,8
    80004878:	0007bc83          	ld	s9,0(a5)
    8000487c:	f6e43c23          	sd	a4,-136(s0)
    80004880:	00000097          	auipc	ra,0x0
    80004884:	9a4080e7          	jalr	-1628(ra) # 80004224 <consputc>
    80004888:	07800513          	li	a0,120
    8000488c:	00000097          	auipc	ra,0x0
    80004890:	998080e7          	jalr	-1640(ra) # 80004224 <consputc>
    80004894:	00002d97          	auipc	s11,0x2
    80004898:	a4cd8d93          	addi	s11,s11,-1460 # 800062e0 <digits>
    8000489c:	03ccd793          	srli	a5,s9,0x3c
    800048a0:	00fd87b3          	add	a5,s11,a5
    800048a4:	0007c503          	lbu	a0,0(a5)
    800048a8:	fffd0d1b          	addiw	s10,s10,-1
    800048ac:	004c9c93          	slli	s9,s9,0x4
    800048b0:	00000097          	auipc	ra,0x0
    800048b4:	974080e7          	jalr	-1676(ra) # 80004224 <consputc>
    800048b8:	fe0d12e3          	bnez	s10,8000489c <__printf+0x494>
    800048bc:	f8dff06f          	j	80004848 <__printf+0x440>
    800048c0:	f7843783          	ld	a5,-136(s0)
    800048c4:	0007bc83          	ld	s9,0(a5)
    800048c8:	00878793          	addi	a5,a5,8
    800048cc:	f6f43c23          	sd	a5,-136(s0)
    800048d0:	000c9a63          	bnez	s9,800048e4 <__printf+0x4dc>
    800048d4:	1080006f          	j	800049dc <__printf+0x5d4>
    800048d8:	001c8c93          	addi	s9,s9,1
    800048dc:	00000097          	auipc	ra,0x0
    800048e0:	948080e7          	jalr	-1720(ra) # 80004224 <consputc>
    800048e4:	000cc503          	lbu	a0,0(s9)
    800048e8:	fe0518e3          	bnez	a0,800048d8 <__printf+0x4d0>
    800048ec:	f5dff06f          	j	80004848 <__printf+0x440>
    800048f0:	02500513          	li	a0,37
    800048f4:	00000097          	auipc	ra,0x0
    800048f8:	930080e7          	jalr	-1744(ra) # 80004224 <consputc>
    800048fc:	000c8513          	mv	a0,s9
    80004900:	00000097          	auipc	ra,0x0
    80004904:	924080e7          	jalr	-1756(ra) # 80004224 <consputc>
    80004908:	f41ff06f          	j	80004848 <__printf+0x440>
    8000490c:	02500513          	li	a0,37
    80004910:	00000097          	auipc	ra,0x0
    80004914:	914080e7          	jalr	-1772(ra) # 80004224 <consputc>
    80004918:	f31ff06f          	j	80004848 <__printf+0x440>
    8000491c:	00030513          	mv	a0,t1
    80004920:	00000097          	auipc	ra,0x0
    80004924:	7bc080e7          	jalr	1980(ra) # 800050dc <acquire>
    80004928:	b4dff06f          	j	80004474 <__printf+0x6c>
    8000492c:	40c0053b          	negw	a0,a2
    80004930:	00a00713          	li	a4,10
    80004934:	02e576bb          	remuw	a3,a0,a4
    80004938:	00002d97          	auipc	s11,0x2
    8000493c:	9a8d8d93          	addi	s11,s11,-1624 # 800062e0 <digits>
    80004940:	ff700593          	li	a1,-9
    80004944:	02069693          	slli	a3,a3,0x20
    80004948:	0206d693          	srli	a3,a3,0x20
    8000494c:	00dd86b3          	add	a3,s11,a3
    80004950:	0006c683          	lbu	a3,0(a3)
    80004954:	02e557bb          	divuw	a5,a0,a4
    80004958:	f8d40023          	sb	a3,-128(s0)
    8000495c:	10b65e63          	bge	a2,a1,80004a78 <__printf+0x670>
    80004960:	06300593          	li	a1,99
    80004964:	02e7f6bb          	remuw	a3,a5,a4
    80004968:	02069693          	slli	a3,a3,0x20
    8000496c:	0206d693          	srli	a3,a3,0x20
    80004970:	00dd86b3          	add	a3,s11,a3
    80004974:	0006c683          	lbu	a3,0(a3)
    80004978:	02e7d73b          	divuw	a4,a5,a4
    8000497c:	00200793          	li	a5,2
    80004980:	f8d400a3          	sb	a3,-127(s0)
    80004984:	bca5ece3          	bltu	a1,a0,8000455c <__printf+0x154>
    80004988:	ce5ff06f          	j	8000466c <__printf+0x264>
    8000498c:	40e007bb          	negw	a5,a4
    80004990:	00002d97          	auipc	s11,0x2
    80004994:	950d8d93          	addi	s11,s11,-1712 # 800062e0 <digits>
    80004998:	00f7f693          	andi	a3,a5,15
    8000499c:	00dd86b3          	add	a3,s11,a3
    800049a0:	0006c583          	lbu	a1,0(a3)
    800049a4:	ff100613          	li	a2,-15
    800049a8:	0047d69b          	srliw	a3,a5,0x4
    800049ac:	f8b40023          	sb	a1,-128(s0)
    800049b0:	0047d59b          	srliw	a1,a5,0x4
    800049b4:	0ac75e63          	bge	a4,a2,80004a70 <__printf+0x668>
    800049b8:	00f6f693          	andi	a3,a3,15
    800049bc:	00dd86b3          	add	a3,s11,a3
    800049c0:	0006c603          	lbu	a2,0(a3)
    800049c4:	00f00693          	li	a3,15
    800049c8:	0087d79b          	srliw	a5,a5,0x8
    800049cc:	f8c400a3          	sb	a2,-127(s0)
    800049d0:	d8b6e4e3          	bltu	a3,a1,80004758 <__printf+0x350>
    800049d4:	00200793          	li	a5,2
    800049d8:	e2dff06f          	j	80004804 <__printf+0x3fc>
    800049dc:	00002c97          	auipc	s9,0x2
    800049e0:	8e4c8c93          	addi	s9,s9,-1820 # 800062c0 <CONSOLE_STATUS+0x2b0>
    800049e4:	02800513          	li	a0,40
    800049e8:	ef1ff06f          	j	800048d8 <__printf+0x4d0>
    800049ec:	00700793          	li	a5,7
    800049f0:	00600c93          	li	s9,6
    800049f4:	e0dff06f          	j	80004800 <__printf+0x3f8>
    800049f8:	00700793          	li	a5,7
    800049fc:	00600c93          	li	s9,6
    80004a00:	c69ff06f          	j	80004668 <__printf+0x260>
    80004a04:	00300793          	li	a5,3
    80004a08:	00200c93          	li	s9,2
    80004a0c:	c5dff06f          	j	80004668 <__printf+0x260>
    80004a10:	00300793          	li	a5,3
    80004a14:	00200c93          	li	s9,2
    80004a18:	de9ff06f          	j	80004800 <__printf+0x3f8>
    80004a1c:	00400793          	li	a5,4
    80004a20:	00300c93          	li	s9,3
    80004a24:	dddff06f          	j	80004800 <__printf+0x3f8>
    80004a28:	00400793          	li	a5,4
    80004a2c:	00300c93          	li	s9,3
    80004a30:	c39ff06f          	j	80004668 <__printf+0x260>
    80004a34:	00500793          	li	a5,5
    80004a38:	00400c93          	li	s9,4
    80004a3c:	c2dff06f          	j	80004668 <__printf+0x260>
    80004a40:	00500793          	li	a5,5
    80004a44:	00400c93          	li	s9,4
    80004a48:	db9ff06f          	j	80004800 <__printf+0x3f8>
    80004a4c:	00600793          	li	a5,6
    80004a50:	00500c93          	li	s9,5
    80004a54:	dadff06f          	j	80004800 <__printf+0x3f8>
    80004a58:	00600793          	li	a5,6
    80004a5c:	00500c93          	li	s9,5
    80004a60:	c09ff06f          	j	80004668 <__printf+0x260>
    80004a64:	00800793          	li	a5,8
    80004a68:	00700c93          	li	s9,7
    80004a6c:	bfdff06f          	j	80004668 <__printf+0x260>
    80004a70:	00100793          	li	a5,1
    80004a74:	d91ff06f          	j	80004804 <__printf+0x3fc>
    80004a78:	00100793          	li	a5,1
    80004a7c:	bf1ff06f          	j	8000466c <__printf+0x264>
    80004a80:	00900793          	li	a5,9
    80004a84:	00800c93          	li	s9,8
    80004a88:	be1ff06f          	j	80004668 <__printf+0x260>
    80004a8c:	00002517          	auipc	a0,0x2
    80004a90:	83c50513          	addi	a0,a0,-1988 # 800062c8 <CONSOLE_STATUS+0x2b8>
    80004a94:	00000097          	auipc	ra,0x0
    80004a98:	918080e7          	jalr	-1768(ra) # 800043ac <panic>

0000000080004a9c <printfinit>:
    80004a9c:	fe010113          	addi	sp,sp,-32
    80004aa0:	00813823          	sd	s0,16(sp)
    80004aa4:	00913423          	sd	s1,8(sp)
    80004aa8:	00113c23          	sd	ra,24(sp)
    80004aac:	02010413          	addi	s0,sp,32
    80004ab0:	00004497          	auipc	s1,0x4
    80004ab4:	c8048493          	addi	s1,s1,-896 # 80008730 <pr>
    80004ab8:	00048513          	mv	a0,s1
    80004abc:	00002597          	auipc	a1,0x2
    80004ac0:	81c58593          	addi	a1,a1,-2020 # 800062d8 <CONSOLE_STATUS+0x2c8>
    80004ac4:	00000097          	auipc	ra,0x0
    80004ac8:	5f4080e7          	jalr	1524(ra) # 800050b8 <initlock>
    80004acc:	01813083          	ld	ra,24(sp)
    80004ad0:	01013403          	ld	s0,16(sp)
    80004ad4:	0004ac23          	sw	zero,24(s1)
    80004ad8:	00813483          	ld	s1,8(sp)
    80004adc:	02010113          	addi	sp,sp,32
    80004ae0:	00008067          	ret

0000000080004ae4 <uartinit>:
    80004ae4:	ff010113          	addi	sp,sp,-16
    80004ae8:	00813423          	sd	s0,8(sp)
    80004aec:	01010413          	addi	s0,sp,16
    80004af0:	100007b7          	lui	a5,0x10000
    80004af4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004af8:	f8000713          	li	a4,-128
    80004afc:	00e781a3          	sb	a4,3(a5)
    80004b00:	00300713          	li	a4,3
    80004b04:	00e78023          	sb	a4,0(a5)
    80004b08:	000780a3          	sb	zero,1(a5)
    80004b0c:	00e781a3          	sb	a4,3(a5)
    80004b10:	00700693          	li	a3,7
    80004b14:	00d78123          	sb	a3,2(a5)
    80004b18:	00e780a3          	sb	a4,1(a5)
    80004b1c:	00813403          	ld	s0,8(sp)
    80004b20:	01010113          	addi	sp,sp,16
    80004b24:	00008067          	ret

0000000080004b28 <uartputc>:
    80004b28:	00003797          	auipc	a5,0x3
    80004b2c:	9707a783          	lw	a5,-1680(a5) # 80007498 <panicked>
    80004b30:	00078463          	beqz	a5,80004b38 <uartputc+0x10>
    80004b34:	0000006f          	j	80004b34 <uartputc+0xc>
    80004b38:	fd010113          	addi	sp,sp,-48
    80004b3c:	02813023          	sd	s0,32(sp)
    80004b40:	00913c23          	sd	s1,24(sp)
    80004b44:	01213823          	sd	s2,16(sp)
    80004b48:	01313423          	sd	s3,8(sp)
    80004b4c:	02113423          	sd	ra,40(sp)
    80004b50:	03010413          	addi	s0,sp,48
    80004b54:	00003917          	auipc	s2,0x3
    80004b58:	94c90913          	addi	s2,s2,-1716 # 800074a0 <uart_tx_r>
    80004b5c:	00093783          	ld	a5,0(s2)
    80004b60:	00003497          	auipc	s1,0x3
    80004b64:	94848493          	addi	s1,s1,-1720 # 800074a8 <uart_tx_w>
    80004b68:	0004b703          	ld	a4,0(s1)
    80004b6c:	02078693          	addi	a3,a5,32
    80004b70:	00050993          	mv	s3,a0
    80004b74:	02e69c63          	bne	a3,a4,80004bac <uartputc+0x84>
    80004b78:	00001097          	auipc	ra,0x1
    80004b7c:	834080e7          	jalr	-1996(ra) # 800053ac <push_on>
    80004b80:	00093783          	ld	a5,0(s2)
    80004b84:	0004b703          	ld	a4,0(s1)
    80004b88:	02078793          	addi	a5,a5,32
    80004b8c:	00e79463          	bne	a5,a4,80004b94 <uartputc+0x6c>
    80004b90:	0000006f          	j	80004b90 <uartputc+0x68>
    80004b94:	00001097          	auipc	ra,0x1
    80004b98:	88c080e7          	jalr	-1908(ra) # 80005420 <pop_on>
    80004b9c:	00093783          	ld	a5,0(s2)
    80004ba0:	0004b703          	ld	a4,0(s1)
    80004ba4:	02078693          	addi	a3,a5,32
    80004ba8:	fce688e3          	beq	a3,a4,80004b78 <uartputc+0x50>
    80004bac:	01f77693          	andi	a3,a4,31
    80004bb0:	00004597          	auipc	a1,0x4
    80004bb4:	ba058593          	addi	a1,a1,-1120 # 80008750 <uart_tx_buf>
    80004bb8:	00d586b3          	add	a3,a1,a3
    80004bbc:	00170713          	addi	a4,a4,1
    80004bc0:	01368023          	sb	s3,0(a3)
    80004bc4:	00e4b023          	sd	a4,0(s1)
    80004bc8:	10000637          	lui	a2,0x10000
    80004bcc:	02f71063          	bne	a4,a5,80004bec <uartputc+0xc4>
    80004bd0:	0340006f          	j	80004c04 <uartputc+0xdc>
    80004bd4:	00074703          	lbu	a4,0(a4)
    80004bd8:	00f93023          	sd	a5,0(s2)
    80004bdc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004be0:	00093783          	ld	a5,0(s2)
    80004be4:	0004b703          	ld	a4,0(s1)
    80004be8:	00f70e63          	beq	a4,a5,80004c04 <uartputc+0xdc>
    80004bec:	00564683          	lbu	a3,5(a2)
    80004bf0:	01f7f713          	andi	a4,a5,31
    80004bf4:	00e58733          	add	a4,a1,a4
    80004bf8:	0206f693          	andi	a3,a3,32
    80004bfc:	00178793          	addi	a5,a5,1
    80004c00:	fc069ae3          	bnez	a3,80004bd4 <uartputc+0xac>
    80004c04:	02813083          	ld	ra,40(sp)
    80004c08:	02013403          	ld	s0,32(sp)
    80004c0c:	01813483          	ld	s1,24(sp)
    80004c10:	01013903          	ld	s2,16(sp)
    80004c14:	00813983          	ld	s3,8(sp)
    80004c18:	03010113          	addi	sp,sp,48
    80004c1c:	00008067          	ret

0000000080004c20 <uartputc_sync>:
    80004c20:	ff010113          	addi	sp,sp,-16
    80004c24:	00813423          	sd	s0,8(sp)
    80004c28:	01010413          	addi	s0,sp,16
    80004c2c:	00003717          	auipc	a4,0x3
    80004c30:	86c72703          	lw	a4,-1940(a4) # 80007498 <panicked>
    80004c34:	02071663          	bnez	a4,80004c60 <uartputc_sync+0x40>
    80004c38:	00050793          	mv	a5,a0
    80004c3c:	100006b7          	lui	a3,0x10000
    80004c40:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004c44:	02077713          	andi	a4,a4,32
    80004c48:	fe070ce3          	beqz	a4,80004c40 <uartputc_sync+0x20>
    80004c4c:	0ff7f793          	andi	a5,a5,255
    80004c50:	00f68023          	sb	a5,0(a3)
    80004c54:	00813403          	ld	s0,8(sp)
    80004c58:	01010113          	addi	sp,sp,16
    80004c5c:	00008067          	ret
    80004c60:	0000006f          	j	80004c60 <uartputc_sync+0x40>

0000000080004c64 <uartstart>:
    80004c64:	ff010113          	addi	sp,sp,-16
    80004c68:	00813423          	sd	s0,8(sp)
    80004c6c:	01010413          	addi	s0,sp,16
    80004c70:	00003617          	auipc	a2,0x3
    80004c74:	83060613          	addi	a2,a2,-2000 # 800074a0 <uart_tx_r>
    80004c78:	00003517          	auipc	a0,0x3
    80004c7c:	83050513          	addi	a0,a0,-2000 # 800074a8 <uart_tx_w>
    80004c80:	00063783          	ld	a5,0(a2)
    80004c84:	00053703          	ld	a4,0(a0)
    80004c88:	04f70263          	beq	a4,a5,80004ccc <uartstart+0x68>
    80004c8c:	100005b7          	lui	a1,0x10000
    80004c90:	00004817          	auipc	a6,0x4
    80004c94:	ac080813          	addi	a6,a6,-1344 # 80008750 <uart_tx_buf>
    80004c98:	01c0006f          	j	80004cb4 <uartstart+0x50>
    80004c9c:	0006c703          	lbu	a4,0(a3)
    80004ca0:	00f63023          	sd	a5,0(a2)
    80004ca4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004ca8:	00063783          	ld	a5,0(a2)
    80004cac:	00053703          	ld	a4,0(a0)
    80004cb0:	00f70e63          	beq	a4,a5,80004ccc <uartstart+0x68>
    80004cb4:	01f7f713          	andi	a4,a5,31
    80004cb8:	00e806b3          	add	a3,a6,a4
    80004cbc:	0055c703          	lbu	a4,5(a1)
    80004cc0:	00178793          	addi	a5,a5,1
    80004cc4:	02077713          	andi	a4,a4,32
    80004cc8:	fc071ae3          	bnez	a4,80004c9c <uartstart+0x38>
    80004ccc:	00813403          	ld	s0,8(sp)
    80004cd0:	01010113          	addi	sp,sp,16
    80004cd4:	00008067          	ret

0000000080004cd8 <uartgetc>:
    80004cd8:	ff010113          	addi	sp,sp,-16
    80004cdc:	00813423          	sd	s0,8(sp)
    80004ce0:	01010413          	addi	s0,sp,16
    80004ce4:	10000737          	lui	a4,0x10000
    80004ce8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80004cec:	0017f793          	andi	a5,a5,1
    80004cf0:	00078c63          	beqz	a5,80004d08 <uartgetc+0x30>
    80004cf4:	00074503          	lbu	a0,0(a4)
    80004cf8:	0ff57513          	andi	a0,a0,255
    80004cfc:	00813403          	ld	s0,8(sp)
    80004d00:	01010113          	addi	sp,sp,16
    80004d04:	00008067          	ret
    80004d08:	fff00513          	li	a0,-1
    80004d0c:	ff1ff06f          	j	80004cfc <uartgetc+0x24>

0000000080004d10 <uartintr>:
    80004d10:	100007b7          	lui	a5,0x10000
    80004d14:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004d18:	0017f793          	andi	a5,a5,1
    80004d1c:	0a078463          	beqz	a5,80004dc4 <uartintr+0xb4>
    80004d20:	fe010113          	addi	sp,sp,-32
    80004d24:	00813823          	sd	s0,16(sp)
    80004d28:	00913423          	sd	s1,8(sp)
    80004d2c:	00113c23          	sd	ra,24(sp)
    80004d30:	02010413          	addi	s0,sp,32
    80004d34:	100004b7          	lui	s1,0x10000
    80004d38:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80004d3c:	0ff57513          	andi	a0,a0,255
    80004d40:	fffff097          	auipc	ra,0xfffff
    80004d44:	534080e7          	jalr	1332(ra) # 80004274 <consoleintr>
    80004d48:	0054c783          	lbu	a5,5(s1)
    80004d4c:	0017f793          	andi	a5,a5,1
    80004d50:	fe0794e3          	bnez	a5,80004d38 <uartintr+0x28>
    80004d54:	00002617          	auipc	a2,0x2
    80004d58:	74c60613          	addi	a2,a2,1868 # 800074a0 <uart_tx_r>
    80004d5c:	00002517          	auipc	a0,0x2
    80004d60:	74c50513          	addi	a0,a0,1868 # 800074a8 <uart_tx_w>
    80004d64:	00063783          	ld	a5,0(a2)
    80004d68:	00053703          	ld	a4,0(a0)
    80004d6c:	04f70263          	beq	a4,a5,80004db0 <uartintr+0xa0>
    80004d70:	100005b7          	lui	a1,0x10000
    80004d74:	00004817          	auipc	a6,0x4
    80004d78:	9dc80813          	addi	a6,a6,-1572 # 80008750 <uart_tx_buf>
    80004d7c:	01c0006f          	j	80004d98 <uartintr+0x88>
    80004d80:	0006c703          	lbu	a4,0(a3)
    80004d84:	00f63023          	sd	a5,0(a2)
    80004d88:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004d8c:	00063783          	ld	a5,0(a2)
    80004d90:	00053703          	ld	a4,0(a0)
    80004d94:	00f70e63          	beq	a4,a5,80004db0 <uartintr+0xa0>
    80004d98:	01f7f713          	andi	a4,a5,31
    80004d9c:	00e806b3          	add	a3,a6,a4
    80004da0:	0055c703          	lbu	a4,5(a1)
    80004da4:	00178793          	addi	a5,a5,1
    80004da8:	02077713          	andi	a4,a4,32
    80004dac:	fc071ae3          	bnez	a4,80004d80 <uartintr+0x70>
    80004db0:	01813083          	ld	ra,24(sp)
    80004db4:	01013403          	ld	s0,16(sp)
    80004db8:	00813483          	ld	s1,8(sp)
    80004dbc:	02010113          	addi	sp,sp,32
    80004dc0:	00008067          	ret
    80004dc4:	00002617          	auipc	a2,0x2
    80004dc8:	6dc60613          	addi	a2,a2,1756 # 800074a0 <uart_tx_r>
    80004dcc:	00002517          	auipc	a0,0x2
    80004dd0:	6dc50513          	addi	a0,a0,1756 # 800074a8 <uart_tx_w>
    80004dd4:	00063783          	ld	a5,0(a2)
    80004dd8:	00053703          	ld	a4,0(a0)
    80004ddc:	04f70263          	beq	a4,a5,80004e20 <uartintr+0x110>
    80004de0:	100005b7          	lui	a1,0x10000
    80004de4:	00004817          	auipc	a6,0x4
    80004de8:	96c80813          	addi	a6,a6,-1684 # 80008750 <uart_tx_buf>
    80004dec:	01c0006f          	j	80004e08 <uartintr+0xf8>
    80004df0:	0006c703          	lbu	a4,0(a3)
    80004df4:	00f63023          	sd	a5,0(a2)
    80004df8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004dfc:	00063783          	ld	a5,0(a2)
    80004e00:	00053703          	ld	a4,0(a0)
    80004e04:	02f70063          	beq	a4,a5,80004e24 <uartintr+0x114>
    80004e08:	01f7f713          	andi	a4,a5,31
    80004e0c:	00e806b3          	add	a3,a6,a4
    80004e10:	0055c703          	lbu	a4,5(a1)
    80004e14:	00178793          	addi	a5,a5,1
    80004e18:	02077713          	andi	a4,a4,32
    80004e1c:	fc071ae3          	bnez	a4,80004df0 <uartintr+0xe0>
    80004e20:	00008067          	ret
    80004e24:	00008067          	ret

0000000080004e28 <kinit>:
    80004e28:	fc010113          	addi	sp,sp,-64
    80004e2c:	02913423          	sd	s1,40(sp)
    80004e30:	fffff7b7          	lui	a5,0xfffff
    80004e34:	00005497          	auipc	s1,0x5
    80004e38:	93b48493          	addi	s1,s1,-1733 # 8000976f <end+0xfff>
    80004e3c:	02813823          	sd	s0,48(sp)
    80004e40:	01313c23          	sd	s3,24(sp)
    80004e44:	00f4f4b3          	and	s1,s1,a5
    80004e48:	02113c23          	sd	ra,56(sp)
    80004e4c:	03213023          	sd	s2,32(sp)
    80004e50:	01413823          	sd	s4,16(sp)
    80004e54:	01513423          	sd	s5,8(sp)
    80004e58:	04010413          	addi	s0,sp,64
    80004e5c:	000017b7          	lui	a5,0x1
    80004e60:	01100993          	li	s3,17
    80004e64:	00f487b3          	add	a5,s1,a5
    80004e68:	01b99993          	slli	s3,s3,0x1b
    80004e6c:	06f9e063          	bltu	s3,a5,80004ecc <kinit+0xa4>
    80004e70:	00004a97          	auipc	s5,0x4
    80004e74:	900a8a93          	addi	s5,s5,-1792 # 80008770 <end>
    80004e78:	0754ec63          	bltu	s1,s5,80004ef0 <kinit+0xc8>
    80004e7c:	0734fa63          	bgeu	s1,s3,80004ef0 <kinit+0xc8>
    80004e80:	00088a37          	lui	s4,0x88
    80004e84:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004e88:	00002917          	auipc	s2,0x2
    80004e8c:	62890913          	addi	s2,s2,1576 # 800074b0 <kmem>
    80004e90:	00ca1a13          	slli	s4,s4,0xc
    80004e94:	0140006f          	j	80004ea8 <kinit+0x80>
    80004e98:	000017b7          	lui	a5,0x1
    80004e9c:	00f484b3          	add	s1,s1,a5
    80004ea0:	0554e863          	bltu	s1,s5,80004ef0 <kinit+0xc8>
    80004ea4:	0534f663          	bgeu	s1,s3,80004ef0 <kinit+0xc8>
    80004ea8:	00001637          	lui	a2,0x1
    80004eac:	00100593          	li	a1,1
    80004eb0:	00048513          	mv	a0,s1
    80004eb4:	00000097          	auipc	ra,0x0
    80004eb8:	5e4080e7          	jalr	1508(ra) # 80005498 <__memset>
    80004ebc:	00093783          	ld	a5,0(s2)
    80004ec0:	00f4b023          	sd	a5,0(s1)
    80004ec4:	00993023          	sd	s1,0(s2)
    80004ec8:	fd4498e3          	bne	s1,s4,80004e98 <kinit+0x70>
    80004ecc:	03813083          	ld	ra,56(sp)
    80004ed0:	03013403          	ld	s0,48(sp)
    80004ed4:	02813483          	ld	s1,40(sp)
    80004ed8:	02013903          	ld	s2,32(sp)
    80004edc:	01813983          	ld	s3,24(sp)
    80004ee0:	01013a03          	ld	s4,16(sp)
    80004ee4:	00813a83          	ld	s5,8(sp)
    80004ee8:	04010113          	addi	sp,sp,64
    80004eec:	00008067          	ret
    80004ef0:	00001517          	auipc	a0,0x1
    80004ef4:	40850513          	addi	a0,a0,1032 # 800062f8 <digits+0x18>
    80004ef8:	fffff097          	auipc	ra,0xfffff
    80004efc:	4b4080e7          	jalr	1204(ra) # 800043ac <panic>

0000000080004f00 <freerange>:
    80004f00:	fc010113          	addi	sp,sp,-64
    80004f04:	000017b7          	lui	a5,0x1
    80004f08:	02913423          	sd	s1,40(sp)
    80004f0c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004f10:	009504b3          	add	s1,a0,s1
    80004f14:	fffff537          	lui	a0,0xfffff
    80004f18:	02813823          	sd	s0,48(sp)
    80004f1c:	02113c23          	sd	ra,56(sp)
    80004f20:	03213023          	sd	s2,32(sp)
    80004f24:	01313c23          	sd	s3,24(sp)
    80004f28:	01413823          	sd	s4,16(sp)
    80004f2c:	01513423          	sd	s5,8(sp)
    80004f30:	01613023          	sd	s6,0(sp)
    80004f34:	04010413          	addi	s0,sp,64
    80004f38:	00a4f4b3          	and	s1,s1,a0
    80004f3c:	00f487b3          	add	a5,s1,a5
    80004f40:	06f5e463          	bltu	a1,a5,80004fa8 <freerange+0xa8>
    80004f44:	00004a97          	auipc	s5,0x4
    80004f48:	82ca8a93          	addi	s5,s5,-2004 # 80008770 <end>
    80004f4c:	0954e263          	bltu	s1,s5,80004fd0 <freerange+0xd0>
    80004f50:	01100993          	li	s3,17
    80004f54:	01b99993          	slli	s3,s3,0x1b
    80004f58:	0734fc63          	bgeu	s1,s3,80004fd0 <freerange+0xd0>
    80004f5c:	00058a13          	mv	s4,a1
    80004f60:	00002917          	auipc	s2,0x2
    80004f64:	55090913          	addi	s2,s2,1360 # 800074b0 <kmem>
    80004f68:	00002b37          	lui	s6,0x2
    80004f6c:	0140006f          	j	80004f80 <freerange+0x80>
    80004f70:	000017b7          	lui	a5,0x1
    80004f74:	00f484b3          	add	s1,s1,a5
    80004f78:	0554ec63          	bltu	s1,s5,80004fd0 <freerange+0xd0>
    80004f7c:	0534fa63          	bgeu	s1,s3,80004fd0 <freerange+0xd0>
    80004f80:	00001637          	lui	a2,0x1
    80004f84:	00100593          	li	a1,1
    80004f88:	00048513          	mv	a0,s1
    80004f8c:	00000097          	auipc	ra,0x0
    80004f90:	50c080e7          	jalr	1292(ra) # 80005498 <__memset>
    80004f94:	00093703          	ld	a4,0(s2)
    80004f98:	016487b3          	add	a5,s1,s6
    80004f9c:	00e4b023          	sd	a4,0(s1)
    80004fa0:	00993023          	sd	s1,0(s2)
    80004fa4:	fcfa76e3          	bgeu	s4,a5,80004f70 <freerange+0x70>
    80004fa8:	03813083          	ld	ra,56(sp)
    80004fac:	03013403          	ld	s0,48(sp)
    80004fb0:	02813483          	ld	s1,40(sp)
    80004fb4:	02013903          	ld	s2,32(sp)
    80004fb8:	01813983          	ld	s3,24(sp)
    80004fbc:	01013a03          	ld	s4,16(sp)
    80004fc0:	00813a83          	ld	s5,8(sp)
    80004fc4:	00013b03          	ld	s6,0(sp)
    80004fc8:	04010113          	addi	sp,sp,64
    80004fcc:	00008067          	ret
    80004fd0:	00001517          	auipc	a0,0x1
    80004fd4:	32850513          	addi	a0,a0,808 # 800062f8 <digits+0x18>
    80004fd8:	fffff097          	auipc	ra,0xfffff
    80004fdc:	3d4080e7          	jalr	980(ra) # 800043ac <panic>

0000000080004fe0 <kfree>:
    80004fe0:	fe010113          	addi	sp,sp,-32
    80004fe4:	00813823          	sd	s0,16(sp)
    80004fe8:	00113c23          	sd	ra,24(sp)
    80004fec:	00913423          	sd	s1,8(sp)
    80004ff0:	02010413          	addi	s0,sp,32
    80004ff4:	03451793          	slli	a5,a0,0x34
    80004ff8:	04079c63          	bnez	a5,80005050 <kfree+0x70>
    80004ffc:	00003797          	auipc	a5,0x3
    80005000:	77478793          	addi	a5,a5,1908 # 80008770 <end>
    80005004:	00050493          	mv	s1,a0
    80005008:	04f56463          	bltu	a0,a5,80005050 <kfree+0x70>
    8000500c:	01100793          	li	a5,17
    80005010:	01b79793          	slli	a5,a5,0x1b
    80005014:	02f57e63          	bgeu	a0,a5,80005050 <kfree+0x70>
    80005018:	00001637          	lui	a2,0x1
    8000501c:	00100593          	li	a1,1
    80005020:	00000097          	auipc	ra,0x0
    80005024:	478080e7          	jalr	1144(ra) # 80005498 <__memset>
    80005028:	00002797          	auipc	a5,0x2
    8000502c:	48878793          	addi	a5,a5,1160 # 800074b0 <kmem>
    80005030:	0007b703          	ld	a4,0(a5)
    80005034:	01813083          	ld	ra,24(sp)
    80005038:	01013403          	ld	s0,16(sp)
    8000503c:	00e4b023          	sd	a4,0(s1)
    80005040:	0097b023          	sd	s1,0(a5)
    80005044:	00813483          	ld	s1,8(sp)
    80005048:	02010113          	addi	sp,sp,32
    8000504c:	00008067          	ret
    80005050:	00001517          	auipc	a0,0x1
    80005054:	2a850513          	addi	a0,a0,680 # 800062f8 <digits+0x18>
    80005058:	fffff097          	auipc	ra,0xfffff
    8000505c:	354080e7          	jalr	852(ra) # 800043ac <panic>

0000000080005060 <kalloc>:
    80005060:	fe010113          	addi	sp,sp,-32
    80005064:	00813823          	sd	s0,16(sp)
    80005068:	00913423          	sd	s1,8(sp)
    8000506c:	00113c23          	sd	ra,24(sp)
    80005070:	02010413          	addi	s0,sp,32
    80005074:	00002797          	auipc	a5,0x2
    80005078:	43c78793          	addi	a5,a5,1084 # 800074b0 <kmem>
    8000507c:	0007b483          	ld	s1,0(a5)
    80005080:	02048063          	beqz	s1,800050a0 <kalloc+0x40>
    80005084:	0004b703          	ld	a4,0(s1)
    80005088:	00001637          	lui	a2,0x1
    8000508c:	00500593          	li	a1,5
    80005090:	00048513          	mv	a0,s1
    80005094:	00e7b023          	sd	a4,0(a5)
    80005098:	00000097          	auipc	ra,0x0
    8000509c:	400080e7          	jalr	1024(ra) # 80005498 <__memset>
    800050a0:	01813083          	ld	ra,24(sp)
    800050a4:	01013403          	ld	s0,16(sp)
    800050a8:	00048513          	mv	a0,s1
    800050ac:	00813483          	ld	s1,8(sp)
    800050b0:	02010113          	addi	sp,sp,32
    800050b4:	00008067          	ret

00000000800050b8 <initlock>:
    800050b8:	ff010113          	addi	sp,sp,-16
    800050bc:	00813423          	sd	s0,8(sp)
    800050c0:	01010413          	addi	s0,sp,16
    800050c4:	00813403          	ld	s0,8(sp)
    800050c8:	00b53423          	sd	a1,8(a0)
    800050cc:	00052023          	sw	zero,0(a0)
    800050d0:	00053823          	sd	zero,16(a0)
    800050d4:	01010113          	addi	sp,sp,16
    800050d8:	00008067          	ret

00000000800050dc <acquire>:
    800050dc:	fe010113          	addi	sp,sp,-32
    800050e0:	00813823          	sd	s0,16(sp)
    800050e4:	00913423          	sd	s1,8(sp)
    800050e8:	00113c23          	sd	ra,24(sp)
    800050ec:	01213023          	sd	s2,0(sp)
    800050f0:	02010413          	addi	s0,sp,32
    800050f4:	00050493          	mv	s1,a0
    800050f8:	10002973          	csrr	s2,sstatus
    800050fc:	100027f3          	csrr	a5,sstatus
    80005100:	ffd7f793          	andi	a5,a5,-3
    80005104:	10079073          	csrw	sstatus,a5
    80005108:	fffff097          	auipc	ra,0xfffff
    8000510c:	8e0080e7          	jalr	-1824(ra) # 800039e8 <mycpu>
    80005110:	07852783          	lw	a5,120(a0)
    80005114:	06078e63          	beqz	a5,80005190 <acquire+0xb4>
    80005118:	fffff097          	auipc	ra,0xfffff
    8000511c:	8d0080e7          	jalr	-1840(ra) # 800039e8 <mycpu>
    80005120:	07852783          	lw	a5,120(a0)
    80005124:	0004a703          	lw	a4,0(s1)
    80005128:	0017879b          	addiw	a5,a5,1
    8000512c:	06f52c23          	sw	a5,120(a0)
    80005130:	04071063          	bnez	a4,80005170 <acquire+0x94>
    80005134:	00100713          	li	a4,1
    80005138:	00070793          	mv	a5,a4
    8000513c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005140:	0007879b          	sext.w	a5,a5
    80005144:	fe079ae3          	bnez	a5,80005138 <acquire+0x5c>
    80005148:	0ff0000f          	fence
    8000514c:	fffff097          	auipc	ra,0xfffff
    80005150:	89c080e7          	jalr	-1892(ra) # 800039e8 <mycpu>
    80005154:	01813083          	ld	ra,24(sp)
    80005158:	01013403          	ld	s0,16(sp)
    8000515c:	00a4b823          	sd	a0,16(s1)
    80005160:	00013903          	ld	s2,0(sp)
    80005164:	00813483          	ld	s1,8(sp)
    80005168:	02010113          	addi	sp,sp,32
    8000516c:	00008067          	ret
    80005170:	0104b903          	ld	s2,16(s1)
    80005174:	fffff097          	auipc	ra,0xfffff
    80005178:	874080e7          	jalr	-1932(ra) # 800039e8 <mycpu>
    8000517c:	faa91ce3          	bne	s2,a0,80005134 <acquire+0x58>
    80005180:	00001517          	auipc	a0,0x1
    80005184:	18050513          	addi	a0,a0,384 # 80006300 <digits+0x20>
    80005188:	fffff097          	auipc	ra,0xfffff
    8000518c:	224080e7          	jalr	548(ra) # 800043ac <panic>
    80005190:	00195913          	srli	s2,s2,0x1
    80005194:	fffff097          	auipc	ra,0xfffff
    80005198:	854080e7          	jalr	-1964(ra) # 800039e8 <mycpu>
    8000519c:	00197913          	andi	s2,s2,1
    800051a0:	07252e23          	sw	s2,124(a0)
    800051a4:	f75ff06f          	j	80005118 <acquire+0x3c>

00000000800051a8 <release>:
    800051a8:	fe010113          	addi	sp,sp,-32
    800051ac:	00813823          	sd	s0,16(sp)
    800051b0:	00113c23          	sd	ra,24(sp)
    800051b4:	00913423          	sd	s1,8(sp)
    800051b8:	01213023          	sd	s2,0(sp)
    800051bc:	02010413          	addi	s0,sp,32
    800051c0:	00052783          	lw	a5,0(a0)
    800051c4:	00079a63          	bnez	a5,800051d8 <release+0x30>
    800051c8:	00001517          	auipc	a0,0x1
    800051cc:	14050513          	addi	a0,a0,320 # 80006308 <digits+0x28>
    800051d0:	fffff097          	auipc	ra,0xfffff
    800051d4:	1dc080e7          	jalr	476(ra) # 800043ac <panic>
    800051d8:	01053903          	ld	s2,16(a0)
    800051dc:	00050493          	mv	s1,a0
    800051e0:	fffff097          	auipc	ra,0xfffff
    800051e4:	808080e7          	jalr	-2040(ra) # 800039e8 <mycpu>
    800051e8:	fea910e3          	bne	s2,a0,800051c8 <release+0x20>
    800051ec:	0004b823          	sd	zero,16(s1)
    800051f0:	0ff0000f          	fence
    800051f4:	0f50000f          	fence	iorw,ow
    800051f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800051fc:	ffffe097          	auipc	ra,0xffffe
    80005200:	7ec080e7          	jalr	2028(ra) # 800039e8 <mycpu>
    80005204:	100027f3          	csrr	a5,sstatus
    80005208:	0027f793          	andi	a5,a5,2
    8000520c:	04079a63          	bnez	a5,80005260 <release+0xb8>
    80005210:	07852783          	lw	a5,120(a0)
    80005214:	02f05e63          	blez	a5,80005250 <release+0xa8>
    80005218:	fff7871b          	addiw	a4,a5,-1
    8000521c:	06e52c23          	sw	a4,120(a0)
    80005220:	00071c63          	bnez	a4,80005238 <release+0x90>
    80005224:	07c52783          	lw	a5,124(a0)
    80005228:	00078863          	beqz	a5,80005238 <release+0x90>
    8000522c:	100027f3          	csrr	a5,sstatus
    80005230:	0027e793          	ori	a5,a5,2
    80005234:	10079073          	csrw	sstatus,a5
    80005238:	01813083          	ld	ra,24(sp)
    8000523c:	01013403          	ld	s0,16(sp)
    80005240:	00813483          	ld	s1,8(sp)
    80005244:	00013903          	ld	s2,0(sp)
    80005248:	02010113          	addi	sp,sp,32
    8000524c:	00008067          	ret
    80005250:	00001517          	auipc	a0,0x1
    80005254:	0d850513          	addi	a0,a0,216 # 80006328 <digits+0x48>
    80005258:	fffff097          	auipc	ra,0xfffff
    8000525c:	154080e7          	jalr	340(ra) # 800043ac <panic>
    80005260:	00001517          	auipc	a0,0x1
    80005264:	0b050513          	addi	a0,a0,176 # 80006310 <digits+0x30>
    80005268:	fffff097          	auipc	ra,0xfffff
    8000526c:	144080e7          	jalr	324(ra) # 800043ac <panic>

0000000080005270 <holding>:
    80005270:	00052783          	lw	a5,0(a0)
    80005274:	00079663          	bnez	a5,80005280 <holding+0x10>
    80005278:	00000513          	li	a0,0
    8000527c:	00008067          	ret
    80005280:	fe010113          	addi	sp,sp,-32
    80005284:	00813823          	sd	s0,16(sp)
    80005288:	00913423          	sd	s1,8(sp)
    8000528c:	00113c23          	sd	ra,24(sp)
    80005290:	02010413          	addi	s0,sp,32
    80005294:	01053483          	ld	s1,16(a0)
    80005298:	ffffe097          	auipc	ra,0xffffe
    8000529c:	750080e7          	jalr	1872(ra) # 800039e8 <mycpu>
    800052a0:	01813083          	ld	ra,24(sp)
    800052a4:	01013403          	ld	s0,16(sp)
    800052a8:	40a48533          	sub	a0,s1,a0
    800052ac:	00153513          	seqz	a0,a0
    800052b0:	00813483          	ld	s1,8(sp)
    800052b4:	02010113          	addi	sp,sp,32
    800052b8:	00008067          	ret

00000000800052bc <push_off>:
    800052bc:	fe010113          	addi	sp,sp,-32
    800052c0:	00813823          	sd	s0,16(sp)
    800052c4:	00113c23          	sd	ra,24(sp)
    800052c8:	00913423          	sd	s1,8(sp)
    800052cc:	02010413          	addi	s0,sp,32
    800052d0:	100024f3          	csrr	s1,sstatus
    800052d4:	100027f3          	csrr	a5,sstatus
    800052d8:	ffd7f793          	andi	a5,a5,-3
    800052dc:	10079073          	csrw	sstatus,a5
    800052e0:	ffffe097          	auipc	ra,0xffffe
    800052e4:	708080e7          	jalr	1800(ra) # 800039e8 <mycpu>
    800052e8:	07852783          	lw	a5,120(a0)
    800052ec:	02078663          	beqz	a5,80005318 <push_off+0x5c>
    800052f0:	ffffe097          	auipc	ra,0xffffe
    800052f4:	6f8080e7          	jalr	1784(ra) # 800039e8 <mycpu>
    800052f8:	07852783          	lw	a5,120(a0)
    800052fc:	01813083          	ld	ra,24(sp)
    80005300:	01013403          	ld	s0,16(sp)
    80005304:	0017879b          	addiw	a5,a5,1
    80005308:	06f52c23          	sw	a5,120(a0)
    8000530c:	00813483          	ld	s1,8(sp)
    80005310:	02010113          	addi	sp,sp,32
    80005314:	00008067          	ret
    80005318:	0014d493          	srli	s1,s1,0x1
    8000531c:	ffffe097          	auipc	ra,0xffffe
    80005320:	6cc080e7          	jalr	1740(ra) # 800039e8 <mycpu>
    80005324:	0014f493          	andi	s1,s1,1
    80005328:	06952e23          	sw	s1,124(a0)
    8000532c:	fc5ff06f          	j	800052f0 <push_off+0x34>

0000000080005330 <pop_off>:
    80005330:	ff010113          	addi	sp,sp,-16
    80005334:	00813023          	sd	s0,0(sp)
    80005338:	00113423          	sd	ra,8(sp)
    8000533c:	01010413          	addi	s0,sp,16
    80005340:	ffffe097          	auipc	ra,0xffffe
    80005344:	6a8080e7          	jalr	1704(ra) # 800039e8 <mycpu>
    80005348:	100027f3          	csrr	a5,sstatus
    8000534c:	0027f793          	andi	a5,a5,2
    80005350:	04079663          	bnez	a5,8000539c <pop_off+0x6c>
    80005354:	07852783          	lw	a5,120(a0)
    80005358:	02f05a63          	blez	a5,8000538c <pop_off+0x5c>
    8000535c:	fff7871b          	addiw	a4,a5,-1
    80005360:	06e52c23          	sw	a4,120(a0)
    80005364:	00071c63          	bnez	a4,8000537c <pop_off+0x4c>
    80005368:	07c52783          	lw	a5,124(a0)
    8000536c:	00078863          	beqz	a5,8000537c <pop_off+0x4c>
    80005370:	100027f3          	csrr	a5,sstatus
    80005374:	0027e793          	ori	a5,a5,2
    80005378:	10079073          	csrw	sstatus,a5
    8000537c:	00813083          	ld	ra,8(sp)
    80005380:	00013403          	ld	s0,0(sp)
    80005384:	01010113          	addi	sp,sp,16
    80005388:	00008067          	ret
    8000538c:	00001517          	auipc	a0,0x1
    80005390:	f9c50513          	addi	a0,a0,-100 # 80006328 <digits+0x48>
    80005394:	fffff097          	auipc	ra,0xfffff
    80005398:	018080e7          	jalr	24(ra) # 800043ac <panic>
    8000539c:	00001517          	auipc	a0,0x1
    800053a0:	f7450513          	addi	a0,a0,-140 # 80006310 <digits+0x30>
    800053a4:	fffff097          	auipc	ra,0xfffff
    800053a8:	008080e7          	jalr	8(ra) # 800043ac <panic>

00000000800053ac <push_on>:
    800053ac:	fe010113          	addi	sp,sp,-32
    800053b0:	00813823          	sd	s0,16(sp)
    800053b4:	00113c23          	sd	ra,24(sp)
    800053b8:	00913423          	sd	s1,8(sp)
    800053bc:	02010413          	addi	s0,sp,32
    800053c0:	100024f3          	csrr	s1,sstatus
    800053c4:	100027f3          	csrr	a5,sstatus
    800053c8:	0027e793          	ori	a5,a5,2
    800053cc:	10079073          	csrw	sstatus,a5
    800053d0:	ffffe097          	auipc	ra,0xffffe
    800053d4:	618080e7          	jalr	1560(ra) # 800039e8 <mycpu>
    800053d8:	07852783          	lw	a5,120(a0)
    800053dc:	02078663          	beqz	a5,80005408 <push_on+0x5c>
    800053e0:	ffffe097          	auipc	ra,0xffffe
    800053e4:	608080e7          	jalr	1544(ra) # 800039e8 <mycpu>
    800053e8:	07852783          	lw	a5,120(a0)
    800053ec:	01813083          	ld	ra,24(sp)
    800053f0:	01013403          	ld	s0,16(sp)
    800053f4:	0017879b          	addiw	a5,a5,1
    800053f8:	06f52c23          	sw	a5,120(a0)
    800053fc:	00813483          	ld	s1,8(sp)
    80005400:	02010113          	addi	sp,sp,32
    80005404:	00008067          	ret
    80005408:	0014d493          	srli	s1,s1,0x1
    8000540c:	ffffe097          	auipc	ra,0xffffe
    80005410:	5dc080e7          	jalr	1500(ra) # 800039e8 <mycpu>
    80005414:	0014f493          	andi	s1,s1,1
    80005418:	06952e23          	sw	s1,124(a0)
    8000541c:	fc5ff06f          	j	800053e0 <push_on+0x34>

0000000080005420 <pop_on>:
    80005420:	ff010113          	addi	sp,sp,-16
    80005424:	00813023          	sd	s0,0(sp)
    80005428:	00113423          	sd	ra,8(sp)
    8000542c:	01010413          	addi	s0,sp,16
    80005430:	ffffe097          	auipc	ra,0xffffe
    80005434:	5b8080e7          	jalr	1464(ra) # 800039e8 <mycpu>
    80005438:	100027f3          	csrr	a5,sstatus
    8000543c:	0027f793          	andi	a5,a5,2
    80005440:	04078463          	beqz	a5,80005488 <pop_on+0x68>
    80005444:	07852783          	lw	a5,120(a0)
    80005448:	02f05863          	blez	a5,80005478 <pop_on+0x58>
    8000544c:	fff7879b          	addiw	a5,a5,-1
    80005450:	06f52c23          	sw	a5,120(a0)
    80005454:	07853783          	ld	a5,120(a0)
    80005458:	00079863          	bnez	a5,80005468 <pop_on+0x48>
    8000545c:	100027f3          	csrr	a5,sstatus
    80005460:	ffd7f793          	andi	a5,a5,-3
    80005464:	10079073          	csrw	sstatus,a5
    80005468:	00813083          	ld	ra,8(sp)
    8000546c:	00013403          	ld	s0,0(sp)
    80005470:	01010113          	addi	sp,sp,16
    80005474:	00008067          	ret
    80005478:	00001517          	auipc	a0,0x1
    8000547c:	ed850513          	addi	a0,a0,-296 # 80006350 <digits+0x70>
    80005480:	fffff097          	auipc	ra,0xfffff
    80005484:	f2c080e7          	jalr	-212(ra) # 800043ac <panic>
    80005488:	00001517          	auipc	a0,0x1
    8000548c:	ea850513          	addi	a0,a0,-344 # 80006330 <digits+0x50>
    80005490:	fffff097          	auipc	ra,0xfffff
    80005494:	f1c080e7          	jalr	-228(ra) # 800043ac <panic>

0000000080005498 <__memset>:
    80005498:	ff010113          	addi	sp,sp,-16
    8000549c:	00813423          	sd	s0,8(sp)
    800054a0:	01010413          	addi	s0,sp,16
    800054a4:	1a060e63          	beqz	a2,80005660 <__memset+0x1c8>
    800054a8:	40a007b3          	neg	a5,a0
    800054ac:	0077f793          	andi	a5,a5,7
    800054b0:	00778693          	addi	a3,a5,7
    800054b4:	00b00813          	li	a6,11
    800054b8:	0ff5f593          	andi	a1,a1,255
    800054bc:	fff6071b          	addiw	a4,a2,-1
    800054c0:	1b06e663          	bltu	a3,a6,8000566c <__memset+0x1d4>
    800054c4:	1cd76463          	bltu	a4,a3,8000568c <__memset+0x1f4>
    800054c8:	1a078e63          	beqz	a5,80005684 <__memset+0x1ec>
    800054cc:	00b50023          	sb	a1,0(a0)
    800054d0:	00100713          	li	a4,1
    800054d4:	1ae78463          	beq	a5,a4,8000567c <__memset+0x1e4>
    800054d8:	00b500a3          	sb	a1,1(a0)
    800054dc:	00200713          	li	a4,2
    800054e0:	1ae78a63          	beq	a5,a4,80005694 <__memset+0x1fc>
    800054e4:	00b50123          	sb	a1,2(a0)
    800054e8:	00300713          	li	a4,3
    800054ec:	18e78463          	beq	a5,a4,80005674 <__memset+0x1dc>
    800054f0:	00b501a3          	sb	a1,3(a0)
    800054f4:	00400713          	li	a4,4
    800054f8:	1ae78263          	beq	a5,a4,8000569c <__memset+0x204>
    800054fc:	00b50223          	sb	a1,4(a0)
    80005500:	00500713          	li	a4,5
    80005504:	1ae78063          	beq	a5,a4,800056a4 <__memset+0x20c>
    80005508:	00b502a3          	sb	a1,5(a0)
    8000550c:	00700713          	li	a4,7
    80005510:	18e79e63          	bne	a5,a4,800056ac <__memset+0x214>
    80005514:	00b50323          	sb	a1,6(a0)
    80005518:	00700e93          	li	t4,7
    8000551c:	00859713          	slli	a4,a1,0x8
    80005520:	00e5e733          	or	a4,a1,a4
    80005524:	01059e13          	slli	t3,a1,0x10
    80005528:	01c76e33          	or	t3,a4,t3
    8000552c:	01859313          	slli	t1,a1,0x18
    80005530:	006e6333          	or	t1,t3,t1
    80005534:	02059893          	slli	a7,a1,0x20
    80005538:	40f60e3b          	subw	t3,a2,a5
    8000553c:	011368b3          	or	a7,t1,a7
    80005540:	02859813          	slli	a6,a1,0x28
    80005544:	0108e833          	or	a6,a7,a6
    80005548:	03059693          	slli	a3,a1,0x30
    8000554c:	003e589b          	srliw	a7,t3,0x3
    80005550:	00d866b3          	or	a3,a6,a3
    80005554:	03859713          	slli	a4,a1,0x38
    80005558:	00389813          	slli	a6,a7,0x3
    8000555c:	00f507b3          	add	a5,a0,a5
    80005560:	00e6e733          	or	a4,a3,a4
    80005564:	000e089b          	sext.w	a7,t3
    80005568:	00f806b3          	add	a3,a6,a5
    8000556c:	00e7b023          	sd	a4,0(a5)
    80005570:	00878793          	addi	a5,a5,8
    80005574:	fed79ce3          	bne	a5,a3,8000556c <__memset+0xd4>
    80005578:	ff8e7793          	andi	a5,t3,-8
    8000557c:	0007871b          	sext.w	a4,a5
    80005580:	01d787bb          	addw	a5,a5,t4
    80005584:	0ce88e63          	beq	a7,a4,80005660 <__memset+0x1c8>
    80005588:	00f50733          	add	a4,a0,a5
    8000558c:	00b70023          	sb	a1,0(a4)
    80005590:	0017871b          	addiw	a4,a5,1
    80005594:	0cc77663          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    80005598:	00e50733          	add	a4,a0,a4
    8000559c:	00b70023          	sb	a1,0(a4)
    800055a0:	0027871b          	addiw	a4,a5,2
    800055a4:	0ac77e63          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    800055a8:	00e50733          	add	a4,a0,a4
    800055ac:	00b70023          	sb	a1,0(a4)
    800055b0:	0037871b          	addiw	a4,a5,3
    800055b4:	0ac77663          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    800055b8:	00e50733          	add	a4,a0,a4
    800055bc:	00b70023          	sb	a1,0(a4)
    800055c0:	0047871b          	addiw	a4,a5,4
    800055c4:	08c77e63          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    800055c8:	00e50733          	add	a4,a0,a4
    800055cc:	00b70023          	sb	a1,0(a4)
    800055d0:	0057871b          	addiw	a4,a5,5
    800055d4:	08c77663          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    800055d8:	00e50733          	add	a4,a0,a4
    800055dc:	00b70023          	sb	a1,0(a4)
    800055e0:	0067871b          	addiw	a4,a5,6
    800055e4:	06c77e63          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    800055e8:	00e50733          	add	a4,a0,a4
    800055ec:	00b70023          	sb	a1,0(a4)
    800055f0:	0077871b          	addiw	a4,a5,7
    800055f4:	06c77663          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    800055f8:	00e50733          	add	a4,a0,a4
    800055fc:	00b70023          	sb	a1,0(a4)
    80005600:	0087871b          	addiw	a4,a5,8
    80005604:	04c77e63          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    80005608:	00e50733          	add	a4,a0,a4
    8000560c:	00b70023          	sb	a1,0(a4)
    80005610:	0097871b          	addiw	a4,a5,9
    80005614:	04c77663          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    80005618:	00e50733          	add	a4,a0,a4
    8000561c:	00b70023          	sb	a1,0(a4)
    80005620:	00a7871b          	addiw	a4,a5,10
    80005624:	02c77e63          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    80005628:	00e50733          	add	a4,a0,a4
    8000562c:	00b70023          	sb	a1,0(a4)
    80005630:	00b7871b          	addiw	a4,a5,11
    80005634:	02c77663          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    80005638:	00e50733          	add	a4,a0,a4
    8000563c:	00b70023          	sb	a1,0(a4)
    80005640:	00c7871b          	addiw	a4,a5,12
    80005644:	00c77e63          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    80005648:	00e50733          	add	a4,a0,a4
    8000564c:	00b70023          	sb	a1,0(a4)
    80005650:	00d7879b          	addiw	a5,a5,13
    80005654:	00c7f663          	bgeu	a5,a2,80005660 <__memset+0x1c8>
    80005658:	00f507b3          	add	a5,a0,a5
    8000565c:	00b78023          	sb	a1,0(a5)
    80005660:	00813403          	ld	s0,8(sp)
    80005664:	01010113          	addi	sp,sp,16
    80005668:	00008067          	ret
    8000566c:	00b00693          	li	a3,11
    80005670:	e55ff06f          	j	800054c4 <__memset+0x2c>
    80005674:	00300e93          	li	t4,3
    80005678:	ea5ff06f          	j	8000551c <__memset+0x84>
    8000567c:	00100e93          	li	t4,1
    80005680:	e9dff06f          	j	8000551c <__memset+0x84>
    80005684:	00000e93          	li	t4,0
    80005688:	e95ff06f          	j	8000551c <__memset+0x84>
    8000568c:	00000793          	li	a5,0
    80005690:	ef9ff06f          	j	80005588 <__memset+0xf0>
    80005694:	00200e93          	li	t4,2
    80005698:	e85ff06f          	j	8000551c <__memset+0x84>
    8000569c:	00400e93          	li	t4,4
    800056a0:	e7dff06f          	j	8000551c <__memset+0x84>
    800056a4:	00500e93          	li	t4,5
    800056a8:	e75ff06f          	j	8000551c <__memset+0x84>
    800056ac:	00600e93          	li	t4,6
    800056b0:	e6dff06f          	j	8000551c <__memset+0x84>

00000000800056b4 <__memmove>:
    800056b4:	ff010113          	addi	sp,sp,-16
    800056b8:	00813423          	sd	s0,8(sp)
    800056bc:	01010413          	addi	s0,sp,16
    800056c0:	0e060863          	beqz	a2,800057b0 <__memmove+0xfc>
    800056c4:	fff6069b          	addiw	a3,a2,-1
    800056c8:	0006881b          	sext.w	a6,a3
    800056cc:	0ea5e863          	bltu	a1,a0,800057bc <__memmove+0x108>
    800056d0:	00758713          	addi	a4,a1,7
    800056d4:	00a5e7b3          	or	a5,a1,a0
    800056d8:	40a70733          	sub	a4,a4,a0
    800056dc:	0077f793          	andi	a5,a5,7
    800056e0:	00f73713          	sltiu	a4,a4,15
    800056e4:	00174713          	xori	a4,a4,1
    800056e8:	0017b793          	seqz	a5,a5
    800056ec:	00e7f7b3          	and	a5,a5,a4
    800056f0:	10078863          	beqz	a5,80005800 <__memmove+0x14c>
    800056f4:	00900793          	li	a5,9
    800056f8:	1107f463          	bgeu	a5,a6,80005800 <__memmove+0x14c>
    800056fc:	0036581b          	srliw	a6,a2,0x3
    80005700:	fff8081b          	addiw	a6,a6,-1
    80005704:	02081813          	slli	a6,a6,0x20
    80005708:	01d85893          	srli	a7,a6,0x1d
    8000570c:	00858813          	addi	a6,a1,8
    80005710:	00058793          	mv	a5,a1
    80005714:	00050713          	mv	a4,a0
    80005718:	01088833          	add	a6,a7,a6
    8000571c:	0007b883          	ld	a7,0(a5)
    80005720:	00878793          	addi	a5,a5,8
    80005724:	00870713          	addi	a4,a4,8
    80005728:	ff173c23          	sd	a7,-8(a4)
    8000572c:	ff0798e3          	bne	a5,a6,8000571c <__memmove+0x68>
    80005730:	ff867713          	andi	a4,a2,-8
    80005734:	02071793          	slli	a5,a4,0x20
    80005738:	0207d793          	srli	a5,a5,0x20
    8000573c:	00f585b3          	add	a1,a1,a5
    80005740:	40e686bb          	subw	a3,a3,a4
    80005744:	00f507b3          	add	a5,a0,a5
    80005748:	06e60463          	beq	a2,a4,800057b0 <__memmove+0xfc>
    8000574c:	0005c703          	lbu	a4,0(a1)
    80005750:	00e78023          	sb	a4,0(a5)
    80005754:	04068e63          	beqz	a3,800057b0 <__memmove+0xfc>
    80005758:	0015c603          	lbu	a2,1(a1)
    8000575c:	00100713          	li	a4,1
    80005760:	00c780a3          	sb	a2,1(a5)
    80005764:	04e68663          	beq	a3,a4,800057b0 <__memmove+0xfc>
    80005768:	0025c603          	lbu	a2,2(a1)
    8000576c:	00200713          	li	a4,2
    80005770:	00c78123          	sb	a2,2(a5)
    80005774:	02e68e63          	beq	a3,a4,800057b0 <__memmove+0xfc>
    80005778:	0035c603          	lbu	a2,3(a1)
    8000577c:	00300713          	li	a4,3
    80005780:	00c781a3          	sb	a2,3(a5)
    80005784:	02e68663          	beq	a3,a4,800057b0 <__memmove+0xfc>
    80005788:	0045c603          	lbu	a2,4(a1)
    8000578c:	00400713          	li	a4,4
    80005790:	00c78223          	sb	a2,4(a5)
    80005794:	00e68e63          	beq	a3,a4,800057b0 <__memmove+0xfc>
    80005798:	0055c603          	lbu	a2,5(a1)
    8000579c:	00500713          	li	a4,5
    800057a0:	00c782a3          	sb	a2,5(a5)
    800057a4:	00e68663          	beq	a3,a4,800057b0 <__memmove+0xfc>
    800057a8:	0065c703          	lbu	a4,6(a1)
    800057ac:	00e78323          	sb	a4,6(a5)
    800057b0:	00813403          	ld	s0,8(sp)
    800057b4:	01010113          	addi	sp,sp,16
    800057b8:	00008067          	ret
    800057bc:	02061713          	slli	a4,a2,0x20
    800057c0:	02075713          	srli	a4,a4,0x20
    800057c4:	00e587b3          	add	a5,a1,a4
    800057c8:	f0f574e3          	bgeu	a0,a5,800056d0 <__memmove+0x1c>
    800057cc:	02069613          	slli	a2,a3,0x20
    800057d0:	02065613          	srli	a2,a2,0x20
    800057d4:	fff64613          	not	a2,a2
    800057d8:	00e50733          	add	a4,a0,a4
    800057dc:	00c78633          	add	a2,a5,a2
    800057e0:	fff7c683          	lbu	a3,-1(a5)
    800057e4:	fff78793          	addi	a5,a5,-1
    800057e8:	fff70713          	addi	a4,a4,-1
    800057ec:	00d70023          	sb	a3,0(a4)
    800057f0:	fec798e3          	bne	a5,a2,800057e0 <__memmove+0x12c>
    800057f4:	00813403          	ld	s0,8(sp)
    800057f8:	01010113          	addi	sp,sp,16
    800057fc:	00008067          	ret
    80005800:	02069713          	slli	a4,a3,0x20
    80005804:	02075713          	srli	a4,a4,0x20
    80005808:	00170713          	addi	a4,a4,1
    8000580c:	00e50733          	add	a4,a0,a4
    80005810:	00050793          	mv	a5,a0
    80005814:	0005c683          	lbu	a3,0(a1)
    80005818:	00178793          	addi	a5,a5,1
    8000581c:	00158593          	addi	a1,a1,1
    80005820:	fed78fa3          	sb	a3,-1(a5)
    80005824:	fee798e3          	bne	a5,a4,80005814 <__memmove+0x160>
    80005828:	f89ff06f          	j	800057b0 <__memmove+0xfc>

000000008000582c <__putc>:
    8000582c:	fe010113          	addi	sp,sp,-32
    80005830:	00813823          	sd	s0,16(sp)
    80005834:	00113c23          	sd	ra,24(sp)
    80005838:	02010413          	addi	s0,sp,32
    8000583c:	00050793          	mv	a5,a0
    80005840:	fef40593          	addi	a1,s0,-17
    80005844:	00100613          	li	a2,1
    80005848:	00000513          	li	a0,0
    8000584c:	fef407a3          	sb	a5,-17(s0)
    80005850:	fffff097          	auipc	ra,0xfffff
    80005854:	b3c080e7          	jalr	-1220(ra) # 8000438c <console_write>
    80005858:	01813083          	ld	ra,24(sp)
    8000585c:	01013403          	ld	s0,16(sp)
    80005860:	02010113          	addi	sp,sp,32
    80005864:	00008067          	ret

0000000080005868 <__getc>:
    80005868:	fe010113          	addi	sp,sp,-32
    8000586c:	00813823          	sd	s0,16(sp)
    80005870:	00113c23          	sd	ra,24(sp)
    80005874:	02010413          	addi	s0,sp,32
    80005878:	fe840593          	addi	a1,s0,-24
    8000587c:	00100613          	li	a2,1
    80005880:	00000513          	li	a0,0
    80005884:	fffff097          	auipc	ra,0xfffff
    80005888:	ae8080e7          	jalr	-1304(ra) # 8000436c <console_read>
    8000588c:	fe844503          	lbu	a0,-24(s0)
    80005890:	01813083          	ld	ra,24(sp)
    80005894:	01013403          	ld	s0,16(sp)
    80005898:	02010113          	addi	sp,sp,32
    8000589c:	00008067          	ret

00000000800058a0 <console_handler>:
    800058a0:	fe010113          	addi	sp,sp,-32
    800058a4:	00813823          	sd	s0,16(sp)
    800058a8:	00113c23          	sd	ra,24(sp)
    800058ac:	00913423          	sd	s1,8(sp)
    800058b0:	02010413          	addi	s0,sp,32
    800058b4:	14202773          	csrr	a4,scause
    800058b8:	100027f3          	csrr	a5,sstatus
    800058bc:	0027f793          	andi	a5,a5,2
    800058c0:	06079e63          	bnez	a5,8000593c <console_handler+0x9c>
    800058c4:	00074c63          	bltz	a4,800058dc <console_handler+0x3c>
    800058c8:	01813083          	ld	ra,24(sp)
    800058cc:	01013403          	ld	s0,16(sp)
    800058d0:	00813483          	ld	s1,8(sp)
    800058d4:	02010113          	addi	sp,sp,32
    800058d8:	00008067          	ret
    800058dc:	0ff77713          	andi	a4,a4,255
    800058e0:	00900793          	li	a5,9
    800058e4:	fef712e3          	bne	a4,a5,800058c8 <console_handler+0x28>
    800058e8:	ffffe097          	auipc	ra,0xffffe
    800058ec:	6dc080e7          	jalr	1756(ra) # 80003fc4 <plic_claim>
    800058f0:	00a00793          	li	a5,10
    800058f4:	00050493          	mv	s1,a0
    800058f8:	02f50c63          	beq	a0,a5,80005930 <console_handler+0x90>
    800058fc:	fc0506e3          	beqz	a0,800058c8 <console_handler+0x28>
    80005900:	00050593          	mv	a1,a0
    80005904:	00001517          	auipc	a0,0x1
    80005908:	95450513          	addi	a0,a0,-1708 # 80006258 <CONSOLE_STATUS+0x248>
    8000590c:	fffff097          	auipc	ra,0xfffff
    80005910:	afc080e7          	jalr	-1284(ra) # 80004408 <__printf>
    80005914:	01013403          	ld	s0,16(sp)
    80005918:	01813083          	ld	ra,24(sp)
    8000591c:	00048513          	mv	a0,s1
    80005920:	00813483          	ld	s1,8(sp)
    80005924:	02010113          	addi	sp,sp,32
    80005928:	ffffe317          	auipc	t1,0xffffe
    8000592c:	6d430067          	jr	1748(t1) # 80003ffc <plic_complete>
    80005930:	fffff097          	auipc	ra,0xfffff
    80005934:	3e0080e7          	jalr	992(ra) # 80004d10 <uartintr>
    80005938:	fddff06f          	j	80005914 <console_handler+0x74>
    8000593c:	00001517          	auipc	a0,0x1
    80005940:	a1c50513          	addi	a0,a0,-1508 # 80006358 <digits+0x78>
    80005944:	fffff097          	auipc	ra,0xfffff
    80005948:	a68080e7          	jalr	-1432(ra) # 800043ac <panic>
	...
