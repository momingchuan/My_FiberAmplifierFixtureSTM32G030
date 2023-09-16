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
	.file	"tim.c"
	.file	1 "e:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include" "stdint.h"
	.file	2 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h"
	.file	3 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_hal_tim.h"
	.file	4 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_hal_dma.h"
	.file	5 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_def.h"
	.file	6 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Core/Src/tim.c"
	.section	.text.MX_TIM2_Init,"ax",%progbits
	.hidden	MX_TIM2_Init                    @ -- Begin function MX_TIM2_Init
	.globl	MX_TIM2_Init
	.p2align	2
	.type	MX_TIM2_Init,%function
	.code	16                              @ @MX_TIM2_Init
	.thumb_func
MX_TIM2_Init:
.Lfunc_begin0:
	.loc	6 48 0                          @ ../Core/Src/tim.c:48:0
	.fnstart
	.cfi_sections .debug_frame
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#56
	sub	sp, #56
	.cfi_def_cfa_offset 64
	movs	r1, #0
.Ltmp0:
	.loc	6 54 26 prologue_end            @ ../Core/Src/tim.c:54:26
	str	r1, [sp]                        @ 4-byte Spill
	str	r1, [sp, #52]
	str	r1, [sp, #48]
	str	r1, [sp, #44]
	str	r1, [sp, #40]
	.loc	6 55 27                         @ ../Core/Src/tim.c:55:27
	str	r1, [sp, #36]
	str	r1, [sp, #32]
	.loc	6 56 22                         @ ../Core/Src/tim.c:56:22
	str	r1, [sp, #28]
	str	r1, [sp, #24]
	str	r1, [sp, #20]
	str	r1, [sp, #16]
	str	r1, [sp, #12]
	str	r1, [sp, #8]
	str	r1, [sp, #4]
	.loc	6 61 18                         @ ../Core/Src/tim.c:61:18
	movw	r0, :lower16:htim2
	movt	r0, :upper16:htim2
	mov.w	r2, #1073741824
	str	r2, [r0]
	movs	r2, #1
	.loc	6 62 24                         @ ../Core/Src/tim.c:62:24
	str	r2, [r0, #4]
	.loc	6 63 26                         @ ../Core/Src/tim.c:63:26
	str	r1, [r0, #8]
	movw	r2, #42000
	.loc	6 64 21                         @ ../Core/Src/tim.c:64:21
	str	r2, [r0, #12]
	.loc	6 65 28                         @ ../Core/Src/tim.c:65:28
	str	r1, [r0, #16]
	movs	r1, #128
	.loc	6 66 32                         @ ../Core/Src/tim.c:66:32
	str	r1, [r0, #24]
.Ltmp1:
	.loc	6 67 7                          @ ../Core/Src/tim.c:67:7
	bl	HAL_TIM_Base_Init
.Ltmp2:
	.loc	6 67 7 is_stmt 0                @ ../Core/Src/tim.c:67:7
	cbz	r0, .LBB0_2
	b	.LBB0_1
.LBB0_1:
.Ltmp3:
	.loc	6 69 5 is_stmt 1                @ ../Core/Src/tim.c:69:5
	bl	Error_Handler
	.loc	6 70 3                          @ ../Core/Src/tim.c:70:3
	b	.LBB0_2
.Ltmp4:
.LBB0_2:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	mov.w	r0, #4096
	.loc	6 71 34 is_stmt 1               @ ../Core/Src/tim.c:71:34
	str	r0, [sp, #40]
.Ltmp5:
	.loc	6 72 7                          @ ../Core/Src/tim.c:72:7
	movw	r0, :lower16:htim2
	movt	r0, :upper16:htim2
	add	r1, sp, #40
	bl	HAL_TIM_ConfigClockSource
.Ltmp6:
	.loc	6 72 7 is_stmt 0                @ ../Core/Src/tim.c:72:7
	cbz	r0, .LBB0_4
	b	.LBB0_3
.LBB0_3:
.Ltmp7:
	.loc	6 74 5 is_stmt 1                @ ../Core/Src/tim.c:74:5
	bl	Error_Handler
	.loc	6 75 3                          @ ../Core/Src/tim.c:75:3
	b	.LBB0_4
.Ltmp8:
.LBB0_4:
	.loc	6 76 7                          @ ../Core/Src/tim.c:76:7
	movw	r0, :lower16:htim2
	movt	r0, :upper16:htim2
	bl	HAL_TIM_PWM_Init
.Ltmp9:
	.loc	6 76 7 is_stmt 0                @ ../Core/Src/tim.c:76:7
	cbz	r0, .LBB0_6
	b	.LBB0_5
.LBB0_5:
.Ltmp10:
	.loc	6 78 5 is_stmt 1                @ ../Core/Src/tim.c:78:5
	bl	Error_Handler
	.loc	6 79 3                          @ ../Core/Src/tim.c:79:3
	b	.LBB0_6
.Ltmp11:
.LBB0_6:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	movs	r0, #0
	.loc	6 80 37 is_stmt 1               @ ../Core/Src/tim.c:80:37
	str	r0, [sp, #32]
	.loc	6 81 33                         @ ../Core/Src/tim.c:81:33
	str	r0, [sp, #36]
.Ltmp12:
	.loc	6 82 7                          @ ../Core/Src/tim.c:82:7
	movw	r0, :lower16:htim2
	movt	r0, :upper16:htim2
	add	r1, sp, #32
	bl	HAL_TIMEx_MasterConfigSynchronization
.Ltmp13:
	.loc	6 82 7 is_stmt 0                @ ../Core/Src/tim.c:82:7
	cbz	r0, .LBB0_8
	b	.LBB0_7
.LBB0_7:
.Ltmp14:
	.loc	6 84 5 is_stmt 1                @ ../Core/Src/tim.c:84:5
	bl	Error_Handler
	.loc	6 85 3                          @ ../Core/Src/tim.c:85:3
	b	.LBB0_8
.Ltmp15:
.LBB0_8:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	movs	r0, #96
	.loc	6 86 20 is_stmt 1               @ ../Core/Src/tim.c:86:20
	str	r0, [sp, #4]
	movs	r0, #0
	.loc	6 87 19                         @ ../Core/Src/tim.c:87:19
	str	r0, [sp, #8]
	.loc	6 88 24                         @ ../Core/Src/tim.c:88:24
	str	r0, [sp, #12]
	.loc	6 89 24                         @ ../Core/Src/tim.c:89:24
	str	r0, [sp, #20]
.Ltmp16:
	.loc	6 90 7                          @ ../Core/Src/tim.c:90:7
	movw	r0, :lower16:htim2
	movt	r0, :upper16:htim2
	add	r1, sp, #4
	movs	r2, #8
	bl	HAL_TIM_PWM_ConfigChannel
.Ltmp17:
	.loc	6 90 7 is_stmt 0                @ ../Core/Src/tim.c:90:7
	cbz	r0, .LBB0_10
	b	.LBB0_9
.LBB0_9:
.Ltmp18:
	.loc	6 92 5 is_stmt 1                @ ../Core/Src/tim.c:92:5
	bl	Error_Handler
	.loc	6 93 3                          @ ../Core/Src/tim.c:93:3
	b	.LBB0_10
.Ltmp19:
.LBB0_10:
	.loc	6 97 3                          @ ../Core/Src/tim.c:97:3
	movw	r0, :lower16:htim2
	movt	r0, :upper16:htim2
	bl	HAL_TIM_MspPostInit
	.loc	6 99 1                          @ ../Core/Src/tim.c:99:1
	add	sp, #56
	pop	{r7, pc}
.Ltmp20:
.Lfunc_end0:
	.size	MX_TIM2_Init, .Lfunc_end0-MX_TIM2_Init
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.HAL_TIM_MspPostInit,"ax",%progbits
	.hidden	HAL_TIM_MspPostInit             @ -- Begin function HAL_TIM_MspPostInit
	.globl	HAL_TIM_MspPostInit
	.p2align	2
	.type	HAL_TIM_MspPostInit,%function
	.code	16                              @ @HAL_TIM_MspPostInit
	.thumb_func
HAL_TIM_MspPostInit:
.Lfunc_begin1:
	.loc	6 348 0                         @ ../Core/Src/tim.c:348:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#40
	sub	sp, #40
	.cfi_def_cfa_offset 48
	str	r0, [sp, #36]
	movs	r0, #0
.Ltmp21:
	.loc	6 350 20 prologue_end           @ ../Core/Src/tim.c:350:20
	str	r0, [sp, #32]
	str	r0, [sp, #28]
	str	r0, [sp, #24]
	str	r0, [sp, #20]
	str	r0, [sp, #16]
.Ltmp22:
	.loc	6 351 6                         @ ../Core/Src/tim.c:351:6
	ldr	r0, [sp, #36]
	.loc	6 351 17 is_stmt 0              @ ../Core/Src/tim.c:351:17
	ldr	r0, [r0]
.Ltmp23:
	.loc	6 351 6                         @ ../Core/Src/tim.c:351:6
	cmp.w	r0, #1073741824
	bne	.LBB1_4
	b	.LBB1_1
.LBB1_1:
.Ltmp24:
	.loc	6 356 5 is_stmt 1               @ ../Core/Src/tim.c:356:5
	b	.LBB1_2
.LBB1_2:
	.loc	6 0 5 is_stmt 0                 @ ../Core/Src/tim.c:0:5
	movs	r0, #0
.Ltmp25:
	.loc	6 356 5                         @ ../Core/Src/tim.c:356:5
	str	r0, [sp, #12]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #1
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #1
	str	r0, [sp, #12]
	ldr	r0, [sp, #12]
	b	.LBB1_3
.Ltmp26:
.LBB1_3:
	.loc	6 0 5                           @ ../Core/Src/tim.c:0:5
	movs	r0, #4
	.loc	6 360 25 is_stmt 1              @ ../Core/Src/tim.c:360:25
	str	r0, [sp, #16]
	movs	r0, #2
	.loc	6 361 26                        @ ../Core/Src/tim.c:361:26
	str	r0, [sp, #20]
	movs	r0, #0
	.loc	6 362 26                        @ ../Core/Src/tim.c:362:26
	str	r0, [sp, #24]
	.loc	6 363 27                        @ ../Core/Src/tim.c:363:27
	str	r0, [sp, #28]
	movs	r0, #1
	.loc	6 364 31                        @ ../Core/Src/tim.c:364:31
	str	r0, [sp, #32]
	movs	r0, #0
	movt	r0, #16386
	add	r1, sp, #16
	.loc	6 365 5                         @ ../Core/Src/tim.c:365:5
	bl	HAL_GPIO_Init
	.loc	6 370 3                         @ ../Core/Src/tim.c:370:3
	b	.LBB1_14
.Ltmp27:
.LBB1_4:
	.loc	6 371 11                        @ ../Core/Src/tim.c:371:11
	ldr	r0, [sp, #36]
	.loc	6 371 22 is_stmt 0              @ ../Core/Src/tim.c:371:22
	ldr	r0, [r0]
	movw	r1, #1024
	movt	r1, #16385
.Ltmp28:
	.loc	6 371 11                        @ ../Core/Src/tim.c:371:11
	cmp	r0, r1
	bne	.LBB1_8
	b	.LBB1_5
.LBB1_5:
.Ltmp29:
	.loc	6 377 5 is_stmt 1               @ ../Core/Src/tim.c:377:5
	b	.LBB1_6
.LBB1_6:
	.loc	6 0 5 is_stmt 0                 @ ../Core/Src/tim.c:0:5
	movs	r0, #0
.Ltmp30:
	.loc	6 377 5                         @ ../Core/Src/tim.c:377:5
	str	r0, [sp, #8]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #1
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #1
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	b	.LBB1_7
.Ltmp31:
.LBB1_7:
	.loc	6 0 5                           @ ../Core/Src/tim.c:0:5
	movs	r0, #32
	.loc	6 381 25 is_stmt 1              @ ../Core/Src/tim.c:381:25
	str	r0, [sp, #16]
	movs	r0, #2
	.loc	6 382 26                        @ ../Core/Src/tim.c:382:26
	str	r0, [sp, #20]
	movs	r0, #0
	.loc	6 383 26                        @ ../Core/Src/tim.c:383:26
	str	r0, [sp, #24]
	.loc	6 384 27                        @ ../Core/Src/tim.c:384:27
	str	r0, [sp, #28]
	movs	r0, #3
	.loc	6 385 31                        @ ../Core/Src/tim.c:385:31
	str	r0, [sp, #32]
	movs	r0, #0
	movt	r0, #16386
	add	r1, sp, #16
	.loc	6 386 5                         @ ../Core/Src/tim.c:386:5
	bl	HAL_GPIO_Init
	.loc	6 391 3                         @ ../Core/Src/tim.c:391:3
	b	.LBB1_13
.Ltmp32:
.LBB1_8:
	.loc	6 392 11                        @ ../Core/Src/tim.c:392:11
	ldr	r0, [sp, #36]
	.loc	6 392 22 is_stmt 0              @ ../Core/Src/tim.c:392:22
	ldr	r0, [r0]
	movw	r1, #16384
	movt	r1, #16385
.Ltmp33:
	.loc	6 392 11                        @ ../Core/Src/tim.c:392:11
	cmp	r0, r1
	bne	.LBB1_12
	b	.LBB1_9
.LBB1_9:
.Ltmp34:
	.loc	6 398 5 is_stmt 1               @ ../Core/Src/tim.c:398:5
	b	.LBB1_10
.LBB1_10:
	.loc	6 0 5 is_stmt 0                 @ ../Core/Src/tim.c:0:5
	movs	r0, #0
.Ltmp35:
	.loc	6 398 5                         @ ../Core/Src/tim.c:398:5
	str	r0, [sp, #4]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #1
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #1
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	b	.LBB1_11
.Ltmp36:
.LBB1_11:
	.loc	6 0 5                           @ ../Core/Src/tim.c:0:5
	movs	r0, #8
	.loc	6 402 25 is_stmt 1              @ ../Core/Src/tim.c:402:25
	str	r0, [sp, #16]
	movs	r0, #2
	.loc	6 403 26                        @ ../Core/Src/tim.c:403:26
	str	r0, [sp, #20]
	movs	r0, #0
	.loc	6 404 26                        @ ../Core/Src/tim.c:404:26
	str	r0, [sp, #24]
	.loc	6 405 27                        @ ../Core/Src/tim.c:405:27
	str	r0, [sp, #28]
	movs	r0, #3
	.loc	6 406 31                        @ ../Core/Src/tim.c:406:31
	str	r0, [sp, #32]
	movs	r0, #0
	movt	r0, #16386
	add	r1, sp, #16
	.loc	6 407 5                         @ ../Core/Src/tim.c:407:5
	bl	HAL_GPIO_Init
	.loc	6 412 3                         @ ../Core/Src/tim.c:412:3
	b	.LBB1_12
.Ltmp37:
.LBB1_12:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	b	.LBB1_13
.LBB1_13:
	b	.LBB1_14
.LBB1_14:
	.loc	6 414 1 is_stmt 1               @ ../Core/Src/tim.c:414:1
	add	sp, #40
	pop	{r7, pc}
.Ltmp38:
.Lfunc_end1:
	.size	HAL_TIM_MspPostInit, .Lfunc_end1-HAL_TIM_MspPostInit
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.MX_TIM4_Init,"ax",%progbits
	.hidden	MX_TIM4_Init                    @ -- Begin function MX_TIM4_Init
	.globl	MX_TIM4_Init
	.p2align	2
	.type	MX_TIM4_Init,%function
	.code	16                              @ @MX_TIM4_Init
	.thumb_func
MX_TIM4_Init:
.Lfunc_begin2:
	.loc	6 102 0                         @ ../Core/Src/tim.c:102:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#56
	sub	sp, #56
	.cfi_def_cfa_offset 64
	movs	r1, #0
.Ltmp39:
	.loc	6 108 26 prologue_end           @ ../Core/Src/tim.c:108:26
	str	r1, [sp]                        @ 4-byte Spill
	str	r1, [sp, #52]
	str	r1, [sp, #48]
	str	r1, [sp, #44]
	str	r1, [sp, #40]
	.loc	6 109 27                        @ ../Core/Src/tim.c:109:27
	str	r1, [sp, #36]
	str	r1, [sp, #32]
	.loc	6 110 22                        @ ../Core/Src/tim.c:110:22
	str	r1, [sp, #28]
	str	r1, [sp, #24]
	str	r1, [sp, #20]
	str	r1, [sp, #16]
	str	r1, [sp, #12]
	str	r1, [sp, #8]
	str	r1, [sp, #4]
	.loc	6 115 18                        @ ../Core/Src/tim.c:115:18
	movw	r0, :lower16:htim4
	movt	r0, :upper16:htim4
	movw	r2, #2048
	movt	r2, #16384
	str	r2, [r0]
	movs	r2, #83
	.loc	6 116 24                        @ ../Core/Src/tim.c:116:24
	str	r2, [r0, #4]
	.loc	6 117 26                        @ ../Core/Src/tim.c:117:26
	str	r1, [r0, #8]
	movs	r2, #9
	.loc	6 118 21                        @ ../Core/Src/tim.c:118:21
	str	r2, [r0, #12]
	.loc	6 119 28                        @ ../Core/Src/tim.c:119:28
	str	r1, [r0, #16]
	.loc	6 120 32                        @ ../Core/Src/tim.c:120:32
	str	r1, [r0, #24]
.Ltmp40:
	.loc	6 121 7                         @ ../Core/Src/tim.c:121:7
	bl	HAL_TIM_Base_Init
.Ltmp41:
	.loc	6 121 7 is_stmt 0               @ ../Core/Src/tim.c:121:7
	cbz	r0, .LBB2_2
	b	.LBB2_1
.LBB2_1:
.Ltmp42:
	.loc	6 123 5 is_stmt 1               @ ../Core/Src/tim.c:123:5
	bl	Error_Handler
	.loc	6 124 3                         @ ../Core/Src/tim.c:124:3
	b	.LBB2_2
.Ltmp43:
.LBB2_2:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	mov.w	r0, #4096
	.loc	6 125 34 is_stmt 1              @ ../Core/Src/tim.c:125:34
	str	r0, [sp, #40]
.Ltmp44:
	.loc	6 126 7                         @ ../Core/Src/tim.c:126:7
	movw	r0, :lower16:htim4
	movt	r0, :upper16:htim4
	add	r1, sp, #40
	bl	HAL_TIM_ConfigClockSource
.Ltmp45:
	.loc	6 126 7 is_stmt 0               @ ../Core/Src/tim.c:126:7
	cbz	r0, .LBB2_4
	b	.LBB2_3
.LBB2_3:
.Ltmp46:
	.loc	6 128 5 is_stmt 1               @ ../Core/Src/tim.c:128:5
	bl	Error_Handler
	.loc	6 129 3                         @ ../Core/Src/tim.c:129:3
	b	.LBB2_4
.Ltmp47:
.LBB2_4:
	.loc	6 130 7                         @ ../Core/Src/tim.c:130:7
	movw	r0, :lower16:htim4
	movt	r0, :upper16:htim4
	bl	HAL_TIM_OC_Init
.Ltmp48:
	.loc	6 130 7 is_stmt 0               @ ../Core/Src/tim.c:130:7
	cbz	r0, .LBB2_6
	b	.LBB2_5
.LBB2_5:
.Ltmp49:
	.loc	6 132 5 is_stmt 1               @ ../Core/Src/tim.c:132:5
	bl	Error_Handler
	.loc	6 133 3                         @ ../Core/Src/tim.c:133:3
	b	.LBB2_6
.Ltmp50:
.LBB2_6:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	movs	r0, #0
	.loc	6 134 37 is_stmt 1              @ ../Core/Src/tim.c:134:37
	str	r0, [sp, #32]
	.loc	6 135 33                        @ ../Core/Src/tim.c:135:33
	str	r0, [sp, #36]
.Ltmp51:
	.loc	6 136 7                         @ ../Core/Src/tim.c:136:7
	movw	r0, :lower16:htim4
	movt	r0, :upper16:htim4
	add	r1, sp, #32
	bl	HAL_TIMEx_MasterConfigSynchronization
.Ltmp52:
	.loc	6 136 7 is_stmt 0               @ ../Core/Src/tim.c:136:7
	cbz	r0, .LBB2_8
	b	.LBB2_7
.LBB2_7:
.Ltmp53:
	.loc	6 138 5 is_stmt 1               @ ../Core/Src/tim.c:138:5
	bl	Error_Handler
	.loc	6 139 3                         @ ../Core/Src/tim.c:139:3
	b	.LBB2_8
.Ltmp54:
.LBB2_8:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	movs	r0, #0
	.loc	6 140 20 is_stmt 1              @ ../Core/Src/tim.c:140:20
	str	r0, [sp, #4]
	.loc	6 141 19                        @ ../Core/Src/tim.c:141:19
	str	r0, [sp, #8]
	.loc	6 142 24                        @ ../Core/Src/tim.c:142:24
	str	r0, [sp, #12]
	.loc	6 143 24                        @ ../Core/Src/tim.c:143:24
	str	r0, [sp, #20]
.Ltmp55:
	.loc	6 144 7                         @ ../Core/Src/tim.c:144:7
	movw	r0, :lower16:htim4
	movt	r0, :upper16:htim4
	add	r1, sp, #4
	movs	r2, #12
	bl	HAL_TIM_OC_ConfigChannel
.Ltmp56:
	.loc	6 144 7 is_stmt 0               @ ../Core/Src/tim.c:144:7
	cbz	r0, .LBB2_10
	b	.LBB2_9
.LBB2_9:
.Ltmp57:
	.loc	6 146 5 is_stmt 1               @ ../Core/Src/tim.c:146:5
	bl	Error_Handler
	.loc	6 147 3                         @ ../Core/Src/tim.c:147:3
	b	.LBB2_10
.Ltmp58:
.LBB2_10:
	.loc	6 152 1                         @ ../Core/Src/tim.c:152:1
	add	sp, #56
	pop	{r7, pc}
.Ltmp59:
.Lfunc_end2:
	.size	MX_TIM4_Init, .Lfunc_end2-MX_TIM4_Init
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.MX_TIM8_Init,"ax",%progbits
	.hidden	MX_TIM8_Init                    @ -- Begin function MX_TIM8_Init
	.globl	MX_TIM8_Init
	.p2align	2
	.type	MX_TIM8_Init,%function
	.code	16                              @ @MX_TIM8_Init
	.thumb_func
MX_TIM8_Init:
.Lfunc_begin3:
	.loc	6 155 0                         @ ../Core/Src/tim.c:155:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#96
	sub	sp, #96
	.cfi_def_cfa_offset 104
	movs	r1, #0
.Ltmp60:
	.loc	6 161 26 prologue_end           @ ../Core/Src/tim.c:161:26
	str	r1, [sp, #4]                    @ 4-byte Spill
	str	r1, [sp, #92]
	str	r1, [sp, #88]
	str	r1, [sp, #84]
	str	r1, [sp, #80]
	.loc	6 162 27                        @ ../Core/Src/tim.c:162:27
	str	r1, [sp, #76]
	str	r1, [sp, #72]
	.loc	6 163 22                        @ ../Core/Src/tim.c:163:22
	str	r1, [sp, #68]
	str	r1, [sp, #64]
	str	r1, [sp, #60]
	str	r1, [sp, #56]
	str	r1, [sp, #52]
	str	r1, [sp, #48]
	str	r1, [sp, #44]
	.loc	6 164 34                        @ ../Core/Src/tim.c:164:34
	str	r1, [sp, #40]
	str	r1, [sp, #36]
	str	r1, [sp, #32]
	str	r1, [sp, #28]
	str	r1, [sp, #24]
	str	r1, [sp, #20]
	str	r1, [sp, #16]
	str	r1, [sp, #12]
	.loc	6 169 18                        @ ../Core/Src/tim.c:169:18
	movw	r0, :lower16:htim8
	movt	r0, :upper16:htim8
	str	r0, [sp, #8]                    @ 4-byte Spill
	movw	r2, #1024
	movt	r2, #16385
	str	r2, [r0]
	mov.w	r2, #1680
	.loc	6 170 24                        @ ../Core/Src/tim.c:170:24
	str	r2, [r0, #4]
	.loc	6 171 26                        @ ../Core/Src/tim.c:171:26
	str	r1, [r0, #8]
	mov.w	r2, #2000
	.loc	6 172 21                        @ ../Core/Src/tim.c:172:21
	str	r2, [r0, #12]
	.loc	6 173 28                        @ ../Core/Src/tim.c:173:28
	str	r1, [r0, #16]
	.loc	6 174 32                        @ ../Core/Src/tim.c:174:32
	str	r1, [r0, #20]
	.loc	6 175 32                        @ ../Core/Src/tim.c:175:32
	str	r1, [r0, #24]
.Ltmp61:
	.loc	6 176 7                         @ ../Core/Src/tim.c:176:7
	bl	HAL_TIM_Base_Init
.Ltmp62:
	.loc	6 176 7 is_stmt 0               @ ../Core/Src/tim.c:176:7
	cbz	r0, .LBB3_2
	b	.LBB3_1
.LBB3_1:
.Ltmp63:
	.loc	6 178 5 is_stmt 1               @ ../Core/Src/tim.c:178:5
	bl	Error_Handler
	.loc	6 179 3                         @ ../Core/Src/tim.c:179:3
	b	.LBB3_2
.Ltmp64:
.LBB3_2:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	mov.w	r0, #4096
	.loc	6 180 34 is_stmt 1              @ ../Core/Src/tim.c:180:34
	str	r0, [sp, #80]
.Ltmp65:
	.loc	6 181 7                         @ ../Core/Src/tim.c:181:7
	movw	r0, :lower16:htim8
	movt	r0, :upper16:htim8
	add	r1, sp, #80
	bl	HAL_TIM_ConfigClockSource
.Ltmp66:
	.loc	6 181 7 is_stmt 0               @ ../Core/Src/tim.c:181:7
	cbz	r0, .LBB3_4
	b	.LBB3_3
.LBB3_3:
.Ltmp67:
	.loc	6 183 5 is_stmt 1               @ ../Core/Src/tim.c:183:5
	bl	Error_Handler
	.loc	6 184 3                         @ ../Core/Src/tim.c:184:3
	b	.LBB3_4
.Ltmp68:
.LBB3_4:
	.loc	6 185 7                         @ ../Core/Src/tim.c:185:7
	movw	r0, :lower16:htim8
	movt	r0, :upper16:htim8
	bl	HAL_TIM_PWM_Init
.Ltmp69:
	.loc	6 185 7 is_stmt 0               @ ../Core/Src/tim.c:185:7
	cbz	r0, .LBB3_6
	b	.LBB3_5
.LBB3_5:
.Ltmp70:
	.loc	6 187 5 is_stmt 1               @ ../Core/Src/tim.c:187:5
	bl	Error_Handler
	.loc	6 188 3                         @ ../Core/Src/tim.c:188:3
	b	.LBB3_6
.Ltmp71:
.LBB3_6:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	movs	r0, #0
	.loc	6 189 37 is_stmt 1              @ ../Core/Src/tim.c:189:37
	str	r0, [sp, #72]
	.loc	6 190 33                        @ ../Core/Src/tim.c:190:33
	str	r0, [sp, #76]
.Ltmp72:
	.loc	6 191 7                         @ ../Core/Src/tim.c:191:7
	movw	r0, :lower16:htim8
	movt	r0, :upper16:htim8
	add	r1, sp, #72
	bl	HAL_TIMEx_MasterConfigSynchronization
.Ltmp73:
	.loc	6 191 7 is_stmt 0               @ ../Core/Src/tim.c:191:7
	cbz	r0, .LBB3_8
	b	.LBB3_7
.LBB3_7:
.Ltmp74:
	.loc	6 193 5 is_stmt 1               @ ../Core/Src/tim.c:193:5
	bl	Error_Handler
	.loc	6 194 3                         @ ../Core/Src/tim.c:194:3
	b	.LBB3_8
.Ltmp75:
.LBB3_8:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	movs	r0, #96
	.loc	6 195 20 is_stmt 1              @ ../Core/Src/tim.c:195:20
	str	r0, [sp, #44]
	movs	r2, #0
	.loc	6 196 19                        @ ../Core/Src/tim.c:196:19
	str	r2, [sp, #48]
	.loc	6 197 24                        @ ../Core/Src/tim.c:197:24
	str	r2, [sp, #52]
	.loc	6 198 25                        @ ../Core/Src/tim.c:198:25
	str	r2, [sp, #56]
	.loc	6 199 24                        @ ../Core/Src/tim.c:199:24
	str	r2, [sp, #60]
	.loc	6 200 25                        @ ../Core/Src/tim.c:200:25
	str	r2, [sp, #64]
	.loc	6 201 26                        @ ../Core/Src/tim.c:201:26
	str	r2, [sp, #68]
.Ltmp76:
	.loc	6 202 7                         @ ../Core/Src/tim.c:202:7
	movw	r0, :lower16:htim8
	movt	r0, :upper16:htim8
	add	r1, sp, #44
	bl	HAL_TIM_PWM_ConfigChannel
.Ltmp77:
	.loc	6 202 7 is_stmt 0               @ ../Core/Src/tim.c:202:7
	cbz	r0, .LBB3_10
	b	.LBB3_9
.LBB3_9:
.Ltmp78:
	.loc	6 204 5 is_stmt 1               @ ../Core/Src/tim.c:204:5
	bl	Error_Handler
	.loc	6 205 3                         @ ../Core/Src/tim.c:205:3
	b	.LBB3_10
.Ltmp79:
.LBB3_10:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	movs	r0, #0
	.loc	6 206 40 is_stmt 1              @ ../Core/Src/tim.c:206:40
	str	r0, [sp, #12]
	.loc	6 207 41                        @ ../Core/Src/tim.c:207:41
	str	r0, [sp, #16]
	.loc	6 208 34                        @ ../Core/Src/tim.c:208:34
	str	r0, [sp, #20]
	.loc	6 209 33                        @ ../Core/Src/tim.c:209:33
	str	r0, [sp, #24]
	.loc	6 210 35                        @ ../Core/Src/tim.c:210:35
	str	r0, [sp, #28]
	mov.w	r1, #8192
	.loc	6 211 38                        @ ../Core/Src/tim.c:211:38
	str	r1, [sp, #32]
	.loc	6 212 40                        @ ../Core/Src/tim.c:212:40
	str	r0, [sp, #40]
.Ltmp80:
	.loc	6 213 7                         @ ../Core/Src/tim.c:213:7
	movw	r0, :lower16:htim8
	movt	r0, :upper16:htim8
	add	r1, sp, #12
	bl	HAL_TIMEx_ConfigBreakDeadTime
.Ltmp81:
	.loc	6 213 7 is_stmt 0               @ ../Core/Src/tim.c:213:7
	cbz	r0, .LBB3_12
	b	.LBB3_11
.LBB3_11:
.Ltmp82:
	.loc	6 215 5 is_stmt 1               @ ../Core/Src/tim.c:215:5
	bl	Error_Handler
	.loc	6 216 3                         @ ../Core/Src/tim.c:216:3
	b	.LBB3_12
.Ltmp83:
.LBB3_12:
	.loc	6 220 3                         @ ../Core/Src/tim.c:220:3
	movw	r0, :lower16:htim8
	movt	r0, :upper16:htim8
	bl	HAL_TIM_MspPostInit
	.loc	6 222 1                         @ ../Core/Src/tim.c:222:1
	add	sp, #96
	pop	{r7, pc}
.Ltmp84:
.Lfunc_end3:
	.size	MX_TIM8_Init, .Lfunc_end3-MX_TIM8_Init
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.MX_TIM9_Init,"ax",%progbits
	.hidden	MX_TIM9_Init                    @ -- Begin function MX_TIM9_Init
	.globl	MX_TIM9_Init
	.p2align	2
	.type	MX_TIM9_Init,%function
	.code	16                              @ @MX_TIM9_Init
	.thumb_func
MX_TIM9_Init:
.Lfunc_begin4:
	.loc	6 225 0                         @ ../Core/Src/tim.c:225:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#48
	sub	sp, #48
	.cfi_def_cfa_offset 56
	movs	r1, #0
.Ltmp85:
	.loc	6 231 26 prologue_end           @ ../Core/Src/tim.c:231:26
	str	r1, [sp]                        @ 4-byte Spill
	str	r1, [sp, #44]
	str	r1, [sp, #40]
	str	r1, [sp, #36]
	str	r1, [sp, #32]
	.loc	6 232 22                        @ ../Core/Src/tim.c:232:22
	str	r1, [sp, #28]
	str	r1, [sp, #24]
	str	r1, [sp, #20]
	str	r1, [sp, #16]
	str	r1, [sp, #12]
	str	r1, [sp, #8]
	str	r1, [sp, #4]
	.loc	6 253 18                        @ ../Core/Src/tim.c:253:18
	movw	r0, :lower16:htim9
	movt	r0, :upper16:htim9
	movw	r2, #16384
	movt	r2, #16385
	str	r2, [r0]
	movs	r2, #3
	.loc	6 254 24                        @ ../Core/Src/tim.c:254:24
	str	r2, [r0, #4]
	.loc	6 255 26                        @ ../Core/Src/tim.c:255:26
	str	r1, [r0, #8]
	movw	r2, #42000
	.loc	6 256 21                        @ ../Core/Src/tim.c:256:21
	str	r2, [r0, #12]
	.loc	6 257 28                        @ ../Core/Src/tim.c:257:28
	str	r1, [r0, #16]
	movs	r1, #128
	.loc	6 258 32                        @ ../Core/Src/tim.c:258:32
	str	r1, [r0, #24]
.Ltmp86:
	.loc	6 259 7                         @ ../Core/Src/tim.c:259:7
	bl	HAL_TIM_Base_Init
.Ltmp87:
	.loc	6 259 7 is_stmt 0               @ ../Core/Src/tim.c:259:7
	cbz	r0, .LBB4_2
	b	.LBB4_1
.LBB4_1:
.Ltmp88:
	.loc	6 261 5 is_stmt 1               @ ../Core/Src/tim.c:261:5
	bl	Error_Handler
	.loc	6 262 3                         @ ../Core/Src/tim.c:262:3
	b	.LBB4_2
.Ltmp89:
.LBB4_2:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	mov.w	r0, #4096
	.loc	6 263 34 is_stmt 1              @ ../Core/Src/tim.c:263:34
	str	r0, [sp, #32]
.Ltmp90:
	.loc	6 264 7                         @ ../Core/Src/tim.c:264:7
	movw	r0, :lower16:htim9
	movt	r0, :upper16:htim9
	add	r1, sp, #32
	bl	HAL_TIM_ConfigClockSource
.Ltmp91:
	.loc	6 264 7 is_stmt 0               @ ../Core/Src/tim.c:264:7
	cbz	r0, .LBB4_4
	b	.LBB4_3
.LBB4_3:
.Ltmp92:
	.loc	6 266 5 is_stmt 1               @ ../Core/Src/tim.c:266:5
	bl	Error_Handler
	.loc	6 267 3                         @ ../Core/Src/tim.c:267:3
	b	.LBB4_4
.Ltmp93:
.LBB4_4:
	.loc	6 268 7                         @ ../Core/Src/tim.c:268:7
	movw	r0, :lower16:htim9
	movt	r0, :upper16:htim9
	bl	HAL_TIM_PWM_Init
.Ltmp94:
	.loc	6 268 7 is_stmt 0               @ ../Core/Src/tim.c:268:7
	cbz	r0, .LBB4_6
	b	.LBB4_5
.LBB4_5:
.Ltmp95:
	.loc	6 270 5 is_stmt 1               @ ../Core/Src/tim.c:270:5
	bl	Error_Handler
	.loc	6 271 3                         @ ../Core/Src/tim.c:271:3
	b	.LBB4_6
.Ltmp96:
.LBB4_6:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	movs	r0, #96
	.loc	6 272 20 is_stmt 1              @ ../Core/Src/tim.c:272:20
	str	r0, [sp, #4]
	movs	r0, #0
	.loc	6 273 19                        @ ../Core/Src/tim.c:273:19
	str	r0, [sp, #8]
	.loc	6 274 24                        @ ../Core/Src/tim.c:274:24
	str	r0, [sp, #12]
	.loc	6 275 24                        @ ../Core/Src/tim.c:275:24
	str	r0, [sp, #20]
.Ltmp97:
	.loc	6 276 7                         @ ../Core/Src/tim.c:276:7
	movw	r0, :lower16:htim9
	movt	r0, :upper16:htim9
	add	r1, sp, #4
	movs	r2, #4
	bl	HAL_TIM_PWM_ConfigChannel
.Ltmp98:
	.loc	6 276 7 is_stmt 0               @ ../Core/Src/tim.c:276:7
	cbz	r0, .LBB4_8
	b	.LBB4_7
.LBB4_7:
.Ltmp99:
	.loc	6 278 5 is_stmt 1               @ ../Core/Src/tim.c:278:5
	bl	Error_Handler
	.loc	6 279 3                         @ ../Core/Src/tim.c:279:3
	b	.LBB4_8
.Ltmp100:
.LBB4_8:
	.loc	6 283 3                         @ ../Core/Src/tim.c:283:3
	movw	r0, :lower16:htim9
	movt	r0, :upper16:htim9
	bl	HAL_TIM_MspPostInit
	.loc	6 285 1                         @ ../Core/Src/tim.c:285:1
	add	sp, #48
	pop	{r7, pc}
.Ltmp101:
.Lfunc_end4:
	.size	MX_TIM9_Init, .Lfunc_end4-MX_TIM9_Init
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.HAL_TIM_Base_MspInit,"ax",%progbits
	.hidden	HAL_TIM_Base_MspInit            @ -- Begin function HAL_TIM_Base_MspInit
	.globl	HAL_TIM_Base_MspInit
	.p2align	2
	.type	HAL_TIM_Base_MspInit,%function
	.code	16                              @ @HAL_TIM_Base_MspInit
	.thumb_func
HAL_TIM_Base_MspInit:
.Lfunc_begin5:
	.loc	6 288 0                         @ ../Core/Src/tim.c:288:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#32
	sub	sp, #32
	.cfi_def_cfa_offset 40
	str	r0, [sp, #28]
.Ltmp102:
	.loc	6 290 6 prologue_end            @ ../Core/Src/tim.c:290:6
	ldr	r0, [sp, #28]
	.loc	6 290 22 is_stmt 0              @ ../Core/Src/tim.c:290:22
	ldr	r0, [r0]
.Ltmp103:
	.loc	6 290 6                         @ ../Core/Src/tim.c:290:6
	cmp.w	r0, #1073741824
	bne	.LBB5_4
	b	.LBB5_1
.LBB5_1:
.Ltmp104:
	.loc	6 296 5 is_stmt 1               @ ../Core/Src/tim.c:296:5
	b	.LBB5_2
.LBB5_2:
	.loc	6 0 5 is_stmt 0                 @ ../Core/Src/tim.c:0:5
	movs	r0, #0
.Ltmp105:
	.loc	6 296 5                         @ ../Core/Src/tim.c:296:5
	str	r0, [sp, #24]
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #1
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #1
	str	r0, [sp, #24]
	ldr	r0, [sp, #24]
	b	.LBB5_3
.Ltmp106:
.LBB5_3:
	.loc	6 0 5                           @ ../Core/Src/tim.c:0:5
	movs	r0, #28
	str	r0, [sp, #8]                    @ 4-byte Spill
	movs	r2, #0
	.loc	6 299 5 is_stmt 1               @ ../Core/Src/tim.c:299:5
	mov	r1, r2
	bl	HAL_NVIC_SetPriority
	ldr	r0, [sp, #8]                    @ 4-byte Reload
	.loc	6 300 5                         @ ../Core/Src/tim.c:300:5
	bl	HAL_NVIC_EnableIRQ
	.loc	6 304 3                         @ ../Core/Src/tim.c:304:3
	b	.LBB5_19
.Ltmp107:
.LBB5_4:
	.loc	6 305 11                        @ ../Core/Src/tim.c:305:11
	ldr	r0, [sp, #28]
	.loc	6 305 27 is_stmt 0              @ ../Core/Src/tim.c:305:27
	ldr	r0, [r0]
	movw	r1, #2048
	movt	r1, #16384
.Ltmp108:
	.loc	6 305 11                        @ ../Core/Src/tim.c:305:11
	cmp	r0, r1
	bne	.LBB5_8
	b	.LBB5_5
.LBB5_5:
.Ltmp109:
	.loc	6 311 5 is_stmt 1               @ ../Core/Src/tim.c:311:5
	b	.LBB5_6
.LBB5_6:
	.loc	6 0 5 is_stmt 0                 @ ../Core/Src/tim.c:0:5
	movs	r0, #0
.Ltmp110:
	.loc	6 311 5                         @ ../Core/Src/tim.c:311:5
	str	r0, [sp, #20]
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #4
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #4
	str	r0, [sp, #20]
	ldr	r0, [sp, #20]
	b	.LBB5_7
.Ltmp111:
.LBB5_7:
	.loc	6 0 5                           @ ../Core/Src/tim.c:0:5
	movs	r0, #30
	str	r0, [sp, #4]                    @ 4-byte Spill
	movs	r2, #0
	.loc	6 314 5 is_stmt 1               @ ../Core/Src/tim.c:314:5
	mov	r1, r2
	bl	HAL_NVIC_SetPriority
	ldr	r0, [sp, #4]                    @ 4-byte Reload
	.loc	6 315 5                         @ ../Core/Src/tim.c:315:5
	bl	HAL_NVIC_EnableIRQ
	.loc	6 319 3                         @ ../Core/Src/tim.c:319:3
	b	.LBB5_18
.Ltmp112:
.LBB5_8:
	.loc	6 320 11                        @ ../Core/Src/tim.c:320:11
	ldr	r0, [sp, #28]
	.loc	6 320 27 is_stmt 0              @ ../Core/Src/tim.c:320:27
	ldr	r0, [r0]
	movw	r1, #1024
	movt	r1, #16385
.Ltmp113:
	.loc	6 320 11                        @ ../Core/Src/tim.c:320:11
	cmp	r0, r1
	bne	.LBB5_12
	b	.LBB5_9
.LBB5_9:
.Ltmp114:
	.loc	6 326 5 is_stmt 1               @ ../Core/Src/tim.c:326:5
	b	.LBB5_10
.LBB5_10:
	.loc	6 0 5 is_stmt 0                 @ ../Core/Src/tim.c:0:5
	movs	r0, #0
.Ltmp115:
	.loc	6 326 5                         @ ../Core/Src/tim.c:326:5
	str	r0, [sp, #16]
	movw	r0, #14404
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #2
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #2
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	b	.LBB5_11
.Ltmp116:
.LBB5_11:
	.loc	6 330 3 is_stmt 1               @ ../Core/Src/tim.c:330:3
	b	.LBB5_17
.Ltmp117:
.LBB5_12:
	.loc	6 331 11                        @ ../Core/Src/tim.c:331:11
	ldr	r0, [sp, #28]
	.loc	6 331 27 is_stmt 0              @ ../Core/Src/tim.c:331:27
	ldr	r0, [r0]
	movw	r1, #16384
	movt	r1, #16385
.Ltmp118:
	.loc	6 331 11                        @ ../Core/Src/tim.c:331:11
	cmp	r0, r1
	bne	.LBB5_16
	b	.LBB5_13
.LBB5_13:
.Ltmp119:
	.loc	6 337 5 is_stmt 1               @ ../Core/Src/tim.c:337:5
	b	.LBB5_14
.LBB5_14:
	.loc	6 0 5 is_stmt 0                 @ ../Core/Src/tim.c:0:5
	movs	r0, #0
.Ltmp120:
	.loc	6 337 5                         @ ../Core/Src/tim.c:337:5
	str	r0, [sp, #12]
	movw	r0, #14404
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #65536
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #65536
	str	r0, [sp, #12]
	ldr	r0, [sp, #12]
	b	.LBB5_15
.Ltmp121:
.LBB5_15:
	.loc	6 0 5                           @ ../Core/Src/tim.c:0:5
	movs	r0, #24
	str	r0, [sp]                        @ 4-byte Spill
	movs	r2, #0
	.loc	6 340 5 is_stmt 1               @ ../Core/Src/tim.c:340:5
	mov	r1, r2
	bl	HAL_NVIC_SetPriority
	ldr	r0, [sp]                        @ 4-byte Reload
	.loc	6 341 5                         @ ../Core/Src/tim.c:341:5
	bl	HAL_NVIC_EnableIRQ
	.loc	6 345 3                         @ ../Core/Src/tim.c:345:3
	b	.LBB5_16
.Ltmp122:
.LBB5_16:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	b	.LBB5_17
.LBB5_17:
	b	.LBB5_18
.LBB5_18:
	b	.LBB5_19
.LBB5_19:
	.loc	6 346 1 is_stmt 1               @ ../Core/Src/tim.c:346:1
	add	sp, #32
	pop	{r7, pc}
.Ltmp123:
.Lfunc_end5:
	.size	HAL_TIM_Base_MspInit, .Lfunc_end5-HAL_TIM_Base_MspInit
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.HAL_TIM_Base_MspDeInit,"ax",%progbits
	.hidden	HAL_TIM_Base_MspDeInit          @ -- Begin function HAL_TIM_Base_MspDeInit
	.globl	HAL_TIM_Base_MspDeInit
	.p2align	2
	.type	HAL_TIM_Base_MspDeInit,%function
	.code	16                              @ @HAL_TIM_Base_MspDeInit
	.thumb_func
HAL_TIM_Base_MspDeInit:
.Lfunc_begin6:
	.loc	6 417 0                         @ ../Core/Src/tim.c:417:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#8
	sub	sp, #8
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
.Ltmp124:
	.loc	6 419 6 prologue_end            @ ../Core/Src/tim.c:419:6
	ldr	r0, [sp, #4]
	.loc	6 419 22 is_stmt 0              @ ../Core/Src/tim.c:419:22
	ldr	r0, [r0]
.Ltmp125:
	.loc	6 419 6                         @ ../Core/Src/tim.c:419:6
	cmp.w	r0, #1073741824
	bne	.LBB6_2
	b	.LBB6_1
.LBB6_1:
	.loc	6 0 6                           @ ../Core/Src/tim.c:0:6
	movw	r1, #14400
	movt	r1, #16386
.Ltmp126:
	.loc	6 425 5 is_stmt 1               @ ../Core/Src/tim.c:425:5
	ldr	r0, [r1]
	bic	r0, r0, #1
	str	r0, [r1]
	movs	r0, #28
	.loc	6 428 5                         @ ../Core/Src/tim.c:428:5
	bl	HAL_NVIC_DisableIRQ
	.loc	6 432 3                         @ ../Core/Src/tim.c:432:3
	b	.LBB6_11
.Ltmp127:
.LBB6_2:
	.loc	6 433 11                        @ ../Core/Src/tim.c:433:11
	ldr	r0, [sp, #4]
	.loc	6 433 27 is_stmt 0              @ ../Core/Src/tim.c:433:27
	ldr	r0, [r0]
	movw	r1, #2048
	movt	r1, #16384
.Ltmp128:
	.loc	6 433 11                        @ ../Core/Src/tim.c:433:11
	cmp	r0, r1
	bne	.LBB6_4
	b	.LBB6_3
.LBB6_3:
	.loc	6 0 11                          @ ../Core/Src/tim.c:0:11
	movw	r1, #14400
	movt	r1, #16386
.Ltmp129:
	.loc	6 439 5 is_stmt 1               @ ../Core/Src/tim.c:439:5
	ldr	r0, [r1]
	bic	r0, r0, #4
	str	r0, [r1]
	movs	r0, #30
	.loc	6 442 5                         @ ../Core/Src/tim.c:442:5
	bl	HAL_NVIC_DisableIRQ
	.loc	6 446 3                         @ ../Core/Src/tim.c:446:3
	b	.LBB6_10
.Ltmp130:
.LBB6_4:
	.loc	6 447 11                        @ ../Core/Src/tim.c:447:11
	ldr	r0, [sp, #4]
	.loc	6 447 27 is_stmt 0              @ ../Core/Src/tim.c:447:27
	ldr	r0, [r0]
	movw	r1, #1024
	movt	r1, #16385
.Ltmp131:
	.loc	6 447 11                        @ ../Core/Src/tim.c:447:11
	cmp	r0, r1
	bne	.LBB6_6
	b	.LBB6_5
.LBB6_5:
	.loc	6 0 11                          @ ../Core/Src/tim.c:0:11
	movw	r1, #14404
	movt	r1, #16386
.Ltmp132:
	.loc	6 453 5 is_stmt 1               @ ../Core/Src/tim.c:453:5
	ldr	r0, [r1]
	bic	r0, r0, #2
	str	r0, [r1]
	.loc	6 457 3                         @ ../Core/Src/tim.c:457:3
	b	.LBB6_9
.Ltmp133:
.LBB6_6:
	.loc	6 458 11                        @ ../Core/Src/tim.c:458:11
	ldr	r0, [sp, #4]
	.loc	6 458 27 is_stmt 0              @ ../Core/Src/tim.c:458:27
	ldr	r0, [r0]
	movw	r1, #16384
	movt	r1, #16385
.Ltmp134:
	.loc	6 458 11                        @ ../Core/Src/tim.c:458:11
	cmp	r0, r1
	bne	.LBB6_8
	b	.LBB6_7
.LBB6_7:
	.loc	6 0 11                          @ ../Core/Src/tim.c:0:11
	movw	r1, #14404
	movt	r1, #16386
.Ltmp135:
	.loc	6 464 5 is_stmt 1               @ ../Core/Src/tim.c:464:5
	ldr	r0, [r1]
	bic	r0, r0, #65536
	str	r0, [r1]
	movs	r0, #24
	.loc	6 467 5                         @ ../Core/Src/tim.c:467:5
	bl	HAL_NVIC_DisableIRQ
	.loc	6 471 3                         @ ../Core/Src/tim.c:471:3
	b	.LBB6_8
.Ltmp136:
.LBB6_8:
	.loc	6 0 3 is_stmt 0                 @ ../Core/Src/tim.c:0:3
	b	.LBB6_9
.LBB6_9:
	b	.LBB6_10
.LBB6_10:
	b	.LBB6_11
.LBB6_11:
	.loc	6 472 1 is_stmt 1               @ ../Core/Src/tim.c:472:1
	add	sp, #8
	pop	{r7, pc}
.Ltmp137:
.Lfunc_end6:
	.size	HAL_TIM_Base_MspDeInit, .Lfunc_end6-HAL_TIM_Base_MspDeInit
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.hidden	htim2                           @ @htim2
	.type	htim2,%object
	.section	.bss.htim2,"aw",%nobits
	.globl	htim2
	.p2align	2, 0x0
htim2:
	.zero	72
	.size	htim2, 72

	.hidden	htim4                           @ @htim4
	.type	htim4,%object
	.section	.bss.htim4,"aw",%nobits
	.globl	htim4
	.p2align	2, 0x0
htim4:
	.zero	72
	.size	htim4, 72

	.hidden	htim8                           @ @htim8
	.type	htim8,%object
	.section	.bss.htim8,"aw",%nobits
	.globl	htim8
	.p2align	2, 0x0
htim8:
	.zero	72
	.size	htim8, 72

	.hidden	htim9                           @ @htim9
	.type	htim9,%object
	.section	.bss.htim9,"aw",%nobits
	.globl	htim9
	.p2align	2, 0x0
htim9:
	.zero	72
	.size	htim9, 72

	.file	7 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_hal_gpio.h"
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
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	7                               @ Abbreviation Code
	.byte	53                              @ DW_TAG_volatile_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	8                               @ Abbreviation Code
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
	.byte	9                               @ Abbreviation Code
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
	.byte	10                              @ Abbreviation Code
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
	.byte	11                              @ Abbreviation Code
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
	.byte	12                              @ Abbreviation Code
	.byte	4                               @ DW_TAG_enumeration_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	5                               @ DW_FORM_data2
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	13                              @ Abbreviation Code
	.byte	40                              @ DW_TAG_enumerator
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	28                              @ DW_AT_const_value
	.byte	15                              @ DW_FORM_udata
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	14                              @ Abbreviation Code
	.byte	1                               @ DW_TAG_array_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	15                              @ Abbreviation Code
	.byte	33                              @ DW_TAG_subrange_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	55                              @ DW_AT_count
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	16                              @ Abbreviation Code
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
	.byte	17                              @ Abbreviation Code
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
	.byte	18                              @ Abbreviation Code
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	19                              @ Abbreviation Code
	.byte	21                              @ DW_TAG_subroutine_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	39                              @ DW_AT_prototyped
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	20                              @ Abbreviation Code
	.byte	5                               @ DW_TAG_formal_parameter
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	21                              @ Abbreviation Code
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
	.byte	22                              @ Abbreviation Code
	.byte	40                              @ DW_TAG_enumerator
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	28                              @ DW_AT_const_value
	.byte	13                              @ DW_FORM_sdata
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	23                              @ Abbreviation Code
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
	.byte	24                              @ Abbreviation Code
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
	.byte	25                              @ Abbreviation Code
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
	.byte	26                              @ Abbreviation Code
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
	.byte	27                              @ Abbreviation Code
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
	.byte	28                              @ Abbreviation Code
	.byte	11                              @ DW_TAG_lexical_block
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
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
	.byte	1                               @ Abbrev [1] 0xb:0xe03 DW_TAG_compile_unit
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
	.byte	6                               @ DW_AT_decl_file
	.byte	41                              @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	htim2
	.byte	3                               @ Abbrev [3] 0x37:0xc DW_TAG_typedef
	.long	67                              @ DW_AT_type
	.long	.Linfo_string107                @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.short	380                             @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x43:0x7b DW_TAG_structure_type
	.byte	72                              @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.short	337                             @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x48:0xd DW_TAG_member
	.long	.Linfo_string4                  @ DW_AT_name
	.long	190                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	340                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x55:0xd DW_TAG_member
	.long	.Linfo_string29                 @ DW_AT_name
	.long	509                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	341                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x62:0xd DW_TAG_member
	.long	.Linfo_string37                 @ DW_AT_name
	.long	597                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	342                             @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x6f:0xd DW_TAG_member
	.long	.Linfo_string45                 @ DW_AT_name
	.long	656                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	343                             @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x7c:0xd DW_TAG_member
	.long	.Linfo_string65                 @ DW_AT_name
	.long	1122                            @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	345                             @ DW_AT_decl_line
	.byte	60                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x89:0xd DW_TAG_member
	.long	.Linfo_string69                 @ DW_AT_name
	.long	1240                            @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	346                             @ DW_AT_decl_line
	.byte	61                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x96:0xd DW_TAG_member
	.long	.Linfo_string96                 @ DW_AT_name
	.long	1297                            @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	347                             @ DW_AT_decl_line
	.byte	62                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xa3:0xd DW_TAG_member
	.long	.Linfo_string101                @ DW_AT_name
	.long	1297                            @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	348                             @ DW_AT_decl_line
	.byte	66                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xb0:0xd DW_TAG_member
	.long	.Linfo_string102                @ DW_AT_name
	.long	1354                            @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	349                             @ DW_AT_decl_line
	.byte	70                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0xbe:0x5 DW_TAG_pointer_type
	.long	195                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0xc3:0xc DW_TAG_typedef
	.long	207                             @ DW_AT_type
	.long	.Linfo_string28                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	751                             @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0xcf:0x117 DW_TAG_structure_type
	.byte	84                              @ DW_AT_byte_size
	.byte	2                               @ DW_AT_decl_file
	.short	728                             @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0xd4:0xd DW_TAG_member
	.long	.Linfo_string5                  @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	730                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xe1:0xd DW_TAG_member
	.long	.Linfo_string8                  @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	731                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xee:0xd DW_TAG_member
	.long	.Linfo_string9                  @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	732                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xfb:0xd DW_TAG_member
	.long	.Linfo_string10                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	733                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x108:0xd DW_TAG_member
	.long	.Linfo_string11                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	734                             @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x115:0xd DW_TAG_member
	.long	.Linfo_string12                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	735                             @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x122:0xd DW_TAG_member
	.long	.Linfo_string13                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	736                             @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x12f:0xd DW_TAG_member
	.long	.Linfo_string14                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	737                             @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x13c:0xd DW_TAG_member
	.long	.Linfo_string15                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	738                             @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x149:0xd DW_TAG_member
	.long	.Linfo_string16                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	739                             @ DW_AT_decl_line
	.byte	36                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x156:0xd DW_TAG_member
	.long	.Linfo_string17                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	740                             @ DW_AT_decl_line
	.byte	40                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x163:0xd DW_TAG_member
	.long	.Linfo_string18                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	741                             @ DW_AT_decl_line
	.byte	44                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x170:0xd DW_TAG_member
	.long	.Linfo_string19                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	742                             @ DW_AT_decl_line
	.byte	48                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x17d:0xd DW_TAG_member
	.long	.Linfo_string20                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	743                             @ DW_AT_decl_line
	.byte	52                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x18a:0xd DW_TAG_member
	.long	.Linfo_string21                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	744                             @ DW_AT_decl_line
	.byte	56                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x197:0xd DW_TAG_member
	.long	.Linfo_string22                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	745                             @ DW_AT_decl_line
	.byte	60                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1a4:0xd DW_TAG_member
	.long	.Linfo_string23                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	746                             @ DW_AT_decl_line
	.byte	64                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1b1:0xd DW_TAG_member
	.long	.Linfo_string24                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	747                             @ DW_AT_decl_line
	.byte	68                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1be:0xd DW_TAG_member
	.long	.Linfo_string25                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	748                             @ DW_AT_decl_line
	.byte	72                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1cb:0xd DW_TAG_member
	.long	.Linfo_string26                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	749                             @ DW_AT_decl_line
	.byte	76                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1d8:0xd DW_TAG_member
	.long	.Linfo_string27                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	750                             @ DW_AT_decl_line
	.byte	80                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	7                               @ Abbrev [7] 0x1e6:0x5 DW_TAG_volatile_type
	.long	491                             @ DW_AT_type
	.byte	8                               @ Abbrev [8] 0x1eb:0xb DW_TAG_typedef
	.long	502                             @ DW_AT_type
	.long	.Linfo_string7                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	64                              @ DW_AT_decl_line
	.byte	9                               @ Abbrev [9] 0x1f6:0x7 DW_TAG_base_type
	.long	.Linfo_string6                  @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	8                               @ Abbrev [8] 0x1fd:0xb DW_TAG_typedef
	.long	520                             @ DW_AT_type
	.long	.Linfo_string36                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	74                              @ DW_AT_decl_line
	.byte	10                              @ Abbrev [10] 0x208:0x4d DW_TAG_structure_type
	.byte	24                              @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.byte	46                              @ DW_AT_decl_line
	.byte	11                              @ Abbrev [11] 0x20c:0xc DW_TAG_member
	.long	.Linfo_string30                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x218:0xc DW_TAG_member
	.long	.Linfo_string31                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	51                              @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x224:0xc DW_TAG_member
	.long	.Linfo_string32                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	54                              @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x230:0xc DW_TAG_member
	.long	.Linfo_string33                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	58                              @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x23c:0xc DW_TAG_member
	.long	.Linfo_string34                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	61                              @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x248:0xc DW_TAG_member
	.long	.Linfo_string35                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	72                              @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	3                               @ Abbrev [3] 0x255:0xc DW_TAG_typedef
	.long	609                             @ DW_AT_type
	.long	.Linfo_string44                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.short	329                             @ DW_AT_decl_line
	.byte	12                              @ Abbrev [12] 0x261:0x28 DW_TAG_enumeration_type
	.long	649                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.short	322                             @ DW_AT_decl_line
	.byte	13                              @ Abbrev [13] 0x26a:0x6 DW_TAG_enumerator
	.long	.Linfo_string39                 @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x270:0x6 DW_TAG_enumerator
	.long	.Linfo_string40                 @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x276:0x6 DW_TAG_enumerator
	.long	.Linfo_string41                 @ DW_AT_name
	.byte	4                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x27c:0x6 DW_TAG_enumerator
	.long	.Linfo_string42                 @ DW_AT_name
	.byte	8                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x282:0x6 DW_TAG_enumerator
	.long	.Linfo_string43                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0x289:0x7 DW_TAG_base_type
	.long	.Linfo_string38                 @ DW_AT_name
	.byte	8                               @ DW_AT_encoding
	.byte	1                               @ DW_AT_byte_size
	.byte	14                              @ Abbrev [14] 0x290:0xc DW_TAG_array_type
	.long	668                             @ DW_AT_type
	.byte	15                              @ Abbrev [15] 0x295:0x6 DW_TAG_subrange_type
	.long	1233                            @ DW_AT_type
	.byte	7                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0x29c:0x5 DW_TAG_pointer_type
	.long	673                             @ DW_AT_type
	.byte	8                               @ Abbrev [8] 0x2a1:0xb DW_TAG_typedef
	.long	684                             @ DW_AT_type
	.long	.Linfo_string88                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	168                             @ DW_AT_decl_line
	.byte	16                              @ Abbrev [16] 0x2ac:0xb1 DW_TAG_structure_type
	.long	.Linfo_string87                 @ DW_AT_name
	.byte	96                              @ DW_AT_byte_size
	.byte	4                               @ DW_AT_decl_file
	.byte	138                             @ DW_AT_decl_line
	.byte	11                              @ Abbrev [11] 0x2b4:0xc DW_TAG_member
	.long	.Linfo_string4                  @ DW_AT_name
	.long	861                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	140                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2c0:0xc DW_TAG_member
	.long	.Linfo_string29                 @ DW_AT_name
	.long	962                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	142                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2cc:0xc DW_TAG_member
	.long	.Linfo_string65                 @ DW_AT_name
	.long	1122                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	144                             @ DW_AT_decl_line
	.byte	52                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2d8:0xc DW_TAG_member
	.long	.Linfo_string69                 @ DW_AT_name
	.long	1154                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	146                             @ DW_AT_decl_line
	.byte	53                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2e4:0xc DW_TAG_member
	.long	.Linfo_string77                 @ DW_AT_name
	.long	1215                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	148                             @ DW_AT_decl_line
	.byte	56                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2f0:0xc DW_TAG_member
	.long	.Linfo_string78                 @ DW_AT_name
	.long	1216                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	150                             @ DW_AT_decl_line
	.byte	60                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2fc:0xc DW_TAG_member
	.long	.Linfo_string79                 @ DW_AT_name
	.long	1216                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	152                             @ DW_AT_decl_line
	.byte	64                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x308:0xc DW_TAG_member
	.long	.Linfo_string80                 @ DW_AT_name
	.long	1216                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	154                             @ DW_AT_decl_line
	.byte	68                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x314:0xc DW_TAG_member
	.long	.Linfo_string81                 @ DW_AT_name
	.long	1216                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	156                             @ DW_AT_decl_line
	.byte	72                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x320:0xc DW_TAG_member
	.long	.Linfo_string82                 @ DW_AT_name
	.long	1216                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	158                             @ DW_AT_decl_line
	.byte	76                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x32c:0xc DW_TAG_member
	.long	.Linfo_string83                 @ DW_AT_name
	.long	1216                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	160                             @ DW_AT_decl_line
	.byte	80                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x338:0xc DW_TAG_member
	.long	.Linfo_string84                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	162                             @ DW_AT_decl_line
	.byte	84                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x344:0xc DW_TAG_member
	.long	.Linfo_string85                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	164                             @ DW_AT_decl_line
	.byte	88                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x350:0xc DW_TAG_member
	.long	.Linfo_string86                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	166                             @ DW_AT_decl_line
	.byte	92                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0x35d:0x5 DW_TAG_pointer_type
	.long	866                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x362:0xc DW_TAG_typedef
	.long	878                             @ DW_AT_type
	.long	.Linfo_string52                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	353                             @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x36e:0x54 DW_TAG_structure_type
	.byte	24                              @ DW_AT_byte_size
	.byte	2                               @ DW_AT_decl_file
	.short	345                             @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x373:0xd DW_TAG_member
	.long	.Linfo_string46                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	347                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x380:0xd DW_TAG_member
	.long	.Linfo_string47                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	348                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x38d:0xd DW_TAG_member
	.long	.Linfo_string48                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	349                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x39a:0xd DW_TAG_member
	.long	.Linfo_string49                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	350                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x3a7:0xd DW_TAG_member
	.long	.Linfo_string50                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	351                             @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x3b4:0xd DW_TAG_member
	.long	.Linfo_string51                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	352                             @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x3c2:0xb DW_TAG_typedef
	.long	973                             @ DW_AT_type
	.long	.Linfo_string64                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	96                              @ DW_AT_decl_line
	.byte	10                              @ Abbrev [10] 0x3cd:0x95 DW_TAG_structure_type
	.byte	48                              @ DW_AT_byte_size
	.byte	4                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
	.byte	11                              @ Abbrev [11] 0x3d1:0xc DW_TAG_member
	.long	.Linfo_string37                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	50                              @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x3dd:0xc DW_TAG_member
	.long	.Linfo_string53                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	53                              @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x3e9:0xc DW_TAG_member
	.long	.Linfo_string54                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	57                              @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x3f5:0xc DW_TAG_member
	.long	.Linfo_string55                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	60                              @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x401:0xc DW_TAG_member
	.long	.Linfo_string56                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	63                              @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x40d:0xc DW_TAG_member
	.long	.Linfo_string57                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	66                              @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x419:0xc DW_TAG_member
	.long	.Linfo_string58                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	69                              @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x425:0xc DW_TAG_member
	.long	.Linfo_string59                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	74                              @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x431:0xc DW_TAG_member
	.long	.Linfo_string60                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	77                              @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x43d:0xc DW_TAG_member
	.long	.Linfo_string61                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	82                              @ DW_AT_decl_line
	.byte	36                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x449:0xc DW_TAG_member
	.long	.Linfo_string62                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	85                              @ DW_AT_decl_line
	.byte	40                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x455:0xc DW_TAG_member
	.long	.Linfo_string63                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	91                              @ DW_AT_decl_line
	.byte	44                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x462:0xb DW_TAG_typedef
	.long	1133                            @ DW_AT_type
	.long	.Linfo_string68                 @ DW_AT_name
	.byte	5                               @ DW_AT_decl_file
	.byte	53                              @ DW_AT_decl_line
	.byte	17                              @ Abbrev [17] 0x46d:0x15 DW_TAG_enumeration_type
	.long	649                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	5                               @ DW_AT_decl_file
	.byte	49                              @ DW_AT_decl_line
	.byte	13                              @ Abbrev [13] 0x475:0x6 DW_TAG_enumerator
	.long	.Linfo_string66                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x47b:0x6 DW_TAG_enumerator
	.long	.Linfo_string67                 @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	7                               @ Abbrev [7] 0x482:0x5 DW_TAG_volatile_type
	.long	1159                            @ DW_AT_type
	.byte	8                               @ Abbrev [8] 0x487:0xb DW_TAG_typedef
	.long	1170                            @ DW_AT_type
	.long	.Linfo_string76                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	110                             @ DW_AT_decl_line
	.byte	17                              @ Abbrev [17] 0x492:0x2d DW_TAG_enumeration_type
	.long	649                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	4                               @ DW_AT_decl_file
	.byte	102                             @ DW_AT_decl_line
	.byte	13                              @ Abbrev [13] 0x49a:0x6 DW_TAG_enumerator
	.long	.Linfo_string70                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x4a0:0x6 DW_TAG_enumerator
	.long	.Linfo_string71                 @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x4a6:0x6 DW_TAG_enumerator
	.long	.Linfo_string72                 @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x4ac:0x6 DW_TAG_enumerator
	.long	.Linfo_string73                 @ DW_AT_name
	.byte	3                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x4b2:0x6 DW_TAG_enumerator
	.long	.Linfo_string74                 @ DW_AT_name
	.byte	4                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x4b8:0x6 DW_TAG_enumerator
	.long	.Linfo_string75                 @ DW_AT_name
	.byte	5                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	18                              @ Abbrev [18] 0x4bf:0x1 DW_TAG_pointer_type
	.byte	6                               @ Abbrev [6] 0x4c0:0x5 DW_TAG_pointer_type
	.long	1221                            @ DW_AT_type
	.byte	19                              @ Abbrev [19] 0x4c5:0x7 DW_TAG_subroutine_type
                                        @ DW_AT_prototyped
	.byte	20                              @ Abbrev [20] 0x4c6:0x5 DW_TAG_formal_parameter
	.long	1228                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0x4cc:0x5 DW_TAG_pointer_type
	.long	684                             @ DW_AT_type
	.byte	21                              @ Abbrev [21] 0x4d1:0x7 DW_TAG_base_type
	.long	.Linfo_string89                 @ DW_AT_name
	.byte	8                               @ DW_AT_byte_size
	.byte	7                               @ DW_AT_encoding
	.byte	7                               @ Abbrev [7] 0x4d8:0x5 DW_TAG_volatile_type
	.long	1245                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x4dd:0xc DW_TAG_typedef
	.long	1257                            @ DW_AT_type
	.long	.Linfo_string95                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.short	297                             @ DW_AT_decl_line
	.byte	12                              @ Abbrev [12] 0x4e9:0x28 DW_TAG_enumeration_type
	.long	649                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.short	290                             @ DW_AT_decl_line
	.byte	13                              @ Abbrev [13] 0x4f2:0x6 DW_TAG_enumerator
	.long	.Linfo_string90                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x4f8:0x6 DW_TAG_enumerator
	.long	.Linfo_string91                 @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x4fe:0x6 DW_TAG_enumerator
	.long	.Linfo_string92                 @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x504:0x6 DW_TAG_enumerator
	.long	.Linfo_string93                 @ DW_AT_name
	.byte	3                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x50a:0x6 DW_TAG_enumerator
	.long	.Linfo_string94                 @ DW_AT_name
	.byte	4                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	14                              @ Abbrev [14] 0x511:0xc DW_TAG_array_type
	.long	1309                            @ DW_AT_type
	.byte	15                              @ Abbrev [15] 0x516:0x6 DW_TAG_subrange_type
	.long	1233                            @ DW_AT_type
	.byte	4                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	7                               @ Abbrev [7] 0x51d:0x5 DW_TAG_volatile_type
	.long	1314                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x522:0xc DW_TAG_typedef
	.long	1326                            @ DW_AT_type
	.long	.Linfo_string100                @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.short	307                             @ DW_AT_decl_line
	.byte	12                              @ Abbrev [12] 0x52e:0x1c DW_TAG_enumeration_type
	.long	649                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.short	302                             @ DW_AT_decl_line
	.byte	13                              @ Abbrev [13] 0x537:0x6 DW_TAG_enumerator
	.long	.Linfo_string97                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x53d:0x6 DW_TAG_enumerator
	.long	.Linfo_string98                 @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x543:0x6 DW_TAG_enumerator
	.long	.Linfo_string99                 @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	7                               @ Abbrev [7] 0x54a:0x5 DW_TAG_volatile_type
	.long	1359                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x54f:0xc DW_TAG_typedef
	.long	1371                            @ DW_AT_type
	.long	.Linfo_string106                @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.short	317                             @ DW_AT_decl_line
	.byte	12                              @ Abbrev [12] 0x55b:0x1c DW_TAG_enumeration_type
	.long	649                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.short	312                             @ DW_AT_decl_line
	.byte	13                              @ Abbrev [13] 0x564:0x6 DW_TAG_enumerator
	.long	.Linfo_string103                @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x56a:0x6 DW_TAG_enumerator
	.long	.Linfo_string104                @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x570:0x6 DW_TAG_enumerator
	.long	.Linfo_string105                @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	2                               @ Abbrev [2] 0x577:0x11 DW_TAG_variable
	.long	.Linfo_string108                @ DW_AT_name
	.long	55                              @ DW_AT_type
                                        @ DW_AT_external
	.byte	6                               @ DW_AT_decl_file
	.byte	42                              @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	htim4
	.byte	2                               @ Abbrev [2] 0x588:0x11 DW_TAG_variable
	.long	.Linfo_string109                @ DW_AT_name
	.long	55                              @ DW_AT_type
                                        @ DW_AT_external
	.byte	6                               @ DW_AT_decl_file
	.byte	43                              @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	htim8
	.byte	2                               @ Abbrev [2] 0x599:0x11 DW_TAG_variable
	.long	.Linfo_string110                @ DW_AT_name
	.long	55                              @ DW_AT_type
                                        @ DW_AT_external
	.byte	6                               @ DW_AT_decl_file
	.byte	44                              @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	htim9
	.byte	17                              @ Abbrev [17] 0x5aa:0x21 DW_TAG_enumeration_type
	.long	649                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	5                               @ DW_AT_decl_file
	.byte	38                              @ DW_AT_decl_line
	.byte	13                              @ Abbrev [13] 0x5b2:0x6 DW_TAG_enumerator
	.long	.Linfo_string111                @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x5b8:0x6 DW_TAG_enumerator
	.long	.Linfo_string112                @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x5be:0x6 DW_TAG_enumerator
	.long	.Linfo_string113                @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	13                              @ Abbrev [13] 0x5c4:0x6 DW_TAG_enumerator
	.long	.Linfo_string114                @ DW_AT_name
	.byte	3                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	17                              @ Abbrev [17] 0x5cb:0x230 DW_TAG_enumeration_type
	.long	2043                            @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	2                               @ DW_AT_decl_file
	.byte	65                              @ DW_AT_decl_line
	.byte	22                              @ Abbrev [22] 0x5d3:0x6 DW_TAG_enumerator
	.long	.Linfo_string116                @ DW_AT_name
	.byte	114                             @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x5d9:0x6 DW_TAG_enumerator
	.long	.Linfo_string117                @ DW_AT_name
	.byte	116                             @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x5df:0x6 DW_TAG_enumerator
	.long	.Linfo_string118                @ DW_AT_name
	.byte	117                             @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x5e5:0x6 DW_TAG_enumerator
	.long	.Linfo_string119                @ DW_AT_name
	.byte	118                             @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x5eb:0x6 DW_TAG_enumerator
	.long	.Linfo_string120                @ DW_AT_name
	.byte	123                             @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x5f1:0x6 DW_TAG_enumerator
	.long	.Linfo_string121                @ DW_AT_name
	.byte	124                             @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x5f7:0x6 DW_TAG_enumerator
	.long	.Linfo_string122                @ DW_AT_name
	.byte	126                             @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x5fd:0x6 DW_TAG_enumerator
	.long	.Linfo_string123                @ DW_AT_name
	.byte	127                             @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x603:0x6 DW_TAG_enumerator
	.long	.Linfo_string124                @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x609:0x6 DW_TAG_enumerator
	.long	.Linfo_string125                @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x60f:0x6 DW_TAG_enumerator
	.long	.Linfo_string126                @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x615:0x6 DW_TAG_enumerator
	.long	.Linfo_string127                @ DW_AT_name
	.byte	3                               @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x61b:0x6 DW_TAG_enumerator
	.long	.Linfo_string128                @ DW_AT_name
	.byte	4                               @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x621:0x6 DW_TAG_enumerator
	.long	.Linfo_string129                @ DW_AT_name
	.byte	5                               @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x627:0x6 DW_TAG_enumerator
	.long	.Linfo_string130                @ DW_AT_name
	.byte	6                               @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x62d:0x6 DW_TAG_enumerator
	.long	.Linfo_string131                @ DW_AT_name
	.byte	7                               @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x633:0x6 DW_TAG_enumerator
	.long	.Linfo_string132                @ DW_AT_name
	.byte	8                               @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x639:0x6 DW_TAG_enumerator
	.long	.Linfo_string133                @ DW_AT_name
	.byte	9                               @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x63f:0x6 DW_TAG_enumerator
	.long	.Linfo_string134                @ DW_AT_name
	.byte	10                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x645:0x6 DW_TAG_enumerator
	.long	.Linfo_string135                @ DW_AT_name
	.byte	11                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x64b:0x6 DW_TAG_enumerator
	.long	.Linfo_string136                @ DW_AT_name
	.byte	12                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x651:0x6 DW_TAG_enumerator
	.long	.Linfo_string137                @ DW_AT_name
	.byte	13                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x657:0x6 DW_TAG_enumerator
	.long	.Linfo_string138                @ DW_AT_name
	.byte	14                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x65d:0x6 DW_TAG_enumerator
	.long	.Linfo_string139                @ DW_AT_name
	.byte	15                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x663:0x6 DW_TAG_enumerator
	.long	.Linfo_string140                @ DW_AT_name
	.byte	16                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x669:0x6 DW_TAG_enumerator
	.long	.Linfo_string141                @ DW_AT_name
	.byte	17                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x66f:0x6 DW_TAG_enumerator
	.long	.Linfo_string142                @ DW_AT_name
	.byte	18                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x675:0x6 DW_TAG_enumerator
	.long	.Linfo_string143                @ DW_AT_name
	.byte	19                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x67b:0x6 DW_TAG_enumerator
	.long	.Linfo_string144                @ DW_AT_name
	.byte	20                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x681:0x6 DW_TAG_enumerator
	.long	.Linfo_string145                @ DW_AT_name
	.byte	21                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x687:0x6 DW_TAG_enumerator
	.long	.Linfo_string146                @ DW_AT_name
	.byte	22                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x68d:0x6 DW_TAG_enumerator
	.long	.Linfo_string147                @ DW_AT_name
	.byte	23                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x693:0x6 DW_TAG_enumerator
	.long	.Linfo_string148                @ DW_AT_name
	.byte	24                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x699:0x6 DW_TAG_enumerator
	.long	.Linfo_string149                @ DW_AT_name
	.byte	25                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x69f:0x6 DW_TAG_enumerator
	.long	.Linfo_string150                @ DW_AT_name
	.byte	26                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6a5:0x6 DW_TAG_enumerator
	.long	.Linfo_string151                @ DW_AT_name
	.byte	27                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6ab:0x6 DW_TAG_enumerator
	.long	.Linfo_string152                @ DW_AT_name
	.byte	28                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6b1:0x6 DW_TAG_enumerator
	.long	.Linfo_string153                @ DW_AT_name
	.byte	29                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6b7:0x6 DW_TAG_enumerator
	.long	.Linfo_string154                @ DW_AT_name
	.byte	30                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6bd:0x6 DW_TAG_enumerator
	.long	.Linfo_string155                @ DW_AT_name
	.byte	31                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6c3:0x6 DW_TAG_enumerator
	.long	.Linfo_string156                @ DW_AT_name
	.byte	32                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6c9:0x6 DW_TAG_enumerator
	.long	.Linfo_string157                @ DW_AT_name
	.byte	33                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6cf:0x6 DW_TAG_enumerator
	.long	.Linfo_string158                @ DW_AT_name
	.byte	34                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6d5:0x6 DW_TAG_enumerator
	.long	.Linfo_string159                @ DW_AT_name
	.byte	35                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6db:0x6 DW_TAG_enumerator
	.long	.Linfo_string160                @ DW_AT_name
	.byte	36                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6e1:0x6 DW_TAG_enumerator
	.long	.Linfo_string161                @ DW_AT_name
	.byte	37                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6e7:0x6 DW_TAG_enumerator
	.long	.Linfo_string162                @ DW_AT_name
	.byte	38                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6ed:0x6 DW_TAG_enumerator
	.long	.Linfo_string163                @ DW_AT_name
	.byte	39                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6f3:0x6 DW_TAG_enumerator
	.long	.Linfo_string164                @ DW_AT_name
	.byte	40                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6f9:0x6 DW_TAG_enumerator
	.long	.Linfo_string165                @ DW_AT_name
	.byte	41                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x6ff:0x6 DW_TAG_enumerator
	.long	.Linfo_string166                @ DW_AT_name
	.byte	42                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x705:0x6 DW_TAG_enumerator
	.long	.Linfo_string167                @ DW_AT_name
	.byte	43                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x70b:0x6 DW_TAG_enumerator
	.long	.Linfo_string168                @ DW_AT_name
	.byte	44                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x711:0x6 DW_TAG_enumerator
	.long	.Linfo_string169                @ DW_AT_name
	.byte	45                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x717:0x6 DW_TAG_enumerator
	.long	.Linfo_string170                @ DW_AT_name
	.byte	46                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x71d:0x6 DW_TAG_enumerator
	.long	.Linfo_string171                @ DW_AT_name
	.byte	47                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x723:0x6 DW_TAG_enumerator
	.long	.Linfo_string172                @ DW_AT_name
	.byte	48                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x729:0x6 DW_TAG_enumerator
	.long	.Linfo_string173                @ DW_AT_name
	.byte	49                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x72f:0x6 DW_TAG_enumerator
	.long	.Linfo_string174                @ DW_AT_name
	.byte	50                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x735:0x6 DW_TAG_enumerator
	.long	.Linfo_string175                @ DW_AT_name
	.byte	51                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x73b:0x6 DW_TAG_enumerator
	.long	.Linfo_string176                @ DW_AT_name
	.byte	52                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x741:0x6 DW_TAG_enumerator
	.long	.Linfo_string177                @ DW_AT_name
	.byte	53                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x747:0x6 DW_TAG_enumerator
	.long	.Linfo_string178                @ DW_AT_name
	.byte	54                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x74d:0x6 DW_TAG_enumerator
	.long	.Linfo_string179                @ DW_AT_name
	.byte	55                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x753:0x6 DW_TAG_enumerator
	.long	.Linfo_string180                @ DW_AT_name
	.byte	56                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x759:0x6 DW_TAG_enumerator
	.long	.Linfo_string181                @ DW_AT_name
	.byte	57                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x75f:0x6 DW_TAG_enumerator
	.long	.Linfo_string182                @ DW_AT_name
	.byte	58                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x765:0x6 DW_TAG_enumerator
	.long	.Linfo_string183                @ DW_AT_name
	.byte	59                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x76b:0x6 DW_TAG_enumerator
	.long	.Linfo_string184                @ DW_AT_name
	.byte	60                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x771:0x6 DW_TAG_enumerator
	.long	.Linfo_string185                @ DW_AT_name
	.byte	61                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x777:0x6 DW_TAG_enumerator
	.long	.Linfo_string186                @ DW_AT_name
	.byte	62                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x77d:0x6 DW_TAG_enumerator
	.long	.Linfo_string187                @ DW_AT_name
	.byte	63                              @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x783:0x7 DW_TAG_enumerator
	.long	.Linfo_string188                @ DW_AT_name
	.asciz	"\300"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x78a:0x7 DW_TAG_enumerator
	.long	.Linfo_string189                @ DW_AT_name
	.asciz	"\301"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x791:0x7 DW_TAG_enumerator
	.long	.Linfo_string190                @ DW_AT_name
	.asciz	"\302"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x798:0x7 DW_TAG_enumerator
	.long	.Linfo_string191                @ DW_AT_name
	.asciz	"\303"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x79f:0x7 DW_TAG_enumerator
	.long	.Linfo_string192                @ DW_AT_name
	.asciz	"\304"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x7a6:0x7 DW_TAG_enumerator
	.long	.Linfo_string193                @ DW_AT_name
	.asciz	"\305"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x7ad:0x7 DW_TAG_enumerator
	.long	.Linfo_string194                @ DW_AT_name
	.asciz	"\306"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x7b4:0x7 DW_TAG_enumerator
	.long	.Linfo_string195                @ DW_AT_name
	.asciz	"\307"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x7bb:0x7 DW_TAG_enumerator
	.long	.Linfo_string196                @ DW_AT_name
	.asciz	"\310"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x7c2:0x7 DW_TAG_enumerator
	.long	.Linfo_string197                @ DW_AT_name
	.asciz	"\311"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x7c9:0x7 DW_TAG_enumerator
	.long	.Linfo_string198                @ DW_AT_name
	.asciz	"\312"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x7d0:0x7 DW_TAG_enumerator
	.long	.Linfo_string199                @ DW_AT_name
	.asciz	"\313"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x7d7:0x7 DW_TAG_enumerator
	.long	.Linfo_string200                @ DW_AT_name
	.asciz	"\314"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x7de:0x7 DW_TAG_enumerator
	.long	.Linfo_string201                @ DW_AT_name
	.asciz	"\315"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x7e5:0x7 DW_TAG_enumerator
	.long	.Linfo_string202                @ DW_AT_name
	.asciz	"\316"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x7ec:0x7 DW_TAG_enumerator
	.long	.Linfo_string203                @ DW_AT_name
	.asciz	"\320"                          @ DW_AT_const_value
	.byte	22                              @ Abbrev [22] 0x7f3:0x7 DW_TAG_enumerator
	.long	.Linfo_string204                @ DW_AT_name
	.asciz	"\321"                          @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0x7fb:0x7 DW_TAG_base_type
	.long	.Linfo_string115                @ DW_AT_name
	.byte	6                               @ DW_AT_encoding
	.byte	1                               @ DW_AT_byte_size
	.byte	6                               @ Abbrev [6] 0x802:0x5 DW_TAG_pointer_type
	.long	2055                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x807:0xc DW_TAG_typedef
	.long	2067                            @ DW_AT_type
	.long	.Linfo_string234                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	628                             @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x813:0x18c DW_TAG_structure_type
	.byte	136                             @ DW_AT_byte_size
	.byte	2                               @ DW_AT_decl_file
	.short	596                             @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x818:0xd DW_TAG_member
	.long	.Linfo_string46                 @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	598                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x825:0xd DW_TAG_member
	.long	.Linfo_string205                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	599                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x832:0xd DW_TAG_member
	.long	.Linfo_string206                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	600                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x83f:0xd DW_TAG_member
	.long	.Linfo_string207                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	601                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x84c:0xd DW_TAG_member
	.long	.Linfo_string208                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	602                             @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x859:0xd DW_TAG_member
	.long	.Linfo_string209                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	603                             @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x866:0xd DW_TAG_member
	.long	.Linfo_string210                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	604                             @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x873:0xd DW_TAG_member
	.long	.Linfo_string211                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	605                             @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x880:0xd DW_TAG_member
	.long	.Linfo_string212                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	606                             @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x88d:0xd DW_TAG_member
	.long	.Linfo_string213                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	607                             @ DW_AT_decl_line
	.byte	36                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x89a:0xd DW_TAG_member
	.long	.Linfo_string214                @ DW_AT_name
	.long	2463                            @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	608                             @ DW_AT_decl_line
	.byte	40                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x8a7:0xd DW_TAG_member
	.long	.Linfo_string215                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	609                             @ DW_AT_decl_line
	.byte	48                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x8b4:0xd DW_TAG_member
	.long	.Linfo_string216                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	610                             @ DW_AT_decl_line
	.byte	52                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x8c1:0xd DW_TAG_member
	.long	.Linfo_string217                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	611                             @ DW_AT_decl_line
	.byte	56                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x8ce:0xd DW_TAG_member
	.long	.Linfo_string218                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	612                             @ DW_AT_decl_line
	.byte	60                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x8db:0xd DW_TAG_member
	.long	.Linfo_string219                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	613                             @ DW_AT_decl_line
	.byte	64                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x8e8:0xd DW_TAG_member
	.long	.Linfo_string220                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	614                             @ DW_AT_decl_line
	.byte	68                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x8f5:0xd DW_TAG_member
	.long	.Linfo_string221                @ DW_AT_name
	.long	2463                            @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	615                             @ DW_AT_decl_line
	.byte	72                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x902:0xd DW_TAG_member
	.long	.Linfo_string222                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	616                             @ DW_AT_decl_line
	.byte	80                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x90f:0xd DW_TAG_member
	.long	.Linfo_string223                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	617                             @ DW_AT_decl_line
	.byte	84                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x91c:0xd DW_TAG_member
	.long	.Linfo_string224                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	618                             @ DW_AT_decl_line
	.byte	88                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x929:0xd DW_TAG_member
	.long	.Linfo_string225                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	619                             @ DW_AT_decl_line
	.byte	92                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x936:0xd DW_TAG_member
	.long	.Linfo_string226                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	620                             @ DW_AT_decl_line
	.byte	96                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x943:0xd DW_TAG_member
	.long	.Linfo_string227                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	621                             @ DW_AT_decl_line
	.byte	100                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x950:0xd DW_TAG_member
	.long	.Linfo_string228                @ DW_AT_name
	.long	2463                            @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	622                             @ DW_AT_decl_line
	.byte	104                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x95d:0xd DW_TAG_member
	.long	.Linfo_string229                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	623                             @ DW_AT_decl_line
	.byte	112                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x96a:0xd DW_TAG_member
	.long	.Linfo_string230                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	624                             @ DW_AT_decl_line
	.byte	116                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x977:0xd DW_TAG_member
	.long	.Linfo_string231                @ DW_AT_name
	.long	2463                            @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	625                             @ DW_AT_decl_line
	.byte	120                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x984:0xd DW_TAG_member
	.long	.Linfo_string232                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	626                             @ DW_AT_decl_line
	.byte	128                             @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x991:0xd DW_TAG_member
	.long	.Linfo_string233                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	627                             @ DW_AT_decl_line
	.byte	132                             @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	14                              @ Abbrev [14] 0x99f:0xc DW_TAG_array_type
	.long	491                             @ DW_AT_type
	.byte	15                              @ Abbrev [15] 0x9a4:0x6 DW_TAG_subrange_type
	.long	1233                            @ DW_AT_type
	.byte	2                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x9ab:0xb DW_TAG_typedef
	.long	2486                            @ DW_AT_type
	.long	.Linfo_string236                @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	63                              @ DW_AT_decl_line
	.byte	9                               @ Abbrev [9] 0x9b6:0x7 DW_TAG_base_type
	.long	.Linfo_string235                @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	2                               @ DW_AT_byte_size
	.byte	8                               @ Abbrev [8] 0x9bd:0xb DW_TAG_typedef
	.long	649                             @ DW_AT_type
	.long	.Linfo_string237                @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	62                              @ DW_AT_decl_line
	.byte	6                               @ Abbrev [6] 0x9c8:0x5 DW_TAG_pointer_type
	.long	2509                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x9cd:0xc DW_TAG_typedef
	.long	2521                            @ DW_AT_type
	.long	.Linfo_string247                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	537                             @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x9d9:0x7b DW_TAG_structure_type
	.byte	40                              @ DW_AT_byte_size
	.byte	2                               @ DW_AT_decl_file
	.short	526                             @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x9de:0xd DW_TAG_member
	.long	.Linfo_string238                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	528                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x9eb:0xd DW_TAG_member
	.long	.Linfo_string239                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	529                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x9f8:0xd DW_TAG_member
	.long	.Linfo_string240                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	530                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xa05:0xd DW_TAG_member
	.long	.Linfo_string241                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	531                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xa12:0xd DW_TAG_member
	.long	.Linfo_string242                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	532                             @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xa1f:0xd DW_TAG_member
	.long	.Linfo_string243                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	533                             @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xa2c:0xd DW_TAG_member
	.long	.Linfo_string244                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	534                             @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xa39:0xd DW_TAG_member
	.long	.Linfo_string245                @ DW_AT_name
	.long	486                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	535                             @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xa46:0xd DW_TAG_member
	.long	.Linfo_string246                @ DW_AT_name
	.long	2644                            @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	536                             @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	14                              @ Abbrev [14] 0xa54:0xc DW_TAG_array_type
	.long	486                             @ DW_AT_type
	.byte	15                              @ Abbrev [15] 0xa59:0x6 DW_TAG_subrange_type
	.long	1233                            @ DW_AT_type
	.byte	2                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	23                              @ Abbrev [23] 0xa60:0x3c DW_TAG_subprogram
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string248                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	47                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	24                              @ Abbrev [24] 0xa71:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	40
	.long	.Linfo_string255                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	54                              @ DW_AT_decl_line
	.long	3190                            @ DW_AT_type
	.byte	24                              @ Abbrev [24] 0xa7f:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	32
	.long	.Linfo_string261                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	55                              @ DW_AT_decl_line
	.long	3254                            @ DW_AT_type
	.byte	24                              @ Abbrev [24] 0xa8d:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.long	.Linfo_string265                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	56                              @ DW_AT_decl_line
	.long	3294                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	25                              @ Abbrev [25] 0xa9c:0x7c DW_TAG_subprogram
	.long	.Lfunc_begin1                   @ DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string249                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	347                             @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	26                              @ Abbrev [26] 0xaae:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	36
	.long	.Linfo_string274                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	347                             @ DW_AT_decl_line
	.long	3394                            @ DW_AT_type
	.byte	27                              @ Abbrev [27] 0xabd:0xf DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	16
	.long	.Linfo_string275                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	350                             @ DW_AT_decl_line
	.long	3399                            @ DW_AT_type
	.byte	28                              @ Abbrev [28] 0xacc:0x19 DW_TAG_lexical_block
	.long	.Ltmp25                         @ DW_AT_low_pc
	.long	.Ltmp26-.Ltmp25                 @ DW_AT_high_pc
	.byte	27                              @ Abbrev [27] 0xad5:0xf DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	12
	.long	.Linfo_string281                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	356                             @ DW_AT_decl_line
	.long	486                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	28                              @ Abbrev [28] 0xae5:0x19 DW_TAG_lexical_block
	.long	.Ltmp30                         @ DW_AT_low_pc
	.long	.Ltmp31-.Ltmp30                 @ DW_AT_high_pc
	.byte	27                              @ Abbrev [27] 0xaee:0xf DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	8
	.long	.Linfo_string281                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	377                             @ DW_AT_decl_line
	.long	486                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	28                              @ Abbrev [28] 0xafe:0x19 DW_TAG_lexical_block
	.long	.Ltmp35                         @ DW_AT_low_pc
	.long	.Ltmp36-.Ltmp35                 @ DW_AT_high_pc
	.byte	27                              @ Abbrev [27] 0xb07:0xf DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.long	.Linfo_string281                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	398                             @ DW_AT_decl_line
	.long	486                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	23                              @ Abbrev [23] 0xb18:0x3c DW_TAG_subprogram
	.long	.Lfunc_begin2                   @ DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string250                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	101                             @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	24                              @ Abbrev [24] 0xb29:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	40
	.long	.Linfo_string255                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	108                             @ DW_AT_decl_line
	.long	3190                            @ DW_AT_type
	.byte	24                              @ Abbrev [24] 0xb37:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	32
	.long	.Linfo_string261                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	109                             @ DW_AT_decl_line
	.long	3254                            @ DW_AT_type
	.byte	24                              @ Abbrev [24] 0xb45:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.long	.Linfo_string265                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	110                             @ DW_AT_decl_line
	.long	3294                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	23                              @ Abbrev [23] 0xb54:0x4c DW_TAG_subprogram
	.long	.Lfunc_begin3                   @ DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string251                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	154                             @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	24                              @ Abbrev [24] 0xb65:0xf DW_TAG_variable
	.byte	3                               @ DW_AT_location
	.byte	145
	.asciz	"\320"
	.long	.Linfo_string255                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	161                             @ DW_AT_decl_line
	.long	3190                            @ DW_AT_type
	.byte	24                              @ Abbrev [24] 0xb74:0xf DW_TAG_variable
	.byte	3                               @ DW_AT_location
	.byte	145
	.asciz	"\310"
	.long	.Linfo_string261                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	162                             @ DW_AT_decl_line
	.long	3254                            @ DW_AT_type
	.byte	24                              @ Abbrev [24] 0xb83:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	44
	.long	.Linfo_string265                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	163                             @ DW_AT_decl_line
	.long	3294                            @ DW_AT_type
	.byte	24                              @ Abbrev [24] 0xb91:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	12
	.long	.Linfo_string282                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	164                             @ DW_AT_decl_line
	.long	3475                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	23                              @ Abbrev [23] 0xba0:0x2e DW_TAG_subprogram
	.long	.Lfunc_begin4                   @ DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string252                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	224                             @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	24                              @ Abbrev [24] 0xbb1:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	32
	.long	.Linfo_string255                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	231                             @ DW_AT_decl_line
	.long	3190                            @ DW_AT_type
	.byte	24                              @ Abbrev [24] 0xbbf:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.long	.Linfo_string265                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	232                             @ DW_AT_decl_line
	.long	3294                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	25                              @ Abbrev [25] 0xbce:0x86 DW_TAG_subprogram
	.long	.Lfunc_begin5                   @ DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string253                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	287                             @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	26                              @ Abbrev [26] 0xbe0:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	28
	.long	.Linfo_string292                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	287                             @ DW_AT_decl_line
	.long	3394                            @ DW_AT_type
	.byte	28                              @ Abbrev [28] 0xbef:0x19 DW_TAG_lexical_block
	.long	.Ltmp105                        @ DW_AT_low_pc
	.long	.Ltmp106-.Ltmp105               @ DW_AT_high_pc
	.byte	27                              @ Abbrev [27] 0xbf8:0xf DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	24
	.long	.Linfo_string281                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	296                             @ DW_AT_decl_line
	.long	486                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	28                              @ Abbrev [28] 0xc08:0x19 DW_TAG_lexical_block
	.long	.Ltmp110                        @ DW_AT_low_pc
	.long	.Ltmp111-.Ltmp110               @ DW_AT_high_pc
	.byte	27                              @ Abbrev [27] 0xc11:0xf DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	20
	.long	.Linfo_string281                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	311                             @ DW_AT_decl_line
	.long	486                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	28                              @ Abbrev [28] 0xc21:0x19 DW_TAG_lexical_block
	.long	.Ltmp115                        @ DW_AT_low_pc
	.long	.Ltmp116-.Ltmp115               @ DW_AT_high_pc
	.byte	27                              @ Abbrev [27] 0xc2a:0xf DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	16
	.long	.Linfo_string281                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	326                             @ DW_AT_decl_line
	.long	486                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	28                              @ Abbrev [28] 0xc3a:0x19 DW_TAG_lexical_block
	.long	.Ltmp120                        @ DW_AT_low_pc
	.long	.Ltmp121-.Ltmp120               @ DW_AT_high_pc
	.byte	27                              @ Abbrev [27] 0xc43:0xf DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	12
	.long	.Linfo_string281                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	337                             @ DW_AT_decl_line
	.long	486                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	25                              @ Abbrev [25] 0xc54:0x22 DW_TAG_subprogram
	.long	.Lfunc_begin6                   @ DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string254                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	416                             @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	26                              @ Abbrev [26] 0xc66:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.long	.Linfo_string292                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.short	416                             @ DW_AT_decl_line
	.long	3394                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0xc76:0xb DW_TAG_typedef
	.long	3201                            @ DW_AT_type
	.long	.Linfo_string260                @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	208                             @ DW_AT_decl_line
	.byte	10                              @ Abbrev [10] 0xc81:0x35 DW_TAG_structure_type
	.byte	16                              @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.byte	198                             @ DW_AT_decl_line
	.byte	11                              @ Abbrev [11] 0xc85:0xc DW_TAG_member
	.long	.Linfo_string256                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	200                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xc91:0xc DW_TAG_member
	.long	.Linfo_string257                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	202                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xc9d:0xc DW_TAG_member
	.long	.Linfo_string258                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	204                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xca9:0xc DW_TAG_member
	.long	.Linfo_string259                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	206                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0xcb6:0xb DW_TAG_typedef
	.long	3265                            @ DW_AT_type
	.long	.Linfo_string264                @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	242                             @ DW_AT_decl_line
	.byte	10                              @ Abbrev [10] 0xcc1:0x1d DW_TAG_structure_type
	.byte	8                               @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.byte	231                             @ DW_AT_decl_line
	.byte	11                              @ Abbrev [11] 0xcc5:0xc DW_TAG_member
	.long	.Linfo_string262                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	233                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xcd1:0xc DW_TAG_member
	.long	.Linfo_string263                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	235                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0xcde:0xb DW_TAG_typedef
	.long	3305                            @ DW_AT_type
	.long	.Linfo_string273                @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	106                             @ DW_AT_decl_line
	.byte	10                              @ Abbrev [10] 0xce9:0x59 DW_TAG_structure_type
	.byte	28                              @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.byte	79                              @ DW_AT_decl_line
	.byte	11                              @ Abbrev [11] 0xced:0xc DW_TAG_member
	.long	.Linfo_string266                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	81                              @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xcf9:0xc DW_TAG_member
	.long	.Linfo_string267                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	84                              @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xd05:0xc DW_TAG_member
	.long	.Linfo_string268                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	87                              @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xd11:0xc DW_TAG_member
	.long	.Linfo_string269                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	90                              @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xd1d:0xc DW_TAG_member
	.long	.Linfo_string270                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	94                              @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xd29:0xc DW_TAG_member
	.long	.Linfo_string271                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	99                              @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xd35:0xc DW_TAG_member
	.long	.Linfo_string272                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	103                             @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0xd42:0x5 DW_TAG_pointer_type
	.long	55                              @ DW_AT_type
	.byte	8                               @ Abbrev [8] 0xd47:0xb DW_TAG_typedef
	.long	3410                            @ DW_AT_type
	.long	.Linfo_string280                @ DW_AT_name
	.byte	7                               @ DW_AT_decl_file
	.byte	62                              @ DW_AT_decl_line
	.byte	10                              @ Abbrev [10] 0xd52:0x41 DW_TAG_structure_type
	.byte	20                              @ DW_AT_byte_size
	.byte	7                               @ DW_AT_decl_file
	.byte	46                              @ DW_AT_decl_line
	.byte	11                              @ Abbrev [11] 0xd56:0xc DW_TAG_member
	.long	.Linfo_string276                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xd62:0xc DW_TAG_member
	.long	.Linfo_string58                 @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.byte	51                              @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xd6e:0xc DW_TAG_member
	.long	.Linfo_string277                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.byte	54                              @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xd7a:0xc DW_TAG_member
	.long	.Linfo_string278                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.byte	57                              @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xd86:0xc DW_TAG_member
	.long	.Linfo_string279                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.byte	60                              @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	3                               @ Abbrev [3] 0xd93:0xc DW_TAG_typedef
	.long	3487                            @ DW_AT_type
	.long	.Linfo_string291                @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.short	285                             @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0xd9f:0x6e DW_TAG_structure_type
	.byte	32                              @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.short	267                             @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0xda4:0xd DW_TAG_member
	.long	.Linfo_string283                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	269                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xdb1:0xd DW_TAG_member
	.long	.Linfo_string284                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	271                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xdbe:0xd DW_TAG_member
	.long	.Linfo_string285                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	273                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xdcb:0xd DW_TAG_member
	.long	.Linfo_string286                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	275                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xdd8:0xd DW_TAG_member
	.long	.Linfo_string287                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	277                             @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xde5:0xd DW_TAG_member
	.long	.Linfo_string288                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	279                             @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xdf2:0xd DW_TAG_member
	.long	.Linfo_string289                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	281                             @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xdff:0xd DW_TAG_member
	.long	.Linfo_string290                @ DW_AT_name
	.long	491                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	283                             @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
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
	.long	.Lfunc_begin4
	.long	.Lfunc_end4
	.long	.Lfunc_begin5
	.long	.Lfunc_end5
	.long	.Lfunc_begin6
	.long	.Lfunc_end6
	.long	0
	.long	0
	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"Component: Arm Compiler for Embedded 6.19 Tool: armclang [5e73cb00]" @ string offset=0
.Linfo_string1:
	.asciz	"../Core/Src\\tim.c"            @ string offset=68
.Linfo_string2:
	.asciz	"C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" @ string offset=86
.Linfo_string3:
	.asciz	"htim2"                         @ string offset=156
.Linfo_string4:
	.asciz	"Instance"                      @ string offset=162
.Linfo_string5:
	.asciz	"CR1"                           @ string offset=171
.Linfo_string6:
	.asciz	"unsigned int"                  @ string offset=175
.Linfo_string7:
	.asciz	"uint32_t"                      @ string offset=188
.Linfo_string8:
	.asciz	"CR2"                           @ string offset=197
.Linfo_string9:
	.asciz	"SMCR"                          @ string offset=201
.Linfo_string10:
	.asciz	"DIER"                          @ string offset=206
.Linfo_string11:
	.asciz	"SR"                            @ string offset=211
.Linfo_string12:
	.asciz	"EGR"                           @ string offset=214
.Linfo_string13:
	.asciz	"CCMR1"                         @ string offset=218
.Linfo_string14:
	.asciz	"CCMR2"                         @ string offset=224
.Linfo_string15:
	.asciz	"CCER"                          @ string offset=230
.Linfo_string16:
	.asciz	"CNT"                           @ string offset=235
.Linfo_string17:
	.asciz	"PSC"                           @ string offset=239
.Linfo_string18:
	.asciz	"ARR"                           @ string offset=243
.Linfo_string19:
	.asciz	"RCR"                           @ string offset=247
.Linfo_string20:
	.asciz	"CCR1"                          @ string offset=251
.Linfo_string21:
	.asciz	"CCR2"                          @ string offset=256
.Linfo_string22:
	.asciz	"CCR3"                          @ string offset=261
.Linfo_string23:
	.asciz	"CCR4"                          @ string offset=266
.Linfo_string24:
	.asciz	"BDTR"                          @ string offset=271
.Linfo_string25:
	.asciz	"DCR"                           @ string offset=276
.Linfo_string26:
	.asciz	"DMAR"                          @ string offset=280
.Linfo_string27:
	.asciz	"OR"                            @ string offset=285
.Linfo_string28:
	.asciz	"TIM_TypeDef"                   @ string offset=288
.Linfo_string29:
	.asciz	"Init"                          @ string offset=300
.Linfo_string30:
	.asciz	"Prescaler"                     @ string offset=305
.Linfo_string31:
	.asciz	"CounterMode"                   @ string offset=315
.Linfo_string32:
	.asciz	"Period"                        @ string offset=327
.Linfo_string33:
	.asciz	"ClockDivision"                 @ string offset=334
.Linfo_string34:
	.asciz	"RepetitionCounter"             @ string offset=348
.Linfo_string35:
	.asciz	"AutoReloadPreload"             @ string offset=366
.Linfo_string36:
	.asciz	"TIM_Base_InitTypeDef"          @ string offset=384
.Linfo_string37:
	.asciz	"Channel"                       @ string offset=405
.Linfo_string38:
	.asciz	"unsigned char"                 @ string offset=413
.Linfo_string39:
	.asciz	"HAL_TIM_ACTIVE_CHANNEL_1"      @ string offset=427
.Linfo_string40:
	.asciz	"HAL_TIM_ACTIVE_CHANNEL_2"      @ string offset=452
.Linfo_string41:
	.asciz	"HAL_TIM_ACTIVE_CHANNEL_3"      @ string offset=477
.Linfo_string42:
	.asciz	"HAL_TIM_ACTIVE_CHANNEL_4"      @ string offset=502
.Linfo_string43:
	.asciz	"HAL_TIM_ACTIVE_CHANNEL_CLEARED" @ string offset=527
.Linfo_string44:
	.asciz	"HAL_TIM_ActiveChannel"         @ string offset=558
.Linfo_string45:
	.asciz	"hdma"                          @ string offset=580
.Linfo_string46:
	.asciz	"CR"                            @ string offset=585
.Linfo_string47:
	.asciz	"NDTR"                          @ string offset=588
.Linfo_string48:
	.asciz	"PAR"                           @ string offset=593
.Linfo_string49:
	.asciz	"M0AR"                          @ string offset=597
.Linfo_string50:
	.asciz	"M1AR"                          @ string offset=602
.Linfo_string51:
	.asciz	"FCR"                           @ string offset=607
.Linfo_string52:
	.asciz	"DMA_Stream_TypeDef"            @ string offset=611
.Linfo_string53:
	.asciz	"Direction"                     @ string offset=630
.Linfo_string54:
	.asciz	"PeriphInc"                     @ string offset=640
.Linfo_string55:
	.asciz	"MemInc"                        @ string offset=650
.Linfo_string56:
	.asciz	"PeriphDataAlignment"           @ string offset=657
.Linfo_string57:
	.asciz	"MemDataAlignment"              @ string offset=677
.Linfo_string58:
	.asciz	"Mode"                          @ string offset=694
.Linfo_string59:
	.asciz	"Priority"                      @ string offset=699
.Linfo_string60:
	.asciz	"FIFOMode"                      @ string offset=708
.Linfo_string61:
	.asciz	"FIFOThreshold"                 @ string offset=717
.Linfo_string62:
	.asciz	"MemBurst"                      @ string offset=731
.Linfo_string63:
	.asciz	"PeriphBurst"                   @ string offset=740
.Linfo_string64:
	.asciz	"DMA_InitTypeDef"               @ string offset=752
.Linfo_string65:
	.asciz	"Lock"                          @ string offset=768
.Linfo_string66:
	.asciz	"HAL_UNLOCKED"                  @ string offset=773
.Linfo_string67:
	.asciz	"HAL_LOCKED"                    @ string offset=786
.Linfo_string68:
	.asciz	"HAL_LockTypeDef"               @ string offset=797
.Linfo_string69:
	.asciz	"State"                         @ string offset=813
.Linfo_string70:
	.asciz	"HAL_DMA_STATE_RESET"           @ string offset=819
.Linfo_string71:
	.asciz	"HAL_DMA_STATE_READY"           @ string offset=839
.Linfo_string72:
	.asciz	"HAL_DMA_STATE_BUSY"            @ string offset=859
.Linfo_string73:
	.asciz	"HAL_DMA_STATE_TIMEOUT"         @ string offset=878
.Linfo_string74:
	.asciz	"HAL_DMA_STATE_ERROR"           @ string offset=900
.Linfo_string75:
	.asciz	"HAL_DMA_STATE_ABORT"           @ string offset=920
.Linfo_string76:
	.asciz	"HAL_DMA_StateTypeDef"          @ string offset=940
.Linfo_string77:
	.asciz	"Parent"                        @ string offset=961
.Linfo_string78:
	.asciz	"XferCpltCallback"              @ string offset=968
.Linfo_string79:
	.asciz	"XferHalfCpltCallback"          @ string offset=985
.Linfo_string80:
	.asciz	"XferM1CpltCallback"            @ string offset=1006
.Linfo_string81:
	.asciz	"XferM1HalfCpltCallback"        @ string offset=1025
.Linfo_string82:
	.asciz	"XferErrorCallback"             @ string offset=1048
.Linfo_string83:
	.asciz	"XferAbortCallback"             @ string offset=1066
.Linfo_string84:
	.asciz	"ErrorCode"                     @ string offset=1084
.Linfo_string85:
	.asciz	"StreamBaseAddress"             @ string offset=1094
.Linfo_string86:
	.asciz	"StreamIndex"                   @ string offset=1112
.Linfo_string87:
	.asciz	"__DMA_HandleTypeDef"           @ string offset=1124
.Linfo_string88:
	.asciz	"DMA_HandleTypeDef"             @ string offset=1144
.Linfo_string89:
	.asciz	"__ARRAY_SIZE_TYPE__"           @ string offset=1162
.Linfo_string90:
	.asciz	"HAL_TIM_STATE_RESET"           @ string offset=1182
.Linfo_string91:
	.asciz	"HAL_TIM_STATE_READY"           @ string offset=1202
.Linfo_string92:
	.asciz	"HAL_TIM_STATE_BUSY"            @ string offset=1222
.Linfo_string93:
	.asciz	"HAL_TIM_STATE_TIMEOUT"         @ string offset=1241
.Linfo_string94:
	.asciz	"HAL_TIM_STATE_ERROR"           @ string offset=1263
.Linfo_string95:
	.asciz	"HAL_TIM_StateTypeDef"          @ string offset=1283
.Linfo_string96:
	.asciz	"ChannelState"                  @ string offset=1304
.Linfo_string97:
	.asciz	"HAL_TIM_CHANNEL_STATE_RESET"   @ string offset=1317
.Linfo_string98:
	.asciz	"HAL_TIM_CHANNEL_STATE_READY"   @ string offset=1345
.Linfo_string99:
	.asciz	"HAL_TIM_CHANNEL_STATE_BUSY"    @ string offset=1373
.Linfo_string100:
	.asciz	"HAL_TIM_ChannelStateTypeDef"   @ string offset=1400
.Linfo_string101:
	.asciz	"ChannelNState"                 @ string offset=1428
.Linfo_string102:
	.asciz	"DMABurstState"                 @ string offset=1442
.Linfo_string103:
	.asciz	"HAL_DMA_BURST_STATE_RESET"     @ string offset=1456
.Linfo_string104:
	.asciz	"HAL_DMA_BURST_STATE_READY"     @ string offset=1482
.Linfo_string105:
	.asciz	"HAL_DMA_BURST_STATE_BUSY"      @ string offset=1508
.Linfo_string106:
	.asciz	"HAL_TIM_DMABurstStateTypeDef"  @ string offset=1533
.Linfo_string107:
	.asciz	"TIM_HandleTypeDef"             @ string offset=1562
.Linfo_string108:
	.asciz	"htim4"                         @ string offset=1580
.Linfo_string109:
	.asciz	"htim8"                         @ string offset=1586
.Linfo_string110:
	.asciz	"htim9"                         @ string offset=1592
.Linfo_string111:
	.asciz	"HAL_OK"                        @ string offset=1598
.Linfo_string112:
	.asciz	"HAL_ERROR"                     @ string offset=1605
.Linfo_string113:
	.asciz	"HAL_BUSY"                      @ string offset=1615
.Linfo_string114:
	.asciz	"HAL_TIMEOUT"                   @ string offset=1624
.Linfo_string115:
	.asciz	"signed char"                   @ string offset=1636
.Linfo_string116:
	.asciz	"NonMaskableInt_IRQn"           @ string offset=1648
.Linfo_string117:
	.asciz	"MemoryManagement_IRQn"         @ string offset=1668
.Linfo_string118:
	.asciz	"BusFault_IRQn"                 @ string offset=1690
.Linfo_string119:
	.asciz	"UsageFault_IRQn"               @ string offset=1704
.Linfo_string120:
	.asciz	"SVCall_IRQn"                   @ string offset=1720
.Linfo_string121:
	.asciz	"DebugMonitor_IRQn"             @ string offset=1732
.Linfo_string122:
	.asciz	"PendSV_IRQn"                   @ string offset=1750
.Linfo_string123:
	.asciz	"SysTick_IRQn"                  @ string offset=1762
.Linfo_string124:
	.asciz	"WWDG_IRQn"                     @ string offset=1775
.Linfo_string125:
	.asciz	"PVD_IRQn"                      @ string offset=1785
.Linfo_string126:
	.asciz	"TAMP_STAMP_IRQn"               @ string offset=1794
.Linfo_string127:
	.asciz	"RTC_WKUP_IRQn"                 @ string offset=1810
.Linfo_string128:
	.asciz	"FLASH_IRQn"                    @ string offset=1824
.Linfo_string129:
	.asciz	"RCC_IRQn"                      @ string offset=1835
.Linfo_string130:
	.asciz	"EXTI0_IRQn"                    @ string offset=1844
.Linfo_string131:
	.asciz	"EXTI1_IRQn"                    @ string offset=1855
.Linfo_string132:
	.asciz	"EXTI2_IRQn"                    @ string offset=1866
.Linfo_string133:
	.asciz	"EXTI3_IRQn"                    @ string offset=1877
.Linfo_string134:
	.asciz	"EXTI4_IRQn"                    @ string offset=1888
.Linfo_string135:
	.asciz	"DMA1_Stream0_IRQn"             @ string offset=1899
.Linfo_string136:
	.asciz	"DMA1_Stream1_IRQn"             @ string offset=1917
.Linfo_string137:
	.asciz	"DMA1_Stream2_IRQn"             @ string offset=1935
.Linfo_string138:
	.asciz	"DMA1_Stream3_IRQn"             @ string offset=1953
.Linfo_string139:
	.asciz	"DMA1_Stream4_IRQn"             @ string offset=1971
.Linfo_string140:
	.asciz	"DMA1_Stream5_IRQn"             @ string offset=1989
.Linfo_string141:
	.asciz	"DMA1_Stream6_IRQn"             @ string offset=2007
.Linfo_string142:
	.asciz	"ADC_IRQn"                      @ string offset=2025
.Linfo_string143:
	.asciz	"CAN1_TX_IRQn"                  @ string offset=2034
.Linfo_string144:
	.asciz	"CAN1_RX0_IRQn"                 @ string offset=2047
.Linfo_string145:
	.asciz	"CAN1_RX1_IRQn"                 @ string offset=2061
.Linfo_string146:
	.asciz	"CAN1_SCE_IRQn"                 @ string offset=2075
.Linfo_string147:
	.asciz	"EXTI9_5_IRQn"                  @ string offset=2089
.Linfo_string148:
	.asciz	"TIM1_BRK_TIM9_IRQn"            @ string offset=2102
.Linfo_string149:
	.asciz	"TIM1_UP_TIM10_IRQn"            @ string offset=2121
.Linfo_string150:
	.asciz	"TIM1_TRG_COM_TIM11_IRQn"       @ string offset=2140
.Linfo_string151:
	.asciz	"TIM1_CC_IRQn"                  @ string offset=2164
.Linfo_string152:
	.asciz	"TIM2_IRQn"                     @ string offset=2177
.Linfo_string153:
	.asciz	"TIM3_IRQn"                     @ string offset=2187
.Linfo_string154:
	.asciz	"TIM4_IRQn"                     @ string offset=2197
.Linfo_string155:
	.asciz	"I2C1_EV_IRQn"                  @ string offset=2207
.Linfo_string156:
	.asciz	"I2C1_ER_IRQn"                  @ string offset=2220
.Linfo_string157:
	.asciz	"I2C2_EV_IRQn"                  @ string offset=2233
.Linfo_string158:
	.asciz	"I2C2_ER_IRQn"                  @ string offset=2246
.Linfo_string159:
	.asciz	"SPI1_IRQn"                     @ string offset=2259
.Linfo_string160:
	.asciz	"SPI2_IRQn"                     @ string offset=2269
.Linfo_string161:
	.asciz	"USART1_IRQn"                   @ string offset=2279
.Linfo_string162:
	.asciz	"USART2_IRQn"                   @ string offset=2291
.Linfo_string163:
	.asciz	"USART3_IRQn"                   @ string offset=2303
.Linfo_string164:
	.asciz	"EXTI15_10_IRQn"                @ string offset=2315
.Linfo_string165:
	.asciz	"RTC_Alarm_IRQn"                @ string offset=2330
.Linfo_string166:
	.asciz	"OTG_FS_WKUP_IRQn"              @ string offset=2345
.Linfo_string167:
	.asciz	"TIM8_BRK_TIM12_IRQn"           @ string offset=2362
.Linfo_string168:
	.asciz	"TIM8_UP_TIM13_IRQn"            @ string offset=2382
.Linfo_string169:
	.asciz	"TIM8_TRG_COM_TIM14_IRQn"       @ string offset=2401
.Linfo_string170:
	.asciz	"TIM8_CC_IRQn"                  @ string offset=2425
.Linfo_string171:
	.asciz	"DMA1_Stream7_IRQn"             @ string offset=2438
.Linfo_string172:
	.asciz	"FSMC_IRQn"                     @ string offset=2456
.Linfo_string173:
	.asciz	"SDIO_IRQn"                     @ string offset=2466
.Linfo_string174:
	.asciz	"TIM5_IRQn"                     @ string offset=2476
.Linfo_string175:
	.asciz	"SPI3_IRQn"                     @ string offset=2486
.Linfo_string176:
	.asciz	"UART4_IRQn"                    @ string offset=2496
.Linfo_string177:
	.asciz	"UART5_IRQn"                    @ string offset=2507
.Linfo_string178:
	.asciz	"TIM6_DAC_IRQn"                 @ string offset=2518
.Linfo_string179:
	.asciz	"TIM7_IRQn"                     @ string offset=2532
.Linfo_string180:
	.asciz	"DMA2_Stream0_IRQn"             @ string offset=2542
.Linfo_string181:
	.asciz	"DMA2_Stream1_IRQn"             @ string offset=2560
.Linfo_string182:
	.asciz	"DMA2_Stream2_IRQn"             @ string offset=2578
.Linfo_string183:
	.asciz	"DMA2_Stream3_IRQn"             @ string offset=2596
.Linfo_string184:
	.asciz	"DMA2_Stream4_IRQn"             @ string offset=2614
.Linfo_string185:
	.asciz	"ETH_IRQn"                      @ string offset=2632
.Linfo_string186:
	.asciz	"ETH_WKUP_IRQn"                 @ string offset=2641
.Linfo_string187:
	.asciz	"CAN2_TX_IRQn"                  @ string offset=2655
.Linfo_string188:
	.asciz	"CAN2_RX0_IRQn"                 @ string offset=2668
.Linfo_string189:
	.asciz	"CAN2_RX1_IRQn"                 @ string offset=2682
.Linfo_string190:
	.asciz	"CAN2_SCE_IRQn"                 @ string offset=2696
.Linfo_string191:
	.asciz	"OTG_FS_IRQn"                   @ string offset=2710
.Linfo_string192:
	.asciz	"DMA2_Stream5_IRQn"             @ string offset=2722
.Linfo_string193:
	.asciz	"DMA2_Stream6_IRQn"             @ string offset=2740
.Linfo_string194:
	.asciz	"DMA2_Stream7_IRQn"             @ string offset=2758
.Linfo_string195:
	.asciz	"USART6_IRQn"                   @ string offset=2776
.Linfo_string196:
	.asciz	"I2C3_EV_IRQn"                  @ string offset=2788
.Linfo_string197:
	.asciz	"I2C3_ER_IRQn"                  @ string offset=2801
.Linfo_string198:
	.asciz	"OTG_HS_EP1_OUT_IRQn"           @ string offset=2814
.Linfo_string199:
	.asciz	"OTG_HS_EP1_IN_IRQn"            @ string offset=2834
.Linfo_string200:
	.asciz	"OTG_HS_WKUP_IRQn"              @ string offset=2853
.Linfo_string201:
	.asciz	"OTG_HS_IRQn"                   @ string offset=2870
.Linfo_string202:
	.asciz	"DCMI_IRQn"                     @ string offset=2882
.Linfo_string203:
	.asciz	"RNG_IRQn"                      @ string offset=2892
.Linfo_string204:
	.asciz	"FPU_IRQn"                      @ string offset=2901
.Linfo_string205:
	.asciz	"PLLCFGR"                       @ string offset=2910
.Linfo_string206:
	.asciz	"CFGR"                          @ string offset=2918
.Linfo_string207:
	.asciz	"CIR"                           @ string offset=2923
.Linfo_string208:
	.asciz	"AHB1RSTR"                      @ string offset=2927
.Linfo_string209:
	.asciz	"AHB2RSTR"                      @ string offset=2936
.Linfo_string210:
	.asciz	"AHB3RSTR"                      @ string offset=2945
.Linfo_string211:
	.asciz	"RESERVED0"                     @ string offset=2954
.Linfo_string212:
	.asciz	"APB1RSTR"                      @ string offset=2964
.Linfo_string213:
	.asciz	"APB2RSTR"                      @ string offset=2973
.Linfo_string214:
	.asciz	"RESERVED1"                     @ string offset=2982
.Linfo_string215:
	.asciz	"AHB1ENR"                       @ string offset=2992
.Linfo_string216:
	.asciz	"AHB2ENR"                       @ string offset=3000
.Linfo_string217:
	.asciz	"AHB3ENR"                       @ string offset=3008
.Linfo_string218:
	.asciz	"RESERVED2"                     @ string offset=3016
.Linfo_string219:
	.asciz	"APB1ENR"                       @ string offset=3026
.Linfo_string220:
	.asciz	"APB2ENR"                       @ string offset=3034
.Linfo_string221:
	.asciz	"RESERVED3"                     @ string offset=3042
.Linfo_string222:
	.asciz	"AHB1LPENR"                     @ string offset=3052
.Linfo_string223:
	.asciz	"AHB2LPENR"                     @ string offset=3062
.Linfo_string224:
	.asciz	"AHB3LPENR"                     @ string offset=3072
.Linfo_string225:
	.asciz	"RESERVED4"                     @ string offset=3082
.Linfo_string226:
	.asciz	"APB1LPENR"                     @ string offset=3092
.Linfo_string227:
	.asciz	"APB2LPENR"                     @ string offset=3102
.Linfo_string228:
	.asciz	"RESERVED5"                     @ string offset=3112
.Linfo_string229:
	.asciz	"BDCR"                          @ string offset=3122
.Linfo_string230:
	.asciz	"CSR"                           @ string offset=3127
.Linfo_string231:
	.asciz	"RESERVED6"                     @ string offset=3131
.Linfo_string232:
	.asciz	"SSCGR"                         @ string offset=3141
.Linfo_string233:
	.asciz	"PLLI2SCFGR"                    @ string offset=3147
.Linfo_string234:
	.asciz	"RCC_TypeDef"                   @ string offset=3158
.Linfo_string235:
	.asciz	"unsigned short"                @ string offset=3170
.Linfo_string236:
	.asciz	"uint16_t"                      @ string offset=3185
.Linfo_string237:
	.asciz	"uint8_t"                       @ string offset=3194
.Linfo_string238:
	.asciz	"MODER"                         @ string offset=3202
.Linfo_string239:
	.asciz	"OTYPER"                        @ string offset=3208
.Linfo_string240:
	.asciz	"OSPEEDR"                       @ string offset=3215
.Linfo_string241:
	.asciz	"PUPDR"                         @ string offset=3223
.Linfo_string242:
	.asciz	"IDR"                           @ string offset=3229
.Linfo_string243:
	.asciz	"ODR"                           @ string offset=3233
.Linfo_string244:
	.asciz	"BSRR"                          @ string offset=3237
.Linfo_string245:
	.asciz	"LCKR"                          @ string offset=3242
.Linfo_string246:
	.asciz	"AFR"                           @ string offset=3247
.Linfo_string247:
	.asciz	"GPIO_TypeDef"                  @ string offset=3251
.Linfo_string248:
	.asciz	"MX_TIM2_Init"                  @ string offset=3264
.Linfo_string249:
	.asciz	"HAL_TIM_MspPostInit"           @ string offset=3277
.Linfo_string250:
	.asciz	"MX_TIM4_Init"                  @ string offset=3297
.Linfo_string251:
	.asciz	"MX_TIM8_Init"                  @ string offset=3310
.Linfo_string252:
	.asciz	"MX_TIM9_Init"                  @ string offset=3323
.Linfo_string253:
	.asciz	"HAL_TIM_Base_MspInit"          @ string offset=3336
.Linfo_string254:
	.asciz	"HAL_TIM_Base_MspDeInit"        @ string offset=3357
.Linfo_string255:
	.asciz	"sClockSourceConfig"            @ string offset=3380
.Linfo_string256:
	.asciz	"ClockSource"                   @ string offset=3399
.Linfo_string257:
	.asciz	"ClockPolarity"                 @ string offset=3411
.Linfo_string258:
	.asciz	"ClockPrescaler"                @ string offset=3425
.Linfo_string259:
	.asciz	"ClockFilter"                   @ string offset=3440
.Linfo_string260:
	.asciz	"TIM_ClockConfigTypeDef"        @ string offset=3452
.Linfo_string261:
	.asciz	"sMasterConfig"                 @ string offset=3475
.Linfo_string262:
	.asciz	"MasterOutputTrigger"           @ string offset=3489
.Linfo_string263:
	.asciz	"MasterSlaveMode"               @ string offset=3509
.Linfo_string264:
	.asciz	"TIM_MasterConfigTypeDef"       @ string offset=3525
.Linfo_string265:
	.asciz	"sConfigOC"                     @ string offset=3549
.Linfo_string266:
	.asciz	"OCMode"                        @ string offset=3559
.Linfo_string267:
	.asciz	"Pulse"                         @ string offset=3566
.Linfo_string268:
	.asciz	"OCPolarity"                    @ string offset=3572
.Linfo_string269:
	.asciz	"OCNPolarity"                   @ string offset=3583
.Linfo_string270:
	.asciz	"OCFastMode"                    @ string offset=3595
.Linfo_string271:
	.asciz	"OCIdleState"                   @ string offset=3606
.Linfo_string272:
	.asciz	"OCNIdleState"                  @ string offset=3618
.Linfo_string273:
	.asciz	"TIM_OC_InitTypeDef"            @ string offset=3631
.Linfo_string274:
	.asciz	"timHandle"                     @ string offset=3650
.Linfo_string275:
	.asciz	"GPIO_InitStruct"               @ string offset=3660
.Linfo_string276:
	.asciz	"Pin"                           @ string offset=3676
.Linfo_string277:
	.asciz	"Pull"                          @ string offset=3680
.Linfo_string278:
	.asciz	"Speed"                         @ string offset=3685
.Linfo_string279:
	.asciz	"Alternate"                     @ string offset=3691
.Linfo_string280:
	.asciz	"GPIO_InitTypeDef"              @ string offset=3701
.Linfo_string281:
	.asciz	"tmpreg"                        @ string offset=3718
.Linfo_string282:
	.asciz	"sBreakDeadTimeConfig"          @ string offset=3725
.Linfo_string283:
	.asciz	"OffStateRunMode"               @ string offset=3746
.Linfo_string284:
	.asciz	"OffStateIDLEMode"              @ string offset=3762
.Linfo_string285:
	.asciz	"LockLevel"                     @ string offset=3779
.Linfo_string286:
	.asciz	"DeadTime"                      @ string offset=3789
.Linfo_string287:
	.asciz	"BreakState"                    @ string offset=3798
.Linfo_string288:
	.asciz	"BreakPolarity"                 @ string offset=3809
.Linfo_string289:
	.asciz	"BreakFilter"                   @ string offset=3823
.Linfo_string290:
	.asciz	"AutomaticOutput"               @ string offset=3835
.Linfo_string291:
	.asciz	"TIM_BreakDeadTimeConfigTypeDef" @ string offset=3851
.Linfo_string292:
	.asciz	"tim_baseHandle"                @ string offset=3882
	.ident	"Component: Arm Compiler for Embedded 6.19 Tool: armclang [5e73cb00]"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
	.ARM_attribute	16, 1	@ Tag_AV_eba
	.section	.debug_line,"",%progbits
.Lline_table_start0:
