/*

 THOUGHT_BUBBLE.C

 Tile Source File.

 Info:
  Form                 : All tiles as one unit.
  Format               : Gameboy 4 color.
  Compression          : None.
  Counter              : None.
  Tile size            : 8 x 8
  Tiles                : 16 to 31

  Palette colors       : None.
  SGB Palette          : None.
  CGB Palette          : None.

  Convert to metatiles : No.

 This file was generated by GBTD v2.2

*/
#include <gb/gb.h>
#include <gb/metasprites.h>
/* Start of tile array. */
const unsigned char thought_bubble[] =
{
  0x7F,0x7F,0xFF,0x80,0xFF,0x80,0xFF,0x80,
  0xFF,0xB9,0xFF,0xC6,0xF6,0xD9,0xFD,0xDB,
  0xCF,0xFA,0xFF,0xA2,0xFF,0x9C,0xFF,0x80,
  0x7F,0x7C,0x03,0x02,0x01,0x01,0x00,0x00,
  0xFE,0xFE,0xFF,0x01,0xFF,0x19,0xFF,0x65,
  0xEF,0x9D,0xAF,0x77,0xF7,0xCB,0xFF,0x2D,
  0xFF,0x31,0xFF,0x01,0xFF,0x01,0xFF,0x01,
  0xFE,0x3E,0xC0,0x40,0x80,0x80,0x00,0x00,
  0x7F,0x7F,0xFF,0x80,0xFF,0x80,0xFF,0x80,
  0xFF,0x80,0xFF,0x80,0xFF,0x80,0xFF,0x80,
  0xFF,0x80,0xFF,0x80,0xFF,0x80,0xFF,0x80,
  0x7F,0x7C,0x03,0x02,0x01,0x01,0x00,0x00,
  0xFE,0xFE,0xFF,0x01,0xFF,0x01,0xFF,0x01,
  0xFF,0x01,0xFF,0x01,0xFF,0x01,0xFF,0x01,
  0xFF,0x01,0xFF,0x01,0xFF,0x01,0xFF,0x01,
  0xFE,0x3E,0xC0,0x40,0x80,0x80,0x00,0x00,
  0x7F,0x7F,0xFF,0x83,0xFF,0x84,0xFF,0x89,
  0xFF,0x8A,0xFF,0x86,0xFF,0x81,0xFF,0x82,
  0xFF,0x82,0xFF,0x81,0xFF,0x82,0xFF,0x81,
  0x7F,0x7C,0x03,0x02,0x01,0x01,0x00,0x00,
  0xFE,0xFE,0xFF,0xC1,0xFF,0x21,0xFF,0x91,
  0xFF,0x51,0xFF,0xD1,0xFF,0x11,0xFF,0x61,
  0xFF,0x81,0xFF,0x81,0xFF,0x41,0xFF,0x81,
  0xFE,0x3E,0xC0,0x40,0x80,0x80,0x00,0x00,
  0x00,0x00,0x00,0x00,0x18,0x18,0x3C,0x24,
  0x3C,0x24,0x18,0x18,0x00,0x00,0x00,0x00,
  0x00,0x00,0x3C,0x3C,0x7E,0x42,0x7E,0x42,
  0x7E,0x42,0x7E,0x42,0x3C,0x3C,0x00,0x00,
  0x7E,0x7E,0xFF,0x81,0xFF,0x81,0xFF,0x81,
  0xFF,0x81,0xFF,0x81,0x7E,0x66,0x18,0x18,
  0x07,0x07,0x1F,0x18,0x3F,0x20,0x7C,0x43,
  0x7B,0x44,0xF3,0x8C,0xF3,0x8C,0xF0,0x8F,
  0xF3,0x8C,0xF3,0x8C,0xB3,0xCC,0x7F,0x40,
  0x5F,0x60,0x27,0x38,0x18,0x1F,0x07,0x07,
  0xC0,0xC0,0xF0,0x30,0xF8,0x08,0x7C,0x84,
  0xBA,0x46,0x9D,0x63,0x9D,0x63,0x1D,0xE3,
  0x9D,0x63,0x9D,0x63,0x99,0x67,0xFA,0x06,
  0xF2,0x0E,0xC4,0x3C,0x18,0xF8,0xE0,0xE0,
  0x00,0x00,0x03,0x03,0x0F,0x0C,0x1F,0x10,
  0x3E,0x21,0x3D,0x22,0x79,0x46,0x79,0x46,
  0x78,0x47,0x79,0x46,0x79,0x46,0x39,0x26,
  0x3F,0x20,0x1F,0x10,0x0F,0x0C,0x03,0x03,
  0x00,0x00,0xE0,0xE0,0xF8,0x18,0xFC,0x04,
  0x3E,0xC2,0xDE,0x22,0xCF,0x31,0xCF,0x31,
  0x0F,0xF1,0xCF,0x31,0xCF,0x31,0xCE,0x32,
  0xFE,0x02,0xFC,0x04,0xF8,0x18,0xE0,0xE0
};

/* End of THOUGHT_BUBBLE.C */
const metasprite_t bubble_key[] = {
  METASPR_ITEM(0,-8,47,0b00010000), METASPR_ITEM(8,0,48,0b00010000), METASPR_ITEM(-8,8,49,0b00010000), METASPR_ITEM(8,0,50,0b00010000), METASPR_TERM
};
const metasprite_t bubble_empty[] = {
  METASPR_ITEM(0,-8,51,0b00010000), METASPR_ITEM(8,0,52,0b00010000), METASPR_ITEM(-8,8,53,0b00010000), METASPR_ITEM(8,0,54,0b00010000), METASPR_TERM
};
const metasprite_t bubble_qmark[] = {
  METASPR_ITEM(0,-8,55,0b00010000), METASPR_ITEM(8,0,56,0b00010000), METASPR_ITEM(-8,8,57,0b00010000), METASPR_ITEM(8,0,58,0b00010000), METASPR_TERM
};

// BUTTONS
const metasprite_t button_1[] = {
  METASPR_ITEM(0,-8,62,0), METASPR_ITEM(8,0,63,0), METASPR_ITEM(-8,8,64,0), METASPR_ITEM(8,0,65,0), METASPR_TERM
};
const metasprite_t button_2[] = {
  METASPR_ITEM(0,-8,66,0), METASPR_ITEM(8,0,67,0), METASPR_ITEM(-8,8,68,0), METASPR_ITEM(8,0,69,0), METASPR_TERM
};