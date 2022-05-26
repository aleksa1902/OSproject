
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	89813103          	ld	sp,-1896(sp) # 80005898 <_GLOBAL_OFFSET_TABLE_+0x30>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	104020ef          	jal	ra,80002120 <start>

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
    80001184:	14d000ef          	jal	ra,80001ad0 <_ZN5Riscv20handleSupervisorTrapEv>

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
    80001284:	00100513          	li	a0,1
    80001288:	00813403          	ld	s0,8(sp)
    8000128c:	01010113          	addi	sp,sp,16
    80001290:	00008067          	ret

0000000080001294 <_Z11workerBodyAv>:
#include "../h/print.hpp"
#include "../h/ccb.hpp"
#include "../h/tcb.hpp"


void workerBodyA() {
    80001294:	fe010113          	addi	sp,sp,-32
    80001298:	00113c23          	sd	ra,24(sp)
    8000129c:	00813823          	sd	s0,16(sp)
    800012a0:	00913423          	sd	s1,8(sp)
    800012a4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800012a8:	00000493          	li	s1,0
    800012ac:	0300006f          	j	800012dc <_Z11workerBodyAv+0x48>
        printString("A: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    800012b0:	00168693          	addi	a3,a3,1
    800012b4:	000027b7          	lui	a5,0x2
    800012b8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800012bc:	00d7ee63          	bltu	a5,a3,800012d8 <_Z11workerBodyAv+0x44>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800012c0:	00000713          	li	a4,0
    800012c4:	000077b7          	lui	a5,0x7
    800012c8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800012cc:	fee7e2e3          	bltu	a5,a4,800012b0 <_Z11workerBodyAv+0x1c>
    800012d0:	00170713          	addi	a4,a4,1
    800012d4:	ff1ff06f          	j	800012c4 <_Z11workerBodyAv+0x30>
    for (uint64 i = 0; i < 10; i++) {
    800012d8:	00148493          	addi	s1,s1,1
    800012dc:	00900793          	li	a5,9
    800012e0:	0297ec63          	bltu	a5,s1,80001318 <_Z11workerBodyAv+0x84>
        printString("A: i="); printInteger(i); printString("\n");
    800012e4:	00004517          	auipc	a0,0x4
    800012e8:	d3c50513          	addi	a0,a0,-708 # 80005020 <CONSOLE_STATUS+0x10>
    800012ec:	00001097          	auipc	ra,0x1
    800012f0:	d34080e7          	jalr	-716(ra) # 80002020 <_Z11printStringPKc>
    800012f4:	00048513          	mv	a0,s1
    800012f8:	00001097          	auipc	ra,0x1
    800012fc:	d98080e7          	jalr	-616(ra) # 80002090 <_Z12printIntegerm>
    80001300:	00004517          	auipc	a0,0x4
    80001304:	df050513          	addi	a0,a0,-528 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001308:	00001097          	auipc	ra,0x1
    8000130c:	d18080e7          	jalr	-744(ra) # 80002020 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001310:	00000693          	li	a3,0
    80001314:	fa1ff06f          	j	800012b4 <_Z11workerBodyAv+0x20>
            // TCB::yield();
        }
    }
}
    80001318:	01813083          	ld	ra,24(sp)
    8000131c:	01013403          	ld	s0,16(sp)
    80001320:	00813483          	ld	s1,8(sp)
    80001324:	02010113          	addi	sp,sp,32
    80001328:	00008067          	ret

000000008000132c <_Z11workerBodyBv>:

void workerBodyB() {
    8000132c:	fe010113          	addi	sp,sp,-32
    80001330:	00113c23          	sd	ra,24(sp)
    80001334:	00813823          	sd	s0,16(sp)
    80001338:	00913423          	sd	s1,8(sp)
    8000133c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001340:	00000493          	li	s1,0
    80001344:	0300006f          	j	80001374 <_Z11workerBodyBv+0x48>
        printString("B: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    80001348:	00168693          	addi	a3,a3,1
    8000134c:	000027b7          	lui	a5,0x2
    80001350:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001354:	00d7ee63          	bltu	a5,a3,80001370 <_Z11workerBodyBv+0x44>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001358:	00000713          	li	a4,0
    8000135c:	000077b7          	lui	a5,0x7
    80001360:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001364:	fee7e2e3          	bltu	a5,a4,80001348 <_Z11workerBodyBv+0x1c>
    80001368:	00170713          	addi	a4,a4,1
    8000136c:	ff1ff06f          	j	8000135c <_Z11workerBodyBv+0x30>
    for (uint64 i = 0; i < 16; i++) {
    80001370:	00148493          	addi	s1,s1,1
    80001374:	00f00793          	li	a5,15
    80001378:	0297ec63          	bltu	a5,s1,800013b0 <_Z11workerBodyBv+0x84>
        printString("B: i="); printInteger(i); printString("\n");
    8000137c:	00004517          	auipc	a0,0x4
    80001380:	cac50513          	addi	a0,a0,-852 # 80005028 <CONSOLE_STATUS+0x18>
    80001384:	00001097          	auipc	ra,0x1
    80001388:	c9c080e7          	jalr	-868(ra) # 80002020 <_Z11printStringPKc>
    8000138c:	00048513          	mv	a0,s1
    80001390:	00001097          	auipc	ra,0x1
    80001394:	d00080e7          	jalr	-768(ra) # 80002090 <_Z12printIntegerm>
    80001398:	00004517          	auipc	a0,0x4
    8000139c:	d5850513          	addi	a0,a0,-680 # 800050f0 <CONSOLE_STATUS+0xe0>
    800013a0:	00001097          	auipc	ra,0x1
    800013a4:	c80080e7          	jalr	-896(ra) # 80002020 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800013a8:	00000693          	li	a3,0
    800013ac:	fa1ff06f          	j	8000134c <_Z11workerBodyBv+0x20>
            // TCB::yield();
        }
    }
}
    800013b0:	01813083          	ld	ra,24(sp)
    800013b4:	01013403          	ld	s0,16(sp)
    800013b8:	00813483          	ld	s1,8(sp)
    800013bc:	02010113          	addi	sp,sp,32
    800013c0:	00008067          	ret

00000000800013c4 <_Z9fibonaccim>:

uint64 fibonacci(uint64 n) {
    800013c4:	fe010113          	addi	sp,sp,-32
    800013c8:	00113c23          	sd	ra,24(sp)
    800013cc:	00813823          	sd	s0,16(sp)
    800013d0:	00913423          	sd	s1,8(sp)
    800013d4:	01213023          	sd	s2,0(sp)
    800013d8:	02010413          	addi	s0,sp,32
    800013dc:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800013e0:	00100793          	li	a5,1
    800013e4:	02a7f863          	bgeu	a5,a0,80001414 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { TCB::yield(); }
    800013e8:	00a00793          	li	a5,10
    800013ec:	02f577b3          	remu	a5,a0,a5
    800013f0:	02078e63          	beqz	a5,8000142c <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800013f4:	fff48513          	addi	a0,s1,-1
    800013f8:	00000097          	auipc	ra,0x0
    800013fc:	fcc080e7          	jalr	-52(ra) # 800013c4 <_Z9fibonaccim>
    80001400:	00050913          	mv	s2,a0
    80001404:	ffe48513          	addi	a0,s1,-2
    80001408:	00000097          	auipc	ra,0x0
    8000140c:	fbc080e7          	jalr	-68(ra) # 800013c4 <_Z9fibonaccim>
    80001410:	00a90533          	add	a0,s2,a0
}
    80001414:	01813083          	ld	ra,24(sp)
    80001418:	01013403          	ld	s0,16(sp)
    8000141c:	00813483          	ld	s1,8(sp)
    80001420:	00013903          	ld	s2,0(sp)
    80001424:	02010113          	addi	sp,sp,32
    80001428:	00008067          	ret
    if (n % 10 == 0) { TCB::yield(); }
    8000142c:	00000097          	auipc	ra,0x0
    80001430:	4f0080e7          	jalr	1264(ra) # 8000191c <_ZN3TCB5yieldEv>
    80001434:	fc1ff06f          	j	800013f4 <_Z9fibonaccim+0x30>

0000000080001438 <_Z11workerBodyCv>:
void workerBodyC() {
    80001438:	fe010113          	addi	sp,sp,-32
    8000143c:	00113c23          	sd	ra,24(sp)
    80001440:	00813823          	sd	s0,16(sp)
    80001444:	00913423          	sd	s1,8(sp)
    80001448:	01213023          	sd	s2,0(sp)
    8000144c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001450:	00000493          	li	s1,0
    80001454:	0380006f          	j	8000148c <_Z11workerBodyCv+0x54>
    for (; i < 3; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    80001458:	00004517          	auipc	a0,0x4
    8000145c:	bd850513          	addi	a0,a0,-1064 # 80005030 <CONSOLE_STATUS+0x20>
    80001460:	00001097          	auipc	ra,0x1
    80001464:	bc0080e7          	jalr	-1088(ra) # 80002020 <_Z11printStringPKc>
    80001468:	00048513          	mv	a0,s1
    8000146c:	00001097          	auipc	ra,0x1
    80001470:	c24080e7          	jalr	-988(ra) # 80002090 <_Z12printIntegerm>
    80001474:	00004517          	auipc	a0,0x4
    80001478:	c7c50513          	addi	a0,a0,-900 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000147c:	00001097          	auipc	ra,0x1
    80001480:	ba4080e7          	jalr	-1116(ra) # 80002020 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80001484:	0014849b          	addiw	s1,s1,1
    80001488:	0ff4f493          	andi	s1,s1,255
    8000148c:	00200793          	li	a5,2
    80001490:	fc97f4e3          	bgeu	a5,s1,80001458 <_Z11workerBodyCv+0x20>
    }

    printString("C: yield\n");
    80001494:	00004517          	auipc	a0,0x4
    80001498:	ba450513          	addi	a0,a0,-1116 # 80005038 <CONSOLE_STATUS+0x28>
    8000149c:	00001097          	auipc	ra,0x1
    800014a0:	b84080e7          	jalr	-1148(ra) # 80002020 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800014a4:	00700313          	li	t1,7
    TCB::yield();
    800014a8:	00000097          	auipc	ra,0x0
    800014ac:	474080e7          	jalr	1140(ra) # 8000191c <_ZN3TCB5yieldEv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800014b0:	00030913          	mv	s2,t1

    printString("C: t1="); printInteger(t1); printString("\n");
    800014b4:	00004517          	auipc	a0,0x4
    800014b8:	b9450513          	addi	a0,a0,-1132 # 80005048 <CONSOLE_STATUS+0x38>
    800014bc:	00001097          	auipc	ra,0x1
    800014c0:	b64080e7          	jalr	-1180(ra) # 80002020 <_Z11printStringPKc>
    800014c4:	00090513          	mv	a0,s2
    800014c8:	00001097          	auipc	ra,0x1
    800014cc:	bc8080e7          	jalr	-1080(ra) # 80002090 <_Z12printIntegerm>
    800014d0:	00004517          	auipc	a0,0x4
    800014d4:	c2050513          	addi	a0,a0,-992 # 800050f0 <CONSOLE_STATUS+0xe0>
    800014d8:	00001097          	auipc	ra,0x1
    800014dc:	b48080e7          	jalr	-1208(ra) # 80002020 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800014e0:	00c00513          	li	a0,12
    800014e4:	00000097          	auipc	ra,0x0
    800014e8:	ee0080e7          	jalr	-288(ra) # 800013c4 <_Z9fibonaccim>
    800014ec:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInteger(result); printString("\n");
    800014f0:	00004517          	auipc	a0,0x4
    800014f4:	b6050513          	addi	a0,a0,-1184 # 80005050 <CONSOLE_STATUS+0x40>
    800014f8:	00001097          	auipc	ra,0x1
    800014fc:	b28080e7          	jalr	-1240(ra) # 80002020 <_Z11printStringPKc>
    80001500:	00090513          	mv	a0,s2
    80001504:	00001097          	auipc	ra,0x1
    80001508:	b8c080e7          	jalr	-1140(ra) # 80002090 <_Z12printIntegerm>
    8000150c:	00004517          	auipc	a0,0x4
    80001510:	be450513          	addi	a0,a0,-1052 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001514:	00001097          	auipc	ra,0x1
    80001518:	b0c080e7          	jalr	-1268(ra) # 80002020 <_Z11printStringPKc>
    8000151c:	0380006f          	j	80001554 <_Z11workerBodyCv+0x11c>

    for (; i < 6; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    80001520:	00004517          	auipc	a0,0x4
    80001524:	b1050513          	addi	a0,a0,-1264 # 80005030 <CONSOLE_STATUS+0x20>
    80001528:	00001097          	auipc	ra,0x1
    8000152c:	af8080e7          	jalr	-1288(ra) # 80002020 <_Z11printStringPKc>
    80001530:	00048513          	mv	a0,s1
    80001534:	00001097          	auipc	ra,0x1
    80001538:	b5c080e7          	jalr	-1188(ra) # 80002090 <_Z12printIntegerm>
    8000153c:	00004517          	auipc	a0,0x4
    80001540:	bb450513          	addi	a0,a0,-1100 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001544:	00001097          	auipc	ra,0x1
    80001548:	adc080e7          	jalr	-1316(ra) # 80002020 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000154c:	0014849b          	addiw	s1,s1,1
    80001550:	0ff4f493          	andi	s1,s1,255
    80001554:	00500793          	li	a5,5
    80001558:	fc97f4e3          	bgeu	a5,s1,80001520 <_Z11workerBodyCv+0xe8>
    }
//    TCB::yield();
}
    8000155c:	01813083          	ld	ra,24(sp)
    80001560:	01013403          	ld	s0,16(sp)
    80001564:	00813483          	ld	s1,8(sp)
    80001568:	00013903          	ld	s2,0(sp)
    8000156c:	02010113          	addi	sp,sp,32
    80001570:	00008067          	ret

0000000080001574 <_Z11workerBodyDv>:
void workerBodyD() {
    80001574:	fe010113          	addi	sp,sp,-32
    80001578:	00113c23          	sd	ra,24(sp)
    8000157c:	00813823          	sd	s0,16(sp)
    80001580:	00913423          	sd	s1,8(sp)
    80001584:	01213023          	sd	s2,0(sp)
    80001588:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000158c:	00a00493          	li	s1,10
    80001590:	0380006f          	j	800015c8 <_Z11workerBodyDv+0x54>
    for (; i < 13; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    80001594:	00004517          	auipc	a0,0x4
    80001598:	acc50513          	addi	a0,a0,-1332 # 80005060 <CONSOLE_STATUS+0x50>
    8000159c:	00001097          	auipc	ra,0x1
    800015a0:	a84080e7          	jalr	-1404(ra) # 80002020 <_Z11printStringPKc>
    800015a4:	00048513          	mv	a0,s1
    800015a8:	00001097          	auipc	ra,0x1
    800015ac:	ae8080e7          	jalr	-1304(ra) # 80002090 <_Z12printIntegerm>
    800015b0:	00004517          	auipc	a0,0x4
    800015b4:	b4050513          	addi	a0,a0,-1216 # 800050f0 <CONSOLE_STATUS+0xe0>
    800015b8:	00001097          	auipc	ra,0x1
    800015bc:	a68080e7          	jalr	-1432(ra) # 80002020 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800015c0:	0014849b          	addiw	s1,s1,1
    800015c4:	0ff4f493          	andi	s1,s1,255
    800015c8:	00c00793          	li	a5,12
    800015cc:	fc97f4e3          	bgeu	a5,s1,80001594 <_Z11workerBodyDv+0x20>
    }

    printString("D: yield\n");
    800015d0:	00004517          	auipc	a0,0x4
    800015d4:	a9850513          	addi	a0,a0,-1384 # 80005068 <CONSOLE_STATUS+0x58>
    800015d8:	00001097          	auipc	ra,0x1
    800015dc:	a48080e7          	jalr	-1464(ra) # 80002020 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800015e0:	00500313          	li	t1,5
    TCB::yield();
    800015e4:	00000097          	auipc	ra,0x0
    800015e8:	338080e7          	jalr	824(ra) # 8000191c <_ZN3TCB5yieldEv>

    uint64 result = fibonacci(16);
    800015ec:	01000513          	li	a0,16
    800015f0:	00000097          	auipc	ra,0x0
    800015f4:	dd4080e7          	jalr	-556(ra) # 800013c4 <_Z9fibonaccim>
    800015f8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInteger(result); printString("\n");
    800015fc:	00004517          	auipc	a0,0x4
    80001600:	a7c50513          	addi	a0,a0,-1412 # 80005078 <CONSOLE_STATUS+0x68>
    80001604:	00001097          	auipc	ra,0x1
    80001608:	a1c080e7          	jalr	-1508(ra) # 80002020 <_Z11printStringPKc>
    8000160c:	00090513          	mv	a0,s2
    80001610:	00001097          	auipc	ra,0x1
    80001614:	a80080e7          	jalr	-1408(ra) # 80002090 <_Z12printIntegerm>
    80001618:	00004517          	auipc	a0,0x4
    8000161c:	ad850513          	addi	a0,a0,-1320 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001620:	00001097          	auipc	ra,0x1
    80001624:	a00080e7          	jalr	-1536(ra) # 80002020 <_Z11printStringPKc>
    80001628:	0380006f          	j	80001660 <_Z11workerBodyDv+0xec>

    for (; i < 16; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    8000162c:	00004517          	auipc	a0,0x4
    80001630:	a3450513          	addi	a0,a0,-1484 # 80005060 <CONSOLE_STATUS+0x50>
    80001634:	00001097          	auipc	ra,0x1
    80001638:	9ec080e7          	jalr	-1556(ra) # 80002020 <_Z11printStringPKc>
    8000163c:	00048513          	mv	a0,s1
    80001640:	00001097          	auipc	ra,0x1
    80001644:	a50080e7          	jalr	-1456(ra) # 80002090 <_Z12printIntegerm>
    80001648:	00004517          	auipc	a0,0x4
    8000164c:	aa850513          	addi	a0,a0,-1368 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001650:	00001097          	auipc	ra,0x1
    80001654:	9d0080e7          	jalr	-1584(ra) # 80002020 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80001658:	0014849b          	addiw	s1,s1,1
    8000165c:	0ff4f493          	andi	s1,s1,255
    80001660:	00f00793          	li	a5,15
    80001664:	fc97f4e3          	bgeu	a5,s1,8000162c <_Z11workerBodyDv+0xb8>
    }
//    TCB::yield();
}
    80001668:	01813083          	ld	ra,24(sp)
    8000166c:	01013403          	ld	s0,16(sp)
    80001670:	00813483          	ld	s1,8(sp)
    80001674:	00013903          	ld	s2,0(sp)
    80001678:	02010113          	addi	sp,sp,32
    8000167c:	00008067          	ret

0000000080001680 <main>:
#include "../h/print.hpp"
#include "../h/tcb.hpp"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"

int main() {
    80001680:	fb010113          	addi	sp,sp,-80
    80001684:	04113423          	sd	ra,72(sp)
    80001688:	04813023          	sd	s0,64(sp)
    8000168c:	02913c23          	sd	s1,56(sp)
    80001690:	03213823          	sd	s2,48(sp)
    80001694:	05010413          	addi	s0,sp,80
    MemoryAllocator::memAlloc();
    80001698:	00000097          	auipc	ra,0x0
    8000169c:	70c080e7          	jalr	1804(ra) # 80001da4 <_ZN15MemoryAllocator8memAllocEv>
    TCB *threads[5];

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    800016a0:	00004797          	auipc	a5,0x4
    800016a4:	1d87b783          	ld	a5,472(a5) # 80005878 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    800016a8:	10579073          	csrw	stvec,a5

    threads[0] = TCB::createThread(nullptr);
    800016ac:	00000513          	li	a0,0
    800016b0:	00000097          	auipc	ra,0x0
    800016b4:	1f4080e7          	jalr	500(ra) # 800018a4 <_ZN3TCB12createThreadEPFvvE>
    800016b8:	faa43c23          	sd	a0,-72(s0)
    TCB::running = threads[0];
    800016bc:	00004797          	auipc	a5,0x4
    800016c0:	1e47b783          	ld	a5,484(a5) # 800058a0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800016c4:	00a7b023          	sd	a0,0(a5)
    threads[1] = TCB::createThread(workerBodyA);
    800016c8:	00004517          	auipc	a0,0x4
    800016cc:	1c853503          	ld	a0,456(a0) # 80005890 <_GLOBAL_OFFSET_TABLE_+0x28>
    800016d0:	00000097          	auipc	ra,0x0
    800016d4:	1d4080e7          	jalr	468(ra) # 800018a4 <_ZN3TCB12createThreadEPFvvE>
    800016d8:	fca43023          	sd	a0,-64(s0)
    printString("ThreadA created\n");
    800016dc:	00004517          	auipc	a0,0x4
    800016e0:	9ac50513          	addi	a0,a0,-1620 # 80005088 <CONSOLE_STATUS+0x78>
    800016e4:	00001097          	auipc	ra,0x1
    800016e8:	93c080e7          	jalr	-1732(ra) # 80002020 <_Z11printStringPKc>
    threads[2] = TCB::createThread(workerBodyB);
    800016ec:	00004517          	auipc	a0,0x4
    800016f0:	19453503          	ld	a0,404(a0) # 80005880 <_GLOBAL_OFFSET_TABLE_+0x18>
    800016f4:	00000097          	auipc	ra,0x0
    800016f8:	1b0080e7          	jalr	432(ra) # 800018a4 <_ZN3TCB12createThreadEPFvvE>
    800016fc:	fca43423          	sd	a0,-56(s0)
    printString("ThreadB created\n");
    80001700:	00004517          	auipc	a0,0x4
    80001704:	9a050513          	addi	a0,a0,-1632 # 800050a0 <CONSOLE_STATUS+0x90>
    80001708:	00001097          	auipc	ra,0x1
    8000170c:	918080e7          	jalr	-1768(ra) # 80002020 <_Z11printStringPKc>
    threads[3] = TCB::createThread(workerBodyC);
    80001710:	00004517          	auipc	a0,0x4
    80001714:	1a053503          	ld	a0,416(a0) # 800058b0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001718:	00000097          	auipc	ra,0x0
    8000171c:	18c080e7          	jalr	396(ra) # 800018a4 <_ZN3TCB12createThreadEPFvvE>
    80001720:	fca43823          	sd	a0,-48(s0)
    printString("ThreadC created\n");
    80001724:	00004517          	auipc	a0,0x4
    80001728:	99450513          	addi	a0,a0,-1644 # 800050b8 <CONSOLE_STATUS+0xa8>
    8000172c:	00001097          	auipc	ra,0x1
    80001730:	8f4080e7          	jalr	-1804(ra) # 80002020 <_Z11printStringPKc>
    threads[4] = TCB::createThread(workerBodyD);
    80001734:	00004517          	auipc	a0,0x4
    80001738:	18453503          	ld	a0,388(a0) # 800058b8 <_GLOBAL_OFFSET_TABLE_+0x50>
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	168080e7          	jalr	360(ra) # 800018a4 <_ZN3TCB12createThreadEPFvvE>
    80001744:	fca43c23          	sd	a0,-40(s0)
    printString("ThreadD created\n");
    80001748:	00004517          	auipc	a0,0x4
    8000174c:	98850513          	addi	a0,a0,-1656 # 800050d0 <CONSOLE_STATUS+0xc0>
    80001750:	00001097          	auipc	ra,0x1
    80001754:	8d0080e7          	jalr	-1840(ra) # 80002020 <_Z11printStringPKc>
inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001758:	00200793          	li	a5,2
    8000175c:	1007a073          	csrs	sstatus,a5
}
    80001760:	00c0006f          	j	8000176c <main+0xec>

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
             threads[3]->isFinished() && threads[4]->isFinished())) {
        TCB::yield();
    80001764:	00000097          	auipc	ra,0x0
    80001768:	1b8080e7          	jalr	440(ra) # 8000191c <_ZN3TCB5yieldEv>
    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
    8000176c:	fc043783          	ld	a5,-64(s0)
#include "../lib/hw.h"

class TCB {
        public:
        ~TCB() { delete[] stack; }
        bool isFinished() const { return finished; }
    80001770:	0287c783          	lbu	a5,40(a5)
    80001774:	fe0788e3          	beqz	a5,80001764 <main+0xe4>
    80001778:	fc843783          	ld	a5,-56(s0)
    8000177c:	0287c783          	lbu	a5,40(a5)
    80001780:	fe0782e3          	beqz	a5,80001764 <main+0xe4>
             threads[3]->isFinished() && threads[4]->isFinished())) {
    80001784:	fd043783          	ld	a5,-48(s0)
    80001788:	0287c783          	lbu	a5,40(a5)
    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
    8000178c:	fc078ce3          	beqz	a5,80001764 <main+0xe4>
             threads[3]->isFinished() && threads[4]->isFinished())) {
    80001790:	fd843783          	ld	a5,-40(s0)
    80001794:	0287c783          	lbu	a5,40(a5)
    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
    80001798:	fc0786e3          	beqz	a5,80001764 <main+0xe4>
    8000179c:	fb840493          	addi	s1,s0,-72
    800017a0:	0140006f          	j	800017b4 <main+0x134>
    }
    for (auto &thread: threads) { delete thread; }
    800017a4:	00090513          	mv	a0,s2
    800017a8:	00000097          	auipc	ra,0x0
    800017ac:	2b8080e7          	jalr	696(ra) # 80001a60 <_ZdlPv>
    800017b0:	00848493          	addi	s1,s1,8
    800017b4:	fe040793          	addi	a5,s0,-32
    800017b8:	02f48063          	beq	s1,a5,800017d8 <main+0x158>
    800017bc:	0004b903          	ld	s2,0(s1)
    800017c0:	fe0908e3          	beqz	s2,800017b0 <main+0x130>
        ~TCB() { delete[] stack; }
    800017c4:	00893503          	ld	a0,8(s2)
    800017c8:	fc050ee3          	beqz	a0,800017a4 <main+0x124>
    800017cc:	00000097          	auipc	ra,0x0
    800017d0:	2bc080e7          	jalr	700(ra) # 80001a88 <_ZdaPv>
    800017d4:	fd1ff06f          	j	800017a4 <main+0x124>
    printString("Finished\n");
    800017d8:	00004517          	auipc	a0,0x4
    800017dc:	91050513          	addi	a0,a0,-1776 # 800050e8 <CONSOLE_STATUS+0xd8>
    800017e0:	00001097          	auipc	ra,0x1
    800017e4:	840080e7          	jalr	-1984(ra) # 80002020 <_Z11printStringPKc>
    return 0;
}
    800017e8:	00000513          	li	a0,0
    800017ec:	04813083          	ld	ra,72(sp)
    800017f0:	04013403          	ld	s0,64(sp)
    800017f4:	03813483          	ld	s1,56(sp)
    800017f8:	03013903          	ld	s2,48(sp)
    800017fc:	05010113          	addi	sp,sp,80
    80001800:	00008067          	ret

