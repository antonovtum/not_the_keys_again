;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module director
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _LCD_interrupt
	.globl _VBL_interrupt
	.globl _render_all_particles
	.globl _instanciate_puff
	.globl _end_frame
	.globl _render_player
	.globl _player_init
	.globl _load_map
	.globl _fill_bkg_rect
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tile_xy
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _joypad
	.globl _add_LCD
	.globl _add_VBL
	.globl _remove_LCD
	.globl _remove_VBL
	.globl _open_window_map
	.globl _open_window_tiles
	.globl _cloud_map
	.globl _cloud_tiles
	.globl _play_intro_cinematic
	.globl _finish_frame_inner
	.globl _finish_frame_with_animation_inner
	.globl _screen_shake
	.globl _pan_up
	.globl _pan_cloud
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_i:
	.ds 1
_current_camera_y:
	.ds 1
_prev_camera_y:
	.ds 1
_is_generated:
	.ds 1
_max_scan:
	.ds 1
_cloud_cut_scan:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_frame_counter:
	.ds 1
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
;src/director.c:85: void VBL_interrupt(void) {
;	---------------------------------
; Function VBL_interrupt
; ---------------------------------
_VBL_interrupt::
;src/director.c:87: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/director.c:88: LYC_REG = cloud_cut_scan; 
	ld	a, (#_cloud_cut_scan)
	ldh	(_LYC_REG + 0), a
;src/director.c:89: BGP_REG = DMG_PALETTE(DMG_WHITE, DMG_WHITE, DMG_WHITE, DMG_WHITE); 
	xor	a, a
	ldh	(_BGP_REG + 0), a
;src/director.c:90: }
	ret
_cloud_tiles:
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_cloud_map:
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
_open_window_tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x0c	; 12
	.db #0xc0	; 192
	.db #0x3c	; 60
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x98	; 152
	.db #0xfc	; 252
	.db #0x88	; 136
	.db #0xfc	; 252
	.db #0x88	; 136
	.db #0xfc	; 252
	.db #0x88	; 136
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0x30	; 48	'0'
	.db #0xfc	; 252
	.db #0xdc	; 220
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_open_window_map:
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x72	; 114	'r'
	.db #0x04	; 4
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x73	; 115	's'
	.db #0x04	; 4
	.db #0x61	; 97	'a'
	.db #0x61	; 97	'a'
	.db #0x74	; 116	't'
	.db #0x04	; 4
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x73	; 115	's'
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x77	; 119	'w'
;src/director.c:91: void LCD_interrupt(void) {
;	---------------------------------
; Function LCD_interrupt
; ---------------------------------
_LCD_interrupt::
;src/director.c:92: if (LY_REG < 144) {
	ldh	a, (_LY_REG + 0)
	sub	a, #0x90
	ret	NC
;src/director.c:93: if (LY_REG == max_scan)
	ldh	a, (_LY_REG + 0)
	ld	hl, #_max_scan
	sub	a, (hl)
	jr	NZ, 00104$
;src/director.c:95: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/director.c:96: WX_REG = 160; //THIS IS TO COVER A BUG ON THE DMG!!! REMOVE IT FOR THE GBC VERSION
	ld	a, #0xa0
	ldh	(_WX_REG + 0), a
	ret
00104$:
;src/director.c:98: } else if (LY_REG == cloud_cut_scan -6)
	ld	a, (#_cloud_cut_scan)
	ld	b, #0x00
	add	a, #0xfa
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ldh	a, (_LY_REG + 0)
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, c
	ret	NZ
	ld	a, d
	sub	a, b
	ret	NZ
;src/director.c:100: LYC_REG = max_scan;
	ld	a, (#_max_scan)
	ldh	(_LYC_REG + 0), a
;src/director.c:102: BGP_REG = DMG_PALETTE(DMG_WHITE, DMG_LITE_GRAY, DMG_DARK_GRAY, DMG_BLACK); 
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;src/director.c:116: }
	ret
;src/director.c:120: void play_intro_cinematic(void){
;	---------------------------------
; Function play_intro_cinematic
; ---------------------------------
_play_intro_cinematic::
	add	sp, #-5
;src/director.c:122: SHOW_BKG; SHOW_SPRITES; HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/director.c:125: load_map();
	call	_load_map
;src/director.c:128: player_init();
	call	_player_init
;src/director.c:130: set_sprite_data(37, 10, playerSprite_extra);
	ld	de, #_playerSprite_extra
	push	de
	ld	hl, #0xa25
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/director.c:131: set_sprite_data(47, 23, thought_bubble);
	ld	de, #_thought_bubble
	push	de
	ld	hl, #0x172f
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/director.c:133: set_bkg_data(0x70, 2, cloud_tiles);
	ld	de, #_cloud_tiles
	push	de
	ld	hl, #0x270
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/director.c:134: set_bkg_data(0x72, 6, open_window_tiles);
	ld	de, #_open_window_tiles
	push	de
	ld	hl, #0x672
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/director.c:135: set_bkg_tile_xy(0, 17, 0x61);
	ld	hl, #0x6111
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;src/director.c:136: set_bkg_tile_xy(0, 16, 0x6D);
	ld	hl, #0x6d10
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;src/director.c:137: set_bkg_tile_xy(21, 17, 0x61);
	ld	hl, #0x6111
	push	hl
	ld	a, #0x15
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;src/director.c:138: set_bkg_tile_xy(21, 16, 0x6C);
	ld	hl, #0x6c10
	push	hl
	ld	a, #0x15
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;src/director.c:139: set_bkg_tile_xy(0, 15, 0x4D);
	ld	hl, #0x4d0f
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;src/director.c:140: set_bkg_data(0x80, 31, badday_data);
	ld	de, #_badday_data
	push	de
	ld	hl, #0x1f80
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/director.c:141: set_sprite_data(0xA0, 8, mrwhosit);
	ld	de, #_mrwhosit
	push	de
	ld	hl, #0x8a0
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/director.c:143: player_x = 0;
	xor	a, a
	ld	hl, #_player_x
	ld	(hl+), a
	ld	(hl), a
;src/director.c:144: move_metasprite(idle_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	c, (hl)
	ld	hl, #_idle_metasprites
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), b
	inc	hl
	ld	(hl), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ldhl	sp,	#3
	ld	a, c
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	(hl-), a
	ld	(hl), #0x00
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	xor	a, a
	call	___move_metasprite
;src/director.c:145: current_state = PLAYER_STATE_RUNNING;
	ld	hl, #_current_state
	ld	(hl), #0x01
;src/director.c:148: for (i = 0; i < 42; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00325$:
;src/director.c:149: player_x += 1<<8;
	ld	hl, #_player_x
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	inc	a
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/director.c:151: finish_frame_with_animation(1)
	ld	a, #0x01
	call	_finish_frame_with_animation_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:148: for (i = 0; i < 42; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x2a
	jr	C, 00325$
;src/director.c:154: for (i = 0; i < 36; i++)
	ld	(hl), #0x00
00327$:
;src/director.c:156: if (frame_counter & 0x01)
	ld	a, (#_frame_counter)
	rrca
	jr	NC, 00105$
;src/director.c:158: player_x += 1<<8;
	ld	a, (#_player_x)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, (#_player_x + 1)
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0100
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl)
	ld	(#_player_x),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_player_x + 1),a
00105$:
;src/director.c:161: finish_frame_with_animation(1)
	ld	a, #0x01
	call	_finish_frame_with_animation_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:154: for (i = 0; i < 36; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x24
	jr	C, 00327$
;src/director.c:164: current_state = PLAYER_STATE_IDLE;
	ld	hl, #_current_state
	ld	(hl), #0x00
;src/director.c:165: finish_frame_with_animation(15)
	ld	a, #0x0f
	call	_finish_frame_with_animation_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:166: is_facing_right = false;
	ld	hl, #_is_facing_right
	ld	(hl), #0x00
;src/director.c:167: finish_frame_with_animation(26)
	ld	a, #0x1a
	call	_finish_frame_with_animation_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:170: move_metasprite_vflip(idle_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	b, (hl)
	ld	hl, #_player_x + 1
	ld	c, (hl)
	ld	hl, #_idle_metasprites + 1
	ld	a,	(hl-)
;	spillPairReg hl
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:200: __current_metasprite = metasprite;
	ld	e, (hl)
	ld	d, a
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:201: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:202: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:203: return __move_metasprite_vflip(base_sprite, (y << 8) | (uint8_t)(x - 8u));
	ld	d, b
	ld	e, #0x00
	ld	a, c
	add	a, #0xf8
	or	a, e
	ld	e, a
	xor	a, a
	call	___move_metasprite_vflip
;src/director.c:172: for (i=0; i<6; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00329$:
;src/director.c:173: move_metasprite(key_left_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	e, (hl)
	ld	hl, #_player_x + 1
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_key_left_0)
	ld	(hl+), a
	ld	(hl), #>(_key_left_0)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, e
	xor	a, a
	or	a, c
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:175: finish_frame(8)
	ld	a, #0x08
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:177: move_metasprite(key_left_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	c, (hl)
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_key_left_1)
	ld	(hl+), a
	ld	(hl), #>(_key_left_1)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	xor	a, a
	call	___move_metasprite
;src/director.c:179: finish_frame(8)
	ld	a, #0x08
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:172: for (i=0; i<6; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jr	C, 00329$
;src/director.c:181: for (i=0; i<6; i++){
	ld	(hl), #0x00
00331$:
;src/director.c:182: move_metasprite(key_right_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	e, (hl)
	ld	hl, #_player_x + 1
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_key_right_0)
	ld	(hl+), a
	ld	(hl), #>(_key_right_0)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, e
	xor	a, a
	or	a, c
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:184: finish_frame(8)
	ld	a, #0x08
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:186: move_metasprite(key_right_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	c, (hl)
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_key_right_1)
	ld	(hl+), a
	ld	(hl), #>(_key_right_1)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	xor	a, a
	call	___move_metasprite
;src/director.c:188: finish_frame(8)
	ld	a, #0x08
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:181: for (i=0; i<6; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jr	C, 00331$
;src/director.c:191: current_state = PLAYER_STATE_IDLE;
	ld	hl, #_current_state
	ld	(hl), #0x00
;src/director.c:192: is_facing_right = false;
	ld	hl, #_is_facing_right
	ld	(hl), #0x00
;src/director.c:193: finish_frame_with_animation(20)
	ld	a, #0x14
	call	_finish_frame_with_animation_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:198: bubble_x = (uint8_t)SUB_TO_PX(player_x) - 4;
	ld	a, (#_player_x + 1)
	add	a, #0xfc
	ld	c, a
;src/director.c:199: bubble_y = player_y - 7; // 11
	ld	a, (#_player_y)
	add	a, #0xf9
	ld	b, a
;src/director.c:200: OBP1_REG = DMG_PALETTE(DMG_WHITE, DMG_WHITE, DMG_DARK_GRAY, DMG_BLACK);
	ld	a, #0xe0
	ldh	(_OBP1_REG + 0), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 82)
	ld	(hl), #0x3b
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1850: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 83)
	ld	(hl), #0x10
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 80)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/director.c:204: finish_frame_with_animation(3)
	push	bc
	ld	a, #0x03
	call	_finish_frame_with_animation_inner
	ld	e, a
	pop	bc
	bit	0, e
	jp	NZ,00362$
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 82)
	ld	(hl), #0x3c
;src/director.c:206: move_sprite(20, bubble_x, bubble_y - 2);
	ld	e, b
	dec	e
	dec	e
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 80)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;src/director.c:207: finish_frame_with_animation(3)
	push	bc
	ld	a, #0x03
	call	_finish_frame_with_animation_inner
	ld	e, a
	pop	bc
	bit	0, e
	jp	NZ,00362$
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 82)
	ld	(hl), #0x3d
;src/director.c:209: move_sprite(20, bubble_x, bubble_y - 4);
	ld	a, b
	add	a, #0xfc
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 80)
	ld	(hl+), a
	ld	(hl), c
;src/director.c:210: finish_frame(3)
	ld	a, #0x03
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:213: bubble_y = player_y - 14;
	ld	a, (#_player_y)
	add	a, #0xf2
	ld	c, a
;src/director.c:214: move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y);
	ld	hl, #_player_x + 1
	ld	b, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_bubble_key)
	ld	(hl+), a
	ld	(hl), #>(_bubble_key)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	e, c
	ldhl	sp,	#1
	ld	a, e
	ld	(hl-), a
	ld	(hl), #0x00
	ld	a, b
	or	a, (hl)
	inc	hl
	ld	e, a
	ld	d, (hl)
	push	bc
	ld	a, #0x14
	call	___move_metasprite
	ld	a, #0x04
	call	_finish_frame_inner
	ld	e, a
	pop	bc
	bit	0, e
	jp	NZ,00362$
;src/director.c:216: move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y - 1);
	ld	a, c
	dec	a
	ldhl	sp,	#2
	ld	(hl), a
	ld	e, (hl)
	ld	hl, #_player_x + 1
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	a, #<(_bubble_key)
	ld	(___current_metasprite), a
	ld	a, #>(_bubble_key)
	ld	(___current_metasprite + 1), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	xor	a, a
	ld	(___current_base_tile), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	xor	a, a
	ld	(___current_base_prop), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, e
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	or	a, l
	ld	e, a
	push	bc
	ld	a, #0x14
	call	___move_metasprite
	ld	a, #0x04
	call	_finish_frame_inner
	ld	e, a
	pop	bc
	bit	0, e
	jp	NZ,00362$
;src/director.c:218: move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y - 2);
	ld	a, c
	add	a, #0xfe
	ldhl	sp,	#3
	ld	(hl), a
	ld	e, (hl)
	ld	hl, #_player_x + 1
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	a, #<(_bubble_key)
	ld	(___current_metasprite), a
	ld	a, #>(_bubble_key)
	ld	(___current_metasprite + 1), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	xor	a, a
	ld	(___current_base_tile), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	xor	a, a
	ld	(___current_base_prop), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, e
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	or	a, l
	ld	e, a
	push	bc
	ld	a, #0x14
	call	___move_metasprite
	ld	a, #0x04
	call	_finish_frame_inner
	ld	e, a
	pop	bc
	bit	0, e
	jp	NZ,00362$
;src/director.c:220: move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y - 3);
	ld	a, c
	add	a, #0xfd
	ldhl	sp,	#4
	ld	(hl), a
	ld	e, (hl)
	ld	hl, #_player_x + 1
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_bubble_key)
	ld	(hl+), a
	ld	(hl), #>(_bubble_key)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, e
	xor	a, a
	or	a, c
	ld	e, a
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:221: finish_frame(8)
	ld	a, #0x08
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:222: move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
	ld	a, (#_player_y)
	add	a, #0xf0
	ld	hl, #_player_x + 1
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_key)
	inc	hl
	ld	(hl), #>(_bubble_key)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, a
	xor	a, a
	or	a, c
	ld	e, a
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:223: finish_frame(90)
	ld	a, #0x5a
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:225: move_metasprite(bubble_empty, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
	ld	a, (#_player_y)
	add	a, #0xf0
	ld	c, a
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_bubble_empty)
	ld	(hl+), a
	ld	(hl), #>(_bubble_empty)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:226: finish_frame(15)
	ld	a, #0x0f
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:227: move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
	ld	a, (#_player_y)
	add	a, #0xf0
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_key)
	inc	hl
	ld	(hl), #>(_bubble_key)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	c, a
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:228: finish_frame(15)
	ld	a, #0x0f
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:229: move_metasprite(bubble_empty, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
	ld	a, (#_player_y)
	add	a, #0xf0
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_empty)
	inc	hl
	ld	(hl), #>(_bubble_empty)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	c, a
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:230: finish_frame(15)
	ld	a, #0x0f
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:231: move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
	ld	a, (#_player_y)
	add	a, #0xf0
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_key)
	inc	hl
	ld	(hl), #>(_bubble_key)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	c, a
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:232: finish_frame(15)
	ld	a, #0x0f
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:233: move_metasprite(bubble_empty, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
	ld	a, (#_player_y)
	add	a, #0xf0
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_empty)
	inc	hl
	ld	(hl), #>(_bubble_empty)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	c, a
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:234: finish_frame(20)
	ld	a, #0x14
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:235: move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
	ld	a, (#_player_y)
	add	a, #0xf0
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_key)
	inc	hl
	ld	(hl), #>(_bubble_key)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	c, a
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:236: finish_frame(30)
	ld	a, #0x1e
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:237: move_metasprite(bubble_empty, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
	ld	a, (#_player_y)
	add	a, #0xf0
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_empty)
	inc	hl
	ld	(hl), #>(_bubble_empty)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	c, a
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:239: finish_frame(120)
	ld	a, #0x78
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:241: hide_metasprite(bubble_empty, 20);
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:297: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_bubble_empty)
	ld	(hl+), a
	ld	(hl), #>(_bubble_empty)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:298: __hide_metasprite(base_sprite);
	ld	a, #0x14
	call	___hide_metasprite
;src/director.c:242: finish_frame(30)
	ld	a, #0x1e
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:244: move_metasprite(bubble_qmark, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y);
	ld	hl, #_player_x + 1
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_qmark)
	inc	hl
	ld	(hl), #>(_bubble_qmark)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ldhl	sp,	#0
	ld	a, (hl+)
	or	a, c
	ld	d, (hl)
	ld	e, a
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:245: finish_frame(4)
	ld	a, #0x04
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:246: move_metasprite(bubble_qmark, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y - 1);
	ld	hl, #_player_x + 1
	ld	e, (hl)
	ldhl	sp,	#2
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_qmark)
	inc	hl
	ld	(hl), #>(_bubble_qmark)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:247: finish_frame(4)
	ld	a, #0x04
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:248: move_metasprite(bubble_qmark, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y - 2);
	ld	hl, #_player_x + 1
	ld	e, (hl)
	ldhl	sp,	#3
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_qmark)
	inc	hl
	ld	(hl), #>(_bubble_qmark)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:249: finish_frame(4)
	ld	a, #0x04
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:250: move_metasprite(bubble_qmark, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y - 3);
	ld	hl, #_player_x + 1
	ld	e, (hl)
	ldhl	sp,	#4
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_qmark)
	inc	hl
	ld	(hl), #>(_bubble_qmark)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:251: finish_frame(8)
	ld	a, #0x08
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:252: move_metasprite(bubble_qmark, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
	ld	a, (#_player_y)
	add	a, #0xf0
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_qmark)
	inc	hl
	ld	(hl), #>(_bubble_qmark)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	c, a
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	ld	a, #0x14
	call	___move_metasprite
;src/director.c:253: finish_frame(120)
	ld	a, #0x78
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:256: screen_shake(10, idle_metasprites[0]);
	ld	hl, #_idle_metasprites
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	ld	a, #0x0a
	call	_screen_shake
;src/director.c:257: hide_metasprite(bubble_qmark, 20);
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:297: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_bubble_qmark)
	inc	hl
	ld	(hl), #>(_bubble_qmark)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:298: __hide_metasprite(base_sprite);
	ld	a, #0x14
	call	___hide_metasprite
;src/director.c:259: for (i=0; i<6; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00333$:
;src/director.c:260: move_metasprite(key_left_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	e, (hl)
	ld	hl, #_player_x + 1
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_key_left_0)
	ld	(hl+), a
	ld	(hl), #>(_key_left_0)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, e
	xor	a, a
	or	a, c
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:261: finish_frame(4)
	ld	a, #0x04
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:262: move_metasprite(key_left_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	c, (hl)
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_key_left_1)
	ld	(hl+), a
	ld	(hl), #>(_key_left_1)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	xor	a, a
	call	___move_metasprite
;src/director.c:263: finish_frame(4)
	ld	a, #0x04
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:259: for (i=0; i<6; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jr	C, 00333$
;src/director.c:265: for (i=0; i<6; i++){
	ld	(hl), #0x00
00335$:
;src/director.c:266: move_metasprite(key_right_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	e, (hl)
	ld	hl, #_player_x + 1
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_key_right_0)
	ld	(hl+), a
	ld	(hl), #>(_key_right_0)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, e
	xor	a, a
	or	a, c
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:267: finish_frame(4)
	ld	a, #0x04
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:268: move_metasprite(key_right_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	c, (hl)
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_key_right_1)
	ld	(hl+), a
	ld	(hl), #>(_key_right_1)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	xor	a, a
	call	___move_metasprite
;src/director.c:269: finish_frame(4)
	ld	a, #0x04
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:265: for (i=0; i<6; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jr	C, 00335$
;src/director.c:271: for (i=0; i<6; i++){
	ld	(hl), #0x00
00337$:
;src/director.c:272: move_metasprite(key_left_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	e, (hl)
	ld	hl, #_player_x + 1
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_key_left_0)
	ld	(hl+), a
	ld	(hl), #>(_key_left_0)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, e
	xor	a, a
	or	a, c
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:273: finish_frame(4)
	ld	a, #0x04
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:274: move_metasprite(key_left_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	c, (hl)
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_key_left_1)
	ld	(hl+), a
	ld	(hl), #>(_key_left_1)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	xor	a, a
	call	___move_metasprite
;src/director.c:275: finish_frame(4)
	ld	a, #0x04
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:271: for (i=0; i<6; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jr	C, 00337$
;src/director.c:278: screen_shake(10, idle_metasprites[0]);
	ld	hl, #_idle_metasprites
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	ld	a, #0x0a
	call	_screen_shake
;src/director.c:281: move_metasprite(pull_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-2, player_y);
	ld	hl, #_player_y
	ld	c, (hl)
	ld	hl, #_player_x + 1
	ld	e, (hl)
	dec	e
	dec	e
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_pull_0)
	ld	(hl+), a
	ld	(hl), #>(_pull_0)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	xor	a, a
	call	___move_metasprite
;src/director.c:282: finish_frame(1)
	ld	a, #0x01
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:283: move_metasprite(pull_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-4, player_y);
	ld	hl, #_player_y
	ld	c, (hl)
	ld	a, (#_player_x + 1)
	add	a, #0xfc
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_pull_0)
	inc	hl
	ld	(hl), #>(_pull_0)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, c
	ld	e, #0x00
	or	a, e
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:284: finish_frame(1)
	ld	a, #0x01
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:285: move_metasprite(pull_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-6, player_y);
	ld	hl, #_player_y
	ld	c, (hl)
	ld	a, (#_player_x + 1)
	add	a, #0xfa
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_pull_0)
	inc	hl
	ld	(hl), #>(_pull_0)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, c
	ld	e, #0x00
	or	a, e
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:286: finish_frame(1)
	ld	a, #0x01
	call	_finish_frame_inner
	bit	0,a
;src/director.c:289: for (uint8_t j = 0; j < 4; j++)
	jp	NZ,00362$
	ldhl	sp,	#4
	ld	(hl), #0x00
00342$:
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00195$
;src/director.c:291: move_metasprite(pull_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-9, player_y);        
	ld	hl, #_player_y
	ld	c, (hl)
	ld	a, (#_player_x + 1)
	add	a, #0xf7
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_pull_0)
	inc	hl
	ld	(hl), #>(_pull_0)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, c
	ld	e, #0x00
	or	a,e
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:292: finish_frame(15)
	ld	a, #0x0f
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:293: for (i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00339$:
;src/director.c:295: move_metasprite(pull_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-9, player_y);        
	ld	hl, #_player_y
	ld	c, (hl)
	ld	a, (#_player_x + 1)
	add	a, #0xf7
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_pull_1)
	inc	hl
	ld	(hl), #>(_pull_1)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, c
	ld	e, #0x00
	or	a,e
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:296: finish_frame(2)
	ld	a, #0x02
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:297: move_metasprite(pull_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-8, player_y);        
	ld	hl, #_player_y
	ld	c, (hl)
	ld	a, (#_player_x + 1)
	add	a, #0xf8
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_pull_1)
	inc	hl
	ld	(hl), #>(_pull_1)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, c
	ld	e, #0x00
;	spillPairReg hl
;	spillPairReg hl
	or	a, e
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:298: finish_frame(2)
	ld	a, #0x02
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:293: for (i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00339$
;src/director.c:289: for (uint8_t j = 0; j < 4; j++)
	ldhl	sp,	#4
	inc	(hl)
	jp	00342$
00195$:
;src/director.c:301: for (i = 0; i < 6; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00344$:
;src/director.c:303: move_metasprite(pull_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-9, player_y);        
	ld	hl, #_player_y
	ld	c, (hl)
	ld	a, (#_player_x + 1)
	add	a, #0xf7
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_pull_1)
	inc	hl
	ld	(hl), #>(_pull_1)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, c
	ld	e, #0x00
	or	a, e
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:304: finish_frame(2)
	ld	a, #0x02
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:305: move_metasprite(pull_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-8, player_y);        
	ld	hl, #_player_y
	ld	c, (hl)
	ld	a, (#_player_x + 1)
	add	a, #0xf8
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_pull_1)
	inc	hl
	ld	(hl), #>(_pull_1)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, c
	ld	e, #0x00
	or	a, e
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:306: finish_frame(2)
	ld	a, #0x02
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:301: for (i = 0; i < 6; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jr	C, 00344$
;src/director.c:308: finish_frame(2)
	ld	a, #0x02
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:311: player_x = player_x - (9<<8);
	ld	hl, #_player_x
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	ld	c,a
	ld	a,b
	add	a,#0xf7
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/director.c:312: move_metasprite_vflip(fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	b, (hl)
	ld	hl, #_player_x + 1
	ld	c, (hl)
	ld	hl, #_fall_metasprites + 1
	ld	a,	(hl-)
;	spillPairReg hl
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:200: __current_metasprite = metasprite;
	ld	e, (hl)
	ld	d, a
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:201: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:202: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:203: return __move_metasprite_vflip(base_sprite, (y << 8) | (uint8_t)(x - 8u));
	ld	d, b
	ld	e, #0x00
	ld	a, c
	add	a, #0xf8
	or	a, e
	ld	e, a
	xor	a, a
	call	___move_metasprite_vflip
;src/director.c:314: for (i = 0; i < 60; i++)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#4
	ld	(hl), #0x09
00346$:
;src/director.c:156: if (frame_counter & 0x01)
	ld	hl, #_frame_counter
	ld	b, (hl)
;src/director.c:316: if (frame_counter & 0x01)
	bit	0, b
	jr	Z, 00204$
;src/director.c:318: player_x += 1<<8;
	ld	hl, #_player_x
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	c, (hl)
	ld	a, (_player_x + 1)
	inc	a
	ld	hl, #_player_x
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/director.c:319: player_y -= (y_speed >> 2);
	ldhl	sp,	#4
	ld	c, (hl)
	sra	c
	sra	c
	ld	hl, #_player_y
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
00204$:
;src/director.c:321: if ((frame_counter & 0x03) == 0x02)
	ld	a, b
	and	a, #0x03
	sub	a, #0x02
	jr	NZ, 00206$
;src/director.c:323: y_speed--;
	ldhl	sp,	#4
	dec	(hl)
00206$:
;src/director.c:326: switch ((frame_counter >> 2) & 0x03)
	ld	a, (#_frame_counter)
	rrca
	rrca
	and	a, #0x3
	ldhl	sp,	#0
	ld	(hl), a
;src/director.c:144: move_metasprite(idle_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	a, (#_player_y)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:203: return __move_metasprite_vflip(base_sprite, (y << 8) | (uint8_t)(x - 8u));
	ldhl	sp,	#2
	ld	(hl-), a
;src/director.c:326: switch ((frame_counter >> 2) & 0x03)
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00207$
;src/director.c:199: bubble_y = player_y - 7; // 11
	ld	a, (#_player_y)
;src/director.c:333: move_metasprite_hvflip(fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y + 16);
	add	a, #0x10
	ldhl	sp,	#3
	ld	(hl), a
;src/director.c:326: switch ((frame_counter >> 2) & 0x03)
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	jr	Z, 00208$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x02
	jp	Z,00209$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x03
	jp	Z,00210$
	jp	00211$
;src/director.c:328: case 0x00:
00207$:
;src/director.c:329: move_metasprite_vflip(fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_x + 1
	ld	c, (hl)
	ld	hl, #_fall_metasprites
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:200: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), b
	inc	hl
	ld	(hl), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:201: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:202: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:203: return __move_metasprite_vflip(base_sprite, (y << 8) | (uint8_t)(x - 8u));
	ld	a, c
	add	a, #0xf8
	ld	c, a
	ldhl	sp,	#1
	ld	a, (hl+)
	or	a, c
	ld	d, (hl)
	ld	e, a
	xor	a, a
	call	___move_metasprite_vflip
;src/director.c:330: break;
	jp	00211$
;src/director.c:331: case 0x01:
00208$:
;src/director.c:333: move_metasprite_hvflip(fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y + 16);
	ldhl	sp,	#3
	ld	c, (hl)
	ld	a, (#_player_x + 1)
	ldhl	sp,	#0
	ld	(hl), a
	ld	hl, #_fall_metasprites
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:281: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), b
	inc	hl
	ld	(hl), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:282: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:283: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:284: return __move_metasprite_hvflip(base_sprite, ((y - ((LCDC_REG & LCDCF_OBJ16) ? 16u : 8u)) << 8) | (uint8_t)(x - 8));
	ldhl	sp,	#1
	ld	(hl), c
	ldh	a, (_LCDC_REG + 0)
	bit	2, a
	jr	Z, 00364$
	ldhl	sp,	#2
	ld	a, #0x10
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00365$
00364$:
	ldhl	sp,	#2
	ld	a, #0x08
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00365$:
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	e, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	b, a
	ld	c, #0x00
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0xf8
	or	a, c
	ld	e, a
	ld	d, b
	xor	a, a
	call	___move_metasprite_hvflip
;src/director.c:334: break;
	jr	00211$
;src/director.c:335: case 0x02:
00209$:
;src/director.c:337: move_metasprite_hflip(fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y + 16);
	ldhl	sp,	#3
	ld	b, (hl)
	ld	hl, #_player_x + 1
	ld	c, (hl)
	ld	hl, #_fall_metasprites + 1
	ld	a,	(hl-)
;	spillPairReg hl
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:241: __current_metasprite = metasprite;
	ld	e, (hl)
	ld	d, a
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:242: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:243: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:244: return __move_metasprite_hflip(base_sprite, ((y - ((LCDC_REG & LCDCF_OBJ16) ? 16u : 8u)) << 8) | x);
	ldh	a, (_LCDC_REG + 0)
	bit	2, a
	jr	Z, 00366$
	ld	de, #0x0010
	jr	00367$
00366$:
	ld	de, #0x0008
00367$:
	ld	a, b
	sub	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	or	a, c
	ld	e, a
	ld	d, l
	xor	a, a
	call	___move_metasprite_hflip
;src/director.c:338: break;
	jr	00211$
;src/director.c:339: case 0x03:
00210$:
;src/director.c:341: move_metasprite(fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_x + 1
	ld	c, (hl)
	ld	hl, #_fall_metasprites
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), b
	inc	hl
	ld	(hl), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ldhl	sp,	#1
	ld	a, (hl+)
	or	a, c
	ld	d, (hl)
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:343: }
00211$:
;src/director.c:344: finish_frame(1)
	ld	a, #0x01
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:314: for (i = 0; i < 60; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x3c
	jp	C, 00346$
;src/director.c:347: hide_metasprite(fall_metasprites[0], SPR_NUM_START);
	ld	hl, #_fall_metasprites
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:297: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), c
	inc	hl
	ld	(hl), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:298: __hide_metasprite(base_sprite);
	xor	a, a
	call	___hide_metasprite
;src/director.c:348: player_y += 12;
	ld	hl, #_player_y
	ld	a, (hl)
	add	a, #0x0c
	ld	(hl), a
;src/director.c:351: screen_shake(20, fallen);
	ld	de, #_fallen
	ld	a, #0x14
	call	_screen_shake
;src/director.c:353: finish_frame(70)
	ld	a, #0x46
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:357: for (i = 0; i < 60; i++){
	ld	hl, #_i
	ld	(hl), #0x00
	ld	c, #0x0a
00348$:
;src/director.c:358: if (frame_counter & 0x01)
	ld	a, (#_frame_counter)
	rrca
	jr	NC, 00218$
;src/director.c:360: player_y -= (y_speed >> 2);
	ld	b, c
	sra	b
	sra	b
	ld	hl, #_player_y
	ld	a, (hl)
	sub	a, b
	ld	(hl), a
;src/director.c:361: move_metasprite(y_speed > 0?jump_metasprites[0]:fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ld	hl, #_player_x + 1
	ld	b, (hl)
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 01195$
	bit	7, d
	jr	NZ, 01196$
	cp	a, a
	jr	01196$
01195$:
	bit	7, d
	jr	Z, 01196$
	scf
01196$:
	jr	NC, 00368$
	ld	hl, #_jump_metasprites + 1
	ld	a,	(hl-)
	ld	l, (hl)
;	spillPairReg hl
	jr	00369$
00368$:
	ld	hl, #_fall_metasprites + 1
	ld	a,	(hl-)
	ld	l, (hl)
;	spillPairReg hl
00369$:
	ld	e, l
	ld	d, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ldhl	sp,	#4
	ld	d, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, b
	or	a, l
	ld	e, a
	push	bc
	xor	a, a
	call	___move_metasprite
	pop	bc
;src/director.c:361: move_metasprite(y_speed > 0?jump_metasprites[0]:fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
00218$:
;src/director.c:363: if ((frame_counter & 0x03) == 0x02)
	ld	a, (#_frame_counter)
	and	a, #0x03
	sub	a, #0x02
	jr	NZ, 00220$
;src/director.c:365: y_speed--;
	dec	c
00220$:
;src/director.c:367: finish_frame(1)
	push	bc
	ld	a, #0x01
	call	_finish_frame_inner
	ld	e, a
	pop	bc
	bit	0, e
	jp	NZ,00362$
;src/director.c:357: for (i = 0; i < 60; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x3c
	jr	C, 00348$
;src/director.c:369: move_metasprite(idle_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	b, (hl)
	ld	hl, #_player_x + 1
	ld	c, (hl)
	ld	hl, #_idle_metasprites + 1
	ld	a,	(hl-)
;	spillPairReg hl
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	e, (hl)
	ld	d, a
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, b
	xor	a, a
	or	a, c
	ld	e, a
	xor	a, a
	call	___move_metasprite
;src/director.c:370: finish_frame(35)
	ld	a, #0x23
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:371: current_state = PLAYER_STATE_RUNNING;
	ld	hl, #_current_state
	ld	(hl), #0x01
;src/director.c:372: is_facing_right = false;
	ld	hl, #_is_facing_right
	ld	(hl), #0x00
;src/director.c:373: for (i = 0; i < 36; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00350$:
;src/director.c:375: if (frame_counter & 0x01)
	ld	a, (#_frame_counter)
	rrca
	jr	NC, 00227$
;src/director.c:377: player_x -= 1<<8;
	ld	hl, #_player_x
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	ld	c,a
	ld	a,b
	dec	a
	ld	(hl), c
	inc	hl
	ld	(hl), a
00227$:
;src/director.c:380: finish_frame_with_animation(1)
	ld	a, #0x01
	call	_finish_frame_with_animation_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:373: for (i = 0; i < 36; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x24
	jr	C, 00350$
;src/director.c:382: current_state = PLAYER_STATE_IDLE;
	ld	hl, #_current_state
	ld	(hl), #0x00
;src/director.c:383: finish_frame_with_animation(20)
	ld	a, #0x14
	call	_finish_frame_with_animation_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:384: is_facing_right = true;
	ld	hl, #_is_facing_right
	ld	(hl), #0x01
;src/director.c:385: finish_frame_with_animation(10)
	ld	a, #0x0a
	call	_finish_frame_with_animation_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:388: move_metasprite(look_up, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_player_y
	ld	c, (hl)
	ld	hl, #_player_x + 1
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_look_up)
	ld	(hl+), a
	ld	(hl), #>(_look_up)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, c
	xor	a, a
	call	___move_metasprite
;src/director.c:390: current_camera_y = camera_y;
	ld	a, (#_camera_y)
	ld	hl, #_current_camera_y
	ld	(hl), a
;src/director.c:391: prev_camera_y = current_camera_y;
	ld	a, (hl)
	ld	(#_prev_camera_y),a
;src/director.c:392: is_generated = false;
	ld	hl, #_is_generated
	ld	(hl), #0x00
;src/director.c:393: for (i = 1; i < 64; i++)
	ld	hl, #_i
	ld	(hl), #0x01
00352$:
;src/director.c:395: pan_up(i>>2);
	ld	hl, #_i
	ld	c, (hl)
	srl	c
	srl	c
	ld	a, c
	call	_pan_up
;src/director.c:396: finish_frame(1)
	ld	a, #0x01
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:393: for (i = 1; i < 64; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x40
	jr	C, 00352$
;src/director.c:398: for (i = 1; i < 40; i++)
	ld	(hl), #0x01
00354$:
;src/director.c:400: pan_up(16);
	ld	a, #0x10
	call	_pan_up
;src/director.c:401: finish_frame(1)
	ld	a, #0x01
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:398: for (i = 1; i < 40; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x28
	jr	C, 00354$
;src/director.c:404: pan_cloud();
	call	_pan_cloud
;src/director.c:406: for (i = 64; i > 3; i--)
	ld	hl, #_i
	ld	(hl), #0x40
00356$:
;src/director.c:408: if (i == 20)
	ld	a, (#_i)
	sub	a, #0x14
	jr	NZ, 00242$
;src/director.c:411: set_bkg_tiles(15, 25, 4, 5, open_window_map);
	ld	de, #_open_window_map
	push	de
	ld	hl, #0x504
	push	hl
	ld	hl, #0x190f
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/director.c:412: fill_bkg_rect(3, 25, 8, 5, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x05
	push	hl
	ld	hl, #0x819
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
;src/director.c:413: set_bkg_tiles(3, 22, 7, 6, badday_map);
	ld	de, #_badday_map
	push	de
	ld	hl, #0x607
	push	hl
	ld	hl, #0x1603
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00242$:
;src/director.c:416: pan_up(i>>2);
	ld	hl, #_i
	ld	c, (hl)
	srl	c
	srl	c
	ld	a, c
	call	_pan_up
;src/director.c:417: finish_frame(1)
	ld	a, #0x01
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:406: for (i = 64; i > 3; i--)
	ld	hl, #_i
	dec	(hl)
	ld	a, #0x03
	sub	a, (hl)
	jr	C, 00356$
;src/director.c:419: fill_bkg_rect(1, 16, 20, 7, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x07
	push	hl
	ld	hl, #0x1410
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
;src/director.c:420: set_bkg_tiles(3, 22, 7, 1, badday_map);
	ld	de, #_badday_map
	push	de
	ld	hl, #0x107
	push	hl
	ld	hl, #0x1603
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/director.c:421: for (i = 1; i < 60; i++)
	ld	hl, #_i
	ld	(hl), #0x01
00358$:
;src/director.c:423: if (i & 0x01)
	ld	a, (#_i)
	rrca
	jr	NC, 00247$
;src/director.c:425: pan_up(1);
	ld	a, #0x01
	call	_pan_up
00247$:
;src/director.c:427: finish_frame(1)
	ld	a, #0x01
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:421: for (i = 1; i < 60; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x3c
	jr	C, 00358$
;src/director.c:430: finish_frame(150)
	ld	a, #0x96
	call	_finish_frame_inner
	bit	0,a
	jp	NZ,00362$
;src/director.c:432: OBP1_REG = DMG_PALETTE(DMG_WHITE, DMG_WHITE, DMG_WHITE, DMG_WHITE);
	xor	a, a
	ldh	(_OBP1_REG + 0), a
;src/director.c:433: move_metasprite_ex(mrwhosit_sprite, 0, 0x10, 0, 30, 80);
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:151: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_mrwhosit_sprite)
	ld	(hl+), a
	ld	(hl), #>(_mrwhosit_sprite)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:152: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:153: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
	ld	(hl), #0x10
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:154: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	de, #0x501e
	xor	a, a
	call	___move_metasprite
;src/director.c:435: for(i = 0; i < 3; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00360$:
;src/director.c:436: switch (i)
	ld	a, (#_i)
	or	a, a
	jr	Z, 00253$
	ld	a, (#_i)
	dec	a
	jr	Z, 00254$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00255$
	jr	00257$
;src/director.c:438: case 0:
00253$:
;src/director.c:439: OBP1_REG = DMG_PALETTE(DMG_WHITE, DMG_WHITE, DMG_WHITE, DMG_LITE_GRAY);
	ld	a, #0x40
	ldh	(_OBP1_REG + 0), a
;src/director.c:440: instanciate_puff(38, 76, false);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x4c
	ld	a, #0x26
	call	_instanciate_puff
;src/director.c:441: break;
	jr	00257$
;src/director.c:443: case 1:
00254$:
;src/director.c:444: OBP1_REG = DMG_PALETTE(DMG_WHITE, DMG_WHITE, DMG_LITE_GRAY, DMG_DARK_GRAY);
	ld	a, #0x90
	ldh	(_OBP1_REG + 0), a
;src/director.c:445: instanciate_puff(79, 76, false);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x4c
	ld	a, #0x4f
	call	_instanciate_puff
;src/director.c:446: break;
	jr	00257$
;src/director.c:448: case 2:
00255$:
;src/director.c:449: OBP1_REG = DMG_PALETTE(DMG_WHITE, DMG_LITE_GRAY, DMG_DARK_GRAY, DMG_BLACK);
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
;src/director.c:450: instanciate_puff(70, 70, false);
	xor	a, a
	push	af
	inc	sp
	ld	a,#0x46
	ld	e,a
	call	_instanciate_puff
;src/director.c:454: }
00257$:
;src/director.c:455: finish_frame(8)
	ld	a, #0x08
	call	_finish_frame_inner
	bit	0,a
	jr	NZ, 00362$
;src/director.c:435: for(i = 0; i < 3; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00360$
;src/director.c:458: finish_frame(100)
	ld	a, #0x64
	call	_finish_frame_inner
	bit	0,a
	jr	NZ, 00362$
;src/director.c:460: i = 0;
	ld	hl, #_i
	ld	(hl), #0x00
;src/director.c:461: while (1)
	ld	bc, #_button_2+0
00266$:
;src/director.c:463: move_metasprite((i & 0x01) ? button_1 : button_2, 0, 20, 150, 134);
	ld	a, (#_i)
	rrca
	jr	NC, 00370$
	ld	de, #_button_1
	jr	00371$
00370$:
	ld	e, c
	ld	d, b
00371$:
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	push	bc
	ld	de, #0x8696
	ld	a, #0x14
	call	___move_metasprite
	ld	a, #0x32
	call	_finish_frame_inner
	ld	e, a
	pop	bc
	bit	0, e
	jr	NZ, 00362$
;src/director.c:465: i++;
	ld	hl, #_i
	inc	(hl)
	jr	00266$
00362$:
;src/director.c:467: }
	add	sp, #5
	ret
;src/director.c:476: bool finish_frame_inner(uint8_t count){
;	---------------------------------
; Function finish_frame_inner
; ---------------------------------
_finish_frame_inner::
	ld	c, a
;src/director.c:479: for ( iterator = 0; iterator < count; iterator++)
	ld	b, #0x00
00105$:
	ld	a, b
	sub	a, c
	jr	NC, 00103$
;src/director.c:481: joy = joypad();
	call	_joypad
;src/director.c:482: if (joy & (J_A | J_START | J_SELECT))
	and	a, #0xd0
	jr	Z, 00102$
;src/director.c:484: return true;
	ld	a, #0x01
	ret
00102$:
;src/director.c:487: frame_counter++;
	ld	hl, #_frame_counter
	inc	(hl)
;src/director.c:488: render_all_particles();
	push	bc
	call	_render_all_particles
	call	_end_frame
	pop	bc
;src/director.c:490: wait_vbl_done();
	call	_wait_vbl_done
;src/director.c:479: for ( iterator = 0; iterator < count; iterator++)
	inc	b
	jr	00105$
00103$:
;src/director.c:492: return false;
	xor	a, a
;src/director.c:493: }
	ret
;src/director.c:502: bool finish_frame_with_animation_inner(uint8_t count){
;	---------------------------------
; Function finish_frame_with_animation_inner
; ---------------------------------
_finish_frame_with_animation_inner::
	ld	c, a
;src/director.c:505: for ( iterator = 0; iterator < count; iterator++)
	ld	b, #0x00
00105$:
	ld	a, b
	sub	a, c
	jr	NC, 00103$
;src/director.c:507: joy = joypad();
	call	_joypad
;src/director.c:508: if (joy & (J_A | J_START | J_SELECT))
	and	a, #0xd0
	jr	Z, 00102$
;src/director.c:510: return true;
	ld	a, #0x01
	ret
00102$:
;src/director.c:513: frame_counter++;
	ld	hl, #_frame_counter
	inc	(hl)
;src/director.c:514: render_player();
	push	bc
	call	_render_player
	call	_end_frame
	pop	bc
;src/director.c:516: wait_vbl_done();
	call	_wait_vbl_done
;src/director.c:505: for ( iterator = 0; iterator < count; iterator++)
	inc	b
	jr	00105$
00103$:
;src/director.c:518: return false;
	xor	a, a
;src/director.c:519: }
	ret
;src/director.c:521: void screen_shake(uint8_t frames, const metasprite_t* player_frame){
;	---------------------------------
; Function screen_shake
; ---------------------------------
_screen_shake::
	add	sp, #-5
	ldhl	sp,	#3
;src/director.c:523: for (iterator = 0; iterator < frames; iterator++)
	ld	(hl+), a
	inc	sp
	inc	sp
	push	de
	ld	(hl), #0x00
00107$:
;src/director.c:527: move_metasprite(player_frame, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x) + movement_x - 8, player_y);
	ld	hl, #_player_y
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	b, (hl)
	ld	c, #0x00
;src/director.c:523: for (iterator = 0; iterator < frames; iterator++)
	ldhl	sp,	#4
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00101$
;src/director.c:525: uint8_t movement_x = (frame_counter) & 0x01 ? 8 : (frame_counter >> 1) & 0x01 ? 5 : 11;
	ld	a, (#_frame_counter)
	rrca
	jr	NC, 00111$
	ld	hl, #0x0008
	jr	00112$
00111$:
	ld	a, (#_frame_counter)
	rrca
	and	a, #0x01
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00113$
	ld	hl, #0x0005
	jr	00114$
00113$:
	ld	hl, #0x000b
00114$:
00112$:
	ld	a, l
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1378: SCX_REG=x, SCY_REG=y;
	ldh	(_SCX_REG + 0), a
	push	af
	xor	a, a
	ldh	(_SCY_REG + 0), a
	pop	af
;src/director.c:527: move_metasprite(player_frame, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x) + movement_x - 8, player_y);
	ld	hl, #_player_x + 1
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	add	a, l
	add	a, #0xf8
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	push	af
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#___current_metasprite),a
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#___current_metasprite + 1),a
	pop	af
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
;	spillPairReg hl
;	spillPairReg hl
	or	a, c
	ld	c, a
	push	de
	ld	e, c
	ld	d, b
	xor	a, a
	call	___move_metasprite
	pop	de
;src/director.c:528: frame_counter++;
	ld	hl, #_frame_counter
	inc	(hl)
;src/director.c:529: wait_vbl_done();
	call	_wait_vbl_done
;src/director.c:523: for (iterator = 0; iterator < frames; iterator++)
	ldhl	sp,	#4
	inc	(hl)
	jr	00107$
00101$:
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1378: SCX_REG=x, SCY_REG=y;
	ld	a, #0x08
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;src/director.c:532: move_metasprite(player_frame, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	a, (#_player_x + 1)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), e
	inc	hl
	ld	(hl), d
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	or	a, c
	ld	e, a
	ld	d, b
	xor	a, a
	call	___move_metasprite
;src/director.c:532: move_metasprite(player_frame, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
;src/director.c:533: }
	add	sp, #5
	ret
;src/director.c:535: void pan_up(uint8_t dy){
;	---------------------------------
; Function pan_up
; ---------------------------------
_pan_up::
	dec	sp
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;src/director.c:536: current_camera_y-=dy;
	ld	a, (#_current_camera_y)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	hl, #_current_camera_y
	ld	(hl), a
;src/director.c:537: move_bkg(8, current_camera_y);
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1378: SCX_REG=x, SCY_REG=y;
	ld	a, #0x08
	ldh	(_SCX_REG + 0), a
	ld	a, c
	ldh	(_SCY_REG + 0), a
;src/director.c:539: if (is_generated){return;}
	ld	hl, #_is_generated
	bit	0, (hl)
	jp	NZ,00118$
;src/director.c:541: uint8_t current_floor = (((current_camera_y-1) >> 3) & 0x1F) >> 3;
	ld	hl, #_current_camera_y
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
	and	a, #0x1f
	ld	c, a
	ld	b, #0x00
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;src/director.c:542: uint8_t old_floor = (((prev_camera_y) >> 3) & 0x1F) >> 3;
	ld	a, (#_prev_camera_y)
	swap	a
	rlca
	and	a, #0x1f
	ld	e, a
	ld	d, #0x00
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, e
;src/director.c:543: if(current_floor != old_floor){
	sub	a, c
	jr	Z, 00127$
;src/director.c:545: if(!is_generated){
	ld	hl, #_is_generated
	bit	0, (hl)
	jr	NZ, 00106$
;src/director.c:546: set_bkg_tiles(1, current_floor << 3, 20, 8, floor_map);
	ld	de, #_base_floor_map+0
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	push	de
	ld	h, #0x08
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x14
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/director.c:547: if(current_floor == 0) {is_generated = true;}
	ld	a, c
	or	a, a
	jr	NZ, 00106$
	ld	hl, #_is_generated
	ld	(hl), #0x01
00106$:
;src/director.c:549: prev_camera_y = current_camera_y-1;
	ld	a, (#_current_camera_y)
	dec	a
	ld	(#_prev_camera_y),a
;src/director.c:553: for (uint8_t j = 0; j < 4; j++)
00127$:
	ldhl	sp,	#1
	ld	(hl), #0x00
00116$:
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00118$
;src/director.c:555: if(shadow_OAM[j].y < 160){shadow_OAM[j].y += dy;}
	ld	e, (hl)
	ld	d, #0x00
	sla	e
	rl	d
	sla	e
	rl	d
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	a, (hl)
	sub	a, #0xa0
	jr	NC, 00110$
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	(bc), a
00110$:
;src/director.c:556: if(shadow_OAM[16 + j].y < 160){shadow_OAM[16 + j].y += dy;}
	ldhl	sp,	#1
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x0010
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_shadow_OAM
	add	hl, bc
	ld	a, (hl)
	sub	a, #0xa0
	jr	NC, 00117$
	ld	hl, #_shadow_OAM
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	hl, #_shadow_OAM
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	(de), a
00117$:
;src/director.c:553: for (uint8_t j = 0; j < 4; j++)
	ldhl	sp,	#1
	inc	(hl)
	jr	00116$
00118$:
;src/director.c:558: }
	inc	sp
	inc	sp
	ret
;src/director.c:560: void pan_cloud(void){
;	---------------------------------
; Function pan_cloud
; ---------------------------------
_pan_cloud::
;src/director.c:561: set_win_based_tiles(0, 0, 32, 1, cloud_map, 0);
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1512: _map_tile_offset = base_tile;
	ld	hl, #__map_tile_offset
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1513: set_win_tiles(x, y, w, h, tiles);
	ld	de, #_cloud_map
	push	de
	ld	hl, #0x120
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1514: _map_tile_offset = 0;
	ld	hl, #__map_tile_offset
	ld	(hl), #0x00
;src/director.c:562: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/director.c:563: max_scan = 3;
	ld	hl, #_max_scan
	ld	(hl), #0x03
;src/director.c:564: cloud_cut_scan = 0;
	ld	hl, #_cloud_cut_scan
	ld	(hl), #0x00
;src/director.c:566: remove_VBL(VBL_interrupt);
	ld	de, #_VBL_interrupt
	call	_remove_VBL
;src/director.c:567: remove_LCD(LCD_interrupt);
	ld	de, #_LCD_interrupt
	call	_remove_LCD
;src/director.c:575: }
	di
;src/director.c:570: add_VBL(VBL_interrupt);
	ld	de, #_VBL_interrupt
	call	_add_VBL
;src/director.c:571: add_LCD(LCD_interrupt);
	ld	de, #_LCD_interrupt
	call	_add_LCD
;src/director.c:572: set_interrupts(VBL_IFLAG | LCD_IFLAG);
	ld	a, #0x03
	call	_set_interrupts
;src/director.c:573: STAT_REG |= 0x40; // enable LY == LYC mode 
	ldh	a, (_STAT_REG + 0)
	or	a, #0x40
	ldh	(_STAT_REG + 0), a
	ei
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1656: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/director.c:578: for (i = 0; i < 24; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00114$:
;src/director.c:580: cloud_cut_scan+=6;
	ld	hl, #_cloud_cut_scan
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
;src/director.c:581: max_scan+=6;
	ld	hl, #_max_scan
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
;src/director.c:582: move_win(7, cloud_cut_scan);
	ld	hl, #_cloud_cut_scan
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1656: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, c
	ldh	(_WY_REG + 0), a
;src/director.c:583: pan_up(16);
	ld	a, #0x10
	call	_pan_up
;src/director.c:584: finish_frame(1)
	ld	a, #0x01
	call	_finish_frame_inner
	bit	0,a
	ret	NZ
;src/director.c:578: for (i = 0; i < 24; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x18
	jr	C, 00114$
;src/director.c:586: remove_VBL(VBL_interrupt);
	ld	de, #_VBL_interrupt
	call	_remove_VBL
;src/director.c:587: remove_LCD(LCD_interrupt);
	ld	de, #_LCD_interrupt
	call	_remove_LCD
;src/director.c:589: finish_frame(15)
	ld	a, #0x0f
	call	_finish_frame_inner
	bit	0,a
	ret	NZ
;src/director.c:590: BGP_REG = DMG_PALETTE(DMG_WHITE, DMG_LITE_GRAY, DMG_DARK_GRAY, DMG_BLACK);
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1656: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/director.c:592: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/director.c:593: cloud_cut_scan = 6;
	ld	hl, #_cloud_cut_scan
	ld	(hl), #0x06
;src/director.c:594: for (i = 0; i < 24; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00116$:
;src/director.c:596: move_win(7, cloud_cut_scan);
	ld	hl, #_cloud_cut_scan
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1656: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, c
	ldh	(_WY_REG + 0), a
;src/director.c:597: cloud_cut_scan+=6;
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
;src/director.c:598: pan_up(16);
	ld	a, #0x10
	call	_pan_up
;src/director.c:599: finish_frame(1)
	ld	a, #0x01
	call	_finish_frame_inner
	bit	0,a
	ret	NZ
;src/director.c:594: for (i = 0; i < 24; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x18
	jr	C, 00116$
;src/director.c:601: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/director.c:602: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__frame_counter:
	.db #0x00	; 0
	.area _CABS (ABS)
