	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	_json_object_destroy            ## -- Begin function json_object_destroy
	.p2align	4, 0x90
_json_object_destroy:                   ## @json_object_destroy
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r15
	movq	(%rdi), %r12
	movq	8(%rdi), %r14
	testq	%r12, %r12
	je	LBB0_3
## %bb.1:
	movq	%r14, %rbx
	.p2align	4, 0x90
LBB0_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	callq	_free
	addq	$16, %rbx
	addq	$-1, %r12
	jne	LBB0_2
LBB0_3:
	movq	%r14, %rdi
	callq	_free
	movq	16(%r15), %r13
	movq	24(%r15), %r14
	testq	%r13, %r13
	je	LBB0_6
## %bb.4:
	leaq	16(%r14), %rbx
	.p2align	4, 0x90
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbx), %rdi
	movq	(%rbx), %r12
	callq	_free
	movq	%r12, %rdi
	callq	_free
	addq	$32, %rbx
	addq	$-1, %r13
	jne	LBB0_5
LBB0_6:
	movq	%r14, %rdi
	callq	_free
	movq	32(%r15), %r12
	movq	40(%r15), %r14
	testq	%r12, %r12
	je	LBB0_9
## %bb.7:
	leaq	16(%r14), %rbx
	.p2align	4, 0x90
LBB0_8:                                 ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbx), %rdi
	movq	(%rbx), %r15
	callq	_free
	movq	%r15, %rdi
	callq	_free
	addq	$32, %rbx
	addq	$-1, %r12
	jne	LBB0_8
LBB0_9:
	movq	%r14, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_free                           ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ## -- Begin function json_object_calculate_string_length
LCPI1_0:
	.long	1                               ## 0x1
	.long	0                               ## 0x0
	.long	0                               ## 0x0
	.long	0                               ## 0x0
LCPI1_1:
	.byte	1                               ## 0x1
	.byte	1                               ## 0x1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
LCPI1_2:
	.quad	8                               ## 0x8
	.quad	8                               ## 0x8
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_json_object_calculate_string_length
	.p2align	4, 0x90
_json_object_calculate_string_length:   ## @json_object_calculate_string_length
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	(%rdi), %r10
	testq	%r10, %r10
	je	LBB1_1
## %bb.5:
	movq	8(%rdi), %r8
	cmpq	$4, %r10
	jae	LBB1_7
## %bb.6:
	movl	$1, %eax
	xorl	%r9d, %r9d
	jmp	LBB1_10
LBB1_1:
	movl	$1, %eax
	jmp	LBB1_2
LBB1_7:
	movq	%r10, %r9
	andq	$-4, %r9
	leaq	57(%r8), %rax
	pxor	%xmm2, %xmm2
	movdqa	LCPI1_0(%rip), %xmm3            ## xmm3 = [1,0,0,0]
	movdqa	LCPI1_1(%rip), %xmm0            ## xmm0 = <1,1,u,u,u,u,u,u,u,u,u,u,u,u,u,u>
	movdqa	LCPI1_2(%rip), %xmm1            ## xmm1 = [8,8]
	movq	%r9, %rsi
	.p2align	4, 0x90
LBB1_8:                                 ## =>This Inner Loop Header: Depth=1
	movd	-49(%rax), %xmm4                ## xmm4 = mem[0],zero,zero,zero
	pinsrb	$1, -33(%rax), %xmm4
	movd	-17(%rax), %xmm5                ## xmm5 = mem[0],zero,zero,zero
	pinsrb	$1, -1(%rax), %xmm5
	movzbl	-48(%rax), %edx
	movd	%edx, %xmm6
	pinsrb	$1, -32(%rax), %xmm6
	movzbl	-16(%rax), %edx
	movd	%edx, %xmm7
	pinsrb	$1, (%rax), %xmm7
	pmovzxbq	%xmm4, %xmm4                    ## xmm4 = xmm4[0],zero,zero,zero,zero,zero,zero,zero,xmm4[1],zero,zero,zero,zero,zero,zero,zero
	paddq	%xmm3, %xmm4
	pmovzxbq	%xmm5, %xmm5                    ## xmm5 = xmm5[0],zero,zero,zero,zero,zero,zero,zero,xmm5[1],zero,zero,zero,zero,zero,zero,zero
	paddq	%xmm2, %xmm5
	pandn	%xmm0, %xmm6
	pandn	%xmm0, %xmm7
	pmovzxbq	%xmm6, %xmm2                    ## xmm2 = xmm6[0],zero,zero,zero,zero,zero,zero,zero,xmm6[1],zero,zero,zero,zero,zero,zero,zero
	pmovzxbq	%xmm7, %xmm6                    ## xmm6 = xmm7[0],zero,zero,zero,zero,zero,zero,zero,xmm7[1],zero,zero,zero,zero,zero,zero,zero
	paddq	%xmm1, %xmm4
	movdqa	%xmm4, %xmm3
	paddq	%xmm2, %xmm3
	paddq	%xmm1, %xmm5
	movdqa	%xmm5, %xmm2
	paddq	%xmm6, %xmm2
	addq	$64, %rax
	addq	$-4, %rsi
	jne	LBB1_8
## %bb.9:
	paddq	%xmm3, %xmm2
	pshufd	$238, %xmm2, %xmm0              ## xmm0 = xmm2[2,3,2,3]
	paddq	%xmm2, %xmm0
	movq	%xmm0, %rax
	cmpq	%r9, %r10
	je	LBB1_2
LBB1_10:
	subq	%r9, %r10
	shlq	$4, %r9
	leaq	(%r8,%r9), %rdx
	addq	$9, %rdx
	.p2align	4, 0x90
LBB1_11:                                ## =>This Inner Loop Header: Depth=1
	movzbl	-1(%rdx), %esi
	movzbl	(%rdx), %ecx
	notl	%ecx
	andl	$1, %ecx
	addq	%rax, %rsi
	leaq	(%rcx,%rsi), %rax
	addq	$8, %rax
	addq	$16, %rdx
	addq	$-1, %r10
	jne	LBB1_11
LBB1_2:
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	LBB1_17
## %bb.3:
	movq	24(%rdi), %r8
	cmpq	$4, %rcx
	jae	LBB1_12
## %bb.4:
	xorl	%r9d, %r9d
	jmp	LBB1_15
LBB1_12:
	movq	%rcx, %r9
	andq	$-4, %r9
	movq	%rax, %xmm1
	leaq	122(%r8), %rax
	pxor	%xmm0, %xmm0
	pcmpeqd	%xmm2, %xmm2
	movq	%r9, %rsi
	.p2align	4, 0x90
LBB1_13:                                ## =>This Inner Loop Header: Depth=1
	movzwl	-96(%rax), %edx
	movd	%edx, %xmm3
	pinsrw	$1, -64(%rax), %xmm3
	movzwl	-32(%rax), %edx
	movd	%edx, %xmm4
	pinsrw	$1, (%rax), %xmm4
	pmovzxwq	%xmm3, %xmm3                    ## xmm3 = xmm3[0],zero,zero,zero,xmm3[1],zero,zero,zero
	paddq	%xmm3, %xmm1
	pmovzxwq	%xmm4, %xmm3                    ## xmm3 = xmm4[0],zero,zero,zero,xmm4[1],zero,zero,zero
	paddq	%xmm3, %xmm0
	psubq	%xmm2, %xmm1
	psubq	%xmm2, %xmm0
	subq	$-128, %rax
	addq	$-4, %rsi
	jne	LBB1_13
## %bb.14:
	paddq	%xmm1, %xmm0
	pshufd	$238, %xmm0, %xmm1              ## xmm1 = xmm0[2,3,2,3]
	paddq	%xmm0, %xmm1
	movq	%xmm1, %rax
	cmpq	%r9, %rcx
	je	LBB1_17
LBB1_15:
	subq	%r9, %rcx
	shlq	$5, %r9
	leaq	(%r8,%r9), %rdx
	addq	$26, %rdx
	.p2align	4, 0x90
LBB1_16:                                ## =>This Inner Loop Header: Depth=1
	movzwl	(%rdx), %esi
	addq	%rsi, %rax
	addq	$1, %rax
	addq	$32, %rdx
	addq	$-1, %rcx
	jne	LBB1_16
LBB1_17:
	movq	32(%rdi), %rcx
	testq	%rcx, %rcx
	je	LBB1_25
## %bb.18:
	movq	40(%rdi), %r8
	cmpq	$4, %rcx
	jae	LBB1_20
## %bb.19:
	xorl	%r9d, %r9d
	jmp	LBB1_23
LBB1_20:
	movq	%rcx, %r9
	andq	$-4, %r9
	movq	%rax, %xmm1
	leaq	122(%r8), %rax
	pxor	%xmm0, %xmm0
	pcmpeqd	%xmm2, %xmm2
	movq	%r9, %rsi
	.p2align	4, 0x90
LBB1_21:                                ## =>This Inner Loop Header: Depth=1
	movzwl	-96(%rax), %edx
	movd	%edx, %xmm3
	pinsrw	$1, -64(%rax), %xmm3
	movzwl	-32(%rax), %edx
	movd	%edx, %xmm4
	pinsrw	$1, (%rax), %xmm4
	pmovzxwq	%xmm3, %xmm3                    ## xmm3 = xmm3[0],zero,zero,zero,xmm3[1],zero,zero,zero
	paddq	%xmm3, %xmm1
	pmovzxwq	%xmm4, %xmm3                    ## xmm3 = xmm4[0],zero,zero,zero,xmm4[1],zero,zero,zero
	paddq	%xmm3, %xmm0
	psubq	%xmm2, %xmm1
	psubq	%xmm2, %xmm0
	subq	$-128, %rax
	addq	$-4, %rsi
	jne	LBB1_21
## %bb.22:
	paddq	%xmm1, %xmm0
	pshufd	$238, %xmm0, %xmm1              ## xmm1 = xmm0[2,3,2,3]
	paddq	%xmm0, %xmm1
	movq	%xmm1, %rax
	cmpq	%r9, %rcx
	je	LBB1_25
LBB1_23:
	subq	%r9, %rcx
	shlq	$5, %r9
	leaq	(%r8,%r9), %rdx
	addq	$26, %rdx
	.p2align	4, 0x90
LBB1_24:                                ## =>This Inner Loop Header: Depth=1
	movzwl	(%rdx), %esi
	addq	%rsi, %rax
	addq	$1, %rax
	addq	$32, %rdx
	addq	$-1, %rcx
	jne	LBB1_24
LBB1_25:
	movq	%rax, 48(%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_to_string          ## -- Begin function json_object_to_string
	.p2align	4, 0x90
_json_object_to_string:                 ## @json_object_to_string
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movb	$123, (%rsi)
	movq	(%rdi), %rbx
	testq	%rbx, %rbx
	movq	%rsi, -96(%rbp)                 ## 8-byte Spill
	movq	%rdi, -104(%rbp)                ## 8-byte Spill
	je	LBB2_1
## %bb.21:
	movq	8(%rdi), %r15
	addq	$10, %r15
	movl	$1, %r12d
	jmp	LBB2_22
	.p2align	4, 0x90
LBB2_27:                                ##   in Loop: Header=BB2_22 Depth=1
	movq	-72(%rbp), %rsp                 ## 8-byte Reload
	leaq	(%r12,%rbx), %rax
	addq	%rbx, %r12
	addq	$1, %r12
	movb	$44, (%r14,%rax)
	addq	$16, %r15
	movq	%r14, %rsi
	movq	-56(%rbp), %rbx                 ## 8-byte Reload
	addq	$-1, %rbx
	je	LBB2_2
LBB2_22:                                ## =>This Inner Loop Header: Depth=1
	movq	%r12, -88(%rbp)                 ## 8-byte Spill
	movq	%rsp, -72(%rbp)                 ## 8-byte Spill
	movq	-10(%r15), %rax
	movq	%rax, -112(%rbp)                ## 8-byte Spill
	movzbl	-2(%r15), %r12d
	movzbl	-1(%r15), %r14d
	movzwl	(%r15), %eax
	movq	%rax, -80(%rbp)                 ## 8-byte Spill
	callq	____chkstk_darwin
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %r13
	movb	%r14b, -64(%rbp)                ## 1-byte Spill
	testb	%r14b, %r14b
	leaq	L_.str(%rip), %rsi
	leaq	L_.str.1(%rip), %rax
	cmoveq	%rax, %rsi
	movb	$34, (%r13)
	testq	%r12, %r12
	movq	%rbx, -56(%rbp)                 ## 8-byte Spill
	je	LBB2_23
## %bb.24:                              ##   in Loop: Header=BB2_22 Depth=1
	leaq	1(%r13), %rdi
	movq	%rsi, %rbx
	movq	-112(%rbp), %rsi                ## 8-byte Reload
	movq	%r12, %rdx
	callq	_memcpy
	movq	%rbx, %rsi
	jmp	LBB2_25
	.p2align	4, 0x90
LBB2_23:                                ##   in Loop: Header=BB2_22 Depth=1
	xorl	%r12d, %r12d
LBB2_25:                                ##   in Loop: Header=BB2_22 Depth=1
	xorl	%r14d, %r14d
	cmpb	$0, -64(%rbp)                   ## 1-byte Folded Reload
	sete	%r14b
	movw	$14882, 1(%r13,%r12)            ## imm = 0x3A22
	leaq	4(%r14), %rdx
	leaq	(%r12,%r13), %rdi
	addq	$3, %rdi
	callq	_memcpy
	leaq	(%r12,%r14), %rax
	addq	$4, %rax
	movb	$0, 3(%r13,%rax)
	movq	-80(%rbp), %rbx                 ## 8-byte Reload
	testq	%rbx, %rbx
	movq	-96(%rbp), %r14                 ## 8-byte Reload
	movq	-88(%rbp), %r12                 ## 8-byte Reload
	je	LBB2_27
## %bb.26:                              ##   in Loop: Header=BB2_22 Depth=1
	leaq	(%r14,%r12), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	_memcpy
	jmp	LBB2_27
LBB2_1:
	movl	$1, %r12d
LBB2_2:
	movq	-104(%rbp), %rax                ## 8-byte Reload
	movq	16(%rax), %rcx
	testq	%rcx, %rcx
	je	LBB2_11
## %bb.3:
	movq	24(%rax), %r13
	addq	$26, %r13
	jmp	LBB2_4
	.p2align	4, 0x90
LBB2_10:                                ##   in Loop: Header=BB2_4 Depth=1
	movq	-80(%rbp), %rsp                 ## 8-byte Reload
	leaq	(%r12,%rbx), %rax
	addq	%rbx, %r12
	addq	$1, %r12
	movb	$44, (%r15,%rax)
	addq	$32, %r13
	movq	-88(%rbp), %rcx                 ## 8-byte Reload
	addq	$-1, %rcx
	movq	%r15, %rsi
	je	LBB2_11
LBB2_4:                                 ## =>This Inner Loop Header: Depth=1
	movq	%rcx, -88(%rbp)                 ## 8-byte Spill
	movq	%rsp, -80(%rbp)                 ## 8-byte Spill
	movq	-26(%r13), %rbx
	movq	-10(%r13), %rax
	movq	%rax, -64(%rbp)                 ## 8-byte Spill
	movzbl	-18(%r13), %r15d
	movzbl	-2(%r13), %eax
	movq	%rax, -56(%rbp)                 ## 8-byte Spill
	movzwl	(%r13), %eax
	movq	%rax, -72(%rbp)                 ## 8-byte Spill
	callq	____chkstk_darwin
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %r14
	movb	$34, (%r14)
	testq	%r15, %r15
	je	LBB2_6
## %bb.5:                               ##   in Loop: Header=BB2_4 Depth=1
	leaq	1(%r14), %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_memcpy
LBB2_6:                                 ##   in Loop: Header=BB2_4 Depth=1
	leaq	4(%r15), %rbx
	movb	$34, 1(%r15,%r14)
	movb	$58, 2(%r15,%r14)
	movb	$34, 3(%r15,%r14)
	movq	-56(%rbp), %rax                 ## 8-byte Reload
	testq	%rax, %rax
	je	LBB2_8
## %bb.7:                               ##   in Loop: Header=BB2_4 Depth=1
	leaq	(%r14,%r15), %rdi
	addq	$4, %rdi
	movq	-64(%rbp), %rsi                 ## 8-byte Reload
	movq	-56(%rbp), %rdx                 ## 8-byte Reload
	callq	_memcpy
	movq	-56(%rbp), %rax                 ## 8-byte Reload
LBB2_8:                                 ##   in Loop: Header=BB2_4 Depth=1
	addq	%rax, %rbx
	movw	$34, (%r14,%rbx)
	movq	-72(%rbp), %rbx                 ## 8-byte Reload
	testq	%rbx, %rbx
	movq	-96(%rbp), %r15                 ## 8-byte Reload
	je	LBB2_10
## %bb.9:                               ##   in Loop: Header=BB2_4 Depth=1
	leaq	(%r15,%r12), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	_memcpy
	jmp	LBB2_10
LBB2_11:
	movq	-104(%rbp), %rax                ## 8-byte Reload
	movq	32(%rax), %rcx
	testq	%rcx, %rcx
	je	LBB2_28
## %bb.12:
	movq	40(%rax), %r14
	addq	$26, %r14
	jmp	LBB2_13
	.p2align	4, 0x90
LBB2_19:                                ##   in Loop: Header=BB2_13 Depth=1
	movq	-72(%rbp), %rsp                 ## 8-byte Reload
	leaq	(%rbx,%r13), %r12
	movb	$44, -1(%rsi,%r12)
	addq	$32, %r14
	movq	-56(%rbp), %rcx                 ## 8-byte Reload
	addq	$-1, %rcx
	je	LBB2_20
LBB2_13:                                ## =>This Inner Loop Header: Depth=1
	movq	%rcx, -56(%rbp)                 ## 8-byte Spill
	movq	%rsp, -72(%rbp)                 ## 8-byte Spill
	movq	%r12, -88(%rbp)                 ## 8-byte Spill
	movq	-26(%r14), %r13
	movq	-10(%r14), %rax
	movq	%rax, -64(%rbp)                 ## 8-byte Spill
	movzbl	-18(%r14), %ebx
	movzbl	-2(%r14), %r12d
	movzwl	(%r14), %eax
	movq	%rax, -80(%rbp)                 ## 8-byte Spill
	callq	____chkstk_darwin
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %r15
	movb	$34, (%r15)
	testq	%rbx, %rbx
	je	LBB2_15
## %bb.14:                              ##   in Loop: Header=BB2_13 Depth=1
	leaq	1(%r15), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	_memcpy
LBB2_15:                                ##   in Loop: Header=BB2_13 Depth=1
	leaq	3(%rbx), %r13
	movb	$34, 1(%rbx,%r15)
	movb	$58, 2(%rbx,%r15)
	testq	%r12, %r12
	je	LBB2_17
## %bb.16:                              ##   in Loop: Header=BB2_13 Depth=1
	leaq	(%r15,%rbx), %rdi
	addq	$3, %rdi
	movq	-64(%rbp), %rsi                 ## 8-byte Reload
	movq	%r12, %rdx
	callq	_memcpy
LBB2_17:                                ##   in Loop: Header=BB2_13 Depth=1
	addq	%r12, %r13
	movb	$0, (%r15,%r13)
	movq	-80(%rbp), %rbx                 ## 8-byte Reload
	testq	%rbx, %rbx
	movq	-96(%rbp), %rsi                 ## 8-byte Reload
	movq	-88(%rbp), %r13                 ## 8-byte Reload
	je	LBB2_19
## %bb.18:                              ##   in Loop: Header=BB2_13 Depth=1
	leaq	(%rsi,%r13), %rdi
	movq	%rsi, %r12
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	_memcpy
	movq	%r12, %rsi
	jmp	LBB2_19
LBB2_20:
	leaq	(%rbx,%r13), %rax
	addq	$-1, %rax
	jmp	LBB2_29
LBB2_28:
	leaq	-1(%r12), %rax
LBB2_29:
	movb	$125, (%rsi,%rax)
	movb	$0, (%rsi,%r12)
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB2_31
## %bb.30:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB2_31:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_value_boolean_to_string ## -- Begin function json_object_value_boolean_to_string
	.p2align	4, 0x90
_json_object_value_boolean_to_string:   ## @json_object_value_boolean_to_string
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	(%rdi), %rdx
	movzbl	8(%rdi), %r10d
	movb	9(%rdi), %r8b
	movb	$34, (%rsi)
	testq	%r10, %r10
	je	LBB3_3
## %bb.1:
	cmpb	$8, %r10b
	jb	LBB3_2
## %bb.4:
	leaq	1(%rsi), %rcx
	leaq	(%rdx,%r10), %rdi
	cmpq	%rdi, %rcx
	jae	LBB3_7
## %bb.5:
	leaq	(%r10,%rsi), %rcx
	addq	$1, %rcx
	cmpq	%rcx, %rdx
	jae	LBB3_7
LBB3_2:
	xorl	%edi, %edi
LBB3_21:
	movq	%rdi, %r9
	notq	%r9
	addq	%r10, %r9
	movq	%r10, %rcx
	andq	$3, %rcx
	je	LBB3_23
	.p2align	4, 0x90
LBB3_22:                                ## =>This Inner Loop Header: Depth=1
	movzbl	(%rdx,%rdi), %eax
	movb	%al, 1(%rsi,%rdi)
	addq	$1, %rdi
	addq	$-1, %rcx
	jne	LBB3_22
LBB3_23:
	cmpq	$3, %r9
	jb	LBB3_25
	.p2align	4, 0x90
LBB3_24:                                ## =>This Inner Loop Header: Depth=1
	movzbl	(%rdx,%rdi), %eax
	movb	%al, 1(%rsi,%rdi)
	movzbl	1(%rdx,%rdi), %eax
	movb	%al, 2(%rsi,%rdi)
	movzbl	2(%rdx,%rdi), %eax
	movb	%al, 3(%rsi,%rdi)
	movzbl	3(%rdx,%rdi), %eax
	movb	%al, 4(%rsi,%rdi)
	addq	$4, %rdi
	cmpq	%rdi, %r10
	jne	LBB3_24
	jmp	LBB3_25
LBB3_3:
	xorl	%r10d, %r10d
LBB3_25:
	leaq	3(%r10), %rdx
	xorl	%eax, %eax
	movw	$14882, 1(%r10,%rsi)            ## imm = 0x3A22
	movl	$102, %ecx
	movl	$116, %edi
	testb	%r8b, %r8b
	cmovel	%ecx, %edi
	movb	%dil, 3(%rsi,%r10)
	movl	$97, %ecx
	movl	$114, %edi
	cmovel	%ecx, %edi
	movb	%dil, 4(%r10,%rsi)
	setne	%al
	leal	108(%rax,%rax,8), %eax
	movb	%al, 5(%r10,%rsi)
	movl	$115, %eax
	movl	$101, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r10,%rsi)
	jne	LBB3_27
## %bb.26:
	movb	$101, 7(%r10,%rsi)
LBB3_27:
	cmpb	$1, %r8b
	adcq	$0, %rdx
	movb	$0, 4(%rdx,%rsi)
	popq	%rbp
	retq
LBB3_7:
	cmpb	$32, %r10b
	jae	LBB3_9
## %bb.8:
	xorl	%edi, %edi
	jmp	LBB3_18
LBB3_9:
	movl	%r10d, %edi
	andl	$-32, %edi
	movups	(%rdx), %xmm0
	movups	16(%rdx), %xmm1
	movups	%xmm0, 1(%rsi)
	movups	%xmm1, 17(%rsi)
	cmpq	$32, %rdi
	je	LBB3_16
## %bb.10:
	movups	32(%rdx), %xmm0
	movups	48(%rdx), %xmm1
	movups	%xmm0, 33(%rsi)
	movups	%xmm1, 49(%rsi)
	cmpl	$64, %edi
	je	LBB3_16
## %bb.11:
	movups	64(%rdx), %xmm0
	movups	80(%rdx), %xmm1
	movups	%xmm0, 65(%rsi)
	movups	%xmm1, 81(%rsi)
	cmpl	$96, %edi
	je	LBB3_16
## %bb.12:
	movups	96(%rdx), %xmm0
	movups	112(%rdx), %xmm1
	movups	%xmm0, 97(%rsi)
	movups	%xmm1, 113(%rsi)
	cmpl	$128, %edi
	je	LBB3_16
