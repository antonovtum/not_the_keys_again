;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module soundfx
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _soundfx_38
	.globl _soundfx_37
	.globl _soundfx_2d
	.globl _soundfx_2b
	.globl _soundfx_2a
	.globl _soundfx_1a
	.globl _soundfx_15
	.globl _soundfx_0d
	.globl _soundfx_0b
	.globl _soundfx_08
	.globl _soundfx_01
	.globl b___func_soundfx_38
	.globl ___func_soundfx_38
	.globl b___func_soundfx_37
	.globl ___func_soundfx_37
	.globl b___func_soundfx_2d
	.globl ___func_soundfx_2d
	.globl b___func_soundfx_2b
	.globl ___func_soundfx_2b
	.globl b___func_soundfx_2a
	.globl ___func_soundfx_2a
	.globl b___func_soundfx_1a
	.globl ___func_soundfx_1a
	.globl b___func_soundfx_15
	.globl ___func_soundfx_15
	.globl b___func_soundfx_0d
	.globl ___func_soundfx_0d
	.globl b___func_soundfx_0b
	.globl ___func_soundfx_0b
	.globl b___func_soundfx_08
	.globl ___func_soundfx_08
	.globl b___func_soundfx_01
	.globl ___func_soundfx_01
	.globl ___mute_mask_soundfx_38
	.globl ___mute_mask_soundfx_37
	.globl ___mute_mask_soundfx_2d
	.globl ___mute_mask_soundfx_2b
	.globl ___mute_mask_soundfx_2a
	.globl ___mute_mask_soundfx_1a
	.globl ___mute_mask_soundfx_15
	.globl ___mute_mask_soundfx_0d
	.globl ___mute_mask_soundfx_0b
	.globl ___mute_mask_soundfx_08
	.globl ___mute_mask_soundfx_01
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
___mute_mask_soundfx_01	=	0x0002
___mute_mask_soundfx_08	=	0x000a
___mute_mask_soundfx_0b	=	0x0002
___mute_mask_soundfx_0d	=	0x0002
___mute_mask_soundfx_15	=	0x0002
___mute_mask_soundfx_1a	=	0x0008
___mute_mask_soundfx_2a	=	0x0002
___mute_mask_soundfx_2b	=	0x0002
___mute_mask_soundfx_2d	=	0x000a
___mute_mask_soundfx_37	=	0x000a
___mute_mask_soundfx_38	=	0x0002
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
	.area _CODE_255
;res/soundfx.c:6: BANKREF(soundfx_01)
;	---------------------------------
; Function __func_soundfx_01
; ---------------------------------
	b___func_soundfx_01	= 255
___func_soundfx_01::
	.local b___func_soundfx_01 
	___bank_soundfx_01 = b___func_soundfx_01 
	.globl ___bank_soundfx_01 
;res/soundfx.c:16: BANKREF(soundfx_08)
;	---------------------------------
; Function __func_soundfx_08
; ---------------------------------
	b___func_soundfx_08	= 255
___func_soundfx_08::
	.local b___func_soundfx_08 
	___bank_soundfx_08 = b___func_soundfx_08 
	.globl ___bank_soundfx_08 
;res/soundfx.c:30: BANKREF(soundfx_0b)
;	---------------------------------
; Function __func_soundfx_0b
; ---------------------------------
	b___func_soundfx_0b	= 255
___func_soundfx_0b::
	.local b___func_soundfx_0b 
	___bank_soundfx_0b = b___func_soundfx_0b 
	.globl ___bank_soundfx_0b 
;res/soundfx.c:47: BANKREF(soundfx_0d)
;	---------------------------------
; Function __func_soundfx_0d
; ---------------------------------
	b___func_soundfx_0d	= 255
___func_soundfx_0d::
	.local b___func_soundfx_0d 
	___bank_soundfx_0d = b___func_soundfx_0d 
	.globl ___bank_soundfx_0d 
;res/soundfx.c:60: BANKREF(soundfx_15)
;	---------------------------------
; Function __func_soundfx_15
; ---------------------------------
	b___func_soundfx_15	= 255
___func_soundfx_15::
	.local b___func_soundfx_15 
	___bank_soundfx_15 = b___func_soundfx_15 
	.globl ___bank_soundfx_15 
;res/soundfx.c:77: BANKREF(soundfx_1a)
;	---------------------------------
; Function __func_soundfx_1a
; ---------------------------------
	b___func_soundfx_1a	= 255
___func_soundfx_1a::
	.local b___func_soundfx_1a 
	___bank_soundfx_1a = b___func_soundfx_1a 
	.globl ___bank_soundfx_1a 
;res/soundfx.c:88: BANKREF(soundfx_2a)
;	---------------------------------
; Function __func_soundfx_2a
; ---------------------------------
	b___func_soundfx_2a	= 255
___func_soundfx_2a::
	.local b___func_soundfx_2a 
	___bank_soundfx_2a = b___func_soundfx_2a 
	.globl ___bank_soundfx_2a 
