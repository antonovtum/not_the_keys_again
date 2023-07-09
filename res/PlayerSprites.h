/*

 PLAYERSPRITES.H

 Include File.

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


/* Bank of tiles. */
#define PlayerSpritesBank 0
/* Start of tile array. */
extern const uint8_t playerSprites[];

extern const metasprite_t* const idle_metasprites[];
extern const uint8_t idle_speed[];

extern const metasprite_t* const run_metasprites[];
extern const uint8_t run_speed[];

extern const metasprite_t* const jump_metasprites[];
extern const uint8_t jump_speed[];

extern const metasprite_t* const fall_metasprites[];
extern const uint8_t fall_speed[];

extern const metasprite_t** const metasprites_states[];
extern const uint8_t* const metasprites_speeds[];
extern const uint8_t frames_in_state[];
/* End of PLAYERSPRITES.H */
