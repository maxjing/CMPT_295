	.globl prac1


					# A1 in rdi
					# A2 in rsi
					#N is in rdx

prac1:
	
	movl $0, %ecx			#make ecx the counter from 1-5
	movq $0, %r8			# set total = 0	

loop:
	cmpl %ecx, %edx 		#compare N to 1 ; ecx -0 < 0?
	jle end	
	movq (%rsi,%rcx,8), %rax	#move the pointer to next item
	imulq (%rdi,%rcx,8), %rax	#compute x[n] *y[n] into rax
	
	addq %rax,%r8			#add x[i]*y[i] into r8

	incl %ecx
	jmp loop

end:
	movq %r8, %rax
	ret
	
	
