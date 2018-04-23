	.file	"fill.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	fill
	.type	fill, @function
fill:
.LFB23:
	.cfi_startproc
	xorl	%ecx, %ecx
	movl	$1321528399, %esi
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%ecx, %eax
	imull	%esi
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$3, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	imull	$26, %edx, %edx
	subl	%edx, %eax
	addl	$97, %eax
	movb	%al, (%rdi,%rcx)
	addq	$1, %rcx
	cmpq	$55, %rcx
	jne	.L2
	movb	$0, 55(%rdi)
	ret
	.cfi_endproc
.LFE23:
	.size	fill, .-fill
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
