;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module ending
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _LCD_isr
	.globl _VBL_isr
	.globl _itoa
	.globl _set_win_tile_xy
	.globl _set_win_tiles
	.globl _set_interrupts
	.globl _add_LCD
	.globl _add_VBL
	.globl _remove_LCD
	.globl _remove_VBL
	.globl _ending_flags
	.globl _ending_init
	.globl _compute_ending_frame
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$ending_flags$0_0$0==.
_ending_flags::
	.ds 1
Fending$subpix_speed$0_0$0==.
_subpix_speed:
	.ds 1
Fending$force$0_0$0==.
_force:
	.ds 1
Fending$win_height$0_0$0==.
_win_height:
	.ds 2
Fending$max_scan$0_0$0==.
_max_scan:
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
	G$VBL_isr$0$0	= .
	.globl	G$VBL_isr$0$0
	C$ending.c$36$0_0$125	= .
	.globl	C$ending.c$36$0_0$125
;src/ending.c:36: void VBL_isr() { 
;	---------------------------------
; Function VBL_isr
; ---------------------------------
_VBL_isr::
	C$ending.c$37$1_0$125	= .
	.globl	C$ending.c$37$1_0$125
;src/ending.c:37: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
	C$ending.c$38$1_0$125	= .
	.globl	C$ending.c$38$1_0$125
;src/ending.c:38: LYC_REG = max_scan; 
	ld	a, (#_max_scan)
	ldh	(_LYC_REG + 0), a
	C$ending.c$39$1_0$125	= .
	.globl	C$ending.c$39$1_0$125
;src/ending.c:39: }
	C$ending.c$39$1_0$125	= .
	.globl	C$ending.c$39$1_0$125
	XG$VBL_isr$0$0	= .
	.globl	XG$VBL_isr$0$0
	ret
	G$LCD_isr$0$0	= .
	.globl	G$LCD_isr$0$0
	C$ending.c$40$1_0$126	= .
	.globl	C$ending.c$40$1_0$126
;src/ending.c:40: void LCD_isr() {
;	---------------------------------
; Function LCD_isr
; ---------------------------------
_LCD_isr::
	C$ending.c$41$1_0$126	= .
	.globl	C$ending.c$41$1_0$126
;src/ending.c:41: if (LY_REG < 144) HIDE_WIN;
	ldh	a, (_LY_REG + 0)
	sub	a, #0x90
	ret	NC
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
	C$ending.c$42$1_0$126	= .
	.globl	C$ending.c$42$1_0$126
;src/ending.c:42: }
	C$ending.c$42$1_0$126	= .
	.globl	C$ending.c$42$1_0$126
	XG$LCD_isr$0$0	= .
	.globl	XG$LCD_isr$0$0
	ret
	G$ending_init$0$0	= .
	.globl	G$ending_init$0$0
	C$ending.c$44$1_0$128	= .
	.globl	C$ending.c$44$1_0$128
;src/ending.c:44: void ending_init(void){
;	---------------------------------
; Function ending_init
; ---------------------------------
_ending_init::
	C$ending.c$45$1_0$128	= .
	.globl	C$ending.c$45$1_0$128
;src/ending.c:45: ending_flags = 0b10000000;
	ld	hl, #_ending_flags
	ld	(hl), #0x80
	C$ending.c$48$1_0$128	= .
	.globl	C$ending.c$48$1_0$128
;src/ending.c:48: remove_VBL(VBL_isr);
	ld	de, #_VBL_isr
	push	de
	call	_remove_VBL
	pop	hl
	C$ending.c$49$1_0$128	= .
	.globl	C$ending.c$49$1_0$128
;src/ending.c:49: remove_LCD(LCD_isr);
	ld	de, #_LCD_isr
	push	de
	call	_remove_LCD
	pop	hl
;C:/gbdk/include/gb/gb.h:1546: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 80)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 84)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 88)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 92)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 96)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 100)
	ld	(hl), #0x00
	C$ending.c$56$3_0$128	= .
	.globl	C$ending.c$56$3_0$128
;src/ending.c:56: hide_sprite(25);
	C$ending.c$57$3_0$128	= .
	.globl	C$ending.c$57$3_0$128
;src/ending.c:57: }
	C$ending.c$57$3_0$128	= .
	.globl	C$ending.c$57$3_0$128
	XG$ending_init$0$0	= .
	.globl	XG$ending_init$0$0
	ret
	Fending$prepare_ending_frame$0$0	= .
	.globl	Fending$prepare_ending_frame$0$0
	C$ending.c$59$3_0$148	= .
	.globl	C$ending.c$59$3_0$148
;src/ending.c:59: void prepare_ending_frame(void){
;	---------------------------------
; Function prepare_ending_frame
; ---------------------------------
_prepare_ending_frame:
	dec	sp
	C$ending.c$61$1_0$148	= .
	.globl	C$ending.c$61$1_0$148
;src/ending.c:61: if(IS_ANIMATION_STARTED) {return;}
	ld	a, (#_ending_flags)
	bit	2, a
	jp	NZ,00116$
	C$ending.c$63$1_0$148	= .
	.globl	C$ending.c$63$1_0$148
;src/ending.c:63: ending_flags |= 0x04; //mark is_ended as true
	ld	hl, #_ending_flags
	ld	a, (hl)
	or	a, #0x04
	ld	(hl), a
	C$ending.c$64$1_0$148	= .
	.globl	C$ending.c$64$1_0$148
;src/ending.c:64: win_height = 0xB000u;
	ld	hl, #_win_height
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0xb0
	C$ending.c$66$1_0$148	= .
	.globl	C$ending.c$66$1_0$148
;src/ending.c:66: force = 4u; //initial force is 4u
	ld	hl, #_force
	ld	(hl), #0x04
	C$ending.c$69$1_0$148	= .
	.globl	C$ending.c$69$1_0$148
;src/ending.c:69: set_win_tiles(0,0, 20U, 3U, hud_map);
	ld	de, #_hud_map
	push	de
	ld	hl, #0x314
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
	C$ending.c$70$1_0$148	= .
	.globl	C$ending.c$70$1_0$148
;src/ending.c:70: itoa(score, score_text, 10);
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
	C$ending.c$71$2_0$150	= .
	.globl	C$ending.c$71$2_0$150
;src/ending.c:71: for(i=0; score_text[i] != 0 && i < 5; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00114$:
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
	C$ending.c$72$3_0$151	= .
	.globl	C$ending.c$72$3_0$151
;src/ending.c:72: score_text[i] += 64U;
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x40
	ld	(de), a
	C$ending.c$71$2_0$150	= .
	.globl	C$ending.c$71$2_0$150
;src/ending.c:71: for(i=0; score_text[i] != 0 && i < 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	00114$
00103$:
	C$ending.c$74$1_0$148	= .
	.globl	C$ending.c$74$1_0$148
;src/ending.c:74: set_win_tiles(8, 1, i, 1, score_text);
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
	C$ending.c$75$1_0$148	= .
	.globl	C$ending.c$75$1_0$148
;src/ending.c:75: set_win_tile_xy(8 + i, 1, 0x7A);
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
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 82)
	ld	(hl), #0x81
;C:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 83)
	ld	(hl), #0x40
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 86)
	ld	(hl), #0x80
;C:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 87)
	ld	(hl), #0x40
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 90)
	ld	(hl), #0x23
	ld	hl, #(_shadow_OAM + 94)
	ld	(hl), #0x23
	ld	hl, #(_shadow_OAM + 98)
	ld	(hl), #0x24
	ld	hl, #(_shadow_OAM + 102)
	ld	(hl), #0x24
	C$ending.c$88$1_0$148	= .
	.globl	C$ending.c$88$1_0$148
;src/ending.c:88: subpix_speed = 252u;
	ld	hl, #_subpix_speed
	ld	(hl), #0xfc
	C$ending.c$96$1_0$148	= .
	.globl	C$ending.c$96$1_0$148
;src/ending.c:96: }
	di
	C$ending.c$91$2_0$152	= .
	.globl	C$ending.c$91$2_0$152
;src/ending.c:91: add_VBL(VBL_isr);
	ld	de, #_VBL_isr
	push	de
	call	_add_VBL
	pop	hl
	C$ending.c$92$2_0$152	= .
	.globl	C$ending.c$92$2_0$152
