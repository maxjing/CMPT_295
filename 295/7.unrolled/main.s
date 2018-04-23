	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error:  sum mismatch"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Sample %d completed in %d cycles.\n"
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
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%edi, %edi
	movl	$A, %ebp
	movl	$A+8000, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	time
	movl	%eax, %edi
	call	srand
	movl	$0, Q(%rip)
	.p2align 4,,10
	.p2align 3
.L2:
	call	rand
	cltd
	addq	$4, %rbp
	shrl	$22, %edx
	addl	%edx, %eax
	andl	$1023, %eax
	subl	%edx, %eax
	subl	$512, %eax
	addl	%eax, Q(%rip)
	movl	%eax, -4(%rbp)
	cmpq	%rbp, %rbx
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
# 30 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	$A, %edi
	movl	%esi, start_time(%rip)
	movl	$2000, %esi
	call	sum_unrolled
	movslq	%ebp, %rdi
	movl	%eax, %r8d
	movl	%eax, P(,%rdi,4)
#APP
# 42 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	%esi, end_time(%rip)
	subl	start_time(%rip), %esi
	cmpl	$7999, %esi
	movl	%esi, cycles(,%rdi,4)
	jg	.L13
	cmpl	Q(%rip), %r8d
	je	.L4
	popq	%rax
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	movl	$.LC0, %edi
	jmp	perror
.L12:
	.cfi_restore_state
	movq	$0, total(%rip)
	movl	$cycles, %ebp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	0(%rbp), %ecx
	addl	$1, %ebx
	xorl	%eax, %eax
	movl	%ebx, %edx
	movl	$.LC1, %esi
	movl	$1, %edi
	addq	$4, %rbp
	call	__printf_chk
	movslq	-4(%rbp), %rcx
	addq	total(%rip), %rcx
	cmpl	$20, %ebx
	movq	%rcx, total(%rip)
	jne	.L6
	movq	%rcx, %rax
	movabsq	$7378697629483820647, %rdx
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	imulq	%rdx
	sarq	$63, %rcx
	movl	$.LC2, %esi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	movl	$1, %edi
	xorl	%eax, %eax
	sarq	$3, %rdx
	subq	%rcx, %rdx
	jmp	__printf_chk
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
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
	.comm	cycles,80,32
	.comm	Q,4,4
	.comm	P,8000,32
	.comm	A,8000,32
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
