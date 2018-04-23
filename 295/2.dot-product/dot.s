
	.globl dot

dot:
	# version 1
	movq	(%rdi), %rax  
	imulq	(%rsi), %rax  # x[0] * y[0]

	pushq	%rax          # spill partial computation
	 
	movq	8(%rdi), %rax  
	imulq	8(%rsi), %rax # x[1] * y[1]
	
	addq	(%rsp), %rax  # add partial computations

	#addq	$8, %rsp      # pop to nowhere
	leaq	8(%rsp), %rsp # pop to nowhere
	
	ret


	# alternate version
	movq	(%rdi), %rax  
	imulq	(%rsi), %rax  # x[0] * y[0]

	pushq	%rbx          # save rbx (in use)
	 
	movq	8(%rdi), %rbx  
	imulq	8(%rsi), %rbx # x[1] * y[1]

	addq	%rbx, %rax    # add partial computations

	popq	%rbx		  # restore rbx's value

	ret

