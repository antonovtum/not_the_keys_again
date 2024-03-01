;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module scene
	.optsdcc -msm83
	
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
	.globl _game_ended_flag
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
	.globl _load_map
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
_i:
	.ds 1
_rand_init::
	.ds 1
_r::
	.ds 1
_window_components_on_current_floor:
	.ds 4
_camera_y::
	.ds 1
_old_camera_y::
	.ds 1
_camera_y_clamped::
	.ds 1
_old_camera_y_clamped::
	.ds 1
_frames_to_move:
	.ds 1
_current_cam_frame:
	.ds 1
_accelerate_cam_flag:
	.ds 1
_game_started_flag::
	.ds 1
_game_ended_flag::
	.ds 1
_rect_list::
	.ds 160
_map_components::
	.ds 32
_next_assignable_rect_index:
	.ds 1
_walker_byte:
	.ds 1
_malloc_i:
	.ds 1
_window_map:
	.ds 96
_clothes_position::
	.ds 4
_clothes_speed::
	.ds 1
_deactivate_weeds_flag::
	.ds 1
_weeds_frame_counter:
	.ds 1
_is_generated:
	.ds 1
_memcpy_rect_cur_row_65536_298:
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
;src/scene.c:116: void load_map(){
;	---------------------------------
; Function load_map
; ---------------------------------
_load_map::
;src/scene.c:117: set_bkg_data(0, 112U, hub_data);
	ld	de, #_hub_data
	push	de
	ld	hl, #0x7000
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scene.c:118: set_bkg_tiles(map_pos_x, 20U, 20u, 30u, hub_map);
	ld	de, #_hub_map
	push	de
	ld	hl, #0x1e14
	push	hl
	ld	hl, #0x1401
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scene.c:119: camera_y = 0;
	ld	hl, #_camera_y
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1378: SCX_REG=x, SCY_REG=y;
	ld	a, #0x08
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;src/scene.c:123: set_sprite_data(29, 8, extra_sprites);
	ld	de, #_extra_sprites
	push	de
	ld	hl, #0x81d
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scene.c:124: clothes_position[0] = 56;
	ld	hl, #_clothes_position
	ld	(hl), #0x38
;src/scene.c:125: clothes_position[1] = 136;
	ld	hl, #(_clothes_position + 1)
	ld	(hl), #0x88
;src/scene.c:126: clothes_position[2] = 136;
	ld	hl, #(_clothes_position + 2)
	ld	(hl), #0x88
;src/scene.c:127: clothes_position[3] = 136;
	ld	bc, #_clothes_position + 3
	ld	a, #0x88
	ld	(bc), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), #0x1d
;src/scene.c:129: move_sprite(16, 10, clothes_position[0] - camera_y);
	ld	a, (#_clothes_position + 0)
	ld	hl, #_camera_y
	sub	a, (hl)
	ld	e, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 64)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl), e
	inc	hl
	ld	(hl), #0x0a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), #0x1d
;src/scene.c:131: move_sprite(17, 13, clothes_position[1] - camera_y);
	ld	a, (#(_clothes_position + 1) + 0)
	ld	hl, #_camera_y
	sub	a, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 68)
	ld	(hl+), a
	ld	(hl), #0x0d
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 74)
	ld	(hl), #0x1d
;src/scene.c:133: move_sprite(18, 67, clothes_position[2] - camera_y);
	ld	a, (#(_clothes_position + 2) + 0)
	ld	hl, #_camera_y
	sub	a, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	e, a
	ld	hl, #(_shadow_OAM + 72)
	ld	(hl+), a
	ld	(hl), #0x43
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
	ld	(hl), #0x1d
;src/scene.c:135: move_sprite(19, 155, clothes_position[3] - camera_y);
	ld	a, (bc)
	ld	hl, #_camera_y
	sub	a, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 76)
	ld	(hl+), a
	ld	(hl), #0x9b
;src/scene.c:137: weeds_frame_counter = 0;
	ld	hl, #_weeds_frame_counter
	ld	(hl), #0x00
;src/scene.c:138: clothes_speed = 0b11100100;
	ld	hl, #_clothes_speed
	ld	(hl), #0xe4
;src/scene.c:139: deactivate_weeds_flag = 0;
	ld	hl, #_deactivate_weeds_flag
	ld	(hl), #0x00
;src/scene.c:140: }
	ret
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
_traversable_bots:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x01	; 1
_traversable_tops:
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
_bulky_bots:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
_bulky_tops:
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
_all_tops:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
_all_bots:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x02	; 2
_possible_clothes:
	.db #0x1f	; 31
	.db #0x20	; 32
