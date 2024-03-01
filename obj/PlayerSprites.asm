;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module PlayerSprites
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _frames_in_state
	.globl _metasprites_speeds
	.globl _metasprites_states
	.globl _hurt_speed
	.globl _hurt_metasprites
	.globl _hurt0
	.globl _fall_speed
	.globl _fall_metasprites
	.globl _fall0
	.globl _jump_speed
	.globl _jump_metasprites
	.globl _jump0
	.globl _run_speed
	.globl _run_metasprites
	.globl _run5
	.globl _run4
	.globl _run3
	.globl _run2
	.globl _run1
	.globl _run0
	.globl _idle_speed
	.globl _idle_metasprites
	.globl _idle3
	.globl _idle2
	.globl _idle1
	.globl _idle0
	.globl _playerSprites
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
	.area _CODE
_playerSprites:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0x3b	; 59
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0x60	; 96
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0xe8	; 232
	.db #0x30	; 48	'0'
	.db #0x68	; 104	'h'
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x19	; 25
	.db #0x07	; 7
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0x1c	; 28
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xc8	; 200
	.db #0xf0	; 240
	.db #0x98	; 152
	.db #0x60	; 96
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x30	; 48	'0'
	.db #0x0f	; 15
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xcc	; 204
	.db #0xf0	; 240
	.db #0x8c	; 140
	.db #0x70	; 112	'p'
	.db #0x78	; 120	'x'
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x90	; 144
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0x3b	; 59
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0xe8	; 232
	.db #0x30	; 48	'0'
	.db #0x68	; 104	'h'
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x63	; 99	'c'
	.db #0x1f	; 31
	.db #0x61	; 97	'a'
	.db #0x1f	; 31
	.db #0x30	; 48	'0'
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe4	; 228
	.db #0xf8	; 248
	.db #0xce	; 206
	.db #0xf0	; 240
	.db #0x8c	; 140
	.db #0x70	; 112	'p'
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0d	; 13
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x11	; 17
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0xd8	; 216
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x0d	; 13
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x3d	; 61
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x1f	; 31
	.db #0x61	; 97	'a'
	.db #0x1f	; 31
	.db #0x30	; 48	'0'
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0xe4	; 228
	.db #0xf8	; 248
	.db #0xce	; 206
	.db #0xf0	; 240
	.db #0x8c	; 140
	.db #0x70	; 112	'p'
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
_idle0:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_idle1:
	.db #0x01	;  1
	.db #0xf8	; -8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	;  7
	.db #0x00	;  0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xf9	; -7
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x07	;  7
	.db #0x00	;  0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_idle2:
	.db #0x01	;  1
	.db #0xf8	; -8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	;  7
	.db #0x00	;  0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0xf9	; -7
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x07	;  7
	.db #0x00	;  0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_idle3:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_idle_metasprites:
	.dw _idle0
	.dw _idle1
	.dw _idle2
	.dw _idle3
_idle_speed:
	.db #0x1e	; 30
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
_run0:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_run1:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_run2:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_run3:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_run4:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_run5:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_run_metasprites:
	.dw _run0
	.dw _run1
	.dw _run2
	.dw _run3
	.dw _run4
	.dw _run5
_run_speed:
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x07	; 7
_jump0:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x13	; 19
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_jump_metasprites:
	.dw _jump0
_jump_speed:
	.db #0x64	; 100	'd'
_fall0:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_fall_metasprites:
	.dw _fall0
_fall_speed:
	.db #0x64	; 100	'd'
_hurt0:
	.db #0x01	;  1
	.db #0xf8	; -8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	;  7
	.db #0x00	;  0
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0xf9	; -7
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x07	;  7
	.db #0x00	;  0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_hurt_metasprites:
	.dw _fall0
_hurt_speed:
	.db #0x64	; 100	'd'
_metasprites_states:
	.dw _idle_metasprites
	.dw _run_metasprites
	.dw _jump_metasprites
	.dw _fall_metasprites
	.dw _hurt_metasprites
_metasprites_speeds:
	.dw _idle_speed
	.dw _run_speed
	.dw _jump_speed
	.dw _fall_speed
	.dw _hurt_speed
_frames_in_state:
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.area _INITIALIZER
	.area _CABS (ABS)
