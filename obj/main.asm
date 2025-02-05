;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _play_intro_cinematic
	.globl _compute_ending_frame
	.globl _ending_init
	.globl _compute_sound_frame
	.globl _play_main_theme
	.globl _sound_init
	.globl _compute_scene_frame
	.globl _scene_init
	.globl _compute_player_frame
	.globl _player_init
	.globl _wait_vbl_done
	.globl _joypad
	.globl _i
	.globl _performant_delay
	.globl _reset_game
	.globl _init_gfx
	.globl _fadeout
	.globl _fadein
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_i::
	.ds 1
_score_text:
	.ds 5
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
;src/main.c:27: void performant_delay(uint8_t frames){
;	---------------------------------
; Function performant_delay
; ---------------------------------
_performant_delay::
	ld	c, a
;src/main.c:29: for(ii=0; ii<frames; ii++){
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;src/main.c:30: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:29: for(ii=0; ii<frames; ii++){
	inc	b
;src/main.c:32: }
	jr	00103$
;src/main.c:34: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:36: play_intro_cinematic();
	call	_play_intro_cinematic
;src/main.c:38: fadeout();
	call	_fadeout
;src/main.c:39: init_gfx();
	call	_init_gfx
;src/main.c:40: fadein();
	call	_fadein
;src/main.c:42: while(1) {
00102$:
;src/main.c:45: compute_player_frame();
	call	_compute_player_frame
;src/main.c:48: compute_sound_frame();
	call	_compute_sound_frame
;src/main.c:51: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:54: compute_scene_frame();
	call	_compute_scene_frame
;src/main.c:56: reset_game();
	call	_reset_game
;src/main.c:58: }
	jr	00102$
;src/main.c:60: void reset_game(void){
;	---------------------------------
; Function reset_game
; ---------------------------------
_reset_game::
;src/main.c:61: if(!player_dead_flag) return;
	ld	hl, #_player_dead_flag
	bit	0, (hl)
	ret	Z
;src/main.c:62: compute_ending_frame();
	call	_compute_ending_frame
;src/main.c:64: if(joypad() & J_A && a_not_pressed && IS_ANIMATION_FINISHED){
	call	_joypad
	bit	4, a
	ret	Z
	ld	hl, #_a_not_pressed
	bit	0, (hl)
	ret	Z
	ld	a, (#_ending_flags)
	rrca
	ret	NC
;src/main.c:65: fadeout();
	call	_fadeout
;src/main.c:66: init_gfx();
	call	_init_gfx
;src/main.c:67: fadein();
;src/main.c:69: }
	jp	_fadein
;src/main.c:87: void init_gfx(void) {
;	---------------------------------
; Function init_gfx
; ---------------------------------
_init_gfx::
;src/main.c:88: scene_init();
	call	_scene_init
;src/main.c:90: player_init();
	call	_player_init
;src/main.c:92: sound_init();
	call	_sound_init
;src/main.c:94: play_main_theme();
	call	_play_main_theme
;src/main.c:96: ending_init();
	call	_ending_init
;src/main.c:99: SHOW_BKG; SHOW_SPRITES; HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:100: }
	ret
;src/main.c:102: void fadeout(void){
;	---------------------------------
; Function fadeout
; ---------------------------------
_fadeout::
;src/main.c:103: for(i = 0; i < 4; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00108$:
;src/main.c:104: switch (i)
	ld	a, (#_i)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_i)
	dec	a
	jr	Z, 00102$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00103$
	ld	a, (#_i)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00106$
;src/main.c:106: case 0:
00101$:
;src/main.c:107: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;src/main.c:108: OBP0_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
;src/main.c:109: break;
	jr	00106$
;src/main.c:111: case 1:
00102$:
;src/main.c:112: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
;src/main.c:113: OBP0_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_OBP0_REG + 0), a
;src/main.c:114: break;
	jr	00106$
;src/main.c:116: case 2:
00103$:
;src/main.c:117: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
;src/main.c:118: OBP0_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_OBP0_REG + 0), a
;src/main.c:119: break;
	jr	00106$
;src/main.c:121: case 3:
00104$:
;src/main.c:122: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG + 0), a
;src/main.c:123: OBP0_REG = 0xFF;
	ld	a, #0xff
	ldh	(_OBP0_REG + 0), a
;src/main.c:128: }
00106$:
;src/main.c:129: performant_delay(10U);
	ld	a, #0x0a
	call	_performant_delay
;src/main.c:103: for(i = 0; i < 4; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00108$
;src/main.c:131: }
	ret
;src/main.c:133: void fadein(void){
;	---------------------------------
; Function fadein
; ---------------------------------
_fadein::
;src/main.c:134: for(i = 0; i < 3; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00107$:
;src/main.c:135: switch (i)
	ld	a, (#_i)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_i)
	dec	a
	jr	Z, 00102$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00103$
	jr	00105$
;src/main.c:137: case 0:
00101$:
;src/main.c:138: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
;src/main.c:139: OBP0_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_OBP0_REG + 0), a
;src/main.c:140: break;
	jr	00105$
;src/main.c:142: case 1:
00102$:
;src/main.c:143: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
;src/main.c:144: OBP0_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_OBP0_REG + 0), a
;src/main.c:145: break;
	jr	00105$
;src/main.c:147: case 2:
00103$:
;src/main.c:148: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;src/main.c:149: OBP0_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
;src/main.c:153: }
00105$:
;src/main.c:154: performant_delay(10U);
	ld	a, #0x0a
	call	_performant_delay
;src/main.c:134: for(i = 0; i < 3; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00107$
;src/main.c:156: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
