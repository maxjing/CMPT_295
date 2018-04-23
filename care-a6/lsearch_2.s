
	# var map:
	#    %rdi - int *A
	#    %esi - int n
	#    %edx - target
	#	 %ecx - i
	#    %r9d - temp
	#	 %rax - the index of a[i] = target
	

	.globl	lsearch_2
#r9d temp
lsearch_2:
.LFB0:

	testl	%esi, %esi							#if n<=0{return -1 }
	jle	endif									
	movslq	%esi, %rax							#A[n-1]	
	leaq	-4(%rdi,%rax,4), %rax                 
	movl	(%rax), %r9d 			              #int temp = A[n-1];
	movl	%edx, (%rax)                          # A[n-1] = target;
	cmpl	(%rdi), %edx                          #if A[0]=target{i = 0; }
	je	equal
	movl	$0, %ecx 								# i=0
loop:											#while(A[i] !=target){ i++}
	addl	$1, %ecx							
	movslq	%ecx, %r8							
	cmpl	(%rdi,%r8,4), %edx
	jne	loop
	jmp	found
equal:
	movl	$0, %ecx  							
found:
	movl	%r9d, (%rax) 						# A[n-1] = temp;
	leal	-1(%rsi), %eax
	cmpl	%ecx, %eax 							#if(i<n-1){ return n=1}
	jg	last_equal								#else{return -1}
	cmpl	%edx, %r9d
	movl	$-1, %edx
	cmovne	%edx, %eax
	ret
endif:
	movl	$-1, %eax                         #return -1
	ret
last_equal:
	movl	%ecx, %eax						#return n-1
	ret