## %bb.13:
	movups	128(%rdx), %xmm0
	movups	144(%rdx), %xmm1
	movups	%xmm0, 129(%rsi)
	movups	%xmm1, 145(%rsi)
	cmpl	$160, %edi
	je	LBB3_16
## %bb.14:
	movups	160(%rdx), %xmm0
	movups	176(%rdx), %xmm1
	movups	%xmm0, 161(%rsi)
	movups	%xmm1, 177(%rsi)
	cmpl	$192, %edi
	je	LBB3_16
## %bb.15:
	movups	192(%rdx), %xmm0
	movups	208(%rdx), %xmm1
	movups	%xmm0, 193(%rsi)
	movups	%xmm1, 209(%rsi)
LBB3_16:
	cmpq	%r10, %rdi
	je	LBB3_25
## %bb.17:
	testb	$24, %r10b
	je	LBB3_21
LBB3_18:
	movq	%rdi, %rcx
	movl	%r10d, %edi
	andl	$-8, %edi
	.p2align	4, 0x90
LBB3_19:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rdx,%rcx), %rax
	movq	%rax, 1(%rsi,%rcx)
	addq	$8, %rcx
	cmpq	%rcx, %rdi
	jne	LBB3_19
## %bb.20:
	cmpq	%r10, %rdi
	je	LBB3_25
	jmp	LBB3_21
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_value_string_to_string ## -- Begin function json_object_value_string_to_string
	.p2align	4, 0x90
_json_object_value_string_to_string:    ## @json_object_value_string_to_string
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movzbl	8(%rdi), %r10d
	movzbl	24(%rdi), %r8d
	movb	$34, (%rsi)
	testl	%r10d, %r10d
	je	LBB4_24
## %bb.1:
	movq	(%rdi), %rax
	cmpb	$8, %r10b
	jb	LBB4_2
## %bb.3:
	leaq	1(%rsi), %rcx
	leaq	(%rax,%r10), %rdx
	cmpq	%rdx, %rcx
	jae	LBB4_6
## %bb.4:
	leaq	(%r10,%rsi), %rcx
	addq	$1, %rcx
	cmpq	%rcx, %rax
	jae	LBB4_6
LBB4_2:
	xorl	%edx, %edx
LBB4_20:
	movq	%rdx, %r9
	notq	%r9
	addq	%r10, %r9
	movq	%r10, %rbx
	andq	$3, %rbx
	je	LBB4_22
	.p2align	4, 0x90
LBB4_21:                                ## =>This Inner Loop Header: Depth=1
	movzbl	(%rax,%rdx), %ecx
	movb	%cl, 1(%rsi,%rdx)
	addq	$1, %rdx
	addq	$-1, %rbx
	jne	LBB4_21
LBB4_22:
	cmpq	$3, %r9
	jb	LBB4_24
	.p2align	4, 0x90
LBB4_23:                                ## =>This Inner Loop Header: Depth=1
	movzbl	(%rax,%rdx), %ecx
	movb	%cl, 1(%rsi,%rdx)
	movzbl	1(%rax,%rdx), %ecx
	movb	%cl, 2(%rsi,%rdx)
	movzbl	2(%rax,%rdx), %ecx
	movb	%cl, 3(%rsi,%rdx)
	movzbl	3(%rax,%rdx), %ecx
	movb	%cl, 4(%rsi,%rdx)
	addq	$4, %rdx
	cmpq	%rdx, %r10
	jne	LBB4_23
LBB4_24:
	leaq	4(%r10), %r9
	movb	$34, 1(%r10,%rsi)
	movb	$58, 2(%r10,%rsi)
	movb	$34, 3(%r10,%rsi)
	testq	%r8, %r8
	je	LBB4_50
## %bb.25:
	movq	16(%rdi), %r11
	cmpb	$8, %r8b
	jb	LBB4_26
## %bb.27:
	leaq	(%r10,%rsi), %rax
	addq	$4, %rax
	leaq	(%r11,%r8), %rcx
	cmpq	%rcx, %rax
	jae	LBB4_30
## %bb.28:
	leaq	(%r8,%r10), %rax
	addq	%rsi, %rax
	addq	$4, %rax
	cmpq	%rax, %r11
	jae	LBB4_30
LBB4_26:
	xorl	%eax, %eax
LBB4_44:
	movq	%rax, %r14
	notq	%r14
	addq	%r8, %r14
	movq	%r8, %rdx
	andq	$3, %rdx
	je	LBB4_47
## %bb.45:
	movl	%r10d, %edi
	addq	$4, %rdi
	.p2align	4, 0x90
LBB4_46:                                ## =>This Inner Loop Header: Depth=1
	movzbl	(%r11,%rax), %ebx
	leal	(%rdi,%rax), %ecx
	movb	%bl, (%rsi,%rcx)
	addq	$1, %rax
	addq	$-1, %rdx
	jne	LBB4_46
LBB4_47:
	cmpq	$3, %r14
	jb	LBB4_50
## %bb.48:
	addq	$3, %r11
	leaq	7(%r10), %r14
	leaq	6(%r10), %r15
	leaq	5(%r10), %rdi
	movq	%r9, %rdx
	movq	%r8, %rbx
	.p2align	4, 0x90
LBB4_49:                                ## =>This Inner Loop Header: Depth=1
	movzbl	-3(%r11,%rax), %r10d
	leal	(%rax,%rdx), %ecx
	movb	%r10b, (%rsi,%rcx)
	movzbl	-2(%r11,%rax), %r10d
	leal	(%rdi,%rax), %ecx
	movb	%r10b, (%rsi,%rcx)
	movzbl	-1(%r11,%rax), %r10d
	leal	(%r15,%rax), %ecx
	movb	%r10b, (%rsi,%rcx)
	movzbl	(%r11,%rax), %r10d
	leal	(%r14,%rax), %ecx
	movb	%r10b, (%rsi,%rcx)
	addq	$-4, %rbx
	addq	$4, %r11
	addq	$4, %r14
	addq	$4, %r15
	addq	$4, %rdx
	addq	$4, %rdi
	cmpq	%rbx, %rax
	jne	LBB4_49
LBB4_50:
	movl	%r9d, %eax
	addq	%r8, %rax
	movw	$34, (%rsi,%rax)
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB4_6:
	cmpb	$32, %r10b
	jae	LBB4_8
## %bb.7:
	xorl	%edx, %edx
	jmp	LBB4_17
LBB4_30:
	cmpb	$32, %r8b
	jae	LBB4_32
## %bb.31:
	xorl	%eax, %eax
	jmp	LBB4_41
LBB4_8:
	movl	%r10d, %edx
	andl	$-32, %edx
	movups	(%rax), %xmm0
	movups	16(%rax), %xmm1
	movups	%xmm0, 1(%rsi)
	movups	%xmm1, 17(%rsi)
	cmpq	$32, %rdx
	je	LBB4_15
## %bb.9:
	movups	32(%rax), %xmm0
	movups	48(%rax), %xmm1
	movups	%xmm0, 33(%rsi)
	movups	%xmm1, 49(%rsi)
	cmpl	$64, %edx
	je	LBB4_15
## %bb.10:
	movups	64(%rax), %xmm0
	movups	80(%rax), %xmm1
	movups	%xmm0, 65(%rsi)
	movups	%xmm1, 81(%rsi)
	cmpl	$96, %edx
	je	LBB4_15
## %bb.11:
	movups	96(%rax), %xmm0
	movups	112(%rax), %xmm1
	movups	%xmm0, 97(%rsi)
	movups	%xmm1, 113(%rsi)
	cmpl	$128, %edx
	je	LBB4_15
## %bb.12:
	movups	128(%rax), %xmm0
	movups	144(%rax), %xmm1
	movups	%xmm0, 129(%rsi)
	movups	%xmm1, 145(%rsi)
	cmpl	$160, %edx
	je	LBB4_15
## %bb.13:
	movups	160(%rax), %xmm0
	movups	176(%rax), %xmm1
	movups	%xmm0, 161(%rsi)
	movups	%xmm1, 177(%rsi)
	cmpl	$192, %edx
	je	LBB4_15
## %bb.14:
	movups	192(%rax), %xmm0
	movups	208(%rax), %xmm1
	movups	%xmm0, 193(%rsi)
	movups	%xmm1, 209(%rsi)
LBB4_15:
	cmpq	%r10, %rdx
	je	LBB4_24
## %bb.16:
	testb	$24, %r10b
	je	LBB4_20
