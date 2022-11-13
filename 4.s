	.file	"4.c"
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
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	get, .-get
	.section	.rodata
.LC0:
	.string	"letters: %d \nnumbers %d\n"
.LC1:
	.string	"incorrect input"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -28(%rbp)		#l = 0 (counter of letters)
	movl	$0, -24(%rbp)		#n = 0 (counter of numbers)
	leaq	-32(%rbp), %rdx
	leaq	-36(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get
	movq	%rax, -16(%rbp)		#*s
	movl	-32(%rbp), %eax
	testl	%eax, %eax
	jne	.L7
	movl	$0, -20(%rbp)
	jmp	.L8
.L13:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L9
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jle	.L10
.L9:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L11
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L11
.L10:
	addl	$1, -28(%rbp)
	jmp	.L12
.L11:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L12
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jg	.L12
	addl	$1, -24(%rbp)
.L12:
	addl	$1, -20(%rbp)
.L8:
	movl	-36(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L13
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L15
.L7:
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
.L15:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
