	.globl times
times:
	mov $0, %eax      #  remove these lines before
	mov %esi, %edx
	jmp loop
loop:
	cmpl $0, %esi
	jbe endif
	addl %edi, %eax
	decl %esi
	jmp loop

endif:
	ret	


