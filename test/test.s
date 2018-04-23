
; # 	.globl max
; # max:
; # 	mov %rdi, %rax
; # 	cmp %rsi, %rdi
; # 	jl retry
; # 	ret
; # retry:
; # 	mov %rsi, %rax
; # 	ret		


; # 	.globl abs
; # abs:
; 	# mov %rdi, %rdx
; 	# sar $31, %rdx
; 	# mov %rdx, %rax
; 	# xor %rdi, %rax
; 	# sub %rdx, %rax

; # .globl stack_pop

; # stack_pop:
; # 	pushq %rbx
; # 	movq %rdi, %rbx
; # 	add $4, %rbx
; # 	movq %rbx, %rax
; # 	pop %rbx
; # 	ret

; .globl stack_swap
; stack_swap:
; 	subq $16 ,%rsp      #alloc at 16 bits for two arguments 
; 	movq %rdi ,(%rsp)   # mov 1st argument to stack
; 	movq %rsi, 8(%rsp)  #mov second argument to stack+8
; 	movq (%rsp) ,%rdx
; 	subq 8(%rsp), %rdx
; 	movq %rdx, %rax
; 	addq $16, %rsp
; 	ret

; .globl xortest
; xortest:
; 	movq $0xf, %rdi
; 	movq $0x0, %rsi

; 	xor  %rdi, %rdi
; 	movq %rdi, %rax
; 	ret

.globl stack_transfer
stack_transfer:
	push %rbp
	movq $300, %rsi
	movq %rsp,%rbp
	leaq -64(%rsp),%rsp
	movq $100, -24(%rbp)
	movq $200, -64(%rbp)
	movq -64(%rbp), %rax
	addq $64,%rsp
	popq %rbp
	ret