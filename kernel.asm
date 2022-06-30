
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	1c813103          	ld	sp,456(sp) # 800071c8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	33c030ef          	jal	ra,80003358 <start>

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
    800011a4:	02d010ef          	jal	ra,800029d0 <_ZN5Riscv20handleSupervisorTrapEv>

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
    80001470:	cc478793          	addi	a5,a5,-828 # 80007130 <_ZTV9KernelSem+0x10>
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
    800014b8:	134080e7          	jalr	308(ra) # 800025e8 <_Znwm>
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
    80001540:	c947b783          	ld	a5,-876(a5) # 800071d0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001544:	0007b903          	ld	s2,0(a5)
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
    80001558:	094080e7          	jalr	148(ra) # 800025e8 <_Znwm>
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
    80001614:	028080e7          	jalr	40(ra) # 80002638 <_ZdlPv>
    80001618:	00100793          	li	a5,1
    8000161c:	02f484a3          	sb	a5,41(s1)
            Scheduler::put(unblock);
    80001620:	00048513          	mv	a0,s1
    80001624:	00001097          	auipc	ra,0x1
    80001628:	6f8080e7          	jalr	1784(ra) # 80002d1c <_ZN9Scheduler3putEP3TCB>
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
    80001660:	fdc080e7          	jalr	-36(ra) # 80002638 <_ZdlPv>
        void unblock() { blocked = false; }
    80001664:	020904a3          	sb	zero,41(s2)
    while(listWait.peekFirst()){
        thread_t unblock = listWait.peekFirst();
        listWait.removeFirst();
        unblock->unblock();
        Scheduler::put(unblock);
    80001668:	00090513          	mv	a0,s2
    8000166c:	00001097          	auipc	ra,0x1
    80001670:	6b0080e7          	jalr	1712(ra) # 80002d1c <_ZN9Scheduler3putEP3TCB>
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
    800016d0:	a6478793          	addi	a5,a5,-1436 # 80007130 <_ZTV9KernelSem+0x10>
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
    80001718:	f24080e7          	jalr	-220(ra) # 80002638 <_ZdlPv>
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
    80001754:	ae050513          	addi	a0,a0,-1312 # 80007230 <lockPrint>
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
    80001788:	aac50513          	addi	a0,a0,-1364 # 80007230 <lockPrint>
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
    800017e0:	a5450513          	addi	a0,a0,-1452 # 80007230 <lockPrint>
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
    80001844:	9f050513          	addi	a0,a0,-1552 # 80007230 <lockPrint>
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
    800018fc:	93850513          	addi	a0,a0,-1736 # 80007230 <lockPrint>
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
    8000193c:	81070713          	addi	a4,a4,-2032 # 80007148 <digits>
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
    800019b0:	88450513          	addi	a0,a0,-1916 # 80007230 <lockPrint>
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
    80001a2c:	bc0080e7          	jalr	-1088(ra) # 800025e8 <_Znwm>
    80001a30:	00050993          	mv	s3,a0
    80001a34:	00000593          	li	a1,0
    80001a38:	00001097          	auipc	ra,0x1
    80001a3c:	ec4080e7          	jalr	-316(ra) # 800028fc <_ZN9SemaphoreC1Ej>
    80001a40:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80001a44:	01000513          	li	a0,16
    80001a48:	00001097          	auipc	ra,0x1
    80001a4c:	ba0080e7          	jalr	-1120(ra) # 800025e8 <_Znwm>
    80001a50:	00050993          	mv	s3,a0
    80001a54:	00090593          	mv	a1,s2
    80001a58:	00001097          	auipc	ra,0x1
    80001a5c:	ea4080e7          	jalr	-348(ra) # 800028fc <_ZN9SemaphoreC1Ej>
    80001a60:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80001a64:	01000513          	li	a0,16
    80001a68:	00001097          	auipc	ra,0x1
    80001a6c:	b80080e7          	jalr	-1152(ra) # 800025e8 <_Znwm>
    80001a70:	00050913          	mv	s2,a0
    80001a74:	00100593          	li	a1,1
    80001a78:	00001097          	auipc	ra,0x1
    80001a7c:	e84080e7          	jalr	-380(ra) # 800028fc <_ZN9SemaphoreC1Ej>
    80001a80:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80001a84:	01000513          	li	a0,16
    80001a88:	00001097          	auipc	ra,0x1
    80001a8c:	b60080e7          	jalr	-1184(ra) # 800025e8 <_Znwm>
    80001a90:	00050913          	mv	s2,a0
    80001a94:	00100593          	li	a1,1
    80001a98:	00001097          	auipc	ra,0x1
    80001a9c:	e64080e7          	jalr	-412(ra) # 800028fc <_ZN9SemaphoreC1Ej>
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
    80001acc:	b70080e7          	jalr	-1168(ra) # 80002638 <_ZdlPv>
    80001ad0:	00048513          	mv	a0,s1
    80001ad4:	00007097          	auipc	ra,0x7
    80001ad8:	874080e7          	jalr	-1932(ra) # 80008348 <_Unwind_Resume>
    80001adc:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80001ae0:	00098513          	mv	a0,s3
    80001ae4:	00001097          	auipc	ra,0x1
    80001ae8:	b54080e7          	jalr	-1196(ra) # 80002638 <_ZdlPv>
    80001aec:	00048513          	mv	a0,s1
    80001af0:	00007097          	auipc	ra,0x7
    80001af4:	858080e7          	jalr	-1960(ra) # 80008348 <_Unwind_Resume>
    80001af8:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80001afc:	00090513          	mv	a0,s2
    80001b00:	00001097          	auipc	ra,0x1
    80001b04:	b38080e7          	jalr	-1224(ra) # 80002638 <_ZdlPv>
    80001b08:	00048513          	mv	a0,s1
    80001b0c:	00007097          	auipc	ra,0x7
    80001b10:	83c080e7          	jalr	-1988(ra) # 80008348 <_Unwind_Resume>
    80001b14:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80001b18:	00090513          	mv	a0,s2
    80001b1c:	00001097          	auipc	ra,0x1
    80001b20:	b1c080e7          	jalr	-1252(ra) # 80002638 <_ZdlPv>
    80001b24:	00048513          	mv	a0,s1
    80001b28:	00007097          	auipc	ra,0x7
    80001b2c:	820080e7          	jalr	-2016(ra) # 80008348 <_Unwind_Resume>

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
    80001b58:	d48080e7          	jalr	-696(ra) # 8000289c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80001b5c:	0304b503          	ld	a0,48(s1)
    80001b60:	00001097          	auipc	ra,0x1
    80001b64:	d3c080e7          	jalr	-708(ra) # 8000289c <_ZN9Semaphore4waitEv>
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
    80001b98:	d38080e7          	jalr	-712(ra) # 800028cc <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80001b9c:	0204b503          	ld	a0,32(s1)
    80001ba0:	00001097          	auipc	ra,0x1
    80001ba4:	d2c080e7          	jalr	-724(ra) # 800028cc <_ZN9Semaphore6signalEv>

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
    80001be4:	cbc080e7          	jalr	-836(ra) # 8000289c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80001be8:	0284b503          	ld	a0,40(s1)
    80001bec:	00001097          	auipc	ra,0x1
    80001bf0:	cb0080e7          	jalr	-848(ra) # 8000289c <_ZN9Semaphore4waitEv>

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
    80001c20:	cb0080e7          	jalr	-848(ra) # 800028cc <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80001c24:	0184b503          	ld	a0,24(s1)
    80001c28:	00001097          	auipc	ra,0x1
    80001c2c:	ca4080e7          	jalr	-860(ra) # 800028cc <_ZN9Semaphore6signalEv>

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
    80001c70:	c30080e7          	jalr	-976(ra) # 8000289c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80001c74:	0304b503          	ld	a0,48(s1)
    80001c78:	00001097          	auipc	ra,0x1
    80001c7c:	c24080e7          	jalr	-988(ra) # 8000289c <_ZN9Semaphore4waitEv>

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
    80001c98:	c38080e7          	jalr	-968(ra) # 800028cc <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80001c9c:	0284b503          	ld	a0,40(s1)
    80001ca0:	00001097          	auipc	ra,0x1
    80001ca4:	c2c080e7          	jalr	-980(ra) # 800028cc <_ZN9Semaphore6signalEv>

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
    80001cf4:	c80080e7          	jalr	-896(ra) # 80002970 <_ZN7Console4putcEc>
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
    80001d30:	c44080e7          	jalr	-956(ra) # 80002970 <_ZN7Console4putcEc>
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
    80001d54:	c20080e7          	jalr	-992(ra) # 80002970 <_ZN7Console4putcEc>
    Console::putc('\n');
    80001d58:	00a00513          	li	a0,10
    80001d5c:	00001097          	auipc	ra,0x1
    80001d60:	c14080e7          	jalr	-1004(ra) # 80002970 <_ZN7Console4putcEc>
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

0000000080001dd4 <_Z16producerKeyboardPv>:
    sem_t wait;
};

volatile int threadEnd = 0;

void producerKeyboard(void *arg) {
    80001dd4:	fe010113          	addi	sp,sp,-32
    80001dd8:	00113c23          	sd	ra,24(sp)
    80001ddc:	00813823          	sd	s0,16(sp)
    80001de0:	00913423          	sd	s1,8(sp)
    80001de4:	01213023          	sd	s2,0(sp)
    80001de8:	02010413          	addi	s0,sp,32
    80001dec:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80001df0:	00000913          	li	s2,0
    80001df4:	00c0006f          	j	80001e00 <_Z16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80001df8:	fffff097          	auipc	ra,0xfffff
    80001dfc:	524080e7          	jalr	1316(ra) # 8000131c <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80001e00:	fffff097          	auipc	ra,0xfffff
    80001e04:	608080e7          	jalr	1544(ra) # 80001408 <_Z4getcv>
    80001e08:	0005059b          	sext.w	a1,a0
    80001e0c:	01b00793          	li	a5,27
    80001e10:	02f58a63          	beq	a1,a5,80001e44 <_Z16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80001e14:	0084b503          	ld	a0,8(s1)
    80001e18:	00001097          	auipc	ra,0x1
    80001e1c:	2bc080e7          	jalr	700(ra) # 800030d4 <_ZN6Buffer3putEi>
        i++;
    80001e20:	0019071b          	addiw	a4,s2,1
    80001e24:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80001e28:	0004a683          	lw	a3,0(s1)
    80001e2c:	0026979b          	slliw	a5,a3,0x2
    80001e30:	00d787bb          	addw	a5,a5,a3
    80001e34:	0017979b          	slliw	a5,a5,0x1
    80001e38:	02f767bb          	remw	a5,a4,a5
    80001e3c:	fc0792e3          	bnez	a5,80001e00 <_Z16producerKeyboardPv+0x2c>
    80001e40:	fb9ff06f          	j	80001df8 <_Z16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80001e44:	00100793          	li	a5,1
    80001e48:	00005717          	auipc	a4,0x5
    80001e4c:	3ef72823          	sw	a5,1008(a4) # 80007238 <threadEnd>
    data->buffer->put('!');
    80001e50:	02100593          	li	a1,33
    80001e54:	0084b503          	ld	a0,8(s1)
    80001e58:	00001097          	auipc	ra,0x1
    80001e5c:	27c080e7          	jalr	636(ra) # 800030d4 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80001e60:	0104b503          	ld	a0,16(s1)
    80001e64:	fffff097          	auipc	ra,0xfffff
    80001e68:	574080e7          	jalr	1396(ra) # 800013d8 <_Z10sem_signalP9KernelSem>
}
    80001e6c:	01813083          	ld	ra,24(sp)
    80001e70:	01013403          	ld	s0,16(sp)
    80001e74:	00813483          	ld	s1,8(sp)
    80001e78:	00013903          	ld	s2,0(sp)
    80001e7c:	02010113          	addi	sp,sp,32
    80001e80:	00008067          	ret

0000000080001e84 <_Z8producerPv>:

void producer(void *arg) {
    80001e84:	fe010113          	addi	sp,sp,-32
    80001e88:	00113c23          	sd	ra,24(sp)
    80001e8c:	00813823          	sd	s0,16(sp)
    80001e90:	00913423          	sd	s1,8(sp)
    80001e94:	01213023          	sd	s2,0(sp)
    80001e98:	02010413          	addi	s0,sp,32
    80001e9c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80001ea0:	00000913          	li	s2,0
    80001ea4:	00c0006f          	j	80001eb0 <_Z8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80001ea8:	fffff097          	auipc	ra,0xfffff
    80001eac:	474080e7          	jalr	1140(ra) # 8000131c <_Z15thread_dispatchv>
    while (!threadEnd) {
    80001eb0:	00005797          	auipc	a5,0x5
    80001eb4:	3887a783          	lw	a5,904(a5) # 80007238 <threadEnd>
    80001eb8:	02079e63          	bnez	a5,80001ef4 <_Z8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80001ebc:	0004a583          	lw	a1,0(s1)
    80001ec0:	0305859b          	addiw	a1,a1,48
    80001ec4:	0084b503          	ld	a0,8(s1)
    80001ec8:	00001097          	auipc	ra,0x1
    80001ecc:	20c080e7          	jalr	524(ra) # 800030d4 <_ZN6Buffer3putEi>
        i++;
    80001ed0:	0019071b          	addiw	a4,s2,1
    80001ed4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80001ed8:	0004a683          	lw	a3,0(s1)
    80001edc:	0026979b          	slliw	a5,a3,0x2
    80001ee0:	00d787bb          	addw	a5,a5,a3
    80001ee4:	0017979b          	slliw	a5,a5,0x1
    80001ee8:	02f767bb          	remw	a5,a4,a5
    80001eec:	fc0792e3          	bnez	a5,80001eb0 <_Z8producerPv+0x2c>
    80001ef0:	fb9ff06f          	j	80001ea8 <_Z8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80001ef4:	0104b503          	ld	a0,16(s1)
    80001ef8:	fffff097          	auipc	ra,0xfffff
    80001efc:	4e0080e7          	jalr	1248(ra) # 800013d8 <_Z10sem_signalP9KernelSem>
}
    80001f00:	01813083          	ld	ra,24(sp)
    80001f04:	01013403          	ld	s0,16(sp)
    80001f08:	00813483          	ld	s1,8(sp)
    80001f0c:	00013903          	ld	s2,0(sp)
    80001f10:	02010113          	addi	sp,sp,32
    80001f14:	00008067          	ret

0000000080001f18 <_Z8consumerPv>:

void consumer(void *arg) {
    80001f18:	fd010113          	addi	sp,sp,-48
    80001f1c:	02113423          	sd	ra,40(sp)
    80001f20:	02813023          	sd	s0,32(sp)
    80001f24:	00913c23          	sd	s1,24(sp)
    80001f28:	01213823          	sd	s2,16(sp)
    80001f2c:	01313423          	sd	s3,8(sp)
    80001f30:	03010413          	addi	s0,sp,48
    80001f34:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80001f38:	00000993          	li	s3,0
    80001f3c:	01c0006f          	j	80001f58 <_Z8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80001f40:	fffff097          	auipc	ra,0xfffff
    80001f44:	3dc080e7          	jalr	988(ra) # 8000131c <_Z15thread_dispatchv>
    80001f48:	0500006f          	j	80001f98 <_Z8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80001f4c:	00a00513          	li	a0,10
    80001f50:	fffff097          	auipc	ra,0xfffff
    80001f54:	4e4080e7          	jalr	1252(ra) # 80001434 <_Z4putcc>
    while (!threadEnd) {
    80001f58:	00005797          	auipc	a5,0x5
    80001f5c:	2e07a783          	lw	a5,736(a5) # 80007238 <threadEnd>
    80001f60:	06079063          	bnez	a5,80001fc0 <_Z8consumerPv+0xa8>
        int key = data->buffer->get();
    80001f64:	00893503          	ld	a0,8(s2)
    80001f68:	00001097          	auipc	ra,0x1
    80001f6c:	1fc080e7          	jalr	508(ra) # 80003164 <_ZN6Buffer3getEv>
        i++;
    80001f70:	0019849b          	addiw	s1,s3,1
    80001f74:	0004899b          	sext.w	s3,s1
        putc(key);
    80001f78:	0ff57513          	andi	a0,a0,255
    80001f7c:	fffff097          	auipc	ra,0xfffff
    80001f80:	4b8080e7          	jalr	1208(ra) # 80001434 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80001f84:	00092703          	lw	a4,0(s2)
    80001f88:	0027179b          	slliw	a5,a4,0x2
    80001f8c:	00e787bb          	addw	a5,a5,a4
    80001f90:	02f4e7bb          	remw	a5,s1,a5
    80001f94:	fa0786e3          	beqz	a5,80001f40 <_Z8consumerPv+0x28>
        if (i % 80 == 0) {
    80001f98:	05000793          	li	a5,80
    80001f9c:	02f4e4bb          	remw	s1,s1,a5
    80001fa0:	fa049ce3          	bnez	s1,80001f58 <_Z8consumerPv+0x40>
    80001fa4:	fa9ff06f          	j	80001f4c <_Z8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80001fa8:	00893503          	ld	a0,8(s2)
    80001fac:	00001097          	auipc	ra,0x1
    80001fb0:	1b8080e7          	jalr	440(ra) # 80003164 <_ZN6Buffer3getEv>
        putc(key);
    80001fb4:	0ff57513          	andi	a0,a0,255
    80001fb8:	fffff097          	auipc	ra,0xfffff
    80001fbc:	47c080e7          	jalr	1148(ra) # 80001434 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80001fc0:	00893503          	ld	a0,8(s2)
    80001fc4:	00001097          	auipc	ra,0x1
    80001fc8:	22c080e7          	jalr	556(ra) # 800031f0 <_ZN6Buffer6getCntEv>
    80001fcc:	fca04ee3          	bgtz	a0,80001fa8 <_Z8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80001fd0:	01093503          	ld	a0,16(s2)
    80001fd4:	fffff097          	auipc	ra,0xfffff
    80001fd8:	404080e7          	jalr	1028(ra) # 800013d8 <_Z10sem_signalP9KernelSem>
}
    80001fdc:	02813083          	ld	ra,40(sp)
    80001fe0:	02013403          	ld	s0,32(sp)
    80001fe4:	01813483          	ld	s1,24(sp)
    80001fe8:	01013903          	ld	s2,16(sp)
    80001fec:	00813983          	ld	s3,8(sp)
    80001ff0:	03010113          	addi	sp,sp,48
    80001ff4:	00008067          	ret

0000000080001ff8 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80001ff8:	f9010113          	addi	sp,sp,-112
    80001ffc:	06113423          	sd	ra,104(sp)
    80002000:	06813023          	sd	s0,96(sp)
    80002004:	04913c23          	sd	s1,88(sp)
    80002008:	05213823          	sd	s2,80(sp)
    8000200c:	05313423          	sd	s3,72(sp)
    80002010:	05413023          	sd	s4,64(sp)
    80002014:	03513c23          	sd	s5,56(sp)
    80002018:	03613823          	sd	s6,48(sp)
    8000201c:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80002020:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80002024:	00004517          	auipc	a0,0x4
    80002028:	01450513          	addi	a0,a0,20 # 80006038 <CONSOLE_STATUS+0x28>
    8000202c:	fffff097          	auipc	ra,0xfffff
    80002030:	704080e7          	jalr	1796(ra) # 80001730 <_Z11printStringPKc>
    getString(input, 30);
    80002034:	01e00593          	li	a1,30
    80002038:	fa040493          	addi	s1,s0,-96
    8000203c:	00048513          	mv	a0,s1
    80002040:	fffff097          	auipc	ra,0xfffff
    80002044:	76c080e7          	jalr	1900(ra) # 800017ac <_Z9getStringPci>
    threadNum = stringToInt(input);
    80002048:	00048513          	mv	a0,s1
    8000204c:	00000097          	auipc	ra,0x0
    80002050:	82c080e7          	jalr	-2004(ra) # 80001878 <_Z11stringToIntPKc>
    80002054:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80002058:	00004517          	auipc	a0,0x4
    8000205c:	00050513          	mv	a0,a0
    80002060:	fffff097          	auipc	ra,0xfffff
    80002064:	6d0080e7          	jalr	1744(ra) # 80001730 <_Z11printStringPKc>
    getString(input, 30);
    80002068:	01e00593          	li	a1,30
    8000206c:	00048513          	mv	a0,s1
    80002070:	fffff097          	auipc	ra,0xfffff
    80002074:	73c080e7          	jalr	1852(ra) # 800017ac <_Z9getStringPci>
    n = stringToInt(input);
    80002078:	00048513          	mv	a0,s1
    8000207c:	fffff097          	auipc	ra,0xfffff
    80002080:	7fc080e7          	jalr	2044(ra) # 80001878 <_Z11stringToIntPKc>
    80002084:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80002088:	00004517          	auipc	a0,0x4
    8000208c:	ff050513          	addi	a0,a0,-16 # 80006078 <CONSOLE_STATUS+0x68>
    80002090:	fffff097          	auipc	ra,0xfffff
    80002094:	6a0080e7          	jalr	1696(ra) # 80001730 <_Z11printStringPKc>
    80002098:	00000613          	li	a2,0
    8000209c:	00a00593          	li	a1,10
    800020a0:	00090513          	mv	a0,s2
    800020a4:	00000097          	auipc	ra,0x0
    800020a8:	824080e7          	jalr	-2012(ra) # 800018c8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800020ac:	00004517          	auipc	a0,0x4
    800020b0:	fe450513          	addi	a0,a0,-28 # 80006090 <CONSOLE_STATUS+0x80>
    800020b4:	fffff097          	auipc	ra,0xfffff
    800020b8:	67c080e7          	jalr	1660(ra) # 80001730 <_Z11printStringPKc>
    800020bc:	00000613          	li	a2,0
    800020c0:	00a00593          	li	a1,10
    800020c4:	00048513          	mv	a0,s1
    800020c8:	00000097          	auipc	ra,0x0
    800020cc:	800080e7          	jalr	-2048(ra) # 800018c8 <_Z8printIntiii>
    printString(".\n");
    800020d0:	00004517          	auipc	a0,0x4
    800020d4:	fd850513          	addi	a0,a0,-40 # 800060a8 <CONSOLE_STATUS+0x98>
    800020d8:	fffff097          	auipc	ra,0xfffff
    800020dc:	658080e7          	jalr	1624(ra) # 80001730 <_Z11printStringPKc>
    if(threadNum > n) {
    800020e0:	0324c463          	blt	s1,s2,80002108 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    800020e4:	03205c63          	blez	s2,8000211c <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    800020e8:	03800513          	li	a0,56
    800020ec:	00000097          	auipc	ra,0x0
    800020f0:	4fc080e7          	jalr	1276(ra) # 800025e8 <_Znwm>
    800020f4:	00050a13          	mv	s4,a0
    800020f8:	00048593          	mv	a1,s1
    800020fc:	00001097          	auipc	ra,0x1
    80002100:	f3c080e7          	jalr	-196(ra) # 80003038 <_ZN6BufferC1Ei>
    80002104:	0300006f          	j	80002134 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80002108:	00004517          	auipc	a0,0x4
    8000210c:	fa850513          	addi	a0,a0,-88 # 800060b0 <CONSOLE_STATUS+0xa0>
    80002110:	fffff097          	auipc	ra,0xfffff
    80002114:	620080e7          	jalr	1568(ra) # 80001730 <_Z11printStringPKc>
        return;
    80002118:	0140006f          	j	8000212c <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000211c:	00004517          	auipc	a0,0x4
    80002120:	fd450513          	addi	a0,a0,-44 # 800060f0 <CONSOLE_STATUS+0xe0>
    80002124:	fffff097          	auipc	ra,0xfffff
    80002128:	60c080e7          	jalr	1548(ra) # 80001730 <_Z11printStringPKc>
        return;
    8000212c:	000b0113          	mv	sp,s6
    80002130:	1500006f          	j	80002280 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002134:	00000593          	li	a1,0
    80002138:	00005517          	auipc	a0,0x5
    8000213c:	10850513          	addi	a0,a0,264 # 80007240 <waitForAll>
    80002140:	fffff097          	auipc	ra,0xfffff
    80002144:	200080e7          	jalr	512(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    thread_t threads[threadNum];
    80002148:	00391793          	slli	a5,s2,0x3
    8000214c:	00f78793          	addi	a5,a5,15
    80002150:	ff07f793          	andi	a5,a5,-16
    80002154:	40f10133          	sub	sp,sp,a5
    80002158:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    8000215c:	0019071b          	addiw	a4,s2,1
    80002160:	00171793          	slli	a5,a4,0x1
    80002164:	00e787b3          	add	a5,a5,a4
    80002168:	00379793          	slli	a5,a5,0x3
    8000216c:	00f78793          	addi	a5,a5,15
    80002170:	ff07f793          	andi	a5,a5,-16
    80002174:	40f10133          	sub	sp,sp,a5
    80002178:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    8000217c:	00191613          	slli	a2,s2,0x1
    80002180:	012607b3          	add	a5,a2,s2
    80002184:	00379793          	slli	a5,a5,0x3
    80002188:	00f987b3          	add	a5,s3,a5
    8000218c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80002190:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80002194:	00005717          	auipc	a4,0x5
    80002198:	0ac73703          	ld	a4,172(a4) # 80007240 <waitForAll>
    8000219c:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800021a0:	00078613          	mv	a2,a5
    800021a4:	00000597          	auipc	a1,0x0
    800021a8:	d7458593          	addi	a1,a1,-652 # 80001f18 <_Z8consumerPv>
    800021ac:	f9840513          	addi	a0,s0,-104
    800021b0:	fffff097          	auipc	ra,0xfffff
    800021b4:	104080e7          	jalr	260(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800021b8:	00000493          	li	s1,0
    800021bc:	0280006f          	j	800021e4 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800021c0:	00000597          	auipc	a1,0x0
    800021c4:	c1458593          	addi	a1,a1,-1004 # 80001dd4 <_Z16producerKeyboardPv>
                      data + i);
    800021c8:	00179613          	slli	a2,a5,0x1
    800021cc:	00f60633          	add	a2,a2,a5
    800021d0:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800021d4:	00c98633          	add	a2,s3,a2
    800021d8:	fffff097          	auipc	ra,0xfffff
    800021dc:	0dc080e7          	jalr	220(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800021e0:	0014849b          	addiw	s1,s1,1
    800021e4:	0524d263          	bge	s1,s2,80002228 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800021e8:	00149793          	slli	a5,s1,0x1
    800021ec:	009787b3          	add	a5,a5,s1
    800021f0:	00379793          	slli	a5,a5,0x3
    800021f4:	00f987b3          	add	a5,s3,a5
    800021f8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800021fc:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80002200:	00005717          	auipc	a4,0x5
    80002204:	04073703          	ld	a4,64(a4) # 80007240 <waitForAll>
    80002208:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    8000220c:	00048793          	mv	a5,s1
    80002210:	00349513          	slli	a0,s1,0x3
    80002214:	00aa8533          	add	a0,s5,a0
    80002218:	fa9054e3          	blez	s1,800021c0 <_Z22producerConsumer_C_APIv+0x1c8>
    8000221c:	00000597          	auipc	a1,0x0
    80002220:	c6858593          	addi	a1,a1,-920 # 80001e84 <_Z8producerPv>
    80002224:	fa5ff06f          	j	800021c8 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80002228:	fffff097          	auipc	ra,0xfffff
    8000222c:	0f4080e7          	jalr	244(ra) # 8000131c <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80002230:	00000493          	li	s1,0
    80002234:	00994e63          	blt	s2,s1,80002250 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80002238:	00005517          	auipc	a0,0x5
    8000223c:	00853503          	ld	a0,8(a0) # 80007240 <waitForAll>
    80002240:	fffff097          	auipc	ra,0xfffff
    80002244:	168080e7          	jalr	360(ra) # 800013a8 <_Z8sem_waitP9KernelSem>
    for (int i = 0; i <= threadNum; i++) {
    80002248:	0014849b          	addiw	s1,s1,1
    8000224c:	fe9ff06f          	j	80002234 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80002250:	00005517          	auipc	a0,0x5
    80002254:	ff053503          	ld	a0,-16(a0) # 80007240 <waitForAll>
    80002258:	fffff097          	auipc	ra,0xfffff
    8000225c:	120080e7          	jalr	288(ra) # 80001378 <_Z9sem_closeP9KernelSem>
    delete buffer;
    80002260:	000a0e63          	beqz	s4,8000227c <_Z22producerConsumer_C_APIv+0x284>
    80002264:	000a0513          	mv	a0,s4
    80002268:	00001097          	auipc	ra,0x1
    8000226c:	010080e7          	jalr	16(ra) # 80003278 <_ZN6BufferD1Ev>
    80002270:	000a0513          	mv	a0,s4
    80002274:	00000097          	auipc	ra,0x0
    80002278:	3c4080e7          	jalr	964(ra) # 80002638 <_ZdlPv>
    8000227c:	000b0113          	mv	sp,s6

}
    80002280:	f9040113          	addi	sp,s0,-112
    80002284:	06813083          	ld	ra,104(sp)
    80002288:	06013403          	ld	s0,96(sp)
    8000228c:	05813483          	ld	s1,88(sp)
    80002290:	05013903          	ld	s2,80(sp)
    80002294:	04813983          	ld	s3,72(sp)
    80002298:	04013a03          	ld	s4,64(sp)
    8000229c:	03813a83          	ld	s5,56(sp)
    800022a0:	03013b03          	ld	s6,48(sp)
    800022a4:	07010113          	addi	sp,sp,112
    800022a8:	00008067          	ret
    800022ac:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800022b0:	000a0513          	mv	a0,s4
    800022b4:	00000097          	auipc	ra,0x0
    800022b8:	384080e7          	jalr	900(ra) # 80002638 <_ZdlPv>
    800022bc:	00048513          	mv	a0,s1
    800022c0:	00006097          	auipc	ra,0x6
    800022c4:	088080e7          	jalr	136(ra) # 80008348 <_Unwind_Resume>

00000000800022c8 <_Z8userMainv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../h/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    800022c8:	ff010113          	addi	sp,sp,-16
    800022cc:	00113423          	sd	ra,8(sp)
    800022d0:	00813023          	sd	s0,0(sp)
    800022d4:	01010413          	addi	s0,sp,16
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    //Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

    producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    800022d8:	00000097          	auipc	ra,0x0
    800022dc:	d20080e7          	jalr	-736(ra) # 80001ff8 <_Z22producerConsumer_C_APIv>
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    800022e0:	00813083          	ld	ra,8(sp)
    800022e4:	00013403          	ld	s0,0(sp)
    800022e8:	01010113          	addi	sp,sp,16
    800022ec:	00008067          	ret

00000000800022f0 <main>:
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/UserMain.hpp"


int main() {
    800022f0:	ff010113          	addi	sp,sp,-16
    800022f4:	00113423          	sd	ra,8(sp)
    800022f8:	00813023          	sd	s0,0(sp)
    800022fc:	01010413          	addi	s0,sp,16
    MemoryAllocator::memAlloc();
    80002300:	00001097          	auipc	ra,0x1
    80002304:	abc080e7          	jalr	-1348(ra) # 80002dbc <_ZN15MemoryAllocator8memAllocEv>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    80002308:	00005797          	auipc	a5,0x5
    8000230c:	eb07b783          	ld	a5,-336(a5) # 800071b8 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80002310:	10579073          	csrw	stvec,a5

   userMain();
    80002314:	00000097          	auipc	ra,0x0
    80002318:	fb4080e7          	jalr	-76(ra) # 800022c8 <_Z8userMainv>
inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    8000231c:	00200793          	li	a5,2
    80002320:	1007a073          	csrs	sstatus,a5

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    printString("Finished\n");
    80002324:	00004517          	auipc	a0,0x4
    80002328:	dfc50513          	addi	a0,a0,-516 # 80006120 <CONSOLE_STATUS+0x110>
    8000232c:	fffff097          	auipc	ra,0xfffff
    80002330:	404080e7          	jalr	1028(ra) # 80001730 <_Z11printStringPKc>
    return 0;
    80002334:	00000513          	li	a0,0
    80002338:	00813083          	ld	ra,8(sp)
    8000233c:	00013403          	ld	s0,0(sp)
    80002340:	01010113          	addi	sp,sp,16
    80002344:	00008067          	ret

0000000080002348 <_ZN3TCB13threadWrapperEv>:
    running = Scheduler::get();
    Riscv::w_sstatus(sstatus);
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper() {
    80002348:	ff010113          	addi	sp,sp,-16
    8000234c:	00113423          	sd	ra,8(sp)
    80002350:	00813023          	sd	s0,0(sp)
    80002354:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie();
    80002358:	00000097          	auipc	ra,0x0
    8000235c:	658080e7          	jalr	1624(ra) # 800029b0 <_ZN5Riscv10popSppSpieEv>
    if(running->myThread != nullptr){
    80002360:	00005797          	auipc	a5,0x5
    80002364:	ee87b783          	ld	a5,-280(a5) # 80007248 <_ZN3TCB7runningE>
    80002368:	0307b503          	ld	a0,48(a5)
    8000236c:	00050863          	beqz	a0,8000237c <_ZN3TCB13threadWrapperEv+0x34>
        running->myThread->run();
    80002370:	00053783          	ld	a5,0(a0)
    80002374:	0107b783          	ld	a5,16(a5)
    80002378:	000780e7          	jalr	a5
    }
    thread_exit();
    8000237c:	fffff097          	auipc	ra,0xfffff
    80002380:	f78080e7          	jalr	-136(ra) # 800012f4 <_Z11thread_exitv>
    /*running->body();
    running->setFinished(true);
    TCB::yield();*/

}
    80002384:	00813083          	ld	ra,8(sp)
    80002388:	00013403          	ld	s0,0(sp)
    8000238c:	01010113          	addi	sp,sp,16
    80002390:	00008067          	ret

0000000080002394 <_ZN3TCBC1EPFvvEm>:
TCB::TCB(Body body, uint64 timeSlice) : body(body),
    80002394:	fd010113          	addi	sp,sp,-48
    80002398:	02113423          	sd	ra,40(sp)
    8000239c:	02813023          	sd	s0,32(sp)
    800023a0:	00913c23          	sd	s1,24(sp)
    800023a4:	01213823          	sd	s2,16(sp)
    800023a8:	01313423          	sd	s3,8(sp)
    800023ac:	03010413          	addi	s0,sp,48
    800023b0:	00050493          	mv	s1,a0
    800023b4:	00058913          	mv	s2,a1
    800023b8:	00060993          	mv	s3,a2
finished(false), blocked(false) {
    800023bc:	00b53023          	sd	a1,0(a0)
stack(new uint64[STACK_SIZE]),
    800023c0:	00002537          	lui	a0,0x2
    800023c4:	00000097          	auipc	ra,0x0
    800023c8:	24c080e7          	jalr	588(ra) # 80002610 <_Znam>
finished(false), blocked(false) {
    800023cc:	00a4b423          	sd	a0,8(s1)
    800023d0:	00000797          	auipc	a5,0x0
    800023d4:	f7878793          	addi	a5,a5,-136 # 80002348 <_ZN3TCB13threadWrapperEv>
    800023d8:	00f4b823          	sd	a5,16(s1)
         (uint64) &stack[STACK_SIZE]}),
    800023dc:	000027b7          	lui	a5,0x2
    800023e0:	00f50533          	add	a0,a0,a5
finished(false), blocked(false) {
    800023e4:	00a4bc23          	sd	a0,24(s1)
    800023e8:	0334b023          	sd	s3,32(s1)
    800023ec:	02048423          	sb	zero,40(s1)
    800023f0:	020484a3          	sb	zero,41(s1)
    if (body != nullptr) { Scheduler::put(this); }
    800023f4:	00090863          	beqz	s2,80002404 <_ZN3TCBC1EPFvvEm+0x70>
    800023f8:	00048513          	mv	a0,s1
    800023fc:	00001097          	auipc	ra,0x1
    80002400:	920080e7          	jalr	-1760(ra) # 80002d1c <_ZN9Scheduler3putEP3TCB>
    myThread = nullptr;
    80002404:	0204b823          	sd	zero,48(s1)
}
    80002408:	02813083          	ld	ra,40(sp)
    8000240c:	02013403          	ld	s0,32(sp)
    80002410:	01813483          	ld	s1,24(sp)
    80002414:	01013903          	ld	s2,16(sp)
    80002418:	00813983          	ld	s3,8(sp)
    8000241c:	03010113          	addi	sp,sp,48
    80002420:	00008067          	ret

0000000080002424 <_ZN3TCB12createThreadEPFvvE>:
TCB *TCB::createThread(Body body) {
    80002424:	fe010113          	addi	sp,sp,-32
    80002428:	00113c23          	sd	ra,24(sp)
    8000242c:	00813823          	sd	s0,16(sp)
    80002430:	00913423          	sd	s1,8(sp)
    80002434:	01213023          	sd	s2,0(sp)
    80002438:	02010413          	addi	s0,sp,32
    8000243c:	00050913          	mv	s2,a0
    return new TCB(body, TIME_SLICE);
    80002440:	03800513          	li	a0,56
    80002444:	00000097          	auipc	ra,0x0
    80002448:	1a4080e7          	jalr	420(ra) # 800025e8 <_Znwm>
    8000244c:	00050493          	mv	s1,a0
    80002450:	00200613          	li	a2,2
    80002454:	00090593          	mv	a1,s2
    80002458:	00000097          	auipc	ra,0x0
    8000245c:	f3c080e7          	jalr	-196(ra) # 80002394 <_ZN3TCBC1EPFvvEm>
    80002460:	0200006f          	j	80002480 <_ZN3TCB12createThreadEPFvvE+0x5c>
    80002464:	00050913          	mv	s2,a0
    80002468:	00048513          	mv	a0,s1
    8000246c:	00000097          	auipc	ra,0x0
    80002470:	1cc080e7          	jalr	460(ra) # 80002638 <_ZdlPv>
    80002474:	00090513          	mv	a0,s2
    80002478:	00006097          	auipc	ra,0x6
    8000247c:	ed0080e7          	jalr	-304(ra) # 80008348 <_Unwind_Resume>
}
    80002480:	00048513          	mv	a0,s1
    80002484:	01813083          	ld	ra,24(sp)
    80002488:	01013403          	ld	s0,16(sp)
    8000248c:	00813483          	ld	s1,8(sp)
    80002490:	00013903          	ld	s2,0(sp)
    80002494:	02010113          	addi	sp,sp,32
    80002498:	00008067          	ret

000000008000249c <_ZN3TCB5yieldEv>:
void TCB::yield() { __asm__ volatile ("ecall"); }
    8000249c:	ff010113          	addi	sp,sp,-16
    800024a0:	00813423          	sd	s0,8(sp)
    800024a4:	01010413          	addi	s0,sp,16
    800024a8:	00000073          	ecall
    800024ac:	00813403          	ld	s0,8(sp)
    800024b0:	01010113          	addi	sp,sp,16
    800024b4:	00008067          	ret

00000000800024b8 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800024b8:	fd010113          	addi	sp,sp,-48
    800024bc:	02113423          	sd	ra,40(sp)
    800024c0:	02813023          	sd	s0,32(sp)
    800024c4:	00913c23          	sd	s1,24(sp)
    800024c8:	01213823          	sd	s2,16(sp)
    800024cc:	03010413          	addi	s0,sp,48
    TCB *old = running;
    800024d0:	00005497          	auipc	s1,0x5
    800024d4:	d784b483          	ld	s1,-648(s1) # 80007248 <_ZN3TCB7runningE>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800024d8:	100027f3          	csrr	a5,sstatus
    800024dc:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800024e0:	fd843903          	ld	s2,-40(s0)
        bool isBlocked() const { return blocked; }
    800024e4:	0294c783          	lbu	a5,41(s1)
    if (!old->isBlocked() && !old->isFinished()) { Scheduler::put(old); }
    800024e8:	00079663          	bnez	a5,800024f4 <_ZN3TCB8dispatchEv+0x3c>
        bool isFinished() const { return finished; }
    800024ec:	0284c783          	lbu	a5,40(s1)
    800024f0:	04078063          	beqz	a5,80002530 <_ZN3TCB8dispatchEv+0x78>
    running = Scheduler::get();
    800024f4:	00000097          	auipc	ra,0x0
    800024f8:	7c0080e7          	jalr	1984(ra) # 80002cb4 <_ZN9Scheduler3getEv>
    800024fc:	00005797          	auipc	a5,0x5
    80002500:	d4a7b623          	sd	a0,-692(a5) # 80007248 <_ZN3TCB7runningE>
}
inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002504:	10091073          	csrw	sstatus,s2
    TCB::contextSwitch(&old->context, &running->context);
    80002508:	01050593          	addi	a1,a0,16 # 2010 <_entry-0x7fffdff0>
    8000250c:	01048513          	addi	a0,s1,16
    80002510:	fffff097          	auipc	ra,0xfffff
    80002514:	d30080e7          	jalr	-720(ra) # 80001240 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002518:	02813083          	ld	ra,40(sp)
    8000251c:	02013403          	ld	s0,32(sp)
    80002520:	01813483          	ld	s1,24(sp)
    80002524:	01013903          	ld	s2,16(sp)
    80002528:	03010113          	addi	sp,sp,48
    8000252c:	00008067          	ret
    if (!old->isBlocked() && !old->isFinished()) { Scheduler::put(old); }
    80002530:	00048513          	mv	a0,s1
    80002534:	00000097          	auipc	ra,0x0
    80002538:	7e8080e7          	jalr	2024(ra) # 80002d1c <_ZN9Scheduler3putEP3TCB>
    8000253c:	fb9ff06f          	j	800024f4 <_ZN3TCB8dispatchEv+0x3c>

0000000080002540 <_ZN3TCB9checkBodyEv>:

bool TCB::checkBody() {
    80002540:	ff010113          	addi	sp,sp,-16
    80002544:	00113423          	sd	ra,8(sp)
    80002548:	00813023          	sd	s0,0(sp)
    8000254c:	01010413          	addi	s0,sp,16
    if(this->body != nullptr){
    80002550:	00053783          	ld	a5,0(a0)
    80002554:	02078463          	beqz	a5,8000257c <_ZN3TCB9checkBodyEv+0x3c>
        printString("Imam body.\n");
    80002558:	00004517          	auipc	a0,0x4
    8000255c:	bd850513          	addi	a0,a0,-1064 # 80006130 <CONSOLE_STATUS+0x120>
    80002560:	fffff097          	auipc	ra,0xfffff
    80002564:	1d0080e7          	jalr	464(ra) # 80001730 <_Z11printStringPKc>
        return true;
    80002568:	00100513          	li	a0,1
    }else{
        printString("Nemam body.\n");
        return false;
    }
}
    8000256c:	00813083          	ld	ra,8(sp)
    80002570:	00013403          	ld	s0,0(sp)
    80002574:	01010113          	addi	sp,sp,16
    80002578:	00008067          	ret
        printString("Nemam body.\n");
    8000257c:	00004517          	auipc	a0,0x4
    80002580:	bc450513          	addi	a0,a0,-1084 # 80006140 <CONSOLE_STATUS+0x130>
    80002584:	fffff097          	auipc	ra,0xfffff
    80002588:	1ac080e7          	jalr	428(ra) # 80001730 <_Z11printStringPKc>
        return false;
    8000258c:	00000513          	li	a0,0
    80002590:	fddff06f          	j	8000256c <_ZN3TCB9checkBodyEv+0x2c>

0000000080002594 <_ZN3TCB7setBodyEPFvvE>:

void TCB::setBody(TCB::Body body) {
    80002594:	ff010113          	addi	sp,sp,-16
    80002598:	00813423          	sd	s0,8(sp)
    8000259c:	01010413          	addi	s0,sp,16
    this->body = body;
    800025a0:	00b53023          	sd	a1,0(a0)
}
    800025a4:	00813403          	ld	s0,8(sp)
    800025a8:	01010113          	addi	sp,sp,16
    800025ac:	00008067          	ret

00000000800025b0 <_ZN3TCB7exitTCBEv>:

void TCB::exitTCB() {
    800025b0:	ff010113          	addi	sp,sp,-16
    800025b4:	00113423          	sd	ra,8(sp)
    800025b8:	00813023          	sd	s0,0(sp)
    800025bc:	01010413          	addi	s0,sp,16
        void setFinished(bool value) { finished = value; }
    800025c0:	00005797          	auipc	a5,0x5
    800025c4:	c887b783          	ld	a5,-888(a5) # 80007248 <_ZN3TCB7runningE>
    800025c8:	00100713          	li	a4,1
    800025cc:	02e78423          	sb	a4,40(a5)
    running->setFinished(true);
    thread_dispatch();
    800025d0:	fffff097          	auipc	ra,0xfffff
    800025d4:	d4c080e7          	jalr	-692(ra) # 8000131c <_Z15thread_dispatchv>
}
    800025d8:	00813083          	ld	ra,8(sp)
    800025dc:	00013403          	ld	s0,0(sp)
    800025e0:	01010113          	addi	sp,sp,16
    800025e4:	00008067          	ret

00000000800025e8 <_Znwm>:
//
#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"

void *operator new(uint64 n) { return mem_alloc(n); }
    800025e8:	ff010113          	addi	sp,sp,-16
    800025ec:	00113423          	sd	ra,8(sp)
    800025f0:	00813023          	sd	s0,0(sp)
    800025f4:	01010413          	addi	s0,sp,16
    800025f8:	fffff097          	auipc	ra,0xfffff
    800025fc:	c5c080e7          	jalr	-932(ra) # 80001254 <_Z9mem_allocm>
    80002600:	00813083          	ld	ra,8(sp)
    80002604:	00013403          	ld	s0,0(sp)
    80002608:	01010113          	addi	sp,sp,16
    8000260c:	00008067          	ret

0000000080002610 <_Znam>:
void *operator new[](uint64 n) { return mem_alloc(n); }
    80002610:	ff010113          	addi	sp,sp,-16
    80002614:	00113423          	sd	ra,8(sp)
    80002618:	00813023          	sd	s0,0(sp)
    8000261c:	01010413          	addi	s0,sp,16
    80002620:	fffff097          	auipc	ra,0xfffff
    80002624:	c34080e7          	jalr	-972(ra) # 80001254 <_Z9mem_allocm>
    80002628:	00813083          	ld	ra,8(sp)
    8000262c:	00013403          	ld	s0,0(sp)
    80002630:	01010113          	addi	sp,sp,16
    80002634:	00008067          	ret

0000000080002638 <_ZdlPv>:

void operator delete(void *p) noexcept { mem_free(p); }
    80002638:	ff010113          	addi	sp,sp,-16
    8000263c:	00113423          	sd	ra,8(sp)
    80002640:	00813023          	sd	s0,0(sp)
    80002644:	01010413          	addi	s0,sp,16
    80002648:	fffff097          	auipc	ra,0xfffff
    8000264c:	c3c080e7          	jalr	-964(ra) # 80001284 <_Z8mem_freePv>
    80002650:	00813083          	ld	ra,8(sp)
    80002654:	00013403          	ld	s0,0(sp)
    80002658:	01010113          	addi	sp,sp,16
    8000265c:	00008067          	ret

0000000080002660 <_ZdaPv>:
void operator delete[](void *p) noexcept { mem_free(p); }
    80002660:	ff010113          	addi	sp,sp,-16
    80002664:	00113423          	sd	ra,8(sp)
    80002668:	00813023          	sd	s0,0(sp)
    8000266c:	01010413          	addi	s0,sp,16
    80002670:	fffff097          	auipc	ra,0xfffff
    80002674:	c14080e7          	jalr	-1004(ra) # 80001284 <_Z8mem_freePv>
    80002678:	00813083          	ld	ra,8(sp)
    8000267c:	00013403          	ld	s0,0(sp)
    80002680:	01010113          	addi	sp,sp,16
    80002684:	00008067          	ret

0000000080002688 <_ZN9SemaphoreD1Ev>:
Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
    myHandle->mySemaphore = this;
}

Semaphore::~Semaphore() {
    80002688:	00005797          	auipc	a5,0x5
    8000268c:	b1078793          	addi	a5,a5,-1264 # 80007198 <_ZTV9Semaphore+0x10>
    80002690:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    80002694:	00853503          	ld	a0,8(a0)
    80002698:	02050863          	beqz	a0,800026c8 <_ZN9SemaphoreD1Ev+0x40>
Semaphore::~Semaphore() {
    8000269c:	ff010113          	addi	sp,sp,-16
    800026a0:	00113423          	sd	ra,8(sp)
    800026a4:	00813023          	sd	s0,0(sp)
    800026a8:	01010413          	addi	s0,sp,16
    delete myHandle;
    800026ac:	00053783          	ld	a5,0(a0)
    800026b0:	0087b783          	ld	a5,8(a5)
    800026b4:	000780e7          	jalr	a5
}
    800026b8:	00813083          	ld	ra,8(sp)
    800026bc:	00013403          	ld	s0,0(sp)
    800026c0:	01010113          	addi	sp,sp,16
    800026c4:	00008067          	ret
    800026c8:	00008067          	ret

00000000800026cc <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800026cc:	fe010113          	addi	sp,sp,-32
    800026d0:	00113c23          	sd	ra,24(sp)
    800026d4:	00813823          	sd	s0,16(sp)
    800026d8:	00913423          	sd	s1,8(sp)
    800026dc:	02010413          	addi	s0,sp,32
    800026e0:	00050493          	mv	s1,a0
}
    800026e4:	00000097          	auipc	ra,0x0
    800026e8:	fa4080e7          	jalr	-92(ra) # 80002688 <_ZN9SemaphoreD1Ev>
    800026ec:	00048513          	mv	a0,s1
    800026f0:	00000097          	auipc	ra,0x0
    800026f4:	f48080e7          	jalr	-184(ra) # 80002638 <_ZdlPv>
    800026f8:	01813083          	ld	ra,24(sp)
    800026fc:	01013403          	ld	s0,16(sp)
    80002700:	00813483          	ld	s1,8(sp)
    80002704:	02010113          	addi	sp,sp,32
    80002708:	00008067          	ret

000000008000270c <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    8000270c:	fe010113          	addi	sp,sp,-32
    80002710:	00113c23          	sd	ra,24(sp)
    80002714:	00813823          	sd	s0,16(sp)
    80002718:	00913423          	sd	s1,8(sp)
    8000271c:	02010413          	addi	s0,sp,32
    80002720:	00005797          	auipc	a5,0x5
    80002724:	a5078793          	addi	a5,a5,-1456 # 80007170 <_ZTV6Thread+0x10>
    80002728:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    8000272c:	00853483          	ld	s1,8(a0)
    80002730:	02048063          	beqz	s1,80002750 <_ZN6ThreadD1Ev+0x44>
        ~TCB() { delete[] stack; }
    80002734:	0084b503          	ld	a0,8(s1)
    80002738:	00050663          	beqz	a0,80002744 <_ZN6ThreadD1Ev+0x38>
    8000273c:	00000097          	auipc	ra,0x0
    80002740:	f24080e7          	jalr	-220(ra) # 80002660 <_ZdaPv>
    80002744:	00048513          	mv	a0,s1
    80002748:	00000097          	auipc	ra,0x0
    8000274c:	ef0080e7          	jalr	-272(ra) # 80002638 <_ZdlPv>
}
    80002750:	01813083          	ld	ra,24(sp)
    80002754:	01013403          	ld	s0,16(sp)
    80002758:	00813483          	ld	s1,8(sp)
    8000275c:	02010113          	addi	sp,sp,32
    80002760:	00008067          	ret

0000000080002764 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002764:	fe010113          	addi	sp,sp,-32
    80002768:	00113c23          	sd	ra,24(sp)
    8000276c:	00813823          	sd	s0,16(sp)
    80002770:	00913423          	sd	s1,8(sp)
    80002774:	02010413          	addi	s0,sp,32
    80002778:	00050493          	mv	s1,a0
}
    8000277c:	00000097          	auipc	ra,0x0
    80002780:	f90080e7          	jalr	-112(ra) # 8000270c <_ZN6ThreadD1Ev>
    80002784:	00048513          	mv	a0,s1
    80002788:	00000097          	auipc	ra,0x0
    8000278c:	eb0080e7          	jalr	-336(ra) # 80002638 <_ZdlPv>
    80002790:	01813083          	ld	ra,24(sp)
    80002794:	01013403          	ld	s0,16(sp)
    80002798:	00813483          	ld	s1,8(sp)
    8000279c:	02010113          	addi	sp,sp,32
    800027a0:	00008067          	ret

00000000800027a4 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800027a4:	ff010113          	addi	sp,sp,-16
    800027a8:	00113423          	sd	ra,8(sp)
    800027ac:	00813023          	sd	s0,0(sp)
    800027b0:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800027b4:	fffff097          	auipc	ra,0xfffff
    800027b8:	b68080e7          	jalr	-1176(ra) # 8000131c <_Z15thread_dispatchv>
}
    800027bc:	00813083          	ld	ra,8(sp)
    800027c0:	00013403          	ld	s0,0(sp)
    800027c4:	01010113          	addi	sp,sp,16
    800027c8:	00008067          	ret

00000000800027cc <_ZN6Thread5startEv>:
int Thread::start() {
    800027cc:	ff010113          	addi	sp,sp,-16
    800027d0:	00113423          	sd	ra,8(sp)
    800027d4:	00813023          	sd	s0,0(sp)
    800027d8:	01010413          	addi	s0,sp,16
    Scheduler::put(myHandle);
    800027dc:	00853503          	ld	a0,8(a0)
    800027e0:	00000097          	auipc	ra,0x0
    800027e4:	53c080e7          	jalr	1340(ra) # 80002d1c <_ZN9Scheduler3putEP3TCB>
}
    800027e8:	00100513          	li	a0,1
    800027ec:	00813083          	ld	ra,8(sp)
    800027f0:	00013403          	ld	s0,0(sp)
    800027f4:	01010113          	addi	sp,sp,16
    800027f8:	00008067          	ret

00000000800027fc <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    800027fc:	fe010113          	addi	sp,sp,-32
    80002800:	00113c23          	sd	ra,24(sp)
    80002804:	00813823          	sd	s0,16(sp)
    80002808:	00913423          	sd	s1,8(sp)
    8000280c:	02010413          	addi	s0,sp,32
    80002810:	00050493          	mv	s1,a0
    80002814:	00005797          	auipc	a5,0x5
    80002818:	95c78793          	addi	a5,a5,-1700 # 80007170 <_ZTV6Thread+0x10>
    8000281c:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    80002820:	00850513          	addi	a0,a0,8
    80002824:	fffff097          	auipc	ra,0xfffff
    80002828:	a90080e7          	jalr	-1392(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    myHandle->myThread = this;
    8000282c:	0084b783          	ld	a5,8(s1)
    80002830:	0297b823          	sd	s1,48(a5)
}
    80002834:	01813083          	ld	ra,24(sp)
    80002838:	01013403          	ld	s0,16(sp)
    8000283c:	00813483          	ld	s1,8(sp)
    80002840:	02010113          	addi	sp,sp,32
    80002844:	00008067          	ret

0000000080002848 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002848:	fe010113          	addi	sp,sp,-32
    8000284c:	00113c23          	sd	ra,24(sp)
    80002850:	00813823          	sd	s0,16(sp)
    80002854:	00913423          	sd	s1,8(sp)
    80002858:	02010413          	addi	s0,sp,32
    8000285c:	00050493          	mv	s1,a0
    80002860:	00005797          	auipc	a5,0x5
    80002864:	91078793          	addi	a5,a5,-1776 # 80007170 <_ZTV6Thread+0x10>
    80002868:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, nullptr, nullptr);
    8000286c:	00000613          	li	a2,0
    80002870:	00000593          	li	a1,0
    80002874:	00850513          	addi	a0,a0,8
    80002878:	fffff097          	auipc	ra,0xfffff
    8000287c:	a3c080e7          	jalr	-1476(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    myHandle->myThread = this;
    80002880:	0084b783          	ld	a5,8(s1)
    80002884:	0297b823          	sd	s1,48(a5)
}
    80002888:	01813083          	ld	ra,24(sp)
    8000288c:	01013403          	ld	s0,16(sp)
    80002890:	00813483          	ld	s1,8(sp)
    80002894:	02010113          	addi	sp,sp,32
    80002898:	00008067          	ret

000000008000289c <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    8000289c:	ff010113          	addi	sp,sp,-16
    800028a0:	00113423          	sd	ra,8(sp)
    800028a4:	00813023          	sd	s0,0(sp)
    800028a8:	01010413          	addi	s0,sp,16
    sem_wait(myHandle);
    800028ac:	00853503          	ld	a0,8(a0)
    800028b0:	fffff097          	auipc	ra,0xfffff
    800028b4:	af8080e7          	jalr	-1288(ra) # 800013a8 <_Z8sem_waitP9KernelSem>
}
    800028b8:	00000513          	li	a0,0
    800028bc:	00813083          	ld	ra,8(sp)
    800028c0:	00013403          	ld	s0,0(sp)
    800028c4:	01010113          	addi	sp,sp,16
    800028c8:	00008067          	ret

00000000800028cc <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    800028cc:	ff010113          	addi	sp,sp,-16
    800028d0:	00113423          	sd	ra,8(sp)
    800028d4:	00813023          	sd	s0,0(sp)
    800028d8:	01010413          	addi	s0,sp,16
    sem_signal(myHandle);
    800028dc:	00853503          	ld	a0,8(a0)
    800028e0:	fffff097          	auipc	ra,0xfffff
    800028e4:	af8080e7          	jalr	-1288(ra) # 800013d8 <_Z10sem_signalP9KernelSem>
}
    800028e8:	00000513          	li	a0,0
    800028ec:	00813083          	ld	ra,8(sp)
    800028f0:	00013403          	ld	s0,0(sp)
    800028f4:	01010113          	addi	sp,sp,16
    800028f8:	00008067          	ret

00000000800028fc <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800028fc:	fe010113          	addi	sp,sp,-32
    80002900:	00113c23          	sd	ra,24(sp)
    80002904:	00813823          	sd	s0,16(sp)
    80002908:	00913423          	sd	s1,8(sp)
    8000290c:	02010413          	addi	s0,sp,32
    80002910:	00050493          	mv	s1,a0
    80002914:	00005797          	auipc	a5,0x5
    80002918:	88478793          	addi	a5,a5,-1916 # 80007198 <_ZTV9Semaphore+0x10>
    8000291c:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80002920:	00850513          	addi	a0,a0,8
    80002924:	fffff097          	auipc	ra,0xfffff
    80002928:	a1c080e7          	jalr	-1508(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    myHandle->mySemaphore = this;
    8000292c:	0084b783          	ld	a5,8(s1)
    80002930:	0097b423          	sd	s1,8(a5)
}
    80002934:	01813083          	ld	ra,24(sp)
    80002938:	01013403          	ld	s0,16(sp)
    8000293c:	00813483          	ld	s1,8(sp)
    80002940:	02010113          	addi	sp,sp,32
    80002944:	00008067          	ret

0000000080002948 <_ZN7Console4getcEv>:

char Console::getc() {
    80002948:	ff010113          	addi	sp,sp,-16
    8000294c:	00113423          	sd	ra,8(sp)
    80002950:	00813023          	sd	s0,0(sp)
    80002954:	01010413          	addi	s0,sp,16
    char c = ::getc();
    80002958:	fffff097          	auipc	ra,0xfffff
    8000295c:	ab0080e7          	jalr	-1360(ra) # 80001408 <_Z4getcv>
    return c;
}
    80002960:	00813083          	ld	ra,8(sp)
    80002964:	00013403          	ld	s0,0(sp)
    80002968:	01010113          	addi	sp,sp,16
    8000296c:	00008067          	ret

0000000080002970 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002970:	ff010113          	addi	sp,sp,-16
    80002974:	00113423          	sd	ra,8(sp)
    80002978:	00813023          	sd	s0,0(sp)
    8000297c:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002980:	fffff097          	auipc	ra,0xfffff
    80002984:	ab4080e7          	jalr	-1356(ra) # 80001434 <_Z4putcc>
}
    80002988:	00813083          	ld	ra,8(sp)
    8000298c:	00013403          	ld	s0,0(sp)
    80002990:	01010113          	addi	sp,sp,16
    80002994:	00008067          	ret

0000000080002998 <_ZN6Thread3runEv>:
    int start ();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
    80002998:	ff010113          	addi	sp,sp,-16
    8000299c:	00813423          	sd	s0,8(sp)
    800029a0:	01010413          	addi	s0,sp,16
    800029a4:	00813403          	ld	s0,8(sp)
    800029a8:	01010113          	addi	sp,sp,16
    800029ac:	00008067          	ret

00000000800029b0 <_ZN5Riscv10popSppSpieEv>:
#include "../h/tcb.hpp"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/printing.hpp"

void Riscv::popSppSpie() {
    800029b0:	ff010113          	addi	sp,sp,-16
    800029b4:	00813423          	sd	s0,8(sp)
    800029b8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    800029bc:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    800029c0:	10200073          	sret
}
    800029c4:	00813403          	ld	s0,8(sp)
    800029c8:	01010113          	addi	sp,sp,16
    800029cc:	00008067          	ret

