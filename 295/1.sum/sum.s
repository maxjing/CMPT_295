	.globl	sum
sum:
#version2:
	mov $0, %eax		# total = 0;
	mov %esi, %ecx		# ecx <- n
	
	cmp $0, %ecx
	je bypass           # corner case: n = 0
for:
	add -4(%rdi, %rcx, 4), %eax
	loop for
bypass:
	ret


#version1:
	mov $0, %eax		# total = 0;
	mov $0, %ecx		# for (i = 0;

loop:
	cmp %ecx, %esi
	jle endloop         #           ; i < n; ) {

	add (%rdi, %rcx, 4), %eax  #	total += A[i];
	inc %ecx            #    i++;
	jmp loop    		# }

endloop:
	ret
