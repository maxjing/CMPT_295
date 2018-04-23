	.file	"sum_roll.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	sum_unrolled
	.type	sum_unrolled, @function
sum_unrolled:
.LFB0:
	.cfi_startproc
	cmpl	$4, %esi
	jle	.L6
	leal	-5(%rsi), %r11d
	leaq	4(%rdi), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	shrl	$2, %r11d
	movl	%r11d, %eax
	salq	$4, %rax
	leaq	20(%rdi,%rax), %r10
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	addl	-4(%rdx), %r9d
	addl	(%rdx), %eax
	addq	$16, %rdx
	addl	-12(%rdx), %r8d
	addl	-8(%rdx), %ecx
	cmpq	%r10, %rdx
	jne	.L3
	addl	%r9d, %eax
	leal	4(,%r11,4), %r10d
	addl	%r8d, %eax
	addl	%ecx, %eax
.L2:
	cmpl	%r10d, %esi
	jle	.L4
	subl	$1, %esi
	movslq	%r10d, %rcx
	subl	%r10d, %esi
	leaq	(%rdi,%rcx,4), %rdx
	leaq	1(%rcx,%rsi), %rcx
	leaq	(%rdi,%rcx,4), %rcx
	.p2align 4,,10
	.p2align 3
.L5:
	addl	(%rdx), %eax
	addq	$4, %rdx
	cmpq	%rdx, %rcx
	jne	.L5
.L4:
	rep ret
.L6:
	xorl	%eax, %eax
	xorl	%r10d, %r10d
	jmp	.L2
	.cfi_endproc
.LFE0:
	.size	sum_unrolled, .-sum_unrolled
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	sum_rolled
	.type	sum_rolled, @function
sum_rolled:
.LFB1:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L13
	leal	-1(%rsi), %eax
	leaq	4(%rdi,%rax,4), %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L12:
	addl	(%rdi), %eax
	addq	$4, %rdi
	cmpq	%rdx, %rdi
	jne	.L12
	rep ret
.L13:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	sum_rolled, .-sum_rolled
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
