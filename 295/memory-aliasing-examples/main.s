	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_main                   ## -- Begin function main
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
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	callq	_time
	movl	%eax, %edi
	callq	_srand
	movq	_Q@GOTPCREL(%rip), %r15
	movl	$0, (%r15)
	movq	_A@GOTPCREL(%rip), %r14
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	callq	_rand
                                        ## kill: %EAX<def> %EAX<kill> %RAX<def>
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$22, %ecx
	addl	%eax, %ecx
	andl	$-1024, %ecx            ## imm = 0xFC00
	negl	%ecx
	leal	-512(%rax,%rcx), %eax
	movl	%eax, (%r14,%rbx,4)
	addl	%eax, (%r15)
	incq	%rbx
	cmpq	$3000, %rbx             ## imm = 0xBB8
	jne	LBB0_1
## BB#2:
	xorl	%r13d, %r13d
	movq	_P@GOTPCREL(%rip), %r14
	movq	_cycles@GOTPCREL(%rip), %r12
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	## InlineAsm Start
	cpuid
	rdtscp
	movl	%eax, %esi

	## InlineAsm End
	movl	%esi, _start_time(%rip)
	movl	$3000, %esi             ## imm = 0xBB8
	movq	_A@GOTPCREL(%rip), %rdi
	callq	_sum_unrolled
	movslq	%r13d, %rsi
	movl	%eax, (%r14,%rsi,4)
	## InlineAsm Start
	cpuid
	rdtscp
	movl	%eax, %edi

	## InlineAsm End
	movl	%edi, _end_time(%rip)
	subl	_start_time(%rip), %edi
	movl	%edi, (%r12,%rsi,4)
	cmpl	$8000, %edi             ## imm = 0x1F40
	jl	LBB0_5
## BB#4:                                ##   in Loop: Header=BB0_3 Depth=1
	decl	%r13d
	jmp	LBB0_6
	.p2align	4, 0x90
LBB0_5:                                 ##   in Loop: Header=BB0_3 Depth=1
	movl	(%r14,%rsi,4), %eax
	cmpl	(%r15), %eax
	jne	LBB0_10
LBB0_6:                                 ##   in Loop: Header=BB0_3 Depth=1
	cmpl	$19, %r13d
	leal	1(%r13), %eax
	movl	%eax, %r13d
	jl	LBB0_3
## BB#7:
	movq	_total@GOTPCREL(%rip), %r15
	movq	$0, (%r15)
	leaq	L_.str.1(%rip), %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_8:                                 ## =>This Inner Loop Header: Depth=1
	leaq	1(%rbx), %r13
	movl	(%r12,%rbx,4), %edx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%r13d, %esi
	callq	_printf
	movslq	(%r12,%rbx,4), %rax
	addq	(%r15), %rax
	movq	%rax, (%r15)
	cmpq	$20, %r13
	movq	%r13, %rbx
	jne	LBB0_8
## BB#9:
	movabsq	$7378697629483820647, %rcx ## imm = 0x6666666666666667
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$3, %rdx
	leaq	(%rdx,%rax), %rsi
	leaq	L_.str.2(%rip), %rdi
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_printf                 ## TAILCALL
LBB0_10:
	leaq	L_.str(%rip), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_perror                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__DATA,__data
	.globl	_start_time             ## @start_time
	.p2align	2
_start_time:
	.long	150                     ## 0x96

	.globl	_end_time               ## @end_time
	.p2align	2
_end_time:
	.long	125                     ## 0x7d

	.comm	_Q,4,2                  ## @Q
	.comm	_A,12000,4              ## @A
	.comm	_P,12000,4              ## @P
	.comm	_cycles,80,4            ## @cycles
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Error:  sum mismatch"

	.comm	_total,8,3              ## @total
L_.str.1:                               ## @.str.1
	.asciz	"Sample %d completed in %d cycles.\n"

L_.str.2:                               ## @.str.2
	.asciz	"Average of %ld cycles.\n"


.subsections_via_symbols
