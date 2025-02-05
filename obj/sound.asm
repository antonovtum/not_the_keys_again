;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module sound
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _hUGE_dosound
	.globl _hUGE_init
	.globl _sound_init
	.globl _stop_sfx
	.globl _play_main_theme
	.globl _compute_sound_frame
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
;src/sound.c:26: void sound_init(void){
;	---------------------------------
; Function sound_init
; ---------------------------------
_sound_init::
;src/sound.c:27: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/sound.c:28: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/sound.c:29: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;src/sound.c:30: }
	ret
;src/sound.c:31: void stop_sfx(void){
;	---------------------------------
; Function stop_sfx
; ---------------------------------
_stop_sfx::
;src/sound.c:32: NR51_REG = 0xEE;
	ld	a, #0xee
	ldh	(_NR51_REG + 0), a
;src/sound.c:33: }
	ret
;src/sound.c:36: void play_main_theme(void){
;	---------------------------------
; Function play_main_theme
; ---------------------------------
_play_main_theme::
;src/sound.c:37: hUGE_init(&main_song);
	ld	de, #_main_song
;src/sound.c:38: }
	jp	_hUGE_init
;src/sound.c:41: void compute_sound_frame(void){
;	---------------------------------
; Function compute_sound_frame
; ---------------------------------
_compute_sound_frame::
;src/sound.c:42: hUGE_dosound();
;src/sound.c:43: }
	jp	_hUGE_dosound
;src/sound.c:45: void play_jump_sfx(void){
;	---------------------------------
; Function play_jump_sfx
; ---------------------------------
_play_jump_sfx::
;src/sound.c:51: NR10_REG = 0x37; // 0x 0011 0111
	ld	a, #0x37
	ldh	(_NR10_REG + 0), a
;src/sound.c:52: NR11_REG = 0xC2; // 0x 1100 0010
	ld	a, #0xc2
	ldh	(_NR11_REG + 0), a
;src/sound.c:53: NR12_REG = 0xB2; // 0x 1011 0010
	ld	a, #0xb2
	ldh	(_NR12_REG + 0), a
;src/sound.c:54: NR13_REG = 0x68; // 0x 0110 1000
	ld	a, #0x68
	ldh	(_NR13_REG + 0), a
;src/sound.c:55: NR14_REG = 0x86; // 0x 1000 0110
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;src/sound.c:56: }
	ret
;src/sound.c:94: void stop_jump_sfx(void){
;	---------------------------------
; Function stop_jump_sfx
; ---------------------------------
_stop_jump_sfx::
;src/sound.c:95: NR12_REG = 0xB1;
	ld	a, #0xb1
	ldh	(_NR12_REG + 0), a
;src/sound.c:96: }
	ret
;src/sound.c:98: void play_bump_sfx(void){
;	---------------------------------
; Function play_bump_sfx
; ---------------------------------
_play_bump_sfx::
;src/sound.c:99: NR10_REG = 0x1A;
	ld	a, #0x1a
	ldh	(_NR10_REG + 0), a
;src/sound.c:100: NR11_REG = 0x82;
	ld	a, #0x82
	ldh	(_NR11_REG + 0), a
;src/sound.c:101: NR12_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR12_REG + 0), a
;src/sound.c:102: NR13_REG = 0x68;
	ld	a, #0x68
	ldh	(_NR13_REG + 0), a
;src/sound.c:103: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;src/sound.c:104: }
	ret
;src/sound.c:106: void play_break_sfx(void){
;	---------------------------------
; Function play_break_sfx
; ---------------------------------
_play_break_sfx::
;src/sound.c:107: NR41_REG = 0x19;
	ld	a, #0x19
	ldh	(_NR41_REG + 0), a
;src/sound.c:108: NR42_REG = 0xA1;
	ld	a, #0xa1
	ldh	(_NR42_REG + 0), a
;src/sound.c:109: NR43_REG = 0x7B;
	ld	a, #0x7b
	ldh	(_NR43_REG + 0), a
;src/sound.c:110: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;src/sound.c:111: }
	ret
;src/sound.c:113: void play_hurt_sfx(void){
;	---------------------------------
; Function play_hurt_sfx
; ---------------------------------
_play_hurt_sfx::
;src/sound.c:114: NR10_REG = 0x1F;
	ld	a, #0x1f
	ldh	(_NR10_REG + 0), a
;src/sound.c:115: NR11_REG = 0x02;
	ld	a, #0x02
	ldh	(_NR11_REG + 0), a
;src/sound.c:116: NR12_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_NR12_REG + 0), a
;src/sound.c:117: NR13_REG = 0x4A;
	ld	a, #0x4a
	ldh	(_NR13_REG + 0), a
;src/sound.c:118: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;src/sound.c:119: }
	ret
;src/sound.c:121: void stop_hurt_sfx(void){
;	---------------------------------
; Function stop_hurt_sfx
; ---------------------------------
_stop_hurt_sfx::
;src/sound.c:122: NR12_REG = 0x01;
	ld	a, #0x01
	ldh	(_NR12_REG + 0), a
;src/sound.c:123: }
	ret
;src/sound.c:125: void play_boing_sfx(void){
;	---------------------------------
; Function play_boing_sfx
; ---------------------------------
_play_boing_sfx::
;src/sound.c:126: NR10_REG = 0x37;
	ld	a, #0x37
	ldh	(_NR10_REG + 0), a
;src/sound.c:127: NR11_REG = 0xC2;
	ld	a, #0xc2
	ldh	(_NR11_REG + 0), a
;src/sound.c:128: NR12_REG = 0xB2;
	ld	a, #0xb2
	ldh	(_NR12_REG + 0), a
;src/sound.c:129: NR13_REG = 0x00;
	xor	a, a
	ldh	(_NR13_REG + 0), a
;src/sound.c:130: NR14_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR14_REG + 0), a
;src/sound.c:131: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
