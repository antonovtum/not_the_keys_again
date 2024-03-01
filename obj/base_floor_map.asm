;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module base_floor_map
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _base_floor_map
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
_base_floor_map:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x1d	; 29
	.db #0x1a	; 26
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1d	; 29
	.db #0x1a	; 26
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1d	; 29
	.db #0x1a	; 26
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1d	; 29
	.db #0x1a	; 26
	.db #0x07	; 7
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x07	; 7
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
