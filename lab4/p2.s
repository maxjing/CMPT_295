	.file	"p2.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	proc2
	.type	proc2, @function
proc2:
.LFB0:
	.cfi_startproc
	imull	%esi, %edi
	leal	-12(%rdi), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	proc2, .-proc2
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
