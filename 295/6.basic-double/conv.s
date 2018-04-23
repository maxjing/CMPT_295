.globl d2l
.globl l2d
.globl sum_floats
.globl sum_doubles

l2d:
	movq %rdi, %xmm0
    ret

d2l:
	movq %xmm0, %rax	
    ret

sum_floats:
	# %rdi -> A[]
	# %esi -> n
	# %xmm0 -> total

	xorps %xmm0, %xmm0  # total <- 0
	xorps %xmm1, %xmm1  # x <- 0
	movl $0, %ecx       # i <- 0

loop:
	cmpl %esi, %ecx
	jge endloop

	ucomiss (%rdi, %rcx, 4), %xmm1  # compare with 0
	ja negative   # filter out all the negative numbers
	jp nan        # filter out all the NAN
	addss (%rdi, %rcx, 4), %xmm0  # total += A[i]
negative:
nan:
	incl %ecx           # i++
	jmp loop

endloop:	
    ret

sum_doubles:
    vxorpd %xmm0, %xmm0, %xmm0
    ret