0000000080001804 <_ZN3TCBC1EPFvvEm>:


TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

TCB::TCB(Body body, uint64 timeSlice) : body(body),
    80001804:	fd010113          	addi	sp,sp,-48
    80001808:	02113423          	sd	ra,40(sp)
    8000180c:	02813023          	sd	s0,32(sp)
    80001810:	00913c23          	sd	s1,24(sp)
    80001814:	01213823          	sd	s2,16(sp)
    80001818:	01313423          	sd	s3,8(sp)
    8000181c:	03010413          	addi	s0,sp,48
    80001820:	00050493          	mv	s1,a0
    80001824:	00058913          	mv	s2,a1
    80001828:	00060993          	mv	s3,a2
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
context({(uint64) &threadWrapper,
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
timeSlice(timeSlice),
finished(false) { if (body != nullptr) { Scheduler::put(this); } }
    8000182c:	00b53023          	sd	a1,0(a0)
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    80001830:	06058263          	beqz	a1,80001894 <_ZN3TCBC1EPFvvEm+0x90>
    80001834:	00002537          	lui	a0,0x2
    80001838:	00000097          	auipc	ra,0x0
    8000183c:	200080e7          	jalr	512(ra) # 80001a38 <_Znam>
finished(false) { if (body != nullptr) { Scheduler::put(this); } }
    80001840:	00a4b423          	sd	a0,8(s1)
    80001844:	00000797          	auipc	a5,0x0
    80001848:	0f478793          	addi	a5,a5,244 # 80001938 <_ZN3TCB13threadWrapperEv>
    8000184c:	00f4b823          	sd	a5,16(s1)
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
    80001850:	04050663          	beqz	a0,8000189c <_ZN3TCBC1EPFvvEm+0x98>
    80001854:	000027b7          	lui	a5,0x2
    80001858:	00f50533          	add	a0,a0,a5
finished(false) { if (body != nullptr) { Scheduler::put(this); } }
    8000185c:	00a4bc23          	sd	a0,24(s1)
    80001860:	0334b023          	sd	s3,32(s1)
    80001864:	02048423          	sb	zero,40(s1)
    80001868:	00090863          	beqz	s2,80001878 <_ZN3TCBC1EPFvvEm+0x74>
    8000186c:	00048513          	mv	a0,s1
    80001870:	00000097          	auipc	ra,0x0
    80001874:	494080e7          	jalr	1172(ra) # 80001d04 <_ZN9Scheduler3putEP3TCB>
    80001878:	02813083          	ld	ra,40(sp)
    8000187c:	02013403          	ld	s0,32(sp)
    80001880:	01813483          	ld	s1,24(sp)
    80001884:	01013903          	ld	s2,16(sp)
    80001888:	00813983          	ld	s3,8(sp)
    8000188c:	03010113          	addi	sp,sp,48
    80001890:	00008067          	ret
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    80001894:	00000513          	li	a0,0
    80001898:	fa9ff06f          	j	80001840 <_ZN3TCBC1EPFvvEm+0x3c>
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
    8000189c:	00000513          	li	a0,0
    800018a0:	fbdff06f          	j	8000185c <_ZN3TCBC1EPFvvEm+0x58>

00000000800018a4 <_ZN3TCB12createThreadEPFvvE>:

TCB *TCB::createThread(Body body) { return new TCB(body, TIME_SLICE); }
    800018a4:	fe010113          	addi	sp,sp,-32
    800018a8:	00113c23          	sd	ra,24(sp)
    800018ac:	00813823          	sd	s0,16(sp)
    800018b0:	00913423          	sd	s1,8(sp)
    800018b4:	01213023          	sd	s2,0(sp)
    800018b8:	02010413          	addi	s0,sp,32
    800018bc:	00050913          	mv	s2,a0
    800018c0:	03000513          	li	a0,48
    800018c4:	00000097          	auipc	ra,0x0
    800018c8:	14c080e7          	jalr	332(ra) # 80001a10 <_Znwm>
    800018cc:	00050493          	mv	s1,a0
    800018d0:	00200613          	li	a2,2
    800018d4:	00090593          	mv	a1,s2
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	f2c080e7          	jalr	-212(ra) # 80001804 <_ZN3TCBC1EPFvvEm>
    800018e0:	0200006f          	j	80001900 <_ZN3TCB12createThreadEPFvvE+0x5c>
    800018e4:	00050913          	mv	s2,a0
    800018e8:	00048513          	mv	a0,s1
    800018ec:	00000097          	auipc	ra,0x0
    800018f0:	174080e7          	jalr	372(ra) # 80001a60 <_ZdlPv>
    800018f4:	00090513          	mv	a0,s2
    800018f8:	00005097          	auipc	ra,0x5
    800018fc:	110080e7          	jalr	272(ra) # 80006a08 <_Unwind_Resume>
    80001900:	00048513          	mv	a0,s1
    80001904:	01813083          	ld	ra,24(sp)
    80001908:	01013403          	ld	s0,16(sp)
    8000190c:	00813483          	ld	s1,8(sp)
    80001910:	00013903          	ld	s2,0(sp)
    80001914:	02010113          	addi	sp,sp,32
    80001918:	00008067          	ret

000000008000191c <_ZN3TCB5yieldEv>:

void TCB::yield() { __asm__ volatile ("ecall"); }
    8000191c:	ff010113          	addi	sp,sp,-16
    80001920:	00813423          	sd	s0,8(sp)
    80001924:	01010413          	addi	s0,sp,16
    80001928:	00000073          	ecall
    8000192c:	00813403          	ld	s0,8(sp)
    80001930:	01010113          	addi	sp,sp,16
    80001934:	00008067          	ret

0000000080001938 <_ZN3TCB13threadWrapperEv>:
    running = Scheduler::get();
    Riscv::w_sstatus(sstatus);
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper() {
    80001938:	fe010113          	addi	sp,sp,-32
    8000193c:	00113c23          	sd	ra,24(sp)
    80001940:	00813823          	sd	s0,16(sp)
    80001944:	00913423          	sd	s1,8(sp)
    80001948:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	164080e7          	jalr	356(ra) # 80001ab0 <_ZN5Riscv10popSppSpieEv>
    running->body();
    80001954:	00004497          	auipc	s1,0x4
    80001958:	fbc48493          	addi	s1,s1,-68 # 80005910 <_ZN3TCB7runningE>
    8000195c:	0004b783          	ld	a5,0(s1)
    80001960:	0007b783          	ld	a5,0(a5) # 2000 <_entry-0x7fffe000>
    80001964:	000780e7          	jalr	a5
    running->setFinished(true);
    80001968:	0004b783          	ld	a5,0(s1)
        void setFinished(bool value) { finished = value; }
    8000196c:	00100713          	li	a4,1
    80001970:	02e78423          	sb	a4,40(a5)
    TCB::yield();
    80001974:	00000097          	auipc	ra,0x0
    80001978:	fa8080e7          	jalr	-88(ra) # 8000191c <_ZN3TCB5yieldEv>
}
    8000197c:	01813083          	ld	ra,24(sp)
    80001980:	01013403          	ld	s0,16(sp)
    80001984:	00813483          	ld	s1,8(sp)
    80001988:	02010113          	addi	sp,sp,32
    8000198c:	00008067          	ret

0000000080001990 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80001990:	fd010113          	addi	sp,sp,-48
    80001994:	02113423          	sd	ra,40(sp)
    80001998:	02813023          	sd	s0,32(sp)
    8000199c:	00913c23          	sd	s1,24(sp)
    800019a0:	01213823          	sd	s2,16(sp)
    800019a4:	03010413          	addi	s0,sp,48
    TCB *old = running;
    800019a8:	00004497          	auipc	s1,0x4
    800019ac:	f684b483          	ld	s1,-152(s1) # 80005910 <_ZN3TCB7runningE>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800019b0:	100027f3          	csrr	a5,sstatus
    800019b4:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800019b8:	fd843903          	ld	s2,-40(s0)
        bool isFinished() const { return finished; }
    800019bc:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished()) { Scheduler::put(old); }
    800019c0:	04078063          	beqz	a5,80001a00 <_ZN3TCB8dispatchEv+0x70>
    running = Scheduler::get();
    800019c4:	00000097          	auipc	ra,0x0
    800019c8:	2d8080e7          	jalr	728(ra) # 80001c9c <_ZN9Scheduler3getEv>
    800019cc:	00004797          	auipc	a5,0x4
    800019d0:	f4a7b223          	sd	a0,-188(a5) # 80005910 <_ZN3TCB7runningE>
}
inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800019d4:	10091073          	csrw	sstatus,s2
    TCB::contextSwitch(&old->context, &running->context);
    800019d8:	01050593          	addi	a1,a0,16 # 2010 <_entry-0x7fffdff0>
    800019dc:	01048513          	addi	a0,s1,16
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	840080e7          	jalr	-1984(ra) # 80001220 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800019e8:	02813083          	ld	ra,40(sp)
    800019ec:	02013403          	ld	s0,32(sp)
    800019f0:	01813483          	ld	s1,24(sp)
    800019f4:	01013903          	ld	s2,16(sp)
    800019f8:	03010113          	addi	sp,sp,48
    800019fc:	00008067          	ret
    if (!old->isFinished()) { Scheduler::put(old); }
    80001a00:	00048513          	mv	a0,s1
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	300080e7          	jalr	768(ra) # 80001d04 <_ZN9Scheduler3putEP3TCB>
    80001a0c:	fb9ff06f          	j	800019c4 <_ZN3TCB8dispatchEv+0x34>

0000000080001a10 <_Znwm>:
//
#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"

void *operator new(uint64 n) { return mem_alloc(n); }
    80001a10:	ff010113          	addi	sp,sp,-16
    80001a14:	00113423          	sd	ra,8(sp)
    80001a18:	00813023          	sd	s0,0(sp)
    80001a1c:	01010413          	addi	s0,sp,16
    80001a20:	00000097          	auipc	ra,0x0
    80001a24:	814080e7          	jalr	-2028(ra) # 80001234 <_Z9mem_allocm>
    80001a28:	00813083          	ld	ra,8(sp)
    80001a2c:	00013403          	ld	s0,0(sp)
    80001a30:	01010113          	addi	sp,sp,16
    80001a34:	00008067          	ret

0000000080001a38 <_Znam>:
void *operator new[](uint64 n) { return mem_alloc(n); }
    80001a38:	ff010113          	addi	sp,sp,-16
    80001a3c:	00113423          	sd	ra,8(sp)
    80001a40:	00813023          	sd	s0,0(sp)
    80001a44:	01010413          	addi	s0,sp,16
    80001a48:	fffff097          	auipc	ra,0xfffff
    80001a4c:	7ec080e7          	jalr	2028(ra) # 80001234 <_Z9mem_allocm>
    80001a50:	00813083          	ld	ra,8(sp)
    80001a54:	00013403          	ld	s0,0(sp)
    80001a58:	01010113          	addi	sp,sp,16
    80001a5c:	00008067          	ret

0000000080001a60 <_ZdlPv>:

void operator delete(void *p) noexcept { mem_free(p); }
    80001a60:	ff010113          	addi	sp,sp,-16
    80001a64:	00113423          	sd	ra,8(sp)
    80001a68:	00813023          	sd	s0,0(sp)
    80001a6c:	01010413          	addi	s0,sp,16
    80001a70:	fffff097          	auipc	ra,0xfffff
    80001a74:	7f4080e7          	jalr	2036(ra) # 80001264 <_Z8mem_freePv>
    80001a78:	00813083          	ld	ra,8(sp)
    80001a7c:	00013403          	ld	s0,0(sp)
    80001a80:	01010113          	addi	sp,sp,16
    80001a84:	00008067          	ret

0000000080001a88 <_ZdaPv>:
void operator delete[](void *p) noexcept { mem_free(p); }
    80001a88:	ff010113          	addi	sp,sp,-16
    80001a8c:	00113423          	sd	ra,8(sp)
    80001a90:	00813023          	sd	s0,0(sp)
    80001a94:	01010413          	addi	s0,sp,16
    80001a98:	fffff097          	auipc	ra,0xfffff
    80001a9c:	7cc080e7          	jalr	1996(ra) # 80001264 <_Z8mem_freePv>
    80001aa0:	00813083          	ld	ra,8(sp)
    80001aa4:	00013403          	ld	s0,0(sp)
    80001aa8:	01010113          	addi	sp,sp,16
    80001aac:	00008067          	ret

0000000080001ab0 <_ZN5Riscv10popSppSpieEv>:
#include "../h/riscv.hpp"
#include "../h/tcb.hpp"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"

void Riscv::popSppSpie() {
    80001ab0:	ff010113          	addi	sp,sp,-16
    80001ab4:	00813423          	sd	s0,8(sp)
    80001ab8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001abc:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001ac0:	10200073          	sret
}
    80001ac4:	00813403          	ld	s0,8(sp)
    80001ac8:	01010113          	addi	sp,sp,16
    80001acc:	00008067          	ret

0000000080001ad0 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80001ad0:	f9010113          	addi	sp,sp,-112
    80001ad4:	06113423          	sd	ra,104(sp)
    80001ad8:	06813023          	sd	s0,96(sp)
    80001adc:	04913c23          	sd	s1,88(sp)
    80001ae0:	05213823          	sd	s2,80(sp)
    80001ae4:	05313423          	sd	s3,72(sp)
    80001ae8:	07010413          	addi	s0,sp,112
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001aec:	142027f3          	csrr	a5,scause
    80001af0:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80001af4:	f9843703          	ld	a4,-104(s0)
    uint64 scause = r_scause();

    // velicina gde cu da mu obavestim koji je poziv
    size_t argument0;
    __asm__ volatile("mv %0, a0" : "=r" (argument0));
    80001af8:	00050493          	mv	s1,a0

    if(argument0 != 0 && scause == 0x0000000000000009UL){
    80001afc:	00048663          	beqz	s1,80001b08 <_ZN5Riscv20handleSupervisorTrapEv+0x38>
    80001b00:	00900793          	li	a5,9
    80001b04:	04f70463          	beq	a4,a5,80001b4c <_ZN5Riscv20handleSupervisorTrapEv+0x7c>
            MemoryAllocator::mem_free(argument_void);
        }

        w_sstatus(sstatus); w_sepc(sepc);
    }
    else if (scause == 0x0000000000000009UL) {
    80001b08:	00900793          	li	a5,9
    80001b0c:	08f70e63          	beq	a4,a5,80001ba8 <_ZN5Riscv20handleSupervisorTrapEv+0xd8>
        // interrupt: no; cause code: environment call from S-mode(9)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch();
        w_sstatus(sstatus); w_sepc(sepc);
    } else if (scause == 0x8000000000000001UL) {
    80001b10:	fff00793          	li	a5,-1
    80001b14:	03f79793          	slli	a5,a5,0x3f
    80001b18:	00178793          	addi	a5,a5,1
    80001b1c:	0cf70463          	beq	a4,a5,80001be4 <_ZN5Riscv20handleSupervisorTrapEv+0x114>
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus); w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    } else if (scause == 0x8000000000000009UL) {
    80001b20:	fff00793          	li	a5,-1
    80001b24:	03f79793          	slli	a5,a5,0x3f
    80001b28:	00978793          	addi	a5,a5,9
    80001b2c:	12f70263          	beq	a4,a5,80001c50 <_ZN5Riscv20handleSupervisorTrapEv+0x180>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else {
        // unexpected trap cause
    }
}
    80001b30:	06813083          	ld	ra,104(sp)
    80001b34:	06013403          	ld	s0,96(sp)
    80001b38:	05813483          	ld	s1,88(sp)
    80001b3c:	05013903          	ld	s2,80(sp)
    80001b40:	04813983          	ld	s3,72(sp)
    80001b44:	07010113          	addi	sp,sp,112
    80001b48:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001b4c:	141027f3          	csrr	a5,sepc
    80001b50:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80001b54:	fa843903          	ld	s2,-88(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80001b58:	00490913          	addi	s2,s2,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001b5c:	100027f3          	csrr	a5,sstatus
    80001b60:	faf43023          	sd	a5,-96(s0)
    return sstatus;
    80001b64:	fa043983          	ld	s3,-96(s0)
        if(argument0 == 1){
    80001b68:	00100793          	li	a5,1
    80001b6c:	00f48c63          	beq	s1,a5,80001b84 <_ZN5Riscv20handleSupervisorTrapEv+0xb4>
        if(argument0 == 2){
    80001b70:	00200793          	li	a5,2
    80001b74:	02f48263          	beq	s1,a5,80001b98 <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001b78:	10099073          	csrw	sstatus,s3
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001b7c:	14191073          	csrw	sepc,s2
}
    80001b80:	fb1ff06f          	j	80001b30 <_ZN5Riscv20handleSupervisorTrapEv+0x60>
            __asm__ volatile("mv %0, a1" : "=r" (argument_sizet));
    80001b84:	00058513          	mv	a0,a1
            argument_ret_void = MemoryAllocator::mem_alloc(argument_sizet);
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	26c080e7          	jalr	620(ra) # 80001df4 <_ZN15MemoryAllocator9mem_allocEm>
            __asm__ volatile("mv a0, %0" : : "r" (argument_ret_void));
    80001b90:	00050513          	mv	a0,a0
    80001b94:	fddff06f          	j	80001b70 <_ZN5Riscv20handleSupervisorTrapEv+0xa0>
            __asm__ volatile("mv %0, a1" : "=r" (argument_void));
    80001b98:	00058513          	mv	a0,a1
            MemoryAllocator::mem_free(argument_void);
    80001b9c:	00000097          	auipc	ra,0x0
    80001ba0:	398080e7          	jalr	920(ra) # 80001f34 <_ZN15MemoryAllocator8mem_freeEPv>
    80001ba4:	fd5ff06f          	j	80001b78 <_ZN5Riscv20handleSupervisorTrapEv+0xa8>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001ba8:	141027f3          	csrr	a5,sepc
    80001bac:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001bb0:	fb843483          	ld	s1,-72(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80001bb4:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001bb8:	100027f3          	csrr	a5,sstatus
    80001bbc:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001bc0:	fb043903          	ld	s2,-80(s0)
        TCB::timeSliceCounter = 0;
    80001bc4:	00004797          	auipc	a5,0x4
    80001bc8:	cc47b783          	ld	a5,-828(a5) # 80005888 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001bcc:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	dc0080e7          	jalr	-576(ra) # 80001990 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001bd8:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001bdc:	14149073          	csrw	sepc,s1
}
    80001be0:	f51ff06f          	j	80001b30 <_ZN5Riscv20handleSupervisorTrapEv+0x60>
        TCB::timeSliceCounter++;
    80001be4:	00004717          	auipc	a4,0x4
    80001be8:	ca473703          	ld	a4,-860(a4) # 80005888 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001bec:	00073783          	ld	a5,0(a4)
    80001bf0:	00178793          	addi	a5,a5,1
    80001bf4:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    80001bf8:	00004717          	auipc	a4,0x4
    80001bfc:	ca873703          	ld	a4,-856(a4) # 800058a0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001c00:	00073703          	ld	a4,0(a4)
        uint64 getTimeSlice() const { return timeSlice; }
    80001c04:	02073703          	ld	a4,32(a4)
    80001c08:	00e7f863          	bgeu	a5,a4,80001c18 <_ZN5Riscv20handleSupervisorTrapEv+0x148>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80001c0c:	00200793          	li	a5,2
    80001c10:	1447b073          	csrc	sip,a5
}
    80001c14:	f1dff06f          	j	80001b30 <_ZN5Riscv20handleSupervisorTrapEv+0x60>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001c18:	141027f3          	csrr	a5,sepc
    80001c1c:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80001c20:	fc843483          	ld	s1,-56(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001c24:	100027f3          	csrr	a5,sstatus
    80001c28:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80001c2c:	fc043903          	ld	s2,-64(s0)
            TCB::timeSliceCounter = 0;
    80001c30:	00004797          	auipc	a5,0x4
    80001c34:	c587b783          	ld	a5,-936(a5) # 80005888 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001c38:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80001c3c:	00000097          	auipc	ra,0x0
    80001c40:	d54080e7          	jalr	-684(ra) # 80001990 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001c44:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001c48:	14149073          	csrw	sepc,s1
}
    80001c4c:	fc1ff06f          	j	80001c0c <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
        console_handler();
    80001c50:	00002097          	auipc	ra,0x2
    80001c54:	600080e7          	jalr	1536(ra) # 80004250 <console_handler>
}
    80001c58:	ed9ff06f          	j	80001b30 <_ZN5Riscv20handleSupervisorTrapEv+0x60>

0000000080001c5c <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyCoroutineQueue.addLast(tcb);
    80001c5c:	ff010113          	addi	sp,sp,-16
    80001c60:	00813423          	sd	s0,8(sp)
    80001c64:	01010413          	addi	s0,sp,16
    80001c68:	00100793          	li	a5,1
    80001c6c:	00f50863          	beq	a0,a5,80001c7c <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001c70:	00813403          	ld	s0,8(sp)
    80001c74:	01010113          	addi	sp,sp,16
    80001c78:	00008067          	ret
    80001c7c:	000107b7          	lui	a5,0x10
    80001c80:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001c84:	fef596e3          	bne	a1,a5,80001c70 <_Z41__static_initialization_and_destruction_0ii+0x14>
        Elem(T *data, Elem *next) : data(data), next(next){}
    };

    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    80001c88:	00004797          	auipc	a5,0x4
    80001c8c:	c9878793          	addi	a5,a5,-872 # 80005920 <_ZN9Scheduler19readyCoroutineQueueE>
    80001c90:	0007b023          	sd	zero,0(a5)
    80001c94:	0007b423          	sd	zero,8(a5)
    80001c98:	fd9ff06f          	j	80001c70 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001c9c <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80001c9c:	fe010113          	addi	sp,sp,-32
    80001ca0:	00113c23          	sd	ra,24(sp)
    80001ca4:	00813823          	sd	s0,16(sp)
    80001ca8:	00913423          	sd	s1,8(sp)
    80001cac:	02010413          	addi	s0,sp,32
        }else{
            head = tail = elem;
        }
    }
    T *removeFirst(){
        if(!head){ return 0; }
    80001cb0:	00004517          	auipc	a0,0x4
    80001cb4:	c7053503          	ld	a0,-912(a0) # 80005920 <_ZN9Scheduler19readyCoroutineQueueE>
    80001cb8:	04050263          	beqz	a0,80001cfc <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80001cbc:	00853783          	ld	a5,8(a0)
    80001cc0:	00004717          	auipc	a4,0x4
    80001cc4:	c6f73023          	sd	a5,-928(a4) # 80005920 <_ZN9Scheduler19readyCoroutineQueueE>
        if(!head){ tail = 0; }
    80001cc8:	02078463          	beqz	a5,80001cf0 <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80001ccc:	00053483          	ld	s1,0(a0)
        delete elem;
    80001cd0:	00000097          	auipc	ra,0x0
    80001cd4:	d90080e7          	jalr	-624(ra) # 80001a60 <_ZdlPv>
}
    80001cd8:	00048513          	mv	a0,s1
    80001cdc:	01813083          	ld	ra,24(sp)
    80001ce0:	01013403          	ld	s0,16(sp)
    80001ce4:	00813483          	ld	s1,8(sp)
    80001ce8:	02010113          	addi	sp,sp,32
    80001cec:	00008067          	ret
        if(!head){ tail = 0; }
    80001cf0:	00004797          	auipc	a5,0x4
    80001cf4:	c207bc23          	sd	zero,-968(a5) # 80005928 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001cf8:	fd5ff06f          	j	80001ccc <_ZN9Scheduler3getEv+0x30>
        if(!head){ return 0; }
    80001cfc:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    80001d00:	fd9ff06f          	j	80001cd8 <_ZN9Scheduler3getEv+0x3c>

