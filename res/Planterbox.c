/*

 PLANTERBOX.C

 Tile Source File.

 Info:
  Form                 : All tiles as one unit.
  Format               : Gameboy 4 color.
  Compression          : None.
  Counter              : None.
  Tile size            : 8 x 8
  Tiles                : 0 to 0

  Palette colors       : None.
  SGB Palette          : None.
  CGB Palette          : None.

  Convert to metatiles : No.

 This file was generated by GBTD v2.2

*/

#include <gb/gb.h>
#include <gb/metasprites.h>

/* Start of tile array. */
const unsigned char planter_box[] =
{
  0x7F,0x7F,0x4F,0x70,0x60,0x7F,0x4F,0x70,
  0x4F,0x70,0x20,0x3F,0x00,0x00,0x00,0x00,
  0xFF,0xFF,0xFF,0x01,0x07,0xFF,0xFE,0x02,
  0xFE,0x02,0x0C,0xFC,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x00,
  0x25,0x02,0x52,0x20,0x22,0x02,0x22,0x22,
  0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x00,
  0x16,0x08,0x29,0x06,0x5A,0x28,0x2A,0x0A
};

const metasprite_t planter[] = {
  METASPR_ITEM(0,0,0x82,0), METASPR_ITEM(0,8,0x83,0), METASPR_TERM
};

/* End of PLANTERBOX.C */
