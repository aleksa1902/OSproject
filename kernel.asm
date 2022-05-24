
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	88813103          	ld	sp,-1912(sp) # 80005888 <_GLOBAL_OFFSET_TABLE_+0x30>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	068020ef          	jal	ra,80002084 <start>

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
    80001184:	125000ef          	jal	ra,80001aa8 <_ZN5Riscv20handleSupervisorTrapEv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    80001188:	00013003          	ld	zero,0(sp)
    8000118c:	00813083          	ld	ra,8(sp)
    80001190:	01013103          	ld	sp,16(sp)
    80001194:	01813183          	ld	gp,24(sp)
    80001198:	02013203          	ld	tp,32(sp)
    8000119c:	02813283          	ld	t0,40(sp)
    800011a0:	03013303          	ld	t1,48(sp)
    800011a4:	03813383          	ld	t2,56(sp)
    800011a8:	04013403          	ld	s0,64(sp)
    800011ac:	04813483          	ld	s1,72(sp)
    800011b0:	05013503          	ld	a0,80(sp)
    800011b4:	05813583          	ld	a1,88(sp)
    800011b8:	06013603          	ld	a2,96(sp)
    800011bc:	06813683          	ld	a3,104(sp)
    800011c0:	07013703          	ld	a4,112(sp)
    800011c4:	07813783          	ld	a5,120(sp)
    800011c8:	08013803          	ld	a6,128(sp)
    800011cc:	08813883          	ld	a7,136(sp)
    800011d0:	09013903          	ld	s2,144(sp)
    800011d4:	09813983          	ld	s3,152(sp)
    800011d8:	0a013a03          	ld	s4,160(sp)
    800011dc:	0a813a83          	ld	s5,168(sp)
    800011e0:	0b013b03          	ld	s6,176(sp)
    800011e4:	0b813b83          	ld	s7,184(sp)
    800011e8:	0c013c03          	ld	s8,192(sp)
    800011ec:	0c813c83          	ld	s9,200(sp)
    800011f0:	0d013d03          	ld	s10,208(sp)
    800011f4:	0d813d83          	ld	s11,216(sp)
    800011f8:	0e013e03          	ld	t3,224(sp)
    800011fc:	0e813e83          	ld	t4,232(sp)
    80001200:	0f013f03          	ld	t5,240(sp)
    80001204:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001208:	10010113          	addi	sp,sp,256

    sret
    8000120c:	10200073          	sret

0000000080001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001210:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001214:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001218:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000121c:	0085b103          	ld	sp,8(a1)

    ret
    80001220:	00008067          	ret

0000000080001224 <_Z9mem_allocm>:
//
// Created by os on 5/22/22.
//
#include "../h/syscall_c.hpp"

void* mem_alloc(size_t size){
    80001224:	ff010113          	addi	sp,sp,-16
    80001228:	00813423          	sd	s0,8(sp)
    8000122c:	01010413          	addi	s0,sp,16
    size_t arg = 0;
    size_t num = 1;

    __asm__ volatile("mv %0, a0" : "=r" (arg));
    80001230:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001234:	00100713          	li	a4,1
    80001238:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (arg));
    8000123c:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    80001240:	00000073          	ecall

    void* ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001244:	00050513          	mv	a0,a0

    return ret;

}
    80001248:	00813403          	ld	s0,8(sp)
    8000124c:	01010113          	addi	sp,sp,16
    80001250:	00008067          	ret

0000000080001254 <_Z8mem_freePv>:

int mem_free(void* addr){
    80001254:	ff010113          	addi	sp,sp,-16
    80001258:	00813423          	sd	s0,8(sp)
    8000125c:	01010413          	addi	s0,sp,16
    void* arg = 0;
    int num = 2;

    __asm__ volatile("mv %0, a0" : "=r" (arg));
    80001260:	00050793          	mv	a5,a0
    __asm__ volatile("mv a0, %0" : : "r" (num));
    80001264:	00200713          	li	a4,2
    80001268:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (arg));
    8000126c:	00078593          	mv	a1,a5

    __asm__ volatile("ecall");
    80001270:	00000073          	ecall

    return 1;
    80001274:	00100513          	li	a0,1
    80001278:	00813403          	ld	s0,8(sp)
    8000127c:	01010113          	addi	sp,sp,16
    80001280:	00008067          	ret

0000000080001284 <_Z11workerBodyAv>:
#include "../h/print.hpp"
#include "../h/ccb.hpp"
#include "../h/tcb.hpp"


void workerBodyA() {
    80001284:	fe010113          	addi	sp,sp,-32
    80001288:	00113c23          	sd	ra,24(sp)
    8000128c:	00813823          	sd	s0,16(sp)
    80001290:	00913423          	sd	s1,8(sp)
    80001294:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80001298:	00000493          	li	s1,0
    8000129c:	0300006f          	j	800012cc <_Z11workerBodyAv+0x48>
        printString("A: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    800012a0:	00168693          	addi	a3,a3,1
    800012a4:	000027b7          	lui	a5,0x2
    800012a8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800012ac:	00d7ee63          	bltu	a5,a3,800012c8 <_Z11workerBodyAv+0x44>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800012b0:	00000713          	li	a4,0
    800012b4:	000077b7          	lui	a5,0x7
    800012b8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800012bc:	fee7e2e3          	bltu	a5,a4,800012a0 <_Z11workerBodyAv+0x1c>
    800012c0:	00170713          	addi	a4,a4,1
    800012c4:	ff1ff06f          	j	800012b4 <_Z11workerBodyAv+0x30>
    for (uint64 i = 0; i < 10; i++) {
    800012c8:	00148493          	addi	s1,s1,1
    800012cc:	00900793          	li	a5,9
    800012d0:	0297ec63          	bltu	a5,s1,80001308 <_Z11workerBodyAv+0x84>
        printString("A: i="); printInteger(i); printString("\n");
    800012d4:	00004517          	auipc	a0,0x4
    800012d8:	d4c50513          	addi	a0,a0,-692 # 80005020 <CONSOLE_STATUS+0x10>
    800012dc:	00001097          	auipc	ra,0x1
    800012e0:	ca8080e7          	jalr	-856(ra) # 80001f84 <_Z11printStringPKc>
    800012e4:	00048513          	mv	a0,s1
    800012e8:	00001097          	auipc	ra,0x1
    800012ec:	d0c080e7          	jalr	-756(ra) # 80001ff4 <_Z12printIntegerm>
    800012f0:	00004517          	auipc	a0,0x4
    800012f4:	e0050513          	addi	a0,a0,-512 # 800050f0 <CONSOLE_STATUS+0xe0>
    800012f8:	00001097          	auipc	ra,0x1
    800012fc:	c8c080e7          	jalr	-884(ra) # 80001f84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001300:	00000693          	li	a3,0
    80001304:	fa1ff06f          	j	800012a4 <_Z11workerBodyAv+0x20>
            // TCB::yield();
        }
    }
}
    80001308:	01813083          	ld	ra,24(sp)
    8000130c:	01013403          	ld	s0,16(sp)
    80001310:	00813483          	ld	s1,8(sp)
    80001314:	02010113          	addi	sp,sp,32
    80001318:	00008067          	ret

000000008000131c <_Z11workerBodyBv>:

void workerBodyB() {
    8000131c:	fe010113          	addi	sp,sp,-32
    80001320:	00113c23          	sd	ra,24(sp)
    80001324:	00813823          	sd	s0,16(sp)
    80001328:	00913423          	sd	s1,8(sp)
    8000132c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001330:	00000493          	li	s1,0
    80001334:	0300006f          	j	80001364 <_Z11workerBodyBv+0x48>
        printString("B: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    80001338:	00168693          	addi	a3,a3,1
    8000133c:	000027b7          	lui	a5,0x2
    80001340:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001344:	00d7ee63          	bltu	a5,a3,80001360 <_Z11workerBodyBv+0x44>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001348:	00000713          	li	a4,0
    8000134c:	000077b7          	lui	a5,0x7
    80001350:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001354:	fee7e2e3          	bltu	a5,a4,80001338 <_Z11workerBodyBv+0x1c>
    80001358:	00170713          	addi	a4,a4,1
    8000135c:	ff1ff06f          	j	8000134c <_Z11workerBodyBv+0x30>
    for (uint64 i = 0; i < 16; i++) {
    80001360:	00148493          	addi	s1,s1,1
    80001364:	00f00793          	li	a5,15
    80001368:	0297ec63          	bltu	a5,s1,800013a0 <_Z11workerBodyBv+0x84>
        printString("B: i="); printInteger(i); printString("\n");
    8000136c:	00004517          	auipc	a0,0x4
    80001370:	cbc50513          	addi	a0,a0,-836 # 80005028 <CONSOLE_STATUS+0x18>
    80001374:	00001097          	auipc	ra,0x1
    80001378:	c10080e7          	jalr	-1008(ra) # 80001f84 <_Z11printStringPKc>
    8000137c:	00048513          	mv	a0,s1
    80001380:	00001097          	auipc	ra,0x1
    80001384:	c74080e7          	jalr	-908(ra) # 80001ff4 <_Z12printIntegerm>
    80001388:	00004517          	auipc	a0,0x4
    8000138c:	d6850513          	addi	a0,a0,-664 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001390:	00001097          	auipc	ra,0x1
    80001394:	bf4080e7          	jalr	-1036(ra) # 80001f84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001398:	00000693          	li	a3,0
    8000139c:	fa1ff06f          	j	8000133c <_Z11workerBodyBv+0x20>
            // TCB::yield();
        }
    }
}
    800013a0:	01813083          	ld	ra,24(sp)
    800013a4:	01013403          	ld	s0,16(sp)
    800013a8:	00813483          	ld	s1,8(sp)
    800013ac:	02010113          	addi	sp,sp,32
    800013b0:	00008067          	ret

00000000800013b4 <_Z9fibonaccim>:

uint64 fibonacci(uint64 n) {
    800013b4:	fe010113          	addi	sp,sp,-32
    800013b8:	00113c23          	sd	ra,24(sp)
    800013bc:	00813823          	sd	s0,16(sp)
    800013c0:	00913423          	sd	s1,8(sp)
    800013c4:	01213023          	sd	s2,0(sp)
    800013c8:	02010413          	addi	s0,sp,32
    800013cc:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800013d0:	00100793          	li	a5,1
    800013d4:	02a7f863          	bgeu	a5,a0,80001404 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { TCB::yield(); }
    800013d8:	00a00793          	li	a5,10
    800013dc:	02f577b3          	remu	a5,a0,a5
    800013e0:	02078e63          	beqz	a5,8000141c <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800013e4:	fff48513          	addi	a0,s1,-1
    800013e8:	00000097          	auipc	ra,0x0
    800013ec:	fcc080e7          	jalr	-52(ra) # 800013b4 <_Z9fibonaccim>
    800013f0:	00050913          	mv	s2,a0
    800013f4:	ffe48513          	addi	a0,s1,-2
    800013f8:	00000097          	auipc	ra,0x0
    800013fc:	fbc080e7          	jalr	-68(ra) # 800013b4 <_Z9fibonaccim>
    80001400:	00a90533          	add	a0,s2,a0
}
    80001404:	01813083          	ld	ra,24(sp)
    80001408:	01013403          	ld	s0,16(sp)
    8000140c:	00813483          	ld	s1,8(sp)
    80001410:	00013903          	ld	s2,0(sp)
    80001414:	02010113          	addi	sp,sp,32
    80001418:	00008067          	ret
    if (n % 10 == 0) { TCB::yield(); }
    8000141c:	00000097          	auipc	ra,0x0
    80001420:	4f0080e7          	jalr	1264(ra) # 8000190c <_ZN3TCB5yieldEv>
    80001424:	fc1ff06f          	j	800013e4 <_Z9fibonaccim+0x30>

0000000080001428 <_Z11workerBodyCv>:
void workerBodyC() {
    80001428:	fe010113          	addi	sp,sp,-32
    8000142c:	00113c23          	sd	ra,24(sp)
    80001430:	00813823          	sd	s0,16(sp)
    80001434:	00913423          	sd	s1,8(sp)
    80001438:	01213023          	sd	s2,0(sp)
    8000143c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001440:	00000493          	li	s1,0
    80001444:	0380006f          	j	8000147c <_Z11workerBodyCv+0x54>
    for (; i < 3; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    80001448:	00004517          	auipc	a0,0x4
    8000144c:	be850513          	addi	a0,a0,-1048 # 80005030 <CONSOLE_STATUS+0x20>
    80001450:	00001097          	auipc	ra,0x1
    80001454:	b34080e7          	jalr	-1228(ra) # 80001f84 <_Z11printStringPKc>
    80001458:	00048513          	mv	a0,s1
    8000145c:	00001097          	auipc	ra,0x1
    80001460:	b98080e7          	jalr	-1128(ra) # 80001ff4 <_Z12printIntegerm>
    80001464:	00004517          	auipc	a0,0x4
    80001468:	c8c50513          	addi	a0,a0,-884 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000146c:	00001097          	auipc	ra,0x1
    80001470:	b18080e7          	jalr	-1256(ra) # 80001f84 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80001474:	0014849b          	addiw	s1,s1,1
    80001478:	0ff4f493          	andi	s1,s1,255
    8000147c:	00200793          	li	a5,2
    80001480:	fc97f4e3          	bgeu	a5,s1,80001448 <_Z11workerBodyCv+0x20>
    }

    printString("C: yield\n");
    80001484:	00004517          	auipc	a0,0x4
    80001488:	bb450513          	addi	a0,a0,-1100 # 80005038 <CONSOLE_STATUS+0x28>
    8000148c:	00001097          	auipc	ra,0x1
    80001490:	af8080e7          	jalr	-1288(ra) # 80001f84 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80001494:	00700313          	li	t1,7
    TCB::yield();
    80001498:	00000097          	auipc	ra,0x0
    8000149c:	474080e7          	jalr	1140(ra) # 8000190c <_ZN3TCB5yieldEv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800014a0:	00030913          	mv	s2,t1

    printString("C: t1="); printInteger(t1); printString("\n");
    800014a4:	00004517          	auipc	a0,0x4
    800014a8:	ba450513          	addi	a0,a0,-1116 # 80005048 <CONSOLE_STATUS+0x38>
    800014ac:	00001097          	auipc	ra,0x1
    800014b0:	ad8080e7          	jalr	-1320(ra) # 80001f84 <_Z11printStringPKc>
    800014b4:	00090513          	mv	a0,s2
    800014b8:	00001097          	auipc	ra,0x1
    800014bc:	b3c080e7          	jalr	-1220(ra) # 80001ff4 <_Z12printIntegerm>
    800014c0:	00004517          	auipc	a0,0x4
    800014c4:	c3050513          	addi	a0,a0,-976 # 800050f0 <CONSOLE_STATUS+0xe0>
    800014c8:	00001097          	auipc	ra,0x1
    800014cc:	abc080e7          	jalr	-1348(ra) # 80001f84 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800014d0:	00c00513          	li	a0,12
    800014d4:	00000097          	auipc	ra,0x0
    800014d8:	ee0080e7          	jalr	-288(ra) # 800013b4 <_Z9fibonaccim>
    800014dc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInteger(result); printString("\n");
    800014e0:	00004517          	auipc	a0,0x4
    800014e4:	b7050513          	addi	a0,a0,-1168 # 80005050 <CONSOLE_STATUS+0x40>
    800014e8:	00001097          	auipc	ra,0x1
    800014ec:	a9c080e7          	jalr	-1380(ra) # 80001f84 <_Z11printStringPKc>
    800014f0:	00090513          	mv	a0,s2
    800014f4:	00001097          	auipc	ra,0x1
    800014f8:	b00080e7          	jalr	-1280(ra) # 80001ff4 <_Z12printIntegerm>
    800014fc:	00004517          	auipc	a0,0x4
    80001500:	bf450513          	addi	a0,a0,-1036 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001504:	00001097          	auipc	ra,0x1
    80001508:	a80080e7          	jalr	-1408(ra) # 80001f84 <_Z11printStringPKc>
    8000150c:	0380006f          	j	80001544 <_Z11workerBodyCv+0x11c>

    for (; i < 6; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    80001510:	00004517          	auipc	a0,0x4
    80001514:	b2050513          	addi	a0,a0,-1248 # 80005030 <CONSOLE_STATUS+0x20>
    80001518:	00001097          	auipc	ra,0x1
    8000151c:	a6c080e7          	jalr	-1428(ra) # 80001f84 <_Z11printStringPKc>
    80001520:	00048513          	mv	a0,s1
    80001524:	00001097          	auipc	ra,0x1
    80001528:	ad0080e7          	jalr	-1328(ra) # 80001ff4 <_Z12printIntegerm>
    8000152c:	00004517          	auipc	a0,0x4
    80001530:	bc450513          	addi	a0,a0,-1084 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001534:	00001097          	auipc	ra,0x1
    80001538:	a50080e7          	jalr	-1456(ra) # 80001f84 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000153c:	0014849b          	addiw	s1,s1,1
    80001540:	0ff4f493          	andi	s1,s1,255
    80001544:	00500793          	li	a5,5
    80001548:	fc97f4e3          	bgeu	a5,s1,80001510 <_Z11workerBodyCv+0xe8>
    }
//    TCB::yield();
}
    8000154c:	01813083          	ld	ra,24(sp)
    80001550:	01013403          	ld	s0,16(sp)
    80001554:	00813483          	ld	s1,8(sp)
    80001558:	00013903          	ld	s2,0(sp)
    8000155c:	02010113          	addi	sp,sp,32
    80001560:	00008067          	ret

0000000080001564 <_Z11workerBodyDv>:
void workerBodyD() {
    80001564:	fe010113          	addi	sp,sp,-32
    80001568:	00113c23          	sd	ra,24(sp)
    8000156c:	00813823          	sd	s0,16(sp)
    80001570:	00913423          	sd	s1,8(sp)
    80001574:	01213023          	sd	s2,0(sp)
    80001578:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000157c:	00a00493          	li	s1,10
    80001580:	0380006f          	j	800015b8 <_Z11workerBodyDv+0x54>
    for (; i < 13; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    80001584:	00004517          	auipc	a0,0x4
    80001588:	adc50513          	addi	a0,a0,-1316 # 80005060 <CONSOLE_STATUS+0x50>
    8000158c:	00001097          	auipc	ra,0x1
    80001590:	9f8080e7          	jalr	-1544(ra) # 80001f84 <_Z11printStringPKc>
    80001594:	00048513          	mv	a0,s1
    80001598:	00001097          	auipc	ra,0x1
    8000159c:	a5c080e7          	jalr	-1444(ra) # 80001ff4 <_Z12printIntegerm>
    800015a0:	00004517          	auipc	a0,0x4
    800015a4:	b5050513          	addi	a0,a0,-1200 # 800050f0 <CONSOLE_STATUS+0xe0>
    800015a8:	00001097          	auipc	ra,0x1
    800015ac:	9dc080e7          	jalr	-1572(ra) # 80001f84 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800015b0:	0014849b          	addiw	s1,s1,1
    800015b4:	0ff4f493          	andi	s1,s1,255
    800015b8:	00c00793          	li	a5,12
    800015bc:	fc97f4e3          	bgeu	a5,s1,80001584 <_Z11workerBodyDv+0x20>
    }

    printString("D: yield\n");
    800015c0:	00004517          	auipc	a0,0x4
    800015c4:	aa850513          	addi	a0,a0,-1368 # 80005068 <CONSOLE_STATUS+0x58>
    800015c8:	00001097          	auipc	ra,0x1
    800015cc:	9bc080e7          	jalr	-1604(ra) # 80001f84 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800015d0:	00500313          	li	t1,5
    TCB::yield();
    800015d4:	00000097          	auipc	ra,0x0
    800015d8:	338080e7          	jalr	824(ra) # 8000190c <_ZN3TCB5yieldEv>

    uint64 result = fibonacci(16);
    800015dc:	01000513          	li	a0,16
    800015e0:	00000097          	auipc	ra,0x0
    800015e4:	dd4080e7          	jalr	-556(ra) # 800013b4 <_Z9fibonaccim>
    800015e8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInteger(result); printString("\n");
    800015ec:	00004517          	auipc	a0,0x4
    800015f0:	a8c50513          	addi	a0,a0,-1396 # 80005078 <CONSOLE_STATUS+0x68>
    800015f4:	00001097          	auipc	ra,0x1
    800015f8:	990080e7          	jalr	-1648(ra) # 80001f84 <_Z11printStringPKc>
    800015fc:	00090513          	mv	a0,s2
    80001600:	00001097          	auipc	ra,0x1
    80001604:	9f4080e7          	jalr	-1548(ra) # 80001ff4 <_Z12printIntegerm>
    80001608:	00004517          	auipc	a0,0x4
    8000160c:	ae850513          	addi	a0,a0,-1304 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001610:	00001097          	auipc	ra,0x1
    80001614:	974080e7          	jalr	-1676(ra) # 80001f84 <_Z11printStringPKc>
    80001618:	0380006f          	j	80001650 <_Z11workerBodyDv+0xec>

    for (; i < 16; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    8000161c:	00004517          	auipc	a0,0x4
    80001620:	a4450513          	addi	a0,a0,-1468 # 80005060 <CONSOLE_STATUS+0x50>
    80001624:	00001097          	auipc	ra,0x1
    80001628:	960080e7          	jalr	-1696(ra) # 80001f84 <_Z11printStringPKc>
    8000162c:	00048513          	mv	a0,s1
    80001630:	00001097          	auipc	ra,0x1
    80001634:	9c4080e7          	jalr	-1596(ra) # 80001ff4 <_Z12printIntegerm>
    80001638:	00004517          	auipc	a0,0x4
    8000163c:	ab850513          	addi	a0,a0,-1352 # 800050f0 <CONSOLE_STATUS+0xe0>
    80001640:	00001097          	auipc	ra,0x1
    80001644:	944080e7          	jalr	-1724(ra) # 80001f84 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80001648:	0014849b          	addiw	s1,s1,1
    8000164c:	0ff4f493          	andi	s1,s1,255
    80001650:	00f00793          	li	a5,15
    80001654:	fc97f4e3          	bgeu	a5,s1,8000161c <_Z11workerBodyDv+0xb8>
    }
//    TCB::yield();
}
    80001658:	01813083          	ld	ra,24(sp)
    8000165c:	01013403          	ld	s0,16(sp)
    80001660:	00813483          	ld	s1,8(sp)
    80001664:	00013903          	ld	s2,0(sp)
    80001668:	02010113          	addi	sp,sp,32
    8000166c:	00008067          	ret

0000000080001670 <main>:
#include "../h/print.hpp"
#include "../h/tcb.hpp"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"

int main() {
    80001670:	fb010113          	addi	sp,sp,-80
    80001674:	04113423          	sd	ra,72(sp)
    80001678:	04813023          	sd	s0,64(sp)
    8000167c:	02913c23          	sd	s1,56(sp)
    80001680:	03213823          	sd	s2,48(sp)
    80001684:	05010413          	addi	s0,sp,80
    MemoryAllocator::memAlloc();
    80001688:	00000097          	auipc	ra,0x0
    8000168c:	680080e7          	jalr	1664(ra) # 80001d08 <_ZN15MemoryAllocator8memAllocEv>
    TCB *threads[5];
    threads[0] = TCB::createThread(nullptr);
    80001690:	00000513          	li	a0,0
    80001694:	00000097          	auipc	ra,0x0
    80001698:	200080e7          	jalr	512(ra) # 80001894 <_ZN3TCB12createThreadEPFvvE>
    8000169c:	faa43c23          	sd	a0,-72(s0)
    TCB::running = threads[0];
    800016a0:	00004797          	auipc	a5,0x4
    800016a4:	1f07b783          	ld	a5,496(a5) # 80005890 <_GLOBAL_OFFSET_TABLE_+0x38>
    800016a8:	00a7b023          	sd	a0,0(a5)
    threads[1] = TCB::createThread(workerBodyA);
    800016ac:	00004517          	auipc	a0,0x4
    800016b0:	1d453503          	ld	a0,468(a0) # 80005880 <_GLOBAL_OFFSET_TABLE_+0x28>
    800016b4:	00000097          	auipc	ra,0x0
    800016b8:	1e0080e7          	jalr	480(ra) # 80001894 <_ZN3TCB12createThreadEPFvvE>
    800016bc:	fca43023          	sd	a0,-64(s0)
    printString("ThreadA created\n");
    800016c0:	00004517          	auipc	a0,0x4
    800016c4:	9c850513          	addi	a0,a0,-1592 # 80005088 <CONSOLE_STATUS+0x78>
    800016c8:	00001097          	auipc	ra,0x1
    800016cc:	8bc080e7          	jalr	-1860(ra) # 80001f84 <_Z11printStringPKc>
    threads[2] = TCB::createThread(workerBodyB);
    800016d0:	00004517          	auipc	a0,0x4
    800016d4:	1a053503          	ld	a0,416(a0) # 80005870 <_GLOBAL_OFFSET_TABLE_+0x18>
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	1bc080e7          	jalr	444(ra) # 80001894 <_ZN3TCB12createThreadEPFvvE>
    800016e0:	fca43423          	sd	a0,-56(s0)
    printString("ThreadB created\n");
    800016e4:	00004517          	auipc	a0,0x4
    800016e8:	9bc50513          	addi	a0,a0,-1604 # 800050a0 <CONSOLE_STATUS+0x90>
    800016ec:	00001097          	auipc	ra,0x1
    800016f0:	898080e7          	jalr	-1896(ra) # 80001f84 <_Z11printStringPKc>
    threads[3] = TCB::createThread(workerBodyC);
    800016f4:	00004517          	auipc	a0,0x4
    800016f8:	1ac53503          	ld	a0,428(a0) # 800058a0 <_GLOBAL_OFFSET_TABLE_+0x48>
    800016fc:	00000097          	auipc	ra,0x0
    80001700:	198080e7          	jalr	408(ra) # 80001894 <_ZN3TCB12createThreadEPFvvE>
    80001704:	fca43823          	sd	a0,-48(s0)
    printString("ThreadC created\n");
    80001708:	00004517          	auipc	a0,0x4
    8000170c:	9b050513          	addi	a0,a0,-1616 # 800050b8 <CONSOLE_STATUS+0xa8>
    80001710:	00001097          	auipc	ra,0x1
    80001714:	874080e7          	jalr	-1932(ra) # 80001f84 <_Z11printStringPKc>
    threads[4] = TCB::createThread(workerBodyD);
    80001718:	00004517          	auipc	a0,0x4
    8000171c:	19053503          	ld	a0,400(a0) # 800058a8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001720:	00000097          	auipc	ra,0x0
    80001724:	174080e7          	jalr	372(ra) # 80001894 <_ZN3TCB12createThreadEPFvvE>
    80001728:	fca43c23          	sd	a0,-40(s0)
    printString("ThreadD created\n");
    8000172c:	00004517          	auipc	a0,0x4
    80001730:	9a450513          	addi	a0,a0,-1628 # 800050d0 <CONSOLE_STATUS+0xc0>
    80001734:	00001097          	auipc	ra,0x1
    80001738:	850080e7          	jalr	-1968(ra) # 80001f84 <_Z11printStringPKc>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    8000173c:	00004797          	auipc	a5,0x4
    80001740:	12c7b783          	ld	a5,300(a5) # 80005868 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001744:	10579073          	csrw	stvec,a5
inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001748:	00200793          	li	a5,2
    8000174c:	1007a073          	csrs	sstatus,a5
}
    80001750:	00c0006f          	j	8000175c <main+0xec>
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
             threads[3]->isFinished() && threads[4]->isFinished())) {
        TCB::yield();
    80001754:	00000097          	auipc	ra,0x0
    80001758:	1b8080e7          	jalr	440(ra) # 8000190c <_ZN3TCB5yieldEv>
    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
    8000175c:	fc043783          	ld	a5,-64(s0)
#include "../lib/hw.h"

class TCB {
        public:
        ~TCB() { delete[] stack; }
        bool isFinished() const { return finished; }
    80001760:	0287c783          	lbu	a5,40(a5)
    80001764:	fe0788e3          	beqz	a5,80001754 <main+0xe4>
    80001768:	fc843783          	ld	a5,-56(s0)
    8000176c:	0287c783          	lbu	a5,40(a5)
    80001770:	fe0782e3          	beqz	a5,80001754 <main+0xe4>
             threads[3]->isFinished() && threads[4]->isFinished())) {
    80001774:	fd043783          	ld	a5,-48(s0)
    80001778:	0287c783          	lbu	a5,40(a5)
    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
    8000177c:	fc078ce3          	beqz	a5,80001754 <main+0xe4>
             threads[3]->isFinished() && threads[4]->isFinished())) {
    80001780:	fd843783          	ld	a5,-40(s0)
    80001784:	0287c783          	lbu	a5,40(a5)
    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
    80001788:	fc0786e3          	beqz	a5,80001754 <main+0xe4>
    8000178c:	fb840493          	addi	s1,s0,-72
    80001790:	0140006f          	j	800017a4 <main+0x134>
    }
    for (auto &thread: threads) { delete thread; }
    80001794:	00090513          	mv	a0,s2
    80001798:	00000097          	auipc	ra,0x0
    8000179c:	2a0080e7          	jalr	672(ra) # 80001a38 <_ZdlPv>
    800017a0:	00848493          	addi	s1,s1,8
    800017a4:	fe040793          	addi	a5,s0,-32
    800017a8:	02f48063          	beq	s1,a5,800017c8 <main+0x158>
    800017ac:	0004b903          	ld	s2,0(s1)
    800017b0:	fe0908e3          	beqz	s2,800017a0 <main+0x130>
        ~TCB() { delete[] stack; }
    800017b4:	00893503          	ld	a0,8(s2)
    800017b8:	fc050ee3          	beqz	a0,80001794 <main+0x124>
    800017bc:	00000097          	auipc	ra,0x0
    800017c0:	2a4080e7          	jalr	676(ra) # 80001a60 <_ZdaPv>
    800017c4:	fd1ff06f          	j	80001794 <main+0x124>
    printString("Finished\n");
    800017c8:	00004517          	auipc	a0,0x4
    800017cc:	92050513          	addi	a0,a0,-1760 # 800050e8 <CONSOLE_STATUS+0xd8>
    800017d0:	00000097          	auipc	ra,0x0
    800017d4:	7b4080e7          	jalr	1972(ra) # 80001f84 <_Z11printStringPKc>
    return 0;
}
    800017d8:	00000513          	li	a0,0
    800017dc:	04813083          	ld	ra,72(sp)
    800017e0:	04013403          	ld	s0,64(sp)
    800017e4:	03813483          	ld	s1,56(sp)
    800017e8:	03013903          	ld	s2,48(sp)
    800017ec:	05010113          	addi	sp,sp,80
    800017f0:	00008067          	ret

