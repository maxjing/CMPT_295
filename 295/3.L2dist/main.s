	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"The distance between (%u,%u) and (%u,%u) is %u.\n"
	.align 8
.LC1:
	.string	"The sum of the roots of %u and %u is %u.\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.section	.text.startup,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$2, %ecx
	movl	$45, %edx
	movl	$15, %esi
	movl	$5, %edi
	call	dist
	subq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	$45, %r8d
	movl	$15, %ecx
	pushq	%rax
	.cfi_def_cfa_offset 32
	movl	$5, %edx
	movl	$2, %r9d
	movl	$.LC0, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$49, %esi
	movl	$1225, %edi
	call	sumroot
	movl	$49, %ecx
	movl	%eax, %r8d
	movl	$1225, %edx
	movl	$.LC1, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	jmp	__printf_chk
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE2:
	.section	.text.startup
.LHOTE2:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
