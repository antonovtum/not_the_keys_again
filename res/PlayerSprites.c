/*

 PLAYERSPRITES.C

 Tile Source File.

 Info:
  Form                 : All tiles as one unit.
  Format               : Gameboy 4 color.
  Compression          : None.
  Counter              : None.
  Tile size            : 8 x 8
  Tiles                : 0 to 11

  Palette colors       : None.
  SGB Palette          : None.
  CGB Palette          : None.

  Convert to metatiles : No.

 This file was generated by GBTD v2.2

*/

#include <gb/gb.h>
#include <gb/metasprites.h>
#include <stdint.h>

/* Start of tile array. */
const uint8_t playerSprites[] =
{
  0x00,0x00,0x01,0x01,0x07,0x07,0x0F,0x0F,
  0x06,0x0F,0x07,0x0E,0x0F,0x0C,0x07,0x07,
  0x03,0x0F,0x01,0x1F,0x18,0x07,0x3C,0x03,
  0x3B,0x07,0x18,0x0F,0x00,0x0F,0x0C,0x0E,
  0x00,0x00,0xC0,0xC0,0xE0,0xE0,0xF0,0xF0,
  0x10,0xF0,0xF0,0x00,0xF0,0xD0,0x30,0xF0,
  0xE0,0xF0,0xC0,0xF0,0x90,0x60,0x18,0xE0,
  0xE8,0x30,0x68,0xF0,0x70,0x70,0x70,0x70,
  0x00,0x00,0x00,0x00,0x01,0x01,0x07,0x07,
  0x0F,0x0F,0x06,0x0F,0x07,0x0E,0x0F,0x0C,
  0x07,0x0F,0x03,0x1F,0x19,0x07,0x3C,0x03,
  0x1C,0x03,0x03,0x0F,0x04,0x07,0x06,0x07,
  0x00,0x00,0x00,0x00,0xC0,0xC0,0xE0,0xE0,
  0xF0,0xF0,0x10,0xF0,0xF0,0x00,0xF0,0xD0,
  0x30,0xF0,0xE0,0xF0,0xC8,0xF0,0x98,0x60,
  0x18,0xE0,0xE0,0x20,0x60,0xE0,0xC0,0xC0,
  0x03,0x0F,0x01,0x1F,0x30,0x0F,0x3C,0x03,
  0x1B,0x07,0x02,0x07,0x07,0x07,0x06,0x06,
  0xE0,0xF0,0xCC,0xF0,0x8C,0x70,0x78,0xE0,
  0x80,0xF0,0x10,0xF0,0x30,0x70,0x00,0x00,
  0x03,0x07,0x01,0x0F,0x06,0x09,0x0F,0x00,
  0x07,0x01,0x08,0x07,0x00,0x0F,0x06,0x06,
  0xE0,0xE0,0xC0,0xE0,0x90,0x60,0x00,0xE0,
  0xF0,0x30,0x78,0xF8,0x38,0x78,0x00,0x00,
  0x03,0x07,0x01,0x0F,0x00,0x1F,0x18,0x07,
  0x3C,0x03,0x3B,0x07,0x18,0x0F,0x00,0x0F,
  0xE0,0xE0,0xC0,0xF0,0x80,0x70,0x10,0xE0,
  0x18,0xE0,0xE8,0x30,0x68,0xF0,0x70,0x70,
  0x63,0x1F,0x61,0x1F,0x30,0x0F,0x01,0x07,
  0x0C,0x0F,0x1E,0x1F,0x1E,0x1E,0x00,0x00,
  0xE4,0xF8,0xCE,0xF0,0x8C,0x70,0xA0,0xE0,
  0x08,0xF8,0x18,0xF8,0x00,0x00,0x00,0x00,
  0x03,0x0D,0x07,0x18,0x07,0x08,0x03,0x07,
  0x00,0x0F,0x11,0x1F,0x18,0x1E,0x00,0x00,
  0xE8,0xF0,0xD8,0xE0,0x10,0xE0,0xF0,0x30,
  0xFC,0xFC,0xFC,0xFC,0x18,0x18,0x00,0x00,
  0x00,0x00,0x03,0x03,0x06,0x07,0x0F,0x0E,
  0x07,0x0C,0x07,0x0D,0x0F,0x0F,0x03,0x0F,
  0x00,0x1F,0x18,0x07,0x3D,0x03,0x3E,0x07,
  0x08,0x0F,0x04,0x07,0x04,0x06,0x00,0x00,
  0x00,0x00,0xE0,0xE0,0x10,0xF0,0xE0,0x10,
  0xE0,0xD0,0x20,0xF0,0xF0,0xF0,0xE0,0xF0,
  0x80,0x70,0x10,0xE0,0xF8,0x20,0x38,0xE0,
  0x60,0xE0,0xE0,0xE0,0xC0,0xC0,0x00,0x00,
  0x63,0x1F,0x61,0x1F,0x30,0x0F,0x0B,0x07,
  0x04,0x07,0x00,0x07,0x00,0x07,0x03,0x07,
  0xE4,0xF8,0xCE,0xF0,0x8C,0x70,0xE0,0x20,
  0x20,0xE0,0x60,0xF0,0xF0,0xF0,0x30,0x70
};