00000000800029d0 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    800029d0:	f9010113          	addi	sp,sp,-112
    800029d4:	06113423          	sd	ra,104(sp)
    800029d8:	06813023          	sd	s0,96(sp)
    800029dc:	04913c23          	sd	s1,88(sp)
    800029e0:	05213823          	sd	s2,80(sp)
    800029e4:	05313423          	sd	s3,72(sp)
    800029e8:	07010413          	addi	s0,sp,112
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800029ec:	142027f3          	csrr	a5,scause
    800029f0:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    800029f4:	f9843703          	ld	a4,-104(s0)
    uint64 scause = r_scause();

    // velicina gde cu da mu obavestim koji je poziv
    size_t argument0;
    __asm__ volatile("mv %0, a0" : "=r" (argument0));
    800029f8:	00050793          	mv	a5,a0

    if(argument0 != 0 && scause == 0x0000000000000009UL){
    800029fc:	00078663          	beqz	a5,80002a08 <_ZN5Riscv20handleSupervisorTrapEv+0x38>
    80002a00:	00900693          	li	a3,9
    80002a04:	04d70863          	beq	a4,a3,80002a54 <_ZN5Riscv20handleSupervisorTrapEv+0x84>
            __putc(c);
        }

        w_sstatus(sstatus); w_sepc(sepc);
    }
    else if (scause == 0x0000000000000009UL) {
    80002a08:	00900793          	li	a5,9
    80002a0c:	1af70063          	beq	a4,a5,80002bac <_ZN5Riscv20handleSupervisorTrapEv+0x1dc>
        // interrupt: no; cause code: environment call from S-mode(9)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch();
        w_sstatus(sstatus); w_sepc(sepc);
    } else if (scause == 0x8000000000000001UL) {
    80002a10:	fff00793          	li	a5,-1
    80002a14:	03f79793          	slli	a5,a5,0x3f
    80002a18:	00178793          	addi	a5,a5,1
    80002a1c:	1cf70663          	beq	a4,a5,80002be8 <_ZN5Riscv20handleSupervisorTrapEv+0x218>
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus); w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    } else if (scause == 0x8000000000000009UL) {
    80002a20:	fff00793          	li	a5,-1
    80002a24:	03f79793          	slli	a5,a5,0x3f
    80002a28:	00978793          	addi	a5,a5,9
    80002a2c:	22f70463          	beq	a4,a5,80002c54 <_ZN5Riscv20handleSupervisorTrapEv+0x284>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else {
        // unexpected trap cause
        // definisati
        if (scause == 0x0000000000000005UL){
    80002a30:	00500793          	li	a5,5
    80002a34:	22f70663          	beq	a4,a5,80002c60 <_ZN5Riscv20handleSupervisorTrapEv+0x290>
            printString("Error 5\n");
        }

    }
}
    80002a38:	06813083          	ld	ra,104(sp)
    80002a3c:	06013403          	ld	s0,96(sp)
    80002a40:	05813483          	ld	s1,88(sp)
    80002a44:	05013903          	ld	s2,80(sp)
    80002a48:	04813983          	ld	s3,72(sp)
    80002a4c:	07010113          	addi	sp,sp,112
    80002a50:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002a54:	14102773          	csrr	a4,sepc
    80002a58:	fae43423          	sd	a4,-88(s0)
    return sepc;
    80002a5c:	fa843483          	ld	s1,-88(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80002a60:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002a64:	10002773          	csrr	a4,sstatus
    80002a68:	fae43023          	sd	a4,-96(s0)
    return sstatus;
    80002a6c:	fa043903          	ld	s2,-96(s0)
        if(argument0 == 1){ // syscall za mem_alloc
    80002a70:	00100713          	li	a4,1
    80002a74:	06e78463          	beq	a5,a4,80002adc <_ZN5Riscv20handleSupervisorTrapEv+0x10c>
        }else if(argument0 == 2){ // sistemski poziv za mem_free
    80002a78:	00200713          	li	a4,2
    80002a7c:	06e78e63          	beq	a5,a4,80002af8 <_ZN5Riscv20handleSupervisorTrapEv+0x128>
        }else if(argument0 == 11){
    80002a80:	00b00713          	li	a4,11
    80002a84:	08e78263          	beq	a5,a4,80002b08 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
        }else if(argument0 == 12){
    80002a88:	00c00713          	li	a4,12
    80002a8c:	08e78c63          	beq	a5,a4,80002b24 <_ZN5Riscv20handleSupervisorTrapEv+0x154>
        }else if(argument0 == 13){
    80002a90:	00d00713          	li	a4,13
    80002a94:	0ae78863          	beq	a5,a4,80002b44 <_ZN5Riscv20handleSupervisorTrapEv+0x174>
        }else if(argument0 == 21){
    80002a98:	01500713          	li	a4,21
    80002a9c:	0ae78a63          	beq	a5,a4,80002b50 <_ZN5Riscv20handleSupervisorTrapEv+0x180>
        }else if(argument0 == 22){
    80002aa0:	01600713          	li	a4,22
    80002aa4:	0ce78463          	beq	a5,a4,80002b6c <_ZN5Riscv20handleSupervisorTrapEv+0x19c>
        }else if(argument0 == 23){
    80002aa8:	01700713          	li	a4,23
    80002aac:	0ce78863          	beq	a5,a4,80002b7c <_ZN5Riscv20handleSupervisorTrapEv+0x1ac>
        }else if(argument0 == 24){
    80002ab0:	01800713          	li	a4,24
    80002ab4:	0ce78c63          	beq	a5,a4,80002b8c <_ZN5Riscv20handleSupervisorTrapEv+0x1bc>
        }else if(argument0 == 41){
    80002ab8:	02900713          	li	a4,41
    80002abc:	0ee78063          	beq	a5,a4,80002b9c <_ZN5Riscv20handleSupervisorTrapEv+0x1cc>
        }else if(argument0 == 42){
    80002ac0:	02a00713          	li	a4,42
    80002ac4:	02e79463          	bne	a5,a4,80002aec <_ZN5Riscv20handleSupervisorTrapEv+0x11c>
            __asm__ volatile("mv %0, a1" : "=r" (c));
    80002ac8:	00058513          	mv	a0,a1
            __putc(c);
    80002acc:	0ff57513          	andi	a0,a0,255
    80002ad0:	00003097          	auipc	ra,0x3
    80002ad4:	94c080e7          	jalr	-1716(ra) # 8000541c <__putc>
    80002ad8:	0140006f          	j	80002aec <_ZN5Riscv20handleSupervisorTrapEv+0x11c>
            __asm__ volatile("mv %0, a1" : "=r" (argument_sizet));
    80002adc:	00058513          	mv	a0,a1
            argument_ret_void = MemoryAllocator::mem_alloc(argument_sizet);
    80002ae0:	00000097          	auipc	ra,0x0
    80002ae4:	32c080e7          	jalr	812(ra) # 80002e0c <_ZN15MemoryAllocator9mem_allocEm>
            __asm__ volatile("mv a0, %0" : : "r" (argument_ret_void));
    80002ae8:	00050513          	mv	a0,a0
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002aec:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002af0:	14149073          	csrw	sepc,s1
}
    80002af4:	f45ff06f          	j	80002a38 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
            __asm__ volatile("mv %0, a1" : "=r" (argument_void));
    80002af8:	00058513          	mv	a0,a1
            MemoryAllocator::mem_free(argument_void);
    80002afc:	00000097          	auipc	ra,0x0
    80002b00:	450080e7          	jalr	1104(ra) # 80002f4c <_ZN15MemoryAllocator8mem_freeEPv>
    80002b04:	fe9ff06f          	j	80002aec <_ZN5Riscv20handleSupervisorTrapEv+0x11c>
            __asm__ volatile("mv %0, a1" : "=r" (handler));
    80002b08:	00058993          	mv	s3,a1
            __asm__ volatile("mv %0, a2" : "=r" (sr));
    80002b0c:	00060513          	mv	a0,a2
            __asm__ volatile("mv %0, a3" : "=r" (arg));
    80002b10:	00068793          	mv	a5,a3
            *handler = TCB::createThread(sr);
    80002b14:	00000097          	auipc	ra,0x0
    80002b18:	910080e7          	jalr	-1776(ra) # 80002424 <_ZN3TCB12createThreadEPFvvE>
    80002b1c:	00a9b023          	sd	a0,0(s3)
    80002b20:	fcdff06f          	j	80002aec <_ZN5Riscv20handleSupervisorTrapEv+0x11c>
            TCB::running->setFinished(true);
    80002b24:	00004797          	auipc	a5,0x4
    80002b28:	6ac7b783          	ld	a5,1708(a5) # 800071d0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002b2c:	0007b783          	ld	a5,0(a5)
        void setFinished(bool value) { finished = value; }
    80002b30:	00100713          	li	a4,1
    80002b34:	02e78423          	sb	a4,40(a5)
            thread_dispatch();
    80002b38:	ffffe097          	auipc	ra,0xffffe
    80002b3c:	7e4080e7          	jalr	2020(ra) # 8000131c <_Z15thread_dispatchv>
    80002b40:	fadff06f          	j	80002aec <_ZN5Riscv20handleSupervisorTrapEv+0x11c>
            TCB::dispatch();
    80002b44:	00000097          	auipc	ra,0x0
    80002b48:	974080e7          	jalr	-1676(ra) # 800024b8 <_ZN3TCB8dispatchEv>
    80002b4c:	fa1ff06f          	j	80002aec <_ZN5Riscv20handleSupervisorTrapEv+0x11c>
            __asm__ volatile("mv %0, a1" : "=r" (arg1));
    80002b50:	00058993          	mv	s3,a1
            __asm__ volatile("mv %0, a2" : "=r" (arg2));
    80002b54:	00060513          	mv	a0,a2
            *arg1 = KernelSem::createSem(arg2);
    80002b58:	0005051b          	sext.w	a0,a0
    80002b5c:	fffff097          	auipc	ra,0xfffff
    80002b60:	938080e7          	jalr	-1736(ra) # 80001494 <_ZN9KernelSem9createSemEi>
    80002b64:	00a9b023          	sd	a0,0(s3)
    80002b68:	f85ff06f          	j	80002aec <_ZN5Riscv20handleSupervisorTrapEv+0x11c>
            __asm__ volatile("mv %0, a1" : "=r" (arg1));
    80002b6c:	00058513          	mv	a0,a1
            arg1->freeSem();
    80002b70:	fffff097          	auipc	ra,0xfffff
    80002b74:	ac8080e7          	jalr	-1336(ra) # 80001638 <_ZN9KernelSem7freeSemEv>
    80002b78:	f75ff06f          	j	80002aec <_ZN5Riscv20handleSupervisorTrapEv+0x11c>
            __asm__ volatile("mv %0, a1" : "=r" (arg1));
    80002b7c:	00058513          	mv	a0,a1
            arg1->wait();
    80002b80:	fffff097          	auipc	ra,0xfffff
    80002b84:	984080e7          	jalr	-1660(ra) # 80001504 <_ZN9KernelSem4waitEv>
    80002b88:	f65ff06f          	j	80002aec <_ZN5Riscv20handleSupervisorTrapEv+0x11c>
            __asm__ volatile("mv %0, a1" : "=r" (arg1));
    80002b8c:	00058513          	mv	a0,a1
            arg1->signal();
    80002b90:	fffff097          	auipc	ra,0xfffff
    80002b94:	a14080e7          	jalr	-1516(ra) # 800015a4 <_ZN9KernelSem6signalEv>
    80002b98:	f55ff06f          	j	80002aec <_ZN5Riscv20handleSupervisorTrapEv+0x11c>
            ret = __getc();
    80002b9c:	00003097          	auipc	ra,0x3
    80002ba0:	8bc080e7          	jalr	-1860(ra) # 80005458 <__getc>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002ba4:	00050513          	mv	a0,a0
    80002ba8:	f45ff06f          	j	80002aec <_ZN5Riscv20handleSupervisorTrapEv+0x11c>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002bac:	141027f3          	csrr	a5,sepc
    80002bb0:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80002bb4:	fb843483          	ld	s1,-72(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80002bb8:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002bbc:	100027f3          	csrr	a5,sstatus
    80002bc0:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80002bc4:	fb043903          	ld	s2,-80(s0)
        TCB::timeSliceCounter = 0;
    80002bc8:	00004797          	auipc	a5,0x4
    80002bcc:	5f87b783          	ld	a5,1528(a5) # 800071c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002bd0:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    80002bd4:	00000097          	auipc	ra,0x0
    80002bd8:	8e4080e7          	jalr	-1820(ra) # 800024b8 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002bdc:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002be0:	14149073          	csrw	sepc,s1
}
    80002be4:	e55ff06f          	j	80002a38 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
        TCB::timeSliceCounter++;
    80002be8:	00004717          	auipc	a4,0x4
    80002bec:	5d873703          	ld	a4,1496(a4) # 800071c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002bf0:	00073783          	ld	a5,0(a4)
    80002bf4:	00178793          	addi	a5,a5,1
    80002bf8:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    80002bfc:	00004717          	auipc	a4,0x4
    80002c00:	5d473703          	ld	a4,1492(a4) # 800071d0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002c04:	00073703          	ld	a4,0(a4)
        uint64 getTimeSlice() const { return timeSlice; }
    80002c08:	02073703          	ld	a4,32(a4)
    80002c0c:	00e7f863          	bgeu	a5,a4,80002c1c <_ZN5Riscv20handleSupervisorTrapEv+0x24c>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002c10:	00200793          	li	a5,2
    80002c14:	1447b073          	csrc	sip,a5
}
    80002c18:	e21ff06f          	j	80002a38 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002c1c:	141027f3          	csrr	a5,sepc
    80002c20:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002c24:	fc843483          	ld	s1,-56(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002c28:	100027f3          	csrr	a5,sstatus
    80002c2c:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80002c30:	fc043903          	ld	s2,-64(s0)
            TCB::timeSliceCounter = 0;
    80002c34:	00004797          	auipc	a5,0x4
    80002c38:	58c7b783          	ld	a5,1420(a5) # 800071c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002c3c:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80002c40:	00000097          	auipc	ra,0x0
    80002c44:	878080e7          	jalr	-1928(ra) # 800024b8 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002c48:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002c4c:	14149073          	csrw	sepc,s1
}
    80002c50:	fc1ff06f          	j	80002c10 <_ZN5Riscv20handleSupervisorTrapEv+0x240>
        console_handler();
    80002c54:	00003097          	auipc	ra,0x3
    80002c58:	83c080e7          	jalr	-1988(ra) # 80005490 <console_handler>
    80002c5c:	dddff06f          	j	80002a38 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
            printString("Error 5\n");
    80002c60:	00003517          	auipc	a0,0x3
    80002c64:	4f050513          	addi	a0,a0,1264 # 80006150 <CONSOLE_STATUS+0x140>
    80002c68:	fffff097          	auipc	ra,0xfffff
    80002c6c:	ac8080e7          	jalr	-1336(ra) # 80001730 <_Z11printStringPKc>
}
    80002c70:	dc9ff06f          	j	80002a38 <_ZN5Riscv20handleSupervisorTrapEv+0x68>

0000000080002c74 <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyCoroutineQueue.addLast(tcb);
    80002c74:	ff010113          	addi	sp,sp,-16
    80002c78:	00813423          	sd	s0,8(sp)
    80002c7c:	01010413          	addi	s0,sp,16
    80002c80:	00100793          	li	a5,1
    80002c84:	00f50863          	beq	a0,a5,80002c94 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002c88:	00813403          	ld	s0,8(sp)
    80002c8c:	01010113          	addi	sp,sp,16
    80002c90:	00008067          	ret
    80002c94:	000107b7          	lui	a5,0x10
    80002c98:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002c9c:	fef596e3          	bne	a1,a5,80002c88 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0) {}
    80002ca0:	00004797          	auipc	a5,0x4
    80002ca4:	5b878793          	addi	a5,a5,1464 # 80007258 <_ZN9Scheduler19readyCoroutineQueueE>
    80002ca8:	0007b023          	sd	zero,0(a5)
    80002cac:	0007b423          	sd	zero,8(a5)
    80002cb0:	fd9ff06f          	j	80002c88 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002cb4 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80002cb4:	fe010113          	addi	sp,sp,-32
    80002cb8:	00113c23          	sd	ra,24(sp)
    80002cbc:	00813823          	sd	s0,16(sp)
    80002cc0:	00913423          	sd	s1,8(sp)
    80002cc4:	02010413          	addi	s0,sp,32
        if(!head){ return 0; }
    80002cc8:	00004517          	auipc	a0,0x4
    80002ccc:	59053503          	ld	a0,1424(a0) # 80007258 <_ZN9Scheduler19readyCoroutineQueueE>
    80002cd0:	04050263          	beqz	a0,80002d14 <_ZN9Scheduler3getEv+0x60>
        head = head->next;
    80002cd4:	00853783          	ld	a5,8(a0)
    80002cd8:	00004717          	auipc	a4,0x4
    80002cdc:	58f73023          	sd	a5,1408(a4) # 80007258 <_ZN9Scheduler19readyCoroutineQueueE>
        if(!head){ tail = 0; }
    80002ce0:	02078463          	beqz	a5,80002d08 <_ZN9Scheduler3getEv+0x54>
        T *ret = elem->data;
    80002ce4:	00053483          	ld	s1,0(a0)
        delete elem;
    80002ce8:	00000097          	auipc	ra,0x0
    80002cec:	950080e7          	jalr	-1712(ra) # 80002638 <_ZdlPv>
}
    80002cf0:	00048513          	mv	a0,s1
    80002cf4:	01813083          	ld	ra,24(sp)
    80002cf8:	01013403          	ld	s0,16(sp)
    80002cfc:	00813483          	ld	s1,8(sp)
    80002d00:	02010113          	addi	sp,sp,32
    80002d04:	00008067          	ret
        if(!head){ tail = 0; }
    80002d08:	00004797          	auipc	a5,0x4
    80002d0c:	5407bc23          	sd	zero,1368(a5) # 80007260 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80002d10:	fd5ff06f          	j	80002ce4 <_ZN9Scheduler3getEv+0x30>
        if(!head){ return 0; }
    80002d14:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    80002d18:	fd9ff06f          	j	80002cf0 <_ZN9Scheduler3getEv+0x3c>

