	.file	"8.c"
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
	.globl	get2
	.type	get2, @function
get2:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	movq	-32(%rbp), %rax
	movl	$0, (%rax)
	movl	$1, -12(%rbp)
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	call	getchar@PLT
	movb	%al, -13(%rbp)
	jmp	.L7
.L9:
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
	jg	.L8
	sall	-12(%rbp)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -8(%rbp)
.L8:
	call	getchar@PLT
	movb	%al, -13(%rbp)
.L7:
	cmpb	$10, -13(%rbp)
	jne	.L9
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	get2, .-get2
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
	movl	$0, -8(%rbp)
	jmp	.L12
.L19:
	movq	-40(%rbp), %rax
	movl	$0, (%rax)
	movq	-48(%rbp), %rax
	movl	$0, (%rax)
	movl	$0, -4(%rbp)
	jmp	.L13
.L18:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L14
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jle	.L15
.L14:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L16
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L16
.L15:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L17
.L16:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L17
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jg	.L17
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-48(%rbp), %rax
	movl	%edx, (%rax)
.L17:
	addl	$1, -4(%rbp)
.L13:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L18
	addl	$1, -8(%rbp)
.L12:
	cmpl	$99999, -8(%rbp)
	jle	.L19
	nop
	nop
	popq	%rbp
	ret
	.size	l_n, .-l_n
	.globl	get_random_string
	.type	get_random_string, @function
get_random_string:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1759218605, %rdx, %rdx
	shrq	$32, %rdx
	movl	%edx, %ecx
	sarl	$12, %ecx
	cltd
	subl	%edx, %ecx
	movl	%ecx, %edx
	imull	$10000, %edx, %edx
	subl	%edx, %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L21
.L24:
	movl	-12(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L22
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1321528399, %rdx, %rdx
	shrq	$32, %rdx
	movl	%edx, %ecx
	sarl	$3, %ecx
	cltd
	subl	%edx, %ecx
	movl	%ecx, %edx
	imull	$26, %edx, %edx
	subl	%edx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	leal	65(%rax), %ecx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	jmp	.L23
.L22:
	call	rand@PLT
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %ecx
	sarl	$2, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	addl	%eax, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	48(%rax), %ecx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
.L23:
	addl	$1, -12(%rbp)
.L21:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L24
	movq	-8(%rbp), %rax
	leave
	ret
	.size	get_random_string, .-get_random_string
	.section	.rodata
.LC0:
	.string	"incorrect input!"
.LC1:
	.string	"-r"
.LC2:
	.string	"%s \n %d \n"
.LC3:
	.string	"letters: %d \nnumbers: %d\n"
.LC5:
	.string	"time: %.4lf\n"
.LC6:
	.string	"-h"
.LC7:
	.string	"-h help"
.LC8:
	.string	"-r create random string"
	.align 8
.LC9:
	.string	"-f use string from input.txt and save result in output.txt"
	.align 8
.LC10:
	.string	"-s use string from terminal and return result in terminal"
.LC11:
	.string	"-f"
.LC12:
	.string	"r"
.LC13:
	.string	"input.txt"
.LC14:
	.string	"w"
.LC15:
	.string	"output.txt"
.LC16:
	.string	"wrong file!"
.LC17:
	.string	"-s"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$2, -84(%rbp)
	je	.L27
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L35
.L27:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L29
	movl	$0, -72(%rbp)
	movl	$0, -68(%rbp)
	leaq	-76(%rbp), %rax
	movq	%rax, %rdi
	call	get_random_string
	movq	%rax, -16(%rbp)
	movl	-76(%rbp), %edx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	call	clock@PLT
	movq	%rax, -56(%rbp)
	movl	-76(%rbp), %esi
	leaq	-68(%rbp), %rcx
	leaq	-72(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	l_n
	call	clock@PLT
	movq	%rax, -48(%rbp)
	movl	-68(%rbp), %edx
	movl	-72(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-48(%rbp), %rax
	subq	-56(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L30
.L29:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L31
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L30
.L31:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L32
	leaq	.LC12(%rip), %rsi
	leaq	.LC13(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -40(%rbp)
	leaq	.LC14(%rip), %rsi
	leaq	.LC15(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L33
	cmpq	$0, -40(%rbp)
	jne	.L34
.L33:
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L35
.L34:
	movl	$0, -72(%rbp)
	movl	$0, -68(%rbp)
	leaq	-80(%rbp), %rdx
	leaq	-76(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	get
	movq	%rax, -24(%rbp)
	call	clock@PLT
	movq	%rax, -56(%rbp)
	movl	-76(%rbp), %esi
	leaq	-68(%rbp), %rcx
	leaq	-72(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	l_n
	call	clock@PLT
	movq	%rax, -48(%rbp)
	movl	-68(%rbp), %ecx
	movl	-72(%rbp), %edx
	movq	-32(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-48(%rbp), %rax
	subq	-56(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L30
.L32:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L30
	movl	$0, -72(%rbp)
	movl	$0, -68(%rbp)
	leaq	-80(%rbp), %rdx
	leaq	-76(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get2
	movq	%rax, -64(%rbp)
	call	clock@PLT
	movq	%rax, -56(%rbp)
	movl	-76(%rbp), %esi
	leaq	-68(%rbp), %rcx
	leaq	-72(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	l_n
	call	clock@PLT
	movq	%rax, -48(%rbp)
	movl	-68(%rbp), %edx
	movl	-72(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-48(%rbp), %rax
	subq	-56(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L30:
	movl	$0, %eax
.L35:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L36
	call	__stack_chk_fail@PLT
.L36:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC4:
	.long	0
	.long	1093567616
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
