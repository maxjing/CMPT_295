
	.globl fact

	# Algorithm:
	#    fact(int n) {
	#       if (n <= 1) return 1;
	#       return n * fact(n-1);
	#    }

	# %edi: n
fact:
	cmpl $1, %edi
	jg endif          # if (n <= 1)
	movq $1, %rax     #   return 1 
	ret

endif:
	pushq %rdi        # save n
	decl %edi         # n <- n-1
	call fact         # fact(n-1)

	popq %rsi	      # restore n
	imulq %rsi, %rax  # n * fact(n-1)

	# Alt:
	#
	# imulq (%rsp), %rax # n * fact(n-1)
	# leaq 8(%rsp), %rsp # recycle
	ret