0000000080002d1c <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80002d1c:	fe010113          	addi	sp,sp,-32
    80002d20:	00113c23          	sd	ra,24(sp)
    80002d24:	00813823          	sd	s0,16(sp)
    80002d28:	00913423          	sd	s1,8(sp)
    80002d2c:	02010413          	addi	s0,sp,32
    80002d30:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80002d34:	01000513          	li	a0,16
    80002d38:	00000097          	auipc	ra,0x0
    80002d3c:	8b0080e7          	jalr	-1872(ra) # 800025e8 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    80002d40:	00953023          	sd	s1,0(a0)
    80002d44:	00053423          	sd	zero,8(a0)
        if(tail){
    80002d48:	00004797          	auipc	a5,0x4
    80002d4c:	5187b783          	ld	a5,1304(a5) # 80007260 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80002d50:	02078263          	beqz	a5,80002d74 <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    80002d54:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80002d58:	00004797          	auipc	a5,0x4
    80002d5c:	50a7b423          	sd	a0,1288(a5) # 80007260 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80002d60:	01813083          	ld	ra,24(sp)
    80002d64:	01013403          	ld	s0,16(sp)
    80002d68:	00813483          	ld	s1,8(sp)
    80002d6c:	02010113          	addi	sp,sp,32
    80002d70:	00008067          	ret
            head = tail = elem;
    80002d74:	00004797          	auipc	a5,0x4
    80002d78:	4e478793          	addi	a5,a5,1252 # 80007258 <_ZN9Scheduler19readyCoroutineQueueE>
    80002d7c:	00a7b423          	sd	a0,8(a5)
    80002d80:	00a7b023          	sd	a0,0(a5)
    80002d84:	fddff06f          	j	80002d60 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080002d88 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80002d88:	ff010113          	addi	sp,sp,-16
    80002d8c:	00113423          	sd	ra,8(sp)
    80002d90:	00813023          	sd	s0,0(sp)
    80002d94:	01010413          	addi	s0,sp,16
    80002d98:	000105b7          	lui	a1,0x10
    80002d9c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002da0:	00100513          	li	a0,1
    80002da4:	00000097          	auipc	ra,0x0
    80002da8:	ed0080e7          	jalr	-304(ra) # 80002c74 <_Z41__static_initialization_and_destruction_0ii>
    80002dac:	00813083          	ld	ra,8(sp)
    80002db0:	00013403          	ld	s0,0(sp)
    80002db4:	01010113          	addi	sp,sp,16
    80002db8:	00008067          	ret

0000000080002dbc <_ZN15MemoryAllocator8memAllocEv>:

MemoryBloc* MemoryAllocator::freeMemBlocHead;
MemoryBloc* MemoryAllocator::takenMemBlocHead;

// Inicijalizacija memorije
void MemoryAllocator::memAlloc(){
    80002dbc:	ff010113          	addi	sp,sp,-16
    80002dc0:	00813423          	sd	s0,8(sp)
    80002dc4:	01010413          	addi	s0,sp,16
    freeMemBlocHead = (MemoryBloc*)HEAP_START_ADDR;
    80002dc8:	00004797          	auipc	a5,0x4
    80002dcc:	3e87b783          	ld	a5,1000(a5) # 800071b0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002dd0:	0007b703          	ld	a4,0(a5)
    80002dd4:	00004797          	auipc	a5,0x4
    80002dd8:	49478793          	addi	a5,a5,1172 # 80007268 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002ddc:	00e7b023          	sd	a4,0(a5)
    freeMemBlocHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    80002de0:	00004697          	auipc	a3,0x4
    80002de4:	3f86b683          	ld	a3,1016(a3) # 800071d8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002de8:	0006b683          	ld	a3,0(a3)
    80002dec:	40e686b3          	sub	a3,a3,a4
    80002df0:	00d73023          	sd	a3,0(a4)
    freeMemBlocHead->next = nullptr;
    80002df4:	0007b703          	ld	a4,0(a5)
    80002df8:	00073423          	sd	zero,8(a4)

    takenMemBlocHead = nullptr;
    80002dfc:	0007b423          	sd	zero,8(a5)
}
    80002e00:	00813403          	ld	s0,8(sp)
    80002e04:	01010113          	addi	sp,sp,16
    80002e08:	00008067          	ret

0000000080002e0c <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc (size_t size){
    80002e0c:	ff010113          	addi	sp,sp,-16
    80002e10:	00813423          	sd	s0,8(sp)
    80002e14:	01010413          	addi	s0,sp,16
    size_t newSize;

    // ako je velicina veca od MEM_BLOC_SIZE onda uzmi blokova koliko ti treba + sizeof(MemoryBloc)
    // u suprotnom samo MEM_BLOC_SIZE + sizeof(MemoryBloc)
    if(size > MEM_BLOCK_SIZE){
    80002e18:	04000793          	li	a5,64
    80002e1c:	02a7fa63          	bgeu	a5,a0,80002e50 <_ZN15MemoryAllocator9mem_allocEm+0x44>
        newSize = ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    80002e20:	00655713          	srli	a4,a0,0x6
    80002e24:	00170713          	addi	a4,a4,1
    80002e28:	00671713          	slli	a4,a4,0x6
    80002e2c:	01070713          	addi	a4,a4,16
    }else{
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    }

    // trazim prvi slobodan blok u listi slobodnih blokova gde mogu da alociram
    MemoryBloc* curr = freeMemBlocHead;
    80002e30:	00004617          	auipc	a2,0x4
    80002e34:	43863603          	ld	a2,1080(a2) # 80007268 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002e38:	00060513          	mv	a0,a2

    while(newSize > curr->size && curr != nullptr){
    80002e3c:	00053783          	ld	a5,0(a0)
    80002e40:	00e7fc63          	bgeu	a5,a4,80002e58 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
    80002e44:	00050a63          	beqz	a0,80002e58 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
        curr = curr->next;
    80002e48:	00853503          	ld	a0,8(a0)
    while(newSize > curr->size && curr != nullptr){
    80002e4c:	ff1ff06f          	j	80002e3c <_ZN15MemoryAllocator9mem_allocEm+0x30>
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    80002e50:	05000713          	li	a4,80
    80002e54:	fddff06f          	j	80002e30 <_ZN15MemoryAllocator9mem_allocEm+0x24>
    }

    if(curr == nullptr){
    80002e58:	00051863          	bnez	a0,80002e68 <_ZN15MemoryAllocator9mem_allocEm+0x5c>
            prevTaken->next = newBloc;
        }
    }

    return (void*)((char*)newBloc + sizeof(MemoryBloc));
};
    80002e5c:	00813403          	ld	s0,8(sp)
    80002e60:	01010113          	addi	sp,sp,16
    80002e64:	00008067          	ret
    if(curr == freeMemBlocHead){
    80002e68:	00c50e63          	beq	a0,a2,80002e84 <_ZN15MemoryAllocator9mem_allocEm+0x78>
    bool checkFree = false;
    80002e6c:	00000593          	li	a1,0
    MemoryBloc* next = curr->next;
    80002e70:	00853803          	ld	a6,8(a0)
    size_t currSize = curr->size - newSize;
    80002e74:	40e786b3          	sub	a3,a5,a4
    if(currSize == 0){
    80002e78:	06e79663          	bne	a5,a4,80002ee4 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
        MemoryBloc* currFree = freeMemBlocHead;
    80002e7c:	00060793          	mv	a5,a2
    80002e80:	0100006f          	j	80002e90 <_ZN15MemoryAllocator9mem_allocEm+0x84>
        checkFree = true;
    80002e84:	00100593          	li	a1,1
    80002e88:	fe9ff06f          	j	80002e70 <_ZN15MemoryAllocator9mem_allocEm+0x64>
            currFree = currFree->next;
    80002e8c:	00068793          	mv	a5,a3
        while(currFree != nullptr && currFree->next != curr && checkFree != true){
    80002e90:	00078863          	beqz	a5,80002ea0 <_ZN15MemoryAllocator9mem_allocEm+0x94>
    80002e94:	0087b683          	ld	a3,8(a5)
    80002e98:	00a68463          	beq	a3,a0,80002ea0 <_ZN15MemoryAllocator9mem_allocEm+0x94>
    80002e9c:	fe0588e3          	beqz	a1,80002e8c <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(currFree == freeMemBlocHead){
    80002ea0:	02c78a63          	beq	a5,a2,80002ed4 <_ZN15MemoryAllocator9mem_allocEm+0xc8>
            currFree->next = curr->next;
    80002ea4:	0107b423          	sd	a6,8(a5)
    newBloc->size = newSize;
    80002ea8:	00e53023          	sd	a4,0(a0)
    if(takenMemBlocHead == nullptr){
    80002eac:	00004697          	auipc	a3,0x4
    80002eb0:	3c46b683          	ld	a3,964(a3) # 80007270 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80002eb4:	06068263          	beqz	a3,80002f18 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
        MemoryBloc* nextTaken = takenMemBlocHead;
    80002eb8:	00068793          	mv	a5,a3
        MemoryBloc* prevTaken = nullptr;
    80002ebc:	00000713          	li	a4,0
        while (newBloc > nextTaken && nextTaken != nullptr){
    80002ec0:	06a7f463          	bgeu	a5,a0,80002f28 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
    80002ec4:	06078263          	beqz	a5,80002f28 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
            prevTaken = nextTaken;
    80002ec8:	00078713          	mv	a4,a5
            nextTaken = nextTaken->next;
    80002ecc:	0087b783          	ld	a5,8(a5)
        while (newBloc > nextTaken && nextTaken != nullptr){
    80002ed0:	ff1ff06f          	j	80002ec0 <_ZN15MemoryAllocator9mem_allocEm+0xb4>
            freeMemBlocHead = freeMemBlocHead->next;
    80002ed4:	00863783          	ld	a5,8(a2)
    80002ed8:	00004697          	auipc	a3,0x4
    80002edc:	38f6b823          	sd	a5,912(a3) # 80007268 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002ee0:	fc9ff06f          	j	80002ea8 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
    }else if(checkFree == true){
    80002ee4:	02058263          	beqz	a1,80002f08 <_ZN15MemoryAllocator9mem_allocEm+0xfc>
        freeMemBlocHead = (MemoryBloc*)((char*)freeMemBlocHead + newSize);
    80002ee8:	00e60633          	add	a2,a2,a4
    80002eec:	00004797          	auipc	a5,0x4
    80002ef0:	37c78793          	addi	a5,a5,892 # 80007268 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002ef4:	00c7b023          	sd	a2,0(a5)
        freeMemBlocHead->size = currSize;
    80002ef8:	00d63023          	sd	a3,0(a2)
        freeMemBlocHead->next = next;
    80002efc:	0007b783          	ld	a5,0(a5)
    80002f00:	0107b423          	sd	a6,8(a5)
    80002f04:	fa5ff06f          	j	80002ea8 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        curr = (MemoryBloc*)((char*)curr + newSize);
    80002f08:	00e507b3          	add	a5,a0,a4
        curr->size = currSize;
    80002f0c:	00d7b023          	sd	a3,0(a5)
        curr->next = next;
    80002f10:	0107b423          	sd	a6,8(a5)
    80002f14:	f95ff06f          	j	80002ea8 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        takenMemBlocHead = newBloc;
    80002f18:	00004797          	auipc	a5,0x4
    80002f1c:	34a7bc23          	sd	a0,856(a5) # 80007270 <_ZN15MemoryAllocator16takenMemBlocHeadE>
        newBloc->next = nullptr;
    80002f20:	00053423          	sd	zero,8(a0)
    80002f24:	0100006f          	j	80002f34 <_ZN15MemoryAllocator9mem_allocEm+0x128>
        if(nextTaken == takenMemBlocHead){
    80002f28:	00f68a63          	beq	a3,a5,80002f3c <_ZN15MemoryAllocator9mem_allocEm+0x130>
            newBloc->next = nextTaken;
    80002f2c:	00f53423          	sd	a5,8(a0)
            prevTaken->next = newBloc;
    80002f30:	00a73423          	sd	a0,8(a4)
    return (void*)((char*)newBloc + sizeof(MemoryBloc));
    80002f34:	01050513          	addi	a0,a0,16
    80002f38:	f25ff06f          	j	80002e5c <_ZN15MemoryAllocator9mem_allocEm+0x50>
            newBloc->next = takenMemBlocHead;
    80002f3c:	00d53423          	sd	a3,8(a0)
            takenMemBlocHead = newBloc;
    80002f40:	00004797          	auipc	a5,0x4
    80002f44:	32a7b823          	sd	a0,816(a5) # 80007270 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80002f48:	fedff06f          	j	80002f34 <_ZN15MemoryAllocator9mem_allocEm+0x128>

0000000080002f4c <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free (void* mem){
    80002f4c:	ff010113          	addi	sp,sp,-16
    80002f50:	00813423          	sd	s0,8(sp)
    80002f54:	01010413          	addi	s0,sp,16
    void* freeCurr = (void*)((char*)mem - sizeof(MemoryBloc));
    80002f58:	ff050513          	addi	a0,a0,-16

    MemoryBloc* curr = takenMemBlocHead;
    80002f5c:	00004697          	auipc	a3,0x4
    80002f60:	3146b683          	ld	a3,788(a3) # 80007270 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80002f64:	00068793          	mv	a5,a3
    MemoryBloc* prev = nullptr;
    80002f68:	00000713          	li	a4,0

    while (curr != freeCurr){
    80002f6c:	00a78863          	beq	a5,a0,80002f7c <_ZN15MemoryAllocator8mem_freeEPv+0x30>
        prev = curr;
    80002f70:	00078713          	mv	a4,a5
        curr = curr->next;
    80002f74:	0087b783          	ld	a5,8(a5)
    while (curr != freeCurr){
    80002f78:	ff5ff06f          	j	80002f6c <_ZN15MemoryAllocator8mem_freeEPv+0x20>
    }
    // uraditi nepredvidjeno ponasanje ako hocu da dealociram nesto sto nisam alocirao
    if(curr == takenMemBlocHead){
    80002f7c:	02d78863          	beq	a5,a3,80002fac <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        takenMemBlocHead = takenMemBlocHead->next;
    }else{
        prev->next = curr->next;
    80002f80:	0087b683          	ld	a3,8(a5)
    80002f84:	00d73423          	sd	a3,8(a4)
    }

    if(freeMemBlocHead == nullptr){
    80002f88:	00004617          	auipc	a2,0x4
    80002f8c:	2e063603          	ld	a2,736(a2) # 80007268 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002f90:	02060663          	beqz	a2,80002fbc <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        freeMemBlocHead = curr;
    }else{
        MemoryBloc* currFree = freeMemBlocHead;
    80002f94:	00060713          	mv	a4,a2
        MemoryBloc* prevFree = nullptr;
    80002f98:	00000693          	li	a3,0

        while(curr > currFree){
    80002f9c:	02f77663          	bgeu	a4,a5,80002fc8 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
            prevFree = currFree;
    80002fa0:	00070693          	mv	a3,a4
            currFree = currFree->next;
    80002fa4:	00873703          	ld	a4,8(a4)
        while(curr > currFree){
    80002fa8:	ff5ff06f          	j	80002f9c <_ZN15MemoryAllocator8mem_freeEPv+0x50>
        takenMemBlocHead = takenMemBlocHead->next;
    80002fac:	0086b703          	ld	a4,8(a3)
    80002fb0:	00004697          	auipc	a3,0x4
    80002fb4:	2ce6b023          	sd	a4,704(a3) # 80007270 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80002fb8:	fd1ff06f          	j	80002f88 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
        freeMemBlocHead = curr;
    80002fbc:	00004717          	auipc	a4,0x4
    80002fc0:	2af73623          	sd	a5,684(a4) # 80007268 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002fc4:	0100006f          	j	80002fd4 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
        }

        if(currFree == freeMemBlocHead){
    80002fc8:	00e60c63          	beq	a2,a4,80002fe0 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
            curr->next = freeMemBlocHead;
            freeMemBlocHead = curr;
        }else{
            curr->next = currFree;
    80002fcc:	00e7b423          	sd	a4,8(a5)
            prevFree->next = curr;
    80002fd0:	00f6b423          	sd	a5,8(a3)
        }
    }

    MemoryBloc* currMemMerge = freeMemBlocHead;
    80002fd4:	00004797          	auipc	a5,0x4
    80002fd8:	2947b783          	ld	a5,660(a5) # 80007268 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002fdc:	0300006f          	j	8000300c <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
            curr->next = freeMemBlocHead;
    80002fe0:	00c7b423          	sd	a2,8(a5)
            freeMemBlocHead = curr;
    80002fe4:	00004717          	auipc	a4,0x4
    80002fe8:	28f73223          	sd	a5,644(a4) # 80007268 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80002fec:	fe9ff06f          	j	80002fd4 <_ZN15MemoryAllocator8mem_freeEPv+0x88>

    while(currMemMerge){
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
            currMemMerge->size += currMemMerge->next->size;
    80002ff0:	00073603          	ld	a2,0(a4)
    80002ff4:	00c686b3          	add	a3,a3,a2
    80002ff8:	00d7b023          	sd	a3,0(a5)
            currMemMerge->next = currMemMerge->next->next;
    80002ffc:	00873703          	ld	a4,8(a4)
    80003000:	00e7b423          	sd	a4,8(a5)
    80003004:	00078713          	mv	a4,a5
    80003008:	00070793          	mv	a5,a4
    while(currMemMerge){
    8000300c:	00078e63          	beqz	a5,80003028 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
    80003010:	0087b703          	ld	a4,8(a5)
    80003014:	fe070ae3          	beqz	a4,80003008 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80003018:	0007b683          	ld	a3,0(a5)
    8000301c:	00d78633          	add	a2,a5,a3
    80003020:	fec714e3          	bne	a4,a2,80003008 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80003024:	fcdff06f          	j	80002ff0 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            currMemMerge = currMemMerge->next;
        }
    }

    return 0;
    80003028:	00000513          	li	a0,0
    8000302c:	00813403          	ld	s0,8(sp)
    80003030:	01010113          	addi	sp,sp,16
    80003034:	00008067          	ret

0000000080003038 <_ZN6BufferC1Ei>:
#include "../h/buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003038:	fe010113          	addi	sp,sp,-32
    8000303c:	00113c23          	sd	ra,24(sp)
    80003040:	00813823          	sd	s0,16(sp)
    80003044:	00913423          	sd	s1,8(sp)
    80003048:	01213023          	sd	s2,0(sp)
    8000304c:	02010413          	addi	s0,sp,32
    80003050:	00050493          	mv	s1,a0
    80003054:	00058913          	mv	s2,a1
    80003058:	0015879b          	addiw	a5,a1,1
    8000305c:	0007851b          	sext.w	a0,a5
    80003060:	00f4a023          	sw	a5,0(s1)
    80003064:	0004a823          	sw	zero,16(s1)
    80003068:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000306c:	00251513          	slli	a0,a0,0x2
    80003070:	ffffe097          	auipc	ra,0xffffe
    80003074:	1e4080e7          	jalr	484(ra) # 80001254 <_Z9mem_allocm>
    80003078:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    8000307c:	00000593          	li	a1,0
    80003080:	02048513          	addi	a0,s1,32
    80003084:	ffffe097          	auipc	ra,0xffffe
    80003088:	2bc080e7          	jalr	700(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    sem_open(&spaceAvailable, _cap);
    8000308c:	00090593          	mv	a1,s2
    80003090:	01848513          	addi	a0,s1,24
    80003094:	ffffe097          	auipc	ra,0xffffe
    80003098:	2ac080e7          	jalr	684(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    sem_open(&mutexHead, 1);
    8000309c:	00100593          	li	a1,1
    800030a0:	02848513          	addi	a0,s1,40
    800030a4:	ffffe097          	auipc	ra,0xffffe
    800030a8:	29c080e7          	jalr	668(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
    sem_open(&mutexTail, 1);
    800030ac:	00100593          	li	a1,1
    800030b0:	03048513          	addi	a0,s1,48
    800030b4:	ffffe097          	auipc	ra,0xffffe
    800030b8:	28c080e7          	jalr	652(ra) # 80001340 <_Z8sem_openPP9KernelSemj>
}
    800030bc:	01813083          	ld	ra,24(sp)
    800030c0:	01013403          	ld	s0,16(sp)
    800030c4:	00813483          	ld	s1,8(sp)
    800030c8:	00013903          	ld	s2,0(sp)
    800030cc:	02010113          	addi	sp,sp,32
    800030d0:	00008067          	ret

00000000800030d4 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800030d4:	fe010113          	addi	sp,sp,-32
    800030d8:	00113c23          	sd	ra,24(sp)
    800030dc:	00813823          	sd	s0,16(sp)
    800030e0:	00913423          	sd	s1,8(sp)
    800030e4:	01213023          	sd	s2,0(sp)
    800030e8:	02010413          	addi	s0,sp,32
    800030ec:	00050493          	mv	s1,a0
    800030f0:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800030f4:	01853503          	ld	a0,24(a0)
    800030f8:	ffffe097          	auipc	ra,0xffffe
    800030fc:	2b0080e7          	jalr	688(ra) # 800013a8 <_Z8sem_waitP9KernelSem>

    sem_wait(mutexTail);
    80003100:	0304b503          	ld	a0,48(s1)
    80003104:	ffffe097          	auipc	ra,0xffffe
    80003108:	2a4080e7          	jalr	676(ra) # 800013a8 <_Z8sem_waitP9KernelSem>
    buffer[tail] = val;
    8000310c:	0084b783          	ld	a5,8(s1)
    80003110:	0144a703          	lw	a4,20(s1)
    80003114:	00271713          	slli	a4,a4,0x2
    80003118:	00e787b3          	add	a5,a5,a4
    8000311c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003120:	0144a783          	lw	a5,20(s1)
    80003124:	0017879b          	addiw	a5,a5,1
    80003128:	0004a703          	lw	a4,0(s1)
    8000312c:	02e7e7bb          	remw	a5,a5,a4
    80003130:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003134:	0304b503          	ld	a0,48(s1)
    80003138:	ffffe097          	auipc	ra,0xffffe
    8000313c:	2a0080e7          	jalr	672(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

    sem_signal(itemAvailable);
    80003140:	0204b503          	ld	a0,32(s1)
    80003144:	ffffe097          	auipc	ra,0xffffe
    80003148:	294080e7          	jalr	660(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

}
    8000314c:	01813083          	ld	ra,24(sp)
    80003150:	01013403          	ld	s0,16(sp)
    80003154:	00813483          	ld	s1,8(sp)
    80003158:	00013903          	ld	s2,0(sp)
    8000315c:	02010113          	addi	sp,sp,32
    80003160:	00008067          	ret

0000000080003164 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80003164:	fe010113          	addi	sp,sp,-32
    80003168:	00113c23          	sd	ra,24(sp)
    8000316c:	00813823          	sd	s0,16(sp)
    80003170:	00913423          	sd	s1,8(sp)
    80003174:	01213023          	sd	s2,0(sp)
    80003178:	02010413          	addi	s0,sp,32
    8000317c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80003180:	02053503          	ld	a0,32(a0)
    80003184:	ffffe097          	auipc	ra,0xffffe
    80003188:	224080e7          	jalr	548(ra) # 800013a8 <_Z8sem_waitP9KernelSem>

    sem_wait(mutexHead);
    8000318c:	0284b503          	ld	a0,40(s1)
    80003190:	ffffe097          	auipc	ra,0xffffe
    80003194:	218080e7          	jalr	536(ra) # 800013a8 <_Z8sem_waitP9KernelSem>

    int ret = buffer[head];
    80003198:	0084b703          	ld	a4,8(s1)
    8000319c:	0104a783          	lw	a5,16(s1)
    800031a0:	00279693          	slli	a3,a5,0x2
    800031a4:	00d70733          	add	a4,a4,a3
    800031a8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800031ac:	0017879b          	addiw	a5,a5,1
    800031b0:	0004a703          	lw	a4,0(s1)
    800031b4:	02e7e7bb          	remw	a5,a5,a4
    800031b8:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800031bc:	0284b503          	ld	a0,40(s1)
    800031c0:	ffffe097          	auipc	ra,0xffffe
    800031c4:	218080e7          	jalr	536(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

    sem_signal(spaceAvailable);
    800031c8:	0184b503          	ld	a0,24(s1)
    800031cc:	ffffe097          	auipc	ra,0xffffe
    800031d0:	20c080e7          	jalr	524(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

    return ret;
}
    800031d4:	00090513          	mv	a0,s2
    800031d8:	01813083          	ld	ra,24(sp)
    800031dc:	01013403          	ld	s0,16(sp)
    800031e0:	00813483          	ld	s1,8(sp)
    800031e4:	00013903          	ld	s2,0(sp)
    800031e8:	02010113          	addi	sp,sp,32
    800031ec:	00008067          	ret

00000000800031f0 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800031f0:	fe010113          	addi	sp,sp,-32
    800031f4:	00113c23          	sd	ra,24(sp)
    800031f8:	00813823          	sd	s0,16(sp)
    800031fc:	00913423          	sd	s1,8(sp)
    80003200:	01213023          	sd	s2,0(sp)
    80003204:	02010413          	addi	s0,sp,32
    80003208:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    8000320c:	02853503          	ld	a0,40(a0)
    80003210:	ffffe097          	auipc	ra,0xffffe
    80003214:	198080e7          	jalr	408(ra) # 800013a8 <_Z8sem_waitP9KernelSem>
    sem_wait(mutexTail);
    80003218:	0304b503          	ld	a0,48(s1)
    8000321c:	ffffe097          	auipc	ra,0xffffe
    80003220:	18c080e7          	jalr	396(ra) # 800013a8 <_Z8sem_waitP9KernelSem>

    if (tail >= head) {
    80003224:	0144a783          	lw	a5,20(s1)
    80003228:	0104a903          	lw	s2,16(s1)
    8000322c:	0327ce63          	blt	a5,s2,80003268 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80003230:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80003234:	0304b503          	ld	a0,48(s1)
    80003238:	ffffe097          	auipc	ra,0xffffe
    8000323c:	1a0080e7          	jalr	416(ra) # 800013d8 <_Z10sem_signalP9KernelSem>
    sem_signal(mutexHead);
    80003240:	0284b503          	ld	a0,40(s1)
    80003244:	ffffe097          	auipc	ra,0xffffe
    80003248:	194080e7          	jalr	404(ra) # 800013d8 <_Z10sem_signalP9KernelSem>

    return ret;
}
    8000324c:	00090513          	mv	a0,s2
    80003250:	01813083          	ld	ra,24(sp)
    80003254:	01013403          	ld	s0,16(sp)
    80003258:	00813483          	ld	s1,8(sp)
    8000325c:	00013903          	ld	s2,0(sp)
    80003260:	02010113          	addi	sp,sp,32
    80003264:	00008067          	ret
        ret = cap - head + tail;
    80003268:	0004a703          	lw	a4,0(s1)
    8000326c:	4127093b          	subw	s2,a4,s2
    80003270:	00f9093b          	addw	s2,s2,a5
    80003274:	fc1ff06f          	j	80003234 <_ZN6Buffer6getCntEv+0x44>

0000000080003278 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80003278:	fe010113          	addi	sp,sp,-32
    8000327c:	00113c23          	sd	ra,24(sp)
    80003280:	00813823          	sd	s0,16(sp)
    80003284:	00913423          	sd	s1,8(sp)
    80003288:	02010413          	addi	s0,sp,32
    8000328c:	00050493          	mv	s1,a0
    putc('\n');
    80003290:	00a00513          	li	a0,10
    80003294:	ffffe097          	auipc	ra,0xffffe
    80003298:	1a0080e7          	jalr	416(ra) # 80001434 <_Z4putcc>
    printString("Buffer deleted!\n");
    8000329c:	00003517          	auipc	a0,0x3
    800032a0:	d8450513          	addi	a0,a0,-636 # 80006020 <CONSOLE_STATUS+0x10>
    800032a4:	ffffe097          	auipc	ra,0xffffe
    800032a8:	48c080e7          	jalr	1164(ra) # 80001730 <_Z11printStringPKc>
    while (getCnt() > 0) {
    800032ac:	00048513          	mv	a0,s1
    800032b0:	00000097          	auipc	ra,0x0
    800032b4:	f40080e7          	jalr	-192(ra) # 800031f0 <_ZN6Buffer6getCntEv>
    800032b8:	02a05c63          	blez	a0,800032f0 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800032bc:	0084b783          	ld	a5,8(s1)
    800032c0:	0104a703          	lw	a4,16(s1)
    800032c4:	00271713          	slli	a4,a4,0x2
    800032c8:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800032cc:	0007c503          	lbu	a0,0(a5)
    800032d0:	ffffe097          	auipc	ra,0xffffe
    800032d4:	164080e7          	jalr	356(ra) # 80001434 <_Z4putcc>
        head = (head + 1) % cap;
    800032d8:	0104a783          	lw	a5,16(s1)
    800032dc:	0017879b          	addiw	a5,a5,1
    800032e0:	0004a703          	lw	a4,0(s1)
    800032e4:	02e7e7bb          	remw	a5,a5,a4
    800032e8:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800032ec:	fc1ff06f          	j	800032ac <_ZN6BufferD1Ev+0x34>
    putc('!');
    800032f0:	02100513          	li	a0,33
    800032f4:	ffffe097          	auipc	ra,0xffffe
    800032f8:	140080e7          	jalr	320(ra) # 80001434 <_Z4putcc>
    putc('\n');
    800032fc:	00a00513          	li	a0,10
    80003300:	ffffe097          	auipc	ra,0xffffe
    80003304:	134080e7          	jalr	308(ra) # 80001434 <_Z4putcc>
    mem_free(buffer);
    80003308:	0084b503          	ld	a0,8(s1)
    8000330c:	ffffe097          	auipc	ra,0xffffe
    80003310:	f78080e7          	jalr	-136(ra) # 80001284 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80003314:	0204b503          	ld	a0,32(s1)
    80003318:	ffffe097          	auipc	ra,0xffffe
    8000331c:	060080e7          	jalr	96(ra) # 80001378 <_Z9sem_closeP9KernelSem>
    sem_close(spaceAvailable);
    80003320:	0184b503          	ld	a0,24(s1)
    80003324:	ffffe097          	auipc	ra,0xffffe
    80003328:	054080e7          	jalr	84(ra) # 80001378 <_Z9sem_closeP9KernelSem>
    sem_close(mutexTail);
    8000332c:	0304b503          	ld	a0,48(s1)
    80003330:	ffffe097          	auipc	ra,0xffffe
    80003334:	048080e7          	jalr	72(ra) # 80001378 <_Z9sem_closeP9KernelSem>
    sem_close(mutexHead);
    80003338:	0284b503          	ld	a0,40(s1)
    8000333c:	ffffe097          	auipc	ra,0xffffe
    80003340:	03c080e7          	jalr	60(ra) # 80001378 <_Z9sem_closeP9KernelSem>
}
    80003344:	01813083          	ld	ra,24(sp)
    80003348:	01013403          	ld	s0,16(sp)
    8000334c:	00813483          	ld	s1,8(sp)
    80003350:	02010113          	addi	sp,sp,32
    80003354:	00008067          	ret

0000000080003358 <start>:
    80003358:	ff010113          	addi	sp,sp,-16
    8000335c:	00813423          	sd	s0,8(sp)
    80003360:	01010413          	addi	s0,sp,16
    80003364:	300027f3          	csrr	a5,mstatus
    80003368:	ffffe737          	lui	a4,0xffffe
    8000336c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff631f>
    80003370:	00e7f7b3          	and	a5,a5,a4
    80003374:	00001737          	lui	a4,0x1
    80003378:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000337c:	00e7e7b3          	or	a5,a5,a4
    80003380:	30079073          	csrw	mstatus,a5
    80003384:	00000797          	auipc	a5,0x0
    80003388:	16078793          	addi	a5,a5,352 # 800034e4 <system_main>
    8000338c:	34179073          	csrw	mepc,a5
    80003390:	00000793          	li	a5,0
    80003394:	18079073          	csrw	satp,a5
    80003398:	000107b7          	lui	a5,0x10
    8000339c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800033a0:	30279073          	csrw	medeleg,a5
    800033a4:	30379073          	csrw	mideleg,a5
    800033a8:	104027f3          	csrr	a5,sie
    800033ac:	2227e793          	ori	a5,a5,546
    800033b0:	10479073          	csrw	sie,a5
    800033b4:	fff00793          	li	a5,-1
    800033b8:	00a7d793          	srli	a5,a5,0xa
    800033bc:	3b079073          	csrw	pmpaddr0,a5
    800033c0:	00f00793          	li	a5,15
    800033c4:	3a079073          	csrw	pmpcfg0,a5
    800033c8:	f14027f3          	csrr	a5,mhartid
    800033cc:	0200c737          	lui	a4,0x200c
    800033d0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800033d4:	0007869b          	sext.w	a3,a5
    800033d8:	00269713          	slli	a4,a3,0x2
    800033dc:	000f4637          	lui	a2,0xf4
    800033e0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800033e4:	00d70733          	add	a4,a4,a3
    800033e8:	0037979b          	slliw	a5,a5,0x3
    800033ec:	020046b7          	lui	a3,0x2004
    800033f0:	00d787b3          	add	a5,a5,a3
    800033f4:	00c585b3          	add	a1,a1,a2
    800033f8:	00371693          	slli	a3,a4,0x3
    800033fc:	00004717          	auipc	a4,0x4
    80003400:	e8470713          	addi	a4,a4,-380 # 80007280 <timer_scratch>
    80003404:	00b7b023          	sd	a1,0(a5)
    80003408:	00d70733          	add	a4,a4,a3
    8000340c:	00f73c23          	sd	a5,24(a4)
    80003410:	02c73023          	sd	a2,32(a4)
    80003414:	34071073          	csrw	mscratch,a4
    80003418:	00000797          	auipc	a5,0x0
    8000341c:	6e878793          	addi	a5,a5,1768 # 80003b00 <timervec>
    80003420:	30579073          	csrw	mtvec,a5
    80003424:	300027f3          	csrr	a5,mstatus
    80003428:	0087e793          	ori	a5,a5,8
    8000342c:	30079073          	csrw	mstatus,a5
    80003430:	304027f3          	csrr	a5,mie
    80003434:	0807e793          	ori	a5,a5,128
    80003438:	30479073          	csrw	mie,a5
    8000343c:	f14027f3          	csrr	a5,mhartid
    80003440:	0007879b          	sext.w	a5,a5
    80003444:	00078213          	mv	tp,a5
    80003448:	30200073          	mret
    8000344c:	00813403          	ld	s0,8(sp)
    80003450:	01010113          	addi	sp,sp,16
    80003454:	00008067          	ret

0000000080003458 <timerinit>:
    80003458:	ff010113          	addi	sp,sp,-16
    8000345c:	00813423          	sd	s0,8(sp)
    80003460:	01010413          	addi	s0,sp,16
    80003464:	f14027f3          	csrr	a5,mhartid
    80003468:	0200c737          	lui	a4,0x200c
    8000346c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003470:	0007869b          	sext.w	a3,a5
    80003474:	00269713          	slli	a4,a3,0x2
    80003478:	000f4637          	lui	a2,0xf4
    8000347c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003480:	00d70733          	add	a4,a4,a3
    80003484:	0037979b          	slliw	a5,a5,0x3
    80003488:	020046b7          	lui	a3,0x2004
    8000348c:	00d787b3          	add	a5,a5,a3
    80003490:	00c585b3          	add	a1,a1,a2
    80003494:	00371693          	slli	a3,a4,0x3
    80003498:	00004717          	auipc	a4,0x4
    8000349c:	de870713          	addi	a4,a4,-536 # 80007280 <timer_scratch>
    800034a0:	00b7b023          	sd	a1,0(a5)
    800034a4:	00d70733          	add	a4,a4,a3
    800034a8:	00f73c23          	sd	a5,24(a4)
    800034ac:	02c73023          	sd	a2,32(a4)
    800034b0:	34071073          	csrw	mscratch,a4
    800034b4:	00000797          	auipc	a5,0x0
    800034b8:	64c78793          	addi	a5,a5,1612 # 80003b00 <timervec>
    800034bc:	30579073          	csrw	mtvec,a5
    800034c0:	300027f3          	csrr	a5,mstatus
    800034c4:	0087e793          	ori	a5,a5,8
    800034c8:	30079073          	csrw	mstatus,a5
    800034cc:	304027f3          	csrr	a5,mie
    800034d0:	0807e793          	ori	a5,a5,128
    800034d4:	30479073          	csrw	mie,a5
    800034d8:	00813403          	ld	s0,8(sp)
    800034dc:	01010113          	addi	sp,sp,16
    800034e0:	00008067          	ret

00000000800034e4 <system_main>:
    800034e4:	fe010113          	addi	sp,sp,-32
    800034e8:	00813823          	sd	s0,16(sp)
    800034ec:	00913423          	sd	s1,8(sp)
    800034f0:	00113c23          	sd	ra,24(sp)
    800034f4:	02010413          	addi	s0,sp,32
    800034f8:	00000097          	auipc	ra,0x0
    800034fc:	0c4080e7          	jalr	196(ra) # 800035bc <cpuid>
    80003500:	00004497          	auipc	s1,0x4
    80003504:	d0048493          	addi	s1,s1,-768 # 80007200 <started>
    80003508:	02050263          	beqz	a0,8000352c <system_main+0x48>
    8000350c:	0004a783          	lw	a5,0(s1)
    80003510:	0007879b          	sext.w	a5,a5
    80003514:	fe078ce3          	beqz	a5,8000350c <system_main+0x28>
    80003518:	0ff0000f          	fence
    8000351c:	00003517          	auipc	a0,0x3
    80003520:	c7450513          	addi	a0,a0,-908 # 80006190 <CONSOLE_STATUS+0x180>
    80003524:	00001097          	auipc	ra,0x1
    80003528:	a78080e7          	jalr	-1416(ra) # 80003f9c <panic>
    8000352c:	00001097          	auipc	ra,0x1
    80003530:	9cc080e7          	jalr	-1588(ra) # 80003ef8 <consoleinit>
    80003534:	00001097          	auipc	ra,0x1
    80003538:	158080e7          	jalr	344(ra) # 8000468c <printfinit>
    8000353c:	00003517          	auipc	a0,0x3
    80003540:	b3450513          	addi	a0,a0,-1228 # 80006070 <CONSOLE_STATUS+0x60>
    80003544:	00001097          	auipc	ra,0x1
    80003548:	ab4080e7          	jalr	-1356(ra) # 80003ff8 <__printf>
    8000354c:	00003517          	auipc	a0,0x3
    80003550:	c1450513          	addi	a0,a0,-1004 # 80006160 <CONSOLE_STATUS+0x150>
    80003554:	00001097          	auipc	ra,0x1
    80003558:	aa4080e7          	jalr	-1372(ra) # 80003ff8 <__printf>
    8000355c:	00003517          	auipc	a0,0x3
    80003560:	b1450513          	addi	a0,a0,-1260 # 80006070 <CONSOLE_STATUS+0x60>
    80003564:	00001097          	auipc	ra,0x1
    80003568:	a94080e7          	jalr	-1388(ra) # 80003ff8 <__printf>
    8000356c:	00001097          	auipc	ra,0x1
    80003570:	4ac080e7          	jalr	1196(ra) # 80004a18 <kinit>
    80003574:	00000097          	auipc	ra,0x0
    80003578:	148080e7          	jalr	328(ra) # 800036bc <trapinit>
    8000357c:	00000097          	auipc	ra,0x0
    80003580:	16c080e7          	jalr	364(ra) # 800036e8 <trapinithart>
    80003584:	00000097          	auipc	ra,0x0
    80003588:	5bc080e7          	jalr	1468(ra) # 80003b40 <plicinit>
    8000358c:	00000097          	auipc	ra,0x0
    80003590:	5dc080e7          	jalr	1500(ra) # 80003b68 <plicinithart>
    80003594:	00000097          	auipc	ra,0x0
    80003598:	078080e7          	jalr	120(ra) # 8000360c <userinit>
    8000359c:	0ff0000f          	fence
    800035a0:	00100793          	li	a5,1
    800035a4:	00003517          	auipc	a0,0x3
    800035a8:	bd450513          	addi	a0,a0,-1068 # 80006178 <CONSOLE_STATUS+0x168>
    800035ac:	00f4a023          	sw	a5,0(s1)
    800035b0:	00001097          	auipc	ra,0x1
    800035b4:	a48080e7          	jalr	-1464(ra) # 80003ff8 <__printf>
    800035b8:	0000006f          	j	800035b8 <system_main+0xd4>

00000000800035bc <cpuid>:
    800035bc:	ff010113          	addi	sp,sp,-16
    800035c0:	00813423          	sd	s0,8(sp)
    800035c4:	01010413          	addi	s0,sp,16
    800035c8:	00020513          	mv	a0,tp
    800035cc:	00813403          	ld	s0,8(sp)
    800035d0:	0005051b          	sext.w	a0,a0
    800035d4:	01010113          	addi	sp,sp,16
    800035d8:	00008067          	ret

00000000800035dc <mycpu>:
    800035dc:	ff010113          	addi	sp,sp,-16
    800035e0:	00813423          	sd	s0,8(sp)
    800035e4:	01010413          	addi	s0,sp,16
    800035e8:	00020793          	mv	a5,tp
    800035ec:	00813403          	ld	s0,8(sp)
    800035f0:	0007879b          	sext.w	a5,a5
    800035f4:	00779793          	slli	a5,a5,0x7
    800035f8:	00005517          	auipc	a0,0x5
    800035fc:	cb850513          	addi	a0,a0,-840 # 800082b0 <cpus>
    80003600:	00f50533          	add	a0,a0,a5
    80003604:	01010113          	addi	sp,sp,16
    80003608:	00008067          	ret

000000008000360c <userinit>:
    8000360c:	ff010113          	addi	sp,sp,-16
    80003610:	00813423          	sd	s0,8(sp)
    80003614:	01010413          	addi	s0,sp,16
    80003618:	00813403          	ld	s0,8(sp)
    8000361c:	01010113          	addi	sp,sp,16
    80003620:	fffff317          	auipc	t1,0xfffff
    80003624:	cd030067          	jr	-816(t1) # 800022f0 <main>

0000000080003628 <either_copyout>:
    80003628:	ff010113          	addi	sp,sp,-16
    8000362c:	00813023          	sd	s0,0(sp)
    80003630:	00113423          	sd	ra,8(sp)
    80003634:	01010413          	addi	s0,sp,16
    80003638:	02051663          	bnez	a0,80003664 <either_copyout+0x3c>
    8000363c:	00058513          	mv	a0,a1
    80003640:	00060593          	mv	a1,a2
    80003644:	0006861b          	sext.w	a2,a3
    80003648:	00002097          	auipc	ra,0x2
    8000364c:	c5c080e7          	jalr	-932(ra) # 800052a4 <__memmove>
    80003650:	00813083          	ld	ra,8(sp)
    80003654:	00013403          	ld	s0,0(sp)
    80003658:	00000513          	li	a0,0
    8000365c:	01010113          	addi	sp,sp,16
    80003660:	00008067          	ret
    80003664:	00003517          	auipc	a0,0x3
    80003668:	b5450513          	addi	a0,a0,-1196 # 800061b8 <CONSOLE_STATUS+0x1a8>
    8000366c:	00001097          	auipc	ra,0x1
    80003670:	930080e7          	jalr	-1744(ra) # 80003f9c <panic>

0000000080003674 <either_copyin>:
    80003674:	ff010113          	addi	sp,sp,-16
    80003678:	00813023          	sd	s0,0(sp)
    8000367c:	00113423          	sd	ra,8(sp)
    80003680:	01010413          	addi	s0,sp,16
    80003684:	02059463          	bnez	a1,800036ac <either_copyin+0x38>
    80003688:	00060593          	mv	a1,a2
    8000368c:	0006861b          	sext.w	a2,a3
    80003690:	00002097          	auipc	ra,0x2
    80003694:	c14080e7          	jalr	-1004(ra) # 800052a4 <__memmove>
    80003698:	00813083          	ld	ra,8(sp)
    8000369c:	00013403          	ld	s0,0(sp)
    800036a0:	00000513          	li	a0,0
    800036a4:	01010113          	addi	sp,sp,16
    800036a8:	00008067          	ret
    800036ac:	00003517          	auipc	a0,0x3
    800036b0:	b3450513          	addi	a0,a0,-1228 # 800061e0 <CONSOLE_STATUS+0x1d0>
    800036b4:	00001097          	auipc	ra,0x1
    800036b8:	8e8080e7          	jalr	-1816(ra) # 80003f9c <panic>

00000000800036bc <trapinit>:
    800036bc:	ff010113          	addi	sp,sp,-16
    800036c0:	00813423          	sd	s0,8(sp)
    800036c4:	01010413          	addi	s0,sp,16
    800036c8:	00813403          	ld	s0,8(sp)
    800036cc:	00003597          	auipc	a1,0x3
    800036d0:	b3c58593          	addi	a1,a1,-1220 # 80006208 <CONSOLE_STATUS+0x1f8>
    800036d4:	00005517          	auipc	a0,0x5
    800036d8:	c5c50513          	addi	a0,a0,-932 # 80008330 <tickslock>
    800036dc:	01010113          	addi	sp,sp,16
    800036e0:	00001317          	auipc	t1,0x1
    800036e4:	5c830067          	jr	1480(t1) # 80004ca8 <initlock>

00000000800036e8 <trapinithart>:
    800036e8:	ff010113          	addi	sp,sp,-16
    800036ec:	00813423          	sd	s0,8(sp)
    800036f0:	01010413          	addi	s0,sp,16
    800036f4:	00000797          	auipc	a5,0x0
    800036f8:	2fc78793          	addi	a5,a5,764 # 800039f0 <kernelvec>
    800036fc:	10579073          	csrw	stvec,a5
    80003700:	00813403          	ld	s0,8(sp)
    80003704:	01010113          	addi	sp,sp,16
    80003708:	00008067          	ret

000000008000370c <usertrap>:
    8000370c:	ff010113          	addi	sp,sp,-16
    80003710:	00813423          	sd	s0,8(sp)
    80003714:	01010413          	addi	s0,sp,16
    80003718:	00813403          	ld	s0,8(sp)
    8000371c:	01010113          	addi	sp,sp,16
    80003720:	00008067          	ret

0000000080003724 <usertrapret>:
    80003724:	ff010113          	addi	sp,sp,-16
    80003728:	00813423          	sd	s0,8(sp)
    8000372c:	01010413          	addi	s0,sp,16
    80003730:	00813403          	ld	s0,8(sp)
    80003734:	01010113          	addi	sp,sp,16
    80003738:	00008067          	ret

000000008000373c <kerneltrap>:
    8000373c:	fe010113          	addi	sp,sp,-32
    80003740:	00813823          	sd	s0,16(sp)
    80003744:	00113c23          	sd	ra,24(sp)
    80003748:	00913423          	sd	s1,8(sp)
    8000374c:	02010413          	addi	s0,sp,32
    80003750:	142025f3          	csrr	a1,scause
    80003754:	100027f3          	csrr	a5,sstatus
    80003758:	0027f793          	andi	a5,a5,2
    8000375c:	10079c63          	bnez	a5,80003874 <kerneltrap+0x138>
    80003760:	142027f3          	csrr	a5,scause
    80003764:	0207ce63          	bltz	a5,800037a0 <kerneltrap+0x64>
    80003768:	00003517          	auipc	a0,0x3
    8000376c:	ae850513          	addi	a0,a0,-1304 # 80006250 <CONSOLE_STATUS+0x240>
    80003770:	00001097          	auipc	ra,0x1
    80003774:	888080e7          	jalr	-1912(ra) # 80003ff8 <__printf>
    80003778:	141025f3          	csrr	a1,sepc
    8000377c:	14302673          	csrr	a2,stval
    80003780:	00003517          	auipc	a0,0x3
    80003784:	ae050513          	addi	a0,a0,-1312 # 80006260 <CONSOLE_STATUS+0x250>
    80003788:	00001097          	auipc	ra,0x1
    8000378c:	870080e7          	jalr	-1936(ra) # 80003ff8 <__printf>
    80003790:	00003517          	auipc	a0,0x3
    80003794:	ae850513          	addi	a0,a0,-1304 # 80006278 <CONSOLE_STATUS+0x268>
    80003798:	00001097          	auipc	ra,0x1
    8000379c:	804080e7          	jalr	-2044(ra) # 80003f9c <panic>
    800037a0:	0ff7f713          	andi	a4,a5,255
    800037a4:	00900693          	li	a3,9
    800037a8:	04d70063          	beq	a4,a3,800037e8 <kerneltrap+0xac>
    800037ac:	fff00713          	li	a4,-1
    800037b0:	03f71713          	slli	a4,a4,0x3f
    800037b4:	00170713          	addi	a4,a4,1
    800037b8:	fae798e3          	bne	a5,a4,80003768 <kerneltrap+0x2c>
    800037bc:	00000097          	auipc	ra,0x0
    800037c0:	e00080e7          	jalr	-512(ra) # 800035bc <cpuid>
    800037c4:	06050663          	beqz	a0,80003830 <kerneltrap+0xf4>
    800037c8:	144027f3          	csrr	a5,sip
    800037cc:	ffd7f793          	andi	a5,a5,-3
    800037d0:	14479073          	csrw	sip,a5
    800037d4:	01813083          	ld	ra,24(sp)
    800037d8:	01013403          	ld	s0,16(sp)
    800037dc:	00813483          	ld	s1,8(sp)
    800037e0:	02010113          	addi	sp,sp,32
    800037e4:	00008067          	ret
    800037e8:	00000097          	auipc	ra,0x0
    800037ec:	3cc080e7          	jalr	972(ra) # 80003bb4 <plic_claim>
    800037f0:	00a00793          	li	a5,10
    800037f4:	00050493          	mv	s1,a0
    800037f8:	06f50863          	beq	a0,a5,80003868 <kerneltrap+0x12c>
    800037fc:	fc050ce3          	beqz	a0,800037d4 <kerneltrap+0x98>
    80003800:	00050593          	mv	a1,a0
    80003804:	00003517          	auipc	a0,0x3
    80003808:	a2c50513          	addi	a0,a0,-1492 # 80006230 <CONSOLE_STATUS+0x220>
    8000380c:	00000097          	auipc	ra,0x0
    80003810:	7ec080e7          	jalr	2028(ra) # 80003ff8 <__printf>
    80003814:	01013403          	ld	s0,16(sp)
    80003818:	01813083          	ld	ra,24(sp)
    8000381c:	00048513          	mv	a0,s1
    80003820:	00813483          	ld	s1,8(sp)
    80003824:	02010113          	addi	sp,sp,32
    80003828:	00000317          	auipc	t1,0x0
    8000382c:	3c430067          	jr	964(t1) # 80003bec <plic_complete>
    80003830:	00005517          	auipc	a0,0x5
    80003834:	b0050513          	addi	a0,a0,-1280 # 80008330 <tickslock>
    80003838:	00001097          	auipc	ra,0x1
    8000383c:	494080e7          	jalr	1172(ra) # 80004ccc <acquire>
    80003840:	00004717          	auipc	a4,0x4
    80003844:	9c470713          	addi	a4,a4,-1596 # 80007204 <ticks>
    80003848:	00072783          	lw	a5,0(a4)
    8000384c:	00005517          	auipc	a0,0x5
    80003850:	ae450513          	addi	a0,a0,-1308 # 80008330 <tickslock>
    80003854:	0017879b          	addiw	a5,a5,1
    80003858:	00f72023          	sw	a5,0(a4)
    8000385c:	00001097          	auipc	ra,0x1
    80003860:	53c080e7          	jalr	1340(ra) # 80004d98 <release>
    80003864:	f65ff06f          	j	800037c8 <kerneltrap+0x8c>
    80003868:	00001097          	auipc	ra,0x1
    8000386c:	098080e7          	jalr	152(ra) # 80004900 <uartintr>
    80003870:	fa5ff06f          	j	80003814 <kerneltrap+0xd8>
    80003874:	00003517          	auipc	a0,0x3
    80003878:	99c50513          	addi	a0,a0,-1636 # 80006210 <CONSOLE_STATUS+0x200>
    8000387c:	00000097          	auipc	ra,0x0
    80003880:	720080e7          	jalr	1824(ra) # 80003f9c <panic>

0000000080003884 <clockintr>:
    80003884:	fe010113          	addi	sp,sp,-32
    80003888:	00813823          	sd	s0,16(sp)
    8000388c:	00913423          	sd	s1,8(sp)
    80003890:	00113c23          	sd	ra,24(sp)
    80003894:	02010413          	addi	s0,sp,32
    80003898:	00005497          	auipc	s1,0x5
    8000389c:	a9848493          	addi	s1,s1,-1384 # 80008330 <tickslock>
    800038a0:	00048513          	mv	a0,s1
    800038a4:	00001097          	auipc	ra,0x1
    800038a8:	428080e7          	jalr	1064(ra) # 80004ccc <acquire>
    800038ac:	00004717          	auipc	a4,0x4
    800038b0:	95870713          	addi	a4,a4,-1704 # 80007204 <ticks>
    800038b4:	00072783          	lw	a5,0(a4)
    800038b8:	01013403          	ld	s0,16(sp)
    800038bc:	01813083          	ld	ra,24(sp)
    800038c0:	00048513          	mv	a0,s1
    800038c4:	0017879b          	addiw	a5,a5,1
    800038c8:	00813483          	ld	s1,8(sp)
    800038cc:	00f72023          	sw	a5,0(a4)
    800038d0:	02010113          	addi	sp,sp,32
    800038d4:	00001317          	auipc	t1,0x1
    800038d8:	4c430067          	jr	1220(t1) # 80004d98 <release>

00000000800038dc <devintr>:
    800038dc:	142027f3          	csrr	a5,scause
    800038e0:	00000513          	li	a0,0
    800038e4:	0007c463          	bltz	a5,800038ec <devintr+0x10>
    800038e8:	00008067          	ret
    800038ec:	fe010113          	addi	sp,sp,-32
    800038f0:	00813823          	sd	s0,16(sp)
    800038f4:	00113c23          	sd	ra,24(sp)
    800038f8:	00913423          	sd	s1,8(sp)
    800038fc:	02010413          	addi	s0,sp,32
    80003900:	0ff7f713          	andi	a4,a5,255
    80003904:	00900693          	li	a3,9
    80003908:	04d70c63          	beq	a4,a3,80003960 <devintr+0x84>
    8000390c:	fff00713          	li	a4,-1
    80003910:	03f71713          	slli	a4,a4,0x3f
    80003914:	00170713          	addi	a4,a4,1
    80003918:	00e78c63          	beq	a5,a4,80003930 <devintr+0x54>
    8000391c:	01813083          	ld	ra,24(sp)
    80003920:	01013403          	ld	s0,16(sp)
    80003924:	00813483          	ld	s1,8(sp)
    80003928:	02010113          	addi	sp,sp,32
    8000392c:	00008067          	ret
    80003930:	00000097          	auipc	ra,0x0
    80003934:	c8c080e7          	jalr	-884(ra) # 800035bc <cpuid>
    80003938:	06050663          	beqz	a0,800039a4 <devintr+0xc8>
    8000393c:	144027f3          	csrr	a5,sip
    80003940:	ffd7f793          	andi	a5,a5,-3
    80003944:	14479073          	csrw	sip,a5
    80003948:	01813083          	ld	ra,24(sp)
    8000394c:	01013403          	ld	s0,16(sp)
    80003950:	00813483          	ld	s1,8(sp)
    80003954:	00200513          	li	a0,2
    80003958:	02010113          	addi	sp,sp,32
    8000395c:	00008067          	ret
    80003960:	00000097          	auipc	ra,0x0
    80003964:	254080e7          	jalr	596(ra) # 80003bb4 <plic_claim>
    80003968:	00a00793          	li	a5,10
    8000396c:	00050493          	mv	s1,a0
    80003970:	06f50663          	beq	a0,a5,800039dc <devintr+0x100>
    80003974:	00100513          	li	a0,1
    80003978:	fa0482e3          	beqz	s1,8000391c <devintr+0x40>
    8000397c:	00048593          	mv	a1,s1
    80003980:	00003517          	auipc	a0,0x3
    80003984:	8b050513          	addi	a0,a0,-1872 # 80006230 <CONSOLE_STATUS+0x220>
    80003988:	00000097          	auipc	ra,0x0
    8000398c:	670080e7          	jalr	1648(ra) # 80003ff8 <__printf>
    80003990:	00048513          	mv	a0,s1
    80003994:	00000097          	auipc	ra,0x0
    80003998:	258080e7          	jalr	600(ra) # 80003bec <plic_complete>
    8000399c:	00100513          	li	a0,1
    800039a0:	f7dff06f          	j	8000391c <devintr+0x40>
    800039a4:	00005517          	auipc	a0,0x5
    800039a8:	98c50513          	addi	a0,a0,-1652 # 80008330 <tickslock>
    800039ac:	00001097          	auipc	ra,0x1
    800039b0:	320080e7          	jalr	800(ra) # 80004ccc <acquire>
    800039b4:	00004717          	auipc	a4,0x4
    800039b8:	85070713          	addi	a4,a4,-1968 # 80007204 <ticks>
    800039bc:	00072783          	lw	a5,0(a4)
    800039c0:	00005517          	auipc	a0,0x5
    800039c4:	97050513          	addi	a0,a0,-1680 # 80008330 <tickslock>
    800039c8:	0017879b          	addiw	a5,a5,1
    800039cc:	00f72023          	sw	a5,0(a4)
    800039d0:	00001097          	auipc	ra,0x1
    800039d4:	3c8080e7          	jalr	968(ra) # 80004d98 <release>
    800039d8:	f65ff06f          	j	8000393c <devintr+0x60>
    800039dc:	00001097          	auipc	ra,0x1
    800039e0:	f24080e7          	jalr	-220(ra) # 80004900 <uartintr>
    800039e4:	fadff06f          	j	80003990 <devintr+0xb4>
	...

00000000800039f0 <kernelvec>:
    800039f0:	f0010113          	addi	sp,sp,-256
    800039f4:	00113023          	sd	ra,0(sp)
    800039f8:	00213423          	sd	sp,8(sp)
    800039fc:	00313823          	sd	gp,16(sp)
    80003a00:	00413c23          	sd	tp,24(sp)
    80003a04:	02513023          	sd	t0,32(sp)
    80003a08:	02613423          	sd	t1,40(sp)
    80003a0c:	02713823          	sd	t2,48(sp)
    80003a10:	02813c23          	sd	s0,56(sp)
    80003a14:	04913023          	sd	s1,64(sp)
    80003a18:	04a13423          	sd	a0,72(sp)
    80003a1c:	04b13823          	sd	a1,80(sp)
    80003a20:	04c13c23          	sd	a2,88(sp)
    80003a24:	06d13023          	sd	a3,96(sp)
    80003a28:	06e13423          	sd	a4,104(sp)
    80003a2c:	06f13823          	sd	a5,112(sp)
    80003a30:	07013c23          	sd	a6,120(sp)
    80003a34:	09113023          	sd	a7,128(sp)
    80003a38:	09213423          	sd	s2,136(sp)
    80003a3c:	09313823          	sd	s3,144(sp)
    80003a40:	09413c23          	sd	s4,152(sp)
    80003a44:	0b513023          	sd	s5,160(sp)
    80003a48:	0b613423          	sd	s6,168(sp)
    80003a4c:	0b713823          	sd	s7,176(sp)
    80003a50:	0b813c23          	sd	s8,184(sp)
    80003a54:	0d913023          	sd	s9,192(sp)
    80003a58:	0da13423          	sd	s10,200(sp)
    80003a5c:	0db13823          	sd	s11,208(sp)
    80003a60:	0dc13c23          	sd	t3,216(sp)
    80003a64:	0fd13023          	sd	t4,224(sp)
    80003a68:	0fe13423          	sd	t5,232(sp)
    80003a6c:	0ff13823          	sd	t6,240(sp)
    80003a70:	ccdff0ef          	jal	ra,8000373c <kerneltrap>
    80003a74:	00013083          	ld	ra,0(sp)
    80003a78:	00813103          	ld	sp,8(sp)
    80003a7c:	01013183          	ld	gp,16(sp)
    80003a80:	02013283          	ld	t0,32(sp)
    80003a84:	02813303          	ld	t1,40(sp)
    80003a88:	03013383          	ld	t2,48(sp)
    80003a8c:	03813403          	ld	s0,56(sp)
    80003a90:	04013483          	ld	s1,64(sp)
    80003a94:	04813503          	ld	a0,72(sp)
    80003a98:	05013583          	ld	a1,80(sp)
    80003a9c:	05813603          	ld	a2,88(sp)
    80003aa0:	06013683          	ld	a3,96(sp)
    80003aa4:	06813703          	ld	a4,104(sp)
    80003aa8:	07013783          	ld	a5,112(sp)
    80003aac:	07813803          	ld	a6,120(sp)
    80003ab0:	08013883          	ld	a7,128(sp)
    80003ab4:	08813903          	ld	s2,136(sp)
    80003ab8:	09013983          	ld	s3,144(sp)
    80003abc:	09813a03          	ld	s4,152(sp)
    80003ac0:	0a013a83          	ld	s5,160(sp)
    80003ac4:	0a813b03          	ld	s6,168(sp)
    80003ac8:	0b013b83          	ld	s7,176(sp)
    80003acc:	0b813c03          	ld	s8,184(sp)
    80003ad0:	0c013c83          	ld	s9,192(sp)
    80003ad4:	0c813d03          	ld	s10,200(sp)
    80003ad8:	0d013d83          	ld	s11,208(sp)
    80003adc:	0d813e03          	ld	t3,216(sp)
    80003ae0:	0e013e83          	ld	t4,224(sp)
    80003ae4:	0e813f03          	ld	t5,232(sp)
    80003ae8:	0f013f83          	ld	t6,240(sp)
    80003aec:	10010113          	addi	sp,sp,256
    80003af0:	10200073          	sret
    80003af4:	00000013          	nop
    80003af8:	00000013          	nop
    80003afc:	00000013          	nop

0000000080003b00 <timervec>:
    80003b00:	34051573          	csrrw	a0,mscratch,a0
    80003b04:	00b53023          	sd	a1,0(a0)
    80003b08:	00c53423          	sd	a2,8(a0)
    80003b0c:	00d53823          	sd	a3,16(a0)
    80003b10:	01853583          	ld	a1,24(a0)
    80003b14:	02053603          	ld	a2,32(a0)
    80003b18:	0005b683          	ld	a3,0(a1)
    80003b1c:	00c686b3          	add	a3,a3,a2
    80003b20:	00d5b023          	sd	a3,0(a1)
    80003b24:	00200593          	li	a1,2
    80003b28:	14459073          	csrw	sip,a1
    80003b2c:	01053683          	ld	a3,16(a0)
    80003b30:	00853603          	ld	a2,8(a0)
    80003b34:	00053583          	ld	a1,0(a0)
    80003b38:	34051573          	csrrw	a0,mscratch,a0
    80003b3c:	30200073          	mret

0000000080003b40 <plicinit>:
    80003b40:	ff010113          	addi	sp,sp,-16
    80003b44:	00813423          	sd	s0,8(sp)
    80003b48:	01010413          	addi	s0,sp,16
    80003b4c:	00813403          	ld	s0,8(sp)
    80003b50:	0c0007b7          	lui	a5,0xc000
    80003b54:	00100713          	li	a4,1
    80003b58:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80003b5c:	00e7a223          	sw	a4,4(a5)
    80003b60:	01010113          	addi	sp,sp,16
    80003b64:	00008067          	ret

0000000080003b68 <plicinithart>:
    80003b68:	ff010113          	addi	sp,sp,-16
    80003b6c:	00813023          	sd	s0,0(sp)
    80003b70:	00113423          	sd	ra,8(sp)
    80003b74:	01010413          	addi	s0,sp,16
    80003b78:	00000097          	auipc	ra,0x0
    80003b7c:	a44080e7          	jalr	-1468(ra) # 800035bc <cpuid>
    80003b80:	0085171b          	slliw	a4,a0,0x8
    80003b84:	0c0027b7          	lui	a5,0xc002
    80003b88:	00e787b3          	add	a5,a5,a4
    80003b8c:	40200713          	li	a4,1026
    80003b90:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003b94:	00813083          	ld	ra,8(sp)
    80003b98:	00013403          	ld	s0,0(sp)
    80003b9c:	00d5151b          	slliw	a0,a0,0xd
    80003ba0:	0c2017b7          	lui	a5,0xc201
    80003ba4:	00a78533          	add	a0,a5,a0
    80003ba8:	00052023          	sw	zero,0(a0)
    80003bac:	01010113          	addi	sp,sp,16
    80003bb0:	00008067          	ret

0000000080003bb4 <plic_claim>:
    80003bb4:	ff010113          	addi	sp,sp,-16
    80003bb8:	00813023          	sd	s0,0(sp)
    80003bbc:	00113423          	sd	ra,8(sp)
    80003bc0:	01010413          	addi	s0,sp,16
    80003bc4:	00000097          	auipc	ra,0x0
    80003bc8:	9f8080e7          	jalr	-1544(ra) # 800035bc <cpuid>
    80003bcc:	00813083          	ld	ra,8(sp)
    80003bd0:	00013403          	ld	s0,0(sp)
    80003bd4:	00d5151b          	slliw	a0,a0,0xd
    80003bd8:	0c2017b7          	lui	a5,0xc201
    80003bdc:	00a78533          	add	a0,a5,a0
    80003be0:	00452503          	lw	a0,4(a0)
    80003be4:	01010113          	addi	sp,sp,16
    80003be8:	00008067          	ret

0000000080003bec <plic_complete>:
    80003bec:	fe010113          	addi	sp,sp,-32
    80003bf0:	00813823          	sd	s0,16(sp)
    80003bf4:	00913423          	sd	s1,8(sp)
    80003bf8:	00113c23          	sd	ra,24(sp)
    80003bfc:	02010413          	addi	s0,sp,32
    80003c00:	00050493          	mv	s1,a0
    80003c04:	00000097          	auipc	ra,0x0
    80003c08:	9b8080e7          	jalr	-1608(ra) # 800035bc <cpuid>
    80003c0c:	01813083          	ld	ra,24(sp)
    80003c10:	01013403          	ld	s0,16(sp)
    80003c14:	00d5179b          	slliw	a5,a0,0xd
    80003c18:	0c201737          	lui	a4,0xc201
    80003c1c:	00f707b3          	add	a5,a4,a5
    80003c20:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003c24:	00813483          	ld	s1,8(sp)
    80003c28:	02010113          	addi	sp,sp,32
    80003c2c:	00008067          	ret

0000000080003c30 <consolewrite>:
    80003c30:	fb010113          	addi	sp,sp,-80
    80003c34:	04813023          	sd	s0,64(sp)
    80003c38:	04113423          	sd	ra,72(sp)
    80003c3c:	02913c23          	sd	s1,56(sp)
    80003c40:	03213823          	sd	s2,48(sp)
    80003c44:	03313423          	sd	s3,40(sp)
    80003c48:	03413023          	sd	s4,32(sp)
    80003c4c:	01513c23          	sd	s5,24(sp)
    80003c50:	05010413          	addi	s0,sp,80
    80003c54:	06c05c63          	blez	a2,80003ccc <consolewrite+0x9c>
    80003c58:	00060993          	mv	s3,a2
    80003c5c:	00050a13          	mv	s4,a0
    80003c60:	00058493          	mv	s1,a1
    80003c64:	00000913          	li	s2,0
    80003c68:	fff00a93          	li	s5,-1
    80003c6c:	01c0006f          	j	80003c88 <consolewrite+0x58>
    80003c70:	fbf44503          	lbu	a0,-65(s0)
    80003c74:	0019091b          	addiw	s2,s2,1
    80003c78:	00148493          	addi	s1,s1,1
    80003c7c:	00001097          	auipc	ra,0x1
    80003c80:	a9c080e7          	jalr	-1380(ra) # 80004718 <uartputc>
    80003c84:	03298063          	beq	s3,s2,80003ca4 <consolewrite+0x74>
    80003c88:	00048613          	mv	a2,s1
    80003c8c:	00100693          	li	a3,1
    80003c90:	000a0593          	mv	a1,s4
    80003c94:	fbf40513          	addi	a0,s0,-65
    80003c98:	00000097          	auipc	ra,0x0
    80003c9c:	9dc080e7          	jalr	-1572(ra) # 80003674 <either_copyin>
    80003ca0:	fd5518e3          	bne	a0,s5,80003c70 <consolewrite+0x40>
    80003ca4:	04813083          	ld	ra,72(sp)
    80003ca8:	04013403          	ld	s0,64(sp)
    80003cac:	03813483          	ld	s1,56(sp)
    80003cb0:	02813983          	ld	s3,40(sp)
    80003cb4:	02013a03          	ld	s4,32(sp)
    80003cb8:	01813a83          	ld	s5,24(sp)
    80003cbc:	00090513          	mv	a0,s2
    80003cc0:	03013903          	ld	s2,48(sp)
    80003cc4:	05010113          	addi	sp,sp,80
    80003cc8:	00008067          	ret
    80003ccc:	00000913          	li	s2,0
    80003cd0:	fd5ff06f          	j	80003ca4 <consolewrite+0x74>

0000000080003cd4 <consoleread>:
    80003cd4:	f9010113          	addi	sp,sp,-112
    80003cd8:	06813023          	sd	s0,96(sp)
    80003cdc:	04913c23          	sd	s1,88(sp)
    80003ce0:	05213823          	sd	s2,80(sp)
    80003ce4:	05313423          	sd	s3,72(sp)
    80003ce8:	05413023          	sd	s4,64(sp)
    80003cec:	03513c23          	sd	s5,56(sp)
    80003cf0:	03613823          	sd	s6,48(sp)
    80003cf4:	03713423          	sd	s7,40(sp)
    80003cf8:	03813023          	sd	s8,32(sp)
    80003cfc:	06113423          	sd	ra,104(sp)
    80003d00:	01913c23          	sd	s9,24(sp)
    80003d04:	07010413          	addi	s0,sp,112
    80003d08:	00060b93          	mv	s7,a2
    80003d0c:	00050913          	mv	s2,a0
    80003d10:	00058c13          	mv	s8,a1
    80003d14:	00060b1b          	sext.w	s6,a2
    80003d18:	00004497          	auipc	s1,0x4
    80003d1c:	64048493          	addi	s1,s1,1600 # 80008358 <cons>
    80003d20:	00400993          	li	s3,4
    80003d24:	fff00a13          	li	s4,-1
    80003d28:	00a00a93          	li	s5,10
    80003d2c:	05705e63          	blez	s7,80003d88 <consoleread+0xb4>
    80003d30:	09c4a703          	lw	a4,156(s1)
    80003d34:	0984a783          	lw	a5,152(s1)
    80003d38:	0007071b          	sext.w	a4,a4
    80003d3c:	08e78463          	beq	a5,a4,80003dc4 <consoleread+0xf0>
    80003d40:	07f7f713          	andi	a4,a5,127
    80003d44:	00e48733          	add	a4,s1,a4
    80003d48:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80003d4c:	0017869b          	addiw	a3,a5,1
    80003d50:	08d4ac23          	sw	a3,152(s1)
    80003d54:	00070c9b          	sext.w	s9,a4
    80003d58:	0b370663          	beq	a4,s3,80003e04 <consoleread+0x130>
    80003d5c:	00100693          	li	a3,1
    80003d60:	f9f40613          	addi	a2,s0,-97
    80003d64:	000c0593          	mv	a1,s8
    80003d68:	00090513          	mv	a0,s2
    80003d6c:	f8e40fa3          	sb	a4,-97(s0)
    80003d70:	00000097          	auipc	ra,0x0
    80003d74:	8b8080e7          	jalr	-1864(ra) # 80003628 <either_copyout>
    80003d78:	01450863          	beq	a0,s4,80003d88 <consoleread+0xb4>
    80003d7c:	001c0c13          	addi	s8,s8,1
    80003d80:	fffb8b9b          	addiw	s7,s7,-1
    80003d84:	fb5c94e3          	bne	s9,s5,80003d2c <consoleread+0x58>
    80003d88:	000b851b          	sext.w	a0,s7
    80003d8c:	06813083          	ld	ra,104(sp)
    80003d90:	06013403          	ld	s0,96(sp)
    80003d94:	05813483          	ld	s1,88(sp)
    80003d98:	05013903          	ld	s2,80(sp)
    80003d9c:	04813983          	ld	s3,72(sp)
    80003da0:	04013a03          	ld	s4,64(sp)
    80003da4:	03813a83          	ld	s5,56(sp)
    80003da8:	02813b83          	ld	s7,40(sp)
    80003dac:	02013c03          	ld	s8,32(sp)
    80003db0:	01813c83          	ld	s9,24(sp)
    80003db4:	40ab053b          	subw	a0,s6,a0
    80003db8:	03013b03          	ld	s6,48(sp)
    80003dbc:	07010113          	addi	sp,sp,112
    80003dc0:	00008067          	ret
    80003dc4:	00001097          	auipc	ra,0x1
    80003dc8:	1d8080e7          	jalr	472(ra) # 80004f9c <push_on>
    80003dcc:	0984a703          	lw	a4,152(s1)
    80003dd0:	09c4a783          	lw	a5,156(s1)
    80003dd4:	0007879b          	sext.w	a5,a5
    80003dd8:	fef70ce3          	beq	a4,a5,80003dd0 <consoleread+0xfc>
    80003ddc:	00001097          	auipc	ra,0x1
    80003de0:	234080e7          	jalr	564(ra) # 80005010 <pop_on>
    80003de4:	0984a783          	lw	a5,152(s1)
    80003de8:	07f7f713          	andi	a4,a5,127
    80003dec:	00e48733          	add	a4,s1,a4
    80003df0:	01874703          	lbu	a4,24(a4)
    80003df4:	0017869b          	addiw	a3,a5,1
    80003df8:	08d4ac23          	sw	a3,152(s1)
    80003dfc:	00070c9b          	sext.w	s9,a4
    80003e00:	f5371ee3          	bne	a4,s3,80003d5c <consoleread+0x88>
    80003e04:	000b851b          	sext.w	a0,s7
    80003e08:	f96bf2e3          	bgeu	s7,s6,80003d8c <consoleread+0xb8>
    80003e0c:	08f4ac23          	sw	a5,152(s1)
    80003e10:	f7dff06f          	j	80003d8c <consoleread+0xb8>

0000000080003e14 <consputc>:
    80003e14:	10000793          	li	a5,256
    80003e18:	00f50663          	beq	a0,a5,80003e24 <consputc+0x10>
    80003e1c:	00001317          	auipc	t1,0x1
    80003e20:	9f430067          	jr	-1548(t1) # 80004810 <uartputc_sync>
    80003e24:	ff010113          	addi	sp,sp,-16
    80003e28:	00113423          	sd	ra,8(sp)
    80003e2c:	00813023          	sd	s0,0(sp)
    80003e30:	01010413          	addi	s0,sp,16
    80003e34:	00800513          	li	a0,8
    80003e38:	00001097          	auipc	ra,0x1
    80003e3c:	9d8080e7          	jalr	-1576(ra) # 80004810 <uartputc_sync>
    80003e40:	02000513          	li	a0,32
    80003e44:	00001097          	auipc	ra,0x1
    80003e48:	9cc080e7          	jalr	-1588(ra) # 80004810 <uartputc_sync>
    80003e4c:	00013403          	ld	s0,0(sp)
    80003e50:	00813083          	ld	ra,8(sp)
    80003e54:	00800513          	li	a0,8
    80003e58:	01010113          	addi	sp,sp,16
    80003e5c:	00001317          	auipc	t1,0x1
    80003e60:	9b430067          	jr	-1612(t1) # 80004810 <uartputc_sync>

0000000080003e64 <consoleintr>:
    80003e64:	fe010113          	addi	sp,sp,-32
    80003e68:	00813823          	sd	s0,16(sp)
    80003e6c:	00913423          	sd	s1,8(sp)
    80003e70:	01213023          	sd	s2,0(sp)
    80003e74:	00113c23          	sd	ra,24(sp)
    80003e78:	02010413          	addi	s0,sp,32
    80003e7c:	00004917          	auipc	s2,0x4
    80003e80:	4dc90913          	addi	s2,s2,1244 # 80008358 <cons>
    80003e84:	00050493          	mv	s1,a0
    80003e88:	00090513          	mv	a0,s2
    80003e8c:	00001097          	auipc	ra,0x1
    80003e90:	e40080e7          	jalr	-448(ra) # 80004ccc <acquire>
    80003e94:	02048c63          	beqz	s1,80003ecc <consoleintr+0x68>
    80003e98:	0a092783          	lw	a5,160(s2)
    80003e9c:	09892703          	lw	a4,152(s2)
    80003ea0:	07f00693          	li	a3,127
    80003ea4:	40e7873b          	subw	a4,a5,a4
    80003ea8:	02e6e263          	bltu	a3,a4,80003ecc <consoleintr+0x68>
    80003eac:	00d00713          	li	a4,13
    80003eb0:	04e48063          	beq	s1,a4,80003ef0 <consoleintr+0x8c>
    80003eb4:	07f7f713          	andi	a4,a5,127
    80003eb8:	00e90733          	add	a4,s2,a4
    80003ebc:	0017879b          	addiw	a5,a5,1
    80003ec0:	0af92023          	sw	a5,160(s2)
    80003ec4:	00970c23          	sb	s1,24(a4)
    80003ec8:	08f92e23          	sw	a5,156(s2)
    80003ecc:	01013403          	ld	s0,16(sp)
    80003ed0:	01813083          	ld	ra,24(sp)
    80003ed4:	00813483          	ld	s1,8(sp)
    80003ed8:	00013903          	ld	s2,0(sp)
    80003edc:	00004517          	auipc	a0,0x4
    80003ee0:	47c50513          	addi	a0,a0,1148 # 80008358 <cons>
    80003ee4:	02010113          	addi	sp,sp,32
    80003ee8:	00001317          	auipc	t1,0x1
    80003eec:	eb030067          	jr	-336(t1) # 80004d98 <release>
    80003ef0:	00a00493          	li	s1,10
    80003ef4:	fc1ff06f          	j	80003eb4 <consoleintr+0x50>

0000000080003ef8 <consoleinit>:
    80003ef8:	fe010113          	addi	sp,sp,-32
    80003efc:	00113c23          	sd	ra,24(sp)
    80003f00:	00813823          	sd	s0,16(sp)
    80003f04:	00913423          	sd	s1,8(sp)
    80003f08:	02010413          	addi	s0,sp,32
    80003f0c:	00004497          	auipc	s1,0x4
    80003f10:	44c48493          	addi	s1,s1,1100 # 80008358 <cons>
    80003f14:	00048513          	mv	a0,s1
    80003f18:	00002597          	auipc	a1,0x2
    80003f1c:	37058593          	addi	a1,a1,880 # 80006288 <CONSOLE_STATUS+0x278>
    80003f20:	00001097          	auipc	ra,0x1
    80003f24:	d88080e7          	jalr	-632(ra) # 80004ca8 <initlock>
    80003f28:	00000097          	auipc	ra,0x0
    80003f2c:	7ac080e7          	jalr	1964(ra) # 800046d4 <uartinit>
    80003f30:	01813083          	ld	ra,24(sp)
    80003f34:	01013403          	ld	s0,16(sp)
    80003f38:	00000797          	auipc	a5,0x0
    80003f3c:	d9c78793          	addi	a5,a5,-612 # 80003cd4 <consoleread>
    80003f40:	0af4bc23          	sd	a5,184(s1)
    80003f44:	00000797          	auipc	a5,0x0
    80003f48:	cec78793          	addi	a5,a5,-788 # 80003c30 <consolewrite>
    80003f4c:	0cf4b023          	sd	a5,192(s1)
    80003f50:	00813483          	ld	s1,8(sp)
    80003f54:	02010113          	addi	sp,sp,32
    80003f58:	00008067          	ret

0000000080003f5c <console_read>:
    80003f5c:	ff010113          	addi	sp,sp,-16
    80003f60:	00813423          	sd	s0,8(sp)
    80003f64:	01010413          	addi	s0,sp,16
    80003f68:	00813403          	ld	s0,8(sp)
    80003f6c:	00004317          	auipc	t1,0x4
    80003f70:	4a433303          	ld	t1,1188(t1) # 80008410 <devsw+0x10>
    80003f74:	01010113          	addi	sp,sp,16
    80003f78:	00030067          	jr	t1

0000000080003f7c <console_write>:
    80003f7c:	ff010113          	addi	sp,sp,-16
    80003f80:	00813423          	sd	s0,8(sp)
    80003f84:	01010413          	addi	s0,sp,16
    80003f88:	00813403          	ld	s0,8(sp)
    80003f8c:	00004317          	auipc	t1,0x4
    80003f90:	48c33303          	ld	t1,1164(t1) # 80008418 <devsw+0x18>
    80003f94:	01010113          	addi	sp,sp,16
    80003f98:	00030067          	jr	t1

0000000080003f9c <panic>:
    80003f9c:	fe010113          	addi	sp,sp,-32
    80003fa0:	00113c23          	sd	ra,24(sp)
    80003fa4:	00813823          	sd	s0,16(sp)
    80003fa8:	00913423          	sd	s1,8(sp)
    80003fac:	02010413          	addi	s0,sp,32
    80003fb0:	00050493          	mv	s1,a0
    80003fb4:	00002517          	auipc	a0,0x2
    80003fb8:	2dc50513          	addi	a0,a0,732 # 80006290 <CONSOLE_STATUS+0x280>
    80003fbc:	00004797          	auipc	a5,0x4
    80003fc0:	4e07ae23          	sw	zero,1276(a5) # 800084b8 <pr+0x18>
    80003fc4:	00000097          	auipc	ra,0x0
    80003fc8:	034080e7          	jalr	52(ra) # 80003ff8 <__printf>
    80003fcc:	00048513          	mv	a0,s1
    80003fd0:	00000097          	auipc	ra,0x0
    80003fd4:	028080e7          	jalr	40(ra) # 80003ff8 <__printf>
    80003fd8:	00002517          	auipc	a0,0x2
    80003fdc:	09850513          	addi	a0,a0,152 # 80006070 <CONSOLE_STATUS+0x60>
    80003fe0:	00000097          	auipc	ra,0x0
    80003fe4:	018080e7          	jalr	24(ra) # 80003ff8 <__printf>
    80003fe8:	00100793          	li	a5,1
    80003fec:	00003717          	auipc	a4,0x3
    80003ff0:	20f72e23          	sw	a5,540(a4) # 80007208 <panicked>
    80003ff4:	0000006f          	j	80003ff4 <panic+0x58>

0000000080003ff8 <__printf>:
    80003ff8:	f3010113          	addi	sp,sp,-208
    80003ffc:	08813023          	sd	s0,128(sp)
    80004000:	07313423          	sd	s3,104(sp)
    80004004:	09010413          	addi	s0,sp,144
    80004008:	05813023          	sd	s8,64(sp)
    8000400c:	08113423          	sd	ra,136(sp)
    80004010:	06913c23          	sd	s1,120(sp)
    80004014:	07213823          	sd	s2,112(sp)
    80004018:	07413023          	sd	s4,96(sp)
    8000401c:	05513c23          	sd	s5,88(sp)
    80004020:	05613823          	sd	s6,80(sp)
    80004024:	05713423          	sd	s7,72(sp)
    80004028:	03913c23          	sd	s9,56(sp)
    8000402c:	03a13823          	sd	s10,48(sp)
    80004030:	03b13423          	sd	s11,40(sp)
    80004034:	00004317          	auipc	t1,0x4
    80004038:	46c30313          	addi	t1,t1,1132 # 800084a0 <pr>
    8000403c:	01832c03          	lw	s8,24(t1)
    80004040:	00b43423          	sd	a1,8(s0)
    80004044:	00c43823          	sd	a2,16(s0)
    80004048:	00d43c23          	sd	a3,24(s0)
    8000404c:	02e43023          	sd	a4,32(s0)
    80004050:	02f43423          	sd	a5,40(s0)
    80004054:	03043823          	sd	a6,48(s0)
    80004058:	03143c23          	sd	a7,56(s0)
    8000405c:	00050993          	mv	s3,a0
    80004060:	4a0c1663          	bnez	s8,8000450c <__printf+0x514>
    80004064:	60098c63          	beqz	s3,8000467c <__printf+0x684>
    80004068:	0009c503          	lbu	a0,0(s3)
    8000406c:	00840793          	addi	a5,s0,8
    80004070:	f6f43c23          	sd	a5,-136(s0)
    80004074:	00000493          	li	s1,0
    80004078:	22050063          	beqz	a0,80004298 <__printf+0x2a0>
    8000407c:	00002a37          	lui	s4,0x2
    80004080:	00018ab7          	lui	s5,0x18
    80004084:	000f4b37          	lui	s6,0xf4
    80004088:	00989bb7          	lui	s7,0x989
    8000408c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004090:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004094:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004098:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000409c:	00148c9b          	addiw	s9,s1,1
    800040a0:	02500793          	li	a5,37
    800040a4:	01998933          	add	s2,s3,s9
    800040a8:	38f51263          	bne	a0,a5,8000442c <__printf+0x434>
    800040ac:	00094783          	lbu	a5,0(s2)
    800040b0:	00078c9b          	sext.w	s9,a5
    800040b4:	1e078263          	beqz	a5,80004298 <__printf+0x2a0>
    800040b8:	0024849b          	addiw	s1,s1,2
    800040bc:	07000713          	li	a4,112
    800040c0:	00998933          	add	s2,s3,s1
    800040c4:	38e78a63          	beq	a5,a4,80004458 <__printf+0x460>
    800040c8:	20f76863          	bltu	a4,a5,800042d8 <__printf+0x2e0>
    800040cc:	42a78863          	beq	a5,a0,800044fc <__printf+0x504>
    800040d0:	06400713          	li	a4,100
    800040d4:	40e79663          	bne	a5,a4,800044e0 <__printf+0x4e8>
    800040d8:	f7843783          	ld	a5,-136(s0)
    800040dc:	0007a603          	lw	a2,0(a5)
    800040e0:	00878793          	addi	a5,a5,8
    800040e4:	f6f43c23          	sd	a5,-136(s0)
    800040e8:	42064a63          	bltz	a2,8000451c <__printf+0x524>
    800040ec:	00a00713          	li	a4,10
    800040f0:	02e677bb          	remuw	a5,a2,a4
    800040f4:	00002d97          	auipc	s11,0x2
    800040f8:	1c4d8d93          	addi	s11,s11,452 # 800062b8 <digits>
    800040fc:	00900593          	li	a1,9
    80004100:	0006051b          	sext.w	a0,a2
    80004104:	00000c93          	li	s9,0
    80004108:	02079793          	slli	a5,a5,0x20
    8000410c:	0207d793          	srli	a5,a5,0x20
    80004110:	00fd87b3          	add	a5,s11,a5
    80004114:	0007c783          	lbu	a5,0(a5)
    80004118:	02e656bb          	divuw	a3,a2,a4
    8000411c:	f8f40023          	sb	a5,-128(s0)
    80004120:	14c5d863          	bge	a1,a2,80004270 <__printf+0x278>
    80004124:	06300593          	li	a1,99
    80004128:	00100c93          	li	s9,1
    8000412c:	02e6f7bb          	remuw	a5,a3,a4
    80004130:	02079793          	slli	a5,a5,0x20
    80004134:	0207d793          	srli	a5,a5,0x20
    80004138:	00fd87b3          	add	a5,s11,a5
    8000413c:	0007c783          	lbu	a5,0(a5)
    80004140:	02e6d73b          	divuw	a4,a3,a4
    80004144:	f8f400a3          	sb	a5,-127(s0)
    80004148:	12a5f463          	bgeu	a1,a0,80004270 <__printf+0x278>
    8000414c:	00a00693          	li	a3,10
    80004150:	00900593          	li	a1,9
    80004154:	02d777bb          	remuw	a5,a4,a3
    80004158:	02079793          	slli	a5,a5,0x20
    8000415c:	0207d793          	srli	a5,a5,0x20
    80004160:	00fd87b3          	add	a5,s11,a5
    80004164:	0007c503          	lbu	a0,0(a5)
    80004168:	02d757bb          	divuw	a5,a4,a3
    8000416c:	f8a40123          	sb	a0,-126(s0)
    80004170:	48e5f263          	bgeu	a1,a4,800045f4 <__printf+0x5fc>
    80004174:	06300513          	li	a0,99
    80004178:	02d7f5bb          	remuw	a1,a5,a3
    8000417c:	02059593          	slli	a1,a1,0x20
    80004180:	0205d593          	srli	a1,a1,0x20
    80004184:	00bd85b3          	add	a1,s11,a1
    80004188:	0005c583          	lbu	a1,0(a1)
    8000418c:	02d7d7bb          	divuw	a5,a5,a3
    80004190:	f8b401a3          	sb	a1,-125(s0)
    80004194:	48e57263          	bgeu	a0,a4,80004618 <__printf+0x620>
    80004198:	3e700513          	li	a0,999
    8000419c:	02d7f5bb          	remuw	a1,a5,a3
    800041a0:	02059593          	slli	a1,a1,0x20
    800041a4:	0205d593          	srli	a1,a1,0x20
    800041a8:	00bd85b3          	add	a1,s11,a1
    800041ac:	0005c583          	lbu	a1,0(a1)
    800041b0:	02d7d7bb          	divuw	a5,a5,a3
    800041b4:	f8b40223          	sb	a1,-124(s0)
    800041b8:	46e57663          	bgeu	a0,a4,80004624 <__printf+0x62c>
    800041bc:	02d7f5bb          	remuw	a1,a5,a3
    800041c0:	02059593          	slli	a1,a1,0x20
    800041c4:	0205d593          	srli	a1,a1,0x20
    800041c8:	00bd85b3          	add	a1,s11,a1
    800041cc:	0005c583          	lbu	a1,0(a1)
    800041d0:	02d7d7bb          	divuw	a5,a5,a3
    800041d4:	f8b402a3          	sb	a1,-123(s0)
    800041d8:	46ea7863          	bgeu	s4,a4,80004648 <__printf+0x650>
    800041dc:	02d7f5bb          	remuw	a1,a5,a3
    800041e0:	02059593          	slli	a1,a1,0x20
    800041e4:	0205d593          	srli	a1,a1,0x20
    800041e8:	00bd85b3          	add	a1,s11,a1
    800041ec:	0005c583          	lbu	a1,0(a1)
    800041f0:	02d7d7bb          	divuw	a5,a5,a3
    800041f4:	f8b40323          	sb	a1,-122(s0)
    800041f8:	3eeaf863          	bgeu	s5,a4,800045e8 <__printf+0x5f0>
    800041fc:	02d7f5bb          	remuw	a1,a5,a3
    80004200:	02059593          	slli	a1,a1,0x20
    80004204:	0205d593          	srli	a1,a1,0x20
    80004208:	00bd85b3          	add	a1,s11,a1
    8000420c:	0005c583          	lbu	a1,0(a1)
    80004210:	02d7d7bb          	divuw	a5,a5,a3
    80004214:	f8b403a3          	sb	a1,-121(s0)
    80004218:	42eb7e63          	bgeu	s6,a4,80004654 <__printf+0x65c>
    8000421c:	02d7f5bb          	remuw	a1,a5,a3
    80004220:	02059593          	slli	a1,a1,0x20
    80004224:	0205d593          	srli	a1,a1,0x20
    80004228:	00bd85b3          	add	a1,s11,a1
    8000422c:	0005c583          	lbu	a1,0(a1)
    80004230:	02d7d7bb          	divuw	a5,a5,a3
    80004234:	f8b40423          	sb	a1,-120(s0)
    80004238:	42ebfc63          	bgeu	s7,a4,80004670 <__printf+0x678>
    8000423c:	02079793          	slli	a5,a5,0x20
    80004240:	0207d793          	srli	a5,a5,0x20
    80004244:	00fd8db3          	add	s11,s11,a5
    80004248:	000dc703          	lbu	a4,0(s11)
    8000424c:	00a00793          	li	a5,10
    80004250:	00900c93          	li	s9,9
    80004254:	f8e404a3          	sb	a4,-119(s0)
    80004258:	00065c63          	bgez	a2,80004270 <__printf+0x278>
    8000425c:	f9040713          	addi	a4,s0,-112
    80004260:	00f70733          	add	a4,a4,a5
    80004264:	02d00693          	li	a3,45
    80004268:	fed70823          	sb	a3,-16(a4)
    8000426c:	00078c93          	mv	s9,a5
    80004270:	f8040793          	addi	a5,s0,-128
    80004274:	01978cb3          	add	s9,a5,s9
    80004278:	f7f40d13          	addi	s10,s0,-129
    8000427c:	000cc503          	lbu	a0,0(s9)
    80004280:	fffc8c93          	addi	s9,s9,-1
    80004284:	00000097          	auipc	ra,0x0
    80004288:	b90080e7          	jalr	-1136(ra) # 80003e14 <consputc>
    8000428c:	ffac98e3          	bne	s9,s10,8000427c <__printf+0x284>
    80004290:	00094503          	lbu	a0,0(s2)
    80004294:	e00514e3          	bnez	a0,8000409c <__printf+0xa4>
    80004298:	1a0c1663          	bnez	s8,80004444 <__printf+0x44c>
    8000429c:	08813083          	ld	ra,136(sp)
    800042a0:	08013403          	ld	s0,128(sp)
    800042a4:	07813483          	ld	s1,120(sp)
    800042a8:	07013903          	ld	s2,112(sp)
    800042ac:	06813983          	ld	s3,104(sp)
    800042b0:	06013a03          	ld	s4,96(sp)
    800042b4:	05813a83          	ld	s5,88(sp)
    800042b8:	05013b03          	ld	s6,80(sp)
    800042bc:	04813b83          	ld	s7,72(sp)
    800042c0:	04013c03          	ld	s8,64(sp)
    800042c4:	03813c83          	ld	s9,56(sp)
    800042c8:	03013d03          	ld	s10,48(sp)
    800042cc:	02813d83          	ld	s11,40(sp)
    800042d0:	0d010113          	addi	sp,sp,208
    800042d4:	00008067          	ret
    800042d8:	07300713          	li	a4,115
    800042dc:	1ce78a63          	beq	a5,a4,800044b0 <__printf+0x4b8>
    800042e0:	07800713          	li	a4,120
    800042e4:	1ee79e63          	bne	a5,a4,800044e0 <__printf+0x4e8>
    800042e8:	f7843783          	ld	a5,-136(s0)
    800042ec:	0007a703          	lw	a4,0(a5)
    800042f0:	00878793          	addi	a5,a5,8
    800042f4:	f6f43c23          	sd	a5,-136(s0)
    800042f8:	28074263          	bltz	a4,8000457c <__printf+0x584>
    800042fc:	00002d97          	auipc	s11,0x2
    80004300:	fbcd8d93          	addi	s11,s11,-68 # 800062b8 <digits>
    80004304:	00f77793          	andi	a5,a4,15
    80004308:	00fd87b3          	add	a5,s11,a5
    8000430c:	0007c683          	lbu	a3,0(a5)
    80004310:	00f00613          	li	a2,15
    80004314:	0007079b          	sext.w	a5,a4
    80004318:	f8d40023          	sb	a3,-128(s0)
    8000431c:	0047559b          	srliw	a1,a4,0x4
    80004320:	0047569b          	srliw	a3,a4,0x4
    80004324:	00000c93          	li	s9,0
    80004328:	0ee65063          	bge	a2,a4,80004408 <__printf+0x410>
    8000432c:	00f6f693          	andi	a3,a3,15
    80004330:	00dd86b3          	add	a3,s11,a3
    80004334:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004338:	0087d79b          	srliw	a5,a5,0x8
    8000433c:	00100c93          	li	s9,1
    80004340:	f8d400a3          	sb	a3,-127(s0)
    80004344:	0cb67263          	bgeu	a2,a1,80004408 <__printf+0x410>
    80004348:	00f7f693          	andi	a3,a5,15
    8000434c:	00dd86b3          	add	a3,s11,a3
    80004350:	0006c583          	lbu	a1,0(a3)
    80004354:	00f00613          	li	a2,15
    80004358:	0047d69b          	srliw	a3,a5,0x4
    8000435c:	f8b40123          	sb	a1,-126(s0)
    80004360:	0047d593          	srli	a1,a5,0x4
    80004364:	28f67e63          	bgeu	a2,a5,80004600 <__printf+0x608>
    80004368:	00f6f693          	andi	a3,a3,15
    8000436c:	00dd86b3          	add	a3,s11,a3
    80004370:	0006c503          	lbu	a0,0(a3)
    80004374:	0087d813          	srli	a6,a5,0x8
    80004378:	0087d69b          	srliw	a3,a5,0x8
    8000437c:	f8a401a3          	sb	a0,-125(s0)
    80004380:	28b67663          	bgeu	a2,a1,8000460c <__printf+0x614>
    80004384:	00f6f693          	andi	a3,a3,15
    80004388:	00dd86b3          	add	a3,s11,a3
    8000438c:	0006c583          	lbu	a1,0(a3)
    80004390:	00c7d513          	srli	a0,a5,0xc
    80004394:	00c7d69b          	srliw	a3,a5,0xc
    80004398:	f8b40223          	sb	a1,-124(s0)
    8000439c:	29067a63          	bgeu	a2,a6,80004630 <__printf+0x638>
    800043a0:	00f6f693          	andi	a3,a3,15
    800043a4:	00dd86b3          	add	a3,s11,a3
    800043a8:	0006c583          	lbu	a1,0(a3)
    800043ac:	0107d813          	srli	a6,a5,0x10
    800043b0:	0107d69b          	srliw	a3,a5,0x10
    800043b4:	f8b402a3          	sb	a1,-123(s0)
    800043b8:	28a67263          	bgeu	a2,a0,8000463c <__printf+0x644>
    800043bc:	00f6f693          	andi	a3,a3,15
    800043c0:	00dd86b3          	add	a3,s11,a3
    800043c4:	0006c683          	lbu	a3,0(a3)
    800043c8:	0147d79b          	srliw	a5,a5,0x14
    800043cc:	f8d40323          	sb	a3,-122(s0)
    800043d0:	21067663          	bgeu	a2,a6,800045dc <__printf+0x5e4>
    800043d4:	02079793          	slli	a5,a5,0x20
    800043d8:	0207d793          	srli	a5,a5,0x20
    800043dc:	00fd8db3          	add	s11,s11,a5
    800043e0:	000dc683          	lbu	a3,0(s11)
    800043e4:	00800793          	li	a5,8
    800043e8:	00700c93          	li	s9,7
    800043ec:	f8d403a3          	sb	a3,-121(s0)
    800043f0:	00075c63          	bgez	a4,80004408 <__printf+0x410>
    800043f4:	f9040713          	addi	a4,s0,-112
    800043f8:	00f70733          	add	a4,a4,a5
    800043fc:	02d00693          	li	a3,45
    80004400:	fed70823          	sb	a3,-16(a4)
    80004404:	00078c93          	mv	s9,a5
    80004408:	f8040793          	addi	a5,s0,-128
    8000440c:	01978cb3          	add	s9,a5,s9
    80004410:	f7f40d13          	addi	s10,s0,-129
    80004414:	000cc503          	lbu	a0,0(s9)
    80004418:	fffc8c93          	addi	s9,s9,-1
    8000441c:	00000097          	auipc	ra,0x0
    80004420:	9f8080e7          	jalr	-1544(ra) # 80003e14 <consputc>
    80004424:	ff9d18e3          	bne	s10,s9,80004414 <__printf+0x41c>
    80004428:	0100006f          	j	80004438 <__printf+0x440>
    8000442c:	00000097          	auipc	ra,0x0
    80004430:	9e8080e7          	jalr	-1560(ra) # 80003e14 <consputc>
    80004434:	000c8493          	mv	s1,s9
    80004438:	00094503          	lbu	a0,0(s2)
    8000443c:	c60510e3          	bnez	a0,8000409c <__printf+0xa4>
    80004440:	e40c0ee3          	beqz	s8,8000429c <__printf+0x2a4>
    80004444:	00004517          	auipc	a0,0x4
    80004448:	05c50513          	addi	a0,a0,92 # 800084a0 <pr>
    8000444c:	00001097          	auipc	ra,0x1
    80004450:	94c080e7          	jalr	-1716(ra) # 80004d98 <release>
    80004454:	e49ff06f          	j	8000429c <__printf+0x2a4>
    80004458:	f7843783          	ld	a5,-136(s0)
    8000445c:	03000513          	li	a0,48
    80004460:	01000d13          	li	s10,16
    80004464:	00878713          	addi	a4,a5,8
    80004468:	0007bc83          	ld	s9,0(a5)
    8000446c:	f6e43c23          	sd	a4,-136(s0)
    80004470:	00000097          	auipc	ra,0x0
    80004474:	9a4080e7          	jalr	-1628(ra) # 80003e14 <consputc>
    80004478:	07800513          	li	a0,120
    8000447c:	00000097          	auipc	ra,0x0
    80004480:	998080e7          	jalr	-1640(ra) # 80003e14 <consputc>
    80004484:	00002d97          	auipc	s11,0x2
    80004488:	e34d8d93          	addi	s11,s11,-460 # 800062b8 <digits>
    8000448c:	03ccd793          	srli	a5,s9,0x3c
    80004490:	00fd87b3          	add	a5,s11,a5
    80004494:	0007c503          	lbu	a0,0(a5)
    80004498:	fffd0d1b          	addiw	s10,s10,-1
    8000449c:	004c9c93          	slli	s9,s9,0x4
    800044a0:	00000097          	auipc	ra,0x0
    800044a4:	974080e7          	jalr	-1676(ra) # 80003e14 <consputc>
    800044a8:	fe0d12e3          	bnez	s10,8000448c <__printf+0x494>
    800044ac:	f8dff06f          	j	80004438 <__printf+0x440>
    800044b0:	f7843783          	ld	a5,-136(s0)
    800044b4:	0007bc83          	ld	s9,0(a5)
    800044b8:	00878793          	addi	a5,a5,8
    800044bc:	f6f43c23          	sd	a5,-136(s0)
    800044c0:	000c9a63          	bnez	s9,800044d4 <__printf+0x4dc>
    800044c4:	1080006f          	j	800045cc <__printf+0x5d4>
    800044c8:	001c8c93          	addi	s9,s9,1
    800044cc:	00000097          	auipc	ra,0x0
    800044d0:	948080e7          	jalr	-1720(ra) # 80003e14 <consputc>
    800044d4:	000cc503          	lbu	a0,0(s9)
    800044d8:	fe0518e3          	bnez	a0,800044c8 <__printf+0x4d0>
    800044dc:	f5dff06f          	j	80004438 <__printf+0x440>
    800044e0:	02500513          	li	a0,37
    800044e4:	00000097          	auipc	ra,0x0
    800044e8:	930080e7          	jalr	-1744(ra) # 80003e14 <consputc>
    800044ec:	000c8513          	mv	a0,s9
    800044f0:	00000097          	auipc	ra,0x0
    800044f4:	924080e7          	jalr	-1756(ra) # 80003e14 <consputc>
    800044f8:	f41ff06f          	j	80004438 <__printf+0x440>
    800044fc:	02500513          	li	a0,37
    80004500:	00000097          	auipc	ra,0x0
    80004504:	914080e7          	jalr	-1772(ra) # 80003e14 <consputc>
    80004508:	f31ff06f          	j	80004438 <__printf+0x440>
    8000450c:	00030513          	mv	a0,t1
    80004510:	00000097          	auipc	ra,0x0
    80004514:	7bc080e7          	jalr	1980(ra) # 80004ccc <acquire>
    80004518:	b4dff06f          	j	80004064 <__printf+0x6c>
    8000451c:	40c0053b          	negw	a0,a2
    80004520:	00a00713          	li	a4,10
    80004524:	02e576bb          	remuw	a3,a0,a4
    80004528:	00002d97          	auipc	s11,0x2
    8000452c:	d90d8d93          	addi	s11,s11,-624 # 800062b8 <digits>
    80004530:	ff700593          	li	a1,-9
    80004534:	02069693          	slli	a3,a3,0x20
    80004538:	0206d693          	srli	a3,a3,0x20
    8000453c:	00dd86b3          	add	a3,s11,a3
    80004540:	0006c683          	lbu	a3,0(a3)
    80004544:	02e557bb          	divuw	a5,a0,a4
    80004548:	f8d40023          	sb	a3,-128(s0)
    8000454c:	10b65e63          	bge	a2,a1,80004668 <__printf+0x670>
    80004550:	06300593          	li	a1,99
    80004554:	02e7f6bb          	remuw	a3,a5,a4
    80004558:	02069693          	slli	a3,a3,0x20
    8000455c:	0206d693          	srli	a3,a3,0x20
    80004560:	00dd86b3          	add	a3,s11,a3
    80004564:	0006c683          	lbu	a3,0(a3)
    80004568:	02e7d73b          	divuw	a4,a5,a4
    8000456c:	00200793          	li	a5,2
    80004570:	f8d400a3          	sb	a3,-127(s0)
    80004574:	bca5ece3          	bltu	a1,a0,8000414c <__printf+0x154>
    80004578:	ce5ff06f          	j	8000425c <__printf+0x264>
    8000457c:	40e007bb          	negw	a5,a4
    80004580:	00002d97          	auipc	s11,0x2
    80004584:	d38d8d93          	addi	s11,s11,-712 # 800062b8 <digits>
    80004588:	00f7f693          	andi	a3,a5,15
    8000458c:	00dd86b3          	add	a3,s11,a3
    80004590:	0006c583          	lbu	a1,0(a3)
    80004594:	ff100613          	li	a2,-15
    80004598:	0047d69b          	srliw	a3,a5,0x4
    8000459c:	f8b40023          	sb	a1,-128(s0)
    800045a0:	0047d59b          	srliw	a1,a5,0x4
    800045a4:	0ac75e63          	bge	a4,a2,80004660 <__printf+0x668>
    800045a8:	00f6f693          	andi	a3,a3,15
    800045ac:	00dd86b3          	add	a3,s11,a3
    800045b0:	0006c603          	lbu	a2,0(a3)
    800045b4:	00f00693          	li	a3,15
    800045b8:	0087d79b          	srliw	a5,a5,0x8
    800045bc:	f8c400a3          	sb	a2,-127(s0)
    800045c0:	d8b6e4e3          	bltu	a3,a1,80004348 <__printf+0x350>
    800045c4:	00200793          	li	a5,2
    800045c8:	e2dff06f          	j	800043f4 <__printf+0x3fc>
    800045cc:	00002c97          	auipc	s9,0x2
    800045d0:	cccc8c93          	addi	s9,s9,-820 # 80006298 <CONSOLE_STATUS+0x288>
    800045d4:	02800513          	li	a0,40
    800045d8:	ef1ff06f          	j	800044c8 <__printf+0x4d0>
    800045dc:	00700793          	li	a5,7
    800045e0:	00600c93          	li	s9,6
    800045e4:	e0dff06f          	j	800043f0 <__printf+0x3f8>
    800045e8:	00700793          	li	a5,7
    800045ec:	00600c93          	li	s9,6
    800045f0:	c69ff06f          	j	80004258 <__printf+0x260>
    800045f4:	00300793          	li	a5,3
    800045f8:	00200c93          	li	s9,2
    800045fc:	c5dff06f          	j	80004258 <__printf+0x260>
    80004600:	00300793          	li	a5,3
    80004604:	00200c93          	li	s9,2
    80004608:	de9ff06f          	j	800043f0 <__printf+0x3f8>
    8000460c:	00400793          	li	a5,4
    80004610:	00300c93          	li	s9,3
    80004614:	dddff06f          	j	800043f0 <__printf+0x3f8>
    80004618:	00400793          	li	a5,4
    8000461c:	00300c93          	li	s9,3
    80004620:	c39ff06f          	j	80004258 <__printf+0x260>
    80004624:	00500793          	li	a5,5
    80004628:	00400c93          	li	s9,4
    8000462c:	c2dff06f          	j	80004258 <__printf+0x260>
    80004630:	00500793          	li	a5,5
    80004634:	00400c93          	li	s9,4
    80004638:	db9ff06f          	j	800043f0 <__printf+0x3f8>
    8000463c:	00600793          	li	a5,6
    80004640:	00500c93          	li	s9,5
    80004644:	dadff06f          	j	800043f0 <__printf+0x3f8>
    80004648:	00600793          	li	a5,6
    8000464c:	00500c93          	li	s9,5
    80004650:	c09ff06f          	j	80004258 <__printf+0x260>
    80004654:	00800793          	li	a5,8
    80004658:	00700c93          	li	s9,7
    8000465c:	bfdff06f          	j	80004258 <__printf+0x260>
    80004660:	00100793          	li	a5,1
    80004664:	d91ff06f          	j	800043f4 <__printf+0x3fc>
    80004668:	00100793          	li	a5,1
    8000466c:	bf1ff06f          	j	8000425c <__printf+0x264>
    80004670:	00900793          	li	a5,9
    80004674:	00800c93          	li	s9,8
    80004678:	be1ff06f          	j	80004258 <__printf+0x260>
    8000467c:	00002517          	auipc	a0,0x2
    80004680:	c2450513          	addi	a0,a0,-988 # 800062a0 <CONSOLE_STATUS+0x290>
    80004684:	00000097          	auipc	ra,0x0
    80004688:	918080e7          	jalr	-1768(ra) # 80003f9c <panic>

000000008000468c <printfinit>:
    8000468c:	fe010113          	addi	sp,sp,-32
    80004690:	00813823          	sd	s0,16(sp)
    80004694:	00913423          	sd	s1,8(sp)
    80004698:	00113c23          	sd	ra,24(sp)
    8000469c:	02010413          	addi	s0,sp,32
    800046a0:	00004497          	auipc	s1,0x4
    800046a4:	e0048493          	addi	s1,s1,-512 # 800084a0 <pr>
    800046a8:	00048513          	mv	a0,s1
    800046ac:	00002597          	auipc	a1,0x2
    800046b0:	c0458593          	addi	a1,a1,-1020 # 800062b0 <CONSOLE_STATUS+0x2a0>
    800046b4:	00000097          	auipc	ra,0x0
    800046b8:	5f4080e7          	jalr	1524(ra) # 80004ca8 <initlock>
    800046bc:	01813083          	ld	ra,24(sp)
    800046c0:	01013403          	ld	s0,16(sp)
    800046c4:	0004ac23          	sw	zero,24(s1)
    800046c8:	00813483          	ld	s1,8(sp)
    800046cc:	02010113          	addi	sp,sp,32
    800046d0:	00008067          	ret

00000000800046d4 <uartinit>:
    800046d4:	ff010113          	addi	sp,sp,-16
    800046d8:	00813423          	sd	s0,8(sp)
    800046dc:	01010413          	addi	s0,sp,16
    800046e0:	100007b7          	lui	a5,0x10000
    800046e4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800046e8:	f8000713          	li	a4,-128
    800046ec:	00e781a3          	sb	a4,3(a5)
    800046f0:	00300713          	li	a4,3
    800046f4:	00e78023          	sb	a4,0(a5)
    800046f8:	000780a3          	sb	zero,1(a5)
    800046fc:	00e781a3          	sb	a4,3(a5)
    80004700:	00700693          	li	a3,7
    80004704:	00d78123          	sb	a3,2(a5)
    80004708:	00e780a3          	sb	a4,1(a5)
    8000470c:	00813403          	ld	s0,8(sp)
    80004710:	01010113          	addi	sp,sp,16
    80004714:	00008067          	ret

0000000080004718 <uartputc>:
    80004718:	00003797          	auipc	a5,0x3
    8000471c:	af07a783          	lw	a5,-1296(a5) # 80007208 <panicked>
    80004720:	00078463          	beqz	a5,80004728 <uartputc+0x10>
    80004724:	0000006f          	j	80004724 <uartputc+0xc>
    80004728:	fd010113          	addi	sp,sp,-48
    8000472c:	02813023          	sd	s0,32(sp)
    80004730:	00913c23          	sd	s1,24(sp)
    80004734:	01213823          	sd	s2,16(sp)
    80004738:	01313423          	sd	s3,8(sp)
    8000473c:	02113423          	sd	ra,40(sp)
    80004740:	03010413          	addi	s0,sp,48
    80004744:	00003917          	auipc	s2,0x3
    80004748:	acc90913          	addi	s2,s2,-1332 # 80007210 <uart_tx_r>
    8000474c:	00093783          	ld	a5,0(s2)
    80004750:	00003497          	auipc	s1,0x3
    80004754:	ac848493          	addi	s1,s1,-1336 # 80007218 <uart_tx_w>
    80004758:	0004b703          	ld	a4,0(s1)
    8000475c:	02078693          	addi	a3,a5,32
    80004760:	00050993          	mv	s3,a0
    80004764:	02e69c63          	bne	a3,a4,8000479c <uartputc+0x84>
    80004768:	00001097          	auipc	ra,0x1
    8000476c:	834080e7          	jalr	-1996(ra) # 80004f9c <push_on>
    80004770:	00093783          	ld	a5,0(s2)
    80004774:	0004b703          	ld	a4,0(s1)
    80004778:	02078793          	addi	a5,a5,32
    8000477c:	00e79463          	bne	a5,a4,80004784 <uartputc+0x6c>
    80004780:	0000006f          	j	80004780 <uartputc+0x68>
    80004784:	00001097          	auipc	ra,0x1
    80004788:	88c080e7          	jalr	-1908(ra) # 80005010 <pop_on>
    8000478c:	00093783          	ld	a5,0(s2)
    80004790:	0004b703          	ld	a4,0(s1)
    80004794:	02078693          	addi	a3,a5,32
    80004798:	fce688e3          	beq	a3,a4,80004768 <uartputc+0x50>
    8000479c:	01f77693          	andi	a3,a4,31
    800047a0:	00004597          	auipc	a1,0x4
    800047a4:	d2058593          	addi	a1,a1,-736 # 800084c0 <uart_tx_buf>
    800047a8:	00d586b3          	add	a3,a1,a3
    800047ac:	00170713          	addi	a4,a4,1
    800047b0:	01368023          	sb	s3,0(a3)
    800047b4:	00e4b023          	sd	a4,0(s1)
    800047b8:	10000637          	lui	a2,0x10000
    800047bc:	02f71063          	bne	a4,a5,800047dc <uartputc+0xc4>
    800047c0:	0340006f          	j	800047f4 <uartputc+0xdc>
    800047c4:	00074703          	lbu	a4,0(a4)
    800047c8:	00f93023          	sd	a5,0(s2)
    800047cc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800047d0:	00093783          	ld	a5,0(s2)
    800047d4:	0004b703          	ld	a4,0(s1)
    800047d8:	00f70e63          	beq	a4,a5,800047f4 <uartputc+0xdc>
    800047dc:	00564683          	lbu	a3,5(a2)
    800047e0:	01f7f713          	andi	a4,a5,31
    800047e4:	00e58733          	add	a4,a1,a4
    800047e8:	0206f693          	andi	a3,a3,32
    800047ec:	00178793          	addi	a5,a5,1
    800047f0:	fc069ae3          	bnez	a3,800047c4 <uartputc+0xac>
    800047f4:	02813083          	ld	ra,40(sp)
    800047f8:	02013403          	ld	s0,32(sp)
    800047fc:	01813483          	ld	s1,24(sp)
    80004800:	01013903          	ld	s2,16(sp)
    80004804:	00813983          	ld	s3,8(sp)
    80004808:	03010113          	addi	sp,sp,48
    8000480c:	00008067          	ret

0000000080004810 <uartputc_sync>:
    80004810:	ff010113          	addi	sp,sp,-16
    80004814:	00813423          	sd	s0,8(sp)
    80004818:	01010413          	addi	s0,sp,16
    8000481c:	00003717          	auipc	a4,0x3
    80004820:	9ec72703          	lw	a4,-1556(a4) # 80007208 <panicked>
    80004824:	02071663          	bnez	a4,80004850 <uartputc_sync+0x40>
    80004828:	00050793          	mv	a5,a0
    8000482c:	100006b7          	lui	a3,0x10000
    80004830:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004834:	02077713          	andi	a4,a4,32
    80004838:	fe070ce3          	beqz	a4,80004830 <uartputc_sync+0x20>
    8000483c:	0ff7f793          	andi	a5,a5,255
    80004840:	00f68023          	sb	a5,0(a3)
    80004844:	00813403          	ld	s0,8(sp)
    80004848:	01010113          	addi	sp,sp,16
    8000484c:	00008067          	ret
    80004850:	0000006f          	j	80004850 <uartputc_sync+0x40>

0000000080004854 <uartstart>:
    80004854:	ff010113          	addi	sp,sp,-16
    80004858:	00813423          	sd	s0,8(sp)
    8000485c:	01010413          	addi	s0,sp,16
    80004860:	00003617          	auipc	a2,0x3
    80004864:	9b060613          	addi	a2,a2,-1616 # 80007210 <uart_tx_r>
    80004868:	00003517          	auipc	a0,0x3
    8000486c:	9b050513          	addi	a0,a0,-1616 # 80007218 <uart_tx_w>
    80004870:	00063783          	ld	a5,0(a2)
    80004874:	00053703          	ld	a4,0(a0)
    80004878:	04f70263          	beq	a4,a5,800048bc <uartstart+0x68>
    8000487c:	100005b7          	lui	a1,0x10000
    80004880:	00004817          	auipc	a6,0x4
    80004884:	c4080813          	addi	a6,a6,-960 # 800084c0 <uart_tx_buf>
    80004888:	01c0006f          	j	800048a4 <uartstart+0x50>
    8000488c:	0006c703          	lbu	a4,0(a3)
    80004890:	00f63023          	sd	a5,0(a2)
    80004894:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004898:	00063783          	ld	a5,0(a2)
    8000489c:	00053703          	ld	a4,0(a0)
    800048a0:	00f70e63          	beq	a4,a5,800048bc <uartstart+0x68>
    800048a4:	01f7f713          	andi	a4,a5,31
    800048a8:	00e806b3          	add	a3,a6,a4
    800048ac:	0055c703          	lbu	a4,5(a1)
    800048b0:	00178793          	addi	a5,a5,1
    800048b4:	02077713          	andi	a4,a4,32
    800048b8:	fc071ae3          	bnez	a4,8000488c <uartstart+0x38>
    800048bc:	00813403          	ld	s0,8(sp)
    800048c0:	01010113          	addi	sp,sp,16
    800048c4:	00008067          	ret

00000000800048c8 <uartgetc>:
    800048c8:	ff010113          	addi	sp,sp,-16
    800048cc:	00813423          	sd	s0,8(sp)
    800048d0:	01010413          	addi	s0,sp,16
    800048d4:	10000737          	lui	a4,0x10000
    800048d8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800048dc:	0017f793          	andi	a5,a5,1
    800048e0:	00078c63          	beqz	a5,800048f8 <uartgetc+0x30>
    800048e4:	00074503          	lbu	a0,0(a4)
    800048e8:	0ff57513          	andi	a0,a0,255
    800048ec:	00813403          	ld	s0,8(sp)
    800048f0:	01010113          	addi	sp,sp,16
    800048f4:	00008067          	ret
    800048f8:	fff00513          	li	a0,-1
    800048fc:	ff1ff06f          	j	800048ec <uartgetc+0x24>

0000000080004900 <uartintr>:
    80004900:	100007b7          	lui	a5,0x10000
    80004904:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004908:	0017f793          	andi	a5,a5,1
    8000490c:	0a078463          	beqz	a5,800049b4 <uartintr+0xb4>
    80004910:	fe010113          	addi	sp,sp,-32
    80004914:	00813823          	sd	s0,16(sp)
    80004918:	00913423          	sd	s1,8(sp)
    8000491c:	00113c23          	sd	ra,24(sp)
    80004920:	02010413          	addi	s0,sp,32
    80004924:	100004b7          	lui	s1,0x10000
    80004928:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000492c:	0ff57513          	andi	a0,a0,255
    80004930:	fffff097          	auipc	ra,0xfffff
    80004934:	534080e7          	jalr	1332(ra) # 80003e64 <consoleintr>
    80004938:	0054c783          	lbu	a5,5(s1)
    8000493c:	0017f793          	andi	a5,a5,1
    80004940:	fe0794e3          	bnez	a5,80004928 <uartintr+0x28>
    80004944:	00003617          	auipc	a2,0x3
    80004948:	8cc60613          	addi	a2,a2,-1844 # 80007210 <uart_tx_r>
    8000494c:	00003517          	auipc	a0,0x3
    80004950:	8cc50513          	addi	a0,a0,-1844 # 80007218 <uart_tx_w>
    80004954:	00063783          	ld	a5,0(a2)
    80004958:	00053703          	ld	a4,0(a0)
    8000495c:	04f70263          	beq	a4,a5,800049a0 <uartintr+0xa0>
    80004960:	100005b7          	lui	a1,0x10000
    80004964:	00004817          	auipc	a6,0x4
    80004968:	b5c80813          	addi	a6,a6,-1188 # 800084c0 <uart_tx_buf>
    8000496c:	01c0006f          	j	80004988 <uartintr+0x88>
    80004970:	0006c703          	lbu	a4,0(a3)
    80004974:	00f63023          	sd	a5,0(a2)
    80004978:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000497c:	00063783          	ld	a5,0(a2)
    80004980:	00053703          	ld	a4,0(a0)
    80004984:	00f70e63          	beq	a4,a5,800049a0 <uartintr+0xa0>
    80004988:	01f7f713          	andi	a4,a5,31
    8000498c:	00e806b3          	add	a3,a6,a4
    80004990:	0055c703          	lbu	a4,5(a1)
    80004994:	00178793          	addi	a5,a5,1
    80004998:	02077713          	andi	a4,a4,32
    8000499c:	fc071ae3          	bnez	a4,80004970 <uartintr+0x70>
    800049a0:	01813083          	ld	ra,24(sp)
    800049a4:	01013403          	ld	s0,16(sp)
    800049a8:	00813483          	ld	s1,8(sp)
    800049ac:	02010113          	addi	sp,sp,32
    800049b0:	00008067          	ret
    800049b4:	00003617          	auipc	a2,0x3
    800049b8:	85c60613          	addi	a2,a2,-1956 # 80007210 <uart_tx_r>
    800049bc:	00003517          	auipc	a0,0x3
    800049c0:	85c50513          	addi	a0,a0,-1956 # 80007218 <uart_tx_w>
    800049c4:	00063783          	ld	a5,0(a2)
    800049c8:	00053703          	ld	a4,0(a0)
    800049cc:	04f70263          	beq	a4,a5,80004a10 <uartintr+0x110>
    800049d0:	100005b7          	lui	a1,0x10000
    800049d4:	00004817          	auipc	a6,0x4
    800049d8:	aec80813          	addi	a6,a6,-1300 # 800084c0 <uart_tx_buf>
    800049dc:	01c0006f          	j	800049f8 <uartintr+0xf8>
    800049e0:	0006c703          	lbu	a4,0(a3)
    800049e4:	00f63023          	sd	a5,0(a2)
    800049e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800049ec:	00063783          	ld	a5,0(a2)
    800049f0:	00053703          	ld	a4,0(a0)
    800049f4:	02f70063          	beq	a4,a5,80004a14 <uartintr+0x114>
    800049f8:	01f7f713          	andi	a4,a5,31
    800049fc:	00e806b3          	add	a3,a6,a4
    80004a00:	0055c703          	lbu	a4,5(a1)
    80004a04:	00178793          	addi	a5,a5,1
    80004a08:	02077713          	andi	a4,a4,32
    80004a0c:	fc071ae3          	bnez	a4,800049e0 <uartintr+0xe0>
    80004a10:	00008067          	ret
    80004a14:	00008067          	ret

0000000080004a18 <kinit>:
    80004a18:	fc010113          	addi	sp,sp,-64
    80004a1c:	02913423          	sd	s1,40(sp)
    80004a20:	fffff7b7          	lui	a5,0xfffff
    80004a24:	00005497          	auipc	s1,0x5
    80004a28:	abb48493          	addi	s1,s1,-1349 # 800094df <end+0xfff>
    80004a2c:	02813823          	sd	s0,48(sp)
    80004a30:	01313c23          	sd	s3,24(sp)
    80004a34:	00f4f4b3          	and	s1,s1,a5
    80004a38:	02113c23          	sd	ra,56(sp)
    80004a3c:	03213023          	sd	s2,32(sp)
    80004a40:	01413823          	sd	s4,16(sp)
    80004a44:	01513423          	sd	s5,8(sp)
    80004a48:	04010413          	addi	s0,sp,64
    80004a4c:	000017b7          	lui	a5,0x1
    80004a50:	01100993          	li	s3,17
    80004a54:	00f487b3          	add	a5,s1,a5
    80004a58:	01b99993          	slli	s3,s3,0x1b
    80004a5c:	06f9e063          	bltu	s3,a5,80004abc <kinit+0xa4>
    80004a60:	00004a97          	auipc	s5,0x4
    80004a64:	a80a8a93          	addi	s5,s5,-1408 # 800084e0 <end>
    80004a68:	0754ec63          	bltu	s1,s5,80004ae0 <kinit+0xc8>
    80004a6c:	0734fa63          	bgeu	s1,s3,80004ae0 <kinit+0xc8>
    80004a70:	00088a37          	lui	s4,0x88
    80004a74:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004a78:	00002917          	auipc	s2,0x2
    80004a7c:	7a890913          	addi	s2,s2,1960 # 80007220 <kmem>
    80004a80:	00ca1a13          	slli	s4,s4,0xc
    80004a84:	0140006f          	j	80004a98 <kinit+0x80>
    80004a88:	000017b7          	lui	a5,0x1
    80004a8c:	00f484b3          	add	s1,s1,a5
    80004a90:	0554e863          	bltu	s1,s5,80004ae0 <kinit+0xc8>
    80004a94:	0534f663          	bgeu	s1,s3,80004ae0 <kinit+0xc8>
    80004a98:	00001637          	lui	a2,0x1
    80004a9c:	00100593          	li	a1,1
    80004aa0:	00048513          	mv	a0,s1
    80004aa4:	00000097          	auipc	ra,0x0
    80004aa8:	5e4080e7          	jalr	1508(ra) # 80005088 <__memset>
    80004aac:	00093783          	ld	a5,0(s2)
    80004ab0:	00f4b023          	sd	a5,0(s1)
    80004ab4:	00993023          	sd	s1,0(s2)
    80004ab8:	fd4498e3          	bne	s1,s4,80004a88 <kinit+0x70>
    80004abc:	03813083          	ld	ra,56(sp)
    80004ac0:	03013403          	ld	s0,48(sp)
    80004ac4:	02813483          	ld	s1,40(sp)
    80004ac8:	02013903          	ld	s2,32(sp)
    80004acc:	01813983          	ld	s3,24(sp)
    80004ad0:	01013a03          	ld	s4,16(sp)
    80004ad4:	00813a83          	ld	s5,8(sp)
    80004ad8:	04010113          	addi	sp,sp,64
    80004adc:	00008067          	ret
    80004ae0:	00001517          	auipc	a0,0x1
    80004ae4:	7f050513          	addi	a0,a0,2032 # 800062d0 <digits+0x18>
    80004ae8:	fffff097          	auipc	ra,0xfffff
    80004aec:	4b4080e7          	jalr	1204(ra) # 80003f9c <panic>

0000000080004af0 <freerange>:
    80004af0:	fc010113          	addi	sp,sp,-64
    80004af4:	000017b7          	lui	a5,0x1
    80004af8:	02913423          	sd	s1,40(sp)
    80004afc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004b00:	009504b3          	add	s1,a0,s1
    80004b04:	fffff537          	lui	a0,0xfffff
    80004b08:	02813823          	sd	s0,48(sp)
    80004b0c:	02113c23          	sd	ra,56(sp)
    80004b10:	03213023          	sd	s2,32(sp)
    80004b14:	01313c23          	sd	s3,24(sp)
    80004b18:	01413823          	sd	s4,16(sp)
    80004b1c:	01513423          	sd	s5,8(sp)
    80004b20:	01613023          	sd	s6,0(sp)
    80004b24:	04010413          	addi	s0,sp,64
    80004b28:	00a4f4b3          	and	s1,s1,a0
    80004b2c:	00f487b3          	add	a5,s1,a5
    80004b30:	06f5e463          	bltu	a1,a5,80004b98 <freerange+0xa8>
    80004b34:	00004a97          	auipc	s5,0x4
    80004b38:	9aca8a93          	addi	s5,s5,-1620 # 800084e0 <end>
    80004b3c:	0954e263          	bltu	s1,s5,80004bc0 <freerange+0xd0>
    80004b40:	01100993          	li	s3,17
    80004b44:	01b99993          	slli	s3,s3,0x1b
    80004b48:	0734fc63          	bgeu	s1,s3,80004bc0 <freerange+0xd0>
    80004b4c:	00058a13          	mv	s4,a1
    80004b50:	00002917          	auipc	s2,0x2
    80004b54:	6d090913          	addi	s2,s2,1744 # 80007220 <kmem>
    80004b58:	00002b37          	lui	s6,0x2
    80004b5c:	0140006f          	j	80004b70 <freerange+0x80>
    80004b60:	000017b7          	lui	a5,0x1
    80004b64:	00f484b3          	add	s1,s1,a5
    80004b68:	0554ec63          	bltu	s1,s5,80004bc0 <freerange+0xd0>
    80004b6c:	0534fa63          	bgeu	s1,s3,80004bc0 <freerange+0xd0>
    80004b70:	00001637          	lui	a2,0x1
    80004b74:	00100593          	li	a1,1
    80004b78:	00048513          	mv	a0,s1
    80004b7c:	00000097          	auipc	ra,0x0
    80004b80:	50c080e7          	jalr	1292(ra) # 80005088 <__memset>
    80004b84:	00093703          	ld	a4,0(s2)
    80004b88:	016487b3          	add	a5,s1,s6
    80004b8c:	00e4b023          	sd	a4,0(s1)
    80004b90:	00993023          	sd	s1,0(s2)
    80004b94:	fcfa76e3          	bgeu	s4,a5,80004b60 <freerange+0x70>
    80004b98:	03813083          	ld	ra,56(sp)
    80004b9c:	03013403          	ld	s0,48(sp)
    80004ba0:	02813483          	ld	s1,40(sp)
    80004ba4:	02013903          	ld	s2,32(sp)
    80004ba8:	01813983          	ld	s3,24(sp)
    80004bac:	01013a03          	ld	s4,16(sp)
    80004bb0:	00813a83          	ld	s5,8(sp)
    80004bb4:	00013b03          	ld	s6,0(sp)
    80004bb8:	04010113          	addi	sp,sp,64
    80004bbc:	00008067          	ret
    80004bc0:	00001517          	auipc	a0,0x1
    80004bc4:	71050513          	addi	a0,a0,1808 # 800062d0 <digits+0x18>
    80004bc8:	fffff097          	auipc	ra,0xfffff
    80004bcc:	3d4080e7          	jalr	980(ra) # 80003f9c <panic>

0000000080004bd0 <kfree>:
    80004bd0:	fe010113          	addi	sp,sp,-32
    80004bd4:	00813823          	sd	s0,16(sp)
    80004bd8:	00113c23          	sd	ra,24(sp)
    80004bdc:	00913423          	sd	s1,8(sp)
    80004be0:	02010413          	addi	s0,sp,32
    80004be4:	03451793          	slli	a5,a0,0x34
    80004be8:	04079c63          	bnez	a5,80004c40 <kfree+0x70>
    80004bec:	00004797          	auipc	a5,0x4
    80004bf0:	8f478793          	addi	a5,a5,-1804 # 800084e0 <end>
    80004bf4:	00050493          	mv	s1,a0
    80004bf8:	04f56463          	bltu	a0,a5,80004c40 <kfree+0x70>
    80004bfc:	01100793          	li	a5,17
    80004c00:	01b79793          	slli	a5,a5,0x1b
    80004c04:	02f57e63          	bgeu	a0,a5,80004c40 <kfree+0x70>
    80004c08:	00001637          	lui	a2,0x1
    80004c0c:	00100593          	li	a1,1
    80004c10:	00000097          	auipc	ra,0x0
    80004c14:	478080e7          	jalr	1144(ra) # 80005088 <__memset>
    80004c18:	00002797          	auipc	a5,0x2
    80004c1c:	60878793          	addi	a5,a5,1544 # 80007220 <kmem>
    80004c20:	0007b703          	ld	a4,0(a5)
    80004c24:	01813083          	ld	ra,24(sp)
    80004c28:	01013403          	ld	s0,16(sp)
    80004c2c:	00e4b023          	sd	a4,0(s1)
    80004c30:	0097b023          	sd	s1,0(a5)
    80004c34:	00813483          	ld	s1,8(sp)
    80004c38:	02010113          	addi	sp,sp,32
    80004c3c:	00008067          	ret
    80004c40:	00001517          	auipc	a0,0x1
    80004c44:	69050513          	addi	a0,a0,1680 # 800062d0 <digits+0x18>
    80004c48:	fffff097          	auipc	ra,0xfffff
    80004c4c:	354080e7          	jalr	852(ra) # 80003f9c <panic>

0000000080004c50 <kalloc>:
    80004c50:	fe010113          	addi	sp,sp,-32
    80004c54:	00813823          	sd	s0,16(sp)
    80004c58:	00913423          	sd	s1,8(sp)
    80004c5c:	00113c23          	sd	ra,24(sp)
    80004c60:	02010413          	addi	s0,sp,32
    80004c64:	00002797          	auipc	a5,0x2
    80004c68:	5bc78793          	addi	a5,a5,1468 # 80007220 <kmem>
    80004c6c:	0007b483          	ld	s1,0(a5)
    80004c70:	02048063          	beqz	s1,80004c90 <kalloc+0x40>
    80004c74:	0004b703          	ld	a4,0(s1)
    80004c78:	00001637          	lui	a2,0x1
    80004c7c:	00500593          	li	a1,5
    80004c80:	00048513          	mv	a0,s1
    80004c84:	00e7b023          	sd	a4,0(a5)
    80004c88:	00000097          	auipc	ra,0x0
    80004c8c:	400080e7          	jalr	1024(ra) # 80005088 <__memset>
    80004c90:	01813083          	ld	ra,24(sp)
    80004c94:	01013403          	ld	s0,16(sp)
    80004c98:	00048513          	mv	a0,s1
    80004c9c:	00813483          	ld	s1,8(sp)
    80004ca0:	02010113          	addi	sp,sp,32
    80004ca4:	00008067          	ret

0000000080004ca8 <initlock>:
    80004ca8:	ff010113          	addi	sp,sp,-16
    80004cac:	00813423          	sd	s0,8(sp)
    80004cb0:	01010413          	addi	s0,sp,16
    80004cb4:	00813403          	ld	s0,8(sp)
    80004cb8:	00b53423          	sd	a1,8(a0)
    80004cbc:	00052023          	sw	zero,0(a0)
    80004cc0:	00053823          	sd	zero,16(a0)
    80004cc4:	01010113          	addi	sp,sp,16
    80004cc8:	00008067          	ret

0000000080004ccc <acquire>:
    80004ccc:	fe010113          	addi	sp,sp,-32
    80004cd0:	00813823          	sd	s0,16(sp)
    80004cd4:	00913423          	sd	s1,8(sp)
    80004cd8:	00113c23          	sd	ra,24(sp)
    80004cdc:	01213023          	sd	s2,0(sp)
    80004ce0:	02010413          	addi	s0,sp,32
    80004ce4:	00050493          	mv	s1,a0
    80004ce8:	10002973          	csrr	s2,sstatus
    80004cec:	100027f3          	csrr	a5,sstatus
    80004cf0:	ffd7f793          	andi	a5,a5,-3
    80004cf4:	10079073          	csrw	sstatus,a5
    80004cf8:	fffff097          	auipc	ra,0xfffff
    80004cfc:	8e4080e7          	jalr	-1820(ra) # 800035dc <mycpu>
    80004d00:	07852783          	lw	a5,120(a0)
    80004d04:	06078e63          	beqz	a5,80004d80 <acquire+0xb4>
    80004d08:	fffff097          	auipc	ra,0xfffff
    80004d0c:	8d4080e7          	jalr	-1836(ra) # 800035dc <mycpu>
    80004d10:	07852783          	lw	a5,120(a0)
    80004d14:	0004a703          	lw	a4,0(s1)
    80004d18:	0017879b          	addiw	a5,a5,1
    80004d1c:	06f52c23          	sw	a5,120(a0)
    80004d20:	04071063          	bnez	a4,80004d60 <acquire+0x94>
    80004d24:	00100713          	li	a4,1
    80004d28:	00070793          	mv	a5,a4
    80004d2c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004d30:	0007879b          	sext.w	a5,a5
    80004d34:	fe079ae3          	bnez	a5,80004d28 <acquire+0x5c>
    80004d38:	0ff0000f          	fence
    80004d3c:	fffff097          	auipc	ra,0xfffff
    80004d40:	8a0080e7          	jalr	-1888(ra) # 800035dc <mycpu>
    80004d44:	01813083          	ld	ra,24(sp)
    80004d48:	01013403          	ld	s0,16(sp)
    80004d4c:	00a4b823          	sd	a0,16(s1)
    80004d50:	00013903          	ld	s2,0(sp)
    80004d54:	00813483          	ld	s1,8(sp)
    80004d58:	02010113          	addi	sp,sp,32
    80004d5c:	00008067          	ret
    80004d60:	0104b903          	ld	s2,16(s1)
    80004d64:	fffff097          	auipc	ra,0xfffff
    80004d68:	878080e7          	jalr	-1928(ra) # 800035dc <mycpu>
    80004d6c:	faa91ce3          	bne	s2,a0,80004d24 <acquire+0x58>
    80004d70:	00001517          	auipc	a0,0x1
    80004d74:	56850513          	addi	a0,a0,1384 # 800062d8 <digits+0x20>
    80004d78:	fffff097          	auipc	ra,0xfffff
    80004d7c:	224080e7          	jalr	548(ra) # 80003f9c <panic>
    80004d80:	00195913          	srli	s2,s2,0x1
    80004d84:	fffff097          	auipc	ra,0xfffff
    80004d88:	858080e7          	jalr	-1960(ra) # 800035dc <mycpu>
    80004d8c:	00197913          	andi	s2,s2,1
    80004d90:	07252e23          	sw	s2,124(a0)
    80004d94:	f75ff06f          	j	80004d08 <acquire+0x3c>

0000000080004d98 <release>:
    80004d98:	fe010113          	addi	sp,sp,-32
    80004d9c:	00813823          	sd	s0,16(sp)
    80004da0:	00113c23          	sd	ra,24(sp)
    80004da4:	00913423          	sd	s1,8(sp)
    80004da8:	01213023          	sd	s2,0(sp)
    80004dac:	02010413          	addi	s0,sp,32
    80004db0:	00052783          	lw	a5,0(a0)
    80004db4:	00079a63          	bnez	a5,80004dc8 <release+0x30>
    80004db8:	00001517          	auipc	a0,0x1
    80004dbc:	52850513          	addi	a0,a0,1320 # 800062e0 <digits+0x28>
    80004dc0:	fffff097          	auipc	ra,0xfffff
    80004dc4:	1dc080e7          	jalr	476(ra) # 80003f9c <panic>
    80004dc8:	01053903          	ld	s2,16(a0)
    80004dcc:	00050493          	mv	s1,a0
    80004dd0:	fffff097          	auipc	ra,0xfffff
    80004dd4:	80c080e7          	jalr	-2036(ra) # 800035dc <mycpu>
    80004dd8:	fea910e3          	bne	s2,a0,80004db8 <release+0x20>
    80004ddc:	0004b823          	sd	zero,16(s1)
    80004de0:	0ff0000f          	fence
    80004de4:	0f50000f          	fence	iorw,ow
    80004de8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80004dec:	ffffe097          	auipc	ra,0xffffe
    80004df0:	7f0080e7          	jalr	2032(ra) # 800035dc <mycpu>
    80004df4:	100027f3          	csrr	a5,sstatus
    80004df8:	0027f793          	andi	a5,a5,2
    80004dfc:	04079a63          	bnez	a5,80004e50 <release+0xb8>
    80004e00:	07852783          	lw	a5,120(a0)
    80004e04:	02f05e63          	blez	a5,80004e40 <release+0xa8>
    80004e08:	fff7871b          	addiw	a4,a5,-1
    80004e0c:	06e52c23          	sw	a4,120(a0)
    80004e10:	00071c63          	bnez	a4,80004e28 <release+0x90>
    80004e14:	07c52783          	lw	a5,124(a0)
    80004e18:	00078863          	beqz	a5,80004e28 <release+0x90>
    80004e1c:	100027f3          	csrr	a5,sstatus
    80004e20:	0027e793          	ori	a5,a5,2
    80004e24:	10079073          	csrw	sstatus,a5
    80004e28:	01813083          	ld	ra,24(sp)
    80004e2c:	01013403          	ld	s0,16(sp)
    80004e30:	00813483          	ld	s1,8(sp)
    80004e34:	00013903          	ld	s2,0(sp)
    80004e38:	02010113          	addi	sp,sp,32
    80004e3c:	00008067          	ret
    80004e40:	00001517          	auipc	a0,0x1
    80004e44:	4c050513          	addi	a0,a0,1216 # 80006300 <digits+0x48>
    80004e48:	fffff097          	auipc	ra,0xfffff
    80004e4c:	154080e7          	jalr	340(ra) # 80003f9c <panic>
    80004e50:	00001517          	auipc	a0,0x1
    80004e54:	49850513          	addi	a0,a0,1176 # 800062e8 <digits+0x30>
    80004e58:	fffff097          	auipc	ra,0xfffff
    80004e5c:	144080e7          	jalr	324(ra) # 80003f9c <panic>

0000000080004e60 <holding>:
    80004e60:	00052783          	lw	a5,0(a0)
    80004e64:	00079663          	bnez	a5,80004e70 <holding+0x10>
    80004e68:	00000513          	li	a0,0
    80004e6c:	00008067          	ret
    80004e70:	fe010113          	addi	sp,sp,-32
    80004e74:	00813823          	sd	s0,16(sp)
    80004e78:	00913423          	sd	s1,8(sp)
    80004e7c:	00113c23          	sd	ra,24(sp)
    80004e80:	02010413          	addi	s0,sp,32
    80004e84:	01053483          	ld	s1,16(a0)
    80004e88:	ffffe097          	auipc	ra,0xffffe
    80004e8c:	754080e7          	jalr	1876(ra) # 800035dc <mycpu>
    80004e90:	01813083          	ld	ra,24(sp)
    80004e94:	01013403          	ld	s0,16(sp)
    80004e98:	40a48533          	sub	a0,s1,a0
    80004e9c:	00153513          	seqz	a0,a0
    80004ea0:	00813483          	ld	s1,8(sp)
    80004ea4:	02010113          	addi	sp,sp,32
    80004ea8:	00008067          	ret

0000000080004eac <push_off>:
    80004eac:	fe010113          	addi	sp,sp,-32
    80004eb0:	00813823          	sd	s0,16(sp)
    80004eb4:	00113c23          	sd	ra,24(sp)
    80004eb8:	00913423          	sd	s1,8(sp)
    80004ebc:	02010413          	addi	s0,sp,32
    80004ec0:	100024f3          	csrr	s1,sstatus
    80004ec4:	100027f3          	csrr	a5,sstatus
    80004ec8:	ffd7f793          	andi	a5,a5,-3
    80004ecc:	10079073          	csrw	sstatus,a5
    80004ed0:	ffffe097          	auipc	ra,0xffffe
    80004ed4:	70c080e7          	jalr	1804(ra) # 800035dc <mycpu>
    80004ed8:	07852783          	lw	a5,120(a0)
    80004edc:	02078663          	beqz	a5,80004f08 <push_off+0x5c>
    80004ee0:	ffffe097          	auipc	ra,0xffffe
    80004ee4:	6fc080e7          	jalr	1788(ra) # 800035dc <mycpu>
    80004ee8:	07852783          	lw	a5,120(a0)
    80004eec:	01813083          	ld	ra,24(sp)
    80004ef0:	01013403          	ld	s0,16(sp)
    80004ef4:	0017879b          	addiw	a5,a5,1
    80004ef8:	06f52c23          	sw	a5,120(a0)
    80004efc:	00813483          	ld	s1,8(sp)
    80004f00:	02010113          	addi	sp,sp,32
    80004f04:	00008067          	ret
    80004f08:	0014d493          	srli	s1,s1,0x1
    80004f0c:	ffffe097          	auipc	ra,0xffffe
    80004f10:	6d0080e7          	jalr	1744(ra) # 800035dc <mycpu>
    80004f14:	0014f493          	andi	s1,s1,1
    80004f18:	06952e23          	sw	s1,124(a0)
    80004f1c:	fc5ff06f          	j	80004ee0 <push_off+0x34>

0000000080004f20 <pop_off>:
    80004f20:	ff010113          	addi	sp,sp,-16
    80004f24:	00813023          	sd	s0,0(sp)
    80004f28:	00113423          	sd	ra,8(sp)
    80004f2c:	01010413          	addi	s0,sp,16
    80004f30:	ffffe097          	auipc	ra,0xffffe
    80004f34:	6ac080e7          	jalr	1708(ra) # 800035dc <mycpu>
    80004f38:	100027f3          	csrr	a5,sstatus
    80004f3c:	0027f793          	andi	a5,a5,2
    80004f40:	04079663          	bnez	a5,80004f8c <pop_off+0x6c>
    80004f44:	07852783          	lw	a5,120(a0)
    80004f48:	02f05a63          	blez	a5,80004f7c <pop_off+0x5c>
    80004f4c:	fff7871b          	addiw	a4,a5,-1
    80004f50:	06e52c23          	sw	a4,120(a0)
    80004f54:	00071c63          	bnez	a4,80004f6c <pop_off+0x4c>
    80004f58:	07c52783          	lw	a5,124(a0)
    80004f5c:	00078863          	beqz	a5,80004f6c <pop_off+0x4c>
    80004f60:	100027f3          	csrr	a5,sstatus
    80004f64:	0027e793          	ori	a5,a5,2
    80004f68:	10079073          	csrw	sstatus,a5
    80004f6c:	00813083          	ld	ra,8(sp)
    80004f70:	00013403          	ld	s0,0(sp)
    80004f74:	01010113          	addi	sp,sp,16
    80004f78:	00008067          	ret
    80004f7c:	00001517          	auipc	a0,0x1
    80004f80:	38450513          	addi	a0,a0,900 # 80006300 <digits+0x48>
    80004f84:	fffff097          	auipc	ra,0xfffff
    80004f88:	018080e7          	jalr	24(ra) # 80003f9c <panic>
    80004f8c:	00001517          	auipc	a0,0x1
    80004f90:	35c50513          	addi	a0,a0,860 # 800062e8 <digits+0x30>
    80004f94:	fffff097          	auipc	ra,0xfffff
    80004f98:	008080e7          	jalr	8(ra) # 80003f9c <panic>

0000000080004f9c <push_on>:
    80004f9c:	fe010113          	addi	sp,sp,-32
    80004fa0:	00813823          	sd	s0,16(sp)
    80004fa4:	00113c23          	sd	ra,24(sp)
    80004fa8:	00913423          	sd	s1,8(sp)
    80004fac:	02010413          	addi	s0,sp,32
    80004fb0:	100024f3          	csrr	s1,sstatus
    80004fb4:	100027f3          	csrr	a5,sstatus
    80004fb8:	0027e793          	ori	a5,a5,2
    80004fbc:	10079073          	csrw	sstatus,a5
    80004fc0:	ffffe097          	auipc	ra,0xffffe
    80004fc4:	61c080e7          	jalr	1564(ra) # 800035dc <mycpu>
    80004fc8:	07852783          	lw	a5,120(a0)
    80004fcc:	02078663          	beqz	a5,80004ff8 <push_on+0x5c>
    80004fd0:	ffffe097          	auipc	ra,0xffffe
    80004fd4:	60c080e7          	jalr	1548(ra) # 800035dc <mycpu>
    80004fd8:	07852783          	lw	a5,120(a0)
    80004fdc:	01813083          	ld	ra,24(sp)
    80004fe0:	01013403          	ld	s0,16(sp)
    80004fe4:	0017879b          	addiw	a5,a5,1
    80004fe8:	06f52c23          	sw	a5,120(a0)
    80004fec:	00813483          	ld	s1,8(sp)
    80004ff0:	02010113          	addi	sp,sp,32
    80004ff4:	00008067          	ret
    80004ff8:	0014d493          	srli	s1,s1,0x1
    80004ffc:	ffffe097          	auipc	ra,0xffffe
    80005000:	5e0080e7          	jalr	1504(ra) # 800035dc <mycpu>
    80005004:	0014f493          	andi	s1,s1,1
    80005008:	06952e23          	sw	s1,124(a0)
    8000500c:	fc5ff06f          	j	80004fd0 <push_on+0x34>

0000000080005010 <pop_on>:
    80005010:	ff010113          	addi	sp,sp,-16
    80005014:	00813023          	sd	s0,0(sp)
    80005018:	00113423          	sd	ra,8(sp)
    8000501c:	01010413          	addi	s0,sp,16
    80005020:	ffffe097          	auipc	ra,0xffffe
    80005024:	5bc080e7          	jalr	1468(ra) # 800035dc <mycpu>
    80005028:	100027f3          	csrr	a5,sstatus
    8000502c:	0027f793          	andi	a5,a5,2
    80005030:	04078463          	beqz	a5,80005078 <pop_on+0x68>
    80005034:	07852783          	lw	a5,120(a0)
    80005038:	02f05863          	blez	a5,80005068 <pop_on+0x58>
    8000503c:	fff7879b          	addiw	a5,a5,-1
    80005040:	06f52c23          	sw	a5,120(a0)
    80005044:	07853783          	ld	a5,120(a0)
    80005048:	00079863          	bnez	a5,80005058 <pop_on+0x48>
    8000504c:	100027f3          	csrr	a5,sstatus
    80005050:	ffd7f793          	andi	a5,a5,-3
    80005054:	10079073          	csrw	sstatus,a5
    80005058:	00813083          	ld	ra,8(sp)
    8000505c:	00013403          	ld	s0,0(sp)
    80005060:	01010113          	addi	sp,sp,16
    80005064:	00008067          	ret
    80005068:	00001517          	auipc	a0,0x1
    8000506c:	2c050513          	addi	a0,a0,704 # 80006328 <digits+0x70>
    80005070:	fffff097          	auipc	ra,0xfffff
    80005074:	f2c080e7          	jalr	-212(ra) # 80003f9c <panic>
    80005078:	00001517          	auipc	a0,0x1
    8000507c:	29050513          	addi	a0,a0,656 # 80006308 <digits+0x50>
    80005080:	fffff097          	auipc	ra,0xfffff
    80005084:	f1c080e7          	jalr	-228(ra) # 80003f9c <panic>

0000000080005088 <__memset>:
    80005088:	ff010113          	addi	sp,sp,-16
    8000508c:	00813423          	sd	s0,8(sp)
    80005090:	01010413          	addi	s0,sp,16
    80005094:	1a060e63          	beqz	a2,80005250 <__memset+0x1c8>
    80005098:	40a007b3          	neg	a5,a0
    8000509c:	0077f793          	andi	a5,a5,7
    800050a0:	00778693          	addi	a3,a5,7
    800050a4:	00b00813          	li	a6,11
    800050a8:	0ff5f593          	andi	a1,a1,255
    800050ac:	fff6071b          	addiw	a4,a2,-1
    800050b0:	1b06e663          	bltu	a3,a6,8000525c <__memset+0x1d4>
    800050b4:	1cd76463          	bltu	a4,a3,8000527c <__memset+0x1f4>
    800050b8:	1a078e63          	beqz	a5,80005274 <__memset+0x1ec>
    800050bc:	00b50023          	sb	a1,0(a0)
    800050c0:	00100713          	li	a4,1
    800050c4:	1ae78463          	beq	a5,a4,8000526c <__memset+0x1e4>
    800050c8:	00b500a3          	sb	a1,1(a0)
    800050cc:	00200713          	li	a4,2
    800050d0:	1ae78a63          	beq	a5,a4,80005284 <__memset+0x1fc>
    800050d4:	00b50123          	sb	a1,2(a0)
    800050d8:	00300713          	li	a4,3
    800050dc:	18e78463          	beq	a5,a4,80005264 <__memset+0x1dc>
    800050e0:	00b501a3          	sb	a1,3(a0)
    800050e4:	00400713          	li	a4,4
    800050e8:	1ae78263          	beq	a5,a4,8000528c <__memset+0x204>
    800050ec:	00b50223          	sb	a1,4(a0)
    800050f0:	00500713          	li	a4,5
    800050f4:	1ae78063          	beq	a5,a4,80005294 <__memset+0x20c>
    800050f8:	00b502a3          	sb	a1,5(a0)
    800050fc:	00700713          	li	a4,7
    80005100:	18e79e63          	bne	a5,a4,8000529c <__memset+0x214>
    80005104:	00b50323          	sb	a1,6(a0)
    80005108:	00700e93          	li	t4,7
    8000510c:	00859713          	slli	a4,a1,0x8
    80005110:	00e5e733          	or	a4,a1,a4
    80005114:	01059e13          	slli	t3,a1,0x10
    80005118:	01c76e33          	or	t3,a4,t3
    8000511c:	01859313          	slli	t1,a1,0x18
    80005120:	006e6333          	or	t1,t3,t1
    80005124:	02059893          	slli	a7,a1,0x20
    80005128:	40f60e3b          	subw	t3,a2,a5
    8000512c:	011368b3          	or	a7,t1,a7
    80005130:	02859813          	slli	a6,a1,0x28
    80005134:	0108e833          	or	a6,a7,a6
    80005138:	03059693          	slli	a3,a1,0x30
    8000513c:	003e589b          	srliw	a7,t3,0x3
    80005140:	00d866b3          	or	a3,a6,a3
    80005144:	03859713          	slli	a4,a1,0x38
    80005148:	00389813          	slli	a6,a7,0x3
    8000514c:	00f507b3          	add	a5,a0,a5
    80005150:	00e6e733          	or	a4,a3,a4
    80005154:	000e089b          	sext.w	a7,t3
    80005158:	00f806b3          	add	a3,a6,a5
    8000515c:	00e7b023          	sd	a4,0(a5)
    80005160:	00878793          	addi	a5,a5,8
    80005164:	fed79ce3          	bne	a5,a3,8000515c <__memset+0xd4>
    80005168:	ff8e7793          	andi	a5,t3,-8
    8000516c:	0007871b          	sext.w	a4,a5
    80005170:	01d787bb          	addw	a5,a5,t4
    80005174:	0ce88e63          	beq	a7,a4,80005250 <__memset+0x1c8>
    80005178:	00f50733          	add	a4,a0,a5
    8000517c:	00b70023          	sb	a1,0(a4)
    80005180:	0017871b          	addiw	a4,a5,1
    80005184:	0cc77663          	bgeu	a4,a2,80005250 <__memset+0x1c8>
    80005188:	00e50733          	add	a4,a0,a4
    8000518c:	00b70023          	sb	a1,0(a4)
    80005190:	0027871b          	addiw	a4,a5,2
    80005194:	0ac77e63          	bgeu	a4,a2,80005250 <__memset+0x1c8>
    80005198:	00e50733          	add	a4,a0,a4
    8000519c:	00b70023          	sb	a1,0(a4)
    800051a0:	0037871b          	addiw	a4,a5,3
    800051a4:	0ac77663          	bgeu	a4,a2,80005250 <__memset+0x1c8>
    800051a8:	00e50733          	add	a4,a0,a4
    800051ac:	00b70023          	sb	a1,0(a4)
    800051b0:	0047871b          	addiw	a4,a5,4
    800051b4:	08c77e63          	bgeu	a4,a2,80005250 <__memset+0x1c8>
    800051b8:	00e50733          	add	a4,a0,a4
    800051bc:	00b70023          	sb	a1,0(a4)
    800051c0:	0057871b          	addiw	a4,a5,5
    800051c4:	08c77663          	bgeu	a4,a2,80005250 <__memset+0x1c8>
    800051c8:	00e50733          	add	a4,a0,a4
    800051cc:	00b70023          	sb	a1,0(a4)
    800051d0:	0067871b          	addiw	a4,a5,6
    800051d4:	06c77e63          	bgeu	a4,a2,80005250 <__memset+0x1c8>
    800051d8:	00e50733          	add	a4,a0,a4
    800051dc:	00b70023          	sb	a1,0(a4)
    800051e0:	0077871b          	addiw	a4,a5,7
    800051e4:	06c77663          	bgeu	a4,a2,80005250 <__memset+0x1c8>
    800051e8:	00e50733          	add	a4,a0,a4
    800051ec:	00b70023          	sb	a1,0(a4)
    800051f0:	0087871b          	addiw	a4,a5,8
    800051f4:	04c77e63          	bgeu	a4,a2,80005250 <__memset+0x1c8>
    800051f8:	00e50733          	add	a4,a0,a4
    800051fc:	00b70023          	sb	a1,0(a4)
    80005200:	0097871b          	addiw	a4,a5,9
    80005204:	04c77663          	bgeu	a4,a2,80005250 <__memset+0x1c8>
    80005208:	00e50733          	add	a4,a0,a4
    8000520c:	00b70023          	sb	a1,0(a4)
    80005210:	00a7871b          	addiw	a4,a5,10
    80005214:	02c77e63          	bgeu	a4,a2,80005250 <__memset+0x1c8>
    80005218:	00e50733          	add	a4,a0,a4
    8000521c:	00b70023          	sb	a1,0(a4)
    80005220:	00b7871b          	addiw	a4,a5,11
    80005224:	02c77663          	bgeu	a4,a2,80005250 <__memset+0x1c8>
    80005228:	00e50733          	add	a4,a0,a4
    8000522c:	00b70023          	sb	a1,0(a4)
    80005230:	00c7871b          	addiw	a4,a5,12
    80005234:	00c77e63          	bgeu	a4,a2,80005250 <__memset+0x1c8>
    80005238:	00e50733          	add	a4,a0,a4
    8000523c:	00b70023          	sb	a1,0(a4)
    80005240:	00d7879b          	addiw	a5,a5,13
    80005244:	00c7f663          	bgeu	a5,a2,80005250 <__memset+0x1c8>
    80005248:	00f507b3          	add	a5,a0,a5
    8000524c:	00b78023          	sb	a1,0(a5)
    80005250:	00813403          	ld	s0,8(sp)
    80005254:	01010113          	addi	sp,sp,16
    80005258:	00008067          	ret
    8000525c:	00b00693          	li	a3,11
    80005260:	e55ff06f          	j	800050b4 <__memset+0x2c>
    80005264:	00300e93          	li	t4,3
    80005268:	ea5ff06f          	j	8000510c <__memset+0x84>
    8000526c:	00100e93          	li	t4,1
    80005270:	e9dff06f          	j	8000510c <__memset+0x84>
    80005274:	00000e93          	li	t4,0
    80005278:	e95ff06f          	j	8000510c <__memset+0x84>
    8000527c:	00000793          	li	a5,0
    80005280:	ef9ff06f          	j	80005178 <__memset+0xf0>
    80005284:	00200e93          	li	t4,2
    80005288:	e85ff06f          	j	8000510c <__memset+0x84>
    8000528c:	00400e93          	li	t4,4
    80005290:	e7dff06f          	j	8000510c <__memset+0x84>
    80005294:	00500e93          	li	t4,5
    80005298:	e75ff06f          	j	8000510c <__memset+0x84>
    8000529c:	00600e93          	li	t4,6
    800052a0:	e6dff06f          	j	8000510c <__memset+0x84>

00000000800052a4 <__memmove>:
    800052a4:	ff010113          	addi	sp,sp,-16
    800052a8:	00813423          	sd	s0,8(sp)
    800052ac:	01010413          	addi	s0,sp,16
    800052b0:	0e060863          	beqz	a2,800053a0 <__memmove+0xfc>
    800052b4:	fff6069b          	addiw	a3,a2,-1
    800052b8:	0006881b          	sext.w	a6,a3
    800052bc:	0ea5e863          	bltu	a1,a0,800053ac <__memmove+0x108>
    800052c0:	00758713          	addi	a4,a1,7
    800052c4:	00a5e7b3          	or	a5,a1,a0
    800052c8:	40a70733          	sub	a4,a4,a0
    800052cc:	0077f793          	andi	a5,a5,7
    800052d0:	00f73713          	sltiu	a4,a4,15
    800052d4:	00174713          	xori	a4,a4,1
    800052d8:	0017b793          	seqz	a5,a5
    800052dc:	00e7f7b3          	and	a5,a5,a4
    800052e0:	10078863          	beqz	a5,800053f0 <__memmove+0x14c>
    800052e4:	00900793          	li	a5,9
    800052e8:	1107f463          	bgeu	a5,a6,800053f0 <__memmove+0x14c>
    800052ec:	0036581b          	srliw	a6,a2,0x3
    800052f0:	fff8081b          	addiw	a6,a6,-1
    800052f4:	02081813          	slli	a6,a6,0x20
    800052f8:	01d85893          	srli	a7,a6,0x1d
    800052fc:	00858813          	addi	a6,a1,8
    80005300:	00058793          	mv	a5,a1
    80005304:	00050713          	mv	a4,a0
    80005308:	01088833          	add	a6,a7,a6
    8000530c:	0007b883          	ld	a7,0(a5)
    80005310:	00878793          	addi	a5,a5,8
    80005314:	00870713          	addi	a4,a4,8
    80005318:	ff173c23          	sd	a7,-8(a4)
    8000531c:	ff0798e3          	bne	a5,a6,8000530c <__memmove+0x68>
    80005320:	ff867713          	andi	a4,a2,-8
    80005324:	02071793          	slli	a5,a4,0x20
    80005328:	0207d793          	srli	a5,a5,0x20
    8000532c:	00f585b3          	add	a1,a1,a5
    80005330:	40e686bb          	subw	a3,a3,a4
    80005334:	00f507b3          	add	a5,a0,a5
    80005338:	06e60463          	beq	a2,a4,800053a0 <__memmove+0xfc>
    8000533c:	0005c703          	lbu	a4,0(a1)
    80005340:	00e78023          	sb	a4,0(a5)
    80005344:	04068e63          	beqz	a3,800053a0 <__memmove+0xfc>
    80005348:	0015c603          	lbu	a2,1(a1)
    8000534c:	00100713          	li	a4,1
    80005350:	00c780a3          	sb	a2,1(a5)
    80005354:	04e68663          	beq	a3,a4,800053a0 <__memmove+0xfc>
    80005358:	0025c603          	lbu	a2,2(a1)
    8000535c:	00200713          	li	a4,2
    80005360:	00c78123          	sb	a2,2(a5)
    80005364:	02e68e63          	beq	a3,a4,800053a0 <__memmove+0xfc>
    80005368:	0035c603          	lbu	a2,3(a1)
    8000536c:	00300713          	li	a4,3
    80005370:	00c781a3          	sb	a2,3(a5)
    80005374:	02e68663          	beq	a3,a4,800053a0 <__memmove+0xfc>
    80005378:	0045c603          	lbu	a2,4(a1)
    8000537c:	00400713          	li	a4,4
    80005380:	00c78223          	sb	a2,4(a5)
    80005384:	00e68e63          	beq	a3,a4,800053a0 <__memmove+0xfc>
    80005388:	0055c603          	lbu	a2,5(a1)
    8000538c:	00500713          	li	a4,5
    80005390:	00c782a3          	sb	a2,5(a5)
    80005394:	00e68663          	beq	a3,a4,800053a0 <__memmove+0xfc>
    80005398:	0065c703          	lbu	a4,6(a1)
    8000539c:	00e78323          	sb	a4,6(a5)
    800053a0:	00813403          	ld	s0,8(sp)
    800053a4:	01010113          	addi	sp,sp,16
    800053a8:	00008067          	ret
    800053ac:	02061713          	slli	a4,a2,0x20
    800053b0:	02075713          	srli	a4,a4,0x20
    800053b4:	00e587b3          	add	a5,a1,a4
    800053b8:	f0f574e3          	bgeu	a0,a5,800052c0 <__memmove+0x1c>
    800053bc:	02069613          	slli	a2,a3,0x20
    800053c0:	02065613          	srli	a2,a2,0x20
    800053c4:	fff64613          	not	a2,a2
    800053c8:	00e50733          	add	a4,a0,a4
    800053cc:	00c78633          	add	a2,a5,a2
    800053d0:	fff7c683          	lbu	a3,-1(a5)
    800053d4:	fff78793          	addi	a5,a5,-1
    800053d8:	fff70713          	addi	a4,a4,-1
    800053dc:	00d70023          	sb	a3,0(a4)
    800053e0:	fec798e3          	bne	a5,a2,800053d0 <__memmove+0x12c>
    800053e4:	00813403          	ld	s0,8(sp)
    800053e8:	01010113          	addi	sp,sp,16
    800053ec:	00008067          	ret
    800053f0:	02069713          	slli	a4,a3,0x20
    800053f4:	02075713          	srli	a4,a4,0x20
    800053f8:	00170713          	addi	a4,a4,1
    800053fc:	00e50733          	add	a4,a0,a4
    80005400:	00050793          	mv	a5,a0
    80005404:	0005c683          	lbu	a3,0(a1)
    80005408:	00178793          	addi	a5,a5,1
    8000540c:	00158593          	addi	a1,a1,1
    80005410:	fed78fa3          	sb	a3,-1(a5)
    80005414:	fee798e3          	bne	a5,a4,80005404 <__memmove+0x160>
    80005418:	f89ff06f          	j	800053a0 <__memmove+0xfc>

000000008000541c <__putc>:
    8000541c:	fe010113          	addi	sp,sp,-32
    80005420:	00813823          	sd	s0,16(sp)
    80005424:	00113c23          	sd	ra,24(sp)
    80005428:	02010413          	addi	s0,sp,32
    8000542c:	00050793          	mv	a5,a0
    80005430:	fef40593          	addi	a1,s0,-17
    80005434:	00100613          	li	a2,1
    80005438:	00000513          	li	a0,0
    8000543c:	fef407a3          	sb	a5,-17(s0)
    80005440:	fffff097          	auipc	ra,0xfffff
    80005444:	b3c080e7          	jalr	-1220(ra) # 80003f7c <console_write>
    80005448:	01813083          	ld	ra,24(sp)
    8000544c:	01013403          	ld	s0,16(sp)
    80005450:	02010113          	addi	sp,sp,32
    80005454:	00008067          	ret

0000000080005458 <__getc>:
    80005458:	fe010113          	addi	sp,sp,-32
    8000545c:	00813823          	sd	s0,16(sp)
    80005460:	00113c23          	sd	ra,24(sp)
    80005464:	02010413          	addi	s0,sp,32
    80005468:	fe840593          	addi	a1,s0,-24
    8000546c:	00100613          	li	a2,1
    80005470:	00000513          	li	a0,0
    80005474:	fffff097          	auipc	ra,0xfffff
    80005478:	ae8080e7          	jalr	-1304(ra) # 80003f5c <console_read>
    8000547c:	fe844503          	lbu	a0,-24(s0)
    80005480:	01813083          	ld	ra,24(sp)
    80005484:	01013403          	ld	s0,16(sp)
    80005488:	02010113          	addi	sp,sp,32
    8000548c:	00008067          	ret

0000000080005490 <console_handler>:
    80005490:	fe010113          	addi	sp,sp,-32
    80005494:	00813823          	sd	s0,16(sp)
    80005498:	00113c23          	sd	ra,24(sp)
    8000549c:	00913423          	sd	s1,8(sp)
    800054a0:	02010413          	addi	s0,sp,32
    800054a4:	14202773          	csrr	a4,scause
    800054a8:	100027f3          	csrr	a5,sstatus
    800054ac:	0027f793          	andi	a5,a5,2
    800054b0:	06079e63          	bnez	a5,8000552c <console_handler+0x9c>
    800054b4:	00074c63          	bltz	a4,800054cc <console_handler+0x3c>
    800054b8:	01813083          	ld	ra,24(sp)
    800054bc:	01013403          	ld	s0,16(sp)
    800054c0:	00813483          	ld	s1,8(sp)
    800054c4:	02010113          	addi	sp,sp,32
    800054c8:	00008067          	ret
    800054cc:	0ff77713          	andi	a4,a4,255
    800054d0:	00900793          	li	a5,9
    800054d4:	fef712e3          	bne	a4,a5,800054b8 <console_handler+0x28>
    800054d8:	ffffe097          	auipc	ra,0xffffe
    800054dc:	6dc080e7          	jalr	1756(ra) # 80003bb4 <plic_claim>
    800054e0:	00a00793          	li	a5,10
    800054e4:	00050493          	mv	s1,a0
    800054e8:	02f50c63          	beq	a0,a5,80005520 <console_handler+0x90>
    800054ec:	fc0506e3          	beqz	a0,800054b8 <console_handler+0x28>
    800054f0:	00050593          	mv	a1,a0
    800054f4:	00001517          	auipc	a0,0x1
    800054f8:	d3c50513          	addi	a0,a0,-708 # 80006230 <CONSOLE_STATUS+0x220>
    800054fc:	fffff097          	auipc	ra,0xfffff
    80005500:	afc080e7          	jalr	-1284(ra) # 80003ff8 <__printf>
    80005504:	01013403          	ld	s0,16(sp)
    80005508:	01813083          	ld	ra,24(sp)
    8000550c:	00048513          	mv	a0,s1
    80005510:	00813483          	ld	s1,8(sp)
    80005514:	02010113          	addi	sp,sp,32
    80005518:	ffffe317          	auipc	t1,0xffffe
    8000551c:	6d430067          	jr	1748(t1) # 80003bec <plic_complete>
    80005520:	fffff097          	auipc	ra,0xfffff
    80005524:	3e0080e7          	jalr	992(ra) # 80004900 <uartintr>
    80005528:	fddff06f          	j	80005504 <console_handler+0x74>
    8000552c:	00001517          	auipc	a0,0x1
    80005530:	e0450513          	addi	a0,a0,-508 # 80006330 <digits+0x78>
    80005534:	fffff097          	auipc	ra,0xfffff
    80005538:	a68080e7          	jalr	-1432(ra) # 80003f9c <panic>
	...
