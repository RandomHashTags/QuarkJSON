	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	_quark_json_print               ## -- Begin function quark_json_print
	.p2align	4, 0x90
_quark_json_print:                      ## @quark_json_print
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
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	vpextrb	$1, %xmm0, %edx
	vpextrb	$2, %xmm0, %ecx
	vpextrb	$3, %xmm0, %r8d
	vpextrb	$4, %xmm0, %r9d
	vpextrb	$5, %xmm0, %eax
	movq	%rax, -72(%rbp)                 ## 8-byte Spill
	vpextrb	$6, %xmm0, %eax
	movq	%rax, -64(%rbp)                 ## 8-byte Spill
	vpextrb	$7, %xmm0, %eax
	movq	%rax, -56(%rbp)                 ## 8-byte Spill
	vpextrb	$8, %xmm0, %eax
	movq	%rax, -48(%rbp)                 ## 8-byte Spill
	vpextrb	$9, %xmm0, %r12d
	vpextrb	$10, %xmm0, %r13d
	vmovd	%xmm0, %eax
	vpextrb	$11, %xmm0, %r15d
	vpextrb	$12, %xmm0, %r14d
	movzbl	%al, %esi
	vpextrb	$13, %xmm0, %ebx
	vpextrb	$14, %xmm0, %r10d
	vpextrb	$15, %xmm0, %r11d
	subq	$8, %rsp
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	pushq	%r11
	pushq	%r10
	pushq	%rbx
	pushq	%r14
	pushq	%r15
	pushq	%r13
	pushq	%r12
	pushq	-48(%rbp)                       ## 8-byte Folded Reload
	pushq	-56(%rbp)                       ## 8-byte Folded Reload
	pushq	-64(%rbp)                       ## 8-byte Folded Reload
	pushq	-72(%rbp)                       ## 8-byte Folded Reload
	vzeroupper
	callq	_printf
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__const
	.p2align	5                               ## -- Begin function quark_json_test
LCPI1_0:
	.byte	123                             ## 0x7b
	.byte	34                              ## 0x22
	.byte	97                              ## 0x61
	.byte	114                             ## 0x72
	.byte	101                             ## 0x65
	.byte	32                              ## 0x20
	.byte	121                             ## 0x79
	.byte	111                             ## 0x6f
	.byte	117                             ## 0x75
	.byte	32                              ## 0x20
	.byte	107                             ## 0x6b
	.byte	105                             ## 0x69
	.byte	100                             ## 0x64
	.byte	100                             ## 0x64
	.byte	105                             ## 0x69
	.byte	110                             ## 0x6e
	.byte	103                             ## 0x67
	.byte	34                              ## 0x22
	.byte	58                              ## 0x3a
	.byte	34                              ## 0x22
	.byte	108                             ## 0x6c
	.byte	105                             ## 0x69
	.byte	108                             ## 0x6c
	.byte	39                              ## 0x27
	.byte	32                              ## 0x20
	.byte	98                              ## 0x62
	.byte	114                             ## 0x72
	.byte	111                             ## 0x6f
	.byte	111                             ## 0x6f
	.byte	63                              ## 0x3f
	.byte	34                              ## 0x22
	.byte	125                             ## 0x7d
LCPI1_1:
	.byte	0                               ## 0x0
	.byte	255                             ## 0xff
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	255                             ## 0xff
	.byte	0                               ## 0x0
	.byte	255                             ## 0xff
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	255                             ## 0xff
	.byte	0                               ## 0x0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_quark_json_test
	.p2align	4, 0x90
_quark_json_test:                       ## @quark_json_test
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	andq	$-32, %rsp
	subq	$96, %rsp
	vmovaps	LCPI1_0(%rip), %ymm0            ## ymm0 = [123,34,97,114,101,32,121,111,117,32,107,105,100,100,105,110,103,34,58,34,108,105,108,39,32,98,114,111,111,63,34,125]
	vmovaps	%ymm0, 32(%rsp)
	vmovaps	LCPI1_1(%rip), %ymm0            ## ymm0 = [0,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,0,255,0,0,0,0,0,0,0,0,0,0,255,0]
	vmovaps	%ymm0, (%rsp)
	leaq	32(%rsp), %rdi
	movq	%rsp, %rsi
	vzeroupper
	callq	_quark_json_parse_string_value
	movq	%rbp, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_quark_json_parse_string_value  ## -- Begin function quark_json_parse_string_value
	.p2align	4, 0x90
_quark_json_parse_string_value:         ## @quark_json_parse_string_value
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
	subq	$152, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	vmovups	(%rsi), %ymm0
	vmovups	%ymm0, -80(%rbp)
	vmovups	(%rdi), %ymm0
	vmovups	%ymm0, -112(%rbp)
	movb	$-1, %al
	movl	$-1, %r15d
	movl	$1, %ebx
	xorl	%ecx, %ecx
	jmp	LBB2_1
	.p2align	4, 0x90
LBB2_8:                                 ##   in Loop: Header=BB2_1 Depth=1
	movb	$0, -1(%r14,%rbx)
	testb	$1, -180(%rbp)                  ## 1-byte Folded Reload
	leaq	-176(%rbp), %rdi
	leaq	-144(%rbp), %rax
	cmoveq	%rax, %rdi
	movl	$32, %edx
	movq	%r14, %rsi
	vzeroupper
	callq	___strcpy_chk
	movb	$-1, %al
	movb	$1, %cl
	movq	-192(%rbp), %rsp                ## 8-byte Reload
LBB2_9:                                 ##   in Loop: Header=BB2_1 Depth=1
	incl	%r15d
	incq	%rbx
	cmpq	$33, %rbx
	je	LBB2_4
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpb	$0, -81(%rbp,%rbx)
	je	LBB2_9
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	cmpb	$-1, %al
	je	LBB2_3
## %bb.6:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	%ecx, -180(%rbp)                ## 4-byte Spill
	movq	%rsp, -192(%rbp)                ## 8-byte Spill
	leaq	-1(%rbx), %r13
	movsbq	%al, %r12
	movq	%rbx, %rax
	subq	%r12, %rax
	callq	____chkstk_darwin
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %r14
	cmpq	%r12, %r13
	jle	LBB2_8
## %bb.7:                               ##   in Loop: Header=BB2_1 Depth=1
	movsbl	%r12b, %eax
	leaq	(%r12,%rbp), %rsi
	addq	$-112, %rsi
	movl	%r15d, %edx
	subl	%eax, %edx
	incq	%rdx
	movq	%r14, %rdi
	vzeroupper
	callq	_memcpy
	jmp	LBB2_8
	.p2align	4, 0x90
LBB2_3:                                 ##   in Loop: Header=BB2_1 Depth=1
	movl	%ebx, %eax
	jmp	LBB2_9
LBB2_4:
	leaq	L_.str.1(%rip), %rdi
	leaq	-144(%rbp), %rsi
	leaq	-176(%rbp), %rdx
	xorl	%eax, %eax
	vzeroupper
	callq	_printf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB2_10
## %bb.5:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB2_10:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"quark_json_print; %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i\n"

L_.str.1:                               ## @.str.1
	.asciz	"quark_json_parse_string_value; key=%s, value=%s\n"

.subsections_via_symbols
