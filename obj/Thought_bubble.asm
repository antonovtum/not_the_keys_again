;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module Thought_bubble
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _button_2
	.globl _button_1
	.globl _bubble_qmark
	.globl _bubble_empty
	.globl _bubble_key
	.globl _thought_bubble
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
_thought_bubble:
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xb9	; 185
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xf6	; 246
	.db #0xd9	; 217
	.db #0xfd	; 253
	.db #0xdb	; 219
	.db #0xcf	; 207
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0xa2	; 162
	.db #0xff	; 255
	.db #0x9c	; 156
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x7c	; 124
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x19	; 25
	.db #0xff	; 255
	.db #0x65	; 101	'e'
	.db #0xef	; 239
	.db #0x9d	; 157
	.db #0xaf	; 175
	.db #0x77	; 119	'w'
	.db #0xf7	; 247
	.db #0xcb	; 203
	.db #0xff	; 255
	.db #0x2d	; 45
	.db #0xff	; 255
	.db #0x31	; 49	'1'
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x3e	; 62
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x7c	; 124
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x3e	; 62
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0xff	; 255
	.db #0x89	; 137
	.db #0xff	; 255
	.db #0x8a	; 138
	.db #0xff	; 255
	.db #0x86	; 134
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x82	; 130
	.db #0xff	; 255
	.db #0x82	; 130
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x82	; 130
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x7c	; 124
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x91	; 145
	.db #0xff	; 255
	.db #0x51	; 81	'Q'
	.db #0xff	; 255
	.db #0xd1	; 209
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0xff	; 255
	.db #0x61	; 97	'a'
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x41	; 65	'A'
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x3e	; 62
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x7c	; 124
	.db #0x43	; 67	'C'
	.db #0x7b	; 123
	.db #0x44	; 68	'D'
	.db #0xf3	; 243
	.db #0x8c	; 140
	.db #0xf3	; 243
	.db #0x8c	; 140
	.db #0xf0	; 240
	.db #0x8f	; 143
	.db #0xf3	; 243
	.db #0x8c	; 140
	.db #0xf3	; 243
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xcc	; 204
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x27	; 39
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x7c	; 124
	.db #0x84	; 132
	.db #0xba	; 186
	.db #0x46	; 70	'F'
	.db #0x9d	; 157
	.db #0x63	; 99	'c'
	.db #0x9d	; 157
	.db #0x63	; 99	'c'
	.db #0x1d	; 29
	.db #0xe3	; 227
	.db #0x9d	; 157
	.db #0x63	; 99	'c'
	.db #0x9d	; 157
	.db #0x63	; 99	'c'
	.db #0x99	; 153
	.db #0x67	; 103	'g'
	.db #0xfa	; 250
	.db #0x06	; 6
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xc4	; 196
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x3e	; 62
	.db #0x21	; 33
	.db #0x3d	; 61
	.db #0x22	; 34
	.db #0x79	; 121	'y'
	.db #0x46	; 70	'F'
	.db #0x79	; 121	'y'
	.db #0x46	; 70	'F'
	.db #0x78	; 120	'x'
	.db #0x47	; 71	'G'
	.db #0x79	; 121	'y'
	.db #0x46	; 70	'F'
	.db #0x79	; 121	'y'
	.db #0x46	; 70	'F'
	.db #0x39	; 57	'9'
	.db #0x26	; 38
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0x3e	; 62
	.db #0xc2	; 194
	.db #0xde	; 222
	.db #0x22	; 34
	.db #0xcf	; 207
	.db #0x31	; 49	'1'
	.db #0xcf	; 207
	.db #0x31	; 49	'1'
	.db #0x0f	; 15
	.db #0xf1	; 241
	.db #0xcf	; 207
	.db #0x31	; 49	'1'
	.db #0xcf	; 207
	.db #0x31	; 49	'1'
	.db #0xce	; 206
	.db #0x32	; 50	'2'
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0xe0	; 224
_bubble_key:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x2f	; 47
	.db #0x10	; 16
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x31	; 49	'1'
	.db #0x10	; 16
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x32	; 50	'2'
	.db #0x10	; 16
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_bubble_empty:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x33	; 51	'3'
	.db #0x10	; 16
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x34	; 52	'4'
	.db #0x10	; 16
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x35	; 53	'5'
	.db #0x10	; 16
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x36	; 54	'6'
	.db #0x10	; 16
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_bubble_qmark:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x37	; 55	'7'
	.db #0x10	; 16
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x39	; 57	'9'
	.db #0x10	; 16
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x3a	; 58
	.db #0x10	; 16
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_button_1:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_button_2:
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0xf8	; -8
	.db #0x08	;  8
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
