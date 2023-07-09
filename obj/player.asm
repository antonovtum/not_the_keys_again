;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module player
	.optsdcc -mgbz80
	
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
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$player_dead_flag$0_0$0==.
_player_dead_flag::
	.ds 1
Fplayer$frame_counter$0_0$0==.
_frame_counter:
	.ds 1
Fplayer$current_frame$0_0$0==.
_current_frame:
	.ds 1
G$a_not_pressed$0_0$0==.
_a_not_pressed::
	.ds 1
Fplayer$i$0_0$0==.
_i:
	.ds 1
Fplayer$joy$0_0$0==.
_joy:
	.ds 1
Fplayer$x_force$0_0$0==.
_x_force:
	.ds 1
Fplayer$x_speed$0_0$0==.
_x_speed:
	.ds 1
Fplayer$is_facing_right$0_0$0==.
_is_facing_right:
	.ds 1
Fplayer$is_grounded$0_0$0==.
_is_grounded:
	.ds 1
Fplayer$is_jumping$0_0$0==.
_is_jumping:
	.ds 1
Fplayer$y_speed$0_0$0==.
_y_speed:
	.ds 1
Fplayer$player_x$0_0$0==.
_player_x:
	.ds 1
Fplayer$player_y$0_0$0==.
_player_y:
	.ds 1
Fplayer$last_x$0_0$0==.
_last_x:
	.ds 1
Fplayer$last_y$0_0$0==.
_last_y:
	.ds 1
Fplayer$current_state$0_0$0==.
_current_state:
	.ds 1
Fplayer$current_coyote_frames$0_0$0==.
_current_coyote_frames:
	.ds 1
G$score$0_0$0==.
_score::
	.ds 2
Fplayer$max_player_y$0_0$0==.
_max_player_y:
	.ds 1
Fplayer$test_max_player_y$0_0$0==.
_test_max_player_y:
	.ds 1
Fplayer$highest_visited_floor$0_0$0==.
_highest_visited_floor:
	.ds 1
Fplayer$next_free_puff$0_0$0==.
_next_free_puff:
	.ds 1
Fplayer$brick_frame$0_0$0==.
_brick_frame:
	.ds 1
Fplayer$brick_y_speed$0_0$0==.
_brick_y_speed:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
Fplayer$puff_frame$0_0$0==.
_puff_frame:
	.ds 4
Fplayer$rect_functions$0_0$0==.
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
	G$player_init$0$0	= .
	.globl	G$player_init$0$0
	C$player.c$127$0_0$153	= .
	.globl	C$player.c$127$0_0$153
;src/player.c:127: void player_init(void)
;	---------------------------------
; Function player_init
; ---------------------------------
_player_init::
	C$player.c$129$1_0$153	= .
	.globl	C$player.c$129$1_0$153
;src/player.c:129: player_dead_flag = false;
	ld	hl, #_player_dead_flag
	ld	(hl), #0x00
	C$player.c$131$1_0$153	= .
	.globl	C$player.c$131$1_0$153
;src/player.c:131: OBP0_REG = 0xE4; //11100100
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
	C$player.c$134$1_0$153	= .
	.globl	C$player.c$134$1_0$153
;src/player.c:134: set_sprite_data(TILE_NUM_START, PLAYER_SPRITES, playerSprites);
	ld	de, #_playerSprites
	push	de
	ld	hl, #0x1800
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$player.c$135$1_0$153	= .
	.globl	C$player.c$135$1_0$153
;src/player.c:135: set_sprite_data(PLAYER_SPRITES, 3, Sfx);
	ld	de, #_Sfx
	push	de
	ld	hl, #0x318
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$player.c$137$1_0$153	= .
	.globl	C$player.c$137$1_0$153
;src/player.c:137: frame_counter = 0;
	ld	hl, #_frame_counter
	ld	(hl), #0x00
	C$player.c$138$1_0$153	= .
	.globl	C$player.c$138$1_0$153
;src/player.c:138: current_frame = 0;
	ld	hl, #_current_frame
	ld	(hl), #0x00
	C$player.c$139$1_0$153	= .
	.globl	C$player.c$139$1_0$153
;src/player.c:139: current_state = PLAYER_STATE_IDLE;
	ld	hl, #_current_state
	ld	(hl), #0x00
	C$player.c$140$1_0$153	= .
	.globl	C$player.c$140$1_0$153
;src/player.c:140: x_force = 0U;
	ld	hl, #_x_force
	ld	(hl), #0x00
	C$player.c$141$1_0$153	= .
	.globl	C$player.c$141$1_0$153
;src/player.c:141: x_speed = 0U;
	ld	hl, #_x_speed
	ld	(hl), #0x00
	C$player.c$142$1_0$153	= .
	.globl	C$player.c$142$1_0$153
;src/player.c:142: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
	C$player.c$143$1_0$153	= .
	.globl	C$player.c$143$1_0$153
;src/player.c:143: player_x = last_x = 16U;
	ld	hl, #_last_x
	ld	(hl), #0x10
	ld	hl, #_player_x
	ld	(hl), #0x10
	C$player.c$144$1_0$153	= .
	.globl	C$player.c$144$1_0$153
;src/player.c:144: player_y = last_y = 128U;
	ld	hl, #_last_y
	ld	(hl), #0x80
	ld	hl, #_player_y
	ld	(hl), #0x80
	C$player.c$145$1_0$153	= .
	.globl	C$player.c$145$1_0$153
;src/player.c:145: is_facing_right = true;
	ld	hl, #_is_facing_right
	ld	(hl), #0x01
	C$player.c$146$1_0$153	= .
	.globl	C$player.c$146$1_0$153
;src/player.c:146: is_grounded = true;
	ld	hl, #_is_grounded
	ld	(hl), #0x01
	C$player.c$147$1_0$153	= .
	.globl	C$player.c$147$1_0$153
;src/player.c:147: next_free_puff = 0;
	ld	hl, #_next_free_puff
	ld	(hl), #0x00
	C$player.c$148$1_0$153	= .
	.globl	C$player.c$148$1_0$153
;src/player.c:148: score = 0;
	xor	a, a
	ld	hl, #_score
	ld	(hl+), a
	ld	(hl), a
	C$player.c$149$1_0$153	= .
	.globl	C$player.c$149$1_0$153
;src/player.c:149: highest_visited_floor = 1;
	ld	hl, #_highest_visited_floor
	ld	(hl), #0x01
	C$player.c$150$1_0$153	= .
	.globl	C$player.c$150$1_0$153
;src/player.c:150: max_player_y = 0;
	ld	hl, #_max_player_y
	ld	(hl), #0x00
	C$player.c$151$1_0$153	= .
	.globl	C$player.c$151$1_0$153
;src/player.c:151: a_not_pressed = true;
	ld	hl, #_a_not_pressed
	ld	(hl), #0x01
	C$player.c$152$1_0$153	= .
	.globl	C$player.c$152$1_0$153
;src/player.c:152: current_coyote_frames = 0;
	ld	hl, #_current_coyote_frames
	ld	(hl), #0x00
	C$player.c$153$1_0$153	= .
	.globl	C$player.c$153$1_0$153
;src/player.c:153: joy = 0;
	ld	hl, #_joy
	ld	(hl), #0x00
;src/player.c:154: move_metasprite(idle_metasprites[0], TILE_NUM_START, SPR_NUM_START, player_x, player_y);
	ld	hl, #_idle_metasprites
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
;C:/gbdk/include/gb/metasprites.h:138: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), c
	inc	hl
	ld	(hl), a
;C:/gbdk/include/gb/metasprites.h:139: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/gbdk/include/gb/metasprites.h:140: return __move_metasprite(base_sprite, x, y);
	ld	hl, #0x8010
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	___move_metasprite
	add	sp, #3
	C$player.c$156$1_0$153	= .
	.globl	C$player.c$156$1_0$153
;src/player.c:156: set_sprite_data(0x1B, 2, brick_particle);
	ld	de, #_brick_particle
	push	de
	ld	hl, #0x21b
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x1b
	ld	hl, #(_shadow_OAM + 54)
	ld	(hl), #0x1b
	ld	hl, #(_shadow_OAM + 58)
	ld	(hl), #0x1c
	ld	hl, #(_shadow_OAM + 62)
	ld	(hl), #0x1c
	C$player.c$161$1_0$153	= .
	.globl	C$player.c$161$1_0$153
;src/player.c:161: brick_frame = 0;
	ld	hl, #_brick_frame
	ld	(hl), #0x00
	C$player.c$162$1_0$153	= .
	.globl	C$player.c$162$1_0$153
;src/player.c:162: }
	C$player.c$162$1_0$153	= .
	.globl	C$player.c$162$1_0$153
	XG$player_init$0$0	= .
	.globl	XG$player_init$0$0
	ret
G$jump_g$0_0$0 == .
_jump_g:
	.db #0x02	; 2
G$fall_g$0_0$0 == .
_fall_g:
	.db #0x04	; 4
G$impulse$0_0$0 == .
_impulse:
	.db #0x02	; 2
G$jump_power$0_0$0 == .
_jump_power:
	.db #0xdd	; -35
G$clamp_x_velocity$0_0$0 == .
_clamp_x_velocity:
	.db #0x08	; 8
G$clamp_y_velocity$0_0$0 == .
_clamp_y_velocity:
	.db #0x19	;  25
	G$compute_player_frame$0$0	= .
	.globl	G$compute_player_frame$0$0
	C$player.c$164$1_0$170	= .
	.globl	C$player.c$164$1_0$170
;src/player.c:164: void compute_player_frame(void)
;	---------------------------------
; Function compute_player_frame
; ---------------------------------
_compute_player_frame::
	C$player.c$166$1_0$170	= .
	.globl	C$player.c$166$1_0$170
;src/player.c:166: if(current_state == PLAYER_STATE_HURT){
	ld	a, (#_current_state)
	sub	a, #0x04
	jr	NZ, 00102$
	C$player.c$167$2_0$171	= .
	.globl	C$player.c$167$2_0$171
;src/player.c:167: hurt_frame();
	call	_hurt_frame
	jr	00103$
00102$:
	C$player.c$170$2_0$172	= .
	.globl	C$player.c$170$2_0$172
;src/player.c:170: retrieve_input();
	call	_retrieve_input
	C$player.c$172$2_0$172	= .
	.globl	C$player.c$172$2_0$172
;src/player.c:172: calculate_physics();
	call	_calculate_physics
00103$:
	C$player.c$178$1_0$170	= .
	.globl	C$player.c$178$1_0$170
;src/player.c:178: check_collisions();
	call	_check_collisions
	C$player.c$179$1_0$170	= .
	.globl	C$player.c$179$1_0$170
;src/player.c:179: if(y_speed > 0 && (current_state != PLAYER_STATE_HURT && current_state != PLAYER_STATE_FALLING)){
	ld	hl, #_y_speed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00145$
	bit	7, d
	jr	NZ, 00146$
	cp	a, a
	jr	00146$
00145$:
	bit	7, d
	jr	Z, 00146$
	scf
00146$:
	jr	NC, 00105$
	ld	a,(#_current_state)
	cp	a,#0x04
	jr	Z, 00105$
	sub	a, #0x03
	jr	Z, 00105$
	C$player.c$180$2_0$173	= .
	.globl	C$player.c$180$2_0$173
;src/player.c:180: switch_state(PLAYER_STATE_FALLING);
	ld	a, #0x03
	push	af
	inc	sp
	call	_switch_state
	inc	sp
	C$player.c$181$2_0$173	= .
	.globl	C$player.c$181$2_0$173
;src/player.c:181: is_grounded = false;
	ld	hl, #_is_grounded
	ld	(hl), #0x00
	C$player.c$182$2_0$173	= .
	.globl	C$player.c$182$2_0$173
;src/player.c:182: is_jumping = false;
	ld	hl, #_is_jumping
	ld	(hl), #0x00
00105$:
	C$player.c$185$1_0$170	= .
	.globl	C$player.c$185$1_0$170
;src/player.c:185: if(current_state == PLAYER_STATE_FALLING && current_coyote_frames < COYOTE_FRAMES) current_coyote_frames++;
	ld	a, (#_current_state)
	sub	a, #0x03
	jr	NZ, 00109$
	ld	hl, #_current_coyote_frames
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00109$
	inc	(hl)
00109$:
	C$player.c$187$1_0$170	= .
	.globl	C$player.c$187$1_0$170
;src/player.c:187: update_score();
	call	_update_score
	C$player.c$189$1_0$170	= .
	.globl	C$player.c$189$1_0$170
;src/player.c:189: last_x = player_x;
	ld	a, (#_player_x)
	ld	(#_last_x),a
	C$player.c$190$1_0$170	= .
	.globl	C$player.c$190$1_0$170
;src/player.c:190: last_y = player_y;
	ld	a, (#_player_y)
	ld	(#_last_y),a
	C$player.c$192$1_0$170	= .
	.globl	C$player.c$192$1_0$170
;src/player.c:192: render_all_particles();
	call	_render_all_particles
	C$player.c$194$1_0$170	= .
	.globl	C$player.c$194$1_0$170
;src/player.c:194: render_player();
	call	_render_player
	C$player.c$196$1_0$170	= .
	.globl	C$player.c$196$1_0$170
;src/player.c:196: end_frame();
	C$player.c$197$1_0$170	= .
	.globl	C$player.c$197$1_0$170
;src/player.c:197: }
	C$player.c$197$1_0$170	= .
	.globl	C$player.c$197$1_0$170
	XG$compute_player_frame$0$0	= .
	.globl	XG$compute_player_frame$0$0
	jp	_end_frame
	Fplayer$retrieve_input$0$0	= .
	.globl	Fplayer$retrieve_input$0$0
	C$player.c$199$1_0$175	= .
	.globl	C$player.c$199$1_0$175
;src/player.c:199: static void retrieve_input(void){
;	---------------------------------
; Function retrieve_input
; ---------------------------------
_retrieve_input:
	C$player.c$200$1_0$175	= .
	.globl	C$player.c$200$1_0$175
;src/player.c:200: joy = joypad();
	call	_joypad
	ld	hl, #_joy
	ld	(hl), e
	C$player.c$201$1_0$175	= .
	.globl	C$player.c$201$1_0$175
;src/player.c:201: if (joy & J_RIGHT)
	ld	a, (hl)
	bit	0, a
	jr	Z, 00120$
	C$player.c$203$2_0$176	= .
	.globl	C$player.c$203$2_0$176
;src/player.c:203: if(is_grounded)switch_state(PLAYER_STATE_RUNNING);
	ld	hl, #_is_grounded
	bit	0, (hl)
	jr	Z, 00102$
	ld	a, #0x01
	push	af
	inc	sp
	call	_switch_state
	inc	sp
00102$:
	C$player.c$204$2_0$176	= .
	.globl	C$player.c$204$2_0$176
;src/player.c:204: if (!is_facing_right && x_speed)
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	NZ, 00104$
	ld	a, (#_x_speed)
	or	a, a
	jr	Z, 00104$
	C$player.c$206$3_0$177	= .
	.globl	C$player.c$206$3_0$177
;src/player.c:206: x_force = 0;
	ld	hl, #_x_force
	ld	(hl), #0x00
	jr	00121$
00104$:
	C$player.c$210$3_0$178	= .
	.globl	C$player.c$210$3_0$178
;src/player.c:210: is_facing_right = true;
	ld	hl, #_is_facing_right
	ld	(hl), #0x01
	C$player.c$211$3_0$178	= .
	.globl	C$player.c$211$3_0$178
;src/player.c:211: x_force = impulse;
	ld	a, (#_impulse)
	ld	(#_x_force),a
	jr	00121$
00120$:
	C$player.c$214$1_0$175	= .
	.globl	C$player.c$214$1_0$175
;src/player.c:214: else if (joy & J_LEFT)
	bit	1, a
	jr	Z, 00117$
	C$player.c$216$2_0$179	= .
	.globl	C$player.c$216$2_0$179
;src/player.c:216: if(is_grounded)switch_state(PLAYER_STATE_RUNNING);
	ld	hl, #_is_grounded
	bit	0, (hl)
	jr	Z, 00108$
	ld	a, #0x01
	push	af
	inc	sp
	call	_switch_state
	inc	sp
00108$:
	C$player.c$217$2_0$179	= .
	.globl	C$player.c$217$2_0$179
;src/player.c:217: if (is_facing_right && x_speed)
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	Z, 00110$
	ld	a, (#_x_speed)
	or	a, a
	jr	Z, 00110$
	C$player.c$219$3_0$180	= .
	.globl	C$player.c$219$3_0$180
;src/player.c:219: x_force = 0;
	ld	hl, #_x_force
	ld	(hl), #0x00
	jr	00121$
00110$:
	C$player.c$223$3_0$181	= .
	.globl	C$player.c$223$3_0$181
;src/player.c:223: is_facing_right = false;
	ld	hl, #_is_facing_right
	ld	(hl), #0x00
	C$player.c$224$3_0$181	= .
	.globl	C$player.c$224$3_0$181
;src/player.c:224: x_force = impulse;
	ld	a, (#_impulse)
	ld	(#_x_force),a
	jr	00121$
00117$:
	C$player.c$229$2_0$182	= .
	.globl	C$player.c$229$2_0$182
;src/player.c:229: x_force = 0;
	ld	hl, #_x_force
	ld	(hl), #0x00
	C$player.c$230$2_0$182	= .
	.globl	C$player.c$230$2_0$182
;src/player.c:230: if((!x_speed) && (!y_speed)) switch_state(PLAYER_STATE_IDLE);
	ld	a, (#_x_speed)
	or	a, a
	jr	NZ, 00121$
	ld	a, (#_y_speed)
	or	a, a
	jr	NZ, 00121$
	xor	a, a
	push	af
	inc	sp
	call	_switch_state
	inc	sp
00121$:
	C$player.c$201$1_0$175	= .
	.globl	C$player.c$201$1_0$175
;src/player.c:201: if (joy & J_RIGHT)
	ld	a, (#_joy)
	C$player.c$232$1_0$175	= .
	.globl	C$player.c$232$1_0$175
;src/player.c:232: if ((joy & J_A && a_not_pressed) && (is_grounded || current_coyote_frames < COYOTE_FRAMES) && (y_speed >= 0))
	and	a, #0x10
	ld	c, a
	ld	b, #0x00
	ld	a, b
	or	a, c
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
	C$player.c$234$2_0$183	= .
	.globl	C$player.c$234$2_0$183
;src/player.c:234: switch_state(PLAYER_STATE_JUMPING);
	ld	a, #0x02
	push	af
	inc	sp
	call	_switch_state
	inc	sp
	C$player.c$235$2_0$183	= .
	.globl	C$player.c$235$2_0$183
;src/player.c:235: play_jump_sfx();
	call	_play_jump_sfx
	C$player.c$236$2_0$183	= .
	.globl	C$player.c$236$2_0$183
;src/player.c:236: a_not_pressed = false;
	ld	hl, #_a_not_pressed
	ld	(hl), #0x00
	C$player.c$237$2_0$183	= .
	.globl	C$player.c$237$2_0$183
;src/player.c:237: y_speed = jump_power;
	ld	a, (#_jump_power)
	ld	(#_y_speed),a
	C$player.c$238$2_0$183	= .
	.globl	C$player.c$238$2_0$183
;src/player.c:238: is_grounded = false;
	ld	hl, #_is_grounded
	ld	(hl), #0x00
	C$player.c$239$2_0$183	= .
	.globl	C$player.c$239$2_0$183
;src/player.c:239: is_jumping = true;
	ld	hl, #_is_jumping
	ld	(hl), #0x01
	jr	00128$
00127$:
	C$player.c$241$1_0$175	= .
	.globl	C$player.c$241$1_0$175
;src/player.c:241: else if ((!(joy & J_A) || y_speed > 0) && !is_grounded)
	ld	a, b
	or	a, c
	jr	Z, 00125$
	ld	hl, #_y_speed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00224$
	bit	7, d
	jr	NZ, 00225$
	cp	a, a
	jr	00225$
00224$:
	bit	7, d
	jr	Z, 00225$
	scf
00225$:
	jr	NC, 00128$
00125$:
	ld	hl, #_is_grounded
	bit	0, (hl)
	jr	NZ, 00128$
	C$player.c$243$2_0$184	= .
	.globl	C$player.c$243$2_0$184
;src/player.c:243: switch_state(PLAYER_STATE_FALLING);
	ld	a, #0x03
	push	af
	inc	sp
	call	_switch_state
	inc	sp
	C$player.c$244$2_0$184	= .
	.globl	C$player.c$244$2_0$184
;src/player.c:244: stop_jump_sfx();
	call	_stop_jump_sfx
	C$player.c$245$2_0$184	= .
	.globl	C$player.c$245$2_0$184
;src/player.c:245: is_jumping = false;
	ld	hl, #_is_jumping
	ld	(hl), #0x00
00128$:
	C$player.c$247$1_0$175	= .
	.globl	C$player.c$247$1_0$175
;src/player.c:247: if(!(joy & J_A)) a_not_pressed = true;
	ld	a, (#_joy)
	bit	4, a
	ret	NZ
	ld	hl, #_a_not_pressed
	ld	(hl), #0x01
	C$player.c$248$1_0$175	= .
	.globl	C$player.c$248$1_0$175
;src/player.c:248: }
	C$player.c$248$1_0$175	= .
	.globl	C$player.c$248$1_0$175
	XFplayer$retrieve_input$0$0	= .
	.globl	XFplayer$retrieve_input$0$0
	ret
	Fplayer$calculate_physics$0$0	= .
	.globl	Fplayer$calculate_physics$0$0
	C$player.c$250$1_0$186	= .
	.globl	C$player.c$250$1_0$186
;src/player.c:250: static void calculate_physics(void){
;	---------------------------------
; Function calculate_physics
; ---------------------------------
_calculate_physics:
	add	sp, #-3
	C$player.c$255$1_0$186	= .
	.globl	C$player.c$255$1_0$186
;src/player.c:255: player_x = is_facing_right ? player_x + (x_speed >> PHYSICS_DAMPNER) /*+ (x_force >> 2)*/ : player_x - (x_speed >> PHYSICS_DAMPNER) /*- (x_force >> 2)*/;
	ld	hl, #_x_speed
	ld	c, (hl)
	srl	c
	srl	c
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	Z, 00111$
	ld	a, (#_player_x)
	add	a, c
	jr	00112$
00111$:
	ld	a, (#_player_x)
	sub	a, c
00112$:
	ld	hl, #_player_x
	C$player.c$256$1_0$186	= .
	.globl	C$player.c$256$1_0$186
;src/player.c:256: if((uint8_t)(player_x - 10U) > 160U) {
	ld	(hl), a
	add	a, #0xf6
	ld	c, a
	ld	a, #0xa0
	sub	a, c
	jr	NC, 00105$
	C$player.c$257$2_0$187	= .
	.globl	C$player.c$257$2_0$187
;src/player.c:257: if((uint8_t)(player_x - 10U) < 200) player_x = player_x - 160U; //right exit
	ld	a, c
	sub	a, #0xc8
	jr	NC, 00102$
	ld	a, (hl)
	add	a, #0x60
	ld	(hl), a
	jr	00105$
00102$:
	C$player.c$258$2_0$187	= .
	.globl	C$player.c$258$2_0$187
;src/player.c:258: else player_x = player_x + 160U; //left exit
	ld	hl, #_player_x
	ld	a, (hl)
	add	a, #0xa0
	ld	(hl), a
00105$:
	C$player.c$260$1_0$186	= .
	.globl	C$player.c$260$1_0$186
;src/player.c:260: if (x_force)
	ld	a, (#_x_force)
	or	a, a
	jr	Z, 00107$
	C$player.c$263$2_0$188	= .
	.globl	C$player.c$263$2_0$188
;src/player.c:263: x_speed = x_speed >= clamp_x_velocity ? clamp_x_velocity : x_speed + x_force;
	ld	hl, #_clamp_x_velocity
	ld	c, (hl)
	ld	a, (#_x_speed)
	sub	a, c
	jr	C, 00113$
	ld	a, c
	jr	00114$
00113$:
	ld	a, (#_x_speed)
	ld	hl, #_x_force
	add	a, (hl)
00114$:
	ld	(#_x_speed),a
	jr	00108$
00107$:
	C$player.c$268$2_0$189	= .
	.globl	C$player.c$268$2_0$189
;src/player.c:268: x_speed = x_speed <= 0 ? 0 : MAX(0, x_speed - impulse);
	ld	a, (#_x_speed)
	or	a,a
;	spillPairReg hl
;	spillPairReg hl
	jr	Z, 00116$
	ld	a, (#_x_speed)
	ld	e, #0x00
	ld	hl, #_impulse
	ld	c, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	sub	a, l
	ld	a, e
	sbc	a, h
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	Z, 00117$
	xor	a, a
;	spillPairReg hl
;	spillPairReg hl
	jr	00118$
00117$:
	ld	a, (#_x_speed)
	sub	a, c
;	spillPairReg hl
;	spillPairReg hl
00118$:
00116$:
	ld	(_x_speed), a
00108$:
	C$player.c$271$1_0$186	= .
	.globl	C$player.c$271$1_0$186
;src/player.c:271: player_y += (y_speed >> (PHYSICS_DAMPNER + 1)) + ((is_jumping ? jump_g : fall_g) >> 2);
	ld	hl, #_y_speed
	ld	c, (hl)
	sra	c
	sra	c
	sra	c
	ld	a, (#_jump_g)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_fall_g)
	ldhl	sp,	#2
	ld	(hl), a
	ld	hl, #_is_jumping
	bit	0, (hl)
	jr	Z, 00119$
	ldhl	sp,	#0
	ld	a, (hl)
	jr	00120$
00119$:
	ldhl	sp,	#2
	ld	a, (hl)
00120$:
	rrca
	rrca
	and	a, #0x3f
	add	a, c
	ld	hl, #_player_y
	ld	c, (hl)
	add	a, c
	ld	(hl), a
	C$player.c$274$1_0$186	= .
	.globl	C$player.c$274$1_0$186
;src/player.c:274: y_speed = y_speed >= clamp_y_velocity ? clamp_y_velocity : y_speed + (is_jumping ? jump_g : fall_g);
	ld	a, (#_clamp_y_velocity)
	ldhl	sp,	#1
	ld	(hl), a
	ld	e, (hl)
	ld	a, (#_y_speed)
	ld	d,a
	ldhl	sp,	#1
	sub	a, (hl)
	bit	7, e
	jr	Z, 00175$
	bit	7, d
	jr	NZ, 00176$
	cp	a, a
	jr	00176$
00175$:
	bit	7, d
	jr	Z, 00176$
	scf
00176$:
	jr	C, 00121$
	ldhl	sp,	#1
	ld	a, (hl)
	jr	00122$
00121$:
	ld	hl, #_is_jumping
	bit	0, (hl)
	jr	Z, 00123$
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
00123$:
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_y_speed
	add	a, (hl)
00122$:
	ld	(#_y_speed),a
	C$player.c$275$1_0$186	= .
	.globl	C$player.c$275$1_0$186
;src/player.c:275: }
	add	sp, #3
	C$player.c$275$1_0$186	= .
	.globl	C$player.c$275$1_0$186
	XFplayer$calculate_physics$0$0	= .
	.globl	XFplayer$calculate_physics$0$0
	ret
	Fplayer$render_player$0$0	= .
	.globl	Fplayer$render_player$0$0
	C$player.c$277$1_0$191	= .
	.globl	C$player.c$277$1_0$191
;src/player.c:277: static void render_player(void){
;	---------------------------------
; Function render_player
; ---------------------------------
_render_player:
	add	sp, #-8
	C$player.c$281$1_0$191	= .
	.globl	C$player.c$281$1_0$191
;src/player.c:281: if(!player_dead_flag && (uint8_t)(player_y - camera_y) > 160U) {
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
	C$player.c$282$2_0$192	= .
	.globl	C$player.c$282$2_0$192
;src/player.c:282: player_dead_flag = true;
	ld	hl, #_player_dead_flag
	ld	(hl), #0x01
	C$player.c$283$2_0$192	= .
	.globl	C$player.c$283$2_0$192
;src/player.c:283: calculate_final_score();
	call	_calculate_final_score
	C$player.c$284$2_0$192	= .
	.globl	C$player.c$284$2_0$192
;src/player.c:284: stop_sfx();
	call	_stop_sfx
	C$player.c$285$2_0$192	= .
	.globl	C$player.c$285$2_0$192
;src/player.c:285: return;
	jp	00127$
00102$:
	C$player.c$288$1_0$191	= .
	.globl	C$player.c$288$1_0$191
;src/player.c:288: hide_metasprite(metasprites_states[current_state][current_frame], 0);
	ld	hl, #_current_state
	ld	b, (hl)
	ld	e, #0x00
	ld	a, (#_current_frame)
	ld	c, #0x00
	sla	b
	rl	e
	ldhl	sp,	#0
	ld	(hl), b
	inc	hl
	ld	(hl), e
	inc	hl
	add	a, a
	rl	c
	ld	(hl+), a
	ld	(hl), c
	C$player.c$287$1_0$191	= .
	.globl	C$player.c$287$1_0$191
;src/player.c:287: if(current_state == PLAYER_STATE_HURT && (frame_counter & 0x02)){
	ld	a, (#_current_state)
	sub	a, #0x04
	jr	NZ, 00107$
	ld	a, (#_frame_counter)
	bit	1, a
	jr	Z, 00107$
;src/player.c:288: hide_metasprite(metasprites_states[current_state][current_frame], 0);
	ld	de, #_metasprites_states
	pop	hl
	push	hl
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
;C:/gbdk/include/gb/metasprites.h:241: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), c
	inc	hl
	ld	(hl), a
;C:/gbdk/include/gb/metasprites.h:242: __hide_metasprite(base_sprite);
	xor	a, a
	push	af
	inc	sp
	call	___hide_metasprite
	inc	sp
;src/player.c:289: hide_metasprite(metasprites_states[current_state][current_frame], 4);
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
;C:/gbdk/include/gb/metasprites.h:241: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl+), a
	ld	(hl), c
;C:/gbdk/include/gb/metasprites.h:242: __hide_metasprite(base_sprite);
	ld	a, #0x04
	push	af
	inc	sp
	call	___hide_metasprite
	inc	sp
	C$player.c$290$2_0$193	= .
	.globl	C$player.c$290$2_0$193
;src/player.c:290: if(frame_counter & 0x01)play_hurt_sfx();
	ld	a, (#_frame_counter)
	rrca
	jp	NC,00127$
	call	_play_hurt_sfx
	C$player.c$291$2_0$193	= .
	.globl	C$player.c$291$2_0$193
;src/player.c:291: return;
	jp	00127$
00107$:
	C$player.c$294$1_0$191	= .
	.globl	C$player.c$294$1_0$191
;src/player.c:294: is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, player_x, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, player_x, (uint8_t)(player_y - camera_y));
	ld	a, (#_player_x)
	ldhl	sp,	#4
	ld	(hl), a
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	Z, 00129$
	ld	de, #_metasprites_states
	pop	hl
	push	hl
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:/gbdk/include/gb/metasprites.h:138: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/gbdk/include/gb/metasprites.h:139: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/gbdk/include/gb/metasprites.h:140: return __move_metasprite(base_sprite, x, y);
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	h, (hl)
	ld	l, #0x00
	push	hl
	call	___move_metasprite
	add	sp, #3
	C$player.c$294$3_0$204	= .
	.globl	C$player.c$294$3_0$204
;src/player.c:294: is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, player_x, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, player_x, (uint8_t)(player_y - camera_y));
	jr	00130$
00129$:
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	de, #_metasprites_states
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
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
;C:/gbdk/include/gb/metasprites.h:167: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), c
	inc	hl
	ld	(hl), a
;C:/gbdk/include/gb/metasprites.h:168: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/gbdk/include/gb/metasprites.h:169: return __move_metasprite_vflip(base_sprite, x - 8, y);
	ldhl	sp,	#4
	ld	a, (hl+)
	add	a, #0xf8
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x00
	push	hl
	call	___move_metasprite_vflip
	add	sp, #3
	C$player.c$294$3_0$207	= .
	.globl	C$player.c$294$3_0$207
;src/player.c:294: is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, player_x, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, player_x, (uint8_t)(player_y - camera_y));
00130$:
	C$player.c$288$1_0$191	= .
	.globl	C$player.c$288$1_0$191
;src/player.c:288: hide_metasprite(metasprites_states[current_state][current_frame], 0);
	ld	hl, #_current_state
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #_current_frame
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	sla	e
	rl	d
	add	hl, hl
	ld	c, l
	ld	b, h
	C$player.c$295$1_0$191	= .
	.globl	C$player.c$295$1_0$191
;src/player.c:295: if((uint8_t)(player_x) > 160U) {
	ld	a, #0xa0
	ld	hl, #_player_x
	sub	a, (hl)
	jp	NC, 00113$
	C$player.c$281$1_0$191	= .
	.globl	C$player.c$281$1_0$191
;src/player.c:281: if(!player_dead_flag && (uint8_t)(player_y - camera_y) > 160U) {
	ld	a, (#_player_y)
	ld	hl, #_camera_y
	sub	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	C$player.c$296$1_0$191	= .
	.globl	C$player.c$296$1_0$191
;src/player.c:296: if((uint8_t)(player_x) < 200) is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, player_x - 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, player_x - 160, (uint8_t)(player_y - camera_y)); //right exit
	ld	a, (#_player_x)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (#_player_x)
	sub	a, #0xc8
	jr	NC, 00110$
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	Z, 00131$
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(hl), a
	ld	a, (#_player_x)
	add	a, #0x60
	ldhl	sp,	#6
	ld	(hl), a
	ld	hl, #_metasprites_states
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	add	hl, bc
	ld	a, (hl+)
	ld	c, (hl)
;C:/gbdk/include/gb/metasprites.h:138: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl+), a
	ld	(hl), c
;C:/gbdk/include/gb/metasprites.h:139: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/gbdk/include/gb/metasprites.h:140: return __move_metasprite(base_sprite, x, y);
	ldhl	sp,	#7
	ld	a, (hl-)
	push	af
	inc	sp
	ld	h, (hl)
	ld	l, #0x04
	push	hl
	call	___move_metasprite
	add	sp, #3
	C$player.c$296$4_0$210	= .
	.globl	C$player.c$296$4_0$210
;src/player.c:296: if((uint8_t)(player_x) < 200) is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, player_x - 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, player_x - 160, (uint8_t)(player_y - camera_y)); //right exit
	jp	00114$
00131$:
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, #0x60
	ld	(hl), a
	ld	hl, #_metasprites_states
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	add	hl, bc
	ld	a, (hl+)
	ld	c, (hl)
;C:/gbdk/include/gb/metasprites.h:167: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl+), a
	ld	(hl), c
;C:/gbdk/include/gb/metasprites.h:168: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/gbdk/include/gb/metasprites.h:169: return __move_metasprite_vflip(base_sprite, x - 8, y);
	ldhl	sp,	#7
	ld	a, (hl-)
	add	a, #0xf8
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x04
	push	hl
	call	___move_metasprite_vflip
	add	sp, #3
	C$player.c$296$2_0$194	= .
	.globl	C$player.c$296$2_0$194
;src/player.c:296: if((uint8_t)(player_x) < 200) is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, player_x - 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, player_x - 160, (uint8_t)(player_y - camera_y)); //right exit
	jr	00114$
00110$:
	C$player.c$297$2_0$194	= .
	.globl	C$player.c$297$2_0$194
;src/player.c:297: else is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, player_x + 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, player_x + 160, (uint8_t)(player_y - camera_y)); //left exit
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	Z, 00133$
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(hl), a
	ld	a, (#_player_x)
	add	a, #0xa0
	ldhl	sp,	#6
	ld	(hl), a
	ld	hl, #_metasprites_states
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	add	hl, bc
	ld	a, (hl+)
	ld	c, (hl)
;C:/gbdk/include/gb/metasprites.h:138: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl+), a
	ld	(hl), c
;C:/gbdk/include/gb/metasprites.h:139: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/gbdk/include/gb/metasprites.h:140: return __move_metasprite(base_sprite, x, y);
	ldhl	sp,	#7
	ld	a, (hl-)
	push	af
	inc	sp
	ld	h, (hl)
	ld	l, #0x04
	push	hl
	call	___move_metasprite
	add	sp, #3
	C$player.c$297$4_0$216	= .
	.globl	C$player.c$297$4_0$216
;src/player.c:297: else is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, player_x + 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, player_x + 160, (uint8_t)(player_y - camera_y)); //left exit
	jr	00114$
00133$:
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, #0xa0
	ld	(hl), a
	ld	hl, #_metasprites_states
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	add	hl, bc
	ld	a, (hl+)
	ld	c, (hl)
;C:/gbdk/include/gb/metasprites.h:167: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl+), a
	ld	(hl), c
;C:/gbdk/include/gb/metasprites.h:168: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/gbdk/include/gb/metasprites.h:169: return __move_metasprite_vflip(base_sprite, x - 8, y);
	ldhl	sp,	#7
	ld	a, (hl-)
	add	a, #0xf8
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x04
	push	hl
	call	___move_metasprite_vflip
	add	sp, #3
	C$player.c$297$1_0$191	= .
	.globl	C$player.c$297$1_0$191
;src/player.c:297: else is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, player_x + 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, player_x + 160, (uint8_t)(player_y - camera_y)); //left exit
	jr	00114$
00113$:
;src/player.c:299: hide_metasprite(metasprites_states[current_state][current_frame], 4);
	ld	hl, #_metasprites_states
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	add	hl, bc
	ld	a, (hl+)
	ld	c, (hl)
;C:/gbdk/include/gb/metasprites.h:241: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl+), a
	ld	(hl), c
;C:/gbdk/include/gb/metasprites.h:242: __hide_metasprite(base_sprite);
	ld	a, #0x04
	push	af
	inc	sp
	call	___hide_metasprite
	inc	sp
	C$player.c$299$1_0$191	= .
	.globl	C$player.c$299$1_0$191
;src/player.c:299: hide_metasprite(metasprites_states[current_state][current_frame], 4);
00114$:
	C$player.c$302$1_0$191	= .
	.globl	C$player.c$302$1_0$191
;src/player.c:302: if((uint8_t)(player_y - camera_y) < MAX_SPRITE_HEIGHT && !player_dead_flag){
	ld	a, (#_player_y)
	ld	hl, #_camera_y
	sub	a, (hl)
	ld	c, a
	sub	a, #0x1a
	jr	NC, 00127$
	ld	hl, #_player_dead_flag
	bit	0, (hl)
	jr	NZ, 00127$
	C$player.c$303$2_0$196	= .
	.globl	C$player.c$303$2_0$196
;src/player.c:303: camera_y -= MAX_SPRITE_HEIGHT - ((uint8_t)(player_y - camera_y));
	ld	a, #0x1a
	sub	a, c
	ld	c, a
	ld	hl, #_camera_y
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
00127$:
	C$player.c$305$1_0$191	= .
	.globl	C$player.c$305$1_0$191
;src/player.c:305: }
	add	sp, #8
	C$player.c$305$1_0$191	= .
	.globl	C$player.c$305$1_0$191
	XFplayer$render_player$0$0	= .
	.globl	XFplayer$render_player$0$0
	ret
	Fplayer$render_all_particles$0$0	= .
	.globl	Fplayer$render_all_particles$0$0
	C$player.c$307$1_0$225	= .
	.globl	C$player.c$307$1_0$225
;src/player.c:307: static void render_all_particles(void){
;	---------------------------------
; Function render_all_particles
; ---------------------------------
_render_all_particles:
	add	sp, #-6
	C$player.c$309$2_0$226	= .
	.globl	C$player.c$309$2_0$226
;src/player.c:309: for(i = 0; i < MAX_PUFF; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00127$:
	C$player.c$310$3_0$227	= .
	.globl	C$player.c$310$3_0$227
;src/player.c:310: if(puff_frame[i] == 0){
	ld	a, #<(_puff_frame)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_puff_frame)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	c, a
	C$player.c$311$1_0$225	= .
	.globl	C$player.c$311$1_0$225
;src/player.c:311: hide_sprite(FIRST_PUFF + i);
	ld	a, (hl)
	add	a, #0x08
	ld	b, a
	C$player.c$310$3_0$227	= .
	.globl	C$player.c$310$3_0$227
;src/player.c:310: if(puff_frame[i] == 0){
	ld	a, c
	or	a, a
	jr	NZ, 00102$
;src/player.c:311: hide_sprite(FIRST_PUFF + i);
;C:/gbdk/include/gb/gb.h:1546: shadow_OAM[nb].y = 0;
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
	C$player.c$312$4_0$228	= .
	.globl	C$player.c$312$4_0$228
;src/player.c:312: continue;
	jr	00103$
00102$:
;src/player.c:314: set_sprite_tile(FIRST_PUFF + i, PLAYER_SPRITES - 1 + (puff_frame[i] >> 2));
	ld	a, c
	rrca
	rrca
	and	a, #0x3f
	add	a, #0x17
	ld	c, a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
	C$player.c$315$3_0$227	= .
	.globl	C$player.c$315$3_0$227
;src/player.c:315: puff_frame[i] = (puff_frame[i] + 1) & 0x0f; //puff_frame[i]++ mod 16 
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
	C$player.c$309$2_0$226	= .
	.globl	C$player.c$309$2_0$226
;src/player.c:309: for(i = 0; i < MAX_PUFF; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00127$
	C$player.c$319$1_0$225	= .
	.globl	C$player.c$319$1_0$225
;src/player.c:319: if(brick_frame == 0){
	ld	a, (#_brick_frame)
	or	a, a
	jr	NZ, 00106$
	C$player.c$320$2_0$229	= .
	.globl	C$player.c$320$2_0$229
;src/player.c:320: hide_sprites_range(12, 16);
	ld	hl, #0x100c
	push	hl
	call	_hide_sprites_range
	pop	hl
	jr	00107$
00106$:
	C$player.c$323$2_0$230	= .
	.globl	C$player.c$323$2_0$230
;src/player.c:323: brick_frame--;
	ld	hl, #_brick_frame
	dec	(hl)
;src/player.c:324: scroll_sprite(12, 1, brick_y_speed>>1);
	ld	hl, #_brick_y_speed
	ld	e, (hl)
	sra	e
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+48
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, e
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	inc	a
	ld	(bc), a
;src/player.c:325: scroll_sprite(13, -1, brick_y_speed>>1);
	ld	e, (hl)
	sra	e
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+52
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, e
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	dec	a
	ld	(bc), a
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+56
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	inc	a
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	inc	a
	ld	(bc), a
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+60
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	inc	a
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	dec	a
	ld	(bc), a
	C$player.c$328$2_0$230	= .
	.globl	C$player.c$328$2_0$230
;src/player.c:328: brick_y_speed++;
	inc	(hl)
00107$:
	C$player.c$332$1_0$225	= .
	.globl	C$player.c$332$1_0$225
;src/player.c:332: if(current_state != PLAYER_STATE_RUNNING) return;
	ld	a, (#_current_state)
	dec	a
	jp	NZ,00128$
	C$player.c$333$1_0$225	= .
	.globl	C$player.c$333$1_0$225
;src/player.c:333: if((frame_counter != 0) || (!(current_frame == 0 || current_frame == 3))) return;
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
	C$player.c$336$1_0$225	= .
	.globl	C$player.c$336$1_0$225
;src/player.c:336: i = FIRST_PUFF + next_free_puff;
	ld	a, (#_next_free_puff)
	add	a, #0x08
	ld	hl, #_i
	ld	(hl), a
;src/player.c:337: set_sprite_tile(i, PLAYER_SPRITES);
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
;src/player.c:338: set_sprite_prop(i, get_sprite_prop(i) & 0xDF); // reset the flip
	ld	hl, #_i
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1503: return shadow_OAM[nb].prop;
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
;src/player.c:338: set_sprite_prop(i, get_sprite_prop(i) & 0xDF); // reset the flip
	res	5, c
	ld	hl, #_i
;C:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
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
	C$player.c$339$1_0$225	= .
	.globl	C$player.c$339$1_0$225
;src/player.c:339: puff_frame[next_free_puff] = 4;
	ld	a, #<(_puff_frame)
	ld	hl, #_next_free_puff
	add	a, (hl)
	ld	c, a
	ld	a, #>(_puff_frame)
	adc	a, #0x00
	ld	b, a
	ld	a, #0x04
	ld	(bc), a
;src/player.c:340: move_sprite(i, player_x + X_OFFSET, (uint8_t)((player_y + Y_OFFSET) - camera_y));
	ld	a, (#_player_y)
	add	a, #0x08
	ld	hl, #_camera_y
	ld	c, (hl)
	sub	a, c
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_player_x)
	add	a, #0xfc
	ldhl	sp,	#3
	ld	(hl), a
	ld	hl, #_i
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
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
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
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
	C$player.c$341$1_0$225	= .
	.globl	C$player.c$341$1_0$225
;src/player.c:341: if(!is_facing_right) set_sprite_prop(i, S_FLIPX); //flip if facing left
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	NZ, 00115$
	ld	hl, #_i
;C:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	l, (hl)
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
	inc	hl
	ld	(hl), #0x20
	C$player.c$341$1_0$225	= .
	.globl	C$player.c$341$1_0$225
;src/player.c:341: if(!is_facing_right) set_sprite_prop(i, S_FLIPX); //flip if facing left
00115$:
	C$player.c$343$1_0$225	= .
	.globl	C$player.c$343$1_0$225
;src/player.c:343: next_free_puff = (next_free_puff + 1) & 0x03;
	ld	hl, #_next_free_puff
	ld	a, (hl)
	inc	a
	and	a, #0x03
	ld	(hl), a
00128$:
	C$player.c$344$1_0$225	= .
	.globl	C$player.c$344$1_0$225
;src/player.c:344: }
	add	sp, #6
	C$player.c$344$1_0$225	= .
	.globl	C$player.c$344$1_0$225
	XFplayer$render_all_particles$0$0	= .
	.globl	XFplayer$render_all_particles$0$0
	ret
	Fplayer$instanciate_collision_puffs$0$0	= .
	.globl	Fplayer$instanciate_collision_puffs$0$0
	C$player.c$346$1_0$265	= .
	.globl	C$player.c$346$1_0$265
;src/player.c:346: static void instanciate_collision_puffs(void){
;	---------------------------------
; Function instanciate_collision_puffs
; ---------------------------------
_instanciate_collision_puffs:
	C$player.c$348$1_0$265	= .
	.globl	C$player.c$348$1_0$265
;src/player.c:348: uint8_t i = FIRST_PUFF + next_free_puff;
	ld	a, (#_next_free_puff)
	add	a, #0x08
	ld	c, a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
;C:/gbdk/include/gb/gb.h:1503: return shadow_OAM[nb].prop;
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
;src/player.c:350: set_sprite_prop(i, get_sprite_prop(i) & 0xDF); // remove flip
	res	5, c
;C:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	inc	hl
	ld	(hl), c
	C$player.c$351$1_0$265	= .
	.globl	C$player.c$351$1_0$265
;src/player.c:351: puff_frame[next_free_puff] = 4;
	ld	a, #<(_puff_frame)
	ld	hl, #_next_free_puff
	add	a, (hl)
	ld	c, a
	ld	a, #>(_puff_frame)
	adc	a, #0x00
	ld	b, a
	ld	a, #0x04
	ld	(bc), a
;src/player.c:352: move_sprite(i, player_x + X_OFFSET - 8U, (uint8_t)((player_y + Y_OFFSET) - camera_y));
	ld	a, (#_player_y)
	add	a, #0x08
	ld	hl, #_camera_y
	ld	c, (hl)
	sub	a, c
	ld	b, a
	ld	a, (#_player_x)
	add	a, #0xf4
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$player.c$354$1_0$265	= .
	.globl	C$player.c$354$1_0$265
;src/player.c:354: next_free_puff = (next_free_puff + 1) & 0x03;
	ld	hl, #_next_free_puff
	ld	a, (hl)
	inc	a
	and	a, #0x03
	ld	(hl), a
	C$player.c$356$1_0$265	= .
	.globl	C$player.c$356$1_0$265
;src/player.c:356: i = FIRST_PUFF + next_free_puff;
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
;C:/gbdk/include/gb/gb.h:1503: return shadow_OAM[nb].prop;
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
;src/player.c:358: set_sprite_prop(i, get_sprite_prop(i) | 0x20); // add flip
	set	5, c
;C:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	inc	hl
	ld	(hl), c
	C$player.c$359$1_0$265	= .
	.globl	C$player.c$359$1_0$265
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
;src/player.c:360: move_sprite(i, player_x + X_OFFSET + 8U, (uint8_t)((player_y + Y_OFFSET) - camera_y));
	ld	a, (#_player_y)
	add	a, #0x08
	ld	hl, #_camera_y
	ld	c, (hl)
	sub	a, c
	ld	b, a
	ld	a, (#_player_x)
	add	a, #0x04
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$player.c$362$1_0$265	= .
	.globl	C$player.c$362$1_0$265
;src/player.c:362: next_free_puff = (next_free_puff + 1) & 0x03;
	ld	hl, #_next_free_puff
	ld	a, (hl)
	inc	a
	and	a, #0x03
	ld	(hl), a
	C$player.c$363$1_0$265	= .
	.globl	C$player.c$363$1_0$265
;src/player.c:363: }
	C$player.c$363$1_0$265	= .
	.globl	C$player.c$363$1_0$265
	XFplayer$instanciate_collision_puffs$0$0	= .
	.globl	XFplayer$instanciate_collision_puffs$0$0
	ret
	Fplayer$instanciate_brick_particles$0$0	= .
	.globl	Fplayer$instanciate_brick_particles$0$0
	C$player.c$365$1_0$291	= .
	.globl	C$player.c$365$1_0$291
;src/player.c:365: static void instanciate_brick_particles(void){
;	---------------------------------
; Function instanciate_brick_particles
; ---------------------------------
_instanciate_brick_particles:
	C$player.c$367$1_0$291	= .
	.globl	C$player.c$367$1_0$291
;src/player.c:367: uint8_t particle_x = ((3 + (i<<1 & 0x0C)) << 3) + 14u;
	ld	a, (#_i)
	add	a, a
	and	a, #0x0c
	add	a, #0x03
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x0e
	ld	c, a
	C$player.c$368$1_0$291	= .
	.globl	C$player.c$368$1_0$291
;src/player.c:368: uint8_t particle_y = (((PLAYER_FLOOR << 3) + 1 + ((~i & 0x01) << 2)) << 3) - camera_y + 16u;
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
;src/player.c:369: move_sprite(12, particle_x, particle_y);
	ld	e, c
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), e
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
	C$player.c$373$1_0$291	= .
	.globl	C$player.c$373$1_0$291
;src/player.c:373: brick_frame = 10;
	ld	hl, #_brick_frame
	ld	(hl), #0x0a
	C$player.c$374$1_0$291	= .
	.globl	C$player.c$374$1_0$291
;src/player.c:374: brick_y_speed = -5;
	ld	hl, #_brick_y_speed
	ld	(hl), #0xfb
	C$player.c$375$1_0$291	= .
	.globl	C$player.c$375$1_0$291
;src/player.c:375: }
	C$player.c$375$1_0$291	= .
	.globl	C$player.c$375$1_0$291
	XFplayer$instanciate_brick_particles$0$0	= .
	.globl	XFplayer$instanciate_brick_particles$0$0
	ret
	Fplayer$hurt_frame$0$0	= .
	.globl	Fplayer$hurt_frame$0$0
	C$player.c$377$1_0$305	= .
	.globl	C$player.c$377$1_0$305
;src/player.c:377: static void hurt_frame(void){
;	---------------------------------
; Function hurt_frame
; ---------------------------------
_hurt_frame:
	C$player.c$378$1_0$305	= .
	.globl	C$player.c$378$1_0$305
;src/player.c:378: if(frame_counter >= HURT_FRAMES){
	ld	a, (#_frame_counter)
	sub	a, #0x15
	jr	C, 00102$
	C$player.c$379$2_0$306	= .
	.globl	C$player.c$379$2_0$306
;src/player.c:379: switch_state(PLAYER_STATE_FALLING);
	ld	a, #0x03
	push	af
	inc	sp
	call	_switch_state
	inc	sp
	C$player.c$380$2_0$306	= .
	.globl	C$player.c$380$2_0$306
;src/player.c:380: stop_hurt_sfx();
	C$player.c$381$2_0$306	= .
	.globl	C$player.c$381$2_0$306
;src/player.c:381: return;
	jp	_stop_hurt_sfx
00102$:
	C$player.c$383$1_0$305	= .
	.globl	C$player.c$383$1_0$305
;src/player.c:383: player_x = is_facing_right ? player_x - (x_speed >> PHYSICS_DAMPNER) : player_x + (x_speed >> PHYSICS_DAMPNER);
	ld	hl, #_x_speed
	ld	c, (hl)
	srl	c
	srl	c
	ld	hl, #_is_facing_right
	bit	0, (hl)
	jr	Z, 00105$
	ld	a, (#_player_x)
	sub	a, c
	jr	00106$
00105$:
	ld	a, (#_player_x)
	add	a, c
00106$:
	ld	(#_player_x),a
	C$player.c$384$1_0$305	= .
	.globl	C$player.c$384$1_0$305
;src/player.c:384: player_y += (y_speed >> PHYSICS_DAMPNER);
	ld	a, (#_y_speed)
	sra	a
	sra	a
	ld	hl, #_player_y
	ld	c, (hl)
	add	a, c
	ld	(hl), a
	C$player.c$385$1_0$305	= .
	.globl	C$player.c$385$1_0$305
;src/player.c:385: y_speed = y_speed >= clamp_y_velocity ? clamp_y_velocity : y_speed + HURT_G;
	ld	hl, #_clamp_y_velocity
	ld	c, (hl)
	ld	e, c
	ld	a, (#_y_speed)
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00124$
	bit	7, d
	jr	NZ, 00125$
	cp	a, a
	jr	00125$
00124$:
	bit	7, d
	jr	Z, 00125$
	scf
00125$:
	jr	NC, 00108$
	ld	hl, #_y_speed
	ld	c, (hl)
	inc	c
	inc	c
00108$:
	ld	hl, #_y_speed
	ld	(hl), c
	C$player.c$386$1_0$305	= .
	.globl	C$player.c$386$1_0$305
;src/player.c:386: }
	C$player.c$386$1_0$305	= .
	.globl	C$player.c$386$1_0$305
	XFplayer$hurt_frame$0$0	= .
	.globl	XFplayer$hurt_frame$0$0
	ret
	Fplayer$end_frame$0$0	= .
	.globl	Fplayer$end_frame$0$0
	C$player.c$388$1_0$308	= .
	.globl	C$player.c$388$1_0$308
;src/player.c:388: static void end_frame(void){
;	---------------------------------
; Function end_frame
; ---------------------------------
_end_frame:
	C$player.c$389$1_0$308	= .
	.globl	C$player.c$389$1_0$308
;src/player.c:389: if(frame_counter == (uint8_t)(metasprites_speeds[current_state][current_frame])){
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
	jr	NC, 00125$
	inc	b
00125$:
	ld	a, (bc)
	ld	c, a
	ld	a, (#_frame_counter)
	sub	a, c
	jr	NZ, 00104$
	C$player.c$390$2_0$309	= .
	.globl	C$player.c$390$2_0$309
;src/player.c:390: frame_counter = 0;
	ld	hl, #_frame_counter
	ld	(hl), #0x00
	C$player.c$391$2_0$309	= .
	.globl	C$player.c$391$2_0$309
;src/player.c:391: current_frame++;
	ld	hl, #_current_frame
	inc	(hl)
	C$player.c$392$2_0$309	= .
	.globl	C$player.c$392$2_0$309
;src/player.c:392: if(current_frame == frames_in_state[current_state]){current_frame = 0;}
	ld	bc, #_frames_in_state+0
	ld	a, c
	ld	hl, #_current_state
	add	a, (hl)
	ld	c, a
	jr	NC, 00128$
	inc	b
00128$:
	ld	a, (bc)
	ld	c, a
	ld	a, (#_current_frame)
	sub	a, c
	jr	NZ, 00105$
	ld	hl, #_current_frame
	ld	(hl), #0x00
	jr	00105$
00104$:
	C$player.c$394$2_0$311	= .
	.globl	C$player.c$394$2_0$311
;src/player.c:394: frame_counter++;
	ld	hl, #_frame_counter
	inc	(hl)
00105$:
	C$player.c$397$1_0$308	= .
	.globl	C$player.c$397$1_0$308
;src/player.c:397: if(!rand_init){
	ld	hl, #_rand_init
	bit	0, (hl)
	ret	NZ
	C$player.c$398$2_0$312	= .
	.globl	C$player.c$398$2_0$312
;src/player.c:398: r = r ^ DIV_REG ^ (current_frame << frame_counter);
	ldh	a, (_DIV_REG + 0)
	ld	hl, #_r
	xor	a, (hl)
	ld	hl, #_frame_counter
	ld	b, (hl)
	ld	hl, #_current_frame
	ld	c, (hl)
	inc	b
	jr	00132$
00131$:
	sla	c
00132$:
	dec	b
	jr	NZ,00131$
	xor	a, c
	ld	(#_r),a
	C$player.c$400$1_0$308	= .
	.globl	C$player.c$400$1_0$308
;src/player.c:400: }
	C$player.c$400$1_0$308	= .
	.globl	C$player.c$400$1_0$308
	XFplayer$end_frame$0$0	= .
	.globl	XFplayer$end_frame$0$0
	ret
	Fplayer$switch_state$0$0	= .
	.globl	Fplayer$switch_state$0$0
	C$player.c$402$1_0$314	= .
	.globl	C$player.c$402$1_0$314
;src/player.c:402: static inline void switch_state(PlayerState state){
;	---------------------------------
; Function switch_state
; ---------------------------------
_switch_state:
	C$player.c$403$1_0$314	= .
	.globl	C$player.c$403$1_0$314
;src/player.c:403: if(current_state == state) {return;}
	ld	a, (#_current_state)
	ldhl	sp,	#2
	sub	a, (hl)
	ret	Z
	jr	00102$
00102$:
	C$player.c$404$1_0$314	= .
	.globl	C$player.c$404$1_0$314
;src/player.c:404: if(current_state == PLAYER_STATE_FALLING){instanciate_collision_puffs();}
	ld	a, (#_current_state)
	sub	a, #0x03
	jr	NZ, 00104$
	call	_instanciate_collision_puffs
00104$:
	C$player.c$405$1_0$314	= .
	.globl	C$player.c$405$1_0$314
;src/player.c:405: frame_counter = 0;
	ld	hl, #_frame_counter
	ld	(hl), #0x00
	C$player.c$406$1_0$314	= .
	.globl	C$player.c$406$1_0$314
;src/player.c:406: current_frame = 0;
	ld	hl, #_current_frame
	ld	(hl), #0x00
	C$player.c$407$1_0$314	= .
	.globl	C$player.c$407$1_0$314
;src/player.c:407: current_state = state;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_current_state),a
	C$player.c$408$1_0$314	= .
	.globl	C$player.c$408$1_0$314
;src/player.c:408: }
	C$player.c$408$1_0$314	= .
	.globl	C$player.c$408$1_0$314
	XFplayer$switch_state$0$0	= .
	.globl	XFplayer$switch_state$0$0
	ret
	Fplayer$check_collisions$0$0	= .
	.globl	Fplayer$check_collisions$0$0
	C$player.c$412$1_0$319	= .
	.globl	C$player.c$412$1_0$319
;src/player.c:412: static void check_collisions(void){
;	---------------------------------
; Function check_collisions
; ---------------------------------
_check_collisions:
	add	sp, #-15
	C$player.c$414$2_0$319	= .
	.globl	C$player.c$414$2_0$319
;src/player.c:414: for(i=0; i<8; i++){
	ld	hl, #_i
	ld	(hl), #0x00
00133$:
	C$player.c$415$3_0$320	= .
	.globl	C$player.c$415$3_0$320
;src/player.c:415: r = &rect_list[PLAYER_FLOOR][i];
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
	ldhl	sp,	#2
	ld	(hl), c
	inc	hl
	C$player.c$416$3_0$320	= .
	.globl	C$player.c$416$3_0$320
;src/player.c:416: if(r->type == INACTIVE) continue;
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
	C$player.c$417$3_0$320	= .
	.globl	C$player.c$417$3_0$320
;src/player.c:417: if(!point_vs_rect(r)) {
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_point_vs_rect
	pop	hl
	bit	0, e
	jp	Z, 00131$
	C$player.c$421$4_0$322	= .
	.globl	C$player.c$421$4_0$322
;src/player.c:421: uint8_t external_point_area = 0x00;
	ld	c, #0x00
	C$player.c$426$3_1$322	= .
	.globl	C$player.c$426$3_1$322
;src/player.c:426: external_point_area |= (last_x >= (r->x + r->size_x)) ? 0x10 : (last_x <= r->x) ? 0x20 : 0x30;        
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#13
	ld	a, b
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#2
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
	ld	a, (de)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl), a
	ld	a, (#_last_x)
	ldhl	sp,	#13
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#13
	ld	e, l
	ld	d, h
	ldhl	sp,	#11
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00257$
	bit	7, d
	jr	NZ, 00258$
	cp	a, a
	jr	00258$
00257$:
	bit	7, d
	jr	Z, 00258$
	scf
00258$:
	jr	C, 00136$
	ld	de, #0x0010
	jr	00137$
00136$:
	ld	a, b
	ld	hl, #_last_x
	sub	a, (hl)
	jr	C, 00138$
	ld	de, #0x0020
	jr	00139$
00138$:
	ld	de, #0x0030
00139$:
00137$:
	ld	a, e
	or	a, c
	ldhl	sp,	#4
	C$player.c$427$3_1$322	= .
	.globl	C$player.c$427$3_1$322
;src/player.c:427: external_point_area |= (last_y <= (r->y - r->size_y)) ? 0x01 : (last_y >= r->y) ? 0x02 : 0x03;
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#0
	ld	a, c
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	ld	(hl), #0x00
	pop	de
	push	de
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_last_y)
	ldhl	sp,	#5
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#7
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
	jr	Z, 00259$
	bit	7, d
	jr	NZ, 00260$
	cp	a, a
	jr	00260$
00259$:
	bit	7, d
	jr	Z, 00260$
	scf
00260$:
	jr	C, 00140$
	ld	a, #0x01
	jr	00141$
00140$:
	ld	a, (#_last_y)
	sub	a, c
	jr	C, 00142$
	ldhl	sp,	#7
	ld	a, #0x02
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00143$
00142$:
	ldhl	sp,	#7
	ld	a, #0x03
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00143$:
	ldhl	sp,	#7
	ld	a, (hl+)
00141$:
	ldhl	sp,	#4
	or	a, (hl)
	ld	c, a
	C$player.c$429$3_1$322	= .
	.globl	C$player.c$429$3_1$322
;src/player.c:429: if((player_y > last_y) ? (player_y - last_y) > 50 : (last_y - player_y) > 50){
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
	jr	Z, 00261$
	bit	7, d
	jr	NZ, 00262$
	cp	a, a
	jr	00262$
00261$:
	bit	7, d
	jr	Z, 00262$
	scf
00262$:
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
	jr	Z, 00263$
	bit	7, d
	jr	NZ, 00264$
	cp	a, a
	jr	00264$
00263$:
	bit	7, d
	jr	Z, 00264$
	scf
00264$:
	ld	a, #0x00
	rla
00145$:
	or	a, a
	jr	Z, 00106$
	C$player.c$430$4_1$323	= .
	.globl	C$player.c$430$4_1$323
;src/player.c:430: external_point_area = (external_point_area & 0xF0) + 0x02; //check for overflow height
	ld	a, c
	and	a, #0xf0
	add	a, #0x02
	ld	c, a
00106$:
	C$player.c$433$3_1$322	= .
	.globl	C$player.c$433$3_1$322
;src/player.c:433: if(rect_functions[r->type](external_point_area)) continue;
	ldhl	sp,#2
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
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
	inc	sp
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	pop	bc
	bit	0, l
	jp	NZ, 00131$
	C$player.c$436$3_2$324	= .
	.globl	C$player.c$436$3_2$324
;src/player.c:436: switch (external_point_area)
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
	C$player.c$438$4_2$325	= .
	.globl	C$player.c$438$4_2$325
;src/player.c:438: case RIGHT_UP: // RIGHT - UP
00109$:
	C$player.c$439$4_2$325	= .
	.globl	C$player.c$439$4_2$325
;src/player.c:439: rx = r->x + r->size_x;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,#9
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl), a
	pop	af
	add	a, (hl)
	inc	hl
	ld	(hl), a
	C$player.c$440$4_2$325	= .
	.globl	C$player.c$440$4_2$325
;src/player.c:440: ry = r->y - r->size_y;
	ldhl	sp,#13
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
	ldhl	sp,	#6
	ld	(hl), a
	ld	c, (hl)
	C$player.c$441$4_2$325	= .
	.globl	C$player.c$441$4_2$325
;src/player.c:441: if((ry-player_y)*(last_x - player_x) < (last_y - player_y)*(rx-player_x)){
	ld	b, #0x00
	ld	a, (#_player_y)
	ldhl	sp,	#7
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
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_last_x)
	ld	e, #0x00
	ld	hl, #_player_x
	ld	c, (hl)
	ld	b, #0x00
	sub	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sbc	a, b
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__mulint
	add	sp, #4
	ldhl	sp,	#11
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	pop	bc
	ld	a, (#_last_y)
	ldhl	sp,	#11
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#5
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
	push	bc
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__mulint
	add	sp, #4
	ld	c, e
	ld	b, d
	ldhl	sp,	#9
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00273$
	bit	7, d
	jr	NZ, 00274$
	cp	a, a
	jr	00274$
00273$:
	bit	7, d
	jr	Z, 00274$
	scf
00274$:
	jr	NC, 00111$
	C$player.c$443$5_2$326	= .
	.globl	C$player.c$443$5_2$326
;src/player.c:443: player_x = r->x + r->size_x + 1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, (hl)
	inc	a
	ld	(#_player_x),a
	C$player.c$444$5_2$326	= .
	.globl	C$player.c$444$5_2$326
;src/player.c:444: x_speed = 0;
	ld	hl, #_x_speed
	ld	(hl), #0x00
	jp	00131$
00111$:
	C$player.c$447$5_2$327	= .
	.globl	C$player.c$447$5_2$327
;src/player.c:447: player_y = r->y - r->size_y - 1;
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	ld	(#_player_y),a
	C$player.c$448$5_2$327	= .
	.globl	C$player.c$448$5_2$327
;src/player.c:448: is_grounded = true;
	ld	hl, #_is_grounded
	ld	(hl), #0x01
	C$player.c$449$5_2$327	= .
	.globl	C$player.c$449$5_2$327
;src/player.c:449: current_coyote_frames = 0;
	ld	hl, #_current_coyote_frames
	ld	(hl), #0x00
	C$player.c$450$5_2$327	= .
	.globl	C$player.c$450$5_2$327
;src/player.c:450: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
	C$player.c$452$4_2$325	= .
	.globl	C$player.c$452$4_2$325
;src/player.c:452: break;
	jp	00131$
	C$player.c$454$4_2$325	= .
	.globl	C$player.c$454$4_2$325
;src/player.c:454: case RIGHT_DOWN: // RIGHT - DOWN
00113$:
	C$player.c$455$4_2$325	= .
	.globl	C$player.c$455$4_2$325
;src/player.c:455: rx = r->x + r->size_x;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,#9
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl), a
	pop	af
	add	a, (hl)
	inc	hl
	ld	(hl), a
	C$player.c$456$4_2$325	= .
	.globl	C$player.c$456$4_2$325
;src/player.c:456: ry = r->y;
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl), a
	ld	c, (hl)
	C$player.c$457$4_2$325	= .
	.globl	C$player.c$457$4_2$325
;src/player.c:457: if((ry-player_y)*(last_x - player_x) > (last_y - player_y)*(rx-player_x)){
	ld	b, #0x00
	ld	a, (#_player_y)
	ldhl	sp,	#7
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
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_last_x)
	ld	e, #0x00
	ld	hl, #_player_x
	ld	c, (hl)
	ld	b, #0x00
	sub	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sbc	a, b
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__mulint
	add	sp, #4
	ldhl	sp,	#11
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	pop	bc
	ld	a, (#_last_y)
	ldhl	sp,	#11
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#5
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
	push	bc
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__mulint
	add	sp, #4
	ld	c, e
	ld	b, d
	ldhl	sp,	#9
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00275$
	bit	7, d
	jr	NZ, 00276$
	cp	a, a
	jr	00276$
00275$:
	bit	7, d
	jr	Z, 00276$
	scf
00276$:
	jr	NC, 00115$
	C$player.c$459$5_2$328	= .
	.globl	C$player.c$459$5_2$328
;src/player.c:459: player_x = r->x + r->size_x + 1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, (hl)
	inc	a
	ld	(#_player_x),a
	C$player.c$460$5_2$328	= .
	.globl	C$player.c$460$5_2$328
;src/player.c:460: x_speed = 0;
	ld	hl, #_x_speed
	ld	(hl), #0x00
	jp	00131$
00115$:
	C$player.c$463$5_2$329	= .
	.globl	C$player.c$463$5_2$329
;src/player.c:463: player_y = r->y + 1;
	ldhl	sp,	#6
	ld	a, (hl)
	inc	a
	ld	(#_player_y),a
	C$player.c$464$5_2$329	= .
	.globl	C$player.c$464$5_2$329
;src/player.c:464: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
	C$player.c$467$4_2$325	= .
	.globl	C$player.c$467$4_2$325
;src/player.c:467: break;
	jp	00131$
	C$player.c$469$4_2$325	= .
	.globl	C$player.c$469$4_2$325
;src/player.c:469: case RIGHT_CENTER: // RIGHT - CENTER
00117$:
	C$player.c$470$4_2$325	= .
	.globl	C$player.c$470$4_2$325
;src/player.c:470: player_x = r->x + r->size_x + 1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, c
	inc	a
	ld	(#_player_x),a
	C$player.c$471$4_2$325	= .
	.globl	C$player.c$471$4_2$325
;src/player.c:471: x_speed = 0;
	ld	hl, #_x_speed
	ld	(hl), #0x00
	C$player.c$472$4_2$325	= .
	.globl	C$player.c$472$4_2$325
;src/player.c:472: break;
	jp	00131$
	C$player.c$474$4_2$325	= .
	.globl	C$player.c$474$4_2$325
;src/player.c:474: case LEFT_UP: // LEFT - UP
00118$:
	C$player.c$475$4_2$325	= .
	.globl	C$player.c$475$4_2$325
;src/player.c:475: rx = r->x;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	C$player.c$476$4_2$325	= .
	.globl	C$player.c$476$4_2$325
;src/player.c:476: ry = r->y - r->size_y;
	ldhl	sp,#13
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
	C$player.c$477$4_2$325	= .
	.globl	C$player.c$477$4_2$325
;src/player.c:477: if((ry-player_y)*(last_x - player_x) > (last_y - player_y)*(rx-player_x)){
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
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_last_x)
	ld	e, #0x00
	ld	hl, #_player_x
	ld	c, (hl)
	ld	b, #0x00
	sub	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sbc	a, b
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__mulint
	add	sp, #4
	ldhl	sp,	#10
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	pop	bc
	ld	a, (#_last_y)
	ldhl	sp,	#11
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
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#10
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
	push	bc
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__mulint
	add	sp, #4
	ld	c, e
	ld	b, d
	ldhl	sp,	#8
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00277$
	bit	7, d
	jr	NZ, 00278$
	cp	a, a
	jr	00278$
00277$:
	bit	7, d
	jr	Z, 00278$
	scf
00278$:
	jr	NC, 00120$
	C$player.c$479$5_2$330	= .
	.globl	C$player.c$479$5_2$330
;src/player.c:479: player_x = r->x - 1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	ld	(#_player_x),a
	C$player.c$480$5_2$330	= .
	.globl	C$player.c$480$5_2$330
;src/player.c:480: x_speed = 0;
	ld	hl, #_x_speed
	ld	(hl), #0x00
	jp	00131$
00120$:
	C$player.c$483$5_2$331	= .
	.globl	C$player.c$483$5_2$331
;src/player.c:483: player_y = r->y - r->size_y - 1;
	ldhl	sp,	#5
	ld	a, (hl)
	dec	a
	ld	(#_player_y),a
	C$player.c$484$5_2$331	= .
	.globl	C$player.c$484$5_2$331
;src/player.c:484: is_grounded = true;
	ld	hl, #_is_grounded
	ld	(hl), #0x01
	C$player.c$485$5_2$331	= .
	.globl	C$player.c$485$5_2$331
;src/player.c:485: current_coyote_frames = 0;
	ld	hl, #_current_coyote_frames
	ld	(hl), #0x00
	C$player.c$486$5_2$331	= .
	.globl	C$player.c$486$5_2$331
;src/player.c:486: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
	C$player.c$488$4_2$325	= .
	.globl	C$player.c$488$4_2$325
;src/player.c:488: break;
	jp	00131$
	C$player.c$490$4_2$325	= .
	.globl	C$player.c$490$4_2$325
;src/player.c:490: case LEFT_DOWN: // LEFT - DOWN
00122$:
	C$player.c$491$4_2$325	= .
	.globl	C$player.c$491$4_2$325
;src/player.c:491: rx = r->x;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#12
	C$player.c$492$4_2$325	= .
	.globl	C$player.c$492$4_2$325
;src/player.c:492: ry = r->y;
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	c, (hl)
	C$player.c$493$4_2$325	= .
	.globl	C$player.c$493$4_2$325
;src/player.c:493: if((ry-player_y)*(last_x - player_x) < (last_y - player_y)*(rx-player_x)){
	ld	b, #0x00
	ld	a, (#_player_y)
	ldhl	sp,	#4
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
	ldhl	sp,	#11
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_last_x)
	ld	e, #0x00
	ld	hl, #_player_x
	ld	c, (hl)
	ld	b, #0x00
	sub	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sbc	a, b
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__mulint
	add	sp, #4
	ldhl	sp,	#8
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	pop	bc
	ld	a, (#_last_y)
	ldhl	sp,	#8
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	dec	hl
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
	push	bc
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__mulint
	add	sp, #4
	ld	c, e
	ld	b, d
	ldhl	sp,	#6
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00279$
	bit	7, d
	jr	NZ, 00280$
	cp	a, a
	jr	00280$
00279$:
	bit	7, d
	jr	Z, 00280$
	scf
00280$:
	jr	NC, 00124$
	C$player.c$495$5_2$332	= .
	.globl	C$player.c$495$5_2$332
;src/player.c:495: player_x = r->x - 1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	ld	(#_player_x),a
	C$player.c$496$5_2$332	= .
	.globl	C$player.c$496$5_2$332
;src/player.c:496: x_speed = 0;
	ld	hl, #_x_speed
	ld	(hl), #0x00
	jr	00131$
00124$:
	C$player.c$499$5_2$333	= .
	.globl	C$player.c$499$5_2$333
;src/player.c:499: player_y = r->y + 1;
	ldhl	sp,	#14
	ld	a, (hl)
	inc	a
	ld	(#_player_y),a
	C$player.c$500$5_2$333	= .
	.globl	C$player.c$500$5_2$333
;src/player.c:500: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
	C$player.c$503$4_2$325	= .
	.globl	C$player.c$503$4_2$325
;src/player.c:503: break;
	jr	00131$
	C$player.c$505$4_2$325	= .
	.globl	C$player.c$505$4_2$325
;src/player.c:505: case LEFT_CENTER: // LEFT - CENTER
00126$:
	C$player.c$506$4_2$325	= .
	.globl	C$player.c$506$4_2$325
;src/player.c:506: player_x = r->x - 1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	ld	(#_player_x),a
	C$player.c$507$4_2$325	= .
	.globl	C$player.c$507$4_2$325
;src/player.c:507: x_speed = 0;
	ld	hl, #_x_speed
	ld	(hl), #0x00
	C$player.c$508$4_2$325	= .
	.globl	C$player.c$508$4_2$325
;src/player.c:508: break;
	jr	00131$
	C$player.c$510$4_2$325	= .
	.globl	C$player.c$510$4_2$325
;src/player.c:510: case CENTER_UP: // CENTER - UP
00127$:
	C$player.c$511$4_2$325	= .
	.globl	C$player.c$511$4_2$325
;src/player.c:511: player_y = r->y - r->size_y - 1;
	ldhl	sp,#13
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
	C$player.c$512$4_2$325	= .
	.globl	C$player.c$512$4_2$325
;src/player.c:512: is_grounded = true;
	ld	hl, #_is_grounded
	ld	(hl), #0x01
	C$player.c$513$4_2$325	= .
	.globl	C$player.c$513$4_2$325
;src/player.c:513: current_coyote_frames = 0;
	ld	hl, #_current_coyote_frames
	ld	(hl), #0x00
	C$player.c$514$4_2$325	= .
	.globl	C$player.c$514$4_2$325
;src/player.c:514: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
	C$player.c$515$4_2$325	= .
	.globl	C$player.c$515$4_2$325
;src/player.c:515: break;
	jr	00131$
	C$player.c$517$4_2$325	= .
	.globl	C$player.c$517$4_2$325
;src/player.c:517: case CENTER_DOWN: // CENTER - DOWN
00128$:
	C$player.c$518$4_2$325	= .
	.globl	C$player.c$518$4_2$325
;src/player.c:518: player_y = r->y + 1;
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	a
	ld	(#_player_y),a
	C$player.c$519$4_2$325	= .
	.globl	C$player.c$519$4_2$325
;src/player.c:519: y_speed = 0;
	ld	hl, #_y_speed
	ld	(hl), #0x00
	C$player.c$525$2_0$319	= .
	.globl	C$player.c$525$2_0$319
;src/player.c:525: }
00131$:
	C$player.c$414$2_0$319	= .
	.globl	C$player.c$414$2_0$319
;src/player.c:414: for(i=0; i<8; i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x08
	jp	C, 00133$
	C$player.c$527$2_0$319	= .
	.globl	C$player.c$527$2_0$319
;src/player.c:527: }
	add	sp, #15
	C$player.c$527$2_0$319	= .
	.globl	C$player.c$527$2_0$319
	XFplayer$check_collisions$0$0	= .
	.globl	XFplayer$check_collisions$0$0
	ret
	Fplayer$update_score$0$0	= .
	.globl	Fplayer$update_score$0$0
	C$player.c$529$2_0$335	= .
	.globl	C$player.c$529$2_0$335
;src/player.c:529: static void update_score(void){
;	---------------------------------
; Function update_score
; ---------------------------------
_update_score:
	dec	sp
	dec	sp
	C$player.c$531$1_0$335	= .
	.globl	C$player.c$531$1_0$335
;src/player.c:531: if((PREV_PLAYER_FLOOR != PLAYER_FLOOR) && PLAYER_FLOOR == ((highest_visited_floor - 1) & 0x03)){
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
	ld	c, a
	C$player.c$534$1_0$335	= .
	.globl	C$player.c$534$1_0$335
;src/player.c:534: max_player_y = (uint8_t)((PREV_PLAYER_FLOOR << 6) - player_y);
	ld	a, (hl)
	ldhl	sp,	#1
	C$player.c$531$1_0$335	= .
	.globl	C$player.c$531$1_0$335
;src/player.c:531: if((PREV_PLAYER_FLOOR != PLAYER_FLOOR) && PLAYER_FLOOR == ((highest_visited_floor - 1) & 0x03)){
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jr	Z, 00102$
	ld	hl, #_highest_visited_floor
	ld	e, (hl)
	ld	d, #0x00
	dec	de
	ld	a, e
	and	a, #0x03
	ld	e, a
	ld	d, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	ld	b, #0x00
	sub	a, e
	jr	NZ, 00102$
	ld	a, b
	sub	a, d
	jr	NZ, 00102$
	C$player.c$532$2_0$336	= .
	.globl	C$player.c$532$2_0$336
;src/player.c:532: score += 4;
	ld	hl, #_score
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	C$player.c$533$2_0$336	= .
	.globl	C$player.c$533$2_0$336
;src/player.c:533: highest_visited_floor = PLAYER_FLOOR;
	ld	hl, #_highest_visited_floor
	ld	(hl), c
	C$player.c$534$2_0$336	= .
	.globl	C$player.c$534$2_0$336
;src/player.c:534: max_player_y = (uint8_t)((PREV_PLAYER_FLOOR << 6) - player_y);
	ldhl	sp,	#0
	ld	a, (hl+)
	rrca
	rrca
	and	a, #0xc0
	sub	a, (hl)
	ld	(#_max_player_y),a
	C$player.c$535$2_0$336	= .
	.globl	C$player.c$535$2_0$336
;src/player.c:535: return;
	jr	00108$
00102$:
	C$player.c$538$1_0$335	= .
	.globl	C$player.c$538$1_0$335
;src/player.c:538: if(PLAYER_FLOOR != highest_visited_floor) return;
	ld	a, (#_highest_visited_floor)
	sub	a, c
	jr	NZ, 00108$
	C$player.c$540$1_0$335	= .
	.globl	C$player.c$540$1_0$335
;src/player.c:540: test_max_player_y = (uint8_t)((((PLAYER_FLOOR + 1) & 0x03) << 6) - player_y);
	ld	a, c
	inc	a
	and	a, #0x03
	rrca
	rrca
	and	a, #0xc0
	ldhl	sp,	#1
	sub	a, (hl)
	ld	(#_test_max_player_y),a
	C$player.c$541$1_0$335	= .
	.globl	C$player.c$541$1_0$335
;src/player.c:541: if(max_player_y < test_max_player_y){
	ld	a, (#_max_player_y)
	ld	hl, #_test_max_player_y
	sub	a, (hl)
	jr	NC, 00108$
	C$player.c$542$2_0$337	= .
	.globl	C$player.c$542$2_0$337
;src/player.c:542: max_player_y = test_max_player_y;
	ld	a, (hl)
	ld	(#_max_player_y),a
00108$:
	C$player.c$544$1_0$335	= .
	.globl	C$player.c$544$1_0$335
;src/player.c:544: }
	inc	sp
	inc	sp
	C$player.c$544$1_0$335	= .
	.globl	C$player.c$544$1_0$335
	XFplayer$update_score$0$0	= .
	.globl	XFplayer$update_score$0$0
	ret
	Fplayer$calculate_final_score$0$0	= .
	.globl	Fplayer$calculate_final_score$0$0
	C$player.c$546$1_0$339	= .
	.globl	C$player.c$546$1_0$339
;src/player.c:546: static void calculate_final_score(void){
;	---------------------------------
; Function calculate_final_score
; ---------------------------------
_calculate_final_score:
	C$player.c$547$1_0$339	= .
	.globl	C$player.c$547$1_0$339
;src/player.c:547: score += (max_player_y >> 4);
	ld	a, (#_max_player_y)
	swap	a
	and	a, #0x0f
	ld	c, a
	ld	b, #0x00
	ld	hl, #_score
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_score + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	a, h
	ld	hl, #_score
	ld	(hl), c
	inc	hl
	ld	(hl), a
	C$player.c$548$1_0$339	= .
	.globl	C$player.c$548$1_0$339
;src/player.c:548: }
	C$player.c$548$1_0$339	= .
	.globl	C$player.c$548$1_0$339
	XFplayer$calculate_final_score$0$0	= .
	.globl	XFplayer$calculate_final_score$0$0
	ret
	Fplayer$point_vs_rect$0$0	= .
	.globl	Fplayer$point_vs_rect$0$0
	C$player.c$550$1_0$341	= .
	.globl	C$player.c$550$1_0$341
;src/player.c:550: static inline bool point_vs_rect(rect *r){
;	---------------------------------
; Function point_vs_rect
; ---------------------------------
_point_vs_rect:
	add	sp, #-4
	C$player.c$551$1_0$341	= .
	.globl	C$player.c$551$1_0$341
;src/player.c:551: return (player_x >= r->x && player_y <= r->y && player_x <= (r->x + r->size_x) && player_y >= (r->y - r->size_y));
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (#_player_x)
	ldhl	sp,	#2
	sub	a, (hl)
	jr	C, 00103$
	inc	hl
	pop	bc
	push	bc
	inc	bc
	ld	a, (bc)
	ld	(hl), a
	ld	hl, #_player_y
	sub	a, (hl)
	jr	C, 00103$
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	pop	de
	push	de
	inc	de
	inc	de
	ld	a, (de)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, bc
	push	hl
	ld	hl, #_player_x
	ld	c, (hl)
	pop	hl
	ld	b, #0x00
	ld	e, b
	ld	d, h
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	bit	7, e
	jr	Z, 00125$
	bit	7, d
	jr	NZ, 00126$
	cp	a, a
	jr	00126$
00125$:
	bit	7, d
	jr	Z, 00126$
	scf
00126$:
	jr	C, 00103$
	ldhl	sp,	#3
	ld	c, (hl)
	ld	b, #0x00
	pop	de
	push	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	hl, #_player_y
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, b
	ld	d, h
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	bit	7, e
	jr	Z, 00127$
	bit	7, d
	jr	NZ, 00128$
	cp	a, a
	jr	00128$
00127$:
	bit	7, d
	jr	Z, 00128$
	scf
00128$:
	jr	NC, 00104$
00103$:
	ld	e, #0x00
	jr	00105$
00104$:
	ld	e, #0x01
00105$:
	C$player.c$552$1_0$341	= .
	.globl	C$player.c$552$1_0$341
;src/player.c:552: }
	add	sp, #4
	C$player.c$552$1_0$341	= .
	.globl	C$player.c$552$1_0$341
	XFplayer$point_vs_rect$0$0	= .
	.globl	XFplayer$point_vs_rect$0$0
	ret
	Fplayer$r_solid_function$0$0	= .
	.globl	Fplayer$r_solid_function$0$0
	C$player.c$558$1_0$343	= .
	.globl	C$player.c$558$1_0$343
;src/player.c:558: static bool r_solid_function(uint8_t epa){
;	---------------------------------
; Function r_solid_function
; ---------------------------------
_r_solid_function:
	dec	sp
	dec	sp
	C$player.c$559$1_0$343	= .
	.globl	C$player.c$559$1_0$343
;src/player.c:559: if(epa == CENTER_DOWN){
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x32
	jp	NZ,00111$
	C$player.c$562$3_0$344	= .
	.globl	C$player.c$562$3_0$344
;src/player.c:562: bool is_upper = i & 0x01 == 0x01;
	ld	a, (#_i)
	and	a, #0x01
	ld	c, a
	ldhl	sp,	#0
	ld	(hl), c
	C$player.c$563$1_0$343	= .
	.globl	C$player.c$563$1_0$343
;src/player.c:563: component_at_r = is_upper ? map_components[PLAYER_FLOOR][i>>1].components >> 4 : map_components[PLAYER_FLOOR][i>>1].components & 0x0F;
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
	C$player.c$564$2_0$344	= .
	.globl	C$player.c$564$2_0$344
;src/player.c:564: if(component_at_r == 2){
	sub	a, #0x02
	jp	NZ,00111$
	C$player.c$565$3_0$345	= .
	.globl	C$player.c$565$3_0$345
;src/player.c:565: if(is_upper){
	ldhl	sp,	#0
	bit	0, (hl)
	jp	Z, 00106$
	C$player.c$566$4_0$346	= .
	.globl	C$player.c$566$4_0$346
;src/player.c:566: if((map_components[PLAYER_FLOOR][i>>1].status >> 4) == 0){
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
	C$player.c$567$5_0$347	= .
	.globl	C$player.c$567$5_0$347
;src/player.c:567: play_bump_sfx();
	push	bc
	call	_play_bump_sfx
	pop	bc
	C$player.c$568$5_0$347	= .
	.globl	C$player.c$568$5_0$347
;src/player.c:568: set_bkg_tiles(3 + (i<<1 & 0x0C), (PLAYER_FLOOR << 3) + 1, 4, 1, top_map_02_broken);
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
	C$player.c$569$5_0$347	= .
	.globl	C$player.c$569$5_0$347
;src/player.c:569: map_components[PLAYER_FLOOR][i>>1].status |= 0x10;
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
	C$player.c$570$5_0$347	= .
	.globl	C$player.c$570$5_0$347
;src/player.c:570: return false;
	ld	e, #0x00
	jp	00112$
00102$:
	C$player.c$572$4_0$346	= .
	.globl	C$player.c$572$4_0$346
;src/player.c:572: instanciate_brick_particles();
	push	bc
	call	_instanciate_brick_particles
	call	_play_break_sfx
	pop	bc
	C$player.c$574$4_0$346	= .
	.globl	C$player.c$574$4_0$346
;src/player.c:574: set_bkg_tiles(3 + (i<<1 & 0x0C), (PLAYER_FLOOR << 3) + 1, 4, 1, top_map_00);
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
	C$player.c$575$4_0$346	= .
	.globl	C$player.c$575$4_0$346
;src/player.c:575: map_components[PLAYER_FLOOR][i>>1].components = map_components[PLAYER_FLOOR][i>>1].components & 0x0F;
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
	C$player.c$576$4_0$346	= .
	.globl	C$player.c$576$4_0$346
;src/player.c:576: map_components[PLAYER_FLOOR][i>>1].status = map_components[PLAYER_FLOOR][i>>1].status & 0x0F;
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
	C$player.c$577$4_0$346	= .
	.globl	C$player.c$577$4_0$346
;src/player.c:577: rect_list[PLAYER_FLOOR][i].type = INACTIVE;
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
	C$player.c$579$4_0$348	= .
	.globl	C$player.c$579$4_0$348
;src/player.c:579: if((map_components[PLAYER_FLOOR][i>>1].status & 0x0F) == 0){
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
	C$player.c$580$5_0$349	= .
	.globl	C$player.c$580$5_0$349
;src/player.c:580: play_bump_sfx();
	push	bc
	call	_play_bump_sfx
	pop	bc
	C$player.c$581$5_0$349	= .
	.globl	C$player.c$581$5_0$349
;src/player.c:581: set_bkg_tiles(3 + (i<<1 & 0x0C), (PLAYER_FLOOR << 3) + 5, 4, 2, bot_map_02_broken);
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
	C$player.c$582$5_0$349	= .
	.globl	C$player.c$582$5_0$349
;src/player.c:582: map_components[PLAYER_FLOOR][i>>1].status |= 0x01;
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
	C$player.c$583$5_0$349	= .
	.globl	C$player.c$583$5_0$349
;src/player.c:583: return false;
	ld	e, #0x00
	jp	00112$
00104$:
	C$player.c$585$4_0$348	= .
	.globl	C$player.c$585$4_0$348
;src/player.c:585: instanciate_brick_particles();
	push	bc
	call	_instanciate_brick_particles
	call	_play_break_sfx
	pop	bc
	C$player.c$587$4_0$348	= .
	.globl	C$player.c$587$4_0$348
;src/player.c:587: set_bkg_tiles(3 + (i<<1 & 0x0C), (PLAYER_FLOOR << 3) + 5, 4, 2, bot_map_00);
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
	C$player.c$588$4_0$348	= .
	.globl	C$player.c$588$4_0$348
;src/player.c:588: map_components[PLAYER_FLOOR][i>>1].components = map_components[PLAYER_FLOOR][i>>1].components & 0xF0;
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
	C$player.c$589$4_0$348	= .
	.globl	C$player.c$589$4_0$348
;src/player.c:589: map_components[PLAYER_FLOOR][i>>1].status = map_components[PLAYER_FLOOR][i>>1].status & 0xF0;
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
	C$player.c$590$4_0$348	= .
	.globl	C$player.c$590$4_0$348
;src/player.c:590: rect_list[PLAYER_FLOOR][i].type = INACTIVE;
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
	C$player.c$596$1_0$343	= .
	.globl	C$player.c$596$1_0$343
;src/player.c:596: return false;
	ld	e, #0x00
00112$:
	C$player.c$597$1_0$343	= .
	.globl	C$player.c$597$1_0$343
;src/player.c:597: }
	inc	sp
	inc	sp
	C$player.c$597$1_0$343	= .
	.globl	C$player.c$597$1_0$343
	XFplayer$r_solid_function$0$0	= .
	.globl	XFplayer$r_solid_function$0$0
	ret
	Fplayer$r_traversable_function$0$0	= .
	.globl	Fplayer$r_traversable_function$0$0
	C$player.c$598$1_0$351	= .
	.globl	C$player.c$598$1_0$351
;src/player.c:598: static bool r_traversable_function(uint8_t epa){
;	---------------------------------
; Function r_traversable_function
; ---------------------------------
_r_traversable_function:
	C$player.c$599$1_0$351	= .
	.globl	C$player.c$599$1_0$351
;src/player.c:599: return (bool)(epa != CENTER_UP || (joy & J_DOWN));
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x31
	jr	NZ, 00104$
	ld	a, (#_joy)
	rrca
	rrca
	rrca
	and	a,#0x01
	jr	NZ, 00104$
	ld	e,a
	ret
00104$:
	ld	e, #0x01
	C$player.c$600$1_0$351	= .
	.globl	C$player.c$600$1_0$351
;src/player.c:600: }
	C$player.c$600$1_0$351	= .
	.globl	C$player.c$600$1_0$351
	XFplayer$r_traversable_function$0$0	= .
	.globl	XFplayer$r_traversable_function$0$0
	ret
	Fplayer$r_inactive_function$0$0	= .
	.globl	Fplayer$r_inactive_function$0$0
	C$player.c$601$1_0$353	= .
	.globl	C$player.c$601$1_0$353
;src/player.c:601: static bool r_inactive_function(uint8_t epa){
;	---------------------------------
; Function r_inactive_function
; ---------------------------------
_r_inactive_function:
	C$player.c$602$1_0$353	= .
	.globl	C$player.c$602$1_0$353
;src/player.c:602: return true;
	ld	e, #0x01
	C$player.c$603$1_0$353	= .
	.globl	C$player.c$603$1_0$353
;src/player.c:603: }
	C$player.c$603$1_0$353	= .
	.globl	C$player.c$603$1_0$353
	XFplayer$r_inactive_function$0$0	= .
	.globl	XFplayer$r_inactive_function$0$0
	ret
	Fplayer$r_bouncy_function$0$0	= .
	.globl	Fplayer$r_bouncy_function$0$0
	C$player.c$604$1_0$355	= .
	.globl	C$player.c$604$1_0$355
;src/player.c:604: static bool r_bouncy_function(uint8_t epa){
;	---------------------------------
; Function r_bouncy_function
; ---------------------------------
_r_bouncy_function:
	C$player.c$605$1_0$355	= .
	.globl	C$player.c$605$1_0$355
;src/player.c:605: if(epa == CENTER_UP){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x31
	jp	NZ,00109$
;src/player.c:403: if(current_state == state) {return;}
;src/player.c:404: if(current_state == PLAYER_STATE_FALLING){instanciate_collision_puffs();}
	ld	a,(#_current_state)
	cp	a,#0x02
	jr	Z, 00114$
	sub	a, #0x03
	jr	NZ, 00113$
	call	_instanciate_collision_puffs
00113$:
;src/player.c:405: frame_counter = 0;
	ld	hl, #_frame_counter
	ld	(hl), #0x00
;src/player.c:406: current_frame = 0;
	ld	hl, #_current_frame
	ld	(hl), #0x00
;src/player.c:407: current_state = state;
	ld	hl, #_current_state
	ld	(hl), #0x02
;src/player.c:606: switch_state(PLAYER_STATE_JUMPING);
00114$:
	C$player.c$607$2_0$356	= .
	.globl	C$player.c$607$2_0$356
;src/player.c:607: play_boing_sfx();
	call	_play_boing_sfx
	C$player.c$608$2_0$356	= .
	.globl	C$player.c$608$2_0$356
;src/player.c:608: y_speed = (int8_t)(-45);
	ld	hl, #_y_speed
	ld	(hl), #0xd3
	C$player.c$609$2_0$356	= .
	.globl	C$player.c$609$2_0$356
;src/player.c:609: is_grounded = false;
	ld	hl, #_is_grounded
	ld	(hl), #0x00
	C$player.c$610$2_0$356	= .
	.globl	C$player.c$610$2_0$356
;src/player.c:610: is_jumping = true;
	ld	hl, #_is_jumping
	ld	(hl), #0x01
	C$player.c$614$2_1$357	= .
	.globl	C$player.c$614$2_1$357
;src/player.c:614: if(i & 0x01 == 0x01) {return true;}
	push	hl
	ld	hl, #_i
	bit	0, (hl)
	pop	hl
	jr	Z, 00102$
	ld	e, #0x01
	ret
00102$:
	C$player.c$616$2_1$357	= .
	.globl	C$player.c$616$2_1$357
;src/player.c:616: status_of_rack = map_components[PLAYER_FLOOR][i>>1].status & 0x0F;
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
	C$player.c$625$2_1$357	= .
	.globl	C$player.c$625$2_1$357
;src/player.c:625: if(status_of_rack == 0x00){
	ld	c, a
	or	a, a
	jr	NZ, 00104$
	C$player.c$626$3_1$359	= .
	.globl	C$player.c$626$3_1$359
;src/player.c:626: return true;
	ld	e, #0x01
	ret
00104$:
	C$player.c$628$2_1$357	= .
	.globl	C$player.c$628$2_1$357
;src/player.c:628: if((status_of_rack & 0b00001100) == 0b00001100){
	ld	a, c
	and	a, #0x0c
	ld	e, a
	ld	d, #0x00
	C$player.c$631$1_0$355	= .
	.globl	C$player.c$631$1_0$355
;src/player.c:631: make_cloth_fall(status_of_rack & 0x03);
	ld	a, c
	and	a, #0x03
	ld	b, a
	C$player.c$628$2_1$357	= .
	.globl	C$player.c$628$2_1$357
;src/player.c:628: if((status_of_rack & 0b00001100) == 0b00001100){
	ld	a, e
	sub	a, #0x0c
	or	a, d
	jr	NZ, 00106$
	C$player.c$631$3_1$360	= .
	.globl	C$player.c$631$3_1$360
;src/player.c:631: make_cloth_fall(status_of_rack & 0x03);
	push	bc
	push	bc
	inc	sp
	call	_make_cloth_fall
	inc	sp
	pop	bc
	C$player.c$633$3_1$360	= .
	.globl	C$player.c$633$3_1$360
;src/player.c:633: make_cloth_fall((status_of_rack + 1) & 0x03);
	ld	a, c
	inc	a
	and	a, #0x03
	push	af
	inc	sp
	call	_make_cloth_fall
	inc	sp
	jr	00107$
00106$:
	C$player.c$637$3_1$361	= .
	.globl	C$player.c$637$3_1$361
;src/player.c:637: make_cloth_fall(status_of_rack & 0x03);
	push	bc
	inc	sp
	call	_make_cloth_fall
	inc	sp
00107$:
	C$player.c$639$2_1$357	= .
	.globl	C$player.c$639$2_1$357
;src/player.c:639: map_components[PLAYER_FLOOR][i>>1].status &= 0xF0;
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
	C$player.c$641$1_0$355	= .
	.globl	C$player.c$641$1_0$355
;src/player.c:641: return true;
	ld	e, #0x01
	C$player.c$642$1_0$355	= .
	.globl	C$player.c$642$1_0$355
;src/player.c:642: }
	C$player.c$642$1_0$355	= .
	.globl	C$player.c$642$1_0$355
	XFplayer$r_bouncy_function$0$0	= .
	.globl	XFplayer$r_bouncy_function$0$0
	ret
	Fplayer$make_cloth_fall$0$0	= .
	.globl	Fplayer$make_cloth_fall$0$0
	C$player.c$644$1_0$368	= .
	.globl	C$player.c$644$1_0$368
;src/player.c:644: static void make_cloth_fall(uint8_t sprite_in_OAM){
;	---------------------------------
; Function make_cloth_fall
; ---------------------------------
_make_cloth_fall:
	C$player.c$645$1_0$368	= .
	.globl	C$player.c$645$1_0$368
;src/player.c:645: clothes_speed |= (0b00000001 << ((sprite_in_OAM)<<1));
	ldhl	sp,	#2
	ld	c, (hl)
	ld	a, c
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
;src/player.c:646: set_sprite_tile(16 + sprite_in_OAM, get_sprite_tile(16 + sprite_in_OAM) + 2);
	ld	a, c
	add	a, #0x10
	ld	e, a
;C:/gbdk/include/gb/gb.h:1458: return shadow_OAM[nb].tile;
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
;src/player.c:646: set_sprite_tile(16 + sprite_in_OAM, get_sprite_tile(16 + sprite_in_OAM) + 2);
	inc	c
	inc	c
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
	C$player.c$646$3_0$368	= .
	.globl	C$player.c$646$3_0$368
;src/player.c:646: set_sprite_tile(16 + sprite_in_OAM, get_sprite_tile(16 + sprite_in_OAM) + 2);
	C$player.c$647$3_0$368	= .
	.globl	C$player.c$647$3_0$368
;src/player.c:647: }
	C$player.c$647$3_0$368	= .
	.globl	C$player.c$647$3_0$368
	XFplayer$make_cloth_fall$0$0	= .
	.globl	XFplayer$make_cloth_fall$0$0
	ret
	Fplayer$r_shingled_function$0$0	= .
	.globl	Fplayer$r_shingled_function$0$0
	C$player.c$649$3_0$376	= .
	.globl	C$player.c$649$3_0$376
;src/player.c:649: static bool r_shingled_function(uint8_t epa){
;	---------------------------------
; Function r_shingled_function
; ---------------------------------
_r_shingled_function:
	C$player.c$650$1_0$376	= .
	.globl	C$player.c$650$1_0$376
;src/player.c:650: if(epa == CENTER_UP){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x31
	jr	NZ, 00102$
;src/player.c:403: if(current_state == state) {return;}
	ld	a, (#_current_state)
	sub	a, #0x04
	jr	Z, 00109$
;src/player.c:404: if(current_state == PLAYER_STATE_FALLING){instanciate_collision_puffs();}
	ld	a, (#_current_state)
	sub	a, #0x03
	jr	NZ, 00108$
	call	_instanciate_collision_puffs
00108$:
;src/player.c:405: frame_counter = 0;
	ld	hl, #_frame_counter
	ld	(hl), #0x00
;src/player.c:406: current_frame = 0;
	ld	hl, #_current_frame
	ld	(hl), #0x00
;src/player.c:407: current_state = state;
	ld	hl, #_current_state
	ld	(hl), #0x04
;src/player.c:651: switch_state(PLAYER_STATE_HURT);
00109$:
	C$player.c$652$2_0$377	= .
	.globl	C$player.c$652$2_0$377
;src/player.c:652: y_speed = 10;
	ld	hl, #_y_speed
	ld	(hl), #0x0a
	C$player.c$653$2_0$377	= .
	.globl	C$player.c$653$2_0$377
;src/player.c:653: x_speed = 0;
	ld	hl, #_x_speed
	ld	(hl), #0x00
	C$player.c$654$2_0$377	= .
	.globl	C$player.c$654$2_0$377
;src/player.c:654: return true;
	ld	e, #0x01
	ret
00102$:
	C$player.c$656$1_0$376	= .
	.globl	C$player.c$656$1_0$376
;src/player.c:656: if(epa == CENTER_DOWN){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x32
	jr	NZ, 00104$
	C$player.c$657$2_0$378	= .
	.globl	C$player.c$657$2_0$378
;src/player.c:657: play_bump_sfx();
	call	_play_bump_sfx
00104$:
	C$player.c$659$1_0$376	= .
	.globl	C$player.c$659$1_0$376
;src/player.c:659: return false;
	ld	e, #0x00
	C$player.c$660$1_0$376	= .
	.globl	C$player.c$660$1_0$376
;src/player.c:660: }
	C$player.c$660$1_0$376	= .
	.globl	C$player.c$660$1_0$376
	XFplayer$r_shingled_function$0$0	= .
	.globl	XFplayer$r_shingled_function$0$0
	ret
	Fplayer$r_spikey_function$0$0	= .
	.globl	Fplayer$r_spikey_function$0$0
	C$player.c$661$1_0$385	= .
	.globl	C$player.c$661$1_0$385
;src/player.c:661: static bool r_spikey_function(uint8_t epa){
;	---------------------------------
; Function r_spikey_function
; ---------------------------------
_r_spikey_function:
	C$player.c$662$1_0$385	= .
	.globl	C$player.c$662$1_0$385
;src/player.c:662: if(epa == CENTER_UP){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x31
	jr	NZ, 00102$
;src/player.c:403: if(current_state == state) {return;}
;src/player.c:404: if(current_state == PLAYER_STATE_FALLING){instanciate_collision_puffs();}
	ld	a,(#_current_state)
	cp	a,#0x04
	jr	Z, 00109$
	sub	a, #0x03
	jr	NZ, 00108$
	call	_instanciate_collision_puffs
00108$:
;src/player.c:405: frame_counter = 0;
	ld	hl, #_frame_counter
	ld	(hl), #0x00
;src/player.c:406: current_frame = 0;
	ld	hl, #_current_frame
	ld	(hl), #0x00
;src/player.c:407: current_state = state;
	ld	hl, #_current_state
	ld	(hl), #0x04
;src/player.c:663: switch_state(PLAYER_STATE_HURT);
00109$:
	C$player.c$664$2_0$386	= .
	.globl	C$player.c$664$2_0$386
;src/player.c:664: y_speed = (int8_t)(HURT_Y_SPEED);
	ld	hl, #_y_speed
	ld	(hl), #0xf0
	C$player.c$665$2_0$386	= .
	.globl	C$player.c$665$2_0$386
;src/player.c:665: x_speed = HURT_X_SPEED;
	ld	hl, #_x_speed
	ld	(hl), #0x08
	C$player.c$666$2_0$386	= .
	.globl	C$player.c$666$2_0$386
;src/player.c:666: return true;
	ld	e, #0x01
	ret
00102$:
	C$player.c$668$1_0$385	= .
	.globl	C$player.c$668$1_0$385
;src/player.c:668: if(epa == CENTER_DOWN){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x32
	jr	NZ, 00104$
	C$player.c$669$2_0$387	= .
	.globl	C$player.c$669$2_0$387
;src/player.c:669: play_bump_sfx();
	call	_play_bump_sfx
00104$:
	C$player.c$671$1_0$385	= .
	.globl	C$player.c$671$1_0$385
;src/player.c:671: return false;
	ld	e, #0x00
	C$player.c$672$1_0$385	= .
	.globl	C$player.c$672$1_0$385
;src/player.c:672: }
	C$player.c$672$1_0$385	= .
	.globl	C$player.c$672$1_0$385
	XFplayer$r_spikey_function$0$0	= .
	.globl	XFplayer$r_spikey_function$0$0
	ret
	Fplayer$r_initf_function$0$0	= .
	.globl	Fplayer$r_initf_function$0$0
	C$player.c$673$1_0$394	= .
	.globl	C$player.c$673$1_0$394
;src/player.c:673: static bool r_initf_function(uint8_t epa){
;	---------------------------------
; Function r_initf_function
; ---------------------------------
_r_initf_function:
	C$player.c$674$1_0$394	= .
	.globl	C$player.c$674$1_0$394
;src/player.c:674: game_started_flag = epa == CENTER_UP;
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x31
	ld	a, #0x01
	jr	Z, 00117$
	xor	a, a
00117$:
	ld	c, a
	ld	hl, #_game_started_flag
	ld	(hl), c
	C$player.c$675$1_0$394	= .
	.globl	C$player.c$675$1_0$394
;src/player.c:675: return (bool)(epa != CENTER_UP || (joy & J_DOWN));
	bit	0, c
	jr	Z, 00104$
	ld	a, (#_joy)
	rrca
	rrca
	rrca
	and	a,#0x01
	jr	NZ, 00104$
	ld	e,a
	ret
00104$:
	ld	e, #0x01
	C$player.c$676$1_0$394	= .
	.globl	C$player.c$676$1_0$394
;src/player.c:676: }
	C$player.c$676$1_0$394	= .
	.globl	C$player.c$676$1_0$394
	XFplayer$r_initf_function$0$0	= .
	.globl	XFplayer$r_initf_function$0$0
	ret
	.area _CODE
	.area _INITIALIZER
Fplayer$__xinit_puff_frame$0_0$0 == .
__xinit__puff_frame:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
Fplayer$__xinit_rect_functions$0_0$0 == .
__xinit__rect_functions:
	.dw _r_solid_function
	.dw _r_traversable_function
	.dw _r_inactive_function
	.dw _r_bouncy_function
	.dw _r_shingled_function
	.dw _r_spikey_function
	.dw _r_initf_function
	.area _CABS (ABS)
