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
	.file	"SaveDATA.c"
	.file	1 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Core/Inc\\SaveDATA.h"
	.file	2 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Core/Src/SaveDATA.c"
	.file	3 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_def.h"
	.file	4 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_hal_dma.h"
	.file	5 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_hal_i2c.h"
	.section	.text.SaveData_EX,"ax",%progbits
	.hidden	SaveData_EX                     @ -- Begin function SaveData_EX
	.globl	SaveData_EX
	.p2align	2
	.type	SaveData_EX,%function
	.code	16                              @ @SaveData_EX
	.thumb_func
SaveData_EX:
.Lfunc_begin0:
	.loc	2 20 0                          @ ../Core/Src/SaveDATA.c:20:0
	.fnstart
	.cfi_sections .debug_frame
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
.Ltmp0:
	.loc	2 25 42 prologue_end            @ ../Core/Src/SaveDATA.c:25:42
	movw	r2, :lower16:USART_Data
	movt	r2, :upper16:USART_Data
	ldr	r0, [r2, #4]
	.loc	2 25 18 is_stmt 0               @ ../Core/Src/SaveDATA.c:25:18
	movw	r1, :lower16:DATA_block
	movt	r1, :upper16:DATA_block
	str	r0, [r1]
	.loc	2 26 42 is_stmt 1               @ ../Core/Src/SaveDATA.c:26:42
	ldr	r0, [r2, #8]
	.loc	2 26 18 is_stmt 0               @ ../Core/Src/SaveDATA.c:26:18
	str	r0, [r1, #4]
	.loc	2 27 42 is_stmt 1               @ ../Core/Src/SaveDATA.c:27:42
	ldr	r0, [r2, #12]
	.loc	2 27 18 is_stmt 0               @ ../Core/Src/SaveDATA.c:27:18
	str	r0, [r1, #8]
	.loc	2 29 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:29:44
	ldr	r0, [r2, #48]
	.loc	2 29 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:29:19
	str	r0, [r1, #12]
	.loc	2 30 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:30:44
	ldr	r0, [r2, #52]
	.loc	2 30 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:30:19
	str	r0, [r1, #16]
	.loc	2 31 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:31:44
	ldr	r0, [r2, #56]
	.loc	2 31 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:31:19
	str	r0, [r1, #20]
	.loc	2 32 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:32:44
	ldr	r0, [r2, #60]
	.loc	2 32 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:32:19
	str	r0, [r1, #24]
	.loc	2 33 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:33:44
	ldr	r0, [r2, #64]
	.loc	2 33 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:33:19
	str	r0, [r1, #28]
	.loc	2 34 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:34:44
	ldr	r0, [r2, #68]
	.loc	2 34 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:34:19
	str	r0, [r1, #32]
	.loc	2 35 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:35:44
	ldr	r0, [r2, #72]
	.loc	2 35 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:35:19
	str	r0, [r1, #36]
	.loc	2 36 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:36:44
	ldr	r0, [r2, #76]
	.loc	2 36 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:36:19
	str	r0, [r1, #40]
	.loc	2 38 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:38:44
	ldr	r0, [r2, #80]
	.loc	2 38 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:38:19
	str	r0, [r1, #44]
	.loc	2 39 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:39:44
	ldr	r0, [r2, #84]
	.loc	2 39 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:39:19
	str	r0, [r1, #48]
	.loc	2 40 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:40:44
	ldr	r0, [r2, #88]
	.loc	2 40 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:40:19
	str	r0, [r1, #52]
	.loc	2 41 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:41:44
	ldr	r0, [r2, #92]
	.loc	2 41 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:41:19
	str	r0, [r1, #56]
	.loc	2 42 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:42:44
	ldr	r0, [r2, #96]
	.loc	2 42 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:42:19
	str	r0, [r1, #60]
	.loc	2 43 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:43:44
	ldr	r0, [r2, #100]
	.loc	2 43 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:43:19
	str	r0, [r1, #64]
	.loc	2 44 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:44:44
	ldr	r0, [r2, #104]
	.loc	2 44 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:44:19
	str	r0, [r1, #68]
	.loc	2 45 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:45:44
	ldr	r0, [r2, #108]
	.loc	2 45 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:45:19
	str	r0, [r1, #72]
	.loc	2 49 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:49:45
	ldr.w	r0, [r2, #176]
	.loc	2 49 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:49:20
	str	r0, [r1, #76]
	.loc	2 50 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:50:45
	ldr.w	r0, [r2, #180]
	.loc	2 50 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:50:20
	str	r0, [r1, #80]
	.loc	2 51 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:51:45
	ldr.w	r0, [r2, #184]
	.loc	2 51 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:51:20
	str	r0, [r1, #84]
	.loc	2 52 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:52:45
	ldr.w	r0, [r2, #188]
	.loc	2 52 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:52:20
	str	r0, [r1, #88]
	.loc	2 53 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:53:45
	ldr.w	r0, [r2, #192]
	.loc	2 53 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:53:20
	str	r0, [r1, #92]
	.loc	2 54 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:54:45
	ldr.w	r0, [r2, #196]
	.loc	2 54 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:54:20
	str	r0, [r1, #96]
	.loc	2 55 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:55:45
	ldr.w	r0, [r2, #200]
	.loc	2 55 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:55:20
	str	r0, [r1, #100]
	.loc	2 56 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:56:45
	ldr.w	r0, [r2, #204]
	.loc	2 56 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:56:20
	str	r0, [r1, #104]
	.loc	2 58 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:58:44
	ldr.w	r0, [r2, #208]
	.loc	2 58 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:58:19
	str	r0, [r1, #108]
	.loc	2 59 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:59:44
	ldr.w	r0, [r2, #212]
	.loc	2 59 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:59:19
	str	r0, [r1, #112]
	.loc	2 60 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:60:44
	ldr.w	r0, [r2, #216]
	.loc	2 60 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:60:19
	str	r0, [r1, #116]
	.loc	2 61 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:61:44
	ldr.w	r0, [r2, #220]
	.loc	2 61 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:61:19
	str	r0, [r1, #120]
	.loc	2 62 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:62:44
	ldr.w	r0, [r2, #224]
	.loc	2 62 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:62:19
	str	r0, [r1, #124]
	.loc	2 63 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:63:44
	ldr.w	r0, [r2, #228]
	.loc	2 63 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:63:19
	str.w	r0, [r1, #128]
	.loc	2 64 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:64:44
	ldr.w	r0, [r2, #232]
	.loc	2 64 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:64:19
	str.w	r0, [r1, #132]
	.loc	2 65 44 is_stmt 1               @ ../Core/Src/SaveDATA.c:65:44
	ldr.w	r0, [r2, #236]
	.loc	2 65 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:65:19
	str.w	r0, [r1, #136]
	.loc	2 68 39 is_stmt 1               @ ../Core/Src/SaveDATA.c:68:39
	movw	r0, :lower16:comVariableBlock
	movt	r0, :upper16:comVariableBlock
	ldr.w	r3, [r0, #808]
	.loc	2 68 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:68:20
	str.w	r3, [r1, #140]
	.loc	2 69 39 is_stmt 1               @ ../Core/Src/SaveDATA.c:69:39
	ldr.w	r3, [r0, #812]
	.loc	2 69 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:69:20
	str.w	r3, [r1, #144]
	.loc	2 71 39 is_stmt 1               @ ../Core/Src/SaveDATA.c:71:39
	ldr.w	r3, [r0, #816]
	.loc	2 71 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:71:20
	str.w	r3, [r1, #148]
	.loc	2 72 39 is_stmt 1               @ ../Core/Src/SaveDATA.c:72:39
	ldr.w	r3, [r0, #820]
	.loc	2 72 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:72:20
	str.w	r3, [r1, #152]
	.loc	2 74 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:74:45
	ldrh.w	r3, [r2, #262]
	.loc	2 74 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:74:19
	strh.w	r3, [r1, #156]
	.loc	2 75 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:75:45
	ldrh.w	r3, [r2, #264]
	.loc	2 75 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:75:19
	strh.w	r3, [r1, #158]
	.loc	2 76 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:76:45
	ldrh.w	r3, [r2, #266]
	.loc	2 76 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:76:19
	strh.w	r3, [r1, #160]
	.loc	2 77 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:77:45
	ldrh.w	r3, [r2, #268]
	.loc	2 77 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:77:19
	strh.w	r3, [r1, #162]
	.loc	2 78 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:78:45
	ldrh.w	r3, [r2, #270]
	.loc	2 78 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:78:19
	strh.w	r3, [r1, #164]
	.loc	2 79 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:79:45
	ldrh.w	r3, [r2, #272]
	.loc	2 79 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:79:19
	strh.w	r3, [r1, #166]
	.loc	2 80 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:80:45
	ldrh.w	r3, [r2, #274]
	.loc	2 80 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:80:19
	strh.w	r3, [r1, #168]
	.loc	2 81 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:81:45
	ldrh.w	r3, [r2, #276]
	.loc	2 81 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:81:19
	strh.w	r3, [r1, #170]
	.loc	2 82 45 is_stmt 1               @ ../Core/Src/SaveDATA.c:82:45
	ldrh.w	r3, [r2, #278]
	.loc	2 82 19 is_stmt 0               @ ../Core/Src/SaveDATA.c:82:19
	strh.w	r3, [r1, #172]
	.loc	2 83 46 is_stmt 1               @ ../Core/Src/SaveDATA.c:83:46
	ldrh.w	r3, [r2, #280]
	.loc	2 83 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:83:20
	strh.w	r3, [r1, #174]
	.loc	2 84 46 is_stmt 1               @ ../Core/Src/SaveDATA.c:84:46
	ldrh.w	r3, [r2, #240]
	.loc	2 84 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:84:20
	strh.w	r3, [r1, #176]
	.loc	2 85 46 is_stmt 1               @ ../Core/Src/SaveDATA.c:85:46
	ldrh.w	r3, [r2, #242]
	.loc	2 85 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:85:20
	strh.w	r3, [r1, #178]
	.loc	2 86 46 is_stmt 1               @ ../Core/Src/SaveDATA.c:86:46
	ldrh.w	r3, [r2, #244]
	.loc	2 86 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:86:20
	strh.w	r3, [r1, #180]
	.loc	2 87 46 is_stmt 1               @ ../Core/Src/SaveDATA.c:87:46
	ldrh.w	r3, [r2, #246]
	.loc	2 87 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:87:20
	strh.w	r3, [r1, #182]
	.loc	2 88 46 is_stmt 1               @ ../Core/Src/SaveDATA.c:88:46
	ldrh.w	r3, [r2, #248]
	.loc	2 88 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:88:20
	strh.w	r3, [r1, #184]
	.loc	2 89 46 is_stmt 1               @ ../Core/Src/SaveDATA.c:89:46
	ldrh.w	r3, [r2, #250]
	.loc	2 89 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:89:20
	strh.w	r3, [r1, #186]
	.loc	2 90 46 is_stmt 1               @ ../Core/Src/SaveDATA.c:90:46
	ldrh.w	r3, [r2, #252]
	.loc	2 90 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:90:20
	strh.w	r3, [r1, #188]
	.loc	2 91 46 is_stmt 1               @ ../Core/Src/SaveDATA.c:91:46
	ldrh.w	r3, [r2, #254]
	.loc	2 91 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:91:20
	strh.w	r3, [r1, #190]
	.loc	2 92 46 is_stmt 1               @ ../Core/Src/SaveDATA.c:92:46
	ldrh.w	r3, [r2, #256]
	.loc	2 92 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:92:20
	strh.w	r3, [r1, #192]
	.loc	2 93 46 is_stmt 1               @ ../Core/Src/SaveDATA.c:93:46
	ldrh.w	r2, [r2, #258]
	.loc	2 93 20 is_stmt 0               @ ../Core/Src/SaveDATA.c:93:20
	strh.w	r2, [r1, #194]
	.loc	2 97 32 is_stmt 1               @ ../Core/Src/SaveDATA.c:97:32
	str	r1, [r0]
	movs	r1, #196
	.loc	2 98 35                         @ ../Core/Src/SaveDATA.c:98:35
	strh	r1, [r0, #4]
	.loc	2 99 36                         @ ../Core/Src/SaveDATA.c:99:36
	ldr	r1, [r0]
	.loc	2 99 66 is_stmt 0               @ ../Core/Src/SaveDATA.c:99:66
	ldrh	r2, [r0, #4]
	.loc	2 99 2                          @ ../Core/Src/SaveDATA.c:99:2
	movw	r0, :lower16:hi2c1
	movt	r0, :upper16:hi2c1
	bl	WriteData
	.loc	2 100 1 is_stmt 1               @ ../Core/Src/SaveDATA.c:100:1
	pop	{r7, pc}
.Ltmp1:
.Lfunc_end0:
	.size	SaveData_EX, .Lfunc_end0-SaveData_EX
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.WriteData,"ax",%progbits
	.hidden	WriteData                       @ -- Begin function WriteData
	.globl	WriteData
	.p2align	2
	.type	WriteData,%function
	.code	16                              @ @WriteData
	.thumb_func
WriteData:
.Lfunc_begin1:
	.loc	2 346 0                         @ ../Core/Src/SaveDATA.c:346:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#24
	sub	sp, #24
	.cfi_def_cfa_offset 32
                                        @ kill: def $r3 killed $r2
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	strh.w	r2, [sp, #14]
	movs	r0, #0
.Ltmp2:
	.loc	2 348 16 prologue_end           @ ../Core/Src/SaveDATA.c:348:16
	strb.w	r0, [sp, #13]
	.loc	2 349 16                        @ ../Core/Src/SaveDATA.c:349:16
	strb.w	r0, [sp, #12]
	.loc	2 350 12                        @ ../Core/Src/SaveDATA.c:350:12
	ldrh.w	r0, [sp, #14]
	.loc	2 350 15 is_stmt 0              @ ../Core/Src/SaveDATA.c:350:15
	lsrs	r0, r0, #4
	.loc	2 350 10                        @ ../Core/Src/SaveDATA.c:350:10
	strb.w	r0, [sp, #13]
.Ltmp3:
	.loc	2 351 5 is_stmt 1               @ ../Core/Src/SaveDATA.c:351:5
	ldrh.w	r0, [sp, #14]
.Ltmp4:
	.loc	2 351 5 is_stmt 0               @ ../Core/Src/SaveDATA.c:351:5
	lsls	r0, r0, #28
	cbz	r0, .LBB1_2
	b	.LBB1_1
.LBB1_1:
.Ltmp5:
	.loc	2 351 23                        @ ../Core/Src/SaveDATA.c:351:23
	ldrb.w	r0, [sp, #13]
	adds	r0, #1
	strb.w	r0, [sp, #13]
	.loc	2 351 16                        @ ../Core/Src/SaveDATA.c:351:16
	b	.LBB1_2
.Ltmp6:
.LBB1_2:
	.loc	2 353 2 is_stmt 1               @ ../Core/Src/SaveDATA.c:353:2
	b	.LBB1_3
.LBB1_3:                                @ =>This Inner Loop Header: Depth=1
	.loc	2 353 8 is_stmt 0               @ ../Core/Src/SaveDATA.c:353:8
	ldrb.w	r0, [sp, #13]
	.loc	2 353 2                         @ ../Core/Src/SaveDATA.c:353:2
	cbz	r0, .LBB1_5
	b	.LBB1_4
.LBB1_4:                                @   in Loop: Header=BB1_3 Depth=1
.Ltmp7:
	.loc	2 363 37 is_stmt 1              @ ../Core/Src/SaveDATA.c:363:37
	ldrb.w	r2, [sp, #12]
	.loc	2 363 67 is_stmt 0              @ ../Core/Src/SaveDATA.c:363:67
	ldr	r0, [sp, #16]
	.loc	2 363 75                        @ ../Core/Src/SaveDATA.c:363:75
	add	r0, r2
	.loc	2 363 3                         @ ../Core/Src/SaveDATA.c:363:3
	mov	r1, sp
	movs	r3, #16
	str	r3, [r1, #4]
	str	r0, [r1]
	movw	r0, :lower16:hi2c1
	movt	r0, :upper16:hi2c1
	movs	r1, #160
	movs	r3, #1
	bl	HAL_I2C_Mem_Write_DMA
	.loc	2 364 10 is_stmt 1              @ ../Core/Src/SaveDATA.c:364:10
	ldrb.w	r0, [sp, #13]
	subs	r0, #1
	strb.w	r0, [sp, #13]
	.loc	2 365 11                        @ ../Core/Src/SaveDATA.c:365:11
	ldrb.w	r0, [sp, #12]
	adds	r0, #16
	strb.w	r0, [sp, #12]
	movs	r0, #50
	.loc	2 366 3                         @ ../Core/Src/SaveDATA.c:366:3
	bl	HAL_Delay
.Ltmp8:
	.loc	2 353 2                         @ ../Core/Src/SaveDATA.c:353:2
	b	.LBB1_3
.LBB1_5:
	.loc	2 370 1                         @ ../Core/Src/SaveDATA.c:370:1
	add	sp, #24
	pop	{r7, pc}
.Ltmp9:
.Lfunc_end1:
	.size	WriteData, .Lfunc_end1-WriteData
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.ReadData_EX,"ax",%progbits
	.hidden	ReadData_EX                     @ -- Begin function ReadData_EX
	.globl	ReadData_EX
	.p2align	2
	.type	ReadData_EX,%function
	.code	16                              @ @ReadData_EX
	.thumb_func
ReadData_EX:
.Lfunc_begin2:
	.loc	2 103 0                         @ ../Core/Src/SaveDATA.c:103:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#16
	sub	sp, #16
	.cfi_def_cfa_offset 24
.Ltmp10:
	.loc	2 106 12 prologue_end           @ ../Core/Src/SaveDATA.c:106:12
	movw	r0, :lower16:DATA_block
	movt	r0, :upper16:DATA_block
	str	r0, [sp, #4]                    @ 4-byte Spill
	str	r0, [sp, #12]
	.loc	2 107 18                        @ ../Core/Src/SaveDATA.c:107:18
	ldr	r1, [sp, #12]
	.loc	2 107 2 is_stmt 0               @ ../Core/Src/SaveDATA.c:107:2
	movw	r0, :lower16:hi2c1
	movt	r0, :upper16:hi2c1
	movs	r2, #196
	bl	ReadData
	movs	r0, #50
	.loc	2 108 2 is_stmt 1               @ ../Core/Src/SaveDATA.c:108:2
	bl	HAL_Delay
	ldr	r1, [sp, #4]                    @ 4-byte Reload
	.loc	2 110 52                        @ ../Core/Src/SaveDATA.c:110:52
	ldr	r0, [r1]
	.loc	2 110 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:110:39
	movw	r2, :lower16:USART_Data
	movt	r2, :upper16:USART_Data
	str	r2, [sp, #8]                    @ 4-byte Spill
	str	r0, [r2, #4]
	.loc	2 111 52 is_stmt 1              @ ../Core/Src/SaveDATA.c:111:52
	ldr	r0, [r1, #4]
	.loc	2 111 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:111:39
	str	r0, [r2, #8]
	.loc	2 112 52 is_stmt 1              @ ../Core/Src/SaveDATA.c:112:52
	ldr	r0, [r1, #8]
	.loc	2 112 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:112:39
	str	r0, [r2, #12]
	.loc	2 114 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:114:51
	ldr	r0, [r1, #12]
	.loc	2 114 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:114:39
	str	r0, [r2, #48]
	.loc	2 115 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:115:51
	ldr	r0, [r1, #16]
	.loc	2 115 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:115:39
	str	r0, [r2, #52]
	.loc	2 116 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:116:51
	ldr	r0, [r1, #20]
	.loc	2 116 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:116:39
	str	r0, [r2, #56]
	.loc	2 117 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:117:51
	ldr	r0, [r1, #24]
	.loc	2 117 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:117:39
	str	r0, [r2, #60]
	.loc	2 118 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:118:51
	ldr	r0, [r1, #28]
	.loc	2 118 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:118:39
	str	r0, [r2, #64]
	.loc	2 119 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:119:51
	ldr	r0, [r1, #32]
	.loc	2 119 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:119:39
	str	r0, [r2, #68]
	.loc	2 120 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:120:51
	ldr	r0, [r1, #36]
	.loc	2 120 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:120:39
	str	r0, [r2, #72]
	.loc	2 121 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:121:51
	ldr	r0, [r1, #40]
	.loc	2 121 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:121:39
	str	r0, [r2, #76]
	.loc	2 123 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:123:51
	ldr	r0, [r1, #44]
	.loc	2 123 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:123:39
	str	r0, [r2, #80]
	.loc	2 124 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:124:51
	ldr	r0, [r1, #48]
	.loc	2 124 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:124:39
	str	r0, [r2, #84]
	.loc	2 125 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:125:51
	ldr	r0, [r1, #52]
	.loc	2 125 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:125:39
	str	r0, [r2, #88]
	.loc	2 126 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:126:51
	ldr	r0, [r1, #56]
	.loc	2 126 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:126:39
	str	r0, [r2, #92]
	.loc	2 127 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:127:51
	ldr	r0, [r1, #60]
	.loc	2 127 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:127:39
	str	r0, [r2, #96]
	.loc	2 128 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:128:51
	ldr	r0, [r1, #64]
	.loc	2 128 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:128:39
	str	r0, [r2, #100]
	.loc	2 129 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:129:51
	ldr	r0, [r1, #68]
	.loc	2 129 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:129:39
	str	r0, [r2, #104]
	.loc	2 130 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:130:51
	ldr	r0, [r1, #72]
	.loc	2 130 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:130:39
	str	r0, [r2, #108]
	.loc	2 132 52 is_stmt 1              @ ../Core/Src/SaveDATA.c:132:52
	ldr	r0, [r1, #76]
	.loc	2 132 40 is_stmt 0              @ ../Core/Src/SaveDATA.c:132:40
	str.w	r0, [r2, #176]
	.loc	2 133 52 is_stmt 1              @ ../Core/Src/SaveDATA.c:133:52
	ldr	r0, [r1, #80]
	.loc	2 133 40 is_stmt 0              @ ../Core/Src/SaveDATA.c:133:40
	str.w	r0, [r2, #180]
	.loc	2 134 52 is_stmt 1              @ ../Core/Src/SaveDATA.c:134:52
	ldr	r0, [r1, #84]
	.loc	2 134 40 is_stmt 0              @ ../Core/Src/SaveDATA.c:134:40
	str.w	r0, [r2, #184]
	.loc	2 135 52 is_stmt 1              @ ../Core/Src/SaveDATA.c:135:52
	ldr	r0, [r1, #88]
	.loc	2 135 40 is_stmt 0              @ ../Core/Src/SaveDATA.c:135:40
	str.w	r0, [r2, #188]
	.loc	2 136 52 is_stmt 1              @ ../Core/Src/SaveDATA.c:136:52
	ldr	r0, [r1, #92]
	.loc	2 136 40 is_stmt 0              @ ../Core/Src/SaveDATA.c:136:40
	str.w	r0, [r2, #192]
	.loc	2 137 52 is_stmt 1              @ ../Core/Src/SaveDATA.c:137:52
	ldr	r0, [r1, #96]
	.loc	2 137 40 is_stmt 0              @ ../Core/Src/SaveDATA.c:137:40
	str.w	r0, [r2, #196]
	.loc	2 138 52 is_stmt 1              @ ../Core/Src/SaveDATA.c:138:52
	ldr	r0, [r1, #100]
	.loc	2 138 40 is_stmt 0              @ ../Core/Src/SaveDATA.c:138:40
	str.w	r0, [r2, #200]
	.loc	2 139 52 is_stmt 1              @ ../Core/Src/SaveDATA.c:139:52
	ldr	r0, [r1, #104]
	.loc	2 139 40 is_stmt 0              @ ../Core/Src/SaveDATA.c:139:40
	str.w	r0, [r2, #204]
	.loc	2 141 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:141:51
	ldr	r0, [r1, #108]
	.loc	2 141 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:141:39
	str.w	r0, [r2, #208]
	.loc	2 142 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:142:51
	ldr	r0, [r1, #112]
	.loc	2 142 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:142:39
	str.w	r0, [r2, #212]
	.loc	2 143 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:143:51
	ldr	r0, [r1, #116]
	.loc	2 143 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:143:39
	str.w	r0, [r2, #216]
	.loc	2 144 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:144:51
	ldr	r0, [r1, #120]
	.loc	2 144 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:144:39
	str.w	r0, [r2, #220]
	.loc	2 145 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:145:51
	ldr	r0, [r1, #124]
	.loc	2 145 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:145:39
	str.w	r0, [r2, #224]
	.loc	2 146 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:146:51
	ldr.w	r0, [r1, #128]
	.loc	2 146 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:146:39
	str.w	r0, [r2, #228]
	.loc	2 147 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:147:51
	ldr.w	r0, [r1, #132]
	.loc	2 147 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:147:39
	str.w	r0, [r2, #232]
	.loc	2 148 51 is_stmt 1              @ ../Core/Src/SaveDATA.c:148:51
	ldr.w	r0, [r1, #136]
	.loc	2 148 39 is_stmt 0              @ ../Core/Src/SaveDATA.c:148:39
	str.w	r0, [r2, #236]
	.loc	2 150 49 is_stmt 1              @ ../Core/Src/SaveDATA.c:150:49
	ldr.w	r3, [r1, #140]
	.loc	2 150 36 is_stmt 0              @ ../Core/Src/SaveDATA.c:150:36
	movw	r0, :lower16:comVariableBlock
	movt	r0, :upper16:comVariableBlock
	str.w	r3, [r0, #808]
	.loc	2 151 49 is_stmt 1              @ ../Core/Src/SaveDATA.c:151:49
	ldr.w	r3, [r1, #144]
	.loc	2 151 36 is_stmt 0              @ ../Core/Src/SaveDATA.c:151:36
	str.w	r3, [r0, #812]
	.loc	2 153 49 is_stmt 1              @ ../Core/Src/SaveDATA.c:153:49
	ldr.w	r3, [r1, #148]
	.loc	2 153 36 is_stmt 0              @ ../Core/Src/SaveDATA.c:153:36
	str.w	r3, [r0, #816]
	.loc	2 154 49 is_stmt 1              @ ../Core/Src/SaveDATA.c:154:49
	ldr.w	r3, [r1, #152]
	.loc	2 154 36 is_stmt 0              @ ../Core/Src/SaveDATA.c:154:36
	str.w	r3, [r0, #820]
	.loc	2 157 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:157:53
	ldrh.w	r3, [r1, #156]
	.loc	2 157 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:157:41
	strh.w	r3, [r2, #262]
	.loc	2 158 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:158:53
	ldrh.w	r3, [r1, #158]
	.loc	2 158 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:158:41
	strh.w	r3, [r2, #264]
	.loc	2 159 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:159:53
	ldrh.w	r3, [r1, #160]
	.loc	2 159 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:159:41
	strh.w	r3, [r2, #266]
	.loc	2 160 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:160:53
	ldrh.w	r3, [r1, #162]
	.loc	2 160 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:160:41
	strh.w	r3, [r2, #268]
	.loc	2 161 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:161:53
	ldrh.w	r3, [r1, #164]
	.loc	2 161 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:161:41
	strh.w	r3, [r2, #270]
	.loc	2 162 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:162:53
	ldrh.w	r3, [r1, #166]
	.loc	2 162 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:162:41
	strh.w	r3, [r2, #272]
	.loc	2 163 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:163:53
	ldrh.w	r3, [r1, #168]
	.loc	2 163 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:163:41
	strh.w	r3, [r2, #274]
	.loc	2 164 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:164:53
	ldrh.w	r3, [r1, #170]
	.loc	2 164 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:164:41
	strh.w	r3, [r2, #276]
	.loc	2 165 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:165:53
	ldrh.w	r3, [r1, #172]
	.loc	2 165 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:165:41
	strh.w	r3, [r2, #278]
	.loc	2 166 54 is_stmt 1              @ ../Core/Src/SaveDATA.c:166:54
	ldrh.w	r3, [r1, #174]
	.loc	2 166 42 is_stmt 0              @ ../Core/Src/SaveDATA.c:166:42
	strh.w	r3, [r2, #280]
	.loc	2 167 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:167:53
	ldrh.w	r3, [r1, #176]
	.loc	2 167 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:167:41
	strh.w	r3, [r2, #240]
	.loc	2 168 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:168:53
	ldrh.w	r3, [r1, #178]
	.loc	2 168 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:168:41
	strh.w	r3, [r2, #242]
	.loc	2 169 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:169:53
	ldrh.w	r3, [r1, #180]
	.loc	2 169 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:169:41
	strh.w	r3, [r2, #244]
	.loc	2 170 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:170:53
	ldrh.w	r3, [r1, #182]
	.loc	2 170 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:170:41
	strh.w	r3, [r2, #246]
	.loc	2 171 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:171:53
	ldrh.w	r3, [r1, #184]
	.loc	2 171 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:171:41
	strh.w	r3, [r2, #248]
	.loc	2 172 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:172:53
	ldrh.w	r3, [r1, #186]
	.loc	2 172 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:172:41
	strh.w	r3, [r2, #250]
	.loc	2 173 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:173:53
	ldrh.w	r3, [r1, #188]
	.loc	2 173 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:173:41
	strh.w	r3, [r2, #252]
	.loc	2 174 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:174:53
	ldrh.w	r3, [r1, #190]
	.loc	2 174 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:174:41
	strh.w	r3, [r2, #254]
	.loc	2 175 53 is_stmt 1              @ ../Core/Src/SaveDATA.c:175:53
	ldrh.w	r3, [r1, #192]
	.loc	2 175 41 is_stmt 0              @ ../Core/Src/SaveDATA.c:175:41
	strh.w	r3, [r2, #256]
	.loc	2 176 54 is_stmt 1              @ ../Core/Src/SaveDATA.c:176:54
	ldrh.w	r1, [r1, #194]
	.loc	2 176 42 is_stmt 0              @ ../Core/Src/SaveDATA.c:176:42
	strh.w	r1, [r2, #258]
.Ltmp11:
	.loc	2 178 23 is_stmt 1              @ ../Core/Src/SaveDATA.c:178:23
	vldr	s0, [r0, #808]
	.loc	2 178 44 is_stmt 0              @ ../Core/Src/SaveDATA.c:178:44
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_2
	b	.LBB2_1
.LBB2_1:
	.loc	2 178 63                        @ ../Core/Src/SaveDATA.c:178:63
	movw	r0, :lower16:comVariableBlock
	movt	r0, :upper16:comVariableBlock
	vldr	s0, [r0, #816]
.Ltmp12:
	.loc	2 178 6                         @ ../Core/Src/SaveDATA.c:178:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	blt	.LBB2_3
	b	.LBB2_2
.LBB2_2:
.Ltmp13:
	.loc	2 180 38 is_stmt 1              @ ../Core/Src/SaveDATA.c:180:38
	movw	r1, :lower16:comVariableBlock
	movt	r1, :upper16:comVariableBlock
	movw	r0, #4719
	movt	r0, #47747
	str.w	r0, [r1, #808]
	.loc	2 181 38                        @ ../Core/Src/SaveDATA.c:181:38
	str.w	r0, [r1, #816]
	.loc	2 182 34                        @ ../Core/Src/SaveDATA.c:182:34
	ldrh	r0, [r1, #32]
	orr	r0, r0, #1
	strh	r0, [r1, #32]
	.loc	2 183 3                         @ ../Core/Src/SaveDATA.c:183:3
	b	.LBB2_3
.Ltmp14:
.LBB2_3:
	.loc	2 184 23                        @ ../Core/Src/SaveDATA.c:184:23
	movw	r0, :lower16:comVariableBlock
	movt	r0, :upper16:comVariableBlock
	vldr	s0, [r0, #820]
	vldr	s2, __arm_cp.2_2
	.loc	2 184 45 is_stmt 0              @ ../Core/Src/SaveDATA.c:184:45
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_5
	b	.LBB2_4
.LBB2_4:
	.loc	2 184 64                        @ ../Core/Src/SaveDATA.c:184:64
	movw	r0, :lower16:comVariableBlock
	movt	r0, :upper16:comVariableBlock
	vldr	s0, [r0, #812]
	vldr	s2, __arm_cp.2_2
.Ltmp15:
	.loc	2 184 6                         @ ../Core/Src/SaveDATA.c:184:6
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	ble	.LBB2_6
	b	.LBB2_5
.LBB2_5:
.Ltmp16:
	.loc	2 186 38 is_stmt 1              @ ../Core/Src/SaveDATA.c:186:38
	movw	r1, :lower16:comVariableBlock
	movt	r1, :upper16:comVariableBlock
	movs	r0, #0
	movt	r0, #17530
	str.w	r0, [r1, #808]
	.loc	2 187 38                        @ ../Core/Src/SaveDATA.c:187:38
	str.w	r0, [r1, #812]
	.loc	2 188 34                        @ ../Core/Src/SaveDATA.c:188:34
	ldrh	r0, [r1, #32]
	orr	r0, r0, #1
	strh	r0, [r1, #32]
	.loc	2 189 3                         @ ../Core/Src/SaveDATA.c:189:3
	b	.LBB2_6
.Ltmp17:
.LBB2_6:
	.loc	2 191 29                        @ ../Core/Src/SaveDATA.c:191:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #4]
	vldr	s2, .LCPI2_3
	.loc	2 191 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:191:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_8
	b	.LBB2_7
.LBB2_7:
	.loc	2 191 76                        @ ../Core/Src/SaveDATA.c:191:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #4]
.Ltmp18:
	.loc	2 191 6                         @ ../Core/Src/SaveDATA.c:191:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_9
	b	.LBB2_8
.LBB2_8:
.Ltmp19:
	.loc	2 193 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:193:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #4]
	.loc	2 194 3                         @ ../Core/Src/SaveDATA.c:194:3
	b	.LBB2_9
.Ltmp20:
.LBB2_9:
	.loc	2 195 29                        @ ../Core/Src/SaveDATA.c:195:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #8]
	vldr	s2, .LCPI2_3
	.loc	2 195 49 is_stmt 0              @ ../Core/Src/SaveDATA.c:195:49
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_11
	b	.LBB2_10
.LBB2_10:
	.loc	2 195 75                        @ ../Core/Src/SaveDATA.c:195:75
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #8]
.Ltmp21:
	.loc	2 195 6                         @ ../Core/Src/SaveDATA.c:195:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_12
	b	.LBB2_11
.LBB2_11:
.Ltmp22:
	.loc	2 197 38 is_stmt 1              @ ../Core/Src/SaveDATA.c:197:38
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #8]
	.loc	2 198 3                         @ ../Core/Src/SaveDATA.c:198:3
	b	.LBB2_12
.Ltmp23:
.LBB2_12:
	.loc	2 199 29                        @ ../Core/Src/SaveDATA.c:199:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #12]
	vldr	s2, .LCPI2_3
	.loc	2 199 49 is_stmt 0              @ ../Core/Src/SaveDATA.c:199:49
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_14
	b	.LBB2_13
.LBB2_13:
	.loc	2 199 75                        @ ../Core/Src/SaveDATA.c:199:75
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #12]
.Ltmp24:
	.loc	2 199 6                         @ ../Core/Src/SaveDATA.c:199:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_15
	b	.LBB2_14
.LBB2_14:
.Ltmp25:
	.loc	2 201 38 is_stmt 1              @ ../Core/Src/SaveDATA.c:201:38
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #12]
	.loc	2 202 3                         @ ../Core/Src/SaveDATA.c:202:3
	b	.LBB2_15
.Ltmp26:
.LBB2_15:
	.loc	2 203 29                        @ ../Core/Src/SaveDATA.c:203:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #48]
	vldr	s2, .LCPI2_3
	.loc	2 203 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:203:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_17
	b	.LBB2_16
.LBB2_16:
	.loc	2 203 76                        @ ../Core/Src/SaveDATA.c:203:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #48]
.Ltmp27:
	.loc	2 203 6                         @ ../Core/Src/SaveDATA.c:203:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_18
	b	.LBB2_17
.LBB2_17:
.Ltmp28:
	.loc	2 205 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:205:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #48]
	.loc	2 206 3                         @ ../Core/Src/SaveDATA.c:206:3
	b	.LBB2_18
.Ltmp29:
.LBB2_18:
	.loc	2 207 29                        @ ../Core/Src/SaveDATA.c:207:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #52]
	vldr	s2, .LCPI2_3
	.loc	2 207 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:207:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_20
	b	.LBB2_19
.LBB2_19:
	.loc	2 207 76                        @ ../Core/Src/SaveDATA.c:207:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #52]
.Ltmp30:
	.loc	2 207 6                         @ ../Core/Src/SaveDATA.c:207:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_21
	b	.LBB2_20
.LBB2_20:
.Ltmp31:
	.loc	2 209 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:209:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #52]
	.loc	2 210 3                         @ ../Core/Src/SaveDATA.c:210:3
	b	.LBB2_21
.Ltmp32:
.LBB2_21:
	.loc	2 211 29                        @ ../Core/Src/SaveDATA.c:211:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #56]
	vldr	s2, .LCPI2_3
	.loc	2 211 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:211:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_23
	b	.LBB2_22
.LBB2_22:
	.loc	2 211 76                        @ ../Core/Src/SaveDATA.c:211:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #56]
.Ltmp33:
	.loc	2 211 6                         @ ../Core/Src/SaveDATA.c:211:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_24
	b	.LBB2_23
.LBB2_23:
.Ltmp34:
	.loc	2 213 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:213:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #56]
	.loc	2 214 3                         @ ../Core/Src/SaveDATA.c:214:3
	b	.LBB2_24
.Ltmp35:
.LBB2_24:
	.loc	2 215 29                        @ ../Core/Src/SaveDATA.c:215:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #60]
	vldr	s2, .LCPI2_3
	.loc	2 215 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:215:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_26
	b	.LBB2_25
.LBB2_25:
	.loc	2 215 76                        @ ../Core/Src/SaveDATA.c:215:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #60]
.Ltmp36:
	.loc	2 215 6                         @ ../Core/Src/SaveDATA.c:215:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_27
	b	.LBB2_26
.LBB2_26:
.Ltmp37:
	.loc	2 217 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:217:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #60]
	.loc	2 218 3                         @ ../Core/Src/SaveDATA.c:218:3
	b	.LBB2_27
.Ltmp38:
.LBB2_27:
	.loc	2 219 29                        @ ../Core/Src/SaveDATA.c:219:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #64]
	vldr	s2, .LCPI2_3
	.loc	2 219 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:219:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_29
	b	.LBB2_28
.LBB2_28:
	.loc	2 219 76                        @ ../Core/Src/SaveDATA.c:219:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #64]
.Ltmp39:
	.loc	2 219 6                         @ ../Core/Src/SaveDATA.c:219:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_30
	b	.LBB2_29
.LBB2_29:
.Ltmp40:
	.loc	2 221 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:221:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #64]
	.loc	2 222 3                         @ ../Core/Src/SaveDATA.c:222:3
	b	.LBB2_30
.Ltmp41:
.LBB2_30:
	.loc	2 223 29                        @ ../Core/Src/SaveDATA.c:223:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #68]
	vldr	s2, .LCPI2_3
	.loc	2 223 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:223:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_32
	b	.LBB2_31
.LBB2_31:
	.loc	2 223 76                        @ ../Core/Src/SaveDATA.c:223:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #68]
.Ltmp42:
	.loc	2 223 6                         @ ../Core/Src/SaveDATA.c:223:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_33
	b	.LBB2_32
.LBB2_32:
.Ltmp43:
	.loc	2 225 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:225:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #68]
	.loc	2 226 3                         @ ../Core/Src/SaveDATA.c:226:3
	b	.LBB2_33
.Ltmp44:
.LBB2_33:
	.loc	2 227 29                        @ ../Core/Src/SaveDATA.c:227:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #72]
	vldr	s2, .LCPI2_3
	.loc	2 227 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:227:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_35
	b	.LBB2_34
.LBB2_34:
	.loc	2 227 76                        @ ../Core/Src/SaveDATA.c:227:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #72]
.Ltmp45:
	.loc	2 227 6                         @ ../Core/Src/SaveDATA.c:227:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_36
	b	.LBB2_35
.LBB2_35:
.Ltmp46:
	.loc	2 229 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:229:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #72]
	.loc	2 230 3                         @ ../Core/Src/SaveDATA.c:230:3
	b	.LBB2_36
.Ltmp47:
.LBB2_36:
	.loc	2 231 29                        @ ../Core/Src/SaveDATA.c:231:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #76]
	vldr	s2, .LCPI2_3
	.loc	2 231 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:231:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_38
	b	.LBB2_37
.LBB2_37:
	.loc	2 231 76                        @ ../Core/Src/SaveDATA.c:231:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #76]
.Ltmp48:
	.loc	2 231 6                         @ ../Core/Src/SaveDATA.c:231:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_39
	b	.LBB2_38
.LBB2_38:
.Ltmp49:
	.loc	2 233 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:233:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #76]
	.loc	2 234 3                         @ ../Core/Src/SaveDATA.c:234:3
	b	.LBB2_39
.Ltmp50:
.LBB2_39:
	.loc	2 235 29                        @ ../Core/Src/SaveDATA.c:235:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #80]
	vldr	s2, .LCPI2_3
	.loc	2 235 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:235:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_43
	b	.LBB2_42
	.p2align	2
@ %bb.40:
	.loc	2 0 50                          @ ../Core/Src/SaveDATA.c:0:50
__arm_cp.2_2:
	.long	0x43c80000                      @ float 400
.Lcpi_end0:
	.size	__arm_cp.2_2, .Lcpi_end0-__arm_cp.2_2
	.p2align	2
@ %bb.41:
.LCPI2_3:
	.long	0x447a0000                      @ float 1000
	.p2align	1
.LBB2_42:
	.loc	2 235 76                        @ ../Core/Src/SaveDATA.c:235:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #80]
.Ltmp51:
	.loc	2 235 6                         @ ../Core/Src/SaveDATA.c:235:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_44
	b	.LBB2_43
.LBB2_43:
.Ltmp52:
	.loc	2 237 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:237:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #80]
	.loc	2 238 3                         @ ../Core/Src/SaveDATA.c:238:3
	b	.LBB2_44
.Ltmp53:
.LBB2_44:
	.loc	2 239 29                        @ ../Core/Src/SaveDATA.c:239:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #84]
	vldr	s2, .LCPI2_3
	.loc	2 239 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:239:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_46
	b	.LBB2_45
.LBB2_45:
	.loc	2 239 76                        @ ../Core/Src/SaveDATA.c:239:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #84]
.Ltmp54:
	.loc	2 239 6                         @ ../Core/Src/SaveDATA.c:239:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_47
	b	.LBB2_46
.LBB2_46:
.Ltmp55:
	.loc	2 241 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:241:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #84]
	.loc	2 242 3                         @ ../Core/Src/SaveDATA.c:242:3
	b	.LBB2_47
.Ltmp56:
.LBB2_47:
	.loc	2 243 29                        @ ../Core/Src/SaveDATA.c:243:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #88]
	vldr	s2, .LCPI2_3
	.loc	2 243 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:243:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_49
	b	.LBB2_48
.LBB2_48:
	.loc	2 243 76                        @ ../Core/Src/SaveDATA.c:243:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #88]
.Ltmp57:
	.loc	2 243 6                         @ ../Core/Src/SaveDATA.c:243:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_50
	b	.LBB2_49
.LBB2_49:
.Ltmp58:
	.loc	2 245 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:245:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #88]
	.loc	2 246 3                         @ ../Core/Src/SaveDATA.c:246:3
	b	.LBB2_50
.Ltmp59:
.LBB2_50:
	.loc	2 247 29                        @ ../Core/Src/SaveDATA.c:247:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #92]
	vldr	s2, .LCPI2_3
	.loc	2 247 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:247:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_52
	b	.LBB2_51
.LBB2_51:
	.loc	2 247 76                        @ ../Core/Src/SaveDATA.c:247:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #92]
.Ltmp60:
	.loc	2 247 6                         @ ../Core/Src/SaveDATA.c:247:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_53
	b	.LBB2_52
.LBB2_52:
.Ltmp61:
	.loc	2 249 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:249:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #92]
	.loc	2 250 3                         @ ../Core/Src/SaveDATA.c:250:3
	b	.LBB2_53
.Ltmp62:
.LBB2_53:
	.loc	2 251 29                        @ ../Core/Src/SaveDATA.c:251:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #96]
	vldr	s2, .LCPI2_3
	.loc	2 251 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:251:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_55
	b	.LBB2_54
.LBB2_54:
	.loc	2 251 76                        @ ../Core/Src/SaveDATA.c:251:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #96]
.Ltmp63:
	.loc	2 251 6                         @ ../Core/Src/SaveDATA.c:251:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_56
	b	.LBB2_55
.LBB2_55:
.Ltmp64:
	.loc	2 253 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:253:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #96]
	.loc	2 254 3                         @ ../Core/Src/SaveDATA.c:254:3
	b	.LBB2_56
.Ltmp65:
.LBB2_56:
	.loc	2 255 29                        @ ../Core/Src/SaveDATA.c:255:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #100]
	vldr	s2, .LCPI2_3
	.loc	2 255 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:255:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_58
	b	.LBB2_57
.LBB2_57:
	.loc	2 255 76                        @ ../Core/Src/SaveDATA.c:255:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #100]
.Ltmp66:
	.loc	2 255 6                         @ ../Core/Src/SaveDATA.c:255:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_59
	b	.LBB2_58
.LBB2_58:
.Ltmp67:
	.loc	2 257 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:257:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #100]
	.loc	2 258 3                         @ ../Core/Src/SaveDATA.c:258:3
	b	.LBB2_59
.Ltmp68:
.LBB2_59:
	.loc	2 259 29                        @ ../Core/Src/SaveDATA.c:259:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #104]
	vldr	s2, .LCPI2_3
	.loc	2 259 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:259:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_61
	b	.LBB2_60
.LBB2_60:
	.loc	2 259 76                        @ ../Core/Src/SaveDATA.c:259:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #104]
.Ltmp69:
	.loc	2 259 6                         @ ../Core/Src/SaveDATA.c:259:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_62
	b	.LBB2_61
.LBB2_61:
.Ltmp70:
	.loc	2 261 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:261:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #104]
	.loc	2 262 3                         @ ../Core/Src/SaveDATA.c:262:3
	b	.LBB2_62
.Ltmp71:
.LBB2_62:
	.loc	2 263 29                        @ ../Core/Src/SaveDATA.c:263:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #108]
	vldr	s2, .LCPI2_3
	.loc	2 263 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:263:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_64
	b	.LBB2_63
.LBB2_63:
	.loc	2 263 76                        @ ../Core/Src/SaveDATA.c:263:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #108]
.Ltmp72:
	.loc	2 263 6                         @ ../Core/Src/SaveDATA.c:263:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_65
	b	.LBB2_64
.LBB2_64:
.Ltmp73:
	.loc	2 265 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:265:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str	r0, [r1, #108]
	.loc	2 266 3                         @ ../Core/Src/SaveDATA.c:266:3
	b	.LBB2_65
.Ltmp74:
.LBB2_65:
	.loc	2 267 29                        @ ../Core/Src/SaveDATA.c:267:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #176]
	vldr	s2, .LCPI2_3
	.loc	2 267 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:267:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_67
	b	.LBB2_66
.LBB2_66:
	.loc	2 267 76                        @ ../Core/Src/SaveDATA.c:267:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #176]
.Ltmp75:
	.loc	2 267 6                         @ ../Core/Src/SaveDATA.c:267:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_68
	b	.LBB2_67
.LBB2_67:
.Ltmp76:
	.loc	2 269 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:269:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #176]
	.loc	2 270 3                         @ ../Core/Src/SaveDATA.c:270:3
	b	.LBB2_68
.Ltmp77:
.LBB2_68:
	.loc	2 271 29                        @ ../Core/Src/SaveDATA.c:271:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #180]
	vldr	s2, .LCPI2_3
	.loc	2 271 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:271:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_70
	b	.LBB2_69
.LBB2_69:
	.loc	2 271 76                        @ ../Core/Src/SaveDATA.c:271:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #180]
.Ltmp78:
	.loc	2 271 6                         @ ../Core/Src/SaveDATA.c:271:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_71
	b	.LBB2_70
.LBB2_70:
.Ltmp79:
	.loc	2 273 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:273:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #180]
	.loc	2 274 3                         @ ../Core/Src/SaveDATA.c:274:3
	b	.LBB2_71
.Ltmp80:
.LBB2_71:
	.loc	2 275 29                        @ ../Core/Src/SaveDATA.c:275:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #184]
	vldr	s2, .LCPI2_3
	.loc	2 275 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:275:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_73
	b	.LBB2_72
.LBB2_72:
	.loc	2 275 76                        @ ../Core/Src/SaveDATA.c:275:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #184]
.Ltmp81:
	.loc	2 275 6                         @ ../Core/Src/SaveDATA.c:275:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_74
	b	.LBB2_73
.LBB2_73:
.Ltmp82:
	.loc	2 277 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:277:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #184]
	.loc	2 278 3                         @ ../Core/Src/SaveDATA.c:278:3
	b	.LBB2_74
.Ltmp83:
.LBB2_74:
	.loc	2 279 29                        @ ../Core/Src/SaveDATA.c:279:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #188]
	vldr	s2, .LCPI2_3
	.loc	2 279 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:279:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_76
	b	.LBB2_75
.LBB2_75:
	.loc	2 279 76                        @ ../Core/Src/SaveDATA.c:279:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #188]
.Ltmp84:
	.loc	2 279 6                         @ ../Core/Src/SaveDATA.c:279:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_77
	b	.LBB2_76
.LBB2_76:
.Ltmp85:
	.loc	2 281 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:281:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #188]
	.loc	2 282 3                         @ ../Core/Src/SaveDATA.c:282:3
	b	.LBB2_77
.Ltmp86:
.LBB2_77:
	.loc	2 283 29                        @ ../Core/Src/SaveDATA.c:283:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #192]
	vldr	s2, .LCPI2_1
	.loc	2 283 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:283:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_79
	b	.LBB2_78
.LBB2_78:
	.loc	2 283 76                        @ ../Core/Src/SaveDATA.c:283:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #192]
.Ltmp87:
	.loc	2 283 6                         @ ../Core/Src/SaveDATA.c:283:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_80
	b	.LBB2_79
.LBB2_79:
.Ltmp88:
	.loc	2 285 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:285:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #192]
	.loc	2 286 3                         @ ../Core/Src/SaveDATA.c:286:3
	b	.LBB2_80
.Ltmp89:
.LBB2_80:
	.loc	2 287 30                        @ ../Core/Src/SaveDATA.c:287:30
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #196]
	vldr	s2, .LCPI2_1
	.loc	2 287 51 is_stmt 0              @ ../Core/Src/SaveDATA.c:287:51
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_82
	b	.LBB2_81
.LBB2_81:
	.loc	2 287 77                        @ ../Core/Src/SaveDATA.c:287:77
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #196]
.Ltmp90:
	.loc	2 287 7                         @ ../Core/Src/SaveDATA.c:287:7
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_83
	b	.LBB2_82
.LBB2_82:
.Ltmp91:
	.loc	2 289 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:289:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #196]
	.loc	2 290 3                         @ ../Core/Src/SaveDATA.c:290:3
	b	.LBB2_83
.Ltmp92:
.LBB2_83:
	.loc	2 291 29                        @ ../Core/Src/SaveDATA.c:291:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #200]
	vldr	s2, .LCPI2_1
	.loc	2 291 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:291:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_85
	b	.LBB2_84
.LBB2_84:
	.loc	2 291 76                        @ ../Core/Src/SaveDATA.c:291:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #200]
.Ltmp93:
	.loc	2 291 6                         @ ../Core/Src/SaveDATA.c:291:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_86
	b	.LBB2_85
.LBB2_85:
.Ltmp94:
	.loc	2 293 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:293:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #200]
	.loc	2 294 3                         @ ../Core/Src/SaveDATA.c:294:3
	b	.LBB2_86
.Ltmp95:
.LBB2_86:
	.loc	2 295 29                        @ ../Core/Src/SaveDATA.c:295:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #204]
	vldr	s2, .LCPI2_1
	.loc	2 295 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:295:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_88
	b	.LBB2_87
.LBB2_87:
	.loc	2 295 76                        @ ../Core/Src/SaveDATA.c:295:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #204]
.Ltmp96:
	.loc	2 295 6                         @ ../Core/Src/SaveDATA.c:295:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_89
	b	.LBB2_88
.LBB2_88:
.Ltmp97:
	.loc	2 297 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:297:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #204]
	.loc	2 298 3                         @ ../Core/Src/SaveDATA.c:298:3
	b	.LBB2_89
.Ltmp98:
.LBB2_89:
	.loc	2 299 29                        @ ../Core/Src/SaveDATA.c:299:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #208]
	vldr	s2, .LCPI2_1
	.loc	2 299 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:299:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_91
	b	.LBB2_90
.LBB2_90:
	.loc	2 299 76                        @ ../Core/Src/SaveDATA.c:299:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #208]
.Ltmp99:
	.loc	2 299 6                         @ ../Core/Src/SaveDATA.c:299:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_92
	b	.LBB2_91
.LBB2_91:
.Ltmp100:
	.loc	2 301 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:301:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #208]
	.loc	2 302 3                         @ ../Core/Src/SaveDATA.c:302:3
	b	.LBB2_92
.Ltmp101:
.LBB2_92:
	.loc	2 303 29                        @ ../Core/Src/SaveDATA.c:303:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #212]
	vldr	s2, .LCPI2_1
	.loc	2 303 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:303:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_94
	b	.LBB2_93
.LBB2_93:
	.loc	2 303 76                        @ ../Core/Src/SaveDATA.c:303:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #212]
.Ltmp102:
	.loc	2 303 6                         @ ../Core/Src/SaveDATA.c:303:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_95
	b	.LBB2_94
.LBB2_94:
.Ltmp103:
	.loc	2 305 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:305:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #212]
	.loc	2 306 3                         @ ../Core/Src/SaveDATA.c:306:3
	b	.LBB2_95
.Ltmp104:
.LBB2_95:
	.loc	2 307 29                        @ ../Core/Src/SaveDATA.c:307:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #216]
	vldr	s2, .LCPI2_1
	.loc	2 307 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:307:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_97
	b	.LBB2_96
.LBB2_96:
	.loc	2 307 76                        @ ../Core/Src/SaveDATA.c:307:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #216]
.Ltmp105:
	.loc	2 307 6                         @ ../Core/Src/SaveDATA.c:307:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_98
	b	.LBB2_97
.LBB2_97:
.Ltmp106:
	.loc	2 309 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:309:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #216]
	.loc	2 310 3                         @ ../Core/Src/SaveDATA.c:310:3
	b	.LBB2_98
.Ltmp107:
.LBB2_98:
	.loc	2 312 29                        @ ../Core/Src/SaveDATA.c:312:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #220]
	vldr	s2, .LCPI2_1
	.loc	2 312 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:312:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_100
	b	.LBB2_99
.LBB2_99:
	.loc	2 312 76                        @ ../Core/Src/SaveDATA.c:312:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #220]
.Ltmp108:
	.loc	2 312 6                         @ ../Core/Src/SaveDATA.c:312:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_101
	b	.LBB2_100
.LBB2_100:
.Ltmp109:
	.loc	2 314 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:314:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #220]
	.loc	2 315 3                         @ ../Core/Src/SaveDATA.c:315:3
	b	.LBB2_101
.Ltmp110:
.LBB2_101:
	.loc	2 316 29                        @ ../Core/Src/SaveDATA.c:316:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #224]
	vldr	s2, .LCPI2_1
	.loc	2 316 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:316:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_103
	b	.LBB2_102
.LBB2_102:
	.loc	2 316 76                        @ ../Core/Src/SaveDATA.c:316:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #224]
.Ltmp111:
	.loc	2 316 6                         @ ../Core/Src/SaveDATA.c:316:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_104
	b	.LBB2_103
.LBB2_103:
.Ltmp112:
	.loc	2 318 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:318:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #224]
	.loc	2 319 3                         @ ../Core/Src/SaveDATA.c:319:3
	b	.LBB2_104
.Ltmp113:
.LBB2_104:
	.loc	2 320 29                        @ ../Core/Src/SaveDATA.c:320:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #228]
	vldr	s2, .LCPI2_1
	.loc	2 320 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:320:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_106
	b	.LBB2_105
.LBB2_105:
	.loc	2 320 76                        @ ../Core/Src/SaveDATA.c:320:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #228]
.Ltmp114:
	.loc	2 320 6                         @ ../Core/Src/SaveDATA.c:320:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_107
	b	.LBB2_106
.LBB2_106:
.Ltmp115:
	.loc	2 322 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:322:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #228]
	.loc	2 323 3                         @ ../Core/Src/SaveDATA.c:323:3
	b	.LBB2_107
.Ltmp116:
.LBB2_107:
	.loc	2 324 29                        @ ../Core/Src/SaveDATA.c:324:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #232]
	vldr	s2, .LCPI2_1
	.loc	2 324 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:324:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_109
	b	.LBB2_108
.LBB2_108:
	.loc	2 324 76                        @ ../Core/Src/SaveDATA.c:324:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #232]
.Ltmp117:
	.loc	2 324 6                         @ ../Core/Src/SaveDATA.c:324:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_110
	b	.LBB2_109
.LBB2_109:
.Ltmp118:
	.loc	2 326 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:326:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #232]
	.loc	2 327 3                         @ ../Core/Src/SaveDATA.c:327:3
	b	.LBB2_110
.Ltmp119:
.LBB2_110:
	.loc	2 328 29                        @ ../Core/Src/SaveDATA.c:328:29
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #236]
	vldr	s2, .LCPI2_1
	.loc	2 328 50 is_stmt 0              @ ../Core/Src/SaveDATA.c:328:50
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_112
	b	.LBB2_111
.LBB2_111:
	.loc	2 328 76                        @ ../Core/Src/SaveDATA.c:328:76
	movw	r0, :lower16:USART_Data
	movt	r0, :upper16:USART_Data
	vldr	s0, [r0, #236]
.Ltmp120:
	.loc	2 328 6                         @ ../Core/Src/SaveDATA.c:328:6
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	bge	.LBB2_113
	b	.LBB2_112
.LBB2_112:
.Ltmp121:
	.loc	2 330 39 is_stmt 1              @ ../Core/Src/SaveDATA.c:330:39
	movw	r1, :lower16:USART_Data
	movt	r1, :upper16:USART_Data
	movs	r0, #0
	movt	r0, #16968
	str.w	r0, [r1, #236]
	.loc	2 331 3                         @ ../Core/Src/SaveDATA.c:331:3
	b	.LBB2_113
.Ltmp122:
.LBB2_113:
	.loc	2 334 1                         @ ../Core/Src/SaveDATA.c:334:1
	add	sp, #16
	pop	{r7, pc}
.Ltmp123:
	.p2align	2
@ %bb.114:
	.loc	2 0 1 is_stmt 0                 @ ../Core/Src/SaveDATA.c:0:1
.LCPI2_1:
	.long	0x447a0000                      @ float 1000
.Lfunc_end2:
	.size	ReadData_EX, .Lfunc_end2-ReadData_EX
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.ReadData,"ax",%progbits
	.hidden	ReadData                        @ -- Begin function ReadData
	.globl	ReadData
	.p2align	2
	.type	ReadData,%function
	.code	16                              @ @ReadData
	.thumb_func
ReadData:
.Lfunc_begin3:
	.loc	2 340 0 is_stmt 1               @ ../Core/Src/SaveDATA.c:340:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#24
	sub	sp, #24
	.cfi_def_cfa_offset 32
                                        @ kill: def $r3 killed $r2
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	strh.w	r2, [sp, #14]
.Ltmp124:
	.loc	2 341 23 prologue_end           @ ../Core/Src/SaveDATA.c:341:23
	ldr	r0, [sp, #20]
	.loc	2 341 62 is_stmt 0              @ ../Core/Src/SaveDATA.c:341:62
	ldr	r1, [sp, #16]
	.loc	2 341 71                        @ ../Core/Src/SaveDATA.c:341:71
	ldrh.w	r3, [sp, #14]
	.loc	2 341 2                         @ ../Core/Src/SaveDATA.c:341:2
	mov	r2, sp
	str	r3, [r2, #4]
	str	r1, [r2]
	movs	r1, #161
	movs	r2, #0
	movs	r3, #1
	bl	HAL_I2C_Mem_Read_DMA
	.loc	2 342 1 is_stmt 1               @ ../Core/Src/SaveDATA.c:342:1
	add	sp, #24
	pop	{r7, pc}
.Ltmp125:
.Lfunc_end3:
	.size	ReadData, .Lfunc_end3-ReadData
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.hidden	DATA_block                      @ @DATA_block
	.type	DATA_block,%object
	.section	.bss.DATA_block,"aw",%nobits
	.globl	DATA_block
	.p2align	2, 0x0
DATA_block:
	.zero	196
	.size	DATA_block, 196

	.file	6 "e:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include" "stdint.h"
	.file	7 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h"
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
	.byte	85                              @ DW_AT_ranges
	.byte	23                              @ DW_FORM_sec_offset
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	2                               @ Abbreviation Code
	.byte	52                              @ DW_TAG_variable
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
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
	.byte	11                              @ DW_FORM_data1
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
	.byte	11                              @ DW_FORM_data1
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
	.byte	11                              @ DW_FORM_data1
	.byte	56                              @ DW_AT_data_member_location
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	6                               @ Abbreviation Code
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
	.byte	7                               @ Abbreviation Code
	.byte	4                               @ DW_TAG_enumeration_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	8                               @ Abbreviation Code
	.byte	40                              @ DW_TAG_enumerator
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	28                              @ DW_AT_const_value
	.byte	15                              @ DW_FORM_udata
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	9                               @ Abbreviation Code
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	10                              @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	0                               @ DW_CHILDREN_no
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
	.byte	11                              @ Abbreviation Code
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
	.byte	5                               @ DW_FORM_data2
	.byte	39                              @ DW_AT_prototyped
	.byte	25                              @ DW_FORM_flag_present
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	12                              @ Abbreviation Code
	.byte	5                               @ DW_TAG_formal_parameter
	.byte	0                               @ DW_CHILDREN_no
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	5                               @ DW_FORM_data2
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	13                              @ Abbreviation Code
	.byte	52                              @ DW_TAG_variable
	.byte	0                               @ DW_CHILDREN_no
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	5                               @ DW_FORM_data2
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	14                              @ Abbreviation Code
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
	.byte	15                              @ Abbreviation Code
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
	.byte	16                              @ Abbreviation Code
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
	.byte	17                              @ Abbreviation Code
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
	.byte	18                              @ Abbreviation Code
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
	.byte	19                              @ Abbreviation Code
	.byte	53                              @ DW_TAG_volatile_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	20                              @ Abbreviation Code
	.byte	19                              @ DW_TAG_structure_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	21                              @ Abbreviation Code
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	22                              @ Abbreviation Code
	.byte	21                              @ DW_TAG_subroutine_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	39                              @ DW_AT_prototyped
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	23                              @ Abbreviation Code
	.byte	5                               @ DW_TAG_formal_parameter
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
	.byte	1                               @ Abbrev [1] 0xb:0x8c1 DW_TAG_compile_unit
	.long	.Linfo_string0                  @ DW_AT_producer
	.short	12                              @ DW_AT_language
	.long	.Linfo_string1                  @ DW_AT_name
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.long	.Linfo_string2                  @ DW_AT_comp_dir
	.long	0                               @ DW_AT_low_pc
	.long	.Ldebug_ranges0                 @ DW_AT_ranges
	.byte	2                               @ Abbrev [2] 0x26:0x11 DW_TAG_variable
	.long	.Linfo_string3                  @ DW_AT_name
	.long	55                              @ DW_AT_type
                                        @ DW_AT_external
	.byte	2                               @ DW_AT_decl_file
	.byte	16                              @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	DATA_block
	.byte	3                               @ Abbrev [3] 0x37:0xb DW_TAG_typedef
	.long	66                              @ DW_AT_type
	.long	.Linfo_string65                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	145                             @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x42:0x2c9 DW_TAG_structure_type
	.byte	196                             @ DW_AT_byte_size
	.byte	1                               @ DW_AT_decl_file
	.byte	34                              @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x46:0xc DW_TAG_member
	.long	.Linfo_string4                  @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	79                              @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x52:0xc DW_TAG_member
	.long	.Linfo_string6                  @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	80                              @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x5e:0xc DW_TAG_member
	.long	.Linfo_string7                  @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	81                              @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x6a:0xc DW_TAG_member
	.long	.Linfo_string8                  @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	82                              @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x76:0xc DW_TAG_member
	.long	.Linfo_string9                  @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	83                              @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x82:0xc DW_TAG_member
	.long	.Linfo_string10                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	84                              @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x8e:0xc DW_TAG_member
	.long	.Linfo_string11                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	85                              @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x9a:0xc DW_TAG_member
	.long	.Linfo_string12                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	86                              @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xa6:0xc DW_TAG_member
	.long	.Linfo_string13                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	87                              @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xb2:0xc DW_TAG_member
	.long	.Linfo_string14                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	88                              @ DW_AT_decl_line
	.byte	36                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xbe:0xc DW_TAG_member
	.long	.Linfo_string15                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	89                              @ DW_AT_decl_line
	.byte	40                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xca:0xc DW_TAG_member
	.long	.Linfo_string16                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	90                              @ DW_AT_decl_line
	.byte	44                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xd6:0xc DW_TAG_member
	.long	.Linfo_string17                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	91                              @ DW_AT_decl_line
	.byte	48                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xe2:0xc DW_TAG_member
	.long	.Linfo_string18                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	92                              @ DW_AT_decl_line
	.byte	52                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xee:0xc DW_TAG_member
	.long	.Linfo_string19                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	93                              @ DW_AT_decl_line
	.byte	56                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xfa:0xc DW_TAG_member
	.long	.Linfo_string20                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	94                              @ DW_AT_decl_line
	.byte	60                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x106:0xc DW_TAG_member
	.long	.Linfo_string21                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	95                              @ DW_AT_decl_line
	.byte	64                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x112:0xc DW_TAG_member
	.long	.Linfo_string22                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	96                              @ DW_AT_decl_line
	.byte	68                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x11e:0xc DW_TAG_member
	.long	.Linfo_string23                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	97                              @ DW_AT_decl_line
	.byte	72                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x12a:0xc DW_TAG_member
	.long	.Linfo_string24                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	98                              @ DW_AT_decl_line
	.byte	76                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x136:0xc DW_TAG_member
	.long	.Linfo_string25                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	99                              @ DW_AT_decl_line
	.byte	80                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x142:0xc DW_TAG_member
	.long	.Linfo_string26                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	100                             @ DW_AT_decl_line
	.byte	84                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x14e:0xc DW_TAG_member
	.long	.Linfo_string27                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	101                             @ DW_AT_decl_line
	.byte	88                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x15a:0xc DW_TAG_member
	.long	.Linfo_string28                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	102                             @ DW_AT_decl_line
	.byte	92                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x166:0xc DW_TAG_member
	.long	.Linfo_string29                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	103                             @ DW_AT_decl_line
	.byte	96                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x172:0xc DW_TAG_member
	.long	.Linfo_string30                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	104                             @ DW_AT_decl_line
	.byte	100                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x17e:0xc DW_TAG_member
	.long	.Linfo_string31                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	105                             @ DW_AT_decl_line
	.byte	104                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x18a:0xc DW_TAG_member
	.long	.Linfo_string32                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	106                             @ DW_AT_decl_line
	.byte	108                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x196:0xc DW_TAG_member
	.long	.Linfo_string33                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	107                             @ DW_AT_decl_line
	.byte	112                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1a2:0xc DW_TAG_member
	.long	.Linfo_string34                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	108                             @ DW_AT_decl_line
	.byte	116                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1ae:0xc DW_TAG_member
	.long	.Linfo_string35                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	109                             @ DW_AT_decl_line
	.byte	120                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1ba:0xc DW_TAG_member
	.long	.Linfo_string36                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	110                             @ DW_AT_decl_line
	.byte	124                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1c6:0xc DW_TAG_member
	.long	.Linfo_string37                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	111                             @ DW_AT_decl_line
	.byte	128                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1d2:0xc DW_TAG_member
	.long	.Linfo_string38                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	112                             @ DW_AT_decl_line
	.byte	132                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1de:0xc DW_TAG_member
	.long	.Linfo_string39                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	113                             @ DW_AT_decl_line
	.byte	136                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1ea:0xc DW_TAG_member
	.long	.Linfo_string40                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	115                             @ DW_AT_decl_line
	.byte	140                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1f6:0xc DW_TAG_member
	.long	.Linfo_string41                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	116                             @ DW_AT_decl_line
	.byte	144                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x202:0xc DW_TAG_member
	.long	.Linfo_string42                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	117                             @ DW_AT_decl_line
	.byte	148                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x20e:0xc DW_TAG_member
	.long	.Linfo_string43                 @ DW_AT_name
	.long	779                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	118                             @ DW_AT_decl_line
	.byte	152                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x21a:0xc DW_TAG_member
	.long	.Linfo_string44                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	125                             @ DW_AT_decl_line
	.byte	156                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x226:0xc DW_TAG_member
	.long	.Linfo_string46                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	126                             @ DW_AT_decl_line
	.byte	158                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x232:0xc DW_TAG_member
	.long	.Linfo_string47                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	127                             @ DW_AT_decl_line
	.byte	160                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x23e:0xc DW_TAG_member
	.long	.Linfo_string48                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	128                             @ DW_AT_decl_line
	.byte	162                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x24a:0xc DW_TAG_member
	.long	.Linfo_string49                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	129                             @ DW_AT_decl_line
	.byte	164                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x256:0xc DW_TAG_member
	.long	.Linfo_string50                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	130                             @ DW_AT_decl_line
	.byte	166                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x262:0xc DW_TAG_member
	.long	.Linfo_string51                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	131                             @ DW_AT_decl_line
	.byte	168                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x26e:0xc DW_TAG_member
	.long	.Linfo_string52                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	132                             @ DW_AT_decl_line
	.byte	170                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x27a:0xc DW_TAG_member
	.long	.Linfo_string53                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	133                             @ DW_AT_decl_line
	.byte	172                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x286:0xc DW_TAG_member
	.long	.Linfo_string54                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	134                             @ DW_AT_decl_line
	.byte	174                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x292:0xc DW_TAG_member
	.long	.Linfo_string55                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	135                             @ DW_AT_decl_line
	.byte	176                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x29e:0xc DW_TAG_member
	.long	.Linfo_string56                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	136                             @ DW_AT_decl_line
	.byte	178                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2aa:0xc DW_TAG_member
	.long	.Linfo_string57                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	137                             @ DW_AT_decl_line
	.byte	180                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2b6:0xc DW_TAG_member
	.long	.Linfo_string58                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	138                             @ DW_AT_decl_line
	.byte	182                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2c2:0xc DW_TAG_member
	.long	.Linfo_string59                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	139                             @ DW_AT_decl_line
	.byte	184                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2ce:0xc DW_TAG_member
	.long	.Linfo_string60                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	140                             @ DW_AT_decl_line
	.byte	186                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2da:0xc DW_TAG_member
	.long	.Linfo_string61                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	141                             @ DW_AT_decl_line
	.byte	188                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2e6:0xc DW_TAG_member
	.long	.Linfo_string62                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	142                             @ DW_AT_decl_line
	.byte	190                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2f2:0xc DW_TAG_member
	.long	.Linfo_string63                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	143                             @ DW_AT_decl_line
	.byte	192                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2fe:0xc DW_TAG_member
	.long	.Linfo_string64                 @ DW_AT_name
	.long	786                             @ DW_AT_type
	.byte	1                               @ DW_AT_decl_file
	.byte	144                             @ DW_AT_decl_line
	.byte	194                             @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0x30b:0x7 DW_TAG_base_type
	.long	.Linfo_string5                  @ DW_AT_name
	.byte	4                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	6                               @ Abbrev [6] 0x312:0x7 DW_TAG_base_type
	.long	.Linfo_string45                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	2                               @ DW_AT_byte_size
	.byte	7                               @ Abbrev [7] 0x319:0x15 DW_TAG_enumeration_type
	.long	814                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.byte	49                              @ DW_AT_decl_line
	.byte	8                               @ Abbrev [8] 0x321:0x6 DW_TAG_enumerator
	.long	.Linfo_string67                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x327:0x6 DW_TAG_enumerator
	.long	.Linfo_string68                 @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0x32e:0x7 DW_TAG_base_type
	.long	.Linfo_string66                 @ DW_AT_name
	.byte	8                               @ DW_AT_encoding
	.byte	1                               @ DW_AT_byte_size
	.byte	7                               @ Abbrev [7] 0x335:0x2d DW_TAG_enumeration_type
	.long	814                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	4                               @ DW_AT_decl_file
	.byte	102                             @ DW_AT_decl_line
	.byte	8                               @ Abbrev [8] 0x33d:0x6 DW_TAG_enumerator
	.long	.Linfo_string69                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x343:0x6 DW_TAG_enumerator
	.long	.Linfo_string70                 @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x349:0x6 DW_TAG_enumerator
	.long	.Linfo_string71                 @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x34f:0x6 DW_TAG_enumerator
	.long	.Linfo_string72                 @ DW_AT_name
	.byte	3                               @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x355:0x6 DW_TAG_enumerator
	.long	.Linfo_string73                 @ DW_AT_name
	.byte	4                               @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x35b:0x6 DW_TAG_enumerator
	.long	.Linfo_string74                 @ DW_AT_name
	.byte	5                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	7                               @ Abbrev [7] 0x362:0x4d DW_TAG_enumeration_type
	.long	814                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	5                               @ DW_AT_decl_file
	.byte	106                             @ DW_AT_decl_line
	.byte	8                               @ Abbrev [8] 0x36a:0x6 DW_TAG_enumerator
	.long	.Linfo_string75                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x370:0x6 DW_TAG_enumerator
	.long	.Linfo_string76                 @ DW_AT_name
	.byte	32                              @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x376:0x6 DW_TAG_enumerator
	.long	.Linfo_string77                 @ DW_AT_name
	.byte	36                              @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x37c:0x6 DW_TAG_enumerator
	.long	.Linfo_string78                 @ DW_AT_name
	.byte	33                              @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x382:0x6 DW_TAG_enumerator
	.long	.Linfo_string79                 @ DW_AT_name
	.byte	34                              @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x388:0x6 DW_TAG_enumerator
	.long	.Linfo_string80                 @ DW_AT_name
	.byte	40                              @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x38e:0x6 DW_TAG_enumerator
	.long	.Linfo_string81                 @ DW_AT_name
	.byte	41                              @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x394:0x6 DW_TAG_enumerator
	.long	.Linfo_string82                 @ DW_AT_name
	.byte	42                              @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x39a:0x6 DW_TAG_enumerator
	.long	.Linfo_string83                 @ DW_AT_name
	.byte	96                              @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x3a0:0x7 DW_TAG_enumerator
	.long	.Linfo_string84                 @ DW_AT_name
	.ascii	"\240\001"                      @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x3a7:0x7 DW_TAG_enumerator
	.long	.Linfo_string85                 @ DW_AT_name
	.ascii	"\340\001"                      @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	7                               @ Abbrev [7] 0x3af:0x21 DW_TAG_enumeration_type
	.long	814                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	5                               @ DW_AT_decl_file
	.byte	146                             @ DW_AT_decl_line
	.byte	8                               @ Abbrev [8] 0x3b7:0x6 DW_TAG_enumerator
	.long	.Linfo_string86                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x3bd:0x6 DW_TAG_enumerator
	.long	.Linfo_string87                 @ DW_AT_name
	.byte	16                              @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x3c3:0x6 DW_TAG_enumerator
	.long	.Linfo_string88                 @ DW_AT_name
	.byte	32                              @ DW_AT_const_value
	.byte	8                               @ Abbrev [8] 0x3c9:0x6 DW_TAG_enumerator
	.long	.Linfo_string89                 @ DW_AT_name
	.byte	64                              @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0x3d0:0x5 DW_TAG_pointer_type
	.long	814                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0x3d5:0x11 DW_TAG_subprogram
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string90                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	19                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	11                              @ Abbrev [11] 0x3e6:0x5e DW_TAG_subprogram
	.long	.Lfunc_begin1                   @ DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string91                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	345                             @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	12                              @ Abbrev [12] 0x3f8:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	20
	.long	.Linfo_string94                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	345                             @ DW_AT_decl_line
	.long	1188                            @ DW_AT_type
	.byte	12                              @ Abbrev [12] 0x407:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	16
	.long	.Linfo_string170                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	345                             @ DW_AT_decl_line
	.long	976                             @ DW_AT_type
	.byte	12                              @ Abbrev [12] 0x416:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	14
	.long	.Linfo_string171                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	345                             @ DW_AT_decl_line
	.long	786                             @ DW_AT_type
	.byte	13                              @ Abbrev [13] 0x425:0xf DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	13
	.long	.Linfo_string172                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	348                             @ DW_AT_decl_line
	.long	814                             @ DW_AT_type
	.byte	13                              @ Abbrev [13] 0x434:0xf DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	12
	.long	.Linfo_string173                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	349                             @ DW_AT_decl_line
	.long	814                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	14                              @ Abbrev [14] 0x444:0x20 DW_TAG_subprogram
	.long	.Lfunc_begin2                   @ DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string92                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	102                             @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	15                              @ Abbrev [15] 0x455:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	12
	.long	.Linfo_string174                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	105                             @ DW_AT_decl_line
	.long	976                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x464:0x40 DW_TAG_subprogram
	.long	.Lfunc_begin3                   @ DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string93                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	339                             @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	12                              @ Abbrev [12] 0x476:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	20
	.long	.Linfo_string94                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	339                             @ DW_AT_decl_line
	.long	1188                            @ DW_AT_type
	.byte	12                              @ Abbrev [12] 0x485:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	16
	.long	.Linfo_string170                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	339                             @ DW_AT_decl_line
	.long	976                             @ DW_AT_type
	.byte	12                              @ Abbrev [12] 0x494:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	14
	.long	.Linfo_string171                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	339                             @ DW_AT_decl_line
	.long	786                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0x4a4:0x5 DW_TAG_pointer_type
	.long	1193                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x4a9:0xb DW_TAG_typedef
	.long	1204                            @ DW_AT_type
	.long	.Linfo_string169                @ DW_AT_name
	.byte	5                               @ DW_AT_decl_file
	.byte	243                             @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x4b4:0xd1 DW_TAG_structure_type
	.byte	84                              @ DW_AT_byte_size
	.byte	5                               @ DW_AT_decl_file
	.byte	187                             @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x4b8:0xc DW_TAG_member
	.long	.Linfo_string95                 @ DW_AT_name
	.long	1413                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	190                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x4c4:0xc DW_TAG_member
	.long	.Linfo_string108                @ DW_AT_name
	.long	1576                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	192                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x4d0:0xc DW_TAG_member
	.long	.Linfo_string118                @ DW_AT_name
	.long	1688                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	194                             @ DW_AT_decl_line
	.byte	36                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x4dc:0xc DW_TAG_member
	.long	.Linfo_string120                @ DW_AT_name
	.long	1704                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	196                             @ DW_AT_decl_line
	.byte	40                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x4e8:0xc DW_TAG_member
	.long	.Linfo_string122                @ DW_AT_name
	.long	1715                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	198                             @ DW_AT_decl_line
	.byte	42                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x4f4:0xc DW_TAG_member
	.long	.Linfo_string123                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	200                             @ DW_AT_decl_line
	.byte	44                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x500:0xc DW_TAG_member
	.long	.Linfo_string124                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	202                             @ DW_AT_decl_line
	.byte	48                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x50c:0xc DW_TAG_member
	.long	.Linfo_string125                @ DW_AT_name
	.long	1720                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	205                             @ DW_AT_decl_line
	.byte	52                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x518:0xc DW_TAG_member
	.long	.Linfo_string162                @ DW_AT_name
	.long	1720                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	207                             @ DW_AT_decl_line
	.byte	56                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x524:0xc DW_TAG_member
	.long	.Linfo_string146                @ DW_AT_name
	.long	2174                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	209                             @ DW_AT_decl_line
	.byte	60                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x530:0xc DW_TAG_member
	.long	.Linfo_string148                @ DW_AT_name
	.long	2219                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	211                             @ DW_AT_decl_line
	.byte	61                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x53c:0xc DW_TAG_member
	.long	.Linfo_string139                @ DW_AT_name
	.long	2235                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	213                             @ DW_AT_decl_line
	.byte	62                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x548:0xc DW_TAG_member
	.long	.Linfo_string157                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	215                             @ DW_AT_decl_line
	.byte	64                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x554:0xc DW_TAG_member
	.long	.Linfo_string165                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	217                             @ DW_AT_decl_line
	.byte	68                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x560:0xc DW_TAG_member
	.long	.Linfo_string166                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	219                             @ DW_AT_decl_line
	.byte	72                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x56c:0xc DW_TAG_member
	.long	.Linfo_string167                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	221                             @ DW_AT_decl_line
	.byte	76                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x578:0xc DW_TAG_member
	.long	.Linfo_string168                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	223                             @ DW_AT_decl_line
	.byte	80                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0x585:0x5 DW_TAG_pointer_type
	.long	1418                            @ DW_AT_type
	.byte	16                              @ Abbrev [16] 0x58a:0xc DW_TAG_typedef
	.long	1430                            @ DW_AT_type
	.long	.Linfo_string107                @ DW_AT_name
	.byte	7                               @ DW_AT_decl_file
	.short	567                             @ DW_AT_decl_line
	.byte	17                              @ Abbrev [17] 0x596:0x7b DW_TAG_structure_type
	.byte	36                              @ DW_AT_byte_size
	.byte	7                               @ DW_AT_decl_file
	.short	556                             @ DW_AT_decl_line
	.byte	18                              @ Abbrev [18] 0x59b:0xd DW_TAG_member
	.long	.Linfo_string96                 @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	558                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x5a8:0xd DW_TAG_member
	.long	.Linfo_string99                 @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	559                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x5b5:0xd DW_TAG_member
	.long	.Linfo_string100                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	560                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x5c2:0xd DW_TAG_member
	.long	.Linfo_string101                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	561                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x5cf:0xd DW_TAG_member
	.long	.Linfo_string102                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	562                             @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x5dc:0xd DW_TAG_member
	.long	.Linfo_string103                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	563                             @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x5e9:0xd DW_TAG_member
	.long	.Linfo_string104                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	564                             @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x5f6:0xd DW_TAG_member
	.long	.Linfo_string105                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	565                             @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x603:0xd DW_TAG_member
	.long	.Linfo_string106                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	566                             @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	19                              @ Abbrev [19] 0x611:0x5 DW_TAG_volatile_type
	.long	1558                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x616:0xb DW_TAG_typedef
	.long	1569                            @ DW_AT_type
	.long	.Linfo_string98                 @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	64                              @ DW_AT_decl_line
	.byte	6                               @ Abbrev [6] 0x621:0x7 DW_TAG_base_type
	.long	.Linfo_string97                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	3                               @ Abbrev [3] 0x628:0xb DW_TAG_typedef
	.long	1587                            @ DW_AT_type
	.long	.Linfo_string117                @ DW_AT_name
	.byte	5                               @ DW_AT_decl_file
	.byte	73                              @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x633:0x65 DW_TAG_structure_type
	.byte	32                              @ DW_AT_byte_size
	.byte	5                               @ DW_AT_decl_file
	.byte	47                              @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x637:0xc DW_TAG_member
	.long	.Linfo_string109                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	49                              @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x643:0xc DW_TAG_member
	.long	.Linfo_string110                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	52                              @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x64f:0xc DW_TAG_member
	.long	.Linfo_string111                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	55                              @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x65b:0xc DW_TAG_member
	.long	.Linfo_string112                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	58                              @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x667:0xc DW_TAG_member
	.long	.Linfo_string113                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	61                              @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x673:0xc DW_TAG_member
	.long	.Linfo_string114                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	64                              @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x67f:0xc DW_TAG_member
	.long	.Linfo_string115                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	67                              @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x68b:0xc DW_TAG_member
	.long	.Linfo_string116                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	70                              @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0x698:0x5 DW_TAG_pointer_type
	.long	1693                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x69d:0xb DW_TAG_typedef
	.long	814                             @ DW_AT_type
	.long	.Linfo_string119                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	62                              @ DW_AT_decl_line
	.byte	3                               @ Abbrev [3] 0x6a8:0xb DW_TAG_typedef
	.long	786                             @ DW_AT_type
	.long	.Linfo_string121                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	63                              @ DW_AT_decl_line
	.byte	19                              @ Abbrev [19] 0x6b3:0x5 DW_TAG_volatile_type
	.long	1704                            @ DW_AT_type
	.byte	9                               @ Abbrev [9] 0x6b8:0x5 DW_TAG_pointer_type
	.long	1725                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x6bd:0xb DW_TAG_typedef
	.long	1736                            @ DW_AT_type
	.long	.Linfo_string161                @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	168                             @ DW_AT_decl_line
	.byte	20                              @ Abbrev [20] 0x6c8:0xb1 DW_TAG_structure_type
	.long	.Linfo_string160                @ DW_AT_name
	.byte	96                              @ DW_AT_byte_size
	.byte	4                               @ DW_AT_decl_file
	.byte	138                             @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x6d0:0xc DW_TAG_member
	.long	.Linfo_string95                 @ DW_AT_name
	.long	1913                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	140                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x6dc:0xc DW_TAG_member
	.long	.Linfo_string108                @ DW_AT_name
	.long	2014                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	142                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x6e8:0xc DW_TAG_member
	.long	.Linfo_string146                @ DW_AT_name
	.long	2174                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	144                             @ DW_AT_decl_line
	.byte	52                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x6f4:0xc DW_TAG_member
	.long	.Linfo_string148                @ DW_AT_name
	.long	2185                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	146                             @ DW_AT_decl_line
	.byte	53                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x700:0xc DW_TAG_member
	.long	.Linfo_string150                @ DW_AT_name
	.long	2201                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	148                             @ DW_AT_decl_line
	.byte	56                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x70c:0xc DW_TAG_member
	.long	.Linfo_string151                @ DW_AT_name
	.long	2202                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	150                             @ DW_AT_decl_line
	.byte	60                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x718:0xc DW_TAG_member
	.long	.Linfo_string152                @ DW_AT_name
	.long	2202                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	152                             @ DW_AT_decl_line
	.byte	64                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x724:0xc DW_TAG_member
	.long	.Linfo_string153                @ DW_AT_name
	.long	2202                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	154                             @ DW_AT_decl_line
	.byte	68                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x730:0xc DW_TAG_member
	.long	.Linfo_string154                @ DW_AT_name
	.long	2202                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	156                             @ DW_AT_decl_line
	.byte	72                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x73c:0xc DW_TAG_member
	.long	.Linfo_string155                @ DW_AT_name
	.long	2202                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	158                             @ DW_AT_decl_line
	.byte	76                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x748:0xc DW_TAG_member
	.long	.Linfo_string156                @ DW_AT_name
	.long	2202                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	160                             @ DW_AT_decl_line
	.byte	80                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x754:0xc DW_TAG_member
	.long	.Linfo_string157                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	162                             @ DW_AT_decl_line
	.byte	84                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x760:0xc DW_TAG_member
	.long	.Linfo_string158                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	164                             @ DW_AT_decl_line
	.byte	88                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x76c:0xc DW_TAG_member
	.long	.Linfo_string159                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	166                             @ DW_AT_decl_line
	.byte	92                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0x779:0x5 DW_TAG_pointer_type
	.long	1918                            @ DW_AT_type
	.byte	16                              @ Abbrev [16] 0x77e:0xc DW_TAG_typedef
	.long	1930                            @ DW_AT_type
	.long	.Linfo_string132                @ DW_AT_name
	.byte	7                               @ DW_AT_decl_file
	.short	353                             @ DW_AT_decl_line
	.byte	17                              @ Abbrev [17] 0x78a:0x54 DW_TAG_structure_type
	.byte	24                              @ DW_AT_byte_size
	.byte	7                               @ DW_AT_decl_file
	.short	345                             @ DW_AT_decl_line
	.byte	18                              @ Abbrev [18] 0x78f:0xd DW_TAG_member
	.long	.Linfo_string126                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	347                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x79c:0xd DW_TAG_member
	.long	.Linfo_string127                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	348                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x7a9:0xd DW_TAG_member
	.long	.Linfo_string128                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	349                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x7b6:0xd DW_TAG_member
	.long	.Linfo_string129                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	350                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x7c3:0xd DW_TAG_member
	.long	.Linfo_string130                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	351                             @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	18                              @ Abbrev [18] 0x7d0:0xd DW_TAG_member
	.long	.Linfo_string131                @ DW_AT_name
	.long	1553                            @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.short	352                             @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	3                               @ Abbrev [3] 0x7de:0xb DW_TAG_typedef
	.long	2025                            @ DW_AT_type
	.long	.Linfo_string145                @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	96                              @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x7e9:0x95 DW_TAG_structure_type
	.byte	48                              @ DW_AT_byte_size
	.byte	4                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x7ed:0xc DW_TAG_member
	.long	.Linfo_string133                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	50                              @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x7f9:0xc DW_TAG_member
	.long	.Linfo_string134                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	53                              @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x805:0xc DW_TAG_member
	.long	.Linfo_string135                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	57                              @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x811:0xc DW_TAG_member
	.long	.Linfo_string136                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	60                              @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x81d:0xc DW_TAG_member
	.long	.Linfo_string137                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	63                              @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x829:0xc DW_TAG_member
	.long	.Linfo_string138                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	66                              @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x835:0xc DW_TAG_member
	.long	.Linfo_string139                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	69                              @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x841:0xc DW_TAG_member
	.long	.Linfo_string140                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	74                              @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x84d:0xc DW_TAG_member
	.long	.Linfo_string141                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	77                              @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x859:0xc DW_TAG_member
	.long	.Linfo_string142                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	82                              @ DW_AT_decl_line
	.byte	36                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x865:0xc DW_TAG_member
	.long	.Linfo_string143                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	85                              @ DW_AT_decl_line
	.byte	40                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x871:0xc DW_TAG_member
	.long	.Linfo_string144                @ DW_AT_name
	.long	1558                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	91                              @ DW_AT_decl_line
	.byte	44                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	3                               @ Abbrev [3] 0x87e:0xb DW_TAG_typedef
	.long	793                             @ DW_AT_type
	.long	.Linfo_string147                @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	53                              @ DW_AT_decl_line
	.byte	19                              @ Abbrev [19] 0x889:0x5 DW_TAG_volatile_type
	.long	2190                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x88e:0xb DW_TAG_typedef
	.long	821                             @ DW_AT_type
	.long	.Linfo_string149                @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	110                             @ DW_AT_decl_line
	.byte	21                              @ Abbrev [21] 0x899:0x1 DW_TAG_pointer_type
	.byte	9                               @ Abbrev [9] 0x89a:0x5 DW_TAG_pointer_type
	.long	2207                            @ DW_AT_type
	.byte	22                              @ Abbrev [22] 0x89f:0x7 DW_TAG_subroutine_type
                                        @ DW_AT_prototyped
	.byte	23                              @ Abbrev [23] 0x8a0:0x5 DW_TAG_formal_parameter
	.long	2214                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0x8a6:0x5 DW_TAG_pointer_type
	.long	1736                            @ DW_AT_type
	.byte	19                              @ Abbrev [19] 0x8ab:0x5 DW_TAG_volatile_type
	.long	2224                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x8b0:0xb DW_TAG_typedef
	.long	866                             @ DW_AT_type
	.long	.Linfo_string163                @ DW_AT_name
	.byte	5                               @ DW_AT_decl_file
	.byte	122                             @ DW_AT_decl_line
	.byte	19                              @ Abbrev [19] 0x8bb:0x5 DW_TAG_volatile_type
	.long	2240                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x8c0:0xb DW_TAG_typedef
	.long	943                             @ DW_AT_type
	.long	.Linfo_string164                @ DW_AT_name
	.byte	5                               @ DW_AT_decl_file
	.byte	153                             @ DW_AT_decl_line
	.byte	0                               @ End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.long	.Lfunc_begin0
	.long	.Lfunc_end0
	.long	.Lfunc_begin1
	.long	.Lfunc_end1
	.long	.Lfunc_begin2
	.long	.Lfunc_end2
	.long	.Lfunc_begin3
	.long	.Lfunc_end3
	.long	0
	.long	0
	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"Component: Arm Compiler for Embedded 6.19 Tool: armclang [5e73cb00]" @ string offset=0
.Linfo_string1:
	.asciz	"../Core/Src\\SaveDATA.c"       @ string offset=68
.Linfo_string2:
	.asciz	"C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" @ string offset=91
.Linfo_string3:
	.asciz	"DATA_block"                    @ string offset=161
.Linfo_string4:
	.asciz	"F32_1"                         @ string offset=172
.Linfo_string5:
	.asciz	"float"                         @ string offset=178
.Linfo_string6:
	.asciz	"F32_2"                         @ string offset=184
.Linfo_string7:
	.asciz	"F32_3"                         @ string offset=190
.Linfo_string8:
	.asciz	"F32_4"                         @ string offset=196
.Linfo_string9:
	.asciz	"F32_5"                         @ string offset=202
.Linfo_string10:
	.asciz	"F32_6"                         @ string offset=208
.Linfo_string11:
	.asciz	"F32_7"                         @ string offset=214
.Linfo_string12:
	.asciz	"F32_8"                         @ string offset=220
.Linfo_string13:
	.asciz	"F32_9"                         @ string offset=226
.Linfo_string14:
	.asciz	"F32_10"                        @ string offset=232
.Linfo_string15:
	.asciz	"F32_11"                        @ string offset=239
.Linfo_string16:
	.asciz	"F32_12"                        @ string offset=246
.Linfo_string17:
	.asciz	"F32_13"                        @ string offset=253
.Linfo_string18:
	.asciz	"F32_14"                        @ string offset=260
.Linfo_string19:
	.asciz	"F32_15"                        @ string offset=267
.Linfo_string20:
	.asciz	"F32_16"                        @ string offset=274
.Linfo_string21:
	.asciz	"F32_17"                        @ string offset=281
.Linfo_string22:
	.asciz	"F32_18"                        @ string offset=288
.Linfo_string23:
	.asciz	"F32_19"                        @ string offset=295
.Linfo_string24:
	.asciz	"F32_20"                        @ string offset=302
.Linfo_string25:
	.asciz	"F32_21"                        @ string offset=309
.Linfo_string26:
	.asciz	"F32_22"                        @ string offset=316
.Linfo_string27:
	.asciz	"F32_23"                        @ string offset=323
.Linfo_string28:
	.asciz	"F32_24"                        @ string offset=330
.Linfo_string29:
	.asciz	"F32_25"                        @ string offset=337
.Linfo_string30:
	.asciz	"F32_26"                        @ string offset=344
.Linfo_string31:
	.asciz	"F32_27"                        @ string offset=351
.Linfo_string32:
	.asciz	"F32_28"                        @ string offset=358
.Linfo_string33:
	.asciz	"F32_29"                        @ string offset=365
.Linfo_string34:
	.asciz	"F32_30"                        @ string offset=372
.Linfo_string35:
	.asciz	"F32_31"                        @ string offset=379
.Linfo_string36:
	.asciz	"F32_32"                        @ string offset=386
.Linfo_string37:
	.asciz	"F32_33"                        @ string offset=393
.Linfo_string38:
	.asciz	"F32_34"                        @ string offset=400
.Linfo_string39:
	.asciz	"F32_35"                        @ string offset=407
.Linfo_string40:
	.asciz	"F32_36"                        @ string offset=414
.Linfo_string41:
	.asciz	"F32_37"                        @ string offset=421
.Linfo_string42:
	.asciz	"F32_38"                        @ string offset=428
.Linfo_string43:
	.asciz	"F32_40"                        @ string offset=435
.Linfo_string44:
	.asciz	"U16_1"                         @ string offset=442
.Linfo_string45:
	.asciz	"unsigned short"                @ string offset=448
.Linfo_string46:
	.asciz	"U16_2"                         @ string offset=463
.Linfo_string47:
	.asciz	"U16_3"                         @ string offset=469
.Linfo_string48:
	.asciz	"U16_4"                         @ string offset=475
.Linfo_string49:
	.asciz	"U16_5"                         @ string offset=481
.Linfo_string50:
	.asciz	"U16_6"                         @ string offset=487
.Linfo_string51:
	.asciz	"U16_7"                         @ string offset=493
.Linfo_string52:
	.asciz	"U16_8"                         @ string offset=499
.Linfo_string53:
	.asciz	"U16_9"                         @ string offset=505
.Linfo_string54:
	.asciz	"U16_10"                        @ string offset=511
.Linfo_string55:
	.asciz	"U16_11"                        @ string offset=518
.Linfo_string56:
	.asciz	"U16_12"                        @ string offset=525
.Linfo_string57:
	.asciz	"U16_13"                        @ string offset=532
.Linfo_string58:
	.asciz	"U16_14"                        @ string offset=539
.Linfo_string59:
	.asciz	"U16_15"                        @ string offset=546
.Linfo_string60:
	.asciz	"U16_16"                        @ string offset=553
.Linfo_string61:
	.asciz	"U16_17"                        @ string offset=560
.Linfo_string62:
	.asciz	"U16_18"                        @ string offset=567
.Linfo_string63:
	.asciz	"U16_19"                        @ string offset=574
.Linfo_string64:
	.asciz	"U16_20"                        @ string offset=581
.Linfo_string65:
	.asciz	"DATA_blockType"                @ string offset=588
.Linfo_string66:
	.asciz	"unsigned char"                 @ string offset=603
.Linfo_string67:
	.asciz	"HAL_UNLOCKED"                  @ string offset=617
.Linfo_string68:
	.asciz	"HAL_LOCKED"                    @ string offset=630
.Linfo_string69:
	.asciz	"HAL_DMA_STATE_RESET"           @ string offset=641
.Linfo_string70:
	.asciz	"HAL_DMA_STATE_READY"           @ string offset=661
.Linfo_string71:
	.asciz	"HAL_DMA_STATE_BUSY"            @ string offset=681
.Linfo_string72:
	.asciz	"HAL_DMA_STATE_TIMEOUT"         @ string offset=700
.Linfo_string73:
	.asciz	"HAL_DMA_STATE_ERROR"           @ string offset=722
.Linfo_string74:
	.asciz	"HAL_DMA_STATE_ABORT"           @ string offset=742
.Linfo_string75:
	.asciz	"HAL_I2C_STATE_RESET"           @ string offset=762
.Linfo_string76:
	.asciz	"HAL_I2C_STATE_READY"           @ string offset=782
.Linfo_string77:
	.asciz	"HAL_I2C_STATE_BUSY"            @ string offset=802
.Linfo_string78:
	.asciz	"HAL_I2C_STATE_BUSY_TX"         @ string offset=821
.Linfo_string79:
	.asciz	"HAL_I2C_STATE_BUSY_RX"         @ string offset=843
.Linfo_string80:
	.asciz	"HAL_I2C_STATE_LISTEN"          @ string offset=865
.Linfo_string81:
	.asciz	"HAL_I2C_STATE_BUSY_TX_LISTEN"  @ string offset=886
.Linfo_string82:
	.asciz	"HAL_I2C_STATE_BUSY_RX_LISTEN"  @ string offset=915
.Linfo_string83:
	.asciz	"HAL_I2C_STATE_ABORT"           @ string offset=944
.Linfo_string84:
	.asciz	"HAL_I2C_STATE_TIMEOUT"         @ string offset=964
.Linfo_string85:
	.asciz	"HAL_I2C_STATE_ERROR"           @ string offset=986
.Linfo_string86:
	.asciz	"HAL_I2C_MODE_NONE"             @ string offset=1006
.Linfo_string87:
	.asciz	"HAL_I2C_MODE_MASTER"           @ string offset=1024
.Linfo_string88:
	.asciz	"HAL_I2C_MODE_SLAVE"            @ string offset=1044
.Linfo_string89:
	.asciz	"HAL_I2C_MODE_MEM"              @ string offset=1063
.Linfo_string90:
	.asciz	"SaveData_EX"                   @ string offset=1080
.Linfo_string91:
	.asciz	"WriteData"                     @ string offset=1092
.Linfo_string92:
	.asciz	"ReadData_EX"                   @ string offset=1102
.Linfo_string93:
	.asciz	"ReadData"                      @ string offset=1114
.Linfo_string94:
	.asciz	"i2cHandle"                     @ string offset=1123
.Linfo_string95:
	.asciz	"Instance"                      @ string offset=1133
.Linfo_string96:
	.asciz	"CR1"                           @ string offset=1142
.Linfo_string97:
	.asciz	"unsigned int"                  @ string offset=1146
.Linfo_string98:
	.asciz	"uint32_t"                      @ string offset=1159
.Linfo_string99:
	.asciz	"CR2"                           @ string offset=1168
.Linfo_string100:
	.asciz	"OAR1"                          @ string offset=1172
.Linfo_string101:
	.asciz	"OAR2"                          @ string offset=1177
.Linfo_string102:
	.asciz	"DR"                            @ string offset=1182
.Linfo_string103:
	.asciz	"SR1"                           @ string offset=1185
.Linfo_string104:
	.asciz	"SR2"                           @ string offset=1189
.Linfo_string105:
	.asciz	"CCR"                           @ string offset=1193
.Linfo_string106:
	.asciz	"TRISE"                         @ string offset=1197
.Linfo_string107:
	.asciz	"I2C_TypeDef"                   @ string offset=1203
.Linfo_string108:
	.asciz	"Init"                          @ string offset=1215
.Linfo_string109:
	.asciz	"ClockSpeed"                    @ string offset=1220
.Linfo_string110:
	.asciz	"DutyCycle"                     @ string offset=1231
.Linfo_string111:
	.asciz	"OwnAddress1"                   @ string offset=1241
.Linfo_string112:
	.asciz	"AddressingMode"                @ string offset=1253
.Linfo_string113:
	.asciz	"DualAddressMode"               @ string offset=1268
.Linfo_string114:
	.asciz	"OwnAddress2"                   @ string offset=1284
.Linfo_string115:
	.asciz	"GeneralCallMode"               @ string offset=1296
.Linfo_string116:
	.asciz	"NoStretchMode"                 @ string offset=1312
.Linfo_string117:
	.asciz	"I2C_InitTypeDef"               @ string offset=1326
.Linfo_string118:
	.asciz	"pBuffPtr"                      @ string offset=1342
.Linfo_string119:
	.asciz	"uint8_t"                       @ string offset=1351
.Linfo_string120:
	.asciz	"XferSize"                      @ string offset=1359
.Linfo_string121:
	.asciz	"uint16_t"                      @ string offset=1368
.Linfo_string122:
	.asciz	"XferCount"                     @ string offset=1377
.Linfo_string123:
	.asciz	"XferOptions"                   @ string offset=1387
.Linfo_string124:
	.asciz	"PreviousState"                 @ string offset=1399
.Linfo_string125:
	.asciz	"hdmatx"                        @ string offset=1413
.Linfo_string126:
	.asciz	"CR"                            @ string offset=1420
.Linfo_string127:
	.asciz	"NDTR"                          @ string offset=1423
.Linfo_string128:
	.asciz	"PAR"                           @ string offset=1428
.Linfo_string129:
	.asciz	"M0AR"                          @ string offset=1432
.Linfo_string130:
	.asciz	"M1AR"                          @ string offset=1437
.Linfo_string131:
	.asciz	"FCR"                           @ string offset=1442
.Linfo_string132:
	.asciz	"DMA_Stream_TypeDef"            @ string offset=1446
.Linfo_string133:
	.asciz	"Channel"                       @ string offset=1465
.Linfo_string134:
	.asciz	"Direction"                     @ string offset=1473
.Linfo_string135:
	.asciz	"PeriphInc"                     @ string offset=1483
.Linfo_string136:
	.asciz	"MemInc"                        @ string offset=1493
.Linfo_string137:
	.asciz	"PeriphDataAlignment"           @ string offset=1500
.Linfo_string138:
	.asciz	"MemDataAlignment"              @ string offset=1520
.Linfo_string139:
	.asciz	"Mode"                          @ string offset=1537
.Linfo_string140:
	.asciz	"Priority"                      @ string offset=1542
.Linfo_string141:
	.asciz	"FIFOMode"                      @ string offset=1551
.Linfo_string142:
	.asciz	"FIFOThreshold"                 @ string offset=1560
.Linfo_string143:
	.asciz	"MemBurst"                      @ string offset=1574
.Linfo_string144:
	.asciz	"PeriphBurst"                   @ string offset=1583
.Linfo_string145:
	.asciz	"DMA_InitTypeDef"               @ string offset=1595
.Linfo_string146:
	.asciz	"Lock"                          @ string offset=1611
.Linfo_string147:
	.asciz	"HAL_LockTypeDef"               @ string offset=1616
.Linfo_string148:
	.asciz	"State"                         @ string offset=1632
.Linfo_string149:
	.asciz	"HAL_DMA_StateTypeDef"          @ string offset=1638
.Linfo_string150:
	.asciz	"Parent"                        @ string offset=1659
.Linfo_string151:
	.asciz	"XferCpltCallback"              @ string offset=1666
.Linfo_string152:
	.asciz	"XferHalfCpltCallback"          @ string offset=1683
.Linfo_string153:
	.asciz	"XferM1CpltCallback"            @ string offset=1704
.Linfo_string154:
	.asciz	"XferM1HalfCpltCallback"        @ string offset=1723
.Linfo_string155:
	.asciz	"XferErrorCallback"             @ string offset=1746
.Linfo_string156:
	.asciz	"XferAbortCallback"             @ string offset=1764
.Linfo_string157:
	.asciz	"ErrorCode"                     @ string offset=1782
.Linfo_string158:
	.asciz	"StreamBaseAddress"             @ string offset=1792
.Linfo_string159:
	.asciz	"StreamIndex"                   @ string offset=1810
.Linfo_string160:
	.asciz	"__DMA_HandleTypeDef"           @ string offset=1822
.Linfo_string161:
	.asciz	"DMA_HandleTypeDef"             @ string offset=1842
.Linfo_string162:
	.asciz	"hdmarx"                        @ string offset=1860
.Linfo_string163:
	.asciz	"HAL_I2C_StateTypeDef"          @ string offset=1867
.Linfo_string164:
	.asciz	"HAL_I2C_ModeTypeDef"           @ string offset=1888
.Linfo_string165:
	.asciz	"Devaddress"                    @ string offset=1908
.Linfo_string166:
	.asciz	"Memaddress"                    @ string offset=1919
.Linfo_string167:
	.asciz	"MemaddSize"                    @ string offset=1930
.Linfo_string168:
	.asciz	"EventCount"                    @ string offset=1941
.Linfo_string169:
	.asciz	"I2C_HandleTypeDef"             @ string offset=1952
.Linfo_string170:
	.asciz	"str_DATA"                      @ string offset=1970
.Linfo_string171:
	.asciz	"len"                           @ string offset=1979
.Linfo_string172:
	.asciz	"pageNum"                       @ string offset=1983
.Linfo_string173:
	.asciz	"countNum"                      @ string offset=1991
.Linfo_string174:
	.asciz	"FirstDATA"                     @ string offset=2000
	.ident	"Component: Arm Compiler for Embedded 6.19 Tool: armclang [5e73cb00]"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
	.ARM_attribute	16, 1	@ Tag_AV_eba
	.section	.debug_line,"",%progbits
.Lline_table_start0:
