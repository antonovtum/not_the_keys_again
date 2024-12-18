#include <stdint.h>
#include "window_maps.h"

const unsigned char base[12] = {
    0x04, 0x1A, 0x1B, 0x07,
    0x04, 0x1D, 0x1A, 0x07,
    0x04, 0x1B, 0x1D, 0x07
};

const unsigned char bot_map_00[8] = {
    0x25, 0x26, 0x26, 0x27,
    0x00, 0x00, 0x00, 0x00
};
const unsigned char bot_map_01[8] = {
    0x28, 0x29, 0x29, 0x2A,
    0x00, 0x00, 0x00, 0x00
};
const unsigned char bot_map_02[8] = {
    0x22, 0x23, 0x23, 0x24,
    0x2B, 0x2C, 0x2C, 0x2E
};
const unsigned char bot_map_03[12] = {
    0x1E, 0x1F, 0x1F, 0x21,
    0x22, 0x23, 0x23, 0x24,
    0x2B, 0x2C, 0x2C, 0x2E
};
// UNUSED FOR NOW
const unsigned char bot_map_04[8] = {
    0x25, 0x82, 0x82, 0x27,
    0x00, 0x00, 0x00, 0x00
};
const unsigned char bot_map_05[8] = {
    0x33, 0x34, 0x34, 0x35,
    0x00, 0x00, 0x00, 0x00
};

const unsigned char top_map_00[4] = {
    0x11, 0x12, 0x12, 0x13
};
const unsigned char top_map_01[4] = {
    0x0E, 0x0F, 0x0F, 0x10
};
const unsigned char top_map_02[4] = {
    0x17, 0x18, 0x18, 0x19
};
const unsigned char top_map_03[8] = {
    0x14, 0x15, 0x15, 0x16,
    0x1C, 0x1A, 0x1B, 0x1C
};
const unsigned char top_map_04[4] = {
    0x2F, 0x30, 0x30, 0x31
};


//--------- VARIANTS ---------
const unsigned char bot_map_02_broken[8] = {
    0x22, 0x7E, 0x7E, 0x24,
    0x2B, 0x2C, 0x2C, 0x2E
};
const unsigned char top_map_02_broken[4] = {
    0x17, 0x7D, 0x7D, 0x19
};