00000000800017f4 <_ZN3TCBC1EPFvvEm>:


TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

TCB::TCB(Body body, uint64 timeSlice) : body(body),
    800017f4:	fd010113          	addi	sp,sp,-48
    800017f8:	02113423          	sd	ra,40(sp)
    800017fc:	02813023          	sd	s0,32(sp)
    80001800:	00913c23          	sd	s1,24(sp)
    80001804:	01213823          	sd	s2,16(sp)
    80001808:	01313423          	sd	s3,8(sp)
    8000180c:	03010413          	addi	s0,sp,48
    80001810:	00050493          	mv	s1,a0
    80001814:	00058913          	mv	s2,a1
    80001818:	00060993          	mv	s3,a2
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
context({(uint64) &threadWrapper,
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
timeSlice(timeSlice),
finished(false) { if (body != nullptr) { Scheduler::put(this); } }
    8000181c:	00b53023          	sd	a1,0(a0)
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    80001820:	06058263          	beqz	a1,80001884 <_ZN3TCBC1EPFvvEm+0x90>
    80001824:	00002537          	lui	a0,0x2
    80001828:	00000097          	auipc	ra,0x0
    8000182c:	1e8080e7          	jalr	488(ra) # 80001a10 <_Znam>
finished(false) { if (body != nullptr) { Scheduler::put(this); } }
    80001830:	00a4b423          	sd	a0,8(s1)
    80001834:	00000797          	auipc	a5,0x0
    80001838:	0f478793          	addi	a5,a5,244 # 80001928 <_ZN3TCB13threadWrapperEv>
    8000183c:	00f4b823          	sd	a5,16(s1)
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
    80001840:	04050663          	beqz	a0,8000188c <_ZN3TCBC1EPFvvEm+0x98>
    80001844:	000027b7          	lui	a5,0x2
    80001848:	00f50533          	add	a0,a0,a5
finished(false) { if (body != nullptr) { Scheduler::put(this); } }
    8000184c:	00a4bc23          	sd	a0,24(s1)
    80001850:	0334b023          	sd	s3,32(s1)
    80001854:	02048423          	sb	zero,40(s1)
    80001858:	00090863          	beqz	s2,80001868 <_ZN3TCBC1EPFvvEm+0x74>
    8000185c:	00048513          	mv	a0,s1
    80001860:	00000097          	auipc	ra,0x0
    80001864:	408080e7          	jalr	1032(ra) # 80001c68 <_ZN9Scheduler3putEP3TCB>
    80001868:	02813083          	ld	ra,40(sp)
    8000186c:	02013403          	ld	s0,32(sp)
    80001870:	01813483          	ld	s1,24(sp)
    80001874:	01013903          	ld	s2,16(sp)
    80001878:	00813983          	ld	s3,8(sp)
    8000187c:	03010113          	addi	sp,sp,48
    80001880:	00008067          	ret
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    80001884:	00000513          	li	a0,0
    80001888:	fa9ff06f          	j	80001830 <_ZN3TCBC1EPFvvEm+0x3c>
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
    8000188c:	00000513          	li	a0,0
    80001890:	fbdff06f          	j	8000184c <_ZN3TCBC1EPFvvEm+0x58>

0000000080001894 <_ZN3TCB12createThreadEPFvvE>:

TCB *TCB::createThread(Body body) { return new TCB(body, TIME_SLICE); }
    80001894:	fe010113          	addi	sp,sp,-32
    80001898:	00113c23          	sd	ra,24(sp)
    8000189c:	00813823          	sd	s0,16(sp)
    800018a0:	00913423          	sd	s1,8(sp)
    800018a4:	01213023          	sd	s2,0(sp)
    800018a8:	02010413          	addi	s0,sp,32
    800018ac:	00050913          	mv	s2,a0
    800018b0:	03000513          	li	a0,48
    800018b4:	00000097          	auipc	ra,0x0
    800018b8:	134080e7          	jalr	308(ra) # 800019e8 <_Znwm>
    800018bc:	00050493          	mv	s1,a0
    800018c0:	00200613          	li	a2,2
    800018c4:	00090593          	mv	a1,s2
    800018c8:	00000097          	auipc	ra,0x0
    800018cc:	f2c080e7          	jalr	-212(ra) # 800017f4 <_ZN3TCBC1EPFvvEm>
    800018d0:	0200006f          	j	800018f0 <_ZN3TCB12createThreadEPFvvE+0x5c>
    800018d4:	00050913          	mv	s2,a0
    800018d8:	00048513          	mv	a0,s1
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	15c080e7          	jalr	348(ra) # 80001a38 <_ZdlPv>
    800018e4:	00090513          	mv	a0,s2
    800018e8:	00005097          	auipc	ra,0x5
    800018ec:	110080e7          	jalr	272(ra) # 800069f8 <_Unwind_Resume>
    800018f0:	00048513          	mv	a0,s1
    800018f4:	01813083          	ld	ra,24(sp)
    800018f8:	01013403          	ld	s0,16(sp)
    800018fc:	00813483          	ld	s1,8(sp)
    80001900:	00013903          	ld	s2,0(sp)
    80001904:	02010113          	addi	sp,sp,32
    80001908:	00008067          	ret

000000008000190c <_ZN3TCB5yieldEv>:

void TCB::yield() { __asm__ volatile ("ecall"); }
    8000190c:	ff010113          	addi	sp,sp,-16
    80001910:	00813423          	sd	s0,8(sp)
    80001914:	01010413          	addi	s0,sp,16
    80001918:	00000073          	ecall
    8000191c:	00813403          	ld	s0,8(sp)
    80001920:	01010113          	addi	sp,sp,16
    80001924:	00008067          	ret

0000000080001928 <_ZN3TCB13threadWrapperEv>:
    if (!old->isFinished()) { Scheduler::put(old); }
    running = Scheduler::get();
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper() {
    80001928:	fe010113          	addi	sp,sp,-32
    8000192c:	00113c23          	sd	ra,24(sp)
    80001930:	00813823          	sd	s0,16(sp)
    80001934:	00913423          	sd	s1,8(sp)
    80001938:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    8000193c:	00000097          	auipc	ra,0x0
    80001940:	14c080e7          	jalr	332(ra) # 80001a88 <_ZN5Riscv10popSppSpieEv>
    running->body();
    80001944:	00004497          	auipc	s1,0x4
    80001948:	fbc48493          	addi	s1,s1,-68 # 80005900 <_ZN3TCB7runningE>
    8000194c:	0004b783          	ld	a5,0(s1)
    80001950:	0007b783          	ld	a5,0(a5) # 2000 <_entry-0x7fffe000>
    80001954:	000780e7          	jalr	a5
    running->setFinished(true);
    80001958:	0004b783          	ld	a5,0(s1)
        void setFinished(bool value) { finished = value; }
    8000195c:	00100713          	li	a4,1
    80001960:	02e78423          	sb	a4,40(a5)
    TCB::yield();
    80001964:	00000097          	auipc	ra,0x0
    80001968:	fa8080e7          	jalr	-88(ra) # 8000190c <_ZN3TCB5yieldEv>
}
    8000196c:	01813083          	ld	ra,24(sp)
    80001970:	01013403          	ld	s0,16(sp)
    80001974:	00813483          	ld	s1,8(sp)
    80001978:	02010113          	addi	sp,sp,32
    8000197c:	00008067          	ret

0000000080001980 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80001980:	fe010113          	addi	sp,sp,-32
    80001984:	00113c23          	sd	ra,24(sp)
    80001988:	00813823          	sd	s0,16(sp)
    8000198c:	00913423          	sd	s1,8(sp)
    80001990:	02010413          	addi	s0,sp,32
    TCB *old = running;
    80001994:	00004497          	auipc	s1,0x4
    80001998:	f6c4b483          	ld	s1,-148(s1) # 80005900 <_ZN3TCB7runningE>
        bool isFinished() const { return finished; }
    8000199c:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished()) { Scheduler::put(old); }
    800019a0:	02078c63          	beqz	a5,800019d8 <_ZN3TCB8dispatchEv+0x58>
    running = Scheduler::get();
    800019a4:	00000097          	auipc	ra,0x0
    800019a8:	25c080e7          	jalr	604(ra) # 80001c00 <_ZN9Scheduler3getEv>
    800019ac:	00004797          	auipc	a5,0x4
    800019b0:	f4a7ba23          	sd	a0,-172(a5) # 80005900 <_ZN3TCB7runningE>
    TCB::contextSwitch(&old->context, &running->context);
    800019b4:	01050593          	addi	a1,a0,16 # 2010 <_entry-0x7fffdff0>
    800019b8:	01048513          	addi	a0,s1,16
    800019bc:	00000097          	auipc	ra,0x0
    800019c0:	854080e7          	jalr	-1964(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800019c4:	01813083          	ld	ra,24(sp)
    800019c8:	01013403          	ld	s0,16(sp)
    800019cc:	00813483          	ld	s1,8(sp)
    800019d0:	02010113          	addi	sp,sp,32
    800019d4:	00008067          	ret
    if (!old->isFinished()) { Scheduler::put(old); }
    800019d8:	00048513          	mv	a0,s1
    800019dc:	00000097          	auipc	ra,0x0
    800019e0:	28c080e7          	jalr	652(ra) # 80001c68 <_ZN9Scheduler3putEP3TCB>
    800019e4:	fc1ff06f          	j	800019a4 <_ZN3TCB8dispatchEv+0x24>

00000000800019e8 <_Znwm>:
// Created by os on 4/26/22.
//
#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"

void *operator new(uint64 n) { return MemoryAllocator::mem_alloc(n); }
    800019e8:	ff010113          	addi	sp,sp,-16
    800019ec:	00113423          	sd	ra,8(sp)
    800019f0:	00813023          	sd	s0,0(sp)
    800019f4:	01010413          	addi	s0,sp,16
    800019f8:	00000097          	auipc	ra,0x0
    800019fc:	360080e7          	jalr	864(ra) # 80001d58 <_ZN15MemoryAllocator9mem_allocEm>
    80001a00:	00813083          	ld	ra,8(sp)
    80001a04:	00013403          	ld	s0,0(sp)
    80001a08:	01010113          	addi	sp,sp,16
    80001a0c:	00008067          	ret

0000000080001a10 <_Znam>:
void *operator new[](uint64 n) { return MemoryAllocator::mem_alloc(n); }
    80001a10:	ff010113          	addi	sp,sp,-16
    80001a14:	00113423          	sd	ra,8(sp)
    80001a18:	00813023          	sd	s0,0(sp)
    80001a1c:	01010413          	addi	s0,sp,16
    80001a20:	00000097          	auipc	ra,0x0
    80001a24:	338080e7          	jalr	824(ra) # 80001d58 <_ZN15MemoryAllocator9mem_allocEm>
    80001a28:	00813083          	ld	ra,8(sp)
    80001a2c:	00013403          	ld	s0,0(sp)
    80001a30:	01010113          	addi	sp,sp,16
    80001a34:	00008067          	ret

0000000080001a38 <_ZdlPv>:

void operator delete(void *p) noexcept { MemoryAllocator::mem_free(p); }
    80001a38:	ff010113          	addi	sp,sp,-16
    80001a3c:	00113423          	sd	ra,8(sp)
    80001a40:	00813023          	sd	s0,0(sp)
    80001a44:	01010413          	addi	s0,sp,16
    80001a48:	00000097          	auipc	ra,0x0
    80001a4c:	450080e7          	jalr	1104(ra) # 80001e98 <_ZN15MemoryAllocator8mem_freeEPv>
    80001a50:	00813083          	ld	ra,8(sp)
    80001a54:	00013403          	ld	s0,0(sp)
    80001a58:	01010113          	addi	sp,sp,16
    80001a5c:	00008067          	ret

0000000080001a60 <_ZdaPv>:
void operator delete[](void *p) noexcept { MemoryAllocator::mem_free(p); }
    80001a60:	ff010113          	addi	sp,sp,-16
    80001a64:	00113423          	sd	ra,8(sp)
    80001a68:	00813023          	sd	s0,0(sp)
    80001a6c:	01010413          	addi	s0,sp,16
    80001a70:	00000097          	auipc	ra,0x0
    80001a74:	428080e7          	jalr	1064(ra) # 80001e98 <_ZN15MemoryAllocator8mem_freeEPv>
    80001a78:	00813083          	ld	ra,8(sp)
    80001a7c:	00013403          	ld	s0,0(sp)
    80001a80:	01010113          	addi	sp,sp,16
    80001a84:	00008067          	ret

0000000080001a88 <_ZN5Riscv10popSppSpieEv>:
//
#include "../h/riscv.hpp"
#include "../h/tcb.hpp"
#include "../lib/console.h"

void Riscv::popSppSpie() {
    80001a88:	ff010113          	addi	sp,sp,-16
    80001a8c:	00813423          	sd	s0,8(sp)
    80001a90:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001a94:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001a98:	10200073          	sret
}
    80001a9c:	00813403          	ld	s0,8(sp)
    80001aa0:	01010113          	addi	sp,sp,16
    80001aa4:	00008067          	ret

0000000080001aa8 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80001aa8:	fb010113          	addi	sp,sp,-80
    80001aac:	04113423          	sd	ra,72(sp)
    80001ab0:	04813023          	sd	s0,64(sp)
    80001ab4:	02913c23          	sd	s1,56(sp)
    80001ab8:	03213823          	sd	s2,48(sp)
    80001abc:	05010413          	addi	s0,sp,80
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001ac0:	142027f3          	csrr	a5,scause
    80001ac4:	faf43c23          	sd	a5,-72(s0)
    return scause;
    80001ac8:	fb843703          	ld	a4,-72(s0)
    uint64 scause = r_scause();
    if (scause == 0x0000000000000009UL) {
    80001acc:	00900793          	li	a5,9
    80001ad0:	02f70e63          	beq	a4,a5,80001b0c <_ZN5Riscv20handleSupervisorTrapEv+0x64>
        // interrupt: no; cause code: environment call from S-mode(9)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch();
        w_sstatus(sstatus); w_sepc(sepc);
    } else if (scause == 0x8000000000000001UL) {
    80001ad4:	fff00793          	li	a5,-1
    80001ad8:	03f79793          	slli	a5,a5,0x3f
    80001adc:	00178793          	addi	a5,a5,1
    80001ae0:	06f70463          	beq	a4,a5,80001b48 <_ZN5Riscv20handleSupervisorTrapEv+0xa0>
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus); w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    } else if (scause == 0x8000000000000009UL) {
    80001ae4:	fff00793          	li	a5,-1
    80001ae8:	03f79793          	slli	a5,a5,0x3f
    80001aec:	00978793          	addi	a5,a5,9
    80001af0:	0cf70263          	beq	a4,a5,80001bb4 <_ZN5Riscv20handleSupervisorTrapEv+0x10c>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else {
        // unexpected trap cause
    }
}
    80001af4:	04813083          	ld	ra,72(sp)
    80001af8:	04013403          	ld	s0,64(sp)
    80001afc:	03813483          	ld	s1,56(sp)
    80001b00:	03013903          	ld	s2,48(sp)
    80001b04:	05010113          	addi	sp,sp,80
    80001b08:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001b0c:	141027f3          	csrr	a5,sepc
    80001b10:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80001b14:	fc843483          	ld	s1,-56(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80001b18:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001b1c:	100027f3          	csrr	a5,sstatus
    80001b20:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80001b24:	fc043903          	ld	s2,-64(s0)
        TCB::timeSliceCounter = 0;
    80001b28:	00004797          	auipc	a5,0x4
    80001b2c:	d507b783          	ld	a5,-688(a5) # 80005878 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001b30:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    80001b34:	00000097          	auipc	ra,0x0
    80001b38:	e4c080e7          	jalr	-436(ra) # 80001980 <_ZN3TCB8dispatchEv>
}
inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001b3c:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001b40:	14149073          	csrw	sepc,s1
}
    80001b44:	fb1ff06f          	j	80001af4 <_ZN5Riscv20handleSupervisorTrapEv+0x4c>
        TCB::timeSliceCounter++;
    80001b48:	00004717          	auipc	a4,0x4
    80001b4c:	d3073703          	ld	a4,-720(a4) # 80005878 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001b50:	00073783          	ld	a5,0(a4)
    80001b54:	00178793          	addi	a5,a5,1
    80001b58:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    80001b5c:	00004717          	auipc	a4,0x4
    80001b60:	d3473703          	ld	a4,-716(a4) # 80005890 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001b64:	00073703          	ld	a4,0(a4)
        uint64 getTimeSlice() const { return timeSlice; }
    80001b68:	02073703          	ld	a4,32(a4)
    80001b6c:	00e7f863          	bgeu	a5,a4,80001b7c <_ZN5Riscv20handleSupervisorTrapEv+0xd4>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80001b70:	00200793          	li	a5,2
    80001b74:	1447b073          	csrc	sip,a5
}
    80001b78:	f7dff06f          	j	80001af4 <_ZN5Riscv20handleSupervisorTrapEv+0x4c>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001b7c:	141027f3          	csrr	a5,sepc
    80001b80:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80001b84:	fd843483          	ld	s1,-40(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001b88:	100027f3          	csrr	a5,sstatus
    80001b8c:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80001b90:	fd043903          	ld	s2,-48(s0)
            TCB::timeSliceCounter = 0;
    80001b94:	00004797          	auipc	a5,0x4
    80001b98:	ce47b783          	ld	a5,-796(a5) # 80005878 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001b9c:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80001ba0:	00000097          	auipc	ra,0x0
    80001ba4:	de0080e7          	jalr	-544(ra) # 80001980 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001ba8:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001bac:	14149073          	csrw	sepc,s1
}
    80001bb0:	fc1ff06f          	j	80001b70 <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
        console_handler();
    80001bb4:	00002097          	auipc	ra,0x2
    80001bb8:	60c080e7          	jalr	1548(ra) # 800041c0 <console_handler>
}
    80001bbc:	f39ff06f          	j	80001af4 <_ZN5Riscv20handleSupervisorTrapEv+0x4c>

0000000080001bc0 <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyCoroutineQueue.addLast(tcb);
    80001bc0:	ff010113          	addi	sp,sp,-16
    80001bc4:	00813423          	sd	s0,8(sp)
    80001bc8:	01010413          	addi	s0,sp,16
    80001bcc:	00100793          	li	a5,1
    80001bd0:	00f50863          	beq	a0,a5,80001be0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001bd4:	00813403          	ld	s0,8(sp)
    80001bd8:	01010113          	addi	sp,sp,16
    80001bdc:	00008067          	ret
    80001be0:	000107b7          	lui	a5,0x10
    80001be4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001be8:	fef596e3          	bne	a1,a5,80001bd4 <_Z41__static_initialization_and_destruction_0ii+0x14>
        Elem(T *data, Elem *next) : data(data), next(next){}
    };

    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    80001bec:	00004797          	auipc	a5,0x4
    80001bf0:	d2478793          	addi	a5,a5,-732 # 80005910 <_ZN9Scheduler19readyCoroutineQueueE>
    80001bf4:	0007b023          	sd	zero,0(a5)
    80001bf8:	0007b423          	sd	zero,8(a5)
    80001bfc:	fd9ff06f          	j	80001bd4 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001c00 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80001c00:	fe010113          	addi	sp,sp,-32
    80001c04:	00113c23          	sd	ra,24(sp)
    80001c08:	00813823          	sd	s0,16(sp)
    80001c0c:	00913423          	sd	s1,8(sp)
    80001c10:	02010413          	addi	s0,sp,32
        }else{
            head = tail = elem;
        }
    }
    T *removeFirst(){
        if(!head){ return 0; }
    80001c14:	00004517          	auipc	a0,0x4
    80001c18:	cfc53503          	ld	a0,-772(a0) # 80005910 <_ZN9Scheduler19readyCoroutineQueueE>
    80001c1c:	04050263          	beqz	a0,80001c60 <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80001c20:	00853783          	ld	a5,8(a0)
    80001c24:	00004717          	auipc	a4,0x4
    80001c28:	cef73623          	sd	a5,-788(a4) # 80005910 <_ZN9Scheduler19readyCoroutineQueueE>
        if(!head){ tail = 0; }
    80001c2c:	02078463          	beqz	a5,80001c54 <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80001c30:	00053483          	ld	s1,0(a0)
        delete elem;
    80001c34:	00000097          	auipc	ra,0x0
    80001c38:	e04080e7          	jalr	-508(ra) # 80001a38 <_ZdlPv>
}
    80001c3c:	00048513          	mv	a0,s1
    80001c40:	01813083          	ld	ra,24(sp)
    80001c44:	01013403          	ld	s0,16(sp)
    80001c48:	00813483          	ld	s1,8(sp)
    80001c4c:	02010113          	addi	sp,sp,32
    80001c50:	00008067          	ret
        if(!head){ tail = 0; }
    80001c54:	00004797          	auipc	a5,0x4
    80001c58:	cc07b223          	sd	zero,-828(a5) # 80005918 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001c5c:	fd5ff06f          	j	80001c30 <_ZN9Scheduler3getEv+0x30>
        if(!head){ return 0; }
    80001c60:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    80001c64:	fd9ff06f          	j	80001c3c <_ZN9Scheduler3getEv+0x3c>