;src/ending.c:92: add_LCD(LCD_isr);
	ld	de, #_LCD_isr
	push	de
	call	_add_LCD
	pop	hl
	C$ending.c$93$2_0$152	= .
	.globl	C$ending.c$93$2_0$152
;src/ending.c:93: set_interrupts(VBL_IFLAG | LCD_IFLAG);
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
	C$ending.c$94$2_0$152	= .
	.globl	C$ending.c$94$2_0$152
;src/ending.c:94: STAT_REG |= 0x40; // enable LY == LYC mode 
	ldh	a, (_STAT_REG + 0)
	or	a, #0x40
	ldh	(_STAT_REG + 0), a
	C$ending.c$95$2_0$152	= .
	.globl	C$ending.c$95$2_0$152
;src/ending.c:95: LYC_REG = 160u;   // make it never fire
	ld	a, #0xa0
	ldh	(_LYC_REG + 0), a
	ei
00116$:
	C$ending.c$97$2_0$148	= .
	.globl	C$ending.c$97$2_0$148
;src/ending.c:97: }
	inc	sp
	C$ending.c$97$2_0$148	= .
	.globl	C$ending.c$97$2_0$148
	XFending$prepare_ending_frame$0$0	= .
	.globl	XFending$prepare_ending_frame$0$0
	ret
	G$compute_ending_frame$0$0	= .
	.globl	G$compute_ending_frame$0$0
	C$ending.c$99$2_0$178	= .
	.globl	C$ending.c$99$2_0$178
;src/ending.c:99: void compute_ending_frame(void){
;	---------------------------------
; Function compute_ending_frame
; ---------------------------------
_compute_ending_frame::
	C$ending.c$100$1_0$178	= .
	.globl	C$ending.c$100$1_0$178
;src/ending.c:100: prepare_ending_frame();
	call	_prepare_ending_frame
;src/ending.c:101: move_win(7u, WIN_PIXEL);
	ld	hl, #_win_height + 1
	ld	c, (hl)
	ld	b, c
;C:/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, b
	ldh	(_WY_REG + 0), a
;src/ending.c:102: move_sprite(20, 8, WIN_PIXEL + 8u);
	ld	a, c
	add	a, #0x08
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 80)
	ld	(hl+), a
	ld	(hl), #0x08
;src/ending.c:103: move_sprite(21, 160, WIN_PIXEL + 8u);
	ld	a, (#_win_height + 1)
	add	a, #0x08
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 84)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl), c
	inc	hl
	ld	(hl), #0xa0
;src/ending.c:104: move_sprite(22, 8, WIN_PIXEL - 8);
	ld	a, (#_win_height + 1)
	add	a, #0xf8
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 88)
	ld	(hl+), a
	ld	(hl), #0x08
;src/ending.c:105: move_sprite(23, 160, WIN_PIXEL - 8);
	ld	a, (#_win_height + 1)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 92)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl), c
	inc	hl
	ld	(hl), #0xa0
;src/ending.c:106: move_sprite(24, 8, WIN_PIXEL);
	ld	hl, #_win_height + 1
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 96)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl), c
	inc	hl
	ld	(hl), #0x08
;src/ending.c:107: move_sprite(25, 160, WIN_PIXEL);
	ld	hl, #_win_height + 1
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 100)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl), c
	inc	hl
	ld	(hl), #0xa0
	C$ending.c$110$1_0$178	= .
	.globl	C$ending.c$110$1_0$178
;src/ending.c:110: if(subpix_speed > MAX_SPEED) {
	ld	a, #0x0d
	ld	hl, #_subpix_speed
	sub	a, (hl)
	jr	NC, 00104$
	C$ending.c$111$2_0$179	= .
	.globl	C$ending.c$111$2_0$179
;src/ending.c:111: ending_flags &= 0b11110111; //IS_FORCE_ADDED = false
	ld	hl, #_ending_flags
	ld	a, (hl)
	and	a, #0xf7
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 99)
	ld	(hl), #0x20
	ld	hl, #(_shadow_OAM + 103)
	ld	(hl), #0x20
	C$ending.c$113$1_0$178	= .
	.globl	C$ending.c$113$1_0$178
;src/ending.c:113: set_sprite_prop(25, S_FLIPX);
	jr	00105$
00104$:
	C$ending.c$115$1_0$178	= .
	.globl	C$ending.c$115$1_0$178
;src/ending.c:115: else if(subpix_speed == 0) {
	ld	a, (#_subpix_speed)
	or	a, a
	jr	NZ, 00105$
	C$ending.c$117$2_0$180	= .
	.globl	C$ending.c$117$2_0$180
;src/ending.c:117: ending_flags |= 0b00001001; //IS_FORCE_ADDED = true, IS_ANIMATION_FINISHED = true
	ld	hl, #_ending_flags
	ld	a, (hl)
	or	a, #0x09
	ld	(hl), a
	C$ending.c$118$2_0$180	= .
	.globl	C$ending.c$118$2_0$180
;src/ending.c:118: ending_flags ^= 0b00000010; //swap WIN_DIRECTION
	ld	a, (hl)
	xor	a, #0x02
	ld	(hl), a
	C$ending.c$119$2_0$180	= .
	.globl	C$ending.c$119$2_0$180
;src/ending.c:119: force = 0x00; //make the force smaller for the sway, 0 so it turns to 1 now
	ld	hl, #_force
	ld	(hl), #0x00
;C:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 99)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 103)
	ld	(hl), #0x00
	C$ending.c$121$1_0$178	= .
	.globl	C$ending.c$121$1_0$178
;src/ending.c:121: set_sprite_prop(25, 0x00);
00105$:
	C$ending.c$111$1_0$178	= .
	.globl	C$ending.c$111$1_0$178
;src/ending.c:111: ending_flags &= 0b11110111; //IS_FORCE_ADDED = false
	ld	hl, #_ending_flags
	ld	e, (hl)
	C$ending.c$124$1_0$178	= .
	.globl	C$ending.c$124$1_0$178
;src/ending.c:124: if(IS_ANIMATION_FINISHED){      
	bit	0, e
	jr	Z, 00107$
	C$ending.c$125$2_0$181	= .
	.globl	C$ending.c$125$2_0$181
;src/ending.c:125: force ^= 0x01; //make the force smaller for the sway, either 1 or 0
	ld	hl, #_force
	ld	a, (hl)
	xor	a, #0x01
	ld	(hl), a
00107$:
	C$ending.c$127$1_0$178	= .
	.globl	C$ending.c$127$1_0$178
;src/ending.c:127: subpix_speed = (IS_FORCE_ADDED) ? subpix_speed + force : subpix_speed - force;
	bit	3, e
	jr	Z, 00121$
	ld	a, (#_subpix_speed)
	ld	hl, #_force
	add	a, (hl)
	jr	00122$
00121$:
	ld	a, (#_subpix_speed)
	ld	hl, #_force
	sub	a, (hl)
00122$:
	ld	hl, #_subpix_speed
	ld	(hl), a
	C$ending.c$128$1_0$178	= .
	.globl	C$ending.c$128$1_0$178
;src/ending.c:128: win_height = WIN_DIRECTION ? win_height + ((uint16_t)(subpix_speed) << 2) : win_height - ((uint16_t)(subpix_speed) << 2);
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	bit	1, e
	jr	Z, 00123$
	ld	a, c
	ld	hl, #_win_height
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	jr	00124$
00123$:
	ld	hl, #_win_height
	ld	a, (hl+)
	sub	a, c
	ld	c, a
	ld	a, (hl)
	sbc	a, b
	ld	b, a
00124$:
	ld	hl, #_win_height
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$ending.c$129$1_0$178	= .
	.globl	C$ending.c$129$1_0$178
;src/ending.c:129: max_scan = WIN_PIXEL + 23U;
	ld	a, (hl)
	add	a, #0x17
	ld	(#_max_scan),a
	C$ending.c$130$1_0$178	= .
	.globl	C$ending.c$130$1_0$178
;src/ending.c:130: }
	C$ending.c$130$1_0$178	= .
	.globl	C$ending.c$130$1_0$178
	XG$compute_ending_frame$0$0	= .
	.globl	XG$compute_ending_frame$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
