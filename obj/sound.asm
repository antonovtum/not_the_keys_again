;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module sound
	.optsdcc -msm83
	
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
;src/sound.c:20: void sound_init(void){
;	---------------------------------
; Function sound_init
; ---------------------------------
_sound_init::
;src/sound.c:21: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/sound.c:22: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/sound.c:23: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;src/sound.c:24: }
	ret
;src/sound.c:25: void stop_sfx(void){
;	---------------------------------
; Function stop_sfx
; ---------------------------------
_stop_sfx::
;src/sound.c:26: NR51_REG = 0xEE;
	ld	a, #0xee
	ldh	(_NR51_REG + 0), a
;src/sound.c:27: }
	ret
;src/sound.c:29: void play_jump_sfx(void){
;	---------------------------------
; Function play_jump_sfx
; ---------------------------------
_play_jump_sfx::
;src/sound.c:30: NR10_REG = 0x37;
	ld	a, #0x37
	ldh	(_NR10_REG + 0), a
;src/sound.c:31: NR11_REG = 0xC2;
	ld	a, #0xc2
	ldh	(_NR11_REG + 0), a
;src/sound.c:32: NR12_REG = 0xB2;
	ld	a, #0xb2
	ldh	(_NR12_REG + 0), a
;src/sound.c:33: NR13_REG = 0x68;
	ld	a, #0x68
	ldh	(_NR13_REG + 0), a
;src/sound.c:34: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;src/sound.c:35: }
	ret
;src/sound.c:37: void stop_jump_sfx(void){
;	---------------------------------
; Function stop_jump_sfx
; ---------------------------------
_stop_jump_sfx::
;src/sound.c:38: NR12_REG = 0xB1;
	ld	a, #0xb1
	ldh	(_NR12_REG + 0), a
;src/sound.c:39: }
	ret
;src/sound.c:41: void play_bump_sfx(void){
;	---------------------------------
; Function play_bump_sfx
; ---------------------------------
_play_bump_sfx::
;src/sound.c:42: NR10_REG = 0x1A;
	ld	a, #0x1a
	ldh	(_NR10_REG + 0), a
;src/sound.c:43: NR11_REG = 0x82;
	ld	a, #0x82
	ldh	(_NR11_REG + 0), a
;src/sound.c:44: NR12_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR12_REG + 0), a
;src/sound.c:45: NR13_REG = 0x68;
	ld	a, #0x68
	ldh	(_NR13_REG + 0), a
;src/sound.c:46: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;src/sound.c:47: }
	ret
;src/sound.c:49: void play_break_sfx(void){
;	---------------------------------
; Function play_break_sfx
; ---------------------------------
_play_break_sfx::
;src/sound.c:50: NR41_REG = 0x19;
	ld	a, #0x19
	ldh	(_NR41_REG + 0), a
;src/sound.c:51: NR42_REG = 0xA1;
	ld	a, #0xa1
	ldh	(_NR42_REG + 0), a
;src/sound.c:52: NR43_REG = 0x7B;
	ld	a, #0x7b
	ldh	(_NR43_REG + 0), a
;src/sound.c:53: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;src/sound.c:54: }
	ret
;src/sound.c:56: void play_hurt_sfx(void){
;	---------------------------------
; Function play_hurt_sfx
; ---------------------------------
_play_hurt_sfx::
;src/sound.c:57: NR10_REG = 0x1F;
	ld	a, #0x1f
	ldh	(_NR10_REG + 0), a
;src/sound.c:58: NR11_REG = 0x02;
	ld	a, #0x02
	ldh	(_NR11_REG + 0), a
;src/sound.c:59: NR12_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_NR12_REG + 0), a
;src/sound.c:60: NR13_REG = 0x4A;
	ld	a, #0x4a
	ldh	(_NR13_REG + 0), a
;src/sound.c:61: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;src/sound.c:62: }
	ret
;src/sound.c:64: void stop_hurt_sfx(void){
;	---------------------------------
; Function stop_hurt_sfx
; ---------------------------------
_stop_hurt_sfx::
;src/sound.c:65: NR12_REG = 0x01;
	ld	a, #0x01
	ldh	(_NR12_REG + 0), a
;src/sound.c:66: }
	ret
;src/sound.c:68: void play_boing_sfx(void){
;	---------------------------------
; Function play_boing_sfx
; ---------------------------------
_play_boing_sfx::
;src/sound.c:69: NR10_REG = 0x37;
	ld	a, #0x37
	ldh	(_NR10_REG + 0), a
;src/sound.c:70: NR11_REG = 0xC2;
	ld	a, #0xc2
	ldh	(_NR11_REG + 0), a
;src/sound.c:71: NR12_REG = 0xB2;
	ld	a, #0xb2
	ldh	(_NR12_REG + 0), a
;src/sound.c:72: NR13_REG = 0x00;
	xor	a, a
	ldh	(_NR13_REG + 0), a
;src/sound.c:73: NR14_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR14_REG + 0), a
;src/sound.c:74: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