0000000080001c68 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80001c68:	fe010113          	addi	sp,sp,-32
    80001c6c:	00113c23          	sd	ra,24(sp)
    80001c70:	00813823          	sd	s0,16(sp)
    80001c74:	00913423          	sd	s1,8(sp)
    80001c78:	02010413          	addi	s0,sp,32
    80001c7c:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80001c80:	01000513          	li	a0,16
    80001c84:	00000097          	auipc	ra,0x0
    80001c88:	d64080e7          	jalr	-668(ra) # 800019e8 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    80001c8c:	00953023          	sd	s1,0(a0)
    80001c90:	00053423          	sd	zero,8(a0)
        if(tail){
    80001c94:	00004797          	auipc	a5,0x4
    80001c98:	c847b783          	ld	a5,-892(a5) # 80005918 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001c9c:	02078263          	beqz	a5,80001cc0 <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    80001ca0:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001ca4:	00004797          	auipc	a5,0x4
    80001ca8:	c6a7ba23          	sd	a0,-908(a5) # 80005918 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001cac:	01813083          	ld	ra,24(sp)
    80001cb0:	01013403          	ld	s0,16(sp)
    80001cb4:	00813483          	ld	s1,8(sp)
    80001cb8:	02010113          	addi	sp,sp,32
    80001cbc:	00008067          	ret
            head = tail = elem;
    80001cc0:	00004797          	auipc	a5,0x4
    80001cc4:	c5078793          	addi	a5,a5,-944 # 80005910 <_ZN9Scheduler19readyCoroutineQueueE>
    80001cc8:	00a7b423          	sd	a0,8(a5)
    80001ccc:	00a7b023          	sd	a0,0(a5)
    80001cd0:	fddff06f          	j	80001cac <_ZN9Scheduler3putEP3TCB+0x44>

0000000080001cd4 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80001cd4:	ff010113          	addi	sp,sp,-16
    80001cd8:	00113423          	sd	ra,8(sp)
    80001cdc:	00813023          	sd	s0,0(sp)
    80001ce0:	01010413          	addi	s0,sp,16
    80001ce4:	000105b7          	lui	a1,0x10
    80001ce8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001cec:	00100513          	li	a0,1
    80001cf0:	00000097          	auipc	ra,0x0
    80001cf4:	ed0080e7          	jalr	-304(ra) # 80001bc0 <_Z41__static_initialization_and_destruction_0ii>
    80001cf8:	00813083          	ld	ra,8(sp)
    80001cfc:	00013403          	ld	s0,0(sp)
    80001d00:	01010113          	addi	sp,sp,16
    80001d04:	00008067          	ret

0000000080001d08 <_ZN15MemoryAllocator8memAllocEv>:

MemoryBloc* MemoryAllocator::freeMemBlocHead;
MemoryBloc* MemoryAllocator::takenMemBlocHead;

// Inicijalizacija memorije
void MemoryAllocator::memAlloc(){
    80001d08:	ff010113          	addi	sp,sp,-16
    80001d0c:	00813423          	sd	s0,8(sp)
    80001d10:	01010413          	addi	s0,sp,16
    freeMemBlocHead = (MemoryBloc*)HEAP_START_ADDR;
    80001d14:	00004797          	auipc	a5,0x4
    80001d18:	b4c7b783          	ld	a5,-1204(a5) # 80005860 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001d1c:	0007b703          	ld	a4,0(a5)
    80001d20:	00004797          	auipc	a5,0x4
    80001d24:	c0078793          	addi	a5,a5,-1024 # 80005920 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001d28:	00e7b023          	sd	a4,0(a5)
    freeMemBlocHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    80001d2c:	00004697          	auipc	a3,0x4
    80001d30:	b6c6b683          	ld	a3,-1172(a3) # 80005898 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001d34:	0006b683          	ld	a3,0(a3)
    80001d38:	40e686b3          	sub	a3,a3,a4
    80001d3c:	00d73023          	sd	a3,0(a4)
    freeMemBlocHead->next = nullptr;
    80001d40:	0007b703          	ld	a4,0(a5)
    80001d44:	00073423          	sd	zero,8(a4)

    takenMemBlocHead = nullptr;
    80001d48:	0007b423          	sd	zero,8(a5)
}
    80001d4c:	00813403          	ld	s0,8(sp)
    80001d50:	01010113          	addi	sp,sp,16
    80001d54:	00008067          	ret

0000000080001d58 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc (size_t size){
    80001d58:	ff010113          	addi	sp,sp,-16
    80001d5c:	00813423          	sd	s0,8(sp)
    80001d60:	01010413          	addi	s0,sp,16
    size_t newSize;

    // ako je velicina veca od MEM_BLOC_SIZE onda uzmi blokova koliko ti treba + sizeof(MemoryBloc)
    // u suprotnom samo MEM_BLOC_SIZE + sizeof(MemoryBloc)
    if(size > MEM_BLOCK_SIZE){
    80001d64:	04000793          	li	a5,64
    80001d68:	02a7fa63          	bgeu	a5,a0,80001d9c <_ZN15MemoryAllocator9mem_allocEm+0x44>
        newSize = ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    80001d6c:	00655713          	srli	a4,a0,0x6
    80001d70:	00170713          	addi	a4,a4,1
    80001d74:	00671713          	slli	a4,a4,0x6
    80001d78:	01070713          	addi	a4,a4,16
    }else{
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    }

    // trazim prvi slobodan blok u listi slobodnih blokova gde mogu da alociram
    MemoryBloc* curr = freeMemBlocHead;
    80001d7c:	00004617          	auipc	a2,0x4
    80001d80:	ba463603          	ld	a2,-1116(a2) # 80005920 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001d84:	00060513          	mv	a0,a2

    while(newSize > curr->size && curr != nullptr){
    80001d88:	00053783          	ld	a5,0(a0)
    80001d8c:	00e7fc63          	bgeu	a5,a4,80001da4 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
    80001d90:	00050a63          	beqz	a0,80001da4 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
        curr = curr->next;
    80001d94:	00853503          	ld	a0,8(a0)
    while(newSize > curr->size && curr != nullptr){
    80001d98:	ff1ff06f          	j	80001d88 <_ZN15MemoryAllocator9mem_allocEm+0x30>
        newSize = MEM_BLOCK_SIZE + sizeof(MemoryBloc);
    80001d9c:	05000713          	li	a4,80
    80001da0:	fddff06f          	j	80001d7c <_ZN15MemoryAllocator9mem_allocEm+0x24>
    }

    if(curr == nullptr){
    80001da4:	00051863          	bnez	a0,80001db4 <_ZN15MemoryAllocator9mem_allocEm+0x5c>
            prevTaken->next = newBloc;
        }
    }

    return (void*)((char*)newBloc + sizeof(MemoryBloc));
};
    80001da8:	00813403          	ld	s0,8(sp)
    80001dac:	01010113          	addi	sp,sp,16
    80001db0:	00008067          	ret
    if(curr == freeMemBlocHead){
    80001db4:	00c50e63          	beq	a0,a2,80001dd0 <_ZN15MemoryAllocator9mem_allocEm+0x78>
    bool checkFree = false;
    80001db8:	00000593          	li	a1,0
    MemoryBloc* next = curr->next;
    80001dbc:	00853803          	ld	a6,8(a0)
    size_t currSize = curr->size - newSize;
    80001dc0:	40e786b3          	sub	a3,a5,a4
    if(currSize == 0){
    80001dc4:	06e79663          	bne	a5,a4,80001e30 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
        MemoryBloc* currFree = freeMemBlocHead;
    80001dc8:	00060793          	mv	a5,a2
    80001dcc:	0100006f          	j	80001ddc <_ZN15MemoryAllocator9mem_allocEm+0x84>
        checkFree = true;
    80001dd0:	00100593          	li	a1,1
    80001dd4:	fe9ff06f          	j	80001dbc <_ZN15MemoryAllocator9mem_allocEm+0x64>
            currFree = currFree->next;
    80001dd8:	00068793          	mv	a5,a3
        while(currFree != nullptr && currFree->next != curr && checkFree != true){
    80001ddc:	00078863          	beqz	a5,80001dec <_ZN15MemoryAllocator9mem_allocEm+0x94>
    80001de0:	0087b683          	ld	a3,8(a5)
    80001de4:	00a68463          	beq	a3,a0,80001dec <_ZN15MemoryAllocator9mem_allocEm+0x94>
    80001de8:	fe0588e3          	beqz	a1,80001dd8 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(currFree == freeMemBlocHead){
    80001dec:	02c78a63          	beq	a5,a2,80001e20 <_ZN15MemoryAllocator9mem_allocEm+0xc8>
            currFree->next = curr->next;
    80001df0:	0107b423          	sd	a6,8(a5)
    newBloc->size = newSize;
    80001df4:	00e53023          	sd	a4,0(a0)
    if(takenMemBlocHead == nullptr){
    80001df8:	00004697          	auipc	a3,0x4
    80001dfc:	b306b683          	ld	a3,-1232(a3) # 80005928 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80001e00:	06068263          	beqz	a3,80001e64 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
        MemoryBloc* nextTaken = takenMemBlocHead;
    80001e04:	00068793          	mv	a5,a3
        MemoryBloc* prevTaken = nullptr;
    80001e08:	00000713          	li	a4,0
        while (newBloc > nextTaken && nextTaken != nullptr){
    80001e0c:	06a7f463          	bgeu	a5,a0,80001e74 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
    80001e10:	06078263          	beqz	a5,80001e74 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
            prevTaken = nextTaken;
    80001e14:	00078713          	mv	a4,a5
            nextTaken = nextTaken->next;
    80001e18:	0087b783          	ld	a5,8(a5)
        while (newBloc > nextTaken && nextTaken != nullptr){
    80001e1c:	ff1ff06f          	j	80001e0c <_ZN15MemoryAllocator9mem_allocEm+0xb4>
            freeMemBlocHead = freeMemBlocHead->next;
    80001e20:	00863783          	ld	a5,8(a2)
    80001e24:	00004697          	auipc	a3,0x4
    80001e28:	aef6be23          	sd	a5,-1284(a3) # 80005920 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001e2c:	fc9ff06f          	j	80001df4 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
    }else if(checkFree == true){
    80001e30:	02058263          	beqz	a1,80001e54 <_ZN15MemoryAllocator9mem_allocEm+0xfc>
        freeMemBlocHead = (MemoryBloc*)((char*)freeMemBlocHead + newSize);
    80001e34:	00e60633          	add	a2,a2,a4
    80001e38:	00004797          	auipc	a5,0x4
    80001e3c:	ae878793          	addi	a5,a5,-1304 # 80005920 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001e40:	00c7b023          	sd	a2,0(a5)
        freeMemBlocHead->size = currSize;
    80001e44:	00d63023          	sd	a3,0(a2)
        freeMemBlocHead->next = next;
    80001e48:	0007b783          	ld	a5,0(a5)
    80001e4c:	0107b423          	sd	a6,8(a5)
    80001e50:	fa5ff06f          	j	80001df4 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        curr = (MemoryBloc*)((char*)curr + newSize);
    80001e54:	00e507b3          	add	a5,a0,a4
        curr->size = currSize;
    80001e58:	00d7b023          	sd	a3,0(a5)
        curr->next = next;
    80001e5c:	0107b423          	sd	a6,8(a5)
    80001e60:	f95ff06f          	j	80001df4 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        takenMemBlocHead = newBloc;
    80001e64:	00004797          	auipc	a5,0x4
    80001e68:	aca7b223          	sd	a0,-1340(a5) # 80005928 <_ZN15MemoryAllocator16takenMemBlocHeadE>
        newBloc->next = nullptr;
    80001e6c:	00053423          	sd	zero,8(a0)
    80001e70:	0100006f          	j	80001e80 <_ZN15MemoryAllocator9mem_allocEm+0x128>
        if(nextTaken == takenMemBlocHead){
    80001e74:	00f68a63          	beq	a3,a5,80001e88 <_ZN15MemoryAllocator9mem_allocEm+0x130>
            newBloc->next = nextTaken;
    80001e78:	00f53423          	sd	a5,8(a0)
            prevTaken->next = newBloc;
    80001e7c:	00a73423          	sd	a0,8(a4)
    return (void*)((char*)newBloc + sizeof(MemoryBloc));
    80001e80:	01050513          	addi	a0,a0,16
    80001e84:	f25ff06f          	j	80001da8 <_ZN15MemoryAllocator9mem_allocEm+0x50>
            newBloc->next = takenMemBlocHead;
    80001e88:	00d53423          	sd	a3,8(a0)
            takenMemBlocHead = newBloc;
    80001e8c:	00004797          	auipc	a5,0x4
    80001e90:	a8a7be23          	sd	a0,-1380(a5) # 80005928 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80001e94:	fedff06f          	j	80001e80 <_ZN15MemoryAllocator9mem_allocEm+0x128>

0000000080001e98 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free (void* mem){
    80001e98:	ff010113          	addi	sp,sp,-16
    80001e9c:	00813423          	sd	s0,8(sp)
    80001ea0:	01010413          	addi	s0,sp,16
    void* freeCurr = (void*)((char*)mem - sizeof(MemoryBloc));
    80001ea4:	ff050513          	addi	a0,a0,-16

    MemoryBloc* curr = takenMemBlocHead;
    80001ea8:	00004697          	auipc	a3,0x4
    80001eac:	a806b683          	ld	a3,-1408(a3) # 80005928 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80001eb0:	00068793          	mv	a5,a3
    MemoryBloc* prev = nullptr;
    80001eb4:	00000713          	li	a4,0

    while (curr != freeCurr){
    80001eb8:	00a78863          	beq	a5,a0,80001ec8 <_ZN15MemoryAllocator8mem_freeEPv+0x30>
        prev = curr;
    80001ebc:	00078713          	mv	a4,a5
        curr = curr->next;
    80001ec0:	0087b783          	ld	a5,8(a5)
    while (curr != freeCurr){
    80001ec4:	ff5ff06f          	j	80001eb8 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
    }
    // uraditi nepredvidjeno ponasanje ako hocu da dealociram nesto sto nisam alocirao
    if(curr == takenMemBlocHead){
    80001ec8:	02d78863          	beq	a5,a3,80001ef8 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        takenMemBlocHead = takenMemBlocHead->next;
    }else{
        prev->next = curr->next;
    80001ecc:	0087b683          	ld	a3,8(a5)
    80001ed0:	00d73423          	sd	a3,8(a4)
    }

    if(freeMemBlocHead == nullptr){
    80001ed4:	00004617          	auipc	a2,0x4
    80001ed8:	a4c63603          	ld	a2,-1460(a2) # 80005920 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001edc:	02060663          	beqz	a2,80001f08 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        freeMemBlocHead = curr;
    }else{
        MemoryBloc* currFree = freeMemBlocHead;
    80001ee0:	00060713          	mv	a4,a2
        MemoryBloc* prevFree = nullptr;
    80001ee4:	00000693          	li	a3,0

        while(curr > currFree){
    80001ee8:	02f77663          	bgeu	a4,a5,80001f14 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
            prevFree = currFree;
    80001eec:	00070693          	mv	a3,a4
            currFree = currFree->next;
    80001ef0:	00873703          	ld	a4,8(a4)
        while(curr > currFree){
    80001ef4:	ff5ff06f          	j	80001ee8 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
        takenMemBlocHead = takenMemBlocHead->next;
    80001ef8:	0086b703          	ld	a4,8(a3)
    80001efc:	00004697          	auipc	a3,0x4
    80001f00:	a2e6b623          	sd	a4,-1492(a3) # 80005928 <_ZN15MemoryAllocator16takenMemBlocHeadE>
    80001f04:	fd1ff06f          	j	80001ed4 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
        freeMemBlocHead = curr;
    80001f08:	00004717          	auipc	a4,0x4
    80001f0c:	a0f73c23          	sd	a5,-1512(a4) # 80005920 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001f10:	0100006f          	j	80001f20 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
        }

        if(currFree == freeMemBlocHead){
    80001f14:	00e60c63          	beq	a2,a4,80001f2c <_ZN15MemoryAllocator8mem_freeEPv+0x94>
            curr->next = freeMemBlocHead;
            freeMemBlocHead = curr;
        }else{
            curr->next = currFree;
    80001f18:	00e7b423          	sd	a4,8(a5)
            prevFree->next = curr;
    80001f1c:	00f6b423          	sd	a5,8(a3)
        }
    }

    MemoryBloc* currMemMerge = freeMemBlocHead;
    80001f20:	00004797          	auipc	a5,0x4
    80001f24:	a007b783          	ld	a5,-1536(a5) # 80005920 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001f28:	0300006f          	j	80001f58 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
            curr->next = freeMemBlocHead;
    80001f2c:	00c7b423          	sd	a2,8(a5)
            freeMemBlocHead = curr;
    80001f30:	00004717          	auipc	a4,0x4
    80001f34:	9ef73823          	sd	a5,-1552(a4) # 80005920 <_ZN15MemoryAllocator15freeMemBlocHeadE>
    80001f38:	fe9ff06f          	j	80001f20 <_ZN15MemoryAllocator8mem_freeEPv+0x88>

    while(currMemMerge){
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
            currMemMerge->size += currMemMerge->next->size;
    80001f3c:	00073603          	ld	a2,0(a4)
    80001f40:	00c686b3          	add	a3,a3,a2
    80001f44:	00d7b023          	sd	a3,0(a5)
            currMemMerge->next = currMemMerge->next->next;
    80001f48:	00873703          	ld	a4,8(a4)
    80001f4c:	00e7b423          	sd	a4,8(a5)
    80001f50:	00078713          	mv	a4,a5
    80001f54:	00070793          	mv	a5,a4
    while(currMemMerge){
    80001f58:	00078e63          	beqz	a5,80001f74 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        if(currMemMerge->next != nullptr && (char*)currMemMerge + currMemMerge->size == (char*)currMemMerge->next){
    80001f5c:	0087b703          	ld	a4,8(a5)
    80001f60:	fe070ae3          	beqz	a4,80001f54 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80001f64:	0007b683          	ld	a3,0(a5)
    80001f68:	00d78633          	add	a2,a5,a3
    80001f6c:	fec714e3          	bne	a4,a2,80001f54 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80001f70:	fcdff06f          	j	80001f3c <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            currMemMerge = currMemMerge->next;
        }
    }

    return 0;
    80001f74:	00000513          	li	a0,0
    80001f78:	00813403          	ld	s0,8(sp)
    80001f7c:	01010113          	addi	sp,sp,16
    80001f80:	00008067          	ret

0000000080001f84 <_Z11printStringPKc>:
#include "../lib/console.h"
#include "../h/riscv.hpp"


void printString(char const *string)
{
    80001f84:	fd010113          	addi	sp,sp,-48
    80001f88:	02113423          	sd	ra,40(sp)
    80001f8c:	02813023          	sd	s0,32(sp)
    80001f90:	00913c23          	sd	s1,24(sp)
    80001f94:	01213823          	sd	s2,16(sp)
    80001f98:	03010413          	addi	s0,sp,48
    80001f9c:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001fa0:	100027f3          	csrr	a5,sstatus
    80001fa4:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80001fa8:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001fac:	00200793          	li	a5,2
    80001fb0:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    80001fb4:	0004c503          	lbu	a0,0(s1)
    80001fb8:	00050a63          	beqz	a0,80001fcc <_Z11printStringPKc+0x48>
    {
        __putc(*string);
    80001fbc:	00002097          	auipc	ra,0x2
    80001fc0:	190080e7          	jalr	400(ra) # 8000414c <__putc>
        string++;
    80001fc4:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001fc8:	fedff06f          	j	80001fb4 <_Z11printStringPKc+0x30>
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80001fcc:	0009091b          	sext.w	s2,s2
    80001fd0:	00297913          	andi	s2,s2,2
    80001fd4:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001fd8:	10092073          	csrs	sstatus,s2
}
    80001fdc:	02813083          	ld	ra,40(sp)
    80001fe0:	02013403          	ld	s0,32(sp)
    80001fe4:	01813483          	ld	s1,24(sp)
    80001fe8:	01013903          	ld	s2,16(sp)
    80001fec:	03010113          	addi	sp,sp,48
    80001ff0:	00008067          	ret

0000000080001ff4 <_Z12printIntegerm>:


void printInteger(uint64 integer){
    80001ff4:	fd010113          	addi	sp,sp,-48
    80001ff8:	02113423          	sd	ra,40(sp)
    80001ffc:	02813023          	sd	s0,32(sp)
    80002000:	00913c23          	sd	s1,24(sp)
    80002004:	03010413          	addi	s0,sp,48
    neg = 0;
    if(integer < 0){
        neg = 1;
        x = -integer;
    }else{
        x = integer;
    80002008:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    8000200c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x%10];
    80002010:	00a00613          	li	a2,10
    80002014:	02c5773b          	remuw	a4,a0,a2
    80002018:	02071693          	slli	a3,a4,0x20
    8000201c:	0206d693          	srli	a3,a3,0x20
    80002020:	00003717          	auipc	a4,0x3
    80002024:	0d870713          	addi	a4,a4,216 # 800050f8 <_ZZ12printIntegermE6digits>
    80002028:	00d70733          	add	a4,a4,a3
    8000202c:	00074703          	lbu	a4,0(a4)
    80002030:	fe040693          	addi	a3,s0,-32
    80002034:	009687b3          	add	a5,a3,s1
    80002038:	0014849b          	addiw	s1,s1,1
    8000203c:	fee78823          	sb	a4,-16(a5)
    }while((x /= 10) != 0);
    80002040:	0005071b          	sext.w	a4,a0
    80002044:	02c5553b          	divuw	a0,a0,a2
    80002048:	00900793          	li	a5,9
    8000204c:	fce7e2e3          	bltu	a5,a4,80002010 <_Z12printIntegerm+0x1c>
    if(neg){
        buf[i++] = '-';
    }
    while(--i >= 0)
    80002050:	fff4849b          	addiw	s1,s1,-1
    80002054:	0004ce63          	bltz	s1,80002070 <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    80002058:	fe040793          	addi	a5,s0,-32
    8000205c:	009787b3          	add	a5,a5,s1
    80002060:	ff07c503          	lbu	a0,-16(a5)
    80002064:	00002097          	auipc	ra,0x2
    80002068:	0e8080e7          	jalr	232(ra) # 8000414c <__putc>
    8000206c:	fe5ff06f          	j	80002050 <_Z12printIntegerm+0x5c>
    80002070:	02813083          	ld	ra,40(sp)
    80002074:	02013403          	ld	s0,32(sp)
    80002078:	01813483          	ld	s1,24(sp)
    8000207c:	03010113          	addi	sp,sp,48
    80002080:	00008067          	ret

0000000080002084 <start>:
    80002084:	ff010113          	addi	sp,sp,-16
    80002088:	00813423          	sd	s0,8(sp)
    8000208c:	01010413          	addi	s0,sp,16
    80002090:	300027f3          	csrr	a5,mstatus
    80002094:	ffffe737          	lui	a4,0xffffe
    80002098:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7c6f>
    8000209c:	00e7f7b3          	and	a5,a5,a4
    800020a0:	00001737          	lui	a4,0x1
    800020a4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800020a8:	00e7e7b3          	or	a5,a5,a4
    800020ac:	30079073          	csrw	mstatus,a5
    800020b0:	00000797          	auipc	a5,0x0
    800020b4:	16078793          	addi	a5,a5,352 # 80002210 <system_main>
    800020b8:	34179073          	csrw	mepc,a5
    800020bc:	00000793          	li	a5,0
    800020c0:	18079073          	csrw	satp,a5
    800020c4:	000107b7          	lui	a5,0x10
    800020c8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800020cc:	30279073          	csrw	medeleg,a5
    800020d0:	30379073          	csrw	mideleg,a5
    800020d4:	104027f3          	csrr	a5,sie
    800020d8:	2227e793          	ori	a5,a5,546
    800020dc:	10479073          	csrw	sie,a5
    800020e0:	fff00793          	li	a5,-1
    800020e4:	00a7d793          	srli	a5,a5,0xa
    800020e8:	3b079073          	csrw	pmpaddr0,a5
    800020ec:	00f00793          	li	a5,15
    800020f0:	3a079073          	csrw	pmpcfg0,a5
    800020f4:	f14027f3          	csrr	a5,mhartid
    800020f8:	0200c737          	lui	a4,0x200c
    800020fc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002100:	0007869b          	sext.w	a3,a5
    80002104:	00269713          	slli	a4,a3,0x2
    80002108:	000f4637          	lui	a2,0xf4
    8000210c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002110:	00d70733          	add	a4,a4,a3
    80002114:	0037979b          	slliw	a5,a5,0x3
    80002118:	020046b7          	lui	a3,0x2004
    8000211c:	00d787b3          	add	a5,a5,a3
    80002120:	00c585b3          	add	a1,a1,a2
    80002124:	00371693          	slli	a3,a4,0x3
    80002128:	00004717          	auipc	a4,0x4
    8000212c:	80870713          	addi	a4,a4,-2040 # 80005930 <timer_scratch>
    80002130:	00b7b023          	sd	a1,0(a5)
    80002134:	00d70733          	add	a4,a4,a3
    80002138:	00f73c23          	sd	a5,24(a4)
    8000213c:	02c73023          	sd	a2,32(a4)
    80002140:	34071073          	csrw	mscratch,a4
    80002144:	00000797          	auipc	a5,0x0
    80002148:	6ec78793          	addi	a5,a5,1772 # 80002830 <timervec>
    8000214c:	30579073          	csrw	mtvec,a5
    80002150:	300027f3          	csrr	a5,mstatus
    80002154:	0087e793          	ori	a5,a5,8
    80002158:	30079073          	csrw	mstatus,a5
    8000215c:	304027f3          	csrr	a5,mie
    80002160:	0807e793          	ori	a5,a5,128
    80002164:	30479073          	csrw	mie,a5
    80002168:	f14027f3          	csrr	a5,mhartid
    8000216c:	0007879b          	sext.w	a5,a5
    80002170:	00078213          	mv	tp,a5
    80002174:	30200073          	mret
    80002178:	00813403          	ld	s0,8(sp)
    8000217c:	01010113          	addi	sp,sp,16
    80002180:	00008067          	ret

0000000080002184 <timerinit>:
    80002184:	ff010113          	addi	sp,sp,-16
    80002188:	00813423          	sd	s0,8(sp)
    8000218c:	01010413          	addi	s0,sp,16
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
    800021c8:	76c70713          	addi	a4,a4,1900 # 80005930 <timer_scratch>
    800021cc:	00b7b023          	sd	a1,0(a5)
    800021d0:	00d70733          	add	a4,a4,a3
    800021d4:	00f73c23          	sd	a5,24(a4)
    800021d8:	02c73023          	sd	a2,32(a4)
    800021dc:	34071073          	csrw	mscratch,a4
    800021e0:	00000797          	auipc	a5,0x0
    800021e4:	65078793          	addi	a5,a5,1616 # 80002830 <timervec>
    800021e8:	30579073          	csrw	mtvec,a5
    800021ec:	300027f3          	csrr	a5,mstatus
    800021f0:	0087e793          	ori	a5,a5,8
    800021f4:	30079073          	csrw	mstatus,a5
    800021f8:	304027f3          	csrr	a5,mie
    800021fc:	0807e793          	ori	a5,a5,128
    80002200:	30479073          	csrw	mie,a5
    80002204:	00813403          	ld	s0,8(sp)
    80002208:	01010113          	addi	sp,sp,16
    8000220c:	00008067          	ret

0000000080002210 <system_main>:
    80002210:	fe010113          	addi	sp,sp,-32
    80002214:	00813823          	sd	s0,16(sp)
    80002218:	00913423          	sd	s1,8(sp)
    8000221c:	00113c23          	sd	ra,24(sp)
    80002220:	02010413          	addi	s0,sp,32
    80002224:	00000097          	auipc	ra,0x0
    80002228:	0c4080e7          	jalr	196(ra) # 800022e8 <cpuid>
    8000222c:	00003497          	auipc	s1,0x3
    80002230:	6a448493          	addi	s1,s1,1700 # 800058d0 <started>
    80002234:	02050263          	beqz	a0,80002258 <system_main+0x48>
    80002238:	0004a783          	lw	a5,0(s1)
    8000223c:	0007879b          	sext.w	a5,a5
    80002240:	fe078ce3          	beqz	a5,80002238 <system_main+0x28>
    80002244:	0ff0000f          	fence
    80002248:	00003517          	auipc	a0,0x3
    8000224c:	ef050513          	addi	a0,a0,-272 # 80005138 <_ZZ12printIntegermE6digits+0x40>
    80002250:	00001097          	auipc	ra,0x1
    80002254:	a7c080e7          	jalr	-1412(ra) # 80002ccc <panic>
    80002258:	00001097          	auipc	ra,0x1
    8000225c:	9d0080e7          	jalr	-1584(ra) # 80002c28 <consoleinit>
    80002260:	00001097          	auipc	ra,0x1
    80002264:	15c080e7          	jalr	348(ra) # 800033bc <printfinit>
    80002268:	00003517          	auipc	a0,0x3
    8000226c:	e8850513          	addi	a0,a0,-376 # 800050f0 <CONSOLE_STATUS+0xe0>
    80002270:	00001097          	auipc	ra,0x1
    80002274:	ab8080e7          	jalr	-1352(ra) # 80002d28 <__printf>
    80002278:	00003517          	auipc	a0,0x3
    8000227c:	e9050513          	addi	a0,a0,-368 # 80005108 <_ZZ12printIntegermE6digits+0x10>
    80002280:	00001097          	auipc	ra,0x1
    80002284:	aa8080e7          	jalr	-1368(ra) # 80002d28 <__printf>
    80002288:	00003517          	auipc	a0,0x3
    8000228c:	e6850513          	addi	a0,a0,-408 # 800050f0 <CONSOLE_STATUS+0xe0>
    80002290:	00001097          	auipc	ra,0x1
    80002294:	a98080e7          	jalr	-1384(ra) # 80002d28 <__printf>
    80002298:	00001097          	auipc	ra,0x1
    8000229c:	4b0080e7          	jalr	1200(ra) # 80003748 <kinit>
    800022a0:	00000097          	auipc	ra,0x0
    800022a4:	148080e7          	jalr	328(ra) # 800023e8 <trapinit>
    800022a8:	00000097          	auipc	ra,0x0
    800022ac:	16c080e7          	jalr	364(ra) # 80002414 <trapinithart>
    800022b0:	00000097          	auipc	ra,0x0
    800022b4:	5c0080e7          	jalr	1472(ra) # 80002870 <plicinit>
    800022b8:	00000097          	auipc	ra,0x0
    800022bc:	5e0080e7          	jalr	1504(ra) # 80002898 <plicinithart>
    800022c0:	00000097          	auipc	ra,0x0
    800022c4:	078080e7          	jalr	120(ra) # 80002338 <userinit>
    800022c8:	0ff0000f          	fence
    800022cc:	00100793          	li	a5,1
    800022d0:	00003517          	auipc	a0,0x3
    800022d4:	e5050513          	addi	a0,a0,-432 # 80005120 <_ZZ12printIntegermE6digits+0x28>
    800022d8:	00f4a023          	sw	a5,0(s1)
    800022dc:	00001097          	auipc	ra,0x1
    800022e0:	a4c080e7          	jalr	-1460(ra) # 80002d28 <__printf>
    800022e4:	0000006f          	j	800022e4 <system_main+0xd4>

00000000800022e8 <cpuid>:
    800022e8:	ff010113          	addi	sp,sp,-16
    800022ec:	00813423          	sd	s0,8(sp)
    800022f0:	01010413          	addi	s0,sp,16
    800022f4:	00020513          	mv	a0,tp
    800022f8:	00813403          	ld	s0,8(sp)
    800022fc:	0005051b          	sext.w	a0,a0
    80002300:	01010113          	addi	sp,sp,16
    80002304:	00008067          	ret

0000000080002308 <mycpu>:
    80002308:	ff010113          	addi	sp,sp,-16
    8000230c:	00813423          	sd	s0,8(sp)
    80002310:	01010413          	addi	s0,sp,16
    80002314:	00020793          	mv	a5,tp
    80002318:	00813403          	ld	s0,8(sp)
    8000231c:	0007879b          	sext.w	a5,a5
    80002320:	00779793          	slli	a5,a5,0x7
    80002324:	00004517          	auipc	a0,0x4
    80002328:	63c50513          	addi	a0,a0,1596 # 80006960 <cpus>
    8000232c:	00f50533          	add	a0,a0,a5
    80002330:	01010113          	addi	sp,sp,16
    80002334:	00008067          	ret

0000000080002338 <userinit>:
    80002338:	ff010113          	addi	sp,sp,-16
    8000233c:	00813423          	sd	s0,8(sp)
    80002340:	01010413          	addi	s0,sp,16
    80002344:	00813403          	ld	s0,8(sp)
    80002348:	01010113          	addi	sp,sp,16
    8000234c:	fffff317          	auipc	t1,0xfffff
    80002350:	32430067          	jr	804(t1) # 80001670 <main>

0000000080002354 <either_copyout>:
    80002354:	ff010113          	addi	sp,sp,-16
    80002358:	00813023          	sd	s0,0(sp)
    8000235c:	00113423          	sd	ra,8(sp)
    80002360:	01010413          	addi	s0,sp,16
    80002364:	02051663          	bnez	a0,80002390 <either_copyout+0x3c>
    80002368:	00058513          	mv	a0,a1
    8000236c:	00060593          	mv	a1,a2
    80002370:	0006861b          	sext.w	a2,a3
    80002374:	00002097          	auipc	ra,0x2
    80002378:	c60080e7          	jalr	-928(ra) # 80003fd4 <__memmove>
    8000237c:	00813083          	ld	ra,8(sp)
    80002380:	00013403          	ld	s0,0(sp)
    80002384:	00000513          	li	a0,0
    80002388:	01010113          	addi	sp,sp,16
    8000238c:	00008067          	ret
    80002390:	00003517          	auipc	a0,0x3
    80002394:	dd050513          	addi	a0,a0,-560 # 80005160 <_ZZ12printIntegermE6digits+0x68>
    80002398:	00001097          	auipc	ra,0x1
    8000239c:	934080e7          	jalr	-1740(ra) # 80002ccc <panic>

00000000800023a0 <either_copyin>:
    800023a0:	ff010113          	addi	sp,sp,-16
    800023a4:	00813023          	sd	s0,0(sp)
    800023a8:	00113423          	sd	ra,8(sp)
    800023ac:	01010413          	addi	s0,sp,16
    800023b0:	02059463          	bnez	a1,800023d8 <either_copyin+0x38>
    800023b4:	00060593          	mv	a1,a2
    800023b8:	0006861b          	sext.w	a2,a3
    800023bc:	00002097          	auipc	ra,0x2
    800023c0:	c18080e7          	jalr	-1000(ra) # 80003fd4 <__memmove>
    800023c4:	00813083          	ld	ra,8(sp)
    800023c8:	00013403          	ld	s0,0(sp)
    800023cc:	00000513          	li	a0,0
    800023d0:	01010113          	addi	sp,sp,16
    800023d4:	00008067          	ret
    800023d8:	00003517          	auipc	a0,0x3
    800023dc:	db050513          	addi	a0,a0,-592 # 80005188 <_ZZ12printIntegermE6digits+0x90>
    800023e0:	00001097          	auipc	ra,0x1
    800023e4:	8ec080e7          	jalr	-1812(ra) # 80002ccc <panic>

00000000800023e8 <trapinit>:
    800023e8:	ff010113          	addi	sp,sp,-16
    800023ec:	00813423          	sd	s0,8(sp)
    800023f0:	01010413          	addi	s0,sp,16
    800023f4:	00813403          	ld	s0,8(sp)
    800023f8:	00003597          	auipc	a1,0x3
    800023fc:	db858593          	addi	a1,a1,-584 # 800051b0 <_ZZ12printIntegermE6digits+0xb8>
    80002400:	00004517          	auipc	a0,0x4
    80002404:	5e050513          	addi	a0,a0,1504 # 800069e0 <tickslock>
    80002408:	01010113          	addi	sp,sp,16
    8000240c:	00001317          	auipc	t1,0x1
    80002410:	5cc30067          	jr	1484(t1) # 800039d8 <initlock>

0000000080002414 <trapinithart>:
    80002414:	ff010113          	addi	sp,sp,-16
    80002418:	00813423          	sd	s0,8(sp)
    8000241c:	01010413          	addi	s0,sp,16
    80002420:	00000797          	auipc	a5,0x0
    80002424:	30078793          	addi	a5,a5,768 # 80002720 <kernelvec>
    80002428:	10579073          	csrw	stvec,a5
    8000242c:	00813403          	ld	s0,8(sp)
    80002430:	01010113          	addi	sp,sp,16
    80002434:	00008067          	ret

0000000080002438 <usertrap>:
    80002438:	ff010113          	addi	sp,sp,-16
    8000243c:	00813423          	sd	s0,8(sp)
    80002440:	01010413          	addi	s0,sp,16
    80002444:	00813403          	ld	s0,8(sp)
    80002448:	01010113          	addi	sp,sp,16
    8000244c:	00008067          	ret

0000000080002450 <usertrapret>:
    80002450:	ff010113          	addi	sp,sp,-16
    80002454:	00813423          	sd	s0,8(sp)
    80002458:	01010413          	addi	s0,sp,16
    8000245c:	00813403          	ld	s0,8(sp)
    80002460:	01010113          	addi	sp,sp,16
    80002464:	00008067          	ret

0000000080002468 <kerneltrap>:
    80002468:	fe010113          	addi	sp,sp,-32
    8000246c:	00813823          	sd	s0,16(sp)
    80002470:	00113c23          	sd	ra,24(sp)
    80002474:	00913423          	sd	s1,8(sp)
    80002478:	02010413          	addi	s0,sp,32
    8000247c:	142025f3          	csrr	a1,scause
    80002480:	100027f3          	csrr	a5,sstatus
    80002484:	0027f793          	andi	a5,a5,2
    80002488:	10079c63          	bnez	a5,800025a0 <kerneltrap+0x138>
    8000248c:	142027f3          	csrr	a5,scause
    80002490:	0207ce63          	bltz	a5,800024cc <kerneltrap+0x64>
    80002494:	00003517          	auipc	a0,0x3
    80002498:	d6450513          	addi	a0,a0,-668 # 800051f8 <_ZZ12printIntegermE6digits+0x100>
    8000249c:	00001097          	auipc	ra,0x1
    800024a0:	88c080e7          	jalr	-1908(ra) # 80002d28 <__printf>
    800024a4:	141025f3          	csrr	a1,sepc
    800024a8:	14302673          	csrr	a2,stval
    800024ac:	00003517          	auipc	a0,0x3
    800024b0:	d5c50513          	addi	a0,a0,-676 # 80005208 <_ZZ12printIntegermE6digits+0x110>
    800024b4:	00001097          	auipc	ra,0x1
    800024b8:	874080e7          	jalr	-1932(ra) # 80002d28 <__printf>
    800024bc:	00003517          	auipc	a0,0x3
    800024c0:	d6450513          	addi	a0,a0,-668 # 80005220 <_ZZ12printIntegermE6digits+0x128>
    800024c4:	00001097          	auipc	ra,0x1
    800024c8:	808080e7          	jalr	-2040(ra) # 80002ccc <panic>
    800024cc:	0ff7f713          	andi	a4,a5,255
    800024d0:	00900693          	li	a3,9
    800024d4:	04d70063          	beq	a4,a3,80002514 <kerneltrap+0xac>
    800024d8:	fff00713          	li	a4,-1
    800024dc:	03f71713          	slli	a4,a4,0x3f
    800024e0:	00170713          	addi	a4,a4,1
    800024e4:	fae798e3          	bne	a5,a4,80002494 <kerneltrap+0x2c>
    800024e8:	00000097          	auipc	ra,0x0
    800024ec:	e00080e7          	jalr	-512(ra) # 800022e8 <cpuid>
    800024f0:	06050663          	beqz	a0,8000255c <kerneltrap+0xf4>
    800024f4:	144027f3          	csrr	a5,sip
    800024f8:	ffd7f793          	andi	a5,a5,-3
    800024fc:	14479073          	csrw	sip,a5
    80002500:	01813083          	ld	ra,24(sp)
    80002504:	01013403          	ld	s0,16(sp)
    80002508:	00813483          	ld	s1,8(sp)
    8000250c:	02010113          	addi	sp,sp,32
    80002510:	00008067          	ret
    80002514:	00000097          	auipc	ra,0x0
    80002518:	3d0080e7          	jalr	976(ra) # 800028e4 <plic_claim>
    8000251c:	00a00793          	li	a5,10
    80002520:	00050493          	mv	s1,a0
    80002524:	06f50863          	beq	a0,a5,80002594 <kerneltrap+0x12c>
    80002528:	fc050ce3          	beqz	a0,80002500 <kerneltrap+0x98>
    8000252c:	00050593          	mv	a1,a0
    80002530:	00003517          	auipc	a0,0x3
    80002534:	ca850513          	addi	a0,a0,-856 # 800051d8 <_ZZ12printIntegermE6digits+0xe0>
    80002538:	00000097          	auipc	ra,0x0
    8000253c:	7f0080e7          	jalr	2032(ra) # 80002d28 <__printf>
    80002540:	01013403          	ld	s0,16(sp)
    80002544:	01813083          	ld	ra,24(sp)
    80002548:	00048513          	mv	a0,s1
    8000254c:	00813483          	ld	s1,8(sp)
    80002550:	02010113          	addi	sp,sp,32
    80002554:	00000317          	auipc	t1,0x0
    80002558:	3c830067          	jr	968(t1) # 8000291c <plic_complete>
    8000255c:	00004517          	auipc	a0,0x4
    80002560:	48450513          	addi	a0,a0,1156 # 800069e0 <tickslock>
    80002564:	00001097          	auipc	ra,0x1
    80002568:	498080e7          	jalr	1176(ra) # 800039fc <acquire>
    8000256c:	00003717          	auipc	a4,0x3
    80002570:	36870713          	addi	a4,a4,872 # 800058d4 <ticks>
    80002574:	00072783          	lw	a5,0(a4)
    80002578:	00004517          	auipc	a0,0x4
    8000257c:	46850513          	addi	a0,a0,1128 # 800069e0 <tickslock>
    80002580:	0017879b          	addiw	a5,a5,1
    80002584:	00f72023          	sw	a5,0(a4)
    80002588:	00001097          	auipc	ra,0x1
    8000258c:	540080e7          	jalr	1344(ra) # 80003ac8 <release>
    80002590:	f65ff06f          	j	800024f4 <kerneltrap+0x8c>
    80002594:	00001097          	auipc	ra,0x1
    80002598:	09c080e7          	jalr	156(ra) # 80003630 <uartintr>
    8000259c:	fa5ff06f          	j	80002540 <kerneltrap+0xd8>
    800025a0:	00003517          	auipc	a0,0x3
    800025a4:	c1850513          	addi	a0,a0,-1000 # 800051b8 <_ZZ12printIntegermE6digits+0xc0>
    800025a8:	00000097          	auipc	ra,0x0
    800025ac:	724080e7          	jalr	1828(ra) # 80002ccc <panic>

00000000800025b0 <clockintr>:
    800025b0:	fe010113          	addi	sp,sp,-32
    800025b4:	00813823          	sd	s0,16(sp)
    800025b8:	00913423          	sd	s1,8(sp)
    800025bc:	00113c23          	sd	ra,24(sp)
    800025c0:	02010413          	addi	s0,sp,32
    800025c4:	00004497          	auipc	s1,0x4
    800025c8:	41c48493          	addi	s1,s1,1052 # 800069e0 <tickslock>
    800025cc:	00048513          	mv	a0,s1
    800025d0:	00001097          	auipc	ra,0x1
    800025d4:	42c080e7          	jalr	1068(ra) # 800039fc <acquire>
    800025d8:	00003717          	auipc	a4,0x3
    800025dc:	2fc70713          	addi	a4,a4,764 # 800058d4 <ticks>
    800025e0:	00072783          	lw	a5,0(a4)
    800025e4:	01013403          	ld	s0,16(sp)
    800025e8:	01813083          	ld	ra,24(sp)
    800025ec:	00048513          	mv	a0,s1
    800025f0:	0017879b          	addiw	a5,a5,1
    800025f4:	00813483          	ld	s1,8(sp)
    800025f8:	00f72023          	sw	a5,0(a4)
    800025fc:	02010113          	addi	sp,sp,32
    80002600:	00001317          	auipc	t1,0x1
    80002604:	4c830067          	jr	1224(t1) # 80003ac8 <release>

0000000080002608 <devintr>:
    80002608:	142027f3          	csrr	a5,scause
    8000260c:	00000513          	li	a0,0
    80002610:	0007c463          	bltz	a5,80002618 <devintr+0x10>
    80002614:	00008067          	ret
    80002618:	fe010113          	addi	sp,sp,-32
    8000261c:	00813823          	sd	s0,16(sp)
    80002620:	00113c23          	sd	ra,24(sp)
    80002624:	00913423          	sd	s1,8(sp)
    80002628:	02010413          	addi	s0,sp,32
    8000262c:	0ff7f713          	andi	a4,a5,255
    80002630:	00900693          	li	a3,9
    80002634:	04d70c63          	beq	a4,a3,8000268c <devintr+0x84>
    80002638:	fff00713          	li	a4,-1
    8000263c:	03f71713          	slli	a4,a4,0x3f
    80002640:	00170713          	addi	a4,a4,1
    80002644:	00e78c63          	beq	a5,a4,8000265c <devintr+0x54>
    80002648:	01813083          	ld	ra,24(sp)
    8000264c:	01013403          	ld	s0,16(sp)
    80002650:	00813483          	ld	s1,8(sp)
    80002654:	02010113          	addi	sp,sp,32
    80002658:	00008067          	ret
    8000265c:	00000097          	auipc	ra,0x0
    80002660:	c8c080e7          	jalr	-884(ra) # 800022e8 <cpuid>
    80002664:	06050663          	beqz	a0,800026d0 <devintr+0xc8>
    80002668:	144027f3          	csrr	a5,sip
    8000266c:	ffd7f793          	andi	a5,a5,-3
    80002670:	14479073          	csrw	sip,a5
    80002674:	01813083          	ld	ra,24(sp)
    80002678:	01013403          	ld	s0,16(sp)
    8000267c:	00813483          	ld	s1,8(sp)
    80002680:	00200513          	li	a0,2
    80002684:	02010113          	addi	sp,sp,32
    80002688:	00008067          	ret
    8000268c:	00000097          	auipc	ra,0x0
    80002690:	258080e7          	jalr	600(ra) # 800028e4 <plic_claim>
    80002694:	00a00793          	li	a5,10
    80002698:	00050493          	mv	s1,a0
    8000269c:	06f50663          	beq	a0,a5,80002708 <devintr+0x100>
    800026a0:	00100513          	li	a0,1
    800026a4:	fa0482e3          	beqz	s1,80002648 <devintr+0x40>
    800026a8:	00048593          	mv	a1,s1
    800026ac:	00003517          	auipc	a0,0x3
    800026b0:	b2c50513          	addi	a0,a0,-1236 # 800051d8 <_ZZ12printIntegermE6digits+0xe0>
    800026b4:	00000097          	auipc	ra,0x0
    800026b8:	674080e7          	jalr	1652(ra) # 80002d28 <__printf>
    800026bc:	00048513          	mv	a0,s1
    800026c0:	00000097          	auipc	ra,0x0
    800026c4:	25c080e7          	jalr	604(ra) # 8000291c <plic_complete>
    800026c8:	00100513          	li	a0,1
    800026cc:	f7dff06f          	j	80002648 <devintr+0x40>
    800026d0:	00004517          	auipc	a0,0x4
    800026d4:	31050513          	addi	a0,a0,784 # 800069e0 <tickslock>
    800026d8:	00001097          	auipc	ra,0x1
    800026dc:	324080e7          	jalr	804(ra) # 800039fc <acquire>
    800026e0:	00003717          	auipc	a4,0x3
    800026e4:	1f470713          	addi	a4,a4,500 # 800058d4 <ticks>
    800026e8:	00072783          	lw	a5,0(a4)
    800026ec:	00004517          	auipc	a0,0x4
    800026f0:	2f450513          	addi	a0,a0,756 # 800069e0 <tickslock>
    800026f4:	0017879b          	addiw	a5,a5,1
    800026f8:	00f72023          	sw	a5,0(a4)
    800026fc:	00001097          	auipc	ra,0x1
    80002700:	3cc080e7          	jalr	972(ra) # 80003ac8 <release>
    80002704:	f65ff06f          	j	80002668 <devintr+0x60>
    80002708:	00001097          	auipc	ra,0x1
    8000270c:	f28080e7          	jalr	-216(ra) # 80003630 <uartintr>
    80002710:	fadff06f          	j	800026bc <devintr+0xb4>
	...

0000000080002720 <kernelvec>:
    80002720:	f0010113          	addi	sp,sp,-256
    80002724:	00113023          	sd	ra,0(sp)
    80002728:	00213423          	sd	sp,8(sp)
    8000272c:	00313823          	sd	gp,16(sp)
    80002730:	00413c23          	sd	tp,24(sp)
    80002734:	02513023          	sd	t0,32(sp)
    80002738:	02613423          	sd	t1,40(sp)
    8000273c:	02713823          	sd	t2,48(sp)
    80002740:	02813c23          	sd	s0,56(sp)
    80002744:	04913023          	sd	s1,64(sp)
    80002748:	04a13423          	sd	a0,72(sp)
    8000274c:	04b13823          	sd	a1,80(sp)
    80002750:	04c13c23          	sd	a2,88(sp)
    80002754:	06d13023          	sd	a3,96(sp)
    80002758:	06e13423          	sd	a4,104(sp)
    8000275c:	06f13823          	sd	a5,112(sp)
    80002760:	07013c23          	sd	a6,120(sp)
    80002764:	09113023          	sd	a7,128(sp)
    80002768:	09213423          	sd	s2,136(sp)
    8000276c:	09313823          	sd	s3,144(sp)
    80002770:	09413c23          	sd	s4,152(sp)
    80002774:	0b513023          	sd	s5,160(sp)
    80002778:	0b613423          	sd	s6,168(sp)
    8000277c:	0b713823          	sd	s7,176(sp)
    80002780:	0b813c23          	sd	s8,184(sp)
    80002784:	0d913023          	sd	s9,192(sp)
    80002788:	0da13423          	sd	s10,200(sp)
    8000278c:	0db13823          	sd	s11,208(sp)
    80002790:	0dc13c23          	sd	t3,216(sp)
    80002794:	0fd13023          	sd	t4,224(sp)
    80002798:	0fe13423          	sd	t5,232(sp)
    8000279c:	0ff13823          	sd	t6,240(sp)
    800027a0:	cc9ff0ef          	jal	ra,80002468 <kerneltrap>
    800027a4:	00013083          	ld	ra,0(sp)
    800027a8:	00813103          	ld	sp,8(sp)
    800027ac:	01013183          	ld	gp,16(sp)
    800027b0:	02013283          	ld	t0,32(sp)
    800027b4:	02813303          	ld	t1,40(sp)
    800027b8:	03013383          	ld	t2,48(sp)
    800027bc:	03813403          	ld	s0,56(sp)
    800027c0:	04013483          	ld	s1,64(sp)
    800027c4:	04813503          	ld	a0,72(sp)
    800027c8:	05013583          	ld	a1,80(sp)
    800027cc:	05813603          	ld	a2,88(sp)
    800027d0:	06013683          	ld	a3,96(sp)
    800027d4:	06813703          	ld	a4,104(sp)
    800027d8:	07013783          	ld	a5,112(sp)
    800027dc:	07813803          	ld	a6,120(sp)
    800027e0:	08013883          	ld	a7,128(sp)
    800027e4:	08813903          	ld	s2,136(sp)
    800027e8:	09013983          	ld	s3,144(sp)
    800027ec:	09813a03          	ld	s4,152(sp)
    800027f0:	0a013a83          	ld	s5,160(sp)
    800027f4:	0a813b03          	ld	s6,168(sp)
    800027f8:	0b013b83          	ld	s7,176(sp)
    800027fc:	0b813c03          	ld	s8,184(sp)
    80002800:	0c013c83          	ld	s9,192(sp)
    80002804:	0c813d03          	ld	s10,200(sp)
    80002808:	0d013d83          	ld	s11,208(sp)
    8000280c:	0d813e03          	ld	t3,216(sp)
    80002810:	0e013e83          	ld	t4,224(sp)
    80002814:	0e813f03          	ld	t5,232(sp)
    80002818:	0f013f83          	ld	t6,240(sp)
    8000281c:	10010113          	addi	sp,sp,256
    80002820:	10200073          	sret
    80002824:	00000013          	nop
    80002828:	00000013          	nop
    8000282c:	00000013          	nop

0000000080002830 <timervec>:
    80002830:	34051573          	csrrw	a0,mscratch,a0
    80002834:	00b53023          	sd	a1,0(a0)
    80002838:	00c53423          	sd	a2,8(a0)
    8000283c:	00d53823          	sd	a3,16(a0)
    80002840:	01853583          	ld	a1,24(a0)
    80002844:	02053603          	ld	a2,32(a0)
    80002848:	0005b683          	ld	a3,0(a1)
    8000284c:	00c686b3          	add	a3,a3,a2
    80002850:	00d5b023          	sd	a3,0(a1)
    80002854:	00200593          	li	a1,2
    80002858:	14459073          	csrw	sip,a1
    8000285c:	01053683          	ld	a3,16(a0)
    80002860:	00853603          	ld	a2,8(a0)
    80002864:	00053583          	ld	a1,0(a0)
    80002868:	34051573          	csrrw	a0,mscratch,a0
    8000286c:	30200073          	mret

0000000080002870 <plicinit>:
    80002870:	ff010113          	addi	sp,sp,-16
    80002874:	00813423          	sd	s0,8(sp)
    80002878:	01010413          	addi	s0,sp,16
    8000287c:	00813403          	ld	s0,8(sp)
    80002880:	0c0007b7          	lui	a5,0xc000
    80002884:	00100713          	li	a4,1
    80002888:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000288c:	00e7a223          	sw	a4,4(a5)
    80002890:	01010113          	addi	sp,sp,16
    80002894:	00008067          	ret

0000000080002898 <plicinithart>:
    80002898:	ff010113          	addi	sp,sp,-16
    8000289c:	00813023          	sd	s0,0(sp)
    800028a0:	00113423          	sd	ra,8(sp)
    800028a4:	01010413          	addi	s0,sp,16
    800028a8:	00000097          	auipc	ra,0x0
    800028ac:	a40080e7          	jalr	-1472(ra) # 800022e8 <cpuid>
    800028b0:	0085171b          	slliw	a4,a0,0x8
    800028b4:	0c0027b7          	lui	a5,0xc002
    800028b8:	00e787b3          	add	a5,a5,a4
    800028bc:	40200713          	li	a4,1026
    800028c0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800028c4:	00813083          	ld	ra,8(sp)
    800028c8:	00013403          	ld	s0,0(sp)
    800028cc:	00d5151b          	slliw	a0,a0,0xd
    800028d0:	0c2017b7          	lui	a5,0xc201
    800028d4:	00a78533          	add	a0,a5,a0
    800028d8:	00052023          	sw	zero,0(a0)
    800028dc:	01010113          	addi	sp,sp,16
    800028e0:	00008067          	ret

00000000800028e4 <plic_claim>:
    800028e4:	ff010113          	addi	sp,sp,-16
    800028e8:	00813023          	sd	s0,0(sp)
    800028ec:	00113423          	sd	ra,8(sp)
    800028f0:	01010413          	addi	s0,sp,16
    800028f4:	00000097          	auipc	ra,0x0
    800028f8:	9f4080e7          	jalr	-1548(ra) # 800022e8 <cpuid>
    800028fc:	00813083          	ld	ra,8(sp)
    80002900:	00013403          	ld	s0,0(sp)
    80002904:	00d5151b          	slliw	a0,a0,0xd
    80002908:	0c2017b7          	lui	a5,0xc201
    8000290c:	00a78533          	add	a0,a5,a0
    80002910:	00452503          	lw	a0,4(a0)
    80002914:	01010113          	addi	sp,sp,16
    80002918:	00008067          	ret

000000008000291c <plic_complete>:
    8000291c:	fe010113          	addi	sp,sp,-32
    80002920:	00813823          	sd	s0,16(sp)
    80002924:	00913423          	sd	s1,8(sp)
    80002928:	00113c23          	sd	ra,24(sp)
    8000292c:	02010413          	addi	s0,sp,32
    80002930:	00050493          	mv	s1,a0
    80002934:	00000097          	auipc	ra,0x0
    80002938:	9b4080e7          	jalr	-1612(ra) # 800022e8 <cpuid>
    8000293c:	01813083          	ld	ra,24(sp)
    80002940:	01013403          	ld	s0,16(sp)
    80002944:	00d5179b          	slliw	a5,a0,0xd
    80002948:	0c201737          	lui	a4,0xc201
    8000294c:	00f707b3          	add	a5,a4,a5
    80002950:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002954:	00813483          	ld	s1,8(sp)
    80002958:	02010113          	addi	sp,sp,32
    8000295c:	00008067          	ret

0000000080002960 <consolewrite>:
    80002960:	fb010113          	addi	sp,sp,-80
    80002964:	04813023          	sd	s0,64(sp)
    80002968:	04113423          	sd	ra,72(sp)
    8000296c:	02913c23          	sd	s1,56(sp)
    80002970:	03213823          	sd	s2,48(sp)
    80002974:	03313423          	sd	s3,40(sp)
    80002978:	03413023          	sd	s4,32(sp)
    8000297c:	01513c23          	sd	s5,24(sp)
    80002980:	05010413          	addi	s0,sp,80
    80002984:	06c05c63          	blez	a2,800029fc <consolewrite+0x9c>
    80002988:	00060993          	mv	s3,a2
    8000298c:	00050a13          	mv	s4,a0
    80002990:	00058493          	mv	s1,a1
    80002994:	00000913          	li	s2,0
    80002998:	fff00a93          	li	s5,-1
    8000299c:	01c0006f          	j	800029b8 <consolewrite+0x58>
    800029a0:	fbf44503          	lbu	a0,-65(s0)
    800029a4:	0019091b          	addiw	s2,s2,1
    800029a8:	00148493          	addi	s1,s1,1
    800029ac:	00001097          	auipc	ra,0x1
    800029b0:	a9c080e7          	jalr	-1380(ra) # 80003448 <uartputc>
    800029b4:	03298063          	beq	s3,s2,800029d4 <consolewrite+0x74>
    800029b8:	00048613          	mv	a2,s1
    800029bc:	00100693          	li	a3,1
    800029c0:	000a0593          	mv	a1,s4
    800029c4:	fbf40513          	addi	a0,s0,-65
    800029c8:	00000097          	auipc	ra,0x0
    800029cc:	9d8080e7          	jalr	-1576(ra) # 800023a0 <either_copyin>
    800029d0:	fd5518e3          	bne	a0,s5,800029a0 <consolewrite+0x40>
    800029d4:	04813083          	ld	ra,72(sp)
    800029d8:	04013403          	ld	s0,64(sp)
    800029dc:	03813483          	ld	s1,56(sp)
    800029e0:	02813983          	ld	s3,40(sp)
    800029e4:	02013a03          	ld	s4,32(sp)
    800029e8:	01813a83          	ld	s5,24(sp)
    800029ec:	00090513          	mv	a0,s2
    800029f0:	03013903          	ld	s2,48(sp)
    800029f4:	05010113          	addi	sp,sp,80
    800029f8:	00008067          	ret
    800029fc:	00000913          	li	s2,0
    80002a00:	fd5ff06f          	j	800029d4 <consolewrite+0x74>

0000000080002a04 <consoleread>:
    80002a04:	f9010113          	addi	sp,sp,-112
    80002a08:	06813023          	sd	s0,96(sp)
    80002a0c:	04913c23          	sd	s1,88(sp)
    80002a10:	05213823          	sd	s2,80(sp)
    80002a14:	05313423          	sd	s3,72(sp)
    80002a18:	05413023          	sd	s4,64(sp)
    80002a1c:	03513c23          	sd	s5,56(sp)
    80002a20:	03613823          	sd	s6,48(sp)
    80002a24:	03713423          	sd	s7,40(sp)
    80002a28:	03813023          	sd	s8,32(sp)
    80002a2c:	06113423          	sd	ra,104(sp)
    80002a30:	01913c23          	sd	s9,24(sp)
    80002a34:	07010413          	addi	s0,sp,112
    80002a38:	00060b93          	mv	s7,a2
    80002a3c:	00050913          	mv	s2,a0
    80002a40:	00058c13          	mv	s8,a1
    80002a44:	00060b1b          	sext.w	s6,a2
    80002a48:	00004497          	auipc	s1,0x4
    80002a4c:	fc048493          	addi	s1,s1,-64 # 80006a08 <cons>
    80002a50:	00400993          	li	s3,4
    80002a54:	fff00a13          	li	s4,-1
    80002a58:	00a00a93          	li	s5,10
    80002a5c:	05705e63          	blez	s7,80002ab8 <consoleread+0xb4>
    80002a60:	09c4a703          	lw	a4,156(s1)
    80002a64:	0984a783          	lw	a5,152(s1)
    80002a68:	0007071b          	sext.w	a4,a4
    80002a6c:	08e78463          	beq	a5,a4,80002af4 <consoleread+0xf0>
    80002a70:	07f7f713          	andi	a4,a5,127
    80002a74:	00e48733          	add	a4,s1,a4
    80002a78:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002a7c:	0017869b          	addiw	a3,a5,1
    80002a80:	08d4ac23          	sw	a3,152(s1)
    80002a84:	00070c9b          	sext.w	s9,a4
    80002a88:	0b370663          	beq	a4,s3,80002b34 <consoleread+0x130>
    80002a8c:	00100693          	li	a3,1
    80002a90:	f9f40613          	addi	a2,s0,-97
    80002a94:	000c0593          	mv	a1,s8
    80002a98:	00090513          	mv	a0,s2
    80002a9c:	f8e40fa3          	sb	a4,-97(s0)
    80002aa0:	00000097          	auipc	ra,0x0
    80002aa4:	8b4080e7          	jalr	-1868(ra) # 80002354 <either_copyout>
    80002aa8:	01450863          	beq	a0,s4,80002ab8 <consoleread+0xb4>
    80002aac:	001c0c13          	addi	s8,s8,1
    80002ab0:	fffb8b9b          	addiw	s7,s7,-1
    80002ab4:	fb5c94e3          	bne	s9,s5,80002a5c <consoleread+0x58>
    80002ab8:	000b851b          	sext.w	a0,s7
    80002abc:	06813083          	ld	ra,104(sp)
    80002ac0:	06013403          	ld	s0,96(sp)
    80002ac4:	05813483          	ld	s1,88(sp)
    80002ac8:	05013903          	ld	s2,80(sp)
    80002acc:	04813983          	ld	s3,72(sp)
    80002ad0:	04013a03          	ld	s4,64(sp)
    80002ad4:	03813a83          	ld	s5,56(sp)
    80002ad8:	02813b83          	ld	s7,40(sp)
    80002adc:	02013c03          	ld	s8,32(sp)
    80002ae0:	01813c83          	ld	s9,24(sp)
    80002ae4:	40ab053b          	subw	a0,s6,a0
    80002ae8:	03013b03          	ld	s6,48(sp)
    80002aec:	07010113          	addi	sp,sp,112
    80002af0:	00008067          	ret
    80002af4:	00001097          	auipc	ra,0x1
    80002af8:	1d8080e7          	jalr	472(ra) # 80003ccc <push_on>
    80002afc:	0984a703          	lw	a4,152(s1)
    80002b00:	09c4a783          	lw	a5,156(s1)
    80002b04:	0007879b          	sext.w	a5,a5
    80002b08:	fef70ce3          	beq	a4,a5,80002b00 <consoleread+0xfc>
    80002b0c:	00001097          	auipc	ra,0x1
    80002b10:	234080e7          	jalr	564(ra) # 80003d40 <pop_on>
    80002b14:	0984a783          	lw	a5,152(s1)
    80002b18:	07f7f713          	andi	a4,a5,127
    80002b1c:	00e48733          	add	a4,s1,a4
    80002b20:	01874703          	lbu	a4,24(a4)
    80002b24:	0017869b          	addiw	a3,a5,1
    80002b28:	08d4ac23          	sw	a3,152(s1)
    80002b2c:	00070c9b          	sext.w	s9,a4
    80002b30:	f5371ee3          	bne	a4,s3,80002a8c <consoleread+0x88>
    80002b34:	000b851b          	sext.w	a0,s7
    80002b38:	f96bf2e3          	bgeu	s7,s6,80002abc <consoleread+0xb8>
    80002b3c:	08f4ac23          	sw	a5,152(s1)
    80002b40:	f7dff06f          	j	80002abc <consoleread+0xb8>

0000000080002b44 <consputc>:
    80002b44:	10000793          	li	a5,256
    80002b48:	00f50663          	beq	a0,a5,80002b54 <consputc+0x10>
    80002b4c:	00001317          	auipc	t1,0x1
    80002b50:	9f430067          	jr	-1548(t1) # 80003540 <uartputc_sync>
    80002b54:	ff010113          	addi	sp,sp,-16
    80002b58:	00113423          	sd	ra,8(sp)
    80002b5c:	00813023          	sd	s0,0(sp)
    80002b60:	01010413          	addi	s0,sp,16
    80002b64:	00800513          	li	a0,8
    80002b68:	00001097          	auipc	ra,0x1
    80002b6c:	9d8080e7          	jalr	-1576(ra) # 80003540 <uartputc_sync>
    80002b70:	02000513          	li	a0,32
    80002b74:	00001097          	auipc	ra,0x1
    80002b78:	9cc080e7          	jalr	-1588(ra) # 80003540 <uartputc_sync>
    80002b7c:	00013403          	ld	s0,0(sp)
    80002b80:	00813083          	ld	ra,8(sp)
    80002b84:	00800513          	li	a0,8
    80002b88:	01010113          	addi	sp,sp,16
    80002b8c:	00001317          	auipc	t1,0x1
    80002b90:	9b430067          	jr	-1612(t1) # 80003540 <uartputc_sync>

0000000080002b94 <consoleintr>:
    80002b94:	fe010113          	addi	sp,sp,-32
    80002b98:	00813823          	sd	s0,16(sp)
    80002b9c:	00913423          	sd	s1,8(sp)
    80002ba0:	01213023          	sd	s2,0(sp)
    80002ba4:	00113c23          	sd	ra,24(sp)
    80002ba8:	02010413          	addi	s0,sp,32
    80002bac:	00004917          	auipc	s2,0x4
    80002bb0:	e5c90913          	addi	s2,s2,-420 # 80006a08 <cons>
    80002bb4:	00050493          	mv	s1,a0
    80002bb8:	00090513          	mv	a0,s2
    80002bbc:	00001097          	auipc	ra,0x1
    80002bc0:	e40080e7          	jalr	-448(ra) # 800039fc <acquire>
    80002bc4:	02048c63          	beqz	s1,80002bfc <consoleintr+0x68>
    80002bc8:	0a092783          	lw	a5,160(s2)
    80002bcc:	09892703          	lw	a4,152(s2)
    80002bd0:	07f00693          	li	a3,127
    80002bd4:	40e7873b          	subw	a4,a5,a4
    80002bd8:	02e6e263          	bltu	a3,a4,80002bfc <consoleintr+0x68>
    80002bdc:	00d00713          	li	a4,13
    80002be0:	04e48063          	beq	s1,a4,80002c20 <consoleintr+0x8c>
    80002be4:	07f7f713          	andi	a4,a5,127
    80002be8:	00e90733          	add	a4,s2,a4
    80002bec:	0017879b          	addiw	a5,a5,1
    80002bf0:	0af92023          	sw	a5,160(s2)
    80002bf4:	00970c23          	sb	s1,24(a4)
    80002bf8:	08f92e23          	sw	a5,156(s2)
    80002bfc:	01013403          	ld	s0,16(sp)
    80002c00:	01813083          	ld	ra,24(sp)
    80002c04:	00813483          	ld	s1,8(sp)
    80002c08:	00013903          	ld	s2,0(sp)
    80002c0c:	00004517          	auipc	a0,0x4
    80002c10:	dfc50513          	addi	a0,a0,-516 # 80006a08 <cons>
    80002c14:	02010113          	addi	sp,sp,32
    80002c18:	00001317          	auipc	t1,0x1
    80002c1c:	eb030067          	jr	-336(t1) # 80003ac8 <release>
    80002c20:	00a00493          	li	s1,10
    80002c24:	fc1ff06f          	j	80002be4 <consoleintr+0x50>

0000000080002c28 <consoleinit>:
    80002c28:	fe010113          	addi	sp,sp,-32
    80002c2c:	00113c23          	sd	ra,24(sp)
    80002c30:	00813823          	sd	s0,16(sp)
    80002c34:	00913423          	sd	s1,8(sp)
    80002c38:	02010413          	addi	s0,sp,32
    80002c3c:	00004497          	auipc	s1,0x4
    80002c40:	dcc48493          	addi	s1,s1,-564 # 80006a08 <cons>
    80002c44:	00048513          	mv	a0,s1
    80002c48:	00002597          	auipc	a1,0x2
    80002c4c:	5e858593          	addi	a1,a1,1512 # 80005230 <_ZZ12printIntegermE6digits+0x138>
    80002c50:	00001097          	auipc	ra,0x1
    80002c54:	d88080e7          	jalr	-632(ra) # 800039d8 <initlock>
    80002c58:	00000097          	auipc	ra,0x0
    80002c5c:	7ac080e7          	jalr	1964(ra) # 80003404 <uartinit>
    80002c60:	01813083          	ld	ra,24(sp)
    80002c64:	01013403          	ld	s0,16(sp)
    80002c68:	00000797          	auipc	a5,0x0
    80002c6c:	d9c78793          	addi	a5,a5,-612 # 80002a04 <consoleread>
    80002c70:	0af4bc23          	sd	a5,184(s1)
    80002c74:	00000797          	auipc	a5,0x0
    80002c78:	cec78793          	addi	a5,a5,-788 # 80002960 <consolewrite>
    80002c7c:	0cf4b023          	sd	a5,192(s1)
    80002c80:	00813483          	ld	s1,8(sp)
    80002c84:	02010113          	addi	sp,sp,32
    80002c88:	00008067          	ret

0000000080002c8c <console_read>:
    80002c8c:	ff010113          	addi	sp,sp,-16
    80002c90:	00813423          	sd	s0,8(sp)
    80002c94:	01010413          	addi	s0,sp,16
    80002c98:	00813403          	ld	s0,8(sp)
    80002c9c:	00004317          	auipc	t1,0x4
    80002ca0:	e2433303          	ld	t1,-476(t1) # 80006ac0 <devsw+0x10>
    80002ca4:	01010113          	addi	sp,sp,16
    80002ca8:	00030067          	jr	t1

0000000080002cac <console_write>:
    80002cac:	ff010113          	addi	sp,sp,-16
    80002cb0:	00813423          	sd	s0,8(sp)
    80002cb4:	01010413          	addi	s0,sp,16
    80002cb8:	00813403          	ld	s0,8(sp)
    80002cbc:	00004317          	auipc	t1,0x4
    80002cc0:	e0c33303          	ld	t1,-500(t1) # 80006ac8 <devsw+0x18>
    80002cc4:	01010113          	addi	sp,sp,16
    80002cc8:	00030067          	jr	t1

0000000080002ccc <panic>:
    80002ccc:	fe010113          	addi	sp,sp,-32
    80002cd0:	00113c23          	sd	ra,24(sp)
    80002cd4:	00813823          	sd	s0,16(sp)
    80002cd8:	00913423          	sd	s1,8(sp)
    80002cdc:	02010413          	addi	s0,sp,32
    80002ce0:	00050493          	mv	s1,a0
    80002ce4:	00002517          	auipc	a0,0x2
    80002ce8:	55450513          	addi	a0,a0,1364 # 80005238 <_ZZ12printIntegermE6digits+0x140>
    80002cec:	00004797          	auipc	a5,0x4
    80002cf0:	e607ae23          	sw	zero,-388(a5) # 80006b68 <pr+0x18>
    80002cf4:	00000097          	auipc	ra,0x0
    80002cf8:	034080e7          	jalr	52(ra) # 80002d28 <__printf>
    80002cfc:	00048513          	mv	a0,s1
    80002d00:	00000097          	auipc	ra,0x0
    80002d04:	028080e7          	jalr	40(ra) # 80002d28 <__printf>
    80002d08:	00002517          	auipc	a0,0x2
    80002d0c:	3e850513          	addi	a0,a0,1000 # 800050f0 <CONSOLE_STATUS+0xe0>
    80002d10:	00000097          	auipc	ra,0x0
    80002d14:	018080e7          	jalr	24(ra) # 80002d28 <__printf>
    80002d18:	00100793          	li	a5,1
    80002d1c:	00003717          	auipc	a4,0x3
    80002d20:	baf72e23          	sw	a5,-1092(a4) # 800058d8 <panicked>
    80002d24:	0000006f          	j	80002d24 <panic+0x58>

0000000080002d28 <__printf>:
    80002d28:	f3010113          	addi	sp,sp,-208
    80002d2c:	08813023          	sd	s0,128(sp)
    80002d30:	07313423          	sd	s3,104(sp)
    80002d34:	09010413          	addi	s0,sp,144
    80002d38:	05813023          	sd	s8,64(sp)
    80002d3c:	08113423          	sd	ra,136(sp)
    80002d40:	06913c23          	sd	s1,120(sp)
    80002d44:	07213823          	sd	s2,112(sp)
    80002d48:	07413023          	sd	s4,96(sp)
    80002d4c:	05513c23          	sd	s5,88(sp)
    80002d50:	05613823          	sd	s6,80(sp)
    80002d54:	05713423          	sd	s7,72(sp)
    80002d58:	03913c23          	sd	s9,56(sp)
    80002d5c:	03a13823          	sd	s10,48(sp)
    80002d60:	03b13423          	sd	s11,40(sp)
    80002d64:	00004317          	auipc	t1,0x4
    80002d68:	dec30313          	addi	t1,t1,-532 # 80006b50 <pr>
    80002d6c:	01832c03          	lw	s8,24(t1)
    80002d70:	00b43423          	sd	a1,8(s0)
    80002d74:	00c43823          	sd	a2,16(s0)
    80002d78:	00d43c23          	sd	a3,24(s0)
    80002d7c:	02e43023          	sd	a4,32(s0)
    80002d80:	02f43423          	sd	a5,40(s0)
    80002d84:	03043823          	sd	a6,48(s0)
    80002d88:	03143c23          	sd	a7,56(s0)
    80002d8c:	00050993          	mv	s3,a0
    80002d90:	4a0c1663          	bnez	s8,8000323c <__printf+0x514>
    80002d94:	60098c63          	beqz	s3,800033ac <__printf+0x684>
    80002d98:	0009c503          	lbu	a0,0(s3)
    80002d9c:	00840793          	addi	a5,s0,8
    80002da0:	f6f43c23          	sd	a5,-136(s0)
    80002da4:	00000493          	li	s1,0
    80002da8:	22050063          	beqz	a0,80002fc8 <__printf+0x2a0>
    80002dac:	00002a37          	lui	s4,0x2
    80002db0:	00018ab7          	lui	s5,0x18
    80002db4:	000f4b37          	lui	s6,0xf4
    80002db8:	00989bb7          	lui	s7,0x989
    80002dbc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002dc0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002dc4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002dc8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002dcc:	00148c9b          	addiw	s9,s1,1
    80002dd0:	02500793          	li	a5,37
    80002dd4:	01998933          	add	s2,s3,s9
    80002dd8:	38f51263          	bne	a0,a5,8000315c <__printf+0x434>
    80002ddc:	00094783          	lbu	a5,0(s2)
    80002de0:	00078c9b          	sext.w	s9,a5
    80002de4:	1e078263          	beqz	a5,80002fc8 <__printf+0x2a0>
    80002de8:	0024849b          	addiw	s1,s1,2
    80002dec:	07000713          	li	a4,112
    80002df0:	00998933          	add	s2,s3,s1
    80002df4:	38e78a63          	beq	a5,a4,80003188 <__printf+0x460>
    80002df8:	20f76863          	bltu	a4,a5,80003008 <__printf+0x2e0>
    80002dfc:	42a78863          	beq	a5,a0,8000322c <__printf+0x504>
    80002e00:	06400713          	li	a4,100
    80002e04:	40e79663          	bne	a5,a4,80003210 <__printf+0x4e8>
    80002e08:	f7843783          	ld	a5,-136(s0)
    80002e0c:	0007a603          	lw	a2,0(a5)
    80002e10:	00878793          	addi	a5,a5,8
    80002e14:	f6f43c23          	sd	a5,-136(s0)
    80002e18:	42064a63          	bltz	a2,8000324c <__printf+0x524>
    80002e1c:	00a00713          	li	a4,10
    80002e20:	02e677bb          	remuw	a5,a2,a4
    80002e24:	00002d97          	auipc	s11,0x2
    80002e28:	43cd8d93          	addi	s11,s11,1084 # 80005260 <digits>
    80002e2c:	00900593          	li	a1,9
    80002e30:	0006051b          	sext.w	a0,a2
    80002e34:	00000c93          	li	s9,0
    80002e38:	02079793          	slli	a5,a5,0x20
    80002e3c:	0207d793          	srli	a5,a5,0x20
    80002e40:	00fd87b3          	add	a5,s11,a5
    80002e44:	0007c783          	lbu	a5,0(a5)
    80002e48:	02e656bb          	divuw	a3,a2,a4
    80002e4c:	f8f40023          	sb	a5,-128(s0)
    80002e50:	14c5d863          	bge	a1,a2,80002fa0 <__printf+0x278>
    80002e54:	06300593          	li	a1,99
    80002e58:	00100c93          	li	s9,1
    80002e5c:	02e6f7bb          	remuw	a5,a3,a4
    80002e60:	02079793          	slli	a5,a5,0x20
    80002e64:	0207d793          	srli	a5,a5,0x20
    80002e68:	00fd87b3          	add	a5,s11,a5
    80002e6c:	0007c783          	lbu	a5,0(a5)
    80002e70:	02e6d73b          	divuw	a4,a3,a4
    80002e74:	f8f400a3          	sb	a5,-127(s0)
    80002e78:	12a5f463          	bgeu	a1,a0,80002fa0 <__printf+0x278>
    80002e7c:	00a00693          	li	a3,10
    80002e80:	00900593          	li	a1,9
    80002e84:	02d777bb          	remuw	a5,a4,a3
    80002e88:	02079793          	slli	a5,a5,0x20
    80002e8c:	0207d793          	srli	a5,a5,0x20
    80002e90:	00fd87b3          	add	a5,s11,a5
    80002e94:	0007c503          	lbu	a0,0(a5)
    80002e98:	02d757bb          	divuw	a5,a4,a3
    80002e9c:	f8a40123          	sb	a0,-126(s0)
    80002ea0:	48e5f263          	bgeu	a1,a4,80003324 <__printf+0x5fc>
    80002ea4:	06300513          	li	a0,99
    80002ea8:	02d7f5bb          	remuw	a1,a5,a3
    80002eac:	02059593          	slli	a1,a1,0x20
    80002eb0:	0205d593          	srli	a1,a1,0x20
    80002eb4:	00bd85b3          	add	a1,s11,a1
    80002eb8:	0005c583          	lbu	a1,0(a1)
    80002ebc:	02d7d7bb          	divuw	a5,a5,a3
    80002ec0:	f8b401a3          	sb	a1,-125(s0)
    80002ec4:	48e57263          	bgeu	a0,a4,80003348 <__printf+0x620>
    80002ec8:	3e700513          	li	a0,999
    80002ecc:	02d7f5bb          	remuw	a1,a5,a3
    80002ed0:	02059593          	slli	a1,a1,0x20
    80002ed4:	0205d593          	srli	a1,a1,0x20
    80002ed8:	00bd85b3          	add	a1,s11,a1
    80002edc:	0005c583          	lbu	a1,0(a1)
    80002ee0:	02d7d7bb          	divuw	a5,a5,a3
    80002ee4:	f8b40223          	sb	a1,-124(s0)
    80002ee8:	46e57663          	bgeu	a0,a4,80003354 <__printf+0x62c>
    80002eec:	02d7f5bb          	remuw	a1,a5,a3
    80002ef0:	02059593          	slli	a1,a1,0x20
    80002ef4:	0205d593          	srli	a1,a1,0x20
    80002ef8:	00bd85b3          	add	a1,s11,a1
    80002efc:	0005c583          	lbu	a1,0(a1)
    80002f00:	02d7d7bb          	divuw	a5,a5,a3
    80002f04:	f8b402a3          	sb	a1,-123(s0)
    80002f08:	46ea7863          	bgeu	s4,a4,80003378 <__printf+0x650>
    80002f0c:	02d7f5bb          	remuw	a1,a5,a3
    80002f10:	02059593          	slli	a1,a1,0x20
    80002f14:	0205d593          	srli	a1,a1,0x20
    80002f18:	00bd85b3          	add	a1,s11,a1
    80002f1c:	0005c583          	lbu	a1,0(a1)
    80002f20:	02d7d7bb          	divuw	a5,a5,a3
    80002f24:	f8b40323          	sb	a1,-122(s0)
    80002f28:	3eeaf863          	bgeu	s5,a4,80003318 <__printf+0x5f0>
    80002f2c:	02d7f5bb          	remuw	a1,a5,a3
    80002f30:	02059593          	slli	a1,a1,0x20
    80002f34:	0205d593          	srli	a1,a1,0x20
    80002f38:	00bd85b3          	add	a1,s11,a1
    80002f3c:	0005c583          	lbu	a1,0(a1)
    80002f40:	02d7d7bb          	divuw	a5,a5,a3
    80002f44:	f8b403a3          	sb	a1,-121(s0)
    80002f48:	42eb7e63          	bgeu	s6,a4,80003384 <__printf+0x65c>
    80002f4c:	02d7f5bb          	remuw	a1,a5,a3
    80002f50:	02059593          	slli	a1,a1,0x20
    80002f54:	0205d593          	srli	a1,a1,0x20
    80002f58:	00bd85b3          	add	a1,s11,a1
    80002f5c:	0005c583          	lbu	a1,0(a1)
    80002f60:	02d7d7bb          	divuw	a5,a5,a3
    80002f64:	f8b40423          	sb	a1,-120(s0)
    80002f68:	42ebfc63          	bgeu	s7,a4,800033a0 <__printf+0x678>
    80002f6c:	02079793          	slli	a5,a5,0x20
    80002f70:	0207d793          	srli	a5,a5,0x20
    80002f74:	00fd8db3          	add	s11,s11,a5
    80002f78:	000dc703          	lbu	a4,0(s11)
    80002f7c:	00a00793          	li	a5,10
    80002f80:	00900c93          	li	s9,9
    80002f84:	f8e404a3          	sb	a4,-119(s0)
    80002f88:	00065c63          	bgez	a2,80002fa0 <__printf+0x278>
    80002f8c:	f9040713          	addi	a4,s0,-112
    80002f90:	00f70733          	add	a4,a4,a5
    80002f94:	02d00693          	li	a3,45
    80002f98:	fed70823          	sb	a3,-16(a4)
    80002f9c:	00078c93          	mv	s9,a5
    80002fa0:	f8040793          	addi	a5,s0,-128
    80002fa4:	01978cb3          	add	s9,a5,s9
    80002fa8:	f7f40d13          	addi	s10,s0,-129
    80002fac:	000cc503          	lbu	a0,0(s9)
    80002fb0:	fffc8c93          	addi	s9,s9,-1
    80002fb4:	00000097          	auipc	ra,0x0
    80002fb8:	b90080e7          	jalr	-1136(ra) # 80002b44 <consputc>
    80002fbc:	ffac98e3          	bne	s9,s10,80002fac <__printf+0x284>
    80002fc0:	00094503          	lbu	a0,0(s2)
    80002fc4:	e00514e3          	bnez	a0,80002dcc <__printf+0xa4>
    80002fc8:	1a0c1663          	bnez	s8,80003174 <__printf+0x44c>
    80002fcc:	08813083          	ld	ra,136(sp)
    80002fd0:	08013403          	ld	s0,128(sp)
    80002fd4:	07813483          	ld	s1,120(sp)
    80002fd8:	07013903          	ld	s2,112(sp)
    80002fdc:	06813983          	ld	s3,104(sp)
    80002fe0:	06013a03          	ld	s4,96(sp)
    80002fe4:	05813a83          	ld	s5,88(sp)
    80002fe8:	05013b03          	ld	s6,80(sp)
    80002fec:	04813b83          	ld	s7,72(sp)
    80002ff0:	04013c03          	ld	s8,64(sp)
    80002ff4:	03813c83          	ld	s9,56(sp)
    80002ff8:	03013d03          	ld	s10,48(sp)
    80002ffc:	02813d83          	ld	s11,40(sp)
    80003000:	0d010113          	addi	sp,sp,208
    80003004:	00008067          	ret
    80003008:	07300713          	li	a4,115
    8000300c:	1ce78a63          	beq	a5,a4,800031e0 <__printf+0x4b8>
    80003010:	07800713          	li	a4,120
    80003014:	1ee79e63          	bne	a5,a4,80003210 <__printf+0x4e8>
    80003018:	f7843783          	ld	a5,-136(s0)
    8000301c:	0007a703          	lw	a4,0(a5)
    80003020:	00878793          	addi	a5,a5,8
    80003024:	f6f43c23          	sd	a5,-136(s0)
    80003028:	28074263          	bltz	a4,800032ac <__printf+0x584>
    8000302c:	00002d97          	auipc	s11,0x2
    80003030:	234d8d93          	addi	s11,s11,564 # 80005260 <digits>
    80003034:	00f77793          	andi	a5,a4,15
    80003038:	00fd87b3          	add	a5,s11,a5
    8000303c:	0007c683          	lbu	a3,0(a5)
    80003040:	00f00613          	li	a2,15
    80003044:	0007079b          	sext.w	a5,a4
    80003048:	f8d40023          	sb	a3,-128(s0)
    8000304c:	0047559b          	srliw	a1,a4,0x4
    80003050:	0047569b          	srliw	a3,a4,0x4
    80003054:	00000c93          	li	s9,0
    80003058:	0ee65063          	bge	a2,a4,80003138 <__printf+0x410>
    8000305c:	00f6f693          	andi	a3,a3,15
    80003060:	00dd86b3          	add	a3,s11,a3
    80003064:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003068:	0087d79b          	srliw	a5,a5,0x8
    8000306c:	00100c93          	li	s9,1
    80003070:	f8d400a3          	sb	a3,-127(s0)
    80003074:	0cb67263          	bgeu	a2,a1,80003138 <__printf+0x410>
    80003078:	00f7f693          	andi	a3,a5,15
    8000307c:	00dd86b3          	add	a3,s11,a3
    80003080:	0006c583          	lbu	a1,0(a3)
    80003084:	00f00613          	li	a2,15
    80003088:	0047d69b          	srliw	a3,a5,0x4
    8000308c:	f8b40123          	sb	a1,-126(s0)
    80003090:	0047d593          	srli	a1,a5,0x4
    80003094:	28f67e63          	bgeu	a2,a5,80003330 <__printf+0x608>
    80003098:	00f6f693          	andi	a3,a3,15
    8000309c:	00dd86b3          	add	a3,s11,a3
    800030a0:	0006c503          	lbu	a0,0(a3)
    800030a4:	0087d813          	srli	a6,a5,0x8
    800030a8:	0087d69b          	srliw	a3,a5,0x8
    800030ac:	f8a401a3          	sb	a0,-125(s0)
    800030b0:	28b67663          	bgeu	a2,a1,8000333c <__printf+0x614>
    800030b4:	00f6f693          	andi	a3,a3,15
    800030b8:	00dd86b3          	add	a3,s11,a3
    800030bc:	0006c583          	lbu	a1,0(a3)
    800030c0:	00c7d513          	srli	a0,a5,0xc
    800030c4:	00c7d69b          	srliw	a3,a5,0xc
    800030c8:	f8b40223          	sb	a1,-124(s0)
    800030cc:	29067a63          	bgeu	a2,a6,80003360 <__printf+0x638>
    800030d0:	00f6f693          	andi	a3,a3,15
    800030d4:	00dd86b3          	add	a3,s11,a3
    800030d8:	0006c583          	lbu	a1,0(a3)
    800030dc:	0107d813          	srli	a6,a5,0x10
    800030e0:	0107d69b          	srliw	a3,a5,0x10
    800030e4:	f8b402a3          	sb	a1,-123(s0)
    800030e8:	28a67263          	bgeu	a2,a0,8000336c <__printf+0x644>
    800030ec:	00f6f693          	andi	a3,a3,15
    800030f0:	00dd86b3          	add	a3,s11,a3
    800030f4:	0006c683          	lbu	a3,0(a3)
    800030f8:	0147d79b          	srliw	a5,a5,0x14
    800030fc:	f8d40323          	sb	a3,-122(s0)
    80003100:	21067663          	bgeu	a2,a6,8000330c <__printf+0x5e4>
    80003104:	02079793          	slli	a5,a5,0x20
    80003108:	0207d793          	srli	a5,a5,0x20
    8000310c:	00fd8db3          	add	s11,s11,a5
    80003110:	000dc683          	lbu	a3,0(s11)
    80003114:	00800793          	li	a5,8
    80003118:	00700c93          	li	s9,7
    8000311c:	f8d403a3          	sb	a3,-121(s0)
    80003120:	00075c63          	bgez	a4,80003138 <__printf+0x410>
    80003124:	f9040713          	addi	a4,s0,-112
    80003128:	00f70733          	add	a4,a4,a5
    8000312c:	02d00693          	li	a3,45
    80003130:	fed70823          	sb	a3,-16(a4)
    80003134:	00078c93          	mv	s9,a5
    80003138:	f8040793          	addi	a5,s0,-128
    8000313c:	01978cb3          	add	s9,a5,s9
    80003140:	f7f40d13          	addi	s10,s0,-129
    80003144:	000cc503          	lbu	a0,0(s9)
    80003148:	fffc8c93          	addi	s9,s9,-1
    8000314c:	00000097          	auipc	ra,0x0
    80003150:	9f8080e7          	jalr	-1544(ra) # 80002b44 <consputc>
    80003154:	ff9d18e3          	bne	s10,s9,80003144 <__printf+0x41c>
    80003158:	0100006f          	j	80003168 <__printf+0x440>
    8000315c:	00000097          	auipc	ra,0x0
    80003160:	9e8080e7          	jalr	-1560(ra) # 80002b44 <consputc>
    80003164:	000c8493          	mv	s1,s9
    80003168:	00094503          	lbu	a0,0(s2)
    8000316c:	c60510e3          	bnez	a0,80002dcc <__printf+0xa4>
    80003170:	e40c0ee3          	beqz	s8,80002fcc <__printf+0x2a4>
    80003174:	00004517          	auipc	a0,0x4
    80003178:	9dc50513          	addi	a0,a0,-1572 # 80006b50 <pr>
    8000317c:	00001097          	auipc	ra,0x1
    80003180:	94c080e7          	jalr	-1716(ra) # 80003ac8 <release>
    80003184:	e49ff06f          	j	80002fcc <__printf+0x2a4>
    80003188:	f7843783          	ld	a5,-136(s0)
    8000318c:	03000513          	li	a0,48
    80003190:	01000d13          	li	s10,16
    80003194:	00878713          	addi	a4,a5,8
    80003198:	0007bc83          	ld	s9,0(a5)
    8000319c:	f6e43c23          	sd	a4,-136(s0)
    800031a0:	00000097          	auipc	ra,0x0
    800031a4:	9a4080e7          	jalr	-1628(ra) # 80002b44 <consputc>
    800031a8:	07800513          	li	a0,120
    800031ac:	00000097          	auipc	ra,0x0
    800031b0:	998080e7          	jalr	-1640(ra) # 80002b44 <consputc>
    800031b4:	00002d97          	auipc	s11,0x2
    800031b8:	0acd8d93          	addi	s11,s11,172 # 80005260 <digits>
    800031bc:	03ccd793          	srli	a5,s9,0x3c
    800031c0:	00fd87b3          	add	a5,s11,a5
    800031c4:	0007c503          	lbu	a0,0(a5)
    800031c8:	fffd0d1b          	addiw	s10,s10,-1
    800031cc:	004c9c93          	slli	s9,s9,0x4
    800031d0:	00000097          	auipc	ra,0x0
    800031d4:	974080e7          	jalr	-1676(ra) # 80002b44 <consputc>
    800031d8:	fe0d12e3          	bnez	s10,800031bc <__printf+0x494>
    800031dc:	f8dff06f          	j	80003168 <__printf+0x440>
    800031e0:	f7843783          	ld	a5,-136(s0)
    800031e4:	0007bc83          	ld	s9,0(a5)
    800031e8:	00878793          	addi	a5,a5,8
    800031ec:	f6f43c23          	sd	a5,-136(s0)
    800031f0:	000c9a63          	bnez	s9,80003204 <__printf+0x4dc>
    800031f4:	1080006f          	j	800032fc <__printf+0x5d4>
    800031f8:	001c8c93          	addi	s9,s9,1
    800031fc:	00000097          	auipc	ra,0x0
    80003200:	948080e7          	jalr	-1720(ra) # 80002b44 <consputc>
    80003204:	000cc503          	lbu	a0,0(s9)
    80003208:	fe0518e3          	bnez	a0,800031f8 <__printf+0x4d0>
    8000320c:	f5dff06f          	j	80003168 <__printf+0x440>
    80003210:	02500513          	li	a0,37
    80003214:	00000097          	auipc	ra,0x0
    80003218:	930080e7          	jalr	-1744(ra) # 80002b44 <consputc>
    8000321c:	000c8513          	mv	a0,s9
    80003220:	00000097          	auipc	ra,0x0
    80003224:	924080e7          	jalr	-1756(ra) # 80002b44 <consputc>
    80003228:	f41ff06f          	j	80003168 <__printf+0x440>
    8000322c:	02500513          	li	a0,37
    80003230:	00000097          	auipc	ra,0x0
    80003234:	914080e7          	jalr	-1772(ra) # 80002b44 <consputc>
    80003238:	f31ff06f          	j	80003168 <__printf+0x440>
    8000323c:	00030513          	mv	a0,t1
    80003240:	00000097          	auipc	ra,0x0
    80003244:	7bc080e7          	jalr	1980(ra) # 800039fc <acquire>
    80003248:	b4dff06f          	j	80002d94 <__printf+0x6c>
    8000324c:	40c0053b          	negw	a0,a2
    80003250:	00a00713          	li	a4,10
    80003254:	02e576bb          	remuw	a3,a0,a4
    80003258:	00002d97          	auipc	s11,0x2
    8000325c:	008d8d93          	addi	s11,s11,8 # 80005260 <digits>
    80003260:	ff700593          	li	a1,-9
    80003264:	02069693          	slli	a3,a3,0x20
    80003268:	0206d693          	srli	a3,a3,0x20
    8000326c:	00dd86b3          	add	a3,s11,a3
    80003270:	0006c683          	lbu	a3,0(a3)
    80003274:	02e557bb          	divuw	a5,a0,a4
    80003278:	f8d40023          	sb	a3,-128(s0)
    8000327c:	10b65e63          	bge	a2,a1,80003398 <__printf+0x670>
    80003280:	06300593          	li	a1,99
    80003284:	02e7f6bb          	remuw	a3,a5,a4
    80003288:	02069693          	slli	a3,a3,0x20
    8000328c:	0206d693          	srli	a3,a3,0x20
    80003290:	00dd86b3          	add	a3,s11,a3
    80003294:	0006c683          	lbu	a3,0(a3)
    80003298:	02e7d73b          	divuw	a4,a5,a4
    8000329c:	00200793          	li	a5,2
    800032a0:	f8d400a3          	sb	a3,-127(s0)
    800032a4:	bca5ece3          	bltu	a1,a0,80002e7c <__printf+0x154>
    800032a8:	ce5ff06f          	j	80002f8c <__printf+0x264>
    800032ac:	40e007bb          	negw	a5,a4
    800032b0:	00002d97          	auipc	s11,0x2
    800032b4:	fb0d8d93          	addi	s11,s11,-80 # 80005260 <digits>
    800032b8:	00f7f693          	andi	a3,a5,15
    800032bc:	00dd86b3          	add	a3,s11,a3
    800032c0:	0006c583          	lbu	a1,0(a3)
    800032c4:	ff100613          	li	a2,-15
    800032c8:	0047d69b          	srliw	a3,a5,0x4
    800032cc:	f8b40023          	sb	a1,-128(s0)
    800032d0:	0047d59b          	srliw	a1,a5,0x4
    800032d4:	0ac75e63          	bge	a4,a2,80003390 <__printf+0x668>
    800032d8:	00f6f693          	andi	a3,a3,15
    800032dc:	00dd86b3          	add	a3,s11,a3
    800032e0:	0006c603          	lbu	a2,0(a3)
    800032e4:	00f00693          	li	a3,15
    800032e8:	0087d79b          	srliw	a5,a5,0x8
    800032ec:	f8c400a3          	sb	a2,-127(s0)
    800032f0:	d8b6e4e3          	bltu	a3,a1,80003078 <__printf+0x350>
    800032f4:	00200793          	li	a5,2
    800032f8:	e2dff06f          	j	80003124 <__printf+0x3fc>
    800032fc:	00002c97          	auipc	s9,0x2
    80003300:	f44c8c93          	addi	s9,s9,-188 # 80005240 <_ZZ12printIntegermE6digits+0x148>
    80003304:	02800513          	li	a0,40
    80003308:	ef1ff06f          	j	800031f8 <__printf+0x4d0>
    8000330c:	00700793          	li	a5,7
    80003310:	00600c93          	li	s9,6
    80003314:	e0dff06f          	j	80003120 <__printf+0x3f8>
    80003318:	00700793          	li	a5,7
    8000331c:	00600c93          	li	s9,6
    80003320:	c69ff06f          	j	80002f88 <__printf+0x260>
    80003324:	00300793          	li	a5,3
    80003328:	00200c93          	li	s9,2
    8000332c:	c5dff06f          	j	80002f88 <__printf+0x260>
    80003330:	00300793          	li	a5,3
    80003334:	00200c93          	li	s9,2
    80003338:	de9ff06f          	j	80003120 <__printf+0x3f8>
    8000333c:	00400793          	li	a5,4
    80003340:	00300c93          	li	s9,3
    80003344:	dddff06f          	j	80003120 <__printf+0x3f8>
    80003348:	00400793          	li	a5,4
    8000334c:	00300c93          	li	s9,3
    80003350:	c39ff06f          	j	80002f88 <__printf+0x260>
    80003354:	00500793          	li	a5,5
    80003358:	00400c93          	li	s9,4
    8000335c:	c2dff06f          	j	80002f88 <__printf+0x260>
    80003360:	00500793          	li	a5,5
    80003364:	00400c93          	li	s9,4
    80003368:	db9ff06f          	j	80003120 <__printf+0x3f8>
    8000336c:	00600793          	li	a5,6
    80003370:	00500c93          	li	s9,5
    80003374:	dadff06f          	j	80003120 <__printf+0x3f8>
    80003378:	00600793          	li	a5,6
    8000337c:	00500c93          	li	s9,5
    80003380:	c09ff06f          	j	80002f88 <__printf+0x260>
    80003384:	00800793          	li	a5,8
    80003388:	00700c93          	li	s9,7
    8000338c:	bfdff06f          	j	80002f88 <__printf+0x260>
    80003390:	00100793          	li	a5,1
    80003394:	d91ff06f          	j	80003124 <__printf+0x3fc>
    80003398:	00100793          	li	a5,1
    8000339c:	bf1ff06f          	j	80002f8c <__printf+0x264>
    800033a0:	00900793          	li	a5,9
    800033a4:	00800c93          	li	s9,8
    800033a8:	be1ff06f          	j	80002f88 <__printf+0x260>
    800033ac:	00002517          	auipc	a0,0x2
    800033b0:	e9c50513          	addi	a0,a0,-356 # 80005248 <_ZZ12printIntegermE6digits+0x150>
    800033b4:	00000097          	auipc	ra,0x0
    800033b8:	918080e7          	jalr	-1768(ra) # 80002ccc <panic>

00000000800033bc <printfinit>:
    800033bc:	fe010113          	addi	sp,sp,-32
    800033c0:	00813823          	sd	s0,16(sp)
    800033c4:	00913423          	sd	s1,8(sp)
    800033c8:	00113c23          	sd	ra,24(sp)
    800033cc:	02010413          	addi	s0,sp,32
    800033d0:	00003497          	auipc	s1,0x3
    800033d4:	78048493          	addi	s1,s1,1920 # 80006b50 <pr>
    800033d8:	00048513          	mv	a0,s1
    800033dc:	00002597          	auipc	a1,0x2
    800033e0:	e7c58593          	addi	a1,a1,-388 # 80005258 <_ZZ12printIntegermE6digits+0x160>
    800033e4:	00000097          	auipc	ra,0x0
    800033e8:	5f4080e7          	jalr	1524(ra) # 800039d8 <initlock>
    800033ec:	01813083          	ld	ra,24(sp)
    800033f0:	01013403          	ld	s0,16(sp)
    800033f4:	0004ac23          	sw	zero,24(s1)
    800033f8:	00813483          	ld	s1,8(sp)
    800033fc:	02010113          	addi	sp,sp,32
    80003400:	00008067          	ret

0000000080003404 <uartinit>:
    80003404:	ff010113          	addi	sp,sp,-16
    80003408:	00813423          	sd	s0,8(sp)
    8000340c:	01010413          	addi	s0,sp,16
    80003410:	100007b7          	lui	a5,0x10000
    80003414:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003418:	f8000713          	li	a4,-128
    8000341c:	00e781a3          	sb	a4,3(a5)
    80003420:	00300713          	li	a4,3
    80003424:	00e78023          	sb	a4,0(a5)
    80003428:	000780a3          	sb	zero,1(a5)
    8000342c:	00e781a3          	sb	a4,3(a5)
    80003430:	00700693          	li	a3,7
    80003434:	00d78123          	sb	a3,2(a5)
    80003438:	00e780a3          	sb	a4,1(a5)
    8000343c:	00813403          	ld	s0,8(sp)
    80003440:	01010113          	addi	sp,sp,16
    80003444:	00008067          	ret

0000000080003448 <uartputc>:
    80003448:	00002797          	auipc	a5,0x2
    8000344c:	4907a783          	lw	a5,1168(a5) # 800058d8 <panicked>
    80003450:	00078463          	beqz	a5,80003458 <uartputc+0x10>
    80003454:	0000006f          	j	80003454 <uartputc+0xc>
    80003458:	fd010113          	addi	sp,sp,-48
    8000345c:	02813023          	sd	s0,32(sp)
    80003460:	00913c23          	sd	s1,24(sp)
    80003464:	01213823          	sd	s2,16(sp)
    80003468:	01313423          	sd	s3,8(sp)
    8000346c:	02113423          	sd	ra,40(sp)
    80003470:	03010413          	addi	s0,sp,48
    80003474:	00002917          	auipc	s2,0x2
    80003478:	46c90913          	addi	s2,s2,1132 # 800058e0 <uart_tx_r>
    8000347c:	00093783          	ld	a5,0(s2)
    80003480:	00002497          	auipc	s1,0x2
    80003484:	46848493          	addi	s1,s1,1128 # 800058e8 <uart_tx_w>
    80003488:	0004b703          	ld	a4,0(s1)
    8000348c:	02078693          	addi	a3,a5,32
    80003490:	00050993          	mv	s3,a0
    80003494:	02e69c63          	bne	a3,a4,800034cc <uartputc+0x84>
    80003498:	00001097          	auipc	ra,0x1
    8000349c:	834080e7          	jalr	-1996(ra) # 80003ccc <push_on>
    800034a0:	00093783          	ld	a5,0(s2)
    800034a4:	0004b703          	ld	a4,0(s1)
    800034a8:	02078793          	addi	a5,a5,32
    800034ac:	00e79463          	bne	a5,a4,800034b4 <uartputc+0x6c>
    800034b0:	0000006f          	j	800034b0 <uartputc+0x68>
    800034b4:	00001097          	auipc	ra,0x1
    800034b8:	88c080e7          	jalr	-1908(ra) # 80003d40 <pop_on>
    800034bc:	00093783          	ld	a5,0(s2)
    800034c0:	0004b703          	ld	a4,0(s1)
    800034c4:	02078693          	addi	a3,a5,32
    800034c8:	fce688e3          	beq	a3,a4,80003498 <uartputc+0x50>
    800034cc:	01f77693          	andi	a3,a4,31
    800034d0:	00003597          	auipc	a1,0x3
    800034d4:	6a058593          	addi	a1,a1,1696 # 80006b70 <uart_tx_buf>
    800034d8:	00d586b3          	add	a3,a1,a3
    800034dc:	00170713          	addi	a4,a4,1
    800034e0:	01368023          	sb	s3,0(a3)
    800034e4:	00e4b023          	sd	a4,0(s1)
    800034e8:	10000637          	lui	a2,0x10000
    800034ec:	02f71063          	bne	a4,a5,8000350c <uartputc+0xc4>
    800034f0:	0340006f          	j	80003524 <uartputc+0xdc>
    800034f4:	00074703          	lbu	a4,0(a4)
    800034f8:	00f93023          	sd	a5,0(s2)
    800034fc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003500:	00093783          	ld	a5,0(s2)
    80003504:	0004b703          	ld	a4,0(s1)
    80003508:	00f70e63          	beq	a4,a5,80003524 <uartputc+0xdc>
    8000350c:	00564683          	lbu	a3,5(a2)
    80003510:	01f7f713          	andi	a4,a5,31
    80003514:	00e58733          	add	a4,a1,a4
    80003518:	0206f693          	andi	a3,a3,32
    8000351c:	00178793          	addi	a5,a5,1
    80003520:	fc069ae3          	bnez	a3,800034f4 <uartputc+0xac>
    80003524:	02813083          	ld	ra,40(sp)
    80003528:	02013403          	ld	s0,32(sp)
    8000352c:	01813483          	ld	s1,24(sp)
    80003530:	01013903          	ld	s2,16(sp)
    80003534:	00813983          	ld	s3,8(sp)
    80003538:	03010113          	addi	sp,sp,48
    8000353c:	00008067          	ret

0000000080003540 <uartputc_sync>:
    80003540:	ff010113          	addi	sp,sp,-16
    80003544:	00813423          	sd	s0,8(sp)
    80003548:	01010413          	addi	s0,sp,16
    8000354c:	00002717          	auipc	a4,0x2
    80003550:	38c72703          	lw	a4,908(a4) # 800058d8 <panicked>
    80003554:	02071663          	bnez	a4,80003580 <uartputc_sync+0x40>
    80003558:	00050793          	mv	a5,a0
    8000355c:	100006b7          	lui	a3,0x10000
    80003560:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003564:	02077713          	andi	a4,a4,32
    80003568:	fe070ce3          	beqz	a4,80003560 <uartputc_sync+0x20>
    8000356c:	0ff7f793          	andi	a5,a5,255
    80003570:	00f68023          	sb	a5,0(a3)
    80003574:	00813403          	ld	s0,8(sp)
    80003578:	01010113          	addi	sp,sp,16
    8000357c:	00008067          	ret
    80003580:	0000006f          	j	80003580 <uartputc_sync+0x40>

0000000080003584 <uartstart>:
    80003584:	ff010113          	addi	sp,sp,-16
    80003588:	00813423          	sd	s0,8(sp)
    8000358c:	01010413          	addi	s0,sp,16
    80003590:	00002617          	auipc	a2,0x2
    80003594:	35060613          	addi	a2,a2,848 # 800058e0 <uart_tx_r>
    80003598:	00002517          	auipc	a0,0x2
    8000359c:	35050513          	addi	a0,a0,848 # 800058e8 <uart_tx_w>
    800035a0:	00063783          	ld	a5,0(a2)
    800035a4:	00053703          	ld	a4,0(a0)
    800035a8:	04f70263          	beq	a4,a5,800035ec <uartstart+0x68>
    800035ac:	100005b7          	lui	a1,0x10000
    800035b0:	00003817          	auipc	a6,0x3
    800035b4:	5c080813          	addi	a6,a6,1472 # 80006b70 <uart_tx_buf>
    800035b8:	01c0006f          	j	800035d4 <uartstart+0x50>
    800035bc:	0006c703          	lbu	a4,0(a3)
    800035c0:	00f63023          	sd	a5,0(a2)
    800035c4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800035c8:	00063783          	ld	a5,0(a2)
    800035cc:	00053703          	ld	a4,0(a0)
    800035d0:	00f70e63          	beq	a4,a5,800035ec <uartstart+0x68>
    800035d4:	01f7f713          	andi	a4,a5,31
    800035d8:	00e806b3          	add	a3,a6,a4
    800035dc:	0055c703          	lbu	a4,5(a1)
    800035e0:	00178793          	addi	a5,a5,1
    800035e4:	02077713          	andi	a4,a4,32
    800035e8:	fc071ae3          	bnez	a4,800035bc <uartstart+0x38>
    800035ec:	00813403          	ld	s0,8(sp)
    800035f0:	01010113          	addi	sp,sp,16
    800035f4:	00008067          	ret

00000000800035f8 <uartgetc>:
    800035f8:	ff010113          	addi	sp,sp,-16
    800035fc:	00813423          	sd	s0,8(sp)
    80003600:	01010413          	addi	s0,sp,16
    80003604:	10000737          	lui	a4,0x10000
    80003608:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000360c:	0017f793          	andi	a5,a5,1
    80003610:	00078c63          	beqz	a5,80003628 <uartgetc+0x30>
    80003614:	00074503          	lbu	a0,0(a4)
    80003618:	0ff57513          	andi	a0,a0,255
    8000361c:	00813403          	ld	s0,8(sp)
    80003620:	01010113          	addi	sp,sp,16
    80003624:	00008067          	ret
    80003628:	fff00513          	li	a0,-1
    8000362c:	ff1ff06f          	j	8000361c <uartgetc+0x24>

0000000080003630 <uartintr>:
    80003630:	100007b7          	lui	a5,0x10000
    80003634:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003638:	0017f793          	andi	a5,a5,1
    8000363c:	0a078463          	beqz	a5,800036e4 <uartintr+0xb4>
    80003640:	fe010113          	addi	sp,sp,-32
    80003644:	00813823          	sd	s0,16(sp)
    80003648:	00913423          	sd	s1,8(sp)
    8000364c:	00113c23          	sd	ra,24(sp)
    80003650:	02010413          	addi	s0,sp,32
    80003654:	100004b7          	lui	s1,0x10000
    80003658:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000365c:	0ff57513          	andi	a0,a0,255
    80003660:	fffff097          	auipc	ra,0xfffff
    80003664:	534080e7          	jalr	1332(ra) # 80002b94 <consoleintr>
    80003668:	0054c783          	lbu	a5,5(s1)
    8000366c:	0017f793          	andi	a5,a5,1
    80003670:	fe0794e3          	bnez	a5,80003658 <uartintr+0x28>
    80003674:	00002617          	auipc	a2,0x2
    80003678:	26c60613          	addi	a2,a2,620 # 800058e0 <uart_tx_r>
    8000367c:	00002517          	auipc	a0,0x2
    80003680:	26c50513          	addi	a0,a0,620 # 800058e8 <uart_tx_w>
    80003684:	00063783          	ld	a5,0(a2)
    80003688:	00053703          	ld	a4,0(a0)
    8000368c:	04f70263          	beq	a4,a5,800036d0 <uartintr+0xa0>
    80003690:	100005b7          	lui	a1,0x10000
    80003694:	00003817          	auipc	a6,0x3
    80003698:	4dc80813          	addi	a6,a6,1244 # 80006b70 <uart_tx_buf>
    8000369c:	01c0006f          	j	800036b8 <uartintr+0x88>
    800036a0:	0006c703          	lbu	a4,0(a3)
    800036a4:	00f63023          	sd	a5,0(a2)
    800036a8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800036ac:	00063783          	ld	a5,0(a2)
    800036b0:	00053703          	ld	a4,0(a0)
    800036b4:	00f70e63          	beq	a4,a5,800036d0 <uartintr+0xa0>
    800036b8:	01f7f713          	andi	a4,a5,31
    800036bc:	00e806b3          	add	a3,a6,a4
    800036c0:	0055c703          	lbu	a4,5(a1)
    800036c4:	00178793          	addi	a5,a5,1
    800036c8:	02077713          	andi	a4,a4,32
    800036cc:	fc071ae3          	bnez	a4,800036a0 <uartintr+0x70>
    800036d0:	01813083          	ld	ra,24(sp)
    800036d4:	01013403          	ld	s0,16(sp)
    800036d8:	00813483          	ld	s1,8(sp)
    800036dc:	02010113          	addi	sp,sp,32
    800036e0:	00008067          	ret
    800036e4:	00002617          	auipc	a2,0x2
    800036e8:	1fc60613          	addi	a2,a2,508 # 800058e0 <uart_tx_r>
    800036ec:	00002517          	auipc	a0,0x2
    800036f0:	1fc50513          	addi	a0,a0,508 # 800058e8 <uart_tx_w>
    800036f4:	00063783          	ld	a5,0(a2)
    800036f8:	00053703          	ld	a4,0(a0)
    800036fc:	04f70263          	beq	a4,a5,80003740 <uartintr+0x110>
    80003700:	100005b7          	lui	a1,0x10000
    80003704:	00003817          	auipc	a6,0x3
    80003708:	46c80813          	addi	a6,a6,1132 # 80006b70 <uart_tx_buf>
    8000370c:	01c0006f          	j	80003728 <uartintr+0xf8>
    80003710:	0006c703          	lbu	a4,0(a3)
    80003714:	00f63023          	sd	a5,0(a2)
    80003718:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000371c:	00063783          	ld	a5,0(a2)
    80003720:	00053703          	ld	a4,0(a0)
    80003724:	02f70063          	beq	a4,a5,80003744 <uartintr+0x114>
    80003728:	01f7f713          	andi	a4,a5,31
    8000372c:	00e806b3          	add	a3,a6,a4
    80003730:	0055c703          	lbu	a4,5(a1)
    80003734:	00178793          	addi	a5,a5,1
    80003738:	02077713          	andi	a4,a4,32
    8000373c:	fc071ae3          	bnez	a4,80003710 <uartintr+0xe0>
    80003740:	00008067          	ret
    80003744:	00008067          	ret

0000000080003748 <kinit>:
    80003748:	fc010113          	addi	sp,sp,-64
    8000374c:	02913423          	sd	s1,40(sp)
    80003750:	fffff7b7          	lui	a5,0xfffff
    80003754:	00004497          	auipc	s1,0x4
    80003758:	43b48493          	addi	s1,s1,1083 # 80007b8f <end+0xfff>
    8000375c:	02813823          	sd	s0,48(sp)
    80003760:	01313c23          	sd	s3,24(sp)
    80003764:	00f4f4b3          	and	s1,s1,a5
    80003768:	02113c23          	sd	ra,56(sp)
    8000376c:	03213023          	sd	s2,32(sp)
    80003770:	01413823          	sd	s4,16(sp)
    80003774:	01513423          	sd	s5,8(sp)
    80003778:	04010413          	addi	s0,sp,64
    8000377c:	000017b7          	lui	a5,0x1
    80003780:	01100993          	li	s3,17
    80003784:	00f487b3          	add	a5,s1,a5
    80003788:	01b99993          	slli	s3,s3,0x1b
    8000378c:	06f9e063          	bltu	s3,a5,800037ec <kinit+0xa4>
    80003790:	00003a97          	auipc	s5,0x3
    80003794:	400a8a93          	addi	s5,s5,1024 # 80006b90 <end>
    80003798:	0754ec63          	bltu	s1,s5,80003810 <kinit+0xc8>
    8000379c:	0734fa63          	bgeu	s1,s3,80003810 <kinit+0xc8>
    800037a0:	00088a37          	lui	s4,0x88
    800037a4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800037a8:	00002917          	auipc	s2,0x2
    800037ac:	14890913          	addi	s2,s2,328 # 800058f0 <kmem>
    800037b0:	00ca1a13          	slli	s4,s4,0xc
    800037b4:	0140006f          	j	800037c8 <kinit+0x80>
    800037b8:	000017b7          	lui	a5,0x1
    800037bc:	00f484b3          	add	s1,s1,a5
    800037c0:	0554e863          	bltu	s1,s5,80003810 <kinit+0xc8>
    800037c4:	0534f663          	bgeu	s1,s3,80003810 <kinit+0xc8>
    800037c8:	00001637          	lui	a2,0x1
    800037cc:	00100593          	li	a1,1
    800037d0:	00048513          	mv	a0,s1
    800037d4:	00000097          	auipc	ra,0x0
    800037d8:	5e4080e7          	jalr	1508(ra) # 80003db8 <__memset>
    800037dc:	00093783          	ld	a5,0(s2)
    800037e0:	00f4b023          	sd	a5,0(s1)
    800037e4:	00993023          	sd	s1,0(s2)
    800037e8:	fd4498e3          	bne	s1,s4,800037b8 <kinit+0x70>
    800037ec:	03813083          	ld	ra,56(sp)
    800037f0:	03013403          	ld	s0,48(sp)
    800037f4:	02813483          	ld	s1,40(sp)
    800037f8:	02013903          	ld	s2,32(sp)
    800037fc:	01813983          	ld	s3,24(sp)
    80003800:	01013a03          	ld	s4,16(sp)
    80003804:	00813a83          	ld	s5,8(sp)
    80003808:	04010113          	addi	sp,sp,64
    8000380c:	00008067          	ret
    80003810:	00002517          	auipc	a0,0x2
    80003814:	a6850513          	addi	a0,a0,-1432 # 80005278 <digits+0x18>
    80003818:	fffff097          	auipc	ra,0xfffff
    8000381c:	4b4080e7          	jalr	1204(ra) # 80002ccc <panic>

0000000080003820 <freerange>:
    80003820:	fc010113          	addi	sp,sp,-64
    80003824:	000017b7          	lui	a5,0x1
    80003828:	02913423          	sd	s1,40(sp)
    8000382c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003830:	009504b3          	add	s1,a0,s1
    80003834:	fffff537          	lui	a0,0xfffff
    80003838:	02813823          	sd	s0,48(sp)
    8000383c:	02113c23          	sd	ra,56(sp)
    80003840:	03213023          	sd	s2,32(sp)
    80003844:	01313c23          	sd	s3,24(sp)
    80003848:	01413823          	sd	s4,16(sp)
    8000384c:	01513423          	sd	s5,8(sp)
    80003850:	01613023          	sd	s6,0(sp)
    80003854:	04010413          	addi	s0,sp,64
    80003858:	00a4f4b3          	and	s1,s1,a0
    8000385c:	00f487b3          	add	a5,s1,a5
    80003860:	06f5e463          	bltu	a1,a5,800038c8 <freerange+0xa8>
    80003864:	00003a97          	auipc	s5,0x3
    80003868:	32ca8a93          	addi	s5,s5,812 # 80006b90 <end>
    8000386c:	0954e263          	bltu	s1,s5,800038f0 <freerange+0xd0>
    80003870:	01100993          	li	s3,17
    80003874:	01b99993          	slli	s3,s3,0x1b
    80003878:	0734fc63          	bgeu	s1,s3,800038f0 <freerange+0xd0>
    8000387c:	00058a13          	mv	s4,a1
    80003880:	00002917          	auipc	s2,0x2
    80003884:	07090913          	addi	s2,s2,112 # 800058f0 <kmem>
    80003888:	00002b37          	lui	s6,0x2
    8000388c:	0140006f          	j	800038a0 <freerange+0x80>
    80003890:	000017b7          	lui	a5,0x1
    80003894:	00f484b3          	add	s1,s1,a5
    80003898:	0554ec63          	bltu	s1,s5,800038f0 <freerange+0xd0>
    8000389c:	0534fa63          	bgeu	s1,s3,800038f0 <freerange+0xd0>
    800038a0:	00001637          	lui	a2,0x1
    800038a4:	00100593          	li	a1,1
    800038a8:	00048513          	mv	a0,s1
    800038ac:	00000097          	auipc	ra,0x0
    800038b0:	50c080e7          	jalr	1292(ra) # 80003db8 <__memset>
    800038b4:	00093703          	ld	a4,0(s2)
    800038b8:	016487b3          	add	a5,s1,s6
    800038bc:	00e4b023          	sd	a4,0(s1)
    800038c0:	00993023          	sd	s1,0(s2)
    800038c4:	fcfa76e3          	bgeu	s4,a5,80003890 <freerange+0x70>
    800038c8:	03813083          	ld	ra,56(sp)
    800038cc:	03013403          	ld	s0,48(sp)
    800038d0:	02813483          	ld	s1,40(sp)
    800038d4:	02013903          	ld	s2,32(sp)
    800038d8:	01813983          	ld	s3,24(sp)
    800038dc:	01013a03          	ld	s4,16(sp)
    800038e0:	00813a83          	ld	s5,8(sp)
    800038e4:	00013b03          	ld	s6,0(sp)
    800038e8:	04010113          	addi	sp,sp,64
    800038ec:	00008067          	ret
    800038f0:	00002517          	auipc	a0,0x2
    800038f4:	98850513          	addi	a0,a0,-1656 # 80005278 <digits+0x18>
    800038f8:	fffff097          	auipc	ra,0xfffff
    800038fc:	3d4080e7          	jalr	980(ra) # 80002ccc <panic>

0000000080003900 <kfree>:
    80003900:	fe010113          	addi	sp,sp,-32
    80003904:	00813823          	sd	s0,16(sp)
    80003908:	00113c23          	sd	ra,24(sp)
    8000390c:	00913423          	sd	s1,8(sp)
    80003910:	02010413          	addi	s0,sp,32
    80003914:	03451793          	slli	a5,a0,0x34
    80003918:	04079c63          	bnez	a5,80003970 <kfree+0x70>
    8000391c:	00003797          	auipc	a5,0x3
    80003920:	27478793          	addi	a5,a5,628 # 80006b90 <end>
    80003924:	00050493          	mv	s1,a0
    80003928:	04f56463          	bltu	a0,a5,80003970 <kfree+0x70>
    8000392c:	01100793          	li	a5,17
    80003930:	01b79793          	slli	a5,a5,0x1b
    80003934:	02f57e63          	bgeu	a0,a5,80003970 <kfree+0x70>
    80003938:	00001637          	lui	a2,0x1
    8000393c:	00100593          	li	a1,1
    80003940:	00000097          	auipc	ra,0x0
    80003944:	478080e7          	jalr	1144(ra) # 80003db8 <__memset>
    80003948:	00002797          	auipc	a5,0x2
    8000394c:	fa878793          	addi	a5,a5,-88 # 800058f0 <kmem>
    80003950:	0007b703          	ld	a4,0(a5)
    80003954:	01813083          	ld	ra,24(sp)
    80003958:	01013403          	ld	s0,16(sp)
    8000395c:	00e4b023          	sd	a4,0(s1)
    80003960:	0097b023          	sd	s1,0(a5)
    80003964:	00813483          	ld	s1,8(sp)
    80003968:	02010113          	addi	sp,sp,32
    8000396c:	00008067          	ret
    80003970:	00002517          	auipc	a0,0x2
    80003974:	90850513          	addi	a0,a0,-1784 # 80005278 <digits+0x18>
    80003978:	fffff097          	auipc	ra,0xfffff
    8000397c:	354080e7          	jalr	852(ra) # 80002ccc <panic>

0000000080003980 <kalloc>:
    80003980:	fe010113          	addi	sp,sp,-32
    80003984:	00813823          	sd	s0,16(sp)
    80003988:	00913423          	sd	s1,8(sp)
    8000398c:	00113c23          	sd	ra,24(sp)
    80003990:	02010413          	addi	s0,sp,32
    80003994:	00002797          	auipc	a5,0x2
    80003998:	f5c78793          	addi	a5,a5,-164 # 800058f0 <kmem>
    8000399c:	0007b483          	ld	s1,0(a5)
    800039a0:	02048063          	beqz	s1,800039c0 <kalloc+0x40>
    800039a4:	0004b703          	ld	a4,0(s1)
    800039a8:	00001637          	lui	a2,0x1
    800039ac:	00500593          	li	a1,5
    800039b0:	00048513          	mv	a0,s1
    800039b4:	00e7b023          	sd	a4,0(a5)
    800039b8:	00000097          	auipc	ra,0x0
    800039bc:	400080e7          	jalr	1024(ra) # 80003db8 <__memset>
    800039c0:	01813083          	ld	ra,24(sp)
    800039c4:	01013403          	ld	s0,16(sp)
    800039c8:	00048513          	mv	a0,s1
    800039cc:	00813483          	ld	s1,8(sp)
    800039d0:	02010113          	addi	sp,sp,32
    800039d4:	00008067          	ret

00000000800039d8 <initlock>:
    800039d8:	ff010113          	addi	sp,sp,-16
    800039dc:	00813423          	sd	s0,8(sp)
    800039e0:	01010413          	addi	s0,sp,16
    800039e4:	00813403          	ld	s0,8(sp)
    800039e8:	00b53423          	sd	a1,8(a0)
    800039ec:	00052023          	sw	zero,0(a0)
    800039f0:	00053823          	sd	zero,16(a0)
    800039f4:	01010113          	addi	sp,sp,16
    800039f8:	00008067          	ret

00000000800039fc <acquire>:
    800039fc:	fe010113          	addi	sp,sp,-32
    80003a00:	00813823          	sd	s0,16(sp)
    80003a04:	00913423          	sd	s1,8(sp)
    80003a08:	00113c23          	sd	ra,24(sp)
    80003a0c:	01213023          	sd	s2,0(sp)
    80003a10:	02010413          	addi	s0,sp,32
    80003a14:	00050493          	mv	s1,a0
    80003a18:	10002973          	csrr	s2,sstatus
    80003a1c:	100027f3          	csrr	a5,sstatus
    80003a20:	ffd7f793          	andi	a5,a5,-3
    80003a24:	10079073          	csrw	sstatus,a5
    80003a28:	fffff097          	auipc	ra,0xfffff
    80003a2c:	8e0080e7          	jalr	-1824(ra) # 80002308 <mycpu>
    80003a30:	07852783          	lw	a5,120(a0)
    80003a34:	06078e63          	beqz	a5,80003ab0 <acquire+0xb4>
    80003a38:	fffff097          	auipc	ra,0xfffff
    80003a3c:	8d0080e7          	jalr	-1840(ra) # 80002308 <mycpu>
    80003a40:	07852783          	lw	a5,120(a0)
    80003a44:	0004a703          	lw	a4,0(s1)
    80003a48:	0017879b          	addiw	a5,a5,1
    80003a4c:	06f52c23          	sw	a5,120(a0)
    80003a50:	04071063          	bnez	a4,80003a90 <acquire+0x94>
    80003a54:	00100713          	li	a4,1
    80003a58:	00070793          	mv	a5,a4
    80003a5c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003a60:	0007879b          	sext.w	a5,a5
    80003a64:	fe079ae3          	bnez	a5,80003a58 <acquire+0x5c>
    80003a68:	0ff0000f          	fence
    80003a6c:	fffff097          	auipc	ra,0xfffff
    80003a70:	89c080e7          	jalr	-1892(ra) # 80002308 <mycpu>
    80003a74:	01813083          	ld	ra,24(sp)
    80003a78:	01013403          	ld	s0,16(sp)
    80003a7c:	00a4b823          	sd	a0,16(s1)
    80003a80:	00013903          	ld	s2,0(sp)
    80003a84:	00813483          	ld	s1,8(sp)
    80003a88:	02010113          	addi	sp,sp,32
    80003a8c:	00008067          	ret
    80003a90:	0104b903          	ld	s2,16(s1)
    80003a94:	fffff097          	auipc	ra,0xfffff
    80003a98:	874080e7          	jalr	-1932(ra) # 80002308 <mycpu>
    80003a9c:	faa91ce3          	bne	s2,a0,80003a54 <acquire+0x58>
    80003aa0:	00001517          	auipc	a0,0x1
    80003aa4:	7e050513          	addi	a0,a0,2016 # 80005280 <digits+0x20>
    80003aa8:	fffff097          	auipc	ra,0xfffff
    80003aac:	224080e7          	jalr	548(ra) # 80002ccc <panic>
    80003ab0:	00195913          	srli	s2,s2,0x1
    80003ab4:	fffff097          	auipc	ra,0xfffff
    80003ab8:	854080e7          	jalr	-1964(ra) # 80002308 <mycpu>
    80003abc:	00197913          	andi	s2,s2,1
    80003ac0:	07252e23          	sw	s2,124(a0)
    80003ac4:	f75ff06f          	j	80003a38 <acquire+0x3c>

0000000080003ac8 <release>:
    80003ac8:	fe010113          	addi	sp,sp,-32
    80003acc:	00813823          	sd	s0,16(sp)
    80003ad0:	00113c23          	sd	ra,24(sp)
    80003ad4:	00913423          	sd	s1,8(sp)
    80003ad8:	01213023          	sd	s2,0(sp)
    80003adc:	02010413          	addi	s0,sp,32
    80003ae0:	00052783          	lw	a5,0(a0)
    80003ae4:	00079a63          	bnez	a5,80003af8 <release+0x30>
    80003ae8:	00001517          	auipc	a0,0x1
    80003aec:	7a050513          	addi	a0,a0,1952 # 80005288 <digits+0x28>
    80003af0:	fffff097          	auipc	ra,0xfffff
    80003af4:	1dc080e7          	jalr	476(ra) # 80002ccc <panic>
    80003af8:	01053903          	ld	s2,16(a0)
    80003afc:	00050493          	mv	s1,a0
    80003b00:	fffff097          	auipc	ra,0xfffff
    80003b04:	808080e7          	jalr	-2040(ra) # 80002308 <mycpu>
    80003b08:	fea910e3          	bne	s2,a0,80003ae8 <release+0x20>
    80003b0c:	0004b823          	sd	zero,16(s1)
    80003b10:	0ff0000f          	fence
    80003b14:	0f50000f          	fence	iorw,ow
    80003b18:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003b1c:	ffffe097          	auipc	ra,0xffffe
    80003b20:	7ec080e7          	jalr	2028(ra) # 80002308 <mycpu>
    80003b24:	100027f3          	csrr	a5,sstatus
    80003b28:	0027f793          	andi	a5,a5,2
    80003b2c:	04079a63          	bnez	a5,80003b80 <release+0xb8>
    80003b30:	07852783          	lw	a5,120(a0)
    80003b34:	02f05e63          	blez	a5,80003b70 <release+0xa8>
    80003b38:	fff7871b          	addiw	a4,a5,-1
    80003b3c:	06e52c23          	sw	a4,120(a0)
    80003b40:	00071c63          	bnez	a4,80003b58 <release+0x90>
    80003b44:	07c52783          	lw	a5,124(a0)
    80003b48:	00078863          	beqz	a5,80003b58 <release+0x90>
    80003b4c:	100027f3          	csrr	a5,sstatus
    80003b50:	0027e793          	ori	a5,a5,2
    80003b54:	10079073          	csrw	sstatus,a5
    80003b58:	01813083          	ld	ra,24(sp)
    80003b5c:	01013403          	ld	s0,16(sp)
    80003b60:	00813483          	ld	s1,8(sp)
    80003b64:	00013903          	ld	s2,0(sp)
    80003b68:	02010113          	addi	sp,sp,32
    80003b6c:	00008067          	ret
    80003b70:	00001517          	auipc	a0,0x1
    80003b74:	73850513          	addi	a0,a0,1848 # 800052a8 <digits+0x48>
    80003b78:	fffff097          	auipc	ra,0xfffff
    80003b7c:	154080e7          	jalr	340(ra) # 80002ccc <panic>
    80003b80:	00001517          	auipc	a0,0x1
    80003b84:	71050513          	addi	a0,a0,1808 # 80005290 <digits+0x30>
    80003b88:	fffff097          	auipc	ra,0xfffff
    80003b8c:	144080e7          	jalr	324(ra) # 80002ccc <panic>

0000000080003b90 <holding>:
    80003b90:	00052783          	lw	a5,0(a0)
    80003b94:	00079663          	bnez	a5,80003ba0 <holding+0x10>
    80003b98:	00000513          	li	a0,0
    80003b9c:	00008067          	ret
    80003ba0:	fe010113          	addi	sp,sp,-32
    80003ba4:	00813823          	sd	s0,16(sp)
    80003ba8:	00913423          	sd	s1,8(sp)
    80003bac:	00113c23          	sd	ra,24(sp)
    80003bb0:	02010413          	addi	s0,sp,32
    80003bb4:	01053483          	ld	s1,16(a0)
    80003bb8:	ffffe097          	auipc	ra,0xffffe
    80003bbc:	750080e7          	jalr	1872(ra) # 80002308 <mycpu>
    80003bc0:	01813083          	ld	ra,24(sp)
    80003bc4:	01013403          	ld	s0,16(sp)
    80003bc8:	40a48533          	sub	a0,s1,a0
    80003bcc:	00153513          	seqz	a0,a0
    80003bd0:	00813483          	ld	s1,8(sp)
    80003bd4:	02010113          	addi	sp,sp,32
    80003bd8:	00008067          	ret

0000000080003bdc <push_off>:
    80003bdc:	fe010113          	addi	sp,sp,-32
    80003be0:	00813823          	sd	s0,16(sp)
    80003be4:	00113c23          	sd	ra,24(sp)
    80003be8:	00913423          	sd	s1,8(sp)
    80003bec:	02010413          	addi	s0,sp,32
    80003bf0:	100024f3          	csrr	s1,sstatus
    80003bf4:	100027f3          	csrr	a5,sstatus
    80003bf8:	ffd7f793          	andi	a5,a5,-3
    80003bfc:	10079073          	csrw	sstatus,a5
    80003c00:	ffffe097          	auipc	ra,0xffffe
    80003c04:	708080e7          	jalr	1800(ra) # 80002308 <mycpu>
    80003c08:	07852783          	lw	a5,120(a0)
    80003c0c:	02078663          	beqz	a5,80003c38 <push_off+0x5c>
    80003c10:	ffffe097          	auipc	ra,0xffffe
    80003c14:	6f8080e7          	jalr	1784(ra) # 80002308 <mycpu>
    80003c18:	07852783          	lw	a5,120(a0)
    80003c1c:	01813083          	ld	ra,24(sp)
    80003c20:	01013403          	ld	s0,16(sp)
    80003c24:	0017879b          	addiw	a5,a5,1
    80003c28:	06f52c23          	sw	a5,120(a0)
    80003c2c:	00813483          	ld	s1,8(sp)
    80003c30:	02010113          	addi	sp,sp,32
    80003c34:	00008067          	ret
    80003c38:	0014d493          	srli	s1,s1,0x1
    80003c3c:	ffffe097          	auipc	ra,0xffffe
    80003c40:	6cc080e7          	jalr	1740(ra) # 80002308 <mycpu>
    80003c44:	0014f493          	andi	s1,s1,1
    80003c48:	06952e23          	sw	s1,124(a0)
    80003c4c:	fc5ff06f          	j	80003c10 <push_off+0x34>

0000000080003c50 <pop_off>:
    80003c50:	ff010113          	addi	sp,sp,-16
    80003c54:	00813023          	sd	s0,0(sp)
    80003c58:	00113423          	sd	ra,8(sp)
    80003c5c:	01010413          	addi	s0,sp,16
    80003c60:	ffffe097          	auipc	ra,0xffffe
    80003c64:	6a8080e7          	jalr	1704(ra) # 80002308 <mycpu>
    80003c68:	100027f3          	csrr	a5,sstatus
    80003c6c:	0027f793          	andi	a5,a5,2
    80003c70:	04079663          	bnez	a5,80003cbc <pop_off+0x6c>
    80003c74:	07852783          	lw	a5,120(a0)
    80003c78:	02f05a63          	blez	a5,80003cac <pop_off+0x5c>
    80003c7c:	fff7871b          	addiw	a4,a5,-1
    80003c80:	06e52c23          	sw	a4,120(a0)
    80003c84:	00071c63          	bnez	a4,80003c9c <pop_off+0x4c>
    80003c88:	07c52783          	lw	a5,124(a0)
    80003c8c:	00078863          	beqz	a5,80003c9c <pop_off+0x4c>
    80003c90:	100027f3          	csrr	a5,sstatus
    80003c94:	0027e793          	ori	a5,a5,2
    80003c98:	10079073          	csrw	sstatus,a5
    80003c9c:	00813083          	ld	ra,8(sp)
    80003ca0:	00013403          	ld	s0,0(sp)
    80003ca4:	01010113          	addi	sp,sp,16
    80003ca8:	00008067          	ret
    80003cac:	00001517          	auipc	a0,0x1
    80003cb0:	5fc50513          	addi	a0,a0,1532 # 800052a8 <digits+0x48>
    80003cb4:	fffff097          	auipc	ra,0xfffff
    80003cb8:	018080e7          	jalr	24(ra) # 80002ccc <panic>
    80003cbc:	00001517          	auipc	a0,0x1
    80003cc0:	5d450513          	addi	a0,a0,1492 # 80005290 <digits+0x30>
    80003cc4:	fffff097          	auipc	ra,0xfffff
    80003cc8:	008080e7          	jalr	8(ra) # 80002ccc <panic>

0000000080003ccc <push_on>:
    80003ccc:	fe010113          	addi	sp,sp,-32
    80003cd0:	00813823          	sd	s0,16(sp)
    80003cd4:	00113c23          	sd	ra,24(sp)
    80003cd8:	00913423          	sd	s1,8(sp)
    80003cdc:	02010413          	addi	s0,sp,32
    80003ce0:	100024f3          	csrr	s1,sstatus
    80003ce4:	100027f3          	csrr	a5,sstatus
    80003ce8:	0027e793          	ori	a5,a5,2
    80003cec:	10079073          	csrw	sstatus,a5
    80003cf0:	ffffe097          	auipc	ra,0xffffe
    80003cf4:	618080e7          	jalr	1560(ra) # 80002308 <mycpu>
    80003cf8:	07852783          	lw	a5,120(a0)
    80003cfc:	02078663          	beqz	a5,80003d28 <push_on+0x5c>
    80003d00:	ffffe097          	auipc	ra,0xffffe
    80003d04:	608080e7          	jalr	1544(ra) # 80002308 <mycpu>
    80003d08:	07852783          	lw	a5,120(a0)
    80003d0c:	01813083          	ld	ra,24(sp)
    80003d10:	01013403          	ld	s0,16(sp)
    80003d14:	0017879b          	addiw	a5,a5,1
    80003d18:	06f52c23          	sw	a5,120(a0)
    80003d1c:	00813483          	ld	s1,8(sp)
    80003d20:	02010113          	addi	sp,sp,32
    80003d24:	00008067          	ret
    80003d28:	0014d493          	srli	s1,s1,0x1
    80003d2c:	ffffe097          	auipc	ra,0xffffe
    80003d30:	5dc080e7          	jalr	1500(ra) # 80002308 <mycpu>
    80003d34:	0014f493          	andi	s1,s1,1
    80003d38:	06952e23          	sw	s1,124(a0)
    80003d3c:	fc5ff06f          	j	80003d00 <push_on+0x34>

0000000080003d40 <pop_on>:
    80003d40:	ff010113          	addi	sp,sp,-16
    80003d44:	00813023          	sd	s0,0(sp)
    80003d48:	00113423          	sd	ra,8(sp)
    80003d4c:	01010413          	addi	s0,sp,16
    80003d50:	ffffe097          	auipc	ra,0xffffe
    80003d54:	5b8080e7          	jalr	1464(ra) # 80002308 <mycpu>
    80003d58:	100027f3          	csrr	a5,sstatus
    80003d5c:	0027f793          	andi	a5,a5,2
    80003d60:	04078463          	beqz	a5,80003da8 <pop_on+0x68>
    80003d64:	07852783          	lw	a5,120(a0)
    80003d68:	02f05863          	blez	a5,80003d98 <pop_on+0x58>
    80003d6c:	fff7879b          	addiw	a5,a5,-1
    80003d70:	06f52c23          	sw	a5,120(a0)
    80003d74:	07853783          	ld	a5,120(a0)
    80003d78:	00079863          	bnez	a5,80003d88 <pop_on+0x48>
    80003d7c:	100027f3          	csrr	a5,sstatus
    80003d80:	ffd7f793          	andi	a5,a5,-3
    80003d84:	10079073          	csrw	sstatus,a5
    80003d88:	00813083          	ld	ra,8(sp)
    80003d8c:	00013403          	ld	s0,0(sp)
    80003d90:	01010113          	addi	sp,sp,16
    80003d94:	00008067          	ret
    80003d98:	00001517          	auipc	a0,0x1
    80003d9c:	53850513          	addi	a0,a0,1336 # 800052d0 <digits+0x70>
    80003da0:	fffff097          	auipc	ra,0xfffff
    80003da4:	f2c080e7          	jalr	-212(ra) # 80002ccc <panic>
    80003da8:	00001517          	auipc	a0,0x1
    80003dac:	50850513          	addi	a0,a0,1288 # 800052b0 <digits+0x50>
    80003db0:	fffff097          	auipc	ra,0xfffff
    80003db4:	f1c080e7          	jalr	-228(ra) # 80002ccc <panic>

0000000080003db8 <__memset>:
    80003db8:	ff010113          	addi	sp,sp,-16
    80003dbc:	00813423          	sd	s0,8(sp)
    80003dc0:	01010413          	addi	s0,sp,16
    80003dc4:	1a060e63          	beqz	a2,80003f80 <__memset+0x1c8>
    80003dc8:	40a007b3          	neg	a5,a0
    80003dcc:	0077f793          	andi	a5,a5,7
    80003dd0:	00778693          	addi	a3,a5,7
    80003dd4:	00b00813          	li	a6,11
    80003dd8:	0ff5f593          	andi	a1,a1,255
    80003ddc:	fff6071b          	addiw	a4,a2,-1
    80003de0:	1b06e663          	bltu	a3,a6,80003f8c <__memset+0x1d4>
    80003de4:	1cd76463          	bltu	a4,a3,80003fac <__memset+0x1f4>
    80003de8:	1a078e63          	beqz	a5,80003fa4 <__memset+0x1ec>
    80003dec:	00b50023          	sb	a1,0(a0)
    80003df0:	00100713          	li	a4,1
    80003df4:	1ae78463          	beq	a5,a4,80003f9c <__memset+0x1e4>
    80003df8:	00b500a3          	sb	a1,1(a0)
    80003dfc:	00200713          	li	a4,2
    80003e00:	1ae78a63          	beq	a5,a4,80003fb4 <__memset+0x1fc>
    80003e04:	00b50123          	sb	a1,2(a0)
    80003e08:	00300713          	li	a4,3
    80003e0c:	18e78463          	beq	a5,a4,80003f94 <__memset+0x1dc>
    80003e10:	00b501a3          	sb	a1,3(a0)
    80003e14:	00400713          	li	a4,4
    80003e18:	1ae78263          	beq	a5,a4,80003fbc <__memset+0x204>
    80003e1c:	00b50223          	sb	a1,4(a0)
    80003e20:	00500713          	li	a4,5
    80003e24:	1ae78063          	beq	a5,a4,80003fc4 <__memset+0x20c>
    80003e28:	00b502a3          	sb	a1,5(a0)
    80003e2c:	00700713          	li	a4,7
    80003e30:	18e79e63          	bne	a5,a4,80003fcc <__memset+0x214>
    80003e34:	00b50323          	sb	a1,6(a0)
    80003e38:	00700e93          	li	t4,7
    80003e3c:	00859713          	slli	a4,a1,0x8
    80003e40:	00e5e733          	or	a4,a1,a4
    80003e44:	01059e13          	slli	t3,a1,0x10
    80003e48:	01c76e33          	or	t3,a4,t3
    80003e4c:	01859313          	slli	t1,a1,0x18
    80003e50:	006e6333          	or	t1,t3,t1
    80003e54:	02059893          	slli	a7,a1,0x20
    80003e58:	40f60e3b          	subw	t3,a2,a5
    80003e5c:	011368b3          	or	a7,t1,a7
    80003e60:	02859813          	slli	a6,a1,0x28
    80003e64:	0108e833          	or	a6,a7,a6
    80003e68:	03059693          	slli	a3,a1,0x30
    80003e6c:	003e589b          	srliw	a7,t3,0x3
    80003e70:	00d866b3          	or	a3,a6,a3
    80003e74:	03859713          	slli	a4,a1,0x38
    80003e78:	00389813          	slli	a6,a7,0x3
    80003e7c:	00f507b3          	add	a5,a0,a5
    80003e80:	00e6e733          	or	a4,a3,a4
    80003e84:	000e089b          	sext.w	a7,t3
    80003e88:	00f806b3          	add	a3,a6,a5
    80003e8c:	00e7b023          	sd	a4,0(a5)
    80003e90:	00878793          	addi	a5,a5,8
    80003e94:	fed79ce3          	bne	a5,a3,80003e8c <__memset+0xd4>
    80003e98:	ff8e7793          	andi	a5,t3,-8
    80003e9c:	0007871b          	sext.w	a4,a5
    80003ea0:	01d787bb          	addw	a5,a5,t4
    80003ea4:	0ce88e63          	beq	a7,a4,80003f80 <__memset+0x1c8>
    80003ea8:	00f50733          	add	a4,a0,a5
    80003eac:	00b70023          	sb	a1,0(a4)
    80003eb0:	0017871b          	addiw	a4,a5,1
    80003eb4:	0cc77663          	bgeu	a4,a2,80003f80 <__memset+0x1c8>
    80003eb8:	00e50733          	add	a4,a0,a4
    80003ebc:	00b70023          	sb	a1,0(a4)
    80003ec0:	0027871b          	addiw	a4,a5,2
    80003ec4:	0ac77e63          	bgeu	a4,a2,80003f80 <__memset+0x1c8>
    80003ec8:	00e50733          	add	a4,a0,a4
    80003ecc:	00b70023          	sb	a1,0(a4)
    80003ed0:	0037871b          	addiw	a4,a5,3
    80003ed4:	0ac77663          	bgeu	a4,a2,80003f80 <__memset+0x1c8>
    80003ed8:	00e50733          	add	a4,a0,a4
    80003edc:	00b70023          	sb	a1,0(a4)
    80003ee0:	0047871b          	addiw	a4,a5,4
    80003ee4:	08c77e63          	bgeu	a4,a2,80003f80 <__memset+0x1c8>
    80003ee8:	00e50733          	add	a4,a0,a4
    80003eec:	00b70023          	sb	a1,0(a4)
    80003ef0:	0057871b          	addiw	a4,a5,5
    80003ef4:	08c77663          	bgeu	a4,a2,80003f80 <__memset+0x1c8>
    80003ef8:	00e50733          	add	a4,a0,a4
    80003efc:	00b70023          	sb	a1,0(a4)
    80003f00:	0067871b          	addiw	a4,a5,6
    80003f04:	06c77e63          	bgeu	a4,a2,80003f80 <__memset+0x1c8>
    80003f08:	00e50733          	add	a4,a0,a4
    80003f0c:	00b70023          	sb	a1,0(a4)
    80003f10:	0077871b          	addiw	a4,a5,7
    80003f14:	06c77663          	bgeu	a4,a2,80003f80 <__memset+0x1c8>
    80003f18:	00e50733          	add	a4,a0,a4
    80003f1c:	00b70023          	sb	a1,0(a4)
    80003f20:	0087871b          	addiw	a4,a5,8
    80003f24:	04c77e63          	bgeu	a4,a2,80003f80 <__memset+0x1c8>
    80003f28:	00e50733          	add	a4,a0,a4
    80003f2c:	00b70023          	sb	a1,0(a4)
    80003f30:	0097871b          	addiw	a4,a5,9
    80003f34:	04c77663          	bgeu	a4,a2,80003f80 <__memset+0x1c8>
    80003f38:	00e50733          	add	a4,a0,a4
    80003f3c:	00b70023          	sb	a1,0(a4)
    80003f40:	00a7871b          	addiw	a4,a5,10
    80003f44:	02c77e63          	bgeu	a4,a2,80003f80 <__memset+0x1c8>
    80003f48:	00e50733          	add	a4,a0,a4
    80003f4c:	00b70023          	sb	a1,0(a4)
    80003f50:	00b7871b          	addiw	a4,a5,11
    80003f54:	02c77663          	bgeu	a4,a2,80003f80 <__memset+0x1c8>
    80003f58:	00e50733          	add	a4,a0,a4
    80003f5c:	00b70023          	sb	a1,0(a4)
    80003f60:	00c7871b          	addiw	a4,a5,12
    80003f64:	00c77e63          	bgeu	a4,a2,80003f80 <__memset+0x1c8>
    80003f68:	00e50733          	add	a4,a0,a4
    80003f6c:	00b70023          	sb	a1,0(a4)
    80003f70:	00d7879b          	addiw	a5,a5,13
    80003f74:	00c7f663          	bgeu	a5,a2,80003f80 <__memset+0x1c8>
    80003f78:	00f507b3          	add	a5,a0,a5
    80003f7c:	00b78023          	sb	a1,0(a5)
    80003f80:	00813403          	ld	s0,8(sp)
    80003f84:	01010113          	addi	sp,sp,16
    80003f88:	00008067          	ret
    80003f8c:	00b00693          	li	a3,11
    80003f90:	e55ff06f          	j	80003de4 <__memset+0x2c>
    80003f94:	00300e93          	li	t4,3
    80003f98:	ea5ff06f          	j	80003e3c <__memset+0x84>
    80003f9c:	00100e93          	li	t4,1
    80003fa0:	e9dff06f          	j	80003e3c <__memset+0x84>
    80003fa4:	00000e93          	li	t4,0
    80003fa8:	e95ff06f          	j	80003e3c <__memset+0x84>
    80003fac:	00000793          	li	a5,0
    80003fb0:	ef9ff06f          	j	80003ea8 <__memset+0xf0>
    80003fb4:	00200e93          	li	t4,2
    80003fb8:	e85ff06f          	j	80003e3c <__memset+0x84>
    80003fbc:	00400e93          	li	t4,4
    80003fc0:	e7dff06f          	j	80003e3c <__memset+0x84>
    80003fc4:	00500e93          	li	t4,5
    80003fc8:	e75ff06f          	j	80003e3c <__memset+0x84>
    80003fcc:	00600e93          	li	t4,6
    80003fd0:	e6dff06f          	j	80003e3c <__memset+0x84>

0000000080003fd4 <__memmove>:
    80003fd4:	ff010113          	addi	sp,sp,-16
    80003fd8:	00813423          	sd	s0,8(sp)
    80003fdc:	01010413          	addi	s0,sp,16
    80003fe0:	0e060863          	beqz	a2,800040d0 <__memmove+0xfc>
    80003fe4:	fff6069b          	addiw	a3,a2,-1
    80003fe8:	0006881b          	sext.w	a6,a3
    80003fec:	0ea5e863          	bltu	a1,a0,800040dc <__memmove+0x108>
    80003ff0:	00758713          	addi	a4,a1,7
    80003ff4:	00a5e7b3          	or	a5,a1,a0
    80003ff8:	40a70733          	sub	a4,a4,a0
    80003ffc:	0077f793          	andi	a5,a5,7
    80004000:	00f73713          	sltiu	a4,a4,15
    80004004:	00174713          	xori	a4,a4,1
    80004008:	0017b793          	seqz	a5,a5
    8000400c:	00e7f7b3          	and	a5,a5,a4
    80004010:	10078863          	beqz	a5,80004120 <__memmove+0x14c>
    80004014:	00900793          	li	a5,9
    80004018:	1107f463          	bgeu	a5,a6,80004120 <__memmove+0x14c>
    8000401c:	0036581b          	srliw	a6,a2,0x3
    80004020:	fff8081b          	addiw	a6,a6,-1
    80004024:	02081813          	slli	a6,a6,0x20
    80004028:	01d85893          	srli	a7,a6,0x1d
    8000402c:	00858813          	addi	a6,a1,8
    80004030:	00058793          	mv	a5,a1
    80004034:	00050713          	mv	a4,a0
    80004038:	01088833          	add	a6,a7,a6
    8000403c:	0007b883          	ld	a7,0(a5)
    80004040:	00878793          	addi	a5,a5,8
    80004044:	00870713          	addi	a4,a4,8
    80004048:	ff173c23          	sd	a7,-8(a4)
    8000404c:	ff0798e3          	bne	a5,a6,8000403c <__memmove+0x68>
    80004050:	ff867713          	andi	a4,a2,-8
    80004054:	02071793          	slli	a5,a4,0x20
    80004058:	0207d793          	srli	a5,a5,0x20
    8000405c:	00f585b3          	add	a1,a1,a5
    80004060:	40e686bb          	subw	a3,a3,a4
    80004064:	00f507b3          	add	a5,a0,a5
    80004068:	06e60463          	beq	a2,a4,800040d0 <__memmove+0xfc>
    8000406c:	0005c703          	lbu	a4,0(a1)
    80004070:	00e78023          	sb	a4,0(a5)
    80004074:	04068e63          	beqz	a3,800040d0 <__memmove+0xfc>
    80004078:	0015c603          	lbu	a2,1(a1)
    8000407c:	00100713          	li	a4,1
    80004080:	00c780a3          	sb	a2,1(a5)
    80004084:	04e68663          	beq	a3,a4,800040d0 <__memmove+0xfc>
    80004088:	0025c603          	lbu	a2,2(a1)
    8000408c:	00200713          	li	a4,2
    80004090:	00c78123          	sb	a2,2(a5)
    80004094:	02e68e63          	beq	a3,a4,800040d0 <__memmove+0xfc>
    80004098:	0035c603          	lbu	a2,3(a1)
    8000409c:	00300713          	li	a4,3
    800040a0:	00c781a3          	sb	a2,3(a5)
    800040a4:	02e68663          	beq	a3,a4,800040d0 <__memmove+0xfc>
    800040a8:	0045c603          	lbu	a2,4(a1)
    800040ac:	00400713          	li	a4,4
    800040b0:	00c78223          	sb	a2,4(a5)
    800040b4:	00e68e63          	beq	a3,a4,800040d0 <__memmove+0xfc>
    800040b8:	0055c603          	lbu	a2,5(a1)
    800040bc:	00500713          	li	a4,5
    800040c0:	00c782a3          	sb	a2,5(a5)
    800040c4:	00e68663          	beq	a3,a4,800040d0 <__memmove+0xfc>
    800040c8:	0065c703          	lbu	a4,6(a1)
    800040cc:	00e78323          	sb	a4,6(a5)
    800040d0:	00813403          	ld	s0,8(sp)
    800040d4:	01010113          	addi	sp,sp,16
    800040d8:	00008067          	ret
    800040dc:	02061713          	slli	a4,a2,0x20
    800040e0:	02075713          	srli	a4,a4,0x20
    800040e4:	00e587b3          	add	a5,a1,a4
    800040e8:	f0f574e3          	bgeu	a0,a5,80003ff0 <__memmove+0x1c>
    800040ec:	02069613          	slli	a2,a3,0x20
    800040f0:	02065613          	srli	a2,a2,0x20
    800040f4:	fff64613          	not	a2,a2
    800040f8:	00e50733          	add	a4,a0,a4
    800040fc:	00c78633          	add	a2,a5,a2
    80004100:	fff7c683          	lbu	a3,-1(a5)
    80004104:	fff78793          	addi	a5,a5,-1
    80004108:	fff70713          	addi	a4,a4,-1
    8000410c:	00d70023          	sb	a3,0(a4)
    80004110:	fec798e3          	bne	a5,a2,80004100 <__memmove+0x12c>
    80004114:	00813403          	ld	s0,8(sp)
    80004118:	01010113          	addi	sp,sp,16
    8000411c:	00008067          	ret
    80004120:	02069713          	slli	a4,a3,0x20
    80004124:	02075713          	srli	a4,a4,0x20
    80004128:	00170713          	addi	a4,a4,1
    8000412c:	00e50733          	add	a4,a0,a4
    80004130:	00050793          	mv	a5,a0
    80004134:	0005c683          	lbu	a3,0(a1)
    80004138:	00178793          	addi	a5,a5,1
    8000413c:	00158593          	addi	a1,a1,1
    80004140:	fed78fa3          	sb	a3,-1(a5)
    80004144:	fee798e3          	bne	a5,a4,80004134 <__memmove+0x160>
    80004148:	f89ff06f          	j	800040d0 <__memmove+0xfc>

000000008000414c <__putc>:
    8000414c:	fe010113          	addi	sp,sp,-32
    80004150:	00813823          	sd	s0,16(sp)
    80004154:	00113c23          	sd	ra,24(sp)
    80004158:	02010413          	addi	s0,sp,32
    8000415c:	00050793          	mv	a5,a0
    80004160:	fef40593          	addi	a1,s0,-17
    80004164:	00100613          	li	a2,1
    80004168:	00000513          	li	a0,0
    8000416c:	fef407a3          	sb	a5,-17(s0)
    80004170:	fffff097          	auipc	ra,0xfffff
    80004174:	b3c080e7          	jalr	-1220(ra) # 80002cac <console_write>
    80004178:	01813083          	ld	ra,24(sp)
    8000417c:	01013403          	ld	s0,16(sp)
    80004180:	02010113          	addi	sp,sp,32
    80004184:	00008067          	ret

0000000080004188 <__getc>:
    80004188:	fe010113          	addi	sp,sp,-32
    8000418c:	00813823          	sd	s0,16(sp)
    80004190:	00113c23          	sd	ra,24(sp)
    80004194:	02010413          	addi	s0,sp,32
    80004198:	fe840593          	addi	a1,s0,-24
    8000419c:	00100613          	li	a2,1
    800041a0:	00000513          	li	a0,0
    800041a4:	fffff097          	auipc	ra,0xfffff
    800041a8:	ae8080e7          	jalr	-1304(ra) # 80002c8c <console_read>
    800041ac:	fe844503          	lbu	a0,-24(s0)
    800041b0:	01813083          	ld	ra,24(sp)
    800041b4:	01013403          	ld	s0,16(sp)
    800041b8:	02010113          	addi	sp,sp,32
    800041bc:	00008067          	ret

00000000800041c0 <console_handler>:
    800041c0:	fe010113          	addi	sp,sp,-32
    800041c4:	00813823          	sd	s0,16(sp)
    800041c8:	00113c23          	sd	ra,24(sp)
    800041cc:	00913423          	sd	s1,8(sp)
    800041d0:	02010413          	addi	s0,sp,32
    800041d4:	14202773          	csrr	a4,scause
    800041d8:	100027f3          	csrr	a5,sstatus
    800041dc:	0027f793          	andi	a5,a5,2
    800041e0:	06079e63          	bnez	a5,8000425c <console_handler+0x9c>
    800041e4:	00074c63          	bltz	a4,800041fc <console_handler+0x3c>
    800041e8:	01813083          	ld	ra,24(sp)
    800041ec:	01013403          	ld	s0,16(sp)
    800041f0:	00813483          	ld	s1,8(sp)
    800041f4:	02010113          	addi	sp,sp,32
    800041f8:	00008067          	ret
    800041fc:	0ff77713          	andi	a4,a4,255
    80004200:	00900793          	li	a5,9
    80004204:	fef712e3          	bne	a4,a5,800041e8 <console_handler+0x28>
    80004208:	ffffe097          	auipc	ra,0xffffe
    8000420c:	6dc080e7          	jalr	1756(ra) # 800028e4 <plic_claim>
    80004210:	00a00793          	li	a5,10
    80004214:	00050493          	mv	s1,a0
    80004218:	02f50c63          	beq	a0,a5,80004250 <console_handler+0x90>
    8000421c:	fc0506e3          	beqz	a0,800041e8 <console_handler+0x28>
    80004220:	00050593          	mv	a1,a0
    80004224:	00001517          	auipc	a0,0x1
    80004228:	fb450513          	addi	a0,a0,-76 # 800051d8 <_ZZ12printIntegermE6digits+0xe0>
    8000422c:	fffff097          	auipc	ra,0xfffff
    80004230:	afc080e7          	jalr	-1284(ra) # 80002d28 <__printf>
    80004234:	01013403          	ld	s0,16(sp)
    80004238:	01813083          	ld	ra,24(sp)
    8000423c:	00048513          	mv	a0,s1
    80004240:	00813483          	ld	s1,8(sp)
    80004244:	02010113          	addi	sp,sp,32
    80004248:	ffffe317          	auipc	t1,0xffffe
    8000424c:	6d430067          	jr	1748(t1) # 8000291c <plic_complete>
    80004250:	fffff097          	auipc	ra,0xfffff
    80004254:	3e0080e7          	jalr	992(ra) # 80003630 <uartintr>
    80004258:	fddff06f          	j	80004234 <console_handler+0x74>
    8000425c:	00001517          	auipc	a0,0x1
    80004260:	07c50513          	addi	a0,a0,124 # 800052d8 <digits+0x78>
    80004264:	fffff097          	auipc	ra,0xfffff
    80004268:	a68080e7          	jalr	-1432(ra) # 80002ccc <panic>
	...
