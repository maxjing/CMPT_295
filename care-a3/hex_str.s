# 	.globl hex_str
# hex_str:
# 	movb $'0', (%rsi) # s[0] <- ’0’
# 	movb $'x', 1(%rsi) # s[1] <- ’1’
# 	movb $0, 10(%rsi) # s[10] <- ’\0’
# 	#
# 	movl $8, %ecx # for i <- 8 downto 1 do: automatically decrement
# for: #
# 	movl $0xf, %eax #
# 	andb %dil, %al # a <- x & 0xf
# 	cmpb $10, %al #
# 	jl digit # if a >= 10 then
# 	subb $9, %al #
# 	orb $96, %al # a <- (a-9) | 0x60
# 	jmp endif #
# digit: # else
# 	orb $48, %al # a <- a | 0x30
# endif: #
# 	movb %al, 1(%rsi, %rcx) # s[i+1] <- a
# 	shr $4, %rdi # x <- x >> 4
# 	loop for #
# 	ret



		.globl hex_str
hex_str:
	movb $'0', (%rsi)
	movb $'x', 1(%rsi)
	movb $0, 10(%rsi)
	movl $8, %ecx
for: 
	movl $0xf, %eax
	andb %dil, %al
	cmpb $10, %al
	jl digit
	subb $9, %al
	orb $96, %al
	jmp endif

digit: 
	orb $48, %al
	
endif: 
	movb %al, 1(%rsi, %rcx)
	shr $4, %rdi
	loop for

	ret