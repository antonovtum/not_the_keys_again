;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module player
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _hide_sprites_range
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _joypad
	.globl _play_boing_sfx
	.globl _stop_hurt_sfx
	.globl _play_hurt_sfx
	.globl _play_break_sfx
	.globl _play_bump_sfx
	.globl _stop_jump_sfx
	.globl _play_jump_sfx
	.globl _stop_sfx
	.globl _score
	.globl _current_state
	.globl _player_y
	.globl _player_x
	.globl _is_facing_right
	.globl _a_not_pressed
	.globl _player_dead_flag
	.globl _clamp_y_velocity
	.globl _clamp_x_velocity
	.globl _jump_power
	.globl _impulse
	.globl _fall_g
	.globl _jump_g
	.globl _player_init
	.globl _compute_player_frame
	.globl _render_player
	.globl _end_frame
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_player_dead_flag::
	.ds 1
_frame_counter:
	.ds 1
_current_frame:
	.ds 1
_a_not_pressed::
	.ds 1
_i:
	.ds 1
_joy:
	.ds 1
_x_force:
	.ds 1
_x_speed:
	.ds 2
_is_facing_right::
	.ds 1
_is_grounded:
	.ds 1
_is_jumping:
	.ds 1
_y_speed:
	.ds 1
_player_x::
	.ds 2
_player_y::
	.ds 1
_last_x:
	.ds 2
_last_y:
	.ds 1
_current_state::
	.ds 1
_current_coyote_frames:
	.ds 1
_score::
	.ds 2
_max_player_y:
	.ds 1
_test_max_player_y:
	.ds 1
_highest_visited_floor:
	.ds 1
_next_free_puff:
	.ds 1
_brick_frame:
	.ds 1
_brick_y_speed:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_puff_frame:
	.ds 4
_rect_functions:
	.ds 14
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
;src/player.c:129: void player_init(void)
;	---------------------------------
; Function player_init
; ---------------------------------
_player_init::
;src/player.c:131: player_dead_flag = false;
	ld	hl, #_player_dead_flag
	ld	(hl), #0x00
;src/player.c:133: OBP0_REG = 0xE4; //11100100
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
;src/player.c:136: set_sprite_data(TILE_NUM_START, PLAYER_SPRITES, playerSprites);
	ld	de, #_playerSprites
	push	de
	ld	hl, #0x1800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/player.c:137: set_sprite_data(PLAYER_SPRITES, 3, Sfx);
	ld	de, #_Sfx
	push	de
	ld	hl, #0x318
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/player.c:139: frame_counter = 0;
	ld	hl, #_frame_counter
	ld	(hl), #0x00
;src/player.c:140: current_frame = 0;
	ld	hl, #_current_frame
	ld	(hl), #0x00
;src/player.c:141: current_state = PLAYER_STATE_IDLE;
	ld	hl, #_current_state
	ld	(hl), #0x00
;src/player.c:142: x_force = 0U;
	ld	hl, #_x_force
	ld	(hl), #0x00
;src/player.c:143: x_speed = 0U;
	xor	a, a
	ld	hl, #_x_speed
	ld	(hl+), a
	ld	(hl), a
;src/player.c:144: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
;src/player.c:145: player_x = last_x = PX_TO_SUB(16U);
	ld	hl, #_last_x
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x10
	ld	hl, #_player_x
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x10
;src/player.c:146: player_y = last_y = 128U;
	ld	hl, #_last_y
	ld	(hl), #0x80
	ld	hl, #_player_y
	ld	(hl), #0x80
;src/player.c:147: is_facing_right = true;
	ld	hl, #_is_facing_right
	ld	(hl), #0x01
;src/player.c:148: is_grounded = true;
	ld	hl, #_is_grounded
	ld	(hl), #0x01
;src/player.c:149: next_free_puff = 0;
	ld	hl, #_next_free_puff
	ld	(hl), #0x00
;src/player.c:150: score = 0;
	xor	a, a
	ld	hl, #_score
	ld	(hl+), a
	ld	(hl), a
;src/player.c:151: highest_visited_floor = 1;
	ld	hl, #_highest_visited_floor
	ld	(hl), #0x01
;src/player.c:152: max_player_y = 0;
	ld	hl, #_max_player_y
	ld	(hl), #0x00
;src/player.c:153: a_not_pressed = true;
	ld	hl, #_a_not_pressed
	ld	(hl), #0x01
;src/player.c:154: current_coyote_frames = 0;
	ld	hl, #_current_coyote_frames
	ld	(hl), #0x00
;src/player.c:155: joy = 0;
	ld	hl, #_joy
	ld	(hl), #0x00
;src/player.c:156: move_metasprite(idle_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
	ld	hl, #_idle_metasprites
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), c
	inc	hl
	ld	(hl), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	de, #0x8010
	xor	a, a
	call	___move_metasprite
;src/player.c:158: set_sprite_data(0x1B, 2, brick_particle);
	ld	de, #_brick_particle
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	ld	a, #0x1b
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x1b
	ld	hl, #(_shadow_OAM + 54)
	ld	(hl), #0x1b
	ld	hl, #(_shadow_OAM + 58)
	ld	(hl), #0x1c
	ld	hl, #(_shadow_OAM + 62)
	ld	(hl), #0x1c
;src/player.c:163: brick_frame = 0;
	ld	hl, #_brick_frame
	ld	(hl), #0x00
;src/player.c:164: }
	ret
_jump_g:
	.db #0x02	; 2
_fall_g:
	.db #0x04	; 4
_impulse:
	.db #0x18	; 24
_jump_power:
	.db #0xdd	; -35
_clamp_x_velocity:
	.dw #0x0200
_clamp_y_velocity:
	.db #0x14	;  20
