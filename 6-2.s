.LC0:
	.string	"letters: %d \nnumbers %d\n"
.LC1:
	.string	"incorrect input"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -24(%rbp)		#l = 0 (counter of letters)
	movl	$0, -20(%rbp)		#n = 0 (counter of numbers)
	leaq	-28(%rbp), %rdx		#len to get
	leaq	-32(%rbp), %rax		#test to get
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get
	movq	%rax, -16(%rbp)		#return *s
	movl	-28(%rbp), %eax
	testl	%eax, %eax
	jne	.L14 
	movl	-32(%rbp), %esi		#s to l_n
	leaq	-20(%rbp), %rcx		#len to l_n
	leaq	-24(%rbp), %rdx		#l to l_n
	movq	-16(%rbp), %rax		#n to l_n
	movq	%rax, %rdi
	call	l_n
	movl	-20(%rbp), %edx		#n to printf
	movl	-24(%rbp), %eax		#l to printf
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi	#string to printf
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L16
.L14:
	leaq	.LC1(%rip), %rdi	#string to else printf
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
.L16:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
