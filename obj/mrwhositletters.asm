;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module mrwhositletters
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mrwhosit_sprite
	.globl _mrwhosit
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
_mrwhosit:
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x71	; 113	'q'
	.db #0x51	; 81	'Q'
	.db #0x71	; 113	'q'
	.db #0x51	; 81	'Q'
	.db #0x7f	; 127
	.db #0x4f	; 79	'O'
	.db #0x3f	; 63
	.db #0x2c	; 44
	.db #0x1f	; 31
	.db #0x14	; 20
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0xfd	; 253
	.db #0xad	; 173
	.db #0xff	; 255
	.db #0xa3	; 163
	.db #0xff	; 255
	.db #0xad	; 173
	.db #0xff	; 255
	.db #0x2d	; 45
	.db #0xff	; 255
	.db #0xad	; 173
	.db #0xf6	; 246
	.db #0xf6	; 246
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x98	; 152
	.db #0xff	; 255
	.db #0x6b	; 107	'k'
	.db #0xff	; 255
	.db #0x6c	; 108	'l'
	.db #0xff	; 255
	.db #0x6e	; 110	'n'
	.db #0xff	; 255
	.db #0x98	; 152
	.db #0x6f	; 111	'o'
	.db #0x6f	; 111	'o'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0xfe	; 254
	.db #0xf2	; 242
	.db #0xff	; 255
	.db #0xd9	; 217
	.db #0xff	; 255
	.db #0xdb	; 219
	.db #0xfe	; 254
	.db #0xda	; 218
	.db #0xfe	; 254
	.db #0xca	; 202
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xb8	; 184
	.db #0xff	; 255
	.db #0x9a	; 154
	.db #0xff	; 255
	.db #0xba	; 186
	.db #0xff	; 255
	.db #0xb8	; 184
	.db #0x67	; 103	'g'
	.db #0x67	; 103	'g'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0xa8	; 168
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xf6	; 246
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0x89	; 137
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0x7f	; 127
	.db #0x5d	; 93
	.db #0x7f	; 127
	.db #0x5d	; 93
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xf0	; 240
	.db #0x50	; 80	'P'
	.db #0xf8	; 248
	.db #0x38	; 56	'8'
	.db #0xfa	; 250
	.db #0xaa	; 170
	.db #0xf7	; 247
	.db #0xf5	; 245
	.db #0x07	; 7
	.db #0x05	; 5
_mrwhosit_sprite:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0xa4	; 164
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0xa5	; 165
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0xa6	; 166
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0xa7	; 167
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0xf3	; -13
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0xa1	; 161
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0xa2	; 162
	.db #0x00	; 0
	.db #0xfe	; -2
	.db #0x08	;  8
	.db #0xa3	; 163
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
