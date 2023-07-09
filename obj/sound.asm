;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module sound
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sound_init
	.globl _stop_sfx
	.globl _play_jump_sfx
	.globl _stop_jump_sfx
	.globl _play_bump_sfx
	.globl _play_break_sfx
	.globl _play_hurt_sfx
	.globl _stop_hurt_sfx
	.globl _play_boing_sfx
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	G$sound_init$0$0	= .
	.globl	G$sound_init$0$0
	C$sound.c$20$0_0$117	= .
	.globl	C$sound.c$20$0_0$117
;src/sound.c:20: void sound_init(void){
;	---------------------------------
; Function sound_init
; ---------------------------------
_sound_init::
	C$sound.c$21$1_0$117	= .
	.globl	C$sound.c$21$1_0$117
;src/sound.c:21: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
	C$sound.c$22$1_0$117	= .
	.globl	C$sound.c$22$1_0$117
;src/sound.c:22: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
	C$sound.c$23$1_0$117	= .
	.globl	C$sound.c$23$1_0$117
;src/sound.c:23: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
	C$sound.c$24$1_0$117	= .
	.globl	C$sound.c$24$1_0$117
;src/sound.c:24: }
	C$sound.c$24$1_0$117	= .
	.globl	C$sound.c$24$1_0$117
	XG$sound_init$0$0	= .
	.globl	XG$sound_init$0$0
	ret
	G$stop_sfx$0$0	= .
	.globl	G$stop_sfx$0$0
	C$sound.c$25$1_0$119	= .
	.globl	C$sound.c$25$1_0$119
;src/sound.c:25: void stop_sfx(void){
;	---------------------------------
; Function stop_sfx
; ---------------------------------
_stop_sfx::
	C$sound.c$26$1_0$119	= .
	.globl	C$sound.c$26$1_0$119
;src/sound.c:26: NR51_REG = 0xEE;
	ld	a, #0xee
	ldh	(_NR51_REG + 0), a
	C$sound.c$27$1_0$119	= .
	.globl	C$sound.c$27$1_0$119
;src/sound.c:27: }
	C$sound.c$27$1_0$119	= .
	.globl	C$sound.c$27$1_0$119
	XG$stop_sfx$0$0	= .
	.globl	XG$stop_sfx$0$0
	ret
	G$play_jump_sfx$0$0	= .
	.globl	G$play_jump_sfx$0$0
	C$sound.c$29$1_0$121	= .
	.globl	C$sound.c$29$1_0$121
;src/sound.c:29: void play_jump_sfx(void){
;	---------------------------------
; Function play_jump_sfx
; ---------------------------------
_play_jump_sfx::
	C$sound.c$30$1_0$121	= .
	.globl	C$sound.c$30$1_0$121
;src/sound.c:30: NR10_REG = 0x37;
	ld	a, #0x37
	ldh	(_NR10_REG + 0), a
	C$sound.c$31$1_0$121	= .
	.globl	C$sound.c$31$1_0$121
;src/sound.c:31: NR11_REG = 0xC2;
	ld	a, #0xc2
	ldh	(_NR11_REG + 0), a
	C$sound.c$32$1_0$121	= .
	.globl	C$sound.c$32$1_0$121
;src/sound.c:32: NR12_REG = 0xB2;
	ld	a, #0xb2
	ldh	(_NR12_REG + 0), a
	C$sound.c$33$1_0$121	= .
	.globl	C$sound.c$33$1_0$121
;src/sound.c:33: NR13_REG = 0x68;
	ld	a, #0x68
	ldh	(_NR13_REG + 0), a
	C$sound.c$34$1_0$121	= .
	.globl	C$sound.c$34$1_0$121
;src/sound.c:34: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
	C$sound.c$35$1_0$121	= .
	.globl	C$sound.c$35$1_0$121
;src/sound.c:35: }
	C$sound.c$35$1_0$121	= .
	.globl	C$sound.c$35$1_0$121
	XG$play_jump_sfx$0$0	= .
	.globl	XG$play_jump_sfx$0$0
	ret
	G$stop_jump_sfx$0$0	= .
	.globl	G$stop_jump_sfx$0$0
	C$sound.c$37$1_0$123	= .
	.globl	C$sound.c$37$1_0$123
