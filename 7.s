	.file	"7.c"
	.text
	.globl	get
	.type	get, @function
get:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-32(%rbp), %rax
	movl	$0, (%rax)
	movq	-40(%rbp), %rax
	movl	$0, (%rax)
	movl	$1, -12(%rbp)
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -13(%rbp)
	jmp	.L2
.L4:
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %ecx
	movq	-32(%rbp), %rdx
	movl	%ecx, (%rdx)
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-13(%rbp), %eax
	movb	%al, (%rdx)
	movq	-32(%rbp), %rax
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
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -13(%rbp)
.L2:
	cmpb	$-1, -13(%rbp)
	jne	.L4
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	get, .-get
	.globl	l_n
	.type	l_n, @function
l_n:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
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
	nop
	popq	%rbp
	ret
	.size	l_n, .-l_n
	.section	.rodata
.LC0:
	.string	"incorrect input!"
.LC1:
	.string	"r"
.LC2:
	.string	"w"
.LC3:
	.string	"wrong file!"
.LC4:
	.string	"letters: %d \nnumbers: %d\n"
.LC5:
	.string	"incorrect input"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$3, -52(%rbp)
	je	.L14
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L19
.L14:
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -32(%rbp)
	movq	-64(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L16
	cmpq	$0, -32(%rbp)
	jne	.L17
.L16:
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L19
.L17:
	movl	$0, -40(%rbp)
	movl	$0, -36(%rbp)
	leaq	-44(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	get
	movq	%rax, -16(%rbp)
	movl	-44(%rbp), %eax
	testl	%eax, %eax
	jne	.L18
	movl	-48(%rbp), %esi
	leaq	-36(%rbp), %rcx
	leaq	-40(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	l_n
	movl	-36(%rbp), %ecx
	movl	-40(%rbp), %edx
	movq	-24(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
	jmp	.L19
.L18:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	fwrite@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
.L19:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
