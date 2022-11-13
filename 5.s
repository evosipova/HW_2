	.file	"5.c"
	.text
	.globl	get
	.type	get, @function
get:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)		#*len to func get
	movq	%rsi, -32(%rbp)		#*test 
	movq	-24(%rbp), %rax
	movl	$0, (%rax)		#*len = 0
	movq	-32(%rbp), %rax
	movl	$0, (%rax)		#*test = 0
	movl	$1, -12(%rbp)		#cap = 1
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)		#*s
	call	getchar@PLT
	movb	%al, -13(%rbp)		#c
	jmp	.L2
.L4:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %ecx
	movq	-24(%rbp), %rdx
	movl	%ecx, (%rdx)
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-13(%rbp), %eax
	movb	%al, (%rdx)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jg	.L3
	sall	-12(%rbp)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -8(%rbp)
.L3:
	call	getchar@PLT
	movb	%al, -13(%rbp)
.L2:
	cmpb	$10, -13(%rbp)
	jne	.L4
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax		#return *s
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	get, .-get
	.globl	l_n
	.type	l_n, @function
l_n:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6	
	movq	%rdi, -24(%rbp)		#char *s
	movl	%esi, -28(%rbp)		#int len
	movq	%rdx, -40(%rbp)		#*l
	movq	%rcx, -48(%rbp)		#*n
	movl	$0, -4(%rbp)
	jmp	.L7
.L12:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L8
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jle	.L9
.L8:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L10
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L10
.L9:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L11
.L10:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L11
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jg	.L11
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-48(%rbp), %rax
	movl	%edx, (%rax)
.L11:
	addl	$1, -4(%rbp)
.L7:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L12
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	l_n, .-l_n
	.section	.rodata
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
