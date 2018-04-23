

.string1:
	.string "Please enter your name: "
.string2:
	.string "Thank you %s!\n"
.string3:
	.string "Please enter your year of birth: "
.string4:
	.string "%ld is not a valid year.\n"



	.globl get_age
get_age:
	push %rbx              
	push %rbp              # callee saved registers

	                       # local variables:
	leaq -8(%rsp), %rsp    #   - endptr
	leaq -24(%rsp), %rsp   #   - name_str[24]
	leaq -24(%rsp), %rsp   #   - year_of_birth[24]
	mov %rsp, %rbp

	movq $.string1, %rdi
	xorl %eax, %eax
	call printf            # printf("Please enter your name: ");

	leaq 24(%rbp), %rdi
	call gets              # gets(name_str);

	movq $.string2, %rdi
	movq %rax,%rsi
	xorl %eax, %eax
	
	call printf
loop:
	movq $.string3, %rdi
	xorl %eax, %eax

	call printf

	leaq (%rbp),%rdi
	call gets

	leaq (%rbp), %rdi
	leaq 48(%rbp),%rsi
	movq $10, %rdx
	call strtol

	cmpq $1900, %rax
	jl invalid
	cmpq $2014, %rax
	jg invalid

	jmp valid
invalid:
	movq $.string4, %rdi
	movq %rax, %rsi
	xor %eax, %eax
	call printf
	jmp loop

valid:

	leaq 56(%rsp), %rsp
	popq %rbx
	popq %rbp
	movq $2017, %rcx
	subq %rax, %rcx
	movq %rcx, %rax

	ret
	