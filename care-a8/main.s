	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
Lcfi3:
	.cfi_offset %rbx, -56
Lcfi4:
	.cfi_offset %r12, -48
Lcfi5:
	.cfi_offset %r13, -40
Lcfi6:
	.cfi_offset %r14, -32
Lcfi7:
	.cfi_offset %r15, -24
	movq	_names@GOTPCREL(%rip), %rbx
	movq	_buf@GOTPCREL(%rip), %r14
	movq	_grades@GOTPCREL(%rip), %r12
	leaq	L_.str(%rip), %r15
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movl	$1024, %esi             ## imm = 0x400
	movq	%r14, %rdi
	callq	_fgets
	movq	_nul@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	leaq	(%r13,%r12), %rcx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	_sscanf
	addq	$20, %rbx
	addq	$4, %r13
	cmpq	$120, %r13
	jne	LBB0_1
## BB#2:
	xorl	%r15d, %r15d
	movq	_num_passed@GOTPCREL(%rip), %r14
	movq	_cycles@GOTPCREL(%rip), %r13
	movl	$-1, %r12d
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	## InlineAsm Start
	cpuid
	rdtscp
	movl	%eax, %esi

	## InlineAsm End
	movl	%esi, _start_time(%rip)
	movl	$30, %esi
	movq	_grades@GOTPCREL(%rip), %rdi
	movq	_ranks@GOTPCREL(%rip), %rdx
	movq	_avg@GOTPCREL(%rip), %rcx
	movq	_passing_avg@GOTPCREL(%rip), %r8
	movq	%r14, %r9
	callq	_compute_ranks
	## InlineAsm Start
	cpuid
	rdtscp
	movl	%eax, %esi

	## InlineAsm End
	movl	%esi, _end_time(%rip)
	subl	_start_time(%rip), %esi
	movslq	%r15d, %rax
	movl	%esi, (%r13,%rax,4)
	cmpl	$19999, %esi            ## imm = 0x4E1F
	movl	$0, %eax
	cmovgl	%r12d, %eax
	leal	1(%r15,%rax), %r15d
	cmpl	$20, %r15d
	jl	LBB0_3
## BB#4:
	movq	_passing_avg@GOTPCREL(%rip), %r13
	leaq	L_.str.1(%rip), %rbx
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.3(%rip), %rdx
	leaq	L_.str.4(%rip), %rcx
	xorl	%r12d, %r12d
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	_printf
	leaq	L_.str.5(%rip), %rsi
	leaq	L_.str.6(%rip), %rdx
	leaq	L_.str.7(%rip), %rcx
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	_printf
	movq	_names@GOTPCREL(%rip), %rbx
	leaq	L_.str.8(%rip), %r15
	.p2align	4, 0x90
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	movq	_grades@GOTPCREL(%rip), %rax
	movss	(%rax,%r12,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movq	_ranks@GOTPCREL(%rip), %rax
	movl	(%rax,%r12,4), %edx
	movb	$1, %al
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	_printf
	incq	%r12
	addq	$20, %rbx
	cmpq	$30, %r12
	jne	LBB0_5
## BB#6:
	movl	$10, %edi
	callq	_putchar
	movl	(%r14), %esi
	leaq	L_.str.9(%rip), %rdi
	movl	$30, %edx
	xorl	%eax, %eax
	callq	_printf
	movss	(%r13), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	L_.str.10(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movq	_avg@GOTPCREL(%rip), %rax
	movss	(%rax), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	L_.str.11(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movq	_total@GOTPCREL(%rip), %r15
	movq	$0, (%r15)
	leaq	L_.str.12(%rip), %r14
	xorl	%ebx, %ebx
	movq	_cycles@GOTPCREL(%rip), %r13
	.p2align	4, 0x90
LBB0_7:                                 ## =>This Inner Loop Header: Depth=1
	leaq	1(%rbx), %r12
	movl	(%r13,%rbx,4), %edx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%r12d, %esi
	callq	_printf
	cmpq	$9, %rbx
	jle	LBB0_8
## BB#10:                               ##   in Loop: Header=BB0_7 Depth=1
	movslq	(%r13,%rbx,4), %rax
	addq	%rax, (%r15)
LBB0_8:                                 ##   in Loop: Header=BB0_7 Depth=1
	cmpq	$20, %r12
	movq	%r12, %rbx
	jne	LBB0_7
## BB#9:
	movabsq	$7378697629483820647, %rax ## imm = 0x6666666666666667
	imulq	(%r15)
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$2, %rdx
	leaq	(%rdx,%rax), %rsi
	leaq	L_.str.13(%rip), %rdi
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_printf                 ## TAILCALL
	.cfi_endproc

	.section	__DATA,__data
	.globl	_start_time             ## @start_time
	.p2align	2
_start_time:
	.long	150                     ## 0x96

	.globl	_end_time               ## @end_time
	.p2align	2
_end_time:
	.long	125                     ## 0x7d

	.comm	_buf,1024,4             ## @buf
	.comm	_nul,8,3                ## @nul
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%s %f"

	.comm	_names,600,4            ## @names
	.comm	_grades,120,4           ## @grades
	.comm	_ranks,120,4            ## @ranks
	.comm	_avg,4,2                ## @avg
	.comm	_passing_avg,4,2        ## @passing_avg
	.comm	_num_passed,4,2         ## @num_passed
	.comm	_cycles,80,4            ## @cycles
L_.str.1:                               ## @.str.1
	.asciz	"%15s  %5s  %4s\n"

L_.str.2:                               ## @.str.2
	.asciz	"Name"

L_.str.3:                               ## @.str.3
	.asciz	"Grade"

L_.str.4:                               ## @.str.4
	.asciz	"Rank"

L_.str.5:                               ## @.str.5
	.asciz	"----------"

L_.str.6:                               ## @.str.6
	.asciz	"-----"

L_.str.7:                               ## @.str.7
	.asciz	"----"

L_.str.8:                               ## @.str.8
	.asciz	"%15s  %2.2f  %3d\n"

L_.str.9:                               ## @.str.9
	.asciz	"Number who passed: %d/%d\n"

L_.str.10:                              ## @.str.10
	.asciz	"  Passing average: %2.2f\n"

L_.str.11:                              ## @.str.11
	.asciz	"  Overall average: %2.2f\n"

	.comm	_total,8,3              ## @total
L_.str.12:                              ## @.str.12
	.asciz	"Sample %d completed in %d cycles.\n"

L_.str.13:                              ## @.str.13
	.asciz	"Average of %ld cycles.\n"


.subsections_via_symbols
