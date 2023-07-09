;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module scene
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rand
	.globl _initrand
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _deactivate_weeds_flag
	.globl _clothes_speed
	.globl _clothes_position
	.globl _map_components
	.globl _rect_list
	.globl _game_started_flag
	.globl _old_camera_y_clamped
	.globl _camera_y_clamped
	.globl _old_camera_y
	.globl _camera_y
	.globl _r
	.globl _rand_init
	.globl _possible_clothes
	.globl _all_bots
	.globl _all_tops
	.globl _bulky_tops
	.globl _bulky_bots
	.globl _traversable_tops
	.globl _traversable_bots
	.globl _top_info
	.globl _bot_info
	.globl _scene_init
	.globl _compute_scene_frame
	.globl _move_camera
	.globl _set_camera
	.globl _move_sprites_down
	.globl _animate_weeds
	.globl _gen_new_floor
	.globl _add_clothes_to_rag
	.globl _next_map_gen_step
	.globl _update_walker
	.globl _fill_window
	.globl _mend_incorrect_windows
	.globl _fill_memory
	.globl _memcpy_rect
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
Fscene$joy$0_0$0==.
_joy:
	.ds 1
Fscene$i$0_0$0==.
_i:
	.ds 1
Fscene$floor_info$0_0$0==.
_floor_info:
	.ds 4
G$rand_init$0_0$0==.
_rand_init::
	.ds 1
G$r$0_0$0==.
_r::
	.ds 1
Fscene$window_components_on_current_floor$0_0$0==.
_window_components_on_current_floor:
	.ds 4
G$camera_y$0_0$0==.
_camera_y::
	.ds 1
G$old_camera_y$0_0$0==.
_old_camera_y::
	.ds 1
G$camera_y_clamped$0_0$0==.
_camera_y_clamped::
	.ds 1
G$old_camera_y_clamped$0_0$0==.
_old_camera_y_clamped::
	.ds 1
Fscene$frames_to_move$0_0$0==.
_frames_to_move:
	.ds 1
Fscene$current_cam_frame$0_0$0==.
_current_cam_frame:
	.ds 1
Fscene$accelerate_cam_flag$0_0$0==.
_accelerate_cam_flag:
	.ds 1
G$game_started_flag$0_0$0==.
_game_started_flag::
	.ds 1
G$rect_list$0_0$0==.
_rect_list::
	.ds 160
G$map_components$0_0$0==.
_map_components::
	.ds 32
Fscene$next_assignable_rect_index$0_0$0==.
_next_assignable_rect_index:
	.ds 1
Fscene$walker_byte$0_0$0==.
_walker_byte:
	.ds 1
Fscene$malloc_i$0_0$0==.
_malloc_i:
	.ds 1
Fscene$window_map$0_0$0==.
_window_map:
	.ds 96
G$clothes_position$0_0$0==.
_clothes_position::
	.ds 4
G$clothes_speed$0_0$0==.
_clothes_speed::
	.ds 1
G$deactivate_weeds_flag$0_0$0==.
_deactivate_weeds_flag::
	.ds 1
Fscene$weeds_frame_counter$0_0$0==.
_weeds_frame_counter:
	.ds 1
Fscene$is_generated$0_0$0==.
_is_generated:
	.ds 1
Lscene.memcpy_rect$cur_row$1_0$266==.
_memcpy_rect_cur_row_65536_266:
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
	G$scene_init$0$0	= .
	.globl	G$scene_init$0$0
	C$scene.c$116$0_0$130	= .
	.globl	C$scene.c$116$0_0$130
;src/scene.c:116: void scene_init(void){
;	---------------------------------
; Function scene_init
; ---------------------------------
_scene_init::
	add	sp, #-47
	C$scene.c$118$1_0$130	= .
	.globl	C$scene.c$118$1_0$130
;src/scene.c:118: set_bkg_data(0, 112U, hub_data);
	ld	de, #_hub_data
	push	de
	ld	hl, #0x7000
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$scene.c$119$1_0$130	= .
	.globl	C$scene.c$119$1_0$130
;src/scene.c:119: set_bkg_data(112U, 13, numbers);
	ld	de, #_numbers
	push	de
	ld	hl, #0xd70
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$scene.c$120$1_0$130	= .
	.globl	C$scene.c$120$1_0$130
;src/scene.c:120: set_bkg_data(0x7D, 2, partly_broken_bricks);
	ld	de, #_partly_broken_bricks
	push	de
	ld	hl, #0x27d
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$scene.c$121$1_0$130	= .
	.globl	C$scene.c$121$1_0$130
;src/scene.c:121: set_bkg_tiles(map_pos_x, 20U, 20u, 30u, hub_map);
	ld	de, #_hub_map
	push	de
	ld	hl, #0x1e14
	push	hl
	ld	hl, #0x1401
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	C$scene.c$122$1_0$130	= .
	.globl	C$scene.c$122$1_0$130
;src/scene.c:122: camera_y = 0;
	ld	hl, #_camera_y
	ld	(hl), #0x00
	C$scene.c$123$1_0$130	= .
	.globl	C$scene.c$123$1_0$130
;src/scene.c:123: old_camera_y = 0;
	ld	hl, #_old_camera_y
	ld	(hl), #0x00
	C$scene.c$124$1_0$130	= .
	.globl	C$scene.c$124$1_0$130
;src/scene.c:124: frames_to_move = 40;
	ld	hl, #_frames_to_move
	ld	(hl), #0x28
	C$scene.c$125$1_0$130	= .
	.globl	C$scene.c$125$1_0$130
;src/scene.c:125: current_cam_frame = 0;
	ld	hl, #_current_cam_frame
	ld	(hl), #0x00
	C$scene.c$126$1_0$130	= .
	.globl	C$scene.c$126$1_0$130
;src/scene.c:126: accelerate_cam_flag = 0;
	ld	hl, #_accelerate_cam_flag
	ld	(hl), #0x00
	C$scene.c$127$1_0$130	= .
	.globl	C$scene.c$127$1_0$130
;src/scene.c:127: game_started_flag = false;
	ld	hl, #_game_started_flag
	ld	(hl), #0x00
;C:/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	ld	a, #0x08
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
	C$scene.c$129$1_0$130	= .
	.globl	C$scene.c$129$1_0$130
;src/scene.c:129: is_generated = false;
	ld	hl, #_is_generated
	ld	(hl), #0x00
	C$scene.c$131$2_0$131	= .
	.globl	C$scene.c$131$2_0$131
;src/scene.c:131: rect ground = {0U, 152U, 0xFF, 23U, SOLID};
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	ldhl	sp,	#0
;	spillPairReg hl
;	spillPairReg hl
	ld	c,l
	ld	b,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x98
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0xff
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x17
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x00
	C$scene.c$132$2_0$131	= .
	.globl	C$scene.c$132$2_0$131
;src/scene.c:132: rect dumpster = {103U, 146U, 35U, 32U, TRAVERSABLE};
	ldhl	sp,#5
	ld	(hl), #0x67
	ld	a, l
	ld	d, h
	ldhl	sp,	#27
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	ld	a, #0x92
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	ld	a, #0x23
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	inc	de
	ld	a, #0x20
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x01
	C$scene.c$133$2_0$131	= .
	.globl	C$scene.c$133$2_0$131
;src/scene.c:133: rect vending_machine = {132U, 146U, 32U, 49U, SOLID};
	ldhl	sp,#10
	ld	(hl), #0x84
	ld	a, l
	ld	d, h
	ldhl	sp,	#29
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	ld	a, #0x92
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	ld	a, #0x20
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	inc	de
	ld	a, #0x31
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
	C$scene.c$134$2_0$131	= .
	.globl	C$scene.c$134$2_0$131
;src/scene.c:134: rect ledge = {12U, 88U, 0x98, 19U, INIT_FLAG}; //prev 154
	ldhl	sp,#15
	ld	(hl), #0x0c
	ld	a, l
	ld	d, h
	ldhl	sp,	#31
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	ld	a, #0x58
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	ld	a, #0x98
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	inc	de
	ld	a, #0x13
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x06
	C$scene.c$136$1_1$131	= .
	.globl	C$scene.c$136$1_1$131
;src/scene.c:136: next_assignable_rect_index = 0U;
	ld	hl, #_next_assignable_rect_index
	ld	(hl), #0x00
	C$scene.c$138$1_2$132	= .
	.globl	C$scene.c$138$1_2$132
;src/scene.c:138: empty_window_status.components = 0x00;
	ldhl	sp,	#20
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
	C$scene.c$139$1_2$132	= .
	.globl	C$scene.c$139$1_2$132
;src/scene.c:139: empty_window_status.status = 0x00;
	ldhl	sp,	#20
;	spillPairReg hl
;	spillPairReg hl
	ld	e,l
	ld	d,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x00
	C$scene.c$140$2_2$133	= .
	.globl	C$scene.c$140$2_2$133
;src/scene.c:140: for (i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#33
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl+), a
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl+), a
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl+), a
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00111$:
	C$scene.c$143$3_2$134	= .
	.globl	C$scene.c$143$3_2$134
;src/scene.c:143: collider = top_info[1].collider;
	ldhl	sp,	#22
	ld	a, l
	ld	d, h
	ldhl	sp,	#41
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	ld	hl, #0x0005
	push	hl
	ld	hl, #(_top_info + 13)
	push	hl
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$144$3_2$134	= .
	.globl	C$scene.c$144$3_2$134
;src/scene.c:144: collider.x += (3 + (i<<2)) << 3;
	ldhl	sp,#41
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_i)
;	spillPairReg hl
;	spillPairReg hl
	add	a, a
	add	a, a
	add	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, l
	ldhl	sp,	#41
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
	C$scene.c$145$3_2$134	= .
	.globl	C$scene.c$145$3_2$134
;src/scene.c:145: collider.y += 8;
	ldhl	sp,#41
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#45
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#44
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	add	a, #0x08
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
	C$scene.c$146$3_2$134	= .
	.globl	C$scene.c$146$3_2$134
;src/scene.c:146: rect_list[0][0x07 & (i<<1 | 0x01)] = collider;
	ldhl	sp,	#41
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#45
	ld	(hl+), a
	ld	(hl), e
	ld	a, (#_i)
	add	a, a
	set	0, a
	and	a, #0x07
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_rect_list
	add	hl, de
	ld	e, l
	ld	d, h
	push	bc
	ld	hl, #0x0005
	push	hl
	ldhl	sp,	#49
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$149$3_2$134	= .
	.globl	C$scene.c$149$3_2$134
;src/scene.c:149: collider = bot_info[1].collider;
	ldhl	sp,	#41
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	ld	hl, #0x0005
	push	hl
	ld	hl, #(_bot_info + 13)
	push	hl
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$150$3_2$134	= .
	.globl	C$scene.c$150$3_2$134
;src/scene.c:150: collider.x += (3 + (i<<2)) << 3;
	ldhl	sp,#41
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_i)
;	spillPairReg hl
;	spillPairReg hl
	add	a, a
	add	a, a
	add	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, l
	ldhl	sp,	#41
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
	C$scene.c$151$3_2$134	= .
	.globl	C$scene.c$151$3_2$134
;src/scene.c:151: collider.y += 8;
	ldhl	sp,#43
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	add	a, #0x08
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
	C$scene.c$152$3_2$134	= .
	.globl	C$scene.c$152$3_2$134
;src/scene.c:152: rect_list[0][0x07 & (i<<1)] = collider;
	ldhl	sp,	#41
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#45
	ld	(hl+), a
	ld	(hl), e
	ld	a, (#_i)
	add	a, a
	ld	e, a
	rlca
	ld	a, e
	and	a, #0x07
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_rect_list
	add	hl, de
	ld	e, l
	ld	d, h
	push	bc
	ld	hl, #0x0005
	push	hl
	ldhl	sp,	#49
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$155$3_2$134	= .
	.globl	C$scene.c$155$3_2$134
;src/scene.c:155: map_components[i][0] = empty_window_status;
	ldhl	sp,	#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_i
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_map_components
	add	hl, de
	pop	de
	push	bc
	ld	bc, #0x02
	push	bc
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$156$3_2$134	= .
	.globl	C$scene.c$156$3_2$134
;src/scene.c:156: map_components[i][1] = empty_window_status;
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_i
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_map_components
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	push	bc
	ld	bc, #0x02
	push	bc
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$157$3_2$134	= .
	.globl	C$scene.c$157$3_2$134
;src/scene.c:157: map_components[i][2] = empty_window_status;
	ldhl	sp,	#37
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_i
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_map_components
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	pop	de
	push	bc
	ld	bc, #0x02
	push	bc
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$158$3_2$134	= .
	.globl	C$scene.c$158$3_2$134
;src/scene.c:158: map_components[i][3] = empty_window_status;
	ldhl	sp,	#39
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_i
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_map_components
	add	hl, de
	ld	de, #0x0006
	add	hl, de
	pop	de
	push	bc
	ld	bc, #0x02
	push	bc
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$140$2_2$133	= .
	.globl	C$scene.c$140$2_2$133
;src/scene.c:140: for (i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jp	C, 00111$
	C$scene.c$162$1_2$132	= .
	.globl	C$scene.c$162$1_2$132
;src/scene.c:162: rect_list[1][0x00] = ledge;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 40)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$163$1_2$132	= .
	.globl	C$scene.c$163$1_2$132
;src/scene.c:163: rect_list[1][0x01] = dumpster;
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 45)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$164$1_2$132	= .
	.globl	C$scene.c$164$1_2$132
;src/scene.c:164: rect_list[1][0x02] = vending_machine;
	ldhl	sp,	#29
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 50)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$165$1_2$132	= .
	.globl	C$scene.c$165$1_2$132
;src/scene.c:165: rect_list[1][0x03] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 55)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$166$1_2$132	= .
	.globl	C$scene.c$166$1_2$132
;src/scene.c:166: rect_list[1][0x04] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 60)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$167$1_2$132	= .
	.globl	C$scene.c$167$1_2$132
;src/scene.c:167: rect_list[1][0x05] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 65)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$168$1_2$132	= .
	.globl	C$scene.c$168$1_2$132
;src/scene.c:168: rect_list[1][0x06] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 70)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$169$1_2$132	= .
	.globl	C$scene.c$169$1_2$132
;src/scene.c:169: rect_list[1][0x07] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 75)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$171$1_2$132	= .
	.globl	C$scene.c$171$1_2$132
;src/scene.c:171: rect_list[2][0x00] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 80)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$172$1_2$132	= .
	.globl	C$scene.c$172$1_2$132
;src/scene.c:172: rect_list[2][0x01] = vending_machine;
	ldhl	sp,	#29
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 85)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$173$1_2$132	= .
	.globl	C$scene.c$173$1_2$132
;src/scene.c:173: rect_list[2][0x02] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 90)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$174$1_2$132	= .
	.globl	C$scene.c$174$1_2$132
;src/scene.c:174: rect_list[2][0x03] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 95)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$175$1_2$132	= .
	.globl	C$scene.c$175$1_2$132
;src/scene.c:175: rect_list[2][0x04] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 100)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$176$1_2$132	= .
	.globl	C$scene.c$176$1_2$132
;src/scene.c:176: rect_list[2][0x05] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 105)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$177$1_2$132	= .
	.globl	C$scene.c$177$1_2$132
;src/scene.c:177: rect_list[2][0x06] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 110)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$178$1_2$132	= .
	.globl	C$scene.c$178$1_2$132
;src/scene.c:178: rect_list[2][0x07] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 115)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$180$1_2$132	= .
	.globl	C$scene.c$180$1_2$132
;src/scene.c:180: rect_list[3][0x00] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 120)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$181$1_2$132	= .
	.globl	C$scene.c$181$1_2$132
;src/scene.c:181: rect_list[3][0x01] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 125)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$182$1_2$132	= .
	.globl	C$scene.c$182$1_2$132
;src/scene.c:182: rect_list[3][0x02] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 130)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$183$1_2$132	= .
	.globl	C$scene.c$183$1_2$132
;src/scene.c:183: rect_list[3][0x03] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 135)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$184$1_2$132	= .
	.globl	C$scene.c$184$1_2$132
;src/scene.c:184: rect_list[3][0x04] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 140)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$185$1_2$132	= .
	.globl	C$scene.c$185$1_2$132
;src/scene.c:185: rect_list[3][0x05] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 145)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$186$1_2$132	= .
	.globl	C$scene.c$186$1_2$132
;src/scene.c:186: rect_list[3][0x06] = ground;
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0005
	push	hl
	push	de
	ld	de, #(_rect_list + 150)
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$187$1_2$132	= .
	.globl	C$scene.c$187$1_2$132
;src/scene.c:187: rect_list[3][0x07] = ground;
	ld	de, #0x0005
	push	de
	push	bc
	ld	de, #(_rect_list + 155)
	push	de
	call	___memcpy
	add	sp, #6
	C$scene.c$189$1_2$132	= .
	.globl	C$scene.c$189$1_2$132
;src/scene.c:189: window_components_on_current_floor[0] = 0x11;
	ld	hl, #_window_components_on_current_floor
	ld	(hl), #0x11
	C$scene.c$190$1_2$132	= .
	.globl	C$scene.c$190$1_2$132
;src/scene.c:190: window_components_on_current_floor[1] = 0x11;
	ld	hl, #(_window_components_on_current_floor + 1)
	ld	(hl), #0x11
	C$scene.c$191$1_2$132	= .
	.globl	C$scene.c$191$1_2$132
;src/scene.c:191: window_components_on_current_floor[2] = 0x11;
	ld	hl, #(_window_components_on_current_floor + 2)
	ld	(hl), #0x11
	C$scene.c$192$1_2$132	= .
	.globl	C$scene.c$192$1_2$132
;src/scene.c:192: window_components_on_current_floor[3] = 0x11;
	ld	hl, #(_window_components_on_current_floor + 3)
	ld	(hl), #0x11
	C$scene.c$194$1_2$132	= .
	.globl	C$scene.c$194$1_2$132
;src/scene.c:194: r = 0x00;
	ld	hl, #_r
	ld	(hl), #0x00
	C$scene.c$195$1_2$132	= .
	.globl	C$scene.c$195$1_2$132
;src/scene.c:195: rand_init = false;
	ld	hl, #_rand_init
	ld	(hl), #0x00
	C$scene.c$198$1_2$132	= .
	.globl	C$scene.c$198$1_2$132
;src/scene.c:198: walker_byte = 0x00;
	ld	hl, #_walker_byte
	ld	(hl), #0x00
	C$scene.c$199$1_2$132	= .
	.globl	C$scene.c$199$1_2$132
;src/scene.c:199: malloc_i = 0;
	ld	hl, #_malloc_i
	ld	(hl), #0x00
	C$scene.c$202$1_2$132	= .
	.globl	C$scene.c$202$1_2$132
;src/scene.c:202: set_sprite_data(29, 6, extra_sprites);
	ld	de, #_extra_sprites
	push	de
	ld	hl, #0x61d
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$scene.c$203$1_2$132	= .
	.globl	C$scene.c$203$1_2$132
;src/scene.c:203: clothes_position[0] = 56;
	ld	hl, #_clothes_position
	ld	(hl), #0x38
	C$scene.c$204$1_2$132	= .
	.globl	C$scene.c$204$1_2$132
;src/scene.c:204: clothes_position[1] = 136;
	ld	hl, #(_clothes_position + 1)
	ld	(hl), #0x88
	C$scene.c$205$1_2$132	= .
	.globl	C$scene.c$205$1_2$132
;src/scene.c:205: clothes_position[2] = 136;
	ld	hl, #(_clothes_position + 2)
	ld	(hl), #0x88
	C$scene.c$206$1_2$132	= .
	.globl	C$scene.c$206$1_2$132
;src/scene.c:206: clothes_position[3] = 136;
	ld	bc, #_clothes_position + 3
	ld	a, #0x88
	ld	(bc), a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), #0x1d
;src/scene.c:208: move_sprite(16, 10, clothes_position[0] - camera_y);
	ld	a, (#_clothes_position + 0)
	ld	hl, #_camera_y
	sub	a, (hl)
	ld	e, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 64)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl), e
	inc	hl
	ld	(hl), #0x0a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), #0x1d
;src/scene.c:210: move_sprite(17, 13, clothes_position[1] - camera_y);
	ld	a, (#(_clothes_position + 1) + 0)
	ld	hl, #_camera_y
	sub	a, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 68)
	ld	(hl+), a
	ld	(hl), #0x0d
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 74)
	ld	(hl), #0x1d
;src/scene.c:212: move_sprite(18, 67, clothes_position[2] - camera_y);
	ld	a, (#(_clothes_position + 2) + 0)
	ld	hl, #_camera_y
	sub	a, (hl)
	ld	e, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 72)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), #0x43
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
	ld	(hl), #0x1d
;src/scene.c:214: move_sprite(19, 155, clothes_position[3] - camera_y);
	ld	a, (bc)
	ld	hl, #_camera_y
	sub	a, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 76)
	ld	(hl+), a
	ld	(hl), #0x9b
	C$scene.c$216$1_2$132	= .
	.globl	C$scene.c$216$1_2$132
;src/scene.c:216: weeds_frame_counter = 0;
	ld	hl, #_weeds_frame_counter
	ld	(hl), #0x00
	C$scene.c$217$1_2$132	= .
	.globl	C$scene.c$217$1_2$132
;src/scene.c:217: clothes_speed = 0b11100100;
	ld	hl, #_clothes_speed
	ld	(hl), #0xe4
	C$scene.c$218$1_2$132	= .
	.globl	C$scene.c$218$1_2$132
;src/scene.c:218: deactivate_weeds_flag = 0;
	ld	hl, #_deactivate_weeds_flag
	ld	(hl), #0x00
	C$scene.c$219$1_2$130	= .
	.globl	C$scene.c$219$1_2$130
;src/scene.c:219: }
	add	sp, #47
	C$scene.c$219$1_2$130	= .
	.globl	C$scene.c$219$1_2$130
	XG$scene_init$0$0	= .
	.globl	XG$scene_init$0$0
	ret
G$bot_info$0_0$0 == .
_bot_info:
	.db #0x05	; 5
	.db #0x02	; 2
	.dw _bot_map_00
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.dw _bot_map_01
	.db #0x01	; 1
	.db #0x34	; 52	'4'
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x02	; 2
	.dw _bot_map_02
	.db #0x01	; 1
	.db #0x36	; 54	'6'
	.db #0x1e	; 30
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x03	; 3
	.dw _bot_map_03
	.db #0x01	; 1
	.db #0x36	; 54	'6'
	.db #0x1e	; 30
	.db #0x1b	; 27
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
	.dw _bot_map_04
	.db #0x01	; 1
	.db #0x34	; 52	'4'
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x02	; 2
	.dw _bot_map_05
	.db #0x01	; 1
	.db #0x34	; 52	'4'
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x03	; 3
G$top_info$0_0$0 == .
_top_info:
	.db #0x01	; 1
	.db #0x01	; 1
	.dw _top_map_00
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.dw _top_map_01
	.db #0x01	; 1
	.db #0x17	; 23
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.dw _top_map_02
	.db #0x01	; 1
	.db #0x15	; 21
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.dw _top_map_03
	.db #0xfd	; 253
	.db #0x15	; 21
	.db #0x24	; 36
	.db #0x13	; 19
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.dw _top_map_04
	.db #0x01	; 1
	.db #0x15	; 21
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x04	; 4
G$traversable_bots$0_0$0 == .
_traversable_bots:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x01	; 1
G$traversable_tops$0_0$0 == .
_traversable_tops:
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
G$bulky_bots$0_0$0 == .
_bulky_bots:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
G$bulky_tops$0_0$0 == .
_bulky_tops:
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
G$all_tops$0_0$0 == .
_all_tops:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
G$all_bots$0_0$0 == .
_all_bots:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x02	; 2
G$possible_clothes$0_0$0 == .
_possible_clothes:
	.db #0x1f	; 31
	.db #0x20	; 32
	G$compute_scene_frame$0$0	= .
	.globl	G$compute_scene_frame$0$0
	C$scene.c$221$1_2$163	= .
	.globl	C$scene.c$221$1_2$163
;src/scene.c:221: void compute_scene_frame(void){
;	---------------------------------
; Function compute_scene_frame
; ---------------------------------
_compute_scene_frame::
	C$scene.c$231$1_0$163	= .
	.globl	C$scene.c$231$1_0$163
;src/scene.c:231: if((walker_byte & 0xCF) != 0xCF){
	ld	a, (#_walker_byte)
	and	a, #0xcf
	ld	c, a
	ld	b, #0x00
	ld	a, c
	sub	a, #0xcf
	or	a, b
	jr	Z, 00104$
	C$scene.c$232$2_0$164	= .
	.globl	C$scene.c$232$2_0$164
;src/scene.c:232: if(rand_init)next_map_gen_step();
	ld	hl, #_rand_init
	bit	0, (hl)
	jr	Z, 00104$
	call	_next_map_gen_step
00104$:
	C$scene.c$234$1_0$163	= .
	.globl	C$scene.c$234$1_0$163
;src/scene.c:234: move_camera();
	call	_move_camera
	C$scene.c$236$1_0$163	= .
	.globl	C$scene.c$236$1_0$163
;src/scene.c:236: animate_weeds();
	C$scene.c$237$1_0$163	= .
	.globl	C$scene.c$237$1_0$163
;src/scene.c:237: }
	C$scene.c$237$1_0$163	= .
	.globl	C$scene.c$237$1_0$163
	XG$compute_scene_frame$0$0	= .
	.globl	XG$compute_scene_frame$0$0
	jp	_animate_weeds
	G$move_camera$0$0	= .
	.globl	G$move_camera$0$0
	C$scene.c$239$1_0$166	= .
	.globl	C$scene.c$239$1_0$166
;src/scene.c:239: void move_camera(void){
;	---------------------------------
; Function move_camera
; ---------------------------------
_move_camera::
	C$scene.c$240$1_0$166	= .
	.globl	C$scene.c$240$1_0$166
;src/scene.c:240: if(!game_started_flag) return;
	ld	hl, #_game_started_flag
	bit	0, (hl)
	ret	Z
	C$scene.c$242$1_0$166	= .
	.globl	C$scene.c$242$1_0$166
;src/scene.c:242: current_cam_frame++;
	ld	hl, #_current_cam_frame
	inc	(hl)
	C$scene.c$243$1_0$166	= .
	.globl	C$scene.c$243$1_0$166
;src/scene.c:243: accelerate_cam_flag++;
	ld	hl, #_accelerate_cam_flag
	inc	(hl)
	C$scene.c$245$1_0$166	= .
	.globl	C$scene.c$245$1_0$166
;src/scene.c:245: if(current_cam_frame >= (frames_to_move >> 3)){
	ld	hl, #_frames_to_move
	ld	c, (hl)
	srl	c
	srl	c
	srl	c
	ld	hl, #_current_cam_frame
	ld	a, (hl)
	sub	a, c
	jr	C, 00104$
	C$scene.c$246$2_0$167	= .
	.globl	C$scene.c$246$2_0$167
;src/scene.c:246: current_cam_frame = 0;
	ld	(hl), #0x00
	C$scene.c$247$2_0$167	= .
	.globl	C$scene.c$247$2_0$167
;src/scene.c:247: camera_y--;
	ld	hl, #_camera_y
	dec	(hl)
	C$scene.c$248$2_0$167	= .
	.globl	C$scene.c$248$2_0$167
;src/scene.c:248: set_camera();
	call	_set_camera
00104$:
	C$scene.c$251$1_0$166	= .
	.globl	C$scene.c$251$1_0$166
;src/scene.c:251: move_sprites_down();
	call	_move_sprites_down
	C$scene.c$253$1_0$166	= .
	.globl	C$scene.c$253$1_0$166
;src/scene.c:253: if(accelerate_cam_flag == 0xFF && frames_to_move > 16U){
	ld	a, (#_accelerate_cam_flag)
	inc	a
	ret	NZ
	ld	a, #0x10
	ld	hl, #_frames_to_move
	sub	a, (hl)
	ret	NC
	C$scene.c$254$2_0$168	= .
	.globl	C$scene.c$254$2_0$168
;src/scene.c:254: frames_to_move--;
	dec	(hl)
	C$scene.c$256$1_0$166	= .
	.globl	C$scene.c$256$1_0$166
;src/scene.c:256: }
	C$scene.c$256$1_0$166	= .
	.globl	C$scene.c$256$1_0$166
	XG$move_camera$0$0	= .
	.globl	XG$move_camera$0$0
	ret
	G$set_camera$0$0	= .
	.globl	G$set_camera$0$0
	C$scene.c$258$1_0$170	= .
	.globl	C$scene.c$258$1_0$170
;src/scene.c:258: void set_camera(void){
;	---------------------------------
; Function set_camera
; ---------------------------------
_set_camera::
;src/scene.c:259: move_bkg(8, camera_y);
	ld	hl, #_camera_y
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	ld	a, #0x08
	ldh	(_SCX_REG + 0), a
	ld	a, c
	ldh	(_SCY_REG + 0), a
	C$scene.c$261$1_0$170	= .
	.globl	C$scene.c$261$1_0$170
;src/scene.c:261: camera_y_clamped = (((camera_y-1) >> 3) & 0x1F) >> 3;
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
	ld	hl, #_camera_y_clamped
	ld	(hl), c
	C$scene.c$262$1_0$170	= .
	.globl	C$scene.c$262$1_0$170
;src/scene.c:262: old_camera_y_clamped = (((old_camera_y) >> 3) & 0x1F) >> 3;
	ld	a, (#_old_camera_y)
	swap	a
	rlca
	and	a, #0x1f
	ld	c, a
	ld	b, #0x00
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #_old_camera_y_clamped
	ld	(hl), c
	C$scene.c$263$1_0$170	= .
	.globl	C$scene.c$263$1_0$170
;src/scene.c:263: if(camera_y_clamped != old_camera_y_clamped){
	ld	a, (#_camera_y_clamped)
	ld	hl, #_old_camera_y_clamped
	sub	a, (hl)
	ret	Z
	C$scene.c$264$2_0$171	= .
	.globl	C$scene.c$264$2_0$171
;src/scene.c:264: gen_new_floor();
	call	_gen_new_floor
	C$scene.c$265$2_0$171	= .
	.globl	C$scene.c$265$2_0$171
;src/scene.c:265: old_camera_y = camera_y-1;
	ld	a, (#_camera_y)
	dec	a
	ld	(#_old_camera_y),a
	C$scene.c$267$1_0$170	= .
	.globl	C$scene.c$267$1_0$170
;src/scene.c:267: }
	C$scene.c$267$1_0$170	= .
	.globl	C$scene.c$267$1_0$170
	XG$set_camera$0$0	= .
	.globl	XG$set_camera$0$0
	ret
	G$move_sprites_down$0$0	= .
	.globl	G$move_sprites_down$0$0
	C$scene.c$269$1_0$177	= .
	.globl	C$scene.c$269$1_0$177
;src/scene.c:269: void move_sprites_down(void){
;	---------------------------------
; Function move_sprites_down
; ---------------------------------
_move_sprites_down::
	C$scene.c$271$2_0$177	= .
	.globl	C$scene.c$271$2_0$177
;src/scene.c:271: for(i=0; i<4; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00114$:
	C$scene.c$273$3_0$178	= .
	.globl	C$scene.c$273$3_0$178
;src/scene.c:273: if(((deactivate_weeds_flag >> (i << 1)) & 0x03)){continue;}
	ld	a, (#_i)
	add	a, a
	ld	b, a
	ld	hl, #_deactivate_weeds_flag
	ld	c, (hl)
	inc	b
	jr	00148$
00147$:
	srl	c
00148$:
	dec	b
	jr	NZ, 00147$
	ld	a, c
	and	a, #0x03
	jp	NZ,00110$
;src/scene.c:274: if(get_sprite_tile(16 + i) > 32){
	ld	a, (#_i)
	add	a, #0x10
	ld	c, a
;C:/gbdk/include/gb/gb.h:1458: return shadow_OAM[nb].tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	c, (hl)
	C$scene.c$274$5_0$184	= .
	.globl	C$scene.c$274$5_0$184
;src/scene.c:274: if(get_sprite_tile(16 + i) > 32){
	ld	a, #0x20
	sub	a, c
	jr	NC, 00106$
	C$scene.c$275$4_0$180	= .
	.globl	C$scene.c$275$4_0$180
;src/scene.c:275: clothes_position[0 + i] += ((clothes_speed >> (i<<1)) & 0x03) << 1;
	ld	a, #<(_clothes_position)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_clothes_position)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	e, a
	ld	a, (hl)
	add	a, a
	push	af
	ld	hl, #_clothes_speed
	ld	d, (hl)
	pop	af
	inc	a
	jr	00152$
00151$:
	srl	d
00152$:
	dec	a
	jr	NZ, 00151$
	ld	a, d
	and	a, #0x03
	add	a, a
	add	a, e
	ld	(bc), a
	C$scene.c$276$4_0$180	= .
	.globl	C$scene.c$276$4_0$180
;src/scene.c:276: if((weeds_frame_counter >> 1) & 0x01){
	ld	a, (#_weeds_frame_counter)
	rrca
	and	a,#0x01
	jr	Z, 00106$
	C$scene.c$277$5_0$181	= .
	.globl	C$scene.c$277$5_0$181
;src/scene.c:277: shadow_OAM[16 + i].y = 160; //hide the sprite without modyfying the x coord
	ld	hl, #_i
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x0010
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	(hl), #0xa0
	C$scene.c$278$5_0$181	= .
	.globl	C$scene.c$278$5_0$181
;src/scene.c:278: continue;
	jr	00110$
00106$:
	C$scene.c$282$3_0$178	= .
	.globl	C$scene.c$282$3_0$178
;src/scene.c:282: shadow_OAM[16 + i].y = clothes_position[0 + i] - camera_y;
	ld	bc, #_shadow_OAM+0
	ld	hl, #_i
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #0x0010
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, #<(_clothes_position)
	ld	hl, #_i
	add	a, (hl)
	ld	e, a
	ld	a, #>(_clothes_position)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	hl, #_camera_y
	sub	a, (hl)
	ld	(bc), a
	C$scene.c$283$3_0$178	= .
	.globl	C$scene.c$283$3_0$178
;src/scene.c:283: if((uint8_t)(clothes_position[0 + i] - camera_y) >= 152 && (uint8_t)(clothes_position[0 + i] - camera_y) < 170){
	ld	a, #<(_clothes_position)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_clothes_position)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	hl, #_camera_y
	sub	a, (hl)
	cp	a, #0x98
	jr	C, 00110$
	sub	a, #0xaa
	jr	NC, 00110$
	C$scene.c$284$4_0$182	= .
	.globl	C$scene.c$284$4_0$182
;src/scene.c:284: deactivate_weeds_flag |= 0b00000001 << (i<<1);
	ld	hl, #_i
	ld	c, (hl)
	ld	a, c
	add	a, a
	ld	e, a
	ld	b, e
	ld	a, #0x01
	inc	b
	jr	00154$
00153$:
	add	a, a
00154$:
	dec	b
	jr	NZ,00153$
	ld	hl, #_deactivate_weeds_flag
	or	a, (hl)
	ld	(hl), a
	C$scene.c$285$4_0$182	= .
	.globl	C$scene.c$285$4_0$182
;src/scene.c:285: clothes_speed &= ~(0b00000011 << (i<<1));
	ld	a, #0x03
	inc	e
	jr	00156$
00155$:
	add	a, a
00156$:
	dec	e
	jr	NZ,00155$
	cpl
	ld	hl, #_clothes_speed
	and	a, (hl)
	ld	(hl), a
;src/scene.c:286: hide_sprite(16+i);
	ld	a, c
	add	a, #0x10
	ld	c, a
;C:/gbdk/include/gb/gb.h:1546: shadow_OAM[nb].y = 0;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	(hl), #0x00
	C$scene.c$286$2_0$177	= .
	.globl	C$scene.c$286$2_0$177
;src/scene.c:286: hide_sprite(16+i);
00110$:
	C$scene.c$271$2_0$177	= .
	.globl	C$scene.c$271$2_0$177
;src/scene.c:271: for(i=0; i<4; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jp	C, 00114$
	C$scene.c$289$2_0$177	= .
	.globl	C$scene.c$289$2_0$177
;src/scene.c:289: }
	C$scene.c$289$2_0$177	= .
	.globl	C$scene.c$289$2_0$177
	XG$move_sprites_down$0$0	= .
	.globl	XG$move_sprites_down$0$0
	ret
	G$animate_weeds$0$0	= .
	.globl	G$animate_weeds$0$0
	C$scene.c$291$2_0$190	= .
	.globl	C$scene.c$291$2_0$190
;src/scene.c:291: void animate_weeds(void){
;	---------------------------------
; Function animate_weeds
; ---------------------------------
_animate_weeds::
	C$scene.c$292$1_0$190	= .
	.globl	C$scene.c$292$1_0$190
;src/scene.c:292: weeds_frame_counter++;
	ld	hl, #_weeds_frame_counter
	inc	(hl)
	C$scene.c$293$1_0$190	= .
	.globl	C$scene.c$293$1_0$190
;src/scene.c:293: if(deactivate_weeds_flag != 0x00 || is_generated){
	ld	a, (#_deactivate_weeds_flag)
	or	a, a
	ret	NZ
	ld	hl, #_is_generated
	bit	0, (hl)
	C$scene.c$294$2_0$191	= .
	.globl	C$scene.c$294$2_0$191
;src/scene.c:294: return;
	ret	NZ
	C$scene.c$296$1_0$190	= .
	.globl	C$scene.c$296$1_0$190
;src/scene.c:296: if(weeds_frame_counter >= 15){
	ld	hl, #_weeds_frame_counter
	ld	a, (hl)
	sub	a, #0x0f
	ret	C
	C$scene.c$297$2_0$192	= .
	.globl	C$scene.c$297$2_0$192
;src/scene.c:297: weeds_frame_counter = 0;
	ld	(hl), #0x00
	C$scene.c$299$2_0$192	= .
	.globl	C$scene.c$299$2_0$192
;src/scene.c:299: clothes_speed = ((clothes_speed + 0b00000001) & 0b00000011)
	ld	hl, #_clothes_speed
	ld	b, (hl)
	ld	a, b
	inc	a
	and	a, #0x03
	ld	c, a
	C$scene.c$300$2_0$192	= .
	.globl	C$scene.c$300$2_0$192
;src/scene.c:300: | ((clothes_speed + 0b00000100) & 0b00001100)
	ld	a, b
	inc	a
	inc	a
	inc	a
	inc	a
	and	a, #0x0c
	or	a, c
	ld	c, a
	C$scene.c$301$2_0$192	= .
	.globl	C$scene.c$301$2_0$192
;src/scene.c:301: | ((clothes_speed + 0b00010000) & 0b00110000)
	ld	a, b
	add	a, #0x10
	and	a, #0x30
	or	a, c
	ld	c, a
	C$scene.c$302$2_0$192	= .
	.globl	C$scene.c$302$2_0$192
;src/scene.c:302: | ((clothes_speed + 0b01000000) & 0b11000000);
	ld	a, b
	add	a, #0x40
	and	a, #0xc0
	or	a, c
	ld	(hl), a
;src/scene.c:304: set_sprite_tile(16, 29 + ((clothes_speed >> 7) & 0x01));
	ld	a, (hl)
	rlca
	and	a, #0x01
	add	a, #0x1d
	ld	c, a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), c
;src/scene.c:305: set_sprite_tile(17, 29 + ((clothes_speed >> 5) & 0x01));
	ld	a, (#_clothes_speed)
	rlca
	rlca
	rlca
	and	a, #0x01
	add	a, #0x1d
	ld	c, a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), c
;src/scene.c:306: set_sprite_tile(18, 29 + ((clothes_speed >> 3) & 0x01));
	ld	a, (#_clothes_speed)
	rrca
	rrca
	rrca
	and	a, #0x01
	add	a, #0x1d
	ld	c, a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 74)
	ld	(hl), c
;src/scene.c:307: set_sprite_tile(19, 29 + ((clothes_speed >> 1) & 0x01));
	ld	a, (#_clothes_speed)
	rrca
	and	a, #0x01
	add	a, #0x1d
	ld	c, a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
	ld	(hl), c
	C$scene.c$307$1_0$190	= .
	.globl	C$scene.c$307$1_0$190
;src/scene.c:307: set_sprite_tile(19, 29 + ((clothes_speed >> 1) & 0x01));
	C$scene.c$309$1_0$190	= .
	.globl	C$scene.c$309$1_0$190
;src/scene.c:309: }
	C$scene.c$309$1_0$190	= .
	.globl	C$scene.c$309$1_0$190
	XG$animate_weeds$0$0	= .
	.globl	XG$animate_weeds$0$0
	ret
	G$gen_new_floor$0$0	= .
	.globl	G$gen_new_floor$0$0
	C$scene.c$311$1_0$206	= .
	.globl	C$scene.c$311$1_0$206
;src/scene.c:311: void gen_new_floor(void){
;	---------------------------------
; Function gen_new_floor
; ---------------------------------
_gen_new_floor::
	add	sp, #-19
	C$scene.c$312$1_0$206	= .
	.globl	C$scene.c$312$1_0$206
;src/scene.c:312: if(!rand_init) {
	ld	hl, #_rand_init
	bit	0, (hl)
	jr	NZ, 00103$
	C$scene.c$313$2_0$207	= .
	.globl	C$scene.c$313$2_0$207
;src/scene.c:313: initrand(r);
	ld	hl, #_r
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	call	_initrand
	pop	hl
	C$scene.c$314$2_0$207	= .
	.globl	C$scene.c$314$2_0$207
;src/scene.c:314: rand_init = true;
	ld	hl, #_rand_init
	ld	(hl), #0x01
	C$scene.c$319$1_0$206	= .
	.globl	C$scene.c$319$1_0$206
;src/scene.c:319: while((walker_byte & 0xCF) != 0xCF){
00103$:
	ld	a, (#_walker_byte)
	and	a, #0xcf
	ld	c, a
	ld	b, #0x00
	ld	a, c
	sub	a, #0xcf
	or	a, b
	jr	Z, 00105$
	C$scene.c$321$2_0$208	= .
	.globl	C$scene.c$321$2_0$208
;src/scene.c:321: next_map_gen_step();
	call	_next_map_gen_step
	jr	00103$
00105$:
	C$scene.c$324$1_0$206	= .
	.globl	C$scene.c$324$1_0$206
;src/scene.c:324: walker_byte &= 0x30;
	ld	hl, #_walker_byte
	ld	a, (hl)
	and	a, #0x30
	ld	(hl), a
	C$scene.c$325$1_0$206	= .
	.globl	C$scene.c$325$1_0$206
;src/scene.c:325: malloc_i = 0;
	ld	hl, #_malloc_i
	ld	(hl), #0x00
	C$scene.c$327$1_0$206	= .
	.globl	C$scene.c$327$1_0$206
;src/scene.c:327: if(!is_generated){
	ld	hl, #_is_generated
	bit	0, (hl)
	jr	NZ, 00109$
	C$scene.c$328$2_0$209	= .
	.globl	C$scene.c$328$2_0$209
;src/scene.c:328: set_bkg_tiles(map_pos_x, camera_y_clamped << 3, 20, base_floor_map_height, floor_map);
	ld	bc, #_base_floor_map+0
	ld	hl, #_camera_y_clamped
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	push	bc
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
	C$scene.c$329$2_0$209	= .
	.globl	C$scene.c$329$2_0$209
;src/scene.c:329: if(camera_y_clamped == 0) is_generated = true;    
	ld	a, (#_camera_y_clamped)
	or	a, a
	jr	NZ, 00109$
	ld	hl, #_is_generated
	ld	(hl), #0x01
00109$:
	C$scene.c$332$1_1$210	= .
	.globl	C$scene.c$332$1_1$210
;src/scene.c:332: uint8_t y_draw = (camera_y_clamped << 3);
	ld	a, (#_camera_y_clamped)
	add	a, a
	add	a, a
	add	a, a
	C$scene.c$334$1_1$210	= .
	.globl	C$scene.c$334$1_1$210
;src/scene.c:334: set_bkg_tiles(3, y_draw + 1, 16, 6, window_map);
	inc	a
	ldhl	sp,	#7
	ld	(hl), a
	ld	de, #_window_map
	push	de
	ld	de, #0x610
	push	de
	ld	h, (hl)
	ld	l, #0x03
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	C$scene.c$338$2_2$212	= .
	.globl	C$scene.c$338$2_2$212
;src/scene.c:338: for ( i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#5
	ld	a, l
	ld	d, h
	ldhl	sp,	#8
	ld	(hl+), a
	ld	(hl), d
00113$:
	C$scene.c$342$3_2$213	= .
	.globl	C$scene.c$342$3_2$213
;src/scene.c:342: collider = top_info[(UINT8)(window_components_on_current_floor[i] >> 4)].collider;
	ld	a, #<(_window_components_on_current_floor)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_window_components_on_current_floor)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	swap	a
	and	a, #0x0f
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_top_info
	add	hl, de
	ld	bc, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	bc, #0x05
	push	bc
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$343$3_2$213	= .
	.globl	C$scene.c$343$3_2$213
;src/scene.c:343: collider.x += (3 + (i<<2)) << 3;
	ld	a, (bc)
	ld	e, a
	ld	a, (#_i)
	add	a, a
	add	a, a
	add	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	ld	(bc), a
	C$scene.c$344$3_2$213	= .
	.globl	C$scene.c$344$3_2$213
;src/scene.c:344: collider.y += (1 + y_draw) << 3;
	ld	l, c
	ld	h, b
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	ldhl	sp,	#9
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#14
	ld	(hl), a
	pop	af
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
	C$scene.c$345$3_2$213	= .
	.globl	C$scene.c$345$3_2$213
;src/scene.c:345: rect_list[camera_y_clamped][0x07 & (i<<1 | 0x01)] = collider;
	ld	a, c
	ld	e, b
	ldhl	sp,	#13
	ld	(hl+), a
	ld	(hl), e
	ld	hl, #_camera_y_clamped
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#19
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#18
	ld	(hl), a
	ld	de, #_rect_list
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
	ld	a, (#_i)
	add	a, a
	set	0, a
	and	a, #0x07
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#19
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#18
	ld	(hl), a
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	push	bc
	ld	hl, #0x0005
	push	hl
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$348$3_2$213	= .
	.globl	C$scene.c$348$3_2$213
;src/scene.c:348: collider = bot_info[window_components_on_current_floor[i] & 0x0F].collider;
	ld	a, #<(_window_components_on_current_floor)
	ld	hl, #_i
	add	a, (hl)
	ld	e, a
	ld	a, #>(_window_components_on_current_floor)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	and	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_bot_info
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, c
	ld	d, b
	push	bc
	ld	bc, #0x05
	push	bc
	push	hl
	push	de
	call	___memcpy
	add	sp, #6
	pop	bc
	C$scene.c$349$3_2$213	= .
	.globl	C$scene.c$349$3_2$213
;src/scene.c:349: collider.x += (3 + (i<<2)) << 3;
	ld	a, (bc)
	ld	e, a
	ld	a, (#_i)
	add	a, a
	add	a, a
	add	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	ld	(bc), a
	C$scene.c$350$3_2$213	= .
	.globl	C$scene.c$350$3_2$213
;src/scene.c:350: collider.y += (1 + y_draw) << 3;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
	C$scene.c$351$3_2$213	= .
	.globl	C$scene.c$351$3_2$213
;src/scene.c:351: rect_list[camera_y_clamped][0x07 & (i<<1)] = collider;
	ldhl	sp,	#17
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ld	hl, #_camera_y_clamped
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#_rect_list
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (#_i)
	add	a, a
	push	af
	rlca
	pop	af
	and	a, #0x07
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	de, #0x0005
	push	de
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	push	bc
	call	___memcpy
	add	sp, #6
	C$scene.c$355$3_2$213	= .
	.globl	C$scene.c$355$3_2$213
;src/scene.c:355: temp_window.components = window_components_on_current_floor[i];
	ldhl	sp,	#5
	ld	c, l
	ld	b, h
	ld	a, #<(_window_components_on_current_floor)
	ld	hl, #_i
	add	a, (hl)
	ld	e, a
	ld	a, #>(_window_components_on_current_floor)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	(bc), a
	C$scene.c$356$3_2$213	= .
	.globl	C$scene.c$356$3_2$213
;src/scene.c:356: temp_window.status = 0x00;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	xor	a, a
	ld	(bc), a
	C$scene.c$359$3_2$213	= .
	.globl	C$scene.c$359$3_2$213
;src/scene.c:359: if((window_components_on_current_floor[i] & 0x0F) == 0x05){
	ld	a, #<(_window_components_on_current_floor)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_window_components_on_current_floor)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	and	a, #0x0f
	ld	c, a
	ld	b, #0x00
	ld	a, c
	sub	a, #0x05
	or	a, b
	jr	NZ, 00111$
	C$scene.c$360$4_2$214	= .
	.globl	C$scene.c$360$4_2$214
;src/scene.c:360: add_clothes_to_rag(&temp_window);
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	call	_add_clothes_to_rag
	pop	hl
00111$:
	C$scene.c$362$3_2$213	= .
	.globl	C$scene.c$362$3_2$213
;src/scene.c:362: map_components[camera_y_clamped][i] = temp_window;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_camera_y_clamped
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_map_components)
	ld	e, a
	ld	a, h
	adc	a, #>(_map_components)
	ld	d, a
	ld	a, (#_i)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	de, #0x0002
	push	de
	push	bc
	push	hl
	call	___memcpy
	add	sp, #6
	C$scene.c$338$2_2$212	= .
	.globl	C$scene.c$338$2_2$212
;src/scene.c:338: for ( i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jp	C, 00113$
	C$scene.c$364$2_2$206	= .
	.globl	C$scene.c$364$2_2$206
;src/scene.c:364: }
	add	sp, #19
	C$scene.c$364$2_2$206	= .
	.globl	C$scene.c$364$2_2$206
	XG$gen_new_floor$0$0	= .
	.globl	XG$gen_new_floor$0$0
	ret
	G$add_clothes_to_rag$0$0	= .
	.globl	G$add_clothes_to_rag$0$0
	C$scene.c$366$2_2$216	= .
	.globl	C$scene.c$366$2_2$216
;src/scene.c:366: void add_clothes_to_rag(window_status* temp_window){
;	---------------------------------
; Function add_clothes_to_rag
; ---------------------------------
_add_clothes_to_rag::
	add	sp, #-5
	C$scene.c$367$1_0$216	= .
	.globl	C$scene.c$367$1_0$216
;src/scene.c:367: uint8_t temp_rand = rand();
	call	_rand
	ldhl	sp,	#0
	ld	(hl), e
	C$scene.c$368$1_0$216	= .
	.globl	C$scene.c$368$1_0$216
;src/scene.c:368: uint8_t particle_x = ((3 + (i<<2)) << 3) + 8u;
	ld	a, (#_i)
	add	a, a
	add	a, a
	add	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x08
	ldhl	sp,	#1
	ld	(hl), a
	C$scene.c$369$1_0$216	= .
	.globl	C$scene.c$369$1_0$216
;src/scene.c:369: uint8_t particle_y = (((camera_y_clamped << 3) + 5) << 3) + 17u;
	ld	a, (#_camera_y_clamped)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x05
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x11
	ldhl	sp,	#2
	C$scene.c$371$1_0$216	= .
	.globl	C$scene.c$371$1_0$216
;src/scene.c:371: uint8_t rack_status = 0x00;
	C$scene.c$372$1_0$216	= .
	.globl	C$scene.c$372$1_0$216
;src/scene.c:372: if((temp_rand >> 1) & 0x01){
	ld	(hl-), a
	dec	hl
	ld	e, #0x00
	ld	a, (hl)
	rrca
	and	a,#0x01
	jp	Z, 00105$
	C$scene.c$374$3_0$218	= .
	.globl	C$scene.c$374$3_0$218
;src/scene.c:374: for(object_sprite = 0; object_sprite < 4; object_sprite++){
	ldhl	sp,	#3
	ld	(hl), #0x00
	ld	c, #0x00
00117$:
	C$scene.c$375$4_0$219	= .
	.globl	C$scene.c$375$4_0$219
;src/scene.c:375: if((deactivate_weeds_flag >> (object_sprite << 1)) & 0x03){
	ld	a, c
	add	a, a
	push	af
	ld	hl, #_deactivate_weeds_flag
	ld	b, (hl)
	pop	af
	inc	a
	jr	00159$
00158$:
	srl	b
00159$:
	dec	a
	jr	NZ, 00158$
	ld	a, b
	and	a, #0x03
	jr	Z, 00118$
	C$scene.c$377$5_0$220	= .
	.globl	C$scene.c$377$5_0$220
;src/scene.c:377: deactivate_weeds_flag ^= 0b00000001 << (object_sprite << 1);
	ldhl	sp,	#3
	ld	e, (hl)
	ld	a, e
	add	a, a
	ld	b, a
	ld	a, #0x01
	inc	b
	jr	00162$
00161$:
	add	a, a
00162$:
	dec	b
	jr	NZ,00161$
	ld	hl, #_deactivate_weeds_flag
	xor	a, (hl)
	ld	(hl), a
;src/scene.c:378: set_sprite_tile(16 + object_sprite, possible_clothes[(temp_rand & 0x01)]);
	ldhl	sp,	#0
	ld	a, (hl)
	and	a, #0x01
	ld	c, a
	ld	b, #0x00
	ld	hl, #_possible_clothes
	add	hl, bc
	ld	c, (hl)
	ld	a, e
	add	a, #0x10
	ldhl	sp,	#4
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
	C$scene.c$379$5_0$220	= .
	.globl	C$scene.c$379$5_0$220
;src/scene.c:379: clothes_position[object_sprite] = particle_y;
	ld	bc, #_clothes_position+0
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
;src/scene.c:380: move_sprite(16 + object_sprite, particle_x, particle_y - camera_y);
	ld	a, (hl)
	ld	hl, #_camera_y
	sub	a, (hl)
	ld	c, a
	ldhl	sp,	#4
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(bc), a
	C$scene.c$381$5_0$220	= .
	.globl	C$scene.c$381$5_0$220
;src/scene.c:381: clothes_speed &= ~(0b00000011 << (i<<1));
	ld	a, (#_i)
	add	a, a
	ld	b, a
	ld	a, #0x03
	inc	b
	jr	00164$
00163$:
	add	a, a
00164$:
	dec	b
	jr	NZ,00163$
	cpl
	ld	hl, #_clothes_speed
	and	a, (hl)
	ld	(hl), a
	C$scene.c$384$5_0$220	= .
	.globl	C$scene.c$384$5_0$220
;src/scene.c:384: rack_status |= object_sprite;
	ldhl	sp,	#3
	ld	e, (hl)
	set	3, e
	C$scene.c$385$5_0$220	= .
	.globl	C$scene.c$385$5_0$220
;src/scene.c:385: break;
	jr	00105$
00118$:
	C$scene.c$374$3_0$218	= .
	.globl	C$scene.c$374$3_0$218
;src/scene.c:374: for(object_sprite = 0; object_sprite < 4; object_sprite++){
	inc	c
	ldhl	sp,	#3
	ld	(hl), c
	ld	a, c
	sub	a, #0x04
	jp	C, 00117$
00105$:
	C$scene.c$390$1_0$216	= .
	.globl	C$scene.c$390$1_0$216
;src/scene.c:390: particle_x += 8;
	ldhl	sp,	#1
	ld	a, (hl+)
	inc	hl
	add	a, #0x08
	ld	(hl), a
	C$scene.c$391$1_0$216	= .
	.globl	C$scene.c$391$1_0$216
;src/scene.c:391: if((temp_rand >> 3) & 0x01){
	ldhl	sp,	#0
	ld	a, (hl)
	rrca
	rrca
	rrca
	and	a,#0x01
	jp	Z, 00112$
	C$scene.c$393$3_0$222	= .
	.globl	C$scene.c$393$3_0$222
;src/scene.c:393: for(object_sprite = 0; object_sprite < 4; object_sprite++){
	ldhl	sp,	#4
	ld	(hl), #0x00
	ld	c, #0x00
00119$:
	C$scene.c$394$4_0$223	= .
	.globl	C$scene.c$394$4_0$223
;src/scene.c:394: if((deactivate_weeds_flag >> (object_sprite << 1)) & 0x03){
	ld	a, c
	add	a, a
	ld	d, a
	ld	hl, #_deactivate_weeds_flag
	ld	b, (hl)
	inc	d
	jr	00166$
00165$:
	srl	b
00166$:
	dec	d
	jr	NZ, 00165$
	ld	a, b
	and	a, #0x03
	jp	Z,00120$
	C$scene.c$396$5_0$224	= .
	.globl	C$scene.c$396$5_0$224
;src/scene.c:396: deactivate_weeds_flag ^= 0b00000001 << (object_sprite << 1);
	ldhl	sp,	#4
	ld	d, (hl)
	ld	a, d
	add	a, a
	ld	b, a
	ld	a, #0x01
	inc	b
	jr	00169$
00168$:
	add	a, a
00169$:
	dec	b
	jr	NZ,00168$
	ld	hl, #_deactivate_weeds_flag
	xor	a, (hl)
	ld	(hl), a
;src/scene.c:397: set_sprite_tile(16 + object_sprite, possible_clothes[((temp_rand>>2) & 0x01)]);
	ldhl	sp,	#0
	ld	a, (hl)
	rrca
	rrca
	and	a, #0x01
	ld	c, a
	ld	hl, #_possible_clothes
	ld	b, #0x00
	add	hl, bc
	ld	c, (hl)
	ld	a, d
	add	a, #0x10
	ldhl	sp,	#1
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), c
	C$scene.c$398$5_0$224	= .
	.globl	C$scene.c$398$5_0$224
;src/scene.c:398: clothes_position[object_sprite] = particle_y;
	ld	bc, #_clothes_position+0
	ldhl	sp,	#4
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
;src/scene.c:399: move_sprite(16 + object_sprite, particle_x, particle_y - camera_y);
	ld	a, (hl)
	ld	hl, #_camera_y
	sub	a, (hl)
	ld	d, a
	ldhl	sp,	#1
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
	C$scene.c$400$5_0$224	= .
	.globl	C$scene.c$400$5_0$224
;src/scene.c:400: clothes_speed &= ~(0b00000011 << (i<<1));
	ld	a, (#_i)
	add	a, a
	ld	b, a
	ld	a, #0x03
	inc	b
	jr	00171$
00170$:
	add	a, a
00171$:
	dec	b
	jr	NZ,00170$
	cpl
	ld	hl, #_clothes_speed
	and	a, (hl)
	ld	(hl), a
	C$scene.c$402$5_0$224	= .
	.globl	C$scene.c$402$5_0$224
;src/scene.c:402: rack_status |= 0b00000100;
	set	2, e
	C$scene.c$403$5_0$224	= .
	.globl	C$scene.c$403$5_0$224
;src/scene.c:403: if((rack_status & 0b00001000) == 0x00){
	bit	3, e
	jr	NZ, 00112$
	C$scene.c$404$6_0$225	= .
	.globl	C$scene.c$404$6_0$225
;src/scene.c:404: rack_status |= object_sprite;
	ld	a, e
	ldhl	sp,	#4
	or	a, (hl)
	ld	e, a
	C$scene.c$406$5_0$224	= .
	.globl	C$scene.c$406$5_0$224
;src/scene.c:406: break;
	jr	00112$
00120$:
	C$scene.c$393$3_0$222	= .
	.globl	C$scene.c$393$3_0$222
;src/scene.c:393: for(object_sprite = 0; object_sprite < 4; object_sprite++){
	inc	c
	ldhl	sp,	#4
	ld	(hl), c
	ld	a, c
	sub	a, #0x04
	jp	C, 00119$
00112$:
	C$scene.c$419$1_0$216	= .
	.globl	C$scene.c$419$1_0$216
;src/scene.c:419: temp_window->status = (temp_window->status & 0xF0) | rack_status; 
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	a, (bc)
	and	a, #0xf0
	or	a, e
	ld	(bc), a
	C$scene.c$420$1_0$216	= .
	.globl	C$scene.c$420$1_0$216
;src/scene.c:420: }
	add	sp, #5
	C$scene.c$420$1_0$216	= .
	.globl	C$scene.c$420$1_0$216
	XG$add_clothes_to_rag$0$0	= .
	.globl	XG$add_clothes_to_rag$0$0
	ret
	G$next_map_gen_step$0$0	= .
	.globl	G$next_map_gen_step$0$0
	C$scene.c$422$1_0$239	= .
	.globl	C$scene.c$422$1_0$239
;src/scene.c:422: void next_map_gen_step(void){
;	---------------------------------
; Function next_map_gen_step
; ---------------------------------
_next_map_gen_step::
	C$scene.c$429$1_0$239	= .
	.globl	C$scene.c$429$1_0$239
;src/scene.c:429: if((walker_byte & 0x40) != 0x40){
	ld	hl, #_walker_byte
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	and	a, #0x40
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, #0x40
	or	a, d
	C$scene.c$431$2_0$240	= .
	.globl	C$scene.c$431$2_0$240
;src/scene.c:431: update_walker();
	jp	NZ,_update_walker
	C$scene.c$432$1_0$239	= .
	.globl	C$scene.c$432$1_0$239
;src/scene.c:432: } else if((walker_byte & 0x4F) != 0x4F){
	ld	a, c
	and	a, #0x4f
	ld	c, a
	ld	b, #0x00
	ld	a, c
	sub	a, #0x4f
	or	a, b
	C$scene.c$434$2_0$241	= .
	.globl	C$scene.c$434$2_0$241
;src/scene.c:434: fill_window();
	jp	NZ,_fill_window
	C$scene.c$437$2_0$242	= .
	.globl	C$scene.c$437$2_0$242
;src/scene.c:437: mend_incorrect_windows();
	call	_mend_incorrect_windows
	C$scene.c$439$2_0$242	= .
	.globl	C$scene.c$439$2_0$242
;src/scene.c:439: fill_memory();
	C$scene.c$441$1_0$239	= .
	.globl	C$scene.c$441$1_0$239
;src/scene.c:441: }
	C$scene.c$441$1_0$239	= .
	.globl	C$scene.c$441$1_0$239
	XG$next_map_gen_step$0$0	= .
	.globl	XG$next_map_gen_step$0$0
	jp	_fill_memory
	G$update_walker$0$0	= .
	.globl	G$update_walker$0$0
	C$scene.c$443$1_0$244	= .
	.globl	C$scene.c$443$1_0$244
;src/scene.c:443: void update_walker(void){
;	---------------------------------
; Function update_walker
; ---------------------------------
_update_walker::
	add	sp, #-4
	C$scene.c$445$1_0$244	= .
	.globl	C$scene.c$445$1_0$244
;src/scene.c:445: if(!(walker_byte & 0x0F)){
	ld	a, (#_walker_byte)
	and	a, #0x0f
	jr	NZ, 00118$
	C$scene.c$446$2_0$245	= .
	.globl	C$scene.c$446$2_0$245
;src/scene.c:446: walker_byte |= (0x01 << (CURRENT_WINDOW & 0x03));
	ld	hl, #_walker_byte
	ld	a, (hl)
	swap	a
	and	a, #0x3
	ld	b, a
	ld	a, #0x01
	inc	b
	jr	00160$
00159$:
	add	a, a
00160$:
	dec	b
	jr	NZ,00159$
	or	a, (hl)
	C$scene.c$447$2_0$245	= .
	.globl	C$scene.c$447$2_0$245
;src/scene.c:447: window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (traversable_bots[rand() & 0x03]) | ((bulky_tops[rand() & 0x03]) << 4);
	ld	(hl), a
	swap	a
	and	a, #0x3
	ld	c, a
	ld	b, #0x00
	ld	hl, #_window_components_on_current_floor
	add	hl, bc
	push	hl
	call	_rand
	ld	a, e
	pop	bc
	and	a, #0x03
	ld	e, a
	ld	d, #0x00
	ld	hl, #_traversable_bots
	add	hl, de
	ld	e, (hl)
	push	bc
	push	de
	call	_rand
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	pop	de
	pop	bc
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	and	a, #0x03
	ld	d, #0x00
	add	a, #<(_bulky_tops)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	adc	a, #>(_bulky_tops)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	or	a, e
	ld	(bc), a
	jp	00120$
00118$:
	C$scene.c$451$1_0$244	= .
	.globl	C$scene.c$451$1_0$244
;src/scene.c:451: else if(((CURRENT_WINDOW & 0x01) && ((VISITED_WINDOWS & 0x05) == 0x05)) || (!(CURRENT_WINDOW & 0x01) && ((VISITED_WINDOWS & 0x0A) == 0x0A))){
	ld	hl, #_walker_byte
	ld	a, (hl)
	swap	a
	and	a, #0x01
	ld	e, a
	ld	c, (hl)
	ld	a, e
	or	a, a
	jr	Z, 00116$
	ld	a, c
	and	a, #0x05
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	sub	a, #0x05
	or	a, l
	jr	Z, 00111$
00116$:
	ld	a, e
	or	a, a
	jr	NZ, 00112$
	ld	a, c
	and	a, #0x0a
	ld	c, a
	ld	b, #0x00
	ld	a, c
	sub	a, #0x0a
	or	a, b
	jr	NZ, 00112$
00111$:
	C$scene.c$452$2_0$246	= .
	.globl	C$scene.c$452$2_0$246
;src/scene.c:452: walker_byte |= 0x40;
	ld	hl, #_walker_byte
	ld	a, (hl)
	or	a, #0x40
	C$scene.c$453$2_0$246	= .
	.globl	C$scene.c$453$2_0$246
;src/scene.c:453: window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (window_components_on_current_floor[CURRENT_WINDOW & 0x03] & 0x0F) | (uint8_t)((traversable_tops[(rand() & 0x03)]) << 4);   
	ld	(hl), a
	swap	a
	and	a, #0x3
	ld	c, a
	ld	b, #0x00
	ld	hl, #_window_components_on_current_floor
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	and	a, #0x0f
	ldhl	sp,	#3
	ld	(hl), a
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	and	a, #0x03
	ld	e, a
	ld	d, #0x00
	ld	hl, #_traversable_tops
	add	hl, de
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	ldhl	sp,	#3
	or	a, (hl)
	ld	(bc), a
	jp	00120$
00112$:
	C$scene.c$457$1_0$244	= .
	.globl	C$scene.c$457$1_0$244
;src/scene.c:457: else if(TURNING_PROB < (UBYTE)rand()){
	call	_rand
	ld	a, #0xaf
	sub	a, e
	jr	NC, 00109$
	C$scene.c$459$2_0$247	= .
	.globl	C$scene.c$459$2_0$247
;src/scene.c:459: walker_byte |= 0x40;
	ld	hl, #_walker_byte
	ld	a, (hl)
	or	a, #0x40
	C$scene.c$460$2_0$247	= .
	.globl	C$scene.c$460$2_0$247
;src/scene.c:460: window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (window_components_on_current_floor[CURRENT_WINDOW & 0x03] & 0x0F) | (uint8_t)((traversable_tops[(rand() & 0x03)]) << 4);
	ld	(hl), a
	swap	a
	and	a, #0x3
	ld	c, a
	ld	b, #0x00
	ld	hl, #_window_components_on_current_floor
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	and	a, #0x0f
	ldhl	sp,	#3
	ld	(hl), a
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	and	a, #0x03
	ld	e, a
	ld	d, #0x00
	ld	hl, #_traversable_tops
	add	hl, de
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	ldhl	sp,	#3
	or	a, (hl)
	ld	(bc), a
	jp	00120$
00109$:
	C$scene.c$464$2_0$248	= .
	.globl	C$scene.c$464$2_0$248
;src/scene.c:464: if((rand() & 0x01) && !((VISITED_WINDOWS >> ((CURRENT_WINDOW + 1) & 0x03)) & 0x01)) { //if we want to go right and right is empty
	call	_rand
	C$scene.c$445$1_0$244	= .
	.globl	C$scene.c$445$1_0$244
;src/scene.c:445: if(!(walker_byte & 0x0F)){
	C$scene.c$446$1_0$244	= .
	.globl	C$scene.c$446$1_0$244
;src/scene.c:446: walker_byte |= (0x01 << (CURRENT_WINDOW & 0x03));
	ld	a, (#_walker_byte)
	ld	c,a
	swap	a
	and	a, #0x0f
	ldhl	sp,	#0
	ld	(hl), a
	C$scene.c$469$1_0$244	= .
	.globl	C$scene.c$469$1_0$244
;src/scene.c:469: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW - 1) & 0x03) << 4);
	ld	a, (hl+)
	C$scene.c$466$1_0$244	= .
	.globl	C$scene.c$466$1_0$244
;src/scene.c:466: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
	ld	(hl+), a
	ld	a, c
	and	a, #0xcf
	ld	(hl-), a
	ld	a, (hl+)
	inc	a
	swap	a
	and	a, #0x30
	or	a, (hl)
	inc	hl
	ld	(hl), a
	C$scene.c$464$2_0$248	= .
	.globl	C$scene.c$464$2_0$248
;src/scene.c:464: if((rand() & 0x01) && !((VISITED_WINDOWS >> ((CURRENT_WINDOW + 1) & 0x03)) & 0x01)) { //if we want to go right and right is empty
	bit	0, e
	jr	Z, 00105$
	ldhl	sp,	#0
	ld	a, (hl)
	inc	a
	and	a, #0x03
	ld	c, a
	ld	hl, #_walker_byte
	ld	b, (hl)
	inc	c
	jr	00166$
00165$:
	srl	b
00166$:
	dec	c
	jr	NZ, 00165$
	bit	0, b
	jr	NZ, 00105$
	C$scene.c$466$3_0$249	= .
	.globl	C$scene.c$466$3_0$249
;src/scene.c:466: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_walker_byte),a
	jr	00106$
00105$:
	C$scene.c$467$2_0$248	= .
	.globl	C$scene.c$467$2_0$248
;src/scene.c:467: } else if (!((VISITED_WINDOWS >> ((CURRENT_WINDOW - 1) & 0x03)) & 0x01)){ //if left is empty
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	and	a, #0x03
	ld	c, a
	ld	hl, #_walker_byte
	ld	b, (hl)
	inc	c
	jr	00170$
00169$:
	srl	b
00170$:
	dec	c
	jr	NZ, 00169$
	bit	0, b
	jr	NZ, 00102$
	C$scene.c$469$3_0$250	= .
	.globl	C$scene.c$469$3_0$250
;src/scene.c:469: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW - 1) & 0x03) << 4);
	ldhl	sp,	#1
	ld	a, (hl+)
	inc	hl
	dec	a
	and	a, #0x03
	ld	(hl), a
	swap	a
	and	a, #0xf0
	ld	(hl-), a
	ld	a, (hl+)
	or	a, (hl)
	ld	(#_walker_byte),a
	jr	00106$
00102$:
	C$scene.c$472$3_0$251	= .
	.globl	C$scene.c$472$3_0$251
;src/scene.c:472: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_walker_byte),a
00106$:
	C$scene.c$474$2_0$248	= .
	.globl	C$scene.c$474$2_0$248
;src/scene.c:474: walker_byte |= (0x01 << CURRENT_WINDOW);
	ld	hl, #_walker_byte
	ld	a, (hl)
	swap	a
	and	a, #0x0f
	ld	b, a
	ld	a, #0x01
	inc	b
	jr	00174$
00173$:
	add	a, a
00174$:
	dec	b
	jr	NZ,00173$
	or	a, (hl)
	C$scene.c$475$2_0$248	= .
	.globl	C$scene.c$475$2_0$248
;src/scene.c:475: window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (bulky_bots[rand() & 0x03]) | ((bulky_tops[rand() & 0x03]) << 4);
	ld	(hl), a
	swap	a
	and	a, #0x3
	ld	c, #0x00
	add	a, #<(_window_components_on_current_floor)
	ld	e, a
	ld	a, c
	adc	a, #>(_window_components_on_current_floor)
	ld	d, a
	push	de
	call	_rand
	ld	a, e
	pop	de
	and	a, #0x03
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	bc, #_bulky_bots
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	push	de
	call	_rand
	ld	a, e
	pop	de
	and	a, #0x03
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	bc, #_bulky_tops
	add	hl, bc
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	ldhl	sp,	#3
	or	a, (hl)
	ld	(de), a
00120$:
	C$scene.c$477$1_0$244	= .
	.globl	C$scene.c$477$1_0$244
;src/scene.c:477: }
	add	sp, #4
	C$scene.c$477$1_0$244	= .
	.globl	C$scene.c$477$1_0$244
	XG$update_walker$0$0	= .
	.globl	XG$update_walker$0$0
	ret
	G$fill_window$0$0	= .
	.globl	G$fill_window$0$0
	C$scene.c$479$1_0$254	= .
	.globl	C$scene.c$479$1_0$254
;src/scene.c:479: void fill_window(void){
;	---------------------------------
; Function fill_window
; ---------------------------------
_fill_window::
	dec	sp
	C$scene.c$481$2_0$254	= .
	.globl	C$scene.c$481$2_0$254
;src/scene.c:481: for ( i = 0; i < 4; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00105$:
	C$scene.c$482$3_0$255	= .
	.globl	C$scene.c$482$3_0$255
;src/scene.c:482: if((VISITED_WINDOWS >> i) & 0x01) {
	ld	a, (#_i)
	push	af
	ld	hl, #_walker_byte
	ld	c, (hl)
	pop	af
	inc	a
	jr	00119$
00118$:
	srl	c
00119$:
	dec	a
	jr	NZ, 00118$
	bit	0, c
	jr	NZ, 00103$
	C$scene.c$485$3_0$255	= .
	.globl	C$scene.c$485$3_0$255
;src/scene.c:485: window_components_on_current_floor[i] = (all_bots[rand() & 0x07]) | ((all_tops[rand() & 0x07]) << 4);
	ld	bc, #_window_components_on_current_floor+0
	ld	a, c
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	jr	NC, 00122$
	inc	b
00122$:
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	and	a, #0x07
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #_all_bots
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	and	a, #0x07
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #_all_tops
	add	hl, de
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	ldhl	sp,	#0
	or	a, (hl)
	ld	(bc), a
	C$scene.c$486$3_0$255	= .
	.globl	C$scene.c$486$3_0$255
;src/scene.c:486: walker_byte |= (0x01 << i);
	ld	hl, #_i
	ld	c, (hl)
	ld	a, #0x01
	inc	c
	jr	00124$
00123$:
	add	a, a
00124$:
	dec	c
	jr	NZ,00123$
	ld	hl, #_walker_byte
	or	a, (hl)
	ld	(hl), a
	C$scene.c$487$3_0$255	= .
	.globl	C$scene.c$487$3_0$255
;src/scene.c:487: return;
	jr	00106$
00103$:
	C$scene.c$481$2_0$254	= .
	.globl	C$scene.c$481$2_0$254
;src/scene.c:481: for ( i = 0; i < 4; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00105$
00106$:
	C$scene.c$489$2_0$254	= .
	.globl	C$scene.c$489$2_0$254
;src/scene.c:489: }
	inc	sp
	C$scene.c$489$2_0$254	= .
	.globl	C$scene.c$489$2_0$254
	XG$fill_window$0$0	= .
	.globl	XG$fill_window$0$0
	ret
	G$mend_incorrect_windows$0$0	= .
	.globl	G$mend_incorrect_windows$0$0
	C$scene.c$491$2_0$258	= .
	.globl	C$scene.c$491$2_0$258
;src/scene.c:491: void mend_incorrect_windows(void){
;	---------------------------------
; Function mend_incorrect_windows
; ---------------------------------
_mend_incorrect_windows::
	dec	sp
	C$scene.c$492$1_0$258	= .
	.globl	C$scene.c$492$1_0$258
;src/scene.c:492: if(malloc_i == 4){
	ld	a, (#_malloc_i)
	sub	a, #0x04
	jr	Z, 00108$
	C$scene.c$493$2_0$259	= .
	.globl	C$scene.c$493$2_0$259
;src/scene.c:493: return;
	jr	00102$
00102$:
	C$scene.c$496$1_0$258	= .
	.globl	C$scene.c$496$1_0$258
;src/scene.c:496: if(window_components_on_current_floor[malloc_i] == 0x45){
	ld	bc, #_window_components_on_current_floor+0
	ld	a, c
	ld	hl, #_malloc_i
	add	a, (hl)
	ld	c, a
	jr	NC, 00132$
	inc	b
00132$:
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	sub	a, #0x45
	jr	NZ, 00104$
	C$scene.c$497$2_0$260	= .
	.globl	C$scene.c$497$2_0$260
;src/scene.c:497: window_components_on_current_floor[malloc_i] = 0x05; //no shingles above a cloth rack
	ld	a, #0x05
	ld	(bc), a
	C$scene.c$498$2_0$260	= .
	.globl	C$scene.c$498$2_0$260
;src/scene.c:498: return;
	jr	00108$
00104$:
	C$scene.c$500$1_0$258	= .
	.globl	C$scene.c$500$1_0$258
;src/scene.c:500: if((window_components_on_current_floor[malloc_i] & 0x0F) == 0x03 && (map_components[camera_y_clamped][malloc_i].components & 0xF0) == 0x30){
	ldhl	sp,	#0
	ld	a, (hl)
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, #0x03
	or	a, d
	jr	NZ, 00108$
	ld	de, #_map_components+0
	ld	hl, #_camera_y_clamped
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (#_malloc_i)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	and	a, #0xf0
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, #0x30
	or	a, d
	jr	NZ, 00108$
	C$scene.c$501$2_0$261	= .
	.globl	C$scene.c$501$2_0$261
;src/scene.c:501: window_components_on_current_floor[malloc_i] &= 0xF0; //no spikes above an awning
	ldhl	sp,	#0
	ld	a, (hl)
	and	a, #0xf0
	ld	(bc), a
	C$scene.c$503$2_0$261	= .
	.globl	C$scene.c$503$2_0$261
;src/scene.c:503: return;
00108$:
	C$scene.c$505$1_0$258	= .
	.globl	C$scene.c$505$1_0$258
;src/scene.c:505: }
	inc	sp
	C$scene.c$505$1_0$258	= .
	.globl	C$scene.c$505$1_0$258
	XG$mend_incorrect_windows$0$0	= .
	.globl	XG$mend_incorrect_windows$0$0
	ret
	G$fill_memory$0$0	= .
	.globl	G$fill_memory$0$0
	C$scene.c$507$1_0$263	= .
	.globl	C$scene.c$507$1_0$263
;src/scene.c:507: void fill_memory(void){
;	---------------------------------
; Function fill_memory
; ---------------------------------
_fill_memory::
	add	sp, #-3
	C$scene.c$509$1_0$263	= .
	.globl	C$scene.c$509$1_0$263
;src/scene.c:509: if(malloc_i == 4){
	ld	a, (#_malloc_i)
	sub	a, #0x04
	jr	NZ, 00102$
	C$scene.c$510$2_0$264	= .
	.globl	C$scene.c$510$2_0$264
;src/scene.c:510: walker_byte |= 0x80;
	ld	hl, #_walker_byte
	ld	a, (hl)
	or	a, #0x80
	ld	(hl), a
	C$scene.c$511$2_0$264	= .
	.globl	C$scene.c$511$2_0$264
;src/scene.c:511: return;
	jp	00103$
00102$:
	C$scene.c$514$1_0$263	= .
	.globl	C$scene.c$514$1_0$263
;src/scene.c:514: memcpy_rect((malloc_i << 2) + 16, base, 4, 12);
	ld	hl, #_malloc_i
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, #0x10
	ld	h, #0x0c
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x04
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	de, #_base
	push	de
	push	af
	inc	sp
	call	_memcpy_rect
	add	sp, #5
	C$scene.c$515$1_0$263	= .
	.globl	C$scene.c$515$1_0$263
;src/scene.c:515: memcpy_rect(malloc_i << 2, top_info[(UINT8)(window_components_on_current_floor[malloc_i] >> 4)].map, 4, (top_info[(UINT8)(window_components_on_current_floor[malloc_i] >> 4)].h)<<2);
	ld	a, #<(_window_components_on_current_floor)
	ld	hl, #_malloc_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_window_components_on_current_floor)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	swap	a
	and	a, #0x0f
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_top_info
	add	hl, de
	ld	c, l
	ld	b, h
	inc	hl
	inc	hl
	inc	bc
	ld	a, (bc)
	add	a, a
	add	a, a
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #_malloc_i
	ld	d, (hl)
	sla	d
	sla	d
	ld	h, a
	ld	l, #0x04
	push	hl
	push	bc
	push	de
	inc	sp
	call	_memcpy_rect
	add	sp, #5
	C$scene.c$516$1_0$263	= .
	.globl	C$scene.c$516$1_0$263
;src/scene.c:516: memcpy_rect((malloc_i << 2) + ((bot_info[window_components_on_current_floor[malloc_i] & 0x0F].y_offset - 1)<<4), bot_info[window_components_on_current_floor[malloc_i] & 0x0F].map, 4, (bot_info[window_components_on_current_floor[malloc_i] & 0x0F].h)<<2);
	ld	bc, #_bot_info+0
	ld	a, #<(_window_components_on_current_floor)
	ld	hl, #_malloc_i
	add	a, (hl)
	ld	e, a
	ld	a, #>(_window_components_on_current_floor)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	and	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (de)
	add	a, a
	add	a, a
	ldhl	sp,	#0
	ld	(hl), a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#1
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (#_malloc_i)
	add	a, a
	add	a, a
	ld	e, a
	ld	a, (bc)
	dec	a
	swap	a
	and	a, #0xf0
	add	a, e
	ldhl	sp,	#0
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x04
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#3
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	push	af
	inc	sp
	call	_memcpy_rect
	add	sp, #5
	C$scene.c$518$1_0$263	= .
	.globl	C$scene.c$518$1_0$263
;src/scene.c:518: malloc_i++;
	ld	hl, #_malloc_i
	inc	(hl)
00103$:
	C$scene.c$519$1_0$263	= .
	.globl	C$scene.c$519$1_0$263
;src/scene.c:519: }
	add	sp, #3
	C$scene.c$519$1_0$263	= .
	.globl	C$scene.c$519$1_0$263
	XG$fill_memory$0$0	= .
	.globl	XG$fill_memory$0$0
	ret
	G$memcpy_rect$0$0	= .
	.globl	G$memcpy_rect$0$0
	C$scene.c$521$1_0$266	= .
	.globl	C$scene.c$521$1_0$266
;src/scene.c:521: void memcpy_rect(uint8_t wm_pos, uint8_t * p_src, uint8_t src_width, uint8_t size_bytes){
;	---------------------------------
; Function memcpy_rect
; ---------------------------------
_memcpy_rect::
	add	sp, #-4
	C$scene.c$525$1_0$266	= .
	.globl	C$scene.c$525$1_0$266
;src/scene.c:525: uint8_t * map_pointer = window_map + wm_pos;
	ld	bc, #_window_map+0
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	C$scene.c$526$1_0$266	= .
	.globl	C$scene.c$526$1_0$266
;src/scene.c:526: cur_row = src_width;
	ldhl	sp,	#9
	ld	e, (hl)
	ld	hl, #_memcpy_rect_cur_row_65536_266
	ld	(hl), e
	C$scene.c$527$1_1$267	= .
	.globl	C$scene.c$527$1_1$267
;src/scene.c:527: uint8_t dest_next_row_start = 16U/*dest_width*/ - src_width; // only do this calc once
	ld	a, #0x10
	sub	a, e
	ldhl	sp,	#0
	C$scene.c$529$3_1$269	= .
	.globl	C$scene.c$529$3_1$269
;src/scene.c:529: while (size_bytes--) {
	ld	(hl+), a
	ld	(hl), e
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
00103$:
	ldhl	sp,	#3
	ld	a, (hl-)
	ld	(hl+), a
	dec	(hl)
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
	C$scene.c$530$2_1$268	= .
	.globl	C$scene.c$530$2_1$268
;src/scene.c:530: *map_pointer++ = *(p_src++);
	ld	a, (de)
	inc	de
	ld	(bc), a
	inc	bc
	C$scene.c$531$2_1$268	= .
	.globl	C$scene.c$531$2_1$268
;src/scene.c:531: cur_row--;
	ld	hl, #_memcpy_rect_cur_row_65536_266
	C$scene.c$532$2_1$268	= .
	.globl	C$scene.c$532$2_1$268
;src/scene.c:532: if (cur_row == 0) {
	dec	(hl)
	jr	NZ, 00103$
	C$scene.c$533$3_1$269	= .
	.globl	C$scene.c$533$3_1$269
;src/scene.c:533: map_pointer += dest_next_row_start;   
	ldhl	sp,	#0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	C$scene.c$534$3_1$269	= .
	.globl	C$scene.c$534$3_1$269
;src/scene.c:534: cur_row = src_width;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_memcpy_rect_cur_row_65536_266),a
	jr	00103$
00106$:
	C$scene.c$537$1_1$266	= .
	.globl	C$scene.c$537$1_1$266
;src/scene.c:537: }
	add	sp, #4
	C$scene.c$537$1_1$266	= .
	.globl	C$scene.c$537$1_1$266
	XG$memcpy_rect$0$0	= .
	.globl	XG$memcpy_rect$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
