
br_toggling:     file format elf64-littleaarch64


Disassembly of section .text:

00000000004000d8 <.text>:
  4000d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  4000dc:	910003fd 	mov	x29, sp
  4000e0:	d2800002 	mov	x2, #0x0                   	// #0
  4000e4:	f240003f 	tst	x1, #0x1
  4000e8:	54000060 	b.eq	0x4000f4  // b.none
  4000ec:	580002ea 	ldr	x10, 0x400148
  4000f0:	14000002 	b	0x4000f8
  4000f4:	580002ea 	ldr	x10, 0x400150
  4000f8:	d2800140 	mov	x0, #0xa                   	// #10
  4000fc:	d28000a1 	mov	x1, #0x5                   	// #5
  400100:	d63f0140 	blr	x10
  400104:	91000442 	add	x2, x2, #0x1
  400108:	f101905f 	cmp	x2, #0x64
  40010c:	54fffec1 	b.ne	0x4000e4  // b.any
  400110:	52800000 	mov	w0, #0x0                   	// #0
  400114:	52800ba8 	mov	w8, #0x5d                  	// #93
  400118:	d4000001 	svc	#0x0
  40011c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  400120:	910003fd 	mov	x29, sp
  400124:	8b010000 	add	x0, x0, x1
  400128:	a8c17bfd 	ldp	x29, x30, [sp], #16
  40012c:	d65f03c0 	ret
  400130:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  400134:	910003fd 	mov	x29, sp
  400138:	cb010000 	sub	x0, x0, x1
  40013c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  400140:	d65f03c0 	ret
  400144:	00000000 	udf	#0
  400148:	0040011c 	.inst	0x0040011c ; undefined
  40014c:	00000000 	udf	#0
  400150:	00400130 	.inst	0x00400130 ; undefined
  400154:	00000000 	udf	#0
