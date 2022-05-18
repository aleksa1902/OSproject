
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00005117          	auipc	sp,0x5
    80000004:	7e013103          	ld	sp,2016(sp) # 800057e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	5bd010ef          	jal	ra,80001dd8 <start>

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
    80001184:	0bd000ef          	jal	ra,80001a40 <_ZN5Riscv20handleSupervisorTrapEv>

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

0000000080001224 <_Z11workerBodyAv>:
#include "../h/print.hpp"
#include "../h/ccb.hpp"
#include "../h/tcb.hpp"


void workerBodyA() {
    80001224:	fe010113          	addi	sp,sp,-32
    80001228:	00113c23          	sd	ra,24(sp)
    8000122c:	00813823          	sd	s0,16(sp)
    80001230:	00913423          	sd	s1,8(sp)
    80001234:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80001238:	00000493          	li	s1,0
    8000123c:	0300006f          	j	8000126c <_Z11workerBodyAv+0x48>
        printString("A: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    80001240:	00168693          	addi	a3,a3,1
    80001244:	000027b7          	lui	a5,0x2
    80001248:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000124c:	00d7ee63          	bltu	a5,a3,80001268 <_Z11workerBodyAv+0x44>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001250:	00000713          	li	a4,0
    80001254:	000077b7          	lui	a5,0x7
    80001258:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000125c:	fee7e2e3          	bltu	a5,a4,80001240 <_Z11workerBodyAv+0x1c>
    80001260:	00170713          	addi	a4,a4,1
    80001264:	ff1ff06f          	j	80001254 <_Z11workerBodyAv+0x30>
    for (uint64 i = 0; i < 10; i++) {
    80001268:	00148493          	addi	s1,s1,1
    8000126c:	00900793          	li	a5,9
    80001270:	0297ec63          	bltu	a5,s1,800012a8 <_Z11workerBodyAv+0x84>
        printString("A: i="); printInteger(i); printString("\n");
    80001274:	00004517          	auipc	a0,0x4
    80001278:	d8c50513          	addi	a0,a0,-628 # 80005000 <kvmincrease+0xe20>
    8000127c:	00001097          	auipc	ra,0x1
    80001280:	a5c080e7          	jalr	-1444(ra) # 80001cd8 <_Z11printStringPKc>
    80001284:	00048513          	mv	a0,s1
    80001288:	00001097          	auipc	ra,0x1
    8000128c:	ac0080e7          	jalr	-1344(ra) # 80001d48 <_Z12printIntegerm>
    80001290:	00004517          	auipc	a0,0x4
    80001294:	e4050513          	addi	a0,a0,-448 # 800050d0 <kvmincrease+0xef0>
    80001298:	00001097          	auipc	ra,0x1
    8000129c:	a40080e7          	jalr	-1472(ra) # 80001cd8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800012a0:	00000693          	li	a3,0
    800012a4:	fa1ff06f          	j	80001244 <_Z11workerBodyAv+0x20>
            // TCB::yield();
        }
    }
}
    800012a8:	01813083          	ld	ra,24(sp)
    800012ac:	01013403          	ld	s0,16(sp)
    800012b0:	00813483          	ld	s1,8(sp)
    800012b4:	02010113          	addi	sp,sp,32
    800012b8:	00008067          	ret

00000000800012bc <_Z11workerBodyBv>:

void workerBodyB() {
    800012bc:	fe010113          	addi	sp,sp,-32
    800012c0:	00113c23          	sd	ra,24(sp)
    800012c4:	00813823          	sd	s0,16(sp)
    800012c8:	00913423          	sd	s1,8(sp)
    800012cc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800012d0:	00000493          	li	s1,0
    800012d4:	0300006f          	j	80001304 <_Z11workerBodyBv+0x48>
        printString("B: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    800012d8:	00168693          	addi	a3,a3,1
    800012dc:	000027b7          	lui	a5,0x2
    800012e0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800012e4:	00d7ee63          	bltu	a5,a3,80001300 <_Z11workerBodyBv+0x44>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800012e8:	00000713          	li	a4,0
    800012ec:	000077b7          	lui	a5,0x7
    800012f0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800012f4:	fee7e2e3          	bltu	a5,a4,800012d8 <_Z11workerBodyBv+0x1c>
    800012f8:	00170713          	addi	a4,a4,1
    800012fc:	ff1ff06f          	j	800012ec <_Z11workerBodyBv+0x30>
    for (uint64 i = 0; i < 16; i++) {
    80001300:	00148493          	addi	s1,s1,1
    80001304:	00f00793          	li	a5,15
    80001308:	0297ec63          	bltu	a5,s1,80001340 <_Z11workerBodyBv+0x84>
        printString("B: i="); printInteger(i); printString("\n");
    8000130c:	00004517          	auipc	a0,0x4
    80001310:	cfc50513          	addi	a0,a0,-772 # 80005008 <kvmincrease+0xe28>
    80001314:	00001097          	auipc	ra,0x1
    80001318:	9c4080e7          	jalr	-1596(ra) # 80001cd8 <_Z11printStringPKc>
    8000131c:	00048513          	mv	a0,s1
    80001320:	00001097          	auipc	ra,0x1
    80001324:	a28080e7          	jalr	-1496(ra) # 80001d48 <_Z12printIntegerm>
    80001328:	00004517          	auipc	a0,0x4
    8000132c:	da850513          	addi	a0,a0,-600 # 800050d0 <kvmincrease+0xef0>
    80001330:	00001097          	auipc	ra,0x1
    80001334:	9a8080e7          	jalr	-1624(ra) # 80001cd8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001338:	00000693          	li	a3,0
    8000133c:	fa1ff06f          	j	800012dc <_Z11workerBodyBv+0x20>
            // TCB::yield();
        }
    }
}
    80001340:	01813083          	ld	ra,24(sp)
    80001344:	01013403          	ld	s0,16(sp)
    80001348:	00813483          	ld	s1,8(sp)
    8000134c:	02010113          	addi	sp,sp,32
    80001350:	00008067          	ret

0000000080001354 <_Z9fibonaccim>:

uint64 fibonacci(uint64 n) {
    80001354:	fe010113          	addi	sp,sp,-32
    80001358:	00113c23          	sd	ra,24(sp)
    8000135c:	00813823          	sd	s0,16(sp)
    80001360:	00913423          	sd	s1,8(sp)
    80001364:	01213023          	sd	s2,0(sp)
    80001368:	02010413          	addi	s0,sp,32
    8000136c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80001370:	00100793          	li	a5,1
    80001374:	02a7f863          	bgeu	a5,a0,800013a4 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { TCB::yield(); }
    80001378:	00a00793          	li	a5,10
    8000137c:	02f577b3          	remu	a5,a0,a5
    80001380:	02078e63          	beqz	a5,800013bc <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001384:	fff48513          	addi	a0,s1,-1
    80001388:	00000097          	auipc	ra,0x0
    8000138c:	fcc080e7          	jalr	-52(ra) # 80001354 <_Z9fibonaccim>
    80001390:	00050913          	mv	s2,a0
    80001394:	ffe48513          	addi	a0,s1,-2
    80001398:	00000097          	auipc	ra,0x0
    8000139c:	fbc080e7          	jalr	-68(ra) # 80001354 <_Z9fibonaccim>
    800013a0:	00a90533          	add	a0,s2,a0
}
    800013a4:	01813083          	ld	ra,24(sp)
    800013a8:	01013403          	ld	s0,16(sp)
    800013ac:	00813483          	ld	s1,8(sp)
    800013b0:	00013903          	ld	s2,0(sp)
    800013b4:	02010113          	addi	sp,sp,32
    800013b8:	00008067          	ret
    if (n % 10 == 0) { TCB::yield(); }
    800013bc:	00000097          	auipc	ra,0x0
    800013c0:	4e8080e7          	jalr	1256(ra) # 800018a4 <_ZN3TCB5yieldEv>
    800013c4:	fc1ff06f          	j	80001384 <_Z9fibonaccim+0x30>

00000000800013c8 <_Z11workerBodyCv>:
void workerBodyC() {
    800013c8:	fe010113          	addi	sp,sp,-32
    800013cc:	00113c23          	sd	ra,24(sp)
    800013d0:	00813823          	sd	s0,16(sp)
    800013d4:	00913423          	sd	s1,8(sp)
    800013d8:	01213023          	sd	s2,0(sp)
    800013dc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800013e0:	00000493          	li	s1,0
    800013e4:	0380006f          	j	8000141c <_Z11workerBodyCv+0x54>
    for (; i < 3; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    800013e8:	00004517          	auipc	a0,0x4
    800013ec:	c2850513          	addi	a0,a0,-984 # 80005010 <kvmincrease+0xe30>
    800013f0:	00001097          	auipc	ra,0x1
    800013f4:	8e8080e7          	jalr	-1816(ra) # 80001cd8 <_Z11printStringPKc>
    800013f8:	00048513          	mv	a0,s1
    800013fc:	00001097          	auipc	ra,0x1
    80001400:	94c080e7          	jalr	-1716(ra) # 80001d48 <_Z12printIntegerm>
    80001404:	00004517          	auipc	a0,0x4
    80001408:	ccc50513          	addi	a0,a0,-820 # 800050d0 <kvmincrease+0xef0>
    8000140c:	00001097          	auipc	ra,0x1
    80001410:	8cc080e7          	jalr	-1844(ra) # 80001cd8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80001414:	0014849b          	addiw	s1,s1,1
    80001418:	0ff4f493          	andi	s1,s1,255
    8000141c:	00200793          	li	a5,2
    80001420:	fc97f4e3          	bgeu	a5,s1,800013e8 <_Z11workerBodyCv+0x20>
    }

    printString("C: yield\n");
    80001424:	00004517          	auipc	a0,0x4
    80001428:	bf450513          	addi	a0,a0,-1036 # 80005018 <kvmincrease+0xe38>
    8000142c:	00001097          	auipc	ra,0x1
    80001430:	8ac080e7          	jalr	-1876(ra) # 80001cd8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80001434:	00700313          	li	t1,7
    TCB::yield();
    80001438:	00000097          	auipc	ra,0x0
    8000143c:	46c080e7          	jalr	1132(ra) # 800018a4 <_ZN3TCB5yieldEv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001440:	00030913          	mv	s2,t1

    printString("C: t1="); printInteger(t1); printString("\n");
    80001444:	00004517          	auipc	a0,0x4
    80001448:	be450513          	addi	a0,a0,-1052 # 80005028 <kvmincrease+0xe48>
    8000144c:	00001097          	auipc	ra,0x1
    80001450:	88c080e7          	jalr	-1908(ra) # 80001cd8 <_Z11printStringPKc>
    80001454:	00090513          	mv	a0,s2
    80001458:	00001097          	auipc	ra,0x1
    8000145c:	8f0080e7          	jalr	-1808(ra) # 80001d48 <_Z12printIntegerm>
    80001460:	00004517          	auipc	a0,0x4
    80001464:	c7050513          	addi	a0,a0,-912 # 800050d0 <kvmincrease+0xef0>
    80001468:	00001097          	auipc	ra,0x1
    8000146c:	870080e7          	jalr	-1936(ra) # 80001cd8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001470:	00c00513          	li	a0,12
    80001474:	00000097          	auipc	ra,0x0
    80001478:	ee0080e7          	jalr	-288(ra) # 80001354 <_Z9fibonaccim>
    8000147c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInteger(result); printString("\n");
    80001480:	00004517          	auipc	a0,0x4
    80001484:	bb050513          	addi	a0,a0,-1104 # 80005030 <kvmincrease+0xe50>
    80001488:	00001097          	auipc	ra,0x1
    8000148c:	850080e7          	jalr	-1968(ra) # 80001cd8 <_Z11printStringPKc>
    80001490:	00090513          	mv	a0,s2
    80001494:	00001097          	auipc	ra,0x1
    80001498:	8b4080e7          	jalr	-1868(ra) # 80001d48 <_Z12printIntegerm>
    8000149c:	00004517          	auipc	a0,0x4
    800014a0:	c3450513          	addi	a0,a0,-972 # 800050d0 <kvmincrease+0xef0>
    800014a4:	00001097          	auipc	ra,0x1
    800014a8:	834080e7          	jalr	-1996(ra) # 80001cd8 <_Z11printStringPKc>
    800014ac:	0380006f          	j	800014e4 <_Z11workerBodyCv+0x11c>

    for (; i < 6; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    800014b0:	00004517          	auipc	a0,0x4
    800014b4:	b6050513          	addi	a0,a0,-1184 # 80005010 <kvmincrease+0xe30>
    800014b8:	00001097          	auipc	ra,0x1
    800014bc:	820080e7          	jalr	-2016(ra) # 80001cd8 <_Z11printStringPKc>
    800014c0:	00048513          	mv	a0,s1
    800014c4:	00001097          	auipc	ra,0x1
    800014c8:	884080e7          	jalr	-1916(ra) # 80001d48 <_Z12printIntegerm>
    800014cc:	00004517          	auipc	a0,0x4
    800014d0:	c0450513          	addi	a0,a0,-1020 # 800050d0 <kvmincrease+0xef0>
    800014d4:	00001097          	auipc	ra,0x1
    800014d8:	804080e7          	jalr	-2044(ra) # 80001cd8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800014dc:	0014849b          	addiw	s1,s1,1
    800014e0:	0ff4f493          	andi	s1,s1,255
    800014e4:	00500793          	li	a5,5
    800014e8:	fc97f4e3          	bgeu	a5,s1,800014b0 <_Z11workerBodyCv+0xe8>
    }
//    TCB::yield();
}
    800014ec:	01813083          	ld	ra,24(sp)
    800014f0:	01013403          	ld	s0,16(sp)
    800014f4:	00813483          	ld	s1,8(sp)
    800014f8:	00013903          	ld	s2,0(sp)
    800014fc:	02010113          	addi	sp,sp,32
    80001500:	00008067          	ret

0000000080001504 <_Z11workerBodyDv>:
void workerBodyD() {
    80001504:	fe010113          	addi	sp,sp,-32
    80001508:	00113c23          	sd	ra,24(sp)
    8000150c:	00813823          	sd	s0,16(sp)
    80001510:	00913423          	sd	s1,8(sp)
    80001514:	01213023          	sd	s2,0(sp)
    80001518:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000151c:	00a00493          	li	s1,10
    80001520:	0380006f          	j	80001558 <_Z11workerBodyDv+0x54>
    for (; i < 13; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    80001524:	00004517          	auipc	a0,0x4
    80001528:	b1c50513          	addi	a0,a0,-1252 # 80005040 <kvmincrease+0xe60>
    8000152c:	00000097          	auipc	ra,0x0
    80001530:	7ac080e7          	jalr	1964(ra) # 80001cd8 <_Z11printStringPKc>
    80001534:	00048513          	mv	a0,s1
    80001538:	00001097          	auipc	ra,0x1
    8000153c:	810080e7          	jalr	-2032(ra) # 80001d48 <_Z12printIntegerm>
    80001540:	00004517          	auipc	a0,0x4
    80001544:	b9050513          	addi	a0,a0,-1136 # 800050d0 <kvmincrease+0xef0>
    80001548:	00000097          	auipc	ra,0x0
    8000154c:	790080e7          	jalr	1936(ra) # 80001cd8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80001550:	0014849b          	addiw	s1,s1,1
    80001554:	0ff4f493          	andi	s1,s1,255
    80001558:	00c00793          	li	a5,12
    8000155c:	fc97f4e3          	bgeu	a5,s1,80001524 <_Z11workerBodyDv+0x20>
    }

    printString("D: yield\n");
    80001560:	00004517          	auipc	a0,0x4
    80001564:	ae850513          	addi	a0,a0,-1304 # 80005048 <kvmincrease+0xe68>
    80001568:	00000097          	auipc	ra,0x0
    8000156c:	770080e7          	jalr	1904(ra) # 80001cd8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001570:	00500313          	li	t1,5
    TCB::yield();
    80001574:	00000097          	auipc	ra,0x0
    80001578:	330080e7          	jalr	816(ra) # 800018a4 <_ZN3TCB5yieldEv>

    uint64 result = fibonacci(16);
    8000157c:	01000513          	li	a0,16
    80001580:	00000097          	auipc	ra,0x0
    80001584:	dd4080e7          	jalr	-556(ra) # 80001354 <_Z9fibonaccim>
    80001588:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInteger(result); printString("\n");
    8000158c:	00004517          	auipc	a0,0x4
    80001590:	acc50513          	addi	a0,a0,-1332 # 80005058 <kvmincrease+0xe78>
    80001594:	00000097          	auipc	ra,0x0
    80001598:	744080e7          	jalr	1860(ra) # 80001cd8 <_Z11printStringPKc>
    8000159c:	00090513          	mv	a0,s2
    800015a0:	00000097          	auipc	ra,0x0
    800015a4:	7a8080e7          	jalr	1960(ra) # 80001d48 <_Z12printIntegerm>
    800015a8:	00004517          	auipc	a0,0x4
    800015ac:	b2850513          	addi	a0,a0,-1240 # 800050d0 <kvmincrease+0xef0>
    800015b0:	00000097          	auipc	ra,0x0
    800015b4:	728080e7          	jalr	1832(ra) # 80001cd8 <_Z11printStringPKc>
    800015b8:	0380006f          	j	800015f0 <_Z11workerBodyDv+0xec>

    for (; i < 16; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    800015bc:	00004517          	auipc	a0,0x4
    800015c0:	a8450513          	addi	a0,a0,-1404 # 80005040 <kvmincrease+0xe60>
    800015c4:	00000097          	auipc	ra,0x0
    800015c8:	714080e7          	jalr	1812(ra) # 80001cd8 <_Z11printStringPKc>
    800015cc:	00048513          	mv	a0,s1
    800015d0:	00000097          	auipc	ra,0x0
    800015d4:	778080e7          	jalr	1912(ra) # 80001d48 <_Z12printIntegerm>
    800015d8:	00004517          	auipc	a0,0x4
    800015dc:	af850513          	addi	a0,a0,-1288 # 800050d0 <kvmincrease+0xef0>
    800015e0:	00000097          	auipc	ra,0x0
    800015e4:	6f8080e7          	jalr	1784(ra) # 80001cd8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800015e8:	0014849b          	addiw	s1,s1,1
    800015ec:	0ff4f493          	andi	s1,s1,255
    800015f0:	00f00793          	li	a5,15
    800015f4:	fc97f4e3          	bgeu	a5,s1,800015bc <_Z11workerBodyDv+0xb8>
    }
//    TCB::yield();
}
    800015f8:	01813083          	ld	ra,24(sp)
    800015fc:	01013403          	ld	s0,16(sp)
    80001600:	00813483          	ld	s1,8(sp)
    80001604:	00013903          	ld	s2,0(sp)
    80001608:	02010113          	addi	sp,sp,32
    8000160c:	00008067          	ret

0000000080001610 <main>:
#include "../h/workers.hpp"
#include "../h/print.hpp"
#include "../h/tcb.hpp"
#include "../h/riscv.hpp"

int main() {
    80001610:	fb010113          	addi	sp,sp,-80
    80001614:	04113423          	sd	ra,72(sp)
    80001618:	04813023          	sd	s0,64(sp)
    8000161c:	02913c23          	sd	s1,56(sp)
    80001620:	03213823          	sd	s2,48(sp)
    80001624:	05010413          	addi	s0,sp,80
    TCB *threads[5];
    threads[0] = TCB::createThread(nullptr);
    80001628:	00000513          	li	a0,0
    8000162c:	00000097          	auipc	ra,0x0
    80001630:	200080e7          	jalr	512(ra) # 8000182c <_ZN3TCB12createThreadEPFvvE>
    80001634:	faa43c23          	sd	a0,-72(s0)
    TCB::running = threads[0];
    80001638:	00004797          	auipc	a5,0x4
    8000163c:	1b07b783          	ld	a5,432(a5) # 800057e8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001640:	00a7b023          	sd	a0,0(a5)
    threads[1] = TCB::createThread(workerBodyA);
    80001644:	00004517          	auipc	a0,0x4
    80001648:	19453503          	ld	a0,404(a0) # 800057d8 <_GLOBAL_OFFSET_TABLE_+0x20>
    8000164c:	00000097          	auipc	ra,0x0
    80001650:	1e0080e7          	jalr	480(ra) # 8000182c <_ZN3TCB12createThreadEPFvvE>
    80001654:	fca43023          	sd	a0,-64(s0)
    printString("ThreadA created\n");
    80001658:	00004517          	auipc	a0,0x4
    8000165c:	a1050513          	addi	a0,a0,-1520 # 80005068 <kvmincrease+0xe88>
    80001660:	00000097          	auipc	ra,0x0
    80001664:	678080e7          	jalr	1656(ra) # 80001cd8 <_Z11printStringPKc>
    threads[2] = TCB::createThread(workerBodyB);
    80001668:	00004517          	auipc	a0,0x4
    8000166c:	16053503          	ld	a0,352(a0) # 800057c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001670:	00000097          	auipc	ra,0x0
    80001674:	1bc080e7          	jalr	444(ra) # 8000182c <_ZN3TCB12createThreadEPFvvE>
    80001678:	fca43423          	sd	a0,-56(s0)
    printString("ThreadB created\n");
    8000167c:	00004517          	auipc	a0,0x4
    80001680:	a0450513          	addi	a0,a0,-1532 # 80005080 <kvmincrease+0xea0>
    80001684:	00000097          	auipc	ra,0x0
    80001688:	654080e7          	jalr	1620(ra) # 80001cd8 <_Z11printStringPKc>
    threads[3] = TCB::createThread(workerBodyC);
    8000168c:	00004517          	auipc	a0,0x4
    80001690:	16453503          	ld	a0,356(a0) # 800057f0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001694:	00000097          	auipc	ra,0x0
    80001698:	198080e7          	jalr	408(ra) # 8000182c <_ZN3TCB12createThreadEPFvvE>
    8000169c:	fca43823          	sd	a0,-48(s0)
    printString("ThreadC created\n");
    800016a0:	00004517          	auipc	a0,0x4
    800016a4:	9f850513          	addi	a0,a0,-1544 # 80005098 <kvmincrease+0xeb8>
    800016a8:	00000097          	auipc	ra,0x0
    800016ac:	630080e7          	jalr	1584(ra) # 80001cd8 <_Z11printStringPKc>
    threads[4] = TCB::createThread(workerBodyD);
    800016b0:	00004517          	auipc	a0,0x4
    800016b4:	14853503          	ld	a0,328(a0) # 800057f8 <_GLOBAL_OFFSET_TABLE_+0x40>
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	174080e7          	jalr	372(ra) # 8000182c <_ZN3TCB12createThreadEPFvvE>
    800016c0:	fca43c23          	sd	a0,-40(s0)
    printString("ThreadD created\n");
    800016c4:	00004517          	auipc	a0,0x4
    800016c8:	9ec50513          	addi	a0,a0,-1556 # 800050b0 <kvmincrease+0xed0>
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	60c080e7          	jalr	1548(ra) # 80001cd8 <_Z11printStringPKc>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    800016d4:	00004797          	auipc	a5,0x4
    800016d8:	0ec7b783          	ld	a5,236(a5) # 800057c0 <_GLOBAL_OFFSET_TABLE_+0x8>
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    800016dc:	10579073          	csrw	stvec,a5
inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800016e0:	00200793          	li	a5,2
    800016e4:	1007a073          	csrs	sstatus,a5
}
    800016e8:	00c0006f          	j	800016f4 <main+0xe4>
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
             threads[3]->isFinished() && threads[4]->isFinished())) {
        TCB::yield();
    800016ec:	00000097          	auipc	ra,0x0
    800016f0:	1b8080e7          	jalr	440(ra) # 800018a4 <_ZN3TCB5yieldEv>
    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
    800016f4:	fc043783          	ld	a5,-64(s0)
#include "../lib/hw.h"

class TCB {
        public:
        ~TCB() { delete[] stack; }
        bool isFinished() const { return finished; }
    800016f8:	0287c783          	lbu	a5,40(a5)
    800016fc:	fe0788e3          	beqz	a5,800016ec <main+0xdc>
    80001700:	fc843783          	ld	a5,-56(s0)
    80001704:	0287c783          	lbu	a5,40(a5)
    80001708:	fe0782e3          	beqz	a5,800016ec <main+0xdc>
             threads[3]->isFinished() && threads[4]->isFinished())) {
    8000170c:	fd043783          	ld	a5,-48(s0)
    80001710:	0287c783          	lbu	a5,40(a5)
    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
    80001714:	fc078ce3          	beqz	a5,800016ec <main+0xdc>
             threads[3]->isFinished() && threads[4]->isFinished())) {
    80001718:	fd843783          	ld	a5,-40(s0)
    8000171c:	0287c783          	lbu	a5,40(a5)
    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
    80001720:	fc0786e3          	beqz	a5,800016ec <main+0xdc>
    80001724:	fb840493          	addi	s1,s0,-72
    80001728:	0140006f          	j	8000173c <main+0x12c>
    }
    for (auto &thread: threads) { delete thread; }
    8000172c:	00090513          	mv	a0,s2
    80001730:	00000097          	auipc	ra,0x0
    80001734:	2a0080e7          	jalr	672(ra) # 800019d0 <_ZdlPv>
    80001738:	00848493          	addi	s1,s1,8
    8000173c:	fe040793          	addi	a5,s0,-32
    80001740:	02f48063          	beq	s1,a5,80001760 <main+0x150>
    80001744:	0004b903          	ld	s2,0(s1)
    80001748:	fe0908e3          	beqz	s2,80001738 <main+0x128>
        ~TCB() { delete[] stack; }
    8000174c:	00893503          	ld	a0,8(s2)
    80001750:	fc050ee3          	beqz	a0,8000172c <main+0x11c>
    80001754:	00000097          	auipc	ra,0x0
    80001758:	2a4080e7          	jalr	676(ra) # 800019f8 <_ZdaPv>
    8000175c:	fd1ff06f          	j	8000172c <main+0x11c>
    printString("Finished\n");
    80001760:	00004517          	auipc	a0,0x4
    80001764:	96850513          	addi	a0,a0,-1688 # 800050c8 <kvmincrease+0xee8>
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	570080e7          	jalr	1392(ra) # 80001cd8 <_Z11printStringPKc>
    return 0;
}
    80001770:	00000513          	li	a0,0
    80001774:	04813083          	ld	ra,72(sp)
    80001778:	04013403          	ld	s0,64(sp)
    8000177c:	03813483          	ld	s1,56(sp)
    80001780:	03013903          	ld	s2,48(sp)
    80001784:	05010113          	addi	sp,sp,80
    80001788:	00008067          	ret

000000008000178c <_ZN3TCBC1EPFvvEm>:


TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

TCB::TCB(Body body, uint64 timeSlice) : body(body),
    8000178c:	fd010113          	addi	sp,sp,-48
    80001790:	02113423          	sd	ra,40(sp)
    80001794:	02813023          	sd	s0,32(sp)
    80001798:	00913c23          	sd	s1,24(sp)
    8000179c:	01213823          	sd	s2,16(sp)
    800017a0:	01313423          	sd	s3,8(sp)
    800017a4:	03010413          	addi	s0,sp,48
    800017a8:	00050493          	mv	s1,a0
    800017ac:	00058913          	mv	s2,a1
    800017b0:	00060993          	mv	s3,a2
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
context({(uint64) &threadWrapper,
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
timeSlice(timeSlice),
finished(false) { if (body != nullptr) { Scheduler::put(this); } }
    800017b4:	00b53023          	sd	a1,0(a0)
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    800017b8:	06058263          	beqz	a1,8000181c <_ZN3TCBC1EPFvvEm+0x90>
    800017bc:	00002537          	lui	a0,0x2
    800017c0:	00000097          	auipc	ra,0x0
    800017c4:	1e8080e7          	jalr	488(ra) # 800019a8 <_Znam>
finished(false) { if (body != nullptr) { Scheduler::put(this); } }
    800017c8:	00a4b423          	sd	a0,8(s1)
    800017cc:	00000797          	auipc	a5,0x0
    800017d0:	0f478793          	addi	a5,a5,244 # 800018c0 <_ZN3TCB13threadWrapperEv>
    800017d4:	00f4b823          	sd	a5,16(s1)
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
    800017d8:	04050663          	beqz	a0,80001824 <_ZN3TCBC1EPFvvEm+0x98>
    800017dc:	000027b7          	lui	a5,0x2
    800017e0:	00f50533          	add	a0,a0,a5
finished(false) { if (body != nullptr) { Scheduler::put(this); } }
    800017e4:	00a4bc23          	sd	a0,24(s1)
    800017e8:	0334b023          	sd	s3,32(s1)
    800017ec:	02048423          	sb	zero,40(s1)
    800017f0:	00090863          	beqz	s2,80001800 <_ZN3TCBC1EPFvvEm+0x74>
    800017f4:	00048513          	mv	a0,s1
    800017f8:	00000097          	auipc	ra,0x0
    800017fc:	408080e7          	jalr	1032(ra) # 80001c00 <_ZN9Scheduler3putEP3TCB>
    80001800:	02813083          	ld	ra,40(sp)
    80001804:	02013403          	ld	s0,32(sp)
    80001808:	01813483          	ld	s1,24(sp)
    8000180c:	01013903          	ld	s2,16(sp)
    80001810:	00813983          	ld	s3,8(sp)
    80001814:	03010113          	addi	sp,sp,48
    80001818:	00008067          	ret
stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    8000181c:	00000513          	li	a0,0
    80001820:	fa9ff06f          	j	800017c8 <_ZN3TCBC1EPFvvEm+0x3c>
         stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
    80001824:	00000513          	li	a0,0
    80001828:	fbdff06f          	j	800017e4 <_ZN3TCBC1EPFvvEm+0x58>

000000008000182c <_ZN3TCB12createThreadEPFvvE>:

TCB *TCB::createThread(Body body) { return new TCB(body, TIME_SLICE); }
    8000182c:	fe010113          	addi	sp,sp,-32
    80001830:	00113c23          	sd	ra,24(sp)
    80001834:	00813823          	sd	s0,16(sp)
    80001838:	00913423          	sd	s1,8(sp)
    8000183c:	01213023          	sd	s2,0(sp)
    80001840:	02010413          	addi	s0,sp,32
    80001844:	00050913          	mv	s2,a0
    80001848:	03000513          	li	a0,48
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	134080e7          	jalr	308(ra) # 80001980 <_Znwm>
    80001854:	00050493          	mv	s1,a0
    80001858:	00200613          	li	a2,2
    8000185c:	00090593          	mv	a1,s2
    80001860:	00000097          	auipc	ra,0x0
    80001864:	f2c080e7          	jalr	-212(ra) # 8000178c <_ZN3TCBC1EPFvvEm>
    80001868:	0200006f          	j	80001888 <_ZN3TCB12createThreadEPFvvE+0x5c>
    8000186c:	00050913          	mv	s2,a0
    80001870:	00048513          	mv	a0,s1
    80001874:	00000097          	auipc	ra,0x0
    80001878:	15c080e7          	jalr	348(ra) # 800019d0 <_ZdlPv>
    8000187c:	00090513          	mv	a0,s2
    80001880:	00005097          	auipc	ra,0x5
    80001884:	0b8080e7          	jalr	184(ra) # 80006938 <_Unwind_Resume>
    80001888:	00048513          	mv	a0,s1
    8000188c:	01813083          	ld	ra,24(sp)
    80001890:	01013403          	ld	s0,16(sp)
    80001894:	00813483          	ld	s1,8(sp)
    80001898:	00013903          	ld	s2,0(sp)
    8000189c:	02010113          	addi	sp,sp,32
    800018a0:	00008067          	ret

00000000800018a4 <_ZN3TCB5yieldEv>:

void TCB::yield() { __asm__ volatile ("ecall"); }
    800018a4:	ff010113          	addi	sp,sp,-16
    800018a8:	00813423          	sd	s0,8(sp)
    800018ac:	01010413          	addi	s0,sp,16
    800018b0:	00000073          	ecall
    800018b4:	00813403          	ld	s0,8(sp)
    800018b8:	01010113          	addi	sp,sp,16
    800018bc:	00008067          	ret

00000000800018c0 <_ZN3TCB13threadWrapperEv>:
    if (!old->isFinished()) { Scheduler::put(old); }
    running = Scheduler::get();
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper() {
    800018c0:	fe010113          	addi	sp,sp,-32
    800018c4:	00113c23          	sd	ra,24(sp)
    800018c8:	00813823          	sd	s0,16(sp)
    800018cc:	00913423          	sd	s1,8(sp)
    800018d0:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    800018d4:	00000097          	auipc	ra,0x0
    800018d8:	14c080e7          	jalr	332(ra) # 80001a20 <_ZN5Riscv10popSppSpieEv>
    running->body();
    800018dc:	00004497          	auipc	s1,0x4
    800018e0:	f7448493          	addi	s1,s1,-140 # 80005850 <_ZN3TCB7runningE>
    800018e4:	0004b783          	ld	a5,0(s1)
    800018e8:	0007b783          	ld	a5,0(a5) # 2000 <_entry-0x7fffe000>
    800018ec:	000780e7          	jalr	a5
    running->setFinished(true);
    800018f0:	0004b783          	ld	a5,0(s1)
        void setFinished(bool value) { finished = value; }
    800018f4:	00100713          	li	a4,1
    800018f8:	02e78423          	sb	a4,40(a5)
    TCB::yield();
    800018fc:	00000097          	auipc	ra,0x0
    80001900:	fa8080e7          	jalr	-88(ra) # 800018a4 <_ZN3TCB5yieldEv>
}
    80001904:	01813083          	ld	ra,24(sp)
    80001908:	01013403          	ld	s0,16(sp)
    8000190c:	00813483          	ld	s1,8(sp)
    80001910:	02010113          	addi	sp,sp,32
    80001914:	00008067          	ret

0000000080001918 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80001918:	fe010113          	addi	sp,sp,-32
    8000191c:	00113c23          	sd	ra,24(sp)
    80001920:	00813823          	sd	s0,16(sp)
    80001924:	00913423          	sd	s1,8(sp)
    80001928:	02010413          	addi	s0,sp,32
    TCB *old = running;
    8000192c:	00004497          	auipc	s1,0x4
    80001930:	f244b483          	ld	s1,-220(s1) # 80005850 <_ZN3TCB7runningE>
        bool isFinished() const { return finished; }
    80001934:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished()) { Scheduler::put(old); }
    80001938:	02078c63          	beqz	a5,80001970 <_ZN3TCB8dispatchEv+0x58>
    running = Scheduler::get();
    8000193c:	00000097          	auipc	ra,0x0
    80001940:	25c080e7          	jalr	604(ra) # 80001b98 <_ZN9Scheduler3getEv>
    80001944:	00004797          	auipc	a5,0x4
    80001948:	f0a7b623          	sd	a0,-244(a5) # 80005850 <_ZN3TCB7runningE>
    TCB::contextSwitch(&old->context, &running->context);
    8000194c:	01050593          	addi	a1,a0,16 # 2010 <_entry-0x7fffdff0>
    80001950:	01048513          	addi	a0,s1,16
    80001954:	00000097          	auipc	ra,0x0
    80001958:	8bc080e7          	jalr	-1860(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    8000195c:	01813083          	ld	ra,24(sp)
    80001960:	01013403          	ld	s0,16(sp)
    80001964:	00813483          	ld	s1,8(sp)
    80001968:	02010113          	addi	sp,sp,32
    8000196c:	00008067          	ret
    if (!old->isFinished()) { Scheduler::put(old); }
    80001970:	00048513          	mv	a0,s1
    80001974:	00000097          	auipc	ra,0x0
    80001978:	28c080e7          	jalr	652(ra) # 80001c00 <_ZN9Scheduler3putEP3TCB>
    8000197c:	fc1ff06f          	j	8000193c <_ZN3TCB8dispatchEv+0x24>

0000000080001980 <_Znwm>:
//
// Created by os on 4/26/22.
//
#include "../lib/mem.h"

void *operator new(uint64 n) { return __mem_alloc(n); }
    80001980:	ff010113          	addi	sp,sp,-16
    80001984:	00113423          	sd	ra,8(sp)
    80001988:	00813023          	sd	s0,0(sp)
    8000198c:	01010413          	addi	s0,sp,16
    80001990:	00002097          	auipc	ra,0x2
    80001994:	5d8080e7          	jalr	1496(ra) # 80003f68 <__mem_alloc>
    80001998:	00813083          	ld	ra,8(sp)
    8000199c:	00013403          	ld	s0,0(sp)
    800019a0:	01010113          	addi	sp,sp,16
    800019a4:	00008067          	ret

00000000800019a8 <_Znam>:
void *operator new[](uint64 n) { return __mem_alloc(n); }
    800019a8:	ff010113          	addi	sp,sp,-16
    800019ac:	00113423          	sd	ra,8(sp)
    800019b0:	00813023          	sd	s0,0(sp)
    800019b4:	01010413          	addi	s0,sp,16
    800019b8:	00002097          	auipc	ra,0x2
    800019bc:	5b0080e7          	jalr	1456(ra) # 80003f68 <__mem_alloc>
    800019c0:	00813083          	ld	ra,8(sp)
    800019c4:	00013403          	ld	s0,0(sp)
    800019c8:	01010113          	addi	sp,sp,16
    800019cc:	00008067          	ret

00000000800019d0 <_ZdlPv>:

void operator delete(void *p) noexcept { __mem_free(p); }
    800019d0:	ff010113          	addi	sp,sp,-16
    800019d4:	00113423          	sd	ra,8(sp)
    800019d8:	00813023          	sd	s0,0(sp)
    800019dc:	01010413          	addi	s0,sp,16
    800019e0:	00002097          	auipc	ra,0x2
    800019e4:	4bc080e7          	jalr	1212(ra) # 80003e9c <__mem_free>
    800019e8:	00813083          	ld	ra,8(sp)
    800019ec:	00013403          	ld	s0,0(sp)
    800019f0:	01010113          	addi	sp,sp,16
    800019f4:	00008067          	ret

00000000800019f8 <_ZdaPv>:
void operator delete[](void *p) noexcept { __mem_free(p); }
    800019f8:	ff010113          	addi	sp,sp,-16
    800019fc:	00113423          	sd	ra,8(sp)
    80001a00:	00813023          	sd	s0,0(sp)
    80001a04:	01010413          	addi	s0,sp,16
    80001a08:	00002097          	auipc	ra,0x2
    80001a0c:	494080e7          	jalr	1172(ra) # 80003e9c <__mem_free>
    80001a10:	00813083          	ld	ra,8(sp)
    80001a14:	00013403          	ld	s0,0(sp)
    80001a18:	01010113          	addi	sp,sp,16
    80001a1c:	00008067          	ret

0000000080001a20 <_ZN5Riscv10popSppSpieEv>:
//
#include "../h/riscv.hpp"
#include "../h/tcb.hpp"
#include "../lib/console.h"

void Riscv::popSppSpie() {
    80001a20:	ff010113          	addi	sp,sp,-16
    80001a24:	00813423          	sd	s0,8(sp)
    80001a28:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001a2c:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001a30:	10200073          	sret
}
    80001a34:	00813403          	ld	s0,8(sp)
    80001a38:	01010113          	addi	sp,sp,16
    80001a3c:	00008067          	ret

0000000080001a40 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80001a40:	fb010113          	addi	sp,sp,-80
    80001a44:	04113423          	sd	ra,72(sp)
    80001a48:	04813023          	sd	s0,64(sp)
    80001a4c:	02913c23          	sd	s1,56(sp)
    80001a50:	03213823          	sd	s2,48(sp)
    80001a54:	05010413          	addi	s0,sp,80
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001a58:	142027f3          	csrr	a5,scause
    80001a5c:	faf43c23          	sd	a5,-72(s0)
    return scause;
    80001a60:	fb843703          	ld	a4,-72(s0)
    uint64 scause = r_scause();
    if (scause == 0x0000000000000009UL) {
    80001a64:	00900793          	li	a5,9
    80001a68:	02f70e63          	beq	a4,a5,80001aa4 <_ZN5Riscv20handleSupervisorTrapEv+0x64>
        // interrupt: no; cause code: environment call from S-mode(9)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch();
        w_sstatus(sstatus); w_sepc(sepc);
    } else if (scause == 0x8000000000000001UL) {
    80001a6c:	fff00793          	li	a5,-1
    80001a70:	03f79793          	slli	a5,a5,0x3f
    80001a74:	00178793          	addi	a5,a5,1
    80001a78:	06f70463          	beq	a4,a5,80001ae0 <_ZN5Riscv20handleSupervisorTrapEv+0xa0>
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus); w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    } else if (scause == 0x8000000000000009UL) {
    80001a7c:	fff00793          	li	a5,-1
    80001a80:	03f79793          	slli	a5,a5,0x3f
    80001a84:	00978793          	addi	a5,a5,9
    80001a88:	0cf70263          	beq	a4,a5,80001b4c <_ZN5Riscv20handleSupervisorTrapEv+0x10c>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else {
        // unexpected trap cause
    }
}
    80001a8c:	04813083          	ld	ra,72(sp)
    80001a90:	04013403          	ld	s0,64(sp)
    80001a94:	03813483          	ld	s1,56(sp)
    80001a98:	03013903          	ld	s2,48(sp)
    80001a9c:	05010113          	addi	sp,sp,80
    80001aa0:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001aa4:	141027f3          	csrr	a5,sepc
    80001aa8:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80001aac:	fc843483          	ld	s1,-56(s0)
        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80001ab0:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001ab4:	100027f3          	csrr	a5,sstatus
    80001ab8:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80001abc:	fc043903          	ld	s2,-64(s0)
        TCB::timeSliceCounter = 0;
    80001ac0:	00004797          	auipc	a5,0x4
    80001ac4:	d107b783          	ld	a5,-752(a5) # 800057d0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001ac8:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    80001acc:	00000097          	auipc	ra,0x0
    80001ad0:	e4c080e7          	jalr	-436(ra) # 80001918 <_ZN3TCB8dispatchEv>
}
inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001ad4:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001ad8:	14149073          	csrw	sepc,s1
}
    80001adc:	fb1ff06f          	j	80001a8c <_ZN5Riscv20handleSupervisorTrapEv+0x4c>
        TCB::timeSliceCounter++;
    80001ae0:	00004717          	auipc	a4,0x4
    80001ae4:	cf073703          	ld	a4,-784(a4) # 800057d0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001ae8:	00073783          	ld	a5,0(a4)
    80001aec:	00178793          	addi	a5,a5,1
    80001af0:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    80001af4:	00004717          	auipc	a4,0x4
    80001af8:	cf473703          	ld	a4,-780(a4) # 800057e8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001afc:	00073703          	ld	a4,0(a4)
        uint64 getTimeSlice() const { return timeSlice; }
    80001b00:	02073703          	ld	a4,32(a4)
    80001b04:	00e7f863          	bgeu	a5,a4,80001b14 <_ZN5Riscv20handleSupervisorTrapEv+0xd4>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80001b08:	00200793          	li	a5,2
    80001b0c:	1447b073          	csrc	sip,a5
}
    80001b10:	f7dff06f          	j	80001a8c <_ZN5Riscv20handleSupervisorTrapEv+0x4c>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001b14:	141027f3          	csrr	a5,sepc
    80001b18:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80001b1c:	fd843483          	ld	s1,-40(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001b20:	100027f3          	csrr	a5,sstatus
    80001b24:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80001b28:	fd043903          	ld	s2,-48(s0)
            TCB::timeSliceCounter = 0;
    80001b2c:	00004797          	auipc	a5,0x4
    80001b30:	ca47b783          	ld	a5,-860(a5) # 800057d0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001b34:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80001b38:	00000097          	auipc	ra,0x0
    80001b3c:	de0080e7          	jalr	-544(ra) # 80001918 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001b40:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001b44:	14149073          	csrw	sepc,s1
}
    80001b48:	fc1ff06f          	j	80001b08 <_ZN5Riscv20handleSupervisorTrapEv+0xc8>
        console_handler();
    80001b4c:	00002097          	auipc	ra,0x2
    80001b50:	5e8080e7          	jalr	1512(ra) # 80004134 <console_handler>
}
    80001b54:	f39ff06f          	j	80001a8c <_ZN5Riscv20handleSupervisorTrapEv+0x4c>

0000000080001b58 <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyCoroutineQueue.addLast(tcb);
    80001b58:	ff010113          	addi	sp,sp,-16
    80001b5c:	00813423          	sd	s0,8(sp)
    80001b60:	01010413          	addi	s0,sp,16
    80001b64:	00100793          	li	a5,1
    80001b68:	00f50863          	beq	a0,a5,80001b78 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001b6c:	00813403          	ld	s0,8(sp)
    80001b70:	01010113          	addi	sp,sp,16
    80001b74:	00008067          	ret
    80001b78:	000107b7          	lui	a5,0x10
    80001b7c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001b80:	fef596e3          	bne	a1,a5,80001b6c <_Z41__static_initialization_and_destruction_0ii+0x14>
        Elem(T *data, Elem *next) : data(data), next(next){}
    };

    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    80001b84:	00004797          	auipc	a5,0x4
    80001b88:	cdc78793          	addi	a5,a5,-804 # 80005860 <_ZN9Scheduler19readyCoroutineQueueE>
    80001b8c:	0007b023          	sd	zero,0(a5)
    80001b90:	0007b423          	sd	zero,8(a5)
    80001b94:	fd9ff06f          	j	80001b6c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001b98 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80001b98:	fe010113          	addi	sp,sp,-32
    80001b9c:	00113c23          	sd	ra,24(sp)
    80001ba0:	00813823          	sd	s0,16(sp)
    80001ba4:	00913423          	sd	s1,8(sp)
    80001ba8:	02010413          	addi	s0,sp,32
        }else{
            head = tail = elem;
        }
    }
    T *removeFirst(){
        if(!head){ return 0; }
    80001bac:	00004517          	auipc	a0,0x4
    80001bb0:	cb453503          	ld	a0,-844(a0) # 80005860 <_ZN9Scheduler19readyCoroutineQueueE>
    80001bb4:	04050263          	beqz	a0,80001bf8 <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80001bb8:	00853783          	ld	a5,8(a0)
    80001bbc:	00004717          	auipc	a4,0x4
    80001bc0:	caf73223          	sd	a5,-860(a4) # 80005860 <_ZN9Scheduler19readyCoroutineQueueE>
        if(!head){ tail = 0; }
    80001bc4:	02078463          	beqz	a5,80001bec <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80001bc8:	00053483          	ld	s1,0(a0)
        delete elem;
    80001bcc:	00000097          	auipc	ra,0x0
    80001bd0:	e04080e7          	jalr	-508(ra) # 800019d0 <_ZdlPv>
}
    80001bd4:	00048513          	mv	a0,s1
    80001bd8:	01813083          	ld	ra,24(sp)
    80001bdc:	01013403          	ld	s0,16(sp)
    80001be0:	00813483          	ld	s1,8(sp)
    80001be4:	02010113          	addi	sp,sp,32
    80001be8:	00008067          	ret
        if(!head){ tail = 0; }
    80001bec:	00004797          	auipc	a5,0x4
    80001bf0:	c607be23          	sd	zero,-900(a5) # 80005868 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001bf4:	fd5ff06f          	j	80001bc8 <_ZN9Scheduler3getEv+0x30>
        if(!head){ return 0; }
    80001bf8:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    80001bfc:	fd9ff06f          	j	80001bd4 <_ZN9Scheduler3getEv+0x3c>

0000000080001c00 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80001c00:	fe010113          	addi	sp,sp,-32
    80001c04:	00113c23          	sd	ra,24(sp)
    80001c08:	00813823          	sd	s0,16(sp)
    80001c0c:	00913423          	sd	s1,8(sp)
    80001c10:	02010413          	addi	s0,sp,32
    80001c14:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80001c18:	01000513          	li	a0,16
    80001c1c:	00000097          	auipc	ra,0x0
    80001c20:	d64080e7          	jalr	-668(ra) # 80001980 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    80001c24:	00953023          	sd	s1,0(a0)
    80001c28:	00053423          	sd	zero,8(a0)
        if(tail){
    80001c2c:	00004797          	auipc	a5,0x4
    80001c30:	c3c7b783          	ld	a5,-964(a5) # 80005868 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001c34:	02078263          	beqz	a5,80001c58 <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    80001c38:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001c3c:	00004797          	auipc	a5,0x4
    80001c40:	c2a7b623          	sd	a0,-980(a5) # 80005868 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001c44:	01813083          	ld	ra,24(sp)
    80001c48:	01013403          	ld	s0,16(sp)
    80001c4c:	00813483          	ld	s1,8(sp)
    80001c50:	02010113          	addi	sp,sp,32
    80001c54:	00008067          	ret
            head = tail = elem;
    80001c58:	00004797          	auipc	a5,0x4
    80001c5c:	c0878793          	addi	a5,a5,-1016 # 80005860 <_ZN9Scheduler19readyCoroutineQueueE>
    80001c60:	00a7b423          	sd	a0,8(a5)
    80001c64:	00a7b023          	sd	a0,0(a5)
    80001c68:	fddff06f          	j	80001c44 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080001c6c <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80001c6c:	ff010113          	addi	sp,sp,-16
    80001c70:	00113423          	sd	ra,8(sp)
    80001c74:	00813023          	sd	s0,0(sp)
    80001c78:	01010413          	addi	s0,sp,16
    80001c7c:	000105b7          	lui	a1,0x10
    80001c80:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001c84:	00100513          	li	a0,1
    80001c88:	00000097          	auipc	ra,0x0
    80001c8c:	ed0080e7          	jalr	-304(ra) # 80001b58 <_Z41__static_initialization_and_destruction_0ii>
    80001c90:	00813083          	ld	ra,8(sp)
    80001c94:	00013403          	ld	s0,0(sp)
    80001c98:	01010113          	addi	sp,sp,16
    80001c9c:	00008067          	ret

0000000080001ca0 <_ZN15MemoryAllocator9mem_allocEm>:
// Created by os on 5/14/22.
//

#include "../h/MemoryAllocator.hpp"

void* MemoryAllocator::mem_alloc (uint64 size){
    80001ca0:	ff010113          	addi	sp,sp,-16
    80001ca4:	00813423          	sd	s0,8(sp)
    80001ca8:	01010413          	addi	s0,sp,16
    return nullptr;
};
    80001cac:	00000513          	li	a0,0
    80001cb0:	00813403          	ld	s0,8(sp)
    80001cb4:	01010113          	addi	sp,sp,16
    80001cb8:	00008067          	ret

0000000080001cbc <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free (void* mem){
    80001cbc:	ff010113          	addi	sp,sp,-16
    80001cc0:	00813423          	sd	s0,8(sp)
    80001cc4:	01010413          	addi	s0,sp,16
    return 0;
    80001cc8:	00000513          	li	a0,0
    80001ccc:	00813403          	ld	s0,8(sp)
    80001cd0:	01010113          	addi	sp,sp,16
    80001cd4:	00008067          	ret

0000000080001cd8 <_Z11printStringPKc>:
#include "../lib/console.h"
#include "../h/riscv.hpp"


void printString(char const *string)
{
    80001cd8:	fd010113          	addi	sp,sp,-48
    80001cdc:	02113423          	sd	ra,40(sp)
    80001ce0:	02813023          	sd	s0,32(sp)
    80001ce4:	00913c23          	sd	s1,24(sp)
    80001ce8:	01213823          	sd	s2,16(sp)
    80001cec:	03010413          	addi	s0,sp,48
    80001cf0:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001cf4:	100027f3          	csrr	a5,sstatus
    80001cf8:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80001cfc:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001d00:	00200793          	li	a5,2
    80001d04:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    80001d08:	0004c503          	lbu	a0,0(s1)
    80001d0c:	00050a63          	beqz	a0,80001d20 <_Z11printStringPKc+0x48>
    {
        __putc(*string);
    80001d10:	00002097          	auipc	ra,0x2
    80001d14:	3b0080e7          	jalr	944(ra) # 800040c0 <__putc>
        string++;
    80001d18:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001d1c:	fedff06f          	j	80001d08 <_Z11printStringPKc+0x30>
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80001d20:	0009091b          	sext.w	s2,s2
    80001d24:	00297913          	andi	s2,s2,2
    80001d28:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001d2c:	10092073          	csrs	sstatus,s2
}
    80001d30:	02813083          	ld	ra,40(sp)
    80001d34:	02013403          	ld	s0,32(sp)
    80001d38:	01813483          	ld	s1,24(sp)
    80001d3c:	01013903          	ld	s2,16(sp)
    80001d40:	03010113          	addi	sp,sp,48
    80001d44:	00008067          	ret

0000000080001d48 <_Z12printIntegerm>:


void printInteger(uint64 integer){
    80001d48:	fd010113          	addi	sp,sp,-48
    80001d4c:	02113423          	sd	ra,40(sp)
    80001d50:	02813023          	sd	s0,32(sp)
    80001d54:	00913c23          	sd	s1,24(sp)
    80001d58:	03010413          	addi	s0,sp,48
    neg = 0;
    if(integer < 0){
        neg = 1;
        x = -integer;
    }else{
        x = integer;
    80001d5c:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80001d60:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x%10];
    80001d64:	00a00613          	li	a2,10
    80001d68:	02c5773b          	remuw	a4,a0,a2
    80001d6c:	02071693          	slli	a3,a4,0x20
    80001d70:	0206d693          	srli	a3,a3,0x20
    80001d74:	00003717          	auipc	a4,0x3
    80001d78:	36470713          	addi	a4,a4,868 # 800050d8 <_ZZ12printIntegermE6digits>
    80001d7c:	00d70733          	add	a4,a4,a3
    80001d80:	00074703          	lbu	a4,0(a4)
    80001d84:	fe040693          	addi	a3,s0,-32
    80001d88:	009687b3          	add	a5,a3,s1
    80001d8c:	0014849b          	addiw	s1,s1,1
    80001d90:	fee78823          	sb	a4,-16(a5)
    }while((x /= 10) != 0);
    80001d94:	0005071b          	sext.w	a4,a0
    80001d98:	02c5553b          	divuw	a0,a0,a2
    80001d9c:	00900793          	li	a5,9
    80001da0:	fce7e2e3          	bltu	a5,a4,80001d64 <_Z12printIntegerm+0x1c>
    if(neg){
        buf[i++] = '-';
    }
    while(--i >= 0)
    80001da4:	fff4849b          	addiw	s1,s1,-1
    80001da8:	0004ce63          	bltz	s1,80001dc4 <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    80001dac:	fe040793          	addi	a5,s0,-32
    80001db0:	009787b3          	add	a5,a5,s1
    80001db4:	ff07c503          	lbu	a0,-16(a5)
    80001db8:	00002097          	auipc	ra,0x2
    80001dbc:	308080e7          	jalr	776(ra) # 800040c0 <__putc>
    80001dc0:	fe5ff06f          	j	80001da4 <_Z12printIntegerm+0x5c>
    80001dc4:	02813083          	ld	ra,40(sp)
    80001dc8:	02013403          	ld	s0,32(sp)
    80001dcc:	01813483          	ld	s1,24(sp)
    80001dd0:	03010113          	addi	sp,sp,48
    80001dd4:	00008067          	ret

0000000080001dd8 <start>:
    80001dd8:	ff010113          	addi	sp,sp,-16
    80001ddc:	00813423          	sd	s0,8(sp)
    80001de0:	01010413          	addi	s0,sp,16
    80001de4:	300027f3          	csrr	a5,mstatus
    80001de8:	ffffe737          	lui	a4,0xffffe
    80001dec:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7d1f>
    80001df0:	00e7f7b3          	and	a5,a5,a4
    80001df4:	00001737          	lui	a4,0x1
    80001df8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001dfc:	00e7e7b3          	or	a5,a5,a4
    80001e00:	30079073          	csrw	mstatus,a5
    80001e04:	00000797          	auipc	a5,0x0
    80001e08:	16078793          	addi	a5,a5,352 # 80001f64 <system_main>
    80001e0c:	34179073          	csrw	mepc,a5
    80001e10:	00000793          	li	a5,0
    80001e14:	18079073          	csrw	satp,a5
    80001e18:	000107b7          	lui	a5,0x10
    80001e1c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001e20:	30279073          	csrw	medeleg,a5
    80001e24:	30379073          	csrw	mideleg,a5
    80001e28:	104027f3          	csrr	a5,sie
    80001e2c:	2227e793          	ori	a5,a5,546
    80001e30:	10479073          	csrw	sie,a5
    80001e34:	fff00793          	li	a5,-1
    80001e38:	00a7d793          	srli	a5,a5,0xa
    80001e3c:	3b079073          	csrw	pmpaddr0,a5
    80001e40:	00f00793          	li	a5,15
    80001e44:	3a079073          	csrw	pmpcfg0,a5
    80001e48:	f14027f3          	csrr	a5,mhartid
    80001e4c:	0200c737          	lui	a4,0x200c
    80001e50:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001e54:	0007869b          	sext.w	a3,a5
    80001e58:	00269713          	slli	a4,a3,0x2
    80001e5c:	000f4637          	lui	a2,0xf4
    80001e60:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001e64:	00d70733          	add	a4,a4,a3
    80001e68:	0037979b          	slliw	a5,a5,0x3
    80001e6c:	020046b7          	lui	a3,0x2004
    80001e70:	00d787b3          	add	a5,a5,a3
    80001e74:	00c585b3          	add	a1,a1,a2
    80001e78:	00371693          	slli	a3,a4,0x3
    80001e7c:	00004717          	auipc	a4,0x4
    80001e80:	9f470713          	addi	a4,a4,-1548 # 80005870 <timer_scratch>
    80001e84:	00b7b023          	sd	a1,0(a5)
    80001e88:	00d70733          	add	a4,a4,a3
    80001e8c:	00f73c23          	sd	a5,24(a4)
    80001e90:	02c73023          	sd	a2,32(a4)
    80001e94:	34071073          	csrw	mscratch,a4
    80001e98:	00000797          	auipc	a5,0x0
    80001e9c:	6e878793          	addi	a5,a5,1768 # 80002580 <timervec>
    80001ea0:	30579073          	csrw	mtvec,a5
    80001ea4:	300027f3          	csrr	a5,mstatus
    80001ea8:	0087e793          	ori	a5,a5,8
    80001eac:	30079073          	csrw	mstatus,a5
    80001eb0:	304027f3          	csrr	a5,mie
    80001eb4:	0807e793          	ori	a5,a5,128
    80001eb8:	30479073          	csrw	mie,a5
    80001ebc:	f14027f3          	csrr	a5,mhartid
    80001ec0:	0007879b          	sext.w	a5,a5
    80001ec4:	00078213          	mv	tp,a5
    80001ec8:	30200073          	mret
    80001ecc:	00813403          	ld	s0,8(sp)
    80001ed0:	01010113          	addi	sp,sp,16
    80001ed4:	00008067          	ret

0000000080001ed8 <timerinit>:
    80001ed8:	ff010113          	addi	sp,sp,-16
    80001edc:	00813423          	sd	s0,8(sp)
    80001ee0:	01010413          	addi	s0,sp,16
    80001ee4:	f14027f3          	csrr	a5,mhartid
    80001ee8:	0200c737          	lui	a4,0x200c
    80001eec:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001ef0:	0007869b          	sext.w	a3,a5
    80001ef4:	00269713          	slli	a4,a3,0x2
    80001ef8:	000f4637          	lui	a2,0xf4
    80001efc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001f00:	00d70733          	add	a4,a4,a3
    80001f04:	0037979b          	slliw	a5,a5,0x3
    80001f08:	020046b7          	lui	a3,0x2004
    80001f0c:	00d787b3          	add	a5,a5,a3
    80001f10:	00c585b3          	add	a1,a1,a2
    80001f14:	00371693          	slli	a3,a4,0x3
    80001f18:	00004717          	auipc	a4,0x4
    80001f1c:	95870713          	addi	a4,a4,-1704 # 80005870 <timer_scratch>
    80001f20:	00b7b023          	sd	a1,0(a5)
    80001f24:	00d70733          	add	a4,a4,a3
    80001f28:	00f73c23          	sd	a5,24(a4)
    80001f2c:	02c73023          	sd	a2,32(a4)
    80001f30:	34071073          	csrw	mscratch,a4
    80001f34:	00000797          	auipc	a5,0x0
    80001f38:	64c78793          	addi	a5,a5,1612 # 80002580 <timervec>
    80001f3c:	30579073          	csrw	mtvec,a5
    80001f40:	300027f3          	csrr	a5,mstatus
    80001f44:	0087e793          	ori	a5,a5,8
    80001f48:	30079073          	csrw	mstatus,a5
    80001f4c:	304027f3          	csrr	a5,mie
    80001f50:	0807e793          	ori	a5,a5,128
    80001f54:	30479073          	csrw	mie,a5
    80001f58:	00813403          	ld	s0,8(sp)
    80001f5c:	01010113          	addi	sp,sp,16
    80001f60:	00008067          	ret

0000000080001f64 <system_main>:
    80001f64:	fe010113          	addi	sp,sp,-32
    80001f68:	00813823          	sd	s0,16(sp)
    80001f6c:	00913423          	sd	s1,8(sp)
    80001f70:	00113c23          	sd	ra,24(sp)
    80001f74:	02010413          	addi	s0,sp,32
    80001f78:	00000097          	auipc	ra,0x0
    80001f7c:	0c4080e7          	jalr	196(ra) # 8000203c <cpuid>
    80001f80:	00004497          	auipc	s1,0x4
    80001f84:	8a048493          	addi	s1,s1,-1888 # 80005820 <started>
    80001f88:	02050263          	beqz	a0,80001fac <system_main+0x48>
    80001f8c:	0004a783          	lw	a5,0(s1)
    80001f90:	0007879b          	sext.w	a5,a5
    80001f94:	fe078ce3          	beqz	a5,80001f8c <system_main+0x28>
    80001f98:	0ff0000f          	fence
    80001f9c:	00003517          	auipc	a0,0x3
    80001fa0:	17c50513          	addi	a0,a0,380 # 80005118 <_ZZ12printIntegermE6digits+0x40>
    80001fa4:	00001097          	auipc	ra,0x1
    80001fa8:	a78080e7          	jalr	-1416(ra) # 80002a1c <panic>
    80001fac:	00001097          	auipc	ra,0x1
    80001fb0:	9cc080e7          	jalr	-1588(ra) # 80002978 <consoleinit>
    80001fb4:	00001097          	auipc	ra,0x1
    80001fb8:	158080e7          	jalr	344(ra) # 8000310c <printfinit>
    80001fbc:	00003517          	auipc	a0,0x3
    80001fc0:	11450513          	addi	a0,a0,276 # 800050d0 <kvmincrease+0xef0>
    80001fc4:	00001097          	auipc	ra,0x1
    80001fc8:	ab4080e7          	jalr	-1356(ra) # 80002a78 <__printf>
    80001fcc:	00003517          	auipc	a0,0x3
    80001fd0:	11c50513          	addi	a0,a0,284 # 800050e8 <_ZZ12printIntegermE6digits+0x10>
    80001fd4:	00001097          	auipc	ra,0x1
    80001fd8:	aa4080e7          	jalr	-1372(ra) # 80002a78 <__printf>
    80001fdc:	00003517          	auipc	a0,0x3
    80001fe0:	0f450513          	addi	a0,a0,244 # 800050d0 <kvmincrease+0xef0>
    80001fe4:	00001097          	auipc	ra,0x1
    80001fe8:	a94080e7          	jalr	-1388(ra) # 80002a78 <__printf>
    80001fec:	00001097          	auipc	ra,0x1
    80001ff0:	4ac080e7          	jalr	1196(ra) # 80003498 <kinit>
    80001ff4:	00000097          	auipc	ra,0x0
    80001ff8:	148080e7          	jalr	328(ra) # 8000213c <trapinit>
    80001ffc:	00000097          	auipc	ra,0x0
    80002000:	16c080e7          	jalr	364(ra) # 80002168 <trapinithart>
    80002004:	00000097          	auipc	ra,0x0
    80002008:	5bc080e7          	jalr	1468(ra) # 800025c0 <plicinit>
    8000200c:	00000097          	auipc	ra,0x0
    80002010:	5dc080e7          	jalr	1500(ra) # 800025e8 <plicinithart>
    80002014:	00000097          	auipc	ra,0x0
    80002018:	078080e7          	jalr	120(ra) # 8000208c <userinit>
    8000201c:	0ff0000f          	fence
    80002020:	00100793          	li	a5,1
    80002024:	00003517          	auipc	a0,0x3
    80002028:	0dc50513          	addi	a0,a0,220 # 80005100 <_ZZ12printIntegermE6digits+0x28>
    8000202c:	00f4a023          	sw	a5,0(s1)
    80002030:	00001097          	auipc	ra,0x1
    80002034:	a48080e7          	jalr	-1464(ra) # 80002a78 <__printf>
    80002038:	0000006f          	j	80002038 <system_main+0xd4>

000000008000203c <cpuid>:
    8000203c:	ff010113          	addi	sp,sp,-16
    80002040:	00813423          	sd	s0,8(sp)
    80002044:	01010413          	addi	s0,sp,16
    80002048:	00020513          	mv	a0,tp
    8000204c:	00813403          	ld	s0,8(sp)
    80002050:	0005051b          	sext.w	a0,a0
    80002054:	01010113          	addi	sp,sp,16
    80002058:	00008067          	ret

000000008000205c <mycpu>:
    8000205c:	ff010113          	addi	sp,sp,-16
    80002060:	00813423          	sd	s0,8(sp)
    80002064:	01010413          	addi	s0,sp,16
    80002068:	00020793          	mv	a5,tp
    8000206c:	00813403          	ld	s0,8(sp)
    80002070:	0007879b          	sext.w	a5,a5
    80002074:	00779793          	slli	a5,a5,0x7
    80002078:	00005517          	auipc	a0,0x5
    8000207c:	82850513          	addi	a0,a0,-2008 # 800068a0 <cpus>
    80002080:	00f50533          	add	a0,a0,a5
    80002084:	01010113          	addi	sp,sp,16
    80002088:	00008067          	ret

000000008000208c <userinit>:
    8000208c:	ff010113          	addi	sp,sp,-16
    80002090:	00813423          	sd	s0,8(sp)
    80002094:	01010413          	addi	s0,sp,16
    80002098:	00813403          	ld	s0,8(sp)
    8000209c:	01010113          	addi	sp,sp,16
    800020a0:	fffff317          	auipc	t1,0xfffff
    800020a4:	57030067          	jr	1392(t1) # 80001610 <main>

00000000800020a8 <either_copyout>:
    800020a8:	ff010113          	addi	sp,sp,-16
    800020ac:	00813023          	sd	s0,0(sp)
    800020b0:	00113423          	sd	ra,8(sp)
    800020b4:	01010413          	addi	s0,sp,16
    800020b8:	02051663          	bnez	a0,800020e4 <either_copyout+0x3c>
    800020bc:	00058513          	mv	a0,a1
    800020c0:	00060593          	mv	a1,a2
    800020c4:	0006861b          	sext.w	a2,a3
    800020c8:	00002097          	auipc	ra,0x2
    800020cc:	c5c080e7          	jalr	-932(ra) # 80003d24 <__memmove>
    800020d0:	00813083          	ld	ra,8(sp)
    800020d4:	00013403          	ld	s0,0(sp)
    800020d8:	00000513          	li	a0,0
    800020dc:	01010113          	addi	sp,sp,16
    800020e0:	00008067          	ret
    800020e4:	00003517          	auipc	a0,0x3
    800020e8:	05c50513          	addi	a0,a0,92 # 80005140 <_ZZ12printIntegermE6digits+0x68>
    800020ec:	00001097          	auipc	ra,0x1
    800020f0:	930080e7          	jalr	-1744(ra) # 80002a1c <panic>

00000000800020f4 <either_copyin>:
    800020f4:	ff010113          	addi	sp,sp,-16
    800020f8:	00813023          	sd	s0,0(sp)
    800020fc:	00113423          	sd	ra,8(sp)
    80002100:	01010413          	addi	s0,sp,16
    80002104:	02059463          	bnez	a1,8000212c <either_copyin+0x38>
    80002108:	00060593          	mv	a1,a2
    8000210c:	0006861b          	sext.w	a2,a3
    80002110:	00002097          	auipc	ra,0x2
    80002114:	c14080e7          	jalr	-1004(ra) # 80003d24 <__memmove>
    80002118:	00813083          	ld	ra,8(sp)
    8000211c:	00013403          	ld	s0,0(sp)
    80002120:	00000513          	li	a0,0
    80002124:	01010113          	addi	sp,sp,16
    80002128:	00008067          	ret
    8000212c:	00003517          	auipc	a0,0x3
    80002130:	03c50513          	addi	a0,a0,60 # 80005168 <_ZZ12printIntegermE6digits+0x90>
    80002134:	00001097          	auipc	ra,0x1
    80002138:	8e8080e7          	jalr	-1816(ra) # 80002a1c <panic>

000000008000213c <trapinit>:
    8000213c:	ff010113          	addi	sp,sp,-16
    80002140:	00813423          	sd	s0,8(sp)
    80002144:	01010413          	addi	s0,sp,16
    80002148:	00813403          	ld	s0,8(sp)
    8000214c:	00003597          	auipc	a1,0x3
    80002150:	04458593          	addi	a1,a1,68 # 80005190 <_ZZ12printIntegermE6digits+0xb8>
    80002154:	00004517          	auipc	a0,0x4
    80002158:	7cc50513          	addi	a0,a0,1996 # 80006920 <tickslock>
    8000215c:	01010113          	addi	sp,sp,16
    80002160:	00001317          	auipc	t1,0x1
    80002164:	5c830067          	jr	1480(t1) # 80003728 <initlock>

0000000080002168 <trapinithart>:
    80002168:	ff010113          	addi	sp,sp,-16
    8000216c:	00813423          	sd	s0,8(sp)
    80002170:	01010413          	addi	s0,sp,16
    80002174:	00000797          	auipc	a5,0x0
    80002178:	2fc78793          	addi	a5,a5,764 # 80002470 <kernelvec>
    8000217c:	10579073          	csrw	stvec,a5
    80002180:	00813403          	ld	s0,8(sp)
    80002184:	01010113          	addi	sp,sp,16
    80002188:	00008067          	ret

000000008000218c <usertrap>:
    8000218c:	ff010113          	addi	sp,sp,-16
    80002190:	00813423          	sd	s0,8(sp)
    80002194:	01010413          	addi	s0,sp,16
    80002198:	00813403          	ld	s0,8(sp)
    8000219c:	01010113          	addi	sp,sp,16
    800021a0:	00008067          	ret

00000000800021a4 <usertrapret>:
    800021a4:	ff010113          	addi	sp,sp,-16
    800021a8:	00813423          	sd	s0,8(sp)
    800021ac:	01010413          	addi	s0,sp,16
    800021b0:	00813403          	ld	s0,8(sp)
    800021b4:	01010113          	addi	sp,sp,16
    800021b8:	00008067          	ret

00000000800021bc <kerneltrap>:
    800021bc:	fe010113          	addi	sp,sp,-32
    800021c0:	00813823          	sd	s0,16(sp)
    800021c4:	00113c23          	sd	ra,24(sp)
    800021c8:	00913423          	sd	s1,8(sp)
    800021cc:	02010413          	addi	s0,sp,32
    800021d0:	142025f3          	csrr	a1,scause
    800021d4:	100027f3          	csrr	a5,sstatus
    800021d8:	0027f793          	andi	a5,a5,2
    800021dc:	10079c63          	bnez	a5,800022f4 <kerneltrap+0x138>
    800021e0:	142027f3          	csrr	a5,scause
    800021e4:	0207ce63          	bltz	a5,80002220 <kerneltrap+0x64>
    800021e8:	00003517          	auipc	a0,0x3
    800021ec:	ff050513          	addi	a0,a0,-16 # 800051d8 <_ZZ12printIntegermE6digits+0x100>
    800021f0:	00001097          	auipc	ra,0x1
    800021f4:	888080e7          	jalr	-1912(ra) # 80002a78 <__printf>
    800021f8:	141025f3          	csrr	a1,sepc
    800021fc:	14302673          	csrr	a2,stval
    80002200:	00003517          	auipc	a0,0x3
    80002204:	fe850513          	addi	a0,a0,-24 # 800051e8 <_ZZ12printIntegermE6digits+0x110>
    80002208:	00001097          	auipc	ra,0x1
    8000220c:	870080e7          	jalr	-1936(ra) # 80002a78 <__printf>
    80002210:	00003517          	auipc	a0,0x3
    80002214:	ff050513          	addi	a0,a0,-16 # 80005200 <_ZZ12printIntegermE6digits+0x128>
    80002218:	00001097          	auipc	ra,0x1
    8000221c:	804080e7          	jalr	-2044(ra) # 80002a1c <panic>
    80002220:	0ff7f713          	andi	a4,a5,255
    80002224:	00900693          	li	a3,9
    80002228:	04d70063          	beq	a4,a3,80002268 <kerneltrap+0xac>
    8000222c:	fff00713          	li	a4,-1
    80002230:	03f71713          	slli	a4,a4,0x3f
    80002234:	00170713          	addi	a4,a4,1
    80002238:	fae798e3          	bne	a5,a4,800021e8 <kerneltrap+0x2c>
    8000223c:	00000097          	auipc	ra,0x0
    80002240:	e00080e7          	jalr	-512(ra) # 8000203c <cpuid>
    80002244:	06050663          	beqz	a0,800022b0 <kerneltrap+0xf4>
    80002248:	144027f3          	csrr	a5,sip
    8000224c:	ffd7f793          	andi	a5,a5,-3
    80002250:	14479073          	csrw	sip,a5
    80002254:	01813083          	ld	ra,24(sp)
    80002258:	01013403          	ld	s0,16(sp)
    8000225c:	00813483          	ld	s1,8(sp)
    80002260:	02010113          	addi	sp,sp,32
    80002264:	00008067          	ret
    80002268:	00000097          	auipc	ra,0x0
    8000226c:	3cc080e7          	jalr	972(ra) # 80002634 <plic_claim>
    80002270:	00a00793          	li	a5,10
    80002274:	00050493          	mv	s1,a0
    80002278:	06f50863          	beq	a0,a5,800022e8 <kerneltrap+0x12c>
    8000227c:	fc050ce3          	beqz	a0,80002254 <kerneltrap+0x98>
    80002280:	00050593          	mv	a1,a0
    80002284:	00003517          	auipc	a0,0x3
    80002288:	f3450513          	addi	a0,a0,-204 # 800051b8 <_ZZ12printIntegermE6digits+0xe0>
    8000228c:	00000097          	auipc	ra,0x0
    80002290:	7ec080e7          	jalr	2028(ra) # 80002a78 <__printf>
    80002294:	01013403          	ld	s0,16(sp)
    80002298:	01813083          	ld	ra,24(sp)
    8000229c:	00048513          	mv	a0,s1
    800022a0:	00813483          	ld	s1,8(sp)
    800022a4:	02010113          	addi	sp,sp,32
    800022a8:	00000317          	auipc	t1,0x0
    800022ac:	3c430067          	jr	964(t1) # 8000266c <plic_complete>
    800022b0:	00004517          	auipc	a0,0x4
    800022b4:	67050513          	addi	a0,a0,1648 # 80006920 <tickslock>
    800022b8:	00001097          	auipc	ra,0x1
    800022bc:	494080e7          	jalr	1172(ra) # 8000374c <acquire>
    800022c0:	00003717          	auipc	a4,0x3
    800022c4:	56470713          	addi	a4,a4,1380 # 80005824 <ticks>
    800022c8:	00072783          	lw	a5,0(a4)
    800022cc:	00004517          	auipc	a0,0x4
    800022d0:	65450513          	addi	a0,a0,1620 # 80006920 <tickslock>
    800022d4:	0017879b          	addiw	a5,a5,1
    800022d8:	00f72023          	sw	a5,0(a4)
    800022dc:	00001097          	auipc	ra,0x1
    800022e0:	53c080e7          	jalr	1340(ra) # 80003818 <release>
    800022e4:	f65ff06f          	j	80002248 <kerneltrap+0x8c>
    800022e8:	00001097          	auipc	ra,0x1
    800022ec:	098080e7          	jalr	152(ra) # 80003380 <uartintr>
    800022f0:	fa5ff06f          	j	80002294 <kerneltrap+0xd8>
    800022f4:	00003517          	auipc	a0,0x3
    800022f8:	ea450513          	addi	a0,a0,-348 # 80005198 <_ZZ12printIntegermE6digits+0xc0>
    800022fc:	00000097          	auipc	ra,0x0
    80002300:	720080e7          	jalr	1824(ra) # 80002a1c <panic>

0000000080002304 <clockintr>:
    80002304:	fe010113          	addi	sp,sp,-32
    80002308:	00813823          	sd	s0,16(sp)
    8000230c:	00913423          	sd	s1,8(sp)
    80002310:	00113c23          	sd	ra,24(sp)
    80002314:	02010413          	addi	s0,sp,32
    80002318:	00004497          	auipc	s1,0x4
    8000231c:	60848493          	addi	s1,s1,1544 # 80006920 <tickslock>
    80002320:	00048513          	mv	a0,s1
    80002324:	00001097          	auipc	ra,0x1
    80002328:	428080e7          	jalr	1064(ra) # 8000374c <acquire>
    8000232c:	00003717          	auipc	a4,0x3
    80002330:	4f870713          	addi	a4,a4,1272 # 80005824 <ticks>
    80002334:	00072783          	lw	a5,0(a4)
    80002338:	01013403          	ld	s0,16(sp)
    8000233c:	01813083          	ld	ra,24(sp)
    80002340:	00048513          	mv	a0,s1
    80002344:	0017879b          	addiw	a5,a5,1
    80002348:	00813483          	ld	s1,8(sp)
    8000234c:	00f72023          	sw	a5,0(a4)
    80002350:	02010113          	addi	sp,sp,32
    80002354:	00001317          	auipc	t1,0x1
    80002358:	4c430067          	jr	1220(t1) # 80003818 <release>

000000008000235c <devintr>:
    8000235c:	142027f3          	csrr	a5,scause
    80002360:	00000513          	li	a0,0
    80002364:	0007c463          	bltz	a5,8000236c <devintr+0x10>
    80002368:	00008067          	ret
    8000236c:	fe010113          	addi	sp,sp,-32
    80002370:	00813823          	sd	s0,16(sp)
    80002374:	00113c23          	sd	ra,24(sp)
    80002378:	00913423          	sd	s1,8(sp)
    8000237c:	02010413          	addi	s0,sp,32
    80002380:	0ff7f713          	andi	a4,a5,255
    80002384:	00900693          	li	a3,9
    80002388:	04d70c63          	beq	a4,a3,800023e0 <devintr+0x84>
    8000238c:	fff00713          	li	a4,-1
    80002390:	03f71713          	slli	a4,a4,0x3f
    80002394:	00170713          	addi	a4,a4,1
    80002398:	00e78c63          	beq	a5,a4,800023b0 <devintr+0x54>
    8000239c:	01813083          	ld	ra,24(sp)
    800023a0:	01013403          	ld	s0,16(sp)
    800023a4:	00813483          	ld	s1,8(sp)
    800023a8:	02010113          	addi	sp,sp,32
    800023ac:	00008067          	ret
    800023b0:	00000097          	auipc	ra,0x0
    800023b4:	c8c080e7          	jalr	-884(ra) # 8000203c <cpuid>
    800023b8:	06050663          	beqz	a0,80002424 <devintr+0xc8>
    800023bc:	144027f3          	csrr	a5,sip
    800023c0:	ffd7f793          	andi	a5,a5,-3
    800023c4:	14479073          	csrw	sip,a5
    800023c8:	01813083          	ld	ra,24(sp)
    800023cc:	01013403          	ld	s0,16(sp)
    800023d0:	00813483          	ld	s1,8(sp)
    800023d4:	00200513          	li	a0,2
    800023d8:	02010113          	addi	sp,sp,32
    800023dc:	00008067          	ret
    800023e0:	00000097          	auipc	ra,0x0
    800023e4:	254080e7          	jalr	596(ra) # 80002634 <plic_claim>
    800023e8:	00a00793          	li	a5,10
    800023ec:	00050493          	mv	s1,a0
    800023f0:	06f50663          	beq	a0,a5,8000245c <devintr+0x100>
    800023f4:	00100513          	li	a0,1
    800023f8:	fa0482e3          	beqz	s1,8000239c <devintr+0x40>
    800023fc:	00048593          	mv	a1,s1
    80002400:	00003517          	auipc	a0,0x3
    80002404:	db850513          	addi	a0,a0,-584 # 800051b8 <_ZZ12printIntegermE6digits+0xe0>
    80002408:	00000097          	auipc	ra,0x0
    8000240c:	670080e7          	jalr	1648(ra) # 80002a78 <__printf>
    80002410:	00048513          	mv	a0,s1
    80002414:	00000097          	auipc	ra,0x0
    80002418:	258080e7          	jalr	600(ra) # 8000266c <plic_complete>
    8000241c:	00100513          	li	a0,1
    80002420:	f7dff06f          	j	8000239c <devintr+0x40>
    80002424:	00004517          	auipc	a0,0x4
    80002428:	4fc50513          	addi	a0,a0,1276 # 80006920 <tickslock>
    8000242c:	00001097          	auipc	ra,0x1
    80002430:	320080e7          	jalr	800(ra) # 8000374c <acquire>
    80002434:	00003717          	auipc	a4,0x3
    80002438:	3f070713          	addi	a4,a4,1008 # 80005824 <ticks>
    8000243c:	00072783          	lw	a5,0(a4)
    80002440:	00004517          	auipc	a0,0x4
    80002444:	4e050513          	addi	a0,a0,1248 # 80006920 <tickslock>
    80002448:	0017879b          	addiw	a5,a5,1
    8000244c:	00f72023          	sw	a5,0(a4)
    80002450:	00001097          	auipc	ra,0x1
    80002454:	3c8080e7          	jalr	968(ra) # 80003818 <release>
    80002458:	f65ff06f          	j	800023bc <devintr+0x60>
    8000245c:	00001097          	auipc	ra,0x1
    80002460:	f24080e7          	jalr	-220(ra) # 80003380 <uartintr>
    80002464:	fadff06f          	j	80002410 <devintr+0xb4>
	...

0000000080002470 <kernelvec>:
    80002470:	f0010113          	addi	sp,sp,-256
    80002474:	00113023          	sd	ra,0(sp)
    80002478:	00213423          	sd	sp,8(sp)
    8000247c:	00313823          	sd	gp,16(sp)
    80002480:	00413c23          	sd	tp,24(sp)
    80002484:	02513023          	sd	t0,32(sp)
    80002488:	02613423          	sd	t1,40(sp)
    8000248c:	02713823          	sd	t2,48(sp)
    80002490:	02813c23          	sd	s0,56(sp)
    80002494:	04913023          	sd	s1,64(sp)
    80002498:	04a13423          	sd	a0,72(sp)
    8000249c:	04b13823          	sd	a1,80(sp)
    800024a0:	04c13c23          	sd	a2,88(sp)
    800024a4:	06d13023          	sd	a3,96(sp)
    800024a8:	06e13423          	sd	a4,104(sp)
    800024ac:	06f13823          	sd	a5,112(sp)
    800024b0:	07013c23          	sd	a6,120(sp)
    800024b4:	09113023          	sd	a7,128(sp)
    800024b8:	09213423          	sd	s2,136(sp)
    800024bc:	09313823          	sd	s3,144(sp)
    800024c0:	09413c23          	sd	s4,152(sp)
    800024c4:	0b513023          	sd	s5,160(sp)
    800024c8:	0b613423          	sd	s6,168(sp)
    800024cc:	0b713823          	sd	s7,176(sp)
    800024d0:	0b813c23          	sd	s8,184(sp)
    800024d4:	0d913023          	sd	s9,192(sp)
    800024d8:	0da13423          	sd	s10,200(sp)
    800024dc:	0db13823          	sd	s11,208(sp)
    800024e0:	0dc13c23          	sd	t3,216(sp)
    800024e4:	0fd13023          	sd	t4,224(sp)
    800024e8:	0fe13423          	sd	t5,232(sp)
    800024ec:	0ff13823          	sd	t6,240(sp)
    800024f0:	ccdff0ef          	jal	ra,800021bc <kerneltrap>
    800024f4:	00013083          	ld	ra,0(sp)
    800024f8:	00813103          	ld	sp,8(sp)
    800024fc:	01013183          	ld	gp,16(sp)
    80002500:	02013283          	ld	t0,32(sp)
    80002504:	02813303          	ld	t1,40(sp)
    80002508:	03013383          	ld	t2,48(sp)
    8000250c:	03813403          	ld	s0,56(sp)
    80002510:	04013483          	ld	s1,64(sp)
    80002514:	04813503          	ld	a0,72(sp)
    80002518:	05013583          	ld	a1,80(sp)
    8000251c:	05813603          	ld	a2,88(sp)
    80002520:	06013683          	ld	a3,96(sp)
    80002524:	06813703          	ld	a4,104(sp)
    80002528:	07013783          	ld	a5,112(sp)
    8000252c:	07813803          	ld	a6,120(sp)
    80002530:	08013883          	ld	a7,128(sp)
    80002534:	08813903          	ld	s2,136(sp)
    80002538:	09013983          	ld	s3,144(sp)
    8000253c:	09813a03          	ld	s4,152(sp)
    80002540:	0a013a83          	ld	s5,160(sp)
    80002544:	0a813b03          	ld	s6,168(sp)
    80002548:	0b013b83          	ld	s7,176(sp)
    8000254c:	0b813c03          	ld	s8,184(sp)
    80002550:	0c013c83          	ld	s9,192(sp)
    80002554:	0c813d03          	ld	s10,200(sp)
    80002558:	0d013d83          	ld	s11,208(sp)
    8000255c:	0d813e03          	ld	t3,216(sp)
    80002560:	0e013e83          	ld	t4,224(sp)
    80002564:	0e813f03          	ld	t5,232(sp)
    80002568:	0f013f83          	ld	t6,240(sp)
    8000256c:	10010113          	addi	sp,sp,256
    80002570:	10200073          	sret
    80002574:	00000013          	nop
    80002578:	00000013          	nop
    8000257c:	00000013          	nop

0000000080002580 <timervec>:
    80002580:	34051573          	csrrw	a0,mscratch,a0
    80002584:	00b53023          	sd	a1,0(a0)
    80002588:	00c53423          	sd	a2,8(a0)
    8000258c:	00d53823          	sd	a3,16(a0)
    80002590:	01853583          	ld	a1,24(a0)
    80002594:	02053603          	ld	a2,32(a0)
    80002598:	0005b683          	ld	a3,0(a1)
    8000259c:	00c686b3          	add	a3,a3,a2
    800025a0:	00d5b023          	sd	a3,0(a1)
    800025a4:	00200593          	li	a1,2
    800025a8:	14459073          	csrw	sip,a1
    800025ac:	01053683          	ld	a3,16(a0)
    800025b0:	00853603          	ld	a2,8(a0)
    800025b4:	00053583          	ld	a1,0(a0)
    800025b8:	34051573          	csrrw	a0,mscratch,a0
    800025bc:	30200073          	mret

00000000800025c0 <plicinit>:
    800025c0:	ff010113          	addi	sp,sp,-16
    800025c4:	00813423          	sd	s0,8(sp)
    800025c8:	01010413          	addi	s0,sp,16
    800025cc:	00813403          	ld	s0,8(sp)
    800025d0:	0c0007b7          	lui	a5,0xc000
    800025d4:	00100713          	li	a4,1
    800025d8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800025dc:	00e7a223          	sw	a4,4(a5)
    800025e0:	01010113          	addi	sp,sp,16
    800025e4:	00008067          	ret

00000000800025e8 <plicinithart>:
    800025e8:	ff010113          	addi	sp,sp,-16
    800025ec:	00813023          	sd	s0,0(sp)
    800025f0:	00113423          	sd	ra,8(sp)
    800025f4:	01010413          	addi	s0,sp,16
    800025f8:	00000097          	auipc	ra,0x0
    800025fc:	a44080e7          	jalr	-1468(ra) # 8000203c <cpuid>
    80002600:	0085171b          	slliw	a4,a0,0x8
    80002604:	0c0027b7          	lui	a5,0xc002
    80002608:	00e787b3          	add	a5,a5,a4
    8000260c:	40200713          	li	a4,1026
    80002610:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002614:	00813083          	ld	ra,8(sp)
    80002618:	00013403          	ld	s0,0(sp)
    8000261c:	00d5151b          	slliw	a0,a0,0xd
    80002620:	0c2017b7          	lui	a5,0xc201
    80002624:	00a78533          	add	a0,a5,a0
    80002628:	00052023          	sw	zero,0(a0)
    8000262c:	01010113          	addi	sp,sp,16
    80002630:	00008067          	ret

0000000080002634 <plic_claim>:
    80002634:	ff010113          	addi	sp,sp,-16
    80002638:	00813023          	sd	s0,0(sp)
    8000263c:	00113423          	sd	ra,8(sp)
    80002640:	01010413          	addi	s0,sp,16
    80002644:	00000097          	auipc	ra,0x0
    80002648:	9f8080e7          	jalr	-1544(ra) # 8000203c <cpuid>
    8000264c:	00813083          	ld	ra,8(sp)
    80002650:	00013403          	ld	s0,0(sp)
    80002654:	00d5151b          	slliw	a0,a0,0xd
    80002658:	0c2017b7          	lui	a5,0xc201
    8000265c:	00a78533          	add	a0,a5,a0
    80002660:	00452503          	lw	a0,4(a0)
    80002664:	01010113          	addi	sp,sp,16
    80002668:	00008067          	ret

000000008000266c <plic_complete>:
    8000266c:	fe010113          	addi	sp,sp,-32
    80002670:	00813823          	sd	s0,16(sp)
    80002674:	00913423          	sd	s1,8(sp)
    80002678:	00113c23          	sd	ra,24(sp)
    8000267c:	02010413          	addi	s0,sp,32
    80002680:	00050493          	mv	s1,a0
    80002684:	00000097          	auipc	ra,0x0
    80002688:	9b8080e7          	jalr	-1608(ra) # 8000203c <cpuid>
    8000268c:	01813083          	ld	ra,24(sp)
    80002690:	01013403          	ld	s0,16(sp)
    80002694:	00d5179b          	slliw	a5,a0,0xd
    80002698:	0c201737          	lui	a4,0xc201
    8000269c:	00f707b3          	add	a5,a4,a5
    800026a0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800026a4:	00813483          	ld	s1,8(sp)
    800026a8:	02010113          	addi	sp,sp,32
    800026ac:	00008067          	ret

00000000800026b0 <consolewrite>:
    800026b0:	fb010113          	addi	sp,sp,-80
    800026b4:	04813023          	sd	s0,64(sp)
    800026b8:	04113423          	sd	ra,72(sp)
    800026bc:	02913c23          	sd	s1,56(sp)
    800026c0:	03213823          	sd	s2,48(sp)
    800026c4:	03313423          	sd	s3,40(sp)
    800026c8:	03413023          	sd	s4,32(sp)
    800026cc:	01513c23          	sd	s5,24(sp)
    800026d0:	05010413          	addi	s0,sp,80
    800026d4:	06c05c63          	blez	a2,8000274c <consolewrite+0x9c>
    800026d8:	00060993          	mv	s3,a2
    800026dc:	00050a13          	mv	s4,a0
    800026e0:	00058493          	mv	s1,a1
    800026e4:	00000913          	li	s2,0
    800026e8:	fff00a93          	li	s5,-1
    800026ec:	01c0006f          	j	80002708 <consolewrite+0x58>
    800026f0:	fbf44503          	lbu	a0,-65(s0)
    800026f4:	0019091b          	addiw	s2,s2,1
    800026f8:	00148493          	addi	s1,s1,1
    800026fc:	00001097          	auipc	ra,0x1
    80002700:	a9c080e7          	jalr	-1380(ra) # 80003198 <uartputc>
    80002704:	03298063          	beq	s3,s2,80002724 <consolewrite+0x74>
    80002708:	00048613          	mv	a2,s1
    8000270c:	00100693          	li	a3,1
    80002710:	000a0593          	mv	a1,s4
    80002714:	fbf40513          	addi	a0,s0,-65
    80002718:	00000097          	auipc	ra,0x0
    8000271c:	9dc080e7          	jalr	-1572(ra) # 800020f4 <either_copyin>
    80002720:	fd5518e3          	bne	a0,s5,800026f0 <consolewrite+0x40>
    80002724:	04813083          	ld	ra,72(sp)
    80002728:	04013403          	ld	s0,64(sp)
    8000272c:	03813483          	ld	s1,56(sp)
    80002730:	02813983          	ld	s3,40(sp)
    80002734:	02013a03          	ld	s4,32(sp)
    80002738:	01813a83          	ld	s5,24(sp)
    8000273c:	00090513          	mv	a0,s2
    80002740:	03013903          	ld	s2,48(sp)
    80002744:	05010113          	addi	sp,sp,80
    80002748:	00008067          	ret
    8000274c:	00000913          	li	s2,0
    80002750:	fd5ff06f          	j	80002724 <consolewrite+0x74>

0000000080002754 <consoleread>:
    80002754:	f9010113          	addi	sp,sp,-112
    80002758:	06813023          	sd	s0,96(sp)
    8000275c:	04913c23          	sd	s1,88(sp)
    80002760:	05213823          	sd	s2,80(sp)
    80002764:	05313423          	sd	s3,72(sp)
    80002768:	05413023          	sd	s4,64(sp)
    8000276c:	03513c23          	sd	s5,56(sp)
    80002770:	03613823          	sd	s6,48(sp)
    80002774:	03713423          	sd	s7,40(sp)
    80002778:	03813023          	sd	s8,32(sp)
    8000277c:	06113423          	sd	ra,104(sp)
    80002780:	01913c23          	sd	s9,24(sp)
    80002784:	07010413          	addi	s0,sp,112
    80002788:	00060b93          	mv	s7,a2
    8000278c:	00050913          	mv	s2,a0
    80002790:	00058c13          	mv	s8,a1
    80002794:	00060b1b          	sext.w	s6,a2
    80002798:	00004497          	auipc	s1,0x4
    8000279c:	1b048493          	addi	s1,s1,432 # 80006948 <cons>
    800027a0:	00400993          	li	s3,4
    800027a4:	fff00a13          	li	s4,-1
    800027a8:	00a00a93          	li	s5,10
    800027ac:	05705e63          	blez	s7,80002808 <consoleread+0xb4>
    800027b0:	09c4a703          	lw	a4,156(s1)
    800027b4:	0984a783          	lw	a5,152(s1)
    800027b8:	0007071b          	sext.w	a4,a4
    800027bc:	08e78463          	beq	a5,a4,80002844 <consoleread+0xf0>
    800027c0:	07f7f713          	andi	a4,a5,127
    800027c4:	00e48733          	add	a4,s1,a4
    800027c8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800027cc:	0017869b          	addiw	a3,a5,1
    800027d0:	08d4ac23          	sw	a3,152(s1)
    800027d4:	00070c9b          	sext.w	s9,a4
    800027d8:	0b370663          	beq	a4,s3,80002884 <consoleread+0x130>
    800027dc:	00100693          	li	a3,1
    800027e0:	f9f40613          	addi	a2,s0,-97
    800027e4:	000c0593          	mv	a1,s8
    800027e8:	00090513          	mv	a0,s2
    800027ec:	f8e40fa3          	sb	a4,-97(s0)
    800027f0:	00000097          	auipc	ra,0x0
    800027f4:	8b8080e7          	jalr	-1864(ra) # 800020a8 <either_copyout>
    800027f8:	01450863          	beq	a0,s4,80002808 <consoleread+0xb4>
    800027fc:	001c0c13          	addi	s8,s8,1
    80002800:	fffb8b9b          	addiw	s7,s7,-1
    80002804:	fb5c94e3          	bne	s9,s5,800027ac <consoleread+0x58>
    80002808:	000b851b          	sext.w	a0,s7
    8000280c:	06813083          	ld	ra,104(sp)
    80002810:	06013403          	ld	s0,96(sp)
    80002814:	05813483          	ld	s1,88(sp)
    80002818:	05013903          	ld	s2,80(sp)
    8000281c:	04813983          	ld	s3,72(sp)
    80002820:	04013a03          	ld	s4,64(sp)
    80002824:	03813a83          	ld	s5,56(sp)
    80002828:	02813b83          	ld	s7,40(sp)
    8000282c:	02013c03          	ld	s8,32(sp)
    80002830:	01813c83          	ld	s9,24(sp)
    80002834:	40ab053b          	subw	a0,s6,a0
    80002838:	03013b03          	ld	s6,48(sp)
    8000283c:	07010113          	addi	sp,sp,112
    80002840:	00008067          	ret
    80002844:	00001097          	auipc	ra,0x1
    80002848:	1d8080e7          	jalr	472(ra) # 80003a1c <push_on>
    8000284c:	0984a703          	lw	a4,152(s1)
    80002850:	09c4a783          	lw	a5,156(s1)
    80002854:	0007879b          	sext.w	a5,a5
    80002858:	fef70ce3          	beq	a4,a5,80002850 <consoleread+0xfc>
    8000285c:	00001097          	auipc	ra,0x1
    80002860:	234080e7          	jalr	564(ra) # 80003a90 <pop_on>
    80002864:	0984a783          	lw	a5,152(s1)
    80002868:	07f7f713          	andi	a4,a5,127
    8000286c:	00e48733          	add	a4,s1,a4
    80002870:	01874703          	lbu	a4,24(a4)
    80002874:	0017869b          	addiw	a3,a5,1
    80002878:	08d4ac23          	sw	a3,152(s1)
    8000287c:	00070c9b          	sext.w	s9,a4
    80002880:	f5371ee3          	bne	a4,s3,800027dc <consoleread+0x88>
    80002884:	000b851b          	sext.w	a0,s7
    80002888:	f96bf2e3          	bgeu	s7,s6,8000280c <consoleread+0xb8>
    8000288c:	08f4ac23          	sw	a5,152(s1)
    80002890:	f7dff06f          	j	8000280c <consoleread+0xb8>

0000000080002894 <consputc>:
    80002894:	10000793          	li	a5,256
    80002898:	00f50663          	beq	a0,a5,800028a4 <consputc+0x10>
    8000289c:	00001317          	auipc	t1,0x1
    800028a0:	9f430067          	jr	-1548(t1) # 80003290 <uartputc_sync>
    800028a4:	ff010113          	addi	sp,sp,-16
    800028a8:	00113423          	sd	ra,8(sp)
    800028ac:	00813023          	sd	s0,0(sp)
    800028b0:	01010413          	addi	s0,sp,16
    800028b4:	00800513          	li	a0,8
    800028b8:	00001097          	auipc	ra,0x1
    800028bc:	9d8080e7          	jalr	-1576(ra) # 80003290 <uartputc_sync>
    800028c0:	02000513          	li	a0,32
    800028c4:	00001097          	auipc	ra,0x1
    800028c8:	9cc080e7          	jalr	-1588(ra) # 80003290 <uartputc_sync>
    800028cc:	00013403          	ld	s0,0(sp)
    800028d0:	00813083          	ld	ra,8(sp)
    800028d4:	00800513          	li	a0,8
    800028d8:	01010113          	addi	sp,sp,16
    800028dc:	00001317          	auipc	t1,0x1
    800028e0:	9b430067          	jr	-1612(t1) # 80003290 <uartputc_sync>

00000000800028e4 <consoleintr>:
    800028e4:	fe010113          	addi	sp,sp,-32
    800028e8:	00813823          	sd	s0,16(sp)
    800028ec:	00913423          	sd	s1,8(sp)
    800028f0:	01213023          	sd	s2,0(sp)
    800028f4:	00113c23          	sd	ra,24(sp)
    800028f8:	02010413          	addi	s0,sp,32
    800028fc:	00004917          	auipc	s2,0x4
    80002900:	04c90913          	addi	s2,s2,76 # 80006948 <cons>
    80002904:	00050493          	mv	s1,a0
    80002908:	00090513          	mv	a0,s2
    8000290c:	00001097          	auipc	ra,0x1
    80002910:	e40080e7          	jalr	-448(ra) # 8000374c <acquire>
    80002914:	02048c63          	beqz	s1,8000294c <consoleintr+0x68>
    80002918:	0a092783          	lw	a5,160(s2)
    8000291c:	09892703          	lw	a4,152(s2)
    80002920:	07f00693          	li	a3,127
    80002924:	40e7873b          	subw	a4,a5,a4
    80002928:	02e6e263          	bltu	a3,a4,8000294c <consoleintr+0x68>
    8000292c:	00d00713          	li	a4,13
    80002930:	04e48063          	beq	s1,a4,80002970 <consoleintr+0x8c>
    80002934:	07f7f713          	andi	a4,a5,127
    80002938:	00e90733          	add	a4,s2,a4
    8000293c:	0017879b          	addiw	a5,a5,1
    80002940:	0af92023          	sw	a5,160(s2)
    80002944:	00970c23          	sb	s1,24(a4)
    80002948:	08f92e23          	sw	a5,156(s2)
    8000294c:	01013403          	ld	s0,16(sp)
    80002950:	01813083          	ld	ra,24(sp)
    80002954:	00813483          	ld	s1,8(sp)
    80002958:	00013903          	ld	s2,0(sp)
    8000295c:	00004517          	auipc	a0,0x4
    80002960:	fec50513          	addi	a0,a0,-20 # 80006948 <cons>
    80002964:	02010113          	addi	sp,sp,32
    80002968:	00001317          	auipc	t1,0x1
    8000296c:	eb030067          	jr	-336(t1) # 80003818 <release>
    80002970:	00a00493          	li	s1,10
    80002974:	fc1ff06f          	j	80002934 <consoleintr+0x50>

0000000080002978 <consoleinit>:
    80002978:	fe010113          	addi	sp,sp,-32
    8000297c:	00113c23          	sd	ra,24(sp)
    80002980:	00813823          	sd	s0,16(sp)
    80002984:	00913423          	sd	s1,8(sp)
    80002988:	02010413          	addi	s0,sp,32
    8000298c:	00004497          	auipc	s1,0x4
    80002990:	fbc48493          	addi	s1,s1,-68 # 80006948 <cons>
    80002994:	00048513          	mv	a0,s1
    80002998:	00003597          	auipc	a1,0x3
    8000299c:	87858593          	addi	a1,a1,-1928 # 80005210 <_ZZ12printIntegermE6digits+0x138>
    800029a0:	00001097          	auipc	ra,0x1
    800029a4:	d88080e7          	jalr	-632(ra) # 80003728 <initlock>
    800029a8:	00000097          	auipc	ra,0x0
    800029ac:	7ac080e7          	jalr	1964(ra) # 80003154 <uartinit>
    800029b0:	01813083          	ld	ra,24(sp)
    800029b4:	01013403          	ld	s0,16(sp)
    800029b8:	00000797          	auipc	a5,0x0
    800029bc:	d9c78793          	addi	a5,a5,-612 # 80002754 <consoleread>
    800029c0:	0af4bc23          	sd	a5,184(s1)
    800029c4:	00000797          	auipc	a5,0x0
    800029c8:	cec78793          	addi	a5,a5,-788 # 800026b0 <consolewrite>
    800029cc:	0cf4b023          	sd	a5,192(s1)
    800029d0:	00813483          	ld	s1,8(sp)
    800029d4:	02010113          	addi	sp,sp,32
    800029d8:	00008067          	ret

00000000800029dc <console_read>:
    800029dc:	ff010113          	addi	sp,sp,-16
    800029e0:	00813423          	sd	s0,8(sp)
    800029e4:	01010413          	addi	s0,sp,16
    800029e8:	00813403          	ld	s0,8(sp)
    800029ec:	00004317          	auipc	t1,0x4
    800029f0:	01433303          	ld	t1,20(t1) # 80006a00 <devsw+0x10>
    800029f4:	01010113          	addi	sp,sp,16
    800029f8:	00030067          	jr	t1

00000000800029fc <console_write>:
    800029fc:	ff010113          	addi	sp,sp,-16
    80002a00:	00813423          	sd	s0,8(sp)
    80002a04:	01010413          	addi	s0,sp,16
    80002a08:	00813403          	ld	s0,8(sp)
    80002a0c:	00004317          	auipc	t1,0x4
    80002a10:	ffc33303          	ld	t1,-4(t1) # 80006a08 <devsw+0x18>
    80002a14:	01010113          	addi	sp,sp,16
    80002a18:	00030067          	jr	t1

0000000080002a1c <panic>:
    80002a1c:	fe010113          	addi	sp,sp,-32
    80002a20:	00113c23          	sd	ra,24(sp)
    80002a24:	00813823          	sd	s0,16(sp)
    80002a28:	00913423          	sd	s1,8(sp)
    80002a2c:	02010413          	addi	s0,sp,32
    80002a30:	00050493          	mv	s1,a0
    80002a34:	00002517          	auipc	a0,0x2
    80002a38:	7e450513          	addi	a0,a0,2020 # 80005218 <_ZZ12printIntegermE6digits+0x140>
    80002a3c:	00004797          	auipc	a5,0x4
    80002a40:	0607a623          	sw	zero,108(a5) # 80006aa8 <pr+0x18>
    80002a44:	00000097          	auipc	ra,0x0
    80002a48:	034080e7          	jalr	52(ra) # 80002a78 <__printf>
    80002a4c:	00048513          	mv	a0,s1
    80002a50:	00000097          	auipc	ra,0x0
    80002a54:	028080e7          	jalr	40(ra) # 80002a78 <__printf>
    80002a58:	00002517          	auipc	a0,0x2
    80002a5c:	67850513          	addi	a0,a0,1656 # 800050d0 <kvmincrease+0xef0>
    80002a60:	00000097          	auipc	ra,0x0
    80002a64:	018080e7          	jalr	24(ra) # 80002a78 <__printf>
    80002a68:	00100793          	li	a5,1
    80002a6c:	00003717          	auipc	a4,0x3
    80002a70:	daf72e23          	sw	a5,-580(a4) # 80005828 <panicked>
    80002a74:	0000006f          	j	80002a74 <panic+0x58>

0000000080002a78 <__printf>:
    80002a78:	f3010113          	addi	sp,sp,-208
    80002a7c:	08813023          	sd	s0,128(sp)
    80002a80:	07313423          	sd	s3,104(sp)
    80002a84:	09010413          	addi	s0,sp,144
    80002a88:	05813023          	sd	s8,64(sp)
    80002a8c:	08113423          	sd	ra,136(sp)
    80002a90:	06913c23          	sd	s1,120(sp)
    80002a94:	07213823          	sd	s2,112(sp)
    80002a98:	07413023          	sd	s4,96(sp)
    80002a9c:	05513c23          	sd	s5,88(sp)
    80002aa0:	05613823          	sd	s6,80(sp)
    80002aa4:	05713423          	sd	s7,72(sp)
    80002aa8:	03913c23          	sd	s9,56(sp)
    80002aac:	03a13823          	sd	s10,48(sp)
    80002ab0:	03b13423          	sd	s11,40(sp)
    80002ab4:	00004317          	auipc	t1,0x4
    80002ab8:	fdc30313          	addi	t1,t1,-36 # 80006a90 <pr>
    80002abc:	01832c03          	lw	s8,24(t1)
    80002ac0:	00b43423          	sd	a1,8(s0)
    80002ac4:	00c43823          	sd	a2,16(s0)
    80002ac8:	00d43c23          	sd	a3,24(s0)
    80002acc:	02e43023          	sd	a4,32(s0)
    80002ad0:	02f43423          	sd	a5,40(s0)
    80002ad4:	03043823          	sd	a6,48(s0)
    80002ad8:	03143c23          	sd	a7,56(s0)
    80002adc:	00050993          	mv	s3,a0
    80002ae0:	4a0c1663          	bnez	s8,80002f8c <__printf+0x514>
    80002ae4:	60098c63          	beqz	s3,800030fc <__printf+0x684>
    80002ae8:	0009c503          	lbu	a0,0(s3)
    80002aec:	00840793          	addi	a5,s0,8
    80002af0:	f6f43c23          	sd	a5,-136(s0)
    80002af4:	00000493          	li	s1,0
    80002af8:	22050063          	beqz	a0,80002d18 <__printf+0x2a0>
    80002afc:	00002a37          	lui	s4,0x2
    80002b00:	00018ab7          	lui	s5,0x18
    80002b04:	000f4b37          	lui	s6,0xf4
    80002b08:	00989bb7          	lui	s7,0x989
    80002b0c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002b10:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002b14:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002b18:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002b1c:	00148c9b          	addiw	s9,s1,1
    80002b20:	02500793          	li	a5,37
    80002b24:	01998933          	add	s2,s3,s9
    80002b28:	38f51263          	bne	a0,a5,80002eac <__printf+0x434>
    80002b2c:	00094783          	lbu	a5,0(s2)
    80002b30:	00078c9b          	sext.w	s9,a5
    80002b34:	1e078263          	beqz	a5,80002d18 <__printf+0x2a0>
    80002b38:	0024849b          	addiw	s1,s1,2
    80002b3c:	07000713          	li	a4,112
    80002b40:	00998933          	add	s2,s3,s1
    80002b44:	38e78a63          	beq	a5,a4,80002ed8 <__printf+0x460>
    80002b48:	20f76863          	bltu	a4,a5,80002d58 <__printf+0x2e0>
    80002b4c:	42a78863          	beq	a5,a0,80002f7c <__printf+0x504>
    80002b50:	06400713          	li	a4,100
    80002b54:	40e79663          	bne	a5,a4,80002f60 <__printf+0x4e8>
    80002b58:	f7843783          	ld	a5,-136(s0)
    80002b5c:	0007a603          	lw	a2,0(a5)
    80002b60:	00878793          	addi	a5,a5,8
    80002b64:	f6f43c23          	sd	a5,-136(s0)
    80002b68:	42064a63          	bltz	a2,80002f9c <__printf+0x524>
    80002b6c:	00a00713          	li	a4,10
    80002b70:	02e677bb          	remuw	a5,a2,a4
    80002b74:	00002d97          	auipc	s11,0x2
    80002b78:	6ccd8d93          	addi	s11,s11,1740 # 80005240 <digits>
    80002b7c:	00900593          	li	a1,9
    80002b80:	0006051b          	sext.w	a0,a2
    80002b84:	00000c93          	li	s9,0
    80002b88:	02079793          	slli	a5,a5,0x20
    80002b8c:	0207d793          	srli	a5,a5,0x20
    80002b90:	00fd87b3          	add	a5,s11,a5
    80002b94:	0007c783          	lbu	a5,0(a5)
    80002b98:	02e656bb          	divuw	a3,a2,a4
    80002b9c:	f8f40023          	sb	a5,-128(s0)
    80002ba0:	14c5d863          	bge	a1,a2,80002cf0 <__printf+0x278>
    80002ba4:	06300593          	li	a1,99
    80002ba8:	00100c93          	li	s9,1
    80002bac:	02e6f7bb          	remuw	a5,a3,a4
    80002bb0:	02079793          	slli	a5,a5,0x20
    80002bb4:	0207d793          	srli	a5,a5,0x20
    80002bb8:	00fd87b3          	add	a5,s11,a5
    80002bbc:	0007c783          	lbu	a5,0(a5)
    80002bc0:	02e6d73b          	divuw	a4,a3,a4
    80002bc4:	f8f400a3          	sb	a5,-127(s0)
    80002bc8:	12a5f463          	bgeu	a1,a0,80002cf0 <__printf+0x278>
    80002bcc:	00a00693          	li	a3,10
    80002bd0:	00900593          	li	a1,9
    80002bd4:	02d777bb          	remuw	a5,a4,a3
    80002bd8:	02079793          	slli	a5,a5,0x20
    80002bdc:	0207d793          	srli	a5,a5,0x20
    80002be0:	00fd87b3          	add	a5,s11,a5
    80002be4:	0007c503          	lbu	a0,0(a5)
    80002be8:	02d757bb          	divuw	a5,a4,a3
    80002bec:	f8a40123          	sb	a0,-126(s0)
    80002bf0:	48e5f263          	bgeu	a1,a4,80003074 <__printf+0x5fc>
    80002bf4:	06300513          	li	a0,99
    80002bf8:	02d7f5bb          	remuw	a1,a5,a3
    80002bfc:	02059593          	slli	a1,a1,0x20
    80002c00:	0205d593          	srli	a1,a1,0x20
    80002c04:	00bd85b3          	add	a1,s11,a1
    80002c08:	0005c583          	lbu	a1,0(a1)
    80002c0c:	02d7d7bb          	divuw	a5,a5,a3
    80002c10:	f8b401a3          	sb	a1,-125(s0)
    80002c14:	48e57263          	bgeu	a0,a4,80003098 <__printf+0x620>
    80002c18:	3e700513          	li	a0,999
    80002c1c:	02d7f5bb          	remuw	a1,a5,a3
    80002c20:	02059593          	slli	a1,a1,0x20
    80002c24:	0205d593          	srli	a1,a1,0x20
    80002c28:	00bd85b3          	add	a1,s11,a1
    80002c2c:	0005c583          	lbu	a1,0(a1)
    80002c30:	02d7d7bb          	divuw	a5,a5,a3
    80002c34:	f8b40223          	sb	a1,-124(s0)
    80002c38:	46e57663          	bgeu	a0,a4,800030a4 <__printf+0x62c>
    80002c3c:	02d7f5bb          	remuw	a1,a5,a3
    80002c40:	02059593          	slli	a1,a1,0x20
    80002c44:	0205d593          	srli	a1,a1,0x20
    80002c48:	00bd85b3          	add	a1,s11,a1
    80002c4c:	0005c583          	lbu	a1,0(a1)
    80002c50:	02d7d7bb          	divuw	a5,a5,a3
    80002c54:	f8b402a3          	sb	a1,-123(s0)
    80002c58:	46ea7863          	bgeu	s4,a4,800030c8 <__printf+0x650>
    80002c5c:	02d7f5bb          	remuw	a1,a5,a3
    80002c60:	02059593          	slli	a1,a1,0x20
    80002c64:	0205d593          	srli	a1,a1,0x20
    80002c68:	00bd85b3          	add	a1,s11,a1
    80002c6c:	0005c583          	lbu	a1,0(a1)
    80002c70:	02d7d7bb          	divuw	a5,a5,a3
    80002c74:	f8b40323          	sb	a1,-122(s0)
    80002c78:	3eeaf863          	bgeu	s5,a4,80003068 <__printf+0x5f0>
    80002c7c:	02d7f5bb          	remuw	a1,a5,a3
    80002c80:	02059593          	slli	a1,a1,0x20
    80002c84:	0205d593          	srli	a1,a1,0x20
    80002c88:	00bd85b3          	add	a1,s11,a1
    80002c8c:	0005c583          	lbu	a1,0(a1)
    80002c90:	02d7d7bb          	divuw	a5,a5,a3
    80002c94:	f8b403a3          	sb	a1,-121(s0)
    80002c98:	42eb7e63          	bgeu	s6,a4,800030d4 <__printf+0x65c>
    80002c9c:	02d7f5bb          	remuw	a1,a5,a3
    80002ca0:	02059593          	slli	a1,a1,0x20
    80002ca4:	0205d593          	srli	a1,a1,0x20
    80002ca8:	00bd85b3          	add	a1,s11,a1
    80002cac:	0005c583          	lbu	a1,0(a1)
    80002cb0:	02d7d7bb          	divuw	a5,a5,a3
    80002cb4:	f8b40423          	sb	a1,-120(s0)
    80002cb8:	42ebfc63          	bgeu	s7,a4,800030f0 <__printf+0x678>
    80002cbc:	02079793          	slli	a5,a5,0x20
    80002cc0:	0207d793          	srli	a5,a5,0x20
    80002cc4:	00fd8db3          	add	s11,s11,a5
    80002cc8:	000dc703          	lbu	a4,0(s11)
    80002ccc:	00a00793          	li	a5,10
    80002cd0:	00900c93          	li	s9,9
    80002cd4:	f8e404a3          	sb	a4,-119(s0)
    80002cd8:	00065c63          	bgez	a2,80002cf0 <__printf+0x278>
    80002cdc:	f9040713          	addi	a4,s0,-112
    80002ce0:	00f70733          	add	a4,a4,a5
    80002ce4:	02d00693          	li	a3,45
    80002ce8:	fed70823          	sb	a3,-16(a4)
    80002cec:	00078c93          	mv	s9,a5
    80002cf0:	f8040793          	addi	a5,s0,-128
    80002cf4:	01978cb3          	add	s9,a5,s9
    80002cf8:	f7f40d13          	addi	s10,s0,-129
    80002cfc:	000cc503          	lbu	a0,0(s9)
    80002d00:	fffc8c93          	addi	s9,s9,-1
    80002d04:	00000097          	auipc	ra,0x0
    80002d08:	b90080e7          	jalr	-1136(ra) # 80002894 <consputc>
    80002d0c:	ffac98e3          	bne	s9,s10,80002cfc <__printf+0x284>
    80002d10:	00094503          	lbu	a0,0(s2)
    80002d14:	e00514e3          	bnez	a0,80002b1c <__printf+0xa4>
    80002d18:	1a0c1663          	bnez	s8,80002ec4 <__printf+0x44c>
    80002d1c:	08813083          	ld	ra,136(sp)
    80002d20:	08013403          	ld	s0,128(sp)
    80002d24:	07813483          	ld	s1,120(sp)
    80002d28:	07013903          	ld	s2,112(sp)
    80002d2c:	06813983          	ld	s3,104(sp)
    80002d30:	06013a03          	ld	s4,96(sp)
    80002d34:	05813a83          	ld	s5,88(sp)
    80002d38:	05013b03          	ld	s6,80(sp)
    80002d3c:	04813b83          	ld	s7,72(sp)
    80002d40:	04013c03          	ld	s8,64(sp)
    80002d44:	03813c83          	ld	s9,56(sp)
    80002d48:	03013d03          	ld	s10,48(sp)
    80002d4c:	02813d83          	ld	s11,40(sp)
    80002d50:	0d010113          	addi	sp,sp,208
    80002d54:	00008067          	ret
    80002d58:	07300713          	li	a4,115
    80002d5c:	1ce78a63          	beq	a5,a4,80002f30 <__printf+0x4b8>
    80002d60:	07800713          	li	a4,120
    80002d64:	1ee79e63          	bne	a5,a4,80002f60 <__printf+0x4e8>
    80002d68:	f7843783          	ld	a5,-136(s0)
    80002d6c:	0007a703          	lw	a4,0(a5)
    80002d70:	00878793          	addi	a5,a5,8
    80002d74:	f6f43c23          	sd	a5,-136(s0)
    80002d78:	28074263          	bltz	a4,80002ffc <__printf+0x584>
    80002d7c:	00002d97          	auipc	s11,0x2
    80002d80:	4c4d8d93          	addi	s11,s11,1220 # 80005240 <digits>
    80002d84:	00f77793          	andi	a5,a4,15
    80002d88:	00fd87b3          	add	a5,s11,a5
    80002d8c:	0007c683          	lbu	a3,0(a5)
    80002d90:	00f00613          	li	a2,15
    80002d94:	0007079b          	sext.w	a5,a4
    80002d98:	f8d40023          	sb	a3,-128(s0)
    80002d9c:	0047559b          	srliw	a1,a4,0x4
    80002da0:	0047569b          	srliw	a3,a4,0x4
    80002da4:	00000c93          	li	s9,0
    80002da8:	0ee65063          	bge	a2,a4,80002e88 <__printf+0x410>
    80002dac:	00f6f693          	andi	a3,a3,15
    80002db0:	00dd86b3          	add	a3,s11,a3
    80002db4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002db8:	0087d79b          	srliw	a5,a5,0x8
    80002dbc:	00100c93          	li	s9,1
    80002dc0:	f8d400a3          	sb	a3,-127(s0)
    80002dc4:	0cb67263          	bgeu	a2,a1,80002e88 <__printf+0x410>
    80002dc8:	00f7f693          	andi	a3,a5,15
    80002dcc:	00dd86b3          	add	a3,s11,a3
    80002dd0:	0006c583          	lbu	a1,0(a3)
    80002dd4:	00f00613          	li	a2,15
    80002dd8:	0047d69b          	srliw	a3,a5,0x4
    80002ddc:	f8b40123          	sb	a1,-126(s0)
    80002de0:	0047d593          	srli	a1,a5,0x4
    80002de4:	28f67e63          	bgeu	a2,a5,80003080 <__printf+0x608>
    80002de8:	00f6f693          	andi	a3,a3,15
    80002dec:	00dd86b3          	add	a3,s11,a3
    80002df0:	0006c503          	lbu	a0,0(a3)
    80002df4:	0087d813          	srli	a6,a5,0x8
    80002df8:	0087d69b          	srliw	a3,a5,0x8
    80002dfc:	f8a401a3          	sb	a0,-125(s0)
    80002e00:	28b67663          	bgeu	a2,a1,8000308c <__printf+0x614>
    80002e04:	00f6f693          	andi	a3,a3,15
    80002e08:	00dd86b3          	add	a3,s11,a3
    80002e0c:	0006c583          	lbu	a1,0(a3)
    80002e10:	00c7d513          	srli	a0,a5,0xc
    80002e14:	00c7d69b          	srliw	a3,a5,0xc
    80002e18:	f8b40223          	sb	a1,-124(s0)
    80002e1c:	29067a63          	bgeu	a2,a6,800030b0 <__printf+0x638>
    80002e20:	00f6f693          	andi	a3,a3,15
    80002e24:	00dd86b3          	add	a3,s11,a3
    80002e28:	0006c583          	lbu	a1,0(a3)
    80002e2c:	0107d813          	srli	a6,a5,0x10
    80002e30:	0107d69b          	srliw	a3,a5,0x10
    80002e34:	f8b402a3          	sb	a1,-123(s0)
    80002e38:	28a67263          	bgeu	a2,a0,800030bc <__printf+0x644>
    80002e3c:	00f6f693          	andi	a3,a3,15
    80002e40:	00dd86b3          	add	a3,s11,a3
    80002e44:	0006c683          	lbu	a3,0(a3)
    80002e48:	0147d79b          	srliw	a5,a5,0x14
    80002e4c:	f8d40323          	sb	a3,-122(s0)
    80002e50:	21067663          	bgeu	a2,a6,8000305c <__printf+0x5e4>
    80002e54:	02079793          	slli	a5,a5,0x20
    80002e58:	0207d793          	srli	a5,a5,0x20
    80002e5c:	00fd8db3          	add	s11,s11,a5
    80002e60:	000dc683          	lbu	a3,0(s11)
    80002e64:	00800793          	li	a5,8
    80002e68:	00700c93          	li	s9,7
    80002e6c:	f8d403a3          	sb	a3,-121(s0)
    80002e70:	00075c63          	bgez	a4,80002e88 <__printf+0x410>
    80002e74:	f9040713          	addi	a4,s0,-112
    80002e78:	00f70733          	add	a4,a4,a5
    80002e7c:	02d00693          	li	a3,45
    80002e80:	fed70823          	sb	a3,-16(a4)
    80002e84:	00078c93          	mv	s9,a5
    80002e88:	f8040793          	addi	a5,s0,-128
    80002e8c:	01978cb3          	add	s9,a5,s9
    80002e90:	f7f40d13          	addi	s10,s0,-129
    80002e94:	000cc503          	lbu	a0,0(s9)
    80002e98:	fffc8c93          	addi	s9,s9,-1
    80002e9c:	00000097          	auipc	ra,0x0
    80002ea0:	9f8080e7          	jalr	-1544(ra) # 80002894 <consputc>
    80002ea4:	ff9d18e3          	bne	s10,s9,80002e94 <__printf+0x41c>
    80002ea8:	0100006f          	j	80002eb8 <__printf+0x440>
    80002eac:	00000097          	auipc	ra,0x0
    80002eb0:	9e8080e7          	jalr	-1560(ra) # 80002894 <consputc>
    80002eb4:	000c8493          	mv	s1,s9
    80002eb8:	00094503          	lbu	a0,0(s2)
    80002ebc:	c60510e3          	bnez	a0,80002b1c <__printf+0xa4>
    80002ec0:	e40c0ee3          	beqz	s8,80002d1c <__printf+0x2a4>
    80002ec4:	00004517          	auipc	a0,0x4
    80002ec8:	bcc50513          	addi	a0,a0,-1076 # 80006a90 <pr>
    80002ecc:	00001097          	auipc	ra,0x1
    80002ed0:	94c080e7          	jalr	-1716(ra) # 80003818 <release>
    80002ed4:	e49ff06f          	j	80002d1c <__printf+0x2a4>
    80002ed8:	f7843783          	ld	a5,-136(s0)
    80002edc:	03000513          	li	a0,48
    80002ee0:	01000d13          	li	s10,16
    80002ee4:	00878713          	addi	a4,a5,8
    80002ee8:	0007bc83          	ld	s9,0(a5)
    80002eec:	f6e43c23          	sd	a4,-136(s0)
    80002ef0:	00000097          	auipc	ra,0x0
    80002ef4:	9a4080e7          	jalr	-1628(ra) # 80002894 <consputc>
    80002ef8:	07800513          	li	a0,120
    80002efc:	00000097          	auipc	ra,0x0
    80002f00:	998080e7          	jalr	-1640(ra) # 80002894 <consputc>
    80002f04:	00002d97          	auipc	s11,0x2
    80002f08:	33cd8d93          	addi	s11,s11,828 # 80005240 <digits>
    80002f0c:	03ccd793          	srli	a5,s9,0x3c
    80002f10:	00fd87b3          	add	a5,s11,a5
    80002f14:	0007c503          	lbu	a0,0(a5)
    80002f18:	fffd0d1b          	addiw	s10,s10,-1
    80002f1c:	004c9c93          	slli	s9,s9,0x4
    80002f20:	00000097          	auipc	ra,0x0
    80002f24:	974080e7          	jalr	-1676(ra) # 80002894 <consputc>
    80002f28:	fe0d12e3          	bnez	s10,80002f0c <__printf+0x494>
    80002f2c:	f8dff06f          	j	80002eb8 <__printf+0x440>
    80002f30:	f7843783          	ld	a5,-136(s0)
    80002f34:	0007bc83          	ld	s9,0(a5)
    80002f38:	00878793          	addi	a5,a5,8
    80002f3c:	f6f43c23          	sd	a5,-136(s0)
    80002f40:	000c9a63          	bnez	s9,80002f54 <__printf+0x4dc>
    80002f44:	1080006f          	j	8000304c <__printf+0x5d4>
    80002f48:	001c8c93          	addi	s9,s9,1
    80002f4c:	00000097          	auipc	ra,0x0
    80002f50:	948080e7          	jalr	-1720(ra) # 80002894 <consputc>
    80002f54:	000cc503          	lbu	a0,0(s9)
    80002f58:	fe0518e3          	bnez	a0,80002f48 <__printf+0x4d0>
    80002f5c:	f5dff06f          	j	80002eb8 <__printf+0x440>
    80002f60:	02500513          	li	a0,37
    80002f64:	00000097          	auipc	ra,0x0
    80002f68:	930080e7          	jalr	-1744(ra) # 80002894 <consputc>
    80002f6c:	000c8513          	mv	a0,s9
    80002f70:	00000097          	auipc	ra,0x0
    80002f74:	924080e7          	jalr	-1756(ra) # 80002894 <consputc>
    80002f78:	f41ff06f          	j	80002eb8 <__printf+0x440>
    80002f7c:	02500513          	li	a0,37
    80002f80:	00000097          	auipc	ra,0x0
    80002f84:	914080e7          	jalr	-1772(ra) # 80002894 <consputc>
    80002f88:	f31ff06f          	j	80002eb8 <__printf+0x440>
    80002f8c:	00030513          	mv	a0,t1
    80002f90:	00000097          	auipc	ra,0x0
    80002f94:	7bc080e7          	jalr	1980(ra) # 8000374c <acquire>
    80002f98:	b4dff06f          	j	80002ae4 <__printf+0x6c>
    80002f9c:	40c0053b          	negw	a0,a2
    80002fa0:	00a00713          	li	a4,10
    80002fa4:	02e576bb          	remuw	a3,a0,a4
    80002fa8:	00002d97          	auipc	s11,0x2
    80002fac:	298d8d93          	addi	s11,s11,664 # 80005240 <digits>
    80002fb0:	ff700593          	li	a1,-9
    80002fb4:	02069693          	slli	a3,a3,0x20
    80002fb8:	0206d693          	srli	a3,a3,0x20
    80002fbc:	00dd86b3          	add	a3,s11,a3
    80002fc0:	0006c683          	lbu	a3,0(a3)
    80002fc4:	02e557bb          	divuw	a5,a0,a4
    80002fc8:	f8d40023          	sb	a3,-128(s0)
    80002fcc:	10b65e63          	bge	a2,a1,800030e8 <__printf+0x670>
    80002fd0:	06300593          	li	a1,99
    80002fd4:	02e7f6bb          	remuw	a3,a5,a4
    80002fd8:	02069693          	slli	a3,a3,0x20
    80002fdc:	0206d693          	srli	a3,a3,0x20
    80002fe0:	00dd86b3          	add	a3,s11,a3
    80002fe4:	0006c683          	lbu	a3,0(a3)
    80002fe8:	02e7d73b          	divuw	a4,a5,a4
    80002fec:	00200793          	li	a5,2
    80002ff0:	f8d400a3          	sb	a3,-127(s0)
    80002ff4:	bca5ece3          	bltu	a1,a0,80002bcc <__printf+0x154>
    80002ff8:	ce5ff06f          	j	80002cdc <__printf+0x264>
    80002ffc:	40e007bb          	negw	a5,a4
    80003000:	00002d97          	auipc	s11,0x2
    80003004:	240d8d93          	addi	s11,s11,576 # 80005240 <digits>
    80003008:	00f7f693          	andi	a3,a5,15
    8000300c:	00dd86b3          	add	a3,s11,a3
    80003010:	0006c583          	lbu	a1,0(a3)
    80003014:	ff100613          	li	a2,-15
    80003018:	0047d69b          	srliw	a3,a5,0x4
    8000301c:	f8b40023          	sb	a1,-128(s0)
    80003020:	0047d59b          	srliw	a1,a5,0x4
    80003024:	0ac75e63          	bge	a4,a2,800030e0 <__printf+0x668>
    80003028:	00f6f693          	andi	a3,a3,15
    8000302c:	00dd86b3          	add	a3,s11,a3
    80003030:	0006c603          	lbu	a2,0(a3)
    80003034:	00f00693          	li	a3,15
    80003038:	0087d79b          	srliw	a5,a5,0x8
    8000303c:	f8c400a3          	sb	a2,-127(s0)
    80003040:	d8b6e4e3          	bltu	a3,a1,80002dc8 <__printf+0x350>
    80003044:	00200793          	li	a5,2
    80003048:	e2dff06f          	j	80002e74 <__printf+0x3fc>
    8000304c:	00002c97          	auipc	s9,0x2
    80003050:	1d4c8c93          	addi	s9,s9,468 # 80005220 <_ZZ12printIntegermE6digits+0x148>
    80003054:	02800513          	li	a0,40
    80003058:	ef1ff06f          	j	80002f48 <__printf+0x4d0>
    8000305c:	00700793          	li	a5,7
    80003060:	00600c93          	li	s9,6
    80003064:	e0dff06f          	j	80002e70 <__printf+0x3f8>
    80003068:	00700793          	li	a5,7
    8000306c:	00600c93          	li	s9,6
    80003070:	c69ff06f          	j	80002cd8 <__printf+0x260>
    80003074:	00300793          	li	a5,3
    80003078:	00200c93          	li	s9,2
    8000307c:	c5dff06f          	j	80002cd8 <__printf+0x260>
    80003080:	00300793          	li	a5,3
    80003084:	00200c93          	li	s9,2
    80003088:	de9ff06f          	j	80002e70 <__printf+0x3f8>
    8000308c:	00400793          	li	a5,4
    80003090:	00300c93          	li	s9,3
    80003094:	dddff06f          	j	80002e70 <__printf+0x3f8>
    80003098:	00400793          	li	a5,4
    8000309c:	00300c93          	li	s9,3
    800030a0:	c39ff06f          	j	80002cd8 <__printf+0x260>
    800030a4:	00500793          	li	a5,5
    800030a8:	00400c93          	li	s9,4
    800030ac:	c2dff06f          	j	80002cd8 <__printf+0x260>
    800030b0:	00500793          	li	a5,5
    800030b4:	00400c93          	li	s9,4
    800030b8:	db9ff06f          	j	80002e70 <__printf+0x3f8>
    800030bc:	00600793          	li	a5,6
    800030c0:	00500c93          	li	s9,5
    800030c4:	dadff06f          	j	80002e70 <__printf+0x3f8>
    800030c8:	00600793          	li	a5,6
    800030cc:	00500c93          	li	s9,5
    800030d0:	c09ff06f          	j	80002cd8 <__printf+0x260>
    800030d4:	00800793          	li	a5,8
    800030d8:	00700c93          	li	s9,7
    800030dc:	bfdff06f          	j	80002cd8 <__printf+0x260>
    800030e0:	00100793          	li	a5,1
    800030e4:	d91ff06f          	j	80002e74 <__printf+0x3fc>
    800030e8:	00100793          	li	a5,1
    800030ec:	bf1ff06f          	j	80002cdc <__printf+0x264>
    800030f0:	00900793          	li	a5,9
    800030f4:	00800c93          	li	s9,8
    800030f8:	be1ff06f          	j	80002cd8 <__printf+0x260>
    800030fc:	00002517          	auipc	a0,0x2
    80003100:	12c50513          	addi	a0,a0,300 # 80005228 <_ZZ12printIntegermE6digits+0x150>
    80003104:	00000097          	auipc	ra,0x0
    80003108:	918080e7          	jalr	-1768(ra) # 80002a1c <panic>

000000008000310c <printfinit>:
    8000310c:	fe010113          	addi	sp,sp,-32
    80003110:	00813823          	sd	s0,16(sp)
    80003114:	00913423          	sd	s1,8(sp)
    80003118:	00113c23          	sd	ra,24(sp)
    8000311c:	02010413          	addi	s0,sp,32
    80003120:	00004497          	auipc	s1,0x4
    80003124:	97048493          	addi	s1,s1,-1680 # 80006a90 <pr>
    80003128:	00048513          	mv	a0,s1
    8000312c:	00002597          	auipc	a1,0x2
    80003130:	10c58593          	addi	a1,a1,268 # 80005238 <_ZZ12printIntegermE6digits+0x160>
    80003134:	00000097          	auipc	ra,0x0
    80003138:	5f4080e7          	jalr	1524(ra) # 80003728 <initlock>
    8000313c:	01813083          	ld	ra,24(sp)
    80003140:	01013403          	ld	s0,16(sp)
    80003144:	0004ac23          	sw	zero,24(s1)
    80003148:	00813483          	ld	s1,8(sp)
    8000314c:	02010113          	addi	sp,sp,32
    80003150:	00008067          	ret

0000000080003154 <uartinit>:
    80003154:	ff010113          	addi	sp,sp,-16
    80003158:	00813423          	sd	s0,8(sp)
    8000315c:	01010413          	addi	s0,sp,16
    80003160:	100007b7          	lui	a5,0x10000
    80003164:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003168:	f8000713          	li	a4,-128
    8000316c:	00e781a3          	sb	a4,3(a5)
    80003170:	00300713          	li	a4,3
    80003174:	00e78023          	sb	a4,0(a5)
    80003178:	000780a3          	sb	zero,1(a5)
    8000317c:	00e781a3          	sb	a4,3(a5)
    80003180:	00700693          	li	a3,7
    80003184:	00d78123          	sb	a3,2(a5)
    80003188:	00e780a3          	sb	a4,1(a5)
    8000318c:	00813403          	ld	s0,8(sp)
    80003190:	01010113          	addi	sp,sp,16
    80003194:	00008067          	ret

0000000080003198 <uartputc>:
    80003198:	00002797          	auipc	a5,0x2
    8000319c:	6907a783          	lw	a5,1680(a5) # 80005828 <panicked>
    800031a0:	00078463          	beqz	a5,800031a8 <uartputc+0x10>
    800031a4:	0000006f          	j	800031a4 <uartputc+0xc>
    800031a8:	fd010113          	addi	sp,sp,-48
    800031ac:	02813023          	sd	s0,32(sp)
    800031b0:	00913c23          	sd	s1,24(sp)
    800031b4:	01213823          	sd	s2,16(sp)
    800031b8:	01313423          	sd	s3,8(sp)
    800031bc:	02113423          	sd	ra,40(sp)
    800031c0:	03010413          	addi	s0,sp,48
    800031c4:	00002917          	auipc	s2,0x2
    800031c8:	66c90913          	addi	s2,s2,1644 # 80005830 <uart_tx_r>
    800031cc:	00093783          	ld	a5,0(s2)
    800031d0:	00002497          	auipc	s1,0x2
    800031d4:	66848493          	addi	s1,s1,1640 # 80005838 <uart_tx_w>
    800031d8:	0004b703          	ld	a4,0(s1)
    800031dc:	02078693          	addi	a3,a5,32
    800031e0:	00050993          	mv	s3,a0
    800031e4:	02e69c63          	bne	a3,a4,8000321c <uartputc+0x84>
    800031e8:	00001097          	auipc	ra,0x1
    800031ec:	834080e7          	jalr	-1996(ra) # 80003a1c <push_on>
    800031f0:	00093783          	ld	a5,0(s2)
    800031f4:	0004b703          	ld	a4,0(s1)
    800031f8:	02078793          	addi	a5,a5,32
    800031fc:	00e79463          	bne	a5,a4,80003204 <uartputc+0x6c>
    80003200:	0000006f          	j	80003200 <uartputc+0x68>
    80003204:	00001097          	auipc	ra,0x1
    80003208:	88c080e7          	jalr	-1908(ra) # 80003a90 <pop_on>
    8000320c:	00093783          	ld	a5,0(s2)
    80003210:	0004b703          	ld	a4,0(s1)
    80003214:	02078693          	addi	a3,a5,32
    80003218:	fce688e3          	beq	a3,a4,800031e8 <uartputc+0x50>
    8000321c:	01f77693          	andi	a3,a4,31
    80003220:	00004597          	auipc	a1,0x4
    80003224:	89058593          	addi	a1,a1,-1904 # 80006ab0 <uart_tx_buf>
    80003228:	00d586b3          	add	a3,a1,a3
    8000322c:	00170713          	addi	a4,a4,1
    80003230:	01368023          	sb	s3,0(a3)
    80003234:	00e4b023          	sd	a4,0(s1)
    80003238:	10000637          	lui	a2,0x10000
    8000323c:	02f71063          	bne	a4,a5,8000325c <uartputc+0xc4>
    80003240:	0340006f          	j	80003274 <uartputc+0xdc>
    80003244:	00074703          	lbu	a4,0(a4)
    80003248:	00f93023          	sd	a5,0(s2)
    8000324c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003250:	00093783          	ld	a5,0(s2)
    80003254:	0004b703          	ld	a4,0(s1)
    80003258:	00f70e63          	beq	a4,a5,80003274 <uartputc+0xdc>
    8000325c:	00564683          	lbu	a3,5(a2)
    80003260:	01f7f713          	andi	a4,a5,31
    80003264:	00e58733          	add	a4,a1,a4
    80003268:	0206f693          	andi	a3,a3,32
    8000326c:	00178793          	addi	a5,a5,1
    80003270:	fc069ae3          	bnez	a3,80003244 <uartputc+0xac>
    80003274:	02813083          	ld	ra,40(sp)
    80003278:	02013403          	ld	s0,32(sp)
    8000327c:	01813483          	ld	s1,24(sp)
    80003280:	01013903          	ld	s2,16(sp)
    80003284:	00813983          	ld	s3,8(sp)
    80003288:	03010113          	addi	sp,sp,48
    8000328c:	00008067          	ret

0000000080003290 <uartputc_sync>:
    80003290:	ff010113          	addi	sp,sp,-16
    80003294:	00813423          	sd	s0,8(sp)
    80003298:	01010413          	addi	s0,sp,16
    8000329c:	00002717          	auipc	a4,0x2
    800032a0:	58c72703          	lw	a4,1420(a4) # 80005828 <panicked>
    800032a4:	02071663          	bnez	a4,800032d0 <uartputc_sync+0x40>
    800032a8:	00050793          	mv	a5,a0
    800032ac:	100006b7          	lui	a3,0x10000
    800032b0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800032b4:	02077713          	andi	a4,a4,32
    800032b8:	fe070ce3          	beqz	a4,800032b0 <uartputc_sync+0x20>
    800032bc:	0ff7f793          	andi	a5,a5,255
    800032c0:	00f68023          	sb	a5,0(a3)
    800032c4:	00813403          	ld	s0,8(sp)
    800032c8:	01010113          	addi	sp,sp,16
    800032cc:	00008067          	ret
    800032d0:	0000006f          	j	800032d0 <uartputc_sync+0x40>

00000000800032d4 <uartstart>:
    800032d4:	ff010113          	addi	sp,sp,-16
    800032d8:	00813423          	sd	s0,8(sp)
    800032dc:	01010413          	addi	s0,sp,16
    800032e0:	00002617          	auipc	a2,0x2
    800032e4:	55060613          	addi	a2,a2,1360 # 80005830 <uart_tx_r>
    800032e8:	00002517          	auipc	a0,0x2
    800032ec:	55050513          	addi	a0,a0,1360 # 80005838 <uart_tx_w>
    800032f0:	00063783          	ld	a5,0(a2)
    800032f4:	00053703          	ld	a4,0(a0)
    800032f8:	04f70263          	beq	a4,a5,8000333c <uartstart+0x68>
    800032fc:	100005b7          	lui	a1,0x10000
    80003300:	00003817          	auipc	a6,0x3
    80003304:	7b080813          	addi	a6,a6,1968 # 80006ab0 <uart_tx_buf>
    80003308:	01c0006f          	j	80003324 <uartstart+0x50>
    8000330c:	0006c703          	lbu	a4,0(a3)
    80003310:	00f63023          	sd	a5,0(a2)
    80003314:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003318:	00063783          	ld	a5,0(a2)
    8000331c:	00053703          	ld	a4,0(a0)
    80003320:	00f70e63          	beq	a4,a5,8000333c <uartstart+0x68>
    80003324:	01f7f713          	andi	a4,a5,31
    80003328:	00e806b3          	add	a3,a6,a4
    8000332c:	0055c703          	lbu	a4,5(a1)
    80003330:	00178793          	addi	a5,a5,1
    80003334:	02077713          	andi	a4,a4,32
    80003338:	fc071ae3          	bnez	a4,8000330c <uartstart+0x38>
    8000333c:	00813403          	ld	s0,8(sp)
    80003340:	01010113          	addi	sp,sp,16
    80003344:	00008067          	ret

0000000080003348 <uartgetc>:
    80003348:	ff010113          	addi	sp,sp,-16
    8000334c:	00813423          	sd	s0,8(sp)
    80003350:	01010413          	addi	s0,sp,16
    80003354:	10000737          	lui	a4,0x10000
    80003358:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000335c:	0017f793          	andi	a5,a5,1
    80003360:	00078c63          	beqz	a5,80003378 <uartgetc+0x30>
    80003364:	00074503          	lbu	a0,0(a4)
    80003368:	0ff57513          	andi	a0,a0,255
    8000336c:	00813403          	ld	s0,8(sp)
    80003370:	01010113          	addi	sp,sp,16
    80003374:	00008067          	ret
    80003378:	fff00513          	li	a0,-1
    8000337c:	ff1ff06f          	j	8000336c <uartgetc+0x24>

0000000080003380 <uartintr>:
    80003380:	100007b7          	lui	a5,0x10000
    80003384:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003388:	0017f793          	andi	a5,a5,1
    8000338c:	0a078463          	beqz	a5,80003434 <uartintr+0xb4>
    80003390:	fe010113          	addi	sp,sp,-32
    80003394:	00813823          	sd	s0,16(sp)
    80003398:	00913423          	sd	s1,8(sp)
    8000339c:	00113c23          	sd	ra,24(sp)
    800033a0:	02010413          	addi	s0,sp,32
    800033a4:	100004b7          	lui	s1,0x10000
    800033a8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800033ac:	0ff57513          	andi	a0,a0,255
    800033b0:	fffff097          	auipc	ra,0xfffff
    800033b4:	534080e7          	jalr	1332(ra) # 800028e4 <consoleintr>
    800033b8:	0054c783          	lbu	a5,5(s1)
    800033bc:	0017f793          	andi	a5,a5,1
    800033c0:	fe0794e3          	bnez	a5,800033a8 <uartintr+0x28>
    800033c4:	00002617          	auipc	a2,0x2
    800033c8:	46c60613          	addi	a2,a2,1132 # 80005830 <uart_tx_r>
    800033cc:	00002517          	auipc	a0,0x2
    800033d0:	46c50513          	addi	a0,a0,1132 # 80005838 <uart_tx_w>
    800033d4:	00063783          	ld	a5,0(a2)
    800033d8:	00053703          	ld	a4,0(a0)
    800033dc:	04f70263          	beq	a4,a5,80003420 <uartintr+0xa0>
    800033e0:	100005b7          	lui	a1,0x10000
    800033e4:	00003817          	auipc	a6,0x3
    800033e8:	6cc80813          	addi	a6,a6,1740 # 80006ab0 <uart_tx_buf>
    800033ec:	01c0006f          	j	80003408 <uartintr+0x88>
    800033f0:	0006c703          	lbu	a4,0(a3)
    800033f4:	00f63023          	sd	a5,0(a2)
    800033f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800033fc:	00063783          	ld	a5,0(a2)
    80003400:	00053703          	ld	a4,0(a0)
    80003404:	00f70e63          	beq	a4,a5,80003420 <uartintr+0xa0>
    80003408:	01f7f713          	andi	a4,a5,31
    8000340c:	00e806b3          	add	a3,a6,a4
    80003410:	0055c703          	lbu	a4,5(a1)
    80003414:	00178793          	addi	a5,a5,1
    80003418:	02077713          	andi	a4,a4,32
    8000341c:	fc071ae3          	bnez	a4,800033f0 <uartintr+0x70>
    80003420:	01813083          	ld	ra,24(sp)
    80003424:	01013403          	ld	s0,16(sp)
    80003428:	00813483          	ld	s1,8(sp)
    8000342c:	02010113          	addi	sp,sp,32
    80003430:	00008067          	ret
    80003434:	00002617          	auipc	a2,0x2
    80003438:	3fc60613          	addi	a2,a2,1020 # 80005830 <uart_tx_r>
    8000343c:	00002517          	auipc	a0,0x2
    80003440:	3fc50513          	addi	a0,a0,1020 # 80005838 <uart_tx_w>
    80003444:	00063783          	ld	a5,0(a2)
    80003448:	00053703          	ld	a4,0(a0)
    8000344c:	04f70263          	beq	a4,a5,80003490 <uartintr+0x110>
    80003450:	100005b7          	lui	a1,0x10000
    80003454:	00003817          	auipc	a6,0x3
    80003458:	65c80813          	addi	a6,a6,1628 # 80006ab0 <uart_tx_buf>
    8000345c:	01c0006f          	j	80003478 <uartintr+0xf8>
    80003460:	0006c703          	lbu	a4,0(a3)
    80003464:	00f63023          	sd	a5,0(a2)
    80003468:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000346c:	00063783          	ld	a5,0(a2)
    80003470:	00053703          	ld	a4,0(a0)
    80003474:	02f70063          	beq	a4,a5,80003494 <uartintr+0x114>
    80003478:	01f7f713          	andi	a4,a5,31
    8000347c:	00e806b3          	add	a3,a6,a4
    80003480:	0055c703          	lbu	a4,5(a1)
    80003484:	00178793          	addi	a5,a5,1
    80003488:	02077713          	andi	a4,a4,32
    8000348c:	fc071ae3          	bnez	a4,80003460 <uartintr+0xe0>
    80003490:	00008067          	ret
    80003494:	00008067          	ret

0000000080003498 <kinit>:
    80003498:	fc010113          	addi	sp,sp,-64
    8000349c:	02913423          	sd	s1,40(sp)
    800034a0:	fffff7b7          	lui	a5,0xfffff
    800034a4:	00004497          	auipc	s1,0x4
    800034a8:	63b48493          	addi	s1,s1,1595 # 80007adf <end+0xfff>
    800034ac:	02813823          	sd	s0,48(sp)
    800034b0:	01313c23          	sd	s3,24(sp)
    800034b4:	00f4f4b3          	and	s1,s1,a5
    800034b8:	02113c23          	sd	ra,56(sp)
    800034bc:	03213023          	sd	s2,32(sp)
    800034c0:	01413823          	sd	s4,16(sp)
    800034c4:	01513423          	sd	s5,8(sp)
    800034c8:	04010413          	addi	s0,sp,64
    800034cc:	000017b7          	lui	a5,0x1
    800034d0:	01100993          	li	s3,17
    800034d4:	00f487b3          	add	a5,s1,a5
    800034d8:	01b99993          	slli	s3,s3,0x1b
    800034dc:	06f9e063          	bltu	s3,a5,8000353c <kinit+0xa4>
    800034e0:	00003a97          	auipc	s5,0x3
    800034e4:	600a8a93          	addi	s5,s5,1536 # 80006ae0 <end>
    800034e8:	0754ec63          	bltu	s1,s5,80003560 <kinit+0xc8>
    800034ec:	0734fa63          	bgeu	s1,s3,80003560 <kinit+0xc8>
    800034f0:	00088a37          	lui	s4,0x88
    800034f4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800034f8:	00002917          	auipc	s2,0x2
    800034fc:	34890913          	addi	s2,s2,840 # 80005840 <kmem>
    80003500:	00ca1a13          	slli	s4,s4,0xc
    80003504:	0140006f          	j	80003518 <kinit+0x80>
    80003508:	000017b7          	lui	a5,0x1
    8000350c:	00f484b3          	add	s1,s1,a5
    80003510:	0554e863          	bltu	s1,s5,80003560 <kinit+0xc8>
    80003514:	0534f663          	bgeu	s1,s3,80003560 <kinit+0xc8>
    80003518:	00001637          	lui	a2,0x1
    8000351c:	00100593          	li	a1,1
    80003520:	00048513          	mv	a0,s1
    80003524:	00000097          	auipc	ra,0x0
    80003528:	5e4080e7          	jalr	1508(ra) # 80003b08 <__memset>
    8000352c:	00093783          	ld	a5,0(s2)
    80003530:	00f4b023          	sd	a5,0(s1)
    80003534:	00993023          	sd	s1,0(s2)
    80003538:	fd4498e3          	bne	s1,s4,80003508 <kinit+0x70>
    8000353c:	03813083          	ld	ra,56(sp)
    80003540:	03013403          	ld	s0,48(sp)
    80003544:	02813483          	ld	s1,40(sp)
    80003548:	02013903          	ld	s2,32(sp)
    8000354c:	01813983          	ld	s3,24(sp)
    80003550:	01013a03          	ld	s4,16(sp)
    80003554:	00813a83          	ld	s5,8(sp)
    80003558:	04010113          	addi	sp,sp,64
    8000355c:	00008067          	ret
    80003560:	00002517          	auipc	a0,0x2
    80003564:	cf850513          	addi	a0,a0,-776 # 80005258 <digits+0x18>
    80003568:	fffff097          	auipc	ra,0xfffff
    8000356c:	4b4080e7          	jalr	1204(ra) # 80002a1c <panic>

0000000080003570 <freerange>:
    80003570:	fc010113          	addi	sp,sp,-64
    80003574:	000017b7          	lui	a5,0x1
    80003578:	02913423          	sd	s1,40(sp)
    8000357c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003580:	009504b3          	add	s1,a0,s1
    80003584:	fffff537          	lui	a0,0xfffff
    80003588:	02813823          	sd	s0,48(sp)
    8000358c:	02113c23          	sd	ra,56(sp)
    80003590:	03213023          	sd	s2,32(sp)
    80003594:	01313c23          	sd	s3,24(sp)
    80003598:	01413823          	sd	s4,16(sp)
    8000359c:	01513423          	sd	s5,8(sp)
    800035a0:	01613023          	sd	s6,0(sp)
    800035a4:	04010413          	addi	s0,sp,64
    800035a8:	00a4f4b3          	and	s1,s1,a0
    800035ac:	00f487b3          	add	a5,s1,a5
    800035b0:	06f5e463          	bltu	a1,a5,80003618 <freerange+0xa8>
    800035b4:	00003a97          	auipc	s5,0x3
    800035b8:	52ca8a93          	addi	s5,s5,1324 # 80006ae0 <end>
    800035bc:	0954e263          	bltu	s1,s5,80003640 <freerange+0xd0>
    800035c0:	01100993          	li	s3,17
    800035c4:	01b99993          	slli	s3,s3,0x1b
    800035c8:	0734fc63          	bgeu	s1,s3,80003640 <freerange+0xd0>
    800035cc:	00058a13          	mv	s4,a1
    800035d0:	00002917          	auipc	s2,0x2
    800035d4:	27090913          	addi	s2,s2,624 # 80005840 <kmem>
    800035d8:	00002b37          	lui	s6,0x2
    800035dc:	0140006f          	j	800035f0 <freerange+0x80>
    800035e0:	000017b7          	lui	a5,0x1
    800035e4:	00f484b3          	add	s1,s1,a5
    800035e8:	0554ec63          	bltu	s1,s5,80003640 <freerange+0xd0>
    800035ec:	0534fa63          	bgeu	s1,s3,80003640 <freerange+0xd0>
    800035f0:	00001637          	lui	a2,0x1
    800035f4:	00100593          	li	a1,1
    800035f8:	00048513          	mv	a0,s1
    800035fc:	00000097          	auipc	ra,0x0
    80003600:	50c080e7          	jalr	1292(ra) # 80003b08 <__memset>
    80003604:	00093703          	ld	a4,0(s2)
    80003608:	016487b3          	add	a5,s1,s6
    8000360c:	00e4b023          	sd	a4,0(s1)
    80003610:	00993023          	sd	s1,0(s2)
    80003614:	fcfa76e3          	bgeu	s4,a5,800035e0 <freerange+0x70>
    80003618:	03813083          	ld	ra,56(sp)
    8000361c:	03013403          	ld	s0,48(sp)
    80003620:	02813483          	ld	s1,40(sp)
    80003624:	02013903          	ld	s2,32(sp)
    80003628:	01813983          	ld	s3,24(sp)
    8000362c:	01013a03          	ld	s4,16(sp)
    80003630:	00813a83          	ld	s5,8(sp)
    80003634:	00013b03          	ld	s6,0(sp)
    80003638:	04010113          	addi	sp,sp,64
    8000363c:	00008067          	ret
    80003640:	00002517          	auipc	a0,0x2
    80003644:	c1850513          	addi	a0,a0,-1000 # 80005258 <digits+0x18>
    80003648:	fffff097          	auipc	ra,0xfffff
    8000364c:	3d4080e7          	jalr	980(ra) # 80002a1c <panic>

0000000080003650 <kfree>:
    80003650:	fe010113          	addi	sp,sp,-32
    80003654:	00813823          	sd	s0,16(sp)
    80003658:	00113c23          	sd	ra,24(sp)
    8000365c:	00913423          	sd	s1,8(sp)
    80003660:	02010413          	addi	s0,sp,32
    80003664:	03451793          	slli	a5,a0,0x34
    80003668:	04079c63          	bnez	a5,800036c0 <kfree+0x70>
    8000366c:	00003797          	auipc	a5,0x3
    80003670:	47478793          	addi	a5,a5,1140 # 80006ae0 <end>
    80003674:	00050493          	mv	s1,a0
    80003678:	04f56463          	bltu	a0,a5,800036c0 <kfree+0x70>
    8000367c:	01100793          	li	a5,17
    80003680:	01b79793          	slli	a5,a5,0x1b
    80003684:	02f57e63          	bgeu	a0,a5,800036c0 <kfree+0x70>
    80003688:	00001637          	lui	a2,0x1
    8000368c:	00100593          	li	a1,1
    80003690:	00000097          	auipc	ra,0x0
    80003694:	478080e7          	jalr	1144(ra) # 80003b08 <__memset>
    80003698:	00002797          	auipc	a5,0x2
    8000369c:	1a878793          	addi	a5,a5,424 # 80005840 <kmem>
    800036a0:	0007b703          	ld	a4,0(a5)
    800036a4:	01813083          	ld	ra,24(sp)
    800036a8:	01013403          	ld	s0,16(sp)
    800036ac:	00e4b023          	sd	a4,0(s1)
    800036b0:	0097b023          	sd	s1,0(a5)
    800036b4:	00813483          	ld	s1,8(sp)
    800036b8:	02010113          	addi	sp,sp,32
    800036bc:	00008067          	ret
    800036c0:	00002517          	auipc	a0,0x2
    800036c4:	b9850513          	addi	a0,a0,-1128 # 80005258 <digits+0x18>
    800036c8:	fffff097          	auipc	ra,0xfffff
    800036cc:	354080e7          	jalr	852(ra) # 80002a1c <panic>

00000000800036d0 <kalloc>:
    800036d0:	fe010113          	addi	sp,sp,-32
    800036d4:	00813823          	sd	s0,16(sp)
    800036d8:	00913423          	sd	s1,8(sp)
    800036dc:	00113c23          	sd	ra,24(sp)
    800036e0:	02010413          	addi	s0,sp,32
    800036e4:	00002797          	auipc	a5,0x2
    800036e8:	15c78793          	addi	a5,a5,348 # 80005840 <kmem>
    800036ec:	0007b483          	ld	s1,0(a5)
    800036f0:	02048063          	beqz	s1,80003710 <kalloc+0x40>
    800036f4:	0004b703          	ld	a4,0(s1)
    800036f8:	00001637          	lui	a2,0x1
    800036fc:	00500593          	li	a1,5
    80003700:	00048513          	mv	a0,s1
    80003704:	00e7b023          	sd	a4,0(a5)
    80003708:	00000097          	auipc	ra,0x0
    8000370c:	400080e7          	jalr	1024(ra) # 80003b08 <__memset>
    80003710:	01813083          	ld	ra,24(sp)
    80003714:	01013403          	ld	s0,16(sp)
    80003718:	00048513          	mv	a0,s1
    8000371c:	00813483          	ld	s1,8(sp)
    80003720:	02010113          	addi	sp,sp,32
    80003724:	00008067          	ret

0000000080003728 <initlock>:
    80003728:	ff010113          	addi	sp,sp,-16
    8000372c:	00813423          	sd	s0,8(sp)
    80003730:	01010413          	addi	s0,sp,16
    80003734:	00813403          	ld	s0,8(sp)
    80003738:	00b53423          	sd	a1,8(a0)
    8000373c:	00052023          	sw	zero,0(a0)
    80003740:	00053823          	sd	zero,16(a0)
    80003744:	01010113          	addi	sp,sp,16
    80003748:	00008067          	ret

000000008000374c <acquire>:
    8000374c:	fe010113          	addi	sp,sp,-32
    80003750:	00813823          	sd	s0,16(sp)
    80003754:	00913423          	sd	s1,8(sp)
    80003758:	00113c23          	sd	ra,24(sp)
    8000375c:	01213023          	sd	s2,0(sp)
    80003760:	02010413          	addi	s0,sp,32
    80003764:	00050493          	mv	s1,a0
    80003768:	10002973          	csrr	s2,sstatus
    8000376c:	100027f3          	csrr	a5,sstatus
    80003770:	ffd7f793          	andi	a5,a5,-3
    80003774:	10079073          	csrw	sstatus,a5
    80003778:	fffff097          	auipc	ra,0xfffff
    8000377c:	8e4080e7          	jalr	-1820(ra) # 8000205c <mycpu>
    80003780:	07852783          	lw	a5,120(a0)
    80003784:	06078e63          	beqz	a5,80003800 <acquire+0xb4>
    80003788:	fffff097          	auipc	ra,0xfffff
    8000378c:	8d4080e7          	jalr	-1836(ra) # 8000205c <mycpu>
    80003790:	07852783          	lw	a5,120(a0)
    80003794:	0004a703          	lw	a4,0(s1)
    80003798:	0017879b          	addiw	a5,a5,1
    8000379c:	06f52c23          	sw	a5,120(a0)
    800037a0:	04071063          	bnez	a4,800037e0 <acquire+0x94>
    800037a4:	00100713          	li	a4,1
    800037a8:	00070793          	mv	a5,a4
    800037ac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800037b0:	0007879b          	sext.w	a5,a5
    800037b4:	fe079ae3          	bnez	a5,800037a8 <acquire+0x5c>
    800037b8:	0ff0000f          	fence
    800037bc:	fffff097          	auipc	ra,0xfffff
    800037c0:	8a0080e7          	jalr	-1888(ra) # 8000205c <mycpu>
    800037c4:	01813083          	ld	ra,24(sp)
    800037c8:	01013403          	ld	s0,16(sp)
    800037cc:	00a4b823          	sd	a0,16(s1)
    800037d0:	00013903          	ld	s2,0(sp)
    800037d4:	00813483          	ld	s1,8(sp)
    800037d8:	02010113          	addi	sp,sp,32
    800037dc:	00008067          	ret
    800037e0:	0104b903          	ld	s2,16(s1)
    800037e4:	fffff097          	auipc	ra,0xfffff
    800037e8:	878080e7          	jalr	-1928(ra) # 8000205c <mycpu>
    800037ec:	faa91ce3          	bne	s2,a0,800037a4 <acquire+0x58>
    800037f0:	00002517          	auipc	a0,0x2
    800037f4:	a7050513          	addi	a0,a0,-1424 # 80005260 <digits+0x20>
    800037f8:	fffff097          	auipc	ra,0xfffff
    800037fc:	224080e7          	jalr	548(ra) # 80002a1c <panic>
    80003800:	00195913          	srli	s2,s2,0x1
    80003804:	fffff097          	auipc	ra,0xfffff
    80003808:	858080e7          	jalr	-1960(ra) # 8000205c <mycpu>
    8000380c:	00197913          	andi	s2,s2,1
    80003810:	07252e23          	sw	s2,124(a0)
    80003814:	f75ff06f          	j	80003788 <acquire+0x3c>

0000000080003818 <release>:
    80003818:	fe010113          	addi	sp,sp,-32
    8000381c:	00813823          	sd	s0,16(sp)
    80003820:	00113c23          	sd	ra,24(sp)
    80003824:	00913423          	sd	s1,8(sp)
    80003828:	01213023          	sd	s2,0(sp)
    8000382c:	02010413          	addi	s0,sp,32
    80003830:	00052783          	lw	a5,0(a0)
    80003834:	00079a63          	bnez	a5,80003848 <release+0x30>
    80003838:	00002517          	auipc	a0,0x2
    8000383c:	a3050513          	addi	a0,a0,-1488 # 80005268 <digits+0x28>
    80003840:	fffff097          	auipc	ra,0xfffff
    80003844:	1dc080e7          	jalr	476(ra) # 80002a1c <panic>
    80003848:	01053903          	ld	s2,16(a0)
    8000384c:	00050493          	mv	s1,a0
    80003850:	fffff097          	auipc	ra,0xfffff
    80003854:	80c080e7          	jalr	-2036(ra) # 8000205c <mycpu>
    80003858:	fea910e3          	bne	s2,a0,80003838 <release+0x20>
    8000385c:	0004b823          	sd	zero,16(s1)
    80003860:	0ff0000f          	fence
    80003864:	0f50000f          	fence	iorw,ow
    80003868:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000386c:	ffffe097          	auipc	ra,0xffffe
    80003870:	7f0080e7          	jalr	2032(ra) # 8000205c <mycpu>
    80003874:	100027f3          	csrr	a5,sstatus
    80003878:	0027f793          	andi	a5,a5,2
    8000387c:	04079a63          	bnez	a5,800038d0 <release+0xb8>
    80003880:	07852783          	lw	a5,120(a0)
    80003884:	02f05e63          	blez	a5,800038c0 <release+0xa8>
    80003888:	fff7871b          	addiw	a4,a5,-1
    8000388c:	06e52c23          	sw	a4,120(a0)
    80003890:	00071c63          	bnez	a4,800038a8 <release+0x90>
    80003894:	07c52783          	lw	a5,124(a0)
    80003898:	00078863          	beqz	a5,800038a8 <release+0x90>
    8000389c:	100027f3          	csrr	a5,sstatus
    800038a0:	0027e793          	ori	a5,a5,2
    800038a4:	10079073          	csrw	sstatus,a5
    800038a8:	01813083          	ld	ra,24(sp)
    800038ac:	01013403          	ld	s0,16(sp)
    800038b0:	00813483          	ld	s1,8(sp)
    800038b4:	00013903          	ld	s2,0(sp)
    800038b8:	02010113          	addi	sp,sp,32
    800038bc:	00008067          	ret
    800038c0:	00002517          	auipc	a0,0x2
    800038c4:	9c850513          	addi	a0,a0,-1592 # 80005288 <digits+0x48>
    800038c8:	fffff097          	auipc	ra,0xfffff
    800038cc:	154080e7          	jalr	340(ra) # 80002a1c <panic>
    800038d0:	00002517          	auipc	a0,0x2
    800038d4:	9a050513          	addi	a0,a0,-1632 # 80005270 <digits+0x30>
    800038d8:	fffff097          	auipc	ra,0xfffff
    800038dc:	144080e7          	jalr	324(ra) # 80002a1c <panic>

00000000800038e0 <holding>:
    800038e0:	00052783          	lw	a5,0(a0)
    800038e4:	00079663          	bnez	a5,800038f0 <holding+0x10>
    800038e8:	00000513          	li	a0,0
    800038ec:	00008067          	ret
    800038f0:	fe010113          	addi	sp,sp,-32
    800038f4:	00813823          	sd	s0,16(sp)
    800038f8:	00913423          	sd	s1,8(sp)
    800038fc:	00113c23          	sd	ra,24(sp)
    80003900:	02010413          	addi	s0,sp,32
    80003904:	01053483          	ld	s1,16(a0)
    80003908:	ffffe097          	auipc	ra,0xffffe
    8000390c:	754080e7          	jalr	1876(ra) # 8000205c <mycpu>
    80003910:	01813083          	ld	ra,24(sp)
    80003914:	01013403          	ld	s0,16(sp)
    80003918:	40a48533          	sub	a0,s1,a0
    8000391c:	00153513          	seqz	a0,a0
    80003920:	00813483          	ld	s1,8(sp)
    80003924:	02010113          	addi	sp,sp,32
    80003928:	00008067          	ret

000000008000392c <push_off>:
    8000392c:	fe010113          	addi	sp,sp,-32
    80003930:	00813823          	sd	s0,16(sp)
    80003934:	00113c23          	sd	ra,24(sp)
    80003938:	00913423          	sd	s1,8(sp)
    8000393c:	02010413          	addi	s0,sp,32
    80003940:	100024f3          	csrr	s1,sstatus
    80003944:	100027f3          	csrr	a5,sstatus
    80003948:	ffd7f793          	andi	a5,a5,-3
    8000394c:	10079073          	csrw	sstatus,a5
    80003950:	ffffe097          	auipc	ra,0xffffe
    80003954:	70c080e7          	jalr	1804(ra) # 8000205c <mycpu>
    80003958:	07852783          	lw	a5,120(a0)
    8000395c:	02078663          	beqz	a5,80003988 <push_off+0x5c>
    80003960:	ffffe097          	auipc	ra,0xffffe
    80003964:	6fc080e7          	jalr	1788(ra) # 8000205c <mycpu>
    80003968:	07852783          	lw	a5,120(a0)
    8000396c:	01813083          	ld	ra,24(sp)
    80003970:	01013403          	ld	s0,16(sp)
    80003974:	0017879b          	addiw	a5,a5,1
    80003978:	06f52c23          	sw	a5,120(a0)
    8000397c:	00813483          	ld	s1,8(sp)
    80003980:	02010113          	addi	sp,sp,32
    80003984:	00008067          	ret
    80003988:	0014d493          	srli	s1,s1,0x1
    8000398c:	ffffe097          	auipc	ra,0xffffe
    80003990:	6d0080e7          	jalr	1744(ra) # 8000205c <mycpu>
    80003994:	0014f493          	andi	s1,s1,1
    80003998:	06952e23          	sw	s1,124(a0)
    8000399c:	fc5ff06f          	j	80003960 <push_off+0x34>

00000000800039a0 <pop_off>:
    800039a0:	ff010113          	addi	sp,sp,-16
    800039a4:	00813023          	sd	s0,0(sp)
    800039a8:	00113423          	sd	ra,8(sp)
    800039ac:	01010413          	addi	s0,sp,16
    800039b0:	ffffe097          	auipc	ra,0xffffe
    800039b4:	6ac080e7          	jalr	1708(ra) # 8000205c <mycpu>
    800039b8:	100027f3          	csrr	a5,sstatus
    800039bc:	0027f793          	andi	a5,a5,2
    800039c0:	04079663          	bnez	a5,80003a0c <pop_off+0x6c>
    800039c4:	07852783          	lw	a5,120(a0)
    800039c8:	02f05a63          	blez	a5,800039fc <pop_off+0x5c>
    800039cc:	fff7871b          	addiw	a4,a5,-1
    800039d0:	06e52c23          	sw	a4,120(a0)
    800039d4:	00071c63          	bnez	a4,800039ec <pop_off+0x4c>
    800039d8:	07c52783          	lw	a5,124(a0)
    800039dc:	00078863          	beqz	a5,800039ec <pop_off+0x4c>
    800039e0:	100027f3          	csrr	a5,sstatus
    800039e4:	0027e793          	ori	a5,a5,2
    800039e8:	10079073          	csrw	sstatus,a5
    800039ec:	00813083          	ld	ra,8(sp)
    800039f0:	00013403          	ld	s0,0(sp)
    800039f4:	01010113          	addi	sp,sp,16
    800039f8:	00008067          	ret
    800039fc:	00002517          	auipc	a0,0x2
    80003a00:	88c50513          	addi	a0,a0,-1908 # 80005288 <digits+0x48>
    80003a04:	fffff097          	auipc	ra,0xfffff
    80003a08:	018080e7          	jalr	24(ra) # 80002a1c <panic>
    80003a0c:	00002517          	auipc	a0,0x2
    80003a10:	86450513          	addi	a0,a0,-1948 # 80005270 <digits+0x30>
    80003a14:	fffff097          	auipc	ra,0xfffff
    80003a18:	008080e7          	jalr	8(ra) # 80002a1c <panic>

0000000080003a1c <push_on>:
    80003a1c:	fe010113          	addi	sp,sp,-32
    80003a20:	00813823          	sd	s0,16(sp)
    80003a24:	00113c23          	sd	ra,24(sp)
    80003a28:	00913423          	sd	s1,8(sp)
    80003a2c:	02010413          	addi	s0,sp,32
    80003a30:	100024f3          	csrr	s1,sstatus
    80003a34:	100027f3          	csrr	a5,sstatus
    80003a38:	0027e793          	ori	a5,a5,2
    80003a3c:	10079073          	csrw	sstatus,a5
    80003a40:	ffffe097          	auipc	ra,0xffffe
    80003a44:	61c080e7          	jalr	1564(ra) # 8000205c <mycpu>
    80003a48:	07852783          	lw	a5,120(a0)
    80003a4c:	02078663          	beqz	a5,80003a78 <push_on+0x5c>
    80003a50:	ffffe097          	auipc	ra,0xffffe
    80003a54:	60c080e7          	jalr	1548(ra) # 8000205c <mycpu>
    80003a58:	07852783          	lw	a5,120(a0)
    80003a5c:	01813083          	ld	ra,24(sp)
    80003a60:	01013403          	ld	s0,16(sp)
    80003a64:	0017879b          	addiw	a5,a5,1
    80003a68:	06f52c23          	sw	a5,120(a0)
    80003a6c:	00813483          	ld	s1,8(sp)
    80003a70:	02010113          	addi	sp,sp,32
    80003a74:	00008067          	ret
    80003a78:	0014d493          	srli	s1,s1,0x1
    80003a7c:	ffffe097          	auipc	ra,0xffffe
    80003a80:	5e0080e7          	jalr	1504(ra) # 8000205c <mycpu>
    80003a84:	0014f493          	andi	s1,s1,1
    80003a88:	06952e23          	sw	s1,124(a0)
    80003a8c:	fc5ff06f          	j	80003a50 <push_on+0x34>

0000000080003a90 <pop_on>:
    80003a90:	ff010113          	addi	sp,sp,-16
    80003a94:	00813023          	sd	s0,0(sp)
    80003a98:	00113423          	sd	ra,8(sp)
    80003a9c:	01010413          	addi	s0,sp,16
    80003aa0:	ffffe097          	auipc	ra,0xffffe
    80003aa4:	5bc080e7          	jalr	1468(ra) # 8000205c <mycpu>
    80003aa8:	100027f3          	csrr	a5,sstatus
    80003aac:	0027f793          	andi	a5,a5,2
    80003ab0:	04078463          	beqz	a5,80003af8 <pop_on+0x68>
    80003ab4:	07852783          	lw	a5,120(a0)
    80003ab8:	02f05863          	blez	a5,80003ae8 <pop_on+0x58>
    80003abc:	fff7879b          	addiw	a5,a5,-1
    80003ac0:	06f52c23          	sw	a5,120(a0)
    80003ac4:	07853783          	ld	a5,120(a0)
    80003ac8:	00079863          	bnez	a5,80003ad8 <pop_on+0x48>
    80003acc:	100027f3          	csrr	a5,sstatus
    80003ad0:	ffd7f793          	andi	a5,a5,-3
    80003ad4:	10079073          	csrw	sstatus,a5
    80003ad8:	00813083          	ld	ra,8(sp)
    80003adc:	00013403          	ld	s0,0(sp)
    80003ae0:	01010113          	addi	sp,sp,16
    80003ae4:	00008067          	ret
    80003ae8:	00001517          	auipc	a0,0x1
    80003aec:	7c850513          	addi	a0,a0,1992 # 800052b0 <digits+0x70>
    80003af0:	fffff097          	auipc	ra,0xfffff
    80003af4:	f2c080e7          	jalr	-212(ra) # 80002a1c <panic>
    80003af8:	00001517          	auipc	a0,0x1
    80003afc:	79850513          	addi	a0,a0,1944 # 80005290 <digits+0x50>
    80003b00:	fffff097          	auipc	ra,0xfffff
    80003b04:	f1c080e7          	jalr	-228(ra) # 80002a1c <panic>

0000000080003b08 <__memset>:
    80003b08:	ff010113          	addi	sp,sp,-16
    80003b0c:	00813423          	sd	s0,8(sp)
    80003b10:	01010413          	addi	s0,sp,16
    80003b14:	1a060e63          	beqz	a2,80003cd0 <__memset+0x1c8>
    80003b18:	40a007b3          	neg	a5,a0
    80003b1c:	0077f793          	andi	a5,a5,7
    80003b20:	00778693          	addi	a3,a5,7
    80003b24:	00b00813          	li	a6,11
    80003b28:	0ff5f593          	andi	a1,a1,255
    80003b2c:	fff6071b          	addiw	a4,a2,-1
    80003b30:	1b06e663          	bltu	a3,a6,80003cdc <__memset+0x1d4>
    80003b34:	1cd76463          	bltu	a4,a3,80003cfc <__memset+0x1f4>
    80003b38:	1a078e63          	beqz	a5,80003cf4 <__memset+0x1ec>
    80003b3c:	00b50023          	sb	a1,0(a0)
    80003b40:	00100713          	li	a4,1
    80003b44:	1ae78463          	beq	a5,a4,80003cec <__memset+0x1e4>
    80003b48:	00b500a3          	sb	a1,1(a0)
    80003b4c:	00200713          	li	a4,2
    80003b50:	1ae78a63          	beq	a5,a4,80003d04 <__memset+0x1fc>
    80003b54:	00b50123          	sb	a1,2(a0)
    80003b58:	00300713          	li	a4,3
    80003b5c:	18e78463          	beq	a5,a4,80003ce4 <__memset+0x1dc>
    80003b60:	00b501a3          	sb	a1,3(a0)
    80003b64:	00400713          	li	a4,4
    80003b68:	1ae78263          	beq	a5,a4,80003d0c <__memset+0x204>
    80003b6c:	00b50223          	sb	a1,4(a0)
    80003b70:	00500713          	li	a4,5
    80003b74:	1ae78063          	beq	a5,a4,80003d14 <__memset+0x20c>
    80003b78:	00b502a3          	sb	a1,5(a0)
    80003b7c:	00700713          	li	a4,7
    80003b80:	18e79e63          	bne	a5,a4,80003d1c <__memset+0x214>
    80003b84:	00b50323          	sb	a1,6(a0)
    80003b88:	00700e93          	li	t4,7
    80003b8c:	00859713          	slli	a4,a1,0x8
    80003b90:	00e5e733          	or	a4,a1,a4
    80003b94:	01059e13          	slli	t3,a1,0x10
    80003b98:	01c76e33          	or	t3,a4,t3
    80003b9c:	01859313          	slli	t1,a1,0x18
    80003ba0:	006e6333          	or	t1,t3,t1
    80003ba4:	02059893          	slli	a7,a1,0x20
    80003ba8:	40f60e3b          	subw	t3,a2,a5
    80003bac:	011368b3          	or	a7,t1,a7
    80003bb0:	02859813          	slli	a6,a1,0x28
    80003bb4:	0108e833          	or	a6,a7,a6
    80003bb8:	03059693          	slli	a3,a1,0x30
    80003bbc:	003e589b          	srliw	a7,t3,0x3
    80003bc0:	00d866b3          	or	a3,a6,a3
    80003bc4:	03859713          	slli	a4,a1,0x38
    80003bc8:	00389813          	slli	a6,a7,0x3
    80003bcc:	00f507b3          	add	a5,a0,a5
    80003bd0:	00e6e733          	or	a4,a3,a4
    80003bd4:	000e089b          	sext.w	a7,t3
    80003bd8:	00f806b3          	add	a3,a6,a5
    80003bdc:	00e7b023          	sd	a4,0(a5)
    80003be0:	00878793          	addi	a5,a5,8
    80003be4:	fed79ce3          	bne	a5,a3,80003bdc <__memset+0xd4>
    80003be8:	ff8e7793          	andi	a5,t3,-8
    80003bec:	0007871b          	sext.w	a4,a5
    80003bf0:	01d787bb          	addw	a5,a5,t4
    80003bf4:	0ce88e63          	beq	a7,a4,80003cd0 <__memset+0x1c8>
    80003bf8:	00f50733          	add	a4,a0,a5
    80003bfc:	00b70023          	sb	a1,0(a4)
    80003c00:	0017871b          	addiw	a4,a5,1
    80003c04:	0cc77663          	bgeu	a4,a2,80003cd0 <__memset+0x1c8>
    80003c08:	00e50733          	add	a4,a0,a4
    80003c0c:	00b70023          	sb	a1,0(a4)
    80003c10:	0027871b          	addiw	a4,a5,2
    80003c14:	0ac77e63          	bgeu	a4,a2,80003cd0 <__memset+0x1c8>
    80003c18:	00e50733          	add	a4,a0,a4
    80003c1c:	00b70023          	sb	a1,0(a4)
    80003c20:	0037871b          	addiw	a4,a5,3
    80003c24:	0ac77663          	bgeu	a4,a2,80003cd0 <__memset+0x1c8>
    80003c28:	00e50733          	add	a4,a0,a4
    80003c2c:	00b70023          	sb	a1,0(a4)
    80003c30:	0047871b          	addiw	a4,a5,4
    80003c34:	08c77e63          	bgeu	a4,a2,80003cd0 <__memset+0x1c8>
    80003c38:	00e50733          	add	a4,a0,a4
    80003c3c:	00b70023          	sb	a1,0(a4)
    80003c40:	0057871b          	addiw	a4,a5,5
    80003c44:	08c77663          	bgeu	a4,a2,80003cd0 <__memset+0x1c8>
    80003c48:	00e50733          	add	a4,a0,a4
    80003c4c:	00b70023          	sb	a1,0(a4)
    80003c50:	0067871b          	addiw	a4,a5,6
    80003c54:	06c77e63          	bgeu	a4,a2,80003cd0 <__memset+0x1c8>
    80003c58:	00e50733          	add	a4,a0,a4
    80003c5c:	00b70023          	sb	a1,0(a4)
    80003c60:	0077871b          	addiw	a4,a5,7
    80003c64:	06c77663          	bgeu	a4,a2,80003cd0 <__memset+0x1c8>
    80003c68:	00e50733          	add	a4,a0,a4
    80003c6c:	00b70023          	sb	a1,0(a4)
    80003c70:	0087871b          	addiw	a4,a5,8
    80003c74:	04c77e63          	bgeu	a4,a2,80003cd0 <__memset+0x1c8>
    80003c78:	00e50733          	add	a4,a0,a4
    80003c7c:	00b70023          	sb	a1,0(a4)
    80003c80:	0097871b          	addiw	a4,a5,9
    80003c84:	04c77663          	bgeu	a4,a2,80003cd0 <__memset+0x1c8>
    80003c88:	00e50733          	add	a4,a0,a4
    80003c8c:	00b70023          	sb	a1,0(a4)
    80003c90:	00a7871b          	addiw	a4,a5,10
    80003c94:	02c77e63          	bgeu	a4,a2,80003cd0 <__memset+0x1c8>
    80003c98:	00e50733          	add	a4,a0,a4
    80003c9c:	00b70023          	sb	a1,0(a4)
    80003ca0:	00b7871b          	addiw	a4,a5,11
    80003ca4:	02c77663          	bgeu	a4,a2,80003cd0 <__memset+0x1c8>
    80003ca8:	00e50733          	add	a4,a0,a4
    80003cac:	00b70023          	sb	a1,0(a4)
    80003cb0:	00c7871b          	addiw	a4,a5,12
    80003cb4:	00c77e63          	bgeu	a4,a2,80003cd0 <__memset+0x1c8>
    80003cb8:	00e50733          	add	a4,a0,a4
    80003cbc:	00b70023          	sb	a1,0(a4)
    80003cc0:	00d7879b          	addiw	a5,a5,13
    80003cc4:	00c7f663          	bgeu	a5,a2,80003cd0 <__memset+0x1c8>
    80003cc8:	00f507b3          	add	a5,a0,a5
    80003ccc:	00b78023          	sb	a1,0(a5)
    80003cd0:	00813403          	ld	s0,8(sp)
    80003cd4:	01010113          	addi	sp,sp,16
    80003cd8:	00008067          	ret
    80003cdc:	00b00693          	li	a3,11
    80003ce0:	e55ff06f          	j	80003b34 <__memset+0x2c>
    80003ce4:	00300e93          	li	t4,3
    80003ce8:	ea5ff06f          	j	80003b8c <__memset+0x84>
    80003cec:	00100e93          	li	t4,1
    80003cf0:	e9dff06f          	j	80003b8c <__memset+0x84>
    80003cf4:	00000e93          	li	t4,0
    80003cf8:	e95ff06f          	j	80003b8c <__memset+0x84>
    80003cfc:	00000793          	li	a5,0
    80003d00:	ef9ff06f          	j	80003bf8 <__memset+0xf0>
    80003d04:	00200e93          	li	t4,2
    80003d08:	e85ff06f          	j	80003b8c <__memset+0x84>
    80003d0c:	00400e93          	li	t4,4
    80003d10:	e7dff06f          	j	80003b8c <__memset+0x84>
    80003d14:	00500e93          	li	t4,5
    80003d18:	e75ff06f          	j	80003b8c <__memset+0x84>
    80003d1c:	00600e93          	li	t4,6
    80003d20:	e6dff06f          	j	80003b8c <__memset+0x84>

0000000080003d24 <__memmove>:
    80003d24:	ff010113          	addi	sp,sp,-16
    80003d28:	00813423          	sd	s0,8(sp)
    80003d2c:	01010413          	addi	s0,sp,16
    80003d30:	0e060863          	beqz	a2,80003e20 <__memmove+0xfc>
    80003d34:	fff6069b          	addiw	a3,a2,-1
    80003d38:	0006881b          	sext.w	a6,a3
    80003d3c:	0ea5e863          	bltu	a1,a0,80003e2c <__memmove+0x108>
    80003d40:	00758713          	addi	a4,a1,7
    80003d44:	00a5e7b3          	or	a5,a1,a0
    80003d48:	40a70733          	sub	a4,a4,a0
    80003d4c:	0077f793          	andi	a5,a5,7
    80003d50:	00f73713          	sltiu	a4,a4,15
    80003d54:	00174713          	xori	a4,a4,1
    80003d58:	0017b793          	seqz	a5,a5
    80003d5c:	00e7f7b3          	and	a5,a5,a4
    80003d60:	10078863          	beqz	a5,80003e70 <__memmove+0x14c>
    80003d64:	00900793          	li	a5,9
    80003d68:	1107f463          	bgeu	a5,a6,80003e70 <__memmove+0x14c>
    80003d6c:	0036581b          	srliw	a6,a2,0x3
    80003d70:	fff8081b          	addiw	a6,a6,-1
    80003d74:	02081813          	slli	a6,a6,0x20
    80003d78:	01d85893          	srli	a7,a6,0x1d
    80003d7c:	00858813          	addi	a6,a1,8
    80003d80:	00058793          	mv	a5,a1
    80003d84:	00050713          	mv	a4,a0
    80003d88:	01088833          	add	a6,a7,a6
    80003d8c:	0007b883          	ld	a7,0(a5)
    80003d90:	00878793          	addi	a5,a5,8
    80003d94:	00870713          	addi	a4,a4,8
    80003d98:	ff173c23          	sd	a7,-8(a4)
    80003d9c:	ff0798e3          	bne	a5,a6,80003d8c <__memmove+0x68>
    80003da0:	ff867713          	andi	a4,a2,-8
    80003da4:	02071793          	slli	a5,a4,0x20
    80003da8:	0207d793          	srli	a5,a5,0x20
    80003dac:	00f585b3          	add	a1,a1,a5
    80003db0:	40e686bb          	subw	a3,a3,a4
    80003db4:	00f507b3          	add	a5,a0,a5
    80003db8:	06e60463          	beq	a2,a4,80003e20 <__memmove+0xfc>
    80003dbc:	0005c703          	lbu	a4,0(a1)
    80003dc0:	00e78023          	sb	a4,0(a5)
    80003dc4:	04068e63          	beqz	a3,80003e20 <__memmove+0xfc>
    80003dc8:	0015c603          	lbu	a2,1(a1)
    80003dcc:	00100713          	li	a4,1
    80003dd0:	00c780a3          	sb	a2,1(a5)
    80003dd4:	04e68663          	beq	a3,a4,80003e20 <__memmove+0xfc>
    80003dd8:	0025c603          	lbu	a2,2(a1)
    80003ddc:	00200713          	li	a4,2
    80003de0:	00c78123          	sb	a2,2(a5)
    80003de4:	02e68e63          	beq	a3,a4,80003e20 <__memmove+0xfc>
    80003de8:	0035c603          	lbu	a2,3(a1)
    80003dec:	00300713          	li	a4,3
    80003df0:	00c781a3          	sb	a2,3(a5)
    80003df4:	02e68663          	beq	a3,a4,80003e20 <__memmove+0xfc>
    80003df8:	0045c603          	lbu	a2,4(a1)
    80003dfc:	00400713          	li	a4,4
    80003e00:	00c78223          	sb	a2,4(a5)
    80003e04:	00e68e63          	beq	a3,a4,80003e20 <__memmove+0xfc>
    80003e08:	0055c603          	lbu	a2,5(a1)
    80003e0c:	00500713          	li	a4,5
    80003e10:	00c782a3          	sb	a2,5(a5)
    80003e14:	00e68663          	beq	a3,a4,80003e20 <__memmove+0xfc>
    80003e18:	0065c703          	lbu	a4,6(a1)
    80003e1c:	00e78323          	sb	a4,6(a5)
    80003e20:	00813403          	ld	s0,8(sp)
    80003e24:	01010113          	addi	sp,sp,16
    80003e28:	00008067          	ret
    80003e2c:	02061713          	slli	a4,a2,0x20
    80003e30:	02075713          	srli	a4,a4,0x20
    80003e34:	00e587b3          	add	a5,a1,a4
    80003e38:	f0f574e3          	bgeu	a0,a5,80003d40 <__memmove+0x1c>
    80003e3c:	02069613          	slli	a2,a3,0x20
    80003e40:	02065613          	srli	a2,a2,0x20
    80003e44:	fff64613          	not	a2,a2
    80003e48:	00e50733          	add	a4,a0,a4
    80003e4c:	00c78633          	add	a2,a5,a2
    80003e50:	fff7c683          	lbu	a3,-1(a5)
    80003e54:	fff78793          	addi	a5,a5,-1
    80003e58:	fff70713          	addi	a4,a4,-1
    80003e5c:	00d70023          	sb	a3,0(a4)
    80003e60:	fec798e3          	bne	a5,a2,80003e50 <__memmove+0x12c>
    80003e64:	00813403          	ld	s0,8(sp)
    80003e68:	01010113          	addi	sp,sp,16
    80003e6c:	00008067          	ret
    80003e70:	02069713          	slli	a4,a3,0x20
    80003e74:	02075713          	srli	a4,a4,0x20
    80003e78:	00170713          	addi	a4,a4,1
    80003e7c:	00e50733          	add	a4,a0,a4
    80003e80:	00050793          	mv	a5,a0
    80003e84:	0005c683          	lbu	a3,0(a1)
    80003e88:	00178793          	addi	a5,a5,1
    80003e8c:	00158593          	addi	a1,a1,1
    80003e90:	fed78fa3          	sb	a3,-1(a5)
    80003e94:	fee798e3          	bne	a5,a4,80003e84 <__memmove+0x160>
    80003e98:	f89ff06f          	j	80003e20 <__memmove+0xfc>

0000000080003e9c <__mem_free>:
    80003e9c:	ff010113          	addi	sp,sp,-16
    80003ea0:	00813423          	sd	s0,8(sp)
    80003ea4:	01010413          	addi	s0,sp,16
    80003ea8:	00002597          	auipc	a1,0x2
    80003eac:	9a058593          	addi	a1,a1,-1632 # 80005848 <freep>
    80003eb0:	0005b783          	ld	a5,0(a1)
    80003eb4:	ff050693          	addi	a3,a0,-16
    80003eb8:	0007b703          	ld	a4,0(a5)
    80003ebc:	00d7fc63          	bgeu	a5,a3,80003ed4 <__mem_free+0x38>
    80003ec0:	00e6ee63          	bltu	a3,a4,80003edc <__mem_free+0x40>
    80003ec4:	00e7fc63          	bgeu	a5,a4,80003edc <__mem_free+0x40>
    80003ec8:	00070793          	mv	a5,a4
    80003ecc:	0007b703          	ld	a4,0(a5)
    80003ed0:	fed7e8e3          	bltu	a5,a3,80003ec0 <__mem_free+0x24>
    80003ed4:	fee7eae3          	bltu	a5,a4,80003ec8 <__mem_free+0x2c>
    80003ed8:	fee6f8e3          	bgeu	a3,a4,80003ec8 <__mem_free+0x2c>
    80003edc:	ff852803          	lw	a6,-8(a0)
    80003ee0:	02081613          	slli	a2,a6,0x20
    80003ee4:	01c65613          	srli	a2,a2,0x1c
    80003ee8:	00c68633          	add	a2,a3,a2
    80003eec:	02c70a63          	beq	a4,a2,80003f20 <__mem_free+0x84>
    80003ef0:	fee53823          	sd	a4,-16(a0)
    80003ef4:	0087a503          	lw	a0,8(a5)
    80003ef8:	02051613          	slli	a2,a0,0x20
    80003efc:	01c65613          	srli	a2,a2,0x1c
    80003f00:	00c78633          	add	a2,a5,a2
    80003f04:	04c68263          	beq	a3,a2,80003f48 <__mem_free+0xac>
    80003f08:	00813403          	ld	s0,8(sp)
    80003f0c:	00d7b023          	sd	a3,0(a5)
    80003f10:	00f5b023          	sd	a5,0(a1)
    80003f14:	00000513          	li	a0,0
    80003f18:	01010113          	addi	sp,sp,16
    80003f1c:	00008067          	ret
    80003f20:	00872603          	lw	a2,8(a4)
    80003f24:	00073703          	ld	a4,0(a4)
    80003f28:	0106083b          	addw	a6,a2,a6
    80003f2c:	ff052c23          	sw	a6,-8(a0)
    80003f30:	fee53823          	sd	a4,-16(a0)
    80003f34:	0087a503          	lw	a0,8(a5)
    80003f38:	02051613          	slli	a2,a0,0x20
    80003f3c:	01c65613          	srli	a2,a2,0x1c
    80003f40:	00c78633          	add	a2,a5,a2
    80003f44:	fcc692e3          	bne	a3,a2,80003f08 <__mem_free+0x6c>
    80003f48:	00813403          	ld	s0,8(sp)
    80003f4c:	0105053b          	addw	a0,a0,a6
    80003f50:	00a7a423          	sw	a0,8(a5)
    80003f54:	00e7b023          	sd	a4,0(a5)
    80003f58:	00f5b023          	sd	a5,0(a1)
    80003f5c:	00000513          	li	a0,0
    80003f60:	01010113          	addi	sp,sp,16
    80003f64:	00008067          	ret

0000000080003f68 <__mem_alloc>:
    80003f68:	fc010113          	addi	sp,sp,-64
    80003f6c:	02813823          	sd	s0,48(sp)
    80003f70:	02913423          	sd	s1,40(sp)
    80003f74:	03213023          	sd	s2,32(sp)
    80003f78:	01513423          	sd	s5,8(sp)
    80003f7c:	02113c23          	sd	ra,56(sp)
    80003f80:	01313c23          	sd	s3,24(sp)
    80003f84:	01413823          	sd	s4,16(sp)
    80003f88:	01613023          	sd	s6,0(sp)
    80003f8c:	04010413          	addi	s0,sp,64
    80003f90:	00002a97          	auipc	s5,0x2
    80003f94:	8b8a8a93          	addi	s5,s5,-1864 # 80005848 <freep>
    80003f98:	00f50913          	addi	s2,a0,15
    80003f9c:	000ab683          	ld	a3,0(s5)
    80003fa0:	00495913          	srli	s2,s2,0x4
    80003fa4:	0019049b          	addiw	s1,s2,1
    80003fa8:	00048913          	mv	s2,s1
    80003fac:	0c068c63          	beqz	a3,80004084 <__mem_alloc+0x11c>
    80003fb0:	0006b503          	ld	a0,0(a3)
    80003fb4:	00852703          	lw	a4,8(a0)
    80003fb8:	10977063          	bgeu	a4,s1,800040b8 <__mem_alloc+0x150>
    80003fbc:	000017b7          	lui	a5,0x1
    80003fc0:	0009099b          	sext.w	s3,s2
    80003fc4:	0af4e863          	bltu	s1,a5,80004074 <__mem_alloc+0x10c>
    80003fc8:	02099a13          	slli	s4,s3,0x20
    80003fcc:	01ca5a13          	srli	s4,s4,0x1c
    80003fd0:	fff00b13          	li	s6,-1
    80003fd4:	0100006f          	j	80003fe4 <__mem_alloc+0x7c>
    80003fd8:	0007b503          	ld	a0,0(a5) # 1000 <_entry-0x7ffff000>
    80003fdc:	00852703          	lw	a4,8(a0)
    80003fe0:	04977463          	bgeu	a4,s1,80004028 <__mem_alloc+0xc0>
    80003fe4:	00050793          	mv	a5,a0
    80003fe8:	fea698e3          	bne	a3,a0,80003fd8 <__mem_alloc+0x70>
    80003fec:	000a0513          	mv	a0,s4
    80003ff0:	00000097          	auipc	ra,0x0
    80003ff4:	1f0080e7          	jalr	496(ra) # 800041e0 <kvmincrease>
    80003ff8:	00050793          	mv	a5,a0
    80003ffc:	01050513          	addi	a0,a0,16
    80004000:	07678e63          	beq	a5,s6,8000407c <__mem_alloc+0x114>
    80004004:	0137a423          	sw	s3,8(a5)
    80004008:	00000097          	auipc	ra,0x0
    8000400c:	e94080e7          	jalr	-364(ra) # 80003e9c <__mem_free>
    80004010:	000ab783          	ld	a5,0(s5)
    80004014:	06078463          	beqz	a5,8000407c <__mem_alloc+0x114>
    80004018:	0007b503          	ld	a0,0(a5)
    8000401c:	00078693          	mv	a3,a5
    80004020:	00852703          	lw	a4,8(a0)
    80004024:	fc9760e3          	bltu	a4,s1,80003fe4 <__mem_alloc+0x7c>
    80004028:	08e48263          	beq	s1,a4,800040ac <__mem_alloc+0x144>
    8000402c:	4127073b          	subw	a4,a4,s2
    80004030:	02071693          	slli	a3,a4,0x20
    80004034:	01c6d693          	srli	a3,a3,0x1c
    80004038:	00e52423          	sw	a4,8(a0)
    8000403c:	00d50533          	add	a0,a0,a3
    80004040:	01252423          	sw	s2,8(a0)
    80004044:	00fab023          	sd	a5,0(s5)
    80004048:	01050513          	addi	a0,a0,16
    8000404c:	03813083          	ld	ra,56(sp)
    80004050:	03013403          	ld	s0,48(sp)
    80004054:	02813483          	ld	s1,40(sp)
    80004058:	02013903          	ld	s2,32(sp)
    8000405c:	01813983          	ld	s3,24(sp)
    80004060:	01013a03          	ld	s4,16(sp)
    80004064:	00813a83          	ld	s5,8(sp)
    80004068:	00013b03          	ld	s6,0(sp)
    8000406c:	04010113          	addi	sp,sp,64
    80004070:	00008067          	ret
    80004074:	000019b7          	lui	s3,0x1
    80004078:	f51ff06f          	j	80003fc8 <__mem_alloc+0x60>
    8000407c:	00000513          	li	a0,0
    80004080:	fcdff06f          	j	8000404c <__mem_alloc+0xe4>
    80004084:	00003797          	auipc	a5,0x3
    80004088:	a4c78793          	addi	a5,a5,-1460 # 80006ad0 <base>
    8000408c:	00078513          	mv	a0,a5
    80004090:	00fab023          	sd	a5,0(s5)
    80004094:	00f7b023          	sd	a5,0(a5)
    80004098:	00000713          	li	a4,0
    8000409c:	00003797          	auipc	a5,0x3
    800040a0:	a207ae23          	sw	zero,-1476(a5) # 80006ad8 <base+0x8>
    800040a4:	00050693          	mv	a3,a0
    800040a8:	f11ff06f          	j	80003fb8 <__mem_alloc+0x50>
    800040ac:	00053703          	ld	a4,0(a0)
    800040b0:	00e7b023          	sd	a4,0(a5)
    800040b4:	f91ff06f          	j	80004044 <__mem_alloc+0xdc>
    800040b8:	00068793          	mv	a5,a3
    800040bc:	f6dff06f          	j	80004028 <__mem_alloc+0xc0>

00000000800040c0 <__putc>:
    800040c0:	fe010113          	addi	sp,sp,-32
    800040c4:	00813823          	sd	s0,16(sp)
    800040c8:	00113c23          	sd	ra,24(sp)
    800040cc:	02010413          	addi	s0,sp,32
    800040d0:	00050793          	mv	a5,a0
    800040d4:	fef40593          	addi	a1,s0,-17
    800040d8:	00100613          	li	a2,1
    800040dc:	00000513          	li	a0,0
    800040e0:	fef407a3          	sb	a5,-17(s0)
    800040e4:	fffff097          	auipc	ra,0xfffff
    800040e8:	918080e7          	jalr	-1768(ra) # 800029fc <console_write>
    800040ec:	01813083          	ld	ra,24(sp)
    800040f0:	01013403          	ld	s0,16(sp)
    800040f4:	02010113          	addi	sp,sp,32
    800040f8:	00008067          	ret

00000000800040fc <__getc>:
    800040fc:	fe010113          	addi	sp,sp,-32
    80004100:	00813823          	sd	s0,16(sp)
    80004104:	00113c23          	sd	ra,24(sp)
    80004108:	02010413          	addi	s0,sp,32
    8000410c:	fe840593          	addi	a1,s0,-24
    80004110:	00100613          	li	a2,1
    80004114:	00000513          	li	a0,0
    80004118:	fffff097          	auipc	ra,0xfffff
    8000411c:	8c4080e7          	jalr	-1852(ra) # 800029dc <console_read>
    80004120:	fe844503          	lbu	a0,-24(s0)
    80004124:	01813083          	ld	ra,24(sp)
    80004128:	01013403          	ld	s0,16(sp)
    8000412c:	02010113          	addi	sp,sp,32
    80004130:	00008067          	ret

0000000080004134 <console_handler>:
    80004134:	fe010113          	addi	sp,sp,-32
    80004138:	00813823          	sd	s0,16(sp)
    8000413c:	00113c23          	sd	ra,24(sp)
    80004140:	00913423          	sd	s1,8(sp)
    80004144:	02010413          	addi	s0,sp,32
    80004148:	14202773          	csrr	a4,scause
    8000414c:	100027f3          	csrr	a5,sstatus
    80004150:	0027f793          	andi	a5,a5,2
    80004154:	06079e63          	bnez	a5,800041d0 <console_handler+0x9c>
    80004158:	00074c63          	bltz	a4,80004170 <console_handler+0x3c>
    8000415c:	01813083          	ld	ra,24(sp)
    80004160:	01013403          	ld	s0,16(sp)
    80004164:	00813483          	ld	s1,8(sp)
    80004168:	02010113          	addi	sp,sp,32
    8000416c:	00008067          	ret
    80004170:	0ff77713          	andi	a4,a4,255
    80004174:	00900793          	li	a5,9
    80004178:	fef712e3          	bne	a4,a5,8000415c <console_handler+0x28>
    8000417c:	ffffe097          	auipc	ra,0xffffe
    80004180:	4b8080e7          	jalr	1208(ra) # 80002634 <plic_claim>
    80004184:	00a00793          	li	a5,10
    80004188:	00050493          	mv	s1,a0
    8000418c:	02f50c63          	beq	a0,a5,800041c4 <console_handler+0x90>
    80004190:	fc0506e3          	beqz	a0,8000415c <console_handler+0x28>
    80004194:	00050593          	mv	a1,a0
    80004198:	00001517          	auipc	a0,0x1
    8000419c:	02050513          	addi	a0,a0,32 # 800051b8 <_ZZ12printIntegermE6digits+0xe0>
    800041a0:	fffff097          	auipc	ra,0xfffff
    800041a4:	8d8080e7          	jalr	-1832(ra) # 80002a78 <__printf>
    800041a8:	01013403          	ld	s0,16(sp)
    800041ac:	01813083          	ld	ra,24(sp)
    800041b0:	00048513          	mv	a0,s1
    800041b4:	00813483          	ld	s1,8(sp)
    800041b8:	02010113          	addi	sp,sp,32
    800041bc:	ffffe317          	auipc	t1,0xffffe
    800041c0:	4b030067          	jr	1200(t1) # 8000266c <plic_complete>
    800041c4:	fffff097          	auipc	ra,0xfffff
    800041c8:	1bc080e7          	jalr	444(ra) # 80003380 <uartintr>
    800041cc:	fddff06f          	j	800041a8 <console_handler+0x74>
    800041d0:	00001517          	auipc	a0,0x1
    800041d4:	0e850513          	addi	a0,a0,232 # 800052b8 <digits+0x78>
    800041d8:	fffff097          	auipc	ra,0xfffff
    800041dc:	844080e7          	jalr	-1980(ra) # 80002a1c <panic>

00000000800041e0 <kvmincrease>:
    800041e0:	fe010113          	addi	sp,sp,-32
    800041e4:	01213023          	sd	s2,0(sp)
    800041e8:	00001937          	lui	s2,0x1
    800041ec:	fff90913          	addi	s2,s2,-1 # fff <_entry-0x7ffff001>
    800041f0:	00813823          	sd	s0,16(sp)
    800041f4:	00113c23          	sd	ra,24(sp)
    800041f8:	00913423          	sd	s1,8(sp)
    800041fc:	02010413          	addi	s0,sp,32
    80004200:	01250933          	add	s2,a0,s2
    80004204:	00c95913          	srli	s2,s2,0xc
    80004208:	02090863          	beqz	s2,80004238 <kvmincrease+0x58>
    8000420c:	00000493          	li	s1,0
    80004210:	00148493          	addi	s1,s1,1
    80004214:	fffff097          	auipc	ra,0xfffff
    80004218:	4bc080e7          	jalr	1212(ra) # 800036d0 <kalloc>
    8000421c:	fe991ae3          	bne	s2,s1,80004210 <kvmincrease+0x30>
    80004220:	01813083          	ld	ra,24(sp)
    80004224:	01013403          	ld	s0,16(sp)
    80004228:	00813483          	ld	s1,8(sp)
    8000422c:	00013903          	ld	s2,0(sp)
    80004230:	02010113          	addi	sp,sp,32
    80004234:	00008067          	ret
    80004238:	01813083          	ld	ra,24(sp)
    8000423c:	01013403          	ld	s0,16(sp)
    80004240:	00813483          	ld	s1,8(sp)
    80004244:	00013903          	ld	s2,0(sp)
    80004248:	00000513          	li	a0,0
    8000424c:	02010113          	addi	sp,sp,32
    80004250:	00008067          	ret
	...
