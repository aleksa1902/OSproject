
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
    8000001c:	0e8020ef          	jal	ra,80002104 <start>

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
    80001184:	135000ef          	jal	ra,80001ab8 <_ZN5Riscv20handleSupervisorTrapEv>

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
    size_t arg = 0;
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
    800012f0:	d18080e7          	jalr	-744(ra) # 80002004 <_Z11printStringPKc>
    800012f4:	00048513          	mv	a0,s1
    800012f8:	00001097          	auipc	ra,0x1
    800012fc:	d7c080e7          	jalr	-644(ra) # 80002074 <_Z12printIntegerm>
    80001300:	00004517          	auipc	a0,0x4
    80001304:	df050513          	addi	a0,a0,-528 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001308:	00001097          	auipc	ra,0x1
    8000130c:	cfc080e7          	jalr	-772(ra) # 80002004 <_Z11printStringPKc>
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
    80001388:	c80080e7          	jalr	-896(ra) # 80002004 <_Z11printStringPKc>
    8000138c:	00048513          	mv	a0,s1
    80001390:	00001097          	auipc	ra,0x1
    80001394:	ce4080e7          	jalr	-796(ra) # 80002074 <_Z12printIntegerm>
    80001398:	00004517          	auipc	a0,0x4
    8000139c:	d5850513          	addi	a0,a0,-680 # 800050f0 <CONSOLE_STATUS+0xe0>
    800013a0:	00001097          	auipc	ra,0x1
    800013a4:	c64080e7          	jalr	-924(ra) # 80002004 <_Z11printStringPKc>
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
    80001464:	ba4080e7          	jalr	-1116(ra) # 80002004 <_Z11printStringPKc>
    80001468:	00048513          	mv	a0,s1
    8000146c:	00001097          	auipc	ra,0x1
    80001470:	c08080e7          	jalr	-1016(ra) # 80002074 <_Z12printIntegerm>
    80001474:	00004517          	auipc	a0,0x4
    80001478:	c7c50513          	addi	a0,a0,-900 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000147c:	00001097          	auipc	ra,0x1
    80001480:	b88080e7          	jalr	-1144(ra) # 80002004 <_Z11printStringPKc>
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
    800014a0:	b68080e7          	jalr	-1176(ra) # 80002004 <_Z11printStringPKc>
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
    800014c0:	b48080e7          	jalr	-1208(ra) # 80002004 <_Z11printStringPKc>
    800014c4:	00090513          	mv	a0,s2
    800014c8:	00001097          	auipc	ra,0x1
    800014cc:	bac080e7          	jalr	-1108(ra) # 80002074 <_Z12printIntegerm>
    800014d0:	00004517          	auipc	a0,0x4
    800014d4:	c2050513          	addi	a0,a0,-992 # 800050f0 <CONSOLE_STATUS+0xe0>
    800014d8:	00001097          	auipc	ra,0x1
    800014dc:	b2c080e7          	jalr	-1236(ra) # 80002004 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800014e0:	00c00513          	li	a0,12
    800014e4:	00000097          	auipc	ra,0x0
    800014e8:	ee0080e7          	jalr	-288(ra) # 800013c4 <_Z9fibonaccim>
    800014ec:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInteger(result); printString("\n");
    800014f0:	00004517          	auipc	a0,0x4
    800014f4:	b6050513          	addi	a0,a0,-1184 # 80005050 <CONSOLE_STATUS+0x40>
    800014f8:	00001097          	auipc	ra,0x1
    800014fc:	b0c080e7          	jalr	-1268(ra) # 80002004 <_Z11printStringPKc>
    80001500:	00090513          	mv	a0,s2
    80001504:	00001097          	auipc	ra,0x1
    80001508:	b70080e7          	jalr	-1168(ra) # 80002074 <_Z12printIntegerm>
    8000150c:	00004517          	auipc	a0,0x4
    80001510:	be450513          	addi	a0,a0,-1052 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001514:	00001097          	auipc	ra,0x1
    80001518:	af0080e7          	jalr	-1296(ra) # 80002004 <_Z11printStringPKc>
    8000151c:	0380006f          	j	80001554 <_Z11workerBodyCv+0x11c>

    for (; i < 6; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    80001520:	00004517          	auipc	a0,0x4
    80001524:	b1050513          	addi	a0,a0,-1264 # 80005030 <CONSOLE_STATUS+0x20>
    80001528:	00001097          	auipc	ra,0x1
    8000152c:	adc080e7          	jalr	-1316(ra) # 80002004 <_Z11printStringPKc>
    80001530:	00048513          	mv	a0,s1
    80001534:	00001097          	auipc	ra,0x1
    80001538:	b40080e7          	jalr	-1216(ra) # 80002074 <_Z12printIntegerm>
    8000153c:	00004517          	auipc	a0,0x4
    80001540:	bb450513          	addi	a0,a0,-1100 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001544:	00001097          	auipc	ra,0x1
    80001548:	ac0080e7          	jalr	-1344(ra) # 80002004 <_Z11printStringPKc>
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
    800015a0:	a68080e7          	jalr	-1432(ra) # 80002004 <_Z11printStringPKc>
    800015a4:	00048513          	mv	a0,s1
    800015a8:	00001097          	auipc	ra,0x1
    800015ac:	acc080e7          	jalr	-1332(ra) # 80002074 <_Z12printIntegerm>
    800015b0:	00004517          	auipc	a0,0x4
    800015b4:	b4050513          	addi	a0,a0,-1216 # 800050f0 <CONSOLE_STATUS+0xe0>
    800015b8:	00001097          	auipc	ra,0x1
    800015bc:	a4c080e7          	jalr	-1460(ra) # 80002004 <_Z11printStringPKc>
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
    800015dc:	a2c080e7          	jalr	-1492(ra) # 80002004 <_Z11printStringPKc>
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
    80001608:	a00080e7          	jalr	-1536(ra) # 80002004 <_Z11printStringPKc>
    8000160c:	00090513          	mv	a0,s2
    80001610:	00001097          	auipc	ra,0x1
    80001614:	a64080e7          	jalr	-1436(ra) # 80002074 <_Z12printIntegerm>
    80001618:	00004517          	auipc	a0,0x4
    8000161c:	ad850513          	addi	a0,a0,-1320 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001620:	00001097          	auipc	ra,0x1
    80001624:	9e4080e7          	jalr	-1564(ra) # 80002004 <_Z11printStringPKc>
    80001628:	0380006f          	j	80001660 <_Z11workerBodyDv+0xec>

    for (; i < 16; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    8000162c:	00004517          	auipc	a0,0x4
    80001630:	a3450513          	addi	a0,a0,-1484 # 80005060 <CONSOLE_STATUS+0x50>
    80001634:	00001097          	auipc	ra,0x1
    80001638:	9d0080e7          	jalr	-1584(ra) # 80002004 <_Z11printStringPKc>
    8000163c:	00048513          	mv	a0,s1
    80001640:	00001097          	auipc	ra,0x1
    80001644:	a34080e7          	jalr	-1484(ra) # 80002074 <_Z12printIntegerm>
    80001648:	00004517          	auipc	a0,0x4
    8000164c:	aa850513          	addi	a0,a0,-1368 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001650:	00001097          	auipc	ra,0x1
    80001654:	9b4080e7          	jalr	-1612(ra) # 80002004 <_Z11printStringPKc>
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
    8000169c:	6f0080e7          	jalr	1776(ra) # 80001d88 <_ZN15MemoryAllocator8memAllocEv>
    TCB *threads[5];
    threads[0] = TCB::createThread(nullptr);
    800016a0:	00000513          	li	a0,0
    800016a4:	00000097          	auipc	ra,0x0
    800016a8:	200080e7          	jalr	512(ra) # 800018a4 <_ZN3TCB12createThreadEPFvvE>
    800016ac:	faa43c23          	sd	a0,-72(s0)
    TCB::running = threads[0];
    800016b0:	00004797          	auipc	a5,0x4
    800016b4:	1f07b783          	ld	a5,496(a5) # 800058a0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800016b8:	00a7b023          	sd	a0,0(a5)
    threads[1] = TCB::createThread(workerBodyA);
    800016bc:	00004517          	auipc	a0,0x4
    800016c0:	1d453503          	ld	a0,468(a0) # 80005890 <_GLOBAL_OFFSET_TABLE_+0x28>
    800016c4:	00000097          	auipc	ra,0x0
    800016c8:	1e0080e7          	jalr	480(ra) # 800018a4 <_ZN3TCB12createThreadEPFvvE>
    800016cc:	fca43023          	sd	a0,-64(s0)
    printString("ThreadA created\n");
    800016d0:	00004517          	auipc	a0,0x4
    800016d4:	9b850513          	addi	a0,a0,-1608 # 80005088 <CONSOLE_STATUS+0x78>
    800016d8:	00001097          	auipc	ra,0x1
    800016dc:	92c080e7          	jalr	-1748(ra) # 80002004 <_Z11printStringPKc>
    threads[2] = TCB::createThread(workerBodyB);
    800016e0:	00004517          	auipc	a0,0x4
    800016e4:	1a053503          	ld	a0,416(a0) # 80005880 <_GLOBAL_OFFSET_TABLE_+0x18>
    800016e8:	00000097          	auipc	ra,0x0
    800016ec:	1bc080e7          	jalr	444(ra) # 800018a4 <_ZN3TCB12createThreadEPFvvE>
    800016f0:	fca43423          	sd	a0,-56(s0)
    printString("ThreadB created\n");
    800016f4:	00004517          	auipc	a0,0x4
    800016f8:	9ac50513          	addi	a0,a0,-1620 # 800050a0 <CONSOLE_STATUS+0x90>
    800016fc:	00001097          	auipc	ra,0x1
    80001700:	908080e7          	jalr	-1784(ra) # 80002004 <_Z11printStringPKc>
    threads[3] = TCB::createThread(workerBodyC);
    80001704:	00004517          	auipc	a0,0x4
    80001708:	1ac53503          	ld	a0,428(a0) # 800058b0 <_GLOBAL_OFFSET_TABLE_+0x48>
    8000170c:	00000097          	auipc	ra,0x0
    80001710:	198080e7          	jalr	408(ra) # 800018a4 <_ZN3TCB12createThreadEPFvvE>
    80001714:	fca43823          	sd	a0,-48(s0)
    printString("ThreadC created\n");
    80001718:	00004517          	auipc	a0,0x4
    8000171c:	9a050513          	addi	a0,a0,-1632 # 800050b8 <CONSOLE_STATUS+0xa8>
    80001720:	00001097          	auipc	ra,0x1
    80001724:	8e4080e7          	jalr	-1820(ra) # 80002004 <_Z11printStringPKc>
    threads[4] = TCB::createThread(workerBodyD);
    80001728:	00004517          	auipc	a0,0x4
    8000172c:	19053503          	ld	a0,400(a0) # 800058b8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001730:	00000097          	auipc	ra,0x0
    80001734:	174080e7          	jalr	372(ra) # 800018a4 <_ZN3TCB12createThreadEPFvvE>
    80001738:	fca43c23          	sd	a0,-40(s0)
    printString("ThreadD created\n");
    8000173c:	00004517          	auipc	a0,0x4
    80001740:	99450513          	addi	a0,a0,-1644 # 800050d0 <CONSOLE_STATUS+0xc0>
    80001744:	00001097          	auipc	ra,0x1
    80001748:	8c0080e7          	jalr	-1856(ra) # 80002004 <_Z11printStringPKc>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    8000174c:	00004797          	auipc	a5,0x4
    80001750:	12c7b783          	ld	a5,300(a5) # 80005878 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001754:	10579073          	csrw	stvec,a5
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
    800017ac:	2a0080e7          	jalr	672(ra) # 80001a48 <_ZdlPv>
    800017b0:	00848493          	addi	s1,s1,8
    800017b4:	fe040793          	addi	a5,s0,-32
    800017b8:	02f48063          	beq	s1,a5,800017d8 <main+0x158>
    800017bc:	0004b903          	ld	s2,0(s1)
    800017c0:	fe0908e3          	beqz	s2,800017b0 <main+0x130>
        ~TCB() { delete[] stack; }
    800017c4:	00893503          	ld	a0,8(s2)
    800017c8:	fc050ee3          	beqz	a0,800017a4 <main+0x124>
    800017cc:	00000097          	auipc	ra,0x0
    800017d0:	2a4080e7          	jalr	676(ra) # 80001a70 <_ZdaPv>
    800017d4:	fd1ff06f          	j	800017a4 <main+0x124>
    printString("Finished\n");
    800017d8:	00004517          	auipc	a0,0x4
    800017dc:	91050513          	addi	a0,a0,-1776 # 800050e8 <CONSOLE_STATUS+0xd8>
    800017e0:	00001097          	auipc	ra,0x1
    800017e4:	824080e7          	jalr	-2012(ra) # 80002004 <_Z11printStringPKc>
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
    8000183c:	1e8080e7          	jalr	488(ra) # 80001a20 <_Znam>
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
    80001874:	478080e7          	jalr	1144(ra) # 80001ce8 <_ZN9Scheduler3putEP3TCB>
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
    800018c8:	134080e7          	jalr	308(ra) # 800019f8 <_Znwm>
    800018cc:	00050493          	mv	s1,a0
    800018d0:	00200613          	li	a2,2
    800018d4:	00090593          	mv	a1,s2
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	f2c080e7          	jalr	-212(ra) # 80001804 <_ZN3TCBC1EPFvvEm>
    800018e0:	0200006f          	j	80001900 <_ZN3TCB12createThreadEPFvvE+0x5c>
    800018e4:	00050913          	mv	s2,a0
    800018e8:	00048513          	mv	a0,s1
    800018ec:	00000097          	auipc	ra,0x0
    800018f0:	15c080e7          	jalr	348(ra) # 80001a48 <_ZdlPv>
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
    if (!old->isFinished()) { Scheduler::put(old); }
    running = Scheduler::get();
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
    80001950:	14c080e7          	jalr	332(ra) # 80001a98 <_ZN5Riscv10popSppSpieEv>
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
    80001990:	fe010113          	addi	sp,sp,-32
    80001994:	00113c23          	sd	ra,24(sp)
    80001998:	00813823          	sd	s0,16(sp)
    8000199c:	00913423          	sd	s1,8(sp)
    800019a0:	02010413          	addi	s0,sp,32
    TCB *old = running;
    800019a4:	00004497          	auipc	s1,0x4
    800019a8:	f6c4b483          	ld	s1,-148(s1) # 80005910 <_ZN3TCB7runningE>
        bool isFinished() const { return finished; }
    800019ac:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished()) { Scheduler::put(old); }
    800019b0:	02078c63          	beqz	a5,800019e8 <_ZN3TCB8dispatchEv+0x58>
    running = Scheduler::get();
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	2cc080e7          	jalr	716(ra) # 80001c80 <_ZN9Scheduler3getEv>
    800019bc:	00004797          	auipc	a5,0x4
    800019c0:	f4a7ba23          	sd	a0,-172(a5) # 80005910 <_ZN3TCB7runningE>
    TCB::contextSwitch(&old->context, &running->context);
    800019c4:	01050593          	addi	a1,a0,16 # 2010 <_entry-0x7fffdff0>
    800019c8:	01048513          	addi	a0,s1,16
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	854080e7          	jalr	-1964(ra) # 80001220 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800019d4:	01813083          	ld	ra,24(sp)
    800019d8:	01013403          	ld	s0,16(sp)
    800019dc:	00813483          	ld	s1,8(sp)
    800019e0:	02010113          	addi	sp,sp,32
    800019e4:	00008067          	ret
    if (!old->isFinished()) { Scheduler::put(old); }
    800019e8:	00048513          	mv	a0,s1
    800019ec:	00000097          	auipc	ra,0x0
    800019f0:	2fc080e7          	jalr	764(ra) # 80001ce8 <_ZN9Scheduler3putEP3TCB>
    800019f4:	fc1ff06f          	j	800019b4 <_ZN3TCB8dispatchEv+0x24>

00000000800019f8 <_Znwm>:
// Created by os on 4/26/22.
//
#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"

void *operator new(uint64 n) { return MemoryAllocator::mem_alloc(n); }
    800019f8:	ff010113          	addi	sp,sp,-16
    800019fc:	00113423          	sd	ra,8(sp)
    80001a00:	00813023          	sd	s0,0(sp)
    80001a04:	01010413          	addi	s0,sp,16
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	3d0080e7          	jalr	976(ra) # 80001dd8 <_ZN15MemoryAllocator9mem_allocEm>
    80001a10:	00813083          	ld	ra,8(sp)
    80001a14:	00013403          	ld	s0,0(sp)
    80001a18:	01010113          	addi	sp,sp,16
    80001a1c:	00008067          	ret

0000000080001a20 <_Znam>:
void *operator new[](uint64 n) { return MemoryAllocator::mem_alloc(n); }
    80001a20:	ff010113          	addi	sp,sp,-16
    80001a24:	00113423          	sd	ra,8(sp)
    80001a28:	00813023          	sd	s0,0(sp)
    80001a2c:	01010413          	addi	s0,sp,16
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	3a8080e7          	jalr	936(ra) # 80001dd8 <_ZN15MemoryAllocator9mem_allocEm>
    80001a38:	00813083          	ld	ra,8(sp)
    80001a3c:	00013403          	ld	s0,0(sp)
    80001a40:	01010113          	addi	sp,sp,16
    80001a44:	00008067          	ret

0000000080001a48 <_ZdlPv>:

void operator delete(void *p) noexcept { MemoryAllocator::mem_free(p); }
    80001a48:	ff010113          	addi	sp,sp,-16
    80001a4c:	00113423          	sd	ra,8(sp)
    80001a50:	00813023          	sd	s0,0(sp)
    80001a54:	01010413          	addi	s0,sp,16
    80001a58:	00000097          	auipc	ra,0x0
    80001a5c:	4c0080e7          	jalr	1216(ra) # 80001f18 <_ZN15MemoryAllocator8mem_freeEPv>
    80001a60:	00813083          	ld	ra,8(sp)
    80001a64:	00013403          	ld	s0,0(sp)
    80001a68:	01010113          	addi	sp,sp,16
    80001a6c:	00008067          	ret

0000000080001a70 <_ZdaPv>:
void operator delete[](void *p) noexcept { MemoryAllocator::mem_free(p); }
    80001a70:	ff010113          	addi	sp,sp,-16
    80001a74:	00113423          	sd	ra,8(sp)
    80001a78:	00813023          	sd	s0,0(sp)
    80001a7c:	01010413          	addi	s0,sp,16
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	498080e7          	jalr	1176(ra) # 80001f18 <_ZN15MemoryAllocator8mem_freeEPv>
    80001a88:	00813083          	ld	ra,8(sp)
    80001a8c:	00013403          	ld	s0,0(sp)
    80001a90:	01010113          	addi	sp,sp,16
    80001a94:	00008067          	ret

0000000080001a98 <_ZN5Riscv10popSppSpieEv>:
#include "../h/riscv.hpp"
#include "../h/tcb.hpp"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"

void Riscv::popSppSpie() {
    80001a98:	ff010113          	addi	sp,sp,-16
    80001a9c:	00813423          	sd	s0,8(sp)
    80001aa0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001aa4:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001aa8:	10200073          	sret
}
    80001aac:	00813403          	ld	s0,8(sp)
    80001ab0:	01010113          	addi	sp,sp,16
    80001ab4:	00008067          	ret

0000000080001ab8 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80001ab8:	f9010113          	addi	sp,sp,-112
    80001abc:	06113423          	sd	ra,104(sp)
    80001ac0:	06813023          	sd	s0,96(sp)
    80001ac4:	04913c23          	sd	s1,88(sp)
    80001ac8:	05213823          	sd	s2,80(sp)
    80001acc:	05313423          	sd	s3,72(sp)
    80001ad0:	07010413          	addi	s0,sp,112
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001ad4:	142027f3          	csrr	a5,scause
    80001ad8:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80001adc:	f9843703          	ld	a4,-104(s0)
    uint64 scause = r_scause();

    // velicina gde cu da mu obavestim koji je poziv
    size_t argument0;
    __asm__ volatile("mv %0, a0" : "=r" (argument0));
    80001ae0:	00050493          	mv	s1,a0

    if(argument0 != 0 && scause == 0x0000000000000009UL){
    80001ae4:	00048663          	beqz	s1,80001af0 <_ZN5Riscv20handleSupervisorTrapEv+0x38>
    80001ae8:	00900793          	li	a5,9
    80001aec:	04f70463          	beq	a4,a5,80001b34 <_ZN5Riscv20handleSupervisorTrapEv+0x7c>
            MemoryAllocator::mem_free(argument_void);
        }

        w_sstatus(sstatus); w_sepc(sepc);
    }
    else if (scause == 0x0000000000000009UL) {
    80001af0:	00900793          	li	a5,9
    80001af4:	08f70c63          	beq	a4,a5,80001b8c <_ZN5Riscv20handleSupervisorTrapEv+0xd4>
        // interrupt: no; cause code: environment call from S-mode(9)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch();
        w_sstatus(sstatus); w_sepc(sepc);
    } else if (scause == 0x8000000000000001UL) {
    80001af8:	fff00793          	li	a5,-1
    80001afc:	03f79793          	slli	a5,a5,0x3f
    80001b00:	00178793          	addi	a5,a5,1
    80001b04:	0cf70263          	beq	a4,a5,80001bc8 <_ZN5Riscv20handleSupervisorTrapEv+0x110>
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus); w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    } else if (scause == 0x8000000000000009UL) {
    80001b08:	fff00793          	li	a5,-1
    80001b0c:	03f79793          	slli	a5,a5,0x3f
    80001b10:	00978793          	addi	a5,a5,9
    80001b14:	12f70063          	beq	a4,a5,80001c34 <_ZN5Riscv20handleSupervisorTrapEv+0x17c>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else {
        // unexpected trap cause
    }
}
    80001b18:	06813083          	ld	ra,104(sp)
    80001b1c:	06013403          	ld	s0,96(sp)
    80001b20:	05813483          	ld	s1,88(sp)
    80001b24:	05013903          	ld	s2,80(sp)
    80001b28:	04813983          	ld	s3,72(sp)
    80001b2c:	07010113          	addi	sp,sp,112
    80001b30:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001b34:	141027f3          	csrr	a5,sepc
    80001b38:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80001b3c:	fa843903          	ld	s2,-88(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001b40:	100027f3          	csrr	a5,sstatus
    80001b44:	faf43023          	sd	a5,-96(s0)
    return sstatus;
    80001b48:	fa043983          	ld	s3,-96(s0)
        if(argument0 == 1){
    80001b4c:	00100793          	li	a5,1
    80001b50:	00f48c63          	beq	s1,a5,80001b68 <_ZN5Riscv20handleSupervisorTrapEv+0xb0>
        if(argument0 == 2){
    80001b54:	00200793          	li	a5,2
    80001b58:	02f48263          	beq	s1,a5,80001b7c <_ZN5Riscv20handleSupervisorTrapEv+0xc4>
}
inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001b5c:	10099073          	csrw	sstatus,s3
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001b60:	14191073          	csrw	sepc,s2
}
    80001b64:	fb5ff06f          	j	80001b18 <_ZN5Riscv20handleSupervisorTrapEv+0x60>
            __asm__ volatile("mv %0, a1" : "=r" (argument_sizet));
    80001b68:	00058513          	mv	a0,a1
            argument_ret_void = MemoryAllocator::mem_alloc(argument_sizet);
    80001b6c:	00000097          	auipc	ra,0x0
    80001b70:	26c080e7          	jalr	620(ra) # 80001dd8 <_ZN15MemoryAllocator9mem_allocEm>
            __asm__ volatile("mv a0, %0" : : "r" (argument_ret_void));
    80001b74:	00050513          	mv	a0,a0
    80001b78:	fddff06f          	j	80001b54 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
            __asm__ volatile("mv %0, a1" : "=r" (argument_void));
    80001b7c:	00058513          	mv	a0,a1
            MemoryAllocator::mem_free(argument_void);
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	398080e7          	jalr	920(ra) # 80001f18 <_ZN15MemoryAllocator8mem_freeEPv>
    80001b88:	fd5ff06f          	j	80001b5c <_ZN5Riscv20handleSupervisorTrapEv+0xa4>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001b8c:	141027f3          	csrr	a5,sepc
    80001b90:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001b94:	fb843483          	ld	s1,-72(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80001b98:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001b9c:	100027f3          	csrr	a5,sstatus
    80001ba0:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001ba4:	fb043903          	ld	s2,-80(s0)
        TCB::timeSliceCounter = 0;
    80001ba8:	00004797          	auipc	a5,0x4
    80001bac:	ce07b783          	ld	a5,-800(a5) # 80005888 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001bb0:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    80001bb4:	00000097          	auipc	ra,0x0
    80001bb8:	ddc080e7          	jalr	-548(ra) # 80001990 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001bbc:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001bc0:	14149073          	csrw	sepc,s1
}
    80001bc4:	f55ff06f          	j	80001b18 <_ZN5Riscv20handleSupervisorTrapEv+0x60>
        TCB::timeSliceCounter++;
    80001bc8:	00004717          	auipc	a4,0x4
    80001bcc:	cc073703          	ld	a4,-832(a4) # 80005888 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001bd0:	00073783          	ld	a5,0(a4)
    80001bd4:	00178793          	addi	a5,a5,1
    80001bd8:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    80001bdc:	00004717          	auipc	a4,0x4
    80001be0:	cc473703          	ld	a4,-828(a4) # 800058a0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001be4:	00073703          	ld	a4,0(a4)
        uint64 getTimeSlice() const { return timeSlice; }
    80001be8:	02073703          	ld	a4,32(a4)
    80001bec:	00e7f863          	bgeu	a5,a4,80001bfc <_ZN5Riscv20handleSupervisorTrapEv+0x144>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80001bf0:	00200793          	li	a5,2
    80001bf4:	1447b073          	csrc	sip,a5
}
    80001bf8:	f21ff06f          	j	80001b18 <_ZN5Riscv20handleSupervisorTrapEv+0x60>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001bfc:	141027f3          	csrr	a5,sepc
    80001c00:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80001c04:	fc843483          	ld	s1,-56(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001c08:	100027f3          	csrr	a5,sstatus
    80001c0c:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80001c10:	fc043903          	ld	s2,-64(s0)
            TCB::timeSliceCounter = 0;
    80001c14:	00004797          	auipc	a5,0x4
    80001c18:	c747b783          	ld	a5,-908(a5) # 80005888 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001c1c:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80001c20:	00000097          	auipc	ra,0x0
    80001c24:	d70080e7          	jalr	-656(ra) # 80001990 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001c28:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001c2c:	14149073          	csrw	sepc,s1
}
    80001c30:	fc1ff06f          	j	80001bf0 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
        console_handler();
    80001c34:	00002097          	auipc	ra,0x2
    80001c38:	60c080e7          	jalr	1548(ra) # 80004240 <console_handler>
}
    80001c3c:	eddff06f          	j	80001b18 <_ZN5Riscv20handleSupervisorTrapEv+0x60>