;src/scene.c:142: void scene_init(void){
;	---------------------------------
; Function scene_init
; ---------------------------------
_scene_init::
	add	sp, #-27
;src/scene.c:143: load_map();
	call	_load_map
;src/scene.c:145: set_bkg_data(112U, 13, numbers);
	ld	de, #_numbers
	push	de
	ld	hl, #0xd70
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scene.c:146: set_bkg_data(0x7D, 5, partly_broken_bricks);
	ld	de, #_partly_broken_bricks
	push	de
	ld	hl, #0x57d
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scene.c:149: old_camera_y = 0;
	ld	hl, #_old_camera_y
	ld	(hl), #0x00
;src/scene.c:150: frames_to_move = 40;
	ld	hl, #_frames_to_move
	ld	(hl), #0x28
;src/scene.c:151: current_cam_frame = 0;
	ld	hl, #_current_cam_frame
	ld	(hl), #0x00
;src/scene.c:152: accelerate_cam_flag = 0;
	ld	hl, #_accelerate_cam_flag
	ld	(hl), #0x00
;src/scene.c:153: game_started_flag = false;
	ld	hl, #_game_started_flag
	ld	(hl), #0x00
;src/scene.c:154: game_ended_flag = false;
	ld	hl, #_game_ended_flag
	ld	(hl), #0x00
;src/scene.c:156: is_generated = false;
	ld	hl, #_is_generated
	ld	(hl), #0x00
;src/scene.c:158: rect ground = {0U, 152U, 0xFF, 23U, SOLID};
	ldhl	sp,	#0
	xor	a, a
	ld	(hl+), a
	ld	a, #0x98
	ld	(hl+), a
	ld	a, #0xff
	ld	(hl+), a
	ld	a, #0x17
	ld	(hl+), a
;src/scene.c:159: rect dumpster = {103U, 146U, 35U, 32U, TRAVERSABLE};
	xor	a, a
	ld	(hl+), a
	ld	a, #0x67
	ld	(hl+), a
	ld	a, #0x92
	ld	(hl+), a
	ld	a, #0x23
	ld	(hl+), a
	ld	a, #0x20
	ld	(hl+), a
;src/scene.c:160: rect vending_machine = {132U, 146U, 32U, 49U, SOLID};
	ld	a, #0x01
	ld	(hl+), a
	ld	a, #0x84
	ld	(hl+), a
	ld	a, #0x92
	ld	(hl+), a
	ld	a, #0x20
	ld	(hl+), a
	ld	a, #0x31
	ld	(hl+), a
;src/scene.c:161: rect ledge = {12U, 88U, 0x98, 19U, INIT_FLAG}; //prev 154
	xor	a, a
	ld	(hl+), a
	ld	a, #0x0c
	ld	(hl+), a
	ld	a, #0x58
	ld	(hl+), a
	ld	a, #0x98
	ld	(hl+), a
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x06
;src/scene.c:163: next_assignable_rect_index = 0U;
	ld	hl, #_next_assignable_rect_index
	ld	(hl), #0x00
;src/scene.c:165: empty_window_status.components = 0x00;
	ldhl	sp,	#20
;src/scene.c:166: empty_window_status.status = 0x00;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scene.c:167: for (i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00102$:
;src/scene.c:170: collider = top_info[1].collider;
	ld	de, #0x0005
	push	de
	ld	bc, #(_top_info + 13)
	ld	hl, #24
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/scene.c:171: collider.x += (3 + (i<<2)) << 3;
	ldhl	sp,	#22
	ld	c, (hl)
	ld	a, (#_i)
	add	a, a
	add	a, a
	add	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ldhl	sp,	#22
;src/scene.c:172: collider.y += 8;
	ld	(hl+), a
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
;src/scene.c:173: rect_list[0][0x07 & (i<<1 | 0x01)] = collider;
	ld	a, (#_i)
	add	a, a
	set	0, a
	and	a, #0x07
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_rect_list
	add	hl, de
	ld	e, l
	ld	d, h
	ld	bc, #0x0005
	push	bc
	ld	hl, #24
	add	hl, sp
	ld	c, l
	ld	b, h
	call	___memcpy
;src/scene.c:176: collider = bot_info[1].collider;
	ld	de, #0x0005
	push	de
	ld	bc, #(_bot_info + 13)
	ld	hl, #24
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/scene.c:177: collider.x += (3 + (i<<2)) << 3;
	ldhl	sp,	#22
	ld	c, (hl)
	ld	a, (#_i)
	add	a, a
	add	a, a
	add	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ldhl	sp,	#22
;src/scene.c:178: collider.y += 8;
	ld	(hl+), a
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
;src/scene.c:179: rect_list[0][0x07 & (i<<1)] = collider;
	ld	hl, #22
	add	hl, sp
	ld	c, l
	ld	b, h
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
	ld	hl, #0x0005
	push	hl
	call	___memcpy
;src/scene.c:182: map_components[i][0] = empty_window_status;
	ld	hl, #20
	add	hl, sp
	ld	c, l
	ld	b, h
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
	ld	de, #_map_components
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #0x0002
	push	hl
	call	___memcpy
;src/scene.c:183: map_components[i][1] = empty_window_status;
	ld	hl, #20
	add	hl, sp
	ld	c, l
	ld	b, h
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
	ld	de, #_map_components
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	hl, #0x0002
	push	hl
	call	___memcpy
;src/scene.c:184: map_components[i][2] = empty_window_status;
	ld	hl, #20
	add	hl, sp
	ld	c, l
	ld	b, h
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
	ld	de, #_map_components
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	hl, #0x0002
	push	hl
	call	___memcpy
;src/scene.c:185: map_components[i][3] = empty_window_status;
	ld	hl, #20
	add	hl, sp
	ld	c, l
	ld	b, h
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
	ld	de, #_map_components
	add	hl, de
	ld	de, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #0x0002
	push	hl
	call	___memcpy
;src/scene.c:167: for (i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jp	C, 00102$
;src/scene.c:189: rect_list[1][0x00] = ledge;
	ld	de, #0x0005
	push	de
	ld	hl, #17
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 40)
	call	___memcpy
;src/scene.c:190: rect_list[1][0x01] = dumpster;
	ld	de, #0x0005
	push	de
	ld	hl, #7
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 45)
	call	___memcpy
;src/scene.c:191: rect_list[1][0x02] = vending_machine;
	ld	de, #0x0005
	push	de
	ld	hl, #12
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 50)
	call	___memcpy
;src/scene.c:192: rect_list[1][0x03] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 55)
	call	___memcpy
;src/scene.c:193: rect_list[1][0x04] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 60)
	call	___memcpy
;src/scene.c:194: rect_list[1][0x05] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 65)
	call	___memcpy
;src/scene.c:195: rect_list[1][0x06] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 70)
	call	___memcpy
;src/scene.c:196: rect_list[1][0x07] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 75)
	call	___memcpy
;src/scene.c:198: rect_list[2][0x00] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 80)
	call	___memcpy
;src/scene.c:199: rect_list[2][0x01] = vending_machine;
	ld	de, #0x0005
	push	de
	ld	hl, #12
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 85)
	call	___memcpy
;src/scene.c:200: rect_list[2][0x02] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 90)
	call	___memcpy
;src/scene.c:201: rect_list[2][0x03] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 95)
	call	___memcpy
;src/scene.c:202: rect_list[2][0x04] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 100)
	call	___memcpy
;src/scene.c:203: rect_list[2][0x05] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 105)
	call	___memcpy
;src/scene.c:204: rect_list[2][0x06] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 110)
	call	___memcpy
;src/scene.c:205: rect_list[2][0x07] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 115)
	call	___memcpy
;src/scene.c:207: rect_list[3][0x00] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 120)
	call	___memcpy
;src/scene.c:208: rect_list[3][0x01] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 125)
	call	___memcpy
;src/scene.c:209: rect_list[3][0x02] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 130)
	call	___memcpy
;src/scene.c:210: rect_list[3][0x03] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 135)
	call	___memcpy
;src/scene.c:211: rect_list[3][0x04] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 140)
	call	___memcpy
;src/scene.c:212: rect_list[3][0x05] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 145)
	call	___memcpy
;src/scene.c:213: rect_list[3][0x06] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 150)
	call	___memcpy
;src/scene.c:214: rect_list[3][0x07] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 155)
	call	___memcpy
;src/scene.c:216: window_components_on_current_floor[0] = 0x11;
	ld	hl, #_window_components_on_current_floor
	ld	(hl), #0x11
;src/scene.c:217: window_components_on_current_floor[1] = 0x11;
	ld	hl, #(_window_components_on_current_floor + 1)
	ld	(hl), #0x11
;src/scene.c:218: window_components_on_current_floor[2] = 0x11;
	ld	hl, #(_window_components_on_current_floor + 2)
	ld	(hl), #0x11
;src/scene.c:219: window_components_on_current_floor[3] = 0x11;
	ld	hl, #(_window_components_on_current_floor + 3)
	ld	(hl), #0x11
;src/scene.c:221: r = 0x00;
	ld	hl, #_r
	ld	(hl), #0x00
;src/scene.c:222: rand_init = false;
	ld	hl, #_rand_init
	ld	(hl), #0x00
;src/scene.c:225: walker_byte = 0x00;
	ld	hl, #_walker_byte
	ld	(hl), #0x00
;src/scene.c:226: malloc_i = 0;
	ld	hl, #_malloc_i
	ld	(hl), #0x00
;src/scene.c:248: }
	add	sp, #27
	ret
;src/scene.c:250: void compute_scene_frame(void){
;	---------------------------------
; Function compute_scene_frame
; ---------------------------------
_compute_scene_frame::
;src/scene.c:260: if((walker_byte & 0xCF) != 0xCF){
	ld	a, (#_walker_byte)
	and	a, #0xcf
	sub	a, #0xcf
	jr	Z, 00104$
;src/scene.c:261: if(rand_init)next_map_gen_step();
	ld	hl, #_rand_init
	bit	0, (hl)
	jr	Z, 00104$
	call	_next_map_gen_step
00104$:
;src/scene.c:263: move_camera();
	call	_move_camera
;src/scene.c:265: animate_weeds();
;src/scene.c:266: }
	jp	_animate_weeds
;src/scene.c:268: void move_camera(void){
;	---------------------------------
; Function move_camera
; ---------------------------------
_move_camera::
;src/scene.c:269: if(!game_started_flag) return;
	ld	hl, #_game_started_flag
	bit	0, (hl)
	ret	Z
;src/scene.c:271: current_cam_frame++;
	ld	hl, #_current_cam_frame
	inc	(hl)
;src/scene.c:272: accelerate_cam_flag++;
	ld	hl, #_accelerate_cam_flag
	inc	(hl)
;src/scene.c:274: if(current_cam_frame >= (frames_to_move >> 3)){
	ld	hl, #_frames_to_move
	ld	c, (hl)
	srl	c
	srl	c
	srl	c
	ld	hl, #_current_cam_frame
	ld	a, (hl)
	sub	a, c
	jr	C, 00104$
;src/scene.c:275: current_cam_frame = 0;
	ld	(hl), #0x00
;src/scene.c:276: camera_y--;
	ld	hl, #_camera_y
	dec	(hl)
;src/scene.c:277: set_camera();
	call	_set_camera
00104$:
;src/scene.c:280: move_sprites_down();
	call	_move_sprites_down
;src/scene.c:282: if(accelerate_cam_flag == 0xFF && frames_to_move > 16U){
	ld	a, (#_accelerate_cam_flag)
	inc	a
	ret	NZ
	ld	a, #0x10
	ld	hl, #_frames_to_move
	sub	a, (hl)
	ret	NC
;src/scene.c:283: frames_to_move--;
	dec	(hl)
;src/scene.c:285: }
	ret
;src/scene.c:287: void set_camera(void){
;	---------------------------------
; Function set_camera
; ---------------------------------
_set_camera::
;src/scene.c:288: move_bkg(8, camera_y);
	ld	hl, #_camera_y
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1378: SCX_REG=x, SCY_REG=y;
	ld	a, #0x08
	ldh	(_SCX_REG + 0), a
	ld	a, c
	ldh	(_SCY_REG + 0), a
;src/scene.c:290: camera_y_clamped = (((camera_y-1) >> 3) & 0x1F) >> 3;
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
;src/scene.c:291: old_camera_y_clamped = (((old_camera_y) >> 3) & 0x1F) >> 3;
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
;src/scene.c:292: if(camera_y_clamped != old_camera_y_clamped){
	ld	a, (#_camera_y_clamped)
	ld	hl, #_old_camera_y_clamped
	sub	a, (hl)
	ret	Z
;src/scene.c:293: gen_new_floor();
	call	_gen_new_floor
;src/scene.c:294: old_camera_y = camera_y-1;
	ld	a, (#_camera_y)
	dec	a
	ld	(#_old_camera_y),a
;src/scene.c:296: }
	ret
;src/scene.c:298: void move_sprites_down(void){
;	---------------------------------
; Function move_sprites_down
; ---------------------------------
_move_sprites_down::
;src/scene.c:300: for(i=0; i<4; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00114$:
;src/scene.c:302: if(((deactivate_weeds_flag >> (i << 1)) & 0x03)){continue;}
	ld	a, (#_i)
	add	a, a
	ld	b, a
	ld	hl, #_deactivate_weeds_flag
	ld	c, (hl)
	inc	b
	jr	00160$
00159$:
	srl	c
00160$:
	dec	b
	jr	NZ, 00159$
	ld	a, c
	and	a, #0x03
	jp	NZ,00110$
;src/scene.c:303: if(get_sprite_tile(16 + i) > 32){
	ld	a, (#_i)
	add	a, #0x10
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1815: return shadow_OAM[nb].tile;
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
;src/scene.c:303: if(get_sprite_tile(16 + i) > 32){
	ld	a, #0x20
	sub	a, c
	jr	NC, 00106$
;src/scene.c:304: clothes_position[0 + i] += ((clothes_speed >> (i<<1)) & 0x03) << 1;
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
	jr	00164$
00163$:
	srl	d
00164$:
	dec	a
	jr	NZ, 00163$
	ld	a, d
	and	a, #0x03
	add	a, a
	add	a, e
	ld	(bc), a
;src/scene.c:305: if((weeds_frame_counter >> 1) & 0x01){
	ld	a, (#_weeds_frame_counter)
	rrca
	and	a,#0x01
	jr	Z, 00106$
;src/scene.c:306: shadow_OAM[16 + i].y = 160; //hide the sprite without modyfying the x coord
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
;src/scene.c:307: continue;
	jr	00110$
00106$:
;src/scene.c:311: shadow_OAM[16 + i].y = clothes_position[0 + i] - camera_y;
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
;src/scene.c:312: if((uint8_t)(clothes_position[0 + i] - camera_y) >= 152 && (uint8_t)(clothes_position[0 + i] - camera_y) < 170){
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
;src/scene.c:313: deactivate_weeds_flag |= 0b00000001 << (i<<1);
	ld	hl, #_i
	ld	c, (hl)
	ld	a, c
	add	a, a
	ld	e, a
	ld	b, e
	ld	a, #0x01
	inc	b
	jr	00166$
00165$:
	add	a, a
00166$:
	dec	b
	jr	NZ,00165$
	ld	hl, #_deactivate_weeds_flag
	or	a, (hl)
	ld	(hl), a
;src/scene.c:314: clothes_speed &= ~(0b00000011 << (i<<1));
	ld	a, #0x03
	inc	e
	jr	00168$
00167$:
	add	a, a
00168$:
	dec	e
	jr	NZ,00167$
	cpl
	ld	hl, #_clothes_speed
	and	a, (hl)
	ld	(hl), a
;src/scene.c:315: hide_sprite(16+i);
	ld	a, c
	add	a, #0x10
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1905: shadow_OAM[nb].y = 0;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	(hl), #0x00
;src/scene.c:315: hide_sprite(16+i);
00110$:
;src/scene.c:300: for(i=0; i<4; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jp	C, 00114$
;src/scene.c:318: }
	ret
;src/scene.c:320: void animate_weeds(void){
;	---------------------------------
; Function animate_weeds
; ---------------------------------
_animate_weeds::
;src/scene.c:321: weeds_frame_counter++;
	ld	hl, #_weeds_frame_counter
	inc	(hl)
;src/scene.c:322: if(deactivate_weeds_flag != 0x00 || is_generated){
	ld	a, (#_deactivate_weeds_flag)
	or	a, a
	ret	NZ
	ld	hl, #_is_generated
	bit	0, (hl)
;src/scene.c:323: return;
	ret	NZ
;src/scene.c:325: if(weeds_frame_counter >= 15){
	ld	hl, #_weeds_frame_counter
	ld	a, (hl)
	sub	a, #0x0f
	ret	C
;src/scene.c:326: weeds_frame_counter = 0;
	ld	(hl), #0x00
;src/scene.c:328: clothes_speed = ((clothes_speed + 0b00000001) & 0b00000011)
	ld	hl, #_clothes_speed
	ld	b, (hl)
	ld	a, b
	inc	a
	and	a, #0x03
	ld	c, a
;src/scene.c:329: | ((clothes_speed + 0b00000100) & 0b00001100)
	ld	a, b
	inc	a
	inc	a
	inc	a
	inc	a
	and	a, #0x0c
	or	a, c
	ld	c, a
;src/scene.c:330: | ((clothes_speed + 0b00010000) & 0b00110000)
	ld	a, b
	add	a, #0x10
	and	a, #0x30
	or	a, c
	ld	c, a
;src/scene.c:331: | ((clothes_speed + 0b01000000) & 0b11000000);
	ld	a, b
	add	a, #0x40
	and	a, #0xc0
	or	a, c
	ld	(hl), a
;src/scene.c:333: set_sprite_tile(16, 29 + ((clothes_speed >> 7) & 0x01));
	ld	a, (hl)
	rlca
	and	a, #0x01
	add	a, #0x1d
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), c
;src/scene.c:334: set_sprite_tile(17, 29 + ((clothes_speed >> 5) & 0x01));
	ld	a, (#_clothes_speed)
	rlca
	rlca
	rlca
	and	a, #0x01
	add	a, #0x1d
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), c
;src/scene.c:335: set_sprite_tile(18, 29 + ((clothes_speed >> 3) & 0x01));
	ld	a, (#_clothes_speed)
	rrca
	rrca
	rrca
	and	a, #0x01
	add	a, #0x1d
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 74)
	ld	(hl), c
;src/scene.c:336: set_sprite_tile(19, 29 + ((clothes_speed >> 1) & 0x01));
	ld	a, (#_clothes_speed)
	rrca
	and	a, #0x01
	add	a, #0x1d
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
	ld	(hl), c
;src/scene.c:336: set_sprite_tile(19, 29 + ((clothes_speed >> 1) & 0x01));
;src/scene.c:338: }
	ret
;src/scene.c:340: void gen_new_floor(void){
;	---------------------------------
; Function gen_new_floor
; ---------------------------------
_gen_new_floor::
	add	sp, #-9
;src/scene.c:341: if(!rand_init) {
	ld	hl, #_rand_init
	bit	0, (hl)
	jr	NZ, 00103$
;src/scene.c:342: initrand(r);
	ld	hl, #_r
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	call	_initrand
	pop	hl
;src/scene.c:343: rand_init = true;
	ld	hl, #_rand_init
	ld	(hl), #0x01
;src/scene.c:348: while((walker_byte & 0xCF) != 0xCF){
00103$:
	ld	a, (#_walker_byte)
	and	a, #0xcf
	sub	a, #0xcf
	jr	Z, 00105$
;src/scene.c:350: next_map_gen_step();
	call	_next_map_gen_step
	jr	00103$
00105$:
;src/scene.c:353: walker_byte &= 0x30;
	ld	hl, #_walker_byte
	ld	a, (hl)
	and	a, #0x30
	ld	(hl), a
;src/scene.c:354: malloc_i = 0;
	ld	hl, #_malloc_i
	ld	(hl), #0x00
;src/scene.c:356: if(!is_generated){
	ld	hl, #_is_generated
	bit	0, (hl)
	jr	NZ, 00109$
;src/scene.c:357: set_bkg_tiles(map_pos_x, camera_y_clamped << 3, 20, base_floor_map_height, floor_map);
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
;src/scene.c:358: if(camera_y_clamped == 0) is_generated = true;    
	ld	a, (#_camera_y_clamped)
	or	a, a
	jr	NZ, 00109$
	ld	hl, #_is_generated
	ld	(hl), #0x01
00109$:
;src/scene.c:361: uint8_t y_draw = (camera_y_clamped << 3);
	ld	a, (#_camera_y_clamped)
	add	a, a
	add	a, a
	add	a, a
;src/scene.c:363: set_bkg_tiles(3, y_draw + 1, 16, 6, window_map);
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
;src/scene.c:367: for ( i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00113$:
;src/scene.c:371: collider = top_info[(uint8_t)(window_components_on_current_floor[i] >> 4)].collider;
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
	ld	c, l
	ld	b, h
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/scene.c:372: collider.x += (3 + (i<<2)) << 3;
	ldhl	sp,	#0
	ld	c, (hl)
	ld	a, (#_i)
	add	a, a
	add	a, a
	add	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ldhl	sp,	#0
;src/scene.c:373: collider.y += (1 + y_draw) << 3;
	ld	(hl+), a
	ld	c, (hl)
	ldhl	sp,	#7
	ld	a, (hl+)
	add	a, a
	add	a, a
	add	a, a
	ld	(hl), a
	add	a,c
	ldhl	sp,	#1
	ld	(hl), a
;src/scene.c:374: rect_list[camera_y_clamped][0x07 & (i<<1 | 0x01)] = collider;
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
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	bc, #0x0005
	push	bc
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	call	___memcpy
;src/scene.c:377: collider = bot_info[window_components_on_current_floor[i] & 0x0F].collider;
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
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_bot_info
	add	hl, de
	ld	bc, #0x0004
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/scene.c:378: collider.x += (3 + (i<<2)) << 3;
	ldhl	sp,	#0
	ld	c, (hl)
	ld	a, (#_i)
	add	a, a
	add	a, a
	add	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ldhl	sp,	#0
;src/scene.c:379: collider.y += (1 + y_draw) << 3;
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#8
	add	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;src/scene.c:380: rect_list[camera_y_clamped][0x07 & (i<<1)] = collider;
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
	ld	e, l
	ld	d, h
	ld	bc, #0x0005
	push	bc
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	call	___memcpy
;src/scene.c:384: temp_window.components = window_components_on_current_floor[i];
	ld	a, #<(_window_components_on_current_floor)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_window_components_on_current_floor)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ldhl	sp,	#5
;src/scene.c:385: temp_window.status = 0x00;
	ld	(hl+), a
	ld	(hl), #0x00
;src/scene.c:388: if((window_components_on_current_floor[i] & 0x0F) == 0x05){
	ld	a, #<(_window_components_on_current_floor)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_window_components_on_current_floor)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	and	a, #0x0f
	sub	a, #0x05
	jr	NZ, 00111$
;src/scene.c:389: add_clothes_to_rag(&temp_window);
	ld	hl, #5
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_add_clothes_to_rag
00111$:
;src/scene.c:391: map_components[camera_y_clamped][i] = temp_window;
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
	ld	c, a
	ld	a, h
	adc	a, #>(_map_components)
	ld	b, a
	ld	a, (#_i)
	add	a, a
	add	a, c
	ld	e, a
	ld	a, #0x00
	adc	a, b
	ld	d, a
	ld	bc, #0x0002
	push	bc
	ld	hl, #7
	add	hl, sp
	ld	c, l
	ld	b, h
	call	___memcpy
;src/scene.c:367: for ( i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jp	C, 00113$
;src/scene.c:393: }
	add	sp, #9
	ret
;src/scene.c:395: void add_clothes_to_rag(window_status* temp_window){
;	---------------------------------
; Function add_clothes_to_rag
; ---------------------------------
_add_clothes_to_rag::
	add	sp, #-7
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scene.c:396: if(game_ended_flag) return;
	ld	hl, #_game_ended_flag
	bit	0, (hl)
	jp	NZ,00123$
;src/scene.c:397: uint8_t temp_rand = rand();
	call	_rand
	ldhl	sp,	#2
	ld	(hl), e
;src/scene.c:398: uint8_t particle_x = ((3 + (i<<2)) << 3) + 8u;
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
;src/scene.c:399: uint8_t particle_y = (((camera_y_clamped << 3) + 5) << 3) + 17u;
	ld	a, (#_camera_y_clamped)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x05
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x11
	ldhl	sp,	#0
	ld	(hl), a
;src/scene.c:401: uint8_t rack_status = 0x00;
	ldhl	sp,	#6
	ld	(hl), #0x00
;src/scene.c:402: if((temp_rand >> 1) & 0x01){
	ldhl	sp,	#2
	ld	a, (hl)
	rrca
	and	a,#0x01
	jp	Z, 00107$
;src/scene.c:404: for(object_sprite = 0; object_sprite < 4; object_sprite++){
	inc	hl
	ld	(hl), #0x00
	ld	e, #0x00
00119$:
;src/scene.c:405: if((deactivate_weeds_flag >> (object_sprite << 1)) & 0x03){
	ld	a, e
	add	a, a
	ld	c, a
	ld	hl, #_deactivate_weeds_flag
	ld	b, (hl)
	inc	c
	jr	00182$
00181$:
	srl	b
00182$:
	dec	c
	jr	NZ, 00181$
	ld	a, b
	and	a, #0x03
	jr	Z, 00120$
;src/scene.c:407: deactivate_weeds_flag ^= 0b00000001 << (object_sprite << 1);
	ldhl	sp,	#3
	ld	e, (hl)
	ld	a, e
	add	a, a
	ld	b, a
	ld	a, #0x01
	inc	b
	jr	00185$
00184$:
	add	a, a
00185$:
	dec	b
	jr	NZ,00184$
	ld	hl, #_deactivate_weeds_flag
	xor	a, (hl)
	ld	(hl), a
;src/scene.c:408: set_sprite_tile(16 + object_sprite, possible_clothes[(temp_rand & 0x01)]);
	ldhl	sp,	#2
	ld	a, (hl)
	and	a, #0x01
	ld	c, a
	ld	b, #0x00
	ld	hl, #_possible_clothes
	add	hl, bc
	ld	c, (hl)
	ld	a, e
	add	a, #0x10
	ld	e, a
	ldhl	sp,	#6
	ld	(hl), e
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), c
;src/scene.c:409: clothes_position[object_sprite] = particle_y;
	ld	bc, #_clothes_position+0
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;src/scene.c:410: move_sprite(16 + object_sprite, particle_x, particle_y - camera_y);
	ld	a, (hl)
	ld	hl, #_camera_y
	sub	a, (hl)
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(bc), a
;src/scene.c:411: clothes_speed &= ~(0b00000011 << (i<<1));
	ld	a, (#_i)
	add	a, a
	ld	b, a
	ld	a, #0x03
	inc	b
	jr	00187$
00186$:
	add	a, a
00187$:
	dec	b
	jr	NZ,00186$
	cpl
	ld	hl, #_clothes_speed
	and	a, (hl)
	ld	(hl), a
;src/scene.c:414: rack_status |= object_sprite;
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, #0x08
	ldhl	sp,	#6
	ld	(hl), a
;src/scene.c:415: break;
	jr	00107$
00120$:
;src/scene.c:404: for(object_sprite = 0; object_sprite < 4; object_sprite++){
	inc	e
	ldhl	sp,	#3
	ld	(hl), e
	ld	a, e
	sub	a, #0x04
	jp	C, 00119$
00107$:
;src/scene.c:420: particle_x += 8;
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x08
;src/scene.c:421: if((temp_rand >> 3) & 0x01){
	ld	(hl+), a
	ld	a, (hl)
	rrca
	rrca
	rrca
	and	a,#0x01
	jp	Z, 00114$
;src/scene.c:423: for(object_sprite = 0; object_sprite < 4; object_sprite++){
	ld	c, #0x00
	ld	e, c
00121$:
;src/scene.c:424: if((deactivate_weeds_flag >> (object_sprite << 1)) & 0x03){
	ld	a, e
	add	a, a
	ld	b, a
	ld	hl, #_deactivate_weeds_flag
	ld	d, (hl)
	inc	b
	jr	00189$
00188$:
	srl	d
00189$:
	dec	b
	jr	NZ, 00188$
	ld	a, d
	and	a, #0x03
	jp	Z,00122$
;src/scene.c:426: deactivate_weeds_flag ^= 0b00000001 << (object_sprite << 1);
	ldhl	sp,	#3
	ld	(hl), c
	ld	a, (hl)
	add	a, a
	ld	b, a
	ld	a, #0x01
	inc	b
	jr	00192$
00191$:
	add	a, a
00192$:
	dec	b
	jr	NZ,00191$
	ld	hl, #_deactivate_weeds_flag
	xor	a, (hl)
	ld	(hl), a
;src/scene.c:427: set_sprite_tile(16 + object_sprite, possible_clothes[((temp_rand>>2) & 0x01)]);
	ldhl	sp,	#2
	ld	a, (hl)
	rrca
	rrca
	and	a, #0x01
	add	a, #<(_possible_clothes)
	ld	e, a
	ld	a, #0x00
	adc	a, #>(_possible_clothes)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl)
	add	a, #0x10
	ld	(hl), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
;src/scene.c:428: clothes_position[object_sprite] = particle_y;
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, #<(_clothes_position)
	add	a, c
	ld	e, a
	ld	a, #>(_clothes_position)
	adc	a, #0x00
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;src/scene.c:429: move_sprite(16 + object_sprite, particle_x, particle_y - camera_y);
	ld	a, (hl)
	ld	hl, #_camera_y
	sub	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl-)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/scene.c:430: clothes_speed &= ~(0b00000011 << (i<<1));
	ld	a, (#_i)
	add	a, a
	ld	b, a
	ld	a, #0x03
	inc	b
	jr	00194$
00193$:
	add	a, a
00194$:
	dec	b
	jr	NZ,00193$
	cpl
	ld	hl, #_clothes_speed
	and	a, (hl)
	ld	(hl), a
;src/scene.c:432: rack_status |= 0b00000100;
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(hl), a
	set	2, (hl)
;src/scene.c:433: if((rack_status & 0b00001000) == 0x00){
	push	hl
	bit	3, (hl)
	pop	hl
	jr	NZ, 00114$
;src/scene.c:434: rack_status |= object_sprite;
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, c
	ld	(hl), a
;src/scene.c:436: break;
	jr	00114$
00122$:
;src/scene.c:423: for(object_sprite = 0; object_sprite < 4; object_sprite++){
	inc	e
	ld	a,e
	ld	c,a
	sub	a, #0x04
	jp	C, 00121$
00114$:
;src/scene.c:449: temp_window->status = (temp_window->status & 0xF0) | rack_status; 
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	ld	a, (bc)
	and	a, #0xf0
	or	a, (hl)
	ld	(bc), a
00123$:
;src/scene.c:450: }
	add	sp, #7
	ret
;src/scene.c:452: void next_map_gen_step(void){
;	---------------------------------
; Function next_map_gen_step
; ---------------------------------
_next_map_gen_step::
;src/scene.c:459: if((walker_byte & 0x40) != 0x40){
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
;src/scene.c:461: update_walker();
	jp	NZ,_update_walker
;src/scene.c:462: } else if((walker_byte & 0x4F) != 0x4F){
	ld	a, c
	and	a, #0x4f
	ld	c, a
	ld	b, #0x00
	ld	a, c
	sub	a, #0x4f
	or	a, b
;src/scene.c:464: fill_window();
	jp	NZ,_fill_window
;src/scene.c:467: mend_incorrect_windows();
	call	_mend_incorrect_windows
;src/scene.c:469: fill_memory();
;src/scene.c:471: }
	jp	_fill_memory
;src/scene.c:473: void update_walker(void){
;	---------------------------------
; Function update_walker
; ---------------------------------
_update_walker::
	add	sp, #-4
;src/scene.c:475: if(!(walker_byte & 0x0F)){
	ld	hl, #_walker_byte
	ld	c, (hl)
	ld	a, c
	and	a, #0x0f
	jr	NZ, 00118$
;src/scene.c:476: walker_byte |= (0x01 << (CURRENT_WINDOW & 0x03));
	ld	hl, #_walker_byte
	ld	a, (hl)
	swap	a
	and	a, #0x3
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
;src/scene.c:477: window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (traversable_bots[rand() & 0x03]) | ((bulky_tops[rand() & 0x03]) << 4);
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
;src/scene.c:481: else if(((CURRENT_WINDOW & 0x01) && ((VISITED_WINDOWS & 0x05) == 0x05)) || (!(CURRENT_WINDOW & 0x01) && ((VISITED_WINDOWS & 0x0A) == 0x0A))){
	ld	a, (#_walker_byte)
	swap	a
	and	a, #0x01
	ld	b, a
	or	a, a
	jr	Z, 00116$
	ld	a, c
	and	a, #0x05
	sub	a, #0x05
	jr	Z, 00111$
00116$:
	ld	a, b
	or	a, a
	jr	NZ, 00112$
	ld	a, c
	and	a, #0x0a
	sub	a, #0x0a
	jr	NZ, 00112$
00111$:
;src/scene.c:482: walker_byte |= 0x40;
	ld	hl, #_walker_byte
	ld	a, (hl)
	or	a, #0x40
;src/scene.c:483: window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (window_components_on_current_floor[CURRENT_WINDOW & 0x03] & 0x0F) | (uint8_t)((traversable_tops[(rand() & 0x03)]) << 4);   
	ld	(hl), a
	ld	de, #_window_components_on_current_floor+0
	swap	a
	and	a, #0x3
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	and	a, #0x0f
	ld	e, a
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
	add	a, #<(_traversable_tops)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	adc	a, #>(_traversable_tops)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	or	a, e
	ld	(bc), a
	jp	00120$
00112$:
;src/scene.c:487: else if(TURNING_PROB < (UBYTE)rand()){
	call	_rand
	ld	a, #0xaf
	sub	a, e
	jr	NC, 00109$
;src/scene.c:489: walker_byte |= 0x40;
	ld	hl, #_walker_byte
	ld	a, (hl)
	or	a, #0x40
;src/scene.c:490: window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (window_components_on_current_floor[CURRENT_WINDOW & 0x03] & 0x0F) | (uint8_t)((traversable_tops[(rand() & 0x03)]) << 4);
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
	ld	e, a
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
	add	a, #<(_traversable_tops)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	adc	a, #>(_traversable_tops)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	or	a, e
	ld	(bc), a
	jp	00120$
00109$:
;src/scene.c:494: if((rand() & 0x01) && !((VISITED_WINDOWS >> ((CURRENT_WINDOW + 1) & 0x03)) & 0x01)) { //if we want to go right and right is empty
	call	_rand
;src/scene.c:476: walker_byte |= (0x01 << (CURRENT_WINDOW & 0x03));
	ld	a, (#_walker_byte)
	swap	a
	and	a, #0x0f
	ldhl	sp,	#0
	ld	(hl), a
;src/scene.c:496: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
	ld	hl, #_walker_byte
	ld	c, (hl)
;src/scene.c:499: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW - 1) & 0x03) << 4);
	ldhl	sp,	#0
	ld	a, (hl+)
;src/scene.c:496: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
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
;src/scene.c:494: if((rand() & 0x01) && !((VISITED_WINDOWS >> ((CURRENT_WINDOW + 1) & 0x03)) & 0x01)) { //if we want to go right and right is empty
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
	jr	00180$
00179$:
	srl	b
00180$:
	dec	c
	jr	NZ, 00179$
	bit	0, b
	jr	NZ, 00105$
;src/scene.c:496: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_walker_byte),a
	jr	00106$
00105$:
;src/scene.c:497: } else if (!((VISITED_WINDOWS >> ((CURRENT_WINDOW - 1) & 0x03)) & 0x01)){ //if left is empty
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	and	a, #0x03
	ld	c, a
	ld	hl, #_walker_byte
	ld	b, (hl)
	inc	c
	jr	00184$
00183$:
	srl	b
00184$:
	dec	c
	jr	NZ, 00183$
	bit	0, b
	jr	NZ, 00102$
;src/scene.c:499: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW - 1) & 0x03) << 4);
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
;src/scene.c:502: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_walker_byte),a
00106$:
;src/scene.c:504: walker_byte |= (0x01 << CURRENT_WINDOW);
	ld	hl, #_walker_byte
	ld	a, (hl)
	swap	a
	and	a, #0x0f
	ld	b, a
	ld	a, #0x01
	inc	b
	jr	00188$
00187$:
	add	a, a
00188$:
	dec	b
	jr	NZ,00187$
	or	a, (hl)
;src/scene.c:505: window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (bulky_bots[rand() & 0x03]) | ((bulky_tops[rand() & 0x03]) << 4);
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
	ld	c, (hl)
	push	bc
	push	de
	call	_rand
	ld	a, e
	pop	de
	pop	bc
	and	a, #0x03
	ld	b, #0x00
	add	a, #<(_bulky_tops)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	adc	a, #>(_bulky_tops)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	or	a, c
	ld	(de), a
00120$:
;src/scene.c:507: }
	add	sp, #4
	ret
;src/scene.c:509: void fill_window(void){
;	---------------------------------
; Function fill_window
; ---------------------------------
_fill_window::
;src/scene.c:511: for ( i = 0; i < 4; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00105$:
;src/scene.c:512: if((VISITED_WINDOWS >> i) & 0x01) {
	ld	a, (#_i)
	push	af
	ld	hl, #_walker_byte
	ld	c, (hl)
	pop	af
	inc	a
	jr	00123$
00122$:
	srl	c
00123$:
	dec	a
	jr	NZ, 00122$
	bit	0, c
	jr	NZ, 00103$
;src/scene.c:515: window_components_on_current_floor[i] = (all_bots[rand() & 0x07]) | ((all_tops[rand() & 0x07]) << 4);
	ld	bc, #_window_components_on_current_floor+0
	ld	a, c
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	jr	NC, 00126$
	inc	b
00126$:
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
	ld	e, (hl)
	push	bc
	push	de
	call	_rand
	ld	a, e
	pop	de
	pop	bc
	and	a, #0x07
	ld	d, #0x00
	add	a, #<(_all_tops)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	adc	a, #>(_all_tops)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	or	a, e
	ld	(bc), a
;src/scene.c:516: walker_byte |= (0x01 << i);
	ld	hl, #_i
	ld	b, (hl)
	ld	a, #0x01
	inc	b
	jr	00128$
00127$:
	add	a, a
00128$:
	dec	b
	jr	NZ,00127$
	ld	hl, #_walker_byte
	or	a, (hl)
	ld	(hl), a
;src/scene.c:517: return;
	ret
00103$:
;src/scene.c:511: for ( i = 0; i < 4; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00105$
;src/scene.c:519: }
	ret
;src/scene.c:521: void mend_incorrect_windows(void){
;	---------------------------------
; Function mend_incorrect_windows
; ---------------------------------
_mend_incorrect_windows::
	dec	sp
;src/scene.c:522: if(malloc_i == 4){
	ld	a, (#_malloc_i)
	sub	a, #0x04
	jr	Z, 00108$
;src/scene.c:523: return;
;src/scene.c:526: if(window_components_on_current_floor[malloc_i] == 0x45){
	ld	bc, #_window_components_on_current_floor+0
	ld	a, c
	ld	hl, #_malloc_i
	add	a, (hl)
	ld	c, a
	jr	NC, 00140$
	inc	b
00140$:
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	sub	a, #0x45
	jr	NZ, 00104$
;src/scene.c:527: window_components_on_current_floor[malloc_i] = 0x05; //no shingles above a cloth rack
	ld	a, #0x05
	ld	(bc), a
;src/scene.c:528: return;
	jr	00108$
00104$:
;src/scene.c:530: if((window_components_on_current_floor[malloc_i] & 0x0F) == 0x03 && (map_components[camera_y_clamped][malloc_i].components & 0xF0) == 0x30){
	ldhl	sp,	#0
	ld	a, (hl)
	and	a, #0x0f
	sub	a, #0x03
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
	sub	a, #0x30
	jr	NZ, 00108$
;src/scene.c:531: window_components_on_current_floor[malloc_i] &= 0xF0; //no spikes above an awning
	ldhl	sp,	#0
	ld	a, (hl)
	and	a, #0xf0
	ld	(bc), a
;src/scene.c:533: return;
00108$:
;src/scene.c:535: }
	inc	sp
	ret
;src/scene.c:537: void fill_memory(void){
;	---------------------------------
; Function fill_memory
; ---------------------------------
_fill_memory::
	add	sp, #-3
;src/scene.c:539: if(malloc_i == 4){
	ld	a, (#_malloc_i)
	sub	a, #0x04
	jr	NZ, 00102$
;src/scene.c:540: walker_byte |= 0x80;
	ld	hl, #_walker_byte
	ld	a, (hl)
	or	a, #0x80
	ld	(hl), a
;src/scene.c:541: return;
	jp	00103$
00102$:
;src/scene.c:544: memcpy_rect((malloc_i << 2) + 16, base, 4, 12);
	ld	a, (#_malloc_i)
	add	a, a
	add	a, a
	add	a, #0x10
	ld	c, a
	ld	hl, #0xc04
	push	hl
	ld	de, #_base
	ld	a, c
	call	_memcpy_rect
;src/scene.c:545: memcpy_rect(malloc_i << 2, top_info[(uint8_t)(window_components_on_current_floor[malloc_i] >> 4)].map, 4, (top_info[(uint8_t)(window_components_on_current_floor[malloc_i] >> 4)].h)<<2);
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
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	sla	l
	sla	l
	ld	d, a
	ld	e, #0x04
	push	de
	ld	e, c
	ld	d, b
	ld	a, l
	call	_memcpy_rect
;src/scene.c:546: memcpy_rect((malloc_i << 2) + ((bot_info[window_components_on_current_floor[malloc_i] & 0x0F].y_offset - 1)<<4), bot_info[window_components_on_current_floor[malloc_i] & 0x0F].map, 4, (bot_info[window_components_on_current_floor[malloc_i] & 0x0F].h)<<2);
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
	ld	c, a
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	d, a
	ld	e, #0x04
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	call	_memcpy_rect
;src/scene.c:548: malloc_i++;
	ld	hl, #_malloc_i
	inc	(hl)
00103$:
;src/scene.c:549: }
	add	sp, #3
	ret
;src/scene.c:551: void memcpy_rect(uint8_t wm_pos, uint8_t * p_src, uint8_t src_width, uint8_t size_bytes){
;	---------------------------------
; Function memcpy_rect
; ---------------------------------
_memcpy_rect::
	add	sp, #-4
	ld	c, a
;src/scene.c:555: uint8_t * map_pointer = window_map + wm_pos;
	ld	hl, #_window_map
	ld	b, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
;src/scene.c:556: cur_row = src_width;
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(#_memcpy_rect_cur_row_65536_298),a
;src/scene.c:557: uint8_t dest_next_row_start = 16U/*dest_width*/ - src_width; // only do this calc once
	ld	a, #0x10
	ldhl	sp,	#6
	sub	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/scene.c:559: while (size_bytes--) {
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#7
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
;src/scene.c:560: *map_pointer++ = *(p_src++);
	ld	a, (de)
	inc	de
	ld	(bc), a
	inc	bc
;src/scene.c:561: cur_row--;
	ld	hl, #_memcpy_rect_cur_row_65536_298
;src/scene.c:562: if (cur_row == 0) {
	dec	(hl)
	jr	NZ, 00103$
;src/scene.c:563: map_pointer += dest_next_row_start;   
	ldhl	sp,	#0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
;src/scene.c:564: cur_row = src_width;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_memcpy_rect_cur_row_65536_298),a
	jr	00103$
00106$:
;src/scene.c:567: }
	add	sp, #4
	pop	hl
	pop	af
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