0000000080001d04 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80001d04:	fe010113          	addi	sp,sp,-32
    80001d08:	00113c23          	sd	ra,24(sp)
    80001d0c:	00813823          	sd	s0,16(sp)
    80001d10:	00913423          	sd	s1,8(sp)
    80001d14:	02010413          	addi	s0,sp,32
    80001d18:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80001d1c:	01000513          	li	a0,16
    80001d20:	00000097          	auipc	ra,0x0
    80001d24:	cf0080e7          	jalr	-784(ra) # 80001a10 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    80001d28:	00953023          	sd	s1,0(a0)
    80001d2c:	00053423          	sd	zero,8(a0)
        if(tail){
    80001d30:	00004797          	auipc	a5,0x4
    80001d34:	bf87b783          	ld	a5,-1032(a5) # 80005928 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001d38:	02078263          	beqz	a5,80001d5c <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    80001d3c:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001d40:	00004797          	auipc	a5,0x4
    80001d44:	bea7b423          	sd	a0,-1048(a5) # 80005928 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001d48:	01813083          	ld	ra,24(sp)
    80001d4c:	01013403          	ld	s0,16(sp)
    80001d50:	00813483          	ld	s1,8(sp)
    80001d54:	02010113          	addi	sp,sp,32
    80001d58:	00008067          	ret
            head = tail = elem;
    80001d5c:	00004797          	auipc	a5,0x4
    80001d60:	bc478793          	addi	a5,a5,-1084 # 80005920 <_ZN9Scheduler19readyCoroutineQueueE>
    80001d64:	00a7b423          	sd	a0,8(a5)
    80001d68:	00a7b023          	sd	a0,0(a5)
    80001d6c:	fddff06f          	j	80001d48 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080001d70 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80001d70:	ff010113          	addi	sp,sp,-16
    80001d74:	00113423          	sd	ra,8(sp)
    80001d78:	00813023          	sd	s0,0(sp)
    80001d7c:	01010413          	addi	s0,sp,16
    80001d80:	000105b7          	lui	a1,0x10
    80001d84:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001d88:	00100513          	li	a0,1
    80001d8c:	00000097          	auipc	ra,0x0
    80001d90:	ed0080e7          	jalr	-304(ra) # 80001c5c <_Z41__static_initialization_and_destruction_0ii>
    80001d94:	00813083          	ld	ra,8(sp)
    80001d98:	00013403          	ld	s0,0(sp)
    80001d9c:	01010113          	addi	sp,sp,16
    80001da0:	00008067          	ret

0000000080001da4 <_ZN15MemoryAllocator8memAllocEv>:

MemoryBloc* MemoryAllocator::freeMemBlocHead;
MemoryBloc* MemoryAllocator::takenMemBlocHead;

// Inicijalizacija memorije
void MemoryAllocator::memAlloc(){
    80001da4:	ff010113          	addi	sp,sp,-16
    80001da8:	00813423          	sd	s0,8(sp)
    80001dac:	01010413          	addi	s0,sp,16
    freeMemBlocHead = (MemoryBloc*)HEAP_START_ADDR;
    80001db0:	00004797          	auipc	a5,0x4
    80001db4:	ac07b783          	ld	a5,-1344(a5) # 80005870 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001db8:	0007b703          	ld	a4,0(a5)
    80001dbc:	00004797          	auipc	a5,0x4
    80001dc0:	b7478793          	addi	a5,a5,-1164 # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001dc4:	00e7b023          	sd	a4,0(a5)
    freeMemBlocHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    80001dc8:	00004697          	auipc	a3,0x4
    80001dcc:	ae06b683          	ld	a3,-1312(a3) # 800058a8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001dd0:	0006b683          	ld	a3,0(a3)
    80001dd4:	40e686b3          	sub	a3,a3,a4
    80001dd8:	00d73023          	sd	a3,0(a4)
    freeMemBlocHead->next = nullptr;
    80001ddc:	0007b703          	ld	a4,0(a5)
    80001de0:	00073423          	sd	zero,8(a4)

    takenMemBlocHead = nullptr;
    80001de4:	0007b423          	sd	zero,8(a5)
}
    80001de8:	00813403          	ld	s0,8(sp)
    80001dec:	01010113          	addi	sp,sp,16
    80001df0:	00008067          	ret

0000000080001df4 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc (size_t size){
    80001df4:	ff010113          	addi	sp,sp,-16
    80001df8:	00813423          	sd	s0,8(sp)
    80001dfc:	01010413          	addi	s0,sp,16
    size_t newSize;

    // ako je velicina veca od MEM_BLOC_SIZE onda uzmi blokova koliko ti treba + sizeof(MemoryBloc)
    // u suprotnom samo MEM_BLOC_SIZE + sizeof(MemoryBloc)
    if(size > MEM_BLOCK_SIZE){
    80001e00:	04000793          	li	a5,64
    80001e04:	02a7fa63          	bgeu	a5,a0,80001e38 <_ZN15MemoryAllocator9mem_allocEm+0x44>
        newSize = ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    80001e08:	00655713          	srli	a4,a0,0x6
    80001e0c:	00170713          	addi	a4,a4,1
    80001e10:	00671713          	slli	a4,a4,0x6
    80001e14:	01070713          	addi	a4,a4,16
    }else{
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    }

    // trazim prvi slobodan blok u listi slobodnih blokova gde mogu da alociram
    MemoryBloc* curr = freeMemBlocHead;
    80001e18:	00004617          	auipc	a2,0x4
    80001e1c:	b1863603          	ld	a2,-1256(a2) # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001e20:	00060513          	mv	a0,a2

    while(newSize > curr->size && curr != nullptr){
    80001e24:	00053783          	ld	a5,0(a0)
    80001e28:	00e7fc63          	bgeu	a5,a4,80001e40 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
    80001e2c:	00050a63          	beqz	a0,80001e40 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
        curr = curr->next;
    80001e30:	00853503          	ld	a0,8(a0)
    while(newSize > curr->size && curr != nullptr){
    80001e34:	ff1ff06f          	j	80001e24 <_ZN15MemoryAllocator9mem_allocEm+0x30>
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    80001e38:	05000713          	li	a4,80
    80001e3c:	fddff06f          	j	80001e18 <_ZN15MemoryAllocator9mem_allocEm+0x24>
    }

    if(curr == nullptr){
    80001e40:	00051863          	bnez	a0,80001e50 <_ZN15MemoryAllocator9mem_allocEm+0x5c>
            prevTaken->next = newBloc;
        }
    }

    return (void*)((char*)newBloc + sizeof(MemoryBloc));
};
    80001e44:	00813403          	ld	s0,8(sp)
    80001e48:	01010113          	addi	sp,sp,16
    80001e4c:	00008067          	ret
    if(curr == freeMemBlocHead){
    80001e50:	00c50e63          	beq	a0,a2,80001e6c <_ZN15MemoryAllocator9mem_allocEm+0x78>
    bool checkFree = false;
    80001e54:	00000593          	li	a1,0
    MemoryBloc* next = curr->next;
    80001e58:	00853803          	ld	a6,8(a0)
    size_t currSize = curr->size - newSize;
    80001e5c:	40e786b3          	sub	a3,a5,a4
    if(currSize == 0){
    80001e60:	06e79663          	bne	a5,a4,80001ecc <_ZN15MemoryAllocator9mem_allocEm+0xd8>
        MemoryBloc* currFree = freeMemBlocHead;
    80001e64:	00060793          	mv	a5,a2
    80001e68:	0100006f          	j	80001e78 <_ZN15MemoryAllocator9mem_allocEm+0x84>
        checkFree = true;
    80001e6c:	00100593          	li	a1,1
    80001e70:	fe9ff06f          	j	80001e58 <_ZN15MemoryAllocator9mem_allocEm+0x64>
            currFree = currFree->next;
    80001e74:	00068793          	mv	a5,a3
        while(currFree != nullptr && currFree->next != curr && checkFree != true){
    80001e78:	00078863          	beqz	a5,80001e88 <_ZN15MemoryAllocator9mem_allocEm+0x94>
    80001e7c:	0087b683          	ld	a3,8(a5)
    80001e80:	00a68463          	beq	a3,a0,80001e88 <_ZN15MemoryAllocator9mem_allocEm+0x94>
    80001e84:	fe0588e3          	beqz	a1,80001e74 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(currFree == freeMemBlocHead){
    80001e88:	02c78a63          	beq	a5,a2,80001ebc <_ZN15MemoryAllocator9mem_allocEm+0xc8>
            currFree->next = curr->next;
    80001e8c:	0107b423          	sd	a6,8(a5)
    newBloc->size = newSize;
    80001e90:	00e53023          	sd	a4,0(a0)
    if(takenMemBlocHead == nullptr){
    80001e94:	00004697          	auipc	a3,0x4
    80001e98:	aa46b683          	ld	a3,-1372(a3) # 80005938 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80001e9c:	06068263          	beqz	a3,80001f00 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
        MemoryBloc* nextTaken = takenMemBlocHead;
    80001ea0:	00068793          	mv	a5,a3
        MemoryBloc* prevTaken = nullptr;
    80001ea4:	00000713          	li	a4,0
        while (newBloc > nextTaken && nextTaken != nullptr){
    80001ea8:	06a7f463          	bgeu	a5,a0,80001f10 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
    80001eac:	06078263          	beqz	a5,80001f10 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
            prevTaken = nextTaken;
    80001eb0:	00078713          	mv	a4,a5
            nextTaken = nextTaken->next;
    80001eb4:	0087b783          	ld	a5,8(a5)
        while (newBloc > nextTaken && nextTaken != nullptr){
    80001eb8:	ff1ff06f          	j	80001ea8 <_ZN15MemoryAllocator9mem_allocEm+0xb4>
            freeMemBlocHead = freeMemBlocHead->next;
    80001ebc:	00863783          	ld	a5,8(a2)
    80001ec0:	00004697          	auipc	a3,0x4
    80001ec4:	a6f6b823          	sd	a5,-1424(a3) # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001ec8:	fc9ff06f          	j	80001e90 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
    }else if(checkFree == true){
    80001ecc:	02058263          	beqz	a1,80001ef0 <_ZN15MemoryAllocator9mem_allocEm+0xfc>
        freeMemBlocHead = (MemoryBloc*)((char*)freeMemBlocHead + newSize);
    80001ed0:	00e60633          	add	a2,a2,a4
    80001ed4:	00004797          	auipc	a5,0x4
    80001ed8:	a5c78793          	addi	a5,a5,-1444 # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001edc:	00c7b023          	sd	a2,0(a5)
        freeMemBlocHead->size = currSize;
    80001ee0:	00d63023          	sd	a3,0(a2)
        freeMemBlocHead->next = next;
    80001ee4:	0007b783          	ld	a5,0(a5)
    80001ee8:	0107b423          	sd	a6,8(a5)
    80001eec:	fa5ff06f          	j	80001e90 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        curr = (MemoryBloc*)((char*)curr + newSize);
    80001ef0:	00e507b3          	add	a5,a0,a4
        curr->size = currSize;
    80001ef4:	00d7b023          	sd	a3,0(a5)
        curr->next = next;
    80001ef8:	0107b423          	sd	a6,8(a5)
    80001efc:	f95ff06f          	j	80001e90 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        takenMemBlocHead = newBloc;
    80001f00:	00004797          	auipc	a5,0x4
    80001f04:	a2a7bc23          	sd	a0,-1480(a5) # 80005938 <_ZN15MemoryAllocator16takenMemBlocHeadE>
        newBloc->next = nullptr;
    80001f08:	00053423          	sd	zero,8(a0)
    80001f0c:	0100006f          	j	80001f1c <_ZN15MemoryAllocator9mem_allocEm+0x128>
        if(nextTaken == takenMemBlocHead){
    80001f10:	00f68a63          	beq	a3,a5,80001f24 <_ZN15MemoryAllocator9mem_allocEm+0x130>
            newBloc->next = nextTaken;
    80001f14:	00f53423          	sd	a5,8(a0)
            prevTaken->next = newBloc;
    80001f18:	00a73423          	sd	a0,8(a4)
    return (void*)((char*)newBloc + sizeof(MemoryBloc));
    80001f1c:	01050513          	addi	a0,a0,16
    80001f20:	f25ff06f          	j	80001e44 <_ZN15MemoryAllocator9mem_allocEm+0x50>
            newBloc->next = takenMemBlocHead;
    80001f24:	00d53423          	sd	a3,8(a0)
            takenMemBlocHead = newBloc;
    80001f28:	00004797          	auipc	a5,0x4
    80001f2c:	a0a7b823          	sd	a0,-1520(a5) # 80005938 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80001f30:	fedff06f          	j	80001f1c <_ZN15MemoryAllocator9mem_allocEm+0x128>

0000000080001f34 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free (void* mem){
    80001f34:	ff010113          	addi	sp,sp,-16
    80001f38:	00813423          	sd	s0,8(sp)
    80001f3c:	01010413          	addi	s0,sp,16
    void* freeCurr = (void*)((char*)mem - sizeof(MemoryBloc));
    80001f40:	ff050513          	addi	a0,a0,-16

    MemoryBloc* curr = takenMemBlocHead;
    80001f44:	00004697          	auipc	a3,0x4
    80001f48:	9f46b683          	ld	a3,-1548(a3) # 80005938 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80001f4c:	00068793          	mv	a5,a3
    MemoryBloc* prev = nullptr;
    80001f50:	00000713          	li	a4,0

    while (curr != freeCurr){
    80001f54:	00a78863          	beq	a5,a0,80001f64 <_ZN15MemoryAllocator8mem_freeEPv+0x30>
        prev = curr;
    80001f58:	00078713          	mv	a4,a5
        curr = curr->next;
    80001f5c:	0087b783          	ld	a5,8(a5)
    while (curr != freeCurr){
    80001f60:	ff5ff06f          	j	80001f54 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
    }
    // uraditi nepredvidjeno ponasanje ako hocu da dealociram nesto sto nisam alocirao
    if(curr == takenMemBlocHead){
    80001f64:	02d78863          	beq	a5,a3,80001f94 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        takenMemBlocHead = takenMemBlocHead->next;
    }else{
        prev->next = curr->next;
    80001f68:	0087b683          	ld	a3,8(a5)
    80001f6c:	00d73423          	sd	a3,8(a4)
    }

    if(freeMemBlocHead == nullptr){
    80001f70:	00004617          	auipc	a2,0x4
    80001f74:	9c063603          	ld	a2,-1600(a2) # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001f78:	02060663          	beqz	a2,80001fa4 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        freeMemBlocHead = curr;
    }else{
        MemoryBloc* currFree = freeMemBlocHead;
    80001f7c:	00060713          	mv	a4,a2
        MemoryBloc* prevFree = nullptr;
    80001f80:	00000693          	li	a3,0

        while(curr > currFree){
    80001f84:	02f77663          	bgeu	a4,a5,80001fb0 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
            prevFree = currFree;
    80001f88:	00070693          	mv	a3,a4
            currFree = currFree->next;
    80001f8c:	00873703          	ld	a4,8(a4)
        while(curr > currFree){
    80001f90:	ff5ff06f          	j	80001f84 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
        takenMemBlocHead = takenMemBlocHead->next;
    80001f94:	0086b703          	ld	a4,8(a3)
    80001f98:	00004697          	auipc	a3,0x4
    80001f9c:	9ae6b023          	sd	a4,-1632(a3) # 80005938 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80001fa0:	fd1ff06f          	j	80001f70 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
        freeMemBlocHead = curr;
    80001fa4:	00004717          	auipc	a4,0x4
    80001fa8:	98f73623          	sd	a5,-1652(a4) # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001fac:	0100006f          	j	80001fbc <_ZN15MemoryAllocator8mem_freeEPv+0x88>
        }

        if(currFree == freeMemBlocHead){
    80001fb0:	00e60c63          	beq	a2,a4,80001fc8 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
            curr->next = freeMemBlocHead;
            freeMemBlocHead = curr;
        }else{
            curr->next = currFree;
    80001fb4:	00e7b423          	sd	a4,8(a5)
            prevFree->next = curr;
    80001fb8:	00f6b423          	sd	a5,8(a3)
        }
    }

    MemoryBloc* currMemMerge = freeMemBlocHead;
    80001fbc:	00004797          	auipc	a5,0x4
    80001fc0:	9747b783          	ld	a5,-1676(a5) # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001fc4:	0300006f          	j	80001ff4 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
            curr->next = freeMemBlocHead;
    80001fc8:	00c7b423          	sd	a2,8(a5)
            freeMemBlocHead = curr;
    80001fcc:	00004717          	auipc	a4,0x4
    80001fd0:	96f73223          	sd	a5,-1692(a4) # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001fd4:	fe9ff06f          	j	80001fbc <_ZN15MemoryAllocator8mem_freeEPv+0x88>

    while(currMemMerge){
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
            currMemMerge->size += currMemMerge->next->size;
    80001fd8:	00073603          	ld	a2,0(a4)
    80001fdc:	00c686b3          	add	a3,a3,a2
    80001fe0:	00d7b023          	sd	a3,0(a5)
            currMemMerge->next = currMemMerge->next->next;
    80001fe4:	00873703          	ld	a4,8(a4)
    80001fe8:	00e7b423          	sd	a4,8(a5)
    80001fec:	00078713          	mv	a4,a5
    80001ff0:	00070793          	mv	a5,a4
    while(currMemMerge){
    80001ff4:	00078e63          	beqz	a5,80002010 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
    80001ff8:	0087b703          	ld	a4,8(a5)
    80001ffc:	fe070ae3          	beqz	a4,80001ff0 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80002000:	0007b683          	ld	a3,0(a5)
    80002004:	00d78633          	add	a2,a5,a3
    80002008:	fec714e3          	bne	a4,a2,80001ff0 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    8000200c:	fcdff06f          	j	80001fd8 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            currMemMerge = currMemMerge->next;
        }
    }

    return 0;
    80002010:	00000513          	li	a0,0
    80002014:	00813403          	ld	s0,8(sp)
    80002018:	01010113          	addi	sp,sp,16
    8000201c:	00008067          	ret

0000000080002020 <_Z11printStringPKc>:
#include "../lib/console.h"
#include "../h/riscv.hpp"


void printString(char const *string)
{
    80002020:	fd010113          	addi	sp,sp,-48
    80002024:	02113423          	sd	ra,40(sp)
    80002028:	02813023          	sd	s0,32(sp)
    8000202c:	00913c23          	sd	s1,24(sp)
    80002030:	01213823          	sd	s2,16(sp)
    80002034:	03010413          	addi	s0,sp,48
    80002038:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000203c:	100027f3          	csrr	a5,sstatus
    80002040:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80002044:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002048:	00200793          	li	a5,2
    8000204c:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    80002050:	0004c503          	lbu	a0,0(s1)
    80002054:	00050a63          	beqz	a0,80002068 <_Z11printStringPKc+0x48>
    {
        __putc(*string);
    80002058:	00002097          	auipc	ra,0x2
    8000205c:	184080e7          	jalr	388(ra) # 800041dc <__putc>
        string++;
    80002060:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002064:	fedff06f          	j	80002050 <_Z11printStringPKc+0x30>
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002068:	0009091b          	sext.w	s2,s2
    8000206c:	00297913          	andi	s2,s2,2
    80002070:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002074:	10092073          	csrs	sstatus,s2
}
    80002078:	02813083          	ld	ra,40(sp)
    8000207c:	02013403          	ld	s0,32(sp)
    80002080:	01813483          	ld	s1,24(sp)
    80002084:	01013903          	ld	s2,16(sp)
    80002088:	03010113          	addi	sp,sp,48
    8000208c:	00008067          	ret

0000000080002090 <_Z12printIntegerm>:


void printInteger(uint64 integer){
    80002090:	fd010113          	addi	sp,sp,-48
    80002094:	02113423          	sd	ra,40(sp)
    80002098:	02813023          	sd	s0,32(sp)
    8000209c:	00913c23          	sd	s1,24(sp)
    800020a0:	03010413          	addi	s0,sp,48
    neg = 0;
    if(integer < 0){
        neg = 1;
        x = -integer;
    }else{
        x = integer;
    800020a4:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    800020a8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x%10];
    800020ac:	00a00613          	li	a2,10
    800020b0:	02c5773b          	remuw	a4,a0,a2
    800020b4:	02071693          	slli	a3,a4,0x20
    800020b8:	0206d693          	srli	a3,a3,0x20
    800020bc:	00003717          	auipc	a4,0x3
    800020c0:	03c70713          	addi	a4,a4,60 # 800050f8 <_ZZ12printIntegermE6digits>
    800020c4:	00d70733          	add	a4,a4,a3
    800020c8:	00074703          	lbu	a4,0(a4)
    800020cc:	fe040693          	addi	a3,s0,-32
    800020d0:	009687b3          	add	a5,a3,s1
    800020d4:	0014849b          	addiw	s1,s1,1
    800020d8:	fee78823          	sb	a4,-16(a5)
    }while((x /= 10) != 0);
    800020dc:	0005071b          	sext.w	a4,a0
    800020e0:	02c5553b          	divuw	a0,a0,a2
    800020e4:	00900793          	li	a5,9
    800020e8:	fce7e2e3          	bltu	a5,a4,800020ac <_Z12printIntegerm+0x1c>
    if(neg){
        buf[i++] = '-';
    }
    while(--i >= 0)
    800020ec:	fff4849b          	addiw	s1,s1,-1
    800020f0:	0004ce63          	bltz	s1,8000210c <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    800020f4:	fe040793          	addi	a5,s0,-32
    800020f8:	009787b3          	add	a5,a5,s1
    800020fc:	ff07c503          	lbu	a0,-16(a5)
    80002100:	00002097          	auipc	ra,0x2
    80002104:	0dc080e7          	jalr	220(ra) # 800041dc <__putc>
    80002108:	fe5ff06f          	j	800020ec <_Z12printIntegerm+0x5c>
    8000210c:	02813083          	ld	ra,40(sp)
    80002110:	02013403          	ld	s0,32(sp)
    80002114:	01813483          	ld	s1,24(sp)
    80002118:	03010113          	addi	sp,sp,48
    8000211c:	00008067          	ret

0000000080002120 <start>:
    80002120:	ff010113          	addi	sp,sp,-16
    80002124:	00813423          	sd	s0,8(sp)
    80002128:	01010413          	addi	s0,sp,16
    8000212c:	300027f3          	csrr	a5,mstatus
    80002130:	ffffe737          	lui	a4,0xffffe
    80002134:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7c5f>
    80002138:	00e7f7b3          	and	a5,a5,a4
    8000213c:	00001737          	lui	a4,0x1
    80002140:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002144:	00e7e7b3          	or	a5,a5,a4
    80002148:	30079073          	csrw	mstatus,a5
    8000214c:	00000797          	auipc	a5,0x0
    80002150:	16078793          	addi	a5,a5,352 # 800022ac <system_main>
    80002154:	34179073          	csrw	mepc,a5
    80002158:	00000793          	li	a5,0
    8000215c:	18079073          	csrw	satp,a5
    80002160:	000107b7          	lui	a5,0x10
    80002164:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002168:	30279073          	csrw	medeleg,a5
    8000216c:	30379073          	csrw	mideleg,a5
    80002170:	104027f3          	csrr	a5,sie
    80002174:	2227e793          	ori	a5,a5,546
    80002178:	10479073          	csrw	sie,a5
    8000217c:	fff00793          	li	a5,-1
    80002180:	00a7d793          	srli	a5,a5,0xa
    80002184:	3b079073          	csrw	pmpaddr0,a5
    80002188:	00f00793          	li	a5,15
    8000218c:	3a079073          	csrw	pmpcfg0,a5
    80002190:	f14027f3          	csrr	a5,mhartid
    80002194:	0200c737          	lui	a4,0x200c
    80002198:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000219c:	0007869b          	sext.w	a3,a5
    800021a0:	00269713          	slli	a4,a3,0x2
    800021a4:	000f4637          	lui	a2,0xf4
    800021a8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800021ac:	00d70733          	add	a4,a4,a3
    800021b0:	0037979b          	slliw	a5,a5,0x3
    800021b4:	020046b7          	lui	a3,0x2004
    800021b8:	00d787b3          	add	a5,a5,a3
    800021bc:	00c585b3          	add	a1,a1,a2
    800021c0:	00371693          	slli	a3,a4,0x3
    800021c4:	00003717          	auipc	a4,0x3
    800021c8:	77c70713          	addi	a4,a4,1916 # 80005940 <timer_scratch>
    800021cc:	00b7b023          	sd	a1,0(a5)
    800021d0:	00d70733          	add	a4,a4,a3
    800021d4:	00f73c23          	sd	a5,24(a4)
    800021d8:	02c73023          	sd	a2,32(a4)
    800021dc:	34071073          	csrw	mscratch,a4
    800021e0:	00000797          	auipc	a5,0x0
    800021e4:	6e078793          	addi	a5,a5,1760 # 800028c0 <timervec>
    800021e8:	30579073          	csrw	mtvec,a5
    800021ec:	300027f3          	csrr	a5,mstatus
    800021f0:	0087e793          	ori	a5,a5,8
    800021f4:	30079073          	csrw	mstatus,a5
    800021f8:	304027f3          	csrr	a5,mie
    800021fc:	0807e793          	ori	a5,a5,128
    80002200:	30479073          	csrw	mie,a5
    80002204:	f14027f3          	csrr	a5,mhartid
    80002208:	0007879b          	sext.w	a5,a5
    8000220c:	00078213          	mv	tp,a5
    80002210:	30200073          	mret
    80002214:	00813403          	ld	s0,8(sp)
    80002218:	01010113          	addi	sp,sp,16
    8000221c:	00008067          	ret

0000000080002220 <timerinit>:
    80002220:	ff010113          	addi	sp,sp,-16
    80002224:	00813423          	sd	s0,8(sp)
    80002228:	01010413          	addi	s0,sp,16
    8000222c:	f14027f3          	csrr	a5,mhartid
    80002230:	0200c737          	lui	a4,0x200c
    80002234:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002238:	0007869b          	sext.w	a3,a5
    8000223c:	00269713          	slli	a4,a3,0x2
    80002240:	000f4637          	lui	a2,0xf4
    80002244:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002248:	00d70733          	add	a4,a4,a3
    8000224c:	0037979b          	slliw	a5,a5,0x3
    80002250:	020046b7          	lui	a3,0x2004
    80002254:	00d787b3          	add	a5,a5,a3
    80002258:	00c585b3          	add	a1,a1,a2
    8000225c:	00371693          	slli	a3,a4,0x3
    80002260:	00003717          	auipc	a4,0x3
    80002264:	6e070713          	addi	a4,a4,1760 # 80005940 <timer_scratch>
    80002268:	00b7b023          	sd	a1,0(a5)
    8000226c:	00d70733          	add	a4,a4,a3
    80002270:	00f73c23          	sd	a5,24(a4)
    80002274:	02c73023          	sd	a2,32(a4)
    80002278:	34071073          	csrw	mscratch,a4
    8000227c:	00000797          	auipc	a5,0x0
    80002280:	64478793          	addi	a5,a5,1604 # 800028c0 <timervec>
    80002284:	30579073          	csrw	mtvec,a5
    80002288:	300027f3          	csrr	a5,mstatus
    8000228c:	0087e793          	ori	a5,a5,8
    80002290:	30079073          	csrw	mstatus,a5
    80002294:	304027f3          	csrr	a5,mie
    80002298:	0807e793          	ori	a5,a5,128
    8000229c:	30479073          	csrw	mie,a5
    800022a0:	00813403          	ld	s0,8(sp)
    800022a4:	01010113          	addi	sp,sp,16
    800022a8:	00008067          	ret

00000000800022ac <system_main>:
    800022ac:	fe010113          	addi	sp,sp,-32
    800022b0:	00813823          	sd	s0,16(sp)
    800022b4:	00913423          	sd	s1,8(sp)
    800022b8:	00113c23          	sd	ra,24(sp)
    800022bc:	02010413          	addi	s0,sp,32
    800022c0:	00000097          	auipc	ra,0x0
    800022c4:	0c4080e7          	jalr	196(ra) # 80002384 <cpuid>
    800022c8:	00003497          	auipc	s1,0x3
    800022cc:	61848493          	addi	s1,s1,1560 # 800058e0 <started>
    800022d0:	02050263          	beqz	a0,800022f4 <system_main+0x48>
    800022d4:	0004a783          	lw	a5,0(s1)
    800022d8:	0007879b          	sext.w	a5,a5
    800022dc:	fe078ce3          	beqz	a5,800022d4 <system_main+0x28>
    800022e0:	0ff0000f          	fence
    800022e4:	00003517          	auipc	a0,0x3
    800022e8:	e5450513          	addi	a0,a0,-428 # 80005138 <_ZZ12printIntegermE6digits+0x40>
    800022ec:	00001097          	auipc	ra,0x1
    800022f0:	a70080e7          	jalr	-1424(ra) # 80002d5c <panic>
    800022f4:	00001097          	auipc	ra,0x1
    800022f8:	9c4080e7          	jalr	-1596(ra) # 80002cb8 <consoleinit>
    800022fc:	00001097          	auipc	ra,0x1
    80002300:	150080e7          	jalr	336(ra) # 8000344c <printfinit>
    80002304:	00003517          	auipc	a0,0x3
    80002308:	dec50513          	addi	a0,a0,-532 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000230c:	00001097          	auipc	ra,0x1
    80002310:	aac080e7          	jalr	-1364(ra) # 80002db8 <__printf>
    80002314:	00003517          	auipc	a0,0x3
    80002318:	df450513          	addi	a0,a0,-524 # 80005108 <_ZZ12printIntegermE6digits+0x10>
    8000231c:	00001097          	auipc	ra,0x1
    80002320:	a9c080e7          	jalr	-1380(ra) # 80002db8 <__printf>
    80002324:	00003517          	auipc	a0,0x3
    80002328:	dcc50513          	addi	a0,a0,-564 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000232c:	00001097          	auipc	ra,0x1
    80002330:	a8c080e7          	jalr	-1396(ra) # 80002db8 <__printf>
    80002334:	00001097          	auipc	ra,0x1
    80002338:	4a4080e7          	jalr	1188(ra) # 800037d8 <kinit>
    8000233c:	00000097          	auipc	ra,0x0
    80002340:	148080e7          	jalr	328(ra) # 80002484 <trapinit>
    80002344:	00000097          	auipc	ra,0x0
    80002348:	16c080e7          	jalr	364(ra) # 800024b0 <trapinithart>
    8000234c:	00000097          	auipc	ra,0x0
    80002350:	5b4080e7          	jalr	1460(ra) # 80002900 <plicinit>
    80002354:	00000097          	auipc	ra,0x0
    80002358:	5d4080e7          	jalr	1492(ra) # 80002928 <plicinithart>
    8000235c:	00000097          	auipc	ra,0x0
    80002360:	078080e7          	jalr	120(ra) # 800023d4 <userinit>
    80002364:	0ff0000f          	fence
    80002368:	00100793          	li	a5,1
    8000236c:	00003517          	auipc	a0,0x3
    80002370:	db450513          	addi	a0,a0,-588 # 80005120 <_ZZ12printIntegermE6digits+0x28>
    80002374:	00f4a023          	sw	a5,0(s1)
    80002378:	00001097          	auipc	ra,0x1
    8000237c:	a40080e7          	jalr	-1472(ra) # 80002db8 <__printf>
    80002380:	0000006f          	j	80002380 <system_main+0xd4>

0000000080002384 <cpuid>:
    80002384:	ff010113          	addi	sp,sp,-16
    80002388:	00813423          	sd	s0,8(sp)
    8000238c:	01010413          	addi	s0,sp,16
    80002390:	00020513          	mv	a0,tp
    80002394:	00813403          	ld	s0,8(sp)
    80002398:	0005051b          	sext.w	a0,a0
    8000239c:	01010113          	addi	sp,sp,16
    800023a0:	00008067          	ret

00000000800023a4 <mycpu>:
    800023a4:	ff010113          	addi	sp,sp,-16
    800023a8:	00813423          	sd	s0,8(sp)
    800023ac:	01010413          	addi	s0,sp,16
    800023b0:	00020793          	mv	a5,tp
    800023b4:	00813403          	ld	s0,8(sp)
    800023b8:	0007879b          	sext.w	a5,a5
    800023bc:	00779793          	slli	a5,a5,0x7
    800023c0:	00004517          	auipc	a0,0x4
    800023c4:	5b050513          	addi	a0,a0,1456 # 80006970 <cpus>
    800023c8:	00f50533          	add	a0,a0,a5
    800023cc:	01010113          	addi	sp,sp,16
    800023d0:	00008067          	ret

00000000800023d4 <userinit>:
    800023d4:	ff010113          	addi	sp,sp,-16
    800023d8:	00813423          	sd	s0,8(sp)
    800023dc:	01010413          	addi	s0,sp,16
    800023e0:	00813403          	ld	s0,8(sp)
    800023e4:	01010113          	addi	sp,sp,16
    800023e8:	fffff317          	auipc	t1,0xfffff
    800023ec:	29830067          	jr	664(t1) # 80001680 <main>

00000000800023f0 <either_copyout>:
    800023f0:	ff010113          	addi	sp,sp,-16
    800023f4:	00813023          	sd	s0,0(sp)
    800023f8:	00113423          	sd	ra,8(sp)
    800023fc:	01010413          	addi	s0,sp,16
    80002400:	02051663          	bnez	a0,8000242c <either_copyout+0x3c>
    80002404:	00058513          	mv	a0,a1
    80002408:	00060593          	mv	a1,a2
    8000240c:	0006861b          	sext.w	a2,a3
    80002410:	00002097          	auipc	ra,0x2
    80002414:	c54080e7          	jalr	-940(ra) # 80004064 <__memmove>
    80002418:	00813083          	ld	ra,8(sp)
    8000241c:	00013403          	ld	s0,0(sp)
    80002420:	00000513          	li	a0,0
    80002424:	01010113          	addi	sp,sp,16
    80002428:	00008067          	ret
    8000242c:	00003517          	auipc	a0,0x3
    80002430:	d3450513          	addi	a0,a0,-716 # 80005160 <_ZZ12printIntegermE6digits+0x68>
    80002434:	00001097          	auipc	ra,0x1
    80002438:	928080e7          	jalr	-1752(ra) # 80002d5c <panic>

000000008000243c <either_copyin>:
    8000243c:	ff010113          	addi	sp,sp,-16
    80002440:	00813023          	sd	s0,0(sp)
    80002444:	00113423          	sd	ra,8(sp)
    80002448:	01010413          	addi	s0,sp,16
    8000244c:	02059463          	bnez	a1,80002474 <either_copyin+0x38>
    80002450:	00060593          	mv	a1,a2
    80002454:	0006861b          	sext.w	a2,a3
    80002458:	00002097          	auipc	ra,0x2
    8000245c:	c0c080e7          	jalr	-1012(ra) # 80004064 <__memmove>
    80002460:	00813083          	ld	ra,8(sp)
    80002464:	00013403          	ld	s0,0(sp)
    80002468:	00000513          	li	a0,0
    8000246c:	01010113          	addi	sp,sp,16
    80002470:	00008067          	ret
    80002474:	00003517          	auipc	a0,0x3
    80002478:	d1450513          	addi	a0,a0,-748 # 80005188 <_ZZ12printIntegermE6digits+0x90>
    8000247c:	00001097          	auipc	ra,0x1
    80002480:	8e0080e7          	jalr	-1824(ra) # 80002d5c <panic>

0000000080002484 <trapinit>:
    80002484:	ff010113          	addi	sp,sp,-16
    80002488:	00813423          	sd	s0,8(sp)
    8000248c:	01010413          	addi	s0,sp,16
    80002490:	00813403          	ld	s0,8(sp)
    80002494:	00003597          	auipc	a1,0x3
    80002498:	d1c58593          	addi	a1,a1,-740 # 800051b0 <_ZZ12printIntegermE6digits+0xb8>
    8000249c:	00004517          	auipc	a0,0x4
    800024a0:	55450513          	addi	a0,a0,1364 # 800069f0 <tickslock>
    800024a4:	01010113          	addi	sp,sp,16
    800024a8:	00001317          	auipc	t1,0x1
    800024ac:	5c030067          	jr	1472(t1) # 80003a68 <initlock>

00000000800024b0 <trapinithart>:
    800024b0:	ff010113          	addi	sp,sp,-16
    800024b4:	00813423          	sd	s0,8(sp)
    800024b8:	01010413          	addi	s0,sp,16
    800024bc:	00000797          	auipc	a5,0x0
    800024c0:	2f478793          	addi	a5,a5,756 # 800027b0 <kernelvec>
    800024c4:	10579073          	csrw	stvec,a5
    800024c8:	00813403          	ld	s0,8(sp)
    800024cc:	01010113          	addi	sp,sp,16
    800024d0:	00008067          	ret

00000000800024d4 <usertrap>:
    800024d4:	ff010113          	addi	sp,sp,-16
    800024d8:	00813423          	sd	s0,8(sp)
    800024dc:	01010413          	addi	s0,sp,16
    800024e0:	00813403          	ld	s0,8(sp)
    800024e4:	01010113          	addi	sp,sp,16
    800024e8:	00008067          	ret

00000000800024ec <usertrapret>:
    800024ec:	ff010113          	addi	sp,sp,-16
    800024f0:	00813423          	sd	s0,8(sp)
    800024f4:	01010413          	addi	s0,sp,16
    800024f8:	00813403          	ld	s0,8(sp)
    800024fc:	01010113          	addi	sp,sp,16
    80002500:	00008067          	ret

0000000080002504 <kerneltrap>:
    80002504:	fe010113          	addi	sp,sp,-32
    80002508:	00813823          	sd	s0,16(sp)
    8000250c:	00113c23          	sd	ra,24(sp)
    80002510:	00913423          	sd	s1,8(sp)
    80002514:	02010413          	addi	s0,sp,32
    80002518:	142025f3          	csrr	a1,scause
    8000251c:	100027f3          	csrr	a5,sstatus
    80002520:	0027f793          	andi	a5,a5,2
    80002524:	10079c63          	bnez	a5,8000263c <kerneltrap+0x138>
    80002528:	142027f3          	csrr	a5,scause
    8000252c:	0207ce63          	bltz	a5,80002568 <kerneltrap+0x64>
    80002530:	00003517          	auipc	a0,0x3
    80002534:	cc850513          	addi	a0,a0,-824 # 800051f8 <_ZZ12printIntegermE6digits+0x100>
    80002538:	00001097          	auipc	ra,0x1
    8000253c:	880080e7          	jalr	-1920(ra) # 80002db8 <__printf>
    80002540:	141025f3          	csrr	a1,sepc
    80002544:	14302673          	csrr	a2,stval
    80002548:	00003517          	auipc	a0,0x3
    8000254c:	cc050513          	addi	a0,a0,-832 # 80005208 <_ZZ12printIntegermE6digits+0x110>
    80002550:	00001097          	auipc	ra,0x1
    80002554:	868080e7          	jalr	-1944(ra) # 80002db8 <__printf>
    80002558:	00003517          	auipc	a0,0x3
    8000255c:	cc850513          	addi	a0,a0,-824 # 80005220 <_ZZ12printIntegermE6digits+0x128>
    80002560:	00000097          	auipc	ra,0x0
    80002564:	7fc080e7          	jalr	2044(ra) # 80002d5c <panic>
    80002568:	0ff7f713          	andi	a4,a5,255
    8000256c:	00900693          	li	a3,9
    80002570:	04d70063          	beq	a4,a3,800025b0 <kerneltrap+0xac>
    80002574:	fff00713          	li	a4,-1
    80002578:	03f71713          	slli	a4,a4,0x3f
    8000257c:	00170713          	addi	a4,a4,1
    80002580:	fae798e3          	bne	a5,a4,80002530 <kerneltrap+0x2c>
    80002584:	00000097          	auipc	ra,0x0
    80002588:	e00080e7          	jalr	-512(ra) # 80002384 <cpuid>
    8000258c:	06050663          	beqz	a0,800025f8 <kerneltrap+0xf4>
    80002590:	144027f3          	csrr	a5,sip
    80002594:	ffd7f793          	andi	a5,a5,-3
    80002598:	14479073          	csrw	sip,a5
    8000259c:	01813083          	ld	ra,24(sp)
    800025a0:	01013403          	ld	s0,16(sp)
    800025a4:	00813483          	ld	s1,8(sp)
    800025a8:	02010113          	addi	sp,sp,32
    800025ac:	00008067          	ret
    800025b0:	00000097          	auipc	ra,0x0
    800025b4:	3c4080e7          	jalr	964(ra) # 80002974 <plic_claim>
    800025b8:	00a00793          	li	a5,10
    800025bc:	00050493          	mv	s1,a0
    800025c0:	06f50863          	beq	a0,a5,80002630 <kerneltrap+0x12c>
    800025c4:	fc050ce3          	beqz	a0,8000259c <kerneltrap+0x98>
    800025c8:	00050593          	mv	a1,a0
    800025cc:	00003517          	auipc	a0,0x3
    800025d0:	c0c50513          	addi	a0,a0,-1012 # 800051d8 <_ZZ12printIntegermE6digits+0xe0>
    800025d4:	00000097          	auipc	ra,0x0
    800025d8:	7e4080e7          	jalr	2020(ra) # 80002db8 <__printf>
    800025dc:	01013403          	ld	s0,16(sp)
    800025e0:	01813083          	ld	ra,24(sp)
    800025e4:	00048513          	mv	a0,s1
    800025e8:	00813483          	ld	s1,8(sp)
    800025ec:	02010113          	addi	sp,sp,32
    800025f0:	00000317          	auipc	t1,0x0
    800025f4:	3bc30067          	jr	956(t1) # 800029ac <plic_complete>
    800025f8:	00004517          	auipc	a0,0x4
    800025fc:	3f850513          	addi	a0,a0,1016 # 800069f0 <tickslock>
    80002600:	00001097          	auipc	ra,0x1
    80002604:	48c080e7          	jalr	1164(ra) # 80003a8c <acquire>
    80002608:	00003717          	auipc	a4,0x3
    8000260c:	2dc70713          	addi	a4,a4,732 # 800058e4 <ticks>
    80002610:	00072783          	lw	a5,0(a4)
    80002614:	00004517          	auipc	a0,0x4
    80002618:	3dc50513          	addi	a0,a0,988 # 800069f0 <tickslock>
    8000261c:	0017879b          	addiw	a5,a5,1
    80002620:	00f72023          	sw	a5,0(a4)
    80002624:	00001097          	auipc	ra,0x1
    80002628:	534080e7          	jalr	1332(ra) # 80003b58 <release>
    8000262c:	f65ff06f          	j	80002590 <kerneltrap+0x8c>
    80002630:	00001097          	auipc	ra,0x1
    80002634:	090080e7          	jalr	144(ra) # 800036c0 <uartintr>
    80002638:	fa5ff06f          	j	800025dc <kerneltrap+0xd8>
    8000263c:	00003517          	auipc	a0,0x3
    80002640:	b7c50513          	addi	a0,a0,-1156 # 800051b8 <_ZZ12printIntegermE6digits+0xc0>
    80002644:	00000097          	auipc	ra,0x0
    80002648:	718080e7          	jalr	1816(ra) # 80002d5c <panic>

000000008000264c <clockintr>:
    8000264c:	fe010113          	addi	sp,sp,-32
    80002650:	00813823          	sd	s0,16(sp)
    80002654:	00913423          	sd	s1,8(sp)
    80002658:	00113c23          	sd	ra,24(sp)
    8000265c:	02010413          	addi	s0,sp,32
    80002660:	00004497          	auipc	s1,0x4
    80002664:	39048493          	addi	s1,s1,912 # 800069f0 <tickslock>
    80002668:	00048513          	mv	a0,s1
    8000266c:	00001097          	auipc	ra,0x1
    80002670:	420080e7          	jalr	1056(ra) # 80003a8c <acquire>
    80002674:	00003717          	auipc	a4,0x3
    80002678:	27070713          	addi	a4,a4,624 # 800058e4 <ticks>
    8000267c:	00072783          	lw	a5,0(a4)
    80002680:	01013403          	ld	s0,16(sp)
    80002684:	01813083          	ld	ra,24(sp)
    80002688:	00048513          	mv	a0,s1
    8000268c:	0017879b          	addiw	a5,a5,1
    80002690:	00813483          	ld	s1,8(sp)
    80002694:	00f72023          	sw	a5,0(a4)
    80002698:	02010113          	addi	sp,sp,32
    8000269c:	00001317          	auipc	t1,0x1
    800026a0:	4bc30067          	jr	1212(t1) # 80003b58 <release>

00000000800026a4 <devintr>:
    800026a4:	142027f3          	csrr	a5,scause
    800026a8:	00000513          	li	a0,0
    800026ac:	0007c463          	bltz	a5,800026b4 <devintr+0x10>
    800026b0:	00008067          	ret
    800026b4:	fe010113          	addi	sp,sp,-32
    800026b8:	00813823          	sd	s0,16(sp)
    800026bc:	00113c23          	sd	ra,24(sp)
    800026c0:	00913423          	sd	s1,8(sp)
    800026c4:	02010413          	addi	s0,sp,32
    800026c8:	0ff7f713          	andi	a4,a5,255
    800026cc:	00900693          	li	a3,9
    800026d0:	04d70c63          	beq	a4,a3,80002728 <devintr+0x84>
    800026d4:	fff00713          	li	a4,-1
    800026d8:	03f71713          	slli	a4,a4,0x3f
    800026dc:	00170713          	addi	a4,a4,1
    800026e0:	00e78c63          	beq	a5,a4,800026f8 <devintr+0x54>
    800026e4:	01813083          	ld	ra,24(sp)
    800026e8:	01013403          	ld	s0,16(sp)
    800026ec:	00813483          	ld	s1,8(sp)
    800026f0:	02010113          	addi	sp,sp,32
    800026f4:	00008067          	ret
    800026f8:	00000097          	auipc	ra,0x0
    800026fc:	c8c080e7          	jalr	-884(ra) # 80002384 <cpuid>
    80002700:	06050663          	beqz	a0,8000276c <devintr+0xc8>
    80002704:	144027f3          	csrr	a5,sip
    80002708:	ffd7f793          	andi	a5,a5,-3
    8000270c:	14479073          	csrw	sip,a5
    80002710:	01813083          	ld	ra,24(sp)
    80002714:	01013403          	ld	s0,16(sp)
    80002718:	00813483          	ld	s1,8(sp)
    8000271c:	00200513          	li	a0,2
    80002720:	02010113          	addi	sp,sp,32
    80002724:	00008067          	ret
    80002728:	00000097          	auipc	ra,0x0
    8000272c:	24c080e7          	jalr	588(ra) # 80002974 <plic_claim>
    80002730:	00a00793          	li	a5,10
    80002734:	00050493          	mv	s1,a0
    80002738:	06f50663          	beq	a0,a5,800027a4 <devintr+0x100>
    8000273c:	00100513          	li	a0,1
    80002740:	fa0482e3          	beqz	s1,800026e4 <devintr+0x40>
    80002744:	00048593          	mv	a1,s1
    80002748:	00003517          	auipc	a0,0x3
    8000274c:	a9050513          	addi	a0,a0,-1392 # 800051d8 <_ZZ12printIntegermE6digits+0xe0>
    80002750:	00000097          	auipc	ra,0x0
    80002754:	668080e7          	jalr	1640(ra) # 80002db8 <__printf>
    80002758:	00048513          	mv	a0,s1
    8000275c:	00000097          	auipc	ra,0x0
    80002760:	250080e7          	jalr	592(ra) # 800029ac <plic_complete>
    80002764:	00100513          	li	a0,1
    80002768:	f7dff06f          	j	800026e4 <devintr+0x40>
    8000276c:	00004517          	auipc	a0,0x4
    80002770:	28450513          	addi	a0,a0,644 # 800069f0 <tickslock>
    80002774:	00001097          	auipc	ra,0x1
    80002778:	318080e7          	jalr	792(ra) # 80003a8c <acquire>
    8000277c:	00003717          	auipc	a4,0x3
    80002780:	16870713          	addi	a4,a4,360 # 800058e4 <ticks>
    80002784:	00072783          	lw	a5,0(a4)
    80002788:	00004517          	auipc	a0,0x4
    8000278c:	26850513          	addi	a0,a0,616 # 800069f0 <tickslock>
    80002790:	0017879b          	addiw	a5,a5,1
    80002794:	00f72023          	sw	a5,0(a4)
    80002798:	00001097          	auipc	ra,0x1
    8000279c:	3c0080e7          	jalr	960(ra) # 80003b58 <release>
    800027a0:	f65ff06f          	j	80002704 <devintr+0x60>
    800027a4:	00001097          	auipc	ra,0x1
    800027a8:	f1c080e7          	jalr	-228(ra) # 800036c0 <uartintr>
    800027ac:	fadff06f          	j	80002758 <devintr+0xb4>

00000000800027b0 <kernelvec>:
    800027b0:	f0010113          	addi	sp,sp,-256
    800027b4:	00113023          	sd	ra,0(sp)
    800027b8:	00213423          	sd	sp,8(sp)
    800027bc:	00313823          	sd	gp,16(sp)
    800027c0:	00413c23          	sd	tp,24(sp)
    800027c4:	02513023          	sd	t0,32(sp)
    800027c8:	02613423          	sd	t1,40(sp)
    800027cc:	02713823          	sd	t2,48(sp)
    800027d0:	02813c23          	sd	s0,56(sp)
    800027d4:	04913023          	sd	s1,64(sp)
    800027d8:	04a13423          	sd	a0,72(sp)
    800027dc:	04b13823          	sd	a1,80(sp)
    800027e0:	04c13c23          	sd	a2,88(sp)
    800027e4:	06d13023          	sd	a3,96(sp)
    800027e8:	06e13423          	sd	a4,104(sp)
    800027ec:	06f13823          	sd	a5,112(sp)
    800027f0:	07013c23          	sd	a6,120(sp)
    800027f4:	09113023          	sd	a7,128(sp)
    800027f8:	09213423          	sd	s2,136(sp)
    800027fc:	09313823          	sd	s3,144(sp)
    80002800:	09413c23          	sd	s4,152(sp)
    80002804:	0b513023          	sd	s5,160(sp)
    80002808:	0b613423          	sd	s6,168(sp)
    8000280c:	0b713823          	sd	s7,176(sp)
    80002810:	0b813c23          	sd	s8,184(sp)
    80002814:	0d913023          	sd	s9,192(sp)
    80002818:	0da13423          	sd	s10,200(sp)
    8000281c:	0db13823          	sd	s11,208(sp)
    80002820:	0dc13c23          	sd	t3,216(sp)
    80002824:	0fd13023          	sd	t4,224(sp)
    80002828:	0fe13423          	sd	t5,232(sp)
    8000282c:	0ff13823          	sd	t6,240(sp)
    80002830:	cd5ff0ef          	jal	ra,80002504 <kerneltrap>
    80002834:	00013083          	ld	ra,0(sp)
    80002838:	00813103          	ld	sp,8(sp)
    8000283c:	01013183          	ld	gp,16(sp)
    80002840:	02013283          	ld	t0,32(sp)
    80002844:	02813303          	ld	t1,40(sp)
    80002848:	03013383          	ld	t2,48(sp)
    8000284c:	03813403          	ld	s0,56(sp)
    80002850:	04013483          	ld	s1,64(sp)
    80002854:	04813503          	ld	a0,72(sp)
    80002858:	05013583          	ld	a1,80(sp)
    8000285c:	05813603          	ld	a2,88(sp)
    80002860:	06013683          	ld	a3,96(sp)
    80002864:	06813703          	ld	a4,104(sp)
    80002868:	07013783          	ld	a5,112(sp)
    8000286c:	07813803          	ld	a6,120(sp)
    80002870:	08013883          	ld	a7,128(sp)
    80002874:	08813903          	ld	s2,136(sp)
    80002878:	09013983          	ld	s3,144(sp)
    8000287c:	09813a03          	ld	s4,152(sp)
    80002880:	0a013a83          	ld	s5,160(sp)
    80002884:	0a813b03          	ld	s6,168(sp)
    80002888:	0b013b83          	ld	s7,176(sp)
    8000288c:	0b813c03          	ld	s8,184(sp)
    80002890:	0c013c83          	ld	s9,192(sp)
    80002894:	0c813d03          	ld	s10,200(sp)
    80002898:	0d013d83          	ld	s11,208(sp)
    8000289c:	0d813e03          	ld	t3,216(sp)
    800028a0:	0e013e83          	ld	t4,224(sp)
    800028a4:	0e813f03          	ld	t5,232(sp)
    800028a8:	0f013f83          	ld	t6,240(sp)
    800028ac:	10010113          	addi	sp,sp,256
    800028b0:	10200073          	sret
    800028b4:	00000013          	nop
    800028b8:	00000013          	nop
    800028bc:	00000013          	nop

00000000800028c0 <timervec>:
    800028c0:	34051573          	csrrw	a0,mscratch,a0
    800028c4:	00b53023          	sd	a1,0(a0)
    800028c8:	00c53423          	sd	a2,8(a0)
    800028cc:	00d53823          	sd	a3,16(a0)
    800028d0:	01853583          	ld	a1,24(a0)
    800028d4:	02053603          	ld	a2,32(a0)
    800028d8:	0005b683          	ld	a3,0(a1)
    800028dc:	00c686b3          	add	a3,a3,a2
    800028e0:	00d5b023          	sd	a3,0(a1)
    800028e4:	00200593          	li	a1,2
    800028e8:	14459073          	csrw	sip,a1
    800028ec:	01053683          	ld	a3,16(a0)
    800028f0:	00853603          	ld	a2,8(a0)
    800028f4:	00053583          	ld	a1,0(a0)
    800028f8:	34051573          	csrrw	a0,mscratch,a0
    800028fc:	30200073          	mret

0000000080002900 <plicinit>:
    80002900:	ff010113          	addi	sp,sp,-16
    80002904:	00813423          	sd	s0,8(sp)
    80002908:	01010413          	addi	s0,sp,16
    8000290c:	00813403          	ld	s0,8(sp)
    80002910:	0c0007b7          	lui	a5,0xc000
    80002914:	00100713          	li	a4,1
    80002918:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000291c:	00e7a223          	sw	a4,4(a5)
    80002920:	01010113          	addi	sp,sp,16
    80002924:	00008067          	ret

0000000080002928 <plicinithart>:
    80002928:	ff010113          	addi	sp,sp,-16
    8000292c:	00813023          	sd	s0,0(sp)
    80002930:	00113423          	sd	ra,8(sp)
    80002934:	01010413          	addi	s0,sp,16
    80002938:	00000097          	auipc	ra,0x0
    8000293c:	a4c080e7          	jalr	-1460(ra) # 80002384 <cpuid>
    80002940:	0085171b          	slliw	a4,a0,0x8
    80002944:	0c0027b7          	lui	a5,0xc002
    80002948:	00e787b3          	add	a5,a5,a4
    8000294c:	40200713          	li	a4,1026
    80002950:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002954:	00813083          	ld	ra,8(sp)
    80002958:	00013403          	ld	s0,0(sp)
    8000295c:	00d5151b          	slliw	a0,a0,0xd
    80002960:	0c2017b7          	lui	a5,0xc201
    80002964:	00a78533          	add	a0,a5,a0
    80002968:	00052023          	sw	zero,0(a0)
    8000296c:	01010113          	addi	sp,sp,16
    80002970:	00008067          	ret

0000000080002974 <plic_claim>:
    80002974:	ff010113          	addi	sp,sp,-16
    80002978:	00813023          	sd	s0,0(sp)
    8000297c:	00113423          	sd	ra,8(sp)
    80002980:	01010413          	addi	s0,sp,16
    80002984:	00000097          	auipc	ra,0x0
    80002988:	a00080e7          	jalr	-1536(ra) # 80002384 <cpuid>
    8000298c:	00813083          	ld	ra,8(sp)
    80002990:	00013403          	ld	s0,0(sp)
    80002994:	00d5151b          	slliw	a0,a0,0xd
    80002998:	0c2017b7          	lui	a5,0xc201
    8000299c:	00a78533          	add	a0,a5,a0
    800029a0:	00452503          	lw	a0,4(a0)
    800029a4:	01010113          	addi	sp,sp,16
    800029a8:	00008067          	ret

00000000800029ac <plic_complete>:
    800029ac:	fe010113          	addi	sp,sp,-32
    800029b0:	00813823          	sd	s0,16(sp)
    800029b4:	00913423          	sd	s1,8(sp)
    800029b8:	00113c23          	sd	ra,24(sp)
    800029bc:	02010413          	addi	s0,sp,32
    800029c0:	00050493          	mv	s1,a0
    800029c4:	00000097          	auipc	ra,0x0
    800029c8:	9c0080e7          	jalr	-1600(ra) # 80002384 <cpuid>
    800029cc:	01813083          	ld	ra,24(sp)
    800029d0:	01013403          	ld	s0,16(sp)
    800029d4:	00d5179b          	slliw	a5,a0,0xd
    800029d8:	0c201737          	lui	a4,0xc201
    800029dc:	00f707b3          	add	a5,a4,a5
    800029e0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800029e4:	00813483          	ld	s1,8(sp)
    800029e8:	02010113          	addi	sp,sp,32
    800029ec:	00008067          	ret

00000000800029f0 <consolewrite>:
    800029f0:	fb010113          	addi	sp,sp,-80
    800029f4:	04813023          	sd	s0,64(sp)
    800029f8:	04113423          	sd	ra,72(sp)
    800029fc:	02913c23          	sd	s1,56(sp)
    80002a00:	03213823          	sd	s2,48(sp)
    80002a04:	03313423          	sd	s3,40(sp)
    80002a08:	03413023          	sd	s4,32(sp)
    80002a0c:	01513c23          	sd	s5,24(sp)
    80002a10:	05010413          	addi	s0,sp,80
    80002a14:	06c05c63          	blez	a2,80002a8c <consolewrite+0x9c>
    80002a18:	00060993          	mv	s3,a2
    80002a1c:	00050a13          	mv	s4,a0
    80002a20:	00058493          	mv	s1,a1
    80002a24:	00000913          	li	s2,0
    80002a28:	fff00a93          	li	s5,-1
    80002a2c:	01c0006f          	j	80002a48 <consolewrite+0x58>
    80002a30:	fbf44503          	lbu	a0,-65(s0)
    80002a34:	0019091b          	addiw	s2,s2,1
    80002a38:	00148493          	addi	s1,s1,1
    80002a3c:	00001097          	auipc	ra,0x1
    80002a40:	a9c080e7          	jalr	-1380(ra) # 800034d8 <uartputc>
    80002a44:	03298063          	beq	s3,s2,80002a64 <consolewrite+0x74>
    80002a48:	00048613          	mv	a2,s1
    80002a4c:	00100693          	li	a3,1
    80002a50:	000a0593          	mv	a1,s4
    80002a54:	fbf40513          	addi	a0,s0,-65
    80002a58:	00000097          	auipc	ra,0x0
    80002a5c:	9e4080e7          	jalr	-1564(ra) # 8000243c <either_copyin>
    80002a60:	fd5518e3          	bne	a0,s5,80002a30 <consolewrite+0x40>
    80002a64:	04813083          	ld	ra,72(sp)
    80002a68:	04013403          	ld	s0,64(sp)
    80002a6c:	03813483          	ld	s1,56(sp)
    80002a70:	02813983          	ld	s3,40(sp)
    80002a74:	02013a03          	ld	s4,32(sp)
    80002a78:	01813a83          	ld	s5,24(sp)
    80002a7c:	00090513          	mv	a0,s2
    80002a80:	03013903          	ld	s2,48(sp)
    80002a84:	05010113          	addi	sp,sp,80
    80002a88:	00008067          	ret
    80002a8c:	00000913          	li	s2,0
    80002a90:	fd5ff06f          	j	80002a64 <consolewrite+0x74>

0000000080002a94 <consoleread>:
    80002a94:	f9010113          	addi	sp,sp,-112
    80002a98:	06813023          	sd	s0,96(sp)
    80002a9c:	04913c23          	sd	s1,88(sp)
    80002aa0:	05213823          	sd	s2,80(sp)
    80002aa4:	05313423          	sd	s3,72(sp)
    80002aa8:	05413023          	sd	s4,64(sp)
    80002aac:	03513c23          	sd	s5,56(sp)
    80002ab0:	03613823          	sd	s6,48(sp)
    80002ab4:	03713423          	sd	s7,40(sp)
    80002ab8:	03813023          	sd	s8,32(sp)
    80002abc:	06113423          	sd	ra,104(sp)
    80002ac0:	01913c23          	sd	s9,24(sp)
    80002ac4:	07010413          	addi	s0,sp,112
    80002ac8:	00060b93          	mv	s7,a2
    80002acc:	00050913          	mv	s2,a0
    80002ad0:	00058c13          	mv	s8,a1
    80002ad4:	00060b1b          	sext.w	s6,a2
    80002ad8:	00004497          	auipc	s1,0x4
    80002adc:	f4048493          	addi	s1,s1,-192 # 80006a18 <cons>
    80002ae0:	00400993          	li	s3,4
    80002ae4:	fff00a13          	li	s4,-1
    80002ae8:	00a00a93          	li	s5,10
    80002aec:	05705e63          	blez	s7,80002b48 <consoleread+0xb4>
    80002af0:	09c4a703          	lw	a4,156(s1)
    80002af4:	0984a783          	lw	a5,152(s1)
    80002af8:	0007071b          	sext.w	a4,a4
    80002afc:	08e78463          	beq	a5,a4,80002b84 <consoleread+0xf0>
    80002b00:	07f7f713          	andi	a4,a5,127
    80002b04:	00e48733          	add	a4,s1,a4
    80002b08:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002b0c:	0017869b          	addiw	a3,a5,1
    80002b10:	08d4ac23          	sw	a3,152(s1)
    80002b14:	00070c9b          	sext.w	s9,a4
    80002b18:	0b370663          	beq	a4,s3,80002bc4 <consoleread+0x130>
    80002b1c:	00100693          	li	a3,1
    80002b20:	f9f40613          	addi	a2,s0,-97
    80002b24:	000c0593          	mv	a1,s8
    80002b28:	00090513          	mv	a0,s2
    80002b2c:	f8e40fa3          	sb	a4,-97(s0)
    80002b30:	00000097          	auipc	ra,0x0
    80002b34:	8c0080e7          	jalr	-1856(ra) # 800023f0 <either_copyout>
    80002b38:	01450863          	beq	a0,s4,80002b48 <consoleread+0xb4>
    80002b3c:	001c0c13          	addi	s8,s8,1
    80002b40:	fffb8b9b          	addiw	s7,s7,-1
    80002b44:	fb5c94e3          	bne	s9,s5,80002aec <consoleread+0x58>
    80002b48:	000b851b          	sext.w	a0,s7
    80002b4c:	06813083          	ld	ra,104(sp)
    80002b50:	06013403          	ld	s0,96(sp)
    80002b54:	05813483          	ld	s1,88(sp)
    80002b58:	05013903          	ld	s2,80(sp)
    80002b5c:	04813983          	ld	s3,72(sp)
    80002b60:	04013a03          	ld	s4,64(sp)
    80002b64:	03813a83          	ld	s5,56(sp)
    80002b68:	02813b83          	ld	s7,40(sp)
    80002b6c:	02013c03          	ld	s8,32(sp)
    80002b70:	01813c83          	ld	s9,24(sp)
    80002b74:	40ab053b          	subw	a0,s6,a0
    80002b78:	03013b03          	ld	s6,48(sp)
    80002b7c:	07010113          	addi	sp,sp,112
    80002b80:	00008067          	ret
    80002b84:	00001097          	auipc	ra,0x1
    80002b88:	1d8080e7          	jalr	472(ra) # 80003d5c <push_on>
    80002b8c:	0984a703          	lw	a4,152(s1)
    80002b90:	09c4a783          	lw	a5,156(s1)
    80002b94:	0007879b          	sext.w	a5,a5
    80002b98:	fef70ce3          	beq	a4,a5,80002b90 <consoleread+0xfc>
    80002b9c:	00001097          	auipc	ra,0x1
    80002ba0:	234080e7          	jalr	564(ra) # 80003dd0 <pop_on>
    80002ba4:	0984a783          	lw	a5,152(s1)
    80002ba8:	07f7f713          	andi	a4,a5,127
    80002bac:	00e48733          	add	a4,s1,a4
    80002bb0:	01874703          	lbu	a4,24(a4)
    80002bb4:	0017869b          	addiw	a3,a5,1
    80002bb8:	08d4ac23          	sw	a3,152(s1)
    80002bbc:	00070c9b          	sext.w	s9,a4
    80002bc0:	f5371ee3          	bne	a4,s3,80002b1c <consoleread+0x88>
    80002bc4:	000b851b          	sext.w	a0,s7
    80002bc8:	f96bf2e3          	bgeu	s7,s6,80002b4c <consoleread+0xb8>
    80002bcc:	08f4ac23          	sw	a5,152(s1)
    80002bd0:	f7dff06f          	j	80002b4c <consoleread+0xb8>

0000000080002bd4 <consputc>:
    80002bd4:	10000793          	li	a5,256
    80002bd8:	00f50663          	beq	a0,a5,80002be4 <consputc+0x10>
    80002bdc:	00001317          	auipc	t1,0x1
    80002be0:	9f430067          	jr	-1548(t1) # 800035d0 <uartputc_sync>
    80002be4:	ff010113          	addi	sp,sp,-16
    80002be8:	00113423          	sd	ra,8(sp)
    80002bec:	00813023          	sd	s0,0(sp)
    80002bf0:	01010413          	addi	s0,sp,16
    80002bf4:	00800513          	li	a0,8
    80002bf8:	00001097          	auipc	ra,0x1
    80002bfc:	9d8080e7          	jalr	-1576(ra) # 800035d0 <uartputc_sync>
    80002c00:	02000513          	li	a0,32
    80002c04:	00001097          	auipc	ra,0x1
    80002c08:	9cc080e7          	jalr	-1588(ra) # 800035d0 <uartputc_sync>
    80002c0c:	00013403          	ld	s0,0(sp)
    80002c10:	00813083          	ld	ra,8(sp)
    80002c14:	00800513          	li	a0,8
    80002c18:	01010113          	addi	sp,sp,16
    80002c1c:	00001317          	auipc	t1,0x1
    80002c20:	9b430067          	jr	-1612(t1) # 800035d0 <uartputc_sync>

0000000080002c24 <consoleintr>:
    80002c24:	fe010113          	addi	sp,sp,-32
    80002c28:	00813823          	sd	s0,16(sp)
    80002c2c:	00913423          	sd	s1,8(sp)
    80002c30:	01213023          	sd	s2,0(sp)
    80002c34:	00113c23          	sd	ra,24(sp)
    80002c38:	02010413          	addi	s0,sp,32
    80002c3c:	00004917          	auipc	s2,0x4
    80002c40:	ddc90913          	addi	s2,s2,-548 # 80006a18 <cons>
    80002c44:	00050493          	mv	s1,a0
    80002c48:	00090513          	mv	a0,s2
    80002c4c:	00001097          	auipc	ra,0x1
    80002c50:	e40080e7          	jalr	-448(ra) # 80003a8c <acquire>
    80002c54:	02048c63          	beqz	s1,80002c8c <consoleintr+0x68>
    80002c58:	0a092783          	lw	a5,160(s2)
    80002c5c:	09892703          	lw	a4,152(s2)
    80002c60:	07f00693          	li	a3,127
    80002c64:	40e7873b          	subw	a4,a5,a4
    80002c68:	02e6e263          	bltu	a3,a4,80002c8c <consoleintr+0x68>
    80002c6c:	00d00713          	li	a4,13
    80002c70:	04e48063          	beq	s1,a4,80002cb0 <consoleintr+0x8c>
    80002c74:	07f7f713          	andi	a4,a5,127
    80002c78:	00e90733          	add	a4,s2,a4
    80002c7c:	0017879b          	addiw	a5,a5,1
    80002c80:	0af92023          	sw	a5,160(s2)
    80002c84:	00970c23          	sb	s1,24(a4)
    80002c88:	08f92e23          	sw	a5,156(s2)
    80002c8c:	01013403          	ld	s0,16(sp)
    80002c90:	01813083          	ld	ra,24(sp)
    80002c94:	00813483          	ld	s1,8(sp)
    80002c98:	00013903          	ld	s2,0(sp)
    80002c9c:	00004517          	auipc	a0,0x4
    80002ca0:	d7c50513          	addi	a0,a0,-644 # 80006a18 <cons>
    80002ca4:	02010113          	addi	sp,sp,32
    80002ca8:	00001317          	auipc	t1,0x1
    80002cac:	eb030067          	jr	-336(t1) # 80003b58 <release>
    80002cb0:	00a00493          	li	s1,10
    80002cb4:	fc1ff06f          	j	80002c74 <consoleintr+0x50>

0000000080002cb8 <consoleinit>:
    80002cb8:	fe010113          	addi	sp,sp,-32
    80002cbc:	00113c23          	sd	ra,24(sp)
    80002cc0:	00813823          	sd	s0,16(sp)
    80002cc4:	00913423          	sd	s1,8(sp)
    80002cc8:	02010413          	addi	s0,sp,32
    80002ccc:	00004497          	auipc	s1,0x4
    80002cd0:	d4c48493          	addi	s1,s1,-692 # 80006a18 <cons>
    80002cd4:	00048513          	mv	a0,s1
    80002cd8:	00002597          	auipc	a1,0x2
    80002cdc:	55858593          	addi	a1,a1,1368 # 80005230 <_ZZ12printIntegermE6digits+0x138>
    80002ce0:	00001097          	auipc	ra,0x1
    80002ce4:	d88080e7          	jalr	-632(ra) # 80003a68 <initlock>
    80002ce8:	00000097          	auipc	ra,0x0
    80002cec:	7ac080e7          	jalr	1964(ra) # 80003494 <uartinit>
    80002cf0:	01813083          	ld	ra,24(sp)
    80002cf4:	01013403          	ld	s0,16(sp)
    80002cf8:	00000797          	auipc	a5,0x0
    80002cfc:	d9c78793          	addi	a5,a5,-612 # 80002a94 <consoleread>
    80002d00:	0af4bc23          	sd	a5,184(s1)
    80002d04:	00000797          	auipc	a5,0x0
    80002d08:	cec78793          	addi	a5,a5,-788 # 800029f0 <consolewrite>
    80002d0c:	0cf4b023          	sd	a5,192(s1)
    80002d10:	00813483          	ld	s1,8(sp)
    80002d14:	02010113          	addi	sp,sp,32
    80002d18:	00008067          	ret

0000000080002d1c <console_read>:
    80002d1c:	ff010113          	addi	sp,sp,-16
    80002d20:	00813423          	sd	s0,8(sp)
    80002d24:	01010413          	addi	s0,sp,16
    80002d28:	00813403          	ld	s0,8(sp)
    80002d2c:	00004317          	auipc	t1,0x4
    80002d30:	da433303          	ld	t1,-604(t1) # 80006ad0 <devsw+0x10>
    80002d34:	01010113          	addi	sp,sp,16
    80002d38:	00030067          	jr	t1

0000000080002d3c <console_write>:
    80002d3c:	ff010113          	addi	sp,sp,-16
    80002d40:	00813423          	sd	s0,8(sp)
    80002d44:	01010413          	addi	s0,sp,16
    80002d48:	00813403          	ld	s0,8(sp)
    80002d4c:	00004317          	auipc	t1,0x4
    80002d50:	d8c33303          	ld	t1,-628(t1) # 80006ad8 <devsw+0x18>
    80002d54:	01010113          	addi	sp,sp,16
    80002d58:	00030067          	jr	t1

0000000080002d5c <panic>:
    80002d5c:	fe010113          	addi	sp,sp,-32
    80002d60:	00113c23          	sd	ra,24(sp)
    80002d64:	00813823          	sd	s0,16(sp)
    80002d68:	00913423          	sd	s1,8(sp)
    80002d6c:	02010413          	addi	s0,sp,32
    80002d70:	00050493          	mv	s1,a0
    80002d74:	00002517          	auipc	a0,0x2
    80002d78:	4c450513          	addi	a0,a0,1220 # 80005238 <_ZZ12printIntegermE6digits+0x140>
    80002d7c:	00004797          	auipc	a5,0x4
    80002d80:	de07ae23          	sw	zero,-516(a5) # 80006b78 <pr+0x18>
    80002d84:	00000097          	auipc	ra,0x0
    80002d88:	034080e7          	jalr	52(ra) # 80002db8 <__printf>
    80002d8c:	00048513          	mv	a0,s1
    80002d90:	00000097          	auipc	ra,0x0
    80002d94:	028080e7          	jalr	40(ra) # 80002db8 <__printf>
    80002d98:	00002517          	auipc	a0,0x2
    80002d9c:	35850513          	addi	a0,a0,856 # 800050f0 <CONSOLE_STATUS+0xe0>
    80002da0:	00000097          	auipc	ra,0x0
    80002da4:	018080e7          	jalr	24(ra) # 80002db8 <__printf>
    80002da8:	00100793          	li	a5,1
    80002dac:	00003717          	auipc	a4,0x3
    80002db0:	b2f72e23          	sw	a5,-1220(a4) # 800058e8 <panicked>
    80002db4:	0000006f          	j	80002db4 <panic+0x58>

0000000080002db8 <__printf>:
    80002db8:	f3010113          	addi	sp,sp,-208
    80002dbc:	08813023          	sd	s0,128(sp)
    80002dc0:	07313423          	sd	s3,104(sp)
    80002dc4:	09010413          	addi	s0,sp,144
    80002dc8:	05813023          	sd	s8,64(sp)
    80002dcc:	08113423          	sd	ra,136(sp)
    80002dd0:	06913c23          	sd	s1,120(sp)
    80002dd4:	07213823          	sd	s2,112(sp)
    80002dd8:	07413023          	sd	s4,96(sp)
    80002ddc:	05513c23          	sd	s5,88(sp)
    80002de0:	05613823          	sd	s6,80(sp)
    80002de4:	05713423          	sd	s7,72(sp)
    80002de8:	03913c23          	sd	s9,56(sp)
    80002dec:	03a13823          	sd	s10,48(sp)
    80002df0:	03b13423          	sd	s11,40(sp)
    80002df4:	00004317          	auipc	t1,0x4
    80002df8:	d6c30313          	addi	t1,t1,-660 # 80006b60 <pr>
    80002dfc:	01832c03          	lw	s8,24(t1)
    80002e00:	00b43423          	sd	a1,8(s0)
    80002e04:	00c43823          	sd	a2,16(s0)
    80002e08:	00d43c23          	sd	a3,24(s0)
    80002e0c:	02e43023          	sd	a4,32(s0)
    80002e10:	02f43423          	sd	a5,40(s0)
    80002e14:	03043823          	sd	a6,48(s0)
    80002e18:	03143c23          	sd	a7,56(s0)
    80002e1c:	00050993          	mv	s3,a0
    80002e20:	4a0c1663          	bnez	s8,800032cc <__printf+0x514>
    80002e24:	60098c63          	beqz	s3,8000343c <__printf+0x684>
    80002e28:	0009c503          	lbu	a0,0(s3)
    80002e2c:	00840793          	addi	a5,s0,8
    80002e30:	f6f43c23          	sd	a5,-136(s0)
    80002e34:	00000493          	li	s1,0
    80002e38:	22050063          	beqz	a0,80003058 <__printf+0x2a0>
    80002e3c:	00002a37          	lui	s4,0x2
    80002e40:	00018ab7          	lui	s5,0x18
    80002e44:	000f4b37          	lui	s6,0xf4
    80002e48:	00989bb7          	lui	s7,0x989
    80002e4c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002e50:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002e54:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002e58:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002e5c:	00148c9b          	addiw	s9,s1,1
    80002e60:	02500793          	li	a5,37
    80002e64:	01998933          	add	s2,s3,s9
    80002e68:	38f51263          	bne	a0,a5,800031ec <__printf+0x434>
    80002e6c:	00094783          	lbu	a5,0(s2)
    80002e70:	00078c9b          	sext.w	s9,a5
    80002e74:	1e078263          	beqz	a5,80003058 <__printf+0x2a0>
    80002e78:	0024849b          	addiw	s1,s1,2
    80002e7c:	07000713          	li	a4,112
    80002e80:	00998933          	add	s2,s3,s1
    80002e84:	38e78a63          	beq	a5,a4,80003218 <__printf+0x460>
    80002e88:	20f76863          	bltu	a4,a5,80003098 <__printf+0x2e0>
    80002e8c:	42a78863          	beq	a5,a0,800032bc <__printf+0x504>
    80002e90:	06400713          	li	a4,100
    80002e94:	40e79663          	bne	a5,a4,800032a0 <__printf+0x4e8>
    80002e98:	f7843783          	ld	a5,-136(s0)
    80002e9c:	0007a603          	lw	a2,0(a5)
    80002ea0:	00878793          	addi	a5,a5,8
    80002ea4:	f6f43c23          	sd	a5,-136(s0)
    80002ea8:	42064a63          	bltz	a2,800032dc <__printf+0x524>
    80002eac:	00a00713          	li	a4,10
    80002eb0:	02e677bb          	remuw	a5,a2,a4
    80002eb4:	00002d97          	auipc	s11,0x2
    80002eb8:	3acd8d93          	addi	s11,s11,940 # 80005260 <digits>
    80002ebc:	00900593          	li	a1,9
    80002ec0:	0006051b          	sext.w	a0,a2
    80002ec4:	00000c93          	li	s9,0
    80002ec8:	02079793          	slli	a5,a5,0x20
    80002ecc:	0207d793          	srli	a5,a5,0x20
    80002ed0:	00fd87b3          	add	a5,s11,a5
    80002ed4:	0007c783          	lbu	a5,0(a5)
    80002ed8:	02e656bb          	divuw	a3,a2,a4
    80002edc:	f8f40023          	sb	a5,-128(s0)
    80002ee0:	14c5d863          	bge	a1,a2,80003030 <__printf+0x278>
    80002ee4:	06300593          	li	a1,99
    80002ee8:	00100c93          	li	s9,1
    80002eec:	02e6f7bb          	remuw	a5,a3,a4
    80002ef0:	02079793          	slli	a5,a5,0x20
    80002ef4:	0207d793          	srli	a5,a5,0x20
    80002ef8:	00fd87b3          	add	a5,s11,a5
    80002efc:	0007c783          	lbu	a5,0(a5)
    80002f00:	02e6d73b          	divuw	a4,a3,a4
    80002f04:	f8f400a3          	sb	a5,-127(s0)
    80002f08:	12a5f463          	bgeu	a1,a0,80003030 <__printf+0x278>
    80002f0c:	00a00693          	li	a3,10
    80002f10:	00900593          	li	a1,9
    80002f14:	02d777bb          	remuw	a5,a4,a3
    80002f18:	02079793          	slli	a5,a5,0x20
    80002f1c:	0207d793          	srli	a5,a5,0x20
    80002f20:	00fd87b3          	add	a5,s11,a5
    80002f24:	0007c503          	lbu	a0,0(a5)
    80002f28:	02d757bb          	divuw	a5,a4,a3
    80002f2c:	f8a40123          	sb	a0,-126(s0)
    80002f30:	48e5f263          	bgeu	a1,a4,800033b4 <__printf+0x5fc>
    80002f34:	06300513          	li	a0,99
    80002f38:	02d7f5bb          	remuw	a1,a5,a3
    80002f3c:	02059593          	slli	a1,a1,0x20
    80002f40:	0205d593          	srli	a1,a1,0x20
    80002f44:	00bd85b3          	add	a1,s11,a1
    80002f48:	0005c583          	lbu	a1,0(a1)
    80002f4c:	02d7d7bb          	divuw	a5,a5,a3
    80002f50:	f8b401a3          	sb	a1,-125(s0)
    80002f54:	48e57263          	bgeu	a0,a4,800033d8 <__printf+0x620>
    80002f58:	3e700513          	li	a0,999
    80002f5c:	02d7f5bb          	remuw	a1,a5,a3
    80002f60:	02059593          	slli	a1,a1,0x20
    80002f64:	0205d593          	srli	a1,a1,0x20
    80002f68:	00bd85b3          	add	a1,s11,a1
    80002f6c:	0005c583          	lbu	a1,0(a1)
    80002f70:	02d7d7bb          	divuw	a5,a5,a3
    80002f74:	f8b40223          	sb	a1,-124(s0)
    80002f78:	46e57663          	bgeu	a0,a4,800033e4 <__printf+0x62c>
    80002f7c:	02d7f5bb          	remuw	a1,a5,a3
    80002f80:	02059593          	slli	a1,a1,0x20
    80002f84:	0205d593          	srli	a1,a1,0x20
    80002f88:	00bd85b3          	add	a1,s11,a1
    80002f8c:	0005c583          	lbu	a1,0(a1)
    80002f90:	02d7d7bb          	divuw	a5,a5,a3
    80002f94:	f8b402a3          	sb	a1,-123(s0)
    80002f98:	46ea7863          	bgeu	s4,a4,80003408 <__printf+0x650>
    80002f9c:	02d7f5bb          	remuw	a1,a5,a3
    80002fa0:	02059593          	slli	a1,a1,0x20
    80002fa4:	0205d593          	srli	a1,a1,0x20
    80002fa8:	00bd85b3          	add	a1,s11,a1
    80002fac:	0005c583          	lbu	a1,0(a1)
    80002fb0:	02d7d7bb          	divuw	a5,a5,a3
    80002fb4:	f8b40323          	sb	a1,-122(s0)
    80002fb8:	3eeaf863          	bgeu	s5,a4,800033a8 <__printf+0x5f0>
    80002fbc:	02d7f5bb          	remuw	a1,a5,a3
    80002fc0:	02059593          	slli	a1,a1,0x20
    80002fc4:	0205d593          	srli	a1,a1,0x20
    80002fc8:	00bd85b3          	add	a1,s11,a1
    80002fcc:	0005c583          	lbu	a1,0(a1)
    80002fd0:	02d7d7bb          	divuw	a5,a5,a3
    80002fd4:	f8b403a3          	sb	a1,-121(s0)
    80002fd8:	42eb7e63          	bgeu	s6,a4,80003414 <__printf+0x65c>
    80002fdc:	02d7f5bb          	remuw	a1,a5,a3
    80002fe0:	02059593          	slli	a1,a1,0x20
    80002fe4:	0205d593          	srli	a1,a1,0x20
    80002fe8:	00bd85b3          	add	a1,s11,a1
    80002fec:	0005c583          	lbu	a1,0(a1)
    80002ff0:	02d7d7bb          	divuw	a5,a5,a3
    80002ff4:	f8b40423          	sb	a1,-120(s0)
    80002ff8:	42ebfc63          	bgeu	s7,a4,80003430 <__printf+0x678>
    80002ffc:	02079793          	slli	a5,a5,0x20
    80003000:	0207d793          	srli	a5,a5,0x20
    80003004:	00fd8db3          	add	s11,s11,a5
    80003008:	000dc703          	lbu	a4,0(s11)
    8000300c:	00a00793          	li	a5,10
    80003010:	00900c93          	li	s9,9
    80003014:	f8e404a3          	sb	a4,-119(s0)
    80003018:	00065c63          	bgez	a2,80003030 <__printf+0x278>
    8000301c:	f9040713          	addi	a4,s0,-112
    80003020:	00f70733          	add	a4,a4,a5
    80003024:	02d00693          	li	a3,45
    80003028:	fed70823          	sb	a3,-16(a4)
    8000302c:	00078c93          	mv	s9,a5
    80003030:	f8040793          	addi	a5,s0,-128
    80003034:	01978cb3          	add	s9,a5,s9
    80003038:	f7f40d13          	addi	s10,s0,-129
    8000303c:	000cc503          	lbu	a0,0(s9)
    80003040:	fffc8c93          	addi	s9,s9,-1
    80003044:	00000097          	auipc	ra,0x0
    80003048:	b90080e7          	jalr	-1136(ra) # 80002bd4 <consputc>
    8000304c:	ffac98e3          	bne	s9,s10,8000303c <__printf+0x284>
    80003050:	00094503          	lbu	a0,0(s2)
    80003054:	e00514e3          	bnez	a0,80002e5c <__printf+0xa4>
    80003058:	1a0c1663          	bnez	s8,80003204 <__printf+0x44c>
    8000305c:	08813083          	ld	ra,136(sp)
    80003060:	08013403          	ld	s0,128(sp)
    80003064:	07813483          	ld	s1,120(sp)
    80003068:	07013903          	ld	s2,112(sp)
    8000306c:	06813983          	ld	s3,104(sp)
    80003070:	06013a03          	ld	s4,96(sp)
    80003074:	05813a83          	ld	s5,88(sp)
    80003078:	05013b03          	ld	s6,80(sp)
    8000307c:	04813b83          	ld	s7,72(sp)
    80003080:	04013c03          	ld	s8,64(sp)
    80003084:	03813c83          	ld	s9,56(sp)
    80003088:	03013d03          	ld	s10,48(sp)
    8000308c:	02813d83          	ld	s11,40(sp)
    80003090:	0d010113          	addi	sp,sp,208
    80003094:	00008067          	ret
    80003098:	07300713          	li	a4,115
    8000309c:	1ce78a63          	beq	a5,a4,80003270 <__printf+0x4b8>
    800030a0:	07800713          	li	a4,120
    800030a4:	1ee79e63          	bne	a5,a4,800032a0 <__printf+0x4e8>
    800030a8:	f7843783          	ld	a5,-136(s0)
    800030ac:	0007a703          	lw	a4,0(a5)
    800030b0:	00878793          	addi	a5,a5,8
    800030b4:	f6f43c23          	sd	a5,-136(s0)
    800030b8:	28074263          	bltz	a4,8000333c <__printf+0x584>
    800030bc:	00002d97          	auipc	s11,0x2
    800030c0:	1a4d8d93          	addi	s11,s11,420 # 80005260 <digits>
    800030c4:	00f77793          	andi	a5,a4,15
    800030c8:	00fd87b3          	add	a5,s11,a5
    800030cc:	0007c683          	lbu	a3,0(a5)
    800030d0:	00f00613          	li	a2,15
    800030d4:	0007079b          	sext.w	a5,a4
    800030d8:	f8d40023          	sb	a3,-128(s0)
    800030dc:	0047559b          	srliw	a1,a4,0x4
    800030e0:	0047569b          	srliw	a3,a4,0x4
    800030e4:	00000c93          	li	s9,0
    800030e8:	0ee65063          	bge	a2,a4,800031c8 <__printf+0x410>
    800030ec:	00f6f693          	andi	a3,a3,15
    800030f0:	00dd86b3          	add	a3,s11,a3
    800030f4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800030f8:	0087d79b          	srliw	a5,a5,0x8
    800030fc:	00100c93          	li	s9,1
    80003100:	f8d400a3          	sb	a3,-127(s0)
    80003104:	0cb67263          	bgeu	a2,a1,800031c8 <__printf+0x410>
    80003108:	00f7f693          	andi	a3,a5,15
    8000310c:	00dd86b3          	add	a3,s11,a3
    80003110:	0006c583          	lbu	a1,0(a3)
    80003114:	00f00613          	li	a2,15
    80003118:	0047d69b          	srliw	a3,a5,0x4
    8000311c:	f8b40123          	sb	a1,-126(s0)
    80003120:	0047d593          	srli	a1,a5,0x4
    80003124:	28f67e63          	bgeu	a2,a5,800033c0 <__printf+0x608>
    80003128:	00f6f693          	andi	a3,a3,15
    8000312c:	00dd86b3          	add	a3,s11,a3
    80003130:	0006c503          	lbu	a0,0(a3)
    80003134:	0087d813          	srli	a6,a5,0x8
    80003138:	0087d69b          	srliw	a3,a5,0x8
    8000313c:	f8a401a3          	sb	a0,-125(s0)
    80003140:	28b67663          	bgeu	a2,a1,800033cc <__printf+0x614>
    80003144:	00f6f693          	andi	a3,a3,15
    80003148:	00dd86b3          	add	a3,s11,a3
    8000314c:	0006c583          	lbu	a1,0(a3)
    80003150:	00c7d513          	srli	a0,a5,0xc
    80003154:	00c7d69b          	srliw	a3,a5,0xc
    80003158:	f8b40223          	sb	a1,-124(s0)
    8000315c:	29067a63          	bgeu	a2,a6,800033f0 <__printf+0x638>
    80003160:	00f6f693          	andi	a3,a3,15
    80003164:	00dd86b3          	add	a3,s11,a3
    80003168:	0006c583          	lbu	a1,0(a3)
    8000316c:	0107d813          	srli	a6,a5,0x10
    80003170:	0107d69b          	srliw	a3,a5,0x10
    80003174:	f8b402a3          	sb	a1,-123(s0)
    80003178:	28a67263          	bgeu	a2,a0,800033fc <__printf+0x644>
    8000317c:	00f6f693          	andi	a3,a3,15
    80003180:	00dd86b3          	add	a3,s11,a3
    80003184:	0006c683          	lbu	a3,0(a3)
    80003188:	0147d79b          	srliw	a5,a5,0x14
    8000318c:	f8d40323          	sb	a3,-122(s0)
    80003190:	21067663          	bgeu	a2,a6,8000339c <__printf+0x5e4>
    80003194:	02079793          	slli	a5,a5,0x20
    80003198:	0207d793          	srli	a5,a5,0x20
    8000319c:	00fd8db3          	add	s11,s11,a5
    800031a0:	000dc683          	lbu	a3,0(s11)
    800031a4:	00800793          	li	a5,8
    800031a8:	00700c93          	li	s9,7
    800031ac:	f8d403a3          	sb	a3,-121(s0)
    800031b0:	00075c63          	bgez	a4,800031c8 <__printf+0x410>
    800031b4:	f9040713          	addi	a4,s0,-112
    800031b8:	00f70733          	add	a4,a4,a5
    800031bc:	02d00693          	li	a3,45
    800031c0:	fed70823          	sb	a3,-16(a4)
    800031c4:	00078c93          	mv	s9,a5
    800031c8:	f8040793          	addi	a5,s0,-128
    800031cc:	01978cb3          	add	s9,a5,s9
    800031d0:	f7f40d13          	addi	s10,s0,-129
    800031d4:	000cc503          	lbu	a0,0(s9)
    800031d8:	fffc8c93          	addi	s9,s9,-1
    800031dc:	00000097          	auipc	ra,0x0
    800031e0:	9f8080e7          	jalr	-1544(ra) # 80002bd4 <consputc>
    800031e4:	ff9d18e3          	bne	s10,s9,800031d4 <__printf+0x41c>
    800031e8:	0100006f          	j	800031f8 <__printf+0x440>
    800031ec:	00000097          	auipc	ra,0x0
    800031f0:	9e8080e7          	jalr	-1560(ra) # 80002bd4 <consputc>
    800031f4:	000c8493          	mv	s1,s9
    800031f8:	00094503          	lbu	a0,0(s2)
    800031fc:	c60510e3          	bnez	a0,80002e5c <__printf+0xa4>
    80003200:	e40c0ee3          	beqz	s8,8000305c <__printf+0x2a4>
    80003204:	00004517          	auipc	a0,0x4
    80003208:	95c50513          	addi	a0,a0,-1700 # 80006b60 <pr>
    8000320c:	00001097          	auipc	ra,0x1
    80003210:	94c080e7          	jalr	-1716(ra) # 80003b58 <release>
    80003214:	e49ff06f          	j	8000305c <__printf+0x2a4>
    80003218:	f7843783          	ld	a5,-136(s0)
    8000321c:	03000513          	li	a0,48
    80003220:	01000d13          	li	s10,16
    80003224:	00878713          	addi	a4,a5,8
    80003228:	0007bc83          	ld	s9,0(a5)
    8000322c:	f6e43c23          	sd	a4,-136(s0)
    80003230:	00000097          	auipc	ra,0x0
    80003234:	9a4080e7          	jalr	-1628(ra) # 80002bd4 <consputc>
    80003238:	07800513          	li	a0,120
    8000323c:	00000097          	auipc	ra,0x0
    80003240:	998080e7          	jalr	-1640(ra) # 80002bd4 <consputc>
    80003244:	00002d97          	auipc	s11,0x2
    80003248:	01cd8d93          	addi	s11,s11,28 # 80005260 <digits>
    8000324c:	03ccd793          	srli	a5,s9,0x3c
    80003250:	00fd87b3          	add	a5,s11,a5
    80003254:	0007c503          	lbu	a0,0(a5)
    80003258:	fffd0d1b          	addiw	s10,s10,-1
    8000325c:	004c9c93          	slli	s9,s9,0x4
    80003260:	00000097          	auipc	ra,0x0
    80003264:	974080e7          	jalr	-1676(ra) # 80002bd4 <consputc>
    80003268:	fe0d12e3          	bnez	s10,8000324c <__printf+0x494>
    8000326c:	f8dff06f          	j	800031f8 <__printf+0x440>
    80003270:	f7843783          	ld	a5,-136(s0)
    80003274:	0007bc83          	ld	s9,0(a5)
    80003278:	00878793          	addi	a5,a5,8
    8000327c:	f6f43c23          	sd	a5,-136(s0)
    80003280:	000c9a63          	bnez	s9,80003294 <__printf+0x4dc>
    80003284:	1080006f          	j	8000338c <__printf+0x5d4>
    80003288:	001c8c93          	addi	s9,s9,1
    8000328c:	00000097          	auipc	ra,0x0
    80003290:	948080e7          	jalr	-1720(ra) # 80002bd4 <consputc>
    80003294:	000cc503          	lbu	a0,0(s9)
    80003298:	fe0518e3          	bnez	a0,80003288 <__printf+0x4d0>
    8000329c:	f5dff06f          	j	800031f8 <__printf+0x440>
    800032a0:	02500513          	li	a0,37
    800032a4:	00000097          	auipc	ra,0x0
    800032a8:	930080e7          	jalr	-1744(ra) # 80002bd4 <consputc>
    800032ac:	000c8513          	mv	a0,s9
    800032b0:	00000097          	auipc	ra,0x0
    800032b4:	924080e7          	jalr	-1756(ra) # 80002bd4 <consputc>
    800032b8:	f41ff06f          	j	800031f8 <__printf+0x440>
    800032bc:	02500513          	li	a0,37
    800032c0:	00000097          	auipc	ra,0x0
    800032c4:	914080e7          	jalr	-1772(ra) # 80002bd4 <consputc>
    800032c8:	f31ff06f          	j	800031f8 <__printf+0x440>
    800032cc:	00030513          	mv	a0,t1
    800032d0:	00000097          	auipc	ra,0x0
    800032d4:	7bc080e7          	jalr	1980(ra) # 80003a8c <acquire>
    800032d8:	b4dff06f          	j	80002e24 <__printf+0x6c>
    800032dc:	40c0053b          	negw	a0,a2
    800032e0:	00a00713          	li	a4,10
    800032e4:	02e576bb          	remuw	a3,a0,a4
    800032e8:	00002d97          	auipc	s11,0x2
    800032ec:	f78d8d93          	addi	s11,s11,-136 # 80005260 <digits>
    800032f0:	ff700593          	li	a1,-9
    800032f4:	02069693          	slli	a3,a3,0x20
    800032f8:	0206d693          	srli	a3,a3,0x20
    800032fc:	00dd86b3          	add	a3,s11,a3
    80003300:	0006c683          	lbu	a3,0(a3)
    80003304:	02e557bb          	divuw	a5,a0,a4
    80003308:	f8d40023          	sb	a3,-128(s0)
    8000330c:	10b65e63          	bge	a2,a1,80003428 <__printf+0x670>
    80003310:	06300593          	li	a1,99
    80003314:	02e7f6bb          	remuw	a3,a5,a4
    80003318:	02069693          	slli	a3,a3,0x20
    8000331c:	0206d693          	srli	a3,a3,0x20
    80003320:	00dd86b3          	add	a3,s11,a3
    80003324:	0006c683          	lbu	a3,0(a3)
    80003328:	02e7d73b          	divuw	a4,a5,a4
    8000332c:	00200793          	li	a5,2
    80003330:	f8d400a3          	sb	a3,-127(s0)
    80003334:	bca5ece3          	bltu	a1,a0,80002f0c <__printf+0x154>
    80003338:	ce5ff06f          	j	8000301c <__printf+0x264>
    8000333c:	40e007bb          	negw	a5,a4
    80003340:	00002d97          	auipc	s11,0x2
    80003344:	f20d8d93          	addi	s11,s11,-224 # 80005260 <digits>
    80003348:	00f7f693          	andi	a3,a5,15
    8000334c:	00dd86b3          	add	a3,s11,a3
    80003350:	0006c583          	lbu	a1,0(a3)
    80003354:	ff100613          	li	a2,-15
    80003358:	0047d69b          	srliw	a3,a5,0x4
    8000335c:	f8b40023          	sb	a1,-128(s0)
    80003360:	0047d59b          	srliw	a1,a5,0x4
    80003364:	0ac75e63          	bge	a4,a2,80003420 <__printf+0x668>
    80003368:	00f6f693          	andi	a3,a3,15
    8000336c:	00dd86b3          	add	a3,s11,a3
    80003370:	0006c603          	lbu	a2,0(a3)
    80003374:	00f00693          	li	a3,15
    80003378:	0087d79b          	srliw	a5,a5,0x8
    8000337c:	f8c400a3          	sb	a2,-127(s0)
    80003380:	d8b6e4e3          	bltu	a3,a1,80003108 <__printf+0x350>
    80003384:	00200793          	li	a5,2
    80003388:	e2dff06f          	j	800031b4 <__printf+0x3fc>
    8000338c:	00002c97          	auipc	s9,0x2
    80003390:	eb4c8c93          	addi	s9,s9,-332 # 80005240 <_ZZ12printIntegermE6digits+0x148>
    80003394:	02800513          	li	a0,40
    80003398:	ef1ff06f          	j	80003288 <__printf+0x4d0>
    8000339c:	00700793          	li	a5,7
    800033a0:	00600c93          	li	s9,6
    800033a4:	e0dff06f          	j	800031b0 <__printf+0x3f8>
    800033a8:	00700793          	li	a5,7
    800033ac:	00600c93          	li	s9,6
    800033b0:	c69ff06f          	j	80003018 <__printf+0x260>
    800033b4:	00300793          	li	a5,3
    800033b8:	00200c93          	li	s9,2
    800033bc:	c5dff06f          	j	80003018 <__printf+0x260>
    800033c0:	00300793          	li	a5,3
    800033c4:	00200c93          	li	s9,2
    800033c8:	de9ff06f          	j	800031b0 <__printf+0x3f8>
    800033cc:	00400793          	li	a5,4
    800033d0:	00300c93          	li	s9,3
    800033d4:	dddff06f          	j	800031b0 <__printf+0x3f8>
    800033d8:	00400793          	li	a5,4
    800033dc:	00300c93          	li	s9,3
    800033e0:	c39ff06f          	j	80003018 <__printf+0x260>
    800033e4:	00500793          	li	a5,5
    800033e8:	00400c93          	li	s9,4
    800033ec:	c2dff06f          	j	80003018 <__printf+0x260>
    800033f0:	00500793          	li	a5,5
    800033f4:	00400c93          	li	s9,4
    800033f8:	db9ff06f          	j	800031b0 <__printf+0x3f8>
    800033fc:	00600793          	li	a5,6
    80003400:	00500c93          	li	s9,5
    80003404:	dadff06f          	j	800031b0 <__printf+0x3f8>
    80003408:	00600793          	li	a5,6
    8000340c:	00500c93          	li	s9,5
    80003410:	c09ff06f          	j	80003018 <__printf+0x260>
    80003414:	00800793          	li	a5,8
    80003418:	00700c93          	li	s9,7
    8000341c:	bfdff06f          	j	80003018 <__printf+0x260>
    80003420:	00100793          	li	a5,1
    80003424:	d91ff06f          	j	800031b4 <__printf+0x3fc>
    80003428:	00100793          	li	a5,1
    8000342c:	bf1ff06f          	j	8000301c <__printf+0x264>
    80003430:	00900793          	li	a5,9
    80003434:	00800c93          	li	s9,8
    80003438:	be1ff06f          	j	80003018 <__printf+0x260>
    8000343c:	00002517          	auipc	a0,0x2
    80003440:	e0c50513          	addi	a0,a0,-500 # 80005248 <_ZZ12printIntegermE6digits+0x150>
    80003444:	00000097          	auipc	ra,0x0
    80003448:	918080e7          	jalr	-1768(ra) # 80002d5c <panic>

000000008000344c <printfinit>:
    8000344c:	fe010113          	addi	sp,sp,-32
    80003450:	00813823          	sd	s0,16(sp)
    80003454:	00913423          	sd	s1,8(sp)
    80003458:	00113c23          	sd	ra,24(sp)
    8000345c:	02010413          	addi	s0,sp,32
    80003460:	00003497          	auipc	s1,0x3
    80003464:	70048493          	addi	s1,s1,1792 # 80006b60 <pr>
    80003468:	00048513          	mv	a0,s1
    8000346c:	00002597          	auipc	a1,0x2
    80003470:	dec58593          	addi	a1,a1,-532 # 80005258 <_ZZ12printIntegermE6digits+0x160>
    80003474:	00000097          	auipc	ra,0x0
    80003478:	5f4080e7          	jalr	1524(ra) # 80003a68 <initlock>
    8000347c:	01813083          	ld	ra,24(sp)
    80003480:	01013403          	ld	s0,16(sp)
    80003484:	0004ac23          	sw	zero,24(s1)
    80003488:	00813483          	ld	s1,8(sp)
    8000348c:	02010113          	addi	sp,sp,32
    80003490:	00008067          	ret

0000000080003494 <uartinit>:
    80003494:	ff010113          	addi	sp,sp,-16
    80003498:	00813423          	sd	s0,8(sp)
    8000349c:	01010413          	addi	s0,sp,16
    800034a0:	100007b7          	lui	a5,0x10000
    800034a4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800034a8:	f8000713          	li	a4,-128
    800034ac:	00e781a3          	sb	a4,3(a5)
    800034b0:	00300713          	li	a4,3
    800034b4:	00e78023          	sb	a4,0(a5)
    800034b8:	000780a3          	sb	zero,1(a5)
    800034bc:	00e781a3          	sb	a4,3(a5)
    800034c0:	00700693          	li	a3,7
    800034c4:	00d78123          	sb	a3,2(a5)
    800034c8:	00e780a3          	sb	a4,1(a5)
    800034cc:	00813403          	ld	s0,8(sp)
    800034d0:	01010113          	addi	sp,sp,16
    800034d4:	00008067          	ret

00000000800034d8 <uartputc>:
    800034d8:	00002797          	auipc	a5,0x2
    800034dc:	4107a783          	lw	a5,1040(a5) # 800058e8 <panicked>
    800034e0:	00078463          	beqz	a5,800034e8 <uartputc+0x10>
    800034e4:	0000006f          	j	800034e4 <uartputc+0xc>
    800034e8:	fd010113          	addi	sp,sp,-48
    800034ec:	02813023          	sd	s0,32(sp)
    800034f0:	00913c23          	sd	s1,24(sp)
    800034f4:	01213823          	sd	s2,16(sp)
    800034f8:	01313423          	sd	s3,8(sp)
    800034fc:	02113423          	sd	ra,40(sp)
    80003500:	03010413          	addi	s0,sp,48
    80003504:	00002917          	auipc	s2,0x2
    80003508:	3ec90913          	addi	s2,s2,1004 # 800058f0 <uart_tx_r>
    8000350c:	00093783          	ld	a5,0(s2)
    80003510:	00002497          	auipc	s1,0x2
    80003514:	3e848493          	addi	s1,s1,1000 # 800058f8 <uart_tx_w>
    80003518:	0004b703          	ld	a4,0(s1)
    8000351c:	02078693          	addi	a3,a5,32
    80003520:	00050993          	mv	s3,a0
    80003524:	02e69c63          	bne	a3,a4,8000355c <uartputc+0x84>
    80003528:	00001097          	auipc	ra,0x1
    8000352c:	834080e7          	jalr	-1996(ra) # 80003d5c <push_on>
    80003530:	00093783          	ld	a5,0(s2)
    80003534:	0004b703          	ld	a4,0(s1)
    80003538:	02078793          	addi	a5,a5,32
    8000353c:	00e79463          	bne	a5,a4,80003544 <uartputc+0x6c>
    80003540:	0000006f          	j	80003540 <uartputc+0x68>
    80003544:	00001097          	auipc	ra,0x1
    80003548:	88c080e7          	jalr	-1908(ra) # 80003dd0 <pop_on>
    8000354c:	00093783          	ld	a5,0(s2)
    80003550:	0004b703          	ld	a4,0(s1)
    80003554:	02078693          	addi	a3,a5,32
    80003558:	fce688e3          	beq	a3,a4,80003528 <uartputc+0x50>
    8000355c:	01f77693          	andi	a3,a4,31
    80003560:	00003597          	auipc	a1,0x3
    80003564:	62058593          	addi	a1,a1,1568 # 80006b80 <uart_tx_buf>
    80003568:	00d586b3          	add	a3,a1,a3
    8000356c:	00170713          	addi	a4,a4,1
    80003570:	01368023          	sb	s3,0(a3)
    80003574:	00e4b023          	sd	a4,0(s1)
    80003578:	10000637          	lui	a2,0x10000
    8000357c:	02f71063          	bne	a4,a5,8000359c <uartputc+0xc4>
    80003580:	0340006f          	j	800035b4 <uartputc+0xdc>
    80003584:	00074703          	lbu	a4,0(a4)
    80003588:	00f93023          	sd	a5,0(s2)
    8000358c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003590:	00093783          	ld	a5,0(s2)
    80003594:	0004b703          	ld	a4,0(s1)
    80003598:	00f70e63          	beq	a4,a5,800035b4 <uartputc+0xdc>
    8000359c:	00564683          	lbu	a3,5(a2)
    800035a0:	01f7f713          	andi	a4,a5,31
    800035a4:	00e58733          	add	a4,a1,a4
    800035a8:	0206f693          	andi	a3,a3,32
    800035ac:	00178793          	addi	a5,a5,1
    800035b0:	fc069ae3          	bnez	a3,80003584 <uartputc+0xac>
    800035b4:	02813083          	ld	ra,40(sp)
    800035b8:	02013403          	ld	s0,32(sp)
    800035bc:	01813483          	ld	s1,24(sp)
    800035c0:	01013903          	ld	s2,16(sp)
    800035c4:	00813983          	ld	s3,8(sp)
    800035c8:	03010113          	addi	sp,sp,48
    800035cc:	00008067          	ret

00000000800035d0 <uartputc_sync>:
    800035d0:	ff010113          	addi	sp,sp,-16
    800035d4:	00813423          	sd	s0,8(sp)
    800035d8:	01010413          	addi	s0,sp,16
    800035dc:	00002717          	auipc	a4,0x2
    800035e0:	30c72703          	lw	a4,780(a4) # 800058e8 <panicked>
    800035e4:	02071663          	bnez	a4,80003610 <uartputc_sync+0x40>
    800035e8:	00050793          	mv	a5,a0
    800035ec:	100006b7          	lui	a3,0x10000
    800035f0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800035f4:	02077713          	andi	a4,a4,32
    800035f8:	fe070ce3          	beqz	a4,800035f0 <uartputc_sync+0x20>
    800035fc:	0ff7f793          	andi	a5,a5,255
    80003600:	00f68023          	sb	a5,0(a3)
    80003604:	00813403          	ld	s0,8(sp)
    80003608:	01010113          	addi	sp,sp,16
    8000360c:	00008067          	ret
    80003610:	0000006f          	j	80003610 <uartputc_sync+0x40>

0000000080003614 <uartstart>:
    80003614:	ff010113          	addi	sp,sp,-16
    80003618:	00813423          	sd	s0,8(sp)
    8000361c:	01010413          	addi	s0,sp,16
    80003620:	00002617          	auipc	a2,0x2
    80003624:	2d060613          	addi	a2,a2,720 # 800058f0 <uart_tx_r>
    80003628:	00002517          	auipc	a0,0x2
    8000362c:	2d050513          	addi	a0,a0,720 # 800058f8 <uart_tx_w>
    80003630:	00063783          	ld	a5,0(a2)
    80003634:	00053703          	ld	a4,0(a0)
    80003638:	04f70263          	beq	a4,a5,8000367c <uartstart+0x68>
    8000363c:	100005b7          	lui	a1,0x10000
    80003640:	00003817          	auipc	a6,0x3
    80003644:	54080813          	addi	a6,a6,1344 # 80006b80 <uart_tx_buf>
    80003648:	01c0006f          	j	80003664 <uartstart+0x50>
    8000364c:	0006c703          	lbu	a4,0(a3)
    80003650:	00f63023          	sd	a5,0(a2)
    80003654:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003658:	00063783          	ld	a5,0(a2)
    8000365c:	00053703          	ld	a4,0(a0)
    80003660:	00f70e63          	beq	a4,a5,8000367c <uartstart+0x68>
    80003664:	01f7f713          	andi	a4,a5,31
    80003668:	00e806b3          	add	a3,a6,a4
    8000366c:	0055c703          	lbu	a4,5(a1)
    80003670:	00178793          	addi	a5,a5,1
    80003674:	02077713          	andi	a4,a4,32
    80003678:	fc071ae3          	bnez	a4,8000364c <uartstart+0x38>
    8000367c:	00813403          	ld	s0,8(sp)
    80003680:	01010113          	addi	sp,sp,16
    80003684:	00008067          	ret

0000000080003688 <uartgetc>:
    80003688:	ff010113          	addi	sp,sp,-16
    8000368c:	00813423          	sd	s0,8(sp)
    80003690:	01010413          	addi	s0,sp,16
    80003694:	10000737          	lui	a4,0x10000
    80003698:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000369c:	0017f793          	andi	a5,a5,1
    800036a0:	00078c63          	beqz	a5,800036b8 <uartgetc+0x30>
    800036a4:	00074503          	lbu	a0,0(a4)
    800036a8:	0ff57513          	andi	a0,a0,255
    800036ac:	00813403          	ld	s0,8(sp)
    800036b0:	01010113          	addi	sp,sp,16
    800036b4:	00008067          	ret
    800036b8:	fff00513          	li	a0,-1
    800036bc:	ff1ff06f          	j	800036ac <uartgetc+0x24>

00000000800036c0 <uartintr>:
    800036c0:	100007b7          	lui	a5,0x10000
    800036c4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800036c8:	0017f793          	andi	a5,a5,1
    800036cc:	0a078463          	beqz	a5,80003774 <uartintr+0xb4>
    800036d0:	fe010113          	addi	sp,sp,-32
    800036d4:	00813823          	sd	s0,16(sp)
    800036d8:	00913423          	sd	s1,8(sp)
    800036dc:	00113c23          	sd	ra,24(sp)
    800036e0:	02010413          	addi	s0,sp,32
    800036e4:	100004b7          	lui	s1,0x10000
    800036e8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800036ec:	0ff57513          	andi	a0,a0,255
    800036f0:	fffff097          	auipc	ra,0xfffff
    800036f4:	534080e7          	jalr	1332(ra) # 80002c24 <consoleintr>
    800036f8:	0054c783          	lbu	a5,5(s1)
    800036fc:	0017f793          	andi	a5,a5,1
    80003700:	fe0794e3          	bnez	a5,800036e8 <uartintr+0x28>
    80003704:	00002617          	auipc	a2,0x2
    80003708:	1ec60613          	addi	a2,a2,492 # 800058f0 <uart_tx_r>
    8000370c:	00002517          	auipc	a0,0x2
    80003710:	1ec50513          	addi	a0,a0,492 # 800058f8 <uart_tx_w>
    80003714:	00063783          	ld	a5,0(a2)
    80003718:	00053703          	ld	a4,0(a0)
    8000371c:	04f70263          	beq	a4,a5,80003760 <uartintr+0xa0>
    80003720:	100005b7          	lui	a1,0x10000
    80003724:	00003817          	auipc	a6,0x3
    80003728:	45c80813          	addi	a6,a6,1116 # 80006b80 <uart_tx_buf>
    8000372c:	01c0006f          	j	80003748 <uartintr+0x88>
    80003730:	0006c703          	lbu	a4,0(a3)
    80003734:	00f63023          	sd	a5,0(a2)
    80003738:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000373c:	00063783          	ld	a5,0(a2)
    80003740:	00053703          	ld	a4,0(a0)
    80003744:	00f70e63          	beq	a4,a5,80003760 <uartintr+0xa0>
    80003748:	01f7f713          	andi	a4,a5,31
    8000374c:	00e806b3          	add	a3,a6,a4
    80003750:	0055c703          	lbu	a4,5(a1)
    80003754:	00178793          	addi	a5,a5,1
    80003758:	02077713          	andi	a4,a4,32
    8000375c:	fc071ae3          	bnez	a4,80003730 <uartintr+0x70>
    80003760:	01813083          	ld	ra,24(sp)
    80003764:	01013403          	ld	s0,16(sp)
    80003768:	00813483          	ld	s1,8(sp)
    8000376c:	02010113          	addi	sp,sp,32
    80003770:	00008067          	ret
    80003774:	00002617          	auipc	a2,0x2
    80003778:	17c60613          	addi	a2,a2,380 # 800058f0 <uart_tx_r>
    8000377c:	00002517          	auipc	a0,0x2
    80003780:	17c50513          	addi	a0,a0,380 # 800058f8 <uart_tx_w>
    80003784:	00063783          	ld	a5,0(a2)
    80003788:	00053703          	ld	a4,0(a0)
    8000378c:	04f70263          	beq	a4,a5,800037d0 <uartintr+0x110>
    80003790:	100005b7          	lui	a1,0x10000
    80003794:	00003817          	auipc	a6,0x3
    80003798:	3ec80813          	addi	a6,a6,1004 # 80006b80 <uart_tx_buf>
    8000379c:	01c0006f          	j	800037b8 <uartintr+0xf8>
    800037a0:	0006c703          	lbu	a4,0(a3)
    800037a4:	00f63023          	sd	a5,0(a2)
    800037a8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800037ac:	00063783          	ld	a5,0(a2)
    800037b0:	00053703          	ld	a4,0(a0)
    800037b4:	02f70063          	beq	a4,a5,800037d4 <uartintr+0x114>
    800037b8:	01f7f713          	andi	a4,a5,31
    800037bc:	00e806b3          	add	a3,a6,a4
    800037c0:	0055c703          	lbu	a4,5(a1)
    800037c4:	00178793          	addi	a5,a5,1
    800037c8:	02077713          	andi	a4,a4,32
    800037cc:	fc071ae3          	bnez	a4,800037a0 <uartintr+0xe0>
    800037d0:	00008067          	ret
    800037d4:	00008067          	ret

00000000800037d8 <kinit>:
    800037d8:	fc010113          	addi	sp,sp,-64
    800037dc:	02913423          	sd	s1,40(sp)
    800037e0:	fffff7b7          	lui	a5,0xfffff
    800037e4:	00004497          	auipc	s1,0x4
    800037e8:	3bb48493          	addi	s1,s1,955 # 80007b9f <end+0xfff>
    800037ec:	02813823          	sd	s0,48(sp)
    800037f0:	01313c23          	sd	s3,24(sp)
    800037f4:	00f4f4b3          	and	s1,s1,a5
    800037f8:	02113c23          	sd	ra,56(sp)
    800037fc:	03213023          	sd	s2,32(sp)
    80003800:	01413823          	sd	s4,16(sp)
    80003804:	01513423          	sd	s5,8(sp)
    80003808:	04010413          	addi	s0,sp,64
    8000380c:	000017b7          	lui	a5,0x1
    80003810:	01100993          	li	s3,17
    80003814:	00f487b3          	add	a5,s1,a5
    80003818:	01b99993          	slli	s3,s3,0x1b
    8000381c:	06f9e063          	bltu	s3,a5,8000387c <kinit+0xa4>
    80003820:	00003a97          	auipc	s5,0x3
    80003824:	380a8a93          	addi	s5,s5,896 # 80006ba0 <end>
    80003828:	0754ec63          	bltu	s1,s5,800038a0 <kinit+0xc8>
    8000382c:	0734fa63          	bgeu	s1,s3,800038a0 <kinit+0xc8>
    80003830:	00088a37          	lui	s4,0x88
    80003834:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003838:	00002917          	auipc	s2,0x2
    8000383c:	0c890913          	addi	s2,s2,200 # 80005900 <kmem>
    80003840:	00ca1a13          	slli	s4,s4,0xc
    80003844:	0140006f          	j	80003858 <kinit+0x80>
    80003848:	000017b7          	lui	a5,0x1
    8000384c:	00f484b3          	add	s1,s1,a5
    80003850:	0554e863          	bltu	s1,s5,800038a0 <kinit+0xc8>
    80003854:	0534f663          	bgeu	s1,s3,800038a0 <kinit+0xc8>
    80003858:	00001637          	lui	a2,0x1
    8000385c:	00100593          	li	a1,1
    80003860:	00048513          	mv	a0,s1
    80003864:	00000097          	auipc	ra,0x0
    80003868:	5e4080e7          	jalr	1508(ra) # 80003e48 <__memset>
    8000386c:	00093783          	ld	a5,0(s2)
    80003870:	00f4b023          	sd	a5,0(s1)
    80003874:	00993023          	sd	s1,0(s2)
    80003878:	fd4498e3          	bne	s1,s4,80003848 <kinit+0x70>
    8000387c:	03813083          	ld	ra,56(sp)
    80003880:	03013403          	ld	s0,48(sp)
    80003884:	02813483          	ld	s1,40(sp)
    80003888:	02013903          	ld	s2,32(sp)
    8000388c:	01813983          	ld	s3,24(sp)
    80003890:	01013a03          	ld	s4,16(sp)
    80003894:	00813a83          	ld	s5,8(sp)
    80003898:	04010113          	addi	sp,sp,64
    8000389c:	00008067          	ret
    800038a0:	00002517          	auipc	a0,0x2
    800038a4:	9d850513          	addi	a0,a0,-1576 # 80005278 <digits+0x18>
    800038a8:	fffff097          	auipc	ra,0xfffff
    800038ac:	4b4080e7          	jalr	1204(ra) # 80002d5c <panic>

00000000800038b0 <freerange>:
    800038b0:	fc010113          	addi	sp,sp,-64
    800038b4:	000017b7          	lui	a5,0x1
    800038b8:	02913423          	sd	s1,40(sp)
    800038bc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800038c0:	009504b3          	add	s1,a0,s1
    800038c4:	fffff537          	lui	a0,0xfffff
    800038c8:	02813823          	sd	s0,48(sp)
    800038cc:	02113c23          	sd	ra,56(sp)
    800038d0:	03213023          	sd	s2,32(sp)
    800038d4:	01313c23          	sd	s3,24(sp)
    800038d8:	01413823          	sd	s4,16(sp)
    800038dc:	01513423          	sd	s5,8(sp)
    800038e0:	01613023          	sd	s6,0(sp)
    800038e4:	04010413          	addi	s0,sp,64
    800038e8:	00a4f4b3          	and	s1,s1,a0
    800038ec:	00f487b3          	add	a5,s1,a5
    800038f0:	06f5e463          	bltu	a1,a5,80003958 <freerange+0xa8>
    800038f4:	00003a97          	auipc	s5,0x3
    800038f8:	2aca8a93          	addi	s5,s5,684 # 80006ba0 <end>
    800038fc:	0954e263          	bltu	s1,s5,80003980 <freerange+0xd0>
    80003900:	01100993          	li	s3,17
    80003904:	01b99993          	slli	s3,s3,0x1b
    80003908:	0734fc63          	bgeu	s1,s3,80003980 <freerange+0xd0>
    8000390c:	00058a13          	mv	s4,a1
    80003910:	00002917          	auipc	s2,0x2
    80003914:	ff090913          	addi	s2,s2,-16 # 80005900 <kmem>
    80003918:	00002b37          	lui	s6,0x2
    8000391c:	0140006f          	j	80003930 <freerange+0x80>
    80003920:	000017b7          	lui	a5,0x1
    80003924:	00f484b3          	add	s1,s1,a5
    80003928:	0554ec63          	bltu	s1,s5,80003980 <freerange+0xd0>
    8000392c:	0534fa63          	bgeu	s1,s3,80003980 <freerange+0xd0>
    80003930:	00001637          	lui	a2,0x1
    80003934:	00100593          	li	a1,1
    80003938:	00048513          	mv	a0,s1
    8000393c:	00000097          	auipc	ra,0x0
    80003940:	50c080e7          	jalr	1292(ra) # 80003e48 <__memset>
    80003944:	00093703          	ld	a4,0(s2)
    80003948:	016487b3          	add	a5,s1,s6
    8000394c:	00e4b023          	sd	a4,0(s1)
    80003950:	00993023          	sd	s1,0(s2)
    80003954:	fcfa76e3          	bgeu	s4,a5,80003920 <freerange+0x70>
    80003958:	03813083          	ld	ra,56(sp)
    8000395c:	03013403          	ld	s0,48(sp)
    80003960:	02813483          	ld	s1,40(sp)
    80003964:	02013903          	ld	s2,32(sp)
    80003968:	01813983          	ld	s3,24(sp)
    8000396c:	01013a03          	ld	s4,16(sp)
    80003970:	00813a83          	ld	s5,8(sp)
    80003974:	00013b03          	ld	s6,0(sp)
    80003978:	04010113          	addi	sp,sp,64
    8000397c:	00008067          	ret
    80003980:	00002517          	auipc	a0,0x2
    80003984:	8f850513          	addi	a0,a0,-1800 # 80005278 <digits+0x18>
    80003988:	fffff097          	auipc	ra,0xfffff
    8000398c:	3d4080e7          	jalr	980(ra) # 80002d5c <panic>

0000000080003990 <kfree>:
    80003990:	fe010113          	addi	sp,sp,-32
    80003994:	00813823          	sd	s0,16(sp)
    80003998:	00113c23          	sd	ra,24(sp)
    8000399c:	00913423          	sd	s1,8(sp)
    800039a0:	02010413          	addi	s0,sp,32
    800039a4:	03451793          	slli	a5,a0,0x34
    800039a8:	04079c63          	bnez	a5,80003a00 <kfree+0x70>
    800039ac:	00003797          	auipc	a5,0x3
    800039b0:	1f478793          	addi	a5,a5,500 # 80006ba0 <end>
    800039b4:	00050493          	mv	s1,a0
    800039b8:	04f56463          	bltu	a0,a5,80003a00 <kfree+0x70>
    800039bc:	01100793          	li	a5,17
    800039c0:	01b79793          	slli	a5,a5,0x1b
    800039c4:	02f57e63          	bgeu	a0,a5,80003a00 <kfree+0x70>
    800039c8:	00001637          	lui	a2,0x1
    800039cc:	00100593          	li	a1,1
    800039d0:	00000097          	auipc	ra,0x0
    800039d4:	478080e7          	jalr	1144(ra) # 80003e48 <__memset>
    800039d8:	00002797          	auipc	a5,0x2
    800039dc:	f2878793          	addi	a5,a5,-216 # 80005900 <kmem>
    800039e0:	0007b703          	ld	a4,0(a5)
    800039e4:	01813083          	ld	ra,24(sp)
    800039e8:	01013403          	ld	s0,16(sp)
    800039ec:	00e4b023          	sd	a4,0(s1)
    800039f0:	0097b023          	sd	s1,0(a5)
    800039f4:	00813483          	ld	s1,8(sp)
    800039f8:	02010113          	addi	sp,sp,32
    800039fc:	00008067          	ret
    80003a00:	00002517          	auipc	a0,0x2
    80003a04:	87850513          	addi	a0,a0,-1928 # 80005278 <digits+0x18>
    80003a08:	fffff097          	auipc	ra,0xfffff
    80003a0c:	354080e7          	jalr	852(ra) # 80002d5c <panic>

0000000080003a10 <kalloc>:
    80003a10:	fe010113          	addi	sp,sp,-32
    80003a14:	00813823          	sd	s0,16(sp)
    80003a18:	00913423          	sd	s1,8(sp)
    80003a1c:	00113c23          	sd	ra,24(sp)
    80003a20:	02010413          	addi	s0,sp,32
    80003a24:	00002797          	auipc	a5,0x2
    80003a28:	edc78793          	addi	a5,a5,-292 # 80005900 <kmem>
    80003a2c:	0007b483          	ld	s1,0(a5)
    80003a30:	02048063          	beqz	s1,80003a50 <kalloc+0x40>
    80003a34:	0004b703          	ld	a4,0(s1)
    80003a38:	00001637          	lui	a2,0x1
    80003a3c:	00500593          	li	a1,5
    80003a40:	00048513          	mv	a0,s1
    80003a44:	00e7b023          	sd	a4,0(a5)
    80003a48:	00000097          	auipc	ra,0x0
    80003a4c:	400080e7          	jalr	1024(ra) # 80003e48 <__memset>
    80003a50:	01813083          	ld	ra,24(sp)
    80003a54:	01013403          	ld	s0,16(sp)
    80003a58:	00048513          	mv	a0,s1
    80003a5c:	00813483          	ld	s1,8(sp)
    80003a60:	02010113          	addi	sp,sp,32
    80003a64:	00008067          	ret

0000000080003a68 <initlock>:
    80003a68:	ff010113          	addi	sp,sp,-16
    80003a6c:	00813423          	sd	s0,8(sp)
    80003a70:	01010413          	addi	s0,sp,16
    80003a74:	00813403          	ld	s0,8(sp)
    80003a78:	00b53423          	sd	a1,8(a0)
    80003a7c:	00052023          	sw	zero,0(a0)
    80003a80:	00053823          	sd	zero,16(a0)
    80003a84:	01010113          	addi	sp,sp,16
    80003a88:	00008067          	ret

0000000080003a8c <acquire>:
    80003a8c:	fe010113          	addi	sp,sp,-32
    80003a90:	00813823          	sd	s0,16(sp)
    80003a94:	00913423          	sd	s1,8(sp)
    80003a98:	00113c23          	sd	ra,24(sp)
    80003a9c:	01213023          	sd	s2,0(sp)
    80003aa0:	02010413          	addi	s0,sp,32
    80003aa4:	00050493          	mv	s1,a0
    80003aa8:	10002973          	csrr	s2,sstatus
    80003aac:	100027f3          	csrr	a5,sstatus
    80003ab0:	ffd7f793          	andi	a5,a5,-3
    80003ab4:	10079073          	csrw	sstatus,a5
    80003ab8:	fffff097          	auipc	ra,0xfffff
    80003abc:	8ec080e7          	jalr	-1812(ra) # 800023a4 <mycpu>
    80003ac0:	07852783          	lw	a5,120(a0)
    80003ac4:	06078e63          	beqz	a5,80003b40 <acquire+0xb4>
    80003ac8:	fffff097          	auipc	ra,0xfffff
    80003acc:	8dc080e7          	jalr	-1828(ra) # 800023a4 <mycpu>
    80003ad0:	07852783          	lw	a5,120(a0)
    80003ad4:	0004a703          	lw	a4,0(s1)
    80003ad8:	0017879b          	addiw	a5,a5,1
    80003adc:	06f52c23          	sw	a5,120(a0)
    80003ae0:	04071063          	bnez	a4,80003b20 <acquire+0x94>
    80003ae4:	00100713          	li	a4,1
    80003ae8:	00070793          	mv	a5,a4
    80003aec:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003af0:	0007879b          	sext.w	a5,a5
    80003af4:	fe079ae3          	bnez	a5,80003ae8 <acquire+0x5c>
    80003af8:	0ff0000f          	fence
    80003afc:	fffff097          	auipc	ra,0xfffff
    80003b00:	8a8080e7          	jalr	-1880(ra) # 800023a4 <mycpu>
    80003b04:	01813083          	ld	ra,24(sp)
    80003b08:	01013403          	ld	s0,16(sp)
    80003b0c:	00a4b823          	sd	a0,16(s1)
    80003b10:	00013903          	ld	s2,0(sp)
    80003b14:	00813483          	ld	s1,8(sp)
    80003b18:	02010113          	addi	sp,sp,32
    80003b1c:	00008067          	ret
    80003b20:	0104b903          	ld	s2,16(s1)
    80003b24:	fffff097          	auipc	ra,0xfffff
    80003b28:	880080e7          	jalr	-1920(ra) # 800023a4 <mycpu>
    80003b2c:	faa91ce3          	bne	s2,a0,80003ae4 <acquire+0x58>
    80003b30:	00001517          	auipc	a0,0x1
    80003b34:	75050513          	addi	a0,a0,1872 # 80005280 <digits+0x20>
    80003b38:	fffff097          	auipc	ra,0xfffff
    80003b3c:	224080e7          	jalr	548(ra) # 80002d5c <panic>
    80003b40:	00195913          	srli	s2,s2,0x1
    80003b44:	fffff097          	auipc	ra,0xfffff
    80003b48:	860080e7          	jalr	-1952(ra) # 800023a4 <mycpu>
    80003b4c:	00197913          	andi	s2,s2,1
    80003b50:	07252e23          	sw	s2,124(a0)
    80003b54:	f75ff06f          	j	80003ac8 <acquire+0x3c>

0000000080003b58 <release>:
    80003b58:	fe010113          	addi	sp,sp,-32
    80003b5c:	00813823          	sd	s0,16(sp)
    80003b60:	00113c23          	sd	ra,24(sp)
    80003b64:	00913423          	sd	s1,8(sp)
    80003b68:	01213023          	sd	s2,0(sp)
    80003b6c:	02010413          	addi	s0,sp,32
    80003b70:	00052783          	lw	a5,0(a0)
    80003b74:	00079a63          	bnez	a5,80003b88 <release+0x30>
    80003b78:	00001517          	auipc	a0,0x1
    80003b7c:	71050513          	addi	a0,a0,1808 # 80005288 <digits+0x28>
    80003b80:	fffff097          	auipc	ra,0xfffff
    80003b84:	1dc080e7          	jalr	476(ra) # 80002d5c <panic>
    80003b88:	01053903          	ld	s2,16(a0)
    80003b8c:	00050493          	mv	s1,a0
    80003b90:	fffff097          	auipc	ra,0xfffff
    80003b94:	814080e7          	jalr	-2028(ra) # 800023a4 <mycpu>
    80003b98:	fea910e3          	bne	s2,a0,80003b78 <release+0x20>
    80003b9c:	0004b823          	sd	zero,16(s1)
    80003ba0:	0ff0000f          	fence
    80003ba4:	0f50000f          	fence	iorw,ow
    80003ba8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003bac:	ffffe097          	auipc	ra,0xffffe
    80003bb0:	7f8080e7          	jalr	2040(ra) # 800023a4 <mycpu>
    80003bb4:	100027f3          	csrr	a5,sstatus
    80003bb8:	0027f793          	andi	a5,a5,2
    80003bbc:	04079a63          	bnez	a5,80003c10 <release+0xb8>
    80003bc0:	07852783          	lw	a5,120(a0)
    80003bc4:	02f05e63          	blez	a5,80003c00 <release+0xa8>
    80003bc8:	fff7871b          	addiw	a4,a5,-1
    80003bcc:	06e52c23          	sw	a4,120(a0)
    80003bd0:	00071c63          	bnez	a4,80003be8 <release+0x90>
    80003bd4:	07c52783          	lw	a5,124(a0)
    80003bd8:	00078863          	beqz	a5,80003be8 <release+0x90>
    80003bdc:	100027f3          	csrr	a5,sstatus
    80003be0:	0027e793          	ori	a5,a5,2
    80003be4:	10079073          	csrw	sstatus,a5
    80003be8:	01813083          	ld	ra,24(sp)
    80003bec:	01013403          	ld	s0,16(sp)
    80003bf0:	00813483          	ld	s1,8(sp)
    80003bf4:	00013903          	ld	s2,0(sp)
    80003bf8:	02010113          	addi	sp,sp,32
    80003bfc:	00008067          	ret
    80003c00:	00001517          	auipc	a0,0x1
    80003c04:	6a850513          	addi	a0,a0,1704 # 800052a8 <digits+0x48>
    80003c08:	fffff097          	auipc	ra,0xfffff
    80003c0c:	154080e7          	jalr	340(ra) # 80002d5c <panic>
    80003c10:	00001517          	auipc	a0,0x1
    80003c14:	68050513          	addi	a0,a0,1664 # 80005290 <digits+0x30>
    80003c18:	fffff097          	auipc	ra,0xfffff
    80003c1c:	144080e7          	jalr	324(ra) # 80002d5c <panic>

0000000080003c20 <holding>:
    80003c20:	00052783          	lw	a5,0(a0)
    80003c24:	00079663          	bnez	a5,80003c30 <holding+0x10>
    80003c28:	00000513          	li	a0,0
    80003c2c:	00008067          	ret
    80003c30:	fe010113          	addi	sp,sp,-32
    80003c34:	00813823          	sd	s0,16(sp)
    80003c38:	00913423          	sd	s1,8(sp)
    80003c3c:	00113c23          	sd	ra,24(sp)
    80003c40:	02010413          	addi	s0,sp,32
    80003c44:	01053483          	ld	s1,16(a0)
    80003c48:	ffffe097          	auipc	ra,0xffffe
    80003c4c:	75c080e7          	jalr	1884(ra) # 800023a4 <mycpu>
    80003c50:	01813083          	ld	ra,24(sp)
    80003c54:	01013403          	ld	s0,16(sp)
    80003c58:	40a48533          	sub	a0,s1,a0
    80003c5c:	00153513          	seqz	a0,a0
    80003c60:	00813483          	ld	s1,8(sp)
    80003c64:	02010113          	addi	sp,sp,32
    80003c68:	00008067          	ret

0000000080003c6c <push_off>:
    80003c6c:	fe010113          	addi	sp,sp,-32
    80003c70:	00813823          	sd	s0,16(sp)
    80003c74:	00113c23          	sd	ra,24(sp)
    80003c78:	00913423          	sd	s1,8(sp)
    80003c7c:	02010413          	addi	s0,sp,32
    80003c80:	100024f3          	csrr	s1,sstatus
    80003c84:	100027f3          	csrr	a5,sstatus
    80003c88:	ffd7f793          	andi	a5,a5,-3
    80003c8c:	10079073          	csrw	sstatus,a5
    80003c90:	ffffe097          	auipc	ra,0xffffe
    80003c94:	714080e7          	jalr	1812(ra) # 800023a4 <mycpu>
    80003c98:	07852783          	lw	a5,120(a0)
    80003c9c:	02078663          	beqz	a5,80003cc8 <push_off+0x5c>
    80003ca0:	ffffe097          	auipc	ra,0xffffe
    80003ca4:	704080e7          	jalr	1796(ra) # 800023a4 <mycpu>
    80003ca8:	07852783          	lw	a5,120(a0)
    80003cac:	01813083          	ld	ra,24(sp)
    80003cb0:	01013403          	ld	s0,16(sp)
    80003cb4:	0017879b          	addiw	a5,a5,1
    80003cb8:	06f52c23          	sw	a5,120(a0)
    80003cbc:	00813483          	ld	s1,8(sp)
    80003cc0:	02010113          	addi	sp,sp,32
    80003cc4:	00008067          	ret
    80003cc8:	0014d493          	srli	s1,s1,0x1
    80003ccc:	ffffe097          	auipc	ra,0xffffe
    80003cd0:	6d8080e7          	jalr	1752(ra) # 800023a4 <mycpu>
    80003cd4:	0014f493          	andi	s1,s1,1
    80003cd8:	06952e23          	sw	s1,124(a0)
    80003cdc:	fc5ff06f          	j	80003ca0 <push_off+0x34>

0000000080003ce0 <pop_off>:
    80003ce0:	ff010113          	addi	sp,sp,-16
    80003ce4:	00813023          	sd	s0,0(sp)
    80003ce8:	00113423          	sd	ra,8(sp)
    80003cec:	01010413          	addi	s0,sp,16
    80003cf0:	ffffe097          	auipc	ra,0xffffe
    80003cf4:	6b4080e7          	jalr	1716(ra) # 800023a4 <mycpu>
    80003cf8:	100027f3          	csrr	a5,sstatus
    80003cfc:	0027f793          	andi	a5,a5,2
    80003d00:	04079663          	bnez	a5,80003d4c <pop_off+0x6c>
    80003d04:	07852783          	lw	a5,120(a0)
    80003d08:	02f05a63          	blez	a5,80003d3c <pop_off+0x5c>
    80003d0c:	fff7871b          	addiw	a4,a5,-1
    80003d10:	06e52c23          	sw	a4,120(a0)
    80003d14:	00071c63          	bnez	a4,80003d2c <pop_off+0x4c>
    80003d18:	07c52783          	lw	a5,124(a0)
    80003d1c:	00078863          	beqz	a5,80003d2c <pop_off+0x4c>
    80003d20:	100027f3          	csrr	a5,sstatus
    80003d24:	0027e793          	ori	a5,a5,2
    80003d28:	10079073          	csrw	sstatus,a5
    80003d2c:	00813083          	ld	ra,8(sp)
    80003d30:	00013403          	ld	s0,0(sp)
    80003d34:	01010113          	addi	sp,sp,16
    80003d38:	00008067          	ret
    80003d3c:	00001517          	auipc	a0,0x1
    80003d40:	56c50513          	addi	a0,a0,1388 # 800052a8 <digits+0x48>
    80003d44:	fffff097          	auipc	ra,0xfffff
    80003d48:	018080e7          	jalr	24(ra) # 80002d5c <panic>
    80003d4c:	00001517          	auipc	a0,0x1
    80003d50:	54450513          	addi	a0,a0,1348 # 80005290 <digits+0x30>
    80003d54:	fffff097          	auipc	ra,0xfffff
    80003d58:	008080e7          	jalr	8(ra) # 80002d5c <panic>

0000000080003d5c <push_on>:
    80003d5c:	fe010113          	addi	sp,sp,-32
    80003d60:	00813823          	sd	s0,16(sp)
    80003d64:	00113c23          	sd	ra,24(sp)
    80003d68:	00913423          	sd	s1,8(sp)
    80003d6c:	02010413          	addi	s0,sp,32
    80003d70:	100024f3          	csrr	s1,sstatus
    80003d74:	100027f3          	csrr	a5,sstatus
    80003d78:	0027e793          	ori	a5,a5,2
    80003d7c:	10079073          	csrw	sstatus,a5
    80003d80:	ffffe097          	auipc	ra,0xffffe
    80003d84:	624080e7          	jalr	1572(ra) # 800023a4 <mycpu>
    80003d88:	07852783          	lw	a5,120(a0)
    80003d8c:	02078663          	beqz	a5,80003db8 <push_on+0x5c>
    80003d90:	ffffe097          	auipc	ra,0xffffe
    80003d94:	614080e7          	jalr	1556(ra) # 800023a4 <mycpu>
    80003d98:	07852783          	lw	a5,120(a0)
    80003d9c:	01813083          	ld	ra,24(sp)
    80003da0:	01013403          	ld	s0,16(sp)
    80003da4:	0017879b          	addiw	a5,a5,1
    80003da8:	06f52c23          	sw	a5,120(a0)
    80003dac:	00813483          	ld	s1,8(sp)
    80003db0:	02010113          	addi	sp,sp,32
    80003db4:	00008067          	ret
    80003db8:	0014d493          	srli	s1,s1,0x1
    80003dbc:	ffffe097          	auipc	ra,0xffffe
    80003dc0:	5e8080e7          	jalr	1512(ra) # 800023a4 <mycpu>
    80003dc4:	0014f493          	andi	s1,s1,1
    80003dc8:	06952e23          	sw	s1,124(a0)
    80003dcc:	fc5ff06f          	j	80003d90 <push_on+0x34>

0000000080003dd0 <pop_on>:
    80003dd0:	ff010113          	addi	sp,sp,-16
    80003dd4:	00813023          	sd	s0,0(sp)
    80003dd8:	00113423          	sd	ra,8(sp)
    80003ddc:	01010413          	addi	s0,sp,16
    80003de0:	ffffe097          	auipc	ra,0xffffe
    80003de4:	5c4080e7          	jalr	1476(ra) # 800023a4 <mycpu>
    80003de8:	100027f3          	csrr	a5,sstatus
    80003dec:	0027f793          	andi	a5,a5,2
    80003df0:	04078463          	beqz	a5,80003e38 <pop_on+0x68>
    80003df4:	07852783          	lw	a5,120(a0)
    80003df8:	02f05863          	blez	a5,80003e28 <pop_on+0x58>
    80003dfc:	fff7879b          	addiw	a5,a5,-1
    80003e00:	06f52c23          	sw	a5,120(a0)
    80003e04:	07853783          	ld	a5,120(a0)
    80003e08:	00079863          	bnez	a5,80003e18 <pop_on+0x48>
    80003e0c:	100027f3          	csrr	a5,sstatus
    80003e10:	ffd7f793          	andi	a5,a5,-3
    80003e14:	10079073          	csrw	sstatus,a5
    80003e18:	00813083          	ld	ra,8(sp)
    80003e1c:	00013403          	ld	s0,0(sp)
    80003e20:	01010113          	addi	sp,sp,16
    80003e24:	00008067          	ret
    80003e28:	00001517          	auipc	a0,0x1
    80003e2c:	4a850513          	addi	a0,a0,1192 # 800052d0 <digits+0x70>
    80003e30:	fffff097          	auipc	ra,0xfffff
    80003e34:	f2c080e7          	jalr	-212(ra) # 80002d5c <panic>
    80003e38:	00001517          	auipc	a0,0x1
    80003e3c:	47850513          	addi	a0,a0,1144 # 800052b0 <digits+0x50>
    80003e40:	fffff097          	auipc	ra,0xfffff
    80003e44:	f1c080e7          	jalr	-228(ra) # 80002d5c <panic>

0000000080003e48 <__memset>:
    80003e48:	ff010113          	addi	sp,sp,-16
    80003e4c:	00813423          	sd	s0,8(sp)
    80003e50:	01010413          	addi	s0,sp,16
    80003e54:	1a060e63          	beqz	a2,80004010 <__memset+0x1c8>
    80003e58:	40a007b3          	neg	a5,a0
    80003e5c:	0077f793          	andi	a5,a5,7
    80003e60:	00778693          	addi	a3,a5,7
    80003e64:	00b00813          	li	a6,11
    80003e68:	0ff5f593          	andi	a1,a1,255
    80003e6c:	fff6071b          	addiw	a4,a2,-1
    80003e70:	1b06e663          	bltu	a3,a6,8000401c <__memset+0x1d4>
    80003e74:	1cd76463          	bltu	a4,a3,8000403c <__memset+0x1f4>
    80003e78:	1a078e63          	beqz	a5,80004034 <__memset+0x1ec>
    80003e7c:	00b50023          	sb	a1,0(a0)
    80003e80:	00100713          	li	a4,1
    80003e84:	1ae78463          	beq	a5,a4,8000402c <__memset+0x1e4>
    80003e88:	00b500a3          	sb	a1,1(a0)
    80003e8c:	00200713          	li	a4,2
    80003e90:	1ae78a63          	beq	a5,a4,80004044 <__memset+0x1fc>
    80003e94:	00b50123          	sb	a1,2(a0)
    80003e98:	00300713          	li	a4,3
    80003e9c:	18e78463          	beq	a5,a4,80004024 <__memset+0x1dc>
    80003ea0:	00b501a3          	sb	a1,3(a0)
    80003ea4:	00400713          	li	a4,4
    80003ea8:	1ae78263          	beq	a5,a4,8000404c <__memset+0x204>
    80003eac:	00b50223          	sb	a1,4(a0)
    80003eb0:	00500713          	li	a4,5
    80003eb4:	1ae78063          	beq	a5,a4,80004054 <__memset+0x20c>
    80003eb8:	00b502a3          	sb	a1,5(a0)
    80003ebc:	00700713          	li	a4,7
    80003ec0:	18e79e63          	bne	a5,a4,8000405c <__memset+0x214>
    80003ec4:	00b50323          	sb	a1,6(a0)
    80003ec8:	00700e93          	li	t4,7
    80003ecc:	00859713          	slli	a4,a1,0x8
    80003ed0:	00e5e733          	or	a4,a1,a4
    80003ed4:	01059e13          	slli	t3,a1,0x10
    80003ed8:	01c76e33          	or	t3,a4,t3
    80003edc:	01859313          	slli	t1,a1,0x18
    80003ee0:	006e6333          	or	t1,t3,t1
    80003ee4:	02059893          	slli	a7,a1,0x20
    80003ee8:	40f60e3b          	subw	t3,a2,a5
    80003eec:	011368b3          	or	a7,t1,a7
    80003ef0:	02859813          	slli	a6,a1,0x28
    80003ef4:	0108e833          	or	a6,a7,a6
    80003ef8:	03059693          	slli	a3,a1,0x30
    80003efc:	003e589b          	srliw	a7,t3,0x3
    80003f00:	00d866b3          	or	a3,a6,a3
    80003f04:	03859713          	slli	a4,a1,0x38
    80003f08:	00389813          	slli	a6,a7,0x3
    80003f0c:	00f507b3          	add	a5,a0,a5
    80003f10:	00e6e733          	or	a4,a3,a4
    80003f14:	000e089b          	sext.w	a7,t3
    80003f18:	00f806b3          	add	a3,a6,a5
    80003f1c:	00e7b023          	sd	a4,0(a5)
    80003f20:	00878793          	addi	a5,a5,8
    80003f24:	fed79ce3          	bne	a5,a3,80003f1c <__memset+0xd4>
    80003f28:	ff8e7793          	andi	a5,t3,-8
    80003f2c:	0007871b          	sext.w	a4,a5
    80003f30:	01d787bb          	addw	a5,a5,t4
    80003f34:	0ce88e63          	beq	a7,a4,80004010 <__memset+0x1c8>
    80003f38:	00f50733          	add	a4,a0,a5
    80003f3c:	00b70023          	sb	a1,0(a4)
    80003f40:	0017871b          	addiw	a4,a5,1
    80003f44:	0cc77663          	bgeu	a4,a2,80004010 <__memset+0x1c8>
    80003f48:	00e50733          	add	a4,a0,a4
    80003f4c:	00b70023          	sb	a1,0(a4)
    80003f50:	0027871b          	addiw	a4,a5,2
    80003f54:	0ac77e63          	bgeu	a4,a2,80004010 <__memset+0x1c8>
    80003f58:	00e50733          	add	a4,a0,a4
    80003f5c:	00b70023          	sb	a1,0(a4)
    80003f60:	0037871b          	addiw	a4,a5,3
    80003f64:	0ac77663          	bgeu	a4,a2,80004010 <__memset+0x1c8>
    80003f68:	00e50733          	add	a4,a0,a4
    80003f6c:	00b70023          	sb	a1,0(a4)
    80003f70:	0047871b          	addiw	a4,a5,4
    80003f74:	08c77e63          	bgeu	a4,a2,80004010 <__memset+0x1c8>
    80003f78:	00e50733          	add	a4,a0,a4
    80003f7c:	00b70023          	sb	a1,0(a4)
    80003f80:	0057871b          	addiw	a4,a5,5
    80003f84:	08c77663          	bgeu	a4,a2,80004010 <__memset+0x1c8>
    80003f88:	00e50733          	add	a4,a0,a4
    80003f8c:	00b70023          	sb	a1,0(a4)
    80003f90:	0067871b          	addiw	a4,a5,6
    80003f94:	06c77e63          	bgeu	a4,a2,80004010 <__memset+0x1c8>
    80003f98:	00e50733          	add	a4,a0,a4
    80003f9c:	00b70023          	sb	a1,0(a4)
    80003fa0:	0077871b          	addiw	a4,a5,7
    80003fa4:	06c77663          	bgeu	a4,a2,80004010 <__memset+0x1c8>
    80003fa8:	00e50733          	add	a4,a0,a4
    80003fac:	00b70023          	sb	a1,0(a4)
    80003fb0:	0087871b          	addiw	a4,a5,8
    80003fb4:	04c77e63          	bgeu	a4,a2,80004010 <__memset+0x1c8>
    80003fb8:	00e50733          	add	a4,a0,a4
    80003fbc:	00b70023          	sb	a1,0(a4)
    80003fc0:	0097871b          	addiw	a4,a5,9
    80003fc4:	04c77663          	bgeu	a4,a2,80004010 <__memset+0x1c8>
    80003fc8:	00e50733          	add	a4,a0,a4
    80003fcc:	00b70023          	sb	a1,0(a4)
    80003fd0:	00a7871b          	addiw	a4,a5,10
    80003fd4:	02c77e63          	bgeu	a4,a2,80004010 <__memset+0x1c8>
    80003fd8:	00e50733          	add	a4,a0,a4
    80003fdc:	00b70023          	sb	a1,0(a4)
    80003fe0:	00b7871b          	addiw	a4,a5,11
    80003fe4:	02c77663          	bgeu	a4,a2,80004010 <__memset+0x1c8>
    80003fe8:	00e50733          	add	a4,a0,a4
    80003fec:	00b70023          	sb	a1,0(a4)
    80003ff0:	00c7871b          	addiw	a4,a5,12
    80003ff4:	00c77e63          	bgeu	a4,a2,80004010 <__memset+0x1c8>
    80003ff8:	00e50733          	add	a4,a0,a4
    80003ffc:	00b70023          	sb	a1,0(a4)
    80004000:	00d7879b          	addiw	a5,a5,13
    80004004:	00c7f663          	bgeu	a5,a2,80004010 <__memset+0x1c8>
    80004008:	00f507b3          	add	a5,a0,a5
    8000400c:	00b78023          	sb	a1,0(a5)
    80004010:	00813403          	ld	s0,8(sp)
    80004014:	01010113          	addi	sp,sp,16
    80004018:	00008067          	ret
    8000401c:	00b00693          	li	a3,11
    80004020:	e55ff06f          	j	80003e74 <__memset+0x2c>
    80004024:	00300e93          	li	t4,3
    80004028:	ea5ff06f          	j	80003ecc <__memset+0x84>
    8000402c:	00100e93          	li	t4,1
    80004030:	e9dff06f          	j	80003ecc <__memset+0x84>
    80004034:	00000e93          	li	t4,0
    80004038:	e95ff06f          	j	80003ecc <__memset+0x84>
    8000403c:	00000793          	li	a5,0
    80004040:	ef9ff06f          	j	80003f38 <__memset+0xf0>
    80004044:	00200e93          	li	t4,2
    80004048:	e85ff06f          	j	80003ecc <__memset+0x84>
    8000404c:	00400e93          	li	t4,4
    80004050:	e7dff06f          	j	80003ecc <__memset+0x84>
    80004054:	00500e93          	li	t4,5
    80004058:	e75ff06f          	j	80003ecc <__memset+0x84>
    8000405c:	00600e93          	li	t4,6
    80004060:	e6dff06f          	j	80003ecc <__memset+0x84>

0000000080004064 <__memmove>:
    80004064:	ff010113          	addi	sp,sp,-16
    80004068:	00813423          	sd	s0,8(sp)
    8000406c:	01010413          	addi	s0,sp,16
    80004070:	0e060863          	beqz	a2,80004160 <__memmove+0xfc>
    80004074:	fff6069b          	addiw	a3,a2,-1
    80004078:	0006881b          	sext.w	a6,a3
    8000407c:	0ea5e863          	bltu	a1,a0,8000416c <__memmove+0x108>
    80004080:	00758713          	addi	a4,a1,7
    80004084:	00a5e7b3          	or	a5,a1,a0
    80004088:	40a70733          	sub	a4,a4,a0
    8000408c:	0077f793          	andi	a5,a5,7
    80004090:	00f73713          	sltiu	a4,a4,15
    80004094:	00174713          	xori	a4,a4,1
    80004098:	0017b793          	seqz	a5,a5
    8000409c:	00e7f7b3          	and	a5,a5,a4
    800040a0:	10078863          	beqz	a5,800041b0 <__memmove+0x14c>
    800040a4:	00900793          	li	a5,9
    800040a8:	1107f463          	bgeu	a5,a6,800041b0 <__memmove+0x14c>
    800040ac:	0036581b          	srliw	a6,a2,0x3
    800040b0:	fff8081b          	addiw	a6,a6,-1
    800040b4:	02081813          	slli	a6,a6,0x20
    800040b8:	01d85893          	srli	a7,a6,0x1d
    800040bc:	00858813          	addi	a6,a1,8
    800040c0:	00058793          	mv	a5,a1
    800040c4:	00050713          	mv	a4,a0
    800040c8:	01088833          	add	a6,a7,a6
    800040cc:	0007b883          	ld	a7,0(a5)
    800040d0:	00878793          	addi	a5,a5,8
    800040d4:	00870713          	addi	a4,a4,8
    800040d8:	ff173c23          	sd	a7,-8(a4)
    800040dc:	ff0798e3          	bne	a5,a6,800040cc <__memmove+0x68>
    800040e0:	ff867713          	andi	a4,a2,-8
    800040e4:	02071793          	slli	a5,a4,0x20
    800040e8:	0207d793          	srli	a5,a5,0x20
    800040ec:	00f585b3          	add	a1,a1,a5
    800040f0:	40e686bb          	subw	a3,a3,a4
    800040f4:	00f507b3          	add	a5,a0,a5
    800040f8:	06e60463          	beq	a2,a4,80004160 <__memmove+0xfc>
    800040fc:	0005c703          	lbu	a4,0(a1)
    80004100:	00e78023          	sb	a4,0(a5)
    80004104:	04068e63          	beqz	a3,80004160 <__memmove+0xfc>
    80004108:	0015c603          	lbu	a2,1(a1)
    8000410c:	00100713          	li	a4,1
    80004110:	00c780a3          	sb	a2,1(a5)
    80004114:	04e68663          	beq	a3,a4,80004160 <__memmove+0xfc>
    80004118:	0025c603          	lbu	a2,2(a1)
    8000411c:	00200713          	li	a4,2
    80004120:	00c78123          	sb	a2,2(a5)
    80004124:	02e68e63          	beq	a3,a4,80004160 <__memmove+0xfc>
    80004128:	0035c603          	lbu	a2,3(a1)
    8000412c:	00300713          	li	a4,3
    80004130:	00c781a3          	sb	a2,3(a5)
    80004134:	02e68663          	beq	a3,a4,80004160 <__memmove+0xfc>
    80004138:	0045c603          	lbu	a2,4(a1)
    8000413c:	00400713          	li	a4,4
    80004140:	00c78223          	sb	a2,4(a5)
    80004144:	00e68e63          	beq	a3,a4,80004160 <__memmove+0xfc>
    80004148:	0055c603          	lbu	a2,5(a1)
    8000414c:	00500713          	li	a4,5
    80004150:	00c782a3          	sb	a2,5(a5)
    80004154:	00e68663          	beq	a3,a4,80004160 <__memmove+0xfc>
    80004158:	0065c703          	lbu	a4,6(a1)
    8000415c:	00e78323          	sb	a4,6(a5)
    80004160:	00813403          	ld	s0,8(sp)
    80004164:	01010113          	addi	sp,sp,16
    80004168:	00008067          	ret
    8000416c:	02061713          	slli	a4,a2,0x20
    80004170:	02075713          	srli	a4,a4,0x20
    80004174:	00e587b3          	add	a5,a1,a4
    80004178:	f0f574e3          	bgeu	a0,a5,80004080 <__memmove+0x1c>
    8000417c:	02069613          	slli	a2,a3,0x20
    80004180:	02065613          	srli	a2,a2,0x20
    80004184:	fff64613          	not	a2,a2
    80004188:	00e50733          	add	a4,a0,a4
    8000418c:	00c78633          	add	a2,a5,a2
    80004190:	fff7c683          	lbu	a3,-1(a5)
    80004194:	fff78793          	addi	a5,a5,-1
    80004198:	fff70713          	addi	a4,a4,-1
    8000419c:	00d70023          	sb	a3,0(a4)
    800041a0:	fec798e3          	bne	a5,a2,80004190 <__memmove+0x12c>
    800041a4:	00813403          	ld	s0,8(sp)
    800041a8:	01010113          	addi	sp,sp,16
    800041ac:	00008067          	ret
    800041b0:	02069713          	slli	a4,a3,0x20
    800041b4:	02075713          	srli	a4,a4,0x20
    800041b8:	00170713          	addi	a4,a4,1
    800041bc:	00e50733          	add	a4,a0,a4
    800041c0:	00050793          	mv	a5,a0
    800041c4:	0005c683          	lbu	a3,0(a1)
    800041c8:	00178793          	addi	a5,a5,1
    800041cc:	00158593          	addi	a1,a1,1
    800041d0:	fed78fa3          	sb	a3,-1(a5)
    800041d4:	fee798e3          	bne	a5,a4,800041c4 <__memmove+0x160>
    800041d8:	f89ff06f          	j	80004160 <__memmove+0xfc>

00000000800041dc <__putc>:
    800041dc:	fe010113          	addi	sp,sp,-32
    800041e0:	00813823          	sd	s0,16(sp)
    800041e4:	00113c23          	sd	ra,24(sp)
    800041e8:	02010413          	addi	s0,sp,32
    800041ec:	00050793          	mv	a5,a0
    800041f0:	fef40593          	addi	a1,s0,-17
    800041f4:	00100613          	li	a2,1
    800041f8:	00000513          	li	a0,0
    800041fc:	fef407a3          	sb	a5,-17(s0)
    80004200:	fffff097          	auipc	ra,0xfffff
    80004204:	b3c080e7          	jalr	-1220(ra) # 80002d3c <console_write>
    80004208:	01813083          	ld	ra,24(sp)
    8000420c:	01013403          	ld	s0,16(sp)
    80004210:	02010113          	addi	sp,sp,32
    80004214:	00008067          	ret

0000000080004218 <__getc>:
    80004218:	fe010113          	addi	sp,sp,-32
    8000421c:	00813823          	sd	s0,16(sp)
    80004220:	00113c23          	sd	ra,24(sp)
    80004224:	02010413          	addi	s0,sp,32
    80004228:	fe840593          	addi	a1,s0,-24
    8000422c:	00100613          	li	a2,1
    80004230:	00000513          	li	a0,0
    80004234:	fffff097          	auipc	ra,0xfffff
    80004238:	ae8080e7          	jalr	-1304(ra) # 80002d1c <console_read>
    8000423c:	fe844503          	lbu	a0,-24(s0)
    80004240:	01813083          	ld	ra,24(sp)
    80004244:	01013403          	ld	s0,16(sp)
    80004248:	02010113          	addi	sp,sp,32
    8000424c:	00008067          	ret

0000000080004250 <console_handler>:
    80004250:	fe010113          	addi	sp,sp,-32
    80004254:	00813823          	sd	s0,16(sp)
    80004258:	00113c23          	sd	ra,24(sp)
    8000425c:	00913423          	sd	s1,8(sp)
    80004260:	02010413          	addi	s0,sp,32
    80004264:	14202773          	csrr	a4,scause
    80004268:	100027f3          	csrr	a5,sstatus
    8000426c:	0027f793          	andi	a5,a5,2
    80004270:	06079e63          	bnez	a5,800042ec <console_handler+0x9c>
    80004274:	00074c63          	bltz	a4,8000428c <console_handler+0x3c>
    80004278:	01813083          	ld	ra,24(sp)
    8000427c:	01013403          	ld	s0,16(sp)
    80004280:	00813483          	ld	s1,8(sp)
    80004284:	02010113          	addi	sp,sp,32
    80004288:	00008067          	ret
    8000428c:	0ff77713          	andi	a4,a4,255
    80004290:	00900793          	li	a5,9
    80004294:	fef712e3          	bne	a4,a5,80004278 <console_handler+0x28>
    80004298:	ffffe097          	auipc	ra,0xffffe
    8000429c:	6dc080e7          	jalr	1756(ra) # 80002974 <plic_claim>
    800042a0:	00a00793          	li	a5,10
    800042a4:	00050493          	mv	s1,a0
    800042a8:	02f50c63          	beq	a0,a5,800042e0 <console_handler+0x90>
    800042ac:	fc0506e3          	beqz	a0,80004278 <console_handler+0x28>
    800042b0:	00050593          	mv	a1,a0
    800042b4:	00001517          	auipc	a0,0x1
    800042b8:	f2450513          	addi	a0,a0,-220 # 800051d8 <_ZZ12printIntegermE6digits+0xe0>
    800042bc:	fffff097          	auipc	ra,0xfffff
    800042c0:	afc080e7          	jalr	-1284(ra) # 80002db8 <__printf>
    800042c4:	01013403          	ld	s0,16(sp)
    800042c8:	01813083          	ld	ra,24(sp)
    800042cc:	00048513          	mv	a0,s1
    800042d0:	00813483          	ld	s1,8(sp)
    800042d4:	02010113          	addi	sp,sp,32
    800042d8:	ffffe317          	auipc	t1,0xffffe
    800042dc:	6d430067          	jr	1748(t1) # 800029ac <plic_complete>
    800042e0:	fffff097          	auipc	ra,0xfffff
    800042e4:	3e0080e7          	jalr	992(ra) # 800036c0 <uartintr>
    800042e8:	fddff06f          	j	800042c4 <console_handler+0x74>
    800042ec:	00001517          	auipc	a0,0x1
    800042f0:	fec50513          	addi	a0,a0,-20 # 800052d8 <digits+0x78>
    800042f4:	fffff097          	auipc	ra,0xfffff
    800042f8:	a68080e7          	jalr	-1432(ra) # 80002d5c <panic>
	...
