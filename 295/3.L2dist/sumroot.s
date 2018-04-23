	.globl sumroot
	# x in %edi
	# y in %esi
sumroot:
	pushq %rsi # save y on the stack (caller saved)
	call sqrt  # sqrt(x)

	popq %rdi  # restore y to %rdi
	pushq %rax # save sqrt(x) on the stack (caller saved)
	call sqrt  # sqrt(y)
	
	popq %rsi  # restore sqrt(x) to %rsi
	addl %esi, %eax # sqrt(x) + sqrt(y)

	ret
