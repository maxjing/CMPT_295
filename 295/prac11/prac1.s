	.globl prac1


		movl $0, %ecx			#make ecx the counter from 1-5
	movq $0, %r8			# set total = 0
prac1:
					


	movq $0, %rax
	pushq %rax
loop :
    cmpl %ecx, %edx	#compare N to 1 ; ecx -0 < 0?

	jle end	

	movq (%rdi,%rcx,8), %rax	#move the pointer to next item
	imulq (%rsi,%rcx,8), %rax	#compute x[n] *y[n] into rax
	addq %rax,(%rsp)

	incl %ecx
	jmp loop

end:
	movq (%rsp), %rax
	leaq 8(%rsp),%rsp
	ret