;src/player.c:166: void compute_player_frame(void)
;	---------------------------------
; Function compute_player_frame
; ---------------------------------
_compute_player_frame::
;src/player.c:168: if(current_state == PLAYER_STATE_HURT){
	ld	a, (#_current_state)
	sub	a, #0x04
	jr	NZ, 00104$
;src/player.c:169: hurt_frame();
	call	_hurt_frame
	jr	00105$
00104$:
;src/player.c:172: retrieve_input();
	call	_retrieve_input
;src/player.c:174: if(player_dead_flag) return;
	ld	hl, #_player_dead_flag
	bit	0, (hl)
	ret	NZ
;src/player.c:176: calculate_physics();
	call	_calculate_physics
00105$:
;src/player.c:182: check_collisions();
	call	_check_collisions
;src/player.c:183: if(y_speed > 0 && (current_state != PLAYER_STATE_HURT && current_state != PLAYER_STATE_FALLING)){
	ld	hl, #_y_speed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00166$
	bit	7, d
	jr	NZ, 00167$
	cp	a, a
	jr	00167$
00166$:
	bit	7, d
	jr	Z, 00167$
	scf
00167$:
	jr	NC, 00107$
	ld	a,(#_current_state)
	cp	a,#0x04
	jr	Z, 00107$
	sub	a, #0x03
	jr	Z, 00107$
;src/player.c:184: switch_state(PLAYER_STATE_FALLING);
	ld	a, #0x03
	call	_switch_state
;src/player.c:185: is_grounded = false;
	ld	hl, #_is_grounded
	ld	(hl), #0x00
;src/player.c:186: is_jumping = false;
	ld	hl, #_is_jumping
	ld	(hl), #0x00
00107$:
;src/player.c:189: if(current_state == PLAYER_STATE_FALLING && current_coyote_frames < COYOTE_FRAMES) current_coyote_frames++;
	ld	a, (#_current_state)
	sub	a, #0x03
	jr	NZ, 00111$
	ld	hl, #_current_coyote_frames
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00111$
	inc	(hl)
00111$:
;src/player.c:191: update_score();
	call	_update_score
;src/player.c:193: last_x = player_x;
	ld	a, (#_player_x)
	ld	(#_last_x),a
	ld	a, (#_player_x + 1)
	ld	(#_last_x + 1),a
;src/player.c:194: last_y = player_y;
	ld	a, (#_player_y)
	ld	(#_last_y),a
;src/player.c:196: render_all_particles();
	call	_render_all_particles
;src/player.c:198: render_player();
	call	_render_player
;src/player.c:200: end_frame();
;src/player.c:201: }
	jp	_end_frame
;src/player.c:203: static void retrieve_input(void){
;	---------------------------------
; Function retrieve_input
; ---------------------------------
_retrieve_input:
;src/player.c:204: joy = joypad();
	call	_joypad
;src/player.c:205: if (joy & J_RIGHT)
	ld	(#_joy),a
	bit	0, a
	jr	Z, 00120$
;src/player.c:207: if(is_grounded)switch_state(PLAYER_STATE_RUNNING);
	ld	hl, #_is_grounded
	bit	0, (hl)
	jr	Z, 00102$
	ld	a, #0x01
	call	_switch_state
00102$:
;src/player.c:208: if (!is_facing_right && x_speed)
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	NZ, 00104$
	ld	hl, #_x_speed + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00104$
;src/player.c:210: x_force = 0;
	ld	hl, #_x_force
	ld	(hl), #0x00
	jr	00121$
00104$:
;src/player.c:214: is_facing_right = true;
	ld	hl, #_is_facing_right
	ld	(hl), #0x01
;src/player.c:215: x_force = impulse;
	ld	hl, #_x_force
	ld	(hl), #0x18
	jr	00121$
00120$:
;src/player.c:218: else if (joy & J_LEFT)
	bit	1, a
	jr	Z, 00117$
;src/player.c:220: if(is_grounded)switch_state(PLAYER_STATE_RUNNING);
	ld	hl, #_is_grounded
	bit	0, (hl)
	jr	Z, 00108$
	ld	a, #0x01
	call	_switch_state
00108$:
;src/player.c:221: if (is_facing_right && x_speed)
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	Z, 00110$
	ld	hl, #_x_speed + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00110$
;src/player.c:223: x_force = 0;
	ld	hl, #_x_force
	ld	(hl), #0x00
	jr	00121$
00110$:
;src/player.c:227: is_facing_right = false;
	ld	hl, #_is_facing_right
	ld	(hl), #0x00
;src/player.c:228: x_force = impulse;
	ld	hl, #_x_force
	ld	(hl), #0x18
	jr	00121$
00117$:
;src/player.c:233: x_force = 0;
	ld	hl, #_x_force
	ld	(hl), #0x00
;src/player.c:234: if((!x_speed) && (!y_speed)) switch_state(PLAYER_STATE_IDLE);
	ld	hl, #_x_speed + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00121$
	ld	a, (#_y_speed)
	or	a,a
	jr	NZ, 00121$
	call	_switch_state
00121$:
;src/player.c:205: if (joy & J_RIGHT)
	ld	a, (#_joy)
;src/player.c:236: if ((joy & J_A && a_not_pressed) && (is_grounded || current_coyote_frames < COYOTE_FRAMES) && (y_speed >= 0))
	and	a, #0x10
	ld	c, a
	or	a, a
	jr	Z, 00127$
	ld	hl, #_a_not_pressed
	bit	0, (hl)
	jr	Z, 00127$
	ld	hl, #_is_grounded
	bit	0, (hl)
	jr	NZ, 00132$
	ld	a, (#_current_coyote_frames)
	sub	a, #0x04
	jr	NC, 00127$
00132$:
	ld	a, (#_y_speed)
	bit	7, a
	jr	NZ, 00127$
;src/player.c:238: switch_state(PLAYER_STATE_JUMPING);
	ld	a, #0x02
	call	_switch_state
;src/player.c:239: play_jump_sfx();
	call	_play_jump_sfx
;src/player.c:240: a_not_pressed = false;
	ld	hl, #_a_not_pressed
	ld	(hl), #0x00
;src/player.c:241: y_speed = jump_power;
	ld	hl, #_y_speed
	ld	(hl), #0xdd
;src/player.c:242: is_grounded = false;
	ld	hl, #_is_grounded
	ld	(hl), #0x00
;src/player.c:243: is_jumping = true;
	ld	hl, #_is_jumping
	ld	(hl), #0x01
	jr	00128$
00127$:
;src/player.c:245: else if ((!(joy & J_A) || y_speed > 0) && !is_grounded)
	ld	a, c
	or	a, a
	jr	Z, 00125$
	ld	hl, #_y_speed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00258$
	bit	7, d
	jr	NZ, 00259$
	cp	a, a
	jr	00259$
00258$:
	bit	7, d
	jr	Z, 00259$
	scf
00259$:
	jr	NC, 00128$
00125$:
	ld	hl, #_is_grounded
	bit	0, (hl)
	jr	NZ, 00128$
;src/player.c:247: switch_state(PLAYER_STATE_FALLING);
	ld	a, #0x03
	call	_switch_state
;src/player.c:248: stop_jump_sfx();
	call	_stop_jump_sfx
;src/player.c:249: is_jumping = false;
	ld	hl, #_is_jumping
	ld	(hl), #0x00
00128$:
;src/player.c:251: if(!(joy & J_A)) a_not_pressed = true;
	ld	a, (#_joy)
	bit	4, a
	ret	NZ
	ld	hl, #_a_not_pressed
	ld	(hl), #0x01
;src/player.c:252: }
	ret
;src/player.c:254: static void calculate_physics(void){
;	---------------------------------
; Function calculate_physics
; ---------------------------------
_calculate_physics:
	dec	sp
	dec	sp
;src/player.c:259: player_x = is_facing_right ? player_x + (x_speed) /*+ (x_force >> 2)*/ : player_x - (x_speed) /*- (x_force >> 2)*/;
	ld	a, (#_x_speed)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_x_speed + 1)
	ldhl	sp,	#1
	ld	(hl), a
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	Z, 00111$
	pop	de
	push	de
	ld	hl, #_player_x
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	jr	00112$
00111$:
	ld	hl, #_player_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
00112$:
	ld	hl, #_player_x
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:260: if((uint8_t)(SUB_TO_PX(player_x) - 10U) > 160U) {
	ld	a, (hl)
	add	a, #0xf6
	ld	c, a
	ld	a, #0xa0
	sub	a, c
	jr	NC, 00105$
;src/player.c:261: if((uint8_t)(SUB_TO_PX(player_x) - 10U) < 200) player_x = player_x - (160U << 8); //right exit
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0xc8
	jr	NC, 00102$
	dec	hl
	ld	c, e
	ld	a,b
	add	a,#0x60
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00105$
00102$:
;src/player.c:262: else player_x = player_x + (160U << 8); //left exit
	ld	a, b
	add	a, #0xa0
	ld	hl, #_player_x
	ld	(hl), e
	inc	hl
	ld	(hl), a
00105$:
;src/player.c:267: x_speed = x_speed >= clamp_x_velocity ? clamp_x_velocity : x_speed + x_force;
	ld	hl, #_x_speed
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/player.c:264: if (x_force)
	ld	a, (#_x_force)
	or	a, a
	jr	Z, 00107$
;src/player.c:267: x_speed = x_speed >= clamp_x_velocity ? clamp_x_velocity : x_speed + x_force;
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, #0x00
	ld	a, (hl)
	sbc	a, #0x02
	jr	C, 00113$
	ld	bc, #0x0200
	jr	00114$
00113$:
	ld	hl, #_x_force
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
00114$:
	ld	hl, #_x_speed
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00108$
00107$:
;src/player.c:272: x_speed = x_speed <= 0 ? 0 : MAX(0, x_speed - (impulse<<1));
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00195$
	bit	7, d
	jr	NZ, 00196$
	cp	a, a
	jr	00196$
00195$:
	bit	7, d
	jr	Z, 00196$
	scf
00196$:
	jr	C, 00115$
	ld	bc, #0x0000
	jr	00116$
00115$:
	ld	a, c
	add	a, #0xd0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	bit	7, b
	jr	Z, 00117$
	ld	bc, #0x0000
00117$:
00116$:
	ld	hl, #_x_speed
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00108$:
;src/player.c:275: player_y += (y_speed >> (PHYSICS_DAMPNER + 1)) + ((is_jumping ? jump_g : fall_g) >> 2);
	ld	hl, #_y_speed
	ld	c, (hl)
	sra	c
	sra	c
	sra	c
	ld	hl, #_is_jumping
	bit	0, (hl)
	ld	a, #0x02
	jr	NZ, 00120$
	ld	a, #0x04
00120$:
	rrca
	rrca
	and	a, #0x3f
	add	a, c
	ld	hl, #_player_y
	ld	c, (hl)
	add	a, c
	ld	(hl), a
;src/player.c:278: y_speed = y_speed >= clamp_y_velocity ? clamp_y_velocity : y_speed + (is_jumping ? jump_g : fall_g);
	ld	a, (#_y_speed)
	xor	a, #0x80
	sub	a, #0x94
	jr	C, 00121$
	ld	a, #0x14
	jr	00122$
00121$:
	ld	hl, #_is_jumping
	bit	0, (hl)
	ld	a, #0x02
	jr	NZ, 00124$
	ld	a, #0x04
00124$:
	ld	hl, #_y_speed
	add	a, (hl)
00122$:
	ld	(#_y_speed),a
;src/player.c:279: }
	inc	sp
	inc	sp
	ret
;src/player.c:281: void render_player(void){
;	---------------------------------
; Function render_player
; ---------------------------------
_render_player::
	add	sp, #-8
;src/player.c:285: if(!player_dead_flag && (uint8_t)(player_y - camera_y) > 160U) {
	ld	a, (#_player_y)
	ld	hl, #_camera_y
	sub	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ld	hl, #_player_dead_flag
	bit	0, (hl)
	jr	NZ, 00102$
	ld	a, #0xa0
	ldhl	sp,	#7
	sub	a, (hl)
	jr	NC, 00102$
;src/player.c:286: player_dead_flag = true;
	ld	hl, #_player_dead_flag
	ld	(hl), #0x01
;src/player.c:287: game_ended_flag = true;
	ld	hl, #_game_ended_flag
	ld	(hl), #0x01
;src/player.c:288: calculate_final_score();
	call	_calculate_final_score
;src/player.c:289: stop_sfx();
	call	_stop_sfx
;src/player.c:292: hide_sprites_range(0, 20);
	ld	e, #0x14
	xor	a, a
	call	_hide_sprites_range
;src/player.c:293: return;
	jp	00127$
00102$:
;src/player.c:296: hide_metasprite(metasprites_states[current_state][current_frame], 0);
	ld	hl, #_current_state
	ld	b, (hl)
	ld	e, #0x00
	ld	a, (#_current_frame)
	ld	c, #0x00
	sla	b
	rl	e
	ldhl	sp,	#4
	ld	(hl), b
	inc	hl
	ld	(hl), e
	add	a, a
	rl	c
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), c
;src/player.c:295: if(current_state == PLAYER_STATE_HURT && (frame_counter & 0x02)){
	ld	a, (#_current_state)
	sub	a, #0x04
	jr	NZ, 00107$
	ld	a, (#_frame_counter)
	bit	1, a
	jr	Z, 00107$
;src/player.c:296: hide_metasprite(metasprites_states[current_state][current_frame], 0);
	ld	de, #_metasprites_states
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	hl
	push	hl
	add	hl, bc
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
;src/player.c:297: hide_metasprite(metasprites_states[current_state][current_frame], 4);
	ld	hl, #_current_state
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_metasprites_states
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_current_frame
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, (hl)
	ld	hl, #___current_metasprite
	ld	(hl+), a
	ld	(hl), c
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:298: __hide_metasprite(base_sprite);
	ld	a, #0x04
	call	___hide_metasprite
	ld	a, (#_frame_counter)
	rrca
	jp	NC,00127$
	call	_play_hurt_sfx
;src/player.c:299: return;
	jp	00127$
00107$:
;src/player.c:302: is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, SUB_TO_PX(player_x), (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, SUB_TO_PX(player_x), (uint8_t)(player_y - camera_y));
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jp	Z, 00129$
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_player_x + 1)
	ldhl	sp,	#3
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_metasprites_states
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	(hl-), a
	ld	a, (hl)
	ld	(#___current_metasprite),a
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(#___current_metasprite + 1),a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	(hl-), a
	ld	(hl), #0x00
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, (hl-)
	dec	hl
	or	a, (hl)
	dec	hl
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	xor	a, a
	call	___move_metasprite
;src/player.c:302: is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, SUB_TO_PX(player_x), (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, SUB_TO_PX(player_x), (uint8_t)(player_y - camera_y));
	jr	00130$
00129$:
	ld	a, (#_player_x + 1)
	ldhl	sp,	#6
	ld	(hl-), a
	ld	de, #_metasprites_states
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	hl
	push	hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:200: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), c
	inc	hl
	ld	(hl), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:201: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:202: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:203: return __move_metasprite_vflip(base_sprite, (y << 8) | (uint8_t)(x - 8u));
	ldhl	sp,	#7
	ld	a, (hl-)
	ld	d, a
	ld	e, #0x00
	ld	a, (hl)
	add	a, #0xf8
	or	a,e
	ld	e, a
	xor	a, a
	call	___move_metasprite_vflip
;src/player.c:302: is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, SUB_TO_PX(player_x), (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, SUB_TO_PX(player_x), (uint8_t)(player_y - camera_y));
00130$:
;src/player.c:303: if((uint8_t)(SUB_TO_PX(player_x)) > 160U) {
	ld	a, (#_player_x + 1)
	ldhl	sp,	#3
	ld	(hl), a
;src/player.c:296: hide_metasprite(metasprites_states[current_state][current_frame], 0);
	ld	hl, #_current_state
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #_current_frame
	ld	c, (hl)
	ld	b, #0x00
	sla	e
	rl	d
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
;src/player.c:303: if((uint8_t)(SUB_TO_PX(player_x)) > 160U) {
	ld	a, d
	ld	(hl-), a
	dec	hl
	sla	c
	rl	b
	inc	sp
	inc	sp
	push	bc
	ld	a, #0xa0
	sub	a, (hl)
	jp	NC, 00113$
;src/player.c:285: if(!player_dead_flag && (uint8_t)(player_y - camera_y) > 160U) {
	ld	a, (#_player_y)
	ld	hl, #_camera_y
	sub	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
;src/player.c:304: if((uint8_t)(SUB_TO_PX(player_x)) < 200) is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) - 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) - 160, (uint8_t)(player_y - camera_y)); //right exit
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0xc8
	jp	NC, 00110$
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	Z, 00131$
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0x60
	ldhl	sp,	#6
	ld	(hl-), a
	ld	de, #_metasprites_states
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	hl
	push	hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ldhl	sp,	#7
	ld	a, (hl-)
	ld	d, a
	ld	e, #0x00
	ld	c, (hl)
	ld	a, e
	or	a, c
	ld	e, a
	ld	a, #0x04
	call	___move_metasprite
;src/player.c:304: if((uint8_t)(SUB_TO_PX(player_x)) < 200) is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) - 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) - 160, (uint8_t)(player_y - camera_y)); //right exit
	jp	00114$
00131$:
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, #0x60
	ld	(hl), a
	ld	de, #_metasprites_states
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	hl
	push	hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:200: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:201: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:202: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:203: return __move_metasprite_vflip(base_sprite, (y << 8) | (uint8_t)(x - 8u));
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	d, a
	ld	e, #0x00
	ld	a, (hl)
	add	a, #0xf8
	or	a, e
	ld	e, a
	ld	a, #0x04
	call	___move_metasprite_vflip
;src/player.c:304: if((uint8_t)(SUB_TO_PX(player_x)) < 200) is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) - 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) - 160, (uint8_t)(player_y - camera_y)); //right exit
	jp	00114$
00110$:
;src/player.c:305: else is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) + 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) + 160, (uint8_t)(player_y - camera_y)); //left exit
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	Z, 00133$
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0xa0
	ldhl	sp,	#6
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_metasprites_states
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:160: __current_metasprite = metasprite;
	ld	(hl-), a
	ld	a, (hl)
	ld	(#___current_metasprite),a
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#___current_metasprite + 1),a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	(hl-), a
	xor	a, a
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, (hl-)
	dec	hl
	or	a, (hl)
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, #0x04
	call	___move_metasprite
;src/player.c:305: else is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) + 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) + 160, (uint8_t)(player_y - camera_y)); //left exit
	jp	00114$
00133$:
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, #0xa0
	ldhl	sp,	#3
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_metasprites_states
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:200: __current_metasprite = metasprite;
	ld	(hl-), a
	ld	a, (hl)
	ld	(#___current_metasprite),a
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(#___current_metasprite + 1),a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:201: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:202: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:203: return __move_metasprite_vflip(base_sprite, (y << 8) | (uint8_t)(x - 8u));
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	(hl-), a
	ld	(hl), #0x00
	ldhl	sp,	#3
	ld	a, (hl+)
	inc	hl
	add	a, #0xf8
	ld	(hl), a
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, (hl-)
	dec	hl
	or	a, (hl)
	dec	hl
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, #0x04
	call	___move_metasprite_vflip
;src/player.c:305: else is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) + 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) + 160, (uint8_t)(player_y - camera_y)); //left exit
	jr	00114$
00113$:
;src/player.c:307: hide_metasprite(metasprites_states[current_state][current_frame], 4);
	ld	de, #_metasprites_states
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:297: __current_metasprite = metasprite;
	ld	(hl-), a
	ld	a, (hl)
	ld	(#___current_metasprite),a
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(#___current_metasprite + 1),a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/metasprites.h:298: __hide_metasprite(base_sprite);
	ld	a, #0x04
	call	___hide_metasprite
;src/player.c:307: hide_metasprite(metasprites_states[current_state][current_frame], 4);
00114$:
;src/player.c:310: if((uint8_t)(player_y - camera_y) < MAX_SPRITE_HEIGHT && !player_dead_flag){
	ld	a, (#_player_y)
	ld	hl, #_camera_y
	sub	a, (hl)
	ld	c, a
	sub	a, #0x1a
	jr	NC, 00127$
	ld	hl, #_player_dead_flag
	bit	0, (hl)
	jr	NZ, 00127$
;src/player.c:311: camera_y -= MAX_SPRITE_HEIGHT - ((uint8_t)(player_y - camera_y));
	ld	a, #0x1a
	sub	a, c
	ld	c, a
	ld	hl, #_camera_y
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
00127$:
;src/player.c:313: }
	add	sp, #8
	ret
;src/player.c:315: static void render_all_particles(void){
;	---------------------------------
; Function render_all_particles
; ---------------------------------
_render_all_particles:
	add	sp, #-6
;src/player.c:317: for(i = 0; i < MAX_PUFF; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00127$:
;src/player.c:318: if(puff_frame[i] == 0){
	ld	a, #<(_puff_frame)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_puff_frame)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	c, a
;src/player.c:319: hide_sprite(FIRST_PUFF + i);
	ld	a, (hl)
	add	a, #0x08
	ld	b, a
;src/player.c:318: if(puff_frame[i] == 0){
	ld	a, c
	or	a, a
	jr	NZ, 00102$
;src/player.c:319: hide_sprite(FIRST_PUFF + i);
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1905: shadow_OAM[nb].y = 0;
	ld	de, #_shadow_OAM+0
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	(hl), #0x00
;src/player.c:320: continue;
	jr	00103$
00102$:
;src/player.c:322: set_sprite_tile(FIRST_PUFF + i, PLAYER_SPRITES - 1 + (puff_frame[i] >> 2));
	ld	a, c
	rrca
	rrca
	and	a, #0x3f
	add	a, #0x17
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	l, b
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
;src/player.c:323: puff_frame[i] = (puff_frame[i] + 1) & 0x0f; //puff_frame[i]++ mod 16 
	ld	a, #<(_puff_frame)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_puff_frame)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	inc	a
	and	a, #0x0f
	ld	(bc), a
00103$:
;src/player.c:317: for(i = 0; i < MAX_PUFF; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00127$
;src/player.c:327: if(brick_frame == 0){
	ld	a, (#_brick_frame)
	or	a, a
	jr	NZ, 00106$
;src/player.c:328: hide_sprites_range(12, 16);
	ld	e, #0x10
	ld	a, #0x0c
	call	_hide_sprites_range
	jr	00107$
00106$:
;src/player.c:331: brick_frame--;
	ld	hl, #_brick_frame
	dec	(hl)
;src/player.c:332: scroll_sprite(12, 1, brick_y_speed>>1);
	ld	hl, #_brick_y_speed
	ld	e, (hl)
	sra	e
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1893: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+48
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1894: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, e
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	inc	a
	ld	(bc), a
;src/player.c:333: scroll_sprite(13, -1, brick_y_speed>>1);
	ld	e, (hl)
	sra	e
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1893: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+52
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1894: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, e
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	dec	a
	ld	(bc), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1893: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+56
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1894: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	inc	a
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	inc	a
	ld	(bc), a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1893: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+60
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1894: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	inc	a
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	dec	a
	ld	(bc), a
;src/player.c:336: brick_y_speed++;
	inc	(hl)
00107$:
;src/player.c:340: if(current_state != PLAYER_STATE_RUNNING) return;
	ld	a, (#_current_state)
	dec	a
	jp	NZ,00128$
;src/player.c:341: if((frame_counter != 0) || (!(current_frame == 0 || current_frame == 3))) return;
	ld	a, (#_frame_counter)
	or	a, a
	jp	NZ,00128$
	ld	hl, #_current_frame
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
	ld	a, (hl)
	sub	a, #0x03
	jp	NZ,00128$
00111$:
;src/player.c:344: i = FIRST_PUFF + next_free_puff;
	ld	a, (#_next_free_puff)
	add	a, #0x08
	ld	hl, #_i
	ld	(hl), a
;src/player.c:345: set_sprite_tile(i, PLAYER_SPRITES);
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
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
	ld	(hl), #0x18
;src/player.c:346: set_sprite_prop(i, get_sprite_prop(i) & 0xDF); // reset the flip
	ld	hl, #_i
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1860: return shadow_OAM[nb].prop;
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
	inc	hl
	ld	c, (hl)
;src/player.c:346: set_sprite_prop(i, get_sprite_prop(i) & 0xDF); // reset the flip
	res	5, c
	ld	hl, #_i
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1850: shadow_OAM[nb].prop=prop;
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
	inc	hl
	ld	(hl), c
;src/player.c:347: puff_frame[next_free_puff] = 4;
	ld	a, #<(_puff_frame)
	ld	hl, #_next_free_puff
	add	a, (hl)
	ld	c, a
	ld	a, #>(_puff_frame)
	adc	a, #0x00
	ld	b, a
	ld	a, #0x04
	ld	(bc), a
;src/player.c:348: move_sprite(i, SUB_TO_PX(player_x) + X_OFFSET, (uint8_t)((player_y + Y_OFFSET) - camera_y));
	ld	a, (#_player_y)
	add	a, #0x08
	ld	hl, #_camera_y
	ld	c, (hl)
	sub	a, c
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_player_x + 1)
	add	a, #0xfc
	ldhl	sp,	#3
	ld	(hl), a
	ld	hl, #_i
	ld	c, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#0
	ld	(hl), c
	inc	hl
	ld	(hl), a
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#2
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	dec	hl
	ld	b, a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/player.c:349: if(!is_facing_right) set_sprite_prop(i, S_FLIPX); //flip if facing left
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	NZ, 00115$
	ld	hl, #_i
	ld	e, (hl)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1850: shadow_OAM[nb].prop=prop;
	ld	bc, #_shadow_OAM+0
	ld	l, e
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
	inc	hl
	ld	(hl), #0x20
;src/player.c:349: if(!is_facing_right) set_sprite_prop(i, S_FLIPX); //flip if facing left
00115$:
;src/player.c:351: next_free_puff = (next_free_puff + 1) & 0x03;
	ld	hl, #_next_free_puff
	ld	a, (hl)
	inc	a
	and	a, #0x03
	ld	(hl), a
00128$:
;src/player.c:352: }
	add	sp, #6
	ret
;src/player.c:354: static void instanciate_collision_puffs(void){
;	---------------------------------
; Function instanciate_collision_puffs
; ---------------------------------
_instanciate_collision_puffs:
;src/player.c:356: uint8_t i = FIRST_PUFF + next_free_puff;
	ld	a, (#_next_free_puff)
	add	a, #0x08
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	ld	l, c
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
	ld	(hl), #0x18
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1860: return shadow_OAM[nb].prop;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	inc	hl
	ld	c, (hl)
;src/player.c:358: set_sprite_prop(i, get_sprite_prop(i) & 0xDF); // remove flip
	res	5, c
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1850: shadow_OAM[nb].prop=prop;
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	inc	hl
	ld	(hl), c
;src/player.c:359: puff_frame[next_free_puff] = 4;
	ld	a, #<(_puff_frame)
	ld	hl, #_next_free_puff
	add	a, (hl)
	ld	c, a
	ld	a, #>(_puff_frame)
	adc	a, #0x00
	ld	b, a
	ld	a, #0x04
	ld	(bc), a
;src/player.c:360: move_sprite(i, SUB_TO_PX(player_x) + X_OFFSET - 8U, (uint8_t)((player_y + Y_OFFSET) - camera_y));
	ld	a, (#_player_y)
	add	a, #0x08
	ld	hl, #_camera_y
	ld	c, (hl)
	sub	a, c
	ld	b, a
	ld	a, (#_player_x + 1)
	add	a, #0xf4
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/player.c:362: next_free_puff = (next_free_puff + 1) & 0x03;
	ld	hl, #_next_free_puff
	ld	a, (hl)
	inc	a
	and	a, #0x03
	ld	(hl), a
;src/player.c:364: i = FIRST_PUFF + next_free_puff;
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	ld	l, c
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
	ld	(hl), #0x18
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1860: return shadow_OAM[nb].prop;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	inc	hl
	ld	c, (hl)
;src/player.c:366: set_sprite_prop(i, get_sprite_prop(i) | 0x20); // add flip
	set	5, c
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1850: shadow_OAM[nb].prop=prop;
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	inc	hl
	ld	(hl), c
;src/player.c:367: puff_frame[next_free_puff] = 4;
	ld	a, #<(_puff_frame)
	ld	hl, #_next_free_puff
	add	a, (hl)
	ld	c, a
	ld	a, #>(_puff_frame)
	adc	a, #0x00
	ld	b, a
	ld	a, #0x04
	ld	(bc), a
;src/player.c:368: move_sprite(i, SUB_TO_PX(player_x) + X_OFFSET + 8U, (uint8_t)((player_y + Y_OFFSET) - camera_y));
	ld	a, (#_player_y)
	add	a, #0x08
	ld	hl, #_camera_y
	ld	c, (hl)
	sub	a, c
	ld	b, a
	ld	a, (#_player_x + 1)
	add	a, #0x04
	ld	c, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/player.c:370: next_free_puff = (next_free_puff + 1) & 0x03;
	ld	hl, #_next_free_puff
	ld	a, (hl)
	inc	a
	and	a, #0x03
	ld	(hl), a
;src/player.c:371: }
	ret
;src/player.c:373: static void instanciate_brick_particles(void){
;	---------------------------------
; Function instanciate_brick_particles
; ---------------------------------
_instanciate_brick_particles:
;src/player.c:375: uint8_t particle_x = ((3 + (i<<1 & 0x0C)) << 3) + 14u;
	ld	a, (#_i)
	add	a, a
	and	a, #0x0c
	add	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x0e
	ld	c, a
;src/player.c:376: uint8_t particle_y = (((PLAYER_FLOOR << 3) + 1 + ((~i & 0x01) << 2)) << 3) - camera_y + 16u;
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
	inc	b
	ld	a, (#_i)
	cpl
	and	a, #0x01
	add	a, a
	add	a, a
	add	a, b
	add	a, a
	add	a, a
	add	a, a
	ld	hl, #_camera_y
	ld	b, (hl)
	sub	a, b
	add	a, #0x10
	ld	b, a
;src/player.c:377: move_sprite(12, particle_x, particle_y);
	ld	e, c
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), e
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;src/player.c:381: brick_frame = 10;
	ld	hl, #_brick_frame
	ld	(hl), #0x0a
;src/player.c:382: brick_y_speed = -5;
	ld	hl, #_brick_y_speed
	ld	(hl), #0xfb
;src/player.c:383: }
	ret
;src/player.c:385: static void hurt_frame(void){
;	---------------------------------
; Function hurt_frame
; ---------------------------------
_hurt_frame:
;src/player.c:386: if(frame_counter >= HURT_FRAMES){
	ld	a, (#_frame_counter)
	sub	a, #0x1e
	jr	C, 00102$
;src/player.c:387: switch_state(PLAYER_STATE_FALLING);
	ld	a, #0x03
	call	_switch_state
;src/player.c:388: stop_hurt_sfx();
;src/player.c:389: return;
	jp	_stop_hurt_sfx
00102$:
;src/player.c:391: player_x = is_facing_right ? player_x - (x_speed) : player_x + (x_speed);
	ld	hl, #_x_speed
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	Z, 00105$
	ld	hl, #_player_x
	ld	a, (hl+)
	sub	a, c
	ld	c, a
	ld	a, (hl)
	sbc	a, b
	ld	b, a
	jr	00106$
00105$:
	ld	a, c
	ld	hl, #_player_x
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
00106$:
	ld	hl, #_player_x
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:392: player_y += (y_speed >> PHYSICS_DAMPNER);
	ld	a, (#_y_speed)
	sra	a
	sra	a
	ld	hl, #_player_y
	ld	c, (hl)
	add	a, c
	ld	(hl), a
;src/player.c:393: y_speed = y_speed >= clamp_y_velocity ? clamp_y_velocity : y_speed + HURT_G;
	ld	a, (#_y_speed)
	xor	a, #0x80
	sub	a, #0x94
	jr	C, 00107$
	ld	a, #0x14
	jr	00108$
00107$:
	ld	a, (#_y_speed)
	inc	a
00108$:
	ld	(#_y_speed),a
;src/player.c:394: }
	ret
;src/player.c:396: void end_frame(void){
;	---------------------------------
; Function end_frame
; ---------------------------------
_end_frame::
;src/player.c:397: if(frame_counter == (uint8_t)(metasprites_speeds[current_state][current_frame])){
	ld	bc, #_metasprites_speeds+0
	ld	hl, #_current_state
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	ld	hl, #_current_frame
	add	a, (hl)
	ld	c, a
	jr	NC, 00131$
	inc	b
00131$:
	ld	a, (bc)
	ld	c, a
	ld	a, (#_frame_counter)
	sub	a, c
	jr	NZ, 00104$
;src/player.c:398: frame_counter = 0;
	ld	hl, #_frame_counter
	ld	(hl), #0x00
;src/player.c:399: current_frame++;
	ld	hl, #_current_frame
	inc	(hl)
;src/player.c:400: if(current_frame == frames_in_state[current_state]){current_frame = 0;}
	ld	bc, #_frames_in_state+0
	ld	a, c
	ld	hl, #_current_state
	add	a, (hl)
	ld	c, a
	jr	NC, 00134$
	inc	b
00134$:
	ld	a, (bc)
	ld	c, a
	ld	a, (#_current_frame)
	sub	a, c
	jr	NZ, 00105$
	ld	hl, #_current_frame
	ld	(hl), #0x00
	jr	00105$
00104$:
;src/player.c:402: frame_counter++;
	ld	hl, #_frame_counter
	inc	(hl)
00105$:
;src/player.c:405: if(!rand_init){
	ld	hl, #_rand_init
	bit	0, (hl)
	ret	NZ
;src/player.c:406: r = r ^ DIV_REG ^ (current_frame << frame_counter);
	ldh	a, (_DIV_REG + 0)
	ld	hl, #_r
	xor	a, (hl)
	ld	hl, #_frame_counter
	ld	b, (hl)
	ld	hl, #_current_frame
	ld	c, (hl)
	inc	b
	jr	00138$
00137$:
	sla	c
00138$:
	dec	b
	jr	NZ,00137$
	xor	a, c
	ld	(#_r),a
;src/player.c:408: }
	ret
;src/player.c:410: static inline void switch_state(PlayerState state){
;	---------------------------------
; Function switch_state
; ---------------------------------
_switch_state:
	ld	c, a
;src/player.c:411: if(current_state == state) {return;}
;src/player.c:412: if(current_state == PLAYER_STATE_FALLING){instanciate_collision_puffs();}
	ld	a,(#_current_state)
	cp	a,c
	ret	Z
	sub	a, #0x03
	jr	NZ, 00104$
	push	bc
	call	_instanciate_collision_puffs
	pop	bc
00104$:
;src/player.c:413: frame_counter = 0;
	ld	hl, #_frame_counter
	ld	(hl), #0x00
;src/player.c:414: current_frame = 0;
	ld	hl, #_current_frame
	ld	(hl), #0x00
;src/player.c:415: current_state = state;
	ld	hl, #_current_state
	ld	(hl), c
;src/player.c:416: }
	ret
;src/player.c:420: static void check_collisions(void){
;	---------------------------------
; Function check_collisions
; ---------------------------------
_check_collisions:
	add	sp, #-16
;src/player.c:422: for(i=0; i<8; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00133$:
;src/player.c:423: r = &rect_list[PLAYER_FLOOR][i];
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	ld	c, a
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
	ld	e, a
	add	a, a
	add	a, a
	add	a, e
	add	a, c
	ld	c, a
	ld	a, #0x00
	adc	a, b
	ldhl	sp,	#1
	ld	(hl), c
	inc	hl
;src/player.c:424: if(r->type == INACTIVE) continue;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	sub	a, #0x02
	jp	Z,00131$
;src/player.c:425: if(!point_vs_rect(r)) {
	ldhl	sp,	#1
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_point_vs_rect
	ld	c, a
	bit	0, c
	jp	Z, 00131$
;src/player.c:434: external_point_area |= ((uint8_t)SUB_TO_PX(last_x) >= (r->x + r->size_x)) ? 0x10 : ((uint8_t)SUB_TO_PX(last_x) <= r->x) ? 0x20 : 0x30;        
	ld	a, (#_last_x + 1)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#1
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
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl), a
	ldhl	sp,	#12
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl), a
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#14
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00301$
	bit	7, d
	jr	NZ, 00302$
	cp	a, a
	jr	00302$
00301$:
	bit	7, d
	jr	Z, 00302$
	scf
00302$:
	jr	C, 00136$
	ldhl	sp,	#15
	ld	(hl), #0x10
	jr	00137$
00136$:
	ldhl	sp,	#7
	ld	a, (hl-)
	sub	a, (hl)
	jr	C, 00138$
	ld	a, #0x20
	jr	00139$
00138$:
	ld	a, #0x30
00139$:
	ldhl	sp,	#15
	ld	(hl), a
00137$:
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#0
;src/player.c:435: external_point_area |= (last_y <= (r->y - r->size_y)) ? 0x01 : (last_y >= r->y) ? 0x02 : 0x03;
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
	ld	hl, #_last_y
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#8
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00303$
	bit	7, d
	jr	NZ, 00304$
	cp	a, a
	jr	00304$
00303$:
	bit	7, d
	jr	Z, 00304$
	scf
00304$:
	jr	C, 00140$
	ldhl	sp,	#9
	ld	(hl), #0x01
	jr	00141$
00140$:
	ld	a, (#_last_y)
	ldhl	sp,	#3
	sub	a, (hl)
	jr	C, 00142$
	ld	a, #0x02
	jr	00143$
00142$:
	ld	a, #0x03
00143$:
	ldhl	sp,	#9
	ld	(hl), a
00141$:
	ldhl	sp,	#9
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, b
	ld	c, a
;src/player.c:437: if((player_y > last_y) ? (player_y - last_y) > 50 : (last_y - player_y) > 50){
	ld	a, (#_last_y)
	ld	hl, #_player_y
	sub	a, (hl)
	jr	NC, 00144$
	ld	a, (hl)
	ld	b, #0x00
	ld	hl, #_last_y
	ld	e, (hl)
	ld	d, #0x00
	sub	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	sbc	a, d
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, h
	ld	d, #0x00
	ld	a, #0x32
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00305$
	bit	7, d
	jr	NZ, 00306$
	cp	a, a
	jr	00306$
00305$:
	bit	7, d
	jr	Z, 00306$
	scf
00306$:
	ld	a, #0x00
	rla
	jr	00145$
00144$:
	ld	hl, #_last_y
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #_player_y
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	e, b
	ld	d, #0x00
	ld	a, #0x32
	cp	a, l
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00307$
	bit	7, d
	jr	NZ, 00308$
	cp	a, a
	jr	00308$
00307$:
	bit	7, d
	jr	Z, 00308$
	scf
00308$:
	ld	a, #0x00
	rla
00145$:
	or	a, a
	jr	Z, 00106$
;src/player.c:438: external_point_area = (external_point_area & 0xF0) + 0x02; //check for overflow height
	ld	a, c
	and	a, #0xf0
	add	a, #0x02
	ld	c, a
00106$:
;src/player.c:441: if(rect_functions[r->type](external_point_area)) continue;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	ld	de, #_rect_functions
	add	hl, de
	ld	a, (hl+)
	ld	b, a
	ld	h, (hl)
;	spillPairReg hl
	push	bc
	ld	a, c
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	bc
	bit	0, l
	jp	NZ, 00131$
;src/player.c:444: switch (external_point_area)
	ld	a,c
	cp	a,#0x11
	jr	Z, 00109$
	cp	a,#0x12
	jp	Z,00113$
	cp	a,#0x13
	jp	Z,00117$
	cp	a,#0x21
	jp	Z,00118$
	cp	a,#0x22
	jp	Z,00122$
	cp	a,#0x23
	jp	Z,00126$
	cp	a,#0x31
	jp	Z,00127$
	sub	a, #0x32
	jp	Z,00128$
	jp	00131$
;src/player.c:446: case RIGHT_UP: // RIGHT - UP
00109$:
;src/player.c:447: rx = r->x + r->size_x;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,#10
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl), a
	pop	af
	add	a, (hl)
	inc	hl
	ld	(hl), a
;src/player.c:448: ry = r->y - r->size_y;
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	sub	a, c
	ldhl	sp,	#5
	ld	(hl), a
	ld	c, (hl)
;src/player.c:449: if((ry-player_y)*((uint8_t)SUB_TO_PX(last_x) - (uint8_t)SUB_TO_PX(player_x)) < (last_y - player_y)*(rx-(uint8_t)SUB_TO_PX(player_x))){
	ld	b, #0x00
	ld	a, (#_player_y)
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_last_x + 1)
	ld	b, #0x00
	ld	hl, #_player_x + 1
	ld	c, (hl)
	ldhl	sp,	#8
	ld	(hl), c
	inc	hl
	ld	(hl), #0x00
	ld	e, a
	ld	d, b
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ld	a, (#_last_y)
	ldhl	sp,	#12
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#10
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	ld	e, a
	bit	7, e
	jr	Z, 00317$
	bit	7, d
	jr	NZ, 00318$
	cp	a, a
	jr	00318$
00317$:
	bit	7, d
	jr	Z, 00318$
	scf
00318$:
	jr	NC, 00111$
;src/player.c:451: player_x = (uint16_t)PX_TO_SUB(r->x + r->size_x + 1);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	a, (hl)
	ld	e, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	inc	bc
	ld	b, c
	ld	c, #0x00
	ld	hl, #_player_x
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jp	00131$
00111$:
;src/player.c:455: player_y = r->y - r->size_y - 1;
	ldhl	sp,	#5
	ld	a, (hl)
	dec	a
	ld	(#_player_y),a
;src/player.c:456: is_grounded = true;
	ld	hl, #_is_grounded
	ld	(hl), #0x01
;src/player.c:457: current_coyote_frames = 0;
	ld	hl, #_current_coyote_frames
	ld	(hl), #0x00
;src/player.c:458: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
;src/player.c:460: break;
	jp	00131$
;src/player.c:462: case RIGHT_DOWN: // RIGHT - DOWN
00113$:
;src/player.c:463: rx = r->x + r->size_x;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,#10
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl), a
	pop	af
	add	a, (hl)
	inc	hl
	ld	(hl), a
;src/player.c:464: ry = r->y;
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl), a
	ld	c, (hl)
;src/player.c:465: if((ry-player_y)*((uint8_t)SUB_TO_PX(last_x) - (uint8_t)SUB_TO_PX(player_x)) > (last_y - player_y)*(rx-(uint8_t)SUB_TO_PX(player_x))){
	ld	b, #0x00
	ld	a, (#_player_y)
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_last_x + 1)
	ld	b, #0x00
	ld	hl, #_player_x + 1
	ld	c, (hl)
	ldhl	sp,	#8
	ld	(hl), c
	inc	hl
	ld	(hl), #0x00
	ld	e, a
	ld	d, b
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ld	a, (#_last_y)
	ldhl	sp,	#12
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#10
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00319$
	bit	7, d
	jr	NZ, 00320$
	cp	a, a
	jr	00320$
00319$:
	bit	7, d
	jr	Z, 00320$
	scf
00320$:
	jr	NC, 00115$
;src/player.c:467: player_x = (uint16_t)PX_TO_SUB(r->x + r->size_x + 1);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	a, (hl)
	ld	e, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	inc	bc
	ld	b, c
	ld	c, #0x00
	ld	hl, #_player_x
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jp	00131$
00115$:
;src/player.c:471: player_y = r->y + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	inc	a
	ld	(#_player_y),a
;src/player.c:472: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
;src/player.c:475: break;
	jp	00131$
;src/player.c:477: case RIGHT_CENTER: // RIGHT - CENTER
00117$:
;src/player.c:478: player_x = (uint16_t)PX_TO_SUB(r->x + r->size_x + 1);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, bc
	inc	hl
	ld	c, l
	xor	a, a
	ld	hl, #_player_x
	ld	(hl+), a
	ld	(hl), c
;src/player.c:480: break;
	jp	00131$
;src/player.c:482: case LEFT_UP: // LEFT - UP
00118$:
;src/player.c:483: rx = r->x;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#11
	ld	(hl), a
;src/player.c:484: ry = r->y - r->size_y;
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	sub	a, c
	ldhl	sp,	#4
	ld	(hl), a
	ld	c, (hl)
;src/player.c:485: if((ry-player_y)*((uint8_t)SUB_TO_PX(last_x) - (uint8_t)SUB_TO_PX(player_x)) > (last_y - player_y)*(rx-(uint8_t)SUB_TO_PX(player_x))){
	ld	b, #0x00
	ld	a, (#_player_y)
	ldhl	sp,	#5
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_last_x + 1)
	ld	b, #0x00
	ld	hl, #_player_x + 1
	ld	c, (hl)
	ldhl	sp,	#7
	ld	(hl), c
	inc	hl
	ld	(hl), #0x00
	ld	e, a
	ld	d, b
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#9
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ld	a, (#_last_y)
	ldhl	sp,	#12
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#11
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#9
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00321$
	bit	7, d
	jr	NZ, 00322$
	cp	a, a
	jr	00322$
00321$:
	bit	7, d
	jr	Z, 00322$
	scf
00322$:
	jr	NC, 00120$
;src/player.c:487: player_x = (uint16_t)PX_TO_SUB(r->x - 1);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, #0x00
	ld	c, a
	dec	bc
	ld	b, c
	ld	c, #0x00
	ld	hl, #_player_x
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jp	00131$
00120$:
;src/player.c:491: player_y = r->y - r->size_y - 1;
	ldhl	sp,	#4
	ld	a, (hl)
	dec	a
	ld	(#_player_y),a
;src/player.c:492: is_grounded = true;
	ld	hl, #_is_grounded
	ld	(hl), #0x01
;src/player.c:493: current_coyote_frames = 0;
	ld	hl, #_current_coyote_frames
	ld	(hl), #0x00
;src/player.c:494: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
;src/player.c:496: break;
	jp	00131$
;src/player.c:498: case LEFT_DOWN: // LEFT - DOWN
00122$:
;src/player.c:499: rx = r->x;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#13
;src/player.c:500: ry = r->y;
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	c, (hl)
;src/player.c:501: if((ry-player_y)*((uint8_t)SUB_TO_PX(last_x) - (uint8_t)SUB_TO_PX(player_x)) < (last_y - player_y)*(rx-(uint8_t)SUB_TO_PX(player_x))){
	ld	b, #0x00
	ld	a, (#_player_y)
	ldhl	sp,	#3
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#12
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_last_x + 1)
	ld	b, #0x00
	ld	hl, #_player_x + 1
	ld	c, (hl)
	ldhl	sp,	#5
	ld	(hl), c
	inc	hl
	ld	(hl), #0x00
	ld	e, a
	ld	d, b
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#7
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ld	a, (#_last_y)
	ldhl	sp,	#9
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#7
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	ld	e, a
	bit	7, e
	jr	Z, 00323$
	bit	7, d
	jr	NZ, 00324$
	cp	a, a
	jr	00324$
00323$:
	bit	7, d
	jr	Z, 00324$
	scf
00324$:
	jr	NC, 00124$
;src/player.c:503: player_x = (uint16_t)PX_TO_SUB(r->x - 1);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, #0x00
	ld	c, a
	dec	bc
	ld	b, c
	ld	c, #0x00
	ld	hl, #_player_x
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00131$
00124$:
;src/player.c:507: player_y = r->y + 1;
	ldhl	sp,	#15
	ld	a, (hl)
	inc	a
	ld	(#_player_y),a
;src/player.c:508: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
;src/player.c:511: break;
	jr	00131$
;src/player.c:513: case LEFT_CENTER: // LEFT - CENTER
00126$:
;src/player.c:514: player_x = (uint16_t)PX_TO_SUB(r->x - 1);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, #0x00
	ld	c, a
	dec	bc
	xor	a, a
	ld	hl, #_player_x
	ld	(hl+), a
	ld	(hl), c
;src/player.c:516: break;
	jr	00131$
;src/player.c:518: case CENTER_UP: // CENTER - UP
00127$:
;src/player.c:519: player_y = r->y - r->size_y - 1;
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	sub	a, c
	dec	a
	ld	(#_player_y),a
;src/player.c:520: is_grounded = true;
	ld	hl, #_is_grounded
	ld	(hl), #0x01
;src/player.c:521: current_coyote_frames = 0;
	ld	hl, #_current_coyote_frames
	ld	(hl), #0x00
;src/player.c:522: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
;src/player.c:523: break;
	jr	00131$
;src/player.c:525: case CENTER_DOWN: // CENTER - DOWN
00128$:
;src/player.c:526: player_y = r->y + 1;
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	a
	ld	(#_player_y),a
;src/player.c:527: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
;src/player.c:533: }
00131$:
;src/player.c:422: for(i=0; i<8; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x08
	jp	C, 00133$
;src/player.c:535: }
	add	sp, #16
	ret
;src/player.c:537: static void update_score(void){
;	---------------------------------
; Function update_score
; ---------------------------------
_update_score:
	dec	sp
	dec	sp
;src/player.c:539: if((PREV_PLAYER_FLOOR != PLAYER_FLOOR) && PLAYER_FLOOR == ((highest_visited_floor - 1) & 0x03)){
	ld	a, (#_last_y)
	rlca
	rlca
	and	a, #0x03
	ldhl	sp,	#0
	ld	(hl), a
	ld	hl, #_player_y
	ld	a, (hl)
	rlca
	rlca
	and	a, #0x03
	ld	e, a
;src/player.c:542: max_player_y = (uint8_t)((PREV_PLAYER_FLOOR << 6) - player_y);
	ld	a, (hl)
	ldhl	sp,	#1
;src/player.c:539: if((PREV_PLAYER_FLOOR != PLAYER_FLOOR) && PLAYER_FLOOR == ((highest_visited_floor - 1) & 0x03)){
	ld	(hl-), a
	ld	a, (hl)
	sub	a, e
	jr	Z, 00102$
	ld	hl, #_highest_visited_floor
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
	ld	a, c
	and	a, #0x03
	ld	c, a
	ld	b, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	ld	d, #0x00
	sub	a, c
	jr	NZ, 00102$
	ld	a, d
	sub	a, b
	jr	NZ, 00102$
;src/player.c:540: score += 4;
	ld	hl, #_score
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:541: highest_visited_floor = PLAYER_FLOOR;
	ld	hl, #_highest_visited_floor
	ld	(hl), e
;src/player.c:542: max_player_y = (uint8_t)((PREV_PLAYER_FLOOR << 6) - player_y);
	ldhl	sp,	#0
	ld	a, (hl+)
	rrca
	rrca
	and	a, #0xc0
	sub	a, (hl)
	ld	(#_max_player_y),a
;src/player.c:543: return;
	jr	00108$
00102$:
;src/player.c:546: if(PLAYER_FLOOR != highest_visited_floor) return;
	ld	a, (#_highest_visited_floor)
	sub	a, e
	jr	NZ, 00108$
;src/player.c:548: test_max_player_y = (uint8_t)((((PLAYER_FLOOR + 1) & 0x03) << 6) - player_y);
	ld	a, e
	inc	a
	and	a, #0x03
	rrca
	rrca
	and	a, #0xc0
	ldhl	sp,	#1
	sub	a, (hl)
	ld	(#_test_max_player_y),a
;src/player.c:549: if(max_player_y < test_max_player_y){
	ld	a, (#_max_player_y)
	ld	hl, #_test_max_player_y
	sub	a, (hl)
	jr	NC, 00108$
;src/player.c:550: max_player_y = test_max_player_y;
	ld	a, (hl)
	ld	(#_max_player_y),a
00108$:
;src/player.c:552: }
	inc	sp
	inc	sp
	ret
;src/player.c:554: static void calculate_final_score(void){
;	---------------------------------
; Function calculate_final_score
; ---------------------------------
_calculate_final_score:
;src/player.c:555: score += (max_player_y >> 4);
	ld	a, (#_max_player_y)
	swap	a
	and	a, #0x0f
	ld	hl, #_score
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	e, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/player.c:556: }
	ret
;src/player.c:558: static inline bool point_vs_rect(rect *r){
;	---------------------------------
; Function point_vs_rect
; ---------------------------------
_point_vs_rect:
	add	sp, #-7
	ld	c, e
	ld	b, d
;src/player.c:559: return ((uint8_t)SUB_TO_PX(player_x) >= r->x && player_y <= r->y && (uint8_t)SUB_TO_PX(player_x) <= (r->x + r->size_x) && player_y >= (r->y - r->size_y));
	ld	a, (#_player_x + 1)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (bc)
	ld	e, a
	ld	a, (hl)
	sub	a, e
	jp	C, 00103$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,#2
	ld	(hl), a
	ld	hl, #_player_y
	sub	a, (hl)
	jr	C, 00103$
	ldhl	sp,	#0
	ld	a, e
	ld	(hl+), a
	ld	(hl), #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	ld	d, #0x00
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#3
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00131$
	bit	7, d
	jr	NZ, 00132$
	cp	a, a
	jr	00132$
00131$:
	bit	7, d
	jr	Z, 00132$
	scf
00132$:
	jr	C, 00103$
	ldhl	sp,	#2
	ld	e, (hl)
	ld	d, #0x00
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	a, (#_player_y)
	ldhl	sp,	#5
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00133$
	bit	7, d
	jr	NZ, 00134$
	cp	a, a
	jr	00134$
00133$:
	bit	7, d
	jr	Z, 00134$
	scf
00134$:
	jr	NC, 00104$
00103$:
	xor	a, a
	jr	00105$
00104$:
	ld	a, #0x01
00105$:
;src/player.c:560: }
	add	sp, #7
	ret
;src/player.c:566: static bool r_solid_function(uint8_t epa){
;	---------------------------------
; Function r_solid_function
; ---------------------------------
_r_solid_function:
	dec	sp
	dec	sp
;src/player.c:567: if(epa == CENTER_DOWN){
	sub	a, #0x32
	jp	NZ,00111$
;src/player.c:570: bool is_upper = i & 0x01 == 0x01;
	ld	a, (#_i)
	and	a, #0x01
	ld	c, a
	ldhl	sp,	#0
	ld	(hl), c
;src/player.c:571: component_at_r = is_upper ? map_components[PLAYER_FLOOR][i>>1].components >> 4 : map_components[PLAYER_FLOOR][i>>1].components & 0x0F;
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	ld	e, a
	ld	a, (#_i)
	srl	a
	ld	d, #0x00
	add	a, a
	ldhl	sp,	#1
	ld	(hl), a
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	bit	0, c
	jr	Z, 00114$
	ld	hl, #_map_components
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	swap	a
	and	a, #0x0f
	jr	00115$
00114$:
	ld	hl, #_map_components
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	and	a, #0x0f
00115$:
;src/player.c:572: if(component_at_r == 2){
	sub	a, #0x02
	jp	NZ,00111$
;src/player.c:573: if(is_upper){
	ldhl	sp,	#0
	bit	0, (hl)
	jp	Z, 00106$
;src/player.c:574: if((map_components[PLAYER_FLOOR][i>>1].status >> 4) == 0){
	inc	hl
	ld	bc, #_map_components+0
	ld	a, e
	add	a, c
	ld	e, a
	ld	a, d
	adc	a, b
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	swap	a
	and	a,#0x0f
	jr	NZ, 00102$
;src/player.c:575: play_bump_sfx();
	push	bc
	call	_play_bump_sfx
	pop	bc
;src/player.c:576: set_bkg_tiles(3 + (i<<1 & 0x0C), (PLAYER_FLOOR << 3) + 1, 4, 1, top_map_02_broken);
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	ld	d, a
	inc	d
	ld	a, (#_i)
	add	a, a
	and	a, #0x0c
	add	a, #0x03
	ld	hl, #_top_map_02_broken
	push	hl
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/player.c:577: map_components[PLAYER_FLOOR][i>>1].status |= 0x10;
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#_i)
	srl	a
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	inc	hl
	set	4, (hl)
;src/player.c:578: return false;
	xor	a, a
	jp	00112$
00102$:
;src/player.c:580: instanciate_brick_particles();
	push	bc
	call	_instanciate_brick_particles
	call	_play_break_sfx
	pop	bc
;src/player.c:582: set_bkg_tiles(3 + (i<<1 & 0x0C), (PLAYER_FLOOR << 3) + 1, 4, 1, top_map_00);
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	ld	d, a
	inc	d
	ld	a, (#_i)
	add	a, a
	and	a, #0x0c
	add	a, #0x03
	ld	hl, #_top_map_00
	push	hl
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/player.c:583: map_components[PLAYER_FLOOR][i>>1].components = map_components[PLAYER_FLOOR][i>>1].components & 0x0F;
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (#_i)
	srl	a
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	and	a, #0x0f
	ld	(hl), a
;src/player.c:584: map_components[PLAYER_FLOOR][i>>1].status = map_components[PLAYER_FLOOR][i>>1].status & 0x0F;
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#_i)
	srl	a
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	inc	hl
	ld	a, (hl)
	and	a, #0x0f
	ld	(hl), a
;src/player.c:585: rect_list[PLAYER_FLOOR][i].type = INACTIVE;
	ld	bc, #_rect_list+0
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	ld	e, a
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#_i)
	ld	e, a
	add	a, a
	add	a, a
	add	a, e
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	bc, #0x0004
	add	hl, bc
	ld	(hl), #0x02
	jp	00111$
00106$:
;src/player.c:587: if((map_components[PLAYER_FLOOR][i>>1].status & 0x0F) == 0){
	ld	bc, #_map_components+0
	ld	a, e
	add	a, c
	ld	e, a
	ld	a, d
	adc	a, b
	ld	d, a
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	and	a, #0x0f
	jr	NZ, 00104$
;src/player.c:588: play_bump_sfx();
	push	bc
	call	_play_bump_sfx
	pop	bc
;src/player.c:589: set_bkg_tiles(3 + (i<<1 & 0x0C), (PLAYER_FLOOR << 3) + 5, 4, 2, bot_map_02_broken);
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x05
	ld	d, a
	ld	a, (#_i)
	add	a, a
	and	a, #0x0c
	add	a, #0x03
	ld	hl, #_bot_map_02_broken
	push	hl
	ld	h, #0x02
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/player.c:590: map_components[PLAYER_FLOOR][i>>1].status |= 0x01;
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#_i)
	srl	a
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	inc	hl
	set	0, (hl)
;src/player.c:591: return false;
	xor	a, a
	jp	00112$
00104$:
;src/player.c:593: instanciate_brick_particles();
	push	bc
	call	_instanciate_brick_particles
	call	_play_break_sfx
	pop	bc
;src/player.c:595: set_bkg_tiles(3 + (i<<1 & 0x0C), (PLAYER_FLOOR << 3) + 5, 4, 2, bot_map_00);
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x05
	ld	d, a
	ld	a, (#_i)
	add	a, a
	and	a, #0x0c
	add	a, #0x03
	ld	hl, #_bot_map_00
	push	hl
	ld	h, #0x02
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/player.c:596: map_components[PLAYER_FLOOR][i>>1].components = map_components[PLAYER_FLOOR][i>>1].components & 0xF0;
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (#_i)
	srl	a
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	and	a, #0xf0
	ld	(hl), a
;src/player.c:597: map_components[PLAYER_FLOOR][i>>1].status = map_components[PLAYER_FLOOR][i>>1].status & 0xF0;
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#_i)
	srl	a
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	inc	hl
	ld	a, (hl)
	and	a, #0xf0
	ld	(hl), a
;src/player.c:598: rect_list[PLAYER_FLOOR][i].type = INACTIVE;
	ld	bc, #_rect_list+0
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	ld	e, a
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#_i)
	ld	e, a
	add	a, a
	add	a, a
	add	a, e
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	bc, #0x0004
	add	hl, bc
	ld	(hl), #0x02
00111$:
;src/player.c:604: return false;
	xor	a, a
00112$:
;src/player.c:605: }
	inc	sp
	inc	sp
	ret
;src/player.c:606: static bool r_traversable_function(uint8_t epa){
;	---------------------------------
; Function r_traversable_function
; ---------------------------------
_r_traversable_function:
;src/player.c:607: return (bool)(epa != CENTER_UP || (joy & J_DOWN));
	sub	a, #0x31
	jr	NZ, 00104$
	ld	a, (#_joy)
	rrca
	rrca
	rrca
	and	a,#0x01
	ret	Z
00104$:
	ld	a, #0x01
;src/player.c:608: }
	ret
;src/player.c:609: static bool r_inactive_function(uint8_t epa){
;	---------------------------------
; Function r_inactive_function
; ---------------------------------
_r_inactive_function:
;src/player.c:610: return true;
	ld	a, #0x01
;src/player.c:611: }
	ret
;src/player.c:612: static bool r_bouncy_function(uint8_t epa){
;	---------------------------------
; Function r_bouncy_function
; ---------------------------------
_r_bouncy_function:
;src/player.c:613: if(epa == CENTER_UP){
	sub	a, #0x31
	jp	NZ,00109$
;src/player.c:411: if(current_state == state) {return;}
;src/player.c:412: if(current_state == PLAYER_STATE_FALLING){instanciate_collision_puffs();}
	ld	a,(#_current_state)
	cp	a,#0x02
	jr	Z, 00114$
	sub	a, #0x03
	jr	NZ, 00113$
	call	_instanciate_collision_puffs
00113$:
;src/player.c:413: frame_counter = 0;
	ld	hl, #_frame_counter
	ld	(hl), #0x00
;src/player.c:414: current_frame = 0;
	ld	hl, #_current_frame
	ld	(hl), #0x00
;src/player.c:415: current_state = state;
	ld	hl, #_current_state
	ld	(hl), #0x02
;src/player.c:614: switch_state(PLAYER_STATE_JUMPING);
00114$:
;src/player.c:615: play_boing_sfx();
	call	_play_boing_sfx
;src/player.c:616: y_speed = (int8_t)(-45);
	ld	hl, #_y_speed
	ld	(hl), #0xd3
;src/player.c:617: is_grounded = false;
	ld	hl, #_is_grounded
	ld	(hl), #0x00
;src/player.c:618: is_jumping = true;
	ld	hl, #_is_jumping
	ld	(hl), #0x01
;src/player.c:622: if(i & 0x01 == 0x01) {return true;}
	push	hl
	ld	hl, #_i
	bit	0, (hl)
	pop	hl
	jr	Z, 00102$
	ld	a, #0x01
	ret
00102$:
;src/player.c:624: status_of_rack = map_components[PLAYER_FLOOR][i>>1].status & 0x0F;
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	ld	l, a
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
	srl	a
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	inc	hl
	ld	a, (hl)
	and	a, #0x0f
;src/player.c:633: if(status_of_rack == 0x00){
	ld	c, a
	or	a, a
	jr	NZ, 00104$
;src/player.c:634: return true;
	ld	a, #0x01
	ret
00104$:
;src/player.c:636: if((status_of_rack & 0b00001100) == 0b00001100){
	ld	a, c
	and	a, #0x0c
;src/player.c:639: make_cloth_fall(status_of_rack & 0x03);
	push	af
	ld	a, c
	and	a, #0x03
	ld	b, a
	pop	af
;src/player.c:636: if((status_of_rack & 0b00001100) == 0b00001100){
	sub	a, #0x0c
	jr	NZ, 00106$
;src/player.c:639: make_cloth_fall(status_of_rack & 0x03);
	push	bc
	ld	a, b
	call	_make_cloth_fall
	pop	bc
;src/player.c:641: make_cloth_fall((status_of_rack + 1) & 0x03);
	ld	a, c
	inc	a
	and	a, #0x03
	call	_make_cloth_fall
	jr	00107$
00106$:
;src/player.c:645: make_cloth_fall(status_of_rack & 0x03);
	ld	a, b
	call	_make_cloth_fall
00107$:
;src/player.c:647: map_components[PLAYER_FLOOR][i>>1].status &= 0xF0;
	ld	a, (#_player_y)
	rlca
	rlca
	and	a, #0x03
	ld	l, a
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
	srl	a
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	inc	hl
	ld	a, (hl)
	and	a, #0xf0
	ld	(hl), a
00109$:
;src/player.c:649: return true;
	ld	a, #0x01
;src/player.c:650: }
	ret
;src/player.c:652: static void make_cloth_fall(uint8_t sprite_in_OAM){
;	---------------------------------
; Function make_cloth_fall
; ---------------------------------
_make_cloth_fall:
;src/player.c:653: clothes_speed |= (0b00000001 << ((sprite_in_OAM)<<1));
	ld	c, a
	add	a, a
	ld	b, a
	ld	a, #0x01
	inc	b
	jr	00106$
00105$:
	add	a, a
00106$:
	dec	b
	jr	NZ,00105$
	ld	hl, #_clothes_speed
	or	a, (hl)
	ld	(hl), a
;src/player.c:654: set_sprite_tile(16 + sprite_in_OAM, get_sprite_tile(16 + sprite_in_OAM) + 2);
	ld	a, c
	add	a, #0x10
	ld	e, a
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1815: return shadow_OAM[nb].tile;
	ld	l, e
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
;src/player.c:654: set_sprite_tile(16 + sprite_in_OAM, get_sprite_tile(16 + sprite_in_OAM) + 2);
	inc	c
	inc	c
;/home/javier/Escritorio/gb_development/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
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
	inc	hl
	inc	hl
	ld	(hl), c
;src/player.c:654: set_sprite_tile(16 + sprite_in_OAM, get_sprite_tile(16 + sprite_in_OAM) + 2);
;src/player.c:655: }
	ret
;src/player.c:657: static bool r_shingled_function(uint8_t epa){
;	---------------------------------
; Function r_shingled_function
; ---------------------------------
_r_shingled_function:
;src/player.c:658: if(epa == CENTER_UP){
	cp	a, #0x31
	jr	NZ, 00102$
;src/player.c:411: if(current_state == state) {return;}
;src/player.c:412: if(current_state == PLAYER_STATE_FALLING){instanciate_collision_puffs();}
	ld	a,(#_current_state)
	cp	a,#0x04
	jr	Z, 00109$
	sub	a, #0x03
	jr	NZ, 00108$
	call	_instanciate_collision_puffs
00108$:
;src/player.c:413: frame_counter = 0;
	ld	hl, #_frame_counter
	ld	(hl), #0x00
;src/player.c:414: current_frame = 0;
	ld	hl, #_current_frame
	ld	(hl), #0x00
;src/player.c:415: current_state = state;
	ld	hl, #_current_state
	ld	(hl), #0x04
;src/player.c:659: switch_state(PLAYER_STATE_HURT);
00109$:
;src/player.c:661: x_speed = 0;
	xor	a, a
	ld	hl, #_x_speed
	ld	(hl+), a
	ld	(hl), a
;src/player.c:662: return true;
	ld	a, #0x01
	ret
00102$:
;src/player.c:664: if(epa == CENTER_DOWN){
	sub	a, #0x32
	jr	NZ, 00104$
;src/player.c:665: play_bump_sfx();
	call	_play_bump_sfx
00104$:
;src/player.c:667: return false;
	xor	a, a
;src/player.c:668: }
	ret
;src/player.c:669: static bool r_spikey_function(uint8_t epa){
;	---------------------------------
; Function r_spikey_function
; ---------------------------------
_r_spikey_function:
;src/player.c:670: if(epa == CENTER_UP){
	cp	a, #0x31
	jr	NZ, 00102$
;src/player.c:411: if(current_state == state) {return;}
;src/player.c:412: if(current_state == PLAYER_STATE_FALLING){instanciate_collision_puffs();}
	ld	a,(#_current_state)
	cp	a,#0x04
	jr	Z, 00109$
	sub	a, #0x03
	jr	NZ, 00108$
	call	_instanciate_collision_puffs
00108$:
;src/player.c:413: frame_counter = 0;
	ld	hl, #_frame_counter
	ld	(hl), #0x00
;src/player.c:414: current_frame = 0;
	ld	hl, #_current_frame
	ld	(hl), #0x00
;src/player.c:415: current_state = state;
	ld	hl, #_current_state
	ld	(hl), #0x04
;src/player.c:671: switch_state(PLAYER_STATE_HURT);
00109$:
;src/player.c:672: y_speed = (int8_t)(HURT_Y_SPEED);
	ld	hl, #_y_speed
	ld	(hl), #0xf8
;src/player.c:673: x_speed = HURT_X_SPEED;
	ld	hl, #_x_speed
	xor	a, a
	ld	(hl+), a
;src/player.c:674: return true;
	ld	a,#0x01
	ld	(hl),a
	ret
00102$:
;src/player.c:676: if(epa == CENTER_DOWN){
	sub	a, #0x32
	jr	NZ, 00104$
;src/player.c:677: play_bump_sfx();
	call	_play_bump_sfx
00104$:
;src/player.c:679: return false;
	xor	a, a
;src/player.c:680: }
	ret
;src/player.c:681: static bool r_initf_function(uint8_t epa){
;	---------------------------------
; Function r_initf_function
; ---------------------------------
_r_initf_function:
;src/player.c:682: game_started_flag = epa == CENTER_UP;
	sub	a, #0x31
	ld	a, #0x01
	jr	Z, 00121$
	xor	a, a
00121$:
	ld	c, a
	ld	hl, #_game_started_flag
	ld	(hl), c
;src/player.c:683: return (bool)(epa != CENTER_UP || (joy & J_DOWN));
	bit	0, c
	jr	Z, 00104$
	ld	a, (#_joy)
	rrca
	rrca
	rrca
	and	a,#0x01
	ret	Z
00104$:
	ld	a, #0x01
;src/player.c:684: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__puff_frame:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__rect_functions:
	.dw _r_solid_function
	.dw _r_traversable_function
	.dw _r_inactive_function
	.dw _r_bouncy_function
	.dw _r_shingled_function
	.dw _r_spikey_function
	.dw _r_initf_function
	.area _CABS (ABS)
