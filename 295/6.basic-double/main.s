	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"a = %#.16lx\n"
.LC2:
	.string	"b = %e\n"
.LC3:
	.string	"ftot = %f\n"
.LC4:
	.string	"dtot = %lf\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	a(%rip), %rdx
	movl	$.LC1, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	a(%rip), %rdi
	call	l2d
	movl	$.LC2, %esi
	movl	$1, %edi
	movl	$1, %eax
	movsd	%xmm0, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm1
	movapd	%xmm1, %xmm0
	call	d2l
	movl	$.LC1, %esi
	movq	%rax, %rdx
	movq	%rax, a(%rip)
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$10, %esi
	movl	$f, %edi
	call	sum_floats
	pxor	%xmm1, %xmm1
	movl	$d, %eax
	.p2align 4,,10
	.p2align 3
.L2:
	addsd	(%rax), %xmm1
	addq	$8, %rax
	cmpq	$d+80, %rax
	jne	.L2
	cvtss2sd	%xmm0, %xmm0
	movl	$.LC3, %esi
	movl	$1, %edi
	movl	$1, %eax
	movsd	%xmm1, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm1
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$1, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	movapd	%xmm1, %xmm0
	jmp	__printf_chk
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.globl	d
	.data
	.align 32
	.type	d, @object
	.size	d, 80
d:
	.long	858993459
	.long	1075917619
	.long	1717986918
	.long	1074947686
	.long	1717986918
	.long	-1073060250
	.long	0
	.long	0
	.long	1717986918
	.long	-1073584538
	.long	0
	.long	1074528256
	.long	858993459
	.long	-1071959245
	.long	0
	.long	1075707904
	.long	858993459
	.long	1073951539
	.long	858993459
	.long	1074213683
	.globl	f
	.align 32
	.type	f, @object
	.size	f, 40
f:
	.long	1091148186
	.long	1083388723
	.long	3226678067
	.long	2143289344
	.long	3222483763
	.long	1080033280
	.long	3235486106
	.long	1089470464
	.long	1075419546
	.long	1077516698
	.globl	a
	.align 8
	.type	a, @object
	.size	a, 8
a:
	.quad	81985529216486895
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