;src/sound.c:37: void stop_jump_sfx(void){
;	---------------------------------
; Function stop_jump_sfx
; ---------------------------------
_stop_jump_sfx::
	C$sound.c$38$1_0$123	= .
	.globl	C$sound.c$38$1_0$123
;src/sound.c:38: NR12_REG = 0xB1;
	ld	a, #0xb1
	ldh	(_NR12_REG + 0), a
	C$sound.c$39$1_0$123	= .
	.globl	C$sound.c$39$1_0$123
;src/sound.c:39: }
	C$sound.c$39$1_0$123	= .
	.globl	C$sound.c$39$1_0$123
	XG$stop_jump_sfx$0$0	= .
	.globl	XG$stop_jump_sfx$0$0
	ret
	G$play_bump_sfx$0$0	= .
	.globl	G$play_bump_sfx$0$0
	C$sound.c$41$1_0$125	= .
	.globl	C$sound.c$41$1_0$125
;src/sound.c:41: void play_bump_sfx(void){
;	---------------------------------
; Function play_bump_sfx
; ---------------------------------
_play_bump_sfx::
	C$sound.c$42$1_0$125	= .
	.globl	C$sound.c$42$1_0$125
;src/sound.c:42: NR10_REG = 0x1A;
	ld	a, #0x1a
	ldh	(_NR10_REG + 0), a
	C$sound.c$43$1_0$125	= .
	.globl	C$sound.c$43$1_0$125
;src/sound.c:43: NR11_REG = 0x82;
	ld	a, #0x82
	ldh	(_NR11_REG + 0), a
	C$sound.c$44$1_0$125	= .
	.globl	C$sound.c$44$1_0$125
;src/sound.c:44: NR12_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR12_REG + 0), a
	C$sound.c$45$1_0$125	= .
	.globl	C$sound.c$45$1_0$125
;src/sound.c:45: NR13_REG = 0x68;
	ld	a, #0x68
	ldh	(_NR13_REG + 0), a
	C$sound.c$46$1_0$125	= .
	.globl	C$sound.c$46$1_0$125
;src/sound.c:46: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
	C$sound.c$47$1_0$125	= .
	.globl	C$sound.c$47$1_0$125
;src/sound.c:47: }
	C$sound.c$47$1_0$125	= .
	.globl	C$sound.c$47$1_0$125
	XG$play_bump_sfx$0$0	= .
	.globl	XG$play_bump_sfx$0$0
	ret
	G$play_break_sfx$0$0	= .
	.globl	G$play_break_sfx$0$0
	C$sound.c$49$1_0$127	= .
	.globl	C$sound.c$49$1_0$127
;src/sound.c:49: void play_break_sfx(void){
;	---------------------------------
; Function play_break_sfx
; ---------------------------------
_play_break_sfx::
	C$sound.c$50$1_0$127	= .
	.globl	C$sound.c$50$1_0$127
;src/sound.c:50: NR41_REG = 0x19;
	ld	a, #0x19
	ldh	(_NR41_REG + 0), a
	C$sound.c$51$1_0$127	= .
	.globl	C$sound.c$51$1_0$127
;src/sound.c:51: NR42_REG = 0xA1;
	ld	a, #0xa1
	ldh	(_NR42_REG + 0), a
	C$sound.c$52$1_0$127	= .
	.globl	C$sound.c$52$1_0$127
;src/sound.c:52: NR43_REG = 0x7B;
	ld	a, #0x7b
	ldh	(_NR43_REG + 0), a
	C$sound.c$53$1_0$127	= .
	.globl	C$sound.c$53$1_0$127
;src/sound.c:53: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
	C$sound.c$54$1_0$127	= .
	.globl	C$sound.c$54$1_0$127
;src/sound.c:54: }
	C$sound.c$54$1_0$127	= .
	.globl	C$sound.c$54$1_0$127
	XG$play_break_sfx$0$0	= .
	.globl	XG$play_break_sfx$0$0
	ret
	G$play_hurt_sfx$0$0	= .
	.globl	G$play_hurt_sfx$0$0
	C$sound.c$56$1_0$129	= .
	.globl	C$sound.c$56$1_0$129
