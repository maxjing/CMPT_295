	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"The dot product of (%ld,%ld,%ld,%ld,%ld) and (%ld,%ld,%ld,%ld,%ld) is %ld.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movl	$5, %edx
	movl	$y, %esi
	movl	$x, %edi
	call	prac1
	movq	%rax, 48(%rsp)
	movq	y+32(%rip), %rax
	movl	$.LC0, %esi
	movq	x+24(%rip), %r9
	movq	x+16(%rip), %r8
	movl	$1, %edi
	movq	x+8(%rip), %rcx
	movq	x(%rip), %rdx
	movq	%rax, 40(%rsp)
	movq	y+24(%rip), %rax
	movq	%rax, 32(%rsp)
	movq	y+16(%rip), %rax
	movq	%rax, 24(%rsp)
	movq	y+8(%rip), %rax
	movq	%rax, 16(%rsp)
	movq	y(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	x+32(%rip), %rax
	movq	%rax, (%rsp)
	xorl	%eax, %eax
	call	__printf_chk
	addq	$72, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.globl	y
	.data
	.align 32
	.type	y, @object
	.size	y, 40
y:
	.quad	2
	.quad	3
	.quad	4
	.quad	5
	.quad	7
	.globl	x
	.align 32
	.type	x, @object
	.size	x, 40
x:
	.quad	23
	.quad	3
	.quad	5
	.quad	9
	.quad	7
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
