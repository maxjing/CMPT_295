	.globl dist
	# x1 in %edi
	# y1 in %esi
	# x2 in %edx
	# y2 in %ecx

dist:
	subl %edi, %edx  # dx <- x2-x1
	imull %edx, %edx # dx * dx

	subl %esi, %ecx  # dy <- y2-y1
	imull %ecx, %ecx # dy * dy

	addl %ecx, %edx  # dx*dx + dy*dy

	movl %edx, %edi  # param1
	call sqrt

	ret


