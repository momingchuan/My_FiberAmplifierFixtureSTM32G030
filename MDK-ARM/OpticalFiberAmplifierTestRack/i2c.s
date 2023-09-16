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
	.file	"i2c.c"
	.file	1 "e:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include" "stdint.h"
	.file	2 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h"
	.file	3 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_hal_i2c.h"
	.file	4 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_hal_dma.h"
	.file	5 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_def.h"
	.file	6 "C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" "../Core/Src/i2c.c"
	.section	.text.MX_I2C1_Init,"ax",%progbits
	.hidden	MX_I2C1_Init                    @ -- Begin function MX_I2C1_Init
	.globl	MX_I2C1_Init
	.p2align	2
	.type	MX_I2C1_Init,%function
	.code	16                              @ @MX_I2C1_Init
	.thumb_func
MX_I2C1_Init:
.Lfunc_begin0:
	.loc	6 33 0                          @ ../Core/Src/i2c.c:33:0
	.fnstart
	.cfi_sections .debug_frame
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
.Ltmp0:
	.loc	6 42 18 prologue_end            @ ../Core/Src/i2c.c:42:18
	movw	r0, :lower16:hi2c1
	movt	r0, :upper16:hi2c1
	str	r0, [sp, #4]                    @ 4-byte Spill
	movw	r1, #21504
	movt	r1, #16384
	str	r1, [r0]
	movw	r1, #34464
	movt	r1, #1
	.loc	6 43 25                         @ ../Core/Src/i2c.c:43:25
	str	r1, [r0, #4]
	movs	r1, #0
	.loc	6 44 24                         @ ../Core/Src/i2c.c:44:24
	str	r1, [r0, #8]
	.loc	6 45 26                         @ ../Core/Src/i2c.c:45:26
	str	r1, [r0, #12]
	mov.w	r2, #16384
	.loc	6 46 29                         @ ../Core/Src/i2c.c:46:29
	str	r2, [r0, #16]
	.loc	6 47 30                         @ ../Core/Src/i2c.c:47:30
	str	r1, [r0, #20]
	.loc	6 48 26                         @ ../Core/Src/i2c.c:48:26
	str	r1, [r0, #24]
	.loc	6 49 30                         @ ../Core/Src/i2c.c:49:30
	str	r1, [r0, #28]
	.loc	6 50 28                         @ ../Core/Src/i2c.c:50:28
	str	r1, [r0, #32]
.Ltmp1:
	.loc	6 51 7                          @ ../Core/Src/i2c.c:51:7
	bl	HAL_I2C_Init
.Ltmp2:
	.loc	6 51 7 is_stmt 0                @ ../Core/Src/i2c.c:51:7
	cbz	r0, .LBB0_2
	b	.LBB0_1
.LBB0_1:
.Ltmp3:
	.loc	6 53 5 is_stmt 1                @ ../Core/Src/i2c.c:53:5
	bl	Error_Handler
	.loc	6 54 3                          @ ../Core/Src/i2c.c:54:3
	b	.LBB0_2
.Ltmp4:
.LBB0_2:
	.loc	6 59 1                          @ ../Core/Src/i2c.c:59:1
	add	sp, #8
	pop	{r7, pc}
.Ltmp5:
.Lfunc_end0:
	.size	MX_I2C1_Init, .Lfunc_end0-MX_I2C1_Init
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.HAL_I2C_MspInit,"ax",%progbits
	.hidden	HAL_I2C_MspInit                 @ -- Begin function HAL_I2C_MspInit
	.globl	HAL_I2C_MspInit
	.p2align	2
	.type	HAL_I2C_MspInit,%function
	.code	16                              @ @HAL_I2C_MspInit
	.thumb_func
HAL_I2C_MspInit:
.Lfunc_begin1:
	.loc	6 62 0                          @ ../Core/Src/i2c.c:62:0
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
	str	r0, [sp, #52]
	movs	r0, #0
.Ltmp6:
	.loc	6 64 20 prologue_end            @ ../Core/Src/i2c.c:64:20
	str	r0, [sp, #48]
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #36]
	str	r0, [sp, #32]
.Ltmp7:
	.loc	6 65 6                          @ ../Core/Src/i2c.c:65:6
	ldr	r0, [sp, #52]
	.loc	6 65 17 is_stmt 0               @ ../Core/Src/i2c.c:65:17
	ldr	r0, [r0]
	movw	r1, #21504
	movt	r1, #16384
.Ltmp8:
	.loc	6 65 6                          @ ../Core/Src/i2c.c:65:6
	cmp	r0, r1
	bne.w	.LBB1_16
	b	.LBB1_1
.LBB1_1:
.Ltmp9:
	.loc	6 68 5 is_stmt 1                @ ../Core/Src/i2c.c:68:5
	b	.LBB1_2
.LBB1_2:
	.loc	6 0 5 is_stmt 0                 @ ../Core/Src/i2c.c:0:5
	movs	r0, #0
.Ltmp10:
	.loc	6 68 5                          @ ../Core/Src/i2c.c:68:5
	str	r0, [sp, #28]
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #2097152
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #2097152
	str	r0, [sp, #28]
	ldr	r0, [sp, #28]
	b	.LBB1_3
.Ltmp11:
.LBB1_3:
	.loc	6 71 5 is_stmt 1                @ ../Core/Src/i2c.c:71:5
	b	.LBB1_4
.LBB1_4:
	.loc	6 0 5 is_stmt 0                 @ ../Core/Src/i2c.c:0:5
	movs	r0, #0
.Ltmp12:
	.loc	6 71 5                          @ ../Core/Src/i2c.c:71:5
	str	r0, [sp, #24]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #2
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #2
	str	r0, [sp, #24]
	ldr	r0, [sp, #24]
	b	.LBB1_5
.Ltmp13:
.LBB1_5:
	.loc	6 0 5                           @ ../Core/Src/i2c.c:0:5
	movs	r0, #192
	.loc	6 76 25 is_stmt 1               @ ../Core/Src/i2c.c:76:25
	str	r0, [sp, #32]
	movs	r0, #18
	.loc	6 77 26                         @ ../Core/Src/i2c.c:77:26
	str	r0, [sp, #36]
	movs	r0, #0
	.loc	6 78 26                         @ ../Core/Src/i2c.c:78:26
	str	r0, [sp, #40]
	movs	r0, #3
	.loc	6 79 27                         @ ../Core/Src/i2c.c:79:27
	str	r0, [sp, #44]
	movs	r0, #4
	.loc	6 80 31                         @ ../Core/Src/i2c.c:80:31
	str	r0, [sp, #48]
	movw	r0, #1024
	movt	r0, #16386
	add	r1, sp, #32
	.loc	6 81 5                          @ ../Core/Src/i2c.c:81:5
	bl	HAL_GPIO_Init
	.loc	6 84 5                          @ ../Core/Src/i2c.c:84:5
	b	.LBB1_6
.LBB1_6:
	.loc	6 0 5 is_stmt 0                 @ ../Core/Src/i2c.c:0:5
	movs	r0, #0
.Ltmp14:
	.loc	6 84 5                          @ ../Core/Src/i2c.c:84:5
	str	r0, [sp, #20]
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #2097152
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #2097152
	str	r0, [sp, #20]
	ldr	r0, [sp, #20]
	b	.LBB1_7
.Ltmp15:
.LBB1_7:
	.loc	6 88 27 is_stmt 1               @ ../Core/Src/i2c.c:88:27
	movw	r0, :lower16:hdma_i2c1_rx
	movt	r0, :upper16:hdma_i2c1_rx
	str	r0, [sp, #16]                   @ 4-byte Spill
	movw	r1, #24592
	movt	r1, #16386
	str	r1, [r0]
	mov.w	r1, #33554432
	.loc	6 89 31                         @ ../Core/Src/i2c.c:89:31
	str	r1, [r0, #4]
	movs	r1, #0
	.loc	6 90 33                         @ ../Core/Src/i2c.c:90:33
	str	r1, [r0, #8]
	.loc	6 91 33                         @ ../Core/Src/i2c.c:91:33
	str	r1, [r0, #12]
	mov.w	r2, #1024
	.loc	6 92 30                         @ ../Core/Src/i2c.c:92:30
	str	r2, [r0, #16]
	.loc	6 93 43                         @ ../Core/Src/i2c.c:93:43
	str	r1, [r0, #20]
	.loc	6 94 40                         @ ../Core/Src/i2c.c:94:40
	str	r1, [r0, #24]
	.loc	6 95 28                         @ ../Core/Src/i2c.c:95:28
	str	r1, [r0, #28]
	.loc	6 96 32                         @ ../Core/Src/i2c.c:96:32
	str	r1, [r0, #32]
	.loc	6 97 32                         @ ../Core/Src/i2c.c:97:32
	str	r1, [r0, #36]
.Ltmp16:
	.loc	6 98 9                          @ ../Core/Src/i2c.c:98:9
	bl	HAL_DMA_Init
.Ltmp17:
	.loc	6 98 9 is_stmt 0                @ ../Core/Src/i2c.c:98:9
	cbz	r0, .LBB1_9
	b	.LBB1_8
.LBB1_8:
.Ltmp18:
	.loc	6 100 7 is_stmt 1               @ ../Core/Src/i2c.c:100:7
	bl	Error_Handler
	.loc	6 101 5                         @ ../Core/Src/i2c.c:101:5
	b	.LBB1_9
.Ltmp19:
.LBB1_9:
	.loc	6 103 5                         @ ../Core/Src/i2c.c:103:5
	b	.LBB1_10
.LBB1_10:
.Ltmp20:
	.loc	6 103 5 is_stmt 0               @ ../Core/Src/i2c.c:103:5
	ldr	r0, [sp, #52]
	movw	r1, :lower16:hdma_i2c1_rx
	movt	r1, :upper16:hdma_i2c1_rx
	str	r1, [r0, #56]
	ldr	r0, [sp, #52]
	str	r0, [r1, #56]
	b	.LBB1_11
.Ltmp21:
.LBB1_11:
	.loc	6 106 27 is_stmt 1              @ ../Core/Src/i2c.c:106:27
	movw	r0, :lower16:hdma_i2c1_tx
	movt	r0, :upper16:hdma_i2c1_tx
	str	r0, [sp, #12]                   @ 4-byte Spill
	movw	r1, #24760
	movt	r1, #16386
	str	r1, [r0]
	mov.w	r1, #33554432
	.loc	6 107 31                        @ ../Core/Src/i2c.c:107:31
	str	r1, [r0, #4]
	movs	r1, #64
	.loc	6 108 33                        @ ../Core/Src/i2c.c:108:33
	str	r1, [r0, #8]
	movs	r1, #0
	.loc	6 109 33                        @ ../Core/Src/i2c.c:109:33
	str	r1, [r0, #12]
	mov.w	r2, #1024
	.loc	6 110 30                        @ ../Core/Src/i2c.c:110:30
	str	r2, [r0, #16]
	.loc	6 111 43                        @ ../Core/Src/i2c.c:111:43
	str	r1, [r0, #20]
	.loc	6 112 40                        @ ../Core/Src/i2c.c:112:40
	str	r1, [r0, #24]
	.loc	6 113 28                        @ ../Core/Src/i2c.c:113:28
	str	r1, [r0, #28]
	.loc	6 114 32                        @ ../Core/Src/i2c.c:114:32
	str	r1, [r0, #32]
	.loc	6 115 32                        @ ../Core/Src/i2c.c:115:32
	str	r1, [r0, #36]
.Ltmp22:
	.loc	6 116 9                         @ ../Core/Src/i2c.c:116:9
	bl	HAL_DMA_Init
.Ltmp23:
	.loc	6 116 9 is_stmt 0               @ ../Core/Src/i2c.c:116:9
	cbz	r0, .LBB1_13
	b	.LBB1_12
.LBB1_12:
.Ltmp24:
	.loc	6 118 7 is_stmt 1               @ ../Core/Src/i2c.c:118:7
	bl	Error_Handler
	.loc	6 119 5                         @ ../Core/Src/i2c.c:119:5
	b	.LBB1_13
.Ltmp25:
.LBB1_13:
	.loc	6 121 5                         @ ../Core/Src/i2c.c:121:5
	b	.LBB1_14
.LBB1_14:
.Ltmp26:
	.loc	6 121 5 is_stmt 0               @ ../Core/Src/i2c.c:121:5
	ldr	r0, [sp, #52]
	movw	r1, :lower16:hdma_i2c1_tx
	movt	r1, :upper16:hdma_i2c1_tx
	str	r1, [r0, #52]
	ldr	r0, [sp, #52]
	str	r0, [r1, #56]
	b	.LBB1_15
.Ltmp27:
.LBB1_15:
	.loc	6 0 5                           @ ../Core/Src/i2c.c:0:5
	movs	r0, #31
	str	r0, [sp]                        @ 4-byte Spill
	movs	r2, #0
	.loc	6 124 5 is_stmt 1               @ ../Core/Src/i2c.c:124:5
	str	r2, [sp, #4]                    @ 4-byte Spill
	mov	r1, r2
	bl	HAL_NVIC_SetPriority
	ldr	r0, [sp]                        @ 4-byte Reload
	.loc	6 125 5                         @ ../Core/Src/i2c.c:125:5
	bl	HAL_NVIC_EnableIRQ
	ldr	r2, [sp, #4]                    @ 4-byte Reload
	movs	r0, #32
	.loc	6 126 5                         @ ../Core/Src/i2c.c:126:5
	str	r0, [sp, #8]                    @ 4-byte Spill
	mov	r1, r2
	bl	HAL_NVIC_SetPriority
	ldr	r0, [sp, #8]                    @ 4-byte Reload
	.loc	6 127 5                         @ ../Core/Src/i2c.c:127:5
	bl	HAL_NVIC_EnableIRQ
	.loc	6 131 3                         @ ../Core/Src/i2c.c:131:3
	b	.LBB1_16
.Ltmp28:
.LBB1_16:
	.loc	6 132 1                         @ ../Core/Src/i2c.c:132:1
	add	sp, #56
	pop	{r7, pc}
.Ltmp29:
.Lfunc_end1:
	.size	HAL_I2C_MspInit, .Lfunc_end1-HAL_I2C_MspInit
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.HAL_I2C_MspDeInit,"ax",%progbits
	.hidden	HAL_I2C_MspDeInit               @ -- Begin function HAL_I2C_MspDeInit
	.globl	HAL_I2C_MspDeInit
	.p2align	2
	.type	HAL_I2C_MspDeInit,%function
	.code	16                              @ @HAL_I2C_MspDeInit
	.thumb_func
HAL_I2C_MspDeInit:
.Lfunc_begin2:
	.loc	6 135 0                         @ ../Core/Src/i2c.c:135:0
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
.Ltmp30:
	.loc	6 137 6 prologue_end            @ ../Core/Src/i2c.c:137:6
	ldr	r0, [sp, #4]
	.loc	6 137 17 is_stmt 0              @ ../Core/Src/i2c.c:137:17
	ldr	r0, [r0]
	movw	r1, #21504
	movt	r1, #16384
.Ltmp31:
	.loc	6 137 6                         @ ../Core/Src/i2c.c:137:6
	cmp	r0, r1
	bne	.LBB2_2
	b	.LBB2_1
.LBB2_1:
	.loc	6 0 6                           @ ../Core/Src/i2c.c:0:6
	movw	r1, #14400
	movt	r1, #16386
.Ltmp32:
	.loc	6 143 5 is_stmt 1               @ ../Core/Src/i2c.c:143:5
	ldr	r0, [r1]
	bic	r0, r0, #2097152
	str	r0, [r1]
	movw	r0, #1024
	movt	r0, #16386
	str	r0, [sp]                        @ 4-byte Spill
	movs	r1, #64
	.loc	6 149 5                         @ ../Core/Src/i2c.c:149:5
	bl	HAL_GPIO_DeInit
	ldr	r0, [sp]                        @ 4-byte Reload
	movs	r1, #128
	.loc	6 151 5                         @ ../Core/Src/i2c.c:151:5
	bl	HAL_GPIO_DeInit
	.loc	6 154 20                        @ ../Core/Src/i2c.c:154:20
	ldr	r0, [sp, #4]
	.loc	6 154 31 is_stmt 0              @ ../Core/Src/i2c.c:154:31
	ldr	r0, [r0, #56]
	.loc	6 154 5                         @ ../Core/Src/i2c.c:154:5
	bl	HAL_DMA_DeInit
	.loc	6 155 20 is_stmt 1              @ ../Core/Src/i2c.c:155:20
	ldr	r0, [sp, #4]
	.loc	6 155 31 is_stmt 0              @ ../Core/Src/i2c.c:155:31
	ldr	r0, [r0, #52]
	.loc	6 155 5                         @ ../Core/Src/i2c.c:155:5
	bl	HAL_DMA_DeInit
	movs	r0, #31
	.loc	6 158 5 is_stmt 1               @ ../Core/Src/i2c.c:158:5
	bl	HAL_NVIC_DisableIRQ
	movs	r0, #32
	.loc	6 159 5                         @ ../Core/Src/i2c.c:159:5
	bl	HAL_NVIC_DisableIRQ
	.loc	6 163 3                         @ ../Core/Src/i2c.c:163:3
	b	.LBB2_2
.Ltmp33:
.LBB2_2:
	.loc	6 164 1                         @ ../Core/Src/i2c.c:164:1
	add	sp, #8
	pop	{r7, pc}
.Ltmp34:
.Lfunc_end2:
	.size	HAL_I2C_MspDeInit, .Lfunc_end2-HAL_I2C_MspDeInit
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.hidden	hi2c1                           @ @hi2c1
	.type	hi2c1,%object
	.section	.bss.hi2c1,"aw",%nobits
	.globl	hi2c1
	.p2align	2, 0x0
hi2c1:
	.zero	84
	.size	hi2c1, 84

	.hidden	hdma_i2c1_rx                    @ @hdma_i2c1_rx
	.type	hdma_i2c1_rx,%object
	.section	.bss.hdma_i2c1_rx,"aw",%nobits
	.globl	hdma_i2c1_rx
	.p2align	2, 0x0
hdma_i2c1_rx:
	.zero	96
	.size	hdma_i2c1_rx, 96

	.hidden	hdma_i2c1_tx                    @ @hdma_i2c1_tx
	.type	hdma_i2c1_tx,%object
	.section	.bss.hdma_i2c1_tx,"aw",%nobits
	.globl	hdma_i2c1_tx
	.p2align	2, 0x0
hdma_i2c1_tx:
	.zero	96
	.size	hdma_i2c1_tx, 96

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
	.byte	15                              @ DW_TAG_pointer_type
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
	.byte	5                               @ DW_FORM_data2
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	8                               @ Abbreviation Code
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
	.byte	9                               @ Abbreviation Code
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
	.byte	10                              @ Abbreviation Code
	.byte	53                              @ DW_TAG_volatile_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	11                              @ Abbreviation Code
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
	.byte	12                              @ Abbreviation Code
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
	.byte	13                              @ Abbreviation Code
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
	.byte	14                              @ Abbreviation Code
	.byte	40                              @ DW_TAG_enumerator
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	28                              @ DW_AT_const_value
	.byte	15                              @ DW_FORM_udata
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	15                              @ Abbreviation Code
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	16                              @ Abbreviation Code
	.byte	21                              @ DW_TAG_subroutine_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	39                              @ DW_AT_prototyped
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	17                              @ Abbreviation Code
	.byte	5                               @ DW_TAG_formal_parameter
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	18                              @ Abbreviation Code
	.byte	40                              @ DW_TAG_enumerator
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	28                              @ DW_AT_const_value
	.byte	13                              @ DW_FORM_sdata
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	19                              @ Abbreviation Code
	.byte	1                               @ DW_TAG_array_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	20                              @ Abbreviation Code
	.byte	33                              @ DW_TAG_subrange_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	55                              @ DW_AT_count
	.byte	11                              @ DW_FORM_data1
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
	.byte	5                               @ DW_TAG_formal_parameter
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
	.byte	26                              @ Abbreviation Code
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
	.byte	1                               @ Abbrev [1] 0xb:0xac7 DW_TAG_compile_unit
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
	.byte	27                              @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	hi2c1
	.byte	3                               @ Abbrev [3] 0x37:0xb DW_TAG_typedef
	.long	66                              @ DW_AT_type
	.long	.Linfo_string103                @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	243                             @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x42:0xd1 DW_TAG_structure_type
	.byte	84                              @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.byte	187                             @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x46:0xc DW_TAG_member
	.long	.Linfo_string4                  @ DW_AT_name
	.long	275                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	190                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x52:0xc DW_TAG_member
	.long	.Linfo_string17                 @ DW_AT_name
	.long	438                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	192                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x5e:0xc DW_TAG_member
	.long	.Linfo_string27                 @ DW_AT_name
	.long	550                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	194                             @ DW_AT_decl_line
	.byte	36                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x6a:0xc DW_TAG_member
	.long	.Linfo_string30                 @ DW_AT_name
	.long	573                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	196                             @ DW_AT_decl_line
	.byte	40                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x76:0xc DW_TAG_member
	.long	.Linfo_string33                 @ DW_AT_name
	.long	591                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	198                             @ DW_AT_decl_line
	.byte	42                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x82:0xc DW_TAG_member
	.long	.Linfo_string34                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	200                             @ DW_AT_decl_line
	.byte	44                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x8e:0xc DW_TAG_member
	.long	.Linfo_string35                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	202                             @ DW_AT_decl_line
	.byte	48                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x9a:0xc DW_TAG_member
	.long	.Linfo_string36                 @ DW_AT_name
	.long	596                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	205                             @ DW_AT_decl_line
	.byte	52                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xa6:0xc DW_TAG_member
	.long	.Linfo_string81                 @ DW_AT_name
	.long	596                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	207                             @ DW_AT_decl_line
	.byte	56                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xb2:0xc DW_TAG_member
	.long	.Linfo_string57                 @ DW_AT_name
	.long	1050                            @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	209                             @ DW_AT_decl_line
	.byte	60                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xbe:0xc DW_TAG_member
	.long	.Linfo_string61                 @ DW_AT_name
	.long	1161                            @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	211                             @ DW_AT_decl_line
	.byte	61                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xca:0xc DW_TAG_member
	.long	.Linfo_string50                 @ DW_AT_name
	.long	1254                            @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	213                             @ DW_AT_decl_line
	.byte	62                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xd6:0xc DW_TAG_member
	.long	.Linfo_string76                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	215                             @ DW_AT_decl_line
	.byte	64                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xe2:0xc DW_TAG_member
	.long	.Linfo_string99                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	217                             @ DW_AT_decl_line
	.byte	68                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xee:0xc DW_TAG_member
	.long	.Linfo_string100                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	219                             @ DW_AT_decl_line
	.byte	72                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xfa:0xc DW_TAG_member
	.long	.Linfo_string101                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	221                             @ DW_AT_decl_line
	.byte	76                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x106:0xc DW_TAG_member
	.long	.Linfo_string102                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	223                             @ DW_AT_decl_line
	.byte	80                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0x113:0x5 DW_TAG_pointer_type
	.long	280                             @ DW_AT_type
	.byte	7                               @ Abbrev [7] 0x118:0xc DW_TAG_typedef
	.long	292                             @ DW_AT_type
	.long	.Linfo_string16                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	567                             @ DW_AT_decl_line
	.byte	8                               @ Abbrev [8] 0x124:0x7b DW_TAG_structure_type
	.byte	36                              @ DW_AT_byte_size
	.byte	2                               @ DW_AT_decl_file
	.short	556                             @ DW_AT_decl_line
	.byte	9                               @ Abbrev [9] 0x129:0xd DW_TAG_member
	.long	.Linfo_string5                  @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	558                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x136:0xd DW_TAG_member
	.long	.Linfo_string8                  @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	559                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x143:0xd DW_TAG_member
	.long	.Linfo_string9                  @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	560                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x150:0xd DW_TAG_member
	.long	.Linfo_string10                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	561                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x15d:0xd DW_TAG_member
	.long	.Linfo_string11                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	562                             @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x16a:0xd DW_TAG_member
	.long	.Linfo_string12                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	563                             @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x177:0xd DW_TAG_member
	.long	.Linfo_string13                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	564                             @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x184:0xd DW_TAG_member
	.long	.Linfo_string14                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	565                             @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x191:0xd DW_TAG_member
	.long	.Linfo_string15                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	566                             @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	10                              @ Abbrev [10] 0x19f:0x5 DW_TAG_volatile_type
	.long	420                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x1a4:0xb DW_TAG_typedef
	.long	431                             @ DW_AT_type
	.long	.Linfo_string7                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	64                              @ DW_AT_decl_line
	.byte	11                              @ Abbrev [11] 0x1af:0x7 DW_TAG_base_type
	.long	.Linfo_string6                  @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	3                               @ Abbrev [3] 0x1b6:0xb DW_TAG_typedef
	.long	449                             @ DW_AT_type
	.long	.Linfo_string26                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	73                              @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x1c1:0x65 DW_TAG_structure_type
	.byte	32                              @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.byte	47                              @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x1c5:0xc DW_TAG_member
	.long	.Linfo_string18                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	49                              @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1d1:0xc DW_TAG_member
	.long	.Linfo_string19                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	52                              @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1dd:0xc DW_TAG_member
	.long	.Linfo_string20                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	55                              @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1e9:0xc DW_TAG_member
	.long	.Linfo_string21                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	58                              @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x1f5:0xc DW_TAG_member
	.long	.Linfo_string22                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	61                              @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x201:0xc DW_TAG_member
	.long	.Linfo_string23                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	64                              @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x20d:0xc DW_TAG_member
	.long	.Linfo_string24                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	67                              @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x219:0xc DW_TAG_member
	.long	.Linfo_string25                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.byte	70                              @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0x226:0x5 DW_TAG_pointer_type
	.long	555                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x22b:0xb DW_TAG_typedef
	.long	566                             @ DW_AT_type
	.long	.Linfo_string29                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	62                              @ DW_AT_decl_line
	.byte	11                              @ Abbrev [11] 0x236:0x7 DW_TAG_base_type
	.long	.Linfo_string28                 @ DW_AT_name
	.byte	8                               @ DW_AT_encoding
	.byte	1                               @ DW_AT_byte_size
	.byte	3                               @ Abbrev [3] 0x23d:0xb DW_TAG_typedef
	.long	584                             @ DW_AT_type
	.long	.Linfo_string32                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	63                              @ DW_AT_decl_line
	.byte	11                              @ Abbrev [11] 0x248:0x7 DW_TAG_base_type
	.long	.Linfo_string31                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	2                               @ DW_AT_byte_size
	.byte	10                              @ Abbrev [10] 0x24f:0x5 DW_TAG_volatile_type
	.long	573                             @ DW_AT_type
	.byte	6                               @ Abbrev [6] 0x254:0x5 DW_TAG_pointer_type
	.long	601                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x259:0xb DW_TAG_typedef
	.long	612                             @ DW_AT_type
	.long	.Linfo_string80                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	168                             @ DW_AT_decl_line
	.byte	12                              @ Abbrev [12] 0x264:0xb1 DW_TAG_structure_type
	.long	.Linfo_string79                 @ DW_AT_name
	.byte	96                              @ DW_AT_byte_size
	.byte	4                               @ DW_AT_decl_file
	.byte	138                             @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x26c:0xc DW_TAG_member
	.long	.Linfo_string4                  @ DW_AT_name
	.long	789                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	140                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x278:0xc DW_TAG_member
	.long	.Linfo_string17                 @ DW_AT_name
	.long	890                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	142                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x284:0xc DW_TAG_member
	.long	.Linfo_string57                 @ DW_AT_name
	.long	1050                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	144                             @ DW_AT_decl_line
	.byte	52                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x290:0xc DW_TAG_member
	.long	.Linfo_string61                 @ DW_AT_name
	.long	1082                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	146                             @ DW_AT_decl_line
	.byte	53                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x29c:0xc DW_TAG_member
	.long	.Linfo_string69                 @ DW_AT_name
	.long	1143                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	148                             @ DW_AT_decl_line
	.byte	56                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2a8:0xc DW_TAG_member
	.long	.Linfo_string70                 @ DW_AT_name
	.long	1144                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	150                             @ DW_AT_decl_line
	.byte	60                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2b4:0xc DW_TAG_member
	.long	.Linfo_string71                 @ DW_AT_name
	.long	1144                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	152                             @ DW_AT_decl_line
	.byte	64                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2c0:0xc DW_TAG_member
	.long	.Linfo_string72                 @ DW_AT_name
	.long	1144                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	154                             @ DW_AT_decl_line
	.byte	68                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2cc:0xc DW_TAG_member
	.long	.Linfo_string73                 @ DW_AT_name
	.long	1144                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	156                             @ DW_AT_decl_line
	.byte	72                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2d8:0xc DW_TAG_member
	.long	.Linfo_string74                 @ DW_AT_name
	.long	1144                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	158                             @ DW_AT_decl_line
	.byte	76                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2e4:0xc DW_TAG_member
	.long	.Linfo_string75                 @ DW_AT_name
	.long	1144                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	160                             @ DW_AT_decl_line
	.byte	80                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2f0:0xc DW_TAG_member
	.long	.Linfo_string76                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	162                             @ DW_AT_decl_line
	.byte	84                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x2fc:0xc DW_TAG_member
	.long	.Linfo_string77                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	164                             @ DW_AT_decl_line
	.byte	88                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x308:0xc DW_TAG_member
	.long	.Linfo_string78                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	166                             @ DW_AT_decl_line
	.byte	92                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0x315:0x5 DW_TAG_pointer_type
	.long	794                             @ DW_AT_type
	.byte	7                               @ Abbrev [7] 0x31a:0xc DW_TAG_typedef
	.long	806                             @ DW_AT_type
	.long	.Linfo_string43                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	353                             @ DW_AT_decl_line
	.byte	8                               @ Abbrev [8] 0x326:0x54 DW_TAG_structure_type
	.byte	24                              @ DW_AT_byte_size
	.byte	2                               @ DW_AT_decl_file
	.short	345                             @ DW_AT_decl_line
	.byte	9                               @ Abbrev [9] 0x32b:0xd DW_TAG_member
	.long	.Linfo_string37                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	347                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x338:0xd DW_TAG_member
	.long	.Linfo_string38                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	348                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x345:0xd DW_TAG_member
	.long	.Linfo_string39                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	349                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x352:0xd DW_TAG_member
	.long	.Linfo_string40                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	350                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x35f:0xd DW_TAG_member
	.long	.Linfo_string41                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	351                             @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x36c:0xd DW_TAG_member
	.long	.Linfo_string42                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	352                             @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	3                               @ Abbrev [3] 0x37a:0xb DW_TAG_typedef
	.long	901                             @ DW_AT_type
	.long	.Linfo_string56                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	96                              @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x385:0x95 DW_TAG_structure_type
	.byte	48                              @ DW_AT_byte_size
	.byte	4                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0x389:0xc DW_TAG_member
	.long	.Linfo_string44                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	50                              @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x395:0xc DW_TAG_member
	.long	.Linfo_string45                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	53                              @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x3a1:0xc DW_TAG_member
	.long	.Linfo_string46                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	57                              @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x3ad:0xc DW_TAG_member
	.long	.Linfo_string47                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	60                              @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x3b9:0xc DW_TAG_member
	.long	.Linfo_string48                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	63                              @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x3c5:0xc DW_TAG_member
	.long	.Linfo_string49                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	66                              @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x3d1:0xc DW_TAG_member
	.long	.Linfo_string50                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	69                              @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x3dd:0xc DW_TAG_member
	.long	.Linfo_string51                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	74                              @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x3e9:0xc DW_TAG_member
	.long	.Linfo_string52                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	77                              @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x3f5:0xc DW_TAG_member
	.long	.Linfo_string53                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	82                              @ DW_AT_decl_line
	.byte	36                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x401:0xc DW_TAG_member
	.long	.Linfo_string54                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	85                              @ DW_AT_decl_line
	.byte	40                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0x40d:0xc DW_TAG_member
	.long	.Linfo_string55                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	91                              @ DW_AT_decl_line
	.byte	44                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	3                               @ Abbrev [3] 0x41a:0xb DW_TAG_typedef
	.long	1061                            @ DW_AT_type
	.long	.Linfo_string60                 @ DW_AT_name
	.byte	5                               @ DW_AT_decl_file
	.byte	53                              @ DW_AT_decl_line
	.byte	13                              @ Abbrev [13] 0x425:0x15 DW_TAG_enumeration_type
	.long	566                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	5                               @ DW_AT_decl_file
	.byte	49                              @ DW_AT_decl_line
	.byte	14                              @ Abbrev [14] 0x42d:0x6 DW_TAG_enumerator
	.long	.Linfo_string58                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x433:0x6 DW_TAG_enumerator
	.long	.Linfo_string59                 @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	10                              @ Abbrev [10] 0x43a:0x5 DW_TAG_volatile_type
	.long	1087                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x43f:0xb DW_TAG_typedef
	.long	1098                            @ DW_AT_type
	.long	.Linfo_string68                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	110                             @ DW_AT_decl_line
	.byte	13                              @ Abbrev [13] 0x44a:0x2d DW_TAG_enumeration_type
	.long	566                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	4                               @ DW_AT_decl_file
	.byte	102                             @ DW_AT_decl_line
	.byte	14                              @ Abbrev [14] 0x452:0x6 DW_TAG_enumerator
	.long	.Linfo_string62                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x458:0x6 DW_TAG_enumerator
	.long	.Linfo_string63                 @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x45e:0x6 DW_TAG_enumerator
	.long	.Linfo_string64                 @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x464:0x6 DW_TAG_enumerator
	.long	.Linfo_string65                 @ DW_AT_name
	.byte	3                               @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x46a:0x6 DW_TAG_enumerator
	.long	.Linfo_string66                 @ DW_AT_name
	.byte	4                               @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x470:0x6 DW_TAG_enumerator
	.long	.Linfo_string67                 @ DW_AT_name
	.byte	5                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	15                              @ Abbrev [15] 0x477:0x1 DW_TAG_pointer_type
	.byte	6                               @ Abbrev [6] 0x478:0x5 DW_TAG_pointer_type
	.long	1149                            @ DW_AT_type
	.byte	16                              @ Abbrev [16] 0x47d:0x7 DW_TAG_subroutine_type
                                        @ DW_AT_prototyped
	.byte	17                              @ Abbrev [17] 0x47e:0x5 DW_TAG_formal_parameter
	.long	1156                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0x484:0x5 DW_TAG_pointer_type
	.long	612                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0x489:0x5 DW_TAG_volatile_type
	.long	1166                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x48e:0xb DW_TAG_typedef
	.long	1177                            @ DW_AT_type
	.long	.Linfo_string93                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	122                             @ DW_AT_decl_line
	.byte	13                              @ Abbrev [13] 0x499:0x4d DW_TAG_enumeration_type
	.long	566                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.byte	106                             @ DW_AT_decl_line
	.byte	14                              @ Abbrev [14] 0x4a1:0x6 DW_TAG_enumerator
	.long	.Linfo_string82                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x4a7:0x6 DW_TAG_enumerator
	.long	.Linfo_string83                 @ DW_AT_name
	.byte	32                              @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x4ad:0x6 DW_TAG_enumerator
	.long	.Linfo_string84                 @ DW_AT_name
	.byte	36                              @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x4b3:0x6 DW_TAG_enumerator
	.long	.Linfo_string85                 @ DW_AT_name
	.byte	33                              @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x4b9:0x6 DW_TAG_enumerator
	.long	.Linfo_string86                 @ DW_AT_name
	.byte	34                              @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x4bf:0x6 DW_TAG_enumerator
	.long	.Linfo_string87                 @ DW_AT_name
	.byte	40                              @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x4c5:0x6 DW_TAG_enumerator
	.long	.Linfo_string88                 @ DW_AT_name
	.byte	41                              @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x4cb:0x6 DW_TAG_enumerator
	.long	.Linfo_string89                 @ DW_AT_name
	.byte	42                              @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x4d1:0x6 DW_TAG_enumerator
	.long	.Linfo_string90                 @ DW_AT_name
	.byte	96                              @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x4d7:0x7 DW_TAG_enumerator
	.long	.Linfo_string91                 @ DW_AT_name
	.ascii	"\240\001"                      @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x4de:0x7 DW_TAG_enumerator
	.long	.Linfo_string92                 @ DW_AT_name
	.ascii	"\340\001"                      @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	10                              @ Abbrev [10] 0x4e6:0x5 DW_TAG_volatile_type
	.long	1259                            @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x4eb:0xb DW_TAG_typedef
	.long	1270                            @ DW_AT_type
	.long	.Linfo_string98                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	153                             @ DW_AT_decl_line
	.byte	13                              @ Abbrev [13] 0x4f6:0x21 DW_TAG_enumeration_type
	.long	566                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.byte	146                             @ DW_AT_decl_line
	.byte	14                              @ Abbrev [14] 0x4fe:0x6 DW_TAG_enumerator
	.long	.Linfo_string94                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x504:0x6 DW_TAG_enumerator
	.long	.Linfo_string95                 @ DW_AT_name
	.byte	16                              @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x50a:0x6 DW_TAG_enumerator
	.long	.Linfo_string96                 @ DW_AT_name
	.byte	32                              @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x510:0x6 DW_TAG_enumerator
	.long	.Linfo_string97                 @ DW_AT_name
	.byte	64                              @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	2                               @ Abbrev [2] 0x517:0x11 DW_TAG_variable
	.long	.Linfo_string104                @ DW_AT_name
	.long	601                             @ DW_AT_type
                                        @ DW_AT_external
	.byte	6                               @ DW_AT_decl_file
	.byte	28                              @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	hdma_i2c1_rx
	.byte	2                               @ Abbrev [2] 0x528:0x11 DW_TAG_variable
	.long	.Linfo_string105                @ DW_AT_name
	.long	601                             @ DW_AT_type
                                        @ DW_AT_external
	.byte	6                               @ DW_AT_decl_file
	.byte	29                              @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	hdma_i2c1_tx
	.byte	13                              @ Abbrev [13] 0x539:0x21 DW_TAG_enumeration_type
	.long	566                             @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	5                               @ DW_AT_decl_file
	.byte	38                              @ DW_AT_decl_line
	.byte	14                              @ Abbrev [14] 0x541:0x6 DW_TAG_enumerator
	.long	.Linfo_string106                @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x547:0x6 DW_TAG_enumerator
	.long	.Linfo_string107                @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x54d:0x6 DW_TAG_enumerator
	.long	.Linfo_string108                @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	14                              @ Abbrev [14] 0x553:0x6 DW_TAG_enumerator
	.long	.Linfo_string109                @ DW_AT_name
	.byte	3                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	13                              @ Abbrev [13] 0x55a:0x230 DW_TAG_enumeration_type
	.long	1930                            @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	2                               @ DW_AT_decl_file
	.byte	65                              @ DW_AT_decl_line
	.byte	18                              @ Abbrev [18] 0x562:0x6 DW_TAG_enumerator
	.long	.Linfo_string111                @ DW_AT_name
	.byte	114                             @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x568:0x6 DW_TAG_enumerator
	.long	.Linfo_string112                @ DW_AT_name
	.byte	116                             @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x56e:0x6 DW_TAG_enumerator
	.long	.Linfo_string113                @ DW_AT_name
	.byte	117                             @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x574:0x6 DW_TAG_enumerator
	.long	.Linfo_string114                @ DW_AT_name
	.byte	118                             @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x57a:0x6 DW_TAG_enumerator
	.long	.Linfo_string115                @ DW_AT_name
	.byte	123                             @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x580:0x6 DW_TAG_enumerator
	.long	.Linfo_string116                @ DW_AT_name
	.byte	124                             @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x586:0x6 DW_TAG_enumerator
	.long	.Linfo_string117                @ DW_AT_name
	.byte	126                             @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x58c:0x6 DW_TAG_enumerator
	.long	.Linfo_string118                @ DW_AT_name
	.byte	127                             @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x592:0x6 DW_TAG_enumerator
	.long	.Linfo_string119                @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x598:0x6 DW_TAG_enumerator
	.long	.Linfo_string120                @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x59e:0x6 DW_TAG_enumerator
	.long	.Linfo_string121                @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5a4:0x6 DW_TAG_enumerator
	.long	.Linfo_string122                @ DW_AT_name
	.byte	3                               @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5aa:0x6 DW_TAG_enumerator
	.long	.Linfo_string123                @ DW_AT_name
	.byte	4                               @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5b0:0x6 DW_TAG_enumerator
	.long	.Linfo_string124                @ DW_AT_name
	.byte	5                               @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5b6:0x6 DW_TAG_enumerator
	.long	.Linfo_string125                @ DW_AT_name
	.byte	6                               @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5bc:0x6 DW_TAG_enumerator
	.long	.Linfo_string126                @ DW_AT_name
	.byte	7                               @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5c2:0x6 DW_TAG_enumerator
	.long	.Linfo_string127                @ DW_AT_name
	.byte	8                               @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5c8:0x6 DW_TAG_enumerator
	.long	.Linfo_string128                @ DW_AT_name
	.byte	9                               @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5ce:0x6 DW_TAG_enumerator
	.long	.Linfo_string129                @ DW_AT_name
	.byte	10                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5d4:0x6 DW_TAG_enumerator
	.long	.Linfo_string130                @ DW_AT_name
	.byte	11                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5da:0x6 DW_TAG_enumerator
	.long	.Linfo_string131                @ DW_AT_name
	.byte	12                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5e0:0x6 DW_TAG_enumerator
	.long	.Linfo_string132                @ DW_AT_name
	.byte	13                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5e6:0x6 DW_TAG_enumerator
	.long	.Linfo_string133                @ DW_AT_name
	.byte	14                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5ec:0x6 DW_TAG_enumerator
	.long	.Linfo_string134                @ DW_AT_name
	.byte	15                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5f2:0x6 DW_TAG_enumerator
	.long	.Linfo_string135                @ DW_AT_name
	.byte	16                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5f8:0x6 DW_TAG_enumerator
	.long	.Linfo_string136                @ DW_AT_name
	.byte	17                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x5fe:0x6 DW_TAG_enumerator
	.long	.Linfo_string137                @ DW_AT_name
	.byte	18                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x604:0x6 DW_TAG_enumerator
	.long	.Linfo_string138                @ DW_AT_name
	.byte	19                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x60a:0x6 DW_TAG_enumerator
	.long	.Linfo_string139                @ DW_AT_name
	.byte	20                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x610:0x6 DW_TAG_enumerator
	.long	.Linfo_string140                @ DW_AT_name
	.byte	21                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x616:0x6 DW_TAG_enumerator
	.long	.Linfo_string141                @ DW_AT_name
	.byte	22                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x61c:0x6 DW_TAG_enumerator
	.long	.Linfo_string142                @ DW_AT_name
	.byte	23                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x622:0x6 DW_TAG_enumerator
	.long	.Linfo_string143                @ DW_AT_name
	.byte	24                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x628:0x6 DW_TAG_enumerator
	.long	.Linfo_string144                @ DW_AT_name
	.byte	25                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x62e:0x6 DW_TAG_enumerator
	.long	.Linfo_string145                @ DW_AT_name
	.byte	26                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x634:0x6 DW_TAG_enumerator
	.long	.Linfo_string146                @ DW_AT_name
	.byte	27                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x63a:0x6 DW_TAG_enumerator
	.long	.Linfo_string147                @ DW_AT_name
	.byte	28                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x640:0x6 DW_TAG_enumerator
	.long	.Linfo_string148                @ DW_AT_name
	.byte	29                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x646:0x6 DW_TAG_enumerator
	.long	.Linfo_string149                @ DW_AT_name
	.byte	30                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x64c:0x6 DW_TAG_enumerator
	.long	.Linfo_string150                @ DW_AT_name
	.byte	31                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x652:0x6 DW_TAG_enumerator
	.long	.Linfo_string151                @ DW_AT_name
	.byte	32                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x658:0x6 DW_TAG_enumerator
	.long	.Linfo_string152                @ DW_AT_name
	.byte	33                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x65e:0x6 DW_TAG_enumerator
	.long	.Linfo_string153                @ DW_AT_name
	.byte	34                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x664:0x6 DW_TAG_enumerator
	.long	.Linfo_string154                @ DW_AT_name
	.byte	35                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x66a:0x6 DW_TAG_enumerator
	.long	.Linfo_string155                @ DW_AT_name
	.byte	36                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x670:0x6 DW_TAG_enumerator
	.long	.Linfo_string156                @ DW_AT_name
	.byte	37                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x676:0x6 DW_TAG_enumerator
	.long	.Linfo_string157                @ DW_AT_name
	.byte	38                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x67c:0x6 DW_TAG_enumerator
	.long	.Linfo_string158                @ DW_AT_name
	.byte	39                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x682:0x6 DW_TAG_enumerator
	.long	.Linfo_string159                @ DW_AT_name
	.byte	40                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x688:0x6 DW_TAG_enumerator
	.long	.Linfo_string160                @ DW_AT_name
	.byte	41                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x68e:0x6 DW_TAG_enumerator
	.long	.Linfo_string161                @ DW_AT_name
	.byte	42                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x694:0x6 DW_TAG_enumerator
	.long	.Linfo_string162                @ DW_AT_name
	.byte	43                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x69a:0x6 DW_TAG_enumerator
	.long	.Linfo_string163                @ DW_AT_name
	.byte	44                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6a0:0x6 DW_TAG_enumerator
	.long	.Linfo_string164                @ DW_AT_name
	.byte	45                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6a6:0x6 DW_TAG_enumerator
	.long	.Linfo_string165                @ DW_AT_name
	.byte	46                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6ac:0x6 DW_TAG_enumerator
	.long	.Linfo_string166                @ DW_AT_name
	.byte	47                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6b2:0x6 DW_TAG_enumerator
	.long	.Linfo_string167                @ DW_AT_name
	.byte	48                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6b8:0x6 DW_TAG_enumerator
	.long	.Linfo_string168                @ DW_AT_name
	.byte	49                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6be:0x6 DW_TAG_enumerator
	.long	.Linfo_string169                @ DW_AT_name
	.byte	50                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6c4:0x6 DW_TAG_enumerator
	.long	.Linfo_string170                @ DW_AT_name
	.byte	51                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6ca:0x6 DW_TAG_enumerator
	.long	.Linfo_string171                @ DW_AT_name
	.byte	52                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6d0:0x6 DW_TAG_enumerator
	.long	.Linfo_string172                @ DW_AT_name
	.byte	53                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6d6:0x6 DW_TAG_enumerator
	.long	.Linfo_string173                @ DW_AT_name
	.byte	54                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6dc:0x6 DW_TAG_enumerator
	.long	.Linfo_string174                @ DW_AT_name
	.byte	55                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6e2:0x6 DW_TAG_enumerator
	.long	.Linfo_string175                @ DW_AT_name
	.byte	56                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6e8:0x6 DW_TAG_enumerator
	.long	.Linfo_string176                @ DW_AT_name
	.byte	57                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6ee:0x6 DW_TAG_enumerator
	.long	.Linfo_string177                @ DW_AT_name
	.byte	58                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6f4:0x6 DW_TAG_enumerator
	.long	.Linfo_string178                @ DW_AT_name
	.byte	59                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x6fa:0x6 DW_TAG_enumerator
	.long	.Linfo_string179                @ DW_AT_name
	.byte	60                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x700:0x6 DW_TAG_enumerator
	.long	.Linfo_string180                @ DW_AT_name
	.byte	61                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x706:0x6 DW_TAG_enumerator
	.long	.Linfo_string181                @ DW_AT_name
	.byte	62                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x70c:0x6 DW_TAG_enumerator
	.long	.Linfo_string182                @ DW_AT_name
	.byte	63                              @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x712:0x7 DW_TAG_enumerator
	.long	.Linfo_string183                @ DW_AT_name
	.asciz	"\300"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x719:0x7 DW_TAG_enumerator
	.long	.Linfo_string184                @ DW_AT_name
	.asciz	"\301"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x720:0x7 DW_TAG_enumerator
	.long	.Linfo_string185                @ DW_AT_name
	.asciz	"\302"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x727:0x7 DW_TAG_enumerator
	.long	.Linfo_string186                @ DW_AT_name
	.asciz	"\303"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x72e:0x7 DW_TAG_enumerator
	.long	.Linfo_string187                @ DW_AT_name
	.asciz	"\304"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x735:0x7 DW_TAG_enumerator
	.long	.Linfo_string188                @ DW_AT_name
	.asciz	"\305"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x73c:0x7 DW_TAG_enumerator
	.long	.Linfo_string189                @ DW_AT_name
	.asciz	"\306"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x743:0x7 DW_TAG_enumerator
	.long	.Linfo_string190                @ DW_AT_name
	.asciz	"\307"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x74a:0x7 DW_TAG_enumerator
	.long	.Linfo_string191                @ DW_AT_name
	.asciz	"\310"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x751:0x7 DW_TAG_enumerator
	.long	.Linfo_string192                @ DW_AT_name
	.asciz	"\311"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x758:0x7 DW_TAG_enumerator
	.long	.Linfo_string193                @ DW_AT_name
	.asciz	"\312"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x75f:0x7 DW_TAG_enumerator
	.long	.Linfo_string194                @ DW_AT_name
	.asciz	"\313"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x766:0x7 DW_TAG_enumerator
	.long	.Linfo_string195                @ DW_AT_name
	.asciz	"\314"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x76d:0x7 DW_TAG_enumerator
	.long	.Linfo_string196                @ DW_AT_name
	.asciz	"\315"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x774:0x7 DW_TAG_enumerator
	.long	.Linfo_string197                @ DW_AT_name
	.asciz	"\316"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x77b:0x7 DW_TAG_enumerator
	.long	.Linfo_string198                @ DW_AT_name
	.asciz	"\320"                          @ DW_AT_const_value
	.byte	18                              @ Abbrev [18] 0x782:0x7 DW_TAG_enumerator
	.long	.Linfo_string199                @ DW_AT_name
	.asciz	"\321"                          @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x78a:0x7 DW_TAG_base_type
	.long	.Linfo_string110                @ DW_AT_name
	.byte	6                               @ DW_AT_encoding
	.byte	1                               @ DW_AT_byte_size
	.byte	6                               @ Abbrev [6] 0x791:0x5 DW_TAG_pointer_type
	.long	1942                            @ DW_AT_type
	.byte	7                               @ Abbrev [7] 0x796:0xc DW_TAG_typedef
	.long	1954                            @ DW_AT_type
	.long	.Linfo_string230                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	628                             @ DW_AT_decl_line
	.byte	8                               @ Abbrev [8] 0x7a2:0x18c DW_TAG_structure_type
	.byte	136                             @ DW_AT_byte_size
	.byte	2                               @ DW_AT_decl_file
	.short	596                             @ DW_AT_decl_line
	.byte	9                               @ Abbrev [9] 0x7a7:0xd DW_TAG_member
	.long	.Linfo_string37                 @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	598                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x7b4:0xd DW_TAG_member
	.long	.Linfo_string200                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	599                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x7c1:0xd DW_TAG_member
	.long	.Linfo_string201                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	600                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x7ce:0xd DW_TAG_member
	.long	.Linfo_string202                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	601                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x7db:0xd DW_TAG_member
	.long	.Linfo_string203                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	602                             @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x7e8:0xd DW_TAG_member
	.long	.Linfo_string204                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	603                             @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x7f5:0xd DW_TAG_member
	.long	.Linfo_string205                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	604                             @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x802:0xd DW_TAG_member
	.long	.Linfo_string206                @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	605                             @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x80f:0xd DW_TAG_member
	.long	.Linfo_string207                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	606                             @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x81c:0xd DW_TAG_member
	.long	.Linfo_string208                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	607                             @ DW_AT_decl_line
	.byte	36                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x829:0xd DW_TAG_member
	.long	.Linfo_string209                @ DW_AT_name
	.long	2350                            @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	608                             @ DW_AT_decl_line
	.byte	40                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x836:0xd DW_TAG_member
	.long	.Linfo_string211                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	609                             @ DW_AT_decl_line
	.byte	48                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x843:0xd DW_TAG_member
	.long	.Linfo_string212                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	610                             @ DW_AT_decl_line
	.byte	52                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x850:0xd DW_TAG_member
	.long	.Linfo_string213                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	611                             @ DW_AT_decl_line
	.byte	56                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x85d:0xd DW_TAG_member
	.long	.Linfo_string214                @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	612                             @ DW_AT_decl_line
	.byte	60                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x86a:0xd DW_TAG_member
	.long	.Linfo_string215                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	613                             @ DW_AT_decl_line
	.byte	64                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x877:0xd DW_TAG_member
	.long	.Linfo_string216                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	614                             @ DW_AT_decl_line
	.byte	68                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x884:0xd DW_TAG_member
	.long	.Linfo_string217                @ DW_AT_name
	.long	2350                            @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	615                             @ DW_AT_decl_line
	.byte	72                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x891:0xd DW_TAG_member
	.long	.Linfo_string218                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	616                             @ DW_AT_decl_line
	.byte	80                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x89e:0xd DW_TAG_member
	.long	.Linfo_string219                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	617                             @ DW_AT_decl_line
	.byte	84                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x8ab:0xd DW_TAG_member
	.long	.Linfo_string220                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	618                             @ DW_AT_decl_line
	.byte	88                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x8b8:0xd DW_TAG_member
	.long	.Linfo_string221                @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	619                             @ DW_AT_decl_line
	.byte	92                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x8c5:0xd DW_TAG_member
	.long	.Linfo_string222                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	620                             @ DW_AT_decl_line
	.byte	96                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x8d2:0xd DW_TAG_member
	.long	.Linfo_string223                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	621                             @ DW_AT_decl_line
	.byte	100                             @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x8df:0xd DW_TAG_member
	.long	.Linfo_string224                @ DW_AT_name
	.long	2350                            @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	622                             @ DW_AT_decl_line
	.byte	104                             @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x8ec:0xd DW_TAG_member
	.long	.Linfo_string225                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	623                             @ DW_AT_decl_line
	.byte	112                             @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x8f9:0xd DW_TAG_member
	.long	.Linfo_string226                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	624                             @ DW_AT_decl_line
	.byte	116                             @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x906:0xd DW_TAG_member
	.long	.Linfo_string227                @ DW_AT_name
	.long	2350                            @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	625                             @ DW_AT_decl_line
	.byte	120                             @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x913:0xd DW_TAG_member
	.long	.Linfo_string228                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	626                             @ DW_AT_decl_line
	.byte	128                             @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x920:0xd DW_TAG_member
	.long	.Linfo_string229                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	627                             @ DW_AT_decl_line
	.byte	132                             @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	19                              @ Abbrev [19] 0x92e:0xc DW_TAG_array_type
	.long	420                             @ DW_AT_type
	.byte	20                              @ Abbrev [20] 0x933:0x6 DW_TAG_subrange_type
	.long	2362                            @ DW_AT_type
	.byte	2                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	21                              @ Abbrev [21] 0x93a:0x7 DW_TAG_base_type
	.long	.Linfo_string210                @ DW_AT_name
	.byte	8                               @ DW_AT_byte_size
	.byte	7                               @ DW_AT_encoding
	.byte	6                               @ Abbrev [6] 0x941:0x5 DW_TAG_pointer_type
	.long	2374                            @ DW_AT_type
	.byte	7                               @ Abbrev [7] 0x946:0xc DW_TAG_typedef
	.long	2386                            @ DW_AT_type
	.long	.Linfo_string240                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.short	537                             @ DW_AT_decl_line
	.byte	8                               @ Abbrev [8] 0x952:0x7b DW_TAG_structure_type
	.byte	40                              @ DW_AT_byte_size
	.byte	2                               @ DW_AT_decl_file
	.short	526                             @ DW_AT_decl_line
	.byte	9                               @ Abbrev [9] 0x957:0xd DW_TAG_member
	.long	.Linfo_string231                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	528                             @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x964:0xd DW_TAG_member
	.long	.Linfo_string232                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	529                             @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x971:0xd DW_TAG_member
	.long	.Linfo_string233                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	530                             @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x97e:0xd DW_TAG_member
	.long	.Linfo_string234                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	531                             @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x98b:0xd DW_TAG_member
	.long	.Linfo_string235                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	532                             @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x998:0xd DW_TAG_member
	.long	.Linfo_string236                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	533                             @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x9a5:0xd DW_TAG_member
	.long	.Linfo_string237                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	534                             @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x9b2:0xd DW_TAG_member
	.long	.Linfo_string238                @ DW_AT_name
	.long	415                             @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	535                             @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	9                               @ Abbrev [9] 0x9bf:0xd DW_TAG_member
	.long	.Linfo_string239                @ DW_AT_name
	.long	2509                            @ DW_AT_type
	.byte	2                               @ DW_AT_decl_file
	.short	536                             @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	19                              @ Abbrev [19] 0x9cd:0xc DW_TAG_array_type
	.long	415                             @ DW_AT_type
	.byte	20                              @ Abbrev [20] 0x9d2:0x6 DW_TAG_subrange_type
	.long	2362                            @ DW_AT_type
	.byte	2                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	22                              @ Abbrev [22] 0x9d9:0x11 DW_TAG_subprogram
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string241                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	32                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	23                              @ Abbrev [23] 0x9ea:0x76 DW_TAG_subprogram
	.long	.Lfunc_begin1                   @ DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string242                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	61                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	24                              @ Abbrev [24] 0x9fb:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	52
	.long	.Linfo_string244                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	61                              @ DW_AT_decl_line
	.long	2688                            @ DW_AT_type
	.byte	25                              @ Abbrev [25] 0xa09:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	32
	.long	.Linfo_string245                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	64                              @ DW_AT_decl_line
	.long	2693                            @ DW_AT_type
	.byte	26                              @ Abbrev [26] 0xa17:0x18 DW_TAG_lexical_block
	.long	.Ltmp10                         @ DW_AT_low_pc
	.long	.Ltmp11-.Ltmp10                 @ DW_AT_high_pc
	.byte	25                              @ Abbrev [25] 0xa20:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	28
	.long	.Linfo_string251                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	68                              @ DW_AT_decl_line
	.long	415                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	26                              @ Abbrev [26] 0xa2f:0x18 DW_TAG_lexical_block
	.long	.Ltmp12                         @ DW_AT_low_pc
	.long	.Ltmp13-.Ltmp12                 @ DW_AT_high_pc
	.byte	25                              @ Abbrev [25] 0xa38:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	24
	.long	.Linfo_string251                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	71                              @ DW_AT_decl_line
	.long	415                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	26                              @ Abbrev [26] 0xa47:0x18 DW_TAG_lexical_block
	.long	.Ltmp14                         @ DW_AT_low_pc
	.long	.Ltmp15-.Ltmp14                 @ DW_AT_high_pc
	.byte	25                              @ Abbrev [25] 0xa50:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	20
	.long	.Linfo_string251                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	84                              @ DW_AT_decl_line
	.long	415                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	23                              @ Abbrev [23] 0xa60:0x20 DW_TAG_subprogram
	.long	.Lfunc_begin2                   @ DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string243                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	134                             @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	24                              @ Abbrev [24] 0xa71:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.long	.Linfo_string244                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	134                             @ DW_AT_decl_line
	.long	2688                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0xa80:0x5 DW_TAG_pointer_type
	.long	55                              @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0xa85:0xb DW_TAG_typedef
	.long	2704                            @ DW_AT_type
	.long	.Linfo_string250                @ DW_AT_name
	.byte	7                               @ DW_AT_decl_file
	.byte	62                              @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0xa90:0x41 DW_TAG_structure_type
	.byte	20                              @ DW_AT_byte_size
	.byte	7                               @ DW_AT_decl_file
	.byte	46                              @ DW_AT_decl_line
	.byte	5                               @ Abbrev [5] 0xa94:0xc DW_TAG_member
	.long	.Linfo_string246                @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xaa0:0xc DW_TAG_member
	.long	.Linfo_string50                 @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.byte	51                              @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xaac:0xc DW_TAG_member
	.long	.Linfo_string247                @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.byte	54                              @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xab8:0xc DW_TAG_member
	.long	.Linfo_string248                @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.byte	57                              @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	5                               @ Abbrev [5] 0xac4:0xc DW_TAG_member
	.long	.Linfo_string249                @ DW_AT_name
	.long	420                             @ DW_AT_type
	.byte	7                               @ DW_AT_decl_file
	.byte	60                              @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
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
	.long	0
	.long	0
	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"Component: Arm Compiler for Embedded 6.19 Tool: armclang [5e73cb00]" @ string offset=0
.Linfo_string1:
	.asciz	"../Core/Src\\i2c.c"            @ string offset=68
.Linfo_string2:
	.asciz	"C:\\Users\\DELL\\Desktop\\NewFolder\\OpticalFiberAmplifierTestRack\\MDK-ARM" @ string offset=86
.Linfo_string3:
	.asciz	"hi2c1"                         @ string offset=156
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
	.asciz	"OAR1"                          @ string offset=201
.Linfo_string10:
	.asciz	"OAR2"                          @ string offset=206
.Linfo_string11:
	.asciz	"DR"                            @ string offset=211
.Linfo_string12:
	.asciz	"SR1"                           @ string offset=214
.Linfo_string13:
	.asciz	"SR2"                           @ string offset=218
.Linfo_string14:
	.asciz	"CCR"                           @ string offset=222
.Linfo_string15:
	.asciz	"TRISE"                         @ string offset=226
.Linfo_string16:
	.asciz	"I2C_TypeDef"                   @ string offset=232
.Linfo_string17:
	.asciz	"Init"                          @ string offset=244
.Linfo_string18:
	.asciz	"ClockSpeed"                    @ string offset=249
.Linfo_string19:
	.asciz	"DutyCycle"                     @ string offset=260
.Linfo_string20:
	.asciz	"OwnAddress1"                   @ string offset=270
.Linfo_string21:
	.asciz	"AddressingMode"                @ string offset=282
.Linfo_string22:
	.asciz	"DualAddressMode"               @ string offset=297
.Linfo_string23:
	.asciz	"OwnAddress2"                   @ string offset=313
.Linfo_string24:
	.asciz	"GeneralCallMode"               @ string offset=325
.Linfo_string25:
	.asciz	"NoStretchMode"                 @ string offset=341
.Linfo_string26:
	.asciz	"I2C_InitTypeDef"               @ string offset=355
.Linfo_string27:
	.asciz	"pBuffPtr"                      @ string offset=371
.Linfo_string28:
	.asciz	"unsigned char"                 @ string offset=380
.Linfo_string29:
	.asciz	"uint8_t"                       @ string offset=394
.Linfo_string30:
	.asciz	"XferSize"                      @ string offset=402
.Linfo_string31:
	.asciz	"unsigned short"                @ string offset=411
.Linfo_string32:
	.asciz	"uint16_t"                      @ string offset=426
.Linfo_string33:
	.asciz	"XferCount"                     @ string offset=435
.Linfo_string34:
	.asciz	"XferOptions"                   @ string offset=445
.Linfo_string35:
	.asciz	"PreviousState"                 @ string offset=457
.Linfo_string36:
	.asciz	"hdmatx"                        @ string offset=471
.Linfo_string37:
	.asciz	"CR"                            @ string offset=478
.Linfo_string38:
	.asciz	"NDTR"                          @ string offset=481
.Linfo_string39:
	.asciz	"PAR"                           @ string offset=486
.Linfo_string40:
	.asciz	"M0AR"                          @ string offset=490
.Linfo_string41:
	.asciz	"M1AR"                          @ string offset=495
.Linfo_string42:
	.asciz	"FCR"                           @ string offset=500
.Linfo_string43:
	.asciz	"DMA_Stream_TypeDef"            @ string offset=504
.Linfo_string44:
	.asciz	"Channel"                       @ string offset=523
.Linfo_string45:
	.asciz	"Direction"                     @ string offset=531
.Linfo_string46:
	.asciz	"PeriphInc"                     @ string offset=541
.Linfo_string47:
	.asciz	"MemInc"                        @ string offset=551
.Linfo_string48:
	.asciz	"PeriphDataAlignment"           @ string offset=558
.Linfo_string49:
	.asciz	"MemDataAlignment"              @ string offset=578
.Linfo_string50:
	.asciz	"Mode"                          @ string offset=595
.Linfo_string51:
	.asciz	"Priority"                      @ string offset=600
.Linfo_string52:
	.asciz	"FIFOMode"                      @ string offset=609
.Linfo_string53:
	.asciz	"FIFOThreshold"                 @ string offset=618
.Linfo_string54:
	.asciz	"MemBurst"                      @ string offset=632
.Linfo_string55:
	.asciz	"PeriphBurst"                   @ string offset=641
.Linfo_string56:
	.asciz	"DMA_InitTypeDef"               @ string offset=653
.Linfo_string57:
	.asciz	"Lock"                          @ string offset=669
.Linfo_string58:
	.asciz	"HAL_UNLOCKED"                  @ string offset=674
.Linfo_string59:
	.asciz	"HAL_LOCKED"                    @ string offset=687
.Linfo_string60:
	.asciz	"HAL_LockTypeDef"               @ string offset=698
.Linfo_string61:
	.asciz	"State"                         @ string offset=714
.Linfo_string62:
	.asciz	"HAL_DMA_STATE_RESET"           @ string offset=720
.Linfo_string63:
	.asciz	"HAL_DMA_STATE_READY"           @ string offset=740
.Linfo_string64:
	.asciz	"HAL_DMA_STATE_BUSY"            @ string offset=760
.Linfo_string65:
	.asciz	"HAL_DMA_STATE_TIMEOUT"         @ string offset=779
.Linfo_string66:
	.asciz	"HAL_DMA_STATE_ERROR"           @ string offset=801
.Linfo_string67:
	.asciz	"HAL_DMA_STATE_ABORT"           @ string offset=821
.Linfo_string68:
	.asciz	"HAL_DMA_StateTypeDef"          @ string offset=841
.Linfo_string69:
	.asciz	"Parent"                        @ string offset=862
.Linfo_string70:
	.asciz	"XferCpltCallback"              @ string offset=869
.Linfo_string71:
	.asciz	"XferHalfCpltCallback"          @ string offset=886
.Linfo_string72:
	.asciz	"XferM1CpltCallback"            @ string offset=907
.Linfo_string73:
	.asciz	"XferM1HalfCpltCallback"        @ string offset=926
.Linfo_string74:
	.asciz	"XferErrorCallback"             @ string offset=949
.Linfo_string75:
	.asciz	"XferAbortCallback"             @ string offset=967
.Linfo_string76:
	.asciz	"ErrorCode"                     @ string offset=985
.Linfo_string77:
	.asciz	"StreamBaseAddress"             @ string offset=995
.Linfo_string78:
	.asciz	"StreamIndex"                   @ string offset=1013
.Linfo_string79:
	.asciz	"__DMA_HandleTypeDef"           @ string offset=1025
.Linfo_string80:
	.asciz	"DMA_HandleTypeDef"             @ string offset=1045
.Linfo_string81:
	.asciz	"hdmarx"                        @ string offset=1063
.Linfo_string82:
	.asciz	"HAL_I2C_STATE_RESET"           @ string offset=1070
.Linfo_string83:
	.asciz	"HAL_I2C_STATE_READY"           @ string offset=1090
.Linfo_string84:
	.asciz	"HAL_I2C_STATE_BUSY"            @ string offset=1110
.Linfo_string85:
	.asciz	"HAL_I2C_STATE_BUSY_TX"         @ string offset=1129
.Linfo_string86:
	.asciz	"HAL_I2C_STATE_BUSY_RX"         @ string offset=1151
.Linfo_string87:
	.asciz	"HAL_I2C_STATE_LISTEN"          @ string offset=1173
.Linfo_string88:
	.asciz	"HAL_I2C_STATE_BUSY_TX_LISTEN"  @ string offset=1194
.Linfo_string89:
	.asciz	"HAL_I2C_STATE_BUSY_RX_LISTEN"  @ string offset=1223
.Linfo_string90:
	.asciz	"HAL_I2C_STATE_ABORT"           @ string offset=1252
.Linfo_string91:
	.asciz	"HAL_I2C_STATE_TIMEOUT"         @ string offset=1272
.Linfo_string92:
	.asciz	"HAL_I2C_STATE_ERROR"           @ string offset=1294
.Linfo_string93:
	.asciz	"HAL_I2C_StateTypeDef"          @ string offset=1314
.Linfo_string94:
	.asciz	"HAL_I2C_MODE_NONE"             @ string offset=1335
.Linfo_string95:
	.asciz	"HAL_I2C_MODE_MASTER"           @ string offset=1353
.Linfo_string96:
	.asciz	"HAL_I2C_MODE_SLAVE"            @ string offset=1373
.Linfo_string97:
	.asciz	"HAL_I2C_MODE_MEM"              @ string offset=1392
.Linfo_string98:
	.asciz	"HAL_I2C_ModeTypeDef"           @ string offset=1409
.Linfo_string99:
	.asciz	"Devaddress"                    @ string offset=1429
.Linfo_string100:
	.asciz	"Memaddress"                    @ string offset=1440
.Linfo_string101:
	.asciz	"MemaddSize"                    @ string offset=1451
.Linfo_string102:
	.asciz	"EventCount"                    @ string offset=1462
.Linfo_string103:
	.asciz	"I2C_HandleTypeDef"             @ string offset=1473
.Linfo_string104:
	.asciz	"hdma_i2c1_rx"                  @ string offset=1491
.Linfo_string105:
	.asciz	"hdma_i2c1_tx"                  @ string offset=1504
.Linfo_string106:
	.asciz	"HAL_OK"                        @ string offset=1517
.Linfo_string107:
	.asciz	"HAL_ERROR"                     @ string offset=1524
.Linfo_string108:
	.asciz	"HAL_BUSY"                      @ string offset=1534
.Linfo_string109:
	.asciz	"HAL_TIMEOUT"                   @ string offset=1543
.Linfo_string110:
	.asciz	"signed char"                   @ string offset=1555
.Linfo_string111:
	.asciz	"NonMaskableInt_IRQn"           @ string offset=1567
.Linfo_string112:
	.asciz	"MemoryManagement_IRQn"         @ string offset=1587
.Linfo_string113:
	.asciz	"BusFault_IRQn"                 @ string offset=1609
.Linfo_string114:
	.asciz	"UsageFault_IRQn"               @ string offset=1623
.Linfo_string115:
	.asciz	"SVCall_IRQn"                   @ string offset=1639
.Linfo_string116:
	.asciz	"DebugMonitor_IRQn"             @ string offset=1651
.Linfo_string117:
	.asciz	"PendSV_IRQn"                   @ string offset=1669
.Linfo_string118:
	.asciz	"SysTick_IRQn"                  @ string offset=1681
.Linfo_string119:
	.asciz	"WWDG_IRQn"                     @ string offset=1694
.Linfo_string120:
	.asciz	"PVD_IRQn"                      @ string offset=1704
.Linfo_string121:
	.asciz	"TAMP_STAMP_IRQn"               @ string offset=1713
.Linfo_string122:
	.asciz	"RTC_WKUP_IRQn"                 @ string offset=1729
.Linfo_string123:
	.asciz	"FLASH_IRQn"                    @ string offset=1743
.Linfo_string124:
	.asciz	"RCC_IRQn"                      @ string offset=1754
.Linfo_string125:
	.asciz	"EXTI0_IRQn"                    @ string offset=1763
.Linfo_string126:
	.asciz	"EXTI1_IRQn"                    @ string offset=1774
.Linfo_string127:
	.asciz	"EXTI2_IRQn"                    @ string offset=1785
.Linfo_string128:
	.asciz	"EXTI3_IRQn"                    @ string offset=1796
.Linfo_string129:
	.asciz	"EXTI4_IRQn"                    @ string offset=1807
.Linfo_string130:
	.asciz	"DMA1_Stream0_IRQn"             @ string offset=1818
.Linfo_string131:
	.asciz	"DMA1_Stream1_IRQn"             @ string offset=1836
.Linfo_string132:
	.asciz	"DMA1_Stream2_IRQn"             @ string offset=1854
.Linfo_string133:
	.asciz	"DMA1_Stream3_IRQn"             @ string offset=1872
.Linfo_string134:
	.asciz	"DMA1_Stream4_IRQn"             @ string offset=1890
.Linfo_string135:
	.asciz	"DMA1_Stream5_IRQn"             @ string offset=1908
.Linfo_string136:
	.asciz	"DMA1_Stream6_IRQn"             @ string offset=1926
.Linfo_string137:
	.asciz	"ADC_IRQn"                      @ string offset=1944
.Linfo_string138:
	.asciz	"CAN1_TX_IRQn"                  @ string offset=1953
.Linfo_string139:
	.asciz	"CAN1_RX0_IRQn"                 @ string offset=1966
.Linfo_string140:
	.asciz	"CAN1_RX1_IRQn"                 @ string offset=1980
.Linfo_string141:
	.asciz	"CAN1_SCE_IRQn"                 @ string offset=1994
.Linfo_string142:
	.asciz	"EXTI9_5_IRQn"                  @ string offset=2008
.Linfo_string143:
	.asciz	"TIM1_BRK_TIM9_IRQn"            @ string offset=2021
.Linfo_string144:
	.asciz	"TIM1_UP_TIM10_IRQn"            @ string offset=2040
.Linfo_string145:
	.asciz	"TIM1_TRG_COM_TIM11_IRQn"       @ string offset=2059
.Linfo_string146:
	.asciz	"TIM1_CC_IRQn"                  @ string offset=2083
.Linfo_string147:
	.asciz	"TIM2_IRQn"                     @ string offset=2096
.Linfo_string148:
	.asciz	"TIM3_IRQn"                     @ string offset=2106
.Linfo_string149:
	.asciz	"TIM4_IRQn"                     @ string offset=2116
.Linfo_string150:
	.asciz	"I2C1_EV_IRQn"                  @ string offset=2126
.Linfo_string151:
	.asciz	"I2C1_ER_IRQn"                  @ string offset=2139
.Linfo_string152:
	.asciz	"I2C2_EV_IRQn"                  @ string offset=2152
.Linfo_string153:
	.asciz	"I2C2_ER_IRQn"                  @ string offset=2165
.Linfo_string154:
	.asciz	"SPI1_IRQn"                     @ string offset=2178
.Linfo_string155:
	.asciz	"SPI2_IRQn"                     @ string offset=2188
.Linfo_string156:
	.asciz	"USART1_IRQn"                   @ string offset=2198
.Linfo_string157:
	.asciz	"USART2_IRQn"                   @ string offset=2210
.Linfo_string158:
	.asciz	"USART3_IRQn"                   @ string offset=2222
.Linfo_string159:
	.asciz	"EXTI15_10_IRQn"                @ string offset=2234
.Linfo_string160:
	.asciz	"RTC_Alarm_IRQn"                @ string offset=2249
.Linfo_string161:
	.asciz	"OTG_FS_WKUP_IRQn"              @ string offset=2264
.Linfo_string162:
	.asciz	"TIM8_BRK_TIM12_IRQn"           @ string offset=2281
.Linfo_string163:
	.asciz	"TIM8_UP_TIM13_IRQn"            @ string offset=2301
.Linfo_string164:
	.asciz	"TIM8_TRG_COM_TIM14_IRQn"       @ string offset=2320
.Linfo_string165:
	.asciz	"TIM8_CC_IRQn"                  @ string offset=2344
.Linfo_string166:
	.asciz	"DMA1_Stream7_IRQn"             @ string offset=2357
.Linfo_string167:
	.asciz	"FSMC_IRQn"                     @ string offset=2375
.Linfo_string168:
	.asciz	"SDIO_IRQn"                     @ string offset=2385
.Linfo_string169:
	.asciz	"TIM5_IRQn"                     @ string offset=2395
.Linfo_string170:
	.asciz	"SPI3_IRQn"                     @ string offset=2405
.Linfo_string171:
	.asciz	"UART4_IRQn"                    @ string offset=2415
.Linfo_string172:
	.asciz	"UART5_IRQn"                    @ string offset=2426
.Linfo_string173:
	.asciz	"TIM6_DAC_IRQn"                 @ string offset=2437
.Linfo_string174:
	.asciz	"TIM7_IRQn"                     @ string offset=2451
.Linfo_string175:
	.asciz	"DMA2_Stream0_IRQn"             @ string offset=2461
.Linfo_string176:
	.asciz	"DMA2_Stream1_IRQn"             @ string offset=2479
.Linfo_string177:
	.asciz	"DMA2_Stream2_IRQn"             @ string offset=2497
.Linfo_string178:
	.asciz	"DMA2_Stream3_IRQn"             @ string offset=2515
.Linfo_string179:
	.asciz	"DMA2_Stream4_IRQn"             @ string offset=2533
.Linfo_string180:
	.asciz	"ETH_IRQn"                      @ string offset=2551
.Linfo_string181:
	.asciz	"ETH_WKUP_IRQn"                 @ string offset=2560
.Linfo_string182:
	.asciz	"CAN2_TX_IRQn"                  @ string offset=2574
.Linfo_string183:
	.asciz	"CAN2_RX0_IRQn"                 @ string offset=2587
.Linfo_string184:
	.asciz	"CAN2_RX1_IRQn"                 @ string offset=2601
.Linfo_string185:
	.asciz	"CAN2_SCE_IRQn"                 @ string offset=2615
.Linfo_string186:
	.asciz	"OTG_FS_IRQn"                   @ string offset=2629
.Linfo_string187:
	.asciz	"DMA2_Stream5_IRQn"             @ string offset=2641
.Linfo_string188:
	.asciz	"DMA2_Stream6_IRQn"             @ string offset=2659
.Linfo_string189:
	.asciz	"DMA2_Stream7_IRQn"             @ string offset=2677
.Linfo_string190:
	.asciz	"USART6_IRQn"                   @ string offset=2695
.Linfo_string191:
	.asciz	"I2C3_EV_IRQn"                  @ string offset=2707
.Linfo_string192:
	.asciz	"I2C3_ER_IRQn"                  @ string offset=2720
.Linfo_string193:
	.asciz	"OTG_HS_EP1_OUT_IRQn"           @ string offset=2733
.Linfo_string194:
	.asciz	"OTG_HS_EP1_IN_IRQn"            @ string offset=2753
.Linfo_string195:
	.asciz	"OTG_HS_WKUP_IRQn"              @ string offset=2772
.Linfo_string196:
	.asciz	"OTG_HS_IRQn"                   @ string offset=2789
.Linfo_string197:
	.asciz	"DCMI_IRQn"                     @ string offset=2801
.Linfo_string198:
	.asciz	"RNG_IRQn"                      @ string offset=2811
.Linfo_string199:
	.asciz	"FPU_IRQn"                      @ string offset=2820
.Linfo_string200:
	.asciz	"PLLCFGR"                       @ string offset=2829
.Linfo_string201:
	.asciz	"CFGR"                          @ string offset=2837
.Linfo_string202:
	.asciz	"CIR"                           @ string offset=2842
.Linfo_string203:
	.asciz	"AHB1RSTR"                      @ string offset=2846
.Linfo_string204:
	.asciz	"AHB2RSTR"                      @ string offset=2855
.Linfo_string205:
	.asciz	"AHB3RSTR"                      @ string offset=2864
.Linfo_string206:
	.asciz	"RESERVED0"                     @ string offset=2873
.Linfo_string207:
	.asciz	"APB1RSTR"                      @ string offset=2883
.Linfo_string208:
	.asciz	"APB2RSTR"                      @ string offset=2892
.Linfo_string209:
	.asciz	"RESERVED1"                     @ string offset=2901
.Linfo_string210:
	.asciz	"__ARRAY_SIZE_TYPE__"           @ string offset=2911
.Linfo_string211:
	.asciz	"AHB1ENR"                       @ string offset=2931
.Linfo_string212:
	.asciz	"AHB2ENR"                       @ string offset=2939
.Linfo_string213:
	.asciz	"AHB3ENR"                       @ string offset=2947
.Linfo_string214:
	.asciz	"RESERVED2"                     @ string offset=2955
.Linfo_string215:
	.asciz	"APB1ENR"                       @ string offset=2965
.Linfo_string216:
	.asciz	"APB2ENR"                       @ string offset=2973
.Linfo_string217:
	.asciz	"RESERVED3"                     @ string offset=2981
.Linfo_string218:
	.asciz	"AHB1LPENR"                     @ string offset=2991
.Linfo_string219:
	.asciz	"AHB2LPENR"                     @ string offset=3001
.Linfo_string220:
	.asciz	"AHB3LPENR"                     @ string offset=3011
.Linfo_string221:
	.asciz	"RESERVED4"                     @ string offset=3021
.Linfo_string222:
	.asciz	"APB1LPENR"                     @ string offset=3031
.Linfo_string223:
	.asciz	"APB2LPENR"                     @ string offset=3041
.Linfo_string224:
	.asciz	"RESERVED5"                     @ string offset=3051
.Linfo_string225:
	.asciz	"BDCR"                          @ string offset=3061
.Linfo_string226:
	.asciz	"CSR"                           @ string offset=3066
.Linfo_string227:
	.asciz	"RESERVED6"                     @ string offset=3070
.Linfo_string228:
	.asciz	"SSCGR"                         @ string offset=3080
.Linfo_string229:
	.asciz	"PLLI2SCFGR"                    @ string offset=3086
.Linfo_string230:
	.asciz	"RCC_TypeDef"                   @ string offset=3097
.Linfo_string231:
	.asciz	"MODER"                         @ string offset=3109
.Linfo_string232:
	.asciz	"OTYPER"                        @ string offset=3115
.Linfo_string233:
	.asciz	"OSPEEDR"                       @ string offset=3122
.Linfo_string234:
	.asciz	"PUPDR"                         @ string offset=3130
.Linfo_string235:
	.asciz	"IDR"                           @ string offset=3136
.Linfo_string236:
	.asciz	"ODR"                           @ string offset=3140
.Linfo_string237:
	.asciz	"BSRR"                          @ string offset=3144
.Linfo_string238:
	.asciz	"LCKR"                          @ string offset=3149
.Linfo_string239:
	.asciz	"AFR"                           @ string offset=3154
.Linfo_string240:
	.asciz	"GPIO_TypeDef"                  @ string offset=3158
.Linfo_string241:
	.asciz	"MX_I2C1_Init"                  @ string offset=3171
.Linfo_string242:
	.asciz	"HAL_I2C_MspInit"               @ string offset=3184
.Linfo_string243:
	.asciz	"HAL_I2C_MspDeInit"             @ string offset=3200
.Linfo_string244:
	.asciz	"i2cHandle"                     @ string offset=3218
.Linfo_string245:
	.asciz	"GPIO_InitStruct"               @ string offset=3228
.Linfo_string246:
	.asciz	"Pin"                           @ string offset=3244
.Linfo_string247:
	.asciz	"Pull"                          @ string offset=3248
.Linfo_string248:
	.asciz	"Speed"                         @ string offset=3253
.Linfo_string249:
	.asciz	"Alternate"                     @ string offset=3259
.Linfo_string250:
	.asciz	"GPIO_InitTypeDef"              @ string offset=3269
.Linfo_string251:
	.asciz	"tmpreg"                        @ string offset=3286
	.ident	"Component: Arm Compiler for Embedded 6.19 Tool: armclang [5e73cb00]"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
	.ARM_attribute	16, 1	@ Tag_AV_eba
	.section	.debug_line,"",%progbits
.Lline_table_start0:
