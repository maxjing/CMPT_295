	.file	"p1.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"The product of %d and %d is %d."
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	proc1
	.type	proc1, @function
proc1:
.LFB23:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbp
	movq	%rdx, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	(%rsi), %r12d
	movl	(%rdx), %esi
	movl	%r12d, %edi
	call	proc2
	subq	$8, %rsp
	.cfi_def_cfa_offset 56
	movl	(%rbx), %r9d
	movq	%r13, %rdi
	pushq	%rax
	.cfi_def_cfa_offset 64
	movl	0(%rbp), %r8d
	movl	$.LC0, %ecx
	movq	$-1, %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__sprintf_chk
	movl	(%rbx), %eax
	subl	$2, %eax
	movl	%eax, 0(%rbp)
	movl	%r12d, (%rbx)
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	proc1, .-proc1
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
