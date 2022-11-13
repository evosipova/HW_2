	.file	"5.c"
	.text
	.globl	get
	.type	get, @function
get:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	pushq	%rbx 			#char c
	pushq	%r15			#*test
	pushq	%r14			#char *s
	pushq	%r13			#cap
	pushq	%r12			#*len
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, %r12		#go to func int *len
	movq	%rsi, %r15		#go to func int *test
	movq	%r12, %rax
	movl	$0, (%rax)		#*len = 0
	movq	%r15, %rax
	movl	$0, (%rax)		#*test = 0
	movq	$1, %r13
	movl	$1, %edi		#cap = 1
	call	malloc@PLT
	movq	%rax, %r14		#char *s
	call	getchar@PLT
	movb	%al, %bl		#char c 
	jmp	.L2
.L4:
	movq	%r12, %rax
	movl	(%rax), %eax
	leal	1(%rax), %ecx
	movq	%r12, %rdx
	movl	%ecx, (%rdx)
	movslq	%eax, %rdx
	movq	%r14, %rax
	addq	%rax, %rdx
	movzbl	%bl, %eax
	movb	%al, (%rdx)
	movq	%r12, %rax
	movl	(%rax), %eax
	cmpq	%rax, %r13
	jg	.L3
	salq	%r13
	movq	%r13, %rax
	movslq	%eax, %rdx
	movq	%r14, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, %r14
.L3:
	call	getchar@PLT
	movb	%al, %bl
.L2:
	cmpb	$10, %bl
	jne	.L4
	movq	%r12, %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%r14, %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	%r14, %rax		#return *s
	movq 	%rbp, %rsp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbx
	popq	%rbp
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
	pushq	%r15			#*n
	pushq	%r14			#*l
	pushq	%r13			#int len
	pushq	%r12			#char *s
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6	
	movq	%rdi, %r12		#char *s
	movq	%rsi, %r13		#int len
	movq	%rdx, %r14		#*l
	movq	%rcx, %r15		#*n
	movq	$0, %rbx
	jmp	.L7
.L12:
	movq	%rbx, %rax
	movslq	%eax, %rdx
	movq	%r12, %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L8
	movq	%rbx, %rax
	movslq	%eax, %rdx
	movq	%r12, %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jle	.L9
.L8:
	movq	%rbx, %rax
	movslq	%eax, %rdx
	movq	%r12, %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L10
	movq	%rbx, %rax
	movslq	%eax, %rdx
	movq	%r12, %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L10
.L9:
	movq	%r14, %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	%r14, %rax
	movl	%edx, (%rax)
	jmp	.L11
.L10:
	movq	%rbx, %rax
	movslq	%eax, %rdx
	movq	%r12, %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L11
	movq	%rbx, %rax
	movslq	%eax, %rdx
	movq	%r12, %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jg	.L11
	movq	%r15, %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	%r15, %rax
	movl	%edx, (%rax)
.L11:
	addq	$1, %rbx
.L7:
	movq	%rbx, %rax
	cmpq	%r13, %rax
	jl	.L12
	nop
	movq	%rbp, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
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