0000000080001c40 <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyCoroutineQueue.addLast(tcb);
    80001c40:	ff010113          	addi	sp,sp,-16
    80001c44:	00813423          	sd	s0,8(sp)
    80001c48:	01010413          	addi	s0,sp,16
    80001c4c:	00100793          	li	a5,1
    80001c50:	00f50863          	beq	a0,a5,80001c60 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001c54:	00813403          	ld	s0,8(sp)
    80001c58:	01010113          	addi	sp,sp,16
    80001c5c:	00008067          	ret
    80001c60:	000107b7          	lui	a5,0x10
    80001c64:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001c68:	fef596e3          	bne	a1,a5,80001c54 <_Z41__static_initialization_and_destruction_0ii+0x14>
        Elem(T *data, Elem *next) : data(data), next(next){}
    };

    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    80001c6c:	00004797          	auipc	a5,0x4
    80001c70:	cb478793          	addi	a5,a5,-844 # 80005920 <_ZN9Scheduler19readyCoroutineQueueE>
    80001c74:	0007b023          	sd	zero,0(a5)
    80001c78:	0007b423          	sd	zero,8(a5)
    80001c7c:	fd9ff06f          	j	80001c54 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001c80 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80001c80:	fe010113          	addi	sp,sp,-32
    80001c84:	00113c23          	sd	ra,24(sp)
    80001c88:	00813823          	sd	s0,16(sp)
    80001c8c:	00913423          	sd	s1,8(sp)
    80001c90:	02010413          	addi	s0,sp,32
        }else{
            head = tail = elem;
        }
    }
    T *removeFirst(){
        if(!head){ return 0; }
    80001c94:	00004517          	auipc	a0,0x4
    80001c98:	c8c53503          	ld	a0,-884(a0) # 80005920 <_ZN9Scheduler19readyCoroutineQueueE>
    80001c9c:	04050263          	beqz	a0,80001ce0 <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80001ca0:	00853783          	ld	a5,8(a0)
    80001ca4:	00004717          	auipc	a4,0x4
    80001ca8:	c6f73e23          	sd	a5,-900(a4) # 80005920 <_ZN9Scheduler19readyCoroutineQueueE>
        if(!head){ tail = 0; }
    80001cac:	02078463          	beqz	a5,80001cd4 <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80001cb0:	00053483          	ld	s1,0(a0)
        delete elem;
    80001cb4:	00000097          	auipc	ra,0x0
    80001cb8:	d94080e7          	jalr	-620(ra) # 80001a48 <_ZdlPv>
}
    80001cbc:	00048513          	mv	a0,s1
    80001cc0:	01813083          	ld	ra,24(sp)
    80001cc4:	01013403          	ld	s0,16(sp)
    80001cc8:	00813483          	ld	s1,8(sp)
    80001ccc:	02010113          	addi	sp,sp,32
    80001cd0:	00008067          	ret
        if(!head){ tail = 0; }
    80001cd4:	00004797          	auipc	a5,0x4
    80001cd8:	c407ba23          	sd	zero,-940(a5) # 80005928 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001cdc:	fd5ff06f          	j	80001cb0 <_ZN9Scheduler3getEv+0x30>
        if(!head){ return 0; }
    80001ce0:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    80001ce4:	fd9ff06f          	j	80001cbc <_ZN9Scheduler3getEv+0x3c>

