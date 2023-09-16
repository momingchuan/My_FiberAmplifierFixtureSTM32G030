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
	.file	"stm32f4xx_hal_msp.c"
	.file	1 "e:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include" "stdint.h"
	.file	2 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h"
	.section	.text.HAL_MspInit,"ax",%progbits
	.hidden	HAL_MspInit                     @ -- Begin function HAL_MspInit
	.globl	HAL_MspInit
	.p2align	2
	.type	HAL_MspInit,%function
	.code	16                              @ @HAL_MspInit
	.thumb_func
HAL_MspInit:
.Lfunc_begin0:
	.file	3 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Core/Src/stm32f4xx_hal_msp.c"
	.loc	3 64 0                          @ ../Core/Src/stm32f4xx_hal_msp.c:64:0
	.fnstart
	.cfi_sections .debug_frame
	.cfi_startproc
@ %bb.0:
	.pad	#8
	sub	sp, #8
	.cfi_def_cfa_offset 8
.Ltmp0:
	.loc	3 69 3 prologue_end             @ ../Core/Src/stm32f4xx_hal_msp.c:69:3
	b	.LBB0_1
.LBB0_1:
	.loc	3 0 3 is_stmt 0                 @ ../Core/Src/stm32f4xx_hal_msp.c:0:3
	movs	r0, #0
