	.globl sum_float

	# var map:
	#   %xmm0:  total
	#   %rdi:   F[n] (base pointer)
	#   %rsi:   n
	#   %rbp:   endptr

sum_float:
	push	%rbp

	xorps	%xmm0, %xmm0            # total <- 0.0
	leaq	(%rdi, %rsi, 4), %rbp   # endptr <- F + n

loop:
	cmpq	%rdi, %rbp             
	jle	endloop   
	cmpq %rdi,%rbp
	jl add
	addss (%rdi),%xmm0

	addss	(%rdi), %xmm0          
	add	$4, %rdi                
	
	jmp	loop                    
add:
	addss (%rbp),%xmm0
	dec $4 %rbp
	jmp loop
endloop:
	pop	%rbp
	ret

