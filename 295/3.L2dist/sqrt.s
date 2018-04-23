	.globl sqrt
sqrt:
	movl $0, %eax
	movl $0x8000, %ecx

loop:
	xorl %ecx, %eax
	movl %eax, %esi
	imul %esi, %esi
	cmpl %esi, %edi
	jae endif
	xorl %ecx, %eax

endif:
	shr $1, %ecx
	jnz loop

	ret
