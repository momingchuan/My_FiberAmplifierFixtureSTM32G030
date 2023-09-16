	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-m4
	.eabi_attribute	6, 13	@ Tag_CPU_arch
	.eabi_attribute	7, 77	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 0	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.fpu	fpv4-sp-d16
	.eabi_attribute	27, 1	@ Tag_ABI_HardFP_use
	.eabi_attribute	36, 1	@ Tag_FP_HP_extension
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 2	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 0	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 1	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 2	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 1	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"SDPro.c"
	.file	1 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Core/Src/SDPro.c"
	.section	.text.SaveDtatExScreen,"ax",%progbits
	.hidden	SaveDtatExScreen                @ -- Begin function SaveDtatExScreen
	.globl	SaveDtatExScreen
	.p2align	2
	.type	SaveDtatExScreen,%function
	.code	16                              @ @SaveDtatExScreen
	.thumb_func
SaveDtatExScreen:
.Lfunc_begin0:
	.loc	1 81 0                          @ ../Core/Src/SDPro.c:81:0
	.fnstart
	.cfi_sections .debug_frame
	.cfi_startproc
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.cfi_def_cfa_offset 36
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.cfi_offset r10, -12
	.cfi_offset r9, -16
	.cfi_offset r8, -20
	.cfi_offset r7, -24
	.cfi_offset r6, -28
	.cfi_offset r5, -32
	.cfi_offset r4, -36
	.pad	#1324
	subw	sp, sp, #1324
	.cfi_def_cfa_offset 1360
	add	r0, sp, #300
	str	r0, [sp, #276]                  @ 4-byte Spill
	mov.w	r1, #1024
.Ltmp0:
	.loc	1 82 8 prologue_end             @ ../Core/Src/SDPro.c:82:8
	bl	__aeabi_memclr
	.loc	1 86 45                         @ ../Core/Src/SDPro.c:86:45
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	str	r1, [sp, #292]                  @ 4-byte Spill
	movw	r2, #11376
	str	r2, [sp, #288]                  @ 4-byte Spill
	movs	r0, #0
	strb	r0, [r1, r2]
	.loc	1 88 20                         @ ../Core/Src/SDPro.c:88:20
	movw	r4, :lower16:comVariableBlock
	movt	r4, :upper16:comVariableBlock
	ldrh	r0, [r4, #26]
	.loc	1 89 20                         @ ../Core/Src/SDPro.c:89:20
	str	r0, [sp, #244]                  @ 4-byte Spill
	ldrh	r0, [r4, #28]
	.loc	1 90 20                         @ ../Core/Src/SDPro.c:90:20
	str	r0, [sp, #248]                  @ 4-byte Spill
	ldrh	r0, [r4, #30]
	.loc	1 91 3                          @ ../Core/Src/SDPro.c:91:3
	str	r0, [sp, #260]                  @ 4-byte Spill
	ldr	r0, [r1, #16]
	.loc	1 92 3                          @ ../Core/Src/SDPro.c:92:3
	ldr	r2, [r1, #24]
	.loc	1 93 3                          @ ../Core/Src/SDPro.c:93:3
	str	r2, [sp, #144]                  @ 4-byte Spill
	ldr	r2, [r1, #28]
	.loc	1 94 3                          @ ../Core/Src/SDPro.c:94:3
	str	r2, [sp, #152]                  @ 4-byte Spill
	ldr	r1, [r1, #40]
	.loc	1 91 3                          @ ../Core/Src/SDPro.c:91:3
	str	r1, [sp, #160]                  @ 4-byte Spill
	bl	__aeabi_f2d
	mov	r2, r0
	ldr	r0, [sp, #144]                  @ 4-byte Reload
	str	r2, [sp, #148]                  @ 4-byte Spill
	mov	r2, r1
	ldr	r1, [sp, #148]                  @ 4-byte Reload
	vmov	d0, r1, r2
	vstr	d0, [sp, #232]                  @ 8-byte Spill
	.loc	1 92 3                          @ ../Core/Src/SDPro.c:92:3
	bl	__aeabi_f2d
	mov	r2, r0
	ldr	r0, [sp, #152]                  @ 4-byte Reload
	str	r2, [sp, #156]                  @ 4-byte Spill
	mov	r2, r1
	ldr	r1, [sp, #156]                  @ 4-byte Reload
	vmov	d0, r1, r2
	vstr	d0, [sp, #224]                  @ 8-byte Spill
	.loc	1 93 3                          @ ../Core/Src/SDPro.c:93:3
	bl	__aeabi_f2d
	mov	r2, r0
	ldr	r0, [sp, #160]                  @ 4-byte Reload
	str	r2, [sp, #164]                  @ 4-byte Spill
	mov	r2, r1
	ldr	r1, [sp, #164]                  @ 4-byte Reload
	vmov	d0, r1, r2
	vstr	d0, [sp, #216]                  @ 8-byte Spill
	.loc	1 94 3                          @ ../Core/Src/SDPro.c:94:3
	bl	__aeabi_f2d
	mov	r2, r0
	ldr	r0, [sp, #292]                  @ 4-byte Reload
	str	r2, [sp, #168]                  @ 4-byte Spill
	mov	r2, r1
	ldr	r1, [sp, #168]                  @ 4-byte Reload
	vmov	d0, r1, r2
	vstr	d0, [sp, #208]                  @ 8-byte Spill
	.loc	1 95 3                          @ ../Core/Src/SDPro.c:95:3
	ldr.w	r1, [r0, #288]
	.loc	1 96 3                          @ ../Core/Src/SDPro.c:96:3
	str	r1, [sp, #252]                  @ 4-byte Spill
	ldr.w	r6, [r0, #292]
	.loc	1 97 3                          @ ../Core/Src/SDPro.c:97:3
	ldr.w	r7, [r0, #296]
	.loc	1 98 3                          @ ../Core/Src/SDPro.c:98:3
	ldr.w	r8, [r0, #300]
	.loc	1 99 3                          @ ../Core/Src/SDPro.c:99:3
	ldr.w	r9, [r0, #308]
	.loc	1 100 3                         @ ../Core/Src/SDPro.c:100:3
	ldr.w	r10, [r0, #312]
	.loc	1 101 3                         @ ../Core/Src/SDPro.c:101:3
	ldr.w	r11, [r0, #316]
	.loc	1 102 3                         @ ../Core/Src/SDPro.c:102:3
	ldr.w	r1, [r0, #320]
	.loc	1 103 3                         @ ../Core/Src/SDPro.c:103:3
	str	r1, [sp, #256]                  @ 4-byte Spill
	ldr.w	r0, [r0, #372]
	bl	__aeabi_f2d
	mov	r2, r0
	ldr	r0, [sp, #292]                  @ 4-byte Reload
	str	r2, [sp, #172]                  @ 4-byte Spill
	mov	r2, r1
	ldr	r1, [sp, #172]                  @ 4-byte Reload
	vmov	d0, r1, r2
	vstr	d0, [sp, #200]                  @ 8-byte Spill
	.loc	1 104 3                         @ ../Core/Src/SDPro.c:104:3
	ldr	r0, [r0, #112]
	bl	__aeabi_f2d
	mov	r2, r0
	ldr	r0, [sp, #292]                  @ 4-byte Reload
	str	r2, [sp, #176]                  @ 4-byte Spill
	mov	r2, r1
	ldr	r1, [sp, #176]                  @ 4-byte Reload
	vmov	d0, r1, r2
	vstr	d0, [sp, #192]                  @ 8-byte Spill
	.loc	1 105 3                         @ ../Core/Src/SDPro.c:105:3
	ldr	r0, [r0, #124]
	bl	__aeabi_f2d
	mov	r2, r0
	ldr	r0, [sp, #292]                  @ 4-byte Reload
	str	r2, [sp, #180]                  @ 4-byte Spill
	mov	r2, r1
	ldr	r1, [sp, #180]                  @ 4-byte Reload
	vmov	d0, r1, r2
	vstr	d0, [sp, #184]                  @ 8-byte Spill
	.loc	1 106 3                         @ ../Core/Src/SDPro.c:106:3
	ldr.w	r0, [r0, #128]
	bl	__aeabi_f2d
	vldr	d6, [sp, #184]                  @ 8-byte Reload
	vldr	d5, [sp, #192]                  @ 8-byte Reload
	vldr	d4, [sp, #200]                  @ 8-byte Reload
	vldr	d3, [sp, #208]                  @ 8-byte Reload
	vldr	d2, [sp, #216]                  @ 8-byte Reload
	vldr	d1, [sp, #224]                  @ 8-byte Reload
	vldr	d0, [sp, #232]                  @ 8-byte Reload
	ldr	r2, [sp, #244]                  @ 4-byte Reload
	ldr	r3, [sp, #248]                  @ 4-byte Reload
	ldr.w	lr, [sp, #252]                  @ 4-byte Reload
	mov	r12, r0
	ldr	r0, [sp, #256]                  @ 4-byte Reload
	mov	r5, r1
	ldr	r1, [sp, #260]                  @ 4-byte Reload
	vmov	d7, r12, r5
	.loc	1 87 3                          @ ../Core/Src/SDPro.c:87:3
	mov	r12, sp
	movs	r5, #10
	str	r5, [sp, #268]                  @ 4-byte Spill
	str.w	r5, [r12, #136]
	movs	r5, #13
	str	r5, [sp, #264]                  @ 4-byte Spill
	str.w	r5, [r12, #132]
	ldr	r5, [sp, #292]                  @ 4-byte Reload
	addw	r4, r4, #735
	str.w	r4, [r12, #128]
	ldr	r4, [sp, #288]                  @ 4-byte Reload
	vstr	d7, [r12, #120]
	vstr	d6, [r12, #112]
	vstr	d5, [r12, #104]
	vstr	d7, [r12, #96]
	vstr	d6, [r12, #88]
	vstr	d5, [r12, #80]
	vstr	d4, [r12, #72]
	str.w	r0, [r12, #68]
	ldr	r0, [sp, #276]                  @ 4-byte Reload
	str.w	r11, [r12, #64]
	str.w	r10, [r12, #60]
	str.w	r9, [r12, #56]
	str.w	r8, [r12, #52]
	str.w	r7, [r12, #48]
	str.w	r6, [r12, #44]
	str.w	lr, [r12, #40]
	vstr	d3, [r12, #32]
	vstr	d2, [r12, #24]
	vstr	d1, [r12, #16]
	vstr	d0, [r12, #8]
	str.w	r1, [r12]
	movw	r1, :lower16:.L.str
	movt	r1, :upper16:.L.str
	bl	sprintf
	ldr	r2, [sp, #264]                  @ 4-byte Reload
	ldr	r3, [sp, #268]                  @ 4-byte Reload
	.loc	1 113 6                         @ ../Core/Src/SDPro.c:113:6
	movw	r0, :lower16:SaveDtatExScreen.StrTemp
	movt	r0, :upper16:SaveDtatExScreen.StrTemp
	str	r0, [sp, #272]                  @ 4-byte Spill
	movw	r1, :lower16:.L.str.1
	movt	r1, :upper16:.L.str.1
	bl	sprintf
	ldr	r2, [sp, #272]                  @ 4-byte Reload
	.loc	1 114 97                        @ ../Core/Src/SDPro.c:114:97
	ldrb	r0, [r5, r4]
	adds	r1, r0, #1
	strb	r1, [r5, r4]
	.loc	1 114 20 is_stmt 0              @ ../Core/Src/SDPro.c:114:20
	add.w	r3, r5, #1376
	str	r3, [sp, #296]                  @ 4-byte Spill
	movs	r1, #200
	str	r1, [sp, #280]                  @ 4-byte Spill
	smlabb	r0, r0, r1, r3
	.loc	1 114 3                         @ ../Core/Src/SDPro.c:114:3
	movw	r1, :lower16:.L.str.2
	movt	r1, :upper16:.L.str.2
	movs	r3, #1
	str	r3, [sp, #284]                  @ 4-byte Spill
	bl	StringChangeLine
	ldr	r2, [sp, #276]                  @ 4-byte Reload
	ldr	r1, [sp, #280]                  @ 4-byte Reload
	ldr	r3, [sp, #284]                  @ 4-byte Reload
	ldr.w	r12, [sp, #296]                 @ 4-byte Reload
	.loc	1 115 103 is_stmt 1             @ ../Core/Src/SDPro.c:115:103
	ldrb	r0, [r5, r4]
	add.w	lr, r0, #1
	strb.w	lr, [r5, r4]
	.loc	1 115 26 is_stmt 0              @ ../Core/Src/SDPro.c:115:26
	smlabb	r0, r0, r1, r12
	.loc	1 115 9                         @ ../Core/Src/SDPro.c:115:9
	movw	r1, :lower16:.L.str.3
	movt	r1, :upper16:.L.str.3
	bl	StringChangeLine
	ldr	r1, [sp, #280]                  @ 4-byte Reload
	ldr	r3, [sp, #284]                  @ 4-byte Reload
	ldr	r2, [sp, #296]                  @ 4-byte Reload
	ldr.w	lr, [sp, #292]                  @ 4-byte Reload
	.loc	1 116 103 is_stmt 1             @ ../Core/Src/SDPro.c:116:103
	ldrb.w	r0, [lr, r4]
	add.w	r12, r0, #1
	strb.w	r12, [lr, r4]
	.loc	1 116 26 is_stmt 0              @ ../Core/Src/SDPro.c:116:26
	smlabb	r0, r0, r1, r2
	.loc	1 116 9                         @ ../Core/Src/SDPro.c:116:9
	movw	r1, :lower16:.L.str.4
	movt	r1, :upper16:.L.str.4
	movw	r2, :lower16:.L.str.5
	movt	r2, :upper16:.L.str.5
	bl	StringChangeLine
	ldr	r2, [sp, #288]                  @ 4-byte Reload
	ldr	r0, [sp, #292]                  @ 4-byte Reload
	ldr	r1, [sp, #296]                  @ 4-byte Reload
	.loc	1 117 100 is_stmt 1             @ ../Core/Src/SDPro.c:117:100
	ldrb	r2, [r0, r2]
	mov.w	r3, #1000
	.loc	1 117 9 is_stmt 0               @ ../Core/Src/SDPro.c:117:9
	bl	ScreenTransmit
	.loc	1 118 1 is_stmt 1               @ ../Core/Src/SDPro.c:118:1
	addw	sp, sp, #1324
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Ltmp1:
.Lfunc_end0:
	.size	SaveDtatExScreen, .Lfunc_end0-SaveDtatExScreen
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.type	SaveDtatExScreen.StrTemp,%object @ @SaveDtatExScreen.StrTemp
	.section	.bss.SaveDtatExScreen.StrTemp,"aw",%nobits
SaveDtatExScreen.StrTemp:
	.zero	1024
	.size	SaveDtatExScreen.StrTemp, 1024

	.type	.L.str,%object                  @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"%1.2d:%1.2d:%1.2d\t%5.3f\t%5.3f\t%5.3f\t%5.3f\t%5.4d\t%5.4d\t%5.4d\t%5.4d\t%5.4d\t%5.4d\t%5.4d\t%5.4d\t%5.3f\t%5.3f\t%7.3f\t%5.3f\t%5.3f\t%7.3f\t%5.3f\t%s %c%c"
	.size	.L.str, 140

	.type	.L.str.1,%object                @ @.str.1
.L.str.1:
	.asciz	"Date\tVol1\tVol2\tVol3\tVol4\tDAC\tCur\tVal\tWave\tDAC\tCur\tVal\tWave\tCCur\tLkge\tResC\tResV\tLkge\tResC\tResV\tID%c%c"
	.size	.L.str.1, 101

	.type	.L.str.2,%object                @ @.str.2
.L.str.2:
	.asciz	"mainDataStart.txt="
	.size	.L.str.2, 19

	.type	.L.str.3,%object                @ @.str.3
.L.str.3:
	.asciz	"Data.dataRec.txt="
	.size	.L.str.3, 18

	.type	.L.str.4,%object                @ @.str.4
.L.str.4:
	.asciz	"mainDataFlag.val=2"
	.size	.L.str.4, 19

	.type	.L.str.5,%object                @ @.str.5
.L.str.5:
	.asciz	" "
	.size	.L.str.5, 2

	.section	.debug_abbrev,"",%progbits
	.byte	1                               @ Abbreviation Code
	.byte	17                              @ DW_TAG_compile_unit
	.byte	1                               @ DW_CHILDREN_yes
	.byte	37                              @ DW_AT_producer
	.byte	14                              @ DW_FORM_strp
	.byte	19                              @ DW_AT_language
	.byte	5                               @ DW_FORM_data2
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	16                              @ DW_AT_stmt_list
	.byte	23                              @ DW_FORM_sec_offset
	.byte	27                              @ DW_AT_comp_dir
	.byte	14                              @ DW_FORM_strp
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	2                               @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	64                              @ DW_AT_frame_base
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	39                              @ DW_AT_prototyped
	.byte	25                              @ DW_FORM_flag_present
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	3                               @ Abbreviation Code
	.byte	52                              @ DW_TAG_variable
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	4                               @ Abbreviation Code
	.byte	52                              @ DW_TAG_variable
	.byte	0                               @ DW_CHILDREN_no
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	5                               @ Abbreviation Code
	.byte	1                               @ DW_TAG_array_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	6                               @ Abbreviation Code
	.byte	33                              @ DW_TAG_subrange_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	55                              @ DW_AT_count
	.byte	5                               @ DW_FORM_data2
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	7                               @ Abbreviation Code
	.byte	36                              @ DW_TAG_base_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	62                              @ DW_AT_encoding
	.byte	11                              @ DW_FORM_data1
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	8                               @ Abbreviation Code
	.byte	36                              @ DW_TAG_base_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	62                              @ DW_AT_encoding
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	9                               @ Abbreviation Code
	.byte	52                              @ DW_TAG_variable
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	10                              @ Abbreviation Code
	.byte	33                              @ DW_TAG_subrange_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	55                              @ DW_AT_count
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	11                              @ Abbreviation Code
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	0                               @ EOM(3)
	.section	.debug_info,"",%progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 @ Length of Unit
.Ldebug_info_start0:
	.short	4                               @ DWARF version number
	.long	.debug_abbrev                   @ Offset Into Abbrev. Section
	.byte	4                               @ Address Size (in bytes)
	.byte	1                               @ Abbrev [1] 0xb:0xf8 DW_TAG_compile_unit
	.long	.Linfo_string0                  @ DW_AT_producer
	.short	12                              @ DW_AT_language
	.long	.Linfo_string1                  @ DW_AT_name
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.long	.Linfo_string2                  @ DW_AT_comp_dir
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	2                               @ Abbrev [2] 0x26:0x32 DW_TAG_subprogram
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string6                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	80                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	3                               @ Abbrev [3] 0x37:0x11 DW_TAG_variable
	.long	.Linfo_string3                  @ DW_AT_name
	.long	88                              @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	83                              @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	SaveDtatExScreen.StrTemp
	.byte	4                               @ Abbrev [4] 0x48:0xf DW_TAG_variable
	.byte	3                               @ DW_AT_location
	.byte	145
	.ascii	"\254\002"
	.long	.Linfo_string7                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	82                              @ DW_AT_decl_line
	.long	88                              @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	5                               @ Abbrev [5] 0x58:0xd DW_TAG_array_type
	.long	101                             @ DW_AT_type
	.byte	6                               @ Abbrev [6] 0x5d:0x7 DW_TAG_subrange_type
	.long	108                             @ DW_AT_type
	.short	1024                            @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	7                               @ Abbrev [7] 0x65:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  @ DW_AT_name
	.byte	8                               @ DW_AT_encoding
	.byte	1                               @ DW_AT_byte_size
	.byte	8                               @ Abbrev [8] 0x6c:0x7 DW_TAG_base_type
	.long	.Linfo_string5                  @ DW_AT_name
	.byte	8                               @ DW_AT_byte_size
	.byte	7                               @ DW_AT_encoding
	.byte	9                               @ Abbrev [9] 0x73:0xd DW_TAG_variable
	.long	128                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	87                              @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	.L.str
	.byte	5                               @ Abbrev [5] 0x80:0xc DW_TAG_array_type
	.long	101                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0x85:0x6 DW_TAG_subrange_type
	.long	108                             @ DW_AT_type
	.byte	140                             @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0x8c:0xd DW_TAG_variable
	.long	153                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	113                             @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	.L.str.1
	.byte	5                               @ Abbrev [5] 0x99:0xc DW_TAG_array_type
	.long	101                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0x9e:0x6 DW_TAG_subrange_type
	.long	108                             @ DW_AT_type
	.byte	101                             @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0xa5:0xd DW_TAG_variable
	.long	178                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	114                             @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	.L.str.2
	.byte	5                               @ Abbrev [5] 0xb2:0xc DW_TAG_array_type
	.long	101                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0xb7:0x6 DW_TAG_subrange_type
	.long	108                             @ DW_AT_type
	.byte	19                              @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0xbe:0xd DW_TAG_variable
	.long	203                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	115                             @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	.L.str.3
	.byte	5                               @ Abbrev [5] 0xcb:0xc DW_TAG_array_type
	.long	101                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0xd0:0x6 DW_TAG_subrange_type
	.long	108                             @ DW_AT_type
	.byte	18                              @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0xd7:0xd DW_TAG_variable
	.long	178                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	116                             @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	.L.str.4
	.byte	9                               @ Abbrev [9] 0xe4:0xd DW_TAG_variable
	.long	241                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	116                             @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	.L.str.5
	.byte	5                               @ Abbrev [5] 0xf1:0xc DW_TAG_array_type
	.long	101                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0xf6:0x6 DW_TAG_subrange_type
	.long	108                             @ DW_AT_type
	.byte	2                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0xfd:0x5 DW_TAG_pointer_type
	.long	101                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"Component: Arm Compiler for Embedded 6.19 Tool: armclang [5e73cb00]" @ string offset=0
.Linfo_string1:
	.asciz	"../Core/Src\\SDPro.c"          @ string offset=68
.Linfo_string2:
	.asciz	"C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" @ string offset=88
.Linfo_string3:
	.asciz	"StrTemp"                       @ string offset=158
.Linfo_string4:
	.asciz	"char"                          @ string offset=166
.Linfo_string5:
	.asciz	"__ARRAY_SIZE_TYPE__"           @ string offset=171
.Linfo_string6:
	.asciz	"SaveDtatExScreen"              @ string offset=191
.Linfo_string7:
	.asciz	"FileDataStr"                   @ string offset=208
	.ident	"Component: Arm Compiler for Embedded 6.19 Tool: armclang [5e73cb00]"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
	.ARM_attribute	16, 1	@ Tag_AV_eba
	.section	.debug_line,"",%progbits
.Lline_table_start0:
