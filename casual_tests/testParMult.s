	.file	"testParMult.cpp"
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.text._ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv,"axG",@progbits,_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv,comdat
	.align 2
	.weak	_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv
	.type	_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv, @function
_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv:
.LFB1767:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1767:
	.size	_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv, .-_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv
	.section	.text._ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEC1IlvEERKT_,"axG",@progbits,_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEC1IlvEERKT_,comdat
	.align 2
	.weak	_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEC1IlvEERKT_
	.type	_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEC1IlvEERKT_, @function
_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEC1IlvEERKT_:
.LFB1771:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1771:
	.size	_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEC1IlvEERKT_, .-_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEC1IlvEERKT_
	.section	.text._ZN10TimerGuardC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERSo,"axG",@progbits,_ZN10TimerGuardC5ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERSo,comdat
	.align 2
	.weak	_ZN10TimerGuardC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERSo
	.type	_ZN10TimerGuardC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERSo, @function
_ZN10TimerGuardC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERSo:
.LFB1791:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rbx
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	%rax, (%rbx)
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EOS4_
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-24(%rbp), %rax
	movb	$0, 48(%rax)
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1791:
	.size	_ZN10TimerGuardC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERSo, .-_ZN10TimerGuardC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERSo
	.weak	_ZN10TimerGuardC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERSo
	.set	_ZN10TimerGuardC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERSo,_ZN10TimerGuardC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERSo
	.section	.text._ZN10TimerGuardD2Ev,"axG",@progbits,_ZN10TimerGuardD5Ev,comdat
	.align 2
	.weak	_ZN10TimerGuardD2Ev
	.type	_ZN10TimerGuardD2Ev, @function
_ZN10TimerGuardD2Ev:
.LFB1794:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1794
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	48(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L6
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN10TimerGuard4stopEv
.L6:
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1794:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table._ZN10TimerGuardD2Ev,"aG",@progbits,_ZN10TimerGuardD5Ev,comdat
.LLSDA1794:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1794-.LLSDACSB1794
.LLSDACSB1794:
.LLSDACSE1794:
	.section	.text._ZN10TimerGuardD2Ev,"axG",@progbits,_ZN10TimerGuardD5Ev,comdat
	.size	_ZN10TimerGuardD2Ev, .-_ZN10TimerGuardD2Ev
	.weak	_ZN10TimerGuardD1Ev
	.set	_ZN10TimerGuardD1Ev,_ZN10TimerGuardD2Ev
	.section	.text._ZN10TimerGuard4stopEv,"axG",@progbits,_ZN10TimerGuard4stopEv,comdat
	.align 2
	.weak	_ZN10TimerGuard4stopEv
	.type	_ZN10TimerGuard4stopEv, @function
_ZN10TimerGuard4stopEv:
.LFB1801:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6chronomiINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE
	movq	%rax, -24(%rbp)
	leaq	-24(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC1IlS1_ILl1ELl1000000000EEvEERKNS0_IT_T0_EE
	movq	-56(%rbp), %rax
	movq	40(%rax), %rax
	movq	-56(%rbp), %rdx
	addq	$8, %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	movl	$32, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	%rax, %rbx
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6chrono8durationIdSt5ratioILl1ELl1EEE5countEv
	movq	%rbx, %rdi
	call	_ZNSolsEd
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	movq	-56(%rbp), %rax
	movb	$1, 48(%rax)
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1801:
	.size	_ZN10TimerGuard4stopEv, .-_ZN10TimerGuard4stopEv
	.section	.rodata
	.align 4
	.type	_ZN9__gnu_cxxL21__default_lock_policyE, @object
	.size	_ZN9__gnu_cxxL21__default_lock_policyE, 4
_ZN9__gnu_cxxL21__default_lock_policyE:
	.long	2
	.type	_ZStL13allocator_arg, @object
	.size	_ZStL13allocator_arg, 1
_ZStL13allocator_arg:
	.zero	1
	.type	_ZStL6ignore, @object
	.size	_ZStL6ignore, 1
_ZStL6ignore:
	.zero	1
	.section	.text._ZNSt13random_deviceC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,"axG",@progbits,_ZNSt13random_deviceC5ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,comdat
	.align 2
	.weak	_ZNSt13random_deviceC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_ZNSt13random_deviceC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, @function
_ZNSt13random_deviceC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8380:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt13random_device7_M_initERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8380:
	.size	_ZNSt13random_deviceC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_ZNSt13random_deviceC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.weak	_ZNSt13random_deviceC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.set	_ZNSt13random_deviceC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,_ZNSt13random_deviceC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.text._ZNSt13random_deviceD2Ev,"axG",@progbits,_ZNSt13random_deviceD5Ev,comdat
	.align 2
	.weak	_ZNSt13random_deviceD2Ev
	.type	_ZNSt13random_deviceD2Ev, @function
_ZNSt13random_deviceD2Ev:
.LFB8383:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA8383
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt13random_device7_M_finiEv
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8383:
	.section	.gcc_except_table._ZNSt13random_deviceD2Ev,"aG",@progbits,_ZNSt13random_deviceD5Ev,comdat
.LLSDA8383:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8383-.LLSDACSB8383
.LLSDACSB8383:
.LLSDACSE8383:
	.section	.text._ZNSt13random_deviceD2Ev,"axG",@progbits,_ZNSt13random_deviceD5Ev,comdat
	.size	_ZNSt13random_deviceD2Ev, .-_ZNSt13random_deviceD2Ev
	.weak	_ZNSt13random_deviceD1Ev
	.set	_ZNSt13random_deviceD1Ev,_ZNSt13random_deviceD2Ev
	.section	.text._ZNSt13random_deviceclEv,"axG",@progbits,_ZNSt13random_deviceclEv,comdat
	.align 2
	.weak	_ZNSt13random_deviceclEv
	.type	_ZNSt13random_deviceclEv, @function
_ZNSt13random_deviceclEv:
.LFB8388:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt13random_device9_M_getvalEv
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8388:
	.size	_ZNSt13random_deviceclEv, .-_ZNSt13random_deviceclEv
	.section	.rodata
	.type	_ZStL10defer_lock, @object
	.size	_ZStL10defer_lock, 1
_ZStL10defer_lock:
	.zero	1
	.type	_ZStL11try_to_lock, @object
	.size	_ZStL11try_to_lock, 1
_ZStL11try_to_lock:
	.zero	1
	.type	_ZStL10adopt_lock, @object
	.size	_ZStL10adopt_lock, 1
_ZStL10adopt_lock:
	.zero	1
.LC0:
	.string	"../fullMultiply_par.hpp"
.LC1:
	.string	"lhs.size() == rhs.size()"
.LC2:
	.string	"carry == 0"
	.text
	.type	_ZL10addInPlaceRSt6vectorIjSaIjEERKS1_m, @function
_ZL10addInPlaceRSt6vectorIjSaIjEERKS1_m:
.LFB9058:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$80, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE4sizeEv
	movq	%rax, %rbx
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE4sizeEv
	cmpq	%rax, %rbx
	je	.L13
	movl	$_ZZL10addInPlaceRSt6vectorIjSaIjEERKS1_mE19__PRETTY_FUNCTION__, %ecx
	movl	$14, %edx
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	__assert_fail
.L13:
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE4sizeEv
	movq	%rax, -40(%rbp)
	movq	$0, -24(%rbp)
	movl	$4294967295, %eax
	movq	%rax, -48(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -32(%rbp)
.L17:
	movq	-32(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jnb	.L14
	movq	-32(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %ebx
	movq	-32(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %eax
	leaq	(%rbx,%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	%eax, %r12d
	movq	-48(%rbp), %rax
	movl	%eax, %ebx
	movq	-32(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movl	%r12d, %eax
	andl	%ebx, %eax
	movl	%eax, (%rdx)
	movq	-48(%rbp), %rax
	notq	%rax
	andq	-56(%rbp), %rax
	testq	%rax, %rax
	je	.L15
	movl	$1, %eax
	jmp	.L16
.L15:
	movl	$0, %eax
.L16:
	movq	%rax, -24(%rbp)
	addq	$1, -32(%rbp)
	jmp	.L17
.L14:
	cmpq	$0, -24(%rbp)
	je	.L19
	movl	$_ZZL10addInPlaceRSt6vectorIjSaIjEERKS1_mE19__PRETTY_FUNCTION__, %ecx
	movl	$24, %edx
	movl	$.LC0, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L19:
	nop
	addq	$80, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9058:
	.size	_ZL10addInPlaceRSt6vectorIjSaIjEERKS1_m, .-_ZL10addInPlaceRSt6vectorIjSaIjEERKS1_m
	.section	.text._ZN7BigUIntILm2048EED2Ev,"axG",@progbits,_ZN7BigUIntILm2048EED5Ev,comdat
	.align 2
	.weak	_ZN7BigUIntILm2048EED2Ev
	.type	_ZN7BigUIntILm2048EED2Ev, @function
_ZN7BigUIntILm2048EED2Ev:
.LFB9063:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEED1Ev
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9063:
	.size	_ZN7BigUIntILm2048EED2Ev, .-_ZN7BigUIntILm2048EED2Ev
	.weak	_ZN7BigUIntILm2048EED1Ev
	.set	_ZN7BigUIntILm2048EED1Ev,_ZN7BigUIntILm2048EED2Ev
	.section	.text._ZN7BigUIntILm4096EED2Ev,"axG",@progbits,_ZN7BigUIntILm4096EED5Ev,comdat
	.align 2
	.weak	_ZN7BigUIntILm4096EED2Ev
	.type	_ZN7BigUIntILm4096EED2Ev, @function
_ZN7BigUIntILm4096EED2Ev:
.LFB9069:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEED1Ev
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9069:
	.size	_ZN7BigUIntILm4096EED2Ev, .-_ZN7BigUIntILm4096EED2Ev
	.weak	_ZN7BigUIntILm4096EED1Ev
	.set	_ZN7BigUIntILm4096EED1Ev,_ZN7BigUIntILm4096EED2Ev
	.section	.text._ZN7BigUIntILm4096EEaSEOS0_,"axG",@progbits,_ZN7BigUIntILm4096EEaSEOS0_,comdat
	.align 2
	.weak	_ZN7BigUIntILm4096EEaSEOS0_
	.type	_ZN7BigUIntILm4096EEaSEOS0_, @function
_ZN7BigUIntILm4096EEaSEOS0_:
.LFB9074:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEaSEOS1_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9074:
	.size	_ZN7BigUIntILm4096EEaSEOS0_, .-_ZN7BigUIntILm4096EEaSEOS0_
	.section	.rodata
.LC3:
	.string	"serial:"
.LC4:
	.string	"simd:"
.LC5:
	.string	"\n"
.LC6:
	.string	"\nfailed.\n"
.LC7:
	.string	"ok\n"
	.text
	.type	_ZL5test1v, @function
_ZL5test1v:
.LFB9061:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9061
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$440, %rsp
	.cfi_offset 3, -24
	movq	$2048, -32(%rbp)
	movl	$0, -20(%rbp)
.L27:
	cmpl	$99, -20(%rbp)
	jg	.L48
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
.LEHB0:
	call	_ZN7BigUIntILm2048EE9randomGenEv
.LEHE0:
	leaq	-320(%rbp), %rax
	movq	%rax, %rdi
.LEHB1:
	call	_ZN7BigUIntILm2048EE9randomGenEv
.LEHE1:
	leaq	-352(%rbp), %rax
	movq	%rax, %rdi
.LEHB2:
	call	_ZN7BigUIntILm4096EEC1Ev
.LEHE2:
	leaq	-384(%rbp), %rax
	movq	%rax, %rdi
.LEHB3:
	call	_ZN7BigUIntILm4096EEC1Ev
.LEHE3:
	leaq	-209(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-209(%rbp), %rdx
	leaq	-256(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
.LEHB4:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE4:
	leaq	-256(%rbp), %rcx
	leaq	-448(%rbp), %rax
	movl	$_ZSt4cout, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN10TimerGuardC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERSo
	leaq	-256(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-209(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-208(%rbp), %rax
	leaq	-320(%rbp), %rdx
	leaq	-288(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB5:
	call	_Z12fullMultiplyILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE
.LEHE5:
	leaq	-208(%rbp), %rdx
	leaq	-352(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EEaSEOS0_
	leaq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EED1Ev
	leaq	-448(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN10TimerGuardD1Ev
	leaq	-129(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-129(%rbp), %rdx
	leaq	-176(%rbp), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
.LEHB6:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE6:
	leaq	-176(%rbp), %rcx
	leaq	-448(%rbp), %rax
	movl	$_ZSt4cout, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN10TimerGuardC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERSo
	leaq	-176(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-129(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-128(%rbp), %rax
	leaq	-320(%rbp), %rdx
	leaq	-288(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB7:
	call	_Z17fullMultiply_simdILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE
.LEHE7:
	leaq	-128(%rbp), %rdx
	leaq	-384(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EEaSEOS0_
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EED1Ev
	leaq	-448(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN10TimerGuardD1Ev
	leaq	-384(%rbp), %rdx
	leaq	-352(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB8:
	call	_ZNK7BigUIntILm4096EEneERKS0_
	testb	%al, %al
	je	.L26
	leaq	-96(%rbp), %rax
	leaq	-352(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm4096EE5toDecB5cxx11Ev
.LEHE8:
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
.LEHB9:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rbx
	leaq	-64(%rbp), %rax
	leaq	-384(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm4096EE5toDecB5cxx11Ev
.LEHE9:
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB10:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	movl	$.LC6, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
.LEHE10:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	movl	$1, %edi
	call	exit
.L26:
	movl	$.LC7, %esi
	movl	$_ZSt4cout, %edi
.LEHB11:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
.LEHE11:
	leaq	-384(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EED1Ev
	leaq	-352(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EED1Ev
	leaq	-320(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm2048EED1Ev
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm2048EED1Ev
	addl	$1, -20(%rbp)
	jmp	.L27
.L41:
	movq	%rax, %rbx
	leaq	-209(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L29
.L42:
	movq	%rax, %rbx
	leaq	-448(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN10TimerGuardD1Ev
	jmp	.L29
.L44:
	movq	%rax, %rbx
	leaq	-129(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L29
.L45:
	movq	%rax, %rbx
	leaq	-448(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN10TimerGuardD1Ev
	jmp	.L29
.L47:
	movq	%rax, %rbx
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L34
.L46:
	movq	%rax, %rbx
.L34:
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L29
.L43:
	movq	%rax, %rbx
.L29:
	leaq	-384(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EED1Ev
	jmp	.L35
.L40:
	movq	%rax, %rbx
.L35:
	leaq	-352(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EED1Ev
	jmp	.L36
.L39:
	movq	%rax, %rbx
.L36:
	leaq	-320(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm2048EED1Ev
	jmp	.L37
.L38:
	movq	%rax, %rbx
.L37:
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm2048EED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB12:
	call	_Unwind_Resume
.LEHE12:
.L48:
	nop
	addq	$440, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9061:
	.section	.gcc_except_table,"a",@progbits
.LLSDA9061:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9061-.LLSDACSB9061
.LLSDACSB9061:
	.uleb128 .LEHB0-.LFB9061
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB9061
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L38-.LFB9061
	.uleb128 0
	.uleb128 .LEHB2-.LFB9061
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L39-.LFB9061
	.uleb128 0
	.uleb128 .LEHB3-.LFB9061
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L40-.LFB9061
	.uleb128 0
	.uleb128 .LEHB4-.LFB9061
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L41-.LFB9061
	.uleb128 0
	.uleb128 .LEHB5-.LFB9061
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L42-.LFB9061
	.uleb128 0
	.uleb128 .LEHB6-.LFB9061
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L44-.LFB9061
	.uleb128 0
	.uleb128 .LEHB7-.LFB9061
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L45-.LFB9061
	.uleb128 0
	.uleb128 .LEHB8-.LFB9061
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L43-.LFB9061
	.uleb128 0
	.uleb128 .LEHB9-.LFB9061
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L46-.LFB9061
	.uleb128 0
	.uleb128 .LEHB10-.LFB9061
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L47-.LFB9061
	.uleb128 0
	.uleb128 .LEHB11-.LFB9061
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L43-.LFB9061
	.uleb128 0
	.uleb128 .LEHB12-.LFB9061
	.uleb128 .LEHE12-.LEHB12
	.uleb128 0
	.uleb128 0
.LLSDACSE9061:
	.text
	.size	_ZL5test1v, .-_ZL5test1v
	.section	.text._ZN7BigUIntILm128EED2Ev,"axG",@progbits,_ZN7BigUIntILm128EED5Ev,comdat
	.align 2
	.weak	_ZN7BigUIntILm128EED2Ev
	.type	_ZN7BigUIntILm128EED2Ev, @function
_ZN7BigUIntILm128EED2Ev:
.LFB9077:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEED1Ev
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9077:
	.size	_ZN7BigUIntILm128EED2Ev, .-_ZN7BigUIntILm128EED2Ev
	.weak	_ZN7BigUIntILm128EED1Ev
	.set	_ZN7BigUIntILm128EED1Ev,_ZN7BigUIntILm128EED2Ev
	.section	.text._ZN7BigUIntILm256EED2Ev,"axG",@progbits,_ZN7BigUIntILm256EED5Ev,comdat
	.align 2
	.weak	_ZN7BigUIntILm256EED2Ev
	.type	_ZN7BigUIntILm256EED2Ev, @function
_ZN7BigUIntILm256EED2Ev:
.LFB9083:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEED1Ev
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9083:
	.size	_ZN7BigUIntILm256EED2Ev, .-_ZN7BigUIntILm256EED2Ev
	.weak	_ZN7BigUIntILm256EED1Ev
	.set	_ZN7BigUIntILm256EED1Ev,_ZN7BigUIntILm256EED2Ev
	.section	.rodata
	.align 8
.LC8:
	.string	"00000001000000020000000300000004"
.LC9:
	.string	"4"
	.text
	.type	_ZL5test0v, @function
_ZL5test0v:
.LFB9075:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9075
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$360, %rsp
	.cfi_offset 3, -24
	leaq	-193(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-193(%rbp), %rdx
	leaq	-240(%rbp), %rax
	movl	$.LC8, %esi
	movq	%rax, %rdi
.LEHB13:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE13:
	leaq	-272(%rbp), %rax
	leaq	-240(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB14:
	call	_ZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE14:
	leaq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-193(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-145(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-145(%rbp), %rdx
	leaq	-192(%rbp), %rax
	movl	$.LC9, %esi
	movq	%rax, %rdi
.LEHB15:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE15:
	leaq	-304(%rbp), %rax
	leaq	-192(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB16:
	call	_ZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE16:
	leaq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-145(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-144(%rbp), %rax
	leaq	-272(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB17:
	call	_ZNK7BigUIntILm128EE5toHexB5cxx11Ev
.LEHE17:
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
.LEHB18:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rbx
	leaq	-112(%rbp), %rax
	leaq	-304(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm128EE5toHexB5cxx11Ev
.LEHE18:
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB19:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
.LEHE19:
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-336(%rbp), %rax
	leaq	-304(%rbp), %rdx
	leaq	-272(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB20:
	call	_Z12fullMultiplyILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE
.LEHE20:
	leaq	-368(%rbp), %rax
	leaq	-304(%rbp), %rdx
	leaq	-272(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB21:
	call	_Z17fullMultiply_simdILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE
.LEHE21:
	leaq	-80(%rbp), %rax
	leaq	-336(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB22:
	call	_ZNK7BigUIntILm256EE5toHexB5cxx11Ev
.LEHE22:
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
.LEHB23:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rbx
	leaq	-48(%rbp), %rax
	leaq	-368(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm256EE5toHexB5cxx11Ev
.LEHE23:
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB24:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
.LEHE24:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-368(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EED1Ev
	leaq	-336(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EED1Ev
	leaq	-304(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	leaq	-272(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	jmp	.L75
.L65:
	movq	%rax, %rbx
	leaq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L53
.L64:
	movq	%rax, %rbx
.L53:
	leaq	-193(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB25:
	call	_Unwind_Resume
.L67:
	movq	%rax, %rbx
	leaq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L55
.L66:
	movq	%rax, %rbx
.L55:
	leaq	-145(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L56
.L70:
	movq	%rax, %rbx
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L58
.L69:
	movq	%rax, %rbx
.L58:
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L59
.L74:
	movq	%rax, %rbx
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L61
.L73:
	movq	%rax, %rbx
.L61:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L62
.L72:
	movq	%rax, %rbx
.L62:
	leaq	-368(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EED1Ev
	jmp	.L63
.L71:
	movq	%rax, %rbx
.L63:
	leaq	-336(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EED1Ev
	jmp	.L59
.L68:
	movq	%rax, %rbx
.L59:
	leaq	-304(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
.L56:
	leaq	-272(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume
.LEHE25:
.L75:
	addq	$360, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9075:
	.section	.gcc_except_table
.LLSDA9075:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9075-.LLSDACSB9075
.LLSDACSB9075:
	.uleb128 .LEHB13-.LFB9075
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L64-.LFB9075
	.uleb128 0
	.uleb128 .LEHB14-.LFB9075
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L65-.LFB9075
	.uleb128 0
	.uleb128 .LEHB15-.LFB9075
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L66-.LFB9075
	.uleb128 0
	.uleb128 .LEHB16-.LFB9075
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L67-.LFB9075
	.uleb128 0
	.uleb128 .LEHB17-.LFB9075
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L68-.LFB9075
	.uleb128 0
	.uleb128 .LEHB18-.LFB9075
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L69-.LFB9075
	.uleb128 0
	.uleb128 .LEHB19-.LFB9075
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L70-.LFB9075
	.uleb128 0
	.uleb128 .LEHB20-.LFB9075
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L68-.LFB9075
	.uleb128 0
	.uleb128 .LEHB21-.LFB9075
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L71-.LFB9075
	.uleb128 0
	.uleb128 .LEHB22-.LFB9075
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L72-.LFB9075
	.uleb128 0
	.uleb128 .LEHB23-.LFB9075
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L73-.LFB9075
	.uleb128 0
	.uleb128 .LEHB24-.LFB9075
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L74-.LFB9075
	.uleb128 0
	.uleb128 .LEHB25-.LFB9075
	.uleb128 .LEHE25-.LEHB25
	.uleb128 0
	.uleb128 0
.LLSDACSE9075:
	.text
	.size	_ZL5test0v, .-_ZL5test0v
	.type	_ZL5test3v, @function
_ZL5test3v:
.LFB9088:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9088:
	.size	_ZL5test3v, .-_ZL5test3v
	.globl	main
	.type	main, @function
main:
.LFB9089:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	_ZL5test1v
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9089:
	.size	main, .-main
	.section	.text._ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE16time_since_epochEv,"axG",@progbits,_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE16time_since_epochEv,comdat
	.align 2
	.weak	_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE16time_since_epochEv
	.type	_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE16time_since_epochEv, @function
_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE16time_since_epochEv:
.LFB9326:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9326:
	.size	_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE16time_since_epochEv, .-_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE16time_since_epochEv
	.section	.text._ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_,"axG",@progbits,_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_,comdat
	.weak	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_
	.type	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_, @function
_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_:
.LFB9354:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9354:
	.size	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_, .-_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_
	.section	.text._ZNSt6chronomiINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE,"axG",@progbits,_ZNSt6chronomiINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE,comdat
	.weak	_ZNSt6chronomiINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE
	.type	_ZNSt6chronomiINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE, @function
_ZNSt6chronomiINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE:
.LFB9356:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE16time_since_epochEv
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE16time_since_epochEv
	movq	%rax, -8(%rbp)
	leaq	-16(%rbp), %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6chronomiIlSt5ratioILl1ELl1000000000EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9356:
	.size	_ZNSt6chronomiINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE, .-_ZNSt6chronomiINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE
	.section	.text._ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IlS1_ILl1ELl1000000000EEvEERKNS0_IT_T0_EE,"axG",@progbits,_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC5IlS1_ILl1ELl1000000000EEvEERKNS0_IT_T0_EE,comdat
	.align 2
	.weak	_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IlS1_ILl1ELl1000000000EEvEERKNS0_IT_T0_EE
	.type	_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IlS1_ILl1ELl1000000000EEvEERKNS0_IT_T0_EE, @function
_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IlS1_ILl1ELl1000000000EEvEERKNS0_IT_T0_EE:
.LFB9358:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6chrono13duration_castINS_8durationIdSt5ratioILl1ELl1EEEElS2_ILl1ELl1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE
	vmovq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	vmovsd	-40(%rbp), %xmm0
	vmovsd	%xmm0, -8(%rbp)
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6chrono8durationIdSt5ratioILl1ELl1EEE5countEv
	vmovq	%xmm0, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9358:
	.size	_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IlS1_ILl1ELl1000000000EEvEERKNS0_IT_T0_EE, .-_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IlS1_ILl1ELl1000000000EEvEERKNS0_IT_T0_EE
	.weak	_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC1IlS1_ILl1ELl1000000000EEvEERKNS0_IT_T0_EE
	.set	_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC1IlS1_ILl1ELl1000000000EEvEERKNS0_IT_T0_EE,_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IlS1_ILl1ELl1000000000EEvEERKNS0_IT_T0_EE
	.section	.text._ZNKSt6chrono8durationIdSt5ratioILl1ELl1EEE5countEv,"axG",@progbits,_ZNKSt6chrono8durationIdSt5ratioILl1ELl1EEE5countEv,comdat
	.align 2
	.weak	_ZNKSt6chrono8durationIdSt5ratioILl1ELl1EEE5countEv
	.type	_ZNKSt6chrono8durationIdSt5ratioILl1ELl1EEE5countEv, @function
_ZNKSt6chrono8durationIdSt5ratioILl1ELl1EEE5countEv:
.LFB9362:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	vmovsd	(%rax), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9362:
	.size	_ZNKSt6chrono8durationIdSt5ratioILl1ELl1EEE5countEv, .-_ZNKSt6chrono8durationIdSt5ratioILl1ELl1EEE5countEv
	.section	.text._ZNSt6vectorIjSaIjEED2Ev,"axG",@progbits,_ZNSt6vectorIjSaIjEED5Ev,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEED2Ev
	.type	_ZNSt6vectorIjSaIjEED2Ev, @function
_ZNSt6vectorIjSaIjEED2Ev:
.LFB9420:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9420
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZSt8_DestroyIPjjEvT_S1_RSaIT0_E
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEED2Ev
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9420:
	.section	.gcc_except_table
.LLSDA9420:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9420-.LLSDACSB9420
.LLSDACSB9420:
.LLSDACSE9420:
	.section	.text._ZNSt6vectorIjSaIjEED2Ev,"axG",@progbits,_ZNSt6vectorIjSaIjEED5Ev,comdat
	.size	_ZNSt6vectorIjSaIjEED2Ev, .-_ZNSt6vectorIjSaIjEED2Ev
	.weak	_ZNSt6vectorIjSaIjEED1Ev
	.set	_ZNSt6vectorIjSaIjEED1Ev,_ZNSt6vectorIjSaIjEED2Ev
	.section	.text._ZNKSt6vectorIjSaIjEE4sizeEv,"axG",@progbits,_ZNKSt6vectorIjSaIjEE4sizeEv,comdat
	.align 2
	.weak	_ZNKSt6vectorIjSaIjEE4sizeEv
	.type	_ZNKSt6vectorIjSaIjEE4sizeEv, @function
_ZNKSt6vectorIjSaIjEE4sizeEv:
.LFB9422:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	sarq	$2, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9422:
	.size	_ZNKSt6vectorIjSaIjEE4sizeEv, .-_ZNKSt6vectorIjSaIjEE4sizeEv
	.section	.text._ZNSt6vectorIjSaIjEEixEm,"axG",@progbits,_ZNSt6vectorIjSaIjEEixEm,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEEixEm
	.type	_ZNSt6vectorIjSaIjEEixEm, @function
_ZNSt6vectorIjSaIjEEixEm:
.LFB9437:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9437:
	.size	_ZNSt6vectorIjSaIjEEixEm, .-_ZNSt6vectorIjSaIjEEixEm
	.section	.text._ZNKSt6vectorIjSaIjEEixEm,"axG",@progbits,_ZNKSt6vectorIjSaIjEEixEm,comdat
	.align 2
	.weak	_ZNKSt6vectorIjSaIjEEixEm
	.type	_ZNKSt6vectorIjSaIjEEixEm, @function
_ZNKSt6vectorIjSaIjEEixEm:
.LFB9438:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9438:
	.size	_ZNKSt6vectorIjSaIjEEixEm, .-_ZNKSt6vectorIjSaIjEEixEm
	.section	.rodata
.LC10:
	.string	"default"
	.section	.text._ZN7BigUIntILm2048EE9randomGenEv,"axG",@progbits,_ZN7BigUIntILm2048EE9randomGenEv,comdat
	.weak	_ZN7BigUIntILm2048EE9randomGenEv
	.type	_ZN7BigUIntILm2048EE9randomGenEv, @function
_ZN7BigUIntILm2048EE9randomGenEv:
.LFB9439:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9439
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$5128, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -5128(%rbp)
	movq	-5128(%rbp), %rax
	movq	%rax, %rdi
.LEHB26:
	call	_ZN7BigUIntILm2048EEC1Ev
.LEHE26:
	leaq	-33(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-33(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movl	$.LC10, %esi
	movq	%rax, %rdi
.LEHB27:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE27:
	leaq	-80(%rbp), %rdx
	leaq	-5088(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB28:
	call	_ZNSt13random_deviceC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE28:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-33(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-5096(%rbp), %rax
	movl	$-1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
.LEHB29:
	call	_ZNSt24uniform_int_distributionIjEC1Ejj
	movq	-5128(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEE5beginEv
	movq	%rax, -5104(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEE3endEv
	movq	%rax, -5112(%rbp)
.L97:
	leaq	-5112(%rbp), %rdx
	leaq	-5104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxxneIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_
	testb	%al, %al
	je	.L108
	leaq	-5104(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEdeEv
	movq	%rax, -32(%rbp)
	leaq	-5088(%rbp), %rdx
	leaq	-5096(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_
.LEHE29:
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	leaq	-5104(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEppEv
	jmp	.L97
.L108:
	nop
	leaq	-5088(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt13random_deviceD1Ev
	jmp	.L107
.L104:
	movq	%rax, %rbx
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L100
.L103:
	movq	%rax, %rbx
.L100:
	leaq	-33(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L101
.L105:
	movq	%rax, %rbx
	leaq	-5088(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt13random_deviceD1Ev
.L101:
	movq	-5128(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm2048EED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB30:
	call	_Unwind_Resume
.LEHE30:
.L107:
	movq	-5128(%rbp), %rax
	addq	$5128, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9439:
	.section	.gcc_except_table
.LLSDA9439:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9439-.LLSDACSB9439
.LLSDACSB9439:
	.uleb128 .LEHB26-.LFB9439
	.uleb128 .LEHE26-.LEHB26
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB27-.LFB9439
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L103-.LFB9439
	.uleb128 0
	.uleb128 .LEHB28-.LFB9439
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L104-.LFB9439
	.uleb128 0
	.uleb128 .LEHB29-.LFB9439
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L105-.LFB9439
	.uleb128 0
	.uleb128 .LEHB30-.LFB9439
	.uleb128 .LEHE30-.LEHB30
	.uleb128 0
	.uleb128 0
.LLSDACSE9439:
	.section	.text._ZN7BigUIntILm2048EE9randomGenEv,"axG",@progbits,_ZN7BigUIntILm2048EE9randomGenEv,comdat
	.size	_ZN7BigUIntILm2048EE9randomGenEv, .-_ZN7BigUIntILm2048EE9randomGenEv
	.section	.text._ZN7BigUIntILm4096EEC2Ev,"axG",@progbits,_ZN7BigUIntILm4096EEC5Ev,comdat
	.align 2
	.weak	_ZN7BigUIntILm4096EEC2Ev
	.type	_ZN7BigUIntILm4096EEC2Ev, @function
_ZN7BigUIntILm4096EEC2Ev:
.LFB9444:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9444
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rbx
	leaq	-21(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjEC1Ev
	movl	$0, -20(%rbp)
	leaq	-21(%rbp), %rdx
	leaq	-20(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$128, %esi
	movq	%rbx, %rdi
.LEHB31:
	call	_ZNSt6vectorIjSaIjEEC1EmRKjRKS0_
.LEHE31:
	leaq	-21(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjED1Ev
	jmp	.L112
.L111:
	movq	%rax, %rbx
	leaq	-21(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB32:
	call	_Unwind_Resume
.LEHE32:
.L112:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9444:
	.section	.gcc_except_table
.LLSDA9444:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9444-.LLSDACSB9444
.LLSDACSB9444:
	.uleb128 .LEHB31-.LFB9444
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L111-.LFB9444
	.uleb128 0
	.uleb128 .LEHB32-.LFB9444
	.uleb128 .LEHE32-.LEHB32
	.uleb128 0
	.uleb128 0
.LLSDACSE9444:
	.section	.text._ZN7BigUIntILm4096EEC2Ev,"axG",@progbits,_ZN7BigUIntILm4096EEC5Ev,comdat
	.size	_ZN7BigUIntILm4096EEC2Ev, .-_ZN7BigUIntILm4096EEC2Ev
	.weak	_ZN7BigUIntILm4096EEC1Ev
	.set	_ZN7BigUIntILm4096EEC1Ev,_ZN7BigUIntILm4096EEC2Ev
	.section	.text._Z12fullMultiplyILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE,"axG",@progbits,_Z12fullMultiplyILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE,comdat
	.weak	_Z12fullMultiplyILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE
	.type	_Z12fullMultiplyILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE, @function
_Z12fullMultiplyILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE:
.LFB9449:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$64, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	-56(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EEC1Em
	movq	$0, -32(%rbp)
.L117:
	cmpq	$63, -32(%rbp)
	ja	.L119
	movq	$0, -24(%rbp)
	movq	$0, -40(%rbp)
.L116:
	cmpq	$63, -40(%rbp)
	ja	.L115
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm2048EE4dataEv
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %ebx
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm2048EE4dataEv
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %eax
	imulq	%rax, %rbx
	movq	%rbx, %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %r12
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %eax
	addq	%r12, %rax
	movq	%rax, -48(%rbp)
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movl	%eax, (%rdx)
	movq	-48(%rbp), %rax
	shrq	$32, %rax
	movq	%rax, -24(%rbp)
	addq	$1, -40(%rbp)
	jmp	.L116
.L115:
	movq	-32(%rbp), %rax
	leaq	64(%rax), %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	%eax, (%rdx)
	addq	$1, -32(%rbp)
	jmp	.L117
.L119:
	nop
	movq	-56(%rbp), %rax
	addq	$64, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9449:
	.size	_Z12fullMultiplyILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE, .-_Z12fullMultiplyILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE
	.section	.text._ZNSt6vectorIjSaIjEEaSEOS1_,"axG",@progbits,_ZNSt6vectorIjSaIjEEaSEOS1_,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEEaSEOS1_
	.type	_ZNSt6vectorIjSaIjEEaSEOS1_, @function
_ZNSt6vectorIjSaIjEEaSEOS1_:
.LFB9453:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movb	$1, -1(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRSt6vectorIjSaIjEEEONSt16remove_referenceIT_E4typeEOS5_
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEE14_M_move_assignEOS1_St17integral_constantIbLb1EE
	movq	-24(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9453:
	.size	_ZNSt6vectorIjSaIjEEaSEOS1_, .-_ZNSt6vectorIjSaIjEEaSEOS1_
	.section	.text._Z17fullMultiply_simdILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE,"axG",@progbits,_Z17fullMultiply_simdILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE,comdat
	.weak	_Z17fullMultiply_simdILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE
	.type	_Z17fullMultiply_simdILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE, @function
_Z17fullMultiply_simdILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE:
.LFB9454:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$576, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EEC1Ev
	movl	$4294967295, %eax
	movq	%rax, 544(%rsp)
	movl	$0, 324(%rsp)
	movl	$4, 320(%rsp)
	movl	$1, 316(%rsp)
	movl	$5, 312(%rsp)
	movl	$2, 308(%rsp)
	movl	$6, 304(%rsp)
	movl	$3, 300(%rsp)
	movl	$7, 296(%rsp)
	movl	296(%rsp), %eax
	movl	%eax, 292(%rsp)
	movl	300(%rsp), %eax
	movl	%eax, 288(%rsp)
	movl	304(%rsp), %eax
	movl	%eax, 284(%rsp)
	movl	308(%rsp), %eax
	movl	%eax, 280(%rsp)
	movl	312(%rsp), %eax
	movl	%eax, 276(%rsp)
	movl	316(%rsp), %eax
	movl	%eax, 272(%rsp)
	movl	320(%rsp), %eax
	movl	%eax, 268(%rsp)
	movl	324(%rsp), %eax
	movl	%eax, 264(%rsp)
	movl	292(%rsp), %eax
	vmovd	288(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm2
	movl	284(%rsp), %eax
	vmovd	280(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm1
	movl	276(%rsp), %eax
	vmovd	272(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm3
	movl	268(%rsp), %eax
	vmovd	264(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vpunpcklqdq	%xmm3, %xmm0, %xmm0
	vpunpcklqdq	%xmm2, %xmm1, %xmm1
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 512(%rsp)
	movl	$-1, 388(%rsp)
	movl	$-1, 384(%rsp)
	movl	$-1, 380(%rsp)
	movl	$-1, 376(%rsp)
	movl	$0, 372(%rsp)
	movl	$0, 368(%rsp)
	movl	$0, 364(%rsp)
	movl	$0, 360(%rsp)
	movl	360(%rsp), %eax
	movl	%eax, 356(%rsp)
	movl	364(%rsp), %eax
	movl	%eax, 352(%rsp)
	movl	368(%rsp), %eax
	movl	%eax, 348(%rsp)
	movl	372(%rsp), %eax
	movl	%eax, 344(%rsp)
	movl	376(%rsp), %eax
	movl	%eax, 340(%rsp)
	movl	380(%rsp), %eax
	movl	%eax, 336(%rsp)
	movl	384(%rsp), %eax
	movl	%eax, 332(%rsp)
	movl	388(%rsp), %eax
	movl	%eax, 328(%rsp)
	movl	356(%rsp), %eax
	vmovd	352(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm2
	movl	348(%rsp), %eax
	vmovd	344(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm1
	movl	340(%rsp), %eax
	vmovd	336(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm3
	movl	332(%rsp), %eax
	vmovd	328(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vpunpcklqdq	%xmm3, %xmm0, %xmm0
	vpunpcklqdq	%xmm2, %xmm1, %xmm1
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 480(%rsp)
	movq	$0, 568(%rsp)
.L135:
	cmpq	$63, 568(%rsp)
	ja	.L139
	movl	$0, 564(%rsp)
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm2048EE4dataEv
	movq	%rax, %rdx
	movq	568(%rsp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, 260(%rsp)
	vpbroadcastd	260(%rsp), %ymm0
	vmovdqa	%ymm0, 448(%rsp)
	movq	$0, 552(%rsp)
.L133:
	movq	552(%rsp), %rax
	addq	$3, %rax
	cmpq	$63, %rax
	ja	.L129
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm2048EE4dataEv
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE4dataEv
	movq	%rax, %rdx
	movq	552(%rsp), %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, 248(%rsp)
	vmovdqa	480(%rsp), %ymm0
	vmovdqa	%ymm0, 192(%rsp)
	vmovdqa	192(%rsp), %ymm0
	movq	248(%rsp), %rax
	vpmaskmovd	(%rax), %ymm0, %ymm0
	vmovdqa	%ymm0, 416(%rsp)
	vmovdqa	416(%rsp), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	vmovdqa	512(%rsp), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vmovdqa	128(%rsp), %ymm0
	vmovdqa	160(%rsp), %ymm1
	vpermd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 416(%rsp)
	vmovdqa	448(%rsp), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vmovdqa	416(%rsp), %ymm0
	vmovdqa	%ymm0, 64(%rsp)
	vmovdqa	64(%rsp), %ymm0
	vmovdqa	96(%rsp), %ymm1
	vpmuludq	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 32(%rsp)
	leaq	32(%rsp), %rax
	movq	%rax, 408(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	32(%rsp), %rax
	addq	%rax, %rdx
	movl	564(%rsp), %eax
	addq	%rdx, %rax
	movq	%rax, 400(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	400(%rsp), %rax
	movl	%eax, (%rdx)
	movq	400(%rsp), %rax
	shrq	$32, %rax
	movl	%eax, 564(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	addq	%rdx, %rax
	leaq	1(%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	40(%rsp), %rax
	addq	%rax, %rdx
	movl	564(%rsp), %eax
	addq	%rdx, %rax
	movq	%rax, 400(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	addq	%rdx, %rax
	leaq	1(%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	400(%rsp), %rax
	movl	%eax, (%rdx)
	movq	400(%rsp), %rax
	shrq	$32, %rax
	movl	%eax, 564(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	addq	%rdx, %rax
	leaq	2(%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	48(%rsp), %rax
	addq	%rax, %rdx
	movl	564(%rsp), %eax
	addq	%rdx, %rax
	movq	%rax, 400(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	addq	%rdx, %rax
	leaq	2(%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	400(%rsp), %rax
	movl	%eax, (%rdx)
	movq	400(%rsp), %rax
	shrq	$32, %rax
	movl	%eax, 564(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	addq	%rdx, %rax
	leaq	3(%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	56(%rsp), %rax
	addq	%rax, %rdx
	movl	564(%rsp), %eax
	addq	%rdx, %rax
	movq	%rax, 400(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	addq	%rdx, %rax
	leaq	3(%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	400(%rsp), %rax
	movl	%eax, (%rdx)
	movq	400(%rsp), %rax
	shrq	$32, %rax
	movl	%eax, 564(%rsp)
	addq	$4, 552(%rsp)
	jmp	.L133
.L129:
	cmpq	$63, 552(%rsp)
	ja	.L134
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %ebx
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm2048EE4dataEv
	movq	%rax, %rdx
	movq	552(%rsp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %r12d
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm2048EE4dataEv
	movq	%rax, %rdx
	movq	568(%rsp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %eax
	imulq	%r12, %rax
	leaq	(%rbx,%rax), %rdx
	movl	564(%rsp), %eax
	addq	%rdx, %rax
	movq	%rax, 392(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	392(%rsp), %rax
	movl	%eax, (%rdx)
	movq	392(%rsp), %rax
	shrq	$32, %rax
	movl	%eax, 564(%rsp)
	addq	$1, 552(%rsp)
	jmp	.L129
.L134:
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %ecx
	movl	564(%rsp), %edx
	addl	%ecx, %edx
	movl	%edx, (%rax)
	addq	$1, 568(%rsp)
	jmp	.L135
.L138:
.L139:
	nop
	movq	24(%rsp), %rax
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9454:
	.size	_Z17fullMultiply_simdILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE, .-_Z17fullMultiply_simdILm2048ELm2048EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE
	.section	.text._ZNK7BigUIntILm4096EEneERKS0_,"axG",@progbits,_ZNK7BigUIntILm4096EEneERKS0_,comdat
	.align 2
	.weak	_ZNK7BigUIntILm4096EEneERKS0_
	.type	_ZNK7BigUIntILm4096EEneERKS0_, @function
_ZNK7BigUIntILm4096EEneERKS0_:
.LFB9455:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm4096EE7compareERKS0_
	testl	%eax, %eax
	setne	%al
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9455:
	.size	_ZNK7BigUIntILm4096EEneERKS0_, .-_ZNK7BigUIntILm4096EEneERKS0_
	.section	.text._ZN7BigUIntILm4096EEC2ERKS0_,"axG",@progbits,_ZN7BigUIntILm4096EEC5ERKS0_,comdat
	.align 2
	.weak	_ZN7BigUIntILm4096EEC2ERKS0_
	.type	_ZN7BigUIntILm4096EEC2ERKS0_, @function
_ZN7BigUIntILm4096EEC2ERKS0_:
.LFB9458:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEC1ERKS1_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9458:
	.size	_ZN7BigUIntILm4096EEC2ERKS0_, .-_ZN7BigUIntILm4096EEC2ERKS0_
	.weak	_ZN7BigUIntILm4096EEC1ERKS0_
	.set	_ZN7BigUIntILm4096EEC1ERKS0_,_ZN7BigUIntILm4096EEC2ERKS0_
	.section	.text._ZNK7BigUIntILm4096EE5toDecB5cxx11Ev,"axG",@progbits,_ZNK7BigUIntILm4096EE5toDecB5cxx11Ev,comdat
	.align 2
	.weak	_ZNK7BigUIntILm4096EE5toDecB5cxx11Ev
	.type	_ZNK7BigUIntILm4096EE5toDecB5cxx11Ev, @function
_ZNK7BigUIntILm4096EE5toDecB5cxx11Ev:
.LFB9456:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9456
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev
	movq	-104(%rbp), %rax
	movl	$128, %esi
	movq	%rax, %rdi
.LEHB33:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm
	movl	$1000000000, -28(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EEC1Ev
.LEHE33:
	movq	-112(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB34:
	call	_ZN7BigUIntILm4096EEC1ERKS0_
.LEHE34:
.L147:
	leaq	-64(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB35:
	call	_ZNK7BigUIntILm4096EEneERKS0_
	testb	%al, %al
	je	.L144
	movl	-28(%rbp), %edx
	leaq	-96(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EE9divideU32Ej
	movl	%eax, -20(%rbp)
	movl	$0, -24(%rbp)
.L146:
	cmpl	$8, -24(%rbp)
	jg	.L147
	movl	-20(%rbp), %ecx
	movl	$-858993459, %edx
	movl	%ecx, %eax
	mull	%edx
	shrl	$3, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -32(%rbp)
	movl	-20(%rbp), %eax
	movl	$-858993459, %edx
	mull	%edx
	movl	%edx, %eax
	shrl	$3, %eax
	movl	%eax, -20(%rbp)
	movl	-32(%rbp), %eax
	addl	$48, %eax
	movsbl	%al, %edx
	movq	-104(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9push_backEc
	addl	$1, -24(%rbp)
	jmp	.L146
.L144:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4backEv
	movzbl	(%rax), %eax
	cmpb	$48, %al
	sete	%al
	testb	%al, %al
	je	.L148
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8pop_backEv
	jmp	.L144
.L148:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE3endEv
	movq	%rax, %rbx
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5beginEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZSt7reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_
.LEHE35:
	nop
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EED1Ev
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EED1Ev
	jmp	.L156
.L155:
	movq	%rax, %rbx
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EED1Ev
	jmp	.L151
.L154:
	movq	%rax, %rbx
.L151:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EED1Ev
	jmp	.L152
.L153:
	movq	%rax, %rbx
.L152:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB36:
	call	_Unwind_Resume
.LEHE36:
.L156:
	movq	-104(%rbp), %rax
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9456:
	.section	.gcc_except_table
.LLSDA9456:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9456-.LLSDACSB9456
.LLSDACSB9456:
	.uleb128 .LEHB33-.LFB9456
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L153-.LFB9456
	.uleb128 0
	.uleb128 .LEHB34-.LFB9456
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L154-.LFB9456
	.uleb128 0
	.uleb128 .LEHB35-.LFB9456
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L155-.LFB9456
	.uleb128 0
	.uleb128 .LEHB36-.LFB9456
	.uleb128 .LEHE36-.LEHB36
	.uleb128 0
	.uleb128 0
.LLSDACSE9456:
	.section	.text._ZNK7BigUIntILm4096EE5toDecB5cxx11Ev,"axG",@progbits,_ZNK7BigUIntILm4096EE5toDecB5cxx11Ev,comdat
	.size	_ZNK7BigUIntILm4096EE5toDecB5cxx11Ev, .-_ZNK7BigUIntILm4096EE5toDecB5cxx11Ev
	.section	.rodata
.LC11:
	.string	"../biguint.hpp"
.LC12:
	.string	"false"
	.section	.text._ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEc,"axG",@progbits,_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEc,comdat
	.align 2
	.weak	_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEc
	.type	_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEc, @function
_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEc:
.LFB9462:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, %eax
	movb	%al, -12(%rbp)
	cmpb	$47, -12(%rbp)
	jle	.L158
	cmpb	$57, -12(%rbp)
	jg	.L158
	movsbl	-12(%rbp), %eax
	subl	$48, %eax
	jmp	.L159
.L158:
	cmpb	$96, -12(%rbp)
	jle	.L160
	cmpb	$102, -12(%rbp)
	jg	.L160
	movsbl	-12(%rbp), %eax
	subl	$87, %eax
	jmp	.L159
.L160:
	movl	$_ZZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEcE19__PRETTY_FUNCTION__, %ecx
	movl	$49, %edx
	movl	$.LC11, %esi
	movl	$.LC12, %edi
	call	__assert_fail
.L159:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9462:
	.size	_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEc, .-_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEc
	.section	.text._ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENUlcE_4_FUNEc,"axG",@progbits,_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEc,comdat
	.weak	_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENUlcE_4_FUNEc
	.type	_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENUlcE_4_FUNEc, @function
_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENUlcE_4_FUNEc:
.LFB9463:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movzbl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$0, %edi
	call	_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEc
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9463:
	.size	_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENUlcE_4_FUNEc, .-_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENUlcE_4_FUNEc
	.section	.text._ZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,"axG",@progbits,_ZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,comdat
	.weak	_ZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_ZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, @function
_ZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB9461:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9461
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
.LEHB37:
	call	_ZN7BigUIntILm128EEC1Ev
.LEHE37:
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5beginEv
	movq	%rax, -104(%rbp)
.L165:
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE3endEv
	movq	%rax, -88(%rbp)
	leaq	-88(%rbp), %rdx
	leaq	-104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxxneIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_
	testb	%al, %al
	je	.L173
	leaq	-80(%rbp), %rax
	movl	$16, %esi
	movq	%rax, %rdi
.LEHB38:
	call	_ZN7BigUIntILm128EEC1Em
.LEHE38:
	leaq	-80(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB39:
	call	_ZN7BigUIntILm128EEmLERKS0_
.LEHE39:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	leaq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	leaq	-89(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEc
	movslq	%eax, %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB40:
	call	_ZN7BigUIntILm128EEC1Em
.LEHE40:
	leaq	-48(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB41:
	call	_ZN7BigUIntILm128EEpLERKS0_
.LEHE41:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	leaq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv
	jmp	.L165
.L171:
	movq	%rax, %rbx
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	jmp	.L168
.L172:
	movq	%rax, %rbx
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	jmp	.L168
.L170:
	movq	%rax, %rbx
.L168:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB42:
	call	_Unwind_Resume
.LEHE42:
.L173:
	nop
	movq	-120(%rbp), %rax
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9461:
	.section	.gcc_except_table
.LLSDA9461:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9461-.LLSDACSB9461
.LLSDACSB9461:
	.uleb128 .LEHB37-.LFB9461
	.uleb128 .LEHE37-.LEHB37
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB38-.LFB9461
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L170-.LFB9461
	.uleb128 0
	.uleb128 .LEHB39-.LFB9461
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L171-.LFB9461
	.uleb128 0
	.uleb128 .LEHB40-.LFB9461
	.uleb128 .LEHE40-.LEHB40
	.uleb128 .L170-.LFB9461
	.uleb128 0
	.uleb128 .LEHB41-.LFB9461
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L172-.LFB9461
	.uleb128 0
	.uleb128 .LEHB42-.LFB9461
	.uleb128 .LEHE42-.LEHB42
	.uleb128 0
	.uleb128 0
.LLSDACSE9461:
	.section	.text._ZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,"axG",@progbits,_ZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,comdat
	.size	_ZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_ZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.text._ZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEj,"axG",@progbits,_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEj,comdat
	.align 2
	.weak	_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEj
	.type	_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEj, @function
_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEj:
.LFB9466:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	cmpl	$9, -12(%rbp)
	ja	.L175
	movl	-12(%rbp), %eax
	addl	$48, %eax
	jmp	.L176
.L175:
	cmpl	$9, -12(%rbp)
	jbe	.L177
	cmpl	$15, -12(%rbp)
	ja	.L177
	movl	-12(%rbp), %eax
	addl	$87, %eax
	jmp	.L176
.L177:
	movl	$_ZZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEjE19__PRETTY_FUNCTION__, %ecx
	movl	$569, %edx
	movl	$.LC11, %esi
	movl	$.LC12, %edi
	call	__assert_fail
.L176:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9466:
	.size	_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEj, .-_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEj
	.section	.text._ZZNK7BigUIntILm128EE5toHexB5cxx11EvENUljE_4_FUNEj,"axG",@progbits,_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEj,comdat
	.weak	_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENUljE_4_FUNEj
	.type	_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENUljE_4_FUNEj, @function
_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENUljE_4_FUNEj:
.LFB9467:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$0, %edi
	call	_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEj
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9467:
	.size	_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENUljE_4_FUNEj, .-_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENUljE_4_FUNEj
	.section	.text._ZN7BigUIntILm128EEC2ERKS0_,"axG",@progbits,_ZN7BigUIntILm128EEC5ERKS0_,comdat
	.align 2
	.weak	_ZN7BigUIntILm128EEC2ERKS0_
	.type	_ZN7BigUIntILm128EEC2ERKS0_, @function
_ZN7BigUIntILm128EEC2ERKS0_:
.LFB9470:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEC1ERKS1_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9470:
	.size	_ZN7BigUIntILm128EEC2ERKS0_, .-_ZN7BigUIntILm128EEC2ERKS0_
	.weak	_ZN7BigUIntILm128EEC1ERKS0_
	.set	_ZN7BigUIntILm128EEC1ERKS0_,_ZN7BigUIntILm128EEC2ERKS0_
	.section	.text._ZNK7BigUIntILm128EE5toHexB5cxx11Ev,"axG",@progbits,_ZNK7BigUIntILm128EE5toHexB5cxx11Ev,comdat
	.align 2
	.weak	_ZNK7BigUIntILm128EE5toHexB5cxx11Ev
	.type	_ZNK7BigUIntILm128EE5toHexB5cxx11Ev, @function
_ZNK7BigUIntILm128EE5toHexB5cxx11Ev:
.LFB9465:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9465
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev
	movq	-96(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB43:
	call	_ZN7BigUIntILm128EEC1ERKS0_
.LEHE43:
.L183:
	leaq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
.LEHB44:
	call	_ZN7BigUIntILm128EEC1Em
.LEHE44:
	leaq	-48(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB45:
	call	_ZNK7BigUIntILm128EEgtERKS0_
.LEHE45:
	movl	%eax, %ebx
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	testb	%bl, %bl
	je	.L182
	leaq	-80(%rbp), %rax
	movl	$16, %esi
	movq	%rax, %rdi
.LEHB46:
	call	_ZN7BigUIntILm128EE9divideU32Ej
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	leaq	-49(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEj
	movsbl	%al, %edx
	movq	-88(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9push_backEc
	jmp	.L183
.L182:
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE3endEv
	movq	%rax, %rbx
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5beginEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZSt7reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_
.LEHE46:
	nop
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	jmp	.L191
.L190:
	movq	%rax, %rbx
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	jmp	.L186
.L189:
	movq	%rax, %rbx
.L186:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	jmp	.L187
.L188:
	movq	%rax, %rbx
.L187:
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB47:
	call	_Unwind_Resume
.LEHE47:
.L191:
	movq	-88(%rbp), %rax
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9465:
	.section	.gcc_except_table
.LLSDA9465:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9465-.LLSDACSB9465
.LLSDACSB9465:
	.uleb128 .LEHB43-.LFB9465
	.uleb128 .LEHE43-.LEHB43
	.uleb128 .L188-.LFB9465
	.uleb128 0
	.uleb128 .LEHB44-.LFB9465
	.uleb128 .LEHE44-.LEHB44
	.uleb128 .L189-.LFB9465
	.uleb128 0
	.uleb128 .LEHB45-.LFB9465
	.uleb128 .LEHE45-.LEHB45
	.uleb128 .L190-.LFB9465
	.uleb128 0
	.uleb128 .LEHB46-.LFB9465
	.uleb128 .LEHE46-.LEHB46
	.uleb128 .L189-.LFB9465
	.uleb128 0
	.uleb128 .LEHB47-.LFB9465
	.uleb128 .LEHE47-.LEHB47
	.uleb128 0
	.uleb128 0
.LLSDACSE9465:
	.section	.text._ZNK7BigUIntILm128EE5toHexB5cxx11Ev,"axG",@progbits,_ZNK7BigUIntILm128EE5toHexB5cxx11Ev,comdat
	.size	_ZNK7BigUIntILm128EE5toHexB5cxx11Ev, .-_ZNK7BigUIntILm128EE5toHexB5cxx11Ev
	.section	.text._Z12fullMultiplyILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE,"axG",@progbits,_Z12fullMultiplyILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE,comdat
	.weak	_Z12fullMultiplyILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE
	.type	_Z12fullMultiplyILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE, @function
_Z12fullMultiplyILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE:
.LFB9472:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$64, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	-56(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EEC1Em
	movq	$0, -32(%rbp)
.L196:
	cmpq	$3, -32(%rbp)
	ja	.L198
	movq	$0, -24(%rbp)
	movq	$0, -40(%rbp)
.L195:
	cmpq	$3, -40(%rbp)
	ja	.L194
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm128EE4dataEv
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %ebx
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm128EE4dataEv
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %eax
	imulq	%rax, %rbx
	movq	%rbx, %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %r12
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %eax
	addq	%r12, %rax
	movq	%rax, -48(%rbp)
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movl	%eax, (%rdx)
	movq	-48(%rbp), %rax
	shrq	$32, %rax
	movq	%rax, -24(%rbp)
	addq	$1, -40(%rbp)
	jmp	.L195
.L194:
	movq	-32(%rbp), %rax
	leaq	4(%rax), %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	%eax, (%rdx)
	addq	$1, -32(%rbp)
	jmp	.L196
.L198:
	nop
	movq	-56(%rbp), %rax
	addq	$64, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9472:
	.size	_Z12fullMultiplyILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE, .-_Z12fullMultiplyILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE
	.section	.text._Z17fullMultiply_simdILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE,"axG",@progbits,_Z17fullMultiply_simdILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE,comdat
	.weak	_Z17fullMultiply_simdILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE
	.type	_Z17fullMultiply_simdILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE, @function
_Z17fullMultiply_simdILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE:
.LFB9473:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$576, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EEC1Ev
	movl	$4294967295, %eax
	movq	%rax, 544(%rsp)
	movl	$0, 324(%rsp)
	movl	$4, 320(%rsp)
	movl	$1, 316(%rsp)
	movl	$5, 312(%rsp)
	movl	$2, 308(%rsp)
	movl	$6, 304(%rsp)
	movl	$3, 300(%rsp)
	movl	$7, 296(%rsp)
	movl	296(%rsp), %eax
	movl	%eax, 292(%rsp)
	movl	300(%rsp), %eax
	movl	%eax, 288(%rsp)
	movl	304(%rsp), %eax
	movl	%eax, 284(%rsp)
	movl	308(%rsp), %eax
	movl	%eax, 280(%rsp)
	movl	312(%rsp), %eax
	movl	%eax, 276(%rsp)
	movl	316(%rsp), %eax
	movl	%eax, 272(%rsp)
	movl	320(%rsp), %eax
	movl	%eax, 268(%rsp)
	movl	324(%rsp), %eax
	movl	%eax, 264(%rsp)
	movl	292(%rsp), %eax
	vmovd	288(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm2
	movl	284(%rsp), %eax
	vmovd	280(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm1
	movl	276(%rsp), %eax
	vmovd	272(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm3
	movl	268(%rsp), %eax
	vmovd	264(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vpunpcklqdq	%xmm3, %xmm0, %xmm0
	vpunpcklqdq	%xmm2, %xmm1, %xmm1
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 512(%rsp)
	movl	$-1, 388(%rsp)
	movl	$-1, 384(%rsp)
	movl	$-1, 380(%rsp)
	movl	$-1, 376(%rsp)
	movl	$0, 372(%rsp)
	movl	$0, 368(%rsp)
	movl	$0, 364(%rsp)
	movl	$0, 360(%rsp)
	movl	360(%rsp), %eax
	movl	%eax, 356(%rsp)
	movl	364(%rsp), %eax
	movl	%eax, 352(%rsp)
	movl	368(%rsp), %eax
	movl	%eax, 348(%rsp)
	movl	372(%rsp), %eax
	movl	%eax, 344(%rsp)
	movl	376(%rsp), %eax
	movl	%eax, 340(%rsp)
	movl	380(%rsp), %eax
	movl	%eax, 336(%rsp)
	movl	384(%rsp), %eax
	movl	%eax, 332(%rsp)
	movl	388(%rsp), %eax
	movl	%eax, 328(%rsp)
	movl	356(%rsp), %eax
	vmovd	352(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm2
	movl	348(%rsp), %eax
	vmovd	344(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm1
	movl	340(%rsp), %eax
	vmovd	336(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm3
	movl	332(%rsp), %eax
	vmovd	328(%rsp), %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vpunpcklqdq	%xmm3, %xmm0, %xmm0
	vpunpcklqdq	%xmm2, %xmm1, %xmm1
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 480(%rsp)
	movq	$0, 568(%rsp)
.L212:
	cmpq	$3, 568(%rsp)
	ja	.L216
	movl	$0, 564(%rsp)
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm128EE4dataEv
	movq	%rax, %rdx
	movq	568(%rsp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, 260(%rsp)
	vpbroadcastd	260(%rsp), %ymm0
	vmovdqa	%ymm0, 448(%rsp)
	movq	$0, 552(%rsp)
.L210:
	movq	552(%rsp), %rax
	addq	$3, %rax
	cmpq	$3, %rax
	ja	.L206
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm128EE4dataEv
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE4dataEv
	movq	%rax, %rdx
	movq	552(%rsp), %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, 248(%rsp)
	vmovdqa	480(%rsp), %ymm0
	vmovdqa	%ymm0, 192(%rsp)
	vmovdqa	192(%rsp), %ymm0
	movq	248(%rsp), %rax
	vpmaskmovd	(%rax), %ymm0, %ymm0
	vmovdqa	%ymm0, 416(%rsp)
	vmovdqa	416(%rsp), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	vmovdqa	512(%rsp), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vmovdqa	128(%rsp), %ymm0
	vmovdqa	160(%rsp), %ymm1
	vpermd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 416(%rsp)
	vmovdqa	448(%rsp), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vmovdqa	416(%rsp), %ymm0
	vmovdqa	%ymm0, 64(%rsp)
	vmovdqa	64(%rsp), %ymm0
	vmovdqa	96(%rsp), %ymm1
	vpmuludq	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 32(%rsp)
	leaq	32(%rsp), %rax
	movq	%rax, 408(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	32(%rsp), %rax
	addq	%rax, %rdx
	movl	564(%rsp), %eax
	addq	%rdx, %rax
	movq	%rax, 400(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	400(%rsp), %rax
	movl	%eax, (%rdx)
	movq	400(%rsp), %rax
	shrq	$32, %rax
	movl	%eax, 564(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	addq	%rdx, %rax
	leaq	1(%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	40(%rsp), %rax
	addq	%rax, %rdx
	movl	564(%rsp), %eax
	addq	%rdx, %rax
	movq	%rax, 400(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	addq	%rdx, %rax
	leaq	1(%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	400(%rsp), %rax
	movl	%eax, (%rdx)
	movq	400(%rsp), %rax
	shrq	$32, %rax
	movl	%eax, 564(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	addq	%rdx, %rax
	leaq	2(%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	48(%rsp), %rax
	addq	%rax, %rdx
	movl	564(%rsp), %eax
	addq	%rdx, %rax
	movq	%rax, 400(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	addq	%rdx, %rax
	leaq	2(%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	400(%rsp), %rax
	movl	%eax, (%rdx)
	movq	400(%rsp), %rax
	shrq	$32, %rax
	movl	%eax, 564(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	addq	%rdx, %rax
	leaq	3(%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	56(%rsp), %rax
	addq	%rax, %rdx
	movl	564(%rsp), %eax
	addq	%rdx, %rax
	movq	%rax, 400(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	addq	%rdx, %rax
	leaq	3(%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	400(%rsp), %rax
	movl	%eax, (%rdx)
	movq	400(%rsp), %rax
	shrq	$32, %rax
	movl	%eax, 564(%rsp)
	addq	$4, 552(%rsp)
	jmp	.L210
.L206:
	cmpq	$3, 552(%rsp)
	ja	.L211
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %ebx
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm128EE4dataEv
	movq	%rax, %rdx
	movq	552(%rsp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %r12d
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm128EE4dataEv
	movq	%rax, %rdx
	movq	568(%rsp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %eax
	imulq	%r12, %rax
	leaq	(%rbx,%rax), %rdx
	movl	564(%rsp), %eax
	addq	%rdx, %rax
	movq	%rax, 392(%rsp)
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	392(%rsp), %rax
	movl	%eax, (%rdx)
	movq	392(%rsp), %rax
	shrq	$32, %rax
	movl	%eax, 564(%rsp)
	addq	$1, 552(%rsp)
	jmp	.L206
.L211:
	movq	568(%rsp), %rdx
	movq	552(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EE4dataEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %ecx
	movl	564(%rsp), %edx
	addl	%ecx, %edx
	movl	%edx, (%rax)
	addq	$1, 568(%rsp)
	jmp	.L212
.L215:
.L216:
	nop
	movq	24(%rsp), %rax
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9473:
	.size	_Z17fullMultiply_simdILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE, .-_Z17fullMultiply_simdILm128ELm128EE7BigUIntIXplT_T0_EERKS0_IXT_EERKS0_IXT0_EE
	.section	.text._ZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEj,"axG",@progbits,_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEj,comdat
	.align 2
	.weak	_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEj
	.type	_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEj, @function
_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEj:
.LFB9475:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	cmpl	$9, -12(%rbp)
	ja	.L218
	movl	-12(%rbp), %eax
	addl	$48, %eax
	jmp	.L219
.L218:
	cmpl	$9, -12(%rbp)
	jbe	.L220
	cmpl	$15, -12(%rbp)
	ja	.L220
	movl	-12(%rbp), %eax
	addl	$87, %eax
	jmp	.L219
.L220:
	movl	$_ZZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEjE19__PRETTY_FUNCTION__, %ecx
	movl	$569, %edx
	movl	$.LC11, %esi
	movl	$.LC12, %edi
	call	__assert_fail
.L219:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9475:
	.size	_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEj, .-_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEj
	.section	.text._ZZNK7BigUIntILm256EE5toHexB5cxx11EvENUljE_4_FUNEj,"axG",@progbits,_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEj,comdat
	.weak	_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENUljE_4_FUNEj
	.type	_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENUljE_4_FUNEj, @function
_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENUljE_4_FUNEj:
.LFB9476:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$0, %edi
	call	_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEj
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9476:
	.size	_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENUljE_4_FUNEj, .-_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENUljE_4_FUNEj
	.section	.text._ZN7BigUIntILm256EEC2ERKS0_,"axG",@progbits,_ZN7BigUIntILm256EEC5ERKS0_,comdat
	.align 2
	.weak	_ZN7BigUIntILm256EEC2ERKS0_
	.type	_ZN7BigUIntILm256EEC2ERKS0_, @function
_ZN7BigUIntILm256EEC2ERKS0_:
.LFB9479:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEC1ERKS1_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9479:
	.size	_ZN7BigUIntILm256EEC2ERKS0_, .-_ZN7BigUIntILm256EEC2ERKS0_
	.weak	_ZN7BigUIntILm256EEC1ERKS0_
	.set	_ZN7BigUIntILm256EEC1ERKS0_,_ZN7BigUIntILm256EEC2ERKS0_
	.section	.text._ZNK7BigUIntILm256EE5toHexB5cxx11Ev,"axG",@progbits,_ZNK7BigUIntILm256EE5toHexB5cxx11Ev,comdat
	.align 2
	.weak	_ZNK7BigUIntILm256EE5toHexB5cxx11Ev
	.type	_ZNK7BigUIntILm256EE5toHexB5cxx11Ev, @function
_ZNK7BigUIntILm256EE5toHexB5cxx11Ev:
.LFB9474:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9474
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev
	movq	-96(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB48:
	call	_ZN7BigUIntILm256EEC1ERKS0_
.LEHE48:
.L226:
	leaq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
.LEHB49:
	call	_ZN7BigUIntILm256EEC1Em
.LEHE49:
	leaq	-48(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB50:
	call	_ZNK7BigUIntILm256EEgtERKS0_
.LEHE50:
	movl	%eax, %ebx
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EED1Ev
	testb	%bl, %bl
	je	.L225
	leaq	-80(%rbp), %rax
	movl	$16, %esi
	movq	%rax, %rdi
.LEHB51:
	call	_ZN7BigUIntILm256EE9divideU32Ej
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	leaq	-49(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEj
	movsbl	%al, %edx
	movq	-88(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9push_backEc
	jmp	.L226
.L225:
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE3endEv
	movq	%rax, %rbx
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5beginEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZSt7reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_
.LEHE51:
	nop
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EED1Ev
	jmp	.L234
.L233:
	movq	%rax, %rbx
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EED1Ev
	jmp	.L229
.L232:
	movq	%rax, %rbx
.L229:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EED1Ev
	jmp	.L230
.L231:
	movq	%rax, %rbx
.L230:
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB52:
	call	_Unwind_Resume
.LEHE52:
.L234:
	movq	-88(%rbp), %rax
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9474:
	.section	.gcc_except_table
.LLSDA9474:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9474-.LLSDACSB9474
.LLSDACSB9474:
	.uleb128 .LEHB48-.LFB9474
	.uleb128 .LEHE48-.LEHB48
	.uleb128 .L231-.LFB9474
	.uleb128 0
	.uleb128 .LEHB49-.LFB9474
	.uleb128 .LEHE49-.LEHB49
	.uleb128 .L232-.LFB9474
	.uleb128 0
	.uleb128 .LEHB50-.LFB9474
	.uleb128 .LEHE50-.LEHB50
	.uleb128 .L233-.LFB9474
	.uleb128 0
	.uleb128 .LEHB51-.LFB9474
	.uleb128 .LEHE51-.LEHB51
	.uleb128 .L232-.LFB9474
	.uleb128 0
	.uleb128 .LEHB52-.LFB9474
	.uleb128 .LEHE52-.LEHB52
	.uleb128 0
	.uleb128 0
.LLSDACSE9474:
	.section	.text._ZNK7BigUIntILm256EE5toHexB5cxx11Ev,"axG",@progbits,_ZNK7BigUIntILm256EE5toHexB5cxx11Ev,comdat
	.size	_ZNK7BigUIntILm256EE5toHexB5cxx11Ev, .-_ZNK7BigUIntILm256EE5toHexB5cxx11Ev
	.section	.text._ZNSt6chronomiIlSt5ratioILl1ELl1000000000EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_,"axG",@progbits,_ZNSt6chronomiIlSt5ratioILl1ELl1000000000EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_,comdat
	.weak	_ZNSt6chronomiIlSt5ratioILl1ELl1000000000EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_
	.type	_ZNSt6chronomiIlSt5ratioILl1ELl1000000000EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_, @function
_ZNSt6chronomiIlSt5ratioILl1ELl1000000000EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_:
.LFB9601:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv
	subq	%rax, %rbx
	movq	%rbx, %rax
	movq	%rax, -40(%rbp)
	leaq	-40(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEC1IlvEERKT_
	movq	-48(%rbp), %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9601:
	.size	_ZNSt6chronomiIlSt5ratioILl1ELl1000000000EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_, .-_ZNSt6chronomiIlSt5ratioILl1ELl1000000000EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_
	.section	.text._ZNSt6chrono13duration_castINS_8durationIdSt5ratioILl1ELl1EEEElS2_ILl1ELl1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE,"axG",@progbits,_ZNSt6chrono13duration_castINS_8durationIdSt5ratioILl1ELl1EEEElS2_ILl1ELl1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE,comdat
	.weak	_ZNSt6chrono13duration_castINS_8durationIdSt5ratioILl1ELl1EEEElS2_ILl1ELl1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE
	.type	_ZNSt6chrono13duration_castINS_8durationIdSt5ratioILl1ELl1EEEElS2_ILl1ELl1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE, @function
_ZNSt6chrono13duration_castINS_8durationIdSt5ratioILl1ELl1EEEElS2_ILl1ELl1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE:
.LFB9602:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6chrono20__duration_cast_implINS_8durationIdSt5ratioILl1ELl1EEEES2_ILl1ELl1000000000EEdLb1ELb0EE6__castIlS5_EES4_RKNS1_IT_T0_EE
	vmovq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	vmovsd	-16(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9602:
	.size	_ZNSt6chrono13duration_castINS_8durationIdSt5ratioILl1ELl1EEEElS2_ILl1ELl1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE, .-_ZNSt6chrono13duration_castINS_8durationIdSt5ratioILl1ELl1EEEElS2_ILl1ELl1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE
	.section	.text._ZNSt12_Vector_baseIjSaIjEE12_Vector_implD2Ev,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEE12_Vector_implD5Ev,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implD2Ev
	.type	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implD2Ev, @function
_ZNSt12_Vector_baseIjSaIjEE12_Vector_implD2Ev:
.LFB9650:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjED2Ev
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9650:
	.size	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implD2Ev, .-_ZNSt12_Vector_baseIjSaIjEE12_Vector_implD2Ev
	.weak	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implD1Ev
	.set	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implD1Ev,_ZNSt12_Vector_baseIjSaIjEE12_Vector_implD2Ev
	.section	.text._ZNSt12_Vector_baseIjSaIjEED2Ev,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEED5Ev,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseIjSaIjEED2Ev
	.type	_ZNSt12_Vector_baseIjSaIjEED2Ev, @function
_ZNSt12_Vector_baseIjSaIjEED2Ev:
.LFB9655:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9655
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	sarq	$2, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE13_M_deallocateEPjm
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implD1Ev
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9655:
	.section	.gcc_except_table
.LLSDA9655:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9655-.LLSDACSB9655
.LLSDACSB9655:
.LLSDACSE9655:
	.section	.text._ZNSt12_Vector_baseIjSaIjEED2Ev,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEED5Ev,comdat
	.size	_ZNSt12_Vector_baseIjSaIjEED2Ev, .-_ZNSt12_Vector_baseIjSaIjEED2Ev
	.weak	_ZNSt12_Vector_baseIjSaIjEED1Ev
	.set	_ZNSt12_Vector_baseIjSaIjEED1Ev,_ZNSt12_Vector_baseIjSaIjEED2Ev
	.section	.text._ZNSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv
	.type	_ZNSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv, @function
_ZNSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv:
.LFB9657:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9657:
	.size	_ZNSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv, .-_ZNSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv
	.section	.text._ZSt8_DestroyIPjjEvT_S1_RSaIT0_E,"axG",@progbits,_ZSt8_DestroyIPjjEvT_S1_RSaIT0_E,comdat
	.weak	_ZSt8_DestroyIPjjEvT_S1_RSaIT0_E
	.type	_ZSt8_DestroyIPjjEvT_S1_RSaIT0_E, @function
_ZSt8_DestroyIPjjEvT_S1_RSaIT0_E:
.LFB9658:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt8_DestroyIPjEvT_S1_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9658:
	.size	_ZSt8_DestroyIPjjEvT_S1_RSaIT0_E, .-_ZSt8_DestroyIPjjEvT_S1_RSaIT0_E
	.section	.text._ZN7BigUIntILm2048EEC2Ev,"axG",@progbits,_ZN7BigUIntILm2048EEC5Ev,comdat
	.align 2
	.weak	_ZN7BigUIntILm2048EEC2Ev
	.type	_ZN7BigUIntILm2048EEC2Ev, @function
_ZN7BigUIntILm2048EEC2Ev:
.LFB9673:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9673
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rbx
	leaq	-21(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjEC1Ev
	movl	$0, -20(%rbp)
	leaq	-21(%rbp), %rdx
	leaq	-20(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$64, %esi
	movq	%rbx, %rdi
.LEHB53:
	call	_ZNSt6vectorIjSaIjEEC1EmRKjRKS0_
.LEHE53:
	leaq	-21(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjED1Ev
	jmp	.L247
.L246:
	movq	%rax, %rbx
	leaq	-21(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB54:
	call	_Unwind_Resume
.LEHE54:
.L247:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9673:
	.section	.gcc_except_table
.LLSDA9673:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9673-.LLSDACSB9673
.LLSDACSB9673:
	.uleb128 .LEHB53-.LFB9673
	.uleb128 .LEHE53-.LEHB53
	.uleb128 .L246-.LFB9673
	.uleb128 0
	.uleb128 .LEHB54-.LFB9673
	.uleb128 .LEHE54-.LEHB54
	.uleb128 0
	.uleb128 0
.LLSDACSE9673:
	.section	.text._ZN7BigUIntILm2048EEC2Ev,"axG",@progbits,_ZN7BigUIntILm2048EEC5Ev,comdat
	.size	_ZN7BigUIntILm2048EEC2Ev, .-_ZN7BigUIntILm2048EEC2Ev
	.weak	_ZN7BigUIntILm2048EEC1Ev
	.set	_ZN7BigUIntILm2048EEC1Ev,_ZN7BigUIntILm2048EEC2Ev
	.section	.text._ZNSt24uniform_int_distributionIjEC2Ejj,"axG",@progbits,_ZNSt24uniform_int_distributionIjEC5Ejj,comdat
	.align 2
	.weak	_ZNSt24uniform_int_distributionIjEC2Ejj
	.type	_ZNSt24uniform_int_distributionIjEC2Ejj, @function
_ZNSt24uniform_int_distributionIjEC2Ejj:
.LFB9676:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	_ZNSt24uniform_int_distributionIjE10param_typeC1Ejj
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9676:
	.size	_ZNSt24uniform_int_distributionIjEC2Ejj, .-_ZNSt24uniform_int_distributionIjEC2Ejj
	.weak	_ZNSt24uniform_int_distributionIjEC1Ejj
	.set	_ZNSt24uniform_int_distributionIjEC1Ejj,_ZNSt24uniform_int_distributionIjEC2Ejj
	.section	.text._ZNSt6vectorIjSaIjEE5beginEv,"axG",@progbits,_ZNSt6vectorIjSaIjEE5beginEv,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEE5beginEv
	.type	_ZNSt6vectorIjSaIjEE5beginEv, @function
_ZNSt6vectorIjSaIjEE5beginEv:
.LFB9678:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEC1ERKS1_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9678:
	.size	_ZNSt6vectorIjSaIjEE5beginEv, .-_ZNSt6vectorIjSaIjEE5beginEv
	.section	.text._ZNSt6vectorIjSaIjEE3endEv,"axG",@progbits,_ZNSt6vectorIjSaIjEE3endEv,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEE3endEv
	.type	_ZNSt6vectorIjSaIjEE3endEv, @function
_ZNSt6vectorIjSaIjEE3endEv:
.LFB9679:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEC1ERKS1_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9679:
	.size	_ZNSt6vectorIjSaIjEE3endEv, .-_ZNSt6vectorIjSaIjEE3endEv
	.section	.text._ZN9__gnu_cxxneIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_,"axG",@progbits,_ZN9__gnu_cxxneIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_,comdat
	.weak	_ZN9__gnu_cxxneIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_
	.type	_ZN9__gnu_cxxneIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_, @function
_ZN9__gnu_cxxneIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_:
.LFB9680:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEE4baseEv
	movq	(%rax), %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEE4baseEv
	movq	(%rax), %rax
	cmpq	%rax, %rbx
	setne	%al
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9680:
	.size	_ZN9__gnu_cxxneIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_, .-_ZN9__gnu_cxxneIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_
	.section	.text._ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEppEv,"axG",@progbits,_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEppEv,comdat
	.align 2
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEppEv
	.type	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEppEv, @function
_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEppEv:
.LFB9681:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	4(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9681:
	.size	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEppEv, .-_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEppEv
	.section	.text._ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEdeEv,"axG",@progbits,_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEdeEv,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEdeEv
	.type	_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEdeEv, @function
_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEdeEv:
.LFB9682:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9682:
	.size	_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEdeEv, .-_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEdeEv
	.section	.text._ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_,"axG",@progbits,_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_,comdat
	.align 2
	.weak	_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_
	.type	_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_, @function
_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_:
.LFB9683:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_RKNS0_10param_typeE
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9683:
	.size	_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_, .-_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_
	.section	.text._ZSt4moveIRSt6vectorIjSaIjEEEONSt16remove_referenceIT_E4typeEOS5_,"axG",@progbits,_ZSt4moveIRSt6vectorIjSaIjEEEONSt16remove_referenceIT_E4typeEOS5_,comdat
	.weak	_ZSt4moveIRSt6vectorIjSaIjEEEONSt16remove_referenceIT_E4typeEOS5_
	.type	_ZSt4moveIRSt6vectorIjSaIjEEEONSt16remove_referenceIT_E4typeEOS5_, @function
_ZSt4moveIRSt6vectorIjSaIjEEEONSt16remove_referenceIT_E4typeEOS5_:
.LFB9684:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9684:
	.size	_ZSt4moveIRSt6vectorIjSaIjEEEONSt16remove_referenceIT_E4typeEOS5_, .-_ZSt4moveIRSt6vectorIjSaIjEEEONSt16remove_referenceIT_E4typeEOS5_
	.section	.text._ZNSaIjEC2Ev,"axG",@progbits,_ZNSaIjEC5Ev,comdat
	.align 2
	.weak	_ZNSaIjEC2Ev
	.type	_ZNSaIjEC2Ev, @function
_ZNSaIjEC2Ev:
.LFB9689:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx13new_allocatorIjEC2Ev
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9689:
	.size	_ZNSaIjEC2Ev, .-_ZNSaIjEC2Ev
	.weak	_ZNSaIjEC1Ev
	.set	_ZNSaIjEC1Ev,_ZNSaIjEC2Ev
	.section	.text._ZNSaIjED2Ev,"axG",@progbits,_ZNSaIjED5Ev,comdat
	.align 2
	.weak	_ZNSaIjED2Ev
	.type	_ZNSaIjED2Ev, @function
_ZNSaIjED2Ev:
.LFB9692:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx13new_allocatorIjED2Ev
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9692:
	.size	_ZNSaIjED2Ev, .-_ZNSaIjED2Ev
	.weak	_ZNSaIjED1Ev
	.set	_ZNSaIjED1Ev,_ZNSaIjED2Ev
	.section	.text._ZNSt6vectorIjSaIjEEC2EmRKjRKS0_,"axG",@progbits,_ZNSt6vectorIjSaIjEEC5EmRKjRKS0_,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEEC2EmRKjRKS0_
	.type	_ZNSt6vectorIjSaIjEEC2EmRKjRKS0_, @function
_ZNSt6vectorIjSaIjEEC2EmRKjRKS0_:
.LFB9695:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9695
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB55:
	call	_ZNSt12_Vector_baseIjSaIjEEC2EmRKS0_
.LEHE55:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB56:
	call	_ZNSt6vectorIjSaIjEE18_M_fill_initializeEmRKj
.LEHE56:
	jmp	.L268
.L267:
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEED2Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB57:
	call	_Unwind_Resume
.LEHE57:
.L268:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9695:
	.section	.gcc_except_table
.LLSDA9695:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9695-.LLSDACSB9695
.LLSDACSB9695:
	.uleb128 .LEHB55-.LFB9695
	.uleb128 .LEHE55-.LEHB55
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB56-.LFB9695
	.uleb128 .LEHE56-.LEHB56
	.uleb128 .L267-.LFB9695
	.uleb128 0
	.uleb128 .LEHB57-.LFB9695
	.uleb128 .LEHE57-.LEHB57
	.uleb128 0
	.uleb128 0
.LLSDACSE9695:
	.section	.text._ZNSt6vectorIjSaIjEEC2EmRKjRKS0_,"axG",@progbits,_ZNSt6vectorIjSaIjEEC5EmRKjRKS0_,comdat
	.size	_ZNSt6vectorIjSaIjEEC2EmRKjRKS0_, .-_ZNSt6vectorIjSaIjEEC2EmRKjRKS0_
	.weak	_ZNSt6vectorIjSaIjEEC1EmRKjRKS0_
	.set	_ZNSt6vectorIjSaIjEEC1EmRKjRKS0_,_ZNSt6vectorIjSaIjEEC2EmRKjRKS0_
	.section	.text._ZN7BigUIntILm4096EEC2Em,"axG",@progbits,_ZN7BigUIntILm4096EEC5Em,comdat
	.align 2
	.weak	_ZN7BigUIntILm4096EEC2Em
	.type	_ZN7BigUIntILm4096EEC2Em, @function
_ZN7BigUIntILm4096EEC2Em:
.LFB9698:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm4096EEC1Ev
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movl	%eax, (%rdx)
	movq	-32(%rbp), %rax
	shrq	$32, %rax
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	%ebx, %edx
	movl	%edx, (%rax)
	nop
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9698:
	.size	_ZN7BigUIntILm4096EEC2Em, .-_ZN7BigUIntILm4096EEC2Em
	.weak	_ZN7BigUIntILm4096EEC1Em
	.set	_ZN7BigUIntILm4096EEC1Em,_ZN7BigUIntILm4096EEC2Em
	.section	.text._ZNK7BigUIntILm2048EE4dataEv,"axG",@progbits,_ZNK7BigUIntILm2048EE4dataEv,comdat
	.align 2
	.weak	_ZNK7BigUIntILm2048EE4dataEv
	.type	_ZNK7BigUIntILm2048EE4dataEv, @function
_ZNK7BigUIntILm2048EE4dataEv:
.LFB9700:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9700:
	.size	_ZNK7BigUIntILm2048EE4dataEv, .-_ZNK7BigUIntILm2048EE4dataEv
	.section	.text._ZN7BigUIntILm4096EE4dataEv,"axG",@progbits,_ZN7BigUIntILm4096EE4dataEv,comdat
	.align 2
	.weak	_ZN7BigUIntILm4096EE4dataEv
	.type	_ZN7BigUIntILm4096EE4dataEv, @function
_ZN7BigUIntILm4096EE4dataEv:
.LFB9701:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9701:
	.size	_ZN7BigUIntILm4096EE4dataEv, .-_ZN7BigUIntILm4096EE4dataEv
	.section	.text._ZNSt6vectorIjSaIjEE14_M_move_assignEOS1_St17integral_constantIbLb1EE,"axG",@progbits,_ZNSt6vectorIjSaIjEE14_M_move_assignEOS1_St17integral_constantIbLb1EE,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEE14_M_move_assignEOS1_St17integral_constantIbLb1EE
	.type	_ZNSt6vectorIjSaIjEE14_M_move_assignEOS1_St17integral_constantIbLb1EE, @function
_ZNSt6vectorIjSaIjEE14_M_move_assignEOS1_St17integral_constantIbLb1EE:
.LFB9702:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9702
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rdx
	leaq	-17(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt12_Vector_baseIjSaIjEE13get_allocatorEv
	leaq	-17(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEC1ERKS0_
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjED1Ev
	movq	-56(%rbp), %rax
	leaq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE12_Vector_impl12_M_swap_dataERS2_
	movq	-56(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE12_Vector_impl12_M_swap_dataERS2_
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv
	movq	%rax, %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZSt15__alloc_on_moveISaIjEEvRT_S2_
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEED1Ev
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9702:
	.section	.gcc_except_table
.LLSDA9702:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9702-.LLSDACSB9702
.LLSDACSB9702:
.LLSDACSE9702:
	.section	.text._ZNSt6vectorIjSaIjEE14_M_move_assignEOS1_St17integral_constantIbLb1EE,"axG",@progbits,_ZNSt6vectorIjSaIjEE14_M_move_assignEOS1_St17integral_constantIbLb1EE,comdat
	.size	_ZNSt6vectorIjSaIjEE14_M_move_assignEOS1_St17integral_constantIbLb1EE, .-_ZNSt6vectorIjSaIjEE14_M_move_assignEOS1_St17integral_constantIbLb1EE
	.section	.text._ZNKSt6vectorIjSaIjEE4dataEv,"axG",@progbits,_ZNKSt6vectorIjSaIjEE4dataEv,comdat
	.align 2
	.weak	_ZNKSt6vectorIjSaIjEE4dataEv
	.type	_ZNKSt6vectorIjSaIjEE4dataEv, @function
_ZNKSt6vectorIjSaIjEE4dataEv:
.LFB9703:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE11_M_data_ptrIjEEPT_S4_
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9703:
	.size	_ZNKSt6vectorIjSaIjEE4dataEv, .-_ZNKSt6vectorIjSaIjEE4dataEv
	.section	.text._ZNK7BigUIntILm4096EE7compareERKS0_,"axG",@progbits,_ZNK7BigUIntILm4096EE7compareERKS0_,comdat
	.align 2
	.weak	_ZNK7BigUIntILm4096EE7compareERKS0_
	.type	_ZNK7BigUIntILm4096EE7compareERKS0_, @function
_ZNK7BigUIntILm4096EE7compareERKS0_:
.LFB9704:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE7crbeginEv
	movq	-56(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE5crendEv
	movq	-64(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE7crbeginEv
.L282:
	leaq	-32(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZStneIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_
	testb	%al, %al
	je	.L278
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %ebx
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %eax
	cmpl	%eax, %ebx
	seta	%al
	testb	%al, %al
	je	.L279
	movl	$1, %eax
	jmp	.L283
.L279:
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %ebx
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %eax
	cmpl	%eax, %ebx
	setb	%al
	testb	%al, %al
	je	.L281
	movl	$-1, %eax
	jmp	.L283
.L281:
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv
	jmp	.L282
.L278:
	movl	$0, %eax
.L283:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9704:
	.size	_ZNK7BigUIntILm4096EE7compareERKS0_, .-_ZNK7BigUIntILm4096EE7compareERKS0_
	.section	.text._ZNSt6vectorIjSaIjEEC2ERKS1_,"axG",@progbits,_ZNSt6vectorIjSaIjEEC5ERKS1_,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEEC2ERKS1_
	.type	_ZNSt6vectorIjSaIjEEC2ERKS1_, @function
_ZNSt6vectorIjSaIjEEC2ERKS1_:
.LFB9709:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9709
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv
	movq	%rax, %rdx
	leaq	-33(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB58:
	call	_ZN9__gnu_cxx14__alloc_traitsISaIjEjE17_S_select_on_copyERKS1_
.LEHE58:
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE4sizeEv
	movq	%rax, %rcx
	leaq	-33(%rbp), %rax
	movq	%rax, %rdx
	movq	%rcx, %rsi
	movq	%rbx, %rdi
.LEHB59:
	call	_ZNSt12_Vector_baseIjSaIjEEC2EmRKS0_
.LEHE59:
	leaq	-33(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjED1Ev
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv
	movq	%rax, %r13
	movq	-56(%rbp), %rax
	movq	(%rax), %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE3endEv
	movq	%rax, %r12
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE5beginEv
	movq	%r13, %rcx
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%rax, %rdi
.LEHB60:
	call	_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjjET0_T_SA_S9_RSaIT1_E
.LEHE60:
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L289
.L287:
	movq	%rax, %rbx
	leaq	-33(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB61:
	call	_Unwind_Resume
.L288:
	movq	%rax, %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEED2Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume
.LEHE61:
.L289:
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9709:
	.section	.gcc_except_table
.LLSDA9709:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9709-.LLSDACSB9709
.LLSDACSB9709:
	.uleb128 .LEHB58-.LFB9709
	.uleb128 .LEHE58-.LEHB58
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB59-.LFB9709
	.uleb128 .LEHE59-.LEHB59
	.uleb128 .L287-.LFB9709
	.uleb128 0
	.uleb128 .LEHB60-.LFB9709
	.uleb128 .LEHE60-.LEHB60
	.uleb128 .L288-.LFB9709
	.uleb128 0
	.uleb128 .LEHB61-.LFB9709
	.uleb128 .LEHE61-.LEHB61
	.uleb128 0
	.uleb128 0
.LLSDACSE9709:
	.section	.text._ZNSt6vectorIjSaIjEEC2ERKS1_,"axG",@progbits,_ZNSt6vectorIjSaIjEEC5ERKS1_,comdat
	.size	_ZNSt6vectorIjSaIjEEC2ERKS1_, .-_ZNSt6vectorIjSaIjEEC2ERKS1_
	.weak	_ZNSt6vectorIjSaIjEEC1ERKS1_
	.set	_ZNSt6vectorIjSaIjEEC1ERKS1_,_ZNSt6vectorIjSaIjEEC2ERKS1_
	.section	.rodata
.LC13:
	.string	"(quotient & ~mask_) == 0"
	.section	.text._ZN7BigUIntILm4096EE9divideU32Ej,"axG",@progbits,_ZN7BigUIntILm4096EE9divideU32Ej,comdat
	.align 2
	.weak	_ZN7BigUIntILm4096EE9divideU32Ej
	.type	_ZN7BigUIntILm4096EE9divideU32Ej, @function
_ZN7BigUIntILm4096EE9divideU32Ej:
.LFB9711:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	$0, -4(%rbp)
	movq	$0, -16(%rbp)
	movq	-56(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEE6rbeginEv
.L293:
	movq	-56(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEE4rendEv
	leaq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZStneIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_
	testb	%al, %al
	je	.L291
	movl	-4(%rbp), %eax
	salq	$32, %rax
	movq	%rax, -16(%rbp)
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %eax
	movl	%eax, %eax
	orq	%rax, -16(%rbp)
	movl	-60(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	$0, %edx
	divq	%rcx
	movq	%rax, -24(%rbp)
	movl	-60(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	$0, %edx
	divq	%rcx
	movq	%rdx, %rax
	movl	%eax, -4(%rbp)
	movabsq	$-4294967296, %rax
	andq	-24(%rbp), %rax
	testq	%rax, %rax
	je	.L292
	movl	$_ZZN7BigUIntILm4096EE9divideU32EjE19__PRETTY_FUNCTION__, %ecx
	movl	$473, %edx
	movl	$.LC11, %esi
	movl	$.LC13, %edi
	call	__assert_fail
.L292:
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	%eax, (%rdx)
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEppEv
	jmp	.L293
.L291:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9711:
	.size	_ZN7BigUIntILm4096EE9divideU32Ej, .-_ZN7BigUIntILm4096EE9divideU32Ej
	.section	.text._ZSt7reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_,"axG",@progbits,_ZSt7reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_,comdat
	.weak	_ZSt7reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_
	.type	_ZSt7reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_, @function
_ZSt7reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_:
.LFB9717:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt19__iterator_categoryIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEENSt15iterator_traitsIT_E17iterator_categoryERKSB_
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt9__reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_St26random_access_iterator_tag
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9717:
	.size	_ZSt7reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_, .-_ZSt7reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_
	.section	.text._ZN7BigUIntILm128EEC2Ev,"axG",@progbits,_ZN7BigUIntILm128EEC5Ev,comdat
	.align 2
	.weak	_ZN7BigUIntILm128EEC2Ev
	.type	_ZN7BigUIntILm128EEC2Ev, @function
_ZN7BigUIntILm128EEC2Ev:
.LFB9720:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9720
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rbx
	leaq	-21(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjEC1Ev
	movl	$0, -20(%rbp)
	leaq	-21(%rbp), %rdx
	leaq	-20(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$4, %esi
	movq	%rbx, %rdi
.LEHB62:
	call	_ZNSt6vectorIjSaIjEEC1EmRKjRKS0_
.LEHE62:
	leaq	-21(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjED1Ev
	jmp	.L299
.L298:
	movq	%rax, %rbx
	leaq	-21(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB63:
	call	_Unwind_Resume
.LEHE63:
.L299:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9720:
	.section	.gcc_except_table
.LLSDA9720:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9720-.LLSDACSB9720
.LLSDACSB9720:
	.uleb128 .LEHB62-.LFB9720
	.uleb128 .LEHE62-.LEHB62
	.uleb128 .L298-.LFB9720
	.uleb128 0
	.uleb128 .LEHB63-.LFB9720
	.uleb128 .LEHE63-.LEHB63
	.uleb128 0
	.uleb128 0
.LLSDACSE9720:
	.section	.text._ZN7BigUIntILm128EEC2Ev,"axG",@progbits,_ZN7BigUIntILm128EEC5Ev,comdat
	.size	_ZN7BigUIntILm128EEC2Ev, .-_ZN7BigUIntILm128EEC2Ev
	.weak	_ZN7BigUIntILm128EEC1Ev
	.set	_ZN7BigUIntILm128EEC1Ev,_ZN7BigUIntILm128EEC2Ev
	.section	.text._ZN9__gnu_cxxneIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_,"axG",@progbits,_ZN9__gnu_cxxneIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_,comdat
	.weak	_ZN9__gnu_cxxneIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_
	.type	_ZN9__gnu_cxxneIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_, @function
_ZN9__gnu_cxxneIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_:
.LFB9723:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	movq	(%rax), %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	movq	(%rax), %rax
	cmpq	%rax, %rbx
	setne	%al
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9723:
	.size	_ZN9__gnu_cxxneIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_, .-_ZN9__gnu_cxxneIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_
	.section	.text._ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv,"axG",@progbits,_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv,comdat
	.align 2
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv
	.type	_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv, @function
_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv:
.LFB9725:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9725:
	.size	_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv, .-_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv
	.section	.text._ZN7BigUIntILm128EEC2Em,"axG",@progbits,_ZN7BigUIntILm128EEC5Em,comdat
	.align 2
	.weak	_ZN7BigUIntILm128EEC2Em
	.type	_ZN7BigUIntILm128EEC2Em, @function
_ZN7BigUIntILm128EEC2Em:
.LFB9727:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EEC1Ev
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movl	%eax, (%rdx)
	movq	-32(%rbp), %rax
	shrq	$32, %rax
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	%ebx, %edx
	movl	%edx, (%rax)
	nop
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9727:
	.size	_ZN7BigUIntILm128EEC2Em, .-_ZN7BigUIntILm128EEC2Em
	.weak	_ZN7BigUIntILm128EEC1Em
	.set	_ZN7BigUIntILm128EEC1Em,_ZN7BigUIntILm128EEC2Em
	.section	.text._ZN7BigUIntILm128EEaSEOS0_,"axG",@progbits,_ZN7BigUIntILm128EEaSEOS0_,comdat
	.align 2
	.weak	_ZN7BigUIntILm128EEaSEOS0_
	.type	_ZN7BigUIntILm128EEaSEOS0_, @function
_ZN7BigUIntILm128EEaSEOS0_:
.LFB9730:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEaSEOS1_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9730:
	.size	_ZN7BigUIntILm128EEaSEOS0_, .-_ZN7BigUIntILm128EEaSEOS0_
	.section	.text._ZN7BigUIntILm128EEmLERKS0_,"axG",@progbits,_ZN7BigUIntILm128EEmLERKS0_,comdat
	.align 2
	.weak	_ZN7BigUIntILm128EEmLERKS0_
	.type	_ZN7BigUIntILm128EEmLERKS0_, @function
_ZN7BigUIntILm128EEmLERKS0_:
.LFB9729:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	leaq	-32(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm128EEmlERKS0_
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveI7BigUIntILm128EEEONSt16remove_referenceIT_E4typeEOS3_
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EEaSEOS0_
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	movq	-40(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9729:
	.size	_ZN7BigUIntILm128EEmLERKS0_, .-_ZN7BigUIntILm128EEmLERKS0_
	.section	.text._ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv,"axG",@progbits,_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv
	.type	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv, @function
_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv:
.LFB9731:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9731:
	.size	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv, .-_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv
	.section	.text._ZN7BigUIntILm128EEpLERKS0_,"axG",@progbits,_ZN7BigUIntILm128EEpLERKS0_,comdat
	.align 2
	.weak	_ZN7BigUIntILm128EEpLERKS0_
	.type	_ZN7BigUIntILm128EEpLERKS0_, @function
_ZN7BigUIntILm128EEpLERKS0_:
.LFB9732:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	leaq	-48(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm128EEplERKS0_
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRSt6vectorIjSaIjEEEONSt16remove_referenceIT_E4typeEOS5_
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEaSEOS1_
	movq	-56(%rbp), %rbx
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EED1Ev
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9732:
	.size	_ZN7BigUIntILm128EEpLERKS0_, .-_ZN7BigUIntILm128EEpLERKS0_
	.section	.text._ZNK7BigUIntILm128EEgtERKS0_,"axG",@progbits,_ZNK7BigUIntILm128EEgtERKS0_,comdat
	.align 2
	.weak	_ZNK7BigUIntILm128EEgtERKS0_
	.type	_ZNK7BigUIntILm128EEgtERKS0_, @function
_ZNK7BigUIntILm128EEgtERKS0_:
.LFB9733:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm128EE7compareERKS0_
	testl	%eax, %eax
	setg	%al
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9733:
	.size	_ZNK7BigUIntILm128EEgtERKS0_, .-_ZNK7BigUIntILm128EEgtERKS0_
	.section	.text._ZN7BigUIntILm128EE9divideU32Ej,"axG",@progbits,_ZN7BigUIntILm128EE9divideU32Ej,comdat
	.align 2
	.weak	_ZN7BigUIntILm128EE9divideU32Ej
	.type	_ZN7BigUIntILm128EE9divideU32Ej, @function
_ZN7BigUIntILm128EE9divideU32Ej:
.LFB9734:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	$0, -4(%rbp)
	movq	$0, -16(%rbp)
	movq	-56(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEE6rbeginEv
.L318:
	movq	-56(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEE4rendEv
	leaq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZStneIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_
	testb	%al, %al
	je	.L316
	movl	-4(%rbp), %eax
	salq	$32, %rax
	movq	%rax, -16(%rbp)
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %eax
	movl	%eax, %eax
	orq	%rax, -16(%rbp)
	movl	-60(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	$0, %edx
	divq	%rcx
	movq	%rax, -24(%rbp)
	movl	-60(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	$0, %edx
	divq	%rcx
	movq	%rdx, %rax
	movl	%eax, -4(%rbp)
	movabsq	$-4294967296, %rax
	andq	-24(%rbp), %rax
	testq	%rax, %rax
	je	.L317
	movl	$_ZZN7BigUIntILm128EE9divideU32EjE19__PRETTY_FUNCTION__, %ecx
	movl	$473, %edx
	movl	$.LC11, %esi
	movl	$.LC13, %edi
	call	__assert_fail
.L317:
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	%eax, (%rdx)
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEppEv
	jmp	.L318
.L316:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9734:
	.size	_ZN7BigUIntILm128EE9divideU32Ej, .-_ZN7BigUIntILm128EE9divideU32Ej
	.section	.text._ZN7BigUIntILm256EEC2Em,"axG",@progbits,_ZN7BigUIntILm256EEC5Em,comdat
	.align 2
	.weak	_ZN7BigUIntILm256EEC2Em
	.type	_ZN7BigUIntILm256EEC2Em, @function
_ZN7BigUIntILm256EEC2Em:
.LFB9736:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm256EEC1Ev
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movl	%eax, (%rdx)
	movq	-32(%rbp), %rax
	shrq	$32, %rax
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	%ebx, %edx
	movl	%edx, (%rax)
	nop
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9736:
	.size	_ZN7BigUIntILm256EEC2Em, .-_ZN7BigUIntILm256EEC2Em
	.weak	_ZN7BigUIntILm256EEC1Em
	.set	_ZN7BigUIntILm256EEC1Em,_ZN7BigUIntILm256EEC2Em
	.section	.text._ZNK7BigUIntILm128EE4dataEv,"axG",@progbits,_ZNK7BigUIntILm128EE4dataEv,comdat
	.align 2
	.weak	_ZNK7BigUIntILm128EE4dataEv
	.type	_ZNK7BigUIntILm128EE4dataEv, @function
_ZNK7BigUIntILm128EE4dataEv:
.LFB9738:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9738:
	.size	_ZNK7BigUIntILm128EE4dataEv, .-_ZNK7BigUIntILm128EE4dataEv
	.section	.text._ZN7BigUIntILm256EE4dataEv,"axG",@progbits,_ZN7BigUIntILm256EE4dataEv,comdat
	.align 2
	.weak	_ZN7BigUIntILm256EE4dataEv
	.type	_ZN7BigUIntILm256EE4dataEv, @function
_ZN7BigUIntILm256EE4dataEv:
.LFB9739:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9739:
	.size	_ZN7BigUIntILm256EE4dataEv, .-_ZN7BigUIntILm256EE4dataEv
	.section	.text._ZN7BigUIntILm256EEC2Ev,"axG",@progbits,_ZN7BigUIntILm256EEC5Ev,comdat
	.align 2
	.weak	_ZN7BigUIntILm256EEC2Ev
	.type	_ZN7BigUIntILm256EEC2Ev, @function
_ZN7BigUIntILm256EEC2Ev:
.LFB9741:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9741
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rbx
	leaq	-21(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjEC1Ev
	movl	$0, -20(%rbp)
	leaq	-21(%rbp), %rdx
	leaq	-20(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$8, %esi
	movq	%rbx, %rdi
.LEHB64:
	call	_ZNSt6vectorIjSaIjEEC1EmRKjRKS0_
.LEHE64:
	leaq	-21(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjED1Ev
	jmp	.L328
.L327:
	movq	%rax, %rbx
	leaq	-21(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIjED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB65:
	call	_Unwind_Resume
.LEHE65:
.L328:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9741:
	.section	.gcc_except_table
.LLSDA9741:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9741-.LLSDACSB9741
.LLSDACSB9741:
	.uleb128 .LEHB64-.LFB9741
	.uleb128 .LEHE64-.LEHB64
	.uleb128 .L327-.LFB9741
	.uleb128 0
	.uleb128 .LEHB65-.LFB9741
	.uleb128 .LEHE65-.LEHB65
	.uleb128 0
	.uleb128 0
.LLSDACSE9741:
	.section	.text._ZN7BigUIntILm256EEC2Ev,"axG",@progbits,_ZN7BigUIntILm256EEC5Ev,comdat
	.size	_ZN7BigUIntILm256EEC2Ev, .-_ZN7BigUIntILm256EEC2Ev
	.weak	_ZN7BigUIntILm256EEC1Ev
	.set	_ZN7BigUIntILm256EEC1Ev,_ZN7BigUIntILm256EEC2Ev
	.section	.text._ZNK7BigUIntILm256EEgtERKS0_,"axG",@progbits,_ZNK7BigUIntILm256EEgtERKS0_,comdat
	.align 2
	.weak	_ZNK7BigUIntILm256EEgtERKS0_
	.type	_ZNK7BigUIntILm256EEgtERKS0_, @function
_ZNK7BigUIntILm256EEgtERKS0_:
.LFB9743:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNK7BigUIntILm256EE7compareERKS0_
	testl	%eax, %eax
	setg	%al
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9743:
	.size	_ZNK7BigUIntILm256EEgtERKS0_, .-_ZNK7BigUIntILm256EEgtERKS0_
	.section	.text._ZN7BigUIntILm256EE9divideU32Ej,"axG",@progbits,_ZN7BigUIntILm256EE9divideU32Ej,comdat
	.align 2
	.weak	_ZN7BigUIntILm256EE9divideU32Ej
	.type	_ZN7BigUIntILm256EE9divideU32Ej, @function
_ZN7BigUIntILm256EE9divideU32Ej:
.LFB9744:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	$0, -4(%rbp)
	movq	$0, -16(%rbp)
	movq	-56(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEE6rbeginEv
.L334:
	movq	-56(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEE4rendEv
	leaq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZStneIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_
	testb	%al, %al
	je	.L332
	movl	-4(%rbp), %eax
	salq	$32, %rax
	movq	%rax, -16(%rbp)
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %eax
	movl	%eax, %eax
	orq	%rax, -16(%rbp)
	movl	-60(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	$0, %edx
	divq	%rcx
	movq	%rax, -24(%rbp)
	movl	-60(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	$0, %edx
	divq	%rcx
	movq	%rdx, %rax
	movl	%eax, -4(%rbp)
	movabsq	$-4294967296, %rax
	andq	-24(%rbp), %rax
	testq	%rax, %rax
	je	.L333
	movl	$_ZZN7BigUIntILm256EE9divideU32EjE19__PRETTY_FUNCTION__, %ecx
	movl	$473, %edx
	movl	$.LC11, %esi
	movl	$.LC13, %edi
	call	__assert_fail
.L333:
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	%eax, (%rdx)
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEppEv
	jmp	.L334
.L332:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9744:
	.size	_ZN7BigUIntILm256EE9divideU32Ej, .-_ZN7BigUIntILm256EE9divideU32Ej
	.section	.text._ZNSt6chrono20__duration_cast_implINS_8durationIdSt5ratioILl1ELl1EEEES2_ILl1ELl1000000000EEdLb1ELb0EE6__castIlS5_EES4_RKNS1_IT_T0_EE,"axG",@progbits,_ZNSt6chrono20__duration_cast_implINS_8durationIdSt5ratioILl1ELl1EEEES2_ILl1ELl1000000000EEdLb1ELb0EE6__castIlS5_EES4_RKNS1_IT_T0_EE,comdat
	.weak	_ZNSt6chrono20__duration_cast_implINS_8durationIdSt5ratioILl1ELl1EEEES2_ILl1ELl1000000000EEdLb1ELb0EE6__castIlS5_EES4_RKNS1_IT_T0_EE
	.type	_ZNSt6chrono20__duration_cast_implINS_8durationIdSt5ratioILl1ELl1EEEES2_ILl1ELl1000000000EEdLb1ELb0EE6__castIlS5_EES4_RKNS1_IT_T0_EE, @function
_ZNSt6chrono20__duration_cast_implINS_8durationIdSt5ratioILl1ELl1EEEES2_ILl1ELl1000000000EEdLb1ELb0EE6__castIlS5_EES4_RKNS1_IT_T0_EE:
.LFB9781:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovsd	.LC14(%rip), %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -8(%rbp)
	leaq	-8(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC1IdvEERKT_
	vmovsd	-16(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9781:
	.size	_ZNSt6chrono20__duration_cast_implINS_8durationIdSt5ratioILl1ELl1EEEES2_ILl1ELl1000000000EEdLb1ELb0EE6__castIlS5_EES4_RKNS1_IT_T0_EE, .-_ZNSt6chrono20__duration_cast_implINS_8durationIdSt5ratioILl1ELl1EEEES2_ILl1ELl1000000000EEdLb1ELb0EE6__castIlS5_EES4_RKNS1_IT_T0_EE
	.section	.text._ZNSt12_Vector_baseIjSaIjEE13_M_deallocateEPjm,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEE13_M_deallocateEPjm,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseIjSaIjEE13_M_deallocateEPjm
	.type	_ZNSt12_Vector_baseIjSaIjEE13_M_deallocateEPjm, @function
_ZNSt12_Vector_baseIjSaIjEE13_M_deallocateEPjm:
.LFB9854:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L340
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt16allocator_traitsISaIjEE10deallocateERS0_Pjm
.L340:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9854:
	.size	_ZNSt12_Vector_baseIjSaIjEE13_M_deallocateEPjm, .-_ZNSt12_Vector_baseIjSaIjEE13_M_deallocateEPjm
	.section	.text._ZSt8_DestroyIPjEvT_S1_,"axG",@progbits,_ZSt8_DestroyIPjEvT_S1_,comdat
	.weak	_ZSt8_DestroyIPjEvT_S1_
	.type	_ZSt8_DestroyIPjEvT_S1_, @function
_ZSt8_DestroyIPjEvT_S1_:
.LFB9855:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Destroy_auxILb1EE9__destroyIPjEEvT_S3_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9855:
	.size	_ZSt8_DestroyIPjEvT_S1_, .-_ZSt8_DestroyIPjEvT_S1_
	.section	.text._ZNSt24uniform_int_distributionIjE10param_typeC2Ejj,"axG",@progbits,_ZNSt24uniform_int_distributionIjE10param_typeC5Ejj,comdat
	.align 2
	.weak	_ZNSt24uniform_int_distributionIjE10param_typeC2Ejj
	.type	_ZNSt24uniform_int_distributionIjE10param_typeC2Ejj, @function
_ZNSt24uniform_int_distributionIjE10param_typeC2Ejj:
.LFB9872:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	-16(%rbp), %edx
	movl	%edx, 4(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9872:
	.size	_ZNSt24uniform_int_distributionIjE10param_typeC2Ejj, .-_ZNSt24uniform_int_distributionIjE10param_typeC2Ejj
	.weak	_ZNSt24uniform_int_distributionIjE10param_typeC1Ejj
	.set	_ZNSt24uniform_int_distributionIjE10param_typeC1Ejj,_ZNSt24uniform_int_distributionIjE10param_typeC2Ejj
	.section	.text._ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEC2ERKS1_,"axG",@progbits,_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEC5ERKS1_,comdat
	.align 2
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEC2ERKS1_
	.type	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEC2ERKS1_, @function
_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEC2ERKS1_:
.LFB9875:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9875:
	.size	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEC2ERKS1_, .-_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEC2ERKS1_
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEC1ERKS1_
	.set	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEC1ERKS1_,_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEC2ERKS1_
	.section	.text._ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEE4baseEv,"axG",@progbits,_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEE4baseEv,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEE4baseEv
	.type	_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEE4baseEv, @function
_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEE4baseEv:
.LFB9877:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9877:
	.size	_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEE4baseEv, .-_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEE4baseEv
	.section	.text._ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_RKNS0_10param_typeE,"axG",@progbits,_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_RKNS0_10param_typeE,comdat
	.align 2
	.weak	_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_RKNS0_10param_typeE
	.type	_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_RKNS0_10param_typeE, @function
_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_RKNS0_10param_typeE:
.LFB9878:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movl	$0, -24(%rbp)
	movl	$-1, -28(%rbp)
	movl	$-1, -32(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt24uniform_int_distributionIjE10param_type1bEv
	movl	%eax, %ebx
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt24uniform_int_distributionIjE10param_type1aEv
	subl	%eax, %ebx
	movl	%ebx, %eax
	movl	%eax, -36(%rbp)
	cmpl	$-1, -36(%rbp)
	je	.L352
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	movl	$-1, %eax
	movl	$0, %edx
	divl	-40(%rbp)
	movl	%eax, -44(%rbp)
	movl	-40(%rbp), %eax
	imull	-44(%rbp), %eax
	movl	%eax, -48(%rbp)
.L349:
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt13random_deviceclEv
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jb	.L348
	jmp	.L349
.L348:
	movl	-20(%rbp), %eax
	movl	$0, %edx
	divl	-44(%rbp)
	movl	%eax, -20(%rbp)
	jmp	.L350
.L352:
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt13random_deviceclEv
	movl	%eax, -20(%rbp)
.L350:
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt24uniform_int_distributionIjE10param_type1aEv
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9878:
	.size	_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_RKNS0_10param_typeE, .-_ZNSt24uniform_int_distributionIjEclISt13random_deviceEEjRT_RKNS0_10param_typeE
	.section	.text._ZSt4moveIRSaIjEEONSt16remove_referenceIT_E4typeEOS3_,"axG",@progbits,_ZSt4moveIRSaIjEEONSt16remove_referenceIT_E4typeEOS3_,comdat
	.weak	_ZSt4moveIRSaIjEEONSt16remove_referenceIT_E4typeEOS3_
	.type	_ZSt4moveIRSaIjEEONSt16remove_referenceIT_E4typeEOS3_, @function
_ZSt4moveIRSaIjEEONSt16remove_referenceIT_E4typeEOS3_:
.LFB9879:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9879:
	.size	_ZSt4moveIRSaIjEEONSt16remove_referenceIT_E4typeEOS3_, .-_ZSt4moveIRSaIjEEONSt16remove_referenceIT_E4typeEOS3_
	.section	.text._ZNSt12_Vector_baseIjSaIjEE12_Vector_impl12_M_swap_dataERS2_,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEE12_Vector_impl12_M_swap_dataERS2_,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseIjSaIjEE12_Vector_impl12_M_swap_dataERS2_
	.type	_ZNSt12_Vector_baseIjSaIjEE12_Vector_impl12_M_swap_dataERS2_, @function
_ZNSt12_Vector_baseIjSaIjEE12_Vector_impl12_M_swap_dataERS2_:
.LFB9883:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt4swapIPjENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SF_
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt4swapIPjENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SF_
	movq	-16(%rbp), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	$16, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt4swapIPjENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SF_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9883:
	.size	_ZNSt12_Vector_baseIjSaIjEE12_Vector_impl12_M_swap_dataERS2_, .-_ZNSt12_Vector_baseIjSaIjEE12_Vector_impl12_M_swap_dataERS2_
	.section	.text._ZN9__gnu_cxx13new_allocatorIjEC2Ev,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorIjEC5Ev,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorIjEC2Ev
	.type	_ZN9__gnu_cxx13new_allocatorIjEC2Ev, @function
_ZN9__gnu_cxx13new_allocatorIjEC2Ev:
.LFB9885:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9885:
	.size	_ZN9__gnu_cxx13new_allocatorIjEC2Ev, .-_ZN9__gnu_cxx13new_allocatorIjEC2Ev
	.weak	_ZN9__gnu_cxx13new_allocatorIjEC1Ev
	.set	_ZN9__gnu_cxx13new_allocatorIjEC1Ev,_ZN9__gnu_cxx13new_allocatorIjEC2Ev
	.section	.text._ZN9__gnu_cxx13new_allocatorIjED2Ev,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorIjED5Ev,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorIjED2Ev
	.type	_ZN9__gnu_cxx13new_allocatorIjED2Ev, @function
_ZN9__gnu_cxx13new_allocatorIjED2Ev:
.LFB9888:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9888:
	.size	_ZN9__gnu_cxx13new_allocatorIjED2Ev, .-_ZN9__gnu_cxx13new_allocatorIjED2Ev
	.weak	_ZN9__gnu_cxx13new_allocatorIjED1Ev
	.set	_ZN9__gnu_cxx13new_allocatorIjED1Ev,_ZN9__gnu_cxx13new_allocatorIjED2Ev
	.section	.text._ZNSt12_Vector_baseIjSaIjEEC2EmRKS0_,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEEC5EmRKS0_,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseIjSaIjEEC2EmRKS0_
	.type	_ZNSt12_Vector_baseIjSaIjEEC2EmRKS0_, @function
_ZNSt12_Vector_baseIjSaIjEEC2EmRKS0_:
.LFB9891:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA9891
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implC1ERKS0_
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB66:
	call	_ZNSt12_Vector_baseIjSaIjEE17_M_create_storageEm
.LEHE66:
	jmp	.L361
.L360:
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implD1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB67:
	call	_Unwind_Resume
.LEHE67:
.L361:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9891:
	.section	.gcc_except_table
.LLSDA9891:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9891-.LLSDACSB9891
.LLSDACSB9891:
	.uleb128 .LEHB66-.LFB9891
	.uleb128 .LEHE66-.LEHB66
	.uleb128 .L360-.LFB9891
	.uleb128 0
	.uleb128 .LEHB67-.LFB9891
	.uleb128 .LEHE67-.LEHB67
	.uleb128 0
	.uleb128 0
.LLSDACSE9891:
	.section	.text._ZNSt12_Vector_baseIjSaIjEEC2EmRKS0_,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEEC5EmRKS0_,comdat
	.size	_ZNSt12_Vector_baseIjSaIjEEC2EmRKS0_, .-_ZNSt12_Vector_baseIjSaIjEEC2EmRKS0_
	.weak	_ZNSt12_Vector_baseIjSaIjEEC1EmRKS0_
	.set	_ZNSt12_Vector_baseIjSaIjEEC1EmRKS0_,_ZNSt12_Vector_baseIjSaIjEEC2EmRKS0_
	.section	.text._ZNSt6vectorIjSaIjEE18_M_fill_initializeEmRKj,"axG",@progbits,_ZNSt6vectorIjSaIjEE18_M_fill_initializeEmRKj,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEE18_M_fill_initializeEmRKj
	.type	_ZNSt6vectorIjSaIjEE18_M_fill_initializeEmRKj, @function
_ZNSt6vectorIjSaIjEE18_M_fill_initializeEmRKj:
.LFB9893:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rax, %rdi
	call	_ZSt24__uninitialized_fill_n_aIPjmjjET_S1_T0_RKT1_RSaIT2_E
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9893:
	.size	_ZNSt6vectorIjSaIjEE18_M_fill_initializeEmRKj, .-_ZNSt6vectorIjSaIjEE18_M_fill_initializeEmRKj
	.section	.text._ZNKSt12_Vector_baseIjSaIjEE13get_allocatorEv,"axG",@progbits,_ZNKSt12_Vector_baseIjSaIjEE13get_allocatorEv,comdat
	.align 2
	.weak	_ZNKSt12_Vector_baseIjSaIjEE13get_allocatorEv
	.type	_ZNKSt12_Vector_baseIjSaIjEE13get_allocatorEv, @function
_ZNKSt12_Vector_baseIjSaIjEE13get_allocatorEv:
.LFB9894:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSaIjEC1ERKS_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9894:
	.size	_ZNKSt12_Vector_baseIjSaIjEE13get_allocatorEv, .-_ZNKSt12_Vector_baseIjSaIjEE13get_allocatorEv
	.section	.text._ZNSt6vectorIjSaIjEEC2ERKS0_,"axG",@progbits,_ZNSt6vectorIjSaIjEEC5ERKS0_,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEEC2ERKS0_
	.type	_ZNSt6vectorIjSaIjEEC2ERKS0_, @function
_ZNSt6vectorIjSaIjEEC2ERKS0_:
.LFB9896:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEEC2ERKS0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9896:
	.size	_ZNSt6vectorIjSaIjEEC2ERKS0_, .-_ZNSt6vectorIjSaIjEEC2ERKS0_
	.weak	_ZNSt6vectorIjSaIjEEC1ERKS0_
	.set	_ZNSt6vectorIjSaIjEEC1ERKS0_,_ZNSt6vectorIjSaIjEEC2ERKS0_
	.section	.text._ZSt15__alloc_on_moveISaIjEEvRT_S2_,"axG",@progbits,_ZSt15__alloc_on_moveISaIjEEvRT_S2_,comdat
	.weak	_ZSt15__alloc_on_moveISaIjEEvRT_S2_
	.type	_ZSt15__alloc_on_moveISaIjEEvRT_S2_, @function
_ZSt15__alloc_on_moveISaIjEEvRT_S2_:
.LFB9898:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt18__do_alloc_on_moveISaIjEEvRT_S2_St17integral_constantIbLb1EE
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9898:
	.size	_ZSt15__alloc_on_moveISaIjEEvRT_S2_, .-_ZSt15__alloc_on_moveISaIjEEvRT_S2_
	.section	.text._ZNKSt6vectorIjSaIjEE11_M_data_ptrIjEEPT_S4_,"axG",@progbits,_ZNKSt6vectorIjSaIjEE11_M_data_ptrIjEEPT_S4_,comdat
	.align 2
	.weak	_ZNKSt6vectorIjSaIjEE11_M_data_ptrIjEEPT_S4_
	.type	_ZNKSt6vectorIjSaIjEE11_M_data_ptrIjEEPT_S4_, @function
_ZNKSt6vectorIjSaIjEE11_M_data_ptrIjEEPT_S4_:
.LFB9899:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9899:
	.size	_ZNKSt6vectorIjSaIjEE11_M_data_ptrIjEEPT_S4_, .-_ZNKSt6vectorIjSaIjEE11_M_data_ptrIjEEPT_S4_
	.section	.text._ZNKSt6vectorIjSaIjEE7crbeginEv,"axG",@progbits,_ZNKSt6vectorIjSaIjEE7crbeginEv,comdat
	.align 2
	.weak	_ZNKSt6vectorIjSaIjEE7crbeginEv
	.type	_ZNKSt6vectorIjSaIjEE7crbeginEv, @function
_ZNKSt6vectorIjSaIjEE7crbeginEv:
.LFB9900:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE3endEv
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEC1ES7_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9900:
	.size	_ZNKSt6vectorIjSaIjEE7crbeginEv, .-_ZNKSt6vectorIjSaIjEE7crbeginEv
	.section	.text._ZNKSt6vectorIjSaIjEE5crendEv,"axG",@progbits,_ZNKSt6vectorIjSaIjEE5crendEv,comdat
	.align 2
	.weak	_ZNKSt6vectorIjSaIjEE5crendEv
	.type	_ZNKSt6vectorIjSaIjEE5crendEv, @function
_ZNKSt6vectorIjSaIjEE5crendEv:
.LFB9904:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE5beginEv
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEC1ES7_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9904:
	.size	_ZNKSt6vectorIjSaIjEE5crendEv, .-_ZNKSt6vectorIjSaIjEE5crendEv
	.section	.text._ZStneIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_,"axG",@progbits,_ZStneIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_,comdat
	.weak	_ZStneIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_
	.type	_ZStneIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_, @function
_ZStneIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_:
.LFB9905:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSteqIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_
	xorl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9905:
	.size	_ZStneIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_, .-_ZStneIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_
	.section	.text._ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv,"axG",@progbits,_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv,comdat
	.align 2
	.weak	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv
	.type	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv, @function
_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv:
.LFB9906:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEmmEv
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9906:
	.size	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv, .-_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv
	.section	.text._ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv,"axG",@progbits,_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv,comdat
	.align 2
	.weak	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	.type	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv, @function
_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv:
.LFB9907:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEmmEv
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEdeEv
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9907:
	.size	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv, .-_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	.section	.text._ZN9__gnu_cxx14__alloc_traitsISaIjEjE17_S_select_on_copyERKS1_,"axG",@progbits,_ZN9__gnu_cxx14__alloc_traitsISaIjEjE17_S_select_on_copyERKS1_,comdat
	.weak	_ZN9__gnu_cxx14__alloc_traitsISaIjEjE17_S_select_on_copyERKS1_
	.type	_ZN9__gnu_cxx14__alloc_traitsISaIjEjE17_S_select_on_copyERKS1_, @function
_ZN9__gnu_cxx14__alloc_traitsISaIjEjE17_S_select_on_copyERKS1_:
.LFB9908:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt16allocator_traitsISaIjEE37select_on_container_copy_constructionERKS0_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9908:
	.size	_ZN9__gnu_cxx14__alloc_traitsISaIjEjE17_S_select_on_copyERKS1_, .-_ZN9__gnu_cxx14__alloc_traitsISaIjEjE17_S_select_on_copyERKS1_
	.section	.text._ZNKSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv,"axG",@progbits,_ZNKSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv,comdat
	.align 2
	.weak	_ZNKSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv
	.type	_ZNKSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv, @function
_ZNKSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv:
.LFB9909:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9909:
	.size	_ZNKSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv, .-_ZNKSt12_Vector_baseIjSaIjEE19_M_get_Tp_allocatorEv
	.section	.text._ZNKSt6vectorIjSaIjEE5beginEv,"axG",@progbits,_ZNKSt6vectorIjSaIjEE5beginEv,comdat
	.align 2
	.weak	_ZNKSt6vectorIjSaIjEE5beginEv
	.type	_ZNKSt6vectorIjSaIjEE5beginEv, @function
_ZNKSt6vectorIjSaIjEE5beginEv:
.LFB9910:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	leaq	-8(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEC1ERKS2_
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9910:
	.size	_ZNKSt6vectorIjSaIjEE5beginEv, .-_ZNKSt6vectorIjSaIjEE5beginEv
	.section	.text._ZNKSt6vectorIjSaIjEE3endEv,"axG",@progbits,_ZNKSt6vectorIjSaIjEE3endEv,comdat
	.align 2
	.weak	_ZNKSt6vectorIjSaIjEE3endEv
	.type	_ZNKSt6vectorIjSaIjEE3endEv, @function
_ZNKSt6vectorIjSaIjEE3endEv:
.LFB9911:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	leaq	-8(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEC1ERKS2_
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9911:
	.size	_ZNKSt6vectorIjSaIjEE3endEv, .-_ZNKSt6vectorIjSaIjEE3endEv
	.section	.text._ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjjET0_T_SA_S9_RSaIT1_E,"axG",@progbits,_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjjET0_T_SA_S9_RSaIT1_E,comdat
	.weak	_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjjET0_T_SA_S9_RSaIT1_E
	.type	_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjjET0_T_SA_S9_RSaIT1_E, @function
_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjjET0_T_SA_S9_RSaIT1_E:
.LFB9912:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9912:
	.size	_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjjET0_T_SA_S9_RSaIT1_E, .-_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjjET0_T_SA_S9_RSaIT1_E
	.section	.text._ZNSt6vectorIjSaIjEE6rbeginEv,"axG",@progbits,_ZNSt6vectorIjSaIjEE6rbeginEv,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEE6rbeginEv
	.type	_ZNSt6vectorIjSaIjEE6rbeginEv, @function
_ZNSt6vectorIjSaIjEE6rbeginEv:
.LFB9913:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEE3endEv
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEC1ES6_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9913:
	.size	_ZNSt6vectorIjSaIjEE6rbeginEv, .-_ZNSt6vectorIjSaIjEE6rbeginEv
	.section	.text._ZStneIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_,"axG",@progbits,_ZStneIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_,comdat
	.weak	_ZStneIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_
	.type	_ZStneIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_, @function
_ZStneIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_:
.LFB9917:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSteqIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_
	xorl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9917:
	.size	_ZStneIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_, .-_ZStneIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_
	.section	.text._ZNSt6vectorIjSaIjEE4rendEv,"axG",@progbits,_ZNSt6vectorIjSaIjEE4rendEv,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEE4rendEv
	.type	_ZNSt6vectorIjSaIjEE4rendEv, @function
_ZNSt6vectorIjSaIjEE4rendEv:
.LFB9918:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEE5beginEv
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEC1ES6_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9918:
	.size	_ZNSt6vectorIjSaIjEE4rendEv, .-_ZNSt6vectorIjSaIjEE4rendEv
	.section	.text._ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEppEv,"axG",@progbits,_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEppEv,comdat
	.align 2
	.weak	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEppEv
	.type	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEppEv, @function
_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEppEv:
.LFB9919:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEmmEv
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9919:
	.size	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEppEv, .-_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEppEv
	.section	.text._ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv,"axG",@progbits,_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv,comdat
	.align 2
	.weak	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv
	.type	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv, @function
_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv:
.LFB9920:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEmmEv
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEdeEv
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9920:
	.size	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv, .-_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEdeEv
	.section	.text._ZSt19__iterator_categoryIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEENSt15iterator_traitsIT_E17iterator_categoryERKSB_,"axG",@progbits,_ZSt19__iterator_categoryIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEENSt15iterator_traitsIT_E17iterator_categoryERKSB_,comdat
	.weak	_ZSt19__iterator_categoryIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEENSt15iterator_traitsIT_E17iterator_categoryERKSB_
	.type	_ZSt19__iterator_categoryIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEENSt15iterator_traitsIT_E17iterator_categoryERKSB_, @function
_ZSt19__iterator_categoryIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEENSt15iterator_traitsIT_E17iterator_categoryERKSB_:
.LFB9925:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9925:
	.size	_ZSt19__iterator_categoryIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEENSt15iterator_traitsIT_E17iterator_categoryERKSB_, .-_ZSt19__iterator_categoryIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEENSt15iterator_traitsIT_E17iterator_categoryERKSB_
	.section	.text._ZSt9__reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_St26random_access_iterator_tag,"axG",@progbits,_ZSt9__reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_St26random_access_iterator_tag,comdat
	.weak	_ZSt9__reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_St26random_access_iterator_tag
	.type	_ZSt9__reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_St26random_access_iterator_tag, @function
_ZSt9__reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_St26random_access_iterator_tag:
.LFB9926:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	-16(%rbp), %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxxeqIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_
	testb	%al, %al
	jne	.L405
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEmmEv
.L404:
	leaq	-16(%rbp), %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxxltIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_
	testb	%al, %al
	je	.L401
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt9iter_swapIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEES9_EvT_T0_
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEmmEv
	jmp	.L404
.L405:
	nop
.L401:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9926:
	.size	_ZSt9__reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_St26random_access_iterator_tag, .-_ZSt9__reverseIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEvT_SA_St26random_access_iterator_tag
	.section	.text._ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv,"axG",@progbits,_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	.type	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv, @function
_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv:
.LFB9931:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9931:
	.size	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv, .-_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	.section	.text._ZNK7BigUIntILm128EEmlERKS0_,"axG",@progbits,_ZNK7BigUIntILm128EEmlERKS0_,comdat
	.align 2
	.weak	_ZNK7BigUIntILm128EEmlERKS0_
	.type	_ZNK7BigUIntILm128EEmlERKS0_, @function
_ZNK7BigUIntILm128EEmlERKS0_:
.LFB9932:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EEC1Ev
	movl	$0, -28(%rbp)
.L413:
	movl	-28(%rbp), %eax
	cltq
	cmpq	$3, %rax
	ja	.L415
	movq	$0, -24(%rbp)
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L410
	movl	$0, -32(%rbp)
.L412:
	movl	-28(%rbp), %edx
	movl	-32(%rbp), %eax
	addl	%edx, %eax
	cltq
	cmpq	$3, %rax
	ja	.L410
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %ebx
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %eax
	imulq	%rax, %rbx
	movq	%rbx, %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-28(%rbp), %edx
	movl	-32(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %eax
	addq	%rbx, %rax
	movq	%rax, -40(%rbp)
	movl	-28(%rbp), %edx
	movl	-32(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movl	%eax, (%rdx)
	movq	-40(%rbp), %rax
	shrq	$32, %rax
	movq	%rax, -24(%rbp)
	addl	$1, -32(%rbp)
	jmp	.L412
.L410:
	addl	$1, -28(%rbp)
	jmp	.L413
.L415:
	nop
	movq	-56(%rbp), %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9932:
	.size	_ZNK7BigUIntILm128EEmlERKS0_, .-_ZNK7BigUIntILm128EEmlERKS0_
	.section	.text._ZSt4moveI7BigUIntILm128EEEONSt16remove_referenceIT_E4typeEOS3_,"axG",@progbits,_ZSt4moveI7BigUIntILm128EEEONSt16remove_referenceIT_E4typeEOS3_,comdat
	.weak	_ZSt4moveI7BigUIntILm128EEEONSt16remove_referenceIT_E4typeEOS3_
	.type	_ZSt4moveI7BigUIntILm128EEEONSt16remove_referenceIT_E4typeEOS3_, @function
_ZSt4moveI7BigUIntILm128EEEONSt16remove_referenceIT_E4typeEOS3_:
.LFB9933:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9933:
	.size	_ZSt4moveI7BigUIntILm128EEEONSt16remove_referenceIT_E4typeEOS3_, .-_ZSt4moveI7BigUIntILm128EEEONSt16remove_referenceIT_E4typeEOS3_
	.section	.text._ZNK7BigUIntILm128EEplERKS0_,"axG",@progbits,_ZNK7BigUIntILm128EEplERKS0_,comdat
	.align 2
	.weak	_ZNK7BigUIntILm128EEplERKS0_
	.type	_ZNK7BigUIntILm128EEplERKS0_, @function
_ZNK7BigUIntILm128EEplERKS0_:
.LFB9934:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	$0, -24(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7BigUIntILm128EEC1Ev
	movq	$0, -32(%rbp)
.L420:
	cmpq	$3, -32(%rbp)
	ja	.L422
	movq	-64(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %ebx
	movq	-72(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEEixEm
	movl	(%rax), %eax
	movl	%eax, %eax
	leaq	(%rbx,%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -40(%rbp)
	movq	-56(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorIjSaIjEEixEm
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movl	%eax, (%rdx)
	movabsq	$-4294967296, %rax
	andq	-40(%rbp), %rax
	testq	%rax, %rax
	setne	%al
	movzbl	%al, %eax
	movq	%rax, -24(%rbp)
	addq	$1, -32(%rbp)
	jmp	.L420
.L422:
	nop
	movq	-56(%rbp), %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9934:
	.size	_ZNK7BigUIntILm128EEplERKS0_, .-_ZNK7BigUIntILm128EEplERKS0_
	.section	.text._ZNK7BigUIntILm128EE7compareERKS0_,"axG",@progbits,_ZNK7BigUIntILm128EE7compareERKS0_,comdat
	.align 2
	.weak	_ZNK7BigUIntILm128EE7compareERKS0_
	.type	_ZNK7BigUIntILm128EE7compareERKS0_, @function
_ZNK7BigUIntILm128EE7compareERKS0_:
.LFB9935:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE7crbeginEv
	movq	-56(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE5crendEv
	movq	-64(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE7crbeginEv
.L428:
	leaq	-32(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZStneIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_
	testb	%al, %al
	je	.L424
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %ebx
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %eax
	cmpl	%eax, %ebx
	seta	%al
	testb	%al, %al
	je	.L425
	movl	$1, %eax
	jmp	.L429
.L425:
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %ebx
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %eax
	cmpl	%eax, %ebx
	setb	%al
	testb	%al, %al
	je	.L427
	movl	$-1, %eax
	jmp	.L429
.L427:
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv
	jmp	.L428
.L424:
	movl	$0, %eax
.L429:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9935:
	.size	_ZNK7BigUIntILm128EE7compareERKS0_, .-_ZNK7BigUIntILm128EE7compareERKS0_
	.section	.text._ZNK7BigUIntILm256EE7compareERKS0_,"axG",@progbits,_ZNK7BigUIntILm256EE7compareERKS0_,comdat
	.align 2
	.weak	_ZNK7BigUIntILm256EE7compareERKS0_
	.type	_ZNK7BigUIntILm256EE7compareERKS0_, @function
_ZNK7BigUIntILm256EE7compareERKS0_:
.LFB9936:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE7crbeginEv
	movq	-56(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE5crendEv
	movq	-64(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorIjSaIjEE7crbeginEv
.L435:
	leaq	-32(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZStneIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_
	testb	%al, %al
	je	.L431
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %ebx
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %eax
	cmpl	%eax, %ebx
	seta	%al
	testb	%al, %al
	je	.L432
	movl	$1, %eax
	jmp	.L436
.L432:
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %ebx
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEdeEv
	movl	(%rax), %eax
	cmpl	%eax, %ebx
	setb	%al
	testb	%al, %al
	je	.L434
	movl	$-1, %eax
	jmp	.L436
.L434:
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEppEv
	jmp	.L435
.L431:
	movl	$0, %eax
.L436:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9936:
	.size	_ZNK7BigUIntILm256EE7compareERKS0_, .-_ZNK7BigUIntILm256EE7compareERKS0_
	.section	.text._ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IdvEERKT_,"axG",@progbits,_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC5IdvEERKT_,comdat
	.align 2
	.weak	_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IdvEERKT_
	.type	_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IdvEERKT_, @function
_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IdvEERKT_:
.LFB9972:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	vmovsd	%xmm0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9972:
	.size	_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IdvEERKT_, .-_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IdvEERKT_
	.weak	_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC1IdvEERKT_
	.set	_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC1IdvEERKT_,_ZNSt6chrono8durationIdSt5ratioILl1ELl1EEEC2IdvEERKT_
	.section	.text._ZNSt16allocator_traitsISaIjEE10deallocateERS0_Pjm,"axG",@progbits,_ZNSt16allocator_traitsISaIjEE10deallocateERS0_Pjm,comdat
	.weak	_ZNSt16allocator_traitsISaIjEE10deallocateERS0_Pjm
	.type	_ZNSt16allocator_traitsISaIjEE10deallocateERS0_Pjm, @function
_ZNSt16allocator_traitsISaIjEE10deallocateERS0_Pjm:
.LFB10067:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx13new_allocatorIjE10deallocateEPjm
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10067:
	.size	_ZNSt16allocator_traitsISaIjEE10deallocateERS0_Pjm, .-_ZNSt16allocator_traitsISaIjEE10deallocateERS0_Pjm
	.section	.text._ZNSt12_Destroy_auxILb1EE9__destroyIPjEEvT_S3_,"axG",@progbits,_ZNSt12_Destroy_auxILb1EE9__destroyIPjEEvT_S3_,comdat
	.weak	_ZNSt12_Destroy_auxILb1EE9__destroyIPjEEvT_S3_
	.type	_ZNSt12_Destroy_auxILb1EE9__destroyIPjEEvT_S3_, @function
_ZNSt12_Destroy_auxILb1EE9__destroyIPjEEvT_S3_:
.LFB10068:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10068:
	.size	_ZNSt12_Destroy_auxILb1EE9__destroyIPjEEvT_S3_, .-_ZNSt12_Destroy_auxILb1EE9__destroyIPjEEvT_S3_
	.section	.text._ZNKSt24uniform_int_distributionIjE10param_type1bEv,"axG",@progbits,_ZNKSt24uniform_int_distributionIjE10param_type1bEv,comdat
	.align 2
	.weak	_ZNKSt24uniform_int_distributionIjE10param_type1bEv
	.type	_ZNKSt24uniform_int_distributionIjE10param_type1bEv, @function
_ZNKSt24uniform_int_distributionIjE10param_type1bEv:
.LFB10076:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10076:
	.size	_ZNKSt24uniform_int_distributionIjE10param_type1bEv, .-_ZNKSt24uniform_int_distributionIjE10param_type1bEv
	.section	.text._ZNKSt24uniform_int_distributionIjE10param_type1aEv,"axG",@progbits,_ZNKSt24uniform_int_distributionIjE10param_type1aEv,comdat
	.align 2
	.weak	_ZNKSt24uniform_int_distributionIjE10param_type1aEv
	.type	_ZNKSt24uniform_int_distributionIjE10param_type1aEv, @function
_ZNKSt24uniform_int_distributionIjE10param_type1aEv:
.LFB10077:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10077:
	.size	_ZNKSt24uniform_int_distributionIjE10param_type1aEv, .-_ZNKSt24uniform_int_distributionIjE10param_type1aEv
	.section	.text._ZNSaIjEC2ERKS_,"axG",@progbits,_ZNSaIjEC5ERKS_,comdat
	.align 2
	.weak	_ZNSaIjEC2ERKS_
	.type	_ZNSaIjEC2ERKS_, @function
_ZNSaIjEC2ERKS_:
.LFB10079:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx13new_allocatorIjEC2ERKS1_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10079:
	.size	_ZNSaIjEC2ERKS_, .-_ZNSaIjEC2ERKS_
	.weak	_ZNSaIjEC1ERKS_
	.set	_ZNSaIjEC1ERKS_,_ZNSaIjEC2ERKS_
	.section	.text._ZSt4moveIRPjEONSt16remove_referenceIT_E4typeEOS3_,"axG",@progbits,_ZSt4moveIRPjEONSt16remove_referenceIT_E4typeEOS3_,comdat
	.weak	_ZSt4moveIRPjEONSt16remove_referenceIT_E4typeEOS3_
	.type	_ZSt4moveIRPjEONSt16remove_referenceIT_E4typeEOS3_, @function
_ZSt4moveIRPjEONSt16remove_referenceIT_E4typeEOS3_:
.LFB10082:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10082:
	.size	_ZSt4moveIRPjEONSt16remove_referenceIT_E4typeEOS3_, .-_ZSt4moveIRPjEONSt16remove_referenceIT_E4typeEOS3_
	.section	.text._ZSt4swapIPjENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SF_,"axG",@progbits,_ZSt4swapIPjENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SF_,comdat
	.weak	_ZSt4swapIPjENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SF_
	.type	_ZSt4swapIPjENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SF_, @function
_ZSt4swapIPjENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SF_:
.LFB10081:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRPjEONSt16remove_referenceIT_E4typeEOS3_
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRPjEONSt16remove_referenceIT_E4typeEOS3_
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRPjEONSt16remove_referenceIT_E4typeEOS3_
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10081:
	.size	_ZSt4swapIPjENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SF_, .-_ZSt4swapIPjENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SF_
	.section	.text._ZNSt12_Vector_baseIjSaIjEE12_Vector_implC2ERKS0_,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEE12_Vector_implC5ERKS0_,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implC2ERKS0_
	.type	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implC2ERKS0_, @function
_ZNSt12_Vector_baseIjSaIjEE12_Vector_implC2ERKS0_:
.LFB10084:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSaIjEC2ERKS_
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10084:
	.size	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implC2ERKS0_, .-_ZNSt12_Vector_baseIjSaIjEE12_Vector_implC2ERKS0_
	.weak	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implC1ERKS0_
	.set	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implC1ERKS0_,_ZNSt12_Vector_baseIjSaIjEE12_Vector_implC2ERKS0_
	.section	.text._ZNSt12_Vector_baseIjSaIjEE17_M_create_storageEm,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEE17_M_create_storageEm,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseIjSaIjEE17_M_create_storageEm
	.type	_ZNSt12_Vector_baseIjSaIjEE17_M_create_storageEm, @function
_ZNSt12_Vector_baseIjSaIjEE17_M_create_storageEm:
.LFB10086:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE11_M_allocateEm
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10086:
	.size	_ZNSt12_Vector_baseIjSaIjEE17_M_create_storageEm, .-_ZNSt12_Vector_baseIjSaIjEE17_M_create_storageEm
	.section	.text._ZSt24__uninitialized_fill_n_aIPjmjjET_S1_T0_RKT1_RSaIT2_E,"axG",@progbits,_ZSt24__uninitialized_fill_n_aIPjmjjET_S1_T0_RKT1_RSaIT2_E,comdat
	.weak	_ZSt24__uninitialized_fill_n_aIPjmjjET_S1_T0_RKT1_RSaIT2_E
	.type	_ZSt24__uninitialized_fill_n_aIPjmjjET_S1_T0_RKT1_RSaIT2_E, @function
_ZSt24__uninitialized_fill_n_aIPjmjjET_S1_T0_RKT1_RSaIT2_E:
.LFB10087:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZSt20uninitialized_fill_nIPjmjET_S1_T0_RKT1_
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10087:
	.size	_ZSt24__uninitialized_fill_n_aIPjmjjET_S1_T0_RKT1_RSaIT2_E, .-_ZSt24__uninitialized_fill_n_aIPjmjjET_S1_T0_RKT1_RSaIT2_E
	.section	.text._ZNSt12_Vector_baseIjSaIjEEC2ERKS0_,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEEC5ERKS0_,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseIjSaIjEEC2ERKS0_
	.type	_ZNSt12_Vector_baseIjSaIjEEC2ERKS0_, @function
_ZNSt12_Vector_baseIjSaIjEEC2ERKS0_:
.LFB10089:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseIjSaIjEE12_Vector_implC1ERKS0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10089:
	.size	_ZNSt12_Vector_baseIjSaIjEEC2ERKS0_, .-_ZNSt12_Vector_baseIjSaIjEEC2ERKS0_
	.weak	_ZNSt12_Vector_baseIjSaIjEEC1ERKS0_
	.set	_ZNSt12_Vector_baseIjSaIjEEC1ERKS0_,_ZNSt12_Vector_baseIjSaIjEEC2ERKS0_
	.section	.text._ZSt18__do_alloc_on_moveISaIjEEvRT_S2_St17integral_constantIbLb1EE,"axG",@progbits,_ZSt18__do_alloc_on_moveISaIjEEvRT_S2_St17integral_constantIbLb1EE,comdat
	.weak	_ZSt18__do_alloc_on_moveISaIjEEvRT_S2_St17integral_constantIbLb1EE
	.type	_ZSt18__do_alloc_on_moveISaIjEEvRT_S2_St17integral_constantIbLb1EE, @function
_ZSt18__do_alloc_on_moveISaIjEEvRT_S2_St17integral_constantIbLb1EE:
.LFB10091:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRSaIjEEONSt16remove_referenceIT_E4typeEOS3_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10091:
	.size	_ZSt18__do_alloc_on_moveISaIjEEvRT_S2_St17integral_constantIbLb1EE, .-_ZSt18__do_alloc_on_moveISaIjEEvRT_S2_St17integral_constantIbLb1EE
	.section	.text._ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEC2ES7_,"axG",@progbits,_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEC5ES7_,comdat
	.align 2
	.weak	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEC2ES7_
	.type	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEC2ES7_, @function
_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEC2ES7_:
.LFB10093:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10093:
	.size	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEC2ES7_, .-_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEC2ES7_
	.weak	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEC1ES7_
	.set	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEC1ES7_,_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEC2ES7_
	.section	.text._ZSteqIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_,"axG",@progbits,_ZSteqIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_,comdat
	.weak	_ZSteqIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_
	.type	_ZSteqIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_, @function
_ZSteqIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_:
.LFB10095:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEE4baseEv
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEE4baseEv
	movq	%rax, -8(%rbp)
	leaq	-16(%rbp), %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxxeqIPKjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESB_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10095:
	.size	_ZSteqIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_, .-_ZSteqIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESC_
	.section	.text._ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEmmEv,"axG",@progbits,_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEmmEv,comdat
	.align 2
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEmmEv
	.type	_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEmmEv, @function
_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEmmEv:
.LFB10096:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	-4(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10096:
	.size	_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEmmEv, .-_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEmmEv
	.section	.text._ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEdeEv,"axG",@progbits,_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEdeEv,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEdeEv
	.type	_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEdeEv, @function
_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEdeEv:
.LFB10097:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10097:
	.size	_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEdeEv, .-_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEdeEv
	.section	.text._ZNSt16allocator_traitsISaIjEE37select_on_container_copy_constructionERKS0_,"axG",@progbits,_ZNSt16allocator_traitsISaIjEE37select_on_container_copy_constructionERKS0_,comdat
	.weak	_ZNSt16allocator_traitsISaIjEE37select_on_container_copy_constructionERKS0_
	.type	_ZNSt16allocator_traitsISaIjEE37select_on_container_copy_constructionERKS0_, @function
_ZNSt16allocator_traitsISaIjEE37select_on_container_copy_constructionERKS0_:
.LFB10098:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSaIjEC1ERKS_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10098:
	.size	_ZNSt16allocator_traitsISaIjEE37select_on_container_copy_constructionERKS0_, .-_ZNSt16allocator_traitsISaIjEE37select_on_container_copy_constructionERKS0_
	.section	.text._ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEC2ERKS2_,"axG",@progbits,_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEC5ERKS2_,comdat
	.align 2
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEC2ERKS2_
	.type	_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEC2ERKS2_, @function
_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEC2ERKS2_:
.LFB10100:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10100:
	.size	_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEC2ERKS2_, .-_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEC2ERKS2_
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEC1ERKS2_
	.set	_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEC1ERKS2_,_ZN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEC2ERKS2_
	.section	.text._ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_,"axG",@progbits,_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_,comdat
	.weak	_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_
	.type	_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_, @function
_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_:
.LFB10102:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movb	$1, -1(%rbp)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjEET0_T_SC_SB_
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10102:
	.size	_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_, .-_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_
	.section	.text._ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEC2ES6_,"axG",@progbits,_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEC5ES6_,comdat
	.align 2
	.weak	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEC2ES6_
	.type	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEC2ES6_, @function
_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEC2ES6_:
.LFB10104:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10104:
	.size	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEC2ES6_, .-_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEC2ES6_
	.weak	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEC1ES6_
	.set	_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEC1ES6_,_ZNSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEC2ES6_
	.section	.text._ZSteqIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_,"axG",@progbits,_ZSteqIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_,comdat
	.weak	_ZSteqIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_
	.type	_ZSteqIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_, @function
_ZSteqIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_:
.LFB10106:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEE4baseEv
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEE4baseEv
	movq	%rax, -8(%rbp)
	leaq	-16(%rbp), %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxxeqIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10106:
	.size	_ZSteqIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_, .-_ZSteqIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEEbRKSt16reverse_iteratorIT_ESB_
	.section	.text._ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEmmEv,"axG",@progbits,_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEmmEv,comdat
	.align 2
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEmmEv
	.type	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEmmEv, @function
_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEmmEv:
.LFB10107:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	-4(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10107:
	.size	_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEmmEv, .-_ZN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEmmEv
	.section	.text._ZN9__gnu_cxxeqIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_,"axG",@progbits,_ZN9__gnu_cxxeqIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_,comdat
	.weak	_ZN9__gnu_cxxeqIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_
	.type	_ZN9__gnu_cxxeqIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_, @function
_ZN9__gnu_cxxeqIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_:
.LFB10108:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	movq	(%rax), %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	movq	(%rax), %rax
	cmpq	%rax, %rbx
	sete	%al
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10108:
	.size	_ZN9__gnu_cxxeqIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_, .-_ZN9__gnu_cxxeqIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_
	.section	.text._ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEmmEv,"axG",@progbits,_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEmmEv,comdat
	.align 2
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEmmEv
	.type	_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEmmEv, @function
_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEmmEv:
.LFB10109:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10109:
	.size	_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEmmEv, .-_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEmmEv
	.section	.text._ZN9__gnu_cxxltIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_,"axG",@progbits,_ZN9__gnu_cxxltIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_,comdat
	.weak	_ZN9__gnu_cxxltIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_
	.type	_ZN9__gnu_cxxltIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_, @function
_ZN9__gnu_cxxltIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_:
.LFB10110:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	movq	(%rax), %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	movq	(%rax), %rax
	cmpq	%rax, %rbx
	setb	%al
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10110:
	.size	_ZN9__gnu_cxxltIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_, .-_ZN9__gnu_cxxltIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESD_
	.section	.text._ZSt9iter_swapIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEES9_EvT_T0_,"axG",@progbits,_ZSt9iter_swapIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEES9_EvT_T0_,comdat
	.weak	_ZSt9iter_swapIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEES9_EvT_T0_
	.type	_ZSt9iter_swapIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEES9_EvT_T0_, @function
_ZSt9iter_swapIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEES9_EvT_T0_:
.LFB10111:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv
	movq	%rax, %rbx
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZSt4swapIcENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_
	nop
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10111:
	.size	_ZSt9iter_swapIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEES9_EvT_T0_, .-_ZSt9iter_swapIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEES9_EvT_T0_
	.section	.text._ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv,"axG",@progbits,_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv,comdat
	.align 2
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv
	.type	_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv, @function
_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv:
.LFB10112:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10112:
	.size	_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv, .-_ZN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv
	.section	.text._ZN9__gnu_cxx13new_allocatorIjE10deallocateEPjm,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorIjE10deallocateEPjm,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorIjE10deallocateEPjm
	.type	_ZN9__gnu_cxx13new_allocatorIjE10deallocateEPjm, @function
_ZN9__gnu_cxx13new_allocatorIjE10deallocateEPjm:
.LFB10316:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdlPv
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10316:
	.size	_ZN9__gnu_cxx13new_allocatorIjE10deallocateEPjm, .-_ZN9__gnu_cxx13new_allocatorIjE10deallocateEPjm
	.section	.text._ZN9__gnu_cxx13new_allocatorIjEC2ERKS1_,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorIjEC5ERKS1_,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorIjEC2ERKS1_
	.type	_ZN9__gnu_cxx13new_allocatorIjEC2ERKS1_, @function
_ZN9__gnu_cxx13new_allocatorIjEC2ERKS1_:
.LFB10322:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10322:
	.size	_ZN9__gnu_cxx13new_allocatorIjEC2ERKS1_, .-_ZN9__gnu_cxx13new_allocatorIjEC2ERKS1_
	.weak	_ZN9__gnu_cxx13new_allocatorIjEC1ERKS1_
	.set	_ZN9__gnu_cxx13new_allocatorIjEC1ERKS1_,_ZN9__gnu_cxx13new_allocatorIjEC2ERKS1_
	.section	.text._ZNSt12_Vector_baseIjSaIjEE11_M_allocateEm,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEE11_M_allocateEm,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseIjSaIjEE11_M_allocateEm
	.type	_ZNSt12_Vector_baseIjSaIjEE11_M_allocateEm, @function
_ZNSt12_Vector_baseIjSaIjEE11_M_allocateEm:
.LFB10324:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L483
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt16allocator_traitsISaIjEE8allocateERS0_m
	jmp	.L485
.L483:
	movl	$0, %eax
.L485:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10324:
	.size	_ZNSt12_Vector_baseIjSaIjEE11_M_allocateEm, .-_ZNSt12_Vector_baseIjSaIjEE11_M_allocateEm
	.section	.text._ZSt20uninitialized_fill_nIPjmjET_S1_T0_RKT1_,"axG",@progbits,_ZSt20uninitialized_fill_nIPjmjET_S1_T0_RKT1_,comdat
	.weak	_ZSt20uninitialized_fill_nIPjmjET_S1_T0_RKT1_
	.type	_ZSt20uninitialized_fill_nIPjmjET_S1_T0_RKT1_, @function
_ZSt20uninitialized_fill_nIPjmjET_S1_T0_RKT1_:
.LFB10325:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movb	$1, -1(%rbp)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPjmjEET_S3_T0_RKT1_
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10325:
	.size	_ZSt20uninitialized_fill_nIPjmjET_S1_T0_RKT1_, .-_ZSt20uninitialized_fill_nIPjmjET_S1_T0_RKT1_
	.section	.text._ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEE4baseEv,"axG",@progbits,_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEE4baseEv,comdat
	.align 2
	.weak	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEE4baseEv
	.type	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEE4baseEv, @function
_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEE4baseEv:
.LFB10326:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10326:
	.size	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEE4baseEv, .-_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEE4baseEv
	.section	.text._ZN9__gnu_cxxeqIPKjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESB_,"axG",@progbits,_ZN9__gnu_cxxeqIPKjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESB_,comdat
	.weak	_ZN9__gnu_cxxeqIPKjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESB_
	.type	_ZN9__gnu_cxxeqIPKjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESB_, @function
_ZN9__gnu_cxxeqIPKjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESB_:
.LFB10327:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEE4baseEv
	movq	(%rax), %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEE4baseEv
	movq	(%rax), %rax
	cmpq	%rax, %rbx
	sete	%al
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10327:
	.size	_ZN9__gnu_cxxeqIPKjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESB_, .-_ZN9__gnu_cxxeqIPKjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESB_
	.section	.text._ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjEET0_T_SC_SB_,"axG",@progbits,_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjEET0_T_SC_SB_,comdat
	.weak	_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjEET0_T_SC_SB_
	.type	_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjEET0_T_SC_SB_, @function
_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjEET0_T_SC_SB_:
.LFB10328:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10328:
	.size	_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjEET0_T_SC_SB_, .-_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjEET0_T_SC_SB_
	.section	.text._ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEE4baseEv,"axG",@progbits,_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEE4baseEv,comdat
	.align 2
	.weak	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEE4baseEv
	.type	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEE4baseEv, @function
_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEE4baseEv:
.LFB10329:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10329:
	.size	_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEE4baseEv, .-_ZNKSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEEEE4baseEv
	.section	.text._ZN9__gnu_cxxeqIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_,"axG",@progbits,_ZN9__gnu_cxxeqIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_,comdat
	.weak	_ZN9__gnu_cxxeqIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_
	.type	_ZN9__gnu_cxxeqIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_, @function
_ZN9__gnu_cxxeqIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_:
.LFB10330:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEE4baseEv
	movq	(%rax), %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPjSt6vectorIjSaIjEEE4baseEv
	movq	(%rax), %rax
	cmpq	%rax, %rbx
	sete	%al
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10330:
	.size	_ZN9__gnu_cxxeqIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_, .-_ZN9__gnu_cxxeqIPjSt6vectorIjSaIjEEEEbRKNS_17__normal_iteratorIT_T0_EESA_
	.section	.text._ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv,"axG",@progbits,_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	.type	_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv, @function
_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv:
.LFB10331:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10331:
	.size	_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv, .-_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	.section	.text._ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv,"axG",@progbits,_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv
	.type	_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv, @function
_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv:
.LFB10332:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10332:
	.size	_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv, .-_ZNK9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv
	.section	.text._ZSt4moveIRcEONSt16remove_referenceIT_E4typeEOS2_,"axG",@progbits,_ZSt4moveIRcEONSt16remove_referenceIT_E4typeEOS2_,comdat
	.weak	_ZSt4moveIRcEONSt16remove_referenceIT_E4typeEOS2_
	.type	_ZSt4moveIRcEONSt16remove_referenceIT_E4typeEOS2_, @function
_ZSt4moveIRcEONSt16remove_referenceIT_E4typeEOS2_:
.LFB10334:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10334:
	.size	_ZSt4moveIRcEONSt16remove_referenceIT_E4typeEOS2_, .-_ZSt4moveIRcEONSt16remove_referenceIT_E4typeEOS2_
	.section	.text._ZSt4swapIcENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_,"axG",@progbits,_ZSt4swapIcENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_,comdat
	.weak	_ZSt4swapIcENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_
	.type	_ZSt4swapIcENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_, @function
_ZSt4swapIcENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_:
.LFB10333:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRcEONSt16remove_referenceIT_E4typeEOS2_
	movzbl	(%rax), %eax
	movb	%al, -1(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRcEONSt16remove_referenceIT_E4typeEOS2_
	movzbl	(%rax), %edx
	movq	-24(%rbp), %rax
	movb	%dl, (%rax)
	leaq	-1(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRcEONSt16remove_referenceIT_E4typeEOS2_
	movzbl	(%rax), %edx
	movq	-32(%rbp), %rax
	movb	%dl, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10333:
	.size	_ZSt4swapIcENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_, .-_ZSt4swapIcENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_
	.section	.text._ZNSt16allocator_traitsISaIjEE8allocateERS0_m,"axG",@progbits,_ZNSt16allocator_traitsISaIjEE8allocateERS0_m,comdat
	.weak	_ZNSt16allocator_traitsISaIjEE8allocateERS0_m
	.type	_ZNSt16allocator_traitsISaIjEE8allocateERS0_m, @function
_ZNSt16allocator_traitsISaIjEE8allocateERS0_m:
.LFB10529:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx13new_allocatorIjE8allocateEmPKv
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10529:
	.size	_ZNSt16allocator_traitsISaIjEE8allocateERS0_m, .-_ZNSt16allocator_traitsISaIjEE8allocateERS0_m
	.section	.text._ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPjmjEET_S3_T0_RKT1_,"axG",@progbits,_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPjmjEET_S3_T0_RKT1_,comdat
	.weak	_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPjmjEET_S3_T0_RKT1_
	.type	_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPjmjEET_S3_T0_RKT1_, @function
_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPjmjEET_S3_T0_RKT1_:
.LFB10530:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZSt6fill_nIPjmjET_S1_T0_RKT1_
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10530:
	.size	_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPjmjEET_S3_T0_RKT1_, .-_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPjmjEET_S3_T0_RKT1_
	.section	.text._ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEE4baseEv,"axG",@progbits,_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEE4baseEv,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEE4baseEv
	.type	_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEE4baseEv, @function
_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEE4baseEv:
.LFB10531:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10531:
	.size	_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEE4baseEv, .-_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEE4baseEv
	.section	.text._ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_,"axG",@progbits,_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_,comdat
	.weak	_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_
	.type	_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_, @function
_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_:
.LFB10532:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEET_S8_
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEET_S8_
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movq	%rbx, %rsi
	movq	%rcx, %rdi
	call	_ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET1_T0_SA_S9_
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10532:
	.size	_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_, .-_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET0_T_SA_S9_
	.section	.text._ZN9__gnu_cxx13new_allocatorIjE8allocateEmPKv,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorIjE8allocateEmPKv,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorIjE8allocateEmPKv
	.type	_ZN9__gnu_cxx13new_allocatorIjE8allocateEmPKv, @function
_ZN9__gnu_cxx13new_allocatorIjE8allocateEmPKv:
.LFB10740:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx13new_allocatorIjE8max_sizeEv
	cmpq	%rax, -16(%rbp)
	seta	%al
	testb	%al, %al
	je	.L514
	call	_ZSt17__throw_bad_allocv
.L514:
	movq	-16(%rbp), %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	_Znwm
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10740:
	.size	_ZN9__gnu_cxx13new_allocatorIjE8allocateEmPKv, .-_ZN9__gnu_cxx13new_allocatorIjE8allocateEmPKv
	.section	.text._ZSt6fill_nIPjmjET_S1_T0_RKT1_,"axG",@progbits,_ZSt6fill_nIPjmjET_S1_T0_RKT1_,comdat
	.weak	_ZSt6fill_nIPjmjET_S1_T0_RKT1_
	.type	_ZSt6fill_nIPjmjET_S1_T0_RKT1_, @function
_ZSt6fill_nIPjmjET_S1_T0_RKT1_:
.LFB10741:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__niter_baseIPjET_S1_
	movq	%rax, %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	_ZSt10__fill_n_aIPjmjEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10741:
	.size	_ZSt6fill_nIPjmjET_S1_T0_RKT1_, .-_ZSt6fill_nIPjmjET_S1_T0_RKT1_
	.section	.text._ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEET_S8_,"axG",@progbits,_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEET_S8_,comdat
	.weak	_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEET_S8_
	.type	_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEET_S8_, @function
_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEET_S8_:
.LFB10742:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10742:
	.size	_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEET_S8_, .-_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEET_S8_
	.section	.text._ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET1_T0_SA_S9_,"axG",@progbits,_ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET1_T0_SA_S9_,comdat
	.weak	_ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET1_T0_SA_S9_
	.type	_ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET1_T0_SA_S9_, @function
_ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET1_T0_SA_S9_:
.LFB10743:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__niter_baseIPjET_S1_
	movq	%rax, %r12
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__niter_baseIPKjSt6vectorIjSaIjEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__niter_baseIPKjSt6vectorIjSaIjEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZSt13__copy_move_aILb0EPKjPjET1_T0_S4_S3_
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10743:
	.size	_ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET1_T0_SA_S9_, .-_ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEEEPjET1_T0_SA_S9_
	.section	.text._ZNK9__gnu_cxx13new_allocatorIjE8max_sizeEv,"axG",@progbits,_ZNK9__gnu_cxx13new_allocatorIjE8max_sizeEv,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx13new_allocatorIjE8max_sizeEv
	.type	_ZNK9__gnu_cxx13new_allocatorIjE8max_sizeEv, @function
_ZNK9__gnu_cxx13new_allocatorIjE8max_sizeEv:
.LFB10938:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movabsq	$4611686018427387903, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10938:
	.size	_ZNK9__gnu_cxx13new_allocatorIjE8max_sizeEv, .-_ZNK9__gnu_cxx13new_allocatorIjE8max_sizeEv
	.section	.text._ZSt12__niter_baseIPjET_S1_,"axG",@progbits,_ZSt12__niter_baseIPjET_S1_,comdat
	.weak	_ZSt12__niter_baseIPjET_S1_
	.type	_ZSt12__niter_baseIPjET_S1_, @function
_ZSt12__niter_baseIPjET_S1_:
.LFB10939:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10939:
	.size	_ZSt12__niter_baseIPjET_S1_, .-_ZSt12__niter_baseIPjET_S1_
	.section	.text._ZSt10__fill_n_aIPjmjEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_,"axG",@progbits,_ZSt10__fill_n_aIPjmjEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_,comdat
	.weak	_ZSt10__fill_n_aIPjmjEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_
	.type	_ZSt10__fill_n_aIPjmjEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_, @function
_ZSt10__fill_n_aIPjmjEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_:
.LFB10940:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
.L528:
	cmpq	$0, -8(%rbp)
	je	.L527
	movq	-24(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	subq	$1, -8(%rbp)
	addq	$4, -24(%rbp)
	jmp	.L528
.L527:
	movq	-24(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10940:
	.size	_ZSt10__fill_n_aIPjmjEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_, .-_ZSt10__fill_n_aIPjmjEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_
	.section	.text._ZSt12__niter_baseIPKjSt6vectorIjSaIjEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE,"axG",@progbits,_ZSt12__niter_baseIPKjSt6vectorIjSaIjEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE,comdat
	.weak	_ZSt12__niter_baseIPKjSt6vectorIjSaIjEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE
	.type	_ZSt12__niter_baseIPKjSt6vectorIjSaIjEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE, @function
_ZSt12__niter_baseIPKjSt6vectorIjSaIjEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE:
.LFB10941:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPKjSt6vectorIjSaIjEEE4baseEv
	movq	(%rax), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10941:
	.size	_ZSt12__niter_baseIPKjSt6vectorIjSaIjEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE, .-_ZSt12__niter_baseIPKjSt6vectorIjSaIjEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE
	.section	.text._ZSt13__copy_move_aILb0EPKjPjET1_T0_S4_S3_,"axG",@progbits,_ZSt13__copy_move_aILb0EPKjPjET1_T0_S4_S3_,comdat
	.weak	_ZSt13__copy_move_aILb0EPKjPjET1_T0_S4_S3_
	.type	_ZSt13__copy_move_aILb0EPKjPjET1_T0_S4_S3_, @function
_ZSt13__copy_move_aILb0EPKjPjET1_T0_S4_S3_:
.LFB10942:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movb	$1, -1(%rbp)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIjEEPT_PKS3_S6_S4_
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10942:
	.size	_ZSt13__copy_move_aILb0EPKjPjET1_T0_S4_S3_, .-_ZSt13__copy_move_aILb0EPKjPjET1_T0_S4_S3_
	.section	.text._ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIjEEPT_PKS3_S6_S4_,"axG",@progbits,_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIjEEPT_PKS3_S6_S4_,comdat
	.weak	_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIjEEPT_PKS3_S6_S4_
	.type	_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIjEEPT_PKS3_S6_S4_, @function
_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIjEEPT_PKS3_S6_S4_:
.LFB11138:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-32(%rbp), %rax
	subq	-24(%rbp), %rax
	sarq	$2, %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L535
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memmove
.L535:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11138:
	.size	_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIjEEPT_PKS3_S6_S4_, .-_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIjEEPT_PKS3_S6_S4_
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB11514:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L539
	cmpl	$65535, -8(%rbp)
	jne	.L539
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	call	__cxa_atexit
.L539:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11514:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB11539:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11539:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.section	.rodata
	.align 32
	.type	_ZZL10addInPlaceRSt6vectorIjSaIjEERKS1_mE19__PRETTY_FUNCTION__, @object
	.size	_ZZL10addInPlaceRSt6vectorIjSaIjEERKS1_mE19__PRETTY_FUNCTION__, 91
_ZZL10addInPlaceRSt6vectorIjSaIjEERKS1_mE19__PRETTY_FUNCTION__:
	.string	"void addInPlace(std::vector<unsigned int>&, const std::vector<unsigned int>&, std::size_t)"
	.align 32
	.type	_ZZN7BigUIntILm4096EE9divideU32EjE19__PRETTY_FUNCTION__, @object
	.size	_ZZN7BigUIntILm4096EE9divideU32EjE19__PRETTY_FUNCTION__, 108
_ZZN7BigUIntILm4096EE9divideU32EjE19__PRETTY_FUNCTION__:
	.string	"uint32_t BigUInt<BITS_>::divideU32(uint32_t) [with long unsigned int BITS_ = 4096; uint32_t = unsigned int]"
	.align 32
	.type	_ZZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEcE19__PRETTY_FUNCTION__, @object
	.size	_ZZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEcE19__PRETTY_FUNCTION__, 186
_ZZZN7BigUIntILm128EE7fromHexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEENKUlcE_clEcE19__PRETTY_FUNCTION__:
	.string	"BigUInt<BITS_>::fromHex(const string&) [with long unsigned int BITS_ = 128; BigUInt<BITS_>::self = BigUInt<128>; std::__cxx11::string = std::__cxx11::basic_string<char>]::<lambda(char)>"
	.align 32
	.type	_ZZN7BigUIntILm128EE9divideU32EjE19__PRETTY_FUNCTION__, @object
	.size	_ZZN7BigUIntILm128EE9divideU32EjE19__PRETTY_FUNCTION__, 107
_ZZN7BigUIntILm128EE9divideU32EjE19__PRETTY_FUNCTION__:
	.string	"uint32_t BigUInt<BITS_>::divideU32(uint32_t) [with long unsigned int BITS_ = 128; uint32_t = unsigned int]"
	.align 32
	.type	_ZZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEjE19__PRETTY_FUNCTION__, @object
	.size	_ZZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEjE19__PRETTY_FUNCTION__, 144
_ZZZNK7BigUIntILm128EE5toHexB5cxx11EvENKUljE_clEjE19__PRETTY_FUNCTION__:
	.string	"BigUInt<BITS_>::toHex() const [with long unsigned int BITS_ = 128; std::__cxx11::string = std::__cxx11::basic_string<char>]::<lambda(uint32_t)>"
	.align 32
	.type	_ZZN7BigUIntILm256EE9divideU32EjE19__PRETTY_FUNCTION__, @object
	.size	_ZZN7BigUIntILm256EE9divideU32EjE19__PRETTY_FUNCTION__, 107
_ZZN7BigUIntILm256EE9divideU32EjE19__PRETTY_FUNCTION__:
	.string	"uint32_t BigUInt<BITS_>::divideU32(uint32_t) [with long unsigned int BITS_ = 256; uint32_t = unsigned int]"
	.align 32
	.type	_ZZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEjE19__PRETTY_FUNCTION__, @object
	.size	_ZZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEjE19__PRETTY_FUNCTION__, 144
_ZZZNK7BigUIntILm256EE5toHexB5cxx11EvENKUljE_clEjE19__PRETTY_FUNCTION__:
	.string	"BigUInt<BITS_>::toHex() const [with long unsigned int BITS_ = 256; std::__cxx11::string = std::__cxx11::basic_string<char>]::<lambda(uint32_t)>"
	.align 8
.LC14:
	.long	0
	.long	1104006501
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 8.3.1 20190223 (Red Hat 8.3.1-2)"
	.section	.note.GNU-stack,"",@progbits
