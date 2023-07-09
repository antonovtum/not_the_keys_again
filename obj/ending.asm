;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module ending
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _itoa
	.globl _set_win_tile_xy
	.globl _set_win_tiles
	.globl _set_interrupts
	.globl _add_LCD
	.globl _ending_init
	.globl _compute_ending_frame
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
Fending$counter$0_0$0==.
_counter:
	.ds 1
Fending$is_ended$0_0$0==.
_is_ended:
	.ds 1
Fending$win_height$0_0$0==.
_win_height:
	.ds 1
Fending$score_text$0_0$0==.
_score_text:
	.ds 5
Fending$i$0_0$0==.
_i:
	.ds 1
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
	Fending$scanline_interrupt_script$0$0	= .
	.globl	Fending$scanline_interrupt_script$0$0
	C$ending.c$27$0_0$126	= .
	.globl	C$ending.c$27$0_0$126
;src/ending.c:27: static void scanline_interrupt_script(void){
;	---------------------------------
; Function scanline_interrupt_script
; ---------------------------------
_scanline_interrupt_script:
	C$ending.c$28$1_0$126	= .
	.globl	C$ending.c$28$1_0$126
;src/ending.c:28: uint8_t max_scan = (win_height + 24U) > 144 ? 144 : (win_height + 24U);
	ld	hl, #_win_height
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x0018
	add	hl, bc
	ld	a, #0x90
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00108$
	ld	bc, #0x0090
	jr	00109$
00108$:
	ld	a, (#_win_height)
	add	a, #0x18
	ld	c, a
00109$:
	C$ending.c$29$1_0$126	= .
	.globl	C$ending.c$29$1_0$126
;src/ending.c:29: if(LYC_REG == 0x00){
	ld	a, (#_LYC_REG)
	or	a, a
	jr	NZ, 00104$
	C$ending.c$30$2_0$127	= .
	.globl	C$ending.c$30$2_0$127
;src/ending.c:30: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
	C$ending.c$31$2_0$127	= .
	.globl	C$ending.c$31$2_0$127
;src/ending.c:31: LYC_REG = max_scan;
	ld	a, c
	ldh	(_LYC_REG + 0), a
	ret
00104$:
	C$ending.c$33$1_0$126	= .
	.globl	C$ending.c$33$1_0$126
;src/ending.c:33: else if(LYC_REG == max_scan){
	ldh	a, (_LYC_REG + 0)
	sub	a, c
	ret	NZ
	C$ending.c$34$2_0$128	= .
	.globl	C$ending.c$34$2_0$128
;src/ending.c:34: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
	C$ending.c$35$2_0$128	= .
	.globl	C$ending.c$35$2_0$128
;src/ending.c:35: LYC_REG = 0x00;
	xor	a, a
	ldh	(_LYC_REG + 0), a
	C$ending.c$37$1_0$126	= .
	.globl	C$ending.c$37$1_0$126
;src/ending.c:37: }
	C$ending.c$37$1_0$126	= .
	.globl	C$ending.c$37$1_0$126
	XFending$scanline_interrupt_script$0$0	= .
	.globl	XFending$scanline_interrupt_script$0$0
	ret
Fending$win_position_table$0_0$0 == .
_win_position_table:
	.db #0x82	; 130
	.db #0x64	; 100	'd'
	.db #0x46	; 70	'F'
	.db #0x3c	; 60
	.db #0x37	; 55	'7'
	.db #0x35	; 53	'5'
	.db #0x37	; 55	'7'
	.db #0x3c	; 60
	.db #0x4b	; 75	'K'
	.db #0x50	; 80	'P'
	G$ending_init$0$0	= .
	.globl	G$ending_init$0$0
	C$ending.c$39$1_0$130	= .
	.globl	C$ending.c$39$1_0$130
;src/ending.c:39: void ending_init(void){
;	---------------------------------
; Function ending_init
; ---------------------------------
_ending_init::
	C$ending.c$40$1_0$130	= .
	.globl	C$ending.c$40$1_0$130
;src/ending.c:40: is_ended = false;
	ld	hl, #_is_ended
	ld	(hl), #0x00
	C$ending.c$41$1_0$130	= .
	.globl	C$ending.c$41$1_0$130
;src/ending.c:41: }
	C$ending.c$41$1_0$130	= .
	.globl	C$ending.c$41$1_0$130
	XG$ending_init$0$0	= .
	.globl	XG$ending_init$0$0
	ret
	Fending$prepare_ending_frame$0$0	= .
	.globl	Fending$prepare_ending_frame$0$0
	C$ending.c$43$1_0$132	= .
	.globl	C$ending.c$43$1_0$132
;src/ending.c:43: void prepare_ending_frame(void){
;	---------------------------------
; Function prepare_ending_frame
; ---------------------------------
_prepare_ending_frame:
	dec	sp
	C$ending.c$45$1_0$132	= .
	.globl	C$ending.c$45$1_0$132
;src/ending.c:45: if(is_ended) return;
	ld	hl, #_is_ended
	bit	0, (hl)
	jp	NZ,00109$
	C$ending.c$47$1_0$132	= .
	.globl	C$ending.c$47$1_0$132
;src/ending.c:47: counter = 0;
	ld	hl, #_counter
	ld	(hl), #0x00
	C$ending.c$48$1_0$132	= .
	.globl	C$ending.c$48$1_0$132
;src/ending.c:48: is_ended = true;
	ld	hl, #_is_ended
	ld	(hl), #0x01
	C$ending.c$49$1_0$132	= .
	.globl	C$ending.c$49$1_0$132
;src/ending.c:49: win_height = 70;
	ld	hl, #_win_height
	ld	(hl), #0x46
	C$ending.c$51$1_0$132	= .
	.globl	C$ending.c$51$1_0$132
;src/ending.c:51: set_win_tiles(0,0, 20U, 3U, hud_map);
	ld	de, #_hud_map
	push	de
	ld	hl, #0x314
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
	C$ending.c$52$1_0$132	= .
	.globl	C$ending.c$52$1_0$132
;src/ending.c:52: itoa(score, score_text, 10);
	ld	bc, #_score_text+0
	ld	e, c
	ld	d, b
	ld	hl, #_score
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_score + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	push	de
	push	hl
	call	_itoa
	add	sp, #5
	pop	bc
	C$ending.c$53$2_0$133	= .
	.globl	C$ending.c$53$2_0$133
;src/ending.c:53: for(i=0; score_text[i] != 0 && i < 5; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00107$:
	ld	a, c
	ld	hl, #_i
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00103$
	ld	a, (#_i)
	sub	a, #0x05
	jr	NC, 00103$
	C$ending.c$54$3_0$134	= .
	.globl	C$ending.c$54$3_0$134
;src/ending.c:54: score_text[i] += 64U;
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x40
	ld	(de), a
	C$ending.c$53$2_0$133	= .
	.globl	C$ending.c$53$2_0$133
;src/ending.c:53: for(i=0; score_text[i] != 0 && i < 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	00107$
00103$:
	C$ending.c$56$1_0$132	= .
	.globl	C$ending.c$56$1_0$132
;src/ending.c:56: set_win_tiles(8, 1, i, 1, score_text);
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, (#_i)
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
	C$ending.c$57$1_0$132	= .
	.globl	C$ending.c$57$1_0$132
;src/ending.c:57: set_win_tile_xy(8 + i, 1, 0x7A);
	ld	hl, #_i
	ld	a, (hl)
	add	a, #0x08
	ld	h, #0x7a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tile_xy
	add	sp, #3
;C:/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x78
	ldh	(_WY_REG + 0), a
	C$ending.c$60$1_0$132	= .
	.globl	C$ending.c$60$1_0$132
;src/ending.c:60: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
	C$ending.c$66$1_0$132	= .
	.globl	C$ending.c$66$1_0$132
;src/ending.c:66: }
	di
	C$ending.c$63$2_0$135	= .
	.globl	C$ending.c$63$2_0$135
;src/ending.c:63: STAT_REG = STATF_LYC | STATF_MODE01;
	ld	a, #0x50
	ldh	(_STAT_REG + 0), a
	C$ending.c$64$2_0$135	= .
	.globl	C$ending.c$64$2_0$135
;src/ending.c:64: LYC_REG = 0x00;
	xor	a, a
	ldh	(_LYC_REG + 0), a
	C$ending.c$65$2_0$135	= .
	.globl	C$ending.c$65$2_0$135
;src/ending.c:65: add_LCD(scanline_interrupt_script);
	ld	de, #_scanline_interrupt_script
	push	de
	call	_add_LCD
	pop	hl
	ei
	C$ending.c$67$1_0$132	= .
	.globl	C$ending.c$67$1_0$132
;src/ending.c:67: set_interrupts(VBL_IFLAG | LCD_IFLAG);
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
00109$:
	C$ending.c$68$1_0$132	= .
	.globl	C$ending.c$68$1_0$132
;src/ending.c:68: }
	inc	sp
	C$ending.c$68$1_0$132	= .
	.globl	C$ending.c$68$1_0$132
	XFending$prepare_ending_frame$0$0	= .
	.globl	XFending$prepare_ending_frame$0$0
	ret
	G$compute_ending_frame$0$0	= .
	.globl	G$compute_ending_frame$0$0
	C$ending.c$70$1_0$140	= .
	.globl	C$ending.c$70$1_0$140
;src/ending.c:70: void compute_ending_frame(void){
;	---------------------------------
; Function compute_ending_frame
; ---------------------------------
_compute_ending_frame::
	C$ending.c$71$1_0$140	= .
	.globl	C$ending.c$71$1_0$140
;src/ending.c:71: prepare_ending_frame();
	call	_prepare_ending_frame
	C$ending.c$73$1_0$140	= .
	.globl	C$ending.c$73$1_0$140
;src/ending.c:73: if(counter == 10u) return; //animation ended 
	ld	a, (#_counter)
	sub	a, #0x0a
	ret	Z
	jr	00102$
00102$:
;src/ending.c:75: move_win(7u, win_height);
	ld	hl, #_win_height
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, c
	ldh	(_WY_REG + 0), a
	C$ending.c$76$1_0$140	= .
	.globl	C$ending.c$76$1_0$140
;src/ending.c:76: win_height = win_height + 1;
	inc	(hl)
	ld	a, (hl)
	C$ending.c$77$1_0$140	= .
	.globl	C$ending.c$77$1_0$140
;src/ending.c:77: counter++;
	ld	hl, #_counter
	inc	(hl)
	C$ending.c$80$1_0$140	= .
	.globl	C$ending.c$80$1_0$140
;src/ending.c:80: }
	C$ending.c$80$1_0$140	= .
	.globl	C$ending.c$80$1_0$140
	XG$compute_ending_frame$0$0	= .
	.globl	XG$compute_ending_frame$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
