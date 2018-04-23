
        .globl sqrt
sqrt:
        mov $0, %rax   # place your code for Q3 here
        movq $65536, %rdx
        
loop:
		xorq %rdx, %rax
		movq %rax, %rsi
		imul %rsi, %rsi
		cmpq %rdi, %rsi
		jbe keep
		xorq %rdx, %rax
	
keep:
		shrq $1,%rdx
		jnz loop;
		ret		



#         .globl sqrt
# sqrt:
#         mov $0, %rax   # place your code for Q3 here
#         movq $65536, %rdx
        

# loop: 
#         xor %rdx, %rax
#         pushq %rax
#         imul %rax, %rax
#         cmpq %rdi, %rax
#         popq %rax
#         jbe keep
#         xor %rdx, %rax
        
# keep:
#         shr $1, %rdx
#         jnz loop
# endl:                   
#         ret