0000000080001ce8 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80001ce8:	fe010113          	addi	sp,sp,-32
    80001cec:	00113c23          	sd	ra,24(sp)
    80001cf0:	00813823          	sd	s0,16(sp)
    80001cf4:	00913423          	sd	s1,8(sp)
    80001cf8:	02010413          	addi	s0,sp,32
    80001cfc:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80001d00:	01000513          	li	a0,16
    80001d04:	00000097          	auipc	ra,0x0
    80001d08:	cf4080e7          	jalr	-780(ra) # 800019f8 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    80001d0c:	00953023          	sd	s1,0(a0)
    80001d10:	00053423          	sd	zero,8(a0)
        if(tail){
    80001d14:	00004797          	auipc	a5,0x4
    80001d18:	c147b783          	ld	a5,-1004(a5) # 80005928 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001d1c:	02078263          	beqz	a5,80001d40 <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    80001d20:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001d24:	00004797          	auipc	a5,0x4
    80001d28:	c0a7b223          	sd	a0,-1020(a5) # 80005928 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001d2c:	01813083          	ld	ra,24(sp)
    80001d30:	01013403          	ld	s0,16(sp)
    80001d34:	00813483          	ld	s1,8(sp)
    80001d38:	02010113          	addi	sp,sp,32
    80001d3c:	00008067          	ret
            head = tail = elem;
    80001d40:	00004797          	auipc	a5,0x4
    80001d44:	be078793          	addi	a5,a5,-1056 # 80005920 <_ZN9Scheduler19readyCoroutineQueueE>
    80001d48:	00a7b423          	sd	a0,8(a5)
    80001d4c:	00a7b023          	sd	a0,0(a5)
    80001d50:	fddff06f          	j	80001d2c <_ZN9Scheduler3putEP3TCB+0x44>

0000000080001d54 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80001d54:	ff010113          	addi	sp,sp,-16
    80001d58:	00113423          	sd	ra,8(sp)
    80001d5c:	00813023          	sd	s0,0(sp)
    80001d60:	01010413          	addi	s0,sp,16
    80001d64:	000105b7          	lui	a1,0x10
    80001d68:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001d6c:	00100513          	li	a0,1
    80001d70:	00000097          	auipc	ra,0x0
    80001d74:	ed0080e7          	jalr	-304(ra) # 80001c40 <_Z41__static_initialization_and_destruction_0ii>
    80001d78:	00813083          	ld	ra,8(sp)
    80001d7c:	00013403          	ld	s0,0(sp)
    80001d80:	01010113          	addi	sp,sp,16
    80001d84:	00008067          	ret

0000000080001d88 <_ZN15MemoryAllocator8memAllocEv>:

MemoryBloc* MemoryAllocator::freeMemBlocHead;
MemoryBloc* MemoryAllocator::takenMemBlocHead;

// Inicijalizacija memorije
void MemoryAllocator::memAlloc(){
    80001d88:	ff010113          	addi	sp,sp,-16
    80001d8c:	00813423          	sd	s0,8(sp)
    80001d90:	01010413          	addi	s0,sp,16
    freeMemBlocHead = (MemoryBloc*)HEAP_START_ADDR;
    80001d94:	00004797          	auipc	a5,0x4
    80001d98:	adc7b783          	ld	a5,-1316(a5) # 80005870 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001d9c:	0007b703          	ld	a4,0(a5)
    80001da0:	00004797          	auipc	a5,0x4
    80001da4:	b9078793          	addi	a5,a5,-1136 # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001da8:	00e7b023          	sd	a4,0(a5)
    freeMemBlocHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    80001dac:	00004697          	auipc	a3,0x4
    80001db0:	afc6b683          	ld	a3,-1284(a3) # 800058a8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001db4:	0006b683          	ld	a3,0(a3)
    80001db8:	40e686b3          	sub	a3,a3,a4
    80001dbc:	00d73023          	sd	a3,0(a4)
    freeMemBlocHead->next = nullptr;
    80001dc0:	0007b703          	ld	a4,0(a5)
    80001dc4:	00073423          	sd	zero,8(a4)

    takenMemBlocHead = nullptr;
    80001dc8:	0007b423          	sd	zero,8(a5)
}
    80001dcc:	00813403          	ld	s0,8(sp)
    80001dd0:	01010113          	addi	sp,sp,16
    80001dd4:	00008067          	ret

0000000080001dd8 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc (size_t size){
    80001dd8:	ff010113          	addi	sp,sp,-16
    80001ddc:	00813423          	sd	s0,8(sp)
    80001de0:	01010413          	addi	s0,sp,16
    size_t newSize;

    // ako je velicina veca od MEM_BLOC_SIZE onda uzmi blokova koliko ti treba + sizeof(MemoryBloc)
    // u suprotnom samo MEM_BLOC_SIZE + sizeof(MemoryBloc)
    if(size > MEM_BLOCK_SIZE){
    80001de4:	04000793          	li	a5,64
    80001de8:	02a7fa63          	bgeu	a5,a0,80001e1c <_ZN15MemoryAllocator9mem_allocEm+0x44>
        newSize = ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    80001dec:	00655713          	srli	a4,a0,0x6
    80001df0:	00170713          	addi	a4,a4,1
    80001df4:	00671713          	slli	a4,a4,0x6
    80001df8:	01070713          	addi	a4,a4,16
    }else{
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    }

    // trazim prvi slobodan blok u listi slobodnih blokova gde mogu da alociram
    MemoryBloc* curr = freeMemBlocHead;
    80001dfc:	00004617          	auipc	a2,0x4
    80001e00:	b3463603          	ld	a2,-1228(a2) # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001e04:	00060513          	mv	a0,a2

    while(newSize > curr->size && curr != nullptr){
    80001e08:	00053783          	ld	a5,0(a0)
    80001e0c:	00e7fc63          	bgeu	a5,a4,80001e24 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
    80001e10:	00050a63          	beqz	a0,80001e24 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
        curr = curr->next;
    80001e14:	00853503          	ld	a0,8(a0)
    while(newSize > curr->size && curr != nullptr){
    80001e18:	ff1ff06f          	j	80001e08 <_ZN15MemoryAllocator9mem_allocEm+0x30>
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    80001e1c:	05000713          	li	a4,80
    80001e20:	fddff06f          	j	80001dfc <_ZN15MemoryAllocator9mem_allocEm+0x24>
    }

    if(curr == nullptr){
    80001e24:	00051863          	bnez	a0,80001e34 <_ZN15MemoryAllocator9mem_allocEm+0x5c>
            prevTaken->next = newBloc;
        }
    }

    return (void*)((char*)newBloc + sizeof(MemoryBloc));
};
    80001e28:	00813403          	ld	s0,8(sp)
    80001e2c:	01010113          	addi	sp,sp,16
    80001e30:	00008067          	ret
    if(curr == freeMemBlocHead){
    80001e34:	00c50e63          	beq	a0,a2,80001e50 <_ZN15MemoryAllocator9mem_allocEm+0x78>
    bool checkFree = false;
    80001e38:	00000593          	li	a1,0
    MemoryBloc* next = curr->next;
    80001e3c:	00853803          	ld	a6,8(a0)
    size_t currSize = curr->size - newSize;
    80001e40:	40e786b3          	sub	a3,a5,a4
    if(currSize == 0){
    80001e44:	06e79663          	bne	a5,a4,80001eb0 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
        MemoryBloc* currFree = freeMemBlocHead;
    80001e48:	00060793          	mv	a5,a2
    80001e4c:	0100006f          	j	80001e5c <_ZN15MemoryAllocator9mem_allocEm+0x84>
        checkFree = true;
    80001e50:	00100593          	li	a1,1
    80001e54:	fe9ff06f          	j	80001e3c <_ZN15MemoryAllocator9mem_allocEm+0x64>
            currFree = currFree->next;
    80001e58:	00068793          	mv	a5,a3
        while(currFree != nullptr && currFree->next != curr && checkFree != true){
    80001e5c:	00078863          	beqz	a5,80001e6c <_ZN15MemoryAllocator9mem_allocEm+0x94>
    80001e60:	0087b683          	ld	a3,8(a5)
    80001e64:	00a68463          	beq	a3,a0,80001e6c <_ZN15MemoryAllocator9mem_allocEm+0x94>
    80001e68:	fe0588e3          	beqz	a1,80001e58 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(currFree == freeMemBlocHead){
    80001e6c:	02c78a63          	beq	a5,a2,80001ea0 <_ZN15MemoryAllocator9mem_allocEm+0xc8>
            currFree->next = curr->next;
    80001e70:	0107b423          	sd	a6,8(a5)
    newBloc->size = newSize;
    80001e74:	00e53023          	sd	a4,0(a0)
    if(takenMemBlocHead == nullptr){
    80001e78:	00004697          	auipc	a3,0x4
    80001e7c:	ac06b683          	ld	a3,-1344(a3) # 80005938 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80001e80:	06068263          	beqz	a3,80001ee4 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
        MemoryBloc* nextTaken = takenMemBlocHead;
    80001e84:	00068793          	mv	a5,a3
        MemoryBloc* prevTaken = nullptr;
    80001e88:	00000713          	li	a4,0
        while (newBloc > nextTaken && nextTaken != nullptr){
    80001e8c:	06a7f463          	bgeu	a5,a0,80001ef4 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
    80001e90:	06078263          	beqz	a5,80001ef4 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
            prevTaken = nextTaken;
    80001e94:	00078713          	mv	a4,a5
            nextTaken = nextTaken->next;
    80001e98:	0087b783          	ld	a5,8(a5)
        while (newBloc > nextTaken && nextTaken != nullptr){
    80001e9c:	ff1ff06f          	j	80001e8c <_ZN15MemoryAllocator9mem_allocEm+0xb4>
            freeMemBlocHead = freeMemBlocHead->next;
    80001ea0:	00863783          	ld	a5,8(a2)
    80001ea4:	00004697          	auipc	a3,0x4
    80001ea8:	a8f6b623          	sd	a5,-1396(a3) # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001eac:	fc9ff06f          	j	80001e74 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
    }else if(checkFree == true){
    80001eb0:	02058263          	beqz	a1,80001ed4 <_ZN15MemoryAllocator9mem_allocEm+0xfc>
        freeMemBlocHead = (MemoryBloc*)((char*)freeMemBlocHead + newSize);
    80001eb4:	00e60633          	add	a2,a2,a4
    80001eb8:	00004797          	auipc	a5,0x4
    80001ebc:	a7878793          	addi	a5,a5,-1416 # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001ec0:	00c7b023          	sd	a2,0(a5)
        freeMemBlocHead->size = currSize;
    80001ec4:	00d63023          	sd	a3,0(a2)
        freeMemBlocHead->next = next;
    80001ec8:	0007b783          	ld	a5,0(a5)
    80001ecc:	0107b423          	sd	a6,8(a5)
    80001ed0:	fa5ff06f          	j	80001e74 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        curr = (MemoryBloc*)((char*)curr + newSize);
    80001ed4:	00e507b3          	add	a5,a0,a4
        curr->size = currSize;
    80001ed8:	00d7b023          	sd	a3,0(a5)
        curr->next = next;
    80001edc:	0107b423          	sd	a6,8(a5)
    80001ee0:	f95ff06f          	j	80001e74 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        takenMemBlocHead = newBloc;
    80001ee4:	00004797          	auipc	a5,0x4
    80001ee8:	a4a7ba23          	sd	a0,-1452(a5) # 80005938 <_ZN15MemoryAllocator16takenMemBlocHeadE>
        newBloc->next = nullptr;
    80001eec:	00053423          	sd	zero,8(a0)
    80001ef0:	0100006f          	j	80001f00 <_ZN15MemoryAllocator9mem_allocEm+0x128>
        if(nextTaken == takenMemBlocHead){
    80001ef4:	00f68a63          	beq	a3,a5,80001f08 <_ZN15MemoryAllocator9mem_allocEm+0x130>
            newBloc->next = nextTaken;
    80001ef8:	00f53423          	sd	a5,8(a0)
            prevTaken->next = newBloc;
    80001efc:	00a73423          	sd	a0,8(a4)
    return (void*)((char*)newBloc + sizeof(MemoryBloc));
    80001f00:	01050513          	addi	a0,a0,16
    80001f04:	f25ff06f          	j	80001e28 <_ZN15MemoryAllocator9mem_allocEm+0x50>
            newBloc->next = takenMemBlocHead;
    80001f08:	00d53423          	sd	a3,8(a0)
            takenMemBlocHead = newBloc;
    80001f0c:	00004797          	auipc	a5,0x4
    80001f10:	a2a7b623          	sd	a0,-1492(a5) # 80005938 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80001f14:	fedff06f          	j	80001f00 <_ZN15MemoryAllocator9mem_allocEm+0x128>

0000000080001f18 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free (void* mem){
    80001f18:	ff010113          	addi	sp,sp,-16
    80001f1c:	00813423          	sd	s0,8(sp)
    80001f20:	01010413          	addi	s0,sp,16
    void* freeCurr = (void*)((char*)mem - sizeof(MemoryBloc));
    80001f24:	ff050513          	addi	a0,a0,-16

    MemoryBloc* curr = takenMemBlocHead;
    80001f28:	00004697          	auipc	a3,0x4
    80001f2c:	a106b683          	ld	a3,-1520(a3) # 80005938 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80001f30:	00068793          	mv	a5,a3
    MemoryBloc* prev = nullptr;
    80001f34:	00000713          	li	a4,0

    while (curr != freeCurr){
    80001f38:	00a78863          	beq	a5,a0,80001f48 <_ZN15MemoryAllocator8mem_freeEPv+0x30>
        prev = curr;
    80001f3c:	00078713          	mv	a4,a5
        curr = curr->next;
    80001f40:	0087b783          	ld	a5,8(a5)
    while (curr != freeCurr){
    80001f44:	ff5ff06f          	j	80001f38 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
    }
    // uraditi nepredvidjeno ponasanje ako hocu da dealociram nesto sto nisam alocirao
    if(curr == takenMemBlocHead){
    80001f48:	02d78863          	beq	a5,a3,80001f78 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        takenMemBlocHead = takenMemBlocHead->next;
    }else{
        prev->next = curr->next;
    80001f4c:	0087b683          	ld	a3,8(a5)
    80001f50:	00d73423          	sd	a3,8(a4)
    }

    if(freeMemBlocHead == nullptr){
    80001f54:	00004617          	auipc	a2,0x4
    80001f58:	9dc63603          	ld	a2,-1572(a2) # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001f5c:	02060663          	beqz	a2,80001f88 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        freeMemBlocHead = curr;
    }else{
        MemoryBloc* currFree = freeMemBlocHead;
    80001f60:	00060713          	mv	a4,a2
        MemoryBloc* prevFree = nullptr;
    80001f64:	00000693          	li	a3,0

        while(curr > currFree){
    80001f68:	02f77663          	bgeu	a4,a5,80001f94 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
            prevFree = currFree;
    80001f6c:	00070693          	mv	a3,a4
            currFree = currFree->next;
    80001f70:	00873703          	ld	a4,8(a4)
        while(curr > currFree){
    80001f74:	ff5ff06f          	j	80001f68 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
        takenMemBlocHead = takenMemBlocHead->next;
    80001f78:	0086b703          	ld	a4,8(a3)
    80001f7c:	00004697          	auipc	a3,0x4
    80001f80:	9ae6be23          	sd	a4,-1604(a3) # 80005938 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80001f84:	fd1ff06f          	j	80001f54 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
        freeMemBlocHead = curr;
    80001f88:	00004717          	auipc	a4,0x4
    80001f8c:	9af73423          	sd	a5,-1624(a4) # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001f90:	0100006f          	j	80001fa0 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
        }

        if(currFree == freeMemBlocHead){
    80001f94:	00e60c63          	beq	a2,a4,80001fac <_ZN15MemoryAllocator8mem_freeEPv+0x94>
            curr->next = freeMemBlocHead;
            freeMemBlocHead = curr;
        }else{
            curr->next = currFree;
    80001f98:	00e7b423          	sd	a4,8(a5)
            prevFree->next = curr;
    80001f9c:	00f6b423          	sd	a5,8(a3)
        }
    }

    MemoryBloc* currMemMerge = freeMemBlocHead;
    80001fa0:	00004797          	auipc	a5,0x4
    80001fa4:	9907b783          	ld	a5,-1648(a5) # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001fa8:	0300006f          	j	80001fd8 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
            curr->next = freeMemBlocHead;
    80001fac:	00c7b423          	sd	a2,8(a5)
            freeMemBlocHead = curr;
    80001fb0:	00004717          	auipc	a4,0x4
    80001fb4:	98f73023          	sd	a5,-1664(a4) # 80005930 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001fb8:	fe9ff06f          	j	80001fa0 <_ZN15MemoryAllocator8mem_freeEPv+0x88>

    while(currMemMerge){
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
            currMemMerge->size += currMemMerge->next->size;
    80001fbc:	00073603          	ld	a2,0(a4)
    80001fc0:	00c686b3          	add	a3,a3,a2
    80001fc4:	00d7b023          	sd	a3,0(a5)
            currMemMerge->next = currMemMerge->next->next;
    80001fc8:	00873703          	ld	a4,8(a4)
    80001fcc:	00e7b423          	sd	a4,8(a5)
    80001fd0:	00078713          	mv	a4,a5
    80001fd4:	00070793          	mv	a5,a4
    while(currMemMerge){
    80001fd8:	00078e63          	beqz	a5,80001ff4 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
    80001fdc:	0087b703          	ld	a4,8(a5)
    80001fe0:	fe070ae3          	beqz	a4,80001fd4 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80001fe4:	0007b683          	ld	a3,0(a5)
    80001fe8:	00d78633          	add	a2,a5,a3
    80001fec:	fec714e3          	bne	a4,a2,80001fd4 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80001ff0:	fcdff06f          	j	80001fbc <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            currMemMerge = currMemMerge->next;
        }
    }

    return 0;
    80001ff4:	00000513          	li	a0,0
    80001ff8:	00813403          	ld	s0,8(sp)
    80001ffc:	01010113          	addi	sp,sp,16
    80002000:	00008067          	ret

0000000080002004 <_Z11printStringPKc>:
#include "../lib/console.h"
#include "../h/riscv.hpp"


void printString(char const *string)
{
    80002004:	fd010113          	addi	sp,sp,-48
    80002008:	02113423          	sd	ra,40(sp)
    8000200c:	02813023          	sd	s0,32(sp)
    80002010:	00913c23          	sd	s1,24(sp)
    80002014:	01213823          	sd	s2,16(sp)
    80002018:	03010413          	addi	s0,sp,48
    8000201c:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002020:	100027f3          	csrr	a5,sstatus
    80002024:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80002028:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000202c:	00200793          	li	a5,2
    80002030:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    80002034:	0004c503          	lbu	a0,0(s1)
    80002038:	00050a63          	beqz	a0,8000204c <_Z11printStringPKc+0x48>
    {
        __putc(*string);
    8000203c:	00002097          	auipc	ra,0x2
    80002040:	190080e7          	jalr	400(ra) # 800041cc <__putc>
        string++;
    80002044:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002048:	fedff06f          	j	80002034 <_Z11printStringPKc+0x30>
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    8000204c:	0009091b          	sext.w	s2,s2
    80002050:	00297913          	andi	s2,s2,2
    80002054:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002058:	10092073          	csrs	sstatus,s2
}
    8000205c:	02813083          	ld	ra,40(sp)
    80002060:	02013403          	ld	s0,32(sp)
    80002064:	01813483          	ld	s1,24(sp)
    80002068:	01013903          	ld	s2,16(sp)
    8000206c:	03010113          	addi	sp,sp,48
    80002070:	00008067          	ret

0000000080002074 <_Z12printIntegerm>:


void printInteger(uint64 integer){
    80002074:	fd010113          	addi	sp,sp,-48
    80002078:	02113423          	sd	ra,40(sp)
    8000207c:	02813023          	sd	s0,32(sp)
    80002080:	00913c23          	sd	s1,24(sp)
    80002084:	03010413          	addi	s0,sp,48
    neg = 0;
    if(integer < 0){
        neg = 1;
        x = -integer;
    }else{
        x = integer;
    80002088:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    8000208c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x%10];
    80002090:	00a00613          	li	a2,10
    80002094:	02c5773b          	remuw	a4,a0,a2
    80002098:	02071693          	slli	a3,a4,0x20
    8000209c:	0206d693          	srli	a3,a3,0x20
    800020a0:	00003717          	auipc	a4,0x3
    800020a4:	05870713          	addi	a4,a4,88 # 800050f8 <_ZZ12printIntegermE6digits>
    800020a8:	00d70733          	add	a4,a4,a3
    800020ac:	00074703          	lbu	a4,0(a4)
    800020b0:	fe040693          	addi	a3,s0,-32
    800020b4:	009687b3          	add	a5,a3,s1
    800020b8:	0014849b          	addiw	s1,s1,1
    800020bc:	fee78823          	sb	a4,-16(a5)
    }while((x /= 10) != 0);
    800020c0:	0005071b          	sext.w	a4,a0
    800020c4:	02c5553b          	divuw	a0,a0,a2
    800020c8:	00900793          	li	a5,9
    800020cc:	fce7e2e3          	bltu	a5,a4,80002090 <_Z12printIntegerm+0x1c>
    if(neg){
        buf[i++] = '-';
    }
    while(--i >= 0)
    800020d0:	fff4849b          	addiw	s1,s1,-1
    800020d4:	0004ce63          	bltz	s1,800020f0 <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    800020d8:	fe040793          	addi	a5,s0,-32
    800020dc:	009787b3          	add	a5,a5,s1
    800020e0:	ff07c503          	lbu	a0,-16(a5)
    800020e4:	00002097          	auipc	ra,0x2
    800020e8:	0e8080e7          	jalr	232(ra) # 800041cc <__putc>
    800020ec:	fe5ff06f          	j	800020d0 <_Z12printIntegerm+0x5c>
    800020f0:	02813083          	ld	ra,40(sp)
    800020f4:	02013403          	ld	s0,32(sp)
    800020f8:	01813483          	ld	s1,24(sp)
    800020fc:	03010113          	addi	sp,sp,48
    80002100:	00008067          	ret

0000000080002104 <start>:
    80002104:	ff010113          	addi	sp,sp,-16
    80002108:	00813423          	sd	s0,8(sp)
    8000210c:	01010413          	addi	s0,sp,16
    80002110:	300027f3          	csrr	a5,mstatus
    80002114:	ffffe737          	lui	a4,0xffffe
    80002118:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7c5f>
    8000211c:	00e7f7b3          	and	a5,a5,a4
    80002120:	00001737          	lui	a4,0x1
    80002124:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002128:	00e7e7b3          	or	a5,a5,a4
    8000212c:	30079073          	csrw	mstatus,a5
    80002130:	00000797          	auipc	a5,0x0
    80002134:	16078793          	addi	a5,a5,352 # 80002290 <system_main>
    80002138:	34179073          	csrw	mepc,a5
    8000213c:	00000793          	li	a5,0
    80002140:	18079073          	csrw	satp,a5
    80002144:	000107b7          	lui	a5,0x10
    80002148:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000214c:	30279073          	csrw	medeleg,a5
    80002150:	30379073          	csrw	mideleg,a5
    80002154:	104027f3          	csrr	a5,sie
    80002158:	2227e793          	ori	a5,a5,546
    8000215c:	10479073          	csrw	sie,a5
    80002160:	fff00793          	li	a5,-1
    80002164:	00a7d793          	srli	a5,a5,0xa
    80002168:	3b079073          	csrw	pmpaddr0,a5
    8000216c:	00f00793          	li	a5,15
    80002170:	3a079073          	csrw	pmpcfg0,a5
    80002174:	f14027f3          	csrr	a5,mhartid
    80002178:	0200c737          	lui	a4,0x200c
    8000217c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002180:	0007869b          	sext.w	a3,a5
    80002184:	00269713          	slli	a4,a3,0x2
    80002188:	000f4637          	lui	a2,0xf4
    8000218c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002190:	00d70733          	add	a4,a4,a3
    80002194:	0037979b          	slliw	a5,a5,0x3
    80002198:	020046b7          	lui	a3,0x2004
    8000219c:	00d787b3          	add	a5,a5,a3
    800021a0:	00c585b3          	add	a1,a1,a2
    800021a4:	00371693          	slli	a3,a4,0x3
    800021a8:	00003717          	auipc	a4,0x3
    800021ac:	79870713          	addi	a4,a4,1944 # 80005940 <timer_scratch>
    800021b0:	00b7b023          	sd	a1,0(a5)
    800021b4:	00d70733          	add	a4,a4,a3
    800021b8:	00f73c23          	sd	a5,24(a4)
    800021bc:	02c73023          	sd	a2,32(a4)
    800021c0:	34071073          	csrw	mscratch,a4
    800021c4:	00000797          	auipc	a5,0x0
    800021c8:	6ec78793          	addi	a5,a5,1772 # 800028b0 <timervec>
    800021cc:	30579073          	csrw	mtvec,a5
    800021d0:	300027f3          	csrr	a5,mstatus
    800021d4:	0087e793          	ori	a5,a5,8
    800021d8:	30079073          	csrw	mstatus,a5
    800021dc:	304027f3          	csrr	a5,mie
    800021e0:	0807e793          	ori	a5,a5,128
    800021e4:	30479073          	csrw	mie,a5
    800021e8:	f14027f3          	csrr	a5,mhartid
    800021ec:	0007879b          	sext.w	a5,a5
    800021f0:	00078213          	mv	tp,a5
    800021f4:	30200073          	mret
    800021f8:	00813403          	ld	s0,8(sp)
    800021fc:	01010113          	addi	sp,sp,16
    80002200:	00008067          	ret

0000000080002204 <timerinit>:
    80002204:	ff010113          	addi	sp,sp,-16
    80002208:	00813423          	sd	s0,8(sp)
    8000220c:	01010413          	addi	s0,sp,16
    80002210:	f14027f3          	csrr	a5,mhartid
    80002214:	0200c737          	lui	a4,0x200c
    80002218:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000221c:	0007869b          	sext.w	a3,a5
    80002220:	00269713          	slli	a4,a3,0x2
    80002224:	000f4637          	lui	a2,0xf4
    80002228:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000222c:	00d70733          	add	a4,a4,a3
    80002230:	0037979b          	slliw	a5,a5,0x3
    80002234:	020046b7          	lui	a3,0x2004
    80002238:	00d787b3          	add	a5,a5,a3
    8000223c:	00c585b3          	add	a1,a1,a2
    80002240:	00371693          	slli	a3,a4,0x3
    80002244:	00003717          	auipc	a4,0x3
    80002248:	6fc70713          	addi	a4,a4,1788 # 80005940 <timer_scratch>
    8000224c:	00b7b023          	sd	a1,0(a5)
    80002250:	00d70733          	add	a4,a4,a3
    80002254:	00f73c23          	sd	a5,24(a4)
    80002258:	02c73023          	sd	a2,32(a4)
    8000225c:	34071073          	csrw	mscratch,a4
    80002260:	00000797          	auipc	a5,0x0
    80002264:	65078793          	addi	a5,a5,1616 # 800028b0 <timervec>
    80002268:	30579073          	csrw	mtvec,a5
    8000226c:	300027f3          	csrr	a5,mstatus
    80002270:	0087e793          	ori	a5,a5,8
    80002274:	30079073          	csrw	mstatus,a5
    80002278:	304027f3          	csrr	a5,mie
    8000227c:	0807e793          	ori	a5,a5,128
    80002280:	30479073          	csrw	mie,a5
    80002284:	00813403          	ld	s0,8(sp)
    80002288:	01010113          	addi	sp,sp,16
    8000228c:	00008067          	ret

0000000080002290 <system_main>:
    80002290:	fe010113          	addi	sp,sp,-32
    80002294:	00813823          	sd	s0,16(sp)
    80002298:	00913423          	sd	s1,8(sp)
    8000229c:	00113c23          	sd	ra,24(sp)
    800022a0:	02010413          	addi	s0,sp,32
    800022a4:	00000097          	auipc	ra,0x0
    800022a8:	0c4080e7          	jalr	196(ra) # 80002368 <cpuid>
    800022ac:	00003497          	auipc	s1,0x3
    800022b0:	63448493          	addi	s1,s1,1588 # 800058e0 <started>
    800022b4:	02050263          	beqz	a0,800022d8 <system_main+0x48>
    800022b8:	0004a783          	lw	a5,0(s1)
    800022bc:	0007879b          	sext.w	a5,a5
    800022c0:	fe078ce3          	beqz	a5,800022b8 <system_main+0x28>
    800022c4:	0ff0000f          	fence
    800022c8:	00003517          	auipc	a0,0x3
    800022cc:	e7050513          	addi	a0,a0,-400 # 80005138 <_ZZ12printIntegermE6digits+0x40>
    800022d0:	00001097          	auipc	ra,0x1
    800022d4:	a7c080e7          	jalr	-1412(ra) # 80002d4c <panic>
    800022d8:	00001097          	auipc	ra,0x1
    800022dc:	9d0080e7          	jalr	-1584(ra) # 80002ca8 <consoleinit>
    800022e0:	00001097          	auipc	ra,0x1
    800022e4:	15c080e7          	jalr	348(ra) # 8000343c <printfinit>
    800022e8:	00003517          	auipc	a0,0x3
    800022ec:	e0850513          	addi	a0,a0,-504 # 800050f0 <CONSOLE_STATUS+0xe0>
    800022f0:	00001097          	auipc	ra,0x1
    800022f4:	ab8080e7          	jalr	-1352(ra) # 80002da8 <__printf>
    800022f8:	00003517          	auipc	a0,0x3
    800022fc:	e1050513          	addi	a0,a0,-496 # 80005108 <_ZZ12printIntegermE6digits+0x10>
    80002300:	00001097          	auipc	ra,0x1
    80002304:	aa8080e7          	jalr	-1368(ra) # 80002da8 <__printf>
    80002308:	00003517          	auipc	a0,0x3
    8000230c:	de850513          	addi	a0,a0,-536 # 800050f0 <CONSOLE_STATUS+0xe0>
    80002310:	00001097          	auipc	ra,0x1
    80002314:	a98080e7          	jalr	-1384(ra) # 80002da8 <__printf>
    80002318:	00001097          	auipc	ra,0x1
    8000231c:	4b0080e7          	jalr	1200(ra) # 800037c8 <kinit>
    80002320:	00000097          	auipc	ra,0x0
    80002324:	148080e7          	jalr	328(ra) # 80002468 <trapinit>
    80002328:	00000097          	auipc	ra,0x0
    8000232c:	16c080e7          	jalr	364(ra) # 80002494 <trapinithart>
    80002330:	00000097          	auipc	ra,0x0
    80002334:	5c0080e7          	jalr	1472(ra) # 800028f0 <plicinit>
    80002338:	00000097          	auipc	ra,0x0
    8000233c:	5e0080e7          	jalr	1504(ra) # 80002918 <plicinithart>
    80002340:	00000097          	auipc	ra,0x0
    80002344:	078080e7          	jalr	120(ra) # 800023b8 <userinit>
    80002348:	0ff0000f          	fence
    8000234c:	00100793          	li	a5,1
    80002350:	00003517          	auipc	a0,0x3
    80002354:	dd050513          	addi	a0,a0,-560 # 80005120 <_ZZ12printIntegermE6digits+0x28>
    80002358:	00f4a023          	sw	a5,0(s1)
    8000235c:	00001097          	auipc	ra,0x1
    80002360:	a4c080e7          	jalr	-1460(ra) # 80002da8 <__printf>
    80002364:	0000006f          	j	80002364 <system_main+0xd4>

0000000080002368 <cpuid>:
    80002368:	ff010113          	addi	sp,sp,-16
    8000236c:	00813423          	sd	s0,8(sp)
    80002370:	01010413          	addi	s0,sp,16
    80002374:	00020513          	mv	a0,tp
    80002378:	00813403          	ld	s0,8(sp)
    8000237c:	0005051b          	sext.w	a0,a0
    80002380:	01010113          	addi	sp,sp,16
    80002384:	00008067          	ret

0000000080002388 <mycpu>:
    80002388:	ff010113          	addi	sp,sp,-16
    8000238c:	00813423          	sd	s0,8(sp)
    80002390:	01010413          	addi	s0,sp,16
    80002394:	00020793          	mv	a5,tp
    80002398:	00813403          	ld	s0,8(sp)
    8000239c:	0007879b          	sext.w	a5,a5
    800023a0:	00779793          	slli	a5,a5,0x7
    800023a4:	00004517          	auipc	a0,0x4
    800023a8:	5cc50513          	addi	a0,a0,1484 # 80006970 <cpus>
    800023ac:	00f50533          	add	a0,a0,a5
    800023b0:	01010113          	addi	sp,sp,16
    800023b4:	00008067          	ret

00000000800023b8 <userinit>:
    800023b8:	ff010113          	addi	sp,sp,-16
    800023bc:	00813423          	sd	s0,8(sp)
    800023c0:	01010413          	addi	s0,sp,16
    800023c4:	00813403          	ld	s0,8(sp)
    800023c8:	01010113          	addi	sp,sp,16
    800023cc:	fffff317          	auipc	t1,0xfffff
    800023d0:	2b430067          	jr	692(t1) # 80001680 <main>

00000000800023d4 <either_copyout>:
    800023d4:	ff010113          	addi	sp,sp,-16
    800023d8:	00813023          	sd	s0,0(sp)
    800023dc:	00113423          	sd	ra,8(sp)
    800023e0:	01010413          	addi	s0,sp,16
    800023e4:	02051663          	bnez	a0,80002410 <either_copyout+0x3c>
    800023e8:	00058513          	mv	a0,a1
    800023ec:	00060593          	mv	a1,a2
    800023f0:	0006861b          	sext.w	a2,a3
    800023f4:	00002097          	auipc	ra,0x2
    800023f8:	c60080e7          	jalr	-928(ra) # 80004054 <__memmove>
    800023fc:	00813083          	ld	ra,8(sp)
    80002400:	00013403          	ld	s0,0(sp)
    80002404:	00000513          	li	a0,0
    80002408:	01010113          	addi	sp,sp,16
    8000240c:	00008067          	ret
    80002410:	00003517          	auipc	a0,0x3
    80002414:	d5050513          	addi	a0,a0,-688 # 80005160 <_ZZ12printIntegermE6digits+0x68>
    80002418:	00001097          	auipc	ra,0x1
    8000241c:	934080e7          	jalr	-1740(ra) # 80002d4c <panic>

0000000080002420 <either_copyin>:
    80002420:	ff010113          	addi	sp,sp,-16
    80002424:	00813023          	sd	s0,0(sp)
    80002428:	00113423          	sd	ra,8(sp)
    8000242c:	01010413          	addi	s0,sp,16
    80002430:	02059463          	bnez	a1,80002458 <either_copyin+0x38>
    80002434:	00060593          	mv	a1,a2
    80002438:	0006861b          	sext.w	a2,a3
    8000243c:	00002097          	auipc	ra,0x2
    80002440:	c18080e7          	jalr	-1000(ra) # 80004054 <__memmove>
    80002444:	00813083          	ld	ra,8(sp)
    80002448:	00013403          	ld	s0,0(sp)
    8000244c:	00000513          	li	a0,0
    80002450:	01010113          	addi	sp,sp,16
    80002454:	00008067          	ret
    80002458:	00003517          	auipc	a0,0x3
    8000245c:	d3050513          	addi	a0,a0,-720 # 80005188 <_ZZ12printIntegermE6digits+0x90>
    80002460:	00001097          	auipc	ra,0x1
    80002464:	8ec080e7          	jalr	-1812(ra) # 80002d4c <panic>

0000000080002468 <trapinit>:
    80002468:	ff010113          	addi	sp,sp,-16
    8000246c:	00813423          	sd	s0,8(sp)
    80002470:	01010413          	addi	s0,sp,16
    80002474:	00813403          	ld	s0,8(sp)
    80002478:	00003597          	auipc	a1,0x3
    8000247c:	d3858593          	addi	a1,a1,-712 # 800051b0 <_ZZ12printIntegermE6digits+0xb8>
    80002480:	00004517          	auipc	a0,0x4
    80002484:	57050513          	addi	a0,a0,1392 # 800069f0 <tickslock>
    80002488:	01010113          	addi	sp,sp,16
    8000248c:	00001317          	auipc	t1,0x1
    80002490:	5cc30067          	jr	1484(t1) # 80003a58 <initlock>

0000000080002494 <trapinithart>:
    80002494:	ff010113          	addi	sp,sp,-16
    80002498:	00813423          	sd	s0,8(sp)
    8000249c:	01010413          	addi	s0,sp,16
    800024a0:	00000797          	auipc	a5,0x0
    800024a4:	30078793          	addi	a5,a5,768 # 800027a0 <kernelvec>
    800024a8:	10579073          	csrw	stvec,a5
    800024ac:	00813403          	ld	s0,8(sp)
    800024b0:	01010113          	addi	sp,sp,16
    800024b4:	00008067          	ret

00000000800024b8 <usertrap>:
    800024b8:	ff010113          	addi	sp,sp,-16
    800024bc:	00813423          	sd	s0,8(sp)
    800024c0:	01010413          	addi	s0,sp,16
    800024c4:	00813403          	ld	s0,8(sp)
    800024c8:	01010113          	addi	sp,sp,16
    800024cc:	00008067          	ret

00000000800024d0 <usertrapret>:
    800024d0:	ff010113          	addi	sp,sp,-16
    800024d4:	00813423          	sd	s0,8(sp)
    800024d8:	01010413          	addi	s0,sp,16
    800024dc:	00813403          	ld	s0,8(sp)
    800024e0:	01010113          	addi	sp,sp,16
    800024e4:	00008067          	ret

00000000800024e8 <kerneltrap>:
    800024e8:	fe010113          	addi	sp,sp,-32
    800024ec:	00813823          	sd	s0,16(sp)
    800024f0:	00113c23          	sd	ra,24(sp)
    800024f4:	00913423          	sd	s1,8(sp)
    800024f8:	02010413          	addi	s0,sp,32
    800024fc:	142025f3          	csrr	a1,scause
    80002500:	100027f3          	csrr	a5,sstatus
    80002504:	0027f793          	andi	a5,a5,2
    80002508:	10079c63          	bnez	a5,80002620 <kerneltrap+0x138>
    8000250c:	142027f3          	csrr	a5,scause
    80002510:	0207ce63          	bltz	a5,8000254c <kerneltrap+0x64>
    80002514:	00003517          	auipc	a0,0x3
    80002518:	ce450513          	addi	a0,a0,-796 # 800051f8 <_ZZ12printIntegermE6digits+0x100>
    8000251c:	00001097          	auipc	ra,0x1
    80002520:	88c080e7          	jalr	-1908(ra) # 80002da8 <__printf>
    80002524:	141025f3          	csrr	a1,sepc
    80002528:	14302673          	csrr	a2,stval
    8000252c:	00003517          	auipc	a0,0x3
    80002530:	cdc50513          	addi	a0,a0,-804 # 80005208 <_ZZ12printIntegermE6digits+0x110>
    80002534:	00001097          	auipc	ra,0x1
    80002538:	874080e7          	jalr	-1932(ra) # 80002da8 <__printf>
    8000253c:	00003517          	auipc	a0,0x3
    80002540:	ce450513          	addi	a0,a0,-796 # 80005220 <_ZZ12printIntegermE6digits+0x128>
    80002544:	00001097          	auipc	ra,0x1
    80002548:	808080e7          	jalr	-2040(ra) # 80002d4c <panic>
    8000254c:	0ff7f713          	andi	a4,a5,255
    80002550:	00900693          	li	a3,9
    80002554:	04d70063          	beq	a4,a3,80002594 <kerneltrap+0xac>
    80002558:	fff00713          	li	a4,-1
    8000255c:	03f71713          	slli	a4,a4,0x3f
    80002560:	00170713          	addi	a4,a4,1
    80002564:	fae798e3          	bne	a5,a4,80002514 <kerneltrap+0x2c>
    80002568:	00000097          	auipc	ra,0x0
    8000256c:	e00080e7          	jalr	-512(ra) # 80002368 <cpuid>
    80002570:	06050663          	beqz	a0,800025dc <kerneltrap+0xf4>
    80002574:	144027f3          	csrr	a5,sip
    80002578:	ffd7f793          	andi	a5,a5,-3
    8000257c:	14479073          	csrw	sip,a5
    80002580:	01813083          	ld	ra,24(sp)
    80002584:	01013403          	ld	s0,16(sp)
    80002588:	00813483          	ld	s1,8(sp)
    8000258c:	02010113          	addi	sp,sp,32
    80002590:	00008067          	ret
    80002594:	00000097          	auipc	ra,0x0
    80002598:	3d0080e7          	jalr	976(ra) # 80002964 <plic_claim>
    8000259c:	00a00793          	li	a5,10
    800025a0:	00050493          	mv	s1,a0
    800025a4:	06f50863          	beq	a0,a5,80002614 <kerneltrap+0x12c>
    800025a8:	fc050ce3          	beqz	a0,80002580 <kerneltrap+0x98>
    800025ac:	00050593          	mv	a1,a0
    800025b0:	00003517          	auipc	a0,0x3
    800025b4:	c2850513          	addi	a0,a0,-984 # 800051d8 <_ZZ12printIntegermE6digits+0xe0>
    800025b8:	00000097          	auipc	ra,0x0
    800025bc:	7f0080e7          	jalr	2032(ra) # 80002da8 <__printf>
    800025c0:	01013403          	ld	s0,16(sp)
    800025c4:	01813083          	ld	ra,24(sp)
    800025c8:	00048513          	mv	a0,s1
    800025cc:	00813483          	ld	s1,8(sp)
    800025d0:	02010113          	addi	sp,sp,32
    800025d4:	00000317          	auipc	t1,0x0
    800025d8:	3c830067          	jr	968(t1) # 8000299c <plic_complete>
    800025dc:	00004517          	auipc	a0,0x4
    800025e0:	41450513          	addi	a0,a0,1044 # 800069f0 <tickslock>
    800025e4:	00001097          	auipc	ra,0x1
    800025e8:	498080e7          	jalr	1176(ra) # 80003a7c <acquire>
    800025ec:	00003717          	auipc	a4,0x3
    800025f0:	2f870713          	addi	a4,a4,760 # 800058e4 <ticks>
    800025f4:	00072783          	lw	a5,0(a4)
    800025f8:	00004517          	auipc	a0,0x4
    800025fc:	3f850513          	addi	a0,a0,1016 # 800069f0 <tickslock>
    80002600:	0017879b          	addiw	a5,a5,1
    80002604:	00f72023          	sw	a5,0(a4)
    80002608:	00001097          	auipc	ra,0x1
    8000260c:	540080e7          	jalr	1344(ra) # 80003b48 <release>
    80002610:	f65ff06f          	j	80002574 <kerneltrap+0x8c>
    80002614:	00001097          	auipc	ra,0x1
    80002618:	09c080e7          	jalr	156(ra) # 800036b0 <uartintr>
    8000261c:	fa5ff06f          	j	800025c0 <kerneltrap+0xd8>
    80002620:	00003517          	auipc	a0,0x3
    80002624:	b9850513          	addi	a0,a0,-1128 # 800051b8 <_ZZ12printIntegermE6digits+0xc0>
    80002628:	00000097          	auipc	ra,0x0
    8000262c:	724080e7          	jalr	1828(ra) # 80002d4c <panic>

0000000080002630 <clockintr>:
    80002630:	fe010113          	addi	sp,sp,-32
    80002634:	00813823          	sd	s0,16(sp)
    80002638:	00913423          	sd	s1,8(sp)
    8000263c:	00113c23          	sd	ra,24(sp)
    80002640:	02010413          	addi	s0,sp,32
    80002644:	00004497          	auipc	s1,0x4
    80002648:	3ac48493          	addi	s1,s1,940 # 800069f0 <tickslock>
    8000264c:	00048513          	mv	a0,s1
    80002650:	00001097          	auipc	ra,0x1
    80002654:	42c080e7          	jalr	1068(ra) # 80003a7c <acquire>
    80002658:	00003717          	auipc	a4,0x3
    8000265c:	28c70713          	addi	a4,a4,652 # 800058e4 <ticks>
    80002660:	00072783          	lw	a5,0(a4)
    80002664:	01013403          	ld	s0,16(sp)
    80002668:	01813083          	ld	ra,24(sp)
    8000266c:	00048513          	mv	a0,s1
    80002670:	0017879b          	addiw	a5,a5,1
    80002674:	00813483          	ld	s1,8(sp)
    80002678:	00f72023          	sw	a5,0(a4)
    8000267c:	02010113          	addi	sp,sp,32
    80002680:	00001317          	auipc	t1,0x1
    80002684:	4c830067          	jr	1224(t1) # 80003b48 <release>

0000000080002688 <devintr>:
    80002688:	142027f3          	csrr	a5,scause
    8000268c:	00000513          	li	a0,0
    80002690:	0007c463          	bltz	a5,80002698 <devintr+0x10>
    80002694:	00008067          	ret
    80002698:	fe010113          	addi	sp,sp,-32
    8000269c:	00813823          	sd	s0,16(sp)
    800026a0:	00113c23          	sd	ra,24(sp)
    800026a4:	00913423          	sd	s1,8(sp)
    800026a8:	02010413          	addi	s0,sp,32
    800026ac:	0ff7f713          	andi	a4,a5,255
    800026b0:	00900693          	li	a3,9
    800026b4:	04d70c63          	beq	a4,a3,8000270c <devintr+0x84>
    800026b8:	fff00713          	li	a4,-1
    800026bc:	03f71713          	slli	a4,a4,0x3f
    800026c0:	00170713          	addi	a4,a4,1
    800026c4:	00e78c63          	beq	a5,a4,800026dc <devintr+0x54>
    800026c8:	01813083          	ld	ra,24(sp)
    800026cc:	01013403          	ld	s0,16(sp)
    800026d0:	00813483          	ld	s1,8(sp)
    800026d4:	02010113          	addi	sp,sp,32
    800026d8:	00008067          	ret
    800026dc:	00000097          	auipc	ra,0x0
    800026e0:	c8c080e7          	jalr	-884(ra) # 80002368 <cpuid>
    800026e4:	06050663          	beqz	a0,80002750 <devintr+0xc8>
    800026e8:	144027f3          	csrr	a5,sip
    800026ec:	ffd7f793          	andi	a5,a5,-3
    800026f0:	14479073          	csrw	sip,a5
    800026f4:	01813083          	ld	ra,24(sp)
    800026f8:	01013403          	ld	s0,16(sp)
    800026fc:	00813483          	ld	s1,8(sp)
    80002700:	00200513          	li	a0,2
    80002704:	02010113          	addi	sp,sp,32
    80002708:	00008067          	ret
    8000270c:	00000097          	auipc	ra,0x0
    80002710:	258080e7          	jalr	600(ra) # 80002964 <plic_claim>
    80002714:	00a00793          	li	a5,10
    80002718:	00050493          	mv	s1,a0
    8000271c:	06f50663          	beq	a0,a5,80002788 <devintr+0x100>
    80002720:	00100513          	li	a0,1
    80002724:	fa0482e3          	beqz	s1,800026c8 <devintr+0x40>
    80002728:	00048593          	mv	a1,s1
    8000272c:	00003517          	auipc	a0,0x3
    80002730:	aac50513          	addi	a0,a0,-1364 # 800051d8 <_ZZ12printIntegermE6digits+0xe0>
    80002734:	00000097          	auipc	ra,0x0
    80002738:	674080e7          	jalr	1652(ra) # 80002da8 <__printf>
    8000273c:	00048513          	mv	a0,s1
    80002740:	00000097          	auipc	ra,0x0
    80002744:	25c080e7          	jalr	604(ra) # 8000299c <plic_complete>
    80002748:	00100513          	li	a0,1
    8000274c:	f7dff06f          	j	800026c8 <devintr+0x40>
    80002750:	00004517          	auipc	a0,0x4
    80002754:	2a050513          	addi	a0,a0,672 # 800069f0 <tickslock>
    80002758:	00001097          	auipc	ra,0x1
    8000275c:	324080e7          	jalr	804(ra) # 80003a7c <acquire>
    80002760:	00003717          	auipc	a4,0x3
    80002764:	18470713          	addi	a4,a4,388 # 800058e4 <ticks>
    80002768:	00072783          	lw	a5,0(a4)
    8000276c:	00004517          	auipc	a0,0x4
    80002770:	28450513          	addi	a0,a0,644 # 800069f0 <tickslock>
    80002774:	0017879b          	addiw	a5,a5,1
    80002778:	00f72023          	sw	a5,0(a4)
    8000277c:	00001097          	auipc	ra,0x1
    80002780:	3cc080e7          	jalr	972(ra) # 80003b48 <release>
    80002784:	f65ff06f          	j	800026e8 <devintr+0x60>
    80002788:	00001097          	auipc	ra,0x1
    8000278c:	f28080e7          	jalr	-216(ra) # 800036b0 <uartintr>
    80002790:	fadff06f          	j	8000273c <devintr+0xb4>
	...

00000000800027a0 <kernelvec>:
    800027a0:	f0010113          	addi	sp,sp,-256
    800027a4:	00113023          	sd	ra,0(sp)
    800027a8:	00213423          	sd	sp,8(sp)
    800027ac:	00313823          	sd	gp,16(sp)
    800027b0:	00413c23          	sd	tp,24(sp)
    800027b4:	02513023          	sd	t0,32(sp)
    800027b8:	02613423          	sd	t1,40(sp)
    800027bc:	02713823          	sd	t2,48(sp)
    800027c0:	02813c23          	sd	s0,56(sp)
    800027c4:	04913023          	sd	s1,64(sp)
    800027c8:	04a13423          	sd	a0,72(sp)
    800027cc:	04b13823          	sd	a1,80(sp)
    800027d0:	04c13c23          	sd	a2,88(sp)
    800027d4:	06d13023          	sd	a3,96(sp)
    800027d8:	06e13423          	sd	a4,104(sp)
    800027dc:	06f13823          	sd	a5,112(sp)
    800027e0:	07013c23          	sd	a6,120(sp)
    800027e4:	09113023          	sd	a7,128(sp)
    800027e8:	09213423          	sd	s2,136(sp)
    800027ec:	09313823          	sd	s3,144(sp)
    800027f0:	09413c23          	sd	s4,152(sp)
    800027f4:	0b513023          	sd	s5,160(sp)
    800027f8:	0b613423          	sd	s6,168(sp)
    800027fc:	0b713823          	sd	s7,176(sp)
    80002800:	0b813c23          	sd	s8,184(sp)
    80002804:	0d913023          	sd	s9,192(sp)
    80002808:	0da13423          	sd	s10,200(sp)
    8000280c:	0db13823          	sd	s11,208(sp)
    80002810:	0dc13c23          	sd	t3,216(sp)
    80002814:	0fd13023          	sd	t4,224(sp)
    80002818:	0fe13423          	sd	t5,232(sp)
    8000281c:	0ff13823          	sd	t6,240(sp)
    80002820:	cc9ff0ef          	jal	ra,800024e8 <kerneltrap>
    80002824:	00013083          	ld	ra,0(sp)
    80002828:	00813103          	ld	sp,8(sp)
    8000282c:	01013183          	ld	gp,16(sp)
    80002830:	02013283          	ld	t0,32(sp)
    80002834:	02813303          	ld	t1,40(sp)
    80002838:	03013383          	ld	t2,48(sp)
    8000283c:	03813403          	ld	s0,56(sp)
    80002840:	04013483          	ld	s1,64(sp)
    80002844:	04813503          	ld	a0,72(sp)
    80002848:	05013583          	ld	a1,80(sp)
    8000284c:	05813603          	ld	a2,88(sp)
    80002850:	06013683          	ld	a3,96(sp)
    80002854:	06813703          	ld	a4,104(sp)
    80002858:	07013783          	ld	a5,112(sp)
    8000285c:	07813803          	ld	a6,120(sp)
    80002860:	08013883          	ld	a7,128(sp)
    80002864:	08813903          	ld	s2,136(sp)
    80002868:	09013983          	ld	s3,144(sp)
    8000286c:	09813a03          	ld	s4,152(sp)
    80002870:	0a013a83          	ld	s5,160(sp)
    80002874:	0a813b03          	ld	s6,168(sp)
    80002878:	0b013b83          	ld	s7,176(sp)
    8000287c:	0b813c03          	ld	s8,184(sp)
    80002880:	0c013c83          	ld	s9,192(sp)
    80002884:	0c813d03          	ld	s10,200(sp)
    80002888:	0d013d83          	ld	s11,208(sp)
    8000288c:	0d813e03          	ld	t3,216(sp)
    80002890:	0e013e83          	ld	t4,224(sp)
    80002894:	0e813f03          	ld	t5,232(sp)
    80002898:	0f013f83          	ld	t6,240(sp)
    8000289c:	10010113          	addi	sp,sp,256
    800028a0:	10200073          	sret
    800028a4:	00000013          	nop
    800028a8:	00000013          	nop
    800028ac:	00000013          	nop

00000000800028b0 <timervec>:
    800028b0:	34051573          	csrrw	a0,mscratch,a0
    800028b4:	00b53023          	sd	a1,0(a0)
    800028b8:	00c53423          	sd	a2,8(a0)
    800028bc:	00d53823          	sd	a3,16(a0)
    800028c0:	01853583          	ld	a1,24(a0)
    800028c4:	02053603          	ld	a2,32(a0)
    800028c8:	0005b683          	ld	a3,0(a1)
    800028cc:	00c686b3          	add	a3,a3,a2
    800028d0:	00d5b023          	sd	a3,0(a1)
    800028d4:	00200593          	li	a1,2
    800028d8:	14459073          	csrw	sip,a1
    800028dc:	01053683          	ld	a3,16(a0)
    800028e0:	00853603          	ld	a2,8(a0)
    800028e4:	00053583          	ld	a1,0(a0)
    800028e8:	34051573          	csrrw	a0,mscratch,a0
    800028ec:	30200073          	mret

00000000800028f0 <plicinit>:
    800028f0:	ff010113          	addi	sp,sp,-16
    800028f4:	00813423          	sd	s0,8(sp)
    800028f8:	01010413          	addi	s0,sp,16
    800028fc:	00813403          	ld	s0,8(sp)
    80002900:	0c0007b7          	lui	a5,0xc000
    80002904:	00100713          	li	a4,1
    80002908:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000290c:	00e7a223          	sw	a4,4(a5)
    80002910:	01010113          	addi	sp,sp,16
    80002914:	00008067          	ret

0000000080002918 <plicinithart>:
    80002918:	ff010113          	addi	sp,sp,-16
    8000291c:	00813023          	sd	s0,0(sp)
    80002920:	00113423          	sd	ra,8(sp)
    80002924:	01010413          	addi	s0,sp,16
    80002928:	00000097          	auipc	ra,0x0
    8000292c:	a40080e7          	jalr	-1472(ra) # 80002368 <cpuid>
    80002930:	0085171b          	slliw	a4,a0,0x8
    80002934:	0c0027b7          	lui	a5,0xc002
    80002938:	00e787b3          	add	a5,a5,a4
    8000293c:	40200713          	li	a4,1026
    80002940:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002944:	00813083          	ld	ra,8(sp)
    80002948:	00013403          	ld	s0,0(sp)
    8000294c:	00d5151b          	slliw	a0,a0,0xd
    80002950:	0c2017b7          	lui	a5,0xc201
    80002954:	00a78533          	add	a0,a5,a0
    80002958:	00052023          	sw	zero,0(a0)
    8000295c:	01010113          	addi	sp,sp,16
    80002960:	00008067          	ret

0000000080002964 <plic_claim>:
    80002964:	ff010113          	addi	sp,sp,-16
    80002968:	00813023          	sd	s0,0(sp)
    8000296c:	00113423          	sd	ra,8(sp)
    80002970:	01010413          	addi	s0,sp,16
    80002974:	00000097          	auipc	ra,0x0
    80002978:	9f4080e7          	jalr	-1548(ra) # 80002368 <cpuid>
    8000297c:	00813083          	ld	ra,8(sp)
    80002980:	00013403          	ld	s0,0(sp)
    80002984:	00d5151b          	slliw	a0,a0,0xd
    80002988:	0c2017b7          	lui	a5,0xc201
    8000298c:	00a78533          	add	a0,a5,a0
    80002990:	00452503          	lw	a0,4(a0)
    80002994:	01010113          	addi	sp,sp,16
    80002998:	00008067          	ret

000000008000299c <plic_complete>:
    8000299c:	fe010113          	addi	sp,sp,-32
    800029a0:	00813823          	sd	s0,16(sp)
    800029a4:	00913423          	sd	s1,8(sp)
    800029a8:	00113c23          	sd	ra,24(sp)
    800029ac:	02010413          	addi	s0,sp,32
    800029b0:	00050493          	mv	s1,a0
    800029b4:	00000097          	auipc	ra,0x0
    800029b8:	9b4080e7          	jalr	-1612(ra) # 80002368 <cpuid>
    800029bc:	01813083          	ld	ra,24(sp)
    800029c0:	01013403          	ld	s0,16(sp)
    800029c4:	00d5179b          	slliw	a5,a0,0xd
    800029c8:	0c201737          	lui	a4,0xc201
    800029cc:	00f707b3          	add	a5,a4,a5
    800029d0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800029d4:	00813483          	ld	s1,8(sp)
    800029d8:	02010113          	addi	sp,sp,32
    800029dc:	00008067          	ret

00000000800029e0 <consolewrite>:
    800029e0:	fb010113          	addi	sp,sp,-80
    800029e4:	04813023          	sd	s0,64(sp)
    800029e8:	04113423          	sd	ra,72(sp)
    800029ec:	02913c23          	sd	s1,56(sp)
    800029f0:	03213823          	sd	s2,48(sp)
    800029f4:	03313423          	sd	s3,40(sp)
    800029f8:	03413023          	sd	s4,32(sp)
    800029fc:	01513c23          	sd	s5,24(sp)
    80002a00:	05010413          	addi	s0,sp,80
    80002a04:	06c05c63          	blez	a2,80002a7c <consolewrite+0x9c>
    80002a08:	00060993          	mv	s3,a2
    80002a0c:	00050a13          	mv	s4,a0
    80002a10:	00058493          	mv	s1,a1
    80002a14:	00000913          	li	s2,0
    80002a18:	fff00a93          	li	s5,-1
    80002a1c:	01c0006f          	j	80002a38 <consolewrite+0x58>
    80002a20:	fbf44503          	lbu	a0,-65(s0)
    80002a24:	0019091b          	addiw	s2,s2,1
    80002a28:	00148493          	addi	s1,s1,1
    80002a2c:	00001097          	auipc	ra,0x1
    80002a30:	a9c080e7          	jalr	-1380(ra) # 800034c8 <uartputc>
    80002a34:	03298063          	beq	s3,s2,80002a54 <consolewrite+0x74>
    80002a38:	00048613          	mv	a2,s1
    80002a3c:	00100693          	li	a3,1
    80002a40:	000a0593          	mv	a1,s4
    80002a44:	fbf40513          	addi	a0,s0,-65
    80002a48:	00000097          	auipc	ra,0x0
    80002a4c:	9d8080e7          	jalr	-1576(ra) # 80002420 <either_copyin>
    80002a50:	fd5518e3          	bne	a0,s5,80002a20 <consolewrite+0x40>
    80002a54:	04813083          	ld	ra,72(sp)
    80002a58:	04013403          	ld	s0,64(sp)
    80002a5c:	03813483          	ld	s1,56(sp)
    80002a60:	02813983          	ld	s3,40(sp)
    80002a64:	02013a03          	ld	s4,32(sp)
    80002a68:	01813a83          	ld	s5,24(sp)
    80002a6c:	00090513          	mv	a0,s2
    80002a70:	03013903          	ld	s2,48(sp)
    80002a74:	05010113          	addi	sp,sp,80
    80002a78:	00008067          	ret
    80002a7c:	00000913          	li	s2,0
    80002a80:	fd5ff06f          	j	80002a54 <consolewrite+0x74>

0000000080002a84 <consoleread>:
    80002a84:	f9010113          	addi	sp,sp,-112
    80002a88:	06813023          	sd	s0,96(sp)
    80002a8c:	04913c23          	sd	s1,88(sp)
    80002a90:	05213823          	sd	s2,80(sp)
    80002a94:	05313423          	sd	s3,72(sp)
    80002a98:	05413023          	sd	s4,64(sp)
    80002a9c:	03513c23          	sd	s5,56(sp)
    80002aa0:	03613823          	sd	s6,48(sp)
    80002aa4:	03713423          	sd	s7,40(sp)
    80002aa8:	03813023          	sd	s8,32(sp)
    80002aac:	06113423          	sd	ra,104(sp)
    80002ab0:	01913c23          	sd	s9,24(sp)
    80002ab4:	07010413          	addi	s0,sp,112
    80002ab8:	00060b93          	mv	s7,a2
    80002abc:	00050913          	mv	s2,a0
    80002ac0:	00058c13          	mv	s8,a1
    80002ac4:	00060b1b          	sext.w	s6,a2
    80002ac8:	00004497          	auipc	s1,0x4
    80002acc:	f5048493          	addi	s1,s1,-176 # 80006a18 <cons>
    80002ad0:	00400993          	li	s3,4
    80002ad4:	fff00a13          	li	s4,-1
    80002ad8:	00a00a93          	li	s5,10
    80002adc:	05705e63          	blez	s7,80002b38 <consoleread+0xb4>
    80002ae0:	09c4a703          	lw	a4,156(s1)
    80002ae4:	0984a783          	lw	a5,152(s1)
    80002ae8:	0007071b          	sext.w	a4,a4
    80002aec:	08e78463          	beq	a5,a4,80002b74 <consoleread+0xf0>
    80002af0:	07f7f713          	andi	a4,a5,127
    80002af4:	00e48733          	add	a4,s1,a4
    80002af8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002afc:	0017869b          	addiw	a3,a5,1
    80002b00:	08d4ac23          	sw	a3,152(s1)
    80002b04:	00070c9b          	sext.w	s9,a4
    80002b08:	0b370663          	beq	a4,s3,80002bb4 <consoleread+0x130>
    80002b0c:	00100693          	li	a3,1
    80002b10:	f9f40613          	addi	a2,s0,-97
    80002b14:	000c0593          	mv	a1,s8
    80002b18:	00090513          	mv	a0,s2
    80002b1c:	f8e40fa3          	sb	a4,-97(s0)
    80002b20:	00000097          	auipc	ra,0x0
    80002b24:	8b4080e7          	jalr	-1868(ra) # 800023d4 <either_copyout>
    80002b28:	01450863          	beq	a0,s4,80002b38 <consoleread+0xb4>
    80002b2c:	001c0c13          	addi	s8,s8,1
    80002b30:	fffb8b9b          	addiw	s7,s7,-1
    80002b34:	fb5c94e3          	bne	s9,s5,80002adc <consoleread+0x58>
    80002b38:	000b851b          	sext.w	a0,s7
    80002b3c:	06813083          	ld	ra,104(sp)
    80002b40:	06013403          	ld	s0,96(sp)
    80002b44:	05813483          	ld	s1,88(sp)
    80002b48:	05013903          	ld	s2,80(sp)
    80002b4c:	04813983          	ld	s3,72(sp)
    80002b50:	04013a03          	ld	s4,64(sp)
    80002b54:	03813a83          	ld	s5,56(sp)
    80002b58:	02813b83          	ld	s7,40(sp)
    80002b5c:	02013c03          	ld	s8,32(sp)
    80002b60:	01813c83          	ld	s9,24(sp)
    80002b64:	40ab053b          	subw	a0,s6,a0
    80002b68:	03013b03          	ld	s6,48(sp)
    80002b6c:	07010113          	addi	sp,sp,112
    80002b70:	00008067          	ret
    80002b74:	00001097          	auipc	ra,0x1
    80002b78:	1d8080e7          	jalr	472(ra) # 80003d4c <push_on>
    80002b7c:	0984a703          	lw	a4,152(s1)
    80002b80:	09c4a783          	lw	a5,156(s1)
    80002b84:	0007879b          	sext.w	a5,a5
    80002b88:	fef70ce3          	beq	a4,a5,80002b80 <consoleread+0xfc>
    80002b8c:	00001097          	auipc	ra,0x1
    80002b90:	234080e7          	jalr	564(ra) # 80003dc0 <pop_on>
    80002b94:	0984a783          	lw	a5,152(s1)
    80002b98:	07f7f713          	andi	a4,a5,127
    80002b9c:	00e48733          	add	a4,s1,a4
    80002ba0:	01874703          	lbu	a4,24(a4)
    80002ba4:	0017869b          	addiw	a3,a5,1
    80002ba8:	08d4ac23          	sw	a3,152(s1)
    80002bac:	00070c9b          	sext.w	s9,a4
    80002bb0:	f5371ee3          	bne	a4,s3,80002b0c <consoleread+0x88>
    80002bb4:	000b851b          	sext.w	a0,s7
    80002bb8:	f96bf2e3          	bgeu	s7,s6,80002b3c <consoleread+0xb8>
    80002bbc:	08f4ac23          	sw	a5,152(s1)
    80002bc0:	f7dff06f          	j	80002b3c <consoleread+0xb8>

0000000080002bc4 <consputc>:
    80002bc4:	10000793          	li	a5,256
    80002bc8:	00f50663          	beq	a0,a5,80002bd4 <consputc+0x10>
    80002bcc:	00001317          	auipc	t1,0x1
    80002bd0:	9f430067          	jr	-1548(t1) # 800035c0 <uartputc_sync>
    80002bd4:	ff010113          	addi	sp,sp,-16
    80002bd8:	00113423          	sd	ra,8(sp)
    80002bdc:	00813023          	sd	s0,0(sp)
    80002be0:	01010413          	addi	s0,sp,16
    80002be4:	00800513          	li	a0,8
    80002be8:	00001097          	auipc	ra,0x1
    80002bec:	9d8080e7          	jalr	-1576(ra) # 800035c0 <uartputc_sync>
    80002bf0:	02000513          	li	a0,32
    80002bf4:	00001097          	auipc	ra,0x1
    80002bf8:	9cc080e7          	jalr	-1588(ra) # 800035c0 <uartputc_sync>
    80002bfc:	00013403          	ld	s0,0(sp)
    80002c00:	00813083          	ld	ra,8(sp)
    80002c04:	00800513          	li	a0,8
    80002c08:	01010113          	addi	sp,sp,16
    80002c0c:	00001317          	auipc	t1,0x1
    80002c10:	9b430067          	jr	-1612(t1) # 800035c0 <uartputc_sync>

0000000080002c14 <consoleintr>:
    80002c14:	fe010113          	addi	sp,sp,-32
    80002c18:	00813823          	sd	s0,16(sp)
    80002c1c:	00913423          	sd	s1,8(sp)
    80002c20:	01213023          	sd	s2,0(sp)
    80002c24:	00113c23          	sd	ra,24(sp)
    80002c28:	02010413          	addi	s0,sp,32
    80002c2c:	00004917          	auipc	s2,0x4
    80002c30:	dec90913          	addi	s2,s2,-532 # 80006a18 <cons>
    80002c34:	00050493          	mv	s1,a0
    80002c38:	00090513          	mv	a0,s2
    80002c3c:	00001097          	auipc	ra,0x1
    80002c40:	e40080e7          	jalr	-448(ra) # 80003a7c <acquire>
    80002c44:	02048c63          	beqz	s1,80002c7c <consoleintr+0x68>
    80002c48:	0a092783          	lw	a5,160(s2)
    80002c4c:	09892703          	lw	a4,152(s2)
    80002c50:	07f00693          	li	a3,127
    80002c54:	40e7873b          	subw	a4,a5,a4
    80002c58:	02e6e263          	bltu	a3,a4,80002c7c <consoleintr+0x68>
    80002c5c:	00d00713          	li	a4,13
    80002c60:	04e48063          	beq	s1,a4,80002ca0 <consoleintr+0x8c>
    80002c64:	07f7f713          	andi	a4,a5,127
    80002c68:	00e90733          	add	a4,s2,a4
    80002c6c:	0017879b          	addiw	a5,a5,1
    80002c70:	0af92023          	sw	a5,160(s2)
    80002c74:	00970c23          	sb	s1,24(a4)
    80002c78:	08f92e23          	sw	a5,156(s2)
    80002c7c:	01013403          	ld	s0,16(sp)
    80002c80:	01813083          	ld	ra,24(sp)
    80002c84:	00813483          	ld	s1,8(sp)
    80002c88:	00013903          	ld	s2,0(sp)
    80002c8c:	00004517          	auipc	a0,0x4
    80002c90:	d8c50513          	addi	a0,a0,-628 # 80006a18 <cons>
    80002c94:	02010113          	addi	sp,sp,32
    80002c98:	00001317          	auipc	t1,0x1
    80002c9c:	eb030067          	jr	-336(t1) # 80003b48 <release>
    80002ca0:	00a00493          	li	s1,10
    80002ca4:	fc1ff06f          	j	80002c64 <consoleintr+0x50>

0000000080002ca8 <consoleinit>:
    80002ca8:	fe010113          	addi	sp,sp,-32
    80002cac:	00113c23          	sd	ra,24(sp)
    80002cb0:	00813823          	sd	s0,16(sp)
    80002cb4:	00913423          	sd	s1,8(sp)
    80002cb8:	02010413          	addi	s0,sp,32
    80002cbc:	00004497          	auipc	s1,0x4
    80002cc0:	d5c48493          	addi	s1,s1,-676 # 80006a18 <cons>
    80002cc4:	00048513          	mv	a0,s1
    80002cc8:	00002597          	auipc	a1,0x2
    80002ccc:	56858593          	addi	a1,a1,1384 # 80005230 <_ZZ12printIntegermE6digits+0x138>
    80002cd0:	00001097          	auipc	ra,0x1
    80002cd4:	d88080e7          	jalr	-632(ra) # 80003a58 <initlock>
    80002cd8:	00000097          	auipc	ra,0x0
    80002cdc:	7ac080e7          	jalr	1964(ra) # 80003484 <uartinit>
    80002ce0:	01813083          	ld	ra,24(sp)
    80002ce4:	01013403          	ld	s0,16(sp)
    80002ce8:	00000797          	auipc	a5,0x0
    80002cec:	d9c78793          	addi	a5,a5,-612 # 80002a84 <consoleread>
    80002cf0:	0af4bc23          	sd	a5,184(s1)
    80002cf4:	00000797          	auipc	a5,0x0
    80002cf8:	cec78793          	addi	a5,a5,-788 # 800029e0 <consolewrite>
    80002cfc:	0cf4b023          	sd	a5,192(s1)
    80002d00:	00813483          	ld	s1,8(sp)
    80002d04:	02010113          	addi	sp,sp,32
    80002d08:	00008067          	ret

0000000080002d0c <console_read>:
    80002d0c:	ff010113          	addi	sp,sp,-16
    80002d10:	00813423          	sd	s0,8(sp)
    80002d14:	01010413          	addi	s0,sp,16
    80002d18:	00813403          	ld	s0,8(sp)
    80002d1c:	00004317          	auipc	t1,0x4
    80002d20:	db433303          	ld	t1,-588(t1) # 80006ad0 <devsw+0x10>
    80002d24:	01010113          	addi	sp,sp,16
    80002d28:	00030067          	jr	t1

0000000080002d2c <console_write>:
    80002d2c:	ff010113          	addi	sp,sp,-16
    80002d30:	00813423          	sd	s0,8(sp)
    80002d34:	01010413          	addi	s0,sp,16
    80002d38:	00813403          	ld	s0,8(sp)
    80002d3c:	00004317          	auipc	t1,0x4
    80002d40:	d9c33303          	ld	t1,-612(t1) # 80006ad8 <devsw+0x18>
    80002d44:	01010113          	addi	sp,sp,16
    80002d48:	00030067          	jr	t1

0000000080002d4c <panic>:
    80002d4c:	fe010113          	addi	sp,sp,-32
    80002d50:	00113c23          	sd	ra,24(sp)
    80002d54:	00813823          	sd	s0,16(sp)
    80002d58:	00913423          	sd	s1,8(sp)
    80002d5c:	02010413          	addi	s0,sp,32
    80002d60:	00050493          	mv	s1,a0
    80002d64:	00002517          	auipc	a0,0x2
    80002d68:	4d450513          	addi	a0,a0,1236 # 80005238 <_ZZ12printIntegermE6digits+0x140>
    80002d6c:	00004797          	auipc	a5,0x4
    80002d70:	e007a623          	sw	zero,-500(a5) # 80006b78 <pr+0x18>
    80002d74:	00000097          	auipc	ra,0x0
    80002d78:	034080e7          	jalr	52(ra) # 80002da8 <__printf>
    80002d7c:	00048513          	mv	a0,s1
    80002d80:	00000097          	auipc	ra,0x0
    80002d84:	028080e7          	jalr	40(ra) # 80002da8 <__printf>
    80002d88:	00002517          	auipc	a0,0x2
    80002d8c:	36850513          	addi	a0,a0,872 # 800050f0 <CONSOLE_STATUS+0xe0>
    80002d90:	00000097          	auipc	ra,0x0
    80002d94:	018080e7          	jalr	24(ra) # 80002da8 <__printf>
    80002d98:	00100793          	li	a5,1
    80002d9c:	00003717          	auipc	a4,0x3
    80002da0:	b4f72623          	sw	a5,-1204(a4) # 800058e8 <panicked>
    80002da4:	0000006f          	j	80002da4 <panic+0x58>

0000000080002da8 <__printf>:
    80002da8:	f3010113          	addi	sp,sp,-208
    80002dac:	08813023          	sd	s0,128(sp)
    80002db0:	07313423          	sd	s3,104(sp)
    80002db4:	09010413          	addi	s0,sp,144
    80002db8:	05813023          	sd	s8,64(sp)
    80002dbc:	08113423          	sd	ra,136(sp)
    80002dc0:	06913c23          	sd	s1,120(sp)
    80002dc4:	07213823          	sd	s2,112(sp)
    80002dc8:	07413023          	sd	s4,96(sp)
    80002dcc:	05513c23          	sd	s5,88(sp)
    80002dd0:	05613823          	sd	s6,80(sp)
    80002dd4:	05713423          	sd	s7,72(sp)
    80002dd8:	03913c23          	sd	s9,56(sp)
    80002ddc:	03a13823          	sd	s10,48(sp)
    80002de0:	03b13423          	sd	s11,40(sp)
    80002de4:	00004317          	auipc	t1,0x4
    80002de8:	d7c30313          	addi	t1,t1,-644 # 80006b60 <pr>
    80002dec:	01832c03          	lw	s8,24(t1)
    80002df0:	00b43423          	sd	a1,8(s0)
    80002df4:	00c43823          	sd	a2,16(s0)
    80002df8:	00d43c23          	sd	a3,24(s0)
    80002dfc:	02e43023          	sd	a4,32(s0)
    80002e00:	02f43423          	sd	a5,40(s0)
    80002e04:	03043823          	sd	a6,48(s0)
    80002e08:	03143c23          	sd	a7,56(s0)
    80002e0c:	00050993          	mv	s3,a0
    80002e10:	4a0c1663          	bnez	s8,800032bc <__printf+0x514>
    80002e14:	60098c63          	beqz	s3,8000342c <__printf+0x684>
    80002e18:	0009c503          	lbu	a0,0(s3)
    80002e1c:	00840793          	addi	a5,s0,8
    80002e20:	f6f43c23          	sd	a5,-136(s0)
    80002e24:	00000493          	li	s1,0
    80002e28:	22050063          	beqz	a0,80003048 <__printf+0x2a0>
    80002e2c:	00002a37          	lui	s4,0x2
    80002e30:	00018ab7          	lui	s5,0x18
    80002e34:	000f4b37          	lui	s6,0xf4
    80002e38:	00989bb7          	lui	s7,0x989
    80002e3c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002e40:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002e44:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002e48:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002e4c:	00148c9b          	addiw	s9,s1,1
    80002e50:	02500793          	li	a5,37
    80002e54:	01998933          	add	s2,s3,s9
    80002e58:	38f51263          	bne	a0,a5,800031dc <__printf+0x434>
    80002e5c:	00094783          	lbu	a5,0(s2)
    80002e60:	00078c9b          	sext.w	s9,a5
    80002e64:	1e078263          	beqz	a5,80003048 <__printf+0x2a0>
    80002e68:	0024849b          	addiw	s1,s1,2
    80002e6c:	07000713          	li	a4,112
    80002e70:	00998933          	add	s2,s3,s1
    80002e74:	38e78a63          	beq	a5,a4,80003208 <__printf+0x460>
    80002e78:	20f76863          	bltu	a4,a5,80003088 <__printf+0x2e0>
    80002e7c:	42a78863          	beq	a5,a0,800032ac <__printf+0x504>
    80002e80:	06400713          	li	a4,100
    80002e84:	40e79663          	bne	a5,a4,80003290 <__printf+0x4e8>
    80002e88:	f7843783          	ld	a5,-136(s0)
    80002e8c:	0007a603          	lw	a2,0(a5)
    80002e90:	00878793          	addi	a5,a5,8
    80002e94:	f6f43c23          	sd	a5,-136(s0)
    80002e98:	42064a63          	bltz	a2,800032cc <__printf+0x524>
    80002e9c:	00a00713          	li	a4,10
    80002ea0:	02e677bb          	remuw	a5,a2,a4
    80002ea4:	00002d97          	auipc	s11,0x2
    80002ea8:	3bcd8d93          	addi	s11,s11,956 # 80005260 <digits>
    80002eac:	00900593          	li	a1,9
    80002eb0:	0006051b          	sext.w	a0,a2
    80002eb4:	00000c93          	li	s9,0
    80002eb8:	02079793          	slli	a5,a5,0x20
    80002ebc:	0207d793          	srli	a5,a5,0x20
    80002ec0:	00fd87b3          	add	a5,s11,a5
    80002ec4:	0007c783          	lbu	a5,0(a5)
    80002ec8:	02e656bb          	divuw	a3,a2,a4
    80002ecc:	f8f40023          	sb	a5,-128(s0)
    80002ed0:	14c5d863          	bge	a1,a2,80003020 <__printf+0x278>
    80002ed4:	06300593          	li	a1,99
    80002ed8:	00100c93          	li	s9,1
    80002edc:	02e6f7bb          	remuw	a5,a3,a4
    80002ee0:	02079793          	slli	a5,a5,0x20
    80002ee4:	0207d793          	srli	a5,a5,0x20
    80002ee8:	00fd87b3          	add	a5,s11,a5
    80002eec:	0007c783          	lbu	a5,0(a5)
    80002ef0:	02e6d73b          	divuw	a4,a3,a4
    80002ef4:	f8f400a3          	sb	a5,-127(s0)
    80002ef8:	12a5f463          	bgeu	a1,a0,80003020 <__printf+0x278>
    80002efc:	00a00693          	li	a3,10
    80002f00:	00900593          	li	a1,9
    80002f04:	02d777bb          	remuw	a5,a4,a3
    80002f08:	02079793          	slli	a5,a5,0x20
    80002f0c:	0207d793          	srli	a5,a5,0x20
    80002f10:	00fd87b3          	add	a5,s11,a5
    80002f14:	0007c503          	lbu	a0,0(a5)
    80002f18:	02d757bb          	divuw	a5,a4,a3
    80002f1c:	f8a40123          	sb	a0,-126(s0)
    80002f20:	48e5f263          	bgeu	a1,a4,800033a4 <__printf+0x5fc>
    80002f24:	06300513          	li	a0,99
    80002f28:	02d7f5bb          	remuw	a1,a5,a3
    80002f2c:	02059593          	slli	a1,a1,0x20
    80002f30:	0205d593          	srli	a1,a1,0x20
    80002f34:	00bd85b3          	add	a1,s11,a1
    80002f38:	0005c583          	lbu	a1,0(a1)
    80002f3c:	02d7d7bb          	divuw	a5,a5,a3
    80002f40:	f8b401a3          	sb	a1,-125(s0)
    80002f44:	48e57263          	bgeu	a0,a4,800033c8 <__printf+0x620>
    80002f48:	3e700513          	li	a0,999
    80002f4c:	02d7f5bb          	remuw	a1,a5,a3
    80002f50:	02059593          	slli	a1,a1,0x20
    80002f54:	0205d593          	srli	a1,a1,0x20
    80002f58:	00bd85b3          	add	a1,s11,a1
    80002f5c:	0005c583          	lbu	a1,0(a1)
    80002f60:	02d7d7bb          	divuw	a5,a5,a3
    80002f64:	f8b40223          	sb	a1,-124(s0)
    80002f68:	46e57663          	bgeu	a0,a4,800033d4 <__printf+0x62c>
    80002f6c:	02d7f5bb          	remuw	a1,a5,a3
    80002f70:	02059593          	slli	a1,a1,0x20
    80002f74:	0205d593          	srli	a1,a1,0x20
    80002f78:	00bd85b3          	add	a1,s11,a1
    80002f7c:	0005c583          	lbu	a1,0(a1)
    80002f80:	02d7d7bb          	divuw	a5,a5,a3
    80002f84:	f8b402a3          	sb	a1,-123(s0)
    80002f88:	46ea7863          	bgeu	s4,a4,800033f8 <__printf+0x650>
    80002f8c:	02d7f5bb          	remuw	a1,a5,a3
    80002f90:	02059593          	slli	a1,a1,0x20
    80002f94:	0205d593          	srli	a1,a1,0x20
    80002f98:	00bd85b3          	add	a1,s11,a1
    80002f9c:	0005c583          	lbu	a1,0(a1)
    80002fa0:	02d7d7bb          	divuw	a5,a5,a3
    80002fa4:	f8b40323          	sb	a1,-122(s0)
    80002fa8:	3eeaf863          	bgeu	s5,a4,80003398 <__printf+0x5f0>
    80002fac:	02d7f5bb          	remuw	a1,a5,a3
    80002fb0:	02059593          	slli	a1,a1,0x20
    80002fb4:	0205d593          	srli	a1,a1,0x20
    80002fb8:	00bd85b3          	add	a1,s11,a1
    80002fbc:	0005c583          	lbu	a1,0(a1)
    80002fc0:	02d7d7bb          	divuw	a5,a5,a3
    80002fc4:	f8b403a3          	sb	a1,-121(s0)
    80002fc8:	42eb7e63          	bgeu	s6,a4,80003404 <__printf+0x65c>
    80002fcc:	02d7f5bb          	remuw	a1,a5,a3
    80002fd0:	02059593          	slli	a1,a1,0x20
    80002fd4:	0205d593          	srli	a1,a1,0x20
    80002fd8:	00bd85b3          	add	a1,s11,a1
    80002fdc:	0005c583          	lbu	a1,0(a1)
    80002fe0:	02d7d7bb          	divuw	a5,a5,a3
    80002fe4:	f8b40423          	sb	a1,-120(s0)
    80002fe8:	42ebfc63          	bgeu	s7,a4,80003420 <__printf+0x678>
    80002fec:	02079793          	slli	a5,a5,0x20
    80002ff0:	0207d793          	srli	a5,a5,0x20
    80002ff4:	00fd8db3          	add	s11,s11,a5
    80002ff8:	000dc703          	lbu	a4,0(s11)
    80002ffc:	00a00793          	li	a5,10
    80003000:	00900c93          	li	s9,9
    80003004:	f8e404a3          	sb	a4,-119(s0)
    80003008:	00065c63          	bgez	a2,80003020 <__printf+0x278>
    8000300c:	f9040713          	addi	a4,s0,-112
    80003010:	00f70733          	add	a4,a4,a5
    80003014:	02d00693          	li	a3,45
    80003018:	fed70823          	sb	a3,-16(a4)
    8000301c:	00078c93          	mv	s9,a5
    80003020:	f8040793          	addi	a5,s0,-128
    80003024:	01978cb3          	add	s9,a5,s9
    80003028:	f7f40d13          	addi	s10,s0,-129
    8000302c:	000cc503          	lbu	a0,0(s9)
    80003030:	fffc8c93          	addi	s9,s9,-1
    80003034:	00000097          	auipc	ra,0x0
    80003038:	b90080e7          	jalr	-1136(ra) # 80002bc4 <consputc>
    8000303c:	ffac98e3          	bne	s9,s10,8000302c <__printf+0x284>
    80003040:	00094503          	lbu	a0,0(s2)
    80003044:	e00514e3          	bnez	a0,80002e4c <__printf+0xa4>
    80003048:	1a0c1663          	bnez	s8,800031f4 <__printf+0x44c>
    8000304c:	08813083          	ld	ra,136(sp)
    80003050:	08013403          	ld	s0,128(sp)
    80003054:	07813483          	ld	s1,120(sp)
    80003058:	07013903          	ld	s2,112(sp)
    8000305c:	06813983          	ld	s3,104(sp)
    80003060:	06013a03          	ld	s4,96(sp)
    80003064:	05813a83          	ld	s5,88(sp)
    80003068:	05013b03          	ld	s6,80(sp)
    8000306c:	04813b83          	ld	s7,72(sp)
    80003070:	04013c03          	ld	s8,64(sp)
    80003074:	03813c83          	ld	s9,56(sp)
    80003078:	03013d03          	ld	s10,48(sp)
    8000307c:	02813d83          	ld	s11,40(sp)
    80003080:	0d010113          	addi	sp,sp,208
    80003084:	00008067          	ret
    80003088:	07300713          	li	a4,115
    8000308c:	1ce78a63          	beq	a5,a4,80003260 <__printf+0x4b8>
    80003090:	07800713          	li	a4,120
    80003094:	1ee79e63          	bne	a5,a4,80003290 <__printf+0x4e8>
    80003098:	f7843783          	ld	a5,-136(s0)
    8000309c:	0007a703          	lw	a4,0(a5)
    800030a0:	00878793          	addi	a5,a5,8
    800030a4:	f6f43c23          	sd	a5,-136(s0)
    800030a8:	28074263          	bltz	a4,8000332c <__printf+0x584>
    800030ac:	00002d97          	auipc	s11,0x2
    800030b0:	1b4d8d93          	addi	s11,s11,436 # 80005260 <digits>
    800030b4:	00f77793          	andi	a5,a4,15
    800030b8:	00fd87b3          	add	a5,s11,a5
    800030bc:	0007c683          	lbu	a3,0(a5)
    800030c0:	00f00613          	li	a2,15
    800030c4:	0007079b          	sext.w	a5,a4
    800030c8:	f8d40023          	sb	a3,-128(s0)
    800030cc:	0047559b          	srliw	a1,a4,0x4
    800030d0:	0047569b          	srliw	a3,a4,0x4
    800030d4:	00000c93          	li	s9,0
    800030d8:	0ee65063          	bge	a2,a4,800031b8 <__printf+0x410>
    800030dc:	00f6f693          	andi	a3,a3,15
    800030e0:	00dd86b3          	add	a3,s11,a3
    800030e4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800030e8:	0087d79b          	srliw	a5,a5,0x8
    800030ec:	00100c93          	li	s9,1
    800030f0:	f8d400a3          	sb	a3,-127(s0)
    800030f4:	0cb67263          	bgeu	a2,a1,800031b8 <__printf+0x410>
    800030f8:	00f7f693          	andi	a3,a5,15
    800030fc:	00dd86b3          	add	a3,s11,a3
    80003100:	0006c583          	lbu	a1,0(a3)
    80003104:	00f00613          	li	a2,15
    80003108:	0047d69b          	srliw	a3,a5,0x4
    8000310c:	f8b40123          	sb	a1,-126(s0)
    80003110:	0047d593          	srli	a1,a5,0x4
    80003114:	28f67e63          	bgeu	a2,a5,800033b0 <__printf+0x608>
    80003118:	00f6f693          	andi	a3,a3,15
    8000311c:	00dd86b3          	add	a3,s11,a3
    80003120:	0006c503          	lbu	a0,0(a3)
    80003124:	0087d813          	srli	a6,a5,0x8
    80003128:	0087d69b          	srliw	a3,a5,0x8
    8000312c:	f8a401a3          	sb	a0,-125(s0)
    80003130:	28b67663          	bgeu	a2,a1,800033bc <__printf+0x614>
    80003134:	00f6f693          	andi	a3,a3,15
    80003138:	00dd86b3          	add	a3,s11,a3
    8000313c:	0006c583          	lbu	a1,0(a3)
    80003140:	00c7d513          	srli	a0,a5,0xc
    80003144:	00c7d69b          	srliw	a3,a5,0xc
    80003148:	f8b40223          	sb	a1,-124(s0)
    8000314c:	29067a63          	bgeu	a2,a6,800033e0 <__printf+0x638>
    80003150:	00f6f693          	andi	a3,a3,15
    80003154:	00dd86b3          	add	a3,s11,a3
    80003158:	0006c583          	lbu	a1,0(a3)
    8000315c:	0107d813          	srli	a6,a5,0x10
    80003160:	0107d69b          	srliw	a3,a5,0x10
    80003164:	f8b402a3          	sb	a1,-123(s0)
    80003168:	28a67263          	bgeu	a2,a0,800033ec <__printf+0x644>
    8000316c:	00f6f693          	andi	a3,a3,15
    80003170:	00dd86b3          	add	a3,s11,a3
    80003174:	0006c683          	lbu	a3,0(a3)
    80003178:	0147d79b          	srliw	a5,a5,0x14
    8000317c:	f8d40323          	sb	a3,-122(s0)
    80003180:	21067663          	bgeu	a2,a6,8000338c <__printf+0x5e4>
    80003184:	02079793          	slli	a5,a5,0x20
    80003188:	0207d793          	srli	a5,a5,0x20
    8000318c:	00fd8db3          	add	s11,s11,a5
    80003190:	000dc683          	lbu	a3,0(s11)
    80003194:	00800793          	li	a5,8
    80003198:	00700c93          	li	s9,7
    8000319c:	f8d403a3          	sb	a3,-121(s0)
    800031a0:	00075c63          	bgez	a4,800031b8 <__printf+0x410>
    800031a4:	f9040713          	addi	a4,s0,-112
    800031a8:	00f70733          	add	a4,a4,a5
    800031ac:	02d00693          	li	a3,45
    800031b0:	fed70823          	sb	a3,-16(a4)
    800031b4:	00078c93          	mv	s9,a5
    800031b8:	f8040793          	addi	a5,s0,-128
    800031bc:	01978cb3          	add	s9,a5,s9
    800031c0:	f7f40d13          	addi	s10,s0,-129
    800031c4:	000cc503          	lbu	a0,0(s9)
    800031c8:	fffc8c93          	addi	s9,s9,-1
    800031cc:	00000097          	auipc	ra,0x0
    800031d0:	9f8080e7          	jalr	-1544(ra) # 80002bc4 <consputc>
    800031d4:	ff9d18e3          	bne	s10,s9,800031c4 <__printf+0x41c>
    800031d8:	0100006f          	j	800031e8 <__printf+0x440>
    800031dc:	00000097          	auipc	ra,0x0
    800031e0:	9e8080e7          	jalr	-1560(ra) # 80002bc4 <consputc>
    800031e4:	000c8493          	mv	s1,s9
    800031e8:	00094503          	lbu	a0,0(s2)
    800031ec:	c60510e3          	bnez	a0,80002e4c <__printf+0xa4>
    800031f0:	e40c0ee3          	beqz	s8,8000304c <__printf+0x2a4>
    800031f4:	00004517          	auipc	a0,0x4
    800031f8:	96c50513          	addi	a0,a0,-1684 # 80006b60 <pr>
    800031fc:	00001097          	auipc	ra,0x1
    80003200:	94c080e7          	jalr	-1716(ra) # 80003b48 <release>
    80003204:	e49ff06f          	j	8000304c <__printf+0x2a4>
    80003208:	f7843783          	ld	a5,-136(s0)
    8000320c:	03000513          	li	a0,48
    80003210:	01000d13          	li	s10,16
    80003214:	00878713          	addi	a4,a5,8
    80003218:	0007bc83          	ld	s9,0(a5)
    8000321c:	f6e43c23          	sd	a4,-136(s0)
    80003220:	00000097          	auipc	ra,0x0
    80003224:	9a4080e7          	jalr	-1628(ra) # 80002bc4 <consputc>
    80003228:	07800513          	li	a0,120
    8000322c:	00000097          	auipc	ra,0x0
    80003230:	998080e7          	jalr	-1640(ra) # 80002bc4 <consputc>
    80003234:	00002d97          	auipc	s11,0x2
    80003238:	02cd8d93          	addi	s11,s11,44 # 80005260 <digits>
    8000323c:	03ccd793          	srli	a5,s9,0x3c
    80003240:	00fd87b3          	add	a5,s11,a5
    80003244:	0007c503          	lbu	a0,0(a5)
    80003248:	fffd0d1b          	addiw	s10,s10,-1
    8000324c:	004c9c93          	slli	s9,s9,0x4
    80003250:	00000097          	auipc	ra,0x0
    80003254:	974080e7          	jalr	-1676(ra) # 80002bc4 <consputc>
    80003258:	fe0d12e3          	bnez	s10,8000323c <__printf+0x494>
    8000325c:	f8dff06f          	j	800031e8 <__printf+0x440>
    80003260:	f7843783          	ld	a5,-136(s0)
    80003264:	0007bc83          	ld	s9,0(a5)
    80003268:	00878793          	addi	a5,a5,8
    8000326c:	f6f43c23          	sd	a5,-136(s0)
    80003270:	000c9a63          	bnez	s9,80003284 <__printf+0x4dc>
    80003274:	1080006f          	j	8000337c <__printf+0x5d4>
    80003278:	001c8c93          	addi	s9,s9,1
    8000327c:	00000097          	auipc	ra,0x0
    80003280:	948080e7          	jalr	-1720(ra) # 80002bc4 <consputc>
    80003284:	000cc503          	lbu	a0,0(s9)
    80003288:	fe0518e3          	bnez	a0,80003278 <__printf+0x4d0>
    8000328c:	f5dff06f          	j	800031e8 <__printf+0x440>
    80003290:	02500513          	li	a0,37
    80003294:	00000097          	auipc	ra,0x0
    80003298:	930080e7          	jalr	-1744(ra) # 80002bc4 <consputc>
    8000329c:	000c8513          	mv	a0,s9
    800032a0:	00000097          	auipc	ra,0x0
    800032a4:	924080e7          	jalr	-1756(ra) # 80002bc4 <consputc>
    800032a8:	f41ff06f          	j	800031e8 <__printf+0x440>
    800032ac:	02500513          	li	a0,37
    800032b0:	00000097          	auipc	ra,0x0
    800032b4:	914080e7          	jalr	-1772(ra) # 80002bc4 <consputc>
    800032b8:	f31ff06f          	j	800031e8 <__printf+0x440>
    800032bc:	00030513          	mv	a0,t1
    800032c0:	00000097          	auipc	ra,0x0
    800032c4:	7bc080e7          	jalr	1980(ra) # 80003a7c <acquire>
    800032c8:	b4dff06f          	j	80002e14 <__printf+0x6c>
    800032cc:	40c0053b          	negw	a0,a2
    800032d0:	00a00713          	li	a4,10
    800032d4:	02e576bb          	remuw	a3,a0,a4
    800032d8:	00002d97          	auipc	s11,0x2
    800032dc:	f88d8d93          	addi	s11,s11,-120 # 80005260 <digits>
    800032e0:	ff700593          	li	a1,-9
    800032e4:	02069693          	slli	a3,a3,0x20
    800032e8:	0206d693          	srli	a3,a3,0x20
    800032ec:	00dd86b3          	add	a3,s11,a3
    800032f0:	0006c683          	lbu	a3,0(a3)
    800032f4:	02e557bb          	divuw	a5,a0,a4
    800032f8:	f8d40023          	sb	a3,-128(s0)
    800032fc:	10b65e63          	bge	a2,a1,80003418 <__printf+0x670>
    80003300:	06300593          	li	a1,99
    80003304:	02e7f6bb          	remuw	a3,a5,a4
    80003308:	02069693          	slli	a3,a3,0x20
    8000330c:	0206d693          	srli	a3,a3,0x20
    80003310:	00dd86b3          	add	a3,s11,a3
    80003314:	0006c683          	lbu	a3,0(a3)
    80003318:	02e7d73b          	divuw	a4,a5,a4
    8000331c:	00200793          	li	a5,2
    80003320:	f8d400a3          	sb	a3,-127(s0)
    80003324:	bca5ece3          	bltu	a1,a0,80002efc <__printf+0x154>
    80003328:	ce5ff06f          	j	8000300c <__printf+0x264>
    8000332c:	40e007bb          	negw	a5,a4
    80003330:	00002d97          	auipc	s11,0x2
    80003334:	f30d8d93          	addi	s11,s11,-208 # 80005260 <digits>
    80003338:	00f7f693          	andi	a3,a5,15
    8000333c:	00dd86b3          	add	a3,s11,a3
    80003340:	0006c583          	lbu	a1,0(a3)
    80003344:	ff100613          	li	a2,-15
    80003348:	0047d69b          	srliw	a3,a5,0x4
    8000334c:	f8b40023          	sb	a1,-128(s0)
    80003350:	0047d59b          	srliw	a1,a5,0x4
    80003354:	0ac75e63          	bge	a4,a2,80003410 <__printf+0x668>
    80003358:	00f6f693          	andi	a3,a3,15
    8000335c:	00dd86b3          	add	a3,s11,a3
    80003360:	0006c603          	lbu	a2,0(a3)
    80003364:	00f00693          	li	a3,15
    80003368:	0087d79b          	srliw	a5,a5,0x8
    8000336c:	f8c400a3          	sb	a2,-127(s0)
    80003370:	d8b6e4e3          	bltu	a3,a1,800030f8 <__printf+0x350>
    80003374:	00200793          	li	a5,2
    80003378:	e2dff06f          	j	800031a4 <__printf+0x3fc>
    8000337c:	00002c97          	auipc	s9,0x2
    80003380:	ec4c8c93          	addi	s9,s9,-316 # 80005240 <_ZZ12printIntegermE6digits+0x148>
    80003384:	02800513          	li	a0,40
    80003388:	ef1ff06f          	j	80003278 <__printf+0x4d0>
    8000338c:	00700793          	li	a5,7
    80003390:	00600c93          	li	s9,6
    80003394:	e0dff06f          	j	800031a0 <__printf+0x3f8>
    80003398:	00700793          	li	a5,7
    8000339c:	00600c93          	li	s9,6
    800033a0:	c69ff06f          	j	80003008 <__printf+0x260>
    800033a4:	00300793          	li	a5,3
    800033a8:	00200c93          	li	s9,2
    800033ac:	c5dff06f          	j	80003008 <__printf+0x260>
    800033b0:	00300793          	li	a5,3
    800033b4:	00200c93          	li	s9,2
    800033b8:	de9ff06f          	j	800031a0 <__printf+0x3f8>
    800033bc:	00400793          	li	a5,4
    800033c0:	00300c93          	li	s9,3
    800033c4:	dddff06f          	j	800031a0 <__printf+0x3f8>
    800033c8:	00400793          	li	a5,4
    800033cc:	00300c93          	li	s9,3
    800033d0:	c39ff06f          	j	80003008 <__printf+0x260>
    800033d4:	00500793          	li	a5,5
    800033d8:	00400c93          	li	s9,4
    800033dc:	c2dff06f          	j	80003008 <__printf+0x260>
    800033e0:	00500793          	li	a5,5
    800033e4:	00400c93          	li	s9,4
    800033e8:	db9ff06f          	j	800031a0 <__printf+0x3f8>
    800033ec:	00600793          	li	a5,6
    800033f0:	00500c93          	li	s9,5
    800033f4:	dadff06f          	j	800031a0 <__printf+0x3f8>
    800033f8:	00600793          	li	a5,6
    800033fc:	00500c93          	li	s9,5
    80003400:	c09ff06f          	j	80003008 <__printf+0x260>
    80003404:	00800793          	li	a5,8
    80003408:	00700c93          	li	s9,7
    8000340c:	bfdff06f          	j	80003008 <__printf+0x260>
    80003410:	00100793          	li	a5,1
    80003414:	d91ff06f          	j	800031a4 <__printf+0x3fc>
    80003418:	00100793          	li	a5,1
    8000341c:	bf1ff06f          	j	8000300c <__printf+0x264>
    80003420:	00900793          	li	a5,9
    80003424:	00800c93          	li	s9,8
    80003428:	be1ff06f          	j	80003008 <__printf+0x260>
    8000342c:	00002517          	auipc	a0,0x2
    80003430:	e1c50513          	addi	a0,a0,-484 # 80005248 <_ZZ12printIntegermE6digits+0x150>
    80003434:	00000097          	auipc	ra,0x0
    80003438:	918080e7          	jalr	-1768(ra) # 80002d4c <panic>

000000008000343c <printfinit>:
    8000343c:	fe010113          	addi	sp,sp,-32
    80003440:	00813823          	sd	s0,16(sp)
    80003444:	00913423          	sd	s1,8(sp)
    80003448:	00113c23          	sd	ra,24(sp)
    8000344c:	02010413          	addi	s0,sp,32
    80003450:	00003497          	auipc	s1,0x3
    80003454:	71048493          	addi	s1,s1,1808 # 80006b60 <pr>
    80003458:	00048513          	mv	a0,s1
    8000345c:	00002597          	auipc	a1,0x2
    80003460:	dfc58593          	addi	a1,a1,-516 # 80005258 <_ZZ12printIntegermE6digits+0x160>
    80003464:	00000097          	auipc	ra,0x0
    80003468:	5f4080e7          	jalr	1524(ra) # 80003a58 <initlock>
    8000346c:	01813083          	ld	ra,24(sp)
    80003470:	01013403          	ld	s0,16(sp)
    80003474:	0004ac23          	sw	zero,24(s1)
    80003478:	00813483          	ld	s1,8(sp)
    8000347c:	02010113          	addi	sp,sp,32
    80003480:	00008067          	ret

0000000080003484 <uartinit>:
    80003484:	ff010113          	addi	sp,sp,-16
    80003488:	00813423          	sd	s0,8(sp)
    8000348c:	01010413          	addi	s0,sp,16
    80003490:	100007b7          	lui	a5,0x10000
    80003494:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003498:	f8000713          	li	a4,-128
    8000349c:	00e781a3          	sb	a4,3(a5)
    800034a0:	00300713          	li	a4,3
    800034a4:	00e78023          	sb	a4,0(a5)
    800034a8:	000780a3          	sb	zero,1(a5)
    800034ac:	00e781a3          	sb	a4,3(a5)
    800034b0:	00700693          	li	a3,7
    800034b4:	00d78123          	sb	a3,2(a5)
    800034b8:	00e780a3          	sb	a4,1(a5)
    800034bc:	00813403          	ld	s0,8(sp)
    800034c0:	01010113          	addi	sp,sp,16
    800034c4:	00008067          	ret

00000000800034c8 <uartputc>:
    800034c8:	00002797          	auipc	a5,0x2
    800034cc:	4207a783          	lw	a5,1056(a5) # 800058e8 <panicked>
    800034d0:	00078463          	beqz	a5,800034d8 <uartputc+0x10>
    800034d4:	0000006f          	j	800034d4 <uartputc+0xc>
    800034d8:	fd010113          	addi	sp,sp,-48
    800034dc:	02813023          	sd	s0,32(sp)
    800034e0:	00913c23          	sd	s1,24(sp)
    800034e4:	01213823          	sd	s2,16(sp)
    800034e8:	01313423          	sd	s3,8(sp)
    800034ec:	02113423          	sd	ra,40(sp)
    800034f0:	03010413          	addi	s0,sp,48
    800034f4:	00002917          	auipc	s2,0x2
    800034f8:	3fc90913          	addi	s2,s2,1020 # 800058f0 <uart_tx_r>
    800034fc:	00093783          	ld	a5,0(s2)
    80003500:	00002497          	auipc	s1,0x2
    80003504:	3f848493          	addi	s1,s1,1016 # 800058f8 <uart_tx_w>
    80003508:	0004b703          	ld	a4,0(s1)
    8000350c:	02078693          	addi	a3,a5,32
    80003510:	00050993          	mv	s3,a0
    80003514:	02e69c63          	bne	a3,a4,8000354c <uartputc+0x84>
    80003518:	00001097          	auipc	ra,0x1
    8000351c:	834080e7          	jalr	-1996(ra) # 80003d4c <push_on>
    80003520:	00093783          	ld	a5,0(s2)
    80003524:	0004b703          	ld	a4,0(s1)
    80003528:	02078793          	addi	a5,a5,32
    8000352c:	00e79463          	bne	a5,a4,80003534 <uartputc+0x6c>
    80003530:	0000006f          	j	80003530 <uartputc+0x68>
    80003534:	00001097          	auipc	ra,0x1
    80003538:	88c080e7          	jalr	-1908(ra) # 80003dc0 <pop_on>
    8000353c:	00093783          	ld	a5,0(s2)
    80003540:	0004b703          	ld	a4,0(s1)
    80003544:	02078693          	addi	a3,a5,32
    80003548:	fce688e3          	beq	a3,a4,80003518 <uartputc+0x50>
    8000354c:	01f77693          	andi	a3,a4,31
    80003550:	00003597          	auipc	a1,0x3
    80003554:	63058593          	addi	a1,a1,1584 # 80006b80 <uart_tx_buf>
    80003558:	00d586b3          	add	a3,a1,a3
    8000355c:	00170713          	addi	a4,a4,1
    80003560:	01368023          	sb	s3,0(a3)
    80003564:	00e4b023          	sd	a4,0(s1)
    80003568:	10000637          	lui	a2,0x10000
    8000356c:	02f71063          	bne	a4,a5,8000358c <uartputc+0xc4>
    80003570:	0340006f          	j	800035a4 <uartputc+0xdc>
    80003574:	00074703          	lbu	a4,0(a4)
    80003578:	00f93023          	sd	a5,0(s2)
    8000357c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003580:	00093783          	ld	a5,0(s2)
    80003584:	0004b703          	ld	a4,0(s1)
    80003588:	00f70e63          	beq	a4,a5,800035a4 <uartputc+0xdc>
    8000358c:	00564683          	lbu	a3,5(a2)
    80003590:	01f7f713          	andi	a4,a5,31
    80003594:	00e58733          	add	a4,a1,a4
    80003598:	0206f693          	andi	a3,a3,32
    8000359c:	00178793          	addi	a5,a5,1
    800035a0:	fc069ae3          	bnez	a3,80003574 <uartputc+0xac>
    800035a4:	02813083          	ld	ra,40(sp)
    800035a8:	02013403          	ld	s0,32(sp)
    800035ac:	01813483          	ld	s1,24(sp)
    800035b0:	01013903          	ld	s2,16(sp)
    800035b4:	00813983          	ld	s3,8(sp)
    800035b8:	03010113          	addi	sp,sp,48
    800035bc:	00008067          	ret

00000000800035c0 <uartputc_sync>:
    800035c0:	ff010113          	addi	sp,sp,-16
    800035c4:	00813423          	sd	s0,8(sp)
    800035c8:	01010413          	addi	s0,sp,16
    800035cc:	00002717          	auipc	a4,0x2
    800035d0:	31c72703          	lw	a4,796(a4) # 800058e8 <panicked>
    800035d4:	02071663          	bnez	a4,80003600 <uartputc_sync+0x40>
    800035d8:	00050793          	mv	a5,a0
    800035dc:	100006b7          	lui	a3,0x10000
    800035e0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800035e4:	02077713          	andi	a4,a4,32
    800035e8:	fe070ce3          	beqz	a4,800035e0 <uartputc_sync+0x20>
    800035ec:	0ff7f793          	andi	a5,a5,255
    800035f0:	00f68023          	sb	a5,0(a3)
    800035f4:	00813403          	ld	s0,8(sp)
    800035f8:	01010113          	addi	sp,sp,16
    800035fc:	00008067          	ret
    80003600:	0000006f          	j	80003600 <uartputc_sync+0x40>

0000000080003604 <uartstart>:
    80003604:	ff010113          	addi	sp,sp,-16
    80003608:	00813423          	sd	s0,8(sp)
    8000360c:	01010413          	addi	s0,sp,16
    80003610:	00002617          	auipc	a2,0x2
    80003614:	2e060613          	addi	a2,a2,736 # 800058f0 <uart_tx_r>
    80003618:	00002517          	auipc	a0,0x2
    8000361c:	2e050513          	addi	a0,a0,736 # 800058f8 <uart_tx_w>
    80003620:	00063783          	ld	a5,0(a2)
    80003624:	00053703          	ld	a4,0(a0)
    80003628:	04f70263          	beq	a4,a5,8000366c <uartstart+0x68>
    8000362c:	100005b7          	lui	a1,0x10000
    80003630:	00003817          	auipc	a6,0x3
    80003634:	55080813          	addi	a6,a6,1360 # 80006b80 <uart_tx_buf>
    80003638:	01c0006f          	j	80003654 <uartstart+0x50>
    8000363c:	0006c703          	lbu	a4,0(a3)
    80003640:	00f63023          	sd	a5,0(a2)
    80003644:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003648:	00063783          	ld	a5,0(a2)
    8000364c:	00053703          	ld	a4,0(a0)
    80003650:	00f70e63          	beq	a4,a5,8000366c <uartstart+0x68>
    80003654:	01f7f713          	andi	a4,a5,31
    80003658:	00e806b3          	add	a3,a6,a4
    8000365c:	0055c703          	lbu	a4,5(a1)
    80003660:	00178793          	addi	a5,a5,1
    80003664:	02077713          	andi	a4,a4,32
    80003668:	fc071ae3          	bnez	a4,8000363c <uartstart+0x38>
    8000366c:	00813403          	ld	s0,8(sp)
    80003670:	01010113          	addi	sp,sp,16
    80003674:	00008067          	ret

0000000080003678 <uartgetc>:
    80003678:	ff010113          	addi	sp,sp,-16
    8000367c:	00813423          	sd	s0,8(sp)
    80003680:	01010413          	addi	s0,sp,16
    80003684:	10000737          	lui	a4,0x10000
    80003688:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000368c:	0017f793          	andi	a5,a5,1
    80003690:	00078c63          	beqz	a5,800036a8 <uartgetc+0x30>
    80003694:	00074503          	lbu	a0,0(a4)
    80003698:	0ff57513          	andi	a0,a0,255
    8000369c:	00813403          	ld	s0,8(sp)
    800036a0:	01010113          	addi	sp,sp,16
    800036a4:	00008067          	ret
    800036a8:	fff00513          	li	a0,-1
    800036ac:	ff1ff06f          	j	8000369c <uartgetc+0x24>

00000000800036b0 <uartintr>:
    800036b0:	100007b7          	lui	a5,0x10000
    800036b4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800036b8:	0017f793          	andi	a5,a5,1
    800036bc:	0a078463          	beqz	a5,80003764 <uartintr+0xb4>
    800036c0:	fe010113          	addi	sp,sp,-32
    800036c4:	00813823          	sd	s0,16(sp)
    800036c8:	00913423          	sd	s1,8(sp)
    800036cc:	00113c23          	sd	ra,24(sp)
    800036d0:	02010413          	addi	s0,sp,32
    800036d4:	100004b7          	lui	s1,0x10000
    800036d8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800036dc:	0ff57513          	andi	a0,a0,255
    800036e0:	fffff097          	auipc	ra,0xfffff
    800036e4:	534080e7          	jalr	1332(ra) # 80002c14 <consoleintr>
    800036e8:	0054c783          	lbu	a5,5(s1)
    800036ec:	0017f793          	andi	a5,a5,1
    800036f0:	fe0794e3          	bnez	a5,800036d8 <uartintr+0x28>
    800036f4:	00002617          	auipc	a2,0x2
    800036f8:	1fc60613          	addi	a2,a2,508 # 800058f0 <uart_tx_r>
    800036fc:	00002517          	auipc	a0,0x2
    80003700:	1fc50513          	addi	a0,a0,508 # 800058f8 <uart_tx_w>
    80003704:	00063783          	ld	a5,0(a2)
    80003708:	00053703          	ld	a4,0(a0)
    8000370c:	04f70263          	beq	a4,a5,80003750 <uartintr+0xa0>
    80003710:	100005b7          	lui	a1,0x10000
    80003714:	00003817          	auipc	a6,0x3
    80003718:	46c80813          	addi	a6,a6,1132 # 80006b80 <uart_tx_buf>
    8000371c:	01c0006f          	j	80003738 <uartintr+0x88>
    80003720:	0006c703          	lbu	a4,0(a3)
    80003724:	00f63023          	sd	a5,0(a2)
    80003728:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000372c:	00063783          	ld	a5,0(a2)
    80003730:	00053703          	ld	a4,0(a0)
    80003734:	00f70e63          	beq	a4,a5,80003750 <uartintr+0xa0>
    80003738:	01f7f713          	andi	a4,a5,31
    8000373c:	00e806b3          	add	a3,a6,a4
    80003740:	0055c703          	lbu	a4,5(a1)
    80003744:	00178793          	addi	a5,a5,1
    80003748:	02077713          	andi	a4,a4,32
    8000374c:	fc071ae3          	bnez	a4,80003720 <uartintr+0x70>
    80003750:	01813083          	ld	ra,24(sp)
    80003754:	01013403          	ld	s0,16(sp)
    80003758:	00813483          	ld	s1,8(sp)
    8000375c:	02010113          	addi	sp,sp,32
    80003760:	00008067          	ret
    80003764:	00002617          	auipc	a2,0x2
    80003768:	18c60613          	addi	a2,a2,396 # 800058f0 <uart_tx_r>
    8000376c:	00002517          	auipc	a0,0x2
    80003770:	18c50513          	addi	a0,a0,396 # 800058f8 <uart_tx_w>
    80003774:	00063783          	ld	a5,0(a2)
    80003778:	00053703          	ld	a4,0(a0)
    8000377c:	04f70263          	beq	a4,a5,800037c0 <uartintr+0x110>
    80003780:	100005b7          	lui	a1,0x10000
    80003784:	00003817          	auipc	a6,0x3
    80003788:	3fc80813          	addi	a6,a6,1020 # 80006b80 <uart_tx_buf>
    8000378c:	01c0006f          	j	800037a8 <uartintr+0xf8>
    80003790:	0006c703          	lbu	a4,0(a3)
    80003794:	00f63023          	sd	a5,0(a2)
    80003798:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000379c:	00063783          	ld	a5,0(a2)
    800037a0:	00053703          	ld	a4,0(a0)
    800037a4:	02f70063          	beq	a4,a5,800037c4 <uartintr+0x114>
    800037a8:	01f7f713          	andi	a4,a5,31
    800037ac:	00e806b3          	add	a3,a6,a4
    800037b0:	0055c703          	lbu	a4,5(a1)
    800037b4:	00178793          	addi	a5,a5,1
    800037b8:	02077713          	andi	a4,a4,32
    800037bc:	fc071ae3          	bnez	a4,80003790 <uartintr+0xe0>
    800037c0:	00008067          	ret
    800037c4:	00008067          	ret

00000000800037c8 <kinit>:
    800037c8:	fc010113          	addi	sp,sp,-64
    800037cc:	02913423          	sd	s1,40(sp)
    800037d0:	fffff7b7          	lui	a5,0xfffff
    800037d4:	00004497          	auipc	s1,0x4
    800037d8:	3cb48493          	addi	s1,s1,971 # 80007b9f <end+0xfff>
    800037dc:	02813823          	sd	s0,48(sp)
    800037e0:	01313c23          	sd	s3,24(sp)
    800037e4:	00f4f4b3          	and	s1,s1,a5
    800037e8:	02113c23          	sd	ra,56(sp)
    800037ec:	03213023          	sd	s2,32(sp)
    800037f0:	01413823          	sd	s4,16(sp)
    800037f4:	01513423          	sd	s5,8(sp)
    800037f8:	04010413          	addi	s0,sp,64
    800037fc:	000017b7          	lui	a5,0x1
    80003800:	01100993          	li	s3,17
    80003804:	00f487b3          	add	a5,s1,a5
    80003808:	01b99993          	slli	s3,s3,0x1b
    8000380c:	06f9e063          	bltu	s3,a5,8000386c <kinit+0xa4>
    80003810:	00003a97          	auipc	s5,0x3
    80003814:	390a8a93          	addi	s5,s5,912 # 80006ba0 <end>
    80003818:	0754ec63          	bltu	s1,s5,80003890 <kinit+0xc8>
    8000381c:	0734fa63          	bgeu	s1,s3,80003890 <kinit+0xc8>
    80003820:	00088a37          	lui	s4,0x88
    80003824:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003828:	00002917          	auipc	s2,0x2
    8000382c:	0d890913          	addi	s2,s2,216 # 80005900 <kmem>
    80003830:	00ca1a13          	slli	s4,s4,0xc
    80003834:	0140006f          	j	80003848 <kinit+0x80>
    80003838:	000017b7          	lui	a5,0x1
    8000383c:	00f484b3          	add	s1,s1,a5
    80003840:	0554e863          	bltu	s1,s5,80003890 <kinit+0xc8>
    80003844:	0534f663          	bgeu	s1,s3,80003890 <kinit+0xc8>
    80003848:	00001637          	lui	a2,0x1
    8000384c:	00100593          	li	a1,1
    80003850:	00048513          	mv	a0,s1
    80003854:	00000097          	auipc	ra,0x0
    80003858:	5e4080e7          	jalr	1508(ra) # 80003e38 <__memset>
    8000385c:	00093783          	ld	a5,0(s2)
    80003860:	00f4b023          	sd	a5,0(s1)
    80003864:	00993023          	sd	s1,0(s2)
    80003868:	fd4498e3          	bne	s1,s4,80003838 <kinit+0x70>
    8000386c:	03813083          	ld	ra,56(sp)
    80003870:	03013403          	ld	s0,48(sp)
    80003874:	02813483          	ld	s1,40(sp)
    80003878:	02013903          	ld	s2,32(sp)
    8000387c:	01813983          	ld	s3,24(sp)
    80003880:	01013a03          	ld	s4,16(sp)
    80003884:	00813a83          	ld	s5,8(sp)
    80003888:	04010113          	addi	sp,sp,64
    8000388c:	00008067          	ret
    80003890:	00002517          	auipc	a0,0x2
    80003894:	9e850513          	addi	a0,a0,-1560 # 80005278 <digits+0x18>
    80003898:	fffff097          	auipc	ra,0xfffff
    8000389c:	4b4080e7          	jalr	1204(ra) # 80002d4c <panic>

00000000800038a0 <freerange>:
    800038a0:	fc010113          	addi	sp,sp,-64
    800038a4:	000017b7          	lui	a5,0x1
    800038a8:	02913423          	sd	s1,40(sp)
    800038ac:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800038b0:	009504b3          	add	s1,a0,s1
    800038b4:	fffff537          	lui	a0,0xfffff
    800038b8:	02813823          	sd	s0,48(sp)
    800038bc:	02113c23          	sd	ra,56(sp)
    800038c0:	03213023          	sd	s2,32(sp)
    800038c4:	01313c23          	sd	s3,24(sp)
    800038c8:	01413823          	sd	s4,16(sp)
    800038cc:	01513423          	sd	s5,8(sp)
    800038d0:	01613023          	sd	s6,0(sp)
    800038d4:	04010413          	addi	s0,sp,64
    800038d8:	00a4f4b3          	and	s1,s1,a0
    800038dc:	00f487b3          	add	a5,s1,a5
    800038e0:	06f5e463          	bltu	a1,a5,80003948 <freerange+0xa8>
    800038e4:	00003a97          	auipc	s5,0x3
    800038e8:	2bca8a93          	addi	s5,s5,700 # 80006ba0 <end>
    800038ec:	0954e263          	bltu	s1,s5,80003970 <freerange+0xd0>
    800038f0:	01100993          	li	s3,17
    800038f4:	01b99993          	slli	s3,s3,0x1b
    800038f8:	0734fc63          	bgeu	s1,s3,80003970 <freerange+0xd0>
    800038fc:	00058a13          	mv	s4,a1
    80003900:	00002917          	auipc	s2,0x2
    80003904:	00090913          	mv	s2,s2
    80003908:	00002b37          	lui	s6,0x2
    8000390c:	0140006f          	j	80003920 <freerange+0x80>
    80003910:	000017b7          	lui	a5,0x1
    80003914:	00f484b3          	add	s1,s1,a5
    80003918:	0554ec63          	bltu	s1,s5,80003970 <freerange+0xd0>
    8000391c:	0534fa63          	bgeu	s1,s3,80003970 <freerange+0xd0>
    80003920:	00001637          	lui	a2,0x1
    80003924:	00100593          	li	a1,1
    80003928:	00048513          	mv	a0,s1
    8000392c:	00000097          	auipc	ra,0x0
    80003930:	50c080e7          	jalr	1292(ra) # 80003e38 <__memset>
    80003934:	00093703          	ld	a4,0(s2) # 80005900 <kmem>
    80003938:	016487b3          	add	a5,s1,s6
    8000393c:	00e4b023          	sd	a4,0(s1)
    80003940:	00993023          	sd	s1,0(s2)
    80003944:	fcfa76e3          	bgeu	s4,a5,80003910 <freerange+0x70>
    80003948:	03813083          	ld	ra,56(sp)
    8000394c:	03013403          	ld	s0,48(sp)
    80003950:	02813483          	ld	s1,40(sp)
    80003954:	02013903          	ld	s2,32(sp)
    80003958:	01813983          	ld	s3,24(sp)
    8000395c:	01013a03          	ld	s4,16(sp)
    80003960:	00813a83          	ld	s5,8(sp)
    80003964:	00013b03          	ld	s6,0(sp)
    80003968:	04010113          	addi	sp,sp,64
    8000396c:	00008067          	ret
    80003970:	00002517          	auipc	a0,0x2
    80003974:	90850513          	addi	a0,a0,-1784 # 80005278 <digits+0x18>
    80003978:	fffff097          	auipc	ra,0xfffff
    8000397c:	3d4080e7          	jalr	980(ra) # 80002d4c <panic>

0000000080003980 <kfree>:
    80003980:	fe010113          	addi	sp,sp,-32
    80003984:	00813823          	sd	s0,16(sp)
    80003988:	00113c23          	sd	ra,24(sp)
    8000398c:	00913423          	sd	s1,8(sp)
    80003990:	02010413          	addi	s0,sp,32
    80003994:	03451793          	slli	a5,a0,0x34
    80003998:	04079c63          	bnez	a5,800039f0 <kfree+0x70>
    8000399c:	00003797          	auipc	a5,0x3
    800039a0:	20478793          	addi	a5,a5,516 # 80006ba0 <end>
    800039a4:	00050493          	mv	s1,a0
    800039a8:	04f56463          	bltu	a0,a5,800039f0 <kfree+0x70>
    800039ac:	01100793          	li	a5,17
    800039b0:	01b79793          	slli	a5,a5,0x1b
    800039b4:	02f57e63          	bgeu	a0,a5,800039f0 <kfree+0x70>
    800039b8:	00001637          	lui	a2,0x1
    800039bc:	00100593          	li	a1,1
    800039c0:	00000097          	auipc	ra,0x0
    800039c4:	478080e7          	jalr	1144(ra) # 80003e38 <__memset>
    800039c8:	00002797          	auipc	a5,0x2
    800039cc:	f3878793          	addi	a5,a5,-200 # 80005900 <kmem>
    800039d0:	0007b703          	ld	a4,0(a5)
    800039d4:	01813083          	ld	ra,24(sp)
    800039d8:	01013403          	ld	s0,16(sp)
    800039dc:	00e4b023          	sd	a4,0(s1)
    800039e0:	0097b023          	sd	s1,0(a5)
    800039e4:	00813483          	ld	s1,8(sp)
    800039e8:	02010113          	addi	sp,sp,32
    800039ec:	00008067          	ret
    800039f0:	00002517          	auipc	a0,0x2
    800039f4:	88850513          	addi	a0,a0,-1912 # 80005278 <digits+0x18>
    800039f8:	fffff097          	auipc	ra,0xfffff
    800039fc:	354080e7          	jalr	852(ra) # 80002d4c <panic>

0000000080003a00 <kalloc>:
    80003a00:	fe010113          	addi	sp,sp,-32
    80003a04:	00813823          	sd	s0,16(sp)
    80003a08:	00913423          	sd	s1,8(sp)
    80003a0c:	00113c23          	sd	ra,24(sp)
    80003a10:	02010413          	addi	s0,sp,32
    80003a14:	00002797          	auipc	a5,0x2
    80003a18:	eec78793          	addi	a5,a5,-276 # 80005900 <kmem>
    80003a1c:	0007b483          	ld	s1,0(a5)
    80003a20:	02048063          	beqz	s1,80003a40 <kalloc+0x40>
    80003a24:	0004b703          	ld	a4,0(s1)
    80003a28:	00001637          	lui	a2,0x1
    80003a2c:	00500593          	li	a1,5
    80003a30:	00048513          	mv	a0,s1
    80003a34:	00e7b023          	sd	a4,0(a5)
    80003a38:	00000097          	auipc	ra,0x0
    80003a3c:	400080e7          	jalr	1024(ra) # 80003e38 <__memset>
    80003a40:	01813083          	ld	ra,24(sp)
    80003a44:	01013403          	ld	s0,16(sp)
    80003a48:	00048513          	mv	a0,s1
    80003a4c:	00813483          	ld	s1,8(sp)
    80003a50:	02010113          	addi	sp,sp,32
    80003a54:	00008067          	ret

0000000080003a58 <initlock>:
    80003a58:	ff010113          	addi	sp,sp,-16
    80003a5c:	00813423          	sd	s0,8(sp)
    80003a60:	01010413          	addi	s0,sp,16
    80003a64:	00813403          	ld	s0,8(sp)
    80003a68:	00b53423          	sd	a1,8(a0)
    80003a6c:	00052023          	sw	zero,0(a0)
    80003a70:	00053823          	sd	zero,16(a0)
    80003a74:	01010113          	addi	sp,sp,16
    80003a78:	00008067          	ret

0000000080003a7c <acquire>:
    80003a7c:	fe010113          	addi	sp,sp,-32
    80003a80:	00813823          	sd	s0,16(sp)
    80003a84:	00913423          	sd	s1,8(sp)
    80003a88:	00113c23          	sd	ra,24(sp)
    80003a8c:	01213023          	sd	s2,0(sp)
    80003a90:	02010413          	addi	s0,sp,32
    80003a94:	00050493          	mv	s1,a0
    80003a98:	10002973          	csrr	s2,sstatus
    80003a9c:	100027f3          	csrr	a5,sstatus
    80003aa0:	ffd7f793          	andi	a5,a5,-3
    80003aa4:	10079073          	csrw	sstatus,a5
    80003aa8:	fffff097          	auipc	ra,0xfffff
    80003aac:	8e0080e7          	jalr	-1824(ra) # 80002388 <mycpu>
    80003ab0:	07852783          	lw	a5,120(a0)
    80003ab4:	06078e63          	beqz	a5,80003b30 <acquire+0xb4>
    80003ab8:	fffff097          	auipc	ra,0xfffff
    80003abc:	8d0080e7          	jalr	-1840(ra) # 80002388 <mycpu>
    80003ac0:	07852783          	lw	a5,120(a0)
    80003ac4:	0004a703          	lw	a4,0(s1)
    80003ac8:	0017879b          	addiw	a5,a5,1
    80003acc:	06f52c23          	sw	a5,120(a0)
    80003ad0:	04071063          	bnez	a4,80003b10 <acquire+0x94>
    80003ad4:	00100713          	li	a4,1
    80003ad8:	00070793          	mv	a5,a4
    80003adc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003ae0:	0007879b          	sext.w	a5,a5
    80003ae4:	fe079ae3          	bnez	a5,80003ad8 <acquire+0x5c>
    80003ae8:	0ff0000f          	fence
    80003aec:	fffff097          	auipc	ra,0xfffff
    80003af0:	89c080e7          	jalr	-1892(ra) # 80002388 <mycpu>
    80003af4:	01813083          	ld	ra,24(sp)
    80003af8:	01013403          	ld	s0,16(sp)
    80003afc:	00a4b823          	sd	a0,16(s1)
    80003b00:	00013903          	ld	s2,0(sp)
    80003b04:	00813483          	ld	s1,8(sp)
    80003b08:	02010113          	addi	sp,sp,32
    80003b0c:	00008067          	ret
    80003b10:	0104b903          	ld	s2,16(s1)
    80003b14:	fffff097          	auipc	ra,0xfffff
    80003b18:	874080e7          	jalr	-1932(ra) # 80002388 <mycpu>
    80003b1c:	faa91ce3          	bne	s2,a0,80003ad4 <acquire+0x58>
    80003b20:	00001517          	auipc	a0,0x1
    80003b24:	76050513          	addi	a0,a0,1888 # 80005280 <digits+0x20>
    80003b28:	fffff097          	auipc	ra,0xfffff
    80003b2c:	224080e7          	jalr	548(ra) # 80002d4c <panic>
    80003b30:	00195913          	srli	s2,s2,0x1
    80003b34:	fffff097          	auipc	ra,0xfffff
    80003b38:	854080e7          	jalr	-1964(ra) # 80002388 <mycpu>
    80003b3c:	00197913          	andi	s2,s2,1
    80003b40:	07252e23          	sw	s2,124(a0)
    80003b44:	f75ff06f          	j	80003ab8 <acquire+0x3c>

0000000080003b48 <release>:
    80003b48:	fe010113          	addi	sp,sp,-32
    80003b4c:	00813823          	sd	s0,16(sp)
    80003b50:	00113c23          	sd	ra,24(sp)
    80003b54:	00913423          	sd	s1,8(sp)
    80003b58:	01213023          	sd	s2,0(sp)
    80003b5c:	02010413          	addi	s0,sp,32
    80003b60:	00052783          	lw	a5,0(a0)
    80003b64:	00079a63          	bnez	a5,80003b78 <release+0x30>
    80003b68:	00001517          	auipc	a0,0x1
    80003b6c:	72050513          	addi	a0,a0,1824 # 80005288 <digits+0x28>
    80003b70:	fffff097          	auipc	ra,0xfffff
    80003b74:	1dc080e7          	jalr	476(ra) # 80002d4c <panic>
    80003b78:	01053903          	ld	s2,16(a0)
    80003b7c:	00050493          	mv	s1,a0
    80003b80:	fffff097          	auipc	ra,0xfffff
    80003b84:	808080e7          	jalr	-2040(ra) # 80002388 <mycpu>
    80003b88:	fea910e3          	bne	s2,a0,80003b68 <release+0x20>
    80003b8c:	0004b823          	sd	zero,16(s1)
    80003b90:	0ff0000f          	fence
    80003b94:	0f50000f          	fence	iorw,ow
    80003b98:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003b9c:	ffffe097          	auipc	ra,0xffffe
    80003ba0:	7ec080e7          	jalr	2028(ra) # 80002388 <mycpu>
    80003ba4:	100027f3          	csrr	a5,sstatus
    80003ba8:	0027f793          	andi	a5,a5,2
    80003bac:	04079a63          	bnez	a5,80003c00 <release+0xb8>
    80003bb0:	07852783          	lw	a5,120(a0)
    80003bb4:	02f05e63          	blez	a5,80003bf0 <release+0xa8>
    80003bb8:	fff7871b          	addiw	a4,a5,-1
    80003bbc:	06e52c23          	sw	a4,120(a0)
    80003bc0:	00071c63          	bnez	a4,80003bd8 <release+0x90>
    80003bc4:	07c52783          	lw	a5,124(a0)
    80003bc8:	00078863          	beqz	a5,80003bd8 <release+0x90>
    80003bcc:	100027f3          	csrr	a5,sstatus
    80003bd0:	0027e793          	ori	a5,a5,2
    80003bd4:	10079073          	csrw	sstatus,a5
    80003bd8:	01813083          	ld	ra,24(sp)
    80003bdc:	01013403          	ld	s0,16(sp)
    80003be0:	00813483          	ld	s1,8(sp)
    80003be4:	00013903          	ld	s2,0(sp)
    80003be8:	02010113          	addi	sp,sp,32
    80003bec:	00008067          	ret
    80003bf0:	00001517          	auipc	a0,0x1
    80003bf4:	6b850513          	addi	a0,a0,1720 # 800052a8 <digits+0x48>
    80003bf8:	fffff097          	auipc	ra,0xfffff
    80003bfc:	154080e7          	jalr	340(ra) # 80002d4c <panic>
    80003c00:	00001517          	auipc	a0,0x1
    80003c04:	69050513          	addi	a0,a0,1680 # 80005290 <digits+0x30>
    80003c08:	fffff097          	auipc	ra,0xfffff
    80003c0c:	144080e7          	jalr	324(ra) # 80002d4c <panic>

0000000080003c10 <holding>:
    80003c10:	00052783          	lw	a5,0(a0)
    80003c14:	00079663          	bnez	a5,80003c20 <holding+0x10>
    80003c18:	00000513          	li	a0,0
    80003c1c:	00008067          	ret
    80003c20:	fe010113          	addi	sp,sp,-32
    80003c24:	00813823          	sd	s0,16(sp)
    80003c28:	00913423          	sd	s1,8(sp)
    80003c2c:	00113c23          	sd	ra,24(sp)
    80003c30:	02010413          	addi	s0,sp,32
    80003c34:	01053483          	ld	s1,16(a0)
    80003c38:	ffffe097          	auipc	ra,0xffffe
    80003c3c:	750080e7          	jalr	1872(ra) # 80002388 <mycpu>
    80003c40:	01813083          	ld	ra,24(sp)
    80003c44:	01013403          	ld	s0,16(sp)
    80003c48:	40a48533          	sub	a0,s1,a0
    80003c4c:	00153513          	seqz	a0,a0
    80003c50:	00813483          	ld	s1,8(sp)
    80003c54:	02010113          	addi	sp,sp,32
    80003c58:	00008067          	ret

0000000080003c5c <push_off>:
    80003c5c:	fe010113          	addi	sp,sp,-32
    80003c60:	00813823          	sd	s0,16(sp)
    80003c64:	00113c23          	sd	ra,24(sp)
    80003c68:	00913423          	sd	s1,8(sp)
    80003c6c:	02010413          	addi	s0,sp,32
    80003c70:	100024f3          	csrr	s1,sstatus
    80003c74:	100027f3          	csrr	a5,sstatus
    80003c78:	ffd7f793          	andi	a5,a5,-3
    80003c7c:	10079073          	csrw	sstatus,a5
    80003c80:	ffffe097          	auipc	ra,0xffffe
    80003c84:	708080e7          	jalr	1800(ra) # 80002388 <mycpu>
    80003c88:	07852783          	lw	a5,120(a0)
    80003c8c:	02078663          	beqz	a5,80003cb8 <push_off+0x5c>
    80003c90:	ffffe097          	auipc	ra,0xffffe
    80003c94:	6f8080e7          	jalr	1784(ra) # 80002388 <mycpu>
    80003c98:	07852783          	lw	a5,120(a0)
    80003c9c:	01813083          	ld	ra,24(sp)
    80003ca0:	01013403          	ld	s0,16(sp)
    80003ca4:	0017879b          	addiw	a5,a5,1
    80003ca8:	06f52c23          	sw	a5,120(a0)
    80003cac:	00813483          	ld	s1,8(sp)
    80003cb0:	02010113          	addi	sp,sp,32
    80003cb4:	00008067          	ret
    80003cb8:	0014d493          	srli	s1,s1,0x1
    80003cbc:	ffffe097          	auipc	ra,0xffffe
    80003cc0:	6cc080e7          	jalr	1740(ra) # 80002388 <mycpu>
    80003cc4:	0014f493          	andi	s1,s1,1
    80003cc8:	06952e23          	sw	s1,124(a0)
    80003ccc:	fc5ff06f          	j	80003c90 <push_off+0x34>

0000000080003cd0 <pop_off>:
    80003cd0:	ff010113          	addi	sp,sp,-16
    80003cd4:	00813023          	sd	s0,0(sp)
    80003cd8:	00113423          	sd	ra,8(sp)
    80003cdc:	01010413          	addi	s0,sp,16
    80003ce0:	ffffe097          	auipc	ra,0xffffe
    80003ce4:	6a8080e7          	jalr	1704(ra) # 80002388 <mycpu>
    80003ce8:	100027f3          	csrr	a5,sstatus
    80003cec:	0027f793          	andi	a5,a5,2
    80003cf0:	04079663          	bnez	a5,80003d3c <pop_off+0x6c>
    80003cf4:	07852783          	lw	a5,120(a0)
    80003cf8:	02f05a63          	blez	a5,80003d2c <pop_off+0x5c>
    80003cfc:	fff7871b          	addiw	a4,a5,-1
    80003d00:	06e52c23          	sw	a4,120(a0)
    80003d04:	00071c63          	bnez	a4,80003d1c <pop_off+0x4c>
    80003d08:	07c52783          	lw	a5,124(a0)
    80003d0c:	00078863          	beqz	a5,80003d1c <pop_off+0x4c>
    80003d10:	100027f3          	csrr	a5,sstatus
    80003d14:	0027e793          	ori	a5,a5,2
    80003d18:	10079073          	csrw	sstatus,a5
    80003d1c:	00813083          	ld	ra,8(sp)
    80003d20:	00013403          	ld	s0,0(sp)
    80003d24:	01010113          	addi	sp,sp,16
    80003d28:	00008067          	ret
    80003d2c:	00001517          	auipc	a0,0x1
    80003d30:	57c50513          	addi	a0,a0,1404 # 800052a8 <digits+0x48>
    80003d34:	fffff097          	auipc	ra,0xfffff
    80003d38:	018080e7          	jalr	24(ra) # 80002d4c <panic>
    80003d3c:	00001517          	auipc	a0,0x1
    80003d40:	55450513          	addi	a0,a0,1364 # 80005290 <digits+0x30>
    80003d44:	fffff097          	auipc	ra,0xfffff
    80003d48:	008080e7          	jalr	8(ra) # 80002d4c <panic>

0000000080003d4c <push_on>:
    80003d4c:	fe010113          	addi	sp,sp,-32
    80003d50:	00813823          	sd	s0,16(sp)
    80003d54:	00113c23          	sd	ra,24(sp)
    80003d58:	00913423          	sd	s1,8(sp)
    80003d5c:	02010413          	addi	s0,sp,32
    80003d60:	100024f3          	csrr	s1,sstatus
    80003d64:	100027f3          	csrr	a5,sstatus
    80003d68:	0027e793          	ori	a5,a5,2
    80003d6c:	10079073          	csrw	sstatus,a5
    80003d70:	ffffe097          	auipc	ra,0xffffe
    80003d74:	618080e7          	jalr	1560(ra) # 80002388 <mycpu>
    80003d78:	07852783          	lw	a5,120(a0)
    80003d7c:	02078663          	beqz	a5,80003da8 <push_on+0x5c>
    80003d80:	ffffe097          	auipc	ra,0xffffe
    80003d84:	608080e7          	jalr	1544(ra) # 80002388 <mycpu>
    80003d88:	07852783          	lw	a5,120(a0)
    80003d8c:	01813083          	ld	ra,24(sp)
    80003d90:	01013403          	ld	s0,16(sp)
    80003d94:	0017879b          	addiw	a5,a5,1
    80003d98:	06f52c23          	sw	a5,120(a0)
    80003d9c:	00813483          	ld	s1,8(sp)
    80003da0:	02010113          	addi	sp,sp,32
    80003da4:	00008067          	ret
    80003da8:	0014d493          	srli	s1,s1,0x1
    80003dac:	ffffe097          	auipc	ra,0xffffe
    80003db0:	5dc080e7          	jalr	1500(ra) # 80002388 <mycpu>
    80003db4:	0014f493          	andi	s1,s1,1
    80003db8:	06952e23          	sw	s1,124(a0)
    80003dbc:	fc5ff06f          	j	80003d80 <push_on+0x34>

0000000080003dc0 <pop_on>:
    80003dc0:	ff010113          	addi	sp,sp,-16
    80003dc4:	00813023          	sd	s0,0(sp)
    80003dc8:	00113423          	sd	ra,8(sp)
    80003dcc:	01010413          	addi	s0,sp,16
    80003dd0:	ffffe097          	auipc	ra,0xffffe
    80003dd4:	5b8080e7          	jalr	1464(ra) # 80002388 <mycpu>
    80003dd8:	100027f3          	csrr	a5,sstatus
    80003ddc:	0027f793          	andi	a5,a5,2
    80003de0:	04078463          	beqz	a5,80003e28 <pop_on+0x68>
    80003de4:	07852783          	lw	a5,120(a0)
    80003de8:	02f05863          	blez	a5,80003e18 <pop_on+0x58>
    80003dec:	fff7879b          	addiw	a5,a5,-1
    80003df0:	06f52c23          	sw	a5,120(a0)
    80003df4:	07853783          	ld	a5,120(a0)
    80003df8:	00079863          	bnez	a5,80003e08 <pop_on+0x48>
    80003dfc:	100027f3          	csrr	a5,sstatus
    80003e00:	ffd7f793          	andi	a5,a5,-3
    80003e04:	10079073          	csrw	sstatus,a5
    80003e08:	00813083          	ld	ra,8(sp)
    80003e0c:	00013403          	ld	s0,0(sp)
    80003e10:	01010113          	addi	sp,sp,16
    80003e14:	00008067          	ret
    80003e18:	00001517          	auipc	a0,0x1
    80003e1c:	4b850513          	addi	a0,a0,1208 # 800052d0 <digits+0x70>
    80003e20:	fffff097          	auipc	ra,0xfffff
    80003e24:	f2c080e7          	jalr	-212(ra) # 80002d4c <panic>
    80003e28:	00001517          	auipc	a0,0x1
    80003e2c:	48850513          	addi	a0,a0,1160 # 800052b0 <digits+0x50>
    80003e30:	fffff097          	auipc	ra,0xfffff
    80003e34:	f1c080e7          	jalr	-228(ra) # 80002d4c <panic>

0000000080003e38 <__memset>:
    80003e38:	ff010113          	addi	sp,sp,-16
    80003e3c:	00813423          	sd	s0,8(sp)
    80003e40:	01010413          	addi	s0,sp,16
    80003e44:	1a060e63          	beqz	a2,80004000 <__memset+0x1c8>
    80003e48:	40a007b3          	neg	a5,a0
    80003e4c:	0077f793          	andi	a5,a5,7
    80003e50:	00778693          	addi	a3,a5,7
    80003e54:	00b00813          	li	a6,11
    80003e58:	0ff5f593          	andi	a1,a1,255
    80003e5c:	fff6071b          	addiw	a4,a2,-1
    80003e60:	1b06e663          	bltu	a3,a6,8000400c <__memset+0x1d4>
    80003e64:	1cd76463          	bltu	a4,a3,8000402c <__memset+0x1f4>
    80003e68:	1a078e63          	beqz	a5,80004024 <__memset+0x1ec>
    80003e6c:	00b50023          	sb	a1,0(a0)
    80003e70:	00100713          	li	a4,1
    80003e74:	1ae78463          	beq	a5,a4,8000401c <__memset+0x1e4>
    80003e78:	00b500a3          	sb	a1,1(a0)
    80003e7c:	00200713          	li	a4,2
    80003e80:	1ae78a63          	beq	a5,a4,80004034 <__memset+0x1fc>
    80003e84:	00b50123          	sb	a1,2(a0)
    80003e88:	00300713          	li	a4,3
    80003e8c:	18e78463          	beq	a5,a4,80004014 <__memset+0x1dc>
    80003e90:	00b501a3          	sb	a1,3(a0)
    80003e94:	00400713          	li	a4,4
    80003e98:	1ae78263          	beq	a5,a4,8000403c <__memset+0x204>
    80003e9c:	00b50223          	sb	a1,4(a0)
    80003ea0:	00500713          	li	a4,5
    80003ea4:	1ae78063          	beq	a5,a4,80004044 <__memset+0x20c>
    80003ea8:	00b502a3          	sb	a1,5(a0)
    80003eac:	00700713          	li	a4,7
    80003eb0:	18e79e63          	bne	a5,a4,8000404c <__memset+0x214>
    80003eb4:	00b50323          	sb	a1,6(a0)
    80003eb8:	00700e93          	li	t4,7
    80003ebc:	00859713          	slli	a4,a1,0x8
    80003ec0:	00e5e733          	or	a4,a1,a4
    80003ec4:	01059e13          	slli	t3,a1,0x10
    80003ec8:	01c76e33          	or	t3,a4,t3
    80003ecc:	01859313          	slli	t1,a1,0x18
    80003ed0:	006e6333          	or	t1,t3,t1
    80003ed4:	02059893          	slli	a7,a1,0x20
    80003ed8:	40f60e3b          	subw	t3,a2,a5
    80003edc:	011368b3          	or	a7,t1,a7
    80003ee0:	02859813          	slli	a6,a1,0x28
    80003ee4:	0108e833          	or	a6,a7,a6
    80003ee8:	03059693          	slli	a3,a1,0x30
    80003eec:	003e589b          	srliw	a7,t3,0x3
    80003ef0:	00d866b3          	or	a3,a6,a3
    80003ef4:	03859713          	slli	a4,a1,0x38
    80003ef8:	00389813          	slli	a6,a7,0x3
    80003efc:	00f507b3          	add	a5,a0,a5
    80003f00:	00e6e733          	or	a4,a3,a4
    80003f04:	000e089b          	sext.w	a7,t3
    80003f08:	00f806b3          	add	a3,a6,a5
    80003f0c:	00e7b023          	sd	a4,0(a5)
    80003f10:	00878793          	addi	a5,a5,8
    80003f14:	fed79ce3          	bne	a5,a3,80003f0c <__memset+0xd4>
    80003f18:	ff8e7793          	andi	a5,t3,-8
    80003f1c:	0007871b          	sext.w	a4,a5
    80003f20:	01d787bb          	addw	a5,a5,t4
    80003f24:	0ce88e63          	beq	a7,a4,80004000 <__memset+0x1c8>
    80003f28:	00f50733          	add	a4,a0,a5
    80003f2c:	00b70023          	sb	a1,0(a4)
    80003f30:	0017871b          	addiw	a4,a5,1
    80003f34:	0cc77663          	bgeu	a4,a2,80004000 <__memset+0x1c8>
    80003f38:	00e50733          	add	a4,a0,a4
    80003f3c:	00b70023          	sb	a1,0(a4)
    80003f40:	0027871b          	addiw	a4,a5,2
    80003f44:	0ac77e63          	bgeu	a4,a2,80004000 <__memset+0x1c8>
    80003f48:	00e50733          	add	a4,a0,a4
    80003f4c:	00b70023          	sb	a1,0(a4)
    80003f50:	0037871b          	addiw	a4,a5,3
    80003f54:	0ac77663          	bgeu	a4,a2,80004000 <__memset+0x1c8>
    80003f58:	00e50733          	add	a4,a0,a4
    80003f5c:	00b70023          	sb	a1,0(a4)
    80003f60:	0047871b          	addiw	a4,a5,4
    80003f64:	08c77e63          	bgeu	a4,a2,80004000 <__memset+0x1c8>
    80003f68:	00e50733          	add	a4,a0,a4
    80003f6c:	00b70023          	sb	a1,0(a4)
    80003f70:	0057871b          	addiw	a4,a5,5
    80003f74:	08c77663          	bgeu	a4,a2,80004000 <__memset+0x1c8>
    80003f78:	00e50733          	add	a4,a0,a4
    80003f7c:	00b70023          	sb	a1,0(a4)
    80003f80:	0067871b          	addiw	a4,a5,6
    80003f84:	06c77e63          	bgeu	a4,a2,80004000 <__memset+0x1c8>
    80003f88:	00e50733          	add	a4,a0,a4
    80003f8c:	00b70023          	sb	a1,0(a4)
    80003f90:	0077871b          	addiw	a4,a5,7
    80003f94:	06c77663          	bgeu	a4,a2,80004000 <__memset+0x1c8>
    80003f98:	00e50733          	add	a4,a0,a4
    80003f9c:	00b70023          	sb	a1,0(a4)
    80003fa0:	0087871b          	addiw	a4,a5,8
    80003fa4:	04c77e63          	bgeu	a4,a2,80004000 <__memset+0x1c8>
    80003fa8:	00e50733          	add	a4,a0,a4
    80003fac:	00b70023          	sb	a1,0(a4)
    80003fb0:	0097871b          	addiw	a4,a5,9
    80003fb4:	04c77663          	bgeu	a4,a2,80004000 <__memset+0x1c8>
    80003fb8:	00e50733          	add	a4,a0,a4
    80003fbc:	00b70023          	sb	a1,0(a4)
    80003fc0:	00a7871b          	addiw	a4,a5,10
    80003fc4:	02c77e63          	bgeu	a4,a2,80004000 <__memset+0x1c8>
    80003fc8:	00e50733          	add	a4,a0,a4
    80003fcc:	00b70023          	sb	a1,0(a4)
    80003fd0:	00b7871b          	addiw	a4,a5,11
    80003fd4:	02c77663          	bgeu	a4,a2,80004000 <__memset+0x1c8>
    80003fd8:	00e50733          	add	a4,a0,a4
    80003fdc:	00b70023          	sb	a1,0(a4)
    80003fe0:	00c7871b          	addiw	a4,a5,12
    80003fe4:	00c77e63          	bgeu	a4,a2,80004000 <__memset+0x1c8>
    80003fe8:	00e50733          	add	a4,a0,a4
    80003fec:	00b70023          	sb	a1,0(a4)
    80003ff0:	00d7879b          	addiw	a5,a5,13
    80003ff4:	00c7f663          	bgeu	a5,a2,80004000 <__memset+0x1c8>
    80003ff8:	00f507b3          	add	a5,a0,a5
    80003ffc:	00b78023          	sb	a1,0(a5)
    80004000:	00813403          	ld	s0,8(sp)
    80004004:	01010113          	addi	sp,sp,16
    80004008:	00008067          	ret
    8000400c:	00b00693          	li	a3,11
    80004010:	e55ff06f          	j	80003e64 <__memset+0x2c>
    80004014:	00300e93          	li	t4,3
    80004018:	ea5ff06f          	j	80003ebc <__memset+0x84>
    8000401c:	00100e93          	li	t4,1
    80004020:	e9dff06f          	j	80003ebc <__memset+0x84>
    80004024:	00000e93          	li	t4,0
    80004028:	e95ff06f          	j	80003ebc <__memset+0x84>
    8000402c:	00000793          	li	a5,0
    80004030:	ef9ff06f          	j	80003f28 <__memset+0xf0>
    80004034:	00200e93          	li	t4,2
    80004038:	e85ff06f          	j	80003ebc <__memset+0x84>
    8000403c:	00400e93          	li	t4,4
    80004040:	e7dff06f          	j	80003ebc <__memset+0x84>
    80004044:	00500e93          	li	t4,5
    80004048:	e75ff06f          	j	80003ebc <__memset+0x84>
    8000404c:	00600e93          	li	t4,6
    80004050:	e6dff06f          	j	80003ebc <__memset+0x84>

0000000080004054 <__memmove>:
    80004054:	ff010113          	addi	sp,sp,-16
    80004058:	00813423          	sd	s0,8(sp)
    8000405c:	01010413          	addi	s0,sp,16
    80004060:	0e060863          	beqz	a2,80004150 <__memmove+0xfc>
    80004064:	fff6069b          	addiw	a3,a2,-1
    80004068:	0006881b          	sext.w	a6,a3
    8000406c:	0ea5e863          	bltu	a1,a0,8000415c <__memmove+0x108>
    80004070:	00758713          	addi	a4,a1,7
    80004074:	00a5e7b3          	or	a5,a1,a0
    80004078:	40a70733          	sub	a4,a4,a0
    8000407c:	0077f793          	andi	a5,a5,7
    80004080:	00f73713          	sltiu	a4,a4,15
    80004084:	00174713          	xori	a4,a4,1
    80004088:	0017b793          	seqz	a5,a5
    8000408c:	00e7f7b3          	and	a5,a5,a4
    80004090:	10078863          	beqz	a5,800041a0 <__memmove+0x14c>
    80004094:	00900793          	li	a5,9
    80004098:	1107f463          	bgeu	a5,a6,800041a0 <__memmove+0x14c>
    8000409c:	0036581b          	srliw	a6,a2,0x3
    800040a0:	fff8081b          	addiw	a6,a6,-1
    800040a4:	02081813          	slli	a6,a6,0x20
    800040a8:	01d85893          	srli	a7,a6,0x1d
    800040ac:	00858813          	addi	a6,a1,8
    800040b0:	00058793          	mv	a5,a1
    800040b4:	00050713          	mv	a4,a0
    800040b8:	01088833          	add	a6,a7,a6
    800040bc:	0007b883          	ld	a7,0(a5)
    800040c0:	00878793          	addi	a5,a5,8
    800040c4:	00870713          	addi	a4,a4,8
    800040c8:	ff173c23          	sd	a7,-8(a4)
    800040cc:	ff0798e3          	bne	a5,a6,800040bc <__memmove+0x68>
    800040d0:	ff867713          	andi	a4,a2,-8
    800040d4:	02071793          	slli	a5,a4,0x20
    800040d8:	0207d793          	srli	a5,a5,0x20
    800040dc:	00f585b3          	add	a1,a1,a5
    800040e0:	40e686bb          	subw	a3,a3,a4
    800040e4:	00f507b3          	add	a5,a0,a5
    800040e8:	06e60463          	beq	a2,a4,80004150 <__memmove+0xfc>
    800040ec:	0005c703          	lbu	a4,0(a1)
    800040f0:	00e78023          	sb	a4,0(a5)
    800040f4:	04068e63          	beqz	a3,80004150 <__memmove+0xfc>
    800040f8:	0015c603          	lbu	a2,1(a1)
    800040fc:	00100713          	li	a4,1
    80004100:	00c780a3          	sb	a2,1(a5)
    80004104:	04e68663          	beq	a3,a4,80004150 <__memmove+0xfc>
    80004108:	0025c603          	lbu	a2,2(a1)
    8000410c:	00200713          	li	a4,2
    80004110:	00c78123          	sb	a2,2(a5)
    80004114:	02e68e63          	beq	a3,a4,80004150 <__memmove+0xfc>
    80004118:	0035c603          	lbu	a2,3(a1)
    8000411c:	00300713          	li	a4,3
    80004120:	00c781a3          	sb	a2,3(a5)
    80004124:	02e68663          	beq	a3,a4,80004150 <__memmove+0xfc>
    80004128:	0045c603          	lbu	a2,4(a1)
    8000412c:	00400713          	li	a4,4
    80004130:	00c78223          	sb	a2,4(a5)
    80004134:	00e68e63          	beq	a3,a4,80004150 <__memmove+0xfc>
    80004138:	0055c603          	lbu	a2,5(a1)
    8000413c:	00500713          	li	a4,5
    80004140:	00c782a3          	sb	a2,5(a5)
    80004144:	00e68663          	beq	a3,a4,80004150 <__memmove+0xfc>
    80004148:	0065c703          	lbu	a4,6(a1)
    8000414c:	00e78323          	sb	a4,6(a5)
    80004150:	00813403          	ld	s0,8(sp)
    80004154:	01010113          	addi	sp,sp,16
    80004158:	00008067          	ret
    8000415c:	02061713          	slli	a4,a2,0x20
    80004160:	02075713          	srli	a4,a4,0x20
    80004164:	00e587b3          	add	a5,a1,a4
    80004168:	f0f574e3          	bgeu	a0,a5,80004070 <__memmove+0x1c>
    8000416c:	02069613          	slli	a2,a3,0x20
    80004170:	02065613          	srli	a2,a2,0x20
    80004174:	fff64613          	not	a2,a2
    80004178:	00e50733          	add	a4,a0,a4
    8000417c:	00c78633          	add	a2,a5,a2
    80004180:	fff7c683          	lbu	a3,-1(a5)
    80004184:	fff78793          	addi	a5,a5,-1
    80004188:	fff70713          	addi	a4,a4,-1
    8000418c:	00d70023          	sb	a3,0(a4)
    80004190:	fec798e3          	bne	a5,a2,80004180 <__memmove+0x12c>
    80004194:	00813403          	ld	s0,8(sp)
    80004198:	01010113          	addi	sp,sp,16
    8000419c:	00008067          	ret
    800041a0:	02069713          	slli	a4,a3,0x20
    800041a4:	02075713          	srli	a4,a4,0x20
    800041a8:	00170713          	addi	a4,a4,1
    800041ac:	00e50733          	add	a4,a0,a4
    800041b0:	00050793          	mv	a5,a0
    800041b4:	0005c683          	lbu	a3,0(a1)
    800041b8:	00178793          	addi	a5,a5,1
    800041bc:	00158593          	addi	a1,a1,1
    800041c0:	fed78fa3          	sb	a3,-1(a5)
    800041c4:	fee798e3          	bne	a5,a4,800041b4 <__memmove+0x160>
    800041c8:	f89ff06f          	j	80004150 <__memmove+0xfc>

00000000800041cc <__putc>:
    800041cc:	fe010113          	addi	sp,sp,-32
    800041d0:	00813823          	sd	s0,16(sp)
    800041d4:	00113c23          	sd	ra,24(sp)
    800041d8:	02010413          	addi	s0,sp,32
    800041dc:	00050793          	mv	a5,a0
    800041e0:	fef40593          	addi	a1,s0,-17
    800041e4:	00100613          	li	a2,1
    800041e8:	00000513          	li	a0,0
    800041ec:	fef407a3          	sb	a5,-17(s0)
    800041f0:	fffff097          	auipc	ra,0xfffff
    800041f4:	b3c080e7          	jalr	-1220(ra) # 80002d2c <console_write>
    800041f8:	01813083          	ld	ra,24(sp)
    800041fc:	01013403          	ld	s0,16(sp)
    80004200:	02010113          	addi	sp,sp,32
    80004204:	00008067          	ret

0000000080004208 <__getc>:
    80004208:	fe010113          	addi	sp,sp,-32
    8000420c:	00813823          	sd	s0,16(sp)
    80004210:	00113c23          	sd	ra,24(sp)
    80004214:	02010413          	addi	s0,sp,32
    80004218:	fe840593          	addi	a1,s0,-24
    8000421c:	00100613          	li	a2,1
    80004220:	00000513          	li	a0,0
    80004224:	fffff097          	auipc	ra,0xfffff
    80004228:	ae8080e7          	jalr	-1304(ra) # 80002d0c <console_read>
    8000422c:	fe844503          	lbu	a0,-24(s0)
    80004230:	01813083          	ld	ra,24(sp)
    80004234:	01013403          	ld	s0,16(sp)
    80004238:	02010113          	addi	sp,sp,32
    8000423c:	00008067          	ret

0000000080004240 <console_handler>:
    80004240:	fe010113          	addi	sp,sp,-32
    80004244:	00813823          	sd	s0,16(sp)
    80004248:	00113c23          	sd	ra,24(sp)
    8000424c:	00913423          	sd	s1,8(sp)
    80004250:	02010413          	addi	s0,sp,32
    80004254:	14202773          	csrr	a4,scause
    80004258:	100027f3          	csrr	a5,sstatus
    8000425c:	0027f793          	andi	a5,a5,2
    80004260:	06079e63          	bnez	a5,800042dc <console_handler+0x9c>
    80004264:	00074c63          	bltz	a4,8000427c <console_handler+0x3c>
    80004268:	01813083          	ld	ra,24(sp)
    8000426c:	01013403          	ld	s0,16(sp)
    80004270:	00813483          	ld	s1,8(sp)
    80004274:	02010113          	addi	sp,sp,32
    80004278:	00008067          	ret
    8000427c:	0ff77713          	andi	a4,a4,255
    80004280:	00900793          	li	a5,9
    80004284:	fef712e3          	bne	a4,a5,80004268 <console_handler+0x28>
    80004288:	ffffe097          	auipc	ra,0xffffe
    8000428c:	6dc080e7          	jalr	1756(ra) # 80002964 <plic_claim>
    80004290:	00a00793          	li	a5,10
    80004294:	00050493          	mv	s1,a0
    80004298:	02f50c63          	beq	a0,a5,800042d0 <console_handler+0x90>
    8000429c:	fc0506e3          	beqz	a0,80004268 <console_handler+0x28>
    800042a0:	00050593          	mv	a1,a0
    800042a4:	00001517          	auipc	a0,0x1
    800042a8:	f3450513          	addi	a0,a0,-204 # 800051d8 <_ZZ12printIntegermE6digits+0xe0>
    800042ac:	fffff097          	auipc	ra,0xfffff
    800042b0:	afc080e7          	jalr	-1284(ra) # 80002da8 <__printf>
    800042b4:	01013403          	ld	s0,16(sp)
    800042b8:	01813083          	ld	ra,24(sp)
    800042bc:	00048513          	mv	a0,s1
    800042c0:	00813483          	ld	s1,8(sp)
    800042c4:	02010113          	addi	sp,sp,32
    800042c8:	ffffe317          	auipc	t1,0xffffe
    800042cc:	6d430067          	jr	1748(t1) # 8000299c <plic_complete>
    800042d0:	fffff097          	auipc	ra,0xfffff
    800042d4:	3e0080e7          	jalr	992(ra) # 800036b0 <uartintr>
    800042d8:	fddff06f          	j	800042b4 <console_handler+0x74>
    800042dc:	00001517          	auipc	a0,0x1
    800042e0:	ffc50513          	addi	a0,a0,-4 # 800052d8 <digits+0x78>
    800042e4:	fffff097          	auipc	ra,0xfffff
    800042e8:	a68080e7          	jalr	-1432(ra) # 80002d4c <panic>
	...