.Ltmp1:
	.loc	3 69 3                          @ ../Core/Src/stm32f4xx_hal_msp.c:69:3
	str	r0, [sp, #4]
	movw	r0, #14404
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #16384
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #16384
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	b	.LBB0_2
.Ltmp2:
.LBB0_2:
	.loc	3 70 3 is_stmt 1                @ ../Core/Src/stm32f4xx_hal_msp.c:70:3
	b	.LBB0_3
.LBB0_3:
	.loc	3 0 3 is_stmt 0                 @ ../Core/Src/stm32f4xx_hal_msp.c:0:3
	movs	r0, #0
.Ltmp3:
	.loc	3 70 3                          @ ../Core/Src/stm32f4xx_hal_msp.c:70:3
	str	r0, [sp]
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #268435456
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #268435456
	str	r0, [sp]
	ldr	r0, [sp]
	b	.LBB0_4
.Ltmp4:
.LBB0_4:
	.loc	3 77 1 is_stmt 1                @ ../Core/Src/stm32f4xx_hal_msp.c:77:1
	add	sp, #8
	bx	lr
.Ltmp5:
.Lfunc_end0:
	.size	HAL_MspInit, .Lfunc_end0-HAL_MspInit
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
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
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	3                               @ Abbreviation Code
	.byte	22                              @ DW_TAG_typedef
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	5                               @ DW_FORM_data2
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	4                               @ Abbreviation Code
	.byte	19                              @ DW_TAG_structure_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	5                               @ DW_FORM_data2
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	5                               @ Abbreviation Code
	.byte	13                              @ DW_TAG_member
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	5                               @ DW_FORM_data2
	.byte	56                              @ DW_AT_data_member_location
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	6                               @ Abbreviation Code
	.byte	53                              @ DW_TAG_volatile_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	7                               @ Abbreviation Code
	.byte	22                              @ DW_TAG_typedef
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	8                               @ Abbreviation Code
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
	.byte	9                               @ Abbreviation Code
	.byte	1                               @ DW_TAG_array_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
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
	.byte	12                              @ Abbreviation Code
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
	.byte	13                              @ Abbreviation Code
	.byte	11                              @ DW_TAG_lexical_block
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	14                              @ Abbreviation Code
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
	.byte	0                               @ EOM(3)
	.section	.debug_info,"",%progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 @ Length of Unit
.Ldebug_info_start0:
	.short	4                               @ DWARF version number
	.long	.debug_abbrev                   @ Offset Into Abbrev. Section
	.byte	4                               @ Address Size (in bytes)
	.byte	1                               @ Abbrev [1] 0xb:0x225 DW_TAG_compile_unit
	.long	.Linfo_string0                  @ DW_AT_producer
	.short	12                              @ DW_AT_language
	.long	.Linfo_string1                  @ DW_AT_name
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.long	.Linfo_string2                  @ DW_AT_comp_dir
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	2                               @ Abbrev [2] 0x26:0x5 DW_TAG_pointer_type
	.long	43                              @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x2b:0xc DW_TAG_typedef
	.long	55                              @ DW_AT_type
	.long	.Linfo_string36                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	628                             @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x37:0x18c DW_TAG_structure_type
	.byte	136                             @ DW_AT_byte_size
	.byte	2                               @ DW_AT_decl_file
	.short	596                             @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x3c:0xd DW_TAG_member
	.long	.Linfo_string3                  @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	598                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x49:0xd DW_TAG_member
	.long	.Linfo_string6                  @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	599                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x56:0xd DW_TAG_member
	.long	.Linfo_string7                  @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	600                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x63:0xd DW_TAG_member
	.long	.Linfo_string8                  @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	601                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x70:0xd DW_TAG_member
	.long	.Linfo_string9                  @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	602                             @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x7d:0xd DW_TAG_member
	.long	.Linfo_string10                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	603                             @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x8a:0xd DW_TAG_member
	.long	.Linfo_string11                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	604                             @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x97:0xd DW_TAG_member
	.long	.Linfo_string12                 @ DW_AT_name
	.long	456                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	605                             @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xa4:0xd DW_TAG_member
	.long	.Linfo_string13                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	606                             @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xb1:0xd DW_TAG_member
	.long	.Linfo_string14                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	607                             @ DW_AT_decl_line
	.byte	36                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xbe:0xd DW_TAG_member
	.long	.Linfo_string15                 @ DW_AT_name
	.long	474                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	608                             @ DW_AT_decl_line
	.byte	40                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xcb:0xd DW_TAG_member
	.long	.Linfo_string17                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	609                             @ DW_AT_decl_line
	.byte	48                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xd8:0xd DW_TAG_member
	.long	.Linfo_string18                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	610                             @ DW_AT_decl_line
	.byte	52                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xe5:0xd DW_TAG_member
	.long	.Linfo_string19                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	611                             @ DW_AT_decl_line
	.byte	56                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xf2:0xd DW_TAG_member
	.long	.Linfo_string20                 @ DW_AT_name
	.long	456                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	612                             @ DW_AT_decl_line
	.byte	60                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xff:0xd DW_TAG_member
	.long	.Linfo_string21                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	613                             @ DW_AT_decl_line
	.byte	64                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x10c:0xd DW_TAG_member
	.long	.Linfo_string22                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	614                             @ DW_AT_decl_line
	.byte	68                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x119:0xd DW_TAG_member
	.long	.Linfo_string23                 @ DW_AT_name
	.long	474                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	615                             @ DW_AT_decl_line
	.byte	72                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x126:0xd DW_TAG_member
	.long	.Linfo_string24                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	616                             @ DW_AT_decl_line
	.byte	80                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x133:0xd DW_TAG_member
	.long	.Linfo_string25                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	617                             @ DW_AT_decl_line
	.byte	84                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x140:0xd DW_TAG_member
	.long	.Linfo_string26                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	618                             @ DW_AT_decl_line
	.byte	88                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x14d:0xd DW_TAG_member
	.long	.Linfo_string27                 @ DW_AT_name
	.long	456                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	619                             @ DW_AT_decl_line
	.byte	92                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x15a:0xd DW_TAG_member
	.long	.Linfo_string28                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	620                             @ DW_AT_decl_line
	.byte	96                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x167:0xd DW_TAG_member
	.long	.Linfo_string29                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	621                             @ DW_AT_decl_line
	.byte	100                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x174:0xd DW_TAG_member
	.long	.Linfo_string30                 @ DW_AT_name
	.long	474                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	622                             @ DW_AT_decl_line
	.byte	104                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x181:0xd DW_TAG_member
	.long	.Linfo_string31                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	623                             @ DW_AT_decl_line
	.byte	112                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x18e:0xd DW_TAG_member
	.long	.Linfo_string32                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	624                             @ DW_AT_decl_line
	.byte	116                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x19b:0xd DW_TAG_member
	.long	.Linfo_string33                 @ DW_AT_name
	.long	474                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	625                             @ DW_AT_decl_line
	.byte	120                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1a8:0xd DW_TAG_member
	.long	.Linfo_string34                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	626                             @ DW_AT_decl_line
	.byte	128                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1b5:0xd DW_TAG_member
	.long	.Linfo_string35                 @ DW_AT_name
	.long	451                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	627                             @ DW_AT_decl_line
	.byte	132                             @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0x1c3:0x5 DW_TAG_volatile_type
	.long	456                             @ DW_AT_type
	.byte	7                               @ Abbrev [7] 0x1c8:0xb DW_TAG_typedef
	.long	467                             @ DW_AT_type
	.long	.Linfo_string5                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	64                              @ DW_AT_decl_line
	.byte	8                               @ Abbrev [8] 0x1d3:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	9                               @ Abbrev [9] 0x1da:0xc DW_TAG_array_type
	.long	456                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0x1df:0x6 DW_TAG_subrange_type
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x1e6:0x7 DW_TAG_base_type
	.long	.Linfo_string16                 @ DW_AT_name
	.byte	8                               @ DW_AT_byte_size
	.byte	7                               @ DW_AT_encoding
	.byte	12                              @ Abbrev [12] 0x1ed:0x42 DW_TAG_subprogram
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string37                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	63                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	13                              @ Abbrev [13] 0x1fe:0x18 DW_TAG_lexical_block
	.long	.Ltmp1                          @ DW_AT_low_pc
	.long	.Ltmp2-.Ltmp1                   @ DW_AT_high_pc
	.byte	14                              @ Abbrev [14] 0x207:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.long	.Linfo_string38                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	69                              @ DW_AT_decl_line
	.long	451                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	13                              @ Abbrev [13] 0x216:0x18 DW_TAG_lexical_block
	.long	.Ltmp3                          @ DW_AT_low_pc
	.long	.Ltmp4-.Ltmp3                   @ DW_AT_high_pc
	.byte	14                              @ Abbrev [14] 0x21f:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	0
	.long	.Linfo_string38                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	70                              @ DW_AT_decl_line
	.long	451                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"Component: Arm Compiler for Embedded 6.19 Tool: armclang [5e73cb00]" @ string offset=0
.Linfo_string1:
	.asciz	"../Core/Src\\stm32f4xx_hal_msp.c" @ string offset=68
.Linfo_string2:
	.asciz	"C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" @ string offset=100
.Linfo_string3:
	.asciz	"CR"                            @ string offset=170
.Linfo_string4:
	.asciz	"unsigned int"                  @ string offset=173
.Linfo_string5:
	.asciz	"uint32_t"                      @ string offset=186
.Linfo_string6:
	.asciz	"PLLCFGR"                       @ string offset=195
.Linfo_string7:
	.asciz	"CFGR"                          @ string offset=203
.Linfo_string8:
	.asciz	"CIR"                           @ string offset=208
.Linfo_string9:
	.asciz	"AHB1RSTR"                      @ string offset=212
.Linfo_string10:
	.asciz	"AHB2RSTR"                      @ string offset=221
.Linfo_string11:
	.asciz	"AHB3RSTR"                      @ string offset=230
.Linfo_string12:
	.asciz	"RESERVED0"                     @ string offset=239
.Linfo_string13:
	.asciz	"APB1RSTR"                      @ string offset=249
.Linfo_string14:
	.asciz	"APB2RSTR"                      @ string offset=258
.Linfo_string15:
	.asciz	"RESERVED1"                     @ string offset=267
.Linfo_string16:
	.asciz	"__ARRAY_SIZE_TYPE__"           @ string offset=277
.Linfo_string17:
	.asciz	"AHB1ENR"                       @ string offset=297
.Linfo_string18:
	.asciz	"AHB2ENR"                       @ string offset=305
.Linfo_string19:
	.asciz	"AHB3ENR"                       @ string offset=313
.Linfo_string20:
	.asciz	"RESERVED2"                     @ string offset=321
.Linfo_string21:
	.asciz	"APB1ENR"                       @ string offset=331
.Linfo_string22:
	.asciz	"APB2ENR"                       @ string offset=339
.Linfo_string23:
	.asciz	"RESERVED3"                     @ string offset=347
.Linfo_string24:
	.asciz	"AHB1LPENR"                     @ string offset=357
.Linfo_string25:
	.asciz	"AHB2LPENR"                     @ string offset=367
.Linfo_string26:
	.asciz	"AHB3LPENR"                     @ string offset=377
.Linfo_string27:
	.asciz	"RESERVED4"                     @ string offset=387
.Linfo_string28:
	.asciz	"APB1LPENR"                     @ string offset=397
.Linfo_string29:
	.asciz	"APB2LPENR"                     @ string offset=407
.Linfo_string30:
	.asciz	"RESERVED5"                     @ string offset=417
.Linfo_string31:
	.asciz	"BDCR"                          @ string offset=427
.Linfo_string32:
	.asciz	"CSR"                           @ string offset=432
.Linfo_string33:
	.asciz	"RESERVED6"                     @ string offset=436
.Linfo_string34:
	.asciz	"SSCGR"                         @ string offset=446
.Linfo_string35:
	.asciz	"PLLI2SCFGR"                    @ string offset=452
.Linfo_string36:
	.asciz	"RCC_TypeDef"                   @ string offset=463
.Linfo_string37:
	.asciz	"HAL_MspInit"                   @ string offset=475
.Linfo_string38:
	.asciz	"tmpreg"                        @ string offset=487
	.ident	"Component: Arm Compiler for Embedded 6.19 Tool: armclang [5e73cb00]"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
	.ARM_attribute	16, 1	@ Tag_AV_eba
	.section	.debug_line,"",%progbits
.Lline_table_start0:
