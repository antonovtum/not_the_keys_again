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
	.globl _deactivate_planters_flag
	.globl _planters_drop_flag
	.globl _planters_position_y
	.globl _planters_position_x
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
	.globl _shake_planters
	.globl _move_sprites_down
	.globl _animate_weeds
	.globl _gen_new_floor
	.globl _add_clothes_to_rag
	.globl _add_planter
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
_global_timer:
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
_planters_position_x::
	.ds 2
_planters_position_y::
	.ds 2
_planters_drop_flag::
	.ds 2
_deactivate_planters_flag::
	.ds 1
_weeds_frame_counter:
	.ds 1
_is_generated:
	.ds 1
_memcpy_rect_cur_row_65536_437:
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
;src/scene.c:125: void load_map(void){
;	---------------------------------
; Function load_map
; ---------------------------------
_load_map::
;src/scene.c:126: set_bkg_data(0, 112U, hub_data);
	ld	de, #_hub_data
	push	de
	ld	hl, #0x7000
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scene.c:127: set_bkg_tiles(map_pos_x, 20U, 20u, 30u, hub_map);
	ld	de, #_hub_map
	push	de
	ld	hl, #0x1e14
	push	hl
	ld	hl, #0x1401
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scene.c:128: camera_y = 0;
	ld	hl, #_camera_y
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1378: SCX_REG=x, SCY_REG=y;
	ld	a, #0x08
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;src/scene.c:130: set_sprite_data(0x82, 4, planter_box);
	ld	de, #_planter_box
	push	de
	ld	hl, #0x482
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scene.c:133: set_sprite_data(29, 8, extra_sprites);
	ld	de, #_extra_sprites
	push	de
	ld	hl, #0x81d
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scene.c:134: clothes_position[0] = 56;
	ld	hl, #_clothes_position
	ld	(hl), #0x38
;src/scene.c:135: clothes_position[1] = 136;
	ld	hl, #(_clothes_position + 1)
	ld	(hl), #0x88
;src/scene.c:136: clothes_position[2] = 136;
	ld	hl, #(_clothes_position + 2)
	ld	(hl), #0x88
;src/scene.c:137: clothes_position[3] = 136;
	ld	bc, #_clothes_position + 3
	ld	a, #0x88
	ld	(bc), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), #0x1d
;src/scene.c:139: move_sprite(16, 10, clothes_position[0] - camera_y);
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
;src/scene.c:141: move_sprite(17, 13, clothes_position[1] - camera_y);
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
;src/scene.c:143: move_sprite(18, 67, clothes_position[2] - camera_y);
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
;src/scene.c:145: move_sprite(19, 155, clothes_position[3] - camera_y);
	ld	a, (bc)
	ld	hl, #_camera_y
	sub	a, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 76)
	ld	(hl+), a
	ld	(hl), #0x9b
;src/scene.c:147: weeds_frame_counter = 0;
	ld	hl, #_weeds_frame_counter
	ld	(hl), #0x00
;src/scene.c:148: clothes_speed = 0b11100100;
	ld	hl, #_clothes_speed
	ld	(hl), #0xe4
;src/scene.c:149: deactivate_weeds_flag = 0;
	ld	hl, #_deactivate_weeds_flag
	ld	(hl), #0x00
;src/scene.c:151: planters_drop_flag[0] = 0;
	ld	bc, #_planters_drop_flag+0
	xor	a, a
	ld	(bc), a
;src/scene.c:152: planters_drop_flag[1] = 0;
	inc	bc
	xor	a, a
	ld	(bc), a
;src/scene.c:153: deactivate_planters_flag = 0x03;
	ld	hl, #_deactivate_planters_flag
	ld	(hl), #0x03
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1905: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 104)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 108)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 112)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 116)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 120)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 124)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 128)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 132)
	ld	(hl), #0x00
;src/scene.c:161: hide_sprite(0x21);
;src/scene.c:162: }
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
	.dw _bot_map_00
	.db #0x01	; 1
	.db #0x34	; 52	'4'
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x06	; 6
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
	.db #0x04	; 4
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
;src/scene.c:164: void scene_init(void){
;	---------------------------------
; Function scene_init
; ---------------------------------
_scene_init::
	add	sp, #-27
;src/scene.c:165: load_map();
	call	_load_map
;src/scene.c:167: set_bkg_data(112U, 13, numbers);
	ld	de, #_numbers
	push	de
	ld	hl, #0xd70
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scene.c:168: set_bkg_data(0x7D, 5, partly_broken_bricks);
	ld	de, #_partly_broken_bricks
	push	de
	ld	hl, #0x57d
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scene.c:171: global_timer = 0;
	ld	hl, #_global_timer
	ld	(hl), #0x00
;src/scene.c:173: old_camera_y = 0;
	ld	hl, #_old_camera_y
	ld	(hl), #0x00
;src/scene.c:174: frames_to_move = 40;
	ld	hl, #_frames_to_move
	ld	(hl), #0x28
;src/scene.c:175: current_cam_frame = 0;
	ld	hl, #_current_cam_frame
	ld	(hl), #0x00
;src/scene.c:176: accelerate_cam_flag = 0;
	ld	hl, #_accelerate_cam_flag
	ld	(hl), #0x00
;src/scene.c:177: game_started_flag = false;
	ld	hl, #_game_started_flag
	ld	(hl), #0x00
;src/scene.c:178: game_ended_flag = false;
	ld	hl, #_game_ended_flag
	ld	(hl), #0x00
;src/scene.c:180: is_generated = false;
	ld	hl, #_is_generated
	ld	(hl), #0x00
;src/scene.c:182: rect ground = {0U, 152U, 0xFF, 23U, SOLID};
	ldhl	sp,	#0
	xor	a, a
	ld	(hl+), a
	ld	a, #0x98
	ld	(hl+), a
	ld	a, #0xff
	ld	(hl+), a
	ld	a, #0x17
	ld	(hl+), a
;src/scene.c:183: rect dumpster = {103U, 146U, 35U, 32U, TRAVERSABLE};
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
;src/scene.c:184: rect vending_machine = {132U, 146U, 32U, 49U, SOLID};
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
;src/scene.c:185: rect ledge = {12U, 88U, 0x98, 19U, INIT_FLAG}; //prev 154
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
	ld	(hl), #0x07
;src/scene.c:187: next_assignable_rect_index = 0U;
	ld	hl, #_next_assignable_rect_index
	ld	(hl), #0x00
;src/scene.c:189: empty_window_status.components = 0x00;
	ldhl	sp,	#20
;src/scene.c:190: empty_window_status.status = 0x00;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scene.c:191: for (i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00102$:
;src/scene.c:194: collider = top_info[1].collider;
	ld	de, #0x0005
	push	de
	ld	bc, #(_top_info + 13)
	ld	hl, #24
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/scene.c:195: collider.x += (3 + (i<<2)) << 3;
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
;src/scene.c:196: collider.y += 8;
	ld	(hl+), a
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
;src/scene.c:197: rect_list[0][0x07 & (i<<1 | 0x01)] = collider;
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
;src/scene.c:200: collider = bot_info[1].collider;
	ld	de, #0x0005
	push	de
	ld	bc, #(_bot_info + 13)
	ld	hl, #24
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/scene.c:201: collider.x += (3 + (i<<2)) << 3;
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
;src/scene.c:202: collider.y += 8;
	ld	(hl+), a
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
;src/scene.c:203: rect_list[0][0x07 & (i<<1)] = collider;
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
;src/scene.c:206: map_components[i][0] = empty_window_status;
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
;src/scene.c:207: map_components[i][1] = empty_window_status;
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
;src/scene.c:208: map_components[i][2] = empty_window_status;
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
;src/scene.c:209: map_components[i][3] = empty_window_status;
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
;src/scene.c:191: for (i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jp	C, 00102$
;src/scene.c:213: rect_list[1][0x00] = ledge;
	ld	de, #0x0005
	push	de
	ld	hl, #17
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 40)
	call	___memcpy
;src/scene.c:214: rect_list[1][0x01] = dumpster;
	ld	de, #0x0005
	push	de
	ld	hl, #7
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 45)
	call	___memcpy
;src/scene.c:215: rect_list[1][0x02] = vending_machine;
	ld	de, #0x0005
	push	de
	ld	hl, #12
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 50)
	call	___memcpy
;src/scene.c:216: rect_list[1][0x03] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 55)
	call	___memcpy
;src/scene.c:217: rect_list[1][0x04] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 60)
	call	___memcpy
;src/scene.c:218: rect_list[1][0x05] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 65)
	call	___memcpy
;src/scene.c:219: rect_list[1][0x06] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 70)
	call	___memcpy
;src/scene.c:220: rect_list[1][0x07] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 75)
	call	___memcpy
;src/scene.c:222: rect_list[2][0x00] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 80)
	call	___memcpy
;src/scene.c:223: rect_list[2][0x01] = vending_machine;
	ld	de, #0x0005
	push	de
	ld	hl, #12
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 85)
	call	___memcpy
;src/scene.c:224: rect_list[2][0x02] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 90)
	call	___memcpy
;src/scene.c:225: rect_list[2][0x03] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 95)
	call	___memcpy
;src/scene.c:226: rect_list[2][0x04] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 100)
	call	___memcpy
;src/scene.c:227: rect_list[2][0x05] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 105)
	call	___memcpy
;src/scene.c:228: rect_list[2][0x06] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 110)
	call	___memcpy
;src/scene.c:229: rect_list[2][0x07] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 115)
	call	___memcpy
;src/scene.c:231: rect_list[3][0x00] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 120)
	call	___memcpy
;src/scene.c:232: rect_list[3][0x01] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 125)
	call	___memcpy
;src/scene.c:233: rect_list[3][0x02] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 130)
	call	___memcpy
;src/scene.c:234: rect_list[3][0x03] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 135)
	call	___memcpy
;src/scene.c:235: rect_list[3][0x04] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 140)
	call	___memcpy
;src/scene.c:236: rect_list[3][0x05] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 145)
	call	___memcpy
;src/scene.c:237: rect_list[3][0x06] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 150)
	call	___memcpy
;src/scene.c:238: rect_list[3][0x07] = ground;
	ld	de, #0x0005
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	de, #(_rect_list + 155)
	call	___memcpy
;src/scene.c:240: window_components_on_current_floor[0] = 0x11;
	ld	hl, #_window_components_on_current_floor
	ld	(hl), #0x11
;src/scene.c:241: window_components_on_current_floor[1] = 0x11;
	ld	hl, #(_window_components_on_current_floor + 1)
	ld	(hl), #0x11
;src/scene.c:242: window_components_on_current_floor[2] = 0x11;
	ld	hl, #(_window_components_on_current_floor + 2)
	ld	(hl), #0x11
;src/scene.c:243: window_components_on_current_floor[3] = 0x11;
	ld	hl, #(_window_components_on_current_floor + 3)
	ld	(hl), #0x11
;src/scene.c:245: r = 0x00;
	ld	hl, #_r
	ld	(hl), #0x00
;src/scene.c:246: rand_init = false;
	ld	hl, #_rand_init
	ld	(hl), #0x00
;src/scene.c:249: walker_byte = 0x00;
	ld	hl, #_walker_byte
	ld	(hl), #0x00
;src/scene.c:250: malloc_i = 0;
	ld	hl, #_malloc_i
	ld	(hl), #0x00
;src/scene.c:272: }
	add	sp, #27
	ret
;src/scene.c:274: void compute_scene_frame(void){
;	---------------------------------
; Function compute_scene_frame
; ---------------------------------
_compute_scene_frame::
;src/scene.c:284: if((walker_byte & 0xCF) != 0xCF){
	ld	a, (#_walker_byte)
	and	a, #0xcf
	sub	a, #0xcf
	jr	Z, 00104$
;src/scene.c:285: if(rand_init)next_map_gen_step();
	ld	hl, #_rand_init
	bit	0, (hl)
	jr	Z, 00104$
	call	_next_map_gen_step
00104$:
;src/scene.c:287: move_camera();
	call	_move_camera
;src/scene.c:289: animate_weeds();
	call	_animate_weeds
;src/scene.c:291: global_timer++;
	ld	hl, #_global_timer
	inc	(hl)
;src/scene.c:292: }
	ret
;src/scene.c:294: void move_camera(void){
;	---------------------------------
; Function move_camera
; ---------------------------------
_move_camera::
;src/scene.c:295: if(!game_started_flag) return;
	ld	hl, #_game_started_flag
	bit	0, (hl)
	ret	Z
;src/scene.c:297: current_cam_frame++;
	ld	hl, #_current_cam_frame
	inc	(hl)
;src/scene.c:298: accelerate_cam_flag++;
	ld	hl, #_accelerate_cam_flag
	inc	(hl)
;src/scene.c:300: if(current_cam_frame >= (frames_to_move >> 3)){
	ld	hl, #_frames_to_move
	ld	c, (hl)
	srl	c
	srl	c
	srl	c
	ld	hl, #_current_cam_frame
	ld	a, (hl)
	sub	a, c
	jr	C, 00104$
;src/scene.c:301: current_cam_frame = 0;
	ld	(hl), #0x00
;src/scene.c:302: camera_y--;
	ld	hl, #_camera_y
	dec	(hl)
;src/scene.c:303: set_camera();
	call	_set_camera
00104$:
;src/scene.c:306: shake_planters();
	call	_shake_planters
;src/scene.c:307: move_sprites_down();
	call	_move_sprites_down
;src/scene.c:309: if(accelerate_cam_flag == 0xFF && frames_to_move > 16U){
	ld	a, (#_accelerate_cam_flag)
	inc	a
	ret	NZ
	ld	a, #0x10
	ld	hl, #_frames_to_move
	sub	a, (hl)
	ret	NC
;src/scene.c:310: frames_to_move--;
	dec	(hl)
;src/scene.c:312: }
	ret
;src/scene.c:314: void set_camera(void){
;	---------------------------------
; Function set_camera
; ---------------------------------
_set_camera::
;src/scene.c:315: move_bkg(8, camera_y);
	ld	hl, #_camera_y
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1378: SCX_REG=x, SCY_REG=y;
	ld	a, #0x08
	ldh	(_SCX_REG + 0), a
	ld	a, c
	ldh	(_SCY_REG + 0), a
;src/scene.c:317: camera_y_clamped = (((camera_y-1) >> 3) & 0x1F) >> 3;
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
;src/scene.c:318: old_camera_y_clamped = (((old_camera_y) >> 3) & 0x1F) >> 3;
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
;src/scene.c:319: if(camera_y_clamped != old_camera_y_clamped){
	ld	a, (#_camera_y_clamped)
	ld	hl, #_old_camera_y_clamped
	sub	a, (hl)
	ret	Z
;src/scene.c:320: gen_new_floor();
	call	_gen_new_floor
;src/scene.c:321: old_camera_y = camera_y-1;
	ld	a, (#_camera_y)
	dec	a
	ld	(#_old_camera_y),a
;src/scene.c:323: }
	ret
;src/scene.c:325: void shake_planters(void){
;	---------------------------------
; Function shake_planters
; ---------------------------------
_shake_planters::
;src/scene.c:326: if(!(deactivate_planters_flag & 0x01)){
	ld	a, (#_deactivate_planters_flag)
	rrca
	jr	C, 00108$
;src/scene.c:327: if(((planters_drop_flag[0]) >> 3) & 0x01){
	ld	de, #_planters_drop_flag+0
	ld	a, (de)
	ld	c, a
	rrca
	rrca
	rrca
	and	a,#0x01
	jr	Z, 00108$
;src/scene.c:328: if((planters_drop_flag[0] & 0x0F) != 0x0F){
	ld	a, c
	and	a, #0x0f
	sub	a, #0x0f
	jr	Z, 00108$
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1905: shadow_OAM[nb].y = 0;
	ld	bc, #_shadow_OAM+120
	xor	a, a
	ld	(bc), a
	ld	bc, #_shadow_OAM+124
	xor	a, a
	ld	(bc), a
;src/scene.c:333: if (!(global_timer & 0x03))
	ld	hl, #_global_timer
	ld	c, (hl)
	ld	a, c
	and	a, #0x03
	jr	NZ, 00102$
;src/scene.c:335: planters_drop_flag[0] = (planters_drop_flag[0] & 0xF8) | ((planters_drop_flag[0] + 1) & 0x07);
	ld	a, (de)
	push	af
	and	a, #0xf8
	ld	c, a
	pop	af
	inc	a
	and	a, #0x07
	or	a, c
	ld	(de), a
;src/scene.c:336: planter_x = planters_position_x[0];
	ld	hl, #_planters_position_x
	ld	c, (hl)
;src/scene.c:337: shadow_OAM[0x1A].x = planter_x;
	ld	hl, #(_shadow_OAM + 105)
	ld	(hl), c
;src/scene.c:338: shadow_OAM[0x1B].x = planter_x + 8;
	ld	de, #_shadow_OAM+109
	ld	a, c
	add	a, #0x08
	ld	(de), a
;src/scene.c:339: return;
	ret
00102$:
;src/scene.c:341: planter_x = (global_timer & 0x02) ? planters_position_x[0] + 1 : planters_position_x[0] - 2;
	bit	1, c
	jr	Z, 00123$
	ld	a, (#_planters_position_x + 0)
	inc	a
	jr	00124$
00123$:
	ld	a, (#_planters_position_x + 0)
	dec	a
	dec	a
00124$:
	ld	c, a
;src/scene.c:342: shadow_OAM[0x1A].x = planter_x;
	ld	hl, #(_shadow_OAM + 105)
	ld	(hl), c
;src/scene.c:343: shadow_OAM[0x1B].x = planter_x + 8;
	ld	de, #_shadow_OAM+109
	ld	a, c
	add	a, #0x08
	ld	(de), a
00108$:
;src/scene.c:354: if(!(deactivate_planters_flag & 0x02)){
	ld	a, (#_deactivate_planters_flag)
	bit	1, a
	ret	NZ
;src/scene.c:355: if(((planters_drop_flag[1]) >> 3) & 0x01){
	ld	de, #_planters_drop_flag+1
	ld	a, (de)
	ld	c, a
	rrca
	rrca
	rrca
	and	a,#0x01
	ret	Z
;src/scene.c:356: if((planters_drop_flag[1] & 0x0F) != 0x0F){
	ld	a, c
	and	a, #0x0f
	sub	a, #0x0f
	ret	Z
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1905: shadow_OAM[nb].y = 0;
	ld	bc, #_shadow_OAM+128
	xor	a, a
	ld	(bc), a
	ld	bc, #_shadow_OAM+132
	xor	a, a
	ld	(bc), a
;src/scene.c:333: if (!(global_timer & 0x03))
	ld	hl, #_global_timer
	ld	c, (hl)
;src/scene.c:361: if (!(global_timer & 0x03))
	ld	a, c
	and	a, #0x03
	jr	NZ, 00110$
;src/scene.c:363: planters_drop_flag[1] = (planters_drop_flag[1] & 0xF8) | ((planters_drop_flag[1] + 1) & 0x07);
	ld	a, (de)
	push	af
	and	a, #0xf8
	ld	c, a
	pop	af
	inc	a
	and	a, #0x07
	or	a, c
	ld	(de), a
;src/scene.c:364: planter_x = planters_position_x[1];
	ld	hl, #(_planters_position_x + 1)
	ld	c, (hl)
;src/scene.c:365: shadow_OAM[0x1C].x = planter_x;
	ld	hl, #(_shadow_OAM + 113)
	ld	(hl), c
;src/scene.c:366: shadow_OAM[0x1D].x = planter_x + 8;
	ld	de, #_shadow_OAM+117
	ld	a, c
	add	a, #0x08
	ld	(de), a
;src/scene.c:367: return;
	ret
00110$:
;src/scene.c:369: planter_x = (global_timer & 0x02) ? planters_position_x[1] + 1 : planters_position_x[1] - 2;
	bit	1, c
	jr	Z, 00125$
	ld	a, (#(_planters_position_x + 1) + 0)
	inc	a
	jr	00126$
00125$:
	ld	a, (#(_planters_position_x + 1) + 0)
	dec	a
	dec	a
00126$:
	ld	c, a
;src/scene.c:370: shadow_OAM[0x1C].x = planter_x;
	ld	hl, #(_shadow_OAM + 113)
	ld	(hl), c
;src/scene.c:371: shadow_OAM[0x1D].x = planter_x + 8;
	ld	de, #_shadow_OAM+117
	ld	a, c
	add	a, #0x08
	ld	(de), a
;src/scene.c:381: }
	ret
;src/scene.c:383: void move_sprites_down(void){
;	---------------------------------
; Function move_sprites_down
; ---------------------------------
_move_sprites_down::
	dec	sp
;src/scene.c:385: for(i=0; i<4; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00138$:
;src/scene.c:387: if(((deactivate_weeds_flag >> (i << 1)) & 0x03)){continue;}
	ld	a, (#_i)
	add	a, a
	ld	b, a
	ld	hl, #_deactivate_weeds_flag
	ld	c, (hl)
	inc	b
	jr	00247$
00246$:
	srl	c
00247$:
	dec	b
	jr	NZ, 00246$
	ld	a, c
	and	a, #0x03
	jp	NZ,00110$
;src/scene.c:388: if(get_sprite_tile(16 + i) > 32){
	ld	a, (#_i)
	add	a, #0x10
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1815: return shadow_OAM[nb].tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	c, (hl)
;src/scene.c:388: if(get_sprite_tile(16 + i) > 32){
	ld	a, #0x20
	sub	a, c
	jr	NC, 00106$
;src/scene.c:389: clothes_position[0 + i] += ((clothes_speed >> (i<<1)) & 0x03) << 1;
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
	jr	00251$
00250$:
	srl	d
00251$:
	dec	a
	jr	NZ, 00250$
	ld	a, d
	and	a, #0x03
	add	a, a
	add	a, e
	ld	(bc), a
;src/scene.c:390: if((weeds_frame_counter >> 1) & 0x01){
	ld	a, (#_weeds_frame_counter)
	rrca
	and	a,#0x01
	jr	Z, 00106$
;src/scene.c:391: shadow_OAM[16 + i].y = 160; //hide the sprite without modyfying the x coord
	ld	bc, #_shadow_OAM+0
	ld	hl, #_i
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #0x0010
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	(hl), #0xa0
;src/scene.c:392: continue;
	jr	00110$
00106$:
;src/scene.c:396: shadow_OAM[16 + i].y = clothes_position[0 + i] - camera_y;
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
;src/scene.c:397: if((uint8_t)(clothes_position[0 + i] - camera_y) >= 152 && (uint8_t)(clothes_position[0 + i] - camera_y) < 170){
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
;src/scene.c:398: deactivate_weeds_flag |= 0b00000001 << (i<<1);
	ld	hl, #_i
	ld	c, (hl)
	ld	a, c
	add	a, a
	ld	e, a
	ld	b, e
	ld	a, #0x01
	inc	b
	jr	00253$
00252$:
	add	a, a
00253$:
	dec	b
	jr	NZ,00252$
	ld	hl, #_deactivate_weeds_flag
	or	a, (hl)
	ld	(hl), a
;src/scene.c:399: clothes_speed &= ~(0b00000011 << (i<<1));
	ld	a, #0x03
	inc	e
	jr	00255$
00254$:
	add	a, a
00255$:
	dec	e
	jr	NZ,00254$
	cpl
	ld	hl, #_clothes_speed
	and	a, (hl)
	ld	(hl), a
;src/scene.c:400: hide_sprite(16+i);
	ld	a, c
	add	a, #0x10
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1905: shadow_OAM[nb].y = 0;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	(hl), #0x00
;src/scene.c:400: hide_sprite(16+i);
00110$:
;src/scene.c:385: for(i=0; i<4; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jp	C, 00138$
;src/scene.c:403: if(!(deactivate_planters_flag & 0x01)){
	ld	a, (#_deactivate_planters_flag)
	rrca
	jp	C,00119$
;src/scene.c:404: if ((uint8_t)(planters_position_y[0]-camera_y) >= 152 && (uint8_t)(planters_position_y[0]-camera_y) < 170)
	ld	hl, #_planters_position_y
	ld	c, (hl)
	ld	a, c
	ld	hl, #_camera_y
	sub	a, (hl)
	cp	a, #0x98
	jr	C, 00115$
	sub	a, #0xaa
	jr	NC, 00115$
;src/scene.c:406: deactivate_planters_flag |= 0x01;
	ld	hl, #_deactivate_planters_flag
	ld	a, (hl)
	or	a, #0x01
	ld	(hl), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1905: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 104)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 108)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 120)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 124)
	ld	(hl), #0x00
;src/scene.c:410: hide_sprite(0x1F);
	jr	00119$
00115$:
;src/scene.c:412: if ((planters_drop_flag[0] & 0x0F) == 0x0F)
	ld	a, (#_planters_drop_flag + 0)
	and	a, #0x0f
	sub	a, #0x0f
	jr	NZ, 00113$
;src/scene.c:414: planters_position_y[0] += 2;
	inc	c
	inc	c
	ld	hl, #_planters_position_y
	ld	(hl), c
;src/scene.c:415: uint8_t planter_floor = planters_drop_flag[0] >> 6;
	ld	a, (#_planters_drop_flag + 0)
	push	af
	rlca
	rlca
	and	a, #0x03
	ld	c, a
	pop	af
;src/scene.c:416: uint8_t planter_window = (planters_drop_flag[0] >> 3) & 0x06; //0x00000XX0
	swap	a
	rlca
	and	a, #0x6
	ldhl	sp,	#0
	ld	(hl), a
;src/scene.c:417: rect_list[planter_floor][planter_window].type = INACTIVE;
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
	ldhl	sp,	#0
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	h, #0x00
	add	hl, bc
	ld	bc, #0x0004
	add	hl, bc
	ld	(hl), #0x02
00113$:
;src/scene.c:421: shadow_OAM[0x1A].y = planters_position_y[0] - camera_y;
	ld	bc, #_shadow_OAM+104
	ld	a, (#_planters_position_y + 0)
	ld	hl, #_camera_y
	sub	a, (hl)
	ld	(bc), a
;src/scene.c:422: shadow_OAM[0x1B].y = planters_position_y[0] - camera_y;
	ld	bc, #_shadow_OAM+108
	ld	a, (#_planters_position_y + 0)
	sub	a, (hl)
	ld	(bc), a
;src/scene.c:423: shadow_OAM[0x1E].y = (planters_position_y[0] - 8) - camera_y;
	ld	bc, #_shadow_OAM+120
	ld	a, (#_planters_position_y + 0)
	add	a, #0xf8
	ld	e, (hl)
	sub	a, e
	ld	(bc), a
;src/scene.c:424: shadow_OAM[0x1F].y = (planters_position_y[0] - 8) - camera_y;
	ld	bc, #_shadow_OAM+124
	ld	a, (#_planters_position_y + 0)
	add	a, #0xf8
	ld	e, (hl)
	sub	a, e
	ld	(bc), a
00119$:
;src/scene.c:427: if(!(deactivate_planters_flag & 0x02)){
	ld	a, (#_deactivate_planters_flag)
	bit	1, a
	jp	NZ,00139$
;src/scene.c:428: if ((uint8_t)(planters_position_y[1]-camera_y) >= 152 && (uint8_t)(planters_position_y[1]-camera_y) < 170)
	ld	hl, #(_planters_position_y + 1)
	ld	c, (hl)
	ld	a, c
	ld	hl, #_camera_y
	sub	a, (hl)
	cp	a, #0x98
	jr	C, 00123$
	sub	a, #0xaa
	jr	NC, 00123$
;src/scene.c:430: deactivate_planters_flag |= 0x02;
	ld	hl, #_deactivate_planters_flag
	ld	a, (hl)
	or	a, #0x02
	ld	(hl), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1905: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 112)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 116)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 128)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 132)
	ld	(hl), #0x00
;src/scene.c:434: hide_sprite(0x21);
	jr	00139$
00123$:
;src/scene.c:436: if ((planters_drop_flag[1] & 0x0F) == 0x0F)
	ld	a, (#(_planters_drop_flag + 1) + 0)
	and	a, #0x0f
	sub	a, #0x0f
	jr	NZ, 00121$
;src/scene.c:438: planters_position_y[1] += 2;
	inc	c
	inc	c
	ld	hl, #(_planters_position_y + 1)
	ld	(hl), c
;src/scene.c:439: uint8_t planter_floor = planters_drop_flag[1] >> 6;
	ld	a, (#(_planters_drop_flag + 1) + 0)
	push	af
	rlca
	rlca
	and	a, #0x03
	ld	c, a
	pop	af
;src/scene.c:440: uint8_t planter_window = (planters_drop_flag[1] >> 3) & 0x06; //0x00000XX0
	swap	a
	rlca
	and	a, #0x6
	ldhl	sp,	#0
	ld	(hl), a
;src/scene.c:441: rect_list[planter_floor][planter_window].type = INACTIVE;
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
	ldhl	sp,	#0
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	h, #0x00
	add	hl, bc
	ld	bc, #0x0004
	add	hl, bc
	ld	(hl), #0x02
00121$:
;src/scene.c:446: shadow_OAM[0x1C].y = planters_position_y[1] - camera_y;
	ld	a, (#(_planters_position_y + 1) + 0)
	ld	hl, #_camera_y
	sub	a, (hl)
	ld	(#(_shadow_OAM + 112)),a
;src/scene.c:447: shadow_OAM[0x1D].y = planters_position_y[1] - camera_y;
	ld	a, (#(_planters_position_y + 1) + 0)
	ld	hl, #_camera_y
	sub	a, (hl)
	ld	(#(_shadow_OAM + 116)),a
;src/scene.c:448: shadow_OAM[0x20].y = (planters_position_y[1] - 8) - camera_y;
	ld	a, (#(_planters_position_y + 1) + 0)
	add	a, #0xf8
	ld	hl, #_camera_y
	ld	c, (hl)
	sub	a, c
	ld	(#(_shadow_OAM + 128)),a
;src/scene.c:449: shadow_OAM[0x21].y = (planters_position_y[1] - 8) - camera_y;
	ld	a, (#(_planters_position_y + 1) + 0)
	add	a, #0xf8
	ld	hl, #_camera_y
	ld	c, (hl)
	sub	a, c
	ld	(#(_shadow_OAM + 132)),a
00139$:
;src/scene.c:452: }
	inc	sp
	ret
;src/scene.c:454: void animate_weeds(void){
;	---------------------------------
; Function animate_weeds
; ---------------------------------
_animate_weeds::
;src/scene.c:455: weeds_frame_counter++;
	ld	hl, #_weeds_frame_counter
	inc	(hl)
;src/scene.c:456: if(deactivate_weeds_flag != 0x00 || is_generated){
	ld	a, (#_deactivate_weeds_flag)
	or	a, a
	ret	NZ
	ld	hl, #_is_generated
	bit	0, (hl)
;src/scene.c:457: return;
	ret	NZ
;src/scene.c:459: if(weeds_frame_counter >= 15){
	ld	hl, #_weeds_frame_counter
	ld	a, (hl)
	sub	a, #0x0f
	ret	C
;src/scene.c:460: weeds_frame_counter = 0;
	ld	(hl), #0x00
;src/scene.c:462: clothes_speed = ((clothes_speed + 0b00000001) & 0b00000011)
	ld	hl, #_clothes_speed
	ld	b, (hl)
	ld	a, b
	inc	a
	and	a, #0x03
	ld	c, a
;src/scene.c:463: | ((clothes_speed + 0b00000100) & 0b00001100)
	ld	a, b
	inc	a
	inc	a
	inc	a
	inc	a
	and	a, #0x0c
	or	a, c
	ld	c, a
;src/scene.c:464: | ((clothes_speed + 0b00010000) & 0b00110000)
	ld	a, b
	add	a, #0x10
	and	a, #0x30
	or	a, c
	ld	c, a
;src/scene.c:465: | ((clothes_speed + 0b01000000) & 0b11000000);
	ld	a, b
	add	a, #0x40
	and	a, #0xc0
	or	a, c
	ld	(hl), a
;src/scene.c:467: set_sprite_tile(16, 29 + ((clothes_speed >> 7) & 0x01));
	ld	a, (hl)
	rlca
	and	a, #0x01
	add	a, #0x1d
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), c
;src/scene.c:468: set_sprite_tile(17, 29 + ((clothes_speed >> 5) & 0x01));
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
;src/scene.c:469: set_sprite_tile(18, 29 + ((clothes_speed >> 3) & 0x01));
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
;src/scene.c:470: set_sprite_tile(19, 29 + ((clothes_speed >> 1) & 0x01));
	ld	a, (#_clothes_speed)
	rrca
	and	a, #0x01
	add	a, #0x1d
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
	ld	(hl), c
;src/scene.c:470: set_sprite_tile(19, 29 + ((clothes_speed >> 1) & 0x01));
;src/scene.c:472: }
	ret
;src/scene.c:474: void gen_new_floor(void){
;	---------------------------------
; Function gen_new_floor
; ---------------------------------
_gen_new_floor::
	add	sp, #-9
;src/scene.c:475: if(!rand_init) {
	ld	hl, #_rand_init
	bit	0, (hl)
	jr	NZ, 00103$
;src/scene.c:476: initrand(r);
	ld	hl, #_r
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	call	_initrand
	pop	hl
;src/scene.c:477: rand_init = true;
	ld	hl, #_rand_init
	ld	(hl), #0x01
;src/scene.c:482: while((walker_byte & 0xCF) != 0xCF){
00103$:
	ld	a, (#_walker_byte)
	and	a, #0xcf
	sub	a, #0xcf
	jr	Z, 00105$
;src/scene.c:484: next_map_gen_step();
	call	_next_map_gen_step
	jr	00103$
00105$:
;src/scene.c:487: walker_byte &= 0x30;
	ld	hl, #_walker_byte
	ld	a, (hl)
	and	a, #0x30
	ld	(hl), a
;src/scene.c:488: malloc_i = 0;
	ld	hl, #_malloc_i
	ld	(hl), #0x00
;src/scene.c:490: if(!is_generated){
	ld	hl, #_is_generated
	bit	0, (hl)
	jr	NZ, 00109$
;src/scene.c:491: set_bkg_tiles(map_pos_x, camera_y_clamped << 3, 20, base_floor_map_height, floor_map);
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
;src/scene.c:492: if(camera_y_clamped == 0) is_generated = true;    
	ld	a, (#_camera_y_clamped)
	or	a, a
	jr	NZ, 00109$
	ld	hl, #_is_generated
	ld	(hl), #0x01
00109$:
;src/scene.c:495: uint8_t y_draw = (camera_y_clamped << 3);
	ld	a, (#_camera_y_clamped)
	add	a, a
	add	a, a
	add	a, a
;src/scene.c:497: set_bkg_tiles(3, y_draw + 1, 16, 6, window_map);
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
;src/scene.c:501: for ( i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00116$:
;src/scene.c:505: collider = top_info[(uint8_t)(window_components_on_current_floor[i] >> 4)].collider;
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
;src/scene.c:506: collider.x += (3 + (i<<2)) << 3;
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
;src/scene.c:507: collider.y += (1 + y_draw) << 3;
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
;src/scene.c:508: rect_list[camera_y_clamped][0x07 & (i<<1 | 0x01)] = collider;
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
;src/scene.c:511: collider = bot_info[window_components_on_current_floor[i] & 0x0F].collider;
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
;src/scene.c:512: collider.x += (3 + (i<<2)) << 3;
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
;src/scene.c:513: collider.y += (1 + y_draw) << 3;
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#8
	add	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;src/scene.c:514: rect_list[camera_y_clamped][0x07 & (i<<1)] = collider;
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
;src/scene.c:518: temp_window.components = window_components_on_current_floor[i];
	ld	a, #<(_window_components_on_current_floor)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_window_components_on_current_floor)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ldhl	sp,	#5
;src/scene.c:519: temp_window.status = 0x00;
	ld	(hl+), a
	ld	(hl), #0x00
;src/scene.c:522: if((window_components_on_current_floor[i] & 0x0F) == 0x05){
	ld	a, #<(_window_components_on_current_floor)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_window_components_on_current_floor)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	and	a, #0x0f
	cp	a, #0x05
	jr	NZ, 00113$
;src/scene.c:523: add_clothes_to_rag(&temp_window);
	ld	hl, #5
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_add_clothes_to_rag
	jr	00114$
00113$:
;src/scene.c:524: } else if ((window_components_on_current_floor[i] & 0x0F) == 0x04){
	sub	a, #0x04
	jr	NZ, 00114$
;src/scene.c:525: add_planter(&temp_window);
	ld	hl, #5
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_add_planter
00114$:
;src/scene.c:527: map_components[camera_y_clamped][i] = temp_window;
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
;src/scene.c:501: for ( i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jp	C, 00116$
;src/scene.c:529: }
	add	sp, #9
	ret
;src/scene.c:531: void add_clothes_to_rag(window_status* temp_window){
;	---------------------------------
; Function add_clothes_to_rag
; ---------------------------------
_add_clothes_to_rag::
	add	sp, #-7
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scene.c:532: if(game_ended_flag) return;
	ld	hl, #_game_ended_flag
	bit	0, (hl)
	jp	NZ,00123$
;src/scene.c:533: uint8_t temp_rand = rand();
	call	_rand
	ldhl	sp,	#2
	ld	(hl), e
;src/scene.c:534: uint8_t particle_x = ((3 + (i<<2)) << 3) + 8u;
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
;src/scene.c:535: uint8_t particle_y = (((camera_y_clamped << 3) + 5) << 3) + 17u;
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
;src/scene.c:537: uint8_t rack_status = 0x00;
	ldhl	sp,	#6
	ld	(hl), #0x00
;src/scene.c:538: if((temp_rand >> 1) & 0x01){
	ldhl	sp,	#2
	ld	a, (hl)
	rrca
	and	a,#0x01
	jp	Z, 00107$
;src/scene.c:540: for(object_sprite = 0; object_sprite < 4; object_sprite++){
	inc	hl
	ld	(hl), #0x00
	ld	e, #0x00
00119$:
;src/scene.c:541: if((deactivate_weeds_flag >> (object_sprite << 1)) & 0x03){
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
;src/scene.c:543: deactivate_weeds_flag ^= 0b00000001 << (object_sprite << 1);
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
;src/scene.c:544: set_sprite_tile(16 + object_sprite, possible_clothes[(temp_rand & 0x01)]);
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
;src/scene.c:545: clothes_position[object_sprite] = particle_y;
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
;src/scene.c:546: move_sprite(16 + object_sprite, particle_x, particle_y - camera_y);
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
;src/scene.c:547: clothes_speed &= ~(0b00000011 << (i<<1));
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
;src/scene.c:550: rack_status |= object_sprite;
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, #0x08
	ldhl	sp,	#6
	ld	(hl), a
;src/scene.c:551: break;
	jr	00107$
00120$:
;src/scene.c:540: for(object_sprite = 0; object_sprite < 4; object_sprite++){
	inc	e
	ldhl	sp,	#3
	ld	(hl), e
	ld	a, e
	sub	a, #0x04
	jp	C, 00119$
00107$:
;src/scene.c:556: particle_x += 8;
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x08
;src/scene.c:557: if((temp_rand >> 3) & 0x01){
	ld	(hl+), a
	ld	a, (hl)
	rrca
	rrca
	rrca
	and	a,#0x01
	jp	Z, 00114$
;src/scene.c:559: for(object_sprite = 0; object_sprite < 4; object_sprite++){
	ld	c, #0x00
	ld	e, c
00121$:
;src/scene.c:560: if((deactivate_weeds_flag >> (object_sprite << 1)) & 0x03){
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
;src/scene.c:562: deactivate_weeds_flag ^= 0b00000001 << (object_sprite << 1);
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
;src/scene.c:563: set_sprite_tile(16 + object_sprite, possible_clothes[((temp_rand>>2) & 0x01)]);
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
;src/scene.c:564: clothes_position[object_sprite] = particle_y;
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
;src/scene.c:565: move_sprite(16 + object_sprite, particle_x, particle_y - camera_y);
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
;src/scene.c:566: clothes_speed &= ~(0b00000011 << (i<<1));
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
;src/scene.c:568: rack_status |= 0b00000100;
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(hl), a
	set	2, (hl)
;src/scene.c:569: if((rack_status & 0b00001000) == 0x00){
	push	hl
	bit	3, (hl)
	pop	hl
	jr	NZ, 00114$
;src/scene.c:570: rack_status |= object_sprite;
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, c
	ld	(hl), a
;src/scene.c:572: break;
	jr	00114$
00122$:
;src/scene.c:559: for(object_sprite = 0; object_sprite < 4; object_sprite++){
	inc	e
	ld	a,e
	ld	c,a
	sub	a, #0x04
	jp	C, 00121$
00114$:
;src/scene.c:585: temp_window->status = (temp_window->status & 0xF0) | rack_status; 
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
;src/scene.c:586: }
	add	sp, #7
	ret
;src/scene.c:588: void add_planter(window_status* temp_window){
;	---------------------------------
; Function add_planter
; ---------------------------------
_add_planter::
	add	sp, #-14
	ldhl	sp,	#12
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/scene.c:589: if(game_ended_flag) return;
	ld	hl, #_game_ended_flag
	bit	0, (hl)
	jp	NZ,00116$
;src/scene.c:593: if(deactivate_planters_flag & 0x01){
	ld	a, (#_deactivate_planters_flag)
	bit	0, a
	jr	Z, 00107$
;src/scene.c:594: h_sprite = 0;
	ld	c, #0x00
;src/scene.c:595: planters_drop_flag[0] = 0x00;
	ld	hl, #_planters_drop_flag
	ld	(hl), #0x00
;src/scene.c:596: deactivate_planters_flag &= 0b11111110;
	ld	hl, #_deactivate_planters_flag
	ld	a, (hl)
	and	a, #0xfe
	ld	(hl), a
	jr	00108$
00107$:
;src/scene.c:598: else if(deactivate_planters_flag & 0x02){
	bit	1, a
	jp	Z,00116$
;src/scene.c:599: h_sprite = 1;
	ld	c, #0x01
;src/scene.c:600: planters_drop_flag[1] = 0x00;
	ld	hl, #(_planters_drop_flag + 1)
	ld	(hl), #0x00
;src/scene.c:601: deactivate_planters_flag &= 0b11111101;
	ld	hl, #_deactivate_planters_flag
	ld	a, (hl)
	and	a, #0xfd
	ld	(hl), a
;src/scene.c:603: else{return;}
00108$:
;src/scene.c:605: uint8_t planter_x = ((3 + (i<<2)) << 3) + 8u;
	ld	a, (#_i)
	add	a, a
	add	a, a
	add	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x08
	ldhl	sp,	#2
	ld	(hl), a
;src/scene.c:606: uint8_t planter_y = (((camera_y_clamped << 3) + 5) << 3) + 17u;
	ld	a, (#_camera_y_clamped)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x05
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x11
	ldhl	sp,	#3
;src/scene.c:608: planters_position_x[h_sprite] = planter_x;
	ld	(hl-), a
	ld	a, #<(_planters_position_x)
	add	a, c
	ld	e, a
	ld	a, #>(_planters_position_x)
	adc	a, #0x00
	ld	d, a
;src/scene.c:609: planters_position_y[h_sprite] = planter_y;
	ld	a, (hl+)
	ld	(de), a
	ld	a, #<(_planters_position_y)
	add	a, c
	ld	e, a
	ld	a, #>(_planters_position_y)
	adc	a, #0x00
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;src/scene.c:611: move_metasprite(planter, 0, 0x1A + (h_sprite << 1), planter_x, planter_y-camera_y);
	ld	a, (hl)
	ld	hl, #_camera_y
	sub	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#4
	ld	(hl), c
	ld	a, (hl)
	add	a, a
	ldhl	sp,	#11
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x1a
	ldhl	sp,	#1
	ld	(hl), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_planter)
	inc	hl
	ld	(hl), #>(_planter)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl-), a
	ld	(hl), #0x00
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#5
	ld	a, (hl+)
	inc	hl
	or	a, (hl)
	inc	hl
	inc	hl
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#1
	ld	a, (hl)
	call	___move_metasprite
;src/scene.c:614: OBP1_REG = DMG_PALETTE(DMG_WHITE, DMG_WHITE, DMG_LITE_GRAY, DMG_BLACK);
	ld	a, #0xd0
	ldh	(_OBP1_REG + 0), a
;src/scene.c:615: set_sprite_tile(0x1E + (h_sprite << 1), 0x84 + (rand() & 0x01));
	call	_rand
	ld	a, e
	and	a, #0x01
	add	a, #0x84
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#11
	ld	a, (hl)
	add	a, #0x1e
	ldhl	sp,	#5
	ld	(hl), a
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#9
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00141$:
	ldhl	sp,	#9
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00141$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
;src/scene.c:616: set_sprite_tile(0x1F + (h_sprite << 1), 0x84 + (rand() & 0x01));
	call	_rand
	ldhl	sp,#10
	ld	(hl), e
	ld	a, (hl)
	and	a, #0x01
	add	a, #0x84
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#11
	ld	a, (hl)
	add	a, #0x1f
	ldhl	sp,	#6
	ld	(hl), a
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00142$:
	ldhl	sp,	#10
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00142$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
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
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(de), a
;src/scene.c:618: set_sprite_prop(0x1E + (h_sprite << 1), (0x10 | (rand() & 0x08)));
	call	_rand
	ld	a, e
	and	a, #0x08
	or	a, #0x10
	ldhl	sp,	#7
	ld	(hl-), a
	dec	hl
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1850: shadow_OAM[nb].prop=prop;
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00143$:
	ldhl	sp,	#10
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00143$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
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
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(de), a
;src/scene.c:619: set_sprite_prop(0x1F + (h_sprite << 1), (0x10 | (rand() & 0x08)));
	call	_rand
	ldhl	sp,#11
	ld	(hl), e
	ld	a, (hl)
	and	a, #0x08
	or	a, #0x10
	ldhl	sp,	#7
	ld	(hl-), a
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1850: shadow_OAM[nb].prop=prop;
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00144$:
	ldhl	sp,	#10
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00144$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
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
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(de), a
;src/scene.c:621: move_sprite(0x1E + (h_sprite << 1), planter_x, (planter_y - 8) - camera_y);
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
	ld	a, (hl-)
	add	a, #0xf8
	ld	(hl), a
	ld	hl, #_camera_y
	ld	c, (hl)
	ldhl	sp,	#10
	ld	a, (hl+)
	sub	a, c
	ld	(hl), a
	ldhl	sp,	#5
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00145$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00145$
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
;src/scene.c:622: move_sprite(0x1F + (h_sprite << 1), planter_x + 8, (planter_y - 8) - camera_y);
	ld	a, (#_camera_y)
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, (hl)
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x08
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#6
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl+)
	inc	hl
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00146$:
	ldhl	sp,	#6
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00146$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl)
	ld	(de), a
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/scene.c:630: temp_window->status = (temp_window->status & 0xF0) | (h_sprite << 3); 
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	and	a, #0xf0
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#11
	ld	(hl), a
	ld	a, (hl-)
	or	a, (hl)
	inc	hl
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl)
	ld	(de), a
00116$:
;src/scene.c:631: }
	add	sp, #14
	ret
;src/scene.c:633: void next_map_gen_step(void){
;	---------------------------------
; Function next_map_gen_step
; ---------------------------------
_next_map_gen_step::
;src/scene.c:640: if((walker_byte & 0x40) != 0x40){
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
;src/scene.c:642: update_walker();
	jp	NZ,_update_walker
;src/scene.c:643: } else if((walker_byte & 0x4F) != 0x4F){
	ld	a, c
	and	a, #0x4f
	ld	c, a
	ld	b, #0x00
	ld	a, c
	sub	a, #0x4f
	or	a, b
;src/scene.c:645: fill_window();
	jp	NZ,_fill_window
;src/scene.c:648: mend_incorrect_windows();
	call	_mend_incorrect_windows
;src/scene.c:650: fill_memory();
;src/scene.c:652: }
	jp	_fill_memory
;src/scene.c:654: void update_walker(void){
;	---------------------------------
; Function update_walker
; ---------------------------------
_update_walker::
	add	sp, #-4
;src/scene.c:656: if(!(walker_byte & 0x0F)){
	ld	hl, #_walker_byte
	ld	c, (hl)
	ld	a, c
	and	a, #0x0f
	jr	NZ, 00118$
;src/scene.c:657: walker_byte |= (0x01 << (CURRENT_WINDOW & 0x03));
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
;src/scene.c:658: window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (traversable_bots[rand() & 0x03]) | ((bulky_tops[rand() & 0x03]) << 4);
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
;src/scene.c:662: else if(((CURRENT_WINDOW & 0x01) && ((VISITED_WINDOWS & 0x05) == 0x05)) || (!(CURRENT_WINDOW & 0x01) && ((VISITED_WINDOWS & 0x0A) == 0x0A))){
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
;src/scene.c:663: walker_byte |= 0x40;
	ld	hl, #_walker_byte
	ld	a, (hl)
	or	a, #0x40
;src/scene.c:664: window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (window_components_on_current_floor[CURRENT_WINDOW & 0x03] & 0x0F) | (uint8_t)((traversable_tops[(rand() & 0x03)]) << 4);   
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
;src/scene.c:668: else if(TURNING_PROB < (uint8_t)rand()){
	call	_rand
	ld	a, #0xaf
	sub	a, e
	jr	NC, 00109$
;src/scene.c:670: walker_byte |= 0x40;
	ld	hl, #_walker_byte
	ld	a, (hl)
	or	a, #0x40
;src/scene.c:671: window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (window_components_on_current_floor[CURRENT_WINDOW & 0x03] & 0x0F) | (uint8_t)((traversable_tops[(rand() & 0x03)]) << 4);
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
;src/scene.c:675: if((rand() & 0x01) && !((VISITED_WINDOWS >> ((CURRENT_WINDOW + 1) & 0x03)) & 0x01)) { //if we want to go right and right is empty
	call	_rand
;src/scene.c:657: walker_byte |= (0x01 << (CURRENT_WINDOW & 0x03));
	ld	a, (#_walker_byte)
	swap	a
	and	a, #0x0f
	ldhl	sp,	#0
	ld	(hl), a
;src/scene.c:677: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
	ld	hl, #_walker_byte
	ld	c, (hl)
;src/scene.c:680: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW - 1) & 0x03) << 4);
	ldhl	sp,	#0
	ld	a, (hl+)
;src/scene.c:677: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
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
;src/scene.c:675: if((rand() & 0x01) && !((VISITED_WINDOWS >> ((CURRENT_WINDOW + 1) & 0x03)) & 0x01)) { //if we want to go right and right is empty
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
;src/scene.c:677: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_walker_byte),a
	jr	00106$
00105$:
;src/scene.c:678: } else if (!((VISITED_WINDOWS >> ((CURRENT_WINDOW - 1) & 0x03)) & 0x01)){ //if left is empty
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
;src/scene.c:680: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW - 1) & 0x03) << 4);
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
;src/scene.c:683: walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_walker_byte),a
00106$:
;src/scene.c:685: walker_byte |= (0x01 << CURRENT_WINDOW);
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
;src/scene.c:686: window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (bulky_bots[rand() & 0x03]) | ((bulky_tops[rand() & 0x03]) << 4);
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
;src/scene.c:688: }
	add	sp, #4
	ret
;src/scene.c:690: void fill_window(void){
;	---------------------------------
; Function fill_window
; ---------------------------------
_fill_window::
;src/scene.c:692: for ( i = 0; i < 4; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00105$:
;src/scene.c:693: if((VISITED_WINDOWS >> i) & 0x01) {
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
;src/scene.c:696: window_components_on_current_floor[i] = (all_bots[rand() & 0x07]) | ((all_tops[rand() & 0x07]) << 4);
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
;src/scene.c:697: walker_byte |= (0x01 << i);
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
;src/scene.c:698: return;
	ret
00103$:
;src/scene.c:692: for ( i = 0; i < 4; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00105$
;src/scene.c:700: }
	ret
;src/scene.c:702: void mend_incorrect_windows(void){
;	---------------------------------
; Function mend_incorrect_windows
; ---------------------------------
_mend_incorrect_windows::
	dec	sp
;src/scene.c:703: if(malloc_i == 4){
	ld	a, (#_malloc_i)
	sub	a, #0x04
	jr	Z, 00108$
;src/scene.c:704: return;
;src/scene.c:707: if(window_components_on_current_floor[malloc_i] == 0x45){
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
;src/scene.c:708: window_components_on_current_floor[malloc_i] = 0x05; //no shingles above a cloth rack
	ld	a, #0x05
	ld	(bc), a
;src/scene.c:709: return;
	jr	00108$
00104$:
;src/scene.c:711: if((window_components_on_current_floor[malloc_i] & 0x0F) == 0x03 && (map_components[camera_y_clamped][malloc_i].components & 0xF0) == 0x30){
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
;src/scene.c:712: window_components_on_current_floor[malloc_i] &= 0xF0; //no spikes above an awning
	ldhl	sp,	#0
	ld	a, (hl)
	and	a, #0xf0
	ld	(bc), a
;src/scene.c:714: return;
00108$:
;src/scene.c:716: }
	inc	sp
	ret
;src/scene.c:718: void fill_memory(void){
;	---------------------------------
; Function fill_memory
; ---------------------------------
_fill_memory::
	add	sp, #-3
;src/scene.c:720: if(malloc_i == 4){
	ld	a, (#_malloc_i)
	sub	a, #0x04
	jr	NZ, 00102$
;src/scene.c:721: walker_byte |= 0x80;
	ld	hl, #_walker_byte
	ld	a, (hl)
	or	a, #0x80
	ld	(hl), a
;src/scene.c:722: return;
	jp	00103$
00102$:
;src/scene.c:725: memcpy_rect((malloc_i << 2) + 16, base, 4, 12);
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
;src/scene.c:726: memcpy_rect(malloc_i << 2, top_info[(uint8_t)(window_components_on_current_floor[malloc_i] >> 4)].map, 4, (top_info[(uint8_t)(window_components_on_current_floor[malloc_i] >> 4)].h)<<2);
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
;src/scene.c:727: memcpy_rect((malloc_i << 2) + ((bot_info[window_components_on_current_floor[malloc_i] & 0x0F].y_offset - 1)<<4), bot_info[window_components_on_current_floor[malloc_i] & 0x0F].map, 4, (bot_info[window_components_on_current_floor[malloc_i] & 0x0F].h)<<2);
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
;src/scene.c:729: malloc_i++;
	ld	hl, #_malloc_i
	inc	(hl)
00103$:
;src/scene.c:730: }
	add	sp, #3
	ret
;src/scene.c:732: void memcpy_rect(uint8_t wm_pos, uint8_t * p_src, uint8_t src_width, uint8_t size_bytes){
;	---------------------------------
; Function memcpy_rect
; ---------------------------------
_memcpy_rect::
	add	sp, #-4
	ld	c, a
;src/scene.c:736: uint8_t * map_pointer = window_map + wm_pos;
	ld	hl, #_window_map
	ld	b, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
;src/scene.c:737: cur_row = src_width;
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(#_memcpy_rect_cur_row_65536_437),a
;src/scene.c:738: uint8_t dest_next_row_start = 16U/*dest_width*/ - src_width; // only do this calc once
	ld	a, #0x10
	ldhl	sp,	#6
	sub	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/scene.c:740: while (size_bytes--) {
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
;src/scene.c:741: *map_pointer++ = *(p_src++);
	ld	a, (de)
	inc	de
	ld	(bc), a
	inc	bc
;src/scene.c:742: cur_row--;
	ld	hl, #_memcpy_rect_cur_row_65536_437
;src/scene.c:743: if (cur_row == 0) {
	dec	(hl)
	jr	NZ, 00103$
;src/scene.c:744: map_pointer += dest_next_row_start;   
	ldhl	sp,	#0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
;src/scene.c:745: cur_row = src_width;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_memcpy_rect_cur_row_65536_437),a
	jr	00103$
00106$:
;src/scene.c:748: }
	add	sp, #4
	pop	hl
	pop	af
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
