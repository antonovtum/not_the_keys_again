;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _compute_ending_frame
	.globl _ending_init
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
G$i$0_0$0==.
_i::
	.ds 1
Fmain$score_text$0_0$0==.
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
	G$performant_delay$0$0	= .
	.globl	G$performant_delay$0$0
	C$main.c$22$0_0$158	= .
	.globl	C$main.c$22$0_0$158
;src/main.c:22: void performant_delay(uint8_t frames){
;	---------------------------------
; Function performant_delay
; ---------------------------------
_performant_delay::
	C$main.c$24$2_0$158	= .
	.globl	C$main.c$24$2_0$158
;src/main.c:24: for(ii=0; ii<frames; ii++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
	C$main.c$25$3_0$159	= .
	.globl	C$main.c$25$3_0$159
;src/main.c:25: wait_vbl_done();
	call	_wait_vbl_done
	C$main.c$24$2_0$158	= .
	.globl	C$main.c$24$2_0$158
;src/main.c:24: for(ii=0; ii<frames; ii++){
	inc	c
	C$main.c$27$2_0$158	= .
	.globl	C$main.c$27$2_0$158
;src/main.c:27: }
	C$main.c$27$2_0$158	= .
	.globl	C$main.c$27$2_0$158
	XG$performant_delay$0$0	= .
	.globl	XG$performant_delay$0$0
	jr	00103$
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$29$2_0$161	= .
	.globl	C$main.c$29$2_0$161
;src/main.c:29: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$31$1_0$161	= .
	.globl	C$main.c$31$1_0$161
;src/main.c:31: init_gfx();
	call	_init_gfx
	C$main.c$33$1_0$161	= .
	.globl	C$main.c$33$1_0$161
;src/main.c:33: while(1) {
00102$:
	C$main.c$37$2_0$162	= .
	.globl	C$main.c$37$2_0$162
;src/main.c:37: compute_player_frame();
	call	_compute_player_frame
	C$main.c$40$2_0$162	= .
	.globl	C$main.c$40$2_0$162
;src/main.c:40: wait_vbl_done();
	call	_wait_vbl_done
	C$main.c$43$2_0$162	= .
	.globl	C$main.c$43$2_0$162
;src/main.c:43: compute_scene_frame();
	call	_compute_scene_frame
	C$main.c$45$2_0$162	= .
	.globl	C$main.c$45$2_0$162
;src/main.c:45: reset_game();
	call	_reset_game
	C$main.c$47$1_0$161	= .
	.globl	C$main.c$47$1_0$161
;src/main.c:47: }
	C$main.c$47$1_0$161	= .
	.globl	C$main.c$47$1_0$161
	XG$main$0$0	= .
	.globl	XG$main$0$0
	jr	00102$
	G$reset_game$0$0	= .
	.globl	G$reset_game$0$0
	C$main.c$49$1_0$164	= .
	.globl	C$main.c$49$1_0$164
;src/main.c:49: void reset_game(void){
;	---------------------------------
; Function reset_game
; ---------------------------------
_reset_game::
	C$main.c$50$1_0$164	= .
	.globl	C$main.c$50$1_0$164
;src/main.c:50: if(!player_dead_flag) return;
	ld	hl, #_player_dead_flag
	bit	0, (hl)
	ret	Z
	C$main.c$51$1_0$164	= .
	.globl	C$main.c$51$1_0$164
;src/main.c:51: compute_ending_frame();
	call	_compute_ending_frame
	C$main.c$53$1_0$164	= .
	.globl	C$main.c$53$1_0$164
;src/main.c:53: if(!(joypad() & J_A && a_not_pressed)) return;
	call	_joypad
	bit	4, e
	ret	Z
	ld	hl, #_a_not_pressed
	bit	0, (hl)
	ret	Z
	C$main.c$54$1_0$164	= .
	.globl	C$main.c$54$1_0$164
;src/main.c:54: fadeout();
	call	_fadeout
	C$main.c$55$1_0$164	= .
	.globl	C$main.c$55$1_0$164
;src/main.c:55: init_gfx();
	call	_init_gfx
	C$main.c$56$1_0$164	= .
	.globl	C$main.c$56$1_0$164
;src/main.c:56: fadein();
	C$main.c$57$1_0$164	= .
	.globl	C$main.c$57$1_0$164
;src/main.c:57: }
	C$main.c$57$1_0$164	= .
	.globl	C$main.c$57$1_0$164
	XG$reset_game$0$0	= .
	.globl	XG$reset_game$0$0
	jp	_fadein
	G$init_gfx$0$0	= .
	.globl	G$init_gfx$0$0
	C$main.c$75$1_0$166	= .
	.globl	C$main.c$75$1_0$166
;src/main.c:75: void init_gfx(void) {
;	---------------------------------
; Function init_gfx
; ---------------------------------
_init_gfx::
	C$main.c$76$1_0$166	= .
	.globl	C$main.c$76$1_0$166
;src/main.c:76: scene_init();
	call	_scene_init
	C$main.c$78$1_0$166	= .
	.globl	C$main.c$78$1_0$166
;src/main.c:78: player_init();
	call	_player_init
	C$main.c$80$1_0$166	= .
	.globl	C$main.c$80$1_0$166
;src/main.c:80: sound_init();
	call	_sound_init
	C$main.c$82$1_0$166	= .
	.globl	C$main.c$82$1_0$166
;src/main.c:82: ending_init();
	call	_ending_init
	C$main.c$85$1_0$166	= .
	.globl	C$main.c$85$1_0$166
;src/main.c:85: SHOW_BKG; SHOW_SPRITES; HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
	C$main.c$86$1_0$166	= .
	.globl	C$main.c$86$1_0$166
;src/main.c:86: }
	C$main.c$86$1_0$166	= .
	.globl	C$main.c$86$1_0$166
	XG$init_gfx$0$0	= .
	.globl	XG$init_gfx$0$0
	ret
	G$fadeout$0$0	= .
	.globl	G$fadeout$0$0
	C$main.c$88$1_0$169	= .
	.globl	C$main.c$88$1_0$169
;src/main.c:88: void fadeout(void){
;	---------------------------------
; Function fadeout
; ---------------------------------
_fadeout::
	C$main.c$89$2_0$169	= .
	.globl	C$main.c$89$2_0$169
;src/main.c:89: for(i = 0; i < 4; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00108$:
	C$main.c$90$3_0$170	= .
	.globl	C$main.c$90$3_0$170
;src/main.c:90: switch (i)
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
	C$main.c$92$4_0$171	= .
	.globl	C$main.c$92$4_0$171
;src/main.c:92: case 0:
00101$:
	C$main.c$93$4_0$171	= .
	.globl	C$main.c$93$4_0$171
;src/main.c:93: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
	C$main.c$94$4_0$171	= .
	.globl	C$main.c$94$4_0$171
;src/main.c:94: break;
	jr	00106$
	C$main.c$96$4_0$171	= .
	.globl	C$main.c$96$4_0$171
;src/main.c:96: case 1:
00102$:
	C$main.c$97$4_0$171	= .
	.globl	C$main.c$97$4_0$171
;src/main.c:97: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
	C$main.c$98$4_0$171	= .
	.globl	C$main.c$98$4_0$171
;src/main.c:98: break;
	jr	00106$
	C$main.c$100$4_0$171	= .
	.globl	C$main.c$100$4_0$171
;src/main.c:100: case 2:
00103$:
	C$main.c$101$4_0$171	= .
	.globl	C$main.c$101$4_0$171
;src/main.c:101: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
	C$main.c$102$4_0$171	= .
	.globl	C$main.c$102$4_0$171
;src/main.c:102: break;
	jr	00106$
	C$main.c$104$4_0$171	= .
	.globl	C$main.c$104$4_0$171
;src/main.c:104: case 3:
00104$:
	C$main.c$105$4_0$171	= .
	.globl	C$main.c$105$4_0$171
;src/main.c:105: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG + 0), a
	C$main.c$110$3_0$170	= .
	.globl	C$main.c$110$3_0$170
;src/main.c:110: }
00106$:
	C$main.c$111$3_0$170	= .
	.globl	C$main.c$111$3_0$170
;src/main.c:111: performant_delay(10U);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	C$main.c$89$2_0$169	= .
	.globl	C$main.c$89$2_0$169
;src/main.c:89: for(i = 0; i < 4; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00108$
	C$main.c$113$2_0$169	= .
	.globl	C$main.c$113$2_0$169
;src/main.c:113: }
	C$main.c$113$2_0$169	= .
	.globl	C$main.c$113$2_0$169
	XG$fadeout$0$0	= .
	.globl	XG$fadeout$0$0
	ret
	G$fadein$0$0	= .
	.globl	G$fadein$0$0
	C$main.c$115$2_0$174	= .
	.globl	C$main.c$115$2_0$174
;src/main.c:115: void fadein(void){
;	---------------------------------
; Function fadein
; ---------------------------------
_fadein::
	C$main.c$116$2_0$174	= .
	.globl	C$main.c$116$2_0$174
;src/main.c:116: for(i = 0; i < 3; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00107$:
	C$main.c$117$3_0$175	= .
	.globl	C$main.c$117$3_0$175
;src/main.c:117: switch (i)
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
	C$main.c$119$4_0$176	= .
	.globl	C$main.c$119$4_0$176
;src/main.c:119: case 0:
00101$:
	C$main.c$120$4_0$176	= .
	.globl	C$main.c$120$4_0$176
;src/main.c:120: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
	C$main.c$121$4_0$176	= .
	.globl	C$main.c$121$4_0$176
;src/main.c:121: break;
	jr	00105$
	C$main.c$123$4_0$176	= .
	.globl	C$main.c$123$4_0$176
;src/main.c:123: case 1:
00102$:
	C$main.c$124$4_0$176	= .
	.globl	C$main.c$124$4_0$176
;src/main.c:124: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
	C$main.c$125$4_0$176	= .
	.globl	C$main.c$125$4_0$176
;src/main.c:125: break;
	jr	00105$
	C$main.c$127$4_0$176	= .
	.globl	C$main.c$127$4_0$176
;src/main.c:127: case 2:
00103$:
	C$main.c$128$4_0$176	= .
	.globl	C$main.c$128$4_0$176
;src/main.c:128: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
	C$main.c$132$3_0$175	= .
	.globl	C$main.c$132$3_0$175
;src/main.c:132: }
00105$:
	C$main.c$133$3_0$175	= .
	.globl	C$main.c$133$3_0$175
;src/main.c:133: performant_delay(10U);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	C$main.c$116$2_0$174	= .
	.globl	C$main.c$116$2_0$174
;src/main.c:116: for(i = 0; i < 3; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00107$
	C$main.c$135$2_0$174	= .
	.globl	C$main.c$135$2_0$174
;src/main.c:135: }
	C$main.c$135$2_0$174	= .
	.globl	C$main.c$135$2_0$174
	XG$fadein$0$0	= .
	.globl	XG$fadein$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