;src/sound.c:56: void play_hurt_sfx(void){
;	---------------------------------
; Function play_hurt_sfx
; ---------------------------------
_play_hurt_sfx::
	C$sound.c$57$1_0$129	= .
	.globl	C$sound.c$57$1_0$129
;src/sound.c:57: NR10_REG = 0x1F;
	ld	a, #0x1f
	ldh	(_NR10_REG + 0), a
	C$sound.c$58$1_0$129	= .
	.globl	C$sound.c$58$1_0$129
;src/sound.c:58: NR11_REG = 0x02;
	ld	a, #0x02
	ldh	(_NR11_REG + 0), a
	C$sound.c$59$1_0$129	= .
	.globl	C$sound.c$59$1_0$129
;src/sound.c:59: NR12_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_NR12_REG + 0), a
	C$sound.c$60$1_0$129	= .
	.globl	C$sound.c$60$1_0$129
;src/sound.c:60: NR13_REG = 0x4A;
	ld	a, #0x4a
	ldh	(_NR13_REG + 0), a
	C$sound.c$61$1_0$129	= .
	.globl	C$sound.c$61$1_0$129
;src/sound.c:61: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
	C$sound.c$62$1_0$129	= .
	.globl	C$sound.c$62$1_0$129
;src/sound.c:62: }
	C$sound.c$62$1_0$129	= .
	.globl	C$sound.c$62$1_0$129
	XG$play_hurt_sfx$0$0	= .
	.globl	XG$play_hurt_sfx$0$0
	ret
	G$stop_hurt_sfx$0$0	= .
	.globl	G$stop_hurt_sfx$0$0
	C$sound.c$64$1_0$131	= .
	.globl	C$sound.c$64$1_0$131
;src/sound.c:64: void stop_hurt_sfx(void){
;	---------------------------------
; Function stop_hurt_sfx
; ---------------------------------
_stop_hurt_sfx::
	C$sound.c$65$1_0$131	= .
	.globl	C$sound.c$65$1_0$131
;src/sound.c:65: NR12_REG = 0x01;
	ld	a, #0x01
	ldh	(_NR12_REG + 0), a
	C$sound.c$66$1_0$131	= .
	.globl	C$sound.c$66$1_0$131
;src/sound.c:66: }
	C$sound.c$66$1_0$131	= .
	.globl	C$sound.c$66$1_0$131
	XG$stop_hurt_sfx$0$0	= .
	.globl	XG$stop_hurt_sfx$0$0
	ret
	G$play_boing_sfx$0$0	= .
	.globl	G$play_boing_sfx$0$0
	C$sound.c$68$1_0$133	= .
	.globl	C$sound.c$68$1_0$133
;src/sound.c:68: void play_boing_sfx(void){
;	---------------------------------
; Function play_boing_sfx
; ---------------------------------
_play_boing_sfx::
	C$sound.c$69$1_0$133	= .
	.globl	C$sound.c$69$1_0$133
;src/sound.c:69: NR10_REG = 0x37;
	ld	a, #0x37
	ldh	(_NR10_REG + 0), a
	C$sound.c$70$1_0$133	= .
	.globl	C$sound.c$70$1_0$133
;src/sound.c:70: NR11_REG = 0xC2;
	ld	a, #0xc2
	ldh	(_NR11_REG + 0), a
	C$sound.c$71$1_0$133	= .
	.globl	C$sound.c$71$1_0$133
;src/sound.c:71: NR12_REG = 0xB2;
	ld	a, #0xb2
	ldh	(_NR12_REG + 0), a
	C$sound.c$72$1_0$133	= .
	.globl	C$sound.c$72$1_0$133
;src/sound.c:72: NR13_REG = 0x00;
	xor	a, a
	ldh	(_NR13_REG + 0), a
	C$sound.c$73$1_0$133	= .
	.globl	C$sound.c$73$1_0$133
;src/sound.c:73: NR14_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR14_REG + 0), a
	C$sound.c$74$1_0$133	= .
	.globl	C$sound.c$74$1_0$133
;src/sound.c:74: }
	C$sound.c$74$1_0$133	= .
	.globl	C$sound.c$74$1_0$133
	XG$play_boing_sfx$0$0	= .
	.globl	XG$play_boing_sfx$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
