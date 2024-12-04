
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00010137          	lui	sp,0x10
   4:	00000097          	auipc	ra,0x0
   8:	0cc080e7          	jalr	204(ra) # d0 <main>
   c:	00000317          	auipc	t1,0x0
  10:	00830067          	jr	8(t1) # 14 <exit>

00000014 <exit>:
  14:	00000000          	.word	0x00000000
  18:	00008067          	ret

0000001c <__divsi3>:
  1c:	06054063          	bltz	a0,7c <__umodsi3+0x10>
  20:	0605c663          	bltz	a1,8c <__umodsi3+0x20>

00000024 <__udivsi3>:
  24:	00058613          	mv	a2,a1
  28:	00050593          	mv	a1,a0
  2c:	fff00513          	li	a0,-1
  30:	02060c63          	beqz	a2,68 <__udivsi3+0x44>
  34:	00100693          	li	a3,1
  38:	00b67a63          	bgeu	a2,a1,4c <__udivsi3+0x28>
  3c:	00c05863          	blez	a2,4c <__udivsi3+0x28>
  40:	00161613          	slli	a2,a2,0x1
  44:	00169693          	slli	a3,a3,0x1
  48:	feb66ae3          	bltu	a2,a1,3c <__udivsi3+0x18>
  4c:	00000513          	li	a0,0
  50:	00c5e663          	bltu	a1,a2,5c <__udivsi3+0x38>
  54:	40c585b3          	sub	a1,a1,a2
  58:	00d56533          	or	a0,a0,a3
  5c:	0016d693          	srli	a3,a3,0x1
  60:	00165613          	srli	a2,a2,0x1
  64:	fe0696e3          	bnez	a3,50 <__udivsi3+0x2c>
  68:	00008067          	ret

0000006c <__umodsi3>:
  6c:	00008293          	mv	t0,ra
  70:	fb5ff0ef          	jal	24 <__udivsi3>
  74:	00058513          	mv	a0,a1
  78:	00028067          	jr	t0
  7c:	40a00533          	neg	a0,a0
  80:	0005d863          	bgez	a1,90 <__umodsi3+0x24>
  84:	40b005b3          	neg	a1,a1
  88:	f95ff06f          	j	1c <__divsi3>
  8c:	40b005b3          	neg	a1,a1
  90:	00008293          	mv	t0,ra
  94:	f89ff0ef          	jal	1c <__divsi3>
  98:	40a00533          	neg	a0,a0
  9c:	00028067          	jr	t0

000000a0 <__modsi3>:
  a0:	00008293          	mv	t0,ra
  a4:	0005ca63          	bltz	a1,b8 <__modsi3+0x18>
  a8:	00054c63          	bltz	a0,c0 <__modsi3+0x20>
  ac:	f79ff0ef          	jal	24 <__udivsi3>
  b0:	00058513          	mv	a0,a1
  b4:	00028067          	jr	t0
  b8:	40b005b3          	neg	a1,a1
  bc:	fe0558e3          	bgez	a0,ac <__modsi3+0xc>
  c0:	40a00533          	neg	a0,a0
  c4:	f61ff0ef          	jal	24 <__udivsi3>
  c8:	40b00533          	neg	a0,a1
  cc:	00028067          	jr	t0

Disassembly of section .text.startup.main:

000000d0 <main>:
  d0:	000027b7          	lui	a5,0x2
  d4:	5c07a783          	lw	a5,1472(a5) # 25c0 <LEDS>
  d8:	eb010113          	addi	sp,sp,-336 # feb0 <_files+0xd230>
  dc:	14112623          	sw	ra,332(sp)
  e0:	14812423          	sw	s0,328(sp)
  e4:	14912223          	sw	s1,324(sp)
  e8:	15212023          	sw	s2,320(sp)
  ec:	13312e23          	sw	s3,316(sp)
  f0:	13412c23          	sw	s4,312(sp)
  f4:	13512a23          	sw	s5,308(sp)
  f8:	13612823          	sw	s6,304(sp)
  fc:	13712623          	sw	s7,300(sp)
 100:	13812423          	sw	s8,296(sp)
 104:	0007a023          	sw	zero,0(a5)
 108:	000017b7          	lui	a5,0x1
 10c:	00002737          	lui	a4,0x2
 110:	b6478793          	addi	a5,a5,-1180 # b64 <display_putchar>
 114:	7ef72e23          	sw	a5,2044(a4) # 27fc <f_putchar>
 118:	00001097          	auipc	ra,0x1
 11c:	904080e7          	jalr	-1788(ra) # a1c <oled_init>
 120:	00001097          	auipc	ra,0x1
 124:	908080e7          	jalr	-1784(ra) # a28 <oled_fullscreen>
 128:	00000513          	li	a0,0
 12c:	00001097          	auipc	ra,0x1
 130:	994080e7          	jalr	-1644(ra) # ac0 <oled_clear>
 134:	000014b7          	lui	s1,0x1
 138:	00000097          	auipc	ra,0x0
 13c:	5a0080e7          	jalr	1440(ra) # 6d8 <sdcard_init>
 140:	00001437          	lui	s0,0x1
 144:	00001097          	auipc	ra,0x1
 148:	0c8080e7          	jalr	200(ra) # 120c <fl_init>
 14c:	87048593          	addi	a1,s1,-1936 # 870 <sdcard_writesector>
 150:	81c40513          	addi	a0,s0,-2020 # 81c <sdcard_readsector>
 154:	00002097          	auipc	ra,0x2
 158:	8f4080e7          	jalr	-1804(ra) # 1a48 <fl_attach_media>
 15c:	fe0518e3          	bnez	a0,14c <main+0x7c>
 160:	00002537          	lui	a0,0x2
 164:	00410593          	addi	a1,sp,4
 168:	39850513          	addi	a0,a0,920 # 2398 <fl_readdir+0x94>
 16c:	00002437          	lui	s0,0x2
 170:	00002097          	auipc	ra,0x2
 174:	e94080e7          	jalr	-364(ra) # 2004 <fl_opendir>
 178:	3c040a13          	addi	s4,s0,960 # 23c0 <items>
 17c:	00000493          	li	s1,0
 180:	3c040413          	addi	s0,s0,960
 184:	0a051a63          	bnez	a0,238 <main+0x168>
 188:	000027b7          	lui	a5,0x2
 18c:	5b07a983          	lw	s3,1456(a5) # 25b0 <BUTTONS>
 190:	00000913          	li	s2,0
 194:	00000413          	li	s0,0
 198:	00002ab7          	lui	s5,0x2
 19c:	00002b37          	lui	s6,0x2
 1a0:	00000593          	li	a1,0
 1a4:	00000513          	li	a0,0
 1a8:	00001097          	auipc	ra,0x1
 1ac:	994080e7          	jalr	-1644(ra) # b3c <display_set_cursor>
 1b0:	0ff97593          	zext.b	a1,s2
 1b4:	07f58513          	addi	a0,a1,127
 1b8:	0ff57513          	zext.b	a0,a0
 1bc:	00001097          	auipc	ra,0x1
 1c0:	994080e7          	jalr	-1644(ra) # b50 <display_set_front_back_color>
 1c4:	39ca8513          	addi	a0,s5,924 # 239c <fl_readdir+0x98>
 1c8:	00790913          	addi	s2,s2,7
 1cc:	00001097          	auipc	ra,0x1
 1d0:	c1c080e7          	jalr	-996(ra) # de8 <printf>
 1d4:	000a0c13          	mv	s8,s4
 1d8:	00000b93          	li	s7,0
 1dc:	089b9463          	bne	s7,s1,264 <main+0x194>
 1e0:	00001097          	auipc	ra,0x1
 1e4:	a9c080e7          	jalr	-1380(ra) # c7c <display_refresh>
 1e8:	0009a783          	lw	a5,0(s3)
 1ec:	0087f793          	andi	a5,a5,8
 1f0:	00f037b3          	snez	a5,a5
 1f4:	00f40433          	add	s0,s0,a5
 1f8:	0009a783          	lw	a5,0(s3)
 1fc:	0107f793          	andi	a5,a5,16
 200:	00f037b3          	snez	a5,a5
 204:	40f40433          	sub	s0,s0,a5
 208:	04044a63          	bltz	s0,25c <main+0x18c>
 20c:	009427b3          	slt	a5,s0,s1
 210:	40f007b3          	neg	a5,a5
 214:	00f47433          	and	s0,s0,a5
 218:	f89ff06f          	j	1a0 <main+0xd0>
 21c:	00040513          	mv	a0,s0
 220:	01e00613          	li	a2,30
 224:	01010593          	addi	a1,sp,16
 228:	00148493          	addi	s1,s1,1
 22c:	00000097          	auipc	ra,0x0
 230:	668080e7          	jalr	1640(ra) # 894 <memcpy>
 234:	01e40413          	addi	s0,s0,30
 238:	01010593          	addi	a1,sp,16
 23c:	00410513          	addi	a0,sp,4
 240:	00002097          	auipc	ra,0x2
 244:	0c4080e7          	jalr	196(ra) # 2304 <fl_readdir>
 248:	fc050ae3          	beqz	a0,21c <main+0x14c>
 24c:	00410513          	addi	a0,sp,4
 250:	00001097          	auipc	ra,0x1
 254:	02c080e7          	jalr	44(ra) # 127c <fl_closedir>
 258:	f31ff06f          	j	188 <main+0xb8>
 25c:	fff48413          	addi	s0,s1,-1
 260:	f41ff06f          	j	1a0 <main+0xd0>
 264:	03741a63          	bne	s0,s7,298 <main+0x1c8>
 268:	0ff00593          	li	a1,255
 26c:	00000513          	li	a0,0
 270:	00001097          	auipc	ra,0x1
 274:	8e0080e7          	jalr	-1824(ra) # b50 <display_set_front_back_color>
 278:	000c0613          	mv	a2,s8
 27c:	000b8593          	mv	a1,s7
 280:	3b8b0513          	addi	a0,s6,952 # 23b8 <fl_readdir+0xb4>
 284:	00001097          	auipc	ra,0x1
 288:	b64080e7          	jalr	-1180(ra) # de8 <printf>
 28c:	001b8b93          	addi	s7,s7,1
 290:	01ec0c13          	addi	s8,s8,30
 294:	f49ff06f          	j	1dc <main+0x10c>
 298:	00000593          	li	a1,0
 29c:	0ff00513          	li	a0,255
 2a0:	fd1ff06f          	j	270 <main+0x1a0>

Disassembly of section .text.pause:

000002a4 <pause>:
 2a4:	c0002773          	rdcycle	a4
 2a8:	c00027f3          	rdcycle	a5
 2ac:	40e787b3          	sub	a5,a5,a4
 2b0:	fea7ece3          	bltu	a5,a0,2a8 <pause+0x4>
 2b4:	00008067          	ret

Disassembly of section .text.sdcard_idle:

000002b8 <sdcard_idle>:
 2b8:	00008067          	ret

Disassembly of section .text.sdcard_select:

000002bc <sdcard_select>:
 2bc:	000027b7          	lui	a5,0x2
 2c0:	5b47a783          	lw	a5,1460(a5) # 25b4 <SDCARD>
 2c4:	00200713          	li	a4,2
 2c8:	00e7a023          	sw	a4,0(a5)
 2cc:	00008067          	ret

Disassembly of section .text.sdcard_ponder:

000002d0 <sdcard_ponder>:
 2d0:	000026b7          	lui	a3,0x2
 2d4:	5b46a683          	lw	a3,1460(a3) # 25b4 <SDCARD>
 2d8:	01000793          	li	a5,16
 2dc:	00000713          	li	a4,0
 2e0:	00676613          	ori	a2,a4,6
 2e4:	00c6a023          	sw	a2,0(a3)
 2e8:	00174713          	xori	a4,a4,1
 2ec:	00000013          	nop
 2f0:	fff78793          	addi	a5,a5,-1
 2f4:	fe0796e3          	bnez	a5,2e0 <sdcard_ponder+0x10>
 2f8:	00008067          	ret

Disassembly of section .text.sdcard_unselect:

000002fc <sdcard_unselect>:
 2fc:	000027b7          	lui	a5,0x2
 300:	5b47a783          	lw	a5,1460(a5) # 25b4 <SDCARD>
 304:	00600713          	li	a4,6
 308:	00e7a023          	sw	a4,0(a5)
 30c:	00008067          	ret

Disassembly of section .text.sdcard_send:

00000310 <sdcard_send>:
 310:	000027b7          	lui	a5,0x2
 314:	5b47a783          	lw	a5,1460(a5) # 25b4 <SDCARD>
 318:	00655713          	srli	a4,a0,0x6
 31c:	00277713          	andi	a4,a4,2
 320:	00e7a023          	sw	a4,0(a5)
 324:	00176713          	ori	a4,a4,1
 328:	00e7a023          	sw	a4,0(a5)
 32c:	00555713          	srli	a4,a0,0x5
 330:	00277713          	andi	a4,a4,2
 334:	00e7a023          	sw	a4,0(a5)
 338:	00176713          	ori	a4,a4,1
 33c:	00e7a023          	sw	a4,0(a5)
 340:	00455713          	srli	a4,a0,0x4
 344:	00277713          	andi	a4,a4,2
 348:	00e7a023          	sw	a4,0(a5)
 34c:	00176713          	ori	a4,a4,1
 350:	00e7a023          	sw	a4,0(a5)
 354:	00355713          	srli	a4,a0,0x3
 358:	00277713          	andi	a4,a4,2
 35c:	00e7a023          	sw	a4,0(a5)
 360:	00176713          	ori	a4,a4,1
 364:	00e7a023          	sw	a4,0(a5)
 368:	00255713          	srli	a4,a0,0x2
 36c:	00277713          	andi	a4,a4,2
 370:	00e7a023          	sw	a4,0(a5)
 374:	00176713          	ori	a4,a4,1
 378:	00e7a023          	sw	a4,0(a5)
 37c:	00155713          	srli	a4,a0,0x1
 380:	00277713          	andi	a4,a4,2
 384:	00e7a023          	sw	a4,0(a5)
 388:	00176713          	ori	a4,a4,1
 38c:	00e7a023          	sw	a4,0(a5)
 390:	00257713          	andi	a4,a0,2
 394:	00e7a023          	sw	a4,0(a5)
 398:	00151513          	slli	a0,a0,0x1
 39c:	00176713          	ori	a4,a4,1
 3a0:	00e7a023          	sw	a4,0(a5)
 3a4:	00257513          	andi	a0,a0,2
 3a8:	00a7a023          	sw	a0,0(a5)
 3ac:	00156513          	ori	a0,a0,1
 3b0:	00a7a023          	sw	a0,0(a5)
 3b4:	00200713          	li	a4,2
 3b8:	00e7a023          	sw	a4,0(a5)
 3bc:	000027b7          	lui	a5,0x2
 3c0:	7ec7a783          	lw	a5,2028(a5) # 27ec <sdcard_while_loading_callback>
 3c4:	00078067          	jr	a5

Disassembly of section .text.sdcard_read:

000003c8 <sdcard_read>:
 3c8:	fd010113          	addi	sp,sp,-48
 3cc:	fff50793          	addi	a5,a0,-1
 3d0:	01312e23          	sw	s3,28(sp)
 3d4:	00100993          	li	s3,1
 3d8:	00f999b3          	sll	s3,s3,a5
 3dc:	000027b7          	lui	a5,0x2
 3e0:	01512a23          	sw	s5,20(sp)
 3e4:	5b47aa83          	lw	s5,1460(a5) # 25b4 <SDCARD>
 3e8:	02812423          	sw	s0,40(sp)
 3ec:	02912223          	sw	s1,36(sp)
 3f0:	03212023          	sw	s2,32(sp)
 3f4:	01412c23          	sw	s4,24(sp)
 3f8:	01612823          	sw	s6,16(sp)
 3fc:	01712623          	sw	s7,12(sp)
 400:	01812423          	sw	s8,8(sp)
 404:	02112623          	sw	ra,44(sp)
 408:	00050493          	mv	s1,a0
 40c:	00058a13          	mv	s4,a1
 410:	0ff00413          	li	s0,255
 414:	00000913          	li	s2,0
 418:	00300b13          	li	s6,3
 41c:	00200b93          	li	s7,2
 420:	00002c37          	lui	s8,0x2
 424:	040a0063          	beqz	s4,464 <sdcard_read+0x9c>
 428:	013477b3          	and	a5,s0,s3
 42c:	02079e63          	bnez	a5,468 <sdcard_read+0xa0>
 430:	02c12083          	lw	ra,44(sp)
 434:	0ff47513          	zext.b	a0,s0
 438:	02812403          	lw	s0,40(sp)
 43c:	02412483          	lw	s1,36(sp)
 440:	02012903          	lw	s2,32(sp)
 444:	01c12983          	lw	s3,28(sp)
 448:	01812a03          	lw	s4,24(sp)
 44c:	01412a83          	lw	s5,20(sp)
 450:	01012b03          	lw	s6,16(sp)
 454:	00c12b83          	lw	s7,12(sp)
 458:	00812c03          	lw	s8,8(sp)
 45c:	03010113          	addi	sp,sp,48
 460:	00008067          	ret
 464:	fc9956e3          	bge	s2,s1,430 <sdcard_read+0x68>
 468:	016aa023          	sw	s6,0(s5)
 46c:	017aa023          	sw	s7,0(s5)
 470:	000aa783          	lw	a5,0(s5)
 474:	00141413          	slli	s0,s0,0x1
 478:	00190913          	addi	s2,s2,1
 47c:	00f46433          	or	s0,s0,a5
 480:	7ecc2783          	lw	a5,2028(s8) # 27ec <sdcard_while_loading_callback>
 484:	000780e7          	jalr	a5
 488:	f9dff06f          	j	424 <sdcard_read+0x5c>

Disassembly of section .text.sdcard_get:

0000048c <sdcard_get>:
 48c:	fe010113          	addi	sp,sp,-32
 490:	00112e23          	sw	ra,28(sp)
 494:	00812c23          	sw	s0,24(sp)
 498:	00912a23          	sw	s1,20(sp)
 49c:	00050413          	mv	s0,a0
 4a0:	00b12623          	sw	a1,12(sp)
 4a4:	00000097          	auipc	ra,0x0
 4a8:	e18080e7          	jalr	-488(ra) # 2bc <sdcard_select>
 4ac:	00c12583          	lw	a1,12(sp)
 4b0:	00040513          	mv	a0,s0
 4b4:	00100493          	li	s1,1
 4b8:	00000097          	auipc	ra,0x0
 4bc:	f10080e7          	jalr	-240(ra) # 3c8 <sdcard_read>
 4c0:	00345413          	srli	s0,s0,0x3
 4c4:	0284c463          	blt	s1,s0,4ec <sdcard_get+0x60>
 4c8:	00a12623          	sw	a0,12(sp)
 4cc:	00000097          	auipc	ra,0x0
 4d0:	e30080e7          	jalr	-464(ra) # 2fc <sdcard_unselect>
 4d4:	01c12083          	lw	ra,28(sp)
 4d8:	01812403          	lw	s0,24(sp)
 4dc:	00c12503          	lw	a0,12(sp)
 4e0:	01412483          	lw	s1,20(sp)
 4e4:	02010113          	addi	sp,sp,32
 4e8:	00008067          	ret
 4ec:	00000593          	li	a1,0
 4f0:	00800513          	li	a0,8
 4f4:	00000097          	auipc	ra,0x0
 4f8:	ed4080e7          	jalr	-300(ra) # 3c8 <sdcard_read>
 4fc:	00148493          	addi	s1,s1,1
 500:	fc5ff06f          	j	4c4 <sdcard_get+0x38>

Disassembly of section .text.sdcard_cmd:

00000504 <sdcard_cmd>:
 504:	ff010113          	addi	sp,sp,-16
 508:	00812423          	sw	s0,8(sp)
 50c:	00912223          	sw	s1,4(sp)
 510:	01212023          	sw	s2,0(sp)
 514:	00112623          	sw	ra,12(sp)
 518:	00050493          	mv	s1,a0
 51c:	00000413          	li	s0,0
 520:	00000097          	auipc	ra,0x0
 524:	d9c080e7          	jalr	-612(ra) # 2bc <sdcard_select>
 528:	00600913          	li	s2,6
 52c:	008487b3          	add	a5,s1,s0
 530:	0007c503          	lbu	a0,0(a5)
 534:	00140413          	addi	s0,s0,1
 538:	00000097          	auipc	ra,0x0
 53c:	dd8080e7          	jalr	-552(ra) # 310 <sdcard_send>
 540:	ff2416e3          	bne	s0,s2,52c <sdcard_cmd+0x28>
 544:	00812403          	lw	s0,8(sp)
 548:	00c12083          	lw	ra,12(sp)
 54c:	00412483          	lw	s1,4(sp)
 550:	00012903          	lw	s2,0(sp)
 554:	01010113          	addi	sp,sp,16
 558:	00000317          	auipc	t1,0x0
 55c:	da430067          	jr	-604(t1) # 2fc <sdcard_unselect>

Disassembly of section .text.sdcard_start_sector:

00000560 <sdcard_start_sector>:
 560:	ff010113          	addi	sp,sp,-16
 564:	00112623          	sw	ra,12(sp)
 568:	00812423          	sw	s0,8(sp)
 56c:	00050413          	mv	s0,a0
 570:	00000097          	auipc	ra,0x0
 574:	d4c080e7          	jalr	-692(ra) # 2bc <sdcard_select>
 578:	05100513          	li	a0,81
 57c:	00000097          	auipc	ra,0x0
 580:	d94080e7          	jalr	-620(ra) # 310 <sdcard_send>
 584:	01845513          	srli	a0,s0,0x18
 588:	00000097          	auipc	ra,0x0
 58c:	d88080e7          	jalr	-632(ra) # 310 <sdcard_send>
 590:	41045513          	srai	a0,s0,0x10
 594:	0ff57513          	zext.b	a0,a0
 598:	00000097          	auipc	ra,0x0
 59c:	d78080e7          	jalr	-648(ra) # 310 <sdcard_send>
 5a0:	40845513          	srai	a0,s0,0x8
 5a4:	0ff57513          	zext.b	a0,a0
 5a8:	00000097          	auipc	ra,0x0
 5ac:	d68080e7          	jalr	-664(ra) # 310 <sdcard_send>
 5b0:	0ff47513          	zext.b	a0,s0
 5b4:	00000097          	auipc	ra,0x0
 5b8:	d5c080e7          	jalr	-676(ra) # 310 <sdcard_send>
 5bc:	05500513          	li	a0,85
 5c0:	00000097          	auipc	ra,0x0
 5c4:	d50080e7          	jalr	-688(ra) # 310 <sdcard_send>
 5c8:	00000097          	auipc	ra,0x0
 5cc:	d34080e7          	jalr	-716(ra) # 2fc <sdcard_unselect>
 5d0:	00812403          	lw	s0,8(sp)
 5d4:	00c12083          	lw	ra,12(sp)
 5d8:	00100593          	li	a1,1
 5dc:	00800513          	li	a0,8
 5e0:	01010113          	addi	sp,sp,16
 5e4:	00000317          	auipc	t1,0x0
 5e8:	ea830067          	jr	-344(t1) # 48c <sdcard_get>

Disassembly of section .text.sdcard_read_sector:

000005ec <sdcard_read_sector>:
 5ec:	ff010113          	addi	sp,sp,-16
 5f0:	00812423          	sw	s0,8(sp)
 5f4:	00112623          	sw	ra,12(sp)
 5f8:	00912223          	sw	s1,4(sp)
 5fc:	01212023          	sw	s2,0(sp)
 600:	00058413          	mv	s0,a1
 604:	00000097          	auipc	ra,0x0
 608:	f5c080e7          	jalr	-164(ra) # 560 <sdcard_start_sector>
 60c:	04051863          	bnez	a0,65c <sdcard_read_sector+0x70>
 610:	00100593          	li	a1,1
 614:	00058513          	mv	a0,a1
 618:	00000097          	auipc	ra,0x0
 61c:	e74080e7          	jalr	-396(ra) # 48c <sdcard_get>
 620:	00000493          	li	s1,0
 624:	20000913          	li	s2,512
 628:	00000593          	li	a1,0
 62c:	00800513          	li	a0,8
 630:	00000097          	auipc	ra,0x0
 634:	e5c080e7          	jalr	-420(ra) # 48c <sdcard_get>
 638:	009407b3          	add	a5,s0,s1
 63c:	00a78023          	sb	a0,0(a5)
 640:	00148493          	addi	s1,s1,1
 644:	ff2492e3          	bne	s1,s2,628 <sdcard_read_sector+0x3c>
 648:	00100593          	li	a1,1
 64c:	01000513          	li	a0,16
 650:	20040413          	addi	s0,s0,512
 654:	00000097          	auipc	ra,0x0
 658:	e38080e7          	jalr	-456(ra) # 48c <sdcard_get>
 65c:	00c12083          	lw	ra,12(sp)
 660:	00040513          	mv	a0,s0
 664:	00812403          	lw	s0,8(sp)
 668:	00412483          	lw	s1,4(sp)
 66c:	00012903          	lw	s2,0(sp)
 670:	01010113          	addi	sp,sp,16
 674:	00008067          	ret

Disassembly of section .text.sdcard_preinit:

00000678 <sdcard_preinit>:
 678:	ff010113          	addi	sp,sp,-16
 67c:	000027b7          	lui	a5,0x2
 680:	00812423          	sw	s0,8(sp)
 684:	5b47a403          	lw	s0,1460(a5) # 25b4 <SDCARD>
 688:	00112623          	sw	ra,12(sp)
 68c:	00600793          	li	a5,6
 690:	01313537          	lui	a0,0x1313
 694:	00f42023          	sw	a5,0(s0)
 698:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
 69c:	00000097          	auipc	ra,0x0
 6a0:	c08080e7          	jalr	-1016(ra) # 2a4 <pause>
 6a4:	0a000793          	li	a5,160
 6a8:	00000713          	li	a4,0
 6ac:	00676693          	ori	a3,a4,6
 6b0:	00d42023          	sw	a3,0(s0)
 6b4:	fff78793          	addi	a5,a5,-1
 6b8:	00174713          	xori	a4,a4,1
 6bc:	fe0798e3          	bnez	a5,6ac <sdcard_preinit+0x34>
 6c0:	00600793          	li	a5,6
 6c4:	00c12083          	lw	ra,12(sp)
 6c8:	00f42023          	sw	a5,0(s0)
 6cc:	00812403          	lw	s0,8(sp)
 6d0:	01010113          	addi	sp,sp,16
 6d4:	00008067          	ret

Disassembly of section .text.sdcard_init:

000006d8 <sdcard_init>:
 6d8:	000007b7          	lui	a5,0x0
 6dc:	ff010113          	addi	sp,sp,-16
 6e0:	00002737          	lui	a4,0x2
 6e4:	2b878793          	addi	a5,a5,696 # 2b8 <sdcard_idle>
 6e8:	00912223          	sw	s1,4(sp)
 6ec:	01212023          	sw	s2,0(sp)
 6f0:	00112623          	sw	ra,12(sp)
 6f4:	00812423          	sw	s0,8(sp)
 6f8:	7ef72623          	sw	a5,2028(a4) # 27ec <sdcard_while_loading_callback>
 6fc:	000024b7          	lui	s1,0x2
 700:	0ff00913          	li	s2,255
 704:	00000097          	auipc	ra,0x0
 708:	f74080e7          	jalr	-140(ra) # 678 <sdcard_preinit>
 70c:	5a448513          	addi	a0,s1,1444 # 25a4 <cmd0>
 710:	00000097          	auipc	ra,0x0
 714:	df4080e7          	jalr	-524(ra) # 504 <sdcard_cmd>
 718:	00100593          	li	a1,1
 71c:	00800513          	li	a0,8
 720:	00000097          	auipc	ra,0x0
 724:	d6c080e7          	jalr	-660(ra) # 48c <sdcard_get>
 728:	00050413          	mv	s0,a0
 72c:	00000097          	auipc	ra,0x0
 730:	ba4080e7          	jalr	-1116(ra) # 2d0 <sdcard_ponder>
 734:	01241c63          	bne	s0,s2,74c <sdcard_init+0x74>
 738:	01313537          	lui	a0,0x1313
 73c:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
 740:	00000097          	auipc	ra,0x0
 744:	b64080e7          	jalr	-1180(ra) # 2a4 <pause>
 748:	fbdff06f          	j	704 <sdcard_init+0x2c>
 74c:	00002537          	lui	a0,0x2
 750:	59c50513          	addi	a0,a0,1436 # 259c <cmd8>
 754:	00000097          	auipc	ra,0x0
 758:	db0080e7          	jalr	-592(ra) # 504 <sdcard_cmd>
 75c:	00100593          	li	a1,1
 760:	02800513          	li	a0,40
 764:	00000097          	auipc	ra,0x0
 768:	d28080e7          	jalr	-728(ra) # 48c <sdcard_get>
 76c:	00000097          	auipc	ra,0x0
 770:	b64080e7          	jalr	-1180(ra) # 2d0 <sdcard_ponder>
 774:	000024b7          	lui	s1,0x2
 778:	00002937          	lui	s2,0x2
 77c:	59448513          	addi	a0,s1,1428 # 2594 <cmd55>
 780:	00000097          	auipc	ra,0x0
 784:	d84080e7          	jalr	-636(ra) # 504 <sdcard_cmd>
 788:	00100593          	li	a1,1
 78c:	00800513          	li	a0,8
 790:	00000097          	auipc	ra,0x0
 794:	cfc080e7          	jalr	-772(ra) # 48c <sdcard_get>
 798:	00000097          	auipc	ra,0x0
 79c:	b38080e7          	jalr	-1224(ra) # 2d0 <sdcard_ponder>
 7a0:	58c90513          	addi	a0,s2,1420 # 258c <acmd41>
 7a4:	00000097          	auipc	ra,0x0
 7a8:	d60080e7          	jalr	-672(ra) # 504 <sdcard_cmd>
 7ac:	00100593          	li	a1,1
 7b0:	00800513          	li	a0,8
 7b4:	00000097          	auipc	ra,0x0
 7b8:	cd8080e7          	jalr	-808(ra) # 48c <sdcard_get>
 7bc:	00050413          	mv	s0,a0
 7c0:	00000097          	auipc	ra,0x0
 7c4:	b10080e7          	jalr	-1264(ra) # 2d0 <sdcard_ponder>
 7c8:	00040c63          	beqz	s0,7e0 <sdcard_init+0x108>
 7cc:	001e8537          	lui	a0,0x1e8
 7d0:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
 7d4:	00000097          	auipc	ra,0x0
 7d8:	ad0080e7          	jalr	-1328(ra) # 2a4 <pause>
 7dc:	fa1ff06f          	j	77c <sdcard_init+0xa4>
 7e0:	00002537          	lui	a0,0x2
 7e4:	58450513          	addi	a0,a0,1412 # 2584 <cmd16>
 7e8:	00000097          	auipc	ra,0x0
 7ec:	d1c080e7          	jalr	-740(ra) # 504 <sdcard_cmd>
 7f0:	00100593          	li	a1,1
 7f4:	00800513          	li	a0,8
 7f8:	00000097          	auipc	ra,0x0
 7fc:	c94080e7          	jalr	-876(ra) # 48c <sdcard_get>
 800:	00812403          	lw	s0,8(sp)
 804:	00c12083          	lw	ra,12(sp)
 808:	00412483          	lw	s1,4(sp)
 80c:	00012903          	lw	s2,0(sp)
 810:	01010113          	addi	sp,sp,16
 814:	00000317          	auipc	t1,0x0
 818:	abc30067          	jr	-1348(t1) # 2d0 <sdcard_ponder>

Disassembly of section .text.sdcard_readsector:

0000081c <sdcard_readsector>:
 81c:	04060663          	beqz	a2,868 <sdcard_readsector+0x4c>
 820:	ff010113          	addi	sp,sp,-16
 824:	00812423          	sw	s0,8(sp)
 828:	00912223          	sw	s1,4(sp)
 82c:	00112623          	sw	ra,12(sp)
 830:	00050413          	mv	s0,a0
 834:	00a604b3          	add	s1,a2,a0
 838:	00040513          	mv	a0,s0
 83c:	00000097          	auipc	ra,0x0
 840:	db0080e7          	jalr	-592(ra) # 5ec <sdcard_read_sector>
 844:	00140413          	addi	s0,s0,1
 848:	00050593          	mv	a1,a0
 84c:	fe9416e3          	bne	s0,s1,838 <sdcard_readsector+0x1c>
 850:	00c12083          	lw	ra,12(sp)
 854:	00812403          	lw	s0,8(sp)
 858:	00412483          	lw	s1,4(sp)
 85c:	00100513          	li	a0,1
 860:	01010113          	addi	sp,sp,16
 864:	00008067          	ret
 868:	00000513          	li	a0,0
 86c:	00008067          	ret

Disassembly of section .text.sdcard_writesector:

00000870 <sdcard_writesector>:
 870:	00000513          	li	a0,0
 874:	00008067          	ret

Disassembly of section .text.memset:

00000878 <memset>:
 878:	00c50633          	add	a2,a0,a2
 87c:	00050793          	mv	a5,a0
 880:	00c79463          	bne	a5,a2,888 <memset+0x10>
 884:	00008067          	ret
 888:	00178793          	addi	a5,a5,1
 88c:	feb78fa3          	sb	a1,-1(a5)
 890:	ff1ff06f          	j	880 <memset+0x8>

Disassembly of section .text.memcpy:

00000894 <memcpy>:
 894:	00000793          	li	a5,0
 898:	00c79463          	bne	a5,a2,8a0 <memcpy+0xc>
 89c:	00008067          	ret
 8a0:	00f58733          	add	a4,a1,a5
 8a4:	00074683          	lbu	a3,0(a4)
 8a8:	00f50733          	add	a4,a0,a5
 8ac:	00178793          	addi	a5,a5,1
 8b0:	00d70023          	sb	a3,0(a4)
 8b4:	fe5ff06f          	j	898 <memcpy+0x4>

Disassembly of section .text.strlen:

000008b8 <strlen>:
 8b8:	00050793          	mv	a5,a0
 8bc:	00000513          	li	a0,0
 8c0:	00a78733          	add	a4,a5,a0
 8c4:	00074703          	lbu	a4,0(a4)
 8c8:	00071463          	bnez	a4,8d0 <strlen+0x18>
 8cc:	00008067          	ret
 8d0:	00150513          	addi	a0,a0,1
 8d4:	fedff06f          	j	8c0 <strlen+0x8>

Disassembly of section .text.strncpy:

000008d8 <strncpy>:
 8d8:	00000793          	li	a5,0
 8dc:	00c79463          	bne	a5,a2,8e4 <strncpy+0xc>
 8e0:	00008067          	ret
 8e4:	00f58733          	add	a4,a1,a5
 8e8:	00074683          	lbu	a3,0(a4)
 8ec:	00f50733          	add	a4,a0,a5
 8f0:	00178793          	addi	a5,a5,1
 8f4:	00d70023          	sb	a3,0(a4)
 8f8:	fe5ff06f          	j	8dc <strncpy+0x4>

Disassembly of section .text.oled_wait:

000008fc <oled_wait>:
 8fc:	00000013          	nop
 900:	00000013          	nop
 904:	00000013          	nop
 908:	00000013          	nop
 90c:	00000013          	nop
 910:	00000013          	nop
 914:	00000013          	nop
 918:	00008067          	ret

Disassembly of section .text.oled_init_mode:

0000091c <oled_init_mode>:
 91c:	000027b7          	lui	a5,0x2
 920:	5b87a703          	lw	a4,1464(a5) # 25b8 <OLED_RST>
 924:	ff010113          	addi	sp,sp,-16
 928:	00912223          	sw	s1,4(sp)
 92c:	00112623          	sw	ra,12(sp)
 930:	00812423          	sw	s0,8(sp)
 934:	00072023          	sw	zero,0(a4)
 938:	00050493          	mv	s1,a0
 93c:	00040737          	lui	a4,0x40
 940:	00000013          	nop
 944:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
 948:	fe071ce3          	bnez	a4,940 <oled_init_mode+0x24>
 94c:	5b87a703          	lw	a4,1464(a5)
 950:	00100693          	li	a3,1
 954:	00d72023          	sw	a3,0(a4)
 958:	00040737          	lui	a4,0x40
 95c:	00000013          	nop
 960:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
 964:	fe071ce3          	bnez	a4,95c <oled_init_mode+0x40>
 968:	5b87a783          	lw	a5,1464(a5)
 96c:	0007a023          	sw	zero,0(a5)
 970:	000407b7          	lui	a5,0x40
 974:	00000013          	nop
 978:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
 97c:	fe079ce3          	bnez	a5,974 <oled_init_mode+0x58>
 980:	00002737          	lui	a4,0x2
 984:	5bc72783          	lw	a5,1468(a4) # 25bc <OLED>
 988:	2af00693          	li	a3,687
 98c:	00d7a023          	sw	a3,0(a5)
 990:	000407b7          	lui	a5,0x40
 994:	00000013          	nop
 998:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
 99c:	fe079ce3          	bnez	a5,994 <oled_init_mode+0x78>
 9a0:	5bc72403          	lw	s0,1468(a4)
 9a4:	2a000793          	li	a5,672
 9a8:	00f42023          	sw	a5,0(s0)
 9ac:	00000097          	auipc	ra,0x0
 9b0:	f50080e7          	jalr	-176(ra) # 8fc <oled_wait>
 9b4:	4a000793          	li	a5,1184
 9b8:	00048463          	beqz	s1,9c0 <oled_init_mode+0xa4>
 9bc:	42000793          	li	a5,1056
 9c0:	00f42023          	sw	a5,0(s0)
 9c4:	00000097          	auipc	ra,0x0
 9c8:	f38080e7          	jalr	-200(ra) # 8fc <oled_wait>
 9cc:	2fd00793          	li	a5,765
 9d0:	00f42023          	sw	a5,0(s0)
 9d4:	00000097          	auipc	ra,0x0
 9d8:	f28080e7          	jalr	-216(ra) # 8fc <oled_wait>
 9dc:	4b100793          	li	a5,1201
 9e0:	00f42023          	sw	a5,0(s0)
 9e4:	00000097          	auipc	ra,0x0
 9e8:	f18080e7          	jalr	-232(ra) # 8fc <oled_wait>
 9ec:	2a200793          	li	a5,674
 9f0:	00f42023          	sw	a5,0(s0)
 9f4:	00000097          	auipc	ra,0x0
 9f8:	f08080e7          	jalr	-248(ra) # 8fc <oled_wait>
 9fc:	40000793          	li	a5,1024
 a00:	00f42023          	sw	a5,0(s0)
 a04:	00812403          	lw	s0,8(sp)
 a08:	00c12083          	lw	ra,12(sp)
 a0c:	00412483          	lw	s1,4(sp)
 a10:	01010113          	addi	sp,sp,16
 a14:	00000317          	auipc	t1,0x0
 a18:	ee830067          	jr	-280(t1) # 8fc <oled_wait>

Disassembly of section .text.oled_init:

00000a1c <oled_init>:
 a1c:	00000513          	li	a0,0
 a20:	00000317          	auipc	t1,0x0
 a24:	efc30067          	jr	-260(t1) # 91c <oled_init_mode>

Disassembly of section .text.oled_fullscreen:

00000a28 <oled_fullscreen>:
 a28:	ff010113          	addi	sp,sp,-16
 a2c:	000027b7          	lui	a5,0x2
 a30:	00812423          	sw	s0,8(sp)
 a34:	5bc7a403          	lw	s0,1468(a5) # 25bc <OLED>
 a38:	00112623          	sw	ra,12(sp)
 a3c:	00912223          	sw	s1,4(sp)
 a40:	01212023          	sw	s2,0(sp)
 a44:	21500793          	li	a5,533
 a48:	00f42023          	sw	a5,0(s0)
 a4c:	40000913          	li	s2,1024
 a50:	00000097          	auipc	ra,0x0
 a54:	eac080e7          	jalr	-340(ra) # 8fc <oled_wait>
 a58:	47f00493          	li	s1,1151
 a5c:	01242023          	sw	s2,0(s0)
 a60:	00000097          	auipc	ra,0x0
 a64:	e9c080e7          	jalr	-356(ra) # 8fc <oled_wait>
 a68:	00942023          	sw	s1,0(s0)
 a6c:	00000097          	auipc	ra,0x0
 a70:	e90080e7          	jalr	-368(ra) # 8fc <oled_wait>
 a74:	27500793          	li	a5,629
 a78:	00f42023          	sw	a5,0(s0)
 a7c:	00000097          	auipc	ra,0x0
 a80:	e80080e7          	jalr	-384(ra) # 8fc <oled_wait>
 a84:	01242023          	sw	s2,0(s0)
 a88:	00000097          	auipc	ra,0x0
 a8c:	e74080e7          	jalr	-396(ra) # 8fc <oled_wait>
 a90:	00942023          	sw	s1,0(s0)
 a94:	00000097          	auipc	ra,0x0
 a98:	e68080e7          	jalr	-408(ra) # 8fc <oled_wait>
 a9c:	25c00793          	li	a5,604
 aa0:	00f42023          	sw	a5,0(s0)
 aa4:	00812403          	lw	s0,8(sp)
 aa8:	00c12083          	lw	ra,12(sp)
 aac:	00412483          	lw	s1,4(sp)
 ab0:	00012903          	lw	s2,0(sp)
 ab4:	01010113          	addi	sp,sp,16
 ab8:	00000317          	auipc	t1,0x0
 abc:	e4430067          	jr	-444(t1) # 8fc <oled_wait>

Disassembly of section .text.oled_clear:

00000ac0 <oled_clear>:
 ac0:	fe010113          	addi	sp,sp,-32
 ac4:	000027b7          	lui	a5,0x2
 ac8:	01312623          	sw	s3,12(sp)
 acc:	5bc7a983          	lw	s3,1468(a5) # 25bc <OLED>
 ad0:	00812c23          	sw	s0,24(sp)
 ad4:	01212823          	sw	s2,16(sp)
 ad8:	00112e23          	sw	ra,28(sp)
 adc:	00912a23          	sw	s1,20(sp)
 ae0:	08000913          	li	s2,128
 ae4:	40056413          	ori	s0,a0,1024
 ae8:	08000493          	li	s1,128
 aec:	0089a023          	sw	s0,0(s3)
 af0:	00000097          	auipc	ra,0x0
 af4:	e0c080e7          	jalr	-500(ra) # 8fc <oled_wait>
 af8:	0089a023          	sw	s0,0(s3)
 afc:	00000097          	auipc	ra,0x0
 b00:	e00080e7          	jalr	-512(ra) # 8fc <oled_wait>
 b04:	fff48493          	addi	s1,s1,-1
 b08:	0089a023          	sw	s0,0(s3)
 b0c:	00000097          	auipc	ra,0x0
 b10:	df0080e7          	jalr	-528(ra) # 8fc <oled_wait>
 b14:	fc049ce3          	bnez	s1,aec <oled_clear+0x2c>
 b18:	fff90913          	addi	s2,s2,-1
 b1c:	fc0916e3          	bnez	s2,ae8 <oled_clear+0x28>
 b20:	01c12083          	lw	ra,28(sp)
 b24:	01812403          	lw	s0,24(sp)
 b28:	01412483          	lw	s1,20(sp)
 b2c:	01012903          	lw	s2,16(sp)
 b30:	00c12983          	lw	s3,12(sp)
 b34:	02010113          	addi	sp,sp,32
 b38:	00008067          	ret

Disassembly of section .text.display_set_cursor:

00000b3c <display_set_cursor>:
 b3c:	000027b7          	lui	a5,0x2
 b40:	7ea7ac23          	sw	a0,2040(a5) # 27f8 <cursor_x>
 b44:	000027b7          	lui	a5,0x2
 b48:	7eb7aa23          	sw	a1,2036(a5) # 27f4 <cursor_y>
 b4c:	00008067          	ret

Disassembly of section .text.display_set_front_back_color:

00000b50 <display_set_front_back_color>:
 b50:	000027b7          	lui	a5,0x2
 b54:	7ea788a3          	sb	a0,2033(a5) # 27f1 <front_color>
 b58:	000027b7          	lui	a5,0x2
 b5c:	7eb78823          	sb	a1,2032(a5) # 27f0 <back_color>
 b60:	00008067          	ret

Disassembly of section .text.display_putchar:

00000b64 <display_putchar>:
 b64:	00a00793          	li	a5,10
 b68:	00002737          	lui	a4,0x2
 b6c:	02f51663          	bne	a0,a5,b98 <display_putchar+0x34>
 b70:	7e072c23          	sw	zero,2040(a4) # 27f8 <cursor_x>
 b74:	00002737          	lui	a4,0x2
 b78:	7f472783          	lw	a5,2036(a4) # 27f4 <cursor_y>
 b7c:	00878793          	addi	a5,a5,8
 b80:	7ef72a23          	sw	a5,2036(a4)
 b84:	07f00713          	li	a4,127
 b88:	00f75663          	bge	a4,a5,b94 <display_putchar+0x30>
 b8c:	000027b7          	lui	a5,0x2
 b90:	7e07aa23          	sw	zero,2036(a5) # 27f4 <cursor_y>
 b94:	00008067          	ret
 b98:	ff010113          	addi	sp,sp,-16
 b9c:	00812623          	sw	s0,12(sp)
 ba0:	01f00793          	li	a5,31
 ba4:	08a7d663          	bge	a5,a0,c30 <display_putchar+0xcc>
 ba8:	000027b7          	lui	a5,0x2
 bac:	5ac7ae83          	lw	t4,1452(a5) # 25ac <DISPLAY>
 bb0:	00251693          	slli	a3,a0,0x2
 bb4:	000027b7          	lui	a5,0x2
 bb8:	00a686b3          	add	a3,a3,a0
 bbc:	5c478793          	addi	a5,a5,1476 # 25c4 <font>
 bc0:	00f686b3          	add	a3,a3,a5
 bc4:	00000613          	li	a2,0
 bc8:	00100e13          	li	t3,1
 bcc:	000023b7          	lui	t2,0x2
 bd0:	00002437          	lui	s0,0x2
 bd4:	00002f37          	lui	t5,0x2
 bd8:	00500f93          	li	t6,5
 bdc:	00800293          	li	t0,8
 be0:	00ce1333          	sll	t1,t3,a2
 be4:	00068513          	mv	a0,a3
 be8:	00000593          	li	a1,0
 bec:	f6054783          	lbu	a5,-160(a0)
 bf0:	0067f7b3          	and	a5,a5,t1
 bf4:	04078a63          	beqz	a5,c48 <display_putchar+0xe4>
 bf8:	7f144883          	lbu	a7,2033(s0) # 27f1 <front_color>
 bfc:	7f872783          	lw	a5,2040(a4)
 c00:	7f4f2803          	lw	a6,2036(t5) # 27f4 <cursor_y>
 c04:	00150513          	addi	a0,a0,1
 c08:	00f587b3          	add	a5,a1,a5
 c0c:	00779793          	slli	a5,a5,0x7
 c10:	01060833          	add	a6,a2,a6
 c14:	010787b3          	add	a5,a5,a6
 c18:	00fe87b3          	add	a5,t4,a5
 c1c:	01178023          	sb	a7,0(a5)
 c20:	00158593          	addi	a1,a1,1
 c24:	fdf594e3          	bne	a1,t6,bec <display_putchar+0x88>
 c28:	00160613          	addi	a2,a2,1
 c2c:	fa561ae3          	bne	a2,t0,be0 <display_putchar+0x7c>
 c30:	7f872783          	lw	a5,2040(a4)
 c34:	07f00693          	li	a3,127
 c38:	00578793          	addi	a5,a5,5
 c3c:	00f6ca63          	blt	a3,a5,c50 <display_putchar+0xec>
 c40:	7ef72c23          	sw	a5,2040(a4)
 c44:	02c0006f          	j	c70 <display_putchar+0x10c>
 c48:	7f03c883          	lbu	a7,2032(t2) # 27f0 <back_color>
 c4c:	fb1ff06f          	j	bfc <display_putchar+0x98>
 c50:	7e072c23          	sw	zero,2040(a4)
 c54:	00002737          	lui	a4,0x2
 c58:	7f472783          	lw	a5,2036(a4) # 27f4 <cursor_y>
 c5c:	00878793          	addi	a5,a5,8
 c60:	7ef72a23          	sw	a5,2036(a4)
 c64:	00f6d663          	bge	a3,a5,c70 <display_putchar+0x10c>
 c68:	000027b7          	lui	a5,0x2
 c6c:	7e07aa23          	sw	zero,2036(a5) # 27f4 <cursor_y>
 c70:	00c12403          	lw	s0,12(sp)
 c74:	01010113          	addi	sp,sp,16
 c78:	00008067          	ret

Disassembly of section .text.display_refresh:

00000c7c <display_refresh>:
 c7c:	00008067          	ret

Disassembly of section .text.print_string:

00000c80 <print_string>:
 c80:	ff010113          	addi	sp,sp,-16
 c84:	00812423          	sw	s0,8(sp)
 c88:	00912223          	sw	s1,4(sp)
 c8c:	00112623          	sw	ra,12(sp)
 c90:	00050413          	mv	s0,a0
 c94:	000024b7          	lui	s1,0x2
 c98:	00044503          	lbu	a0,0(s0)
 c9c:	00051c63          	bnez	a0,cb4 <print_string+0x34>
 ca0:	00c12083          	lw	ra,12(sp)
 ca4:	00812403          	lw	s0,8(sp)
 ca8:	00412483          	lw	s1,4(sp)
 cac:	01010113          	addi	sp,sp,16
 cb0:	00008067          	ret
 cb4:	7fc4a783          	lw	a5,2044(s1) # 27fc <f_putchar>
 cb8:	00140413          	addi	s0,s0,1
 cbc:	000780e7          	jalr	a5
 cc0:	fd9ff06f          	j	c98 <print_string+0x18>

Disassembly of section .text.print_dec:

00000cc4 <print_dec>:
 cc4:	ef010113          	addi	sp,sp,-272
 cc8:	10812423          	sw	s0,264(sp)
 ccc:	10912223          	sw	s1,260(sp)
 cd0:	10112623          	sw	ra,268(sp)
 cd4:	11212023          	sw	s2,256(sp)
 cd8:	00050413          	mv	s0,a0
 cdc:	000024b7          	lui	s1,0x2
 ce0:	08045063          	bgez	s0,d60 <print_dec+0x9c>
 ce4:	7fc4a783          	lw	a5,2044(s1) # 27fc <f_putchar>
 ce8:	02d00513          	li	a0,45
 cec:	40800433          	neg	s0,s0
 cf0:	000780e7          	jalr	a5
 cf4:	fedff06f          	j	ce0 <print_dec+0x1c>
 cf8:	00040513          	mv	a0,s0
 cfc:	00a00593          	li	a1,10
 d00:	fffff097          	auipc	ra,0xfffff
 d04:	31c080e7          	jalr	796(ra) # 1c <__divsi3>
 d08:	00251793          	slli	a5,a0,0x2
 d0c:	00f507b3          	add	a5,a0,a5
 d10:	00179793          	slli	a5,a5,0x1
 d14:	40f40433          	sub	s0,s0,a5
 d18:	00148493          	addi	s1,s1,1
 d1c:	fe848fa3          	sb	s0,-1(s1)
 d20:	00050413          	mv	s0,a0
 d24:	fc041ae3          	bnez	s0,cf8 <print_dec+0x34>
 d28:	fd2488e3          	beq	s1,s2,cf8 <print_dec+0x34>
 d2c:	00002437          	lui	s0,0x2
 d30:	fff4c503          	lbu	a0,-1(s1)
 d34:	7fc42783          	lw	a5,2044(s0) # 27fc <f_putchar>
 d38:	fff48493          	addi	s1,s1,-1
 d3c:	03050513          	addi	a0,a0,48
 d40:	000780e7          	jalr	a5
 d44:	ff2496e3          	bne	s1,s2,d30 <print_dec+0x6c>
 d48:	10c12083          	lw	ra,268(sp)
 d4c:	10812403          	lw	s0,264(sp)
 d50:	10412483          	lw	s1,260(sp)
 d54:	10012903          	lw	s2,256(sp)
 d58:	11010113          	addi	sp,sp,272
 d5c:	00008067          	ret
 d60:	00010493          	mv	s1,sp
 d64:	00010913          	mv	s2,sp
 d68:	fbdff06f          	j	d24 <print_dec+0x60>

Disassembly of section .text.print_hex_digits:

00000d6c <print_hex_digits>:
 d6c:	fe010113          	addi	sp,sp,-32
 d70:	00812c23          	sw	s0,24(sp)
 d74:	fff58413          	addi	s0,a1,-1
 d78:	00912a23          	sw	s1,20(sp)
 d7c:	01212823          	sw	s2,16(sp)
 d80:	01312623          	sw	s3,12(sp)
 d84:	00112e23          	sw	ra,28(sp)
 d88:	00050493          	mv	s1,a0
 d8c:	00241413          	slli	s0,s0,0x2
 d90:	00002937          	lui	s2,0x2
 d94:	000029b7          	lui	s3,0x2
 d98:	02045063          	bgez	s0,db8 <print_hex_digits+0x4c>
 d9c:	01c12083          	lw	ra,28(sp)
 da0:	01812403          	lw	s0,24(sp)
 da4:	01412483          	lw	s1,20(sp)
 da8:	01012903          	lw	s2,16(sp)
 dac:	00c12983          	lw	s3,12(sp)
 db0:	02010113          	addi	sp,sp,32
 db4:	00008067          	ret
 db8:	0084d733          	srl	a4,s1,s0
 dbc:	00f77713          	andi	a4,a4,15
 dc0:	7a490793          	addi	a5,s2,1956 # 27a4 <font+0x1e0>
 dc4:	00e787b3          	add	a5,a5,a4
 dc8:	0007c503          	lbu	a0,0(a5)
 dcc:	7fc9a703          	lw	a4,2044(s3) # 27fc <f_putchar>
 dd0:	ffc40413          	addi	s0,s0,-4
 dd4:	000700e7          	jalr	a4
 dd8:	fc1ff06f          	j	d98 <print_hex_digits+0x2c>

Disassembly of section .text.print_hex:

00000ddc <print_hex>:
 ddc:	00800593          	li	a1,8
 de0:	00000317          	auipc	t1,0x0
 de4:	f8c30067          	jr	-116(t1) # d6c <print_hex_digits>

Disassembly of section .text.printf:

00000de8 <printf>:
 de8:	fb010113          	addi	sp,sp,-80
 dec:	04f12223          	sw	a5,68(sp)
 df0:	03410793          	addi	a5,sp,52
 df4:	02812423          	sw	s0,40(sp)
 df8:	02912223          	sw	s1,36(sp)
 dfc:	03212023          	sw	s2,32(sp)
 e00:	01312e23          	sw	s3,28(sp)
 e04:	01412c23          	sw	s4,24(sp)
 e08:	01512a23          	sw	s5,20(sp)
 e0c:	01612823          	sw	s6,16(sp)
 e10:	02112623          	sw	ra,44(sp)
 e14:	00050413          	mv	s0,a0
 e18:	02b12a23          	sw	a1,52(sp)
 e1c:	02c12c23          	sw	a2,56(sp)
 e20:	02d12e23          	sw	a3,60(sp)
 e24:	04e12023          	sw	a4,64(sp)
 e28:	05012423          	sw	a6,72(sp)
 e2c:	05112623          	sw	a7,76(sp)
 e30:	00f12623          	sw	a5,12(sp)
 e34:	02500913          	li	s2,37
 e38:	000024b7          	lui	s1,0x2
 e3c:	07300993          	li	s3,115
 e40:	07800a13          	li	s4,120
 e44:	06400a93          	li	s5,100
 e48:	06300b13          	li	s6,99
 e4c:	00044503          	lbu	a0,0(s0)
 e50:	02051663          	bnez	a0,e7c <printf+0x94>
 e54:	02c12083          	lw	ra,44(sp)
 e58:	02812403          	lw	s0,40(sp)
 e5c:	02412483          	lw	s1,36(sp)
 e60:	02012903          	lw	s2,32(sp)
 e64:	01c12983          	lw	s3,28(sp)
 e68:	01812a03          	lw	s4,24(sp)
 e6c:	01412a83          	lw	s5,20(sp)
 e70:	01012b03          	lw	s6,16(sp)
 e74:	05010113          	addi	sp,sp,80
 e78:	00008067          	ret
 e7c:	09251863          	bne	a0,s2,f0c <printf+0x124>
 e80:	00144503          	lbu	a0,1(s0)
 e84:	03351463          	bne	a0,s3,eac <printf+0xc4>
 e88:	00c12783          	lw	a5,12(sp)
 e8c:	0007a503          	lw	a0,0(a5)
 e90:	00478713          	addi	a4,a5,4
 e94:	00e12623          	sw	a4,12(sp)
 e98:	00000097          	auipc	ra,0x0
 e9c:	de8080e7          	jalr	-536(ra) # c80 <print_string>
 ea0:	00140413          	addi	s0,s0,1
 ea4:	00140413          	addi	s0,s0,1
 ea8:	fa5ff06f          	j	e4c <printf+0x64>
 eac:	03451063          	bne	a0,s4,ecc <printf+0xe4>
 eb0:	00c12783          	lw	a5,12(sp)
 eb4:	0007a503          	lw	a0,0(a5)
 eb8:	00478713          	addi	a4,a5,4
 ebc:	00e12623          	sw	a4,12(sp)
 ec0:	00000097          	auipc	ra,0x0
 ec4:	f1c080e7          	jalr	-228(ra) # ddc <print_hex>
 ec8:	fd9ff06f          	j	ea0 <printf+0xb8>
 ecc:	03551063          	bne	a0,s5,eec <printf+0x104>
 ed0:	00c12783          	lw	a5,12(sp)
 ed4:	0007a503          	lw	a0,0(a5)
 ed8:	00478713          	addi	a4,a5,4
 edc:	00e12623          	sw	a4,12(sp)
 ee0:	00000097          	auipc	ra,0x0
 ee4:	de4080e7          	jalr	-540(ra) # cc4 <print_dec>
 ee8:	fb9ff06f          	j	ea0 <printf+0xb8>
 eec:	7fc4a783          	lw	a5,2044(s1) # 27fc <f_putchar>
 ef0:	01651a63          	bne	a0,s6,f04 <printf+0x11c>
 ef4:	00c12703          	lw	a4,12(sp)
 ef8:	00072503          	lw	a0,0(a4)
 efc:	00470693          	addi	a3,a4,4
 f00:	00d12623          	sw	a3,12(sp)
 f04:	000780e7          	jalr	a5
 f08:	f99ff06f          	j	ea0 <printf+0xb8>
 f0c:	7fc4a783          	lw	a5,2044(s1)
 f10:	000780e7          	jalr	a5
 f14:	f91ff06f          	j	ea4 <printf+0xbc>

Disassembly of section .text.__mulsi3:

00000f18 <__mulsi3>:
 f18:	00050793          	mv	a5,a0
 f1c:	00000513          	li	a0,0
 f20:	00079463          	bnez	a5,f28 <__mulsi3+0x10>
 f24:	00008067          	ret
 f28:	0017f713          	andi	a4,a5,1
 f2c:	40e00733          	neg	a4,a4
 f30:	00b77733          	and	a4,a4,a1
 f34:	00e50533          	add	a0,a0,a4
 f38:	0017d793          	srli	a5,a5,0x1
 f3c:	00159593          	slli	a1,a1,0x1
 f40:	fe1ff06f          	j	f20 <__mulsi3+0x8>

Disassembly of section .text.fat_list_insert_last:

00000f44 <fat_list_insert_last>:
 f44:	00452783          	lw	a5,4(a0)
 f48:	04079263          	bnez	a5,f8c <fat_list_insert_last+0x48>
 f4c:	00052783          	lw	a5,0(a0)
 f50:	00079c63          	bnez	a5,f68 <fat_list_insert_last+0x24>
 f54:	00b52023          	sw	a1,0(a0)
 f58:	00b52223          	sw	a1,4(a0)
 f5c:	0005a023          	sw	zero,0(a1)
 f60:	0005a223          	sw	zero,4(a1)
 f64:	00008067          	ret
 f68:	0007a703          	lw	a4,0(a5)
 f6c:	00f5a223          	sw	a5,4(a1)
 f70:	00e5a023          	sw	a4,0(a1)
 f74:	00071863          	bnez	a4,f84 <fat_list_insert_last+0x40>
 f78:	00b52023          	sw	a1,0(a0)
 f7c:	00b7a023          	sw	a1,0(a5)
 f80:	00008067          	ret
 f84:	00b72223          	sw	a1,4(a4)
 f88:	ff5ff06f          	j	f7c <fat_list_insert_last+0x38>
 f8c:	0047a703          	lw	a4,4(a5)
 f90:	00f5a023          	sw	a5,0(a1)
 f94:	00e5a223          	sw	a4,4(a1)
 f98:	00071863          	bnez	a4,fa8 <fat_list_insert_last+0x64>
 f9c:	00b52223          	sw	a1,4(a0)
 fa0:	00b7a223          	sw	a1,4(a5)
 fa4:	00008067          	ret
 fa8:	00b72023          	sw	a1,0(a4)
 fac:	ff5ff06f          	j	fa0 <fat_list_insert_last+0x5c>

Disassembly of section .text.FileString_StrCmpNoCase:

00000fb0 <FileString_StrCmpNoCase>:
     fb0:	00050313          	mv	t1,a0
     fb4:	00000793          	li	a5,0
     fb8:	01900e13          	li	t3,25
     fbc:	00c79663          	bne	a5,a2,fc8 <FileString_StrCmpNoCase+0x18>
     fc0:	00000513          	li	a0,0
     fc4:	00008067          	ret
     fc8:	00f30733          	add	a4,t1,a5
     fcc:	00074883          	lbu	a7,0(a4)
     fd0:	00f58733          	add	a4,a1,a5
     fd4:	00074803          	lbu	a6,0(a4)
     fd8:	fbf88713          	addi	a4,a7,-65
     fdc:	0ff77713          	zext.b	a4,a4
     fe0:	00088693          	mv	a3,a7
     fe4:	00ee6663          	bltu	t3,a4,ff0 <FileString_StrCmpNoCase+0x40>
     fe8:	02088693          	addi	a3,a7,32
     fec:	0ff6f693          	zext.b	a3,a3
     ff0:	fbf80513          	addi	a0,a6,-65
     ff4:	0ff57513          	zext.b	a0,a0
     ff8:	00080713          	mv	a4,a6
     ffc:	00ae6663          	bltu	t3,a0,1008 <FileString_StrCmpNoCase+0x58>
    1000:	02080713          	addi	a4,a6,32
    1004:	0ff77713          	zext.b	a4,a4
    1008:	40e68533          	sub	a0,a3,a4
    100c:	00e69863          	bne	a3,a4,101c <FileString_StrCmpNoCase+0x6c>
    1010:	00088663          	beqz	a7,101c <FileString_StrCmpNoCase+0x6c>
    1014:	00178793          	addi	a5,a5,1
    1018:	fa0812e3          	bnez	a6,fbc <FileString_StrCmpNoCase+0xc>
    101c:	00008067          	ret

Disassembly of section .text.FileString_GetExtension:

00001020 <FileString_GetExtension>:
    1020:	00050713          	mv	a4,a0
    1024:	00050793          	mv	a5,a0
    1028:	02e00613          	li	a2,46
    102c:	fff00513          	li	a0,-1
    1030:	0007c683          	lbu	a3,0(a5)
    1034:	00069463          	bnez	a3,103c <FileString_GetExtension+0x1c>
    1038:	00008067          	ret
    103c:	00c69463          	bne	a3,a2,1044 <FileString_GetExtension+0x24>
    1040:	40e78533          	sub	a0,a5,a4
    1044:	00178793          	addi	a5,a5,1
    1048:	fe9ff06f          	j	1030 <FileString_GetExtension+0x10>

Disassembly of section .text.fatfs_fat_writeback:

0000104c <fatfs_fat_writeback>:
    104c:	00059663          	bnez	a1,1058 <fatfs_fat_writeback+0xc>
    1050:	00000513          	li	a0,0
    1054:	00008067          	ret
    1058:	2045a703          	lw	a4,516(a1)
    105c:	ff010113          	addi	sp,sp,-16
    1060:	00812423          	sw	s0,8(sp)
    1064:	00112623          	sw	ra,12(sp)
    1068:	00058413          	mv	s0,a1
    106c:	00070a63          	beqz	a4,1080 <fatfs_fat_writeback+0x34>
    1070:	03852683          	lw	a3,56(a0)
    1074:	00050793          	mv	a5,a0
    1078:	00069863          	bnez	a3,1088 <fatfs_fat_writeback+0x3c>
    107c:	20042223          	sw	zero,516(s0)
    1080:	00100513          	li	a0,1
    1084:	0380006f          	j	10bc <fatfs_fat_writeback+0x70>
    1088:	0147a703          	lw	a4,20(a5)
    108c:	2005a503          	lw	a0,512(a1)
    1090:	00100613          	li	a2,1
    1094:	0207a583          	lw	a1,32(a5)
    1098:	40e607b3          	sub	a5,a2,a4
    109c:	00a787b3          	add	a5,a5,a0
    10a0:	00f5f663          	bgeu	a1,a5,10ac <fatfs_fat_writeback+0x60>
    10a4:	00b70733          	add	a4,a4,a1
    10a8:	40a70633          	sub	a2,a4,a0
    10ac:	00040593          	mv	a1,s0
    10b0:	000680e7          	jalr	a3
    10b4:	fc0514e3          	bnez	a0,107c <fatfs_fat_writeback+0x30>
    10b8:	00000513          	li	a0,0
    10bc:	00c12083          	lw	ra,12(sp)
    10c0:	00812403          	lw	s0,8(sp)
    10c4:	01010113          	addi	sp,sp,16
    10c8:	00008067          	ret

Disassembly of section .text.fatfs_fat_read_sector:

000010cc <fatfs_fat_read_sector>:
    10cc:	fe010113          	addi	sp,sp,-32
    10d0:	01212823          	sw	s2,16(sp)
    10d4:	25452903          	lw	s2,596(a0)
    10d8:	00812c23          	sw	s0,24(sp)
    10dc:	00912a23          	sw	s1,20(sp)
    10e0:	01312623          	sw	s3,12(sp)
    10e4:	00112e23          	sw	ra,28(sp)
    10e8:	00050993          	mv	s3,a0
    10ec:	00058493          	mv	s1,a1
    10f0:	00000413          	li	s0,0
    10f4:	04091063          	bnez	s2,1134 <fatfs_fat_read_sector+0x68>
    10f8:	2549a783          	lw	a5,596(s3)
    10fc:	20f42623          	sw	a5,524(s0)
    1100:	20442783          	lw	a5,516(s0)
    1104:	2489aa23          	sw	s0,596(s3)
    1108:	08079863          	bnez	a5,1198 <fatfs_fat_read_sector+0xcc>
    110c:	0349a783          	lw	a5,52(s3)
    1110:	20942023          	sw	s1,512(s0)
    1114:	00100613          	li	a2,1
    1118:	00040593          	mv	a1,s0
    111c:	00048513          	mv	a0,s1
    1120:	000780e7          	jalr	a5
    1124:	08051663          	bnez	a0,11b0 <fatfs_fat_read_sector+0xe4>
    1128:	fff00793          	li	a5,-1
    112c:	20f42023          	sw	a5,512(s0)
    1130:	0480006f          	j	1178 <fatfs_fat_read_sector+0xac>
    1134:	20092783          	lw	a5,512(s2)
    1138:	00f4e663          	bltu	s1,a5,1144 <fatfs_fat_read_sector+0x78>
    113c:	00178713          	addi	a4,a5,1
    1140:	02e4e463          	bltu	s1,a4,1168 <fatfs_fat_read_sector+0x9c>
    1144:	20c92783          	lw	a5,524(s2)
    1148:	00079663          	bnez	a5,1154 <fatfs_fat_read_sector+0x88>
    114c:	00040a63          	beqz	s0,1160 <fatfs_fat_read_sector+0x94>
    1150:	20042623          	sw	zero,524(s0)
    1154:	00090413          	mv	s0,s2
    1158:	20c92903          	lw	s2,524(s2)
    115c:	f99ff06f          	j	10f4 <fatfs_fat_read_sector+0x28>
    1160:	2409aa23          	sw	zero,596(s3)
    1164:	ff1ff06f          	j	1154 <fatfs_fat_read_sector+0x88>
    1168:	40f484b3          	sub	s1,s1,a5
    116c:	00949493          	slli	s1,s1,0x9
    1170:	009904b3          	add	s1,s2,s1
    1174:	20992423          	sw	s1,520(s2)
    1178:	01c12083          	lw	ra,28(sp)
    117c:	01812403          	lw	s0,24(sp)
    1180:	01412483          	lw	s1,20(sp)
    1184:	00c12983          	lw	s3,12(sp)
    1188:	00090513          	mv	a0,s2
    118c:	01012903          	lw	s2,16(sp)
    1190:	02010113          	addi	sp,sp,32
    1194:	00008067          	ret
    1198:	00040593          	mv	a1,s0
    119c:	00098513          	mv	a0,s3
    11a0:	00000097          	auipc	ra,0x0
    11a4:	eac080e7          	jalr	-340(ra) # 104c <fatfs_fat_writeback>
    11a8:	f60512e3          	bnez	a0,110c <fatfs_fat_read_sector+0x40>
    11ac:	fcdff06f          	j	1178 <fatfs_fat_read_sector+0xac>
    11b0:	20842423          	sw	s0,520(s0)
    11b4:	00040913          	mv	s2,s0
    11b8:	fc1ff06f          	j	1178 <fatfs_fat_read_sector+0xac>

Disassembly of section .text.fatfs_lba_of_cluster:

000011bc <fatfs_lba_of_cluster>:
    11bc:	ff010113          	addi	sp,sp,-16
    11c0:	00812423          	sw	s0,8(sp)
    11c4:	00112623          	sw	ra,12(sp)
    11c8:	00050413          	mv	s0,a0
    11cc:	00058513          	mv	a0,a1
    11d0:	00044583          	lbu	a1,0(s0)
    11d4:	ffe50513          	addi	a0,a0,-2
    11d8:	00000097          	auipc	ra,0x0
    11dc:	d40080e7          	jalr	-704(ra) # f18 <__mulsi3>
    11e0:	00442783          	lw	a5,4(s0)
    11e4:	00f50533          	add	a0,a0,a5
    11e8:	03042783          	lw	a5,48(s0)
    11ec:	00079863          	bnez	a5,11fc <fatfs_lba_of_cluster+0x40>
    11f0:	02845783          	lhu	a5,40(s0)
    11f4:	4047d793          	srai	a5,a5,0x4
    11f8:	00f50533          	add	a0,a0,a5
    11fc:	00c12083          	lw	ra,12(sp)
    1200:	00812403          	lw	s0,8(sp)
    1204:	01010113          	addi	sp,sp,16
    1208:	00008067          	ret

Disassembly of section .text.fl_init:

0000120c <fl_init>:
    120c:	ff010113          	addi	sp,sp,-16
    1210:	00812423          	sw	s0,8(sp)
    1214:	00003437          	lui	s0,0x3
    1218:	00112623          	sw	ra,12(sp)
    121c:	80040793          	addi	a5,s0,-2048 # 2800 <_free_file_list>
    1220:	0007a223          	sw	zero,4(a5)
    1224:	0007a023          	sw	zero,0(a5)
    1228:	000035b7          	lui	a1,0x3
    122c:	000037b7          	lui	a5,0x3
    1230:	80878793          	addi	a5,a5,-2040 # 2808 <_open_file_list>
    1234:	80040513          	addi	a0,s0,-2048
    1238:	0bc58593          	addi	a1,a1,188 # 30bc <_files+0x43c>
    123c:	0007a223          	sw	zero,4(a5)
    1240:	0007a023          	sw	zero,0(a5)
    1244:	00000097          	auipc	ra,0x0
    1248:	d00080e7          	jalr	-768(ra) # f44 <fat_list_insert_last>
    124c:	000035b7          	lui	a1,0x3
    1250:	80040513          	addi	a0,s0,-2048
    1254:	50058593          	addi	a1,a1,1280 # 3500 <_files+0x880>
    1258:	00000097          	auipc	ra,0x0
    125c:	cec080e7          	jalr	-788(ra) # f44 <fat_list_insert_last>
    1260:	00c12083          	lw	ra,12(sp)
    1264:	00812403          	lw	s0,8(sp)
    1268:	000037b7          	lui	a5,0x3
    126c:	00100713          	li	a4,1
    1270:	c6e7ae23          	sw	a4,-900(a5) # 2c7c <_filelib_init>
    1274:	01010113          	addi	sp,sp,16
    1278:	00008067          	ret

Disassembly of section .text.fl_closedir:

0000127c <fl_closedir>:
    127c:	00000513          	li	a0,0
    1280:	00008067          	ret

Disassembly of section .text.fatfs_lfn_cache_entry:

00001284 <fatfs_lfn_cache_entry>:
    1284:	0005c783          	lbu	a5,0(a1)
    1288:	01300693          	li	a3,19
    128c:	01f7f793          	andi	a5,a5,31
    1290:	fff78713          	addi	a4,a5,-1
    1294:	0ff77613          	zext.b	a2,a4
    1298:	0ac6ea63          	bltu	a3,a2,134c <fatfs_lfn_cache_entry+0xc8>
    129c:	10554683          	lbu	a3,261(a0)
    12a0:	00069463          	bnez	a3,12a8 <fatfs_lfn_cache_entry+0x24>
    12a4:	10f502a3          	sb	a5,261(a0)
    12a8:	00171793          	slli	a5,a4,0x1
    12ac:	00e787b3          	add	a5,a5,a4
    12b0:	0015c683          	lbu	a3,1(a1)
    12b4:	00279793          	slli	a5,a5,0x2
    12b8:	00e787b3          	add	a5,a5,a4
    12bc:	00f50533          	add	a0,a0,a5
    12c0:	00d50023          	sb	a3,0(a0)
    12c4:	0035c783          	lbu	a5,3(a1)
    12c8:	0ff00713          	li	a4,255
    12cc:	02000693          	li	a3,32
    12d0:	00f500a3          	sb	a5,1(a0)
    12d4:	0055c783          	lbu	a5,5(a1)
    12d8:	00f50123          	sb	a5,2(a0)
    12dc:	0075c783          	lbu	a5,7(a1)
    12e0:	00f501a3          	sb	a5,3(a0)
    12e4:	0095c783          	lbu	a5,9(a1)
    12e8:	00f50223          	sb	a5,4(a0)
    12ec:	00e5c783          	lbu	a5,14(a1)
    12f0:	00f502a3          	sb	a5,5(a0)
    12f4:	0105c783          	lbu	a5,16(a1)
    12f8:	00f50323          	sb	a5,6(a0)
    12fc:	0125c783          	lbu	a5,18(a1)
    1300:	00f503a3          	sb	a5,7(a0)
    1304:	0145c783          	lbu	a5,20(a1)
    1308:	00f50423          	sb	a5,8(a0)
    130c:	0165c783          	lbu	a5,22(a1)
    1310:	00f504a3          	sb	a5,9(a0)
    1314:	0185c783          	lbu	a5,24(a1)
    1318:	00f50523          	sb	a5,10(a0)
    131c:	01c5c783          	lbu	a5,28(a1)
    1320:	00f505a3          	sb	a5,11(a0)
    1324:	01e5c783          	lbu	a5,30(a1)
    1328:	00f50623          	sb	a5,12(a0)
    132c:	00d00793          	li	a5,13
    1330:	00054603          	lbu	a2,0(a0)
    1334:	00e61463          	bne	a2,a4,133c <fatfs_lfn_cache_entry+0xb8>
    1338:	00d50023          	sb	a3,0(a0)
    133c:	fff78793          	addi	a5,a5,-1
    1340:	0ff7f793          	zext.b	a5,a5
    1344:	00150513          	addi	a0,a0,1
    1348:	fe0794e3          	bnez	a5,1330 <fatfs_lfn_cache_entry+0xac>
    134c:	00008067          	ret

Disassembly of section .text.fatfs_lfn_cache_get:

00001350 <fatfs_lfn_cache_get>:
    1350:	10554703          	lbu	a4,261(a0)
    1354:	01400793          	li	a5,20
    1358:	00f71663          	bne	a4,a5,1364 <fatfs_lfn_cache_get+0x14>
    135c:	10050223          	sb	zero,260(a0)
    1360:	00008067          	ret
    1364:	02070063          	beqz	a4,1384 <fatfs_lfn_cache_get+0x34>
    1368:	00171793          	slli	a5,a4,0x1
    136c:	00e787b3          	add	a5,a5,a4
    1370:	00279793          	slli	a5,a5,0x2
    1374:	00e787b3          	add	a5,a5,a4
    1378:	00f507b3          	add	a5,a0,a5
    137c:	00078023          	sb	zero,0(a5)
    1380:	00008067          	ret
    1384:	00050023          	sb	zero,0(a0)
    1388:	00008067          	ret

Disassembly of section .text.fatfs_entry_lfn_text:

0000138c <fatfs_entry_lfn_text>:
    138c:	00b54503          	lbu	a0,11(a0)
    1390:	00f57513          	andi	a0,a0,15
    1394:	ff150513          	addi	a0,a0,-15
    1398:	00153513          	seqz	a0,a0
    139c:	00008067          	ret

Disassembly of section .text.fatfs_entry_lfn_invalid:

000013a0 <fatfs_entry_lfn_invalid>:
    13a0:	00054703          	lbu	a4,0(a0)
    13a4:	00050793          	mv	a5,a0
    13a8:	02070463          	beqz	a4,13d0 <fatfs_entry_lfn_invalid+0x30>
    13ac:	0e500693          	li	a3,229
    13b0:	00100513          	li	a0,1
    13b4:	02d70063          	beq	a4,a3,13d4 <fatfs_entry_lfn_invalid+0x34>
    13b8:	00b7c783          	lbu	a5,11(a5)
    13bc:	00800713          	li	a4,8
    13c0:	00e78a63          	beq	a5,a4,13d4 <fatfs_entry_lfn_invalid+0x34>
    13c4:	0067f793          	andi	a5,a5,6
    13c8:	00f03533          	snez	a0,a5
    13cc:	00008067          	ret
    13d0:	00100513          	li	a0,1
    13d4:	00008067          	ret

Disassembly of section .text.fatfs_entry_lfn_exists:

000013d8 <fatfs_entry_lfn_exists>:
    13d8:	00b5c783          	lbu	a5,11(a1)
    13dc:	00f00693          	li	a3,15
    13e0:	00050713          	mv	a4,a0
    13e4:	02d78a63          	beq	a5,a3,1418 <fatfs_entry_lfn_exists+0x40>
    13e8:	0005c683          	lbu	a3,0(a1)
    13ec:	00000513          	li	a0,0
    13f0:	02068663          	beqz	a3,141c <fatfs_entry_lfn_exists+0x44>
    13f4:	0e500613          	li	a2,229
    13f8:	02c68263          	beq	a3,a2,141c <fatfs_entry_lfn_exists+0x44>
    13fc:	00800693          	li	a3,8
    1400:	00d78e63          	beq	a5,a3,141c <fatfs_entry_lfn_exists+0x44>
    1404:	0067f793          	andi	a5,a5,6
    1408:	00079a63          	bnez	a5,141c <fatfs_entry_lfn_exists+0x44>
    140c:	10574503          	lbu	a0,261(a4)
    1410:	00a03533          	snez	a0,a0
    1414:	00008067          	ret
    1418:	00000513          	li	a0,0
    141c:	00008067          	ret

Disassembly of section .text.fatfs_entry_sfn_only:

00001420 <fatfs_entry_sfn_only>:
    1420:	00b54783          	lbu	a5,11(a0)
    1424:	00f00713          	li	a4,15
    1428:	02e78663          	beq	a5,a4,1454 <fatfs_entry_sfn_only+0x34>
    142c:	00054703          	lbu	a4,0(a0)
    1430:	00000513          	li	a0,0
    1434:	02070263          	beqz	a4,1458 <fatfs_entry_sfn_only+0x38>
    1438:	0e500693          	li	a3,229
    143c:	00d70e63          	beq	a4,a3,1458 <fatfs_entry_sfn_only+0x38>
    1440:	00800713          	li	a4,8
    1444:	00e78a63          	beq	a5,a4,1458 <fatfs_entry_sfn_only+0x38>
    1448:	0067f793          	andi	a5,a5,6
    144c:	0017b513          	seqz	a0,a5
    1450:	00008067          	ret
    1454:	00000513          	li	a0,0
    1458:	00008067          	ret

Disassembly of section .text.fatfs_entry_is_dir:

0000145c <fatfs_entry_is_dir>:
    145c:	00b54503          	lbu	a0,11(a0)
    1460:	00455513          	srli	a0,a0,0x4
    1464:	00157513          	andi	a0,a0,1
    1468:	00008067          	ret

Disassembly of section .text.fatfs_total_path_levels:

0000146c <fatfs_total_path_levels>:
    146c:	00050793          	mv	a5,a0
    1470:	06050463          	beqz	a0,14d8 <fatfs_total_path_levels+0x6c>
    1474:	00054703          	lbu	a4,0(a0)
    1478:	02f00693          	li	a3,47
    147c:	00d71863          	bne	a4,a3,148c <fatfs_total_path_levels+0x20>
    1480:	00150793          	addi	a5,a0,1
    1484:	00000513          	li	a0,0
    1488:	0400006f          	j	14c8 <fatfs_total_path_levels+0x5c>
    148c:	00154683          	lbu	a3,1(a0)
    1490:	03a00713          	li	a4,58
    1494:	00e68a63          	beq	a3,a4,14a8 <fatfs_total_path_levels+0x3c>
    1498:	00254683          	lbu	a3,2(a0)
    149c:	05c00713          	li	a4,92
    14a0:	fff00513          	li	a0,-1
    14a4:	02e69c63          	bne	a3,a4,14dc <fatfs_total_path_levels+0x70>
    14a8:	00378793          	addi	a5,a5,3
    14ac:	05c00713          	li	a4,92
    14b0:	fd5ff06f          	j	1484 <fatfs_total_path_levels+0x18>
    14b4:	00178793          	addi	a5,a5,1
    14b8:	00e68663          	beq	a3,a4,14c4 <fatfs_total_path_levels+0x58>
    14bc:	0007c683          	lbu	a3,0(a5)
    14c0:	fe069ae3          	bnez	a3,14b4 <fatfs_total_path_levels+0x48>
    14c4:	00150513          	addi	a0,a0,1
    14c8:	0007c683          	lbu	a3,0(a5)
    14cc:	fe0698e3          	bnez	a3,14bc <fatfs_total_path_levels+0x50>
    14d0:	fff50513          	addi	a0,a0,-1
    14d4:	00008067          	ret
    14d8:	fff00513          	li	a0,-1
    14dc:	00008067          	ret

Disassembly of section .text.fatfs_get_substring:

000014e0 <fatfs_get_substring>:
    14e0:	0c050c63          	beqz	a0,15b8 <fatfs_get_substring+0xd8>
    14e4:	fe010113          	addi	sp,sp,-32
    14e8:	00912a23          	sw	s1,20(sp)
    14ec:	00112e23          	sw	ra,28(sp)
    14f0:	00812c23          	sw	s0,24(sp)
    14f4:	01212823          	sw	s2,16(sp)
    14f8:	01312623          	sw	s3,12(sp)
    14fc:	01412423          	sw	s4,8(sp)
    1500:	00050793          	mv	a5,a0
    1504:	00068493          	mv	s1,a3
    1508:	fff00513          	li	a0,-1
    150c:	06d05a63          	blez	a3,1580 <fatfs_get_substring+0xa0>
    1510:	0007c983          	lbu	s3,0(a5)
    1514:	02f00713          	li	a4,47
    1518:	00058a13          	mv	s4,a1
    151c:	00060913          	mv	s2,a2
    1520:	00178413          	addi	s0,a5,1
    1524:	02e98463          	beq	s3,a4,154c <fatfs_get_substring+0x6c>
    1528:	0017c683          	lbu	a3,1(a5)
    152c:	03a00713          	li	a4,58
    1530:	00e68a63          	beq	a3,a4,1544 <fatfs_get_substring+0x64>
    1534:	0027c683          	lbu	a3,2(a5)
    1538:	05c00713          	li	a4,92
    153c:	fff00513          	li	a0,-1
    1540:	04e69063          	bne	a3,a4,1580 <fatfs_get_substring+0xa0>
    1544:	00378413          	addi	s0,a5,3
    1548:	05c00993          	li	s3,92
    154c:	00040513          	mv	a0,s0
    1550:	fffff097          	auipc	ra,0xfffff
    1554:	368080e7          	jalr	872(ra) # 8b8 <strlen>
    1558:	00000713          	li	a4,0
    155c:	00000693          	li	a3,0
    1560:	00000793          	li	a5,0
    1564:	fff48493          	addi	s1,s1,-1
    1568:	00e905b3          	add	a1,s2,a4
    156c:	02a7ca63          	blt	a5,a0,15a0 <fatfs_get_substring+0xc0>
    1570:	00058023          	sb	zero,0(a1)
    1574:	00094503          	lbu	a0,0(s2)
    1578:	00153513          	seqz	a0,a0
    157c:	40a00533          	neg	a0,a0
    1580:	01c12083          	lw	ra,28(sp)
    1584:	01812403          	lw	s0,24(sp)
    1588:	01412483          	lw	s1,20(sp)
    158c:	01012903          	lw	s2,16(sp)
    1590:	00c12983          	lw	s3,12(sp)
    1594:	00812a03          	lw	s4,8(sp)
    1598:	02010113          	addi	sp,sp,32
    159c:	00008067          	ret
    15a0:	00f40633          	add	a2,s0,a5
    15a4:	00064603          	lbu	a2,0(a2)
    15a8:	01361c63          	bne	a2,s3,15c0 <fatfs_get_substring+0xe0>
    15ac:	00168693          	addi	a3,a3,1
    15b0:	00178793          	addi	a5,a5,1
    15b4:	fb5ff06f          	j	1568 <fatfs_get_substring+0x88>
    15b8:	fff00513          	li	a0,-1
    15bc:	00008067          	ret
    15c0:	ff4698e3          	bne	a3,s4,15b0 <fatfs_get_substring+0xd0>
    15c4:	fe9756e3          	bge	a4,s1,15b0 <fatfs_get_substring+0xd0>
    15c8:	00170713          	addi	a4,a4,1
    15cc:	00c58023          	sb	a2,0(a1)
    15d0:	fe1ff06f          	j	15b0 <fatfs_get_substring+0xd0>

Disassembly of section .text.fatfs_compare_names:

000015d4 <fatfs_compare_names>:
    15d4:	fc010113          	addi	sp,sp,-64
    15d8:	02112e23          	sw	ra,60(sp)
    15dc:	03212823          	sw	s2,48(sp)
    15e0:	03312623          	sw	s3,44(sp)
    15e4:	03412423          	sw	s4,40(sp)
    15e8:	03512223          	sw	s5,36(sp)
    15ec:	00058a13          	mv	s4,a1
    15f0:	03612023          	sw	s6,32(sp)
    15f4:	02812c23          	sw	s0,56(sp)
    15f8:	02912a23          	sw	s1,52(sp)
    15fc:	01712e23          	sw	s7,28(sp)
    1600:	01812c23          	sw	s8,24(sp)
    1604:	00050b13          	mv	s6,a0
    1608:	00000097          	auipc	ra,0x0
    160c:	a18080e7          	jalr	-1512(ra) # 1020 <FileString_GetExtension>
    1610:	00050993          	mv	s3,a0
    1614:	000a0513          	mv	a0,s4
    1618:	00000097          	auipc	ra,0x0
    161c:	a08080e7          	jalr	-1528(ra) # 1020 <FileString_GetExtension>
    1620:	fff00793          	li	a5,-1
    1624:	00050913          	mv	s2,a0
    1628:	00000a93          	li	s5,0
    162c:	08f99263          	bne	s3,a5,16b0 <fatfs_compare_names+0xdc>
    1630:	0d351a63          	bne	a0,s3,1704 <fatfs_compare_names+0x130>
    1634:	000b0513          	mv	a0,s6
    1638:	fffff097          	auipc	ra,0xfffff
    163c:	280080e7          	jalr	640(ra) # 8b8 <strlen>
    1640:	00050493          	mv	s1,a0
    1644:	00050993          	mv	s3,a0
    1648:	000a0513          	mv	a0,s4
    164c:	fffff097          	auipc	ra,0xfffff
    1650:	26c080e7          	jalr	620(ra) # 8b8 <strlen>
    1654:	00050413          	mv	s0,a0
    1658:	00050913          	mv	s2,a0
    165c:	fff48793          	addi	a5,s1,-1
    1660:	00fb07b3          	add	a5,s6,a5
    1664:	41378733          	sub	a4,a5,s3
    1668:	02000613          	li	a2,32
    166c:	00078693          	mv	a3,a5
    1670:	0ce79463          	bne	a5,a4,1738 <fatfs_compare_names+0x164>
    1674:	fff40793          	addi	a5,s0,-1
    1678:	00fa07b3          	add	a5,s4,a5
    167c:	41278733          	sub	a4,a5,s2
    1680:	02000613          	li	a2,32
    1684:	00078693          	mv	a3,a5
    1688:	0ce79263          	bne	a5,a4,174c <fatfs_compare_names+0x178>
    168c:	00000a93          	li	s5,0
    1690:	07391a63          	bne	s2,s3,1704 <fatfs_compare_names+0x130>
    1694:	00090613          	mv	a2,s2
    1698:	000a0593          	mv	a1,s4
    169c:	000b0513          	mv	a0,s6
    16a0:	00000097          	auipc	ra,0x0
    16a4:	910080e7          	jalr	-1776(ra) # fb0 <FileString_StrCmpNoCase>
    16a8:	00153a93          	seqz	s5,a0
    16ac:	0580006f          	j	1704 <fatfs_compare_names+0x130>
    16b0:	04f50a63          	beq	a0,a5,1704 <fatfs_compare_names+0x130>
    16b4:	00198b93          	addi	s7,s3,1
    16b8:	017b0bb3          	add	s7,s6,s7
    16bc:	00150c13          	addi	s8,a0,1
    16c0:	00050413          	mv	s0,a0
    16c4:	000b8513          	mv	a0,s7
    16c8:	fffff097          	auipc	ra,0xfffff
    16cc:	1f0080e7          	jalr	496(ra) # 8b8 <strlen>
    16d0:	018a0c33          	add	s8,s4,s8
    16d4:	00a12623          	sw	a0,12(sp)
    16d8:	000c0513          	mv	a0,s8
    16dc:	fffff097          	auipc	ra,0xfffff
    16e0:	1dc080e7          	jalr	476(ra) # 8b8 <strlen>
    16e4:	00c12603          	lw	a2,12(sp)
    16e8:	00098493          	mv	s1,s3
    16ec:	00a61c63          	bne	a2,a0,1704 <fatfs_compare_names+0x130>
    16f0:	000c0593          	mv	a1,s8
    16f4:	000b8513          	mv	a0,s7
    16f8:	00000097          	auipc	ra,0x0
    16fc:	8b8080e7          	jalr	-1864(ra) # fb0 <FileString_StrCmpNoCase>
    1700:	f4050ee3          	beqz	a0,165c <fatfs_compare_names+0x88>
    1704:	03c12083          	lw	ra,60(sp)
    1708:	03812403          	lw	s0,56(sp)
    170c:	03412483          	lw	s1,52(sp)
    1710:	03012903          	lw	s2,48(sp)
    1714:	02c12983          	lw	s3,44(sp)
    1718:	02812a03          	lw	s4,40(sp)
    171c:	02012b03          	lw	s6,32(sp)
    1720:	01c12b83          	lw	s7,28(sp)
    1724:	01812c03          	lw	s8,24(sp)
    1728:	000a8513          	mv	a0,s5
    172c:	02412a83          	lw	s5,36(sp)
    1730:	04010113          	addi	sp,sp,64
    1734:	00008067          	ret
    1738:	0007c583          	lbu	a1,0(a5)
    173c:	fff78793          	addi	a5,a5,-1
    1740:	f2c59ae3          	bne	a1,a2,1674 <fatfs_compare_names+0xa0>
    1744:	416689b3          	sub	s3,a3,s6
    1748:	f25ff06f          	j	166c <fatfs_compare_names+0x98>
    174c:	0007c583          	lbu	a1,0(a5)
    1750:	fff78793          	addi	a5,a5,-1
    1754:	f2c59ce3          	bne	a1,a2,168c <fatfs_compare_names+0xb8>
    1758:	41468933          	sub	s2,a3,s4
    175c:	f29ff06f          	j	1684 <fatfs_compare_names+0xb0>

Disassembly of section .text.fatfs_get_sfn_display_name:

00001760 <fatfs_get_sfn_display_name>:
    1760:	00000713          	li	a4,0
    1764:	00c00613          	li	a2,12
    1768:	02000813          	li	a6,32
    176c:	01900893          	li	a7,25
    1770:	0005c783          	lbu	a5,0(a1)
    1774:	00078463          	beqz	a5,177c <fatfs_get_sfn_display_name+0x1c>
    1778:	00c71863          	bne	a4,a2,1788 <fatfs_get_sfn_display_name+0x28>
    177c:	00050023          	sb	zero,0(a0)
    1780:	00100513          	li	a0,1
    1784:	00008067          	ret
    1788:	00158593          	addi	a1,a1,1
    178c:	ff0782e3          	beq	a5,a6,1770 <fatfs_get_sfn_display_name+0x10>
    1790:	fbf78693          	addi	a3,a5,-65
    1794:	0ff6f693          	zext.b	a3,a3
    1798:	00d8e663          	bltu	a7,a3,17a4 <fatfs_get_sfn_display_name+0x44>
    179c:	02078793          	addi	a5,a5,32
    17a0:	0ff7f793          	zext.b	a5,a5
    17a4:	00f50023          	sb	a5,0(a0)
    17a8:	00170713          	addi	a4,a4,1
    17ac:	00150513          	addi	a0,a0,1
    17b0:	fc1ff06f          	j	1770 <fatfs_get_sfn_display_name+0x10>

Disassembly of section .text.fatfs_fat_init:

000017b4 <fatfs_fat_init>:
    17b4:	ff010113          	addi	sp,sp,-16
    17b8:	00812423          	sw	s0,8(sp)
    17bc:	00912223          	sw	s1,4(sp)
    17c0:	00112623          	sw	ra,12(sp)
    17c4:	fff00793          	li	a5,-1
    17c8:	25850493          	addi	s1,a0,600
    17cc:	00050413          	mv	s0,a0
    17d0:	44f52c23          	sw	a5,1112(a0)
    17d4:	24052a23          	sw	zero,596(a0)
    17d8:	44052e23          	sw	zero,1116(a0)
    17dc:	20000613          	li	a2,512
    17e0:	00048513          	mv	a0,s1
    17e4:	00000593          	li	a1,0
    17e8:	fffff097          	auipc	ra,0xfffff
    17ec:	090080e7          	jalr	144(ra) # 878 <memset>
    17f0:	25442783          	lw	a5,596(s0)
    17f4:	00c12083          	lw	ra,12(sp)
    17f8:	24942a23          	sw	s1,596(s0)
    17fc:	46042023          	sw	zero,1120(s0)
    1800:	46f42223          	sw	a5,1124(s0)
    1804:	00812403          	lw	s0,8(sp)
    1808:	00412483          	lw	s1,4(sp)
    180c:	01010113          	addi	sp,sp,16
    1810:	00008067          	ret

Disassembly of section .text.fatfs_init:

00001814 <fatfs_init>:
    1814:	fd010113          	addi	sp,sp,-48
    1818:	02812423          	sw	s0,40(sp)
    181c:	02112623          	sw	ra,44(sp)
    1820:	02912223          	sw	s1,36(sp)
    1824:	03212023          	sw	s2,32(sp)
    1828:	01312e23          	sw	s3,28(sp)
    182c:	fff00793          	li	a5,-1
    1830:	24f52223          	sw	a5,580(a0)
    1834:	24052423          	sw	zero,584(a0)
    1838:	02052223          	sw	zero,36(a0)
    183c:	00050413          	mv	s0,a0
    1840:	00000097          	auipc	ra,0x0
    1844:	f74080e7          	jalr	-140(ra) # 17b4 <fatfs_fat_init>
    1848:	03442783          	lw	a5,52(s0)
    184c:	02079263          	bnez	a5,1870 <fatfs_init+0x5c>
    1850:	fff00513          	li	a0,-1
    1854:	02c12083          	lw	ra,44(sp)
    1858:	02812403          	lw	s0,40(sp)
    185c:	02412483          	lw	s1,36(sp)
    1860:	02012903          	lw	s2,32(sp)
    1864:	01c12983          	lw	s3,28(sp)
    1868:	03010113          	addi	sp,sp,48
    186c:	00008067          	ret
    1870:	04440593          	addi	a1,s0,68
    1874:	00100613          	li	a2,1
    1878:	00000513          	li	a0,0
    187c:	00b12623          	sw	a1,12(sp)
    1880:	000780e7          	jalr	a5
    1884:	fc0506e3          	beqz	a0,1850 <fatfs_init+0x3c>
    1888:	24042783          	lw	a5,576(s0)
    188c:	ffff0737          	lui	a4,0xffff0
    1890:	00c12583          	lw	a1,12(sp)
    1894:	00e7f7b3          	and	a5,a5,a4
    1898:	aa550737          	lui	a4,0xaa550
    189c:	00e78663          	beq	a5,a4,18a8 <fatfs_init+0x94>
    18a0:	ffd00513          	li	a0,-3
    18a4:	fb1ff06f          	j	1854 <fatfs_init+0x40>
    18a8:	24245703          	lhu	a4,578(s0)
    18ac:	0000b7b7          	lui	a5,0xb
    18b0:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x7dd5>
    18b4:	ffc00513          	li	a0,-4
    18b8:	f8f71ee3          	bne	a4,a5,1854 <fatfs_init+0x40>
    18bc:	20644783          	lbu	a5,518(s0)
    18c0:	00600713          	li	a4,6
    18c4:	02f76463          	bltu	a4,a5,18ec <fatfs_init+0xd8>
    18c8:	00400713          	li	a4,4
    18cc:	00f76663          	bltu	a4,a5,18d8 <fatfs_init+0xc4>
    18d0:	00000513          	li	a0,0
    18d4:	02078663          	beqz	a5,1900 <fatfs_init+0xec>
    18d8:	20c45503          	lhu	a0,524(s0)
    18dc:	20a45783          	lhu	a5,522(s0)
    18e0:	01051513          	slli	a0,a0,0x10
    18e4:	00f56533          	or	a0,a0,a5
    18e8:	0180006f          	j	1900 <fatfs_init+0xec>
    18ec:	00c00713          	li	a4,12
    18f0:	12f76a63          	bltu	a4,a5,1a24 <fatfs_init+0x210>
    18f4:	00a00713          	li	a4,10
    18f8:	00000513          	li	a0,0
    18fc:	fcf76ee3          	bltu	a4,a5,18d8 <fatfs_init+0xc4>
    1900:	03442783          	lw	a5,52(s0)
    1904:	00a42e23          	sw	a0,28(s0)
    1908:	00100613          	li	a2,1
    190c:	000780e7          	jalr	a5
    1910:	f40500e3          	beqz	a0,1850 <fatfs_init+0x3c>
    1914:	05044783          	lbu	a5,80(s0)
    1918:	04f44703          	lbu	a4,79(s0)
    191c:	ffe00513          	li	a0,-2
    1920:	00879793          	slli	a5,a5,0x8
    1924:	00e7e7b3          	or	a5,a5,a4
    1928:	20000713          	li	a4,512
    192c:	f2e794e3          	bne	a5,a4,1854 <fatfs_init+0x40>
    1930:	05644483          	lbu	s1,86(s0)
    1934:	05544783          	lbu	a5,85(s0)
    1938:	05144983          	lbu	s3,81(s0)
    193c:	00849493          	slli	s1,s1,0x8
    1940:	05a45583          	lhu	a1,90(s0)
    1944:	00f4e4b3          	or	s1,s1,a5
    1948:	01340023          	sb	s3,0(s0)
    194c:	02941423          	sh	s1,40(s0)
    1950:	05245903          	lhu	s2,82(s0)
    1954:	05444503          	lbu	a0,84(s0)
    1958:	00059463          	bnez	a1,1960 <fatfs_init+0x14c>
    195c:	06842583          	lw	a1,104(s0)
    1960:	07042783          	lw	a5,112(s0)
    1964:	02b42023          	sw	a1,32(s0)
    1968:	00549493          	slli	s1,s1,0x5
    196c:	00f42423          	sw	a5,8(s0)
    1970:	07445783          	lhu	a5,116(s0)
    1974:	1ff48493          	addi	s1,s1,511
    1978:	4094d493          	srai	s1,s1,0x9
    197c:	00f41c23          	sh	a5,24(s0)
    1980:	fffff097          	auipc	ra,0xfffff
    1984:	598080e7          	jalr	1432(ra) # f18 <__mulsi3>
    1988:	00a907b3          	add	a5,s2,a0
    198c:	00f42623          	sw	a5,12(s0)
    1990:	01c42783          	lw	a5,28(s0)
    1994:	24245703          	lhu	a4,578(s0)
    1998:	00942823          	sw	s1,16(s0)
    199c:	00f907b3          	add	a5,s2,a5
    19a0:	00f42a23          	sw	a5,20(s0)
    19a4:	00f507b3          	add	a5,a0,a5
    19a8:	00f42223          	sw	a5,4(s0)
    19ac:	0000b7b7          	lui	a5,0xb
    19b0:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x7dd5>
    19b4:	eef716e3          	bne	a4,a5,18a0 <fatfs_init+0x8c>
    19b8:	05844783          	lbu	a5,88(s0)
    19bc:	05744703          	lbu	a4,87(s0)
    19c0:	00879793          	slli	a5,a5,0x8
    19c4:	00e7e7b3          	or	a5,a5,a4
    19c8:	00079463          	bnez	a5,19d0 <fatfs_init+0x1bc>
    19cc:	06442783          	lw	a5,100(s0)
    19d0:	00990933          	add	s2,s2,s1
    19d4:	00a90533          	add	a0,s2,a0
    19d8:	40a787b3          	sub	a5,a5,a0
    19dc:	ffb00513          	li	a0,-5
    19e0:	e6098ae3          	beqz	s3,1854 <fatfs_init+0x40>
    19e4:	00078513          	mv	a0,a5
    19e8:	00098593          	mv	a1,s3
    19ec:	ffffe097          	auipc	ra,0xffffe
    19f0:	638080e7          	jalr	1592(ra) # 24 <__udivsi3>
    19f4:	00001737          	lui	a4,0x1
    19f8:	00050793          	mv	a5,a0
    19fc:	ff470713          	addi	a4,a4,-12 # ff4 <FileString_StrCmpNoCase+0x44>
    1a00:	ffb00513          	li	a0,-5
    1a04:	e4f778e3          	bgeu	a4,a5,1854 <fatfs_init+0x40>
    1a08:	00010737          	lui	a4,0x10
    1a0c:	ff470713          	addi	a4,a4,-12 # fff4 <_files+0xd374>
    1a10:	02f76663          	bltu	a4,a5,1a3c <fatfs_init+0x228>
    1a14:	00042423          	sw	zero,8(s0)
    1a18:	02042823          	sw	zero,48(s0)
    1a1c:	00000513          	li	a0,0
    1a20:	e35ff06f          	j	1854 <fatfs_init+0x40>
    1a24:	ff278793          	addi	a5,a5,-14
    1a28:	0ff7f793          	zext.b	a5,a5
    1a2c:	00100713          	li	a4,1
    1a30:	00000513          	li	a0,0
    1a34:	eaf772e3          	bgeu	a4,a5,18d8 <fatfs_init+0xc4>
    1a38:	ec9ff06f          	j	1900 <fatfs_init+0xec>
    1a3c:	00100793          	li	a5,1
    1a40:	02f42823          	sw	a5,48(s0)
    1a44:	fd9ff06f          	j	1a1c <fatfs_init+0x208>

Disassembly of section .text.fl_attach_media:

00001a48 <fl_attach_media>:
    1a48:	000037b7          	lui	a5,0x3
    1a4c:	c7c7a783          	lw	a5,-900(a5) # 2c7c <_filelib_init>
    1a50:	ff010113          	addi	sp,sp,-16
    1a54:	00812423          	sw	s0,8(sp)
    1a58:	00912223          	sw	s1,4(sp)
    1a5c:	00112623          	sw	ra,12(sp)
    1a60:	00050493          	mv	s1,a0
    1a64:	00058413          	mv	s0,a1
    1a68:	00079663          	bnez	a5,1a74 <fl_attach_media+0x2c>
    1a6c:	fffff097          	auipc	ra,0xfffff
    1a70:	7a0080e7          	jalr	1952(ra) # 120c <fl_init>
    1a74:	00003537          	lui	a0,0x3
    1a78:	81050793          	addi	a5,a0,-2032 # 2810 <_fs>
    1a7c:	81050513          	addi	a0,a0,-2032
    1a80:	0287ac23          	sw	s0,56(a5)
    1a84:	0297aa23          	sw	s1,52(a5)
    1a88:	00000097          	auipc	ra,0x0
    1a8c:	d8c080e7          	jalr	-628(ra) # 1814 <fatfs_init>
    1a90:	00050413          	mv	s0,a0
    1a94:	02050863          	beqz	a0,1ac4 <fl_attach_media+0x7c>
    1a98:	00050593          	mv	a1,a0
    1a9c:	00002537          	lui	a0,0x2
    1aa0:	7b850513          	addi	a0,a0,1976 # 27b8 <font+0x1f4>
    1aa4:	fffff097          	auipc	ra,0xfffff
    1aa8:	344080e7          	jalr	836(ra) # de8 <printf>
    1aac:	00c12083          	lw	ra,12(sp)
    1ab0:	00040513          	mv	a0,s0
    1ab4:	00812403          	lw	s0,8(sp)
    1ab8:	00412483          	lw	s1,4(sp)
    1abc:	01010113          	addi	sp,sp,16
    1ac0:	00008067          	ret
    1ac4:	000037b7          	lui	a5,0x3
    1ac8:	00100713          	li	a4,1
    1acc:	c6e7ac23          	sw	a4,-904(a5) # 2c78 <_filelib_valid>
    1ad0:	fddff06f          	j	1aac <fl_attach_media+0x64>

Disassembly of section .text.fatfs_find_next_cluster:

00001ad4 <fatfs_find_next_cluster>:
    1ad4:	ff010113          	addi	sp,sp,-16
    1ad8:	00812423          	sw	s0,8(sp)
    1adc:	01212023          	sw	s2,0(sp)
    1ae0:	00112623          	sw	ra,12(sp)
    1ae4:	00912223          	sw	s1,4(sp)
    1ae8:	00050913          	mv	s2,a0
    1aec:	00200413          	li	s0,2
    1af0:	00058463          	beqz	a1,1af8 <fatfs_find_next_cluster+0x24>
    1af4:	00058413          	mv	s0,a1
    1af8:	03092783          	lw	a5,48(s2)
    1afc:	00745493          	srli	s1,s0,0x7
    1b00:	00079463          	bnez	a5,1b08 <fatfs_find_next_cluster+0x34>
    1b04:	00845493          	srli	s1,s0,0x8
    1b08:	01492583          	lw	a1,20(s2)
    1b0c:	00090513          	mv	a0,s2
    1b10:	00b485b3          	add	a1,s1,a1
    1b14:	fffff097          	auipc	ra,0xfffff
    1b18:	5b8080e7          	jalr	1464(ra) # 10cc <fatfs_fat_read_sector>
    1b1c:	00050793          	mv	a5,a0
    1b20:	fff00513          	li	a0,-1
    1b24:	04078863          	beqz	a5,1b74 <fatfs_find_next_cluster+0xa0>
    1b28:	03092703          	lw	a4,48(s2)
    1b2c:	2087a783          	lw	a5,520(a5)
    1b30:	04071e63          	bnez	a4,1b8c <fatfs_find_next_cluster+0xb8>
    1b34:	00849493          	slli	s1,s1,0x8
    1b38:	40940433          	sub	s0,s0,s1
    1b3c:	00141413          	slli	s0,s0,0x1
    1b40:	01041413          	slli	s0,s0,0x10
    1b44:	01045413          	srli	s0,s0,0x10
    1b48:	008787b3          	add	a5,a5,s0
    1b4c:	0017c503          	lbu	a0,1(a5)
    1b50:	0007c783          	lbu	a5,0(a5)
    1b54:	00851513          	slli	a0,a0,0x8
    1b58:	00f50533          	add	a0,a0,a5
    1b5c:	ffff07b7          	lui	a5,0xffff0
    1b60:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    1b64:	00f507b3          	add	a5,a0,a5
    1b68:	00700713          	li	a4,7
    1b6c:	00f76463          	bltu	a4,a5,1b74 <fatfs_find_next_cluster+0xa0>
    1b70:	fff00513          	li	a0,-1
    1b74:	00c12083          	lw	ra,12(sp)
    1b78:	00812403          	lw	s0,8(sp)
    1b7c:	00412483          	lw	s1,4(sp)
    1b80:	00012903          	lw	s2,0(sp)
    1b84:	01010113          	addi	sp,sp,16
    1b88:	00008067          	ret
    1b8c:	00749493          	slli	s1,s1,0x7
    1b90:	40940433          	sub	s0,s0,s1
    1b94:	00241413          	slli	s0,s0,0x2
    1b98:	01041413          	slli	s0,s0,0x10
    1b9c:	01045413          	srli	s0,s0,0x10
    1ba0:	008787b3          	add	a5,a5,s0
    1ba4:	0037c503          	lbu	a0,3(a5)
    1ba8:	0027c703          	lbu	a4,2(a5)
    1bac:	01851513          	slli	a0,a0,0x18
    1bb0:	01071713          	slli	a4,a4,0x10
    1bb4:	00e50533          	add	a0,a0,a4
    1bb8:	0007c703          	lbu	a4,0(a5)
    1bbc:	0017c783          	lbu	a5,1(a5)
    1bc0:	00e50533          	add	a0,a0,a4
    1bc4:	00879793          	slli	a5,a5,0x8
    1bc8:	00f50533          	add	a0,a0,a5
    1bcc:	00451513          	slli	a0,a0,0x4
    1bd0:	00455513          	srli	a0,a0,0x4
    1bd4:	f00007b7          	lui	a5,0xf0000
    1bd8:	f89ff06f          	j	1b60 <fatfs_find_next_cluster+0x8c>

Disassembly of section .text.fatfs_sector_reader:

00001bdc <fatfs_sector_reader>:
    1bdc:	03052783          	lw	a5,48(a0)
    1be0:	fd010113          	addi	sp,sp,-48
    1be4:	02812423          	sw	s0,40(sp)
    1be8:	03212023          	sw	s2,32(sp)
    1bec:	01312e23          	sw	s3,28(sp)
    1bf0:	02112623          	sw	ra,44(sp)
    1bf4:	02912223          	sw	s1,36(sp)
    1bf8:	01412c23          	sw	s4,24(sp)
    1bfc:	01512a23          	sw	s5,20(sp)
    1c00:	00f5e7b3          	or	a5,a1,a5
    1c04:	00050413          	mv	s0,a0
    1c08:	00060913          	mv	s2,a2
    1c0c:	00068993          	mv	s3,a3
    1c10:	06079c63          	bnez	a5,1c88 <fatfs_sector_reader+0xac>
    1c14:	01052783          	lw	a5,16(a0)
    1c18:	02f66663          	bltu	a2,a5,1c44 <fatfs_sector_reader+0x68>
    1c1c:	00000513          	li	a0,0
    1c20:	02c12083          	lw	ra,44(sp)
    1c24:	02812403          	lw	s0,40(sp)
    1c28:	02412483          	lw	s1,36(sp)
    1c2c:	02012903          	lw	s2,32(sp)
    1c30:	01c12983          	lw	s3,28(sp)
    1c34:	01812a03          	lw	s4,24(sp)
    1c38:	01412a83          	lw	s5,20(sp)
    1c3c:	03010113          	addi	sp,sp,48
    1c40:	00008067          	ret
    1c44:	01c52503          	lw	a0,28(a0)
    1c48:	00c42783          	lw	a5,12(s0)
    1c4c:	00f50533          	add	a0,a0,a5
    1c50:	01250533          	add	a0,a0,s2
    1c54:	0a098263          	beqz	s3,1cf8 <fatfs_sector_reader+0x11c>
    1c58:	03442783          	lw	a5,52(s0)
    1c5c:	00100613          	li	a2,1
    1c60:	00098593          	mv	a1,s3
    1c64:	02812403          	lw	s0,40(sp)
    1c68:	02c12083          	lw	ra,44(sp)
    1c6c:	02412483          	lw	s1,36(sp)
    1c70:	02012903          	lw	s2,32(sp)
    1c74:	01c12983          	lw	s3,28(sp)
    1c78:	01812a03          	lw	s4,24(sp)
    1c7c:	01412a83          	lw	s5,20(sp)
    1c80:	03010113          	addi	sp,sp,48
    1c84:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    1c88:	00058493          	mv	s1,a1
    1c8c:	00054583          	lbu	a1,0(a0)
    1c90:	00060513          	mv	a0,a2
    1c94:	00000a93          	li	s5,0
    1c98:	00b12623          	sw	a1,12(sp)
    1c9c:	ffffe097          	auipc	ra,0xffffe
    1ca0:	388080e7          	jalr	904(ra) # 24 <__udivsi3>
    1ca4:	00c12583          	lw	a1,12(sp)
    1ca8:	00050a13          	mv	s4,a0
    1cac:	00090513          	mv	a0,s2
    1cb0:	ffffe097          	auipc	ra,0xffffe
    1cb4:	3bc080e7          	jalr	956(ra) # 6c <__umodsi3>
    1cb8:	00050913          	mv	s2,a0
    1cbc:	034a9063          	bne	s5,s4,1cdc <fatfs_sector_reader+0x100>
    1cc0:	fff00793          	li	a5,-1
    1cc4:	f4f48ce3          	beq	s1,a5,1c1c <fatfs_sector_reader+0x40>
    1cc8:	00048593          	mv	a1,s1
    1ccc:	00040513          	mv	a0,s0
    1cd0:	fffff097          	auipc	ra,0xfffff
    1cd4:	4ec080e7          	jalr	1260(ra) # 11bc <fatfs_lba_of_cluster>
    1cd8:	f79ff06f          	j	1c50 <fatfs_sector_reader+0x74>
    1cdc:	00048593          	mv	a1,s1
    1ce0:	00040513          	mv	a0,s0
    1ce4:	00000097          	auipc	ra,0x0
    1ce8:	df0080e7          	jalr	-528(ra) # 1ad4 <fatfs_find_next_cluster>
    1cec:	00050493          	mv	s1,a0
    1cf0:	001a8a93          	addi	s5,s5,1
    1cf4:	fc9ff06f          	j	1cbc <fatfs_sector_reader+0xe0>
    1cf8:	24442783          	lw	a5,580(s0)
    1cfc:	00a78c63          	beq	a5,a0,1d14 <fatfs_sector_reader+0x138>
    1d00:	03442783          	lw	a5,52(s0)
    1d04:	24a42223          	sw	a0,580(s0)
    1d08:	00100613          	li	a2,1
    1d0c:	04440593          	addi	a1,s0,68
    1d10:	f55ff06f          	j	1c64 <fatfs_sector_reader+0x88>
    1d14:	00100513          	li	a0,1
    1d18:	f09ff06f          	j	1c20 <fatfs_sector_reader+0x44>

Disassembly of section .text.fatfs_get_file_entry:

00001d1c <fatfs_get_file_entry>:
    1d1c:	eb010113          	addi	sp,sp,-336
    1d20:	14812423          	sw	s0,328(sp)
    1d24:	14912223          	sw	s1,324(sp)
    1d28:	15212023          	sw	s2,320(sp)
    1d2c:	13312e23          	sw	s3,316(sp)
    1d30:	13412c23          	sw	s4,312(sp)
    1d34:	13512a23          	sw	s5,308(sp)
    1d38:	14112623          	sw	ra,332(sp)
    1d3c:	13612823          	sw	s6,304(sp)
    1d40:	13712623          	sw	s7,300(sp)
    1d44:	13812423          	sw	s8,296(sp)
    1d48:	13912223          	sw	s9,292(sp)
    1d4c:	13a12023          	sw	s10,288(sp)
    1d50:	00050493          	mv	s1,a0
    1d54:	00058a93          	mv	s5,a1
    1d58:	00060913          	mv	s2,a2
    1d5c:	00068993          	mv	s3,a3
    1d60:	10010ea3          	sb	zero,285(sp)
    1d64:	01810413          	addi	s0,sp,24
    1d68:	11c10a13          	addi	s4,sp,284
    1d6c:	00040513          	mv	a0,s0
    1d70:	00d00613          	li	a2,13
    1d74:	00000593          	li	a1,0
    1d78:	00d40413          	addi	s0,s0,13
    1d7c:	fffff097          	auipc	ra,0xfffff
    1d80:	afc080e7          	jalr	-1284(ra) # 878 <memset>
    1d84:	ff4414e3          	bne	s0,s4,1d6c <fatfs_get_file_entry+0x50>
    1d88:	00000a13          	li	s4,0
    1d8c:	24448c13          	addi	s8,s1,580
    1d90:	00810b13          	addi	s6,sp,8
    1d94:	00800c93          	li	s9,8
    1d98:	02000b93          	li	s7,32
    1d9c:	02e00d13          	li	s10,46
    1da0:	00000693          	li	a3,0
    1da4:	000a0613          	mv	a2,s4
    1da8:	000a8593          	mv	a1,s5
    1dac:	00048513          	mv	a0,s1
    1db0:	00000097          	auipc	ra,0x0
    1db4:	e2c080e7          	jalr	-468(ra) # 1bdc <fatfs_sector_reader>
    1db8:	16050063          	beqz	a0,1f18 <fatfs_get_file_entry+0x1fc>
    1dbc:	04448413          	addi	s0,s1,68
    1dc0:	00040513          	mv	a0,s0
    1dc4:	fffff097          	auipc	ra,0xfffff
    1dc8:	5c8080e7          	jalr	1480(ra) # 138c <fatfs_entry_lfn_text>
    1dcc:	02050263          	beqz	a0,1df0 <fatfs_get_file_entry+0xd4>
    1dd0:	00040593          	mv	a1,s0
    1dd4:	01810513          	addi	a0,sp,24
    1dd8:	fffff097          	auipc	ra,0xfffff
    1ddc:	4ac080e7          	jalr	1196(ra) # 1284 <fatfs_lfn_cache_entry>
    1de0:	02040413          	addi	s0,s0,32
    1de4:	fd841ee3          	bne	s0,s8,1dc0 <fatfs_get_file_entry+0xa4>
    1de8:	001a0a13          	addi	s4,s4,1
    1dec:	fb5ff06f          	j	1da0 <fatfs_get_file_entry+0x84>
    1df0:	00040513          	mv	a0,s0
    1df4:	fffff097          	auipc	ra,0xfffff
    1df8:	5ac080e7          	jalr	1452(ra) # 13a0 <fatfs_entry_lfn_invalid>
    1dfc:	00050663          	beqz	a0,1e08 <fatfs_get_file_entry+0xec>
    1e00:	10010ea3          	sb	zero,285(sp)
    1e04:	fddff06f          	j	1de0 <fatfs_get_file_entry+0xc4>
    1e08:	00040593          	mv	a1,s0
    1e0c:	01810513          	addi	a0,sp,24
    1e10:	fffff097          	auipc	ra,0xfffff
    1e14:	5c8080e7          	jalr	1480(ra) # 13d8 <fatfs_entry_lfn_exists>
    1e18:	06050863          	beqz	a0,1e88 <fatfs_get_file_entry+0x16c>
    1e1c:	01810513          	addi	a0,sp,24
    1e20:	fffff097          	auipc	ra,0xfffff
    1e24:	530080e7          	jalr	1328(ra) # 1350 <fatfs_lfn_cache_get>
    1e28:	00090593          	mv	a1,s2
    1e2c:	fffff097          	auipc	ra,0xfffff
    1e30:	7a8080e7          	jalr	1960(ra) # 15d4 <fatfs_compare_names>
    1e34:	fc0506e3          	beqz	a0,1e00 <fatfs_get_file_entry+0xe4>
    1e38:	02000613          	li	a2,32
    1e3c:	00040593          	mv	a1,s0
    1e40:	00098513          	mv	a0,s3
    1e44:	fffff097          	auipc	ra,0xfffff
    1e48:	a50080e7          	jalr	-1456(ra) # 894 <memcpy>
    1e4c:	00100513          	li	a0,1
    1e50:	14c12083          	lw	ra,332(sp)
    1e54:	14812403          	lw	s0,328(sp)
    1e58:	14412483          	lw	s1,324(sp)
    1e5c:	14012903          	lw	s2,320(sp)
    1e60:	13c12983          	lw	s3,316(sp)
    1e64:	13812a03          	lw	s4,312(sp)
    1e68:	13412a83          	lw	s5,308(sp)
    1e6c:	13012b03          	lw	s6,304(sp)
    1e70:	12c12b83          	lw	s7,300(sp)
    1e74:	12812c03          	lw	s8,296(sp)
    1e78:	12412c83          	lw	s9,292(sp)
    1e7c:	12012d03          	lw	s10,288(sp)
    1e80:	15010113          	addi	sp,sp,336
    1e84:	00008067          	ret
    1e88:	00040513          	mv	a0,s0
    1e8c:	fffff097          	auipc	ra,0xfffff
    1e90:	594080e7          	jalr	1428(ra) # 1420 <fatfs_entry_sfn_only>
    1e94:	f40506e3          	beqz	a0,1de0 <fatfs_get_file_entry+0xc4>
    1e98:	00d00613          	li	a2,13
    1e9c:	00000593          	li	a1,0
    1ea0:	000b0513          	mv	a0,s6
    1ea4:	fffff097          	auipc	ra,0xfffff
    1ea8:	9d4080e7          	jalr	-1580(ra) # 878 <memset>
    1eac:	00000793          	li	a5,0
    1eb0:	00f406b3          	add	a3,s0,a5
    1eb4:	0006c683          	lbu	a3,0(a3)
    1eb8:	00fb0733          	add	a4,s6,a5
    1ebc:	00178793          	addi	a5,a5,1
    1ec0:	00d70023          	sb	a3,0(a4)
    1ec4:	ff9796e3          	bne	a5,s9,1eb0 <fatfs_get_file_entry+0x194>
    1ec8:	00844703          	lbu	a4,8(s0)
    1ecc:	00944783          	lbu	a5,9(s0)
    1ed0:	00a44683          	lbu	a3,10(s0)
    1ed4:	00e108a3          	sb	a4,17(sp)
    1ed8:	00f10923          	sb	a5,18(sp)
    1edc:	00d109a3          	sb	a3,19(sp)
    1ee0:	01769c63          	bne	a3,s7,1ef8 <fatfs_get_file_entry+0x1dc>
    1ee4:	fe070713          	addi	a4,a4,-32
    1ee8:	00071863          	bnez	a4,1ef8 <fatfs_get_file_entry+0x1dc>
    1eec:	fe078793          	addi	a5,a5,-32
    1ef0:	000b8713          	mv	a4,s7
    1ef4:	00078a63          	beqz	a5,1f08 <fatfs_get_file_entry+0x1ec>
    1ef8:	00814783          	lbu	a5,8(sp)
    1efc:	02e00713          	li	a4,46
    1f00:	01a79463          	bne	a5,s10,1f08 <fatfs_get_file_entry+0x1ec>
    1f04:	02000713          	li	a4,32
    1f08:	00e10823          	sb	a4,16(sp)
    1f0c:	00090593          	mv	a1,s2
    1f10:	000b0513          	mv	a0,s6
    1f14:	f19ff06f          	j	1e2c <fatfs_get_file_entry+0x110>
    1f18:	00000513          	li	a0,0
    1f1c:	f35ff06f          	j	1e50 <fatfs_get_file_entry+0x134>

Disassembly of section .text._open_directory:

00001f20 <_open_directory>:
    1f20:	eb010113          	addi	sp,sp,-336
    1f24:	13512a23          	sw	s5,308(sp)
    1f28:	00003ab7          	lui	s5,0x3
    1f2c:	810a8793          	addi	a5,s5,-2032 # 2810 <_fs>
    1f30:	14812423          	sw	s0,328(sp)
    1f34:	14912223          	sw	s1,324(sp)
    1f38:	15212023          	sw	s2,320(sp)
    1f3c:	13312e23          	sw	s3,316(sp)
    1f40:	13412c23          	sw	s4,312(sp)
    1f44:	13612823          	sw	s6,304(sp)
    1f48:	0087a403          	lw	s0,8(a5)
    1f4c:	14112623          	sw	ra,332(sp)
    1f50:	00050a13          	mv	s4,a0
    1f54:	00058913          	mv	s2,a1
    1f58:	fffff097          	auipc	ra,0xfffff
    1f5c:	514080e7          	jalr	1300(ra) # 146c <fatfs_total_path_levels>
    1f60:	00050993          	mv	s3,a0
    1f64:	00000493          	li	s1,0
    1f68:	fff00b13          	li	s6,-1
    1f6c:	0099d863          	bge	s3,s1,1f7c <_open_directory+0x5c>
    1f70:	00892023          	sw	s0,0(s2)
    1f74:	00100513          	li	a0,1
    1f78:	0240006f          	j	1f9c <_open_directory+0x7c>
    1f7c:	10400693          	li	a3,260
    1f80:	02c10613          	addi	a2,sp,44
    1f84:	00048593          	mv	a1,s1
    1f88:	000a0513          	mv	a0,s4
    1f8c:	fffff097          	auipc	ra,0xfffff
    1f90:	554080e7          	jalr	1364(ra) # 14e0 <fatfs_get_substring>
    1f94:	03651863          	bne	a0,s6,1fc4 <_open_directory+0xa4>
    1f98:	00000513          	li	a0,0
    1f9c:	14c12083          	lw	ra,332(sp)
    1fa0:	14812403          	lw	s0,328(sp)
    1fa4:	14412483          	lw	s1,324(sp)
    1fa8:	14012903          	lw	s2,320(sp)
    1fac:	13c12983          	lw	s3,316(sp)
    1fb0:	13812a03          	lw	s4,312(sp)
    1fb4:	13412a83          	lw	s5,308(sp)
    1fb8:	13012b03          	lw	s6,304(sp)
    1fbc:	15010113          	addi	sp,sp,336
    1fc0:	00008067          	ret
    1fc4:	00c10693          	addi	a3,sp,12
    1fc8:	02c10613          	addi	a2,sp,44
    1fcc:	00040593          	mv	a1,s0
    1fd0:	810a8513          	addi	a0,s5,-2032
    1fd4:	00000097          	auipc	ra,0x0
    1fd8:	d48080e7          	jalr	-696(ra) # 1d1c <fatfs_get_file_entry>
    1fdc:	fa050ee3          	beqz	a0,1f98 <_open_directory+0x78>
    1fe0:	01714783          	lbu	a5,23(sp)
    1fe4:	0107f793          	andi	a5,a5,16
    1fe8:	fa0788e3          	beqz	a5,1f98 <_open_directory+0x78>
    1fec:	02015403          	lhu	s0,32(sp)
    1ff0:	02615783          	lhu	a5,38(sp)
    1ff4:	00148493          	addi	s1,s1,1
    1ff8:	01041413          	slli	s0,s0,0x10
    1ffc:	00f40433          	add	s0,s0,a5
    2000:	f6dff06f          	j	1f6c <_open_directory+0x4c>

Disassembly of section .text.fl_opendir:

00002004 <fl_opendir>:
    2004:	fe010113          	addi	sp,sp,-32
    2008:	fff00793          	li	a5,-1
    200c:	00f12623          	sw	a5,12(sp)
    2010:	000037b7          	lui	a5,0x3
    2014:	c7c7a783          	lw	a5,-900(a5) # 2c7c <_filelib_init>
    2018:	00812c23          	sw	s0,24(sp)
    201c:	01212823          	sw	s2,16(sp)
    2020:	00112e23          	sw	ra,28(sp)
    2024:	00912a23          	sw	s1,20(sp)
    2028:	00050913          	mv	s2,a0
    202c:	00058413          	mv	s0,a1
    2030:	00079663          	bnez	a5,203c <fl_opendir+0x38>
    2034:	fffff097          	auipc	ra,0xfffff
    2038:	1d8080e7          	jalr	472(ra) # 120c <fl_init>
    203c:	000034b7          	lui	s1,0x3
    2040:	81048793          	addi	a5,s1,-2032 # 2810 <_fs>
    2044:	03c7a783          	lw	a5,60(a5)
    2048:	81048493          	addi	s1,s1,-2032
    204c:	00078463          	beqz	a5,2054 <fl_opendir+0x50>
    2050:	000780e7          	jalr	a5
    2054:	00090513          	mv	a0,s2
    2058:	fffff097          	auipc	ra,0xfffff
    205c:	414080e7          	jalr	1044(ra) # 146c <fatfs_total_path_levels>
    2060:	fff00793          	li	a5,-1
    2064:	02f51063          	bne	a0,a5,2084 <fl_opendir+0x80>
    2068:	0084a783          	lw	a5,8(s1)
    206c:	00f12623          	sw	a5,12(sp)
    2070:	00c12783          	lw	a5,12(sp)
    2074:	00042023          	sw	zero,0(s0)
    2078:	00040423          	sb	zero,8(s0)
    207c:	00f42223          	sw	a5,4(s0)
    2080:	0180006f          	j	2098 <fl_opendir+0x94>
    2084:	00c10593          	addi	a1,sp,12
    2088:	00090513          	mv	a0,s2
    208c:	00000097          	auipc	ra,0x0
    2090:	e94080e7          	jalr	-364(ra) # 1f20 <_open_directory>
    2094:	fc051ee3          	bnez	a0,2070 <fl_opendir+0x6c>
    2098:	0404a783          	lw	a5,64(s1)
    209c:	00078463          	beqz	a5,20a4 <fl_opendir+0xa0>
    20a0:	000780e7          	jalr	a5
    20a4:	00c12703          	lw	a4,12(sp)
    20a8:	fff00793          	li	a5,-1
    20ac:	00f71463          	bne	a4,a5,20b4 <fl_opendir+0xb0>
    20b0:	00000413          	li	s0,0
    20b4:	01c12083          	lw	ra,28(sp)
    20b8:	00040513          	mv	a0,s0
    20bc:	01812403          	lw	s0,24(sp)
    20c0:	01412483          	lw	s1,20(sp)
    20c4:	01012903          	lw	s2,16(sp)
    20c8:	02010113          	addi	sp,sp,32
    20cc:	00008067          	ret

Disassembly of section .text.fatfs_list_directory_next:

000020d0 <fatfs_list_directory_next>:
    20d0:	ec010113          	addi	sp,sp,-320
    20d4:	13212823          	sw	s2,304(sp)
    20d8:	13312623          	sw	s3,300(sp)
    20dc:	13412423          	sw	s4,296(sp)
    20e0:	13512223          	sw	s5,292(sp)
    20e4:	12112e23          	sw	ra,316(sp)
    20e8:	12812c23          	sw	s0,312(sp)
    20ec:	12912a23          	sw	s1,308(sp)
    20f0:	00050a13          	mv	s4,a0
    20f4:	00058913          	mv	s2,a1
    20f8:	00060993          	mv	s3,a2
    20fc:	10010ea3          	sb	zero,285(sp)
    2100:	00f00a93          	li	s5,15
    2104:	00092603          	lw	a2,0(s2)
    2108:	00492583          	lw	a1,4(s2)
    210c:	00000693          	li	a3,0
    2110:	000a0513          	mv	a0,s4
    2114:	00000097          	auipc	ra,0x0
    2118:	ac8080e7          	jalr	-1336(ra) # 1bdc <fatfs_sector_reader>
    211c:	12050063          	beqz	a0,223c <fatfs_list_directory_next+0x16c>
    2120:	00894483          	lbu	s1,8(s2)
    2124:	00549413          	slli	s0,s1,0x5
    2128:	04440413          	addi	s0,s0,68
    212c:	008a0433          	add	s0,s4,s0
    2130:	009afc63          	bgeu	s5,s1,2148 <fatfs_list_directory_next+0x78>
    2134:	00092783          	lw	a5,0(s2)
    2138:	00090423          	sb	zero,8(s2)
    213c:	00178793          	addi	a5,a5,1
    2140:	00f92023          	sw	a5,0(s2)
    2144:	fc1ff06f          	j	2104 <fatfs_list_directory_next+0x34>
    2148:	00040513          	mv	a0,s0
    214c:	fffff097          	auipc	ra,0xfffff
    2150:	240080e7          	jalr	576(ra) # 138c <fatfs_entry_lfn_text>
    2154:	02050263          	beqz	a0,2178 <fatfs_list_directory_next+0xa8>
    2158:	00040593          	mv	a1,s0
    215c:	01810513          	addi	a0,sp,24
    2160:	fffff097          	auipc	ra,0xfffff
    2164:	124080e7          	jalr	292(ra) # 1284 <fatfs_lfn_cache_entry>
    2168:	00148493          	addi	s1,s1,1
    216c:	0ff4f493          	zext.b	s1,s1
    2170:	02040413          	addi	s0,s0,32
    2174:	fbdff06f          	j	2130 <fatfs_list_directory_next+0x60>
    2178:	00040513          	mv	a0,s0
    217c:	fffff097          	auipc	ra,0xfffff
    2180:	224080e7          	jalr	548(ra) # 13a0 <fatfs_entry_lfn_invalid>
    2184:	00050663          	beqz	a0,2190 <fatfs_list_directory_next+0xc0>
    2188:	10010ea3          	sb	zero,285(sp)
    218c:	fddff06f          	j	2168 <fatfs_list_directory_next+0x98>
    2190:	00040593          	mv	a1,s0
    2194:	01810513          	addi	a0,sp,24
    2198:	fffff097          	auipc	ra,0xfffff
    219c:	240080e7          	jalr	576(ra) # 13d8 <fatfs_entry_lfn_exists>
    21a0:	0c050063          	beqz	a0,2260 <fatfs_list_directory_next+0x190>
    21a4:	01810513          	addi	a0,sp,24
    21a8:	fffff097          	auipc	ra,0xfffff
    21ac:	1a8080e7          	jalr	424(ra) # 1350 <fatfs_lfn_cache_get>
    21b0:	00050593          	mv	a1,a0
    21b4:	10300613          	li	a2,259
    21b8:	00098513          	mv	a0,s3
    21bc:	ffffe097          	auipc	ra,0xffffe
    21c0:	71c080e7          	jalr	1820(ra) # 8d8 <strncpy>
    21c4:	00040513          	mv	a0,s0
    21c8:	fffff097          	auipc	ra,0xfffff
    21cc:	294080e7          	jalr	660(ra) # 145c <fatfs_entry_is_dir>
    21d0:	10a98223          	sb	a0,260(s3)
    21d4:	01d44783          	lbu	a5,29(s0)
    21d8:	01c44703          	lbu	a4,28(s0)
    21dc:	00148493          	addi	s1,s1,1
    21e0:	00879793          	slli	a5,a5,0x8
    21e4:	00e7e7b3          	or	a5,a5,a4
    21e8:	01e44703          	lbu	a4,30(s0)
    21ec:	0ff4f493          	zext.b	s1,s1
    21f0:	00100513          	li	a0,1
    21f4:	01071713          	slli	a4,a4,0x10
    21f8:	00f76733          	or	a4,a4,a5
    21fc:	01f44783          	lbu	a5,31(s0)
    2200:	01879793          	slli	a5,a5,0x18
    2204:	00e7e7b3          	or	a5,a5,a4
    2208:	10f9a623          	sw	a5,268(s3)
    220c:	01544783          	lbu	a5,21(s0)
    2210:	01444703          	lbu	a4,20(s0)
    2214:	01a44683          	lbu	a3,26(s0)
    2218:	00879793          	slli	a5,a5,0x8
    221c:	00e7e7b3          	or	a5,a5,a4
    2220:	01b44703          	lbu	a4,27(s0)
    2224:	01079793          	slli	a5,a5,0x10
    2228:	00871713          	slli	a4,a4,0x8
    222c:	00d76733          	or	a4,a4,a3
    2230:	00e7e7b3          	or	a5,a5,a4
    2234:	10f9a423          	sw	a5,264(s3)
    2238:	00990423          	sb	s1,8(s2)
    223c:	13c12083          	lw	ra,316(sp)
    2240:	13812403          	lw	s0,312(sp)
    2244:	13412483          	lw	s1,308(sp)
    2248:	13012903          	lw	s2,304(sp)
    224c:	12c12983          	lw	s3,300(sp)
    2250:	12812a03          	lw	s4,296(sp)
    2254:	12412a83          	lw	s5,292(sp)
    2258:	14010113          	addi	sp,sp,320
    225c:	00008067          	ret
    2260:	00040513          	mv	a0,s0
    2264:	fffff097          	auipc	ra,0xfffff
    2268:	1bc080e7          	jalr	444(ra) # 1420 <fatfs_entry_sfn_only>
    226c:	ee050ee3          	beqz	a0,2168 <fatfs_list_directory_next+0x98>
    2270:	00810a13          	addi	s4,sp,8
    2274:	00d00613          	li	a2,13
    2278:	00000593          	li	a1,0
    227c:	000a0513          	mv	a0,s4
    2280:	10010ea3          	sb	zero,285(sp)
    2284:	ffffe097          	auipc	ra,0xffffe
    2288:	5f4080e7          	jalr	1524(ra) # 878 <memset>
    228c:	00000793          	li	a5,0
    2290:	00800713          	li	a4,8
    2294:	00f40633          	add	a2,s0,a5
    2298:	00064603          	lbu	a2,0(a2)
    229c:	00fa06b3          	add	a3,s4,a5
    22a0:	00178793          	addi	a5,a5,1
    22a4:	00c68023          	sb	a2,0(a3)
    22a8:	fee796e3          	bne	a5,a4,2294 <fatfs_list_directory_next+0x1c4>
    22ac:	00844683          	lbu	a3,8(s0)
    22b0:	00944703          	lbu	a4,9(s0)
    22b4:	00a44783          	lbu	a5,10(s0)
    22b8:	00d108a3          	sb	a3,17(sp)
    22bc:	00e10923          	sb	a4,18(sp)
    22c0:	00f109a3          	sb	a5,19(sp)
    22c4:	02000613          	li	a2,32
    22c8:	00c79a63          	bne	a5,a2,22dc <fatfs_list_directory_next+0x20c>
    22cc:	fe068693          	addi	a3,a3,-32
    22d0:	00069663          	bnez	a3,22dc <fatfs_list_directory_next+0x20c>
    22d4:	fe070713          	addi	a4,a4,-32
    22d8:	00070a63          	beqz	a4,22ec <fatfs_list_directory_next+0x21c>
    22dc:	00814703          	lbu	a4,8(sp)
    22e0:	02e00793          	li	a5,46
    22e4:	00f71463          	bne	a4,a5,22ec <fatfs_list_directory_next+0x21c>
    22e8:	02000793          	li	a5,32
    22ec:	000a0593          	mv	a1,s4
    22f0:	00098513          	mv	a0,s3
    22f4:	00f10823          	sb	a5,16(sp)
    22f8:	fffff097          	auipc	ra,0xfffff
    22fc:	468080e7          	jalr	1128(ra) # 1760 <fatfs_get_sfn_display_name>
    2300:	ec5ff06f          	j	21c4 <fatfs_list_directory_next+0xf4>

Disassembly of section .text.fl_readdir:

00002304 <fl_readdir>:
    2304:	000037b7          	lui	a5,0x3
    2308:	c7c7a783          	lw	a5,-900(a5) # 2c7c <_filelib_init>
    230c:	fe010113          	addi	sp,sp,-32
    2310:	00912a23          	sw	s1,20(sp)
    2314:	01212823          	sw	s2,16(sp)
    2318:	00112e23          	sw	ra,28(sp)
    231c:	00812c23          	sw	s0,24(sp)
    2320:	01312623          	sw	s3,12(sp)
    2324:	00050493          	mv	s1,a0
    2328:	00058913          	mv	s2,a1
    232c:	00079663          	bnez	a5,2338 <fl_readdir+0x34>
    2330:	fffff097          	auipc	ra,0xfffff
    2334:	edc080e7          	jalr	-292(ra) # 120c <fl_init>
    2338:	00003437          	lui	s0,0x3
    233c:	81040793          	addi	a5,s0,-2032 # 2810 <_fs>
    2340:	03c7a783          	lw	a5,60(a5)
    2344:	81040993          	addi	s3,s0,-2032
    2348:	00078463          	beqz	a5,2350 <fl_readdir+0x4c>
    234c:	000780e7          	jalr	a5
    2350:	81040513          	addi	a0,s0,-2032
    2354:	00090613          	mv	a2,s2
    2358:	00048593          	mv	a1,s1
    235c:	00000097          	auipc	ra,0x0
    2360:	d74080e7          	jalr	-652(ra) # 20d0 <fatfs_list_directory_next>
    2364:	0409a783          	lw	a5,64(s3)
    2368:	00050413          	mv	s0,a0
    236c:	00078463          	beqz	a5,2374 <fl_readdir+0x70>
    2370:	000780e7          	jalr	a5
    2374:	01c12083          	lw	ra,28(sp)
    2378:	00144513          	xori	a0,s0,1
    237c:	01812403          	lw	s0,24(sp)
    2380:	01412483          	lw	s1,20(sp)
    2384:	01012903          	lw	s2,16(sp)
    2388:	00c12983          	lw	s3,12(sp)
    238c:	40a00533          	neg	a0,a0
    2390:	02010113          	addi	sp,sp,32
    2394:	00008067          	ret