//top left -> bot left -> top right -> bot right
//IDLE ------------------------------------------
const metasprite_t idle0[] = {
  {0, -8, 0}, {8, 0, 1}, {-8, 8, 2}, {8, 0, 3}, {metasprite_end}
};
const metasprite_t idle1[] = {
  {1, -8, 0}, {7, 0, 1}, {-7, 8, 2}, {7, 0, 3}, {metasprite_end}
};
const metasprite_t idle2[] = {
  {1, -8, 0}, {7, 0, 12}, {-7, 8, 2}, {7, 0, 13}, {metasprite_end}
};
const metasprite_t idle3[] = {
  {0, -8, 0}, {8, 0, 12}, {-8, 8, 2}, {8, 0, 13}, {metasprite_end}
};

const metasprite_t* const idle_metasprites[] = {
  idle0, idle1, idle2, idle3
};
const uint8_t idle_speed[] = {
  30, 5, 5, 5
};
//IDLE ------------------------------------------

//RUNNING ---------------------------------------
const metasprite_t run0[] = {
  {0, -8, 4}, {8, 0, 5}, {-8, 8, 6}, {8, 0, 7}, {metasprite_end}
};
const metasprite_t run1[] = {
  {0, -8, 0}, {8, 0, 8}, {-8, 8, 2}, {8, 0, 9}, {metasprite_end}
};
const metasprite_t run2[] = {
  {0, -8, 0}, {8, 0, 14}, {-8, 8, 2}, {8, 0, 15}, {metasprite_end}
};
const metasprite_t run3[] = {
  {0, -8, 4}, {8, 0, 5}, {-8, 8, 6}, {8, 0, 7}, {metasprite_end}
};
const metasprite_t run4[] = {
  {0, -8, 0}, {8, 0, 10}, {-8, 8, 2}, {8, 0, 11}, {metasprite_end}
};
const metasprite_t run5[] = {
  {0, -8, 0}, {8, 0, 16}, {-8, 8, 2}, {8, 0, 17}, {metasprite_end}
};

const metasprite_t* const run_metasprites[] = {
  run0, run1, run2, run3, run4, run5
};
const uint8_t run_speed[] = {
  5, 2, 7, 5, 2, 7
};
//RUNNING ---------------------------------------

//JUMPING ---------------------------------------
const metasprite_t jump0[] = {
  {0, -8, 18}, {8, 0, 19}, {-8, 8, 20}, {8, 0, 21}, {metasprite_end}
};

const metasprite_t* const jump_metasprites[] = {
  jump0
};
const uint8_t jump_speed[] = {
  100
};
//JUMPING ---------------------------------------

//FALLING ---------------------------------------
const metasprite_t fall0[] = {
  {0, -8, 0}, {8, 0, 22}, {-8, 8, 2}, {8, 0, 23}, {metasprite_end}
};

const metasprite_t* const fall_metasprites[] = {
  fall0
};
const uint8_t fall_speed[] = {
  100
};
//FALLING ---------------------------------------

//HURTING ---------------------------------------
const metasprite_t hurt0[] = {
  {1, -8, 0}, {7, 0, 22}, {-7, 8, 2}, {7, 0, 23}, {metasprite_end}
};

const metasprite_t* const hurt_metasprites[] = {
  fall0
};
const uint8_t hurt_speed[] = {
  100
};
//HURTING ---------------------------------------

const metasprite_t** const metasprites_states[] = {
  idle_metasprites, run_metasprites, jump_metasprites, fall_metasprites, hurt_metasprites
};
const uint8_t* const metasprites_speeds[] = {
  idle_speed, run_speed, jump_speed, fall_speed, hurt_speed
};
const uint8_t frames_in_state[] = {
  4, 6, 1, 1, 1
};
/* End of PLAYERSPRITES.C */