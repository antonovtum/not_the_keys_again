;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module PlayerSprites_cinematic
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _look_up
	.globl _fallen
	.globl _pull_1
	.globl _pull_0
	.globl _key_right_1
	.globl _key_right_0
	.globl _key_left_1
	.globl _key_left_0
	.globl _playerSprite_extra
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
_playerSprite_extra:
	.db #0xe0	; 224
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0x38	; 56	'8'
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0xe0	; 224
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0x0c	; 12
	.db #0xf0	; 240
	.db #0x1c	; 28
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x13	; 19
	.db #0x0f	; 15
	.db #0x31	; 49	'1'
	.db #0x0e	; 14
	.db #0x38	; 56	'8'
	.db #0x07	; 7
	.db #0x1b	; 27
	.db #0x0c	; 12
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x11	; 17
	.db #0x0e	; 14
	.db #0x38	; 56	'8'
	.db #0x07	; 7
	.db #0x3b	; 59
	.db #0x0c	; 12
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x07	; 7
	.db #0x39	; 57	'9'
	.db #0x04	; 4
	.db #0x3f	; 63
	.db #0x0e	; 14
	.db #0x7f	; 127
	.db #0x5e	; 94
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x1c	; 28
	.db #0xdc	; 220
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x6f	; 111	'o'
	.db #0xff	; 255
	.db #0x36	; 54	'6'
	.db #0xee	; 238
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xe6	; 230
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x3f	; 63
	.db #0x66	; 102	'f'
	.db #0x7f	; 127
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0xf4	; 244
	.db #0xff	; 255
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
_key_left_0:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_key_left_1:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_key_right_0:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x28	; 40
	.db #0x20	; 32
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x27	; 39
	.db #0x20	; 32
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_key_right_1:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x28	; 40
	.db #0x20	; 32
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x27	; 39
	.db #0x20	; 32
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_pull_0:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x28	; 40
	.db #0x20	; 32
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x27	; 39
	.db #0x20	; 32
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x2e	; 46
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_pull_1:
	.db #0x01	;  1
	.db #0xf8	; -8
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x07	;  7
	.db #0x00	;  0
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0xf9	; -7
	.db #0x08	;  8
	.db #0x12	; 18
	.db #0x20	; 32
	.db #0x07	;  7
	.db #0x00	;  0
	.db #0x2e	; 46
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_fallen:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x2b	; 43
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_look_up:
	.db #0x01	;  1
	.db #0xf8	; -8
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x07	;  7
	.db #0x00	;  0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xf9	; -7
	.db #0x08	;  8
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x07	;  7
	.db #0x00	;  0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