;res/soundfx.c:95: BANKREF(soundfx_2b)
;	---------------------------------
; Function __func_soundfx_2b
; ---------------------------------
	b___func_soundfx_2b	= 255
___func_soundfx_2b::
	.local b___func_soundfx_2b 
	___bank_soundfx_2b = b___func_soundfx_2b 
	.globl ___bank_soundfx_2b 
;res/soundfx.c:120: BANKREF(soundfx_2d)
;	---------------------------------
; Function __func_soundfx_2d
; ---------------------------------
	b___func_soundfx_2d	= 255
___func_soundfx_2d::
	.local b___func_soundfx_2d 
	___bank_soundfx_2d = b___func_soundfx_2d 
	.globl ___bank_soundfx_2d 
;res/soundfx.c:131: BANKREF(soundfx_37)
;	---------------------------------
; Function __func_soundfx_37
; ---------------------------------
	b___func_soundfx_37	= 255
___func_soundfx_37::
	.local b___func_soundfx_37 
	___bank_soundfx_37 = b___func_soundfx_37 
	.globl ___bank_soundfx_37 
;res/soundfx.c:142: BANKREF(soundfx_38)
;	---------------------------------
; Function __func_soundfx_38
; ---------------------------------
	b___func_soundfx_38	= 255
___func_soundfx_38::
	.local b___func_soundfx_38 
	___bank_soundfx_38 = b___func_soundfx_38 
	.globl ___bank_soundfx_38 
	.area _CODE_255
_soundfx_01:
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x77	; 119	'w'
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0x9b	; 155
	.db #0x83	; 131
	.db #0x11	; 17
	.db #0x59	; 89	'Y'
	.db #0x80	; 128
	.db #0x23	; 35
	.db #0x82	; 130
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xc8	; 200
	.db #0x6b	; 107	'k'
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0x98	; 152
	.db #0x9c	; 156
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x07	; 7
_soundfx_08:
	.db #0x12	; 18
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xf8	; 248
	.db #0x2c	; 44
	.db #0x80	; 128
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0xc8	; 200
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x69	; 105	'i'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x80	; 128
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xf8	; 248
	.db #0x77	; 119	'w'
	.db #0x82	; 130
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0x88	; 136
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x2c	; 44
	.db #0x80	; 128
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xe8	; 232
	.db #0x77	; 119	'w'
	.db #0x82	; 130
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0x88	; 136
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xa8	; 168
	.db #0x56	; 86	'V'
	.db #0x83	; 131
	.db #0x6b	; 107	'k'
	.db #0x2a	; 42
	.db #0x48	; 72	'H'
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0x44	; 68	'D'
	.db #0xdd	; 221
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0x28	; 40
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x11	; 17
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x07	; 7
_soundfx_0b:
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x77	; 119	'w'
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xb8	; 184
	.db #0x0a	; 10
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xc8	; 200
	.db #0xed	; 237
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xd8	; 216
	.db #0xce	; 206
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xe8	; 232
	.db #0x56	; 86	'V'
	.db #0x83	; 131
	.db #0x21	; 33
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xf8	; 248
	.db #0x12	; 18
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x59	; 89	'Y'
	.db #0x40	; 64
	.db #0xc6	; 198
	.db #0x82	; 130
	.db #0x01	; 1
	.db #0x59	; 89	'Y'
	.db #0x40	; 64
	.db #0x77	; 119	'w'
	.db #0x82	; 130
	.db #0x21	; 33
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xb8	; 184
	.db #0x23	; 35
	.db #0x82	; 130
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0x88	; 136
	.db #0xc9	; 201
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0x58	; 88	'X'
	.db #0x6b	; 107	'k'
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x59	; 89	'Y'
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x07	; 7
_soundfx_0d:
	.db #0x22	; 34
	.db #0x44	; 68	'D'
	.db #0x77	; 119	'w'
	.db #0x79	; 121	'y'
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0x11	; 17
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x2c	; 44
	.db #0x80	; 128
	.db #0x21	; 33
	.db #0x79	; 121	'y'
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xd6	; 214
	.db #0x86	; 134
	.db #0x11	; 17
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x2c	; 44
	.db #0x80	; 128
	.db #0x21	; 33
	.db #0x79	; 121	'y'
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0x31	; 49	'1'
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x2c	; 44
	.db #0x80	; 128
	.db #0x21	; 33
	.db #0x79	; 121	'y'
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xac	; 172
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x07	; 7
_soundfx_15:
	.db #0x12	; 18
	.db #0x44	; 68	'D'
	.db #0x77	; 119	'w'
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xb8	; 184
	.db #0x0a	; 10
	.db #0x86	; 134
	.db #0x11	; 17
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xc8	; 200
	.db #0xed	; 237
	.db #0x85	; 133
	.db #0x11	; 17
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xd8	; 216
	.db #0xce	; 206
	.db #0x85	; 133
	.db #0x11	; 17
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xe8	; 232
	.db #0x56	; 86	'V'
	.db #0x83	; 131
	.db #0x31	; 49	'1'
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xf8	; 248
	.db #0x12	; 18
	.db #0x83	; 131
	.db #0x11	; 17
	.db #0x59	; 89	'Y'
	.db #0x40	; 64
	.db #0xc6	; 198
	.db #0x82	; 130
	.db #0x11	; 17
	.db #0x59	; 89	'Y'
	.db #0x40	; 64
	.db #0x77	; 119	'w'
	.db #0x82	; 130
	.db #0x31	; 49	'1'
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0xb8	; 184
	.db #0x23	; 35
	.db #0x82	; 130
	.db #0x11	; 17
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0x88	; 136
	.db #0xc9	; 201
	.db #0x81	; 129
	.db #0x11	; 17
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0x58	; 88	'X'
	.db #0x6b	; 107	'k'
	.db #0x81	; 129
	.db #0x11	; 17
	.db #0x59	; 89	'Y'
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x07	; 7
_soundfx_1a:
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xdd	; 221
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0x28	; 40
	.db #0x45	; 69	'E'
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0x68	; 104	'h'
	.db #0x54	; 84	'T'
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0xf8	; 248
	.db #0x45	; 69	'E'
	.db #0x80	; 128
	.db #0x11	; 17
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0xb8	; 184
	.db #0x37	; 55	'7'
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x6b	; 107	'k'
	.db #0x2a	; 42
	.db #0x68	; 104	'h'
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x07	; 7
_soundfx_2a:
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x77	; 119	'w'
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0x08	; 8
	.db #0x2c	; 44
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x07	; 7
_soundfx_2b:
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x77	; 119	'w'
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xa8	; 168
	.db #0x3b	; 59
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xb8	; 184
	.db #0x63	; 99	'c'
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xc8	; 200
	.db #0x89	; 137
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xd8	; 216
	.db #0xac	; 172
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xe8	; 232
	.db #0xce	; 206
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0xed	; 237
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xe8	; 232
	.db #0x0a	; 10
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xd8	; 216
	.db #0x27	; 39
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xc8	; 200
	.db #0x42	; 66	'B'
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xb8	; 184
	.db #0x5b	; 91
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xa8	; 168
	.db #0x72	; 114	'r'
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0x98	; 152
	.db #0x89	; 137
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0x88	; 136
	.db #0x9e	; 158
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0x78	; 120	'x'
	.db #0xb2	; 178
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0xc4	; 196
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0xd6	; 214
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0xe7	; 231
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0xf7	; 247
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x06	; 6
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x07	; 7
_soundfx_2d:
	.db #0x22	; 34
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0xb5	; 181
	.db #0x84	; 132
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0x68	; 104	'h'
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x2c	; 44
	.db #0x80	; 128
	.db #0x6b	; 107	'k'
	.db #0x2a	; 42
	.db #0x28	; 40
	.db #0x80	; 128
	.db #0x22	; 34
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0xb5	; 181
	.db #0x84	; 132
	.db #0x6b	; 107	'k'
	.db #0x2a	; 42
	.db #0x68	; 104	'h'
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x2c	; 44
	.db #0x80	; 128
	.db #0x6b	; 107	'k'
	.db #0x2a	; 42
	.db #0x28	; 40
	.db #0x80	; 128
	.db #0x22	; 34
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0xb5	; 181
	.db #0x84	; 132
	.db #0x6b	; 107	'k'
	.db #0x2a	; 42
	.db #0x68	; 104	'h'
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x07	; 7
_soundfx_37:
	.db #0x02	; 2
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0x9b	; 155
	.db #0x83	; 131
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0xa8	; 168
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0x59	; 89	'Y'
	.db #0x80	; 128
	.db #0x23	; 35
	.db #0x82	; 130
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0x18	; 24
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xc8	; 200
	.db #0x6b	; 107	'k'
	.db #0x81	; 129
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0xf8	; 248
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0x98	; 152
	.db #0x9c	; 156
	.db #0x80	; 128
	.db #0x6b	; 107	'k'
	.db #0x2a	; 42
	.db #0xa8	; 168
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xdd	; 221
	.db #0x7b	; 123
	.db #0x2a	; 42
	.db #0x88	; 136
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x07	; 7
_soundfx_38:
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x77	; 119	'w'
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xc8	; 200
	.db #0x3b	; 59
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xd8	; 216
	.db #0x63	; 99	'c'
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xe8	; 232
	.db #0x89	; 137
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0xac	; 172
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x59	; 89	'Y'
	.db #0x80	; 128
	.db #0xce	; 206
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xe8	; 232
	.db #0xed	; 237
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xd8	; 216
	.db #0x0a	; 10
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xc8	; 200
	.db #0x27	; 39
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xb8	; 184
	.db #0x42	; 66	'B'
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xa8	; 168
	.db #0x5b	; 91
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0x98	; 152
	.db #0x72	; 114	'r'
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0x78	; 120	'x'
	.db #0x9e	; 158
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0x68	; 104	'h'
	.db #0xb2	; 178
	.db #0x86	; 134
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x07	; 7
	.area _INITIALIZER
	.area _CABS (ABS)
