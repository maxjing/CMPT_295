	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error:  bad run"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Sample %d (%ld) completed in %d cycles.\n"
	.section	.rodata.str1.1
.LC2:
	.string	"Average of %ld cycles.\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.section	.text.startup,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB47:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$A, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%r12, %rbp
	xorl	%ebx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L2:
	movq	stdin(%rip), %rdx
	movq	%rbp, %rdi
	movl	$750, %esi
	call	fgets
	movq	%rbp, %rdi
	movq	%rax, tst(%rip)
	addq	$750, %rbp
	call	strlen
	movslq	%ebx, %rdx
	addl	$1, %ebx
	imulq	$750, %rdx, %rdx
	cmpl	$20, %ebx
	movb	$0, A-1(%rax,%rdx)
	jne	.L2
	xorl	%ebp, %ebp
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L13:
	subl	$1, %ebp
.L4:
	addl	$1, %ebp
	cmpl	$19, %ebp
	jg	.L12
.L5:
#APP
# 26 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movslq	%ebp, %r13
	movl	%esi, start_time(%rip)
	imulq	$750, %r13, %rdi
	addq	$A, %rdi
	call	str_alnum
	movl	%eax, P(%rip)
#APP
# 38 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	%esi, end_time(%rip)
	subl	start_time(%rip), %esi
	cmpl	$9999, %esi
	movl	%esi, cycles(,%r13,4)
	jg	.L13
	cmpl	$1, P(%rip)
	je	.L4
	popq	%rax
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	movl	$.LC0, %edi
	jmp	perror
	.p2align 4,,10
	.p2align 3
.L12:
	.cfi_restore_state
	movq	$0, total(%rip)
	movl	$cycles, %ebp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r12, %rdi
	addl	$1, %ebx
	addq	$4, %rbp
	call	strlen
	movl	-4(%rbp), %r8d
	movq	%rax, %rcx
	movl	%ebx, %edx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$1, %edi
	addq	$750, %r12
	call	__printf_chk
	movslq	-4(%rbp), %rcx
	addq	total(%rip), %rcx
	cmpl	$20, %ebx
	movq	%rcx, total(%rip)
	jne	.L6
	movq	%rcx, %rax
	movabsq	$7378697629483820647, %rdx
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	imulq	%rdx
	sarq	$63, %rcx
	movl	$.LC2, %esi
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	sarq	$3, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	subq	%rcx, %rdx
	jmp	__printf_chk
	.cfi_endproc
.LFE47:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
	.comm	tst,8,8
	.globl	end_time
	.data
	.align 4
	.type	end_time, @object
	.size	end_time, 4
end_time:
	.long	125
	.globl	start_time
	.align 4
	.type	start_time, @object
	.size	start_time, 4
start_time:
	.long	150
	.comm	total,8,8
	.comm	P,4,4
	.comm	cycles,80,32
	.comm	A,15000,32
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
