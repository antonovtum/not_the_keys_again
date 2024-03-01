;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module window_maps
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _top_map_02_broken
	.globl _bot_map_02_broken
	.globl _top_map_04
	.globl _top_map_03
	.globl _top_map_02
	.globl _top_map_01
	.globl _top_map_00
	.globl _bot_map_05
	.globl _bot_map_04
	.globl _bot_map_03
	.globl _bot_map_02
	.globl _bot_map_01
	.globl _bot_map_00
	.globl _base
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
_base:
	.db #0x04	; 4
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1d	; 29
	.db #0x1a	; 26
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x07	; 7
_bot_map_00:
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_bot_map_01:
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_bot_map_02:
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0x2e	; 46
_bot_map_03:
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0x2e	; 46
_bot_map_04:
	.db #0x01	; 1
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_bot_map_05:
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_top_map_00:
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x13	; 19
_top_map_01:
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x10	; 16
_top_map_02:
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x19	; 25
_top_map_03:
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x1c	; 28
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
_top_map_04:
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
_bot_map_02_broken:
	.db #0x22	; 34
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x24	; 36
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0x2e	; 46
_top_map_02_broken:
	.db #0x17	; 23
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x19	; 25
	.area _INITIALIZER
	.area _CABS (ABS)