LBB4_17:
	movq	%rdx, %rcx
	movl	%r10d, %edx
	andl	$-8, %edx
	.p2align	4, 0x90
LBB4_18:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rax,%rcx), %rbx
	movq	%rbx, 1(%rsi,%rcx)
	addq	$8, %rcx
	cmpq	%rcx, %rdx
	jne	LBB4_18
## %bb.19:
	cmpq	%r10, %rdx
	je	LBB4_24
	jmp	LBB4_20
LBB4_32:
	movl	%r8d, %eax
	andl	$-32, %eax
	movups	(%r11), %xmm0
	movups	16(%r11), %xmm1
	movups	%xmm0, (%rsi,%r9)
	movups	%xmm1, 16(%rsi,%r9)
	cmpq	$32, %rax
	je	LBB4_39
## %bb.33:
	movups	32(%r11), %xmm0
	movups	48(%r11), %xmm1
	movups	%xmm0, 36(%r10,%rsi)
	movups	%xmm1, 52(%r10,%rsi)
	cmpl	$64, %eax
	je	LBB4_39
## %bb.34:
	movups	64(%r11), %xmm0
	movups	80(%r11), %xmm1
	movups	%xmm0, 68(%r10,%rsi)
	movups	%xmm1, 84(%r10,%rsi)
	cmpl	$96, %eax
	je	LBB4_39
## %bb.35:
	movups	96(%r11), %xmm0
	movups	112(%r11), %xmm1
	movups	%xmm0, 100(%r10,%rsi)
	movups	%xmm1, 116(%r10,%rsi)
	cmpl	$128, %eax
	je	LBB4_39
## %bb.36:
	movups	128(%r11), %xmm0
	movups	144(%r11), %xmm1
	movups	%xmm0, 132(%r10,%rsi)
	movups	%xmm1, 148(%r10,%rsi)
	cmpl	$160, %eax
	je	LBB4_39
## %bb.37:
	movups	160(%r11), %xmm0
	movups	176(%r11), %xmm1
	movups	%xmm0, 164(%r10,%rsi)
	movups	%xmm1, 180(%r10,%rsi)
	cmpl	$192, %eax
	je	LBB4_39
## %bb.38:
	movups	192(%r11), %xmm0
	movups	208(%r11), %xmm1
	movups	%xmm0, 196(%r10,%rsi)
	movups	%xmm1, 212(%r10,%rsi)
LBB4_39:
	cmpq	%r8, %rax
	je	LBB4_50
## %bb.40:
	testb	$24, %r8b
	je	LBB4_44
LBB4_41:
	movq	%rax, %rcx
	movl	%r8d, %eax
	andl	$-8, %eax
	.p2align	4, 0x90
LBB4_42:                                ## =>This Inner Loop Header: Depth=1
	movq	(%r11,%rcx), %rdx
	leal	(%r9,%rcx), %edi
	movq	%rdx, (%rsi,%rdi)
	addq	$8, %rcx
	cmpq	%rcx, %rax
	jne	LBB4_42
## %bb.43:
	cmpq	%r8, %rax
	je	LBB4_50
	jmp	LBB4_44
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_value_number_to_string ## -- Begin function json_object_value_number_to_string
	.p2align	4, 0x90
_json_object_value_number_to_string:    ## @json_object_value_number_to_string
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movzbl	8(%rdi), %r10d
	movzbl	24(%rdi), %r8d
	movb	$34, (%rsi)
	testl	%r10d, %r10d
	je	LBB5_24
## %bb.1:
	movq	(%rdi), %rax
	cmpb	$8, %r10b
	jb	LBB5_2
## %bb.3:
	leaq	1(%rsi), %rcx
	leaq	(%rax,%r10), %rdx
	cmpq	%rdx, %rcx
	jae	LBB5_6
## %bb.4:
	leaq	(%r10,%rsi), %rcx
	addq	$1, %rcx
	cmpq	%rcx, %rax
	jae	LBB5_6
LBB5_2:
	xorl	%edx, %edx
LBB5_20:
	movq	%rdx, %r9
	notq	%r9
	addq	%r10, %r9
	movq	%r10, %rbx
	andq	$3, %rbx
	je	LBB5_22
	.p2align	4, 0x90
LBB5_21:                                ## =>This Inner Loop Header: Depth=1
	movzbl	(%rax,%rdx), %ecx
	movb	%cl, 1(%rsi,%rdx)
	addq	$1, %rdx
	addq	$-1, %rbx
	jne	LBB5_21
LBB5_22:
	cmpq	$3, %r9
	jb	LBB5_24
	.p2align	4, 0x90
LBB5_23:                                ## =>This Inner Loop Header: Depth=1
	movzbl	(%rax,%rdx), %ecx
	movb	%cl, 1(%rsi,%rdx)
	movzbl	1(%rax,%rdx), %ecx
	movb	%cl, 2(%rsi,%rdx)
	movzbl	2(%rax,%rdx), %ecx
	movb	%cl, 3(%rsi,%rdx)
	movzbl	3(%rax,%rdx), %ecx
	movb	%cl, 4(%rsi,%rdx)
	addq	$4, %rdx
	cmpq	%rdx, %r10
	jne	LBB5_23
LBB5_24:
	leaq	3(%r10), %r9
	movb	$34, 1(%r10,%rsi)
	movb	$58, 2(%r10,%rsi)
	testq	%r8, %r8
	je	LBB5_50
## %bb.25:
	movq	16(%rdi), %r11
	cmpb	$8, %r8b
	jb	LBB5_26
## %bb.27:
	leaq	(%r10,%rsi), %rax
	addq	$3, %rax
	leaq	(%r11,%r8), %rcx
	cmpq	%rcx, %rax
	jae	LBB5_30
## %bb.28:
	leaq	(%r8,%r10), %rax
	addq	%rsi, %rax
	addq	$3, %rax
	cmpq	%rax, %r11
	jae	LBB5_30
LBB5_26:
	xorl	%eax, %eax
LBB5_44:
	movq	%rax, %r14
	notq	%r14
	addq	%r8, %r14
	movq	%r8, %rdx
	andq	$3, %rdx
	je	LBB5_47
## %bb.45:
	movl	%r10d, %edi
	addq	$3, %rdi
	.p2align	4, 0x90
LBB5_46:                                ## =>This Inner Loop Header: Depth=1
	movzbl	(%r11,%rax), %ebx
	leal	(%rdi,%rax), %ecx
	movb	%bl, (%rsi,%rcx)
	addq	$1, %rax
	addq	$-1, %rdx
	jne	LBB5_46
LBB5_47:
	cmpq	$3, %r14
	jb	LBB5_50
## %bb.48:
	addq	$3, %r11
	leaq	6(%r10), %r14
	leaq	5(%r10), %r15
	leaq	4(%r10), %rdi
	movq	%r9, %rdx
	movq	%r8, %rbx
	.p2align	4, 0x90
LBB5_49:                                ## =>This Inner Loop Header: Depth=1
	movzbl	-3(%r11,%rax), %r10d
	leal	(%rax,%rdx), %ecx
	movb	%r10b, (%rsi,%rcx)
	movzbl	-2(%r11,%rax), %r10d
	leal	(%rdi,%rax), %ecx
	movb	%r10b, (%rsi,%rcx)
	movzbl	-1(%r11,%rax), %r10d
	leal	(%r15,%rax), %ecx
	movb	%r10b, (%rsi,%rcx)
	movzbl	(%r11,%rax), %r10d
	leal	(%r14,%rax), %ecx
	movb	%r10b, (%rsi,%rcx)
	addq	$-4, %rbx
	addq	$4, %r11
	addq	$4, %r14
	addq	$4, %r15
	addq	$4, %rdx
	addq	$4, %rdi
	cmpq	%rbx, %rax
	jne	LBB5_49
LBB5_50:
	movl	%r9d, %eax
	addq	%r8, %rax
	movb	$0, (%rsi,%rax)
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB5_6:
	cmpb	$32, %r10b
	jae	LBB5_8
## %bb.7:
	xorl	%edx, %edx
	jmp	LBB5_17
LBB5_30:
	cmpb	$32, %r8b
	jae	LBB5_32
## %bb.31:
	xorl	%eax, %eax
	jmp	LBB5_41
LBB5_8:
	movl	%r10d, %edx
	andl	$-32, %edx
	movups	(%rax), %xmm0
	movups	16(%rax), %xmm1
	movups	%xmm0, 1(%rsi)
	movups	%xmm1, 17(%rsi)
	cmpq	$32, %rdx
	je	LBB5_15
## %bb.9:
	movups	32(%rax), %xmm0
	movups	48(%rax), %xmm1
	movups	%xmm0, 33(%rsi)
	movups	%xmm1, 49(%rsi)
	cmpl	$64, %edx
	je	LBB5_15
## %bb.10:
	movups	64(%rax), %xmm0
	movups	80(%rax), %xmm1
	movups	%xmm0, 65(%rsi)
	movups	%xmm1, 81(%rsi)
	cmpl	$96, %edx
	je	LBB5_15
## %bb.11:
	movups	96(%rax), %xmm0
	movups	112(%rax), %xmm1
	movups	%xmm0, 97(%rsi)
	movups	%xmm1, 113(%rsi)
	cmpl	$128, %edx
	je	LBB5_15
## %bb.12:
	movups	128(%rax), %xmm0
	movups	144(%rax), %xmm1
	movups	%xmm0, 129(%rsi)
	movups	%xmm1, 145(%rsi)
	cmpl	$160, %edx
	je	LBB5_15
## %bb.13:
	movups	160(%rax), %xmm0
	movups	176(%rax), %xmm1
	movups	%xmm0, 161(%rsi)
	movups	%xmm1, 177(%rsi)
	cmpl	$192, %edx
	je	LBB5_15
## %bb.14:
	movups	192(%rax), %xmm0
	movups	208(%rax), %xmm1
	movups	%xmm0, 193(%rsi)
	movups	%xmm1, 209(%rsi)
LBB5_15:
	cmpq	%r10, %rdx
	je	LBB5_24
## %bb.16:
	testb	$24, %r10b
	je	LBB5_20
LBB5_17:
	movq	%rdx, %rcx
	movl	%r10d, %edx
	andl	$-8, %edx
	.p2align	4, 0x90
LBB5_18:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rax,%rcx), %rbx
	movq	%rbx, 1(%rsi,%rcx)
	addq	$8, %rcx
	cmpq	%rcx, %rdx
	jne	LBB5_18
## %bb.19:
	cmpq	%r10, %rdx
	je	LBB5_24
	jmp	LBB5_20
LBB5_32:
	movl	%r8d, %eax
	andl	$-32, %eax
	movups	(%r11), %xmm0
	movups	16(%r11), %xmm1
	movups	%xmm0, (%rsi,%r9)
	movups	%xmm1, 16(%rsi,%r9)
	cmpq	$32, %rax
	je	LBB5_39
## %bb.33:
	movups	32(%r11), %xmm0
	movups	48(%r11), %xmm1
	movups	%xmm0, 35(%r10,%rsi)
	movups	%xmm1, 51(%r10,%rsi)
	cmpl	$64, %eax
	je	LBB5_39
## %bb.34:
	movups	64(%r11), %xmm0
	movups	80(%r11), %xmm1
	movups	%xmm0, 67(%r10,%rsi)
	movups	%xmm1, 83(%r10,%rsi)
	cmpl	$96, %eax
	je	LBB5_39
## %bb.35:
	movups	96(%r11), %xmm0
	movups	112(%r11), %xmm1
	movups	%xmm0, 99(%r10,%rsi)
	movups	%xmm1, 115(%r10,%rsi)
	cmpl	$128, %eax
	je	LBB5_39
## %bb.36:
	movups	128(%r11), %xmm0
	movups	144(%r11), %xmm1
	movups	%xmm0, 131(%r10,%rsi)
	movups	%xmm1, 147(%r10,%rsi)
	cmpl	$160, %eax
	je	LBB5_39
## %bb.37:
	movups	160(%r11), %xmm0
	movups	176(%r11), %xmm1
	movups	%xmm0, 163(%r10,%rsi)
	movups	%xmm1, 179(%r10,%rsi)
	cmpl	$192, %eax
	je	LBB5_39
## %bb.38:
	movups	192(%r11), %xmm0
	movups	208(%r11), %xmm1
	movups	%xmm0, 195(%r10,%rsi)
	movups	%xmm1, 211(%r10,%rsi)
LBB5_39:
	cmpq	%r8, %rax
	je	LBB5_50
## %bb.40:
	testb	$24, %r8b
	je	LBB5_44
LBB5_41:
	movq	%rax, %rcx
	movl	%r8d, %eax
	andl	$-8, %eax
	.p2align	4, 0x90
LBB5_42:                                ## =>This Inner Loop Header: Depth=1
	movq	(%r11,%rcx), %rdx
	leal	(%r9,%rcx), %edi
	movq	%rdx, (%rsi,%rdi)
	addq	$8, %rcx
	cmpq	%rcx, %rax
	jne	LBB5_42
## %bb.43:
	cmpq	%r8, %rax
	je	LBB5_50
	jmp	LBB5_44
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_value_boolean_calculate_string_length ## -- Begin function json_object_value_boolean_calculate_string_length
	.p2align	4, 0x90
_json_object_value_boolean_calculate_string_length: ## @json_object_value_boolean_calculate_string_length
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	8(%rdi), %al
	cmpb	$1, 9(%rdi)
	adcb	$0, %al
	addb	$7, %al
	movzbl	%al, %eax
	movw	%ax, 10(%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_value_string_calculate_string_length ## -- Begin function json_object_value_string_calculate_string_length
	.p2align	4, 0x90
_json_object_value_string_calculate_string_length: ## @json_object_value_string_calculate_string_length
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	8(%rdi), %al
	addb	24(%rdi), %al
	addb	$5, %al
	movzbl	%al, %eax
	movw	%ax, 26(%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_parse_fixed_size_from_file ## -- Begin function json_object_parse_fixed_size_from_file
	.p2align	4, 0x90
_json_object_parse_fixed_size_from_file: ## @json_object_parse_fixed_size_from_file
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r8, -64(%rbp)                  ## 8-byte Spill
	movq	%rcx, -56(%rbp)                 ## 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r13
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	leaq	L_.str.2(%rip), %rsi
	callq	_fopen
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%esi, %esi
	movl	$2, %edx
	callq	_fseek
	movq	%rbx, %rdi
	callq	_ftell
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	_rewind
	movq	%r14, %rax
	callq	____chkstk_darwin
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %r15
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rcx
	callq	_fread
	movq	%rbx, %rdi
	callq	_fclose
	addq	$-1, %r14
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%r13, %rdx
	movq	%r12, %rcx
	movq	-56(%rbp), %r8                  ## 8-byte Reload
	movq	-64(%rbp), %r9                  ## 8-byte Reload
	callq	_json_object_parse_fixed_size
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB8_2
## %bb.1:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB8_2:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_parse_fixed_size   ## -- Begin function json_object_parse_fixed_size
	.p2align	4, 0x90
_json_object_parse_fixed_size:          ## @json_object_parse_fixed_size
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$792, %rsp                      ## imm = 0x318
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, -800(%rbp)                 ## 8-byte Spill
	movq	%r8, %r14
	movq	%rdx, %rbx
	movq	%rsi, %r13
	movq	%rdi, %r12
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	shlq	$4, %rcx
	movq	%rcx, %rdi
	callq	_malloc
	movq	%rax, -752(%rbp)                ## 8-byte Spill
	shlq	$5, %rbx
	movq	%rbx, %rdi
	callq	_malloc
	movq	%rax, -760(%rbp)                ## 8-byte Spill
	shlq	$5, %r14
	movq	%r14, %rdi
	callq	_malloc
	movq	%rax, -784(%rbp)                ## 8-byte Spill
	cmpq	$2, %r13
	jb	LBB9_37
## %bb.1:
	leaq	1(%r12), %rax
	movq	%rax, -816(%rbp)                ## 8-byte Spill
	leaq	2(%r12), %rax
	movq	%rax, -768(%rbp)                ## 8-byte Spill
	leaq	-2(%r13), %rax
	movq	%rax, -808(%rbp)                ## 8-byte Spill
	movl	$1, %eax
	xorl	%ecx, %ecx
	movq	%rcx, -720(%rbp)                ## 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, -728(%rbp)                ## 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, -712(%rbp)                ## 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, -736(%rbp)                ## 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, -744(%rbp)                ## 8-byte Spill
	movq	%r12, -776(%rbp)                ## 8-byte Spill
	movq	%r13, -824(%rbp)                ## 8-byte Spill
	jmp	LBB9_5
LBB9_2:                                 ##   in Loop: Header=BB9_5 Depth=1
	xorl	%ecx, %ecx
LBB9_3:                                 ##   in Loop: Header=BB9_5 Depth=1
	movb	$0, -176(%rbp,%rcx)
	leaq	-176(%rbp), %r15
	movq	%r15, %rdi
	callq	_strlen
	movq	%rax, -728(%rbp)                ## 8-byte Spill
	movzbl	%al, %ebx
	movq	%rbx, %rdi
	callq	_malloc
	movq	%rax, -720(%rbp)                ## 8-byte Spill
	movq	%rax, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	_memcpy
	addq	%rbx, %r14
	movq	%r14, %rax
LBB9_4:                                 ##   in Loop: Header=BB9_5 Depth=1
	addq	$1, %rax
	cmpq	%r13, %rax
	jae	LBB9_38
LBB9_5:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB9_9 Depth 2
                                        ##     Child Loop BB9_30 Depth 2
                                        ##     Child Loop BB9_15 Depth 2
	movsbl	(%r12,%rax), %ecx
	cmpl	$58, %ecx
	je	LBB9_12
## %bb.6:                               ##   in Loop: Header=BB9_5 Depth=1
	cmpl	$34, %ecx
	jne	LBB9_4
## %bb.7:                               ##   in Loop: Header=BB9_5 Depth=1
	leaq	1(%rax), %r14
	cmpq	%r13, %r14
	jae	LBB9_2
## %bb.8:                               ##   in Loop: Header=BB9_5 Depth=1
	movq	%r13, %rdx
	subq	%r14, %rdx
	addq	-816(%rbp), %rax                ## 8-byte Folded Reload
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB9_9:                                 ##   Parent Loop BB9_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rax,%rcx), %ebx
	cmpb	$34, %bl
	je	LBB9_3
## %bb.10:                              ##   in Loop: Header=BB9_9 Depth=2
	movb	%bl, -176(%rbp,%rcx)
	addq	$1, %rcx
	cmpq	%rcx, %rdx
	jne	LBB9_9
## %bb.11:                              ##   in Loop: Header=BB9_5 Depth=1
	movq	%rdx, %rcx
	jmp	LBB9_3
	.p2align	4, 0x90
LBB9_12:                                ##   in Loop: Header=BB9_5 Depth=1
	leaq	1(%rax), %r15
	movb	1(%r12,%rax), %cl
	movsbl	%cl, %edx
	leal	-48(%rdx), %esi
	cmpl	$10, %esi
	jae	LBB9_21
LBB9_13:                                ##   in Loop: Header=BB9_5 Depth=1
	cmpq	%r13, %r15
	jae	LBB9_18
## %bb.14:                              ##   in Loop: Header=BB9_5 Depth=1
	subq	%r15, %r13
	movq	-808(%rbp), %rdi                ## 8-byte Reload
	subq	%rax, %rdi
	addq	-768(%rbp), %rax                ## 8-byte Folded Reload
	xorl	%esi, %esi
	movsbl	%cl, %ebx
	leal	-48(%rbx), %edx
	cmpl	$10, %edx
	jb	LBB9_15
	jmp	LBB9_17
	.p2align	4, 0x90
LBB9_16:                                ##   in Loop: Header=BB9_15 Depth=2
	movzbl	(%rax,%rsi), %ecx
	addq	$1, %rsi
	movsbl	%cl, %ebx
	leal	-48(%rbx), %edx
	cmpl	$10, %edx
	jb	LBB9_15
LBB9_17:                                ##   in Loop: Header=BB9_5 Depth=1
	addl	$-45, %ebx
	cmpl	$1, %ebx
	ja	LBB9_20
	.p2align	4, 0x90
LBB9_15:                                ##   Parent Loop BB9_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movb	%cl, -704(%rbp,%rsi)
	cmpq	%rsi, %rdi
	jne	LBB9_16
## %bb.19:                              ##   in Loop: Header=BB9_5 Depth=1
	movq	%r13, %rsi
	jmp	LBB9_20
LBB9_18:                                ##   in Loop: Header=BB9_5 Depth=1
	xorl	%esi, %esi
LBB9_20:                                ##   in Loop: Header=BB9_5 Depth=1
	movb	$0, -704(%rbp,%rsi)
	leaq	-704(%rbp), %r13
	movq	%r13, %rdi
	callq	_strlen
	movq	%rax, %rbx
	movzbl	%bl, %r14d
	movq	%r14, %rdi
	callq	_malloc
	movq	%rax, %r12
	movq	%rax, %rdi
	movq	%r13, %rsi
	movq	%r14, %rdx
	callq	_memcpy
	movq	-728(%rbp), %rdi                ## 8-byte Reload
	movzbl	%dil, %eax
	movzbl	%bl, %ecx
	addl	%ecx, %eax
	addl	$4, %eax
	movq	-744(%rbp), %rsi                ## 8-byte Reload
	movq	%rsi, %rcx
	shlq	$5, %rcx
	movq	-784(%rbp), %rdx                ## 8-byte Reload
	movq	-720(%rbp), %rbx                ## 8-byte Reload
	movq	%rbx, (%rdx,%rcx)
	movb	%dil, 8(%rdx,%rcx)
	movq	%r12, 16(%rdx,%rcx)
	movb	%r14b, 24(%rdx,%rcx)
	movw	%ax, 26(%rdx,%rcx)
	addq	$1, %rsi
	movq	%rsi, -744(%rbp)                ## 8-byte Spill
	addq	%r14, %r15
	movq	%r15, %rax
	movq	-776(%rbp), %r12                ## 8-byte Reload
	movq	-824(%rbp), %r13                ## 8-byte Reload
	jmp	LBB9_4
LBB9_21:                                ##   in Loop: Header=BB9_5 Depth=1
	cmpl	$101, %edx
	jg	LBB9_25
## %bb.22:                              ##   in Loop: Header=BB9_5 Depth=1
	cmpl	$34, %edx
	je	LBB9_28
## %bb.23:                              ##   in Loop: Header=BB9_5 Depth=1
	cmpl	$45, %edx
	je	LBB9_13
	jmp	LBB9_24
LBB9_25:                                ##   in Loop: Header=BB9_5 Depth=1
	cmpl	$102, %edx
	je	LBB9_33
## %bb.26:                              ##   in Loop: Header=BB9_5 Depth=1
	cmpl	$116, %edx
	jne	LBB9_24
## %bb.27:                              ##   in Loop: Header=BB9_5 Depth=1
	movq	-728(%rbp), %r8                 ## 8-byte Reload
	movzbl	%r8b, %ecx
	addl	$7, %ecx
	movq	-712(%rbp), %rdi                ## 8-byte Reload
	movq	%rdi, %rdx
	shlq	$4, %rdx
	movq	-752(%rbp), %rsi                ## 8-byte Reload
	movq	-720(%rbp), %rbx                ## 8-byte Reload
	movq	%rbx, (%rsi,%rdx)
	movb	%r8b, 8(%rsi,%rdx)
	movb	$1, 9(%rsi,%rdx)
	movw	%cx, 10(%rsi,%rdx)
	addq	$1, %rdi
	movq	%rdi, -712(%rbp)                ## 8-byte Spill
	addq	$5, %rax
	jmp	LBB9_4
LBB9_28:                                ##   in Loop: Header=BB9_5 Depth=1
	leaq	2(%rax), %rsi
	cmpq	%r13, %rsi
	movq	%rsi, -792(%rbp)                ## 8-byte Spill
	jae	LBB9_35
## %bb.29:                              ##   in Loop: Header=BB9_5 Depth=1
	movq	%r13, %rdx
	subq	%rsi, %rdx
	addq	-768(%rbp), %rax                ## 8-byte Folded Reload
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB9_30:                                ##   Parent Loop BB9_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rax,%rcx), %ebx
	cmpb	$34, %bl
	je	LBB9_36
## %bb.31:                              ##   in Loop: Header=BB9_30 Depth=2
	movb	%bl, -688(%rbp,%rcx)
	addq	$1, %rcx
	cmpq	%rcx, %rdx
	jne	LBB9_30
## %bb.32:                              ##   in Loop: Header=BB9_5 Depth=1
	movq	%rdx, %rcx
	jmp	LBB9_36
LBB9_33:                                ##   in Loop: Header=BB9_5 Depth=1
	movzbl	-728(%rbp), %ecx                ## 1-byte Folded Reload
	leal	8(%rcx), %r8d
	movq	-712(%rbp), %rbx                ## 8-byte Reload
	movq	%rbx, %rsi
	shlq	$4, %rsi
	movq	-752(%rbp), %rdi                ## 8-byte Reload
	movq	-720(%rbp), %rdx                ## 8-byte Reload
	movq	%rdx, (%rdi,%rsi)
	movb	%cl, 8(%rdi,%rsi)
	movb	$0, 9(%rdi,%rsi)
	movw	%r8w, 10(%rdi,%rsi)
	addq	$1, %rbx
	movq	%rbx, -712(%rbp)                ## 8-byte Spill
	addq	$6, %rax
	jmp	LBB9_4
LBB9_24:                                ##   in Loop: Header=BB9_5 Depth=1
	movq	%r15, %rax
	jmp	LBB9_4
LBB9_35:                                ##   in Loop: Header=BB9_5 Depth=1
	xorl	%ecx, %ecx
LBB9_36:                                ##   in Loop: Header=BB9_5 Depth=1
	movb	$0, -688(%rbp,%rcx)
	leaq	-688(%rbp), %r15
	movq	%r15, %rdi
	callq	_strlen
	movq	%rax, %r14
	movzbl	%r14b, %ebx
	movq	%rbx, %rdi
	callq	_malloc
	movq	%rax, %r12
	movq	%rax, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	_memcpy
	movq	-728(%rbp), %rax                ## 8-byte Reload
	movzbl	%al, %edx
	movzbl	%r14b, %r9d
	leal	(%r9,%rdx), %r8d
	addl	$5, %r8d
	movq	-736(%rbp), %rdi                ## 8-byte Reload
	movq	%rdi, %rdx
	shlq	$5, %rdx
	movq	-760(%rbp), %rsi                ## 8-byte Reload
	movq	-720(%rbp), %rcx                ## 8-byte Reload
	movq	%rcx, (%rsi,%rdx)
	movb	%al, 8(%rsi,%rdx)
	movq	%r12, 16(%rsi,%rdx)
	movb	%bl, 24(%rsi,%rdx)
	movw	%r8w, 26(%rsi,%rdx)
	addq	$1, %rdi
	movq	%rdi, -736(%rbp)                ## 8-byte Spill
	movq	-792(%rbp), %rax                ## 8-byte Reload
	addq	%r9, %rax
	addq	$1, %rax
	movq	-776(%rbp), %r12                ## 8-byte Reload
	jmp	LBB9_4
LBB9_37:
	xorl	%eax, %eax
	movq	%rax, -744(%rbp)                ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -736(%rbp)                ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -712(%rbp)                ## 8-byte Spill
LBB9_38:
	movq	-800(%rbp), %rax                ## 8-byte Reload
	movq	-712(%rbp), %rcx                ## 8-byte Reload
	movq	%rcx, (%rax)
	movq	-752(%rbp), %rcx                ## 8-byte Reload
	movq	%rcx, 8(%rax)
	movq	-736(%rbp), %rcx                ## 8-byte Reload
	movq	%rcx, 16(%rax)
	movq	-760(%rbp), %rcx                ## 8-byte Reload
	movq	%rcx, 24(%rax)
	movq	-744(%rbp), %rcx                ## 8-byte Reload
	movq	%rcx, 32(%rax)
	movq	-784(%rbp), %rcx                ## 8-byte Reload
	movq	%rcx, 40(%rax)
	movq	%r13, 48(%rax)
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB9_40
## %bb.39:
	addq	$792, %rsp                      ## imm = 0x318
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB9_40:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_get_boolean        ## -- Begin function json_object_get_boolean
	.p2align	4, 0x90
_json_object_get_boolean:               ## @json_object_get_boolean
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	(%rdi), %r15
	testq	%r15, %r15
	je	LBB10_5
## %bb.1:
	movq	%rsi, %r14
	movq	8(%rdi), %rbx
	.p2align	4, 0x90
LBB10_2:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rsi
	movq	%r14, %rdi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB10_3
## %bb.4:                               ##   in Loop: Header=BB10_2 Depth=1
	addq	$16, %rbx
	addq	$-1, %r15
	jne	LBB10_2
LBB10_5:
	xorl	%eax, %eax
	jmp	LBB10_6
LBB10_3:
	movb	9(%rbx), %al
	andb	$1, %al
LBB10_6:
                                        ## kill: def $al killed $al killed $eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_get_string         ## -- Begin function json_object_get_string
	.p2align	4, 0x90
_json_object_get_string:                ## @json_object_get_string
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	16(%rdi), %r12
	testq	%r12, %r12
	je	LBB11_1
## %bb.2:
	movq	%rsi, %r15
	movq	24(%rdi), %rbx
	addq	$16, %rbx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB11_3:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbx), %rsi
	movq	%r15, %rdi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB11_4
## %bb.5:                               ##   in Loop: Header=BB11_3 Depth=1
	addq	$32, %rbx
	addq	$-1, %r12
	jne	LBB11_3
	jmp	LBB11_6
LBB11_1:
	xorl	%r14d, %r14d
	jmp	LBB11_6
LBB11_4:
	movq	(%rbx), %r14
LBB11_6:
	movq	%r14, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_get_integer        ## -- Begin function json_object_get_integer
	.p2align	4, 0x90
_json_object_get_integer:               ## @json_object_get_integer
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	32(%rdi), %r12
	testq	%r12, %r12
	je	LBB12_1
## %bb.2:
	movq	%rsi, %r15
	movq	40(%rdi), %rbx
	addq	$16, %rbx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB12_3:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbx), %rsi
	movq	%r15, %rdi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB12_4
## %bb.5:                               ##   in Loop: Header=BB12_3 Depth=1
	addq	$32, %rbx
	addq	$-1, %r12
	jne	LBB12_3
	jmp	LBB12_6
LBB12_1:
	xorl	%r14d, %r14d
	jmp	LBB12_6
LBB12_4:
	movq	(%rbx), %r14
LBB12_6:
	movq	%r14, %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_strtol                         ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_get_float          ## -- Begin function json_object_get_float
	.p2align	4, 0x90
_json_object_get_float:                 ## @json_object_get_float
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	32(%rdi), %r12
	testq	%r12, %r12
	je	LBB13_1
## %bb.2:
	movq	%rsi, %r15
	movq	40(%rdi), %rbx
	addq	$16, %rbx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB13_3:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbx), %rsi
	movq	%r15, %rdi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB13_4
## %bb.5:                               ##   in Loop: Header=BB13_3 Depth=1
	addq	$32, %rbx
	addq	$-1, %r12
	jne	LBB13_3
	jmp	LBB13_6
LBB13_1:
	xorl	%r14d, %r14d
	jmp	LBB13_6
LBB13_4:
	movq	(%rbx), %r14
LBB13_6:
	movq	%r14, %rdi
	xorl	%esi, %esi
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_strtof                         ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_json_object_get_double         ## -- Begin function json_object_get_double
	.p2align	4, 0x90
_json_object_get_double:                ## @json_object_get_double
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	32(%rdi), %r12
	testq	%r12, %r12
	je	LBB14_1
## %bb.2:
	movq	%rsi, %r15
	movq	40(%rdi), %rbx
	addq	$16, %rbx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB14_3:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbx), %rsi
	movq	%r15, %rdi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB14_4
## %bb.5:                               ##   in Loop: Header=BB14_3 Depth=1
	addq	$32, %rbx
	addq	$-1, %r12
	jne	LBB14_3
	jmp	LBB14_6
LBB14_1:
	xorl	%r14d, %r14d
	jmp	LBB14_6
LBB14_4:
	movq	(%rbx), %r14
LBB14_6:
	movq	%r14, %rdi
	xorl	%esi, %esi
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_strtod                         ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"true"

L_.str.1:                               ## @.str.1
	.asciz	"false"

L_.str.2:                               ## @.str.2
	.asciz	"rb"

.subsections_via_symbols